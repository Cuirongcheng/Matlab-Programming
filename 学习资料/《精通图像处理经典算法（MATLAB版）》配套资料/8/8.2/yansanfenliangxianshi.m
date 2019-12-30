RGB = imread('9.jpg'); imshow(RGB);
g=rgb2gray(RGB); imshow(g);title('灰度图像');
    r=RGB(:,:,1);figure,imshow(r);r=double(r);title('R分量灰度图')
    g=RGB(:,:,2);figure,imshow(g);g=double(g);title('G分量灰度图')
    b=RGB(:,:,3);figure,imshow(b);b=double(b);title('B分量灰度图')
 %各颜色分量显示  
RGB1=rgb2hsv(RGB);figure,imshow(RGB1);title('HSI 颜色空间彩色图像')
    s=RGB1(:,:,1);figure,imshow(s);title('S分量灰度图')%s，
    h=RGB1(:,:,2);figure,imshow(h);title('H分量灰度图')%h， 
    v=RGB1(:,:,3);figure,imshow(v);title('I分量灰度图')
