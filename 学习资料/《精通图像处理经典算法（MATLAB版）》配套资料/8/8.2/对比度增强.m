I=imread('cao.jpg');
imshow(I);
title('原始图像');
g=rgb2gray(I);
figure,imshow(g);
title('灰度图像');
figure,imhist(g,256); %显示灰度直方图
J=imadjust(g,[0.2,0.8],[]);%灰度调整 （对比度增强）
subplot(1,2,1),imshow(g)
subplot(1,2,2),imshow(J)%显示调整后与原图的对比图
figure,subplot(1,2,1),imhist(g)
subplot(1,2,2),imhist(J);%调整后与原图的直方图对比