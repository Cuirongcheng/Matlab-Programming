function B=LightAndMean(X)
[m,n]=size(X);
vHist=imhist(X);
p=vHist(find(vHist>0))/(m*n);   %求每一不为零的灰度值的概率
c1=sum((find(vHist>0))./p);     %求不为零的灰度值概率倒数的加权累加和
c2=sum(ones(size(p))./p);       %求不为零的灰度值概率倒数的累加和
th=c1/c2;                       %求出灰度值的加权平均值,即为待求阈值
segImg=(X>th);
% figure
% imshow(segImg);
% figure
% imshow(X)
X1 = X;
for i = 1 : m
    for j = 1 : n
        if segImg(i,j)==0
            X1(i,j)=X1(i,j);
        else
            X1(i,j)=0;
        end
    end
end
t1 = mean(X1);
% figure 
% imshow(X1)
X2 = im2double(X) - im2double(X1);
t2 = mean(X2);
H = (t1-t2)/t1;
% figure 
% imshow(X2)
[m1 n1] = size(X1);
t = 1;
snum = 0; pnum = 0;
for i = 1 : m1
    for j = 1 : n1
        if X1(i,j)>0
            if  X1(i,j)>=t
                t = X1(i,j);
            end
            snum =  snum +1;
        end
    end
end
for i = 1 : m1
    for j = 1 : n1
        if X1(i,j)>0
            if  X1(i,j)>0.1*t
                pnum = pnum +1;
            end
        end
    end
end
H2 = pnum/snum ;
B = [H H2];
a =1;