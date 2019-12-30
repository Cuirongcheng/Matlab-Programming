[I, map]= imread('cameraman.tif' );      % 从图形文件中读取图像
noisy = imnoise(I, 'gaussian',0.01 );   % 对原图像添加高斯噪声
imshow(noisy, map);               % 显示加入高斯噪声后的图像
[M N] =size(I);   
F=fft2(noisy);                     % 进行二维快速傅立叶变换
fftshift(F);                        % 把快速傅立叶变换的DC组件移到光谱中心
Dcut=100;
D0=150;
D1=250;
for u=1: M
  for v=1: N
     D(u,v) =sqrt(u^2 + v^2);
     if  D(u,v)< D0                                % 梯形低通滤波器传递函数
           TRAPEH(u, v)=1;
       elseif  D(u,v) <=D1 
           TRAPEH(u ,v) =(D(u ,v)-D1)/(D0-D1);
       else 
           TRAPEH(u,v) =0;
     end 
  end 
end
TRAPEG=TRAPEH.*F;
TRAPEfiltered = ifft2(TRAPEG);
subplot(2,2,1),imshow(noisy)            % 显示加入高斯噪声后的图像
subplot(2,2,4), imshow(TRAPEfiltered,map)   % 显示梯形低通滤波后的图像
