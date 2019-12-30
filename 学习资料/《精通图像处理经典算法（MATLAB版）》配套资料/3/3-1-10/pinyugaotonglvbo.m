I= imread('rice.png' );      % 从图形文件中读取图像
I = medfilt2(I,[3,3]);    %中值滤波
[M N]=size(I);   
F=fft2(I);                     %进行二维快速傅立叶变换
fftshift(F);                   %把快速傅立叶变换的DC组件移到光谱中心
Dcut=T;%T为截止频率
for u=1:M
  for v=1:N
     D(u,v) =sqrt(u^2 + v^2);
     BUTTERH(u,v)=1/(1+(sqrt(2)-1)*Dcut/D(u,v)^2); %巴特沃斯高通传递函数
     EXPOTH(u,v)=exp(log(1/sqrt(2))*(Dcut/D(u,v))^2);%指数型低通传递函数
  end
end
BUTTERG=BUTTERH.*F;
BUTTERfiltered=ifft2(BUTTERG);
EXPOTG=EXPOTH.*F;
EXPOTGfiltered=ifft2(EXPOTG);
figure,imshow(BUTTERfiltered);
 figure,imshow(EXPOTGfiltered); 
