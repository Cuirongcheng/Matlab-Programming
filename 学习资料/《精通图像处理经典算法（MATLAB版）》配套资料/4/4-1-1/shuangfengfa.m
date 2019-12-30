%    直方图双峰法阈值分割图像程序  
clear
I=imread('pout.tif');    % 读入灰度图像并显示
subplot(1,3,1);
imshow(I);             
subplot(1,3,2);
imhist(I);       % 显示灰度图像直方图
Inew=im2bw(I,100/255);  % 图像二值化，根据100/255确定的阈值，划分目标与背景    subplot(1,3,3);
imshow(Inew);    % 显示分割后的二值图像
