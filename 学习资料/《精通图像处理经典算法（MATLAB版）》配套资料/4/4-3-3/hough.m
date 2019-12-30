%用Hough变换对直线的检测
clc;
close all;
I = imread('circuit.tif');               %读入原始图像
figure(1);subplot(1,3,1), imshow(I);title('原始图像');%显示’电路’ 原始图像
Img = edge(I,'prewitt');               %利用prewitt算子提取边缘
subplot(1,3,2), imshow(Img);title('提取图像边缘');      %显示提取边缘的图片
[H, T, R] = hough(Img);              %hough变换
figure(2),imshow(sqrt(H), []); title('映射到一簇曲线 '); %显示hough变换的映射
P = houghpeaks(H, 15, 'threshold', ceil(0.3*max(H(:))));  %寻找最大点
lines=houghlines(Img,T,R,P,'FillGap',10,'MinLength',20 );%返回找到的直线
figure(1);subplot(1,3,3), imshow(I),title('表示出图像查找的直线');
hold on       % 在原始图像上标识出查找的直线
   max_len = 0;
   for k = 1:length(lines)
      xy = [lines(k).point1; lines(k).point2];
      plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
      plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
      plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
   end 
