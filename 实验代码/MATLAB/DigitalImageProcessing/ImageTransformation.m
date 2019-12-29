clc;%清除工作区的程序
I=imread('lena.bmp');%读入图片
I=rgb2gray(I);%图片进行二值化处理
subplot(1,3,1);%建立1*3的图像显示第一个图
imshow(I);%读出图像
title('原始图象');%写标题
J=fft2(I);%快速傅里叶变换
subplot(1,3,2)%建立1*3的图像显示第二个图
imshow(J);
title('FFT变换结果')
subplot(1,3,3)
K=fftshift(J);%频率变换
imshow(K);
title('零点平移');

f=zeros(30,30);
f(5:24,13:17)=1;
F=fft2(f,256,256);
F2=fftshift(F);
F3=log(1+abs(F2));
subplot(2,2,1);
imshow(f);
title('原图像');
subplot(2,2,2);
imshow(F3);
title('傅立叶频谱');
f1= imrotate(f,90);
F1=fft2(f1,256,256);
F21=fftshift(F1);
F31=log(1+abs(F21));
subplot(2,2,3);
imshow(f1);
title('原图像旋转45');
subplot(2,2,4);
imshow(F31);
title('傅立叶频谱');

f = imread('circles.png');
subplot(131);
imshow (f);           
title('原图');
F1 = fft2(f);%二维傅里叶变换
F2 = log(abs(F1));%对二维傅里叶变换结果取绝对值，然后取对数
subplot(132);
imshow (F2,[-1 5]);           
title('变换1');
F3 = fft2(f,256,256);%矩阵二维傅里叶变化
F3 = fftshift(F3);%交换F象限 
F4 = log(abs(F3));
subplot(133);
imshow (F4,[-1 5]);           
title('变换2');
