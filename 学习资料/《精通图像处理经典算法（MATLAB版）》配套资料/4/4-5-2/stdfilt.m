I = imread('rice.png');
subplot(121),imshow(I);
J = stdfilt(I);
subplot(122),imshow(J,[]);
