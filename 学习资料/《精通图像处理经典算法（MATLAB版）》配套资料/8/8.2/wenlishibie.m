%距离判别法，文理识别
% 输入图像
close all;
clear;clc
[filename,filepath]=uigetfile('*.jpg','输入一个图像');
jpg=strcat(filepath,filename);
a=imread(jpg);
%figure,imshow(a),title('原始图像')
%颜色空间转化
HSI=rgb2hsv(a); %hsi是HSI颜色空间彩色图像
%figure,imshow(HSI),title('HSI彩色图像')
HSIG=rgb2gray(HSI); % hsig:灰度图像
%figure,imshow(HSIG),title('灰度图像')
% imwrite(b,'杂草灰度图像.jpg');

%计算64位灰度共生矩阵
 glcms1=graycomatrix(HSIG,'numlevels',64,'offset',[0 1;-1 1;-1 0; -1 -1]);
 %纹理特征统计值（对比度、相关性、熵、平稳度、二阶矩也叫能量）
 stats=graycoprops(glcms1,{'contrast','correlation','energy','homogeneity'});
 ga1=glcms1(:,:,1);%0度
 ga2=glcms1(:,:,2);%45
 ga3=glcms1(:,:,3);%90
 ga4=glcms1(:,:,4);%135
 energya1=0; energya2=0; energya3=0; energya4=0;
for i=1:64
  for  j=1:64
        energya1=energya1+sum(ga1(i,j)^2);
         energya2=energya2+sum(ga2(i,j)^2);
          energya3=energya3+sum(ga3(i,j)^2);
           energya4=energya4+sum(ga4(i,j)^2);
         j=j+1;
  end
i=i+1;
end
s1=0;s2=0;s3=0;s4=0;s5=0;
for m=1:4
    s1=stats.Contrast(1,m)+s1;
    m=m+1;
end
for m=1:4
    s2=stats.Correlation(1,m)+s2;
    m=m+1;
end
for m=1:4
    s3=stats.Energy(1,m)+s3;
    m=m+1;
end
for m=1:4
    s4=stats.Homogeneity(1,m)+s4;
    m=m+1;
end
s5=0.000001*(energya1+energya2+energya3+energya4);
temp0=[s1 s2 s3 s4 s5]
plot(temp0,'b.');

%x=[1:1:190];y1=s1;y2=s2;y3=s3;y4=s4;
%plot(x,y1,'y',x,y2,'c',x,y3,'b',x,y4,'r')%加坐标绘图表示纹理特征值


%输入a
temp1=[0 0 0 0 0];
for k=1:4
    jpg=strcat('a',num2str(k),'.jpg');
    RGB=imread(jpg);%temp1=im2bw(temp1);temp1=temp1(:);
    R=RGB(:,:,1);G=RGB(:,:,2);B=RGB(:,:,3);
    HSI=rgb2hsv(RGB);
    HSIG=rgb2gray(HSI);%figure,imshow(HSIG)
   %计算S分量的共生矩阵
   glcms1=graycomatrix(HSIG,'numlevels',64,'offset',[0 1;-1 1;-1 0; -1 -1]);
   %纹理特征统计值（对比度、相关性、熵、平稳度、二阶矩也叫能量）
  stats=graycoprops(glcms1,{'contrast','correlation','energy','homogeneity'});
 ga1=glcms1(:,:,1);%0度
 ga2=glcms1(:,:,2);%45
 ga3=glcms1(:,:,3);%90
 ga4=glcms1(:,:,4);%135
 energya1=0; energya2=0; energya3=0; energya4=0;
for i=1:64
  for  j=1:64
        energya1=energya1+sum(ga1(i,j)^2);
         energya2=energya2+sum(ga2(i,j)^2);
          energya3=energya3+sum(ga3(i,j)^2);
           energya4=energya4+sum(ga4(i,j)^2);
         j=j+1; 
  end
i=i+1;
end
s1=0;s2=0;s3=0;s4=0;s5=0;
for m=1:4
    s1=stats.Contrast(1,m)+s1;
    m=m+1;
