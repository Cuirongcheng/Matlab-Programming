[I, map]= imread('winter.bmp' );      % 从图形文件中读取图像
noisy = imnoise(I, 'gaussian',0.01 );   % 对原图像添加高斯噪声
imshow(noisy, map);               % 显示加入高斯噪声后的图像
[M N] =size(I);   
F=fft2(noisy);                     % 进行二维快速傅立叶变换
fftshift(F);                        % 把快速傅立叶变换的DC组件移到光谱中心
Dcut=100;
for u=1:M
  for v=1:N
     D(u,v) =sqrt(u^2 + v^2);
     BUTTERH(u, v)=1/(1+(sqrt(2)-1)*(D(u,v)/Dcut)^2); % 巴特沃斯低通滤波器传递函数
  end 
end
BUTTERG=BUTTERH.*F;
BUTTERfiltered=ifft2(BUTTERG);
subplot(2,2,1),imshow(noisy)            % 显示加入高斯噪声后的图像
subplot(2,2,2),imshow(BUTTERfiltered,map)  % 显示巴特沃斯低通滤波后的图像
