I = imread('coins.png');
subplot(121);imshow(I);title('ԭͼ');
I = im2double(I);
T = graythresh(I);
J = im2bw(I,T);
subplot(122);imshow(J);title('����ۼ䷽����ֵ�ָ�');
