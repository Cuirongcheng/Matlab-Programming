function Img_divide
Img1 = imread ('rice.png');
subplot(221),imshow(Img1);
title('ͼ1');
[m,n] = size(Img1);
Img2 = imread ('moon.tif');
subplot(222),imshow(Img2);
title('ͼ2');
Img2 = imresize(Img2,[m,n]);
Img_multiply1 = imdivide(Img1,Img2);
subplot(223),imshow(Img_multiply1);
title('ͼ����ͼ�����');
Img_multiply2 = imdivide(Img1,2);
subplot(224),imshow(Img_multiply2);
title('ͼ���볣�����');