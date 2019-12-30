I1=imread('pears.png'); 
I1=rgb2gray(I1);%灰度化
subplot(1,2,1)
imshow(I1);  
title('原图');
I2=dct2(I1);%二维离散余弦变换 
I2(abs(I2) < 10) = 0;
K = idct2(I2);
subplot(1,2,2);
imshow(K, [0 255]);
title('压缩重构图像');