end
for m=1:4
    s2=stats.Correlation(1,m)+s2;
    m=m+1;
end
for m=1:4
    s3=stats.Energy(1,m)+s3;
    m=m+1;
end
for m=1:4
    s4=stats.Homogeneity(1,m)+s4;
    m=m+1;
end
s5=0.000001*(energya1+energya2+energya3+energya4);
temp=[s1 s2 s3 s4 s5];
temp1=temp1+temp;
end
temp1=1/4*(temp1)

%输入b
temp2=[0 0 0 0 0];
for k=1:4
    jpg=strcat('b',num2str(k),'.jpg');
    RGB=imread(jpg);%temp1=im2bw(temp1);temp1=temp1(:);
    R=RGB(:,:,1);G=RGB(:,:,2);B=RGB(:,:,3);
    HSI=rgb2hsv(RGB);
    HSIG=rgb2gray(HSI);%figure,imshow(HSIG)
   %计算S分量的共生矩阵
   glcms1=graycomatrix(HSIG,'numlevels',64,'offset',[0 1;-1 1;-1 0; -1 -1]);
   %纹理特征统计值（对比度、相关性、熵、平稳度、二阶矩也叫能量）
  stats=graycoprops(glcms1,{'contrast','correlation','energy','homogeneity'});
 ga1=glcms1(:,:,1);%0度
 ga2=glcms1(:,:,2);%45
 ga3=glcms1(:,:,3);%90
 ga4=glcms1(:,:,4);%135
 energya1=0; energya2=0; energya3=0; energya4=0;
for i=1:64
  for  j=1:64
        energya1=energya1+sum(ga1(i,j)^2);
         energya2=energya2+sum(ga2(i,j)^2);
          energya3=energya3+sum(ga3(i,j)^2);
           energya4=energya4+sum(ga4(i,j)^2);
         j=j+1; 
  end
i=i+1;
end
s1=0;s2=0;s3=0;s4=0;s5=0;
for m=1:4
    s1=stats.Contrast(1,m)+s1;
    m=m+1;
end
for m=1:4
    s2=stats.Correlation(1,m)+s2;
    m=m+1;
end
for m=1:4
    s3=stats.Energy(1,m)+s3;
    m=m+1;
end
for m=1:4
    s4=stats.Homogeneity(1,m)+s4;
    m=m+1;
end
s5=0.000001*(energya1+energya2+energya3+energya4);
temp=[s1 s2 s3 s4 s5];
temp2=temp2+temp;
end
temp2=1/4*(temp2)

%输入e
temp3=[0 0 0 0 0];
for k=1:4
    jpg=strcat('e',num2str(k),'.jpg');
    RGB=imread(jpg);%temp1=im2bw(temp1);temp1=temp1(:);
    R=RGB(:,:,1);G=RGB(:,:,2);B=RGB(:,:,3);
    HSI=rgb2hsv(RGB);
    HSIG=rgb2gray(HSI);%figure,imshow(HSIG)
   %计算S分量的共生矩阵
   glcms1=graycomatrix(HSIG,'numlevels',64,'offset',[0 1;-1 1;-1 0; -1 -1]);
   %纹理特征统计值（对比度、相关性、熵、平稳度、二阶矩也叫能量）
  stats=graycoprops(glcms1,{'contrast','correlation','energy','homogeneity'});
 ga1=glcms1(:,:,1);%0度
 ga2=glcms1(:,:,2);%45
 ga3=glcms1(:,:,3);%90
 ga4=glcms1(:,:,4);%135
 energya1=0; energya2=0; energya3=0; energya4=0;
for i=1:64
  for  j=1:64
        energya1=energya1+sum(ga1(i,j)^2);
         energya2=energya2+sum(ga2(i,j)^2);
          energya3=energya3+sum(ga3(i,j)^2);
           energya4=energya4+sum(ga4(i,j)^2);
         j=j+1; 
  end
i=i+1;
end
s1=0;s2=0;s3=0;s4=0;s5=0;
for m=1:4
    s1=stats.Contrast(1,m)+s1;
    m=m+1;
end
for m=1:4
    s2=stats.Correlation(1,m)+s2;
    m=m+1;
