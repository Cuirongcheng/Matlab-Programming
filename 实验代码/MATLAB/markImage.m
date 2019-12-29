clear                             %清除工作区间
RGB=imread('image1.jpg');   %加载图片
GRAY=rgb2gray(RGB);               %彩色转灰度图
figure,imshow(GRAY);               %显示灰度图
D=fft2(GRAY);                     %进行dct变换
figure,imshow(log(abs(D)),[ ]);   %显示变换过程
colormap(gray(4));colorbar;
D(abs(D)<0.1)=0;
I=ifft2(D)/255;                   %设置限值
figure,imshow(I)                %显示变换后的图