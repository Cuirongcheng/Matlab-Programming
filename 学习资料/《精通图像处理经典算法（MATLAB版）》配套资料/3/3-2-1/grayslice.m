I=imread('liftingbody.png');   % 输入灰度图像
imshow(I);                 % 显示灰度图像
title('originalimage')
X=grayslice(I,16);         % 原灰度图像灰度分16层
figure,imshow(X,hot(16));  % 显示伪彩色处理的图像
title('graysliceimage')