end
for m=1:4
    s3=stats.Energy(1,m)+s3;
    m=m+1;
end
for m=1:4
    s4=stats.Homogeneity(1,m)+s4;
    m=m+1;
end
s5=0.000001*(energya1+energya2+energya3+energya4);
temp=[s1 s2 s3 s4 s5];
temp3=temp+temp3;
end
temp3=1/4*(temp3)

%输入m
temp4=[0 0 0 0 0];
for k=1:4
    jpg=strcat('m',num2str(k),'.jpg');
    RGB=imread(jpg);%temp1=im2bw(temp1);temp1=temp1(:);
    R=RGB(:,:,1);G=RGB(:,:,2);B=RGB(:,:,3);
    HSI=rgb2hsv(RGB);
    HSIG=rgb2gray(HSI);%figure,imshow(HSIG)
   %计算S分量的共生矩阵
   glcms1=graycomatrix(HSIG,'numlevels',64,'offset',[0 1;-1 1;-1 0; -1 -1]);
   %纹理特征统计值（对比度、相关性、熵、平稳度、二阶矩也叫能量）
  stats=graycoprops(glcms1,{'contrast','correlation','energy','homogeneity'});
 ga1=glcms1(:,:,1);%0度
 ga2=glcms1(:,:,2);%45
 ga3=glcms1(:,:,3);%90
 ga4=glcms1(:,:,4);%135
 energya1=0; energya2=0; energya3=0; energya4=0;
for i=1:64
  for  j=1:64
        energya1=energya1+sum(ga1(i,j)^2);
         energya2=energya2+sum(ga2(i,j)^2);
          energya3=energya3+sum(ga3(i,j)^2);
           energya4=energya4+sum(ga4(i,j)^2);
         j=j+1; 
  end
i=i+1;
end
s1=0;s2=0;s3=0;s4=0;s5=0;
for m=1:4
    s1=stats.Contrast(1,m)+s1;
    m=m+1;
end
for m=1:4
    s2=stats.Correlation(1,m)+s2;
    m=m+1;
end
for m=1:4
    s3=stats.Energy(1,m)+s3;
    m=m+1;
end
for m=1:4
    s4=stats.Homogeneity(1,m)+s4;
    m=m+1;
end
s5=0.000001*(energya1+energya2+energya3+energya4);
temp=[s1 s2 s3 s4 s5];
temp4=temp4+temp;
end
temp4=1/4*(temp4)

%输入g
temp5=[0 0 0 0 0];
for k=1:4
    jpg=strcat('g',num2str(k),'.jpg');
    RGB=imread(jpg);%temp1=im2bw(temp1);temp1=temp1(:);
    R=RGB(:,:,1);G=RGB(:,:,2);B=RGB(:,:,3);
    HSI=rgb2hsv(RGB);
    HSIG=rgb2gray(HSI);%figure,imshow(HSIG)
   %计算S分量的共生矩阵
   glcms1=graycomatrix(HSIG,'numlevels',64,'offset',[0 1;-1 1;-1 0; -1 -1]);
   %纹理特征统计值（对比度、相关性、熵、平稳度、二阶矩也叫能量）
  stats=graycoprops(glcms1,{'contrast','correlation','energy','homogeneity'});
 ga1=glcms1(:,:,1);%0度
 ga2=glcms1(:,:,2);%45
 ga3=glcms1(:,:,3);%90
 ga4=glcms1(:,:,4);%135
 energya1=0; energya2=0; energya3=0; energya4=0;
for i=1:64
  for  j=1:64
        energya1=energya1+sum(ga1(i,j)^2);
         energya2=energya2+sum(ga2(i,j)^2);
          energya3=energya3+sum(ga3(i,j)^2);
           energya4=energya4+sum(ga4(i,j)^2);
         j=j+1; 
  end
i=i+1;
end
s1=0;s2=0;s3=0;s4=0;s5=0;
for m=1:4
    s1=stats.Contrast(1,m)+s1;
    m=m+1;
end
for m=1:4
    s2=stats.Correlation(1,m)+s2;
    m=m+1;
