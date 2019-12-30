%第一章
function ImgAdd
Ibackground=imread('pears.png');%读入第一个图像
Ibackground=imresize(Ibackground,[200,200]);%调整图像尺寸大小
subplot(221),imshow(Ibackground);
title('图1');
J=imread('peppers.png');%读入第二个图像
J=imresize(J,[200,200]);%调整图像尺寸大小
subplot(222),imshow(J);
title('图2');
K1=imadd(Ibackground,J);%图像相加
subplot(223),imshow(K1);
title('图像与图像相加');
K2 = imadd(J,100);
subplot(224),imshow(K2);
title('图像与常数相加');

