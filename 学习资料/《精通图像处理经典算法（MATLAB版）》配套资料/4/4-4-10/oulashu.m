BW = imread('circles.png');           %读取图像
figure, imshow(BW)                 %显示图像
eulernum=bweuler(BW)              %求欧拉数
