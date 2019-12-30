clear;
I=imread('office.jpg');
I=rgb2gray(I);
subplot(1,2,1);
imshow(I);
title('Ô­Í¼');
I = double(I);
H=size(I);
I3(1:H(1),1:H(2))=I(H(1):-1:1,H(2):-1:1);    %¶Ô½Ç¾µÏñ
subplot(1,2,2);
imshow(uint8(I3));
title('¶Ô½Ç¾µÏñ');
