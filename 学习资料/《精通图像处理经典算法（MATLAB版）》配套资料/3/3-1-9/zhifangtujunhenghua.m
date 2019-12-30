I=imread('cameraman.tif');      % 读入原图像到I变量
J=histeq(I);           % MATLAB直方图均衡化函数histeq，对图像I进行直方图均衡化 
subplot(2,2,1),imshow(I);   % 显示原图像                                     
subplot(2,2,2), imshow(J);  % 显示处理后的图像
subplot(2,2,3),imhist (I,128); % 显示原图像的直方图灰度分布
subplot(2,2,4), imhist (J,128); % 显示均衡化后的图像直方图
