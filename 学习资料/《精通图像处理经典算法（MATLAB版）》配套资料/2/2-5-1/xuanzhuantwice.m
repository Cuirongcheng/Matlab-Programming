I=imread('cameraman.tif');
subplot(131),imshow(I)
J1=imrotate(I,30,'nearest');   %第一次旋转
subplot(132),imshow(J1)
J2=imrotate(J1,45,'nearest');   %第二次旋转
subplot(133),imshow(J2)
