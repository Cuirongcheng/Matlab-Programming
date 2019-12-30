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
