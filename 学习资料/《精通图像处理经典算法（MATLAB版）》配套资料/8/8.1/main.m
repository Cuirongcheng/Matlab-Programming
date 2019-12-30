function main(a)
clc
rootpath = 'D:\学习\学习相关\课题程序\源程序\特征提取算法1\' ;
I1=imread([ rootpath 'f22灰度图.jpg']);
 tic
 if isrgb(I1)
     I1 = im2bw(I1);
 end
I0 = threshold(I1);
% figure
% imshow(I0);
b1 = character_distill(I0);
B = LightAndMean(I1);%亮度和均值对比度
H4 = B(1);
H5 = B(2);
b2 = [H4 H5];
b = [b1 b2];
D = Compute_ED(b);
H2=msgbox(['与模板的距离:','[',num2str(D),']']);
 if D<0.5 
      msgbox(['与模板飞机是同种类型飞机']);
     else
     msgbox(['与模板飞机不是同种类型飞机']);
 end
 toc

    

