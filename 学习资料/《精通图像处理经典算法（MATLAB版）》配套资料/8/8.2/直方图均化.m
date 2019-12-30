I=imread('tire.tif');
J=histeq(I);
subplot(1,2,1),imshow(I);
subplot(1,2,2),imshow(J);
figure,subplot(1,2,1),imhist(I,64);
subplot(1,2,2),imhist(J,64);
