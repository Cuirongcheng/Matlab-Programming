I=imread('cao.jpg');
gray=rgb2gray(I);
figure,imshow(gray);title('灰度图像');
figure,imhist(gray,256); %显示灰度直方图
g=im2bw(gray);
BW1=edge(g,'Roberts');%使用roberts算子进行边缘提取
figure,imshow(BW1);
title('roberts算子边缘提')
figure,imshow(~BW1);
BW2=edge(g,'sobel');%使用sobel算子进行边缘提取
figure,imshow(BW2);
title('sobel算子边缘提')
figure,imshow(~BW2);
BW3=edge(g,'Canny');%使用Canny算子进行边缘提取
figure,imshow(BW3);
title('Canny算子边缘提')
figure,imshow(~BW3);

