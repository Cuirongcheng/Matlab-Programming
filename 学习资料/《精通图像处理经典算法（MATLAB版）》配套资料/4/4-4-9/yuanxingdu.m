img = imread('tuoyuan.jpg');
img = im2bw(img);
img1 = bwperim(img,8);%求得二进制图像中的边缘点
[m,n]=size(img);
P = 0;%周长初始化
for i = 1:m
    for j = 1:n
        if (img1(i,j)>0)
            P = P + 1;    %所有物体边缘点之和为周长
        end
    end
end
A=bwarea(img); % 计算目标面积
C = (P*P)/A
