I=imread ('coins.png' );    % 加载原始图像 
subplot(2,2,1); 
imshow (I);
title('原图');
J = imnoise(I, 'salt & pepper' ,0.02);   % 添加噪声
subplot(2,2,2);
imshow (J);            %显示图像
title('添加噪声后的图像');
[a,b]= size(J);
I2 = zeros(a,b);
for n = 1 : 30 
    I1 = imnoise(I, 'salt & pepper' ,0.02);
    I2 = I2+double(I1);
end;
I2=I2/n;
I2 = uint8(I2);
subplot(2,2,3);        
imshow (I2);  % 显示去噪声后的图像
title('多图像平均法去噪')  
