I = imread('coins.png');
subplot(121);imshow(I);
title('原图');
J = imadjust(I,[0.3;0.8],[0.6;1]);
subplot(122);imshow(J);
title('指定灰度范围的图像增强');
