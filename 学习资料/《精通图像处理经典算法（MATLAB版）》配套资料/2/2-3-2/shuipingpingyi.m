I=imread('office.jpg');
I=rgb2gray(I);
subplot(1,2,1);
imshow(I);
title('ԭͼ');
I = double(I);
H=size(I);
I2(1:H(1,1),1:H(1,2))=I(1:H(1,1),H(1,2):-1:1);            %ˮƽ����
subplot(1,2,2);
imshow(uint8(I2));
title('ˮƽ����');
