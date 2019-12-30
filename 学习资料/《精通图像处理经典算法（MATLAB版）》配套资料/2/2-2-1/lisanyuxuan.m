I1=imread('lena.bmp'); %读入图片
I1=rgb2gray(I1);%图像二值化转换
subplot(1,2,1)
imshow(I1);  
title('原始图像');
I2=dct2(I1);%离散余弦变换 
subplot(1,2,2);
imshow(log(abs(I2)),[]);%对数显示图像
title('离散余弦变换后');
