I=imread('cao1.bmp');
imshow(I);
improfile;
%colormap(R,G,B);
g=rgb2gray(I);
figure,imshow(g);
improfile;
figure,imhist(g,256);
bw1=roicolor(g,125,175);%根据直方图来取值
     filter1=medfilt2(bw1);
    filter2=medfilt2(filter1);
    filter3=medfilt2(filter2);
    filter4=medfilt2(filter3);
    filter5=medfilt2(filter4);
    %经过5次中值滤波，颗粒噪声有效的去除。
    figure ,imshow(~filter1);
    figure,imshow(~filter2);
    %figure,imshow(~filter3);
    %figure,imshow(~filter4);
    figure,imshow(~filter5);



bw2=edge(filter5,'canny');
figure;imshow(bw1);
title('颜色区域分割')
figure;imshow(bw2);
title('分割后边缘提取')
figure,%subplot(121),
imshow(~bw1);
%subplot(122),imshow(~bw2);
i=gray2ind(g);
figure,imshow(i);
figure,imshow(~i);