img = imread('circles.png');
img = im2bw(img);
img1 = bwperim(img,8);%求二进制图像中的边缘点
[m,n]=size(img);
P = 0;%周长初始化
for i = 1:m
    for j = 1:n
        if (img1(i,j)>0)
            P = P + 1;    %统计边界所占像素点
        end
    end
end
