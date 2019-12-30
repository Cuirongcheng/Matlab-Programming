I = imread('rice.png');
subplot(121),imshow(I);
J = entropyfilt(I);
subplot(122),imshow(J,[]);
