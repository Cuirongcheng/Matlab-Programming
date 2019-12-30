cao=imread('caog.bmp');  
figure,imshow(cao);%读入图像
r=cao(:,:,1);figure,imshow(r);
g=cao(:,:,2);%figure,imshow(g);
b=cao(:,:,3);%figure,imshow(b);

caoj=imnoise(cao,'gaussian',0,0.02);figure,imshow(caoj);%加高斯噪声，4邻域、8邻域平均滤波
caoj=rgb2gray(caoj);figure, imshow(caoj) ;
m4=[0 1 0;1 0 1;0 1 0];m4=m4/4;
cao_filter1=filter2(m4,caoj);figure,imshow(cao_filter1);
m8=[1 1 1;1 0 1;1 1 1];m8=m8/8;
cao_filter2=filter2(m8,caoj);figure,imshow(cao_filter2);


I=(2*g-r-b);figure;imshow(I);
[x,y]=size(caoj);                % 求出图象大小
b=double(caoj);                  

for i=1:x                         % 实际图象的灰度为0～255
    for j=1:y
        if (I(i,j)>255)
            I(i,j)=255;
        end
        if (I(i,j)<0)
            I(i,j)=0;
        end
    end
end    


z0=max(max(I));                   % 求出图象中最大的灰度
z1=min(min(I));                   % 最小的灰度 

T=(z0+z1)/2;                      
TT=0;
S0=0; n0=0;
S1=0; n1=0;
allow=0.5;                       % 新旧阈值的允许接近程度
d=abs(T-TT);
count=0;                         % 记录几次循环

while(d>=allow)                 % 迭代最佳阈值分割算法
    count=count+1;
    for i=1:x
        for j=1:y
            if (I(i,j)>=T)
                S0=S0+I(i,j);
                n0=n0+1;
            end
            if (I(i,j)<T)
                S1=S1+I(i,j);
                n1=n1+1;
            end
        end
    end 
    T0=S0/n0;
    T1=S1/n1;
    TT=(T0+T1)/2;
    d=abs(T-TT);
    T=TT;
end

Seg=zeros(x,y);
for i=1:x
    for j=1:y
        if(I(i,j)>=T)
            Seg(i,j)=1;               % 阈值分割的图象
        end
    end
end

SI=1-Seg;figure,imshow(SI);

 
 
 
 