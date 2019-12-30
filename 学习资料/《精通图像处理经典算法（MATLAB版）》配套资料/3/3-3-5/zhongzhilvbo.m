%         中值滤波处理程序
I=imread('lena.bmp' );               % 读入原图像
J1=imnoise(I, 'salt & pepper',0.02);    % 加均值为0、方差为0.02的椒盐噪声
J2=imnoise(I, 'gaussian',0.02);        % 加均值为0、方差为0.02的高斯噪声
subplot(2,2,1),imshow(J1) ;          % 显示有椒盐噪声图像
subplot(2,2,2), imshow(J2) ;          % 显示有高斯噪声图像
I1= medfilt2(J1, [5,5]);              % 对有椒盐噪声图像进行5×5方形窗口中值滤波
I2= medfilt2(J2, [5,5]);              % 对有高斯噪声图像进行5×5方形窗口中值滤波
subplot(2,2,3), imshow(I1) ;          % 显示有椒盐噪声图像的滤波结果
subplot(2,2,4), imshow(I2) ;          % 显示有高斯噪声图像的滤波结果
