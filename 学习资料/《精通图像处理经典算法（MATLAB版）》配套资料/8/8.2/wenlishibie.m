%�����б𷨣�����ʶ��
% ����ͼ��
close all;
clear;clc
[filename,filepath]=uigetfile('*.jpg','����һ��ͼ��');
jpg=strcat(filepath,filename);
a=imread(jpg);
%figure,imshow(a),title('ԭʼͼ��')
%��ɫ�ռ�ת��
HSI=rgb2hsv(a); %hsi��HSI��ɫ�ռ��ɫͼ��
%figure,imshow(HSI),title('HSI��ɫͼ��')
HSIG=rgb2gray(HSI); % hsig:�Ҷ�ͼ��
%figure,imshow(HSIG),title('�Ҷ�ͼ��')
% imwrite(b,'�ӲݻҶ�ͼ��.jpg');

%����64λ�Ҷȹ�������
 glcms1=graycomatrix(HSIG,'numlevels',64,'offset',[0 1;-1 1;-1 0; -1 -1]);
 %��������ͳ��ֵ���Աȶȡ�����ԡ��ء�ƽ�ȶȡ����׾�Ҳ��������
 stats=graycoprops(glcms1,{'contrast','correlation','energy','homogeneity'});
 ga1=glcms1(:,:,1);%0��
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
%plot(x,y1,'y',x,y2,'c',x,y3,'b',x,y4,'r')%�������ͼ��ʾ��������ֵ


%����a
temp1=[0 0 0 0 0];
for k=1:4
    jpg=strcat('a',num2str(k),'.jpg');
    RGB=imread(jpg);%temp1=im2bw(temp1);temp1=temp1(:);
    R=RGB(:,:,1);G=RGB(:,:,2);B=RGB(:,:,3);
    HSI=rgb2hsv(RGB);
    HSIG=rgb2gray(HSI);%figure,imshow(HSIG)
   %����S�����Ĺ�������
   glcms1=graycomatrix(HSIG,'numlevels',64,'offset',[0 1;-1 1;-1 0; -1 -1]);
   %��������ͳ��ֵ���Աȶȡ�����ԡ��ء�ƽ�ȶȡ����׾�Ҳ��������
  stats=graycoprops(glcms1,{'contrast','correlation','energy','homogeneity'});
 ga1=glcms1(:,:,1);%0��
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

%����b
temp2=[0 0 0 0 0];
for k=1:4
    jpg=strcat('b',num2str(k),'.jpg');
    RGB=imread(jpg);%temp1=im2bw(temp1);temp1=temp1(:);
    R=RGB(:,:,1);G=RGB(:,:,2);B=RGB(:,:,3);
    HSI=rgb2hsv(RGB);
    HSIG=rgb2gray(HSI);%figure,imshow(HSIG)
   %����S�����Ĺ�������
   glcms1=graycomatrix(HSIG,'numlevels',64,'offset',[0 1;-1 1;-1 0; -1 -1]);
   %��������ͳ��ֵ���Աȶȡ�����ԡ��ء�ƽ�ȶȡ����׾�Ҳ��������
  stats=graycoprops(glcms1,{'contrast','correlation','energy','homogeneity'});
 ga1=glcms1(:,:,1);%0��
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

%����e
temp3=[0 0 0 0 0];
for k=1:4
    jpg=strcat('e',num2str(k),'.jpg');
    RGB=imread(jpg);%temp1=im2bw(temp1);temp1=temp1(:);
    R=RGB(:,:,1);G=RGB(:,:,2);B=RGB(:,:,3);
    HSI=rgb2hsv(RGB);
    HSIG=rgb2gray(HSI);%figure,imshow(HSIG)
   %����S�����Ĺ�������
   glcms1=graycomatrix(HSIG,'numlevels',64,'offset',[0 1;-1 1;-1 0; -1 -1]);
   %��������ͳ��ֵ���Աȶȡ�����ԡ��ء�ƽ�ȶȡ����׾�Ҳ��������
  stats=graycoprops(glcms1,{'contrast','correlation','energy','homogeneity'});
 ga1=glcms1(:,:,1);%0��
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

%����m
temp4=[0 0 0 0 0];
for k=1:4
    jpg=strcat('m',num2str(k),'.jpg');
    RGB=imread(jpg);%temp1=im2bw(temp1);temp1=temp1(:);
    R=RGB(:,:,1);G=RGB(:,:,2);B=RGB(:,:,3);
    HSI=rgb2hsv(RGB);
    HSIG=rgb2gray(HSI);%figure,imshow(HSIG)
   %����S�����Ĺ�������
   glcms1=graycomatrix(HSIG,'numlevels',64,'offset',[0 1;-1 1;-1 0; -1 -1]);
   %��������ͳ��ֵ���Աȶȡ�����ԡ��ء�ƽ�ȶȡ����׾�Ҳ��������
  stats=graycoprops(glcms1,{'contrast','correlation','energy','homogeneity'});
 ga1=glcms1(:,:,1);%0��
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

%����g
temp5=[0 0 0 0 0];
for k=1:4
    jpg=strcat('g',num2str(k),'.jpg');
    RGB=imread(jpg);%temp1=im2bw(temp1);temp1=temp1(:);
    R=RGB(:,:,1);G=RGB(:,:,2);B=RGB(:,:,3);
    HSI=rgb2hsv(RGB);
    HSIG=rgb2gray(HSI);%figure,imshow(HSIG)
   %����S�����Ĺ�������
   glcms1=graycomatrix(HSIG,'numlevels',64,'offset',[0 1;-1 1;-1 0; -1 -1]);
   %��������ͳ��ֵ���Աȶȡ�����ԡ��ء�ƽ�ȶȡ����׾�Ҳ��������
  stats=graycoprops(glcms1,{'contrast','correlation','energy','homogeneity'});
 ga1=glcms1(:,:,1);%0��
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

%����h
temp6=[0 0 0 0 0];
for k=1:4
    jpg=strcat('h',num2str(k),'.jpg');
    RGB=imread(jpg);%temp1=im2bw(temp1);temp1=temp1(:);
    R=RGB(:,:,1);G=RGB(:,:,2);B=RGB(:,:,3);
    HSI=rgb2hsv(RGB);
    HSIG=rgb2gray(HSI);%figure,imshow(HSIG)
   %����S�����Ĺ�������
   glcms1=graycomatrix(HSIG,'numlevels',64,'offset',[0 1;-1 1;-1 0; -1 -1]);
   %��������ͳ��ֵ���Աȶȡ�����ԡ��ء�ƽ�ȶȡ����׾�Ҳ��������
  stats=graycoprops(glcms1,{'contrast','correlation','energy','homogeneity'});
 ga1=glcms1(:,:,1);%0��
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


%�б�
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
         disp('a��');figure,imshow(a),title('СҶ��');
     case 2
       disp('b');  figure,imshow(a),title('�����뻨');
     case 3
       disp('e');figure,imshow(a),title('������');
     case 4
         disp('m');figure,imshow(a),title('С��');
     case 5
         disp('g');figure,imshow(a),title('������');
     case 6
         disp('h');figure,imshow(a),title('��޲�');
     otherwise
         disp('error�޷�ʶ��');
 end


    

     
