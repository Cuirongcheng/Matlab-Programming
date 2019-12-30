J=imread('tire.tif');subplot(2,4,1),imshow(J);     
subplot(2,4,5),imhist(J,16);   %显示图像的灰度直方图，共有16个灰度级别
J=imread('pout.tif');subplot(2,4,2),imshow(J);
subplot(2,4,6),imhist(J,32);   %显示图像的灰度直方图，共有32个灰度级别
J=imread('liftingbody.png');subplot(2,4,3),imshow(J);
subplot(2,4,7),imhist(J,128);  %显示图像的灰度直方图，共有128个灰度级别
J=imread('cameraman.tif');subplot(2,4,4),imshow(J);
subplot(2,4,8),imhist(J,256);  %显示图像的灰度直方图，共有256个灰度级别 
