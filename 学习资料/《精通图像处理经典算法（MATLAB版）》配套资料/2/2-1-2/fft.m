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
