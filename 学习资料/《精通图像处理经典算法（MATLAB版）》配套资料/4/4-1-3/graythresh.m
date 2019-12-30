I = imread('coins.png');
subplot(121);imshow(I);title('原图');
I = im2double(I);
T = graythresh(I);
J = im2bw(I,T);
subplot(122);imshow(J);title('最大累间方差阈值分割');