end
for m=1:4
    s3=stats.Energy(1,m)+s3;
    m=m+1;
end
for m=1:4
    s4=stats.Homogeneity(1,m)+s4;
    m=m+1;
end
s5=0.000001*(energya1+energya2+energya3+energya4);
temp=[s1 s2 s3 s4 s5];
temp5=temp5+temp;
end
temp5=1/4*(temp5)

%输入h
temp6=[0 0 0 0 0];
for k=1:4
    jpg=strcat('h',num2str(k),'.jpg');
    RGB=imread(jpg);%temp1=im2bw(temp1);temp1=temp1(:);
    R=RGB(:,:,1);G=RGB(:,:,2);B=RGB(:,:,3);
    HSI=rgb2hsv(RGB);
    HSIG=rgb2gray(HSI);%figure,imshow(HSIG)
   %计算S分量的共生矩阵
   glcms1=graycomatrix(HSIG,'numlevels',64,'offset',[0 1;-1 1;-1 0; -1 -1]);
   %纹理特征统计值（对比度、相关性、熵、平稳度、二阶矩也叫能量）
  stats=graycoprops(glcms1,{'contrast','correlation','energy','homogeneity'});
 ga1=glcms1(:,:,1);%0度
 ga2=glcms1(:,:,2);%45
 ga3=glcms1(:,:,3);%90
 ga4=glcms1(:,:,4);%135
 energya1=0; energya2=0; energya3=0; energya4=0;
for i=1:64
  for  j=1:64
        energya1=energya1+sum(ga1(i,j)^2);
         energya2=energya2+sum(ga2(i,j)^2);
          energya3=energya3+sum(ga3(i,j)^2);
           energya4=energya4+sum(ga4(i,j)^2);
         j=j+1; 
  end
i=i+1;
end
s1=0;s2=0;s3=0;s4=0;s5=0;
for m=1:4
    s1=stats.Contrast(1,m)+s1;
    m=m+1;
end
for m=1:4
    s2=stats.Correlation(1,m)+s2;
    m=m+1;
end
for m=1:4
    s3=stats.Energy(1,m)+s3;
    m=m+1;
end
for m=1:4
    s4=stats.Homogeneity(1,m)+s4;
    m=m+1;
end
s5=0.000001*(energya1+energya2+energya3+energya4);
temp=[s1 s2 s3 s4 s5];
temp6=temp6+temp;
end
temp6=1/4*(temp6)


%判别
d1=0;
for n=1:5
   d0=[temp0(1,n)-temp1(1,n)]^2;
    d1=d1+d0;
end
 d1=sqrt(d1)
 
d2=0;
for n=1:5
   d0=[temp0(1,n)-temp2(1,n)]^2;
    d2=d2+d0;
end
 d2=sqrt(d2)
 
 d3=0;
for n=1:5
   d0=[temp0(1,n)-temp3(1,n)]^2;
    d3=d3+d0;
end
 d3=sqrt(d3)
 
 d4=0;
for n=1:5
   d0=[temp0(1,n)-temp4(1,n)]^2;
    d4=d4+d0;
end
 d4=sqrt(d4)
 
 d5=0;
for n=1:5
   d0=[temp0(1,n)-temp5(1,n)]^2;
    d5=d5+d0;
end
 d5=sqrt(d5)
 
 d6=0;
for n=1:5
   d0=[temp0(1,n)-temp6(1,n)]^2;
    d6=d6+d0;
end
 d6=sqrt(d6)
 
 dm=[d1 d2 d3 d4 d5 d6]
 [dm,i]=min(dm)
 switch i
     case 1
         disp('a，');figure,imshow(a),title('小叶黎');
     case 2
       disp('b');  figure,imshow(a),title('打碗碗花');
     case 3
       disp('e');figure,imshow(a),title('播娘蒿');
     case 4
         disp('m');figure,imshow(a),title('小麦');
     case 5
         disp('g');figure,imshow(a),title('独荇菜');
     case 6
         disp('h');figure,imshow(a),title('马鞭草');
     otherwise
         disp('error无法识别');
 end


    

     
