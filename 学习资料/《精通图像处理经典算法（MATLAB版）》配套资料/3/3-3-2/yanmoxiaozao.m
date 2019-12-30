I=imread ('coins.png' );    % 读图 
subplot(2,2,1); 
imshow (I);
title('原图');
J = imnoise(I, 'salt & pepper' ,0.02);   % 添加均值为0，方差为0.02的噪声
subplot(2,2,2);
imshow (J);            % 显示邻域平均后的图像
title('添加噪声后图像');
h1 = ones(3,3)/9;          %滤波归一化模板
I2 = conv2 (J, h1);         % 掩模计算
I2 = uint8(I2);
subplot(2,2,3);        
imshow (I2);  
title('模板1消除噪声')
h2 = ones(7,7)/49;          % 滤波归一化模板
I3 = conv2 (J, h2);         % 计算
I3 = uint8(I3);
subplot(2,2,4);        
imshow (I3);  
title('模板2消除噪声')
