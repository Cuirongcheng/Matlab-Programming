I=imread('office.jpg');
I=rgb2gray(I);
subplot(1,2,1);
imshow(I);
title('Ô­Í¼');
I = double(I);
H=size(I);
I1(1:H(1,1),1:H(1,2))=I(H(1,1):-1:1,1:H(1,2));           %´¹Ö±¾µÏñ
subplot(1,2,2);
imshow(uint8(I1));
title('´¹Ö±¾µÏñ');
