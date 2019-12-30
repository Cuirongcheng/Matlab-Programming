%  MATLAB  调用edge函数实现各算子进行边缘检测例程
I = imread('rice.png');   % 读入原始灰度图像并显示
BW1 = edge(I,'log',0.01);    % 用LOG算子进行边缘检测，判别阈值为0.01
figure(1),imshow(BW1)
BW2= edge(I,'canny',0.1);  % 用Canny算子进行边缘检测，判别阈值为0.1
figure(2),imshow(BW2)
