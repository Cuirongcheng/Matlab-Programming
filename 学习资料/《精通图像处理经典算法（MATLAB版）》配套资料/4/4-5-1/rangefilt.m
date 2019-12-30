I = imread('coins.png');
subplot(121),imshow(I);
J = rangefilt(I);
subplot(122),imshow(J);
