%分割小麦和杂草

RGB = imread('2.jpg');  imshow(RGB)
    %RGB1=rgb2hsv(RGB); %颜色空间转化
    r=RGB(:,:,1);r=double(r);
    g=RGB(:,:,2);g=double(g);
    b=RGB(:,:,3);b=double(b);
 %各颜色分量显示  
RGB1=rgb2hsv(RGB)
 s=RGB1(:,:,1);%s，
 h=RGB1(:,:,2);%h， 
 v=RGB1(:,:,3)
blood=double(h)+double(s); figure,imshow(blood);%(颜色特征)
[x,y]=size(blood);                % 求出图象大小
b=double(blood);                  
%N =sqrt(100) * randn(x,y);        %  生成方差为10的白噪声
I=b;%+N; figure ,imshow(I)                        %  噪声干扰图象

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

bw=1-Seg;   
figure,imshow(bw);

%bw=medfilt2(bw);bw=medfilt2(bw); filter3=medfilt2(filter2); filter4=medfilt2(filter3); filter5=medfilt2(filter4);
%threshold=graythresh(blood);%使用阈值操作将图像转化成二值图像，graythresh函数的得到图像的全局阈值再使用im2bw将灰度图转化为二值图像
%bw=im2bw(blood,threshold);
figure,imshow(~bw);

bw1=edge(bw,'canny');figure,imshow(bw1);%
se0=strel('rectangle',[5 1]); %选定模板se0＝[1 1 1 1 1]
bw1=imdilate(bw1,se0);figure,imshow(bw1)
%se90=strel('rectangle',[1 5]); 
%bw1=imdilate(bw1,se90);figure,imshow(bw1);
 %采用模板se0(水平方向) se90（垂直方向）对图像膨胀运算  'imdilate'膨胀
 bw2=bwfill(bw1),figure,imshow(bw2);

se0=strel('square',2); 
j=imerode(bw,se0);figure,imshow(j);
m=1;
while(m<=5)
    j=imerode(j,se0);
    m=m+1;
end
%j=medfilt2(j);%j=medfilt2(j);%j=medfilt2(j); 
 figure,imshow(j) ;     
se90=strel('square',3); 
j1=imdilate(j,se90);figure,imshow(j1);
n=1
while(n<=5)
    j1=imdilate(j1,se90);
    n=n+1;
end
 figure,imshow(j1)  ;
 j2=bw2 -j1;
 figure ,imshow(j2);
 
 
   j3=bwfill(j2);figure,imshow(j3);
   se0=strel('rectangle',[3 1]); 
   
  s1=edge(j1,'sobel');figure,imshow(s1);%
t1=bwarea(j1);t2=bwarea(s1);t=t1+(1/2)*t2;
p=t/bwarea(bw);T=bwarea(bw);p1=t/(256*256);p2=t1/(T-t1);

   
   
   filter1=medfilt2(j3);filter2=medfilt2(filter1); filter3=medfilt2(filter2);
   filter4=medfilt2(filter3); filter5=medfilt2(filter4);
%经过5次中值滤波，颗粒噪声有效的去除。
   %figure ,subplot(121),imshow(filter1);subplot(122),imshow(~filter1);
   %figure,subplot(121),imshow(filter2);subplot(122),imshow(~filter2);
   %figure,imshow(~filter3);%figure,imshow(~filter4);
   figure,%subplot(121),
   imshow(filter5);%subplot(122),imshow(~filter5);



    filter1=medfilt2(SI);
    filter2=medfilt2(filter1);
    filter3=medfilt2(filter2);
    filter4=medfilt2(filter3);
    filter5=medfilt2(filter4);
    %经过5次中值滤波，颗粒噪声有效的去除。
    figure ,imshow(~filter1);
    figure,imshow(~filter2);
    %figure,imshow(~filter3);
    %figure,imshow(~filter4);
    figure,imshow(~filter5);
