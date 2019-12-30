function Img_immultiply
Img1 = imread ('saturn.png');
Img1 = rgb2gray(Img1);
subplot(221),imshow(Img1);
title('图1');
[m,n] = size(Img1);
Img2 = imread ('rice.png');
subplot(222),imshow(Img2);
title('图2');
Img2 = imresize(Img2,[m,n]);
Img_multiply1 = immultiply(Img1,Img2);
subplot(223),imshow(Img_multiply1);
title('图像与图像相乘');
Img_multiply2 = immultiply(Img1,2);
subplot(224),imshow(Img_multiply2);
title('图像与常数相乘');


