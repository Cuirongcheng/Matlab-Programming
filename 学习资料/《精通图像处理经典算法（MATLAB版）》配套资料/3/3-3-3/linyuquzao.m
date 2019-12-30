I=imread ('coins.png' );    % 读取原图
subplot(2,2,1); 
imshow (I);
title('原图');
J = imnoise(I, 'salt & pepper' ,0.02);   %添加均值为0，方差为0.02的噪声
subplot(2,2,2);
imshow (J);            % 显示添加噪声后的图像
title('添加噪声后图像');
h = [1,1,1;1,0,1;1,1,1];%设定模板矩阵
h1 = h/8;          % 滤波归一化模板
I2 = conv2 (J, h1);         % 邻域平均
I2 = uint8(I2);
subplot(2,2,3);        
imshow (I2);  % 显示噪声图像
title('邻域去噪')
