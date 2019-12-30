J = imread('eight.tif');      % 读人原始图像
subplot(121); imshow(J);   % 显示原始图像
J = double(J);
set(gcf, 'color', [1  1  1 ]);
f = fft2(J);              % 采用傅里叶变换
 g = fftshift(f);           % 数据矩阵平衡
 [M, N] = size(f);
 d0 = 10;
 r1 = 0.5;               % 用 ＝0.5、 ＝2.0进行同态滤波
 rh = 2
 c=4;
 n1= floor(M/2);
 n2= floor(N/2);
 for i = 1: M
      for j = 1: N
             d = sqrt((i - n1)^2 + (j - n2)^2);
             h= (rh-r1)*(1-exp(-c*(d.^2/d0.^2))) + r1;
             g(i, j)=h*g(i, j);
      end
end
g = ifftshift(g);
g = uint8 ( real ( ifft2 (g)));
subplot(122); imshow(g);    % 显示同态滤波的结果
