%  MATLAB  调用edge函数实现各算子进行边缘检测例程
I = imread('tire.tif');   % 读入原始灰度图像并显示
figure(1),imshow(I); 
BW1 = edge(I,'sobel',0.1);    % 用Sobel算子进行边缘检测，判别阈值为0.1
figure(2),imshow(BW1)
BW2 = edge(I,'roberts',0.1);  %用Roberts算子进行边缘检测，判别阈值为0.1
figure(3),imshow(BW2)
BW3 = edge(I,'prewitt',0.1);  %用Prewitt算子进行边缘检测，判别阈值为0.1
figure(4),imshow(BW3)
