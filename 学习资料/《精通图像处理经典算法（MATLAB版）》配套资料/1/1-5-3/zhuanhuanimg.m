load trees %装载图像
I5 = ind2gray(X,map);%将索引图像转换为灰度图像
imshow(X,map)
figure,imshow(I5);

load trees %装载图像
BW6 = im2bw(X,map,0.4);%将索引色图像进行阈值为0.4的二值化处理
imshow(X,map)
figure, imshow(BW6)

I8 = imread('snowflakes.png');%读入图像
X8 = grayslice(I8,16);%将灰度图像转换为索引色图像
imshow(I8)
figure,imshow(X8,jet(16))
