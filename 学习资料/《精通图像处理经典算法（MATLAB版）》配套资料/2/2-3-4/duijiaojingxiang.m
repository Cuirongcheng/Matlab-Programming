clear;
I=imread('office.jpg');
I=rgb2gray(I);
subplot(1,2,1);
imshow(I);
title('ԭͼ');
I = double(I);
H=size(I);
I3(1:H(1),1:H(2))=I(H(1):-1:1,H(2):-1:1);    %�ԽǾ���
subplot(1,2,2);
imshow(uint8(I3));
title('�ԽǾ���');
