I=imread('cao1.bmp');
imshow(I);
improfile;
%colormap(R,G,B);
g=rgb2gray(I);
figure,imshow(g);
improfile;
figure,imhist(g,256);
bw1=roicolor(g,125,175);%����ֱ��ͼ��ȡֵ
     filter1=medfilt2(bw1);
    filter2=medfilt2(filter1);
    filter3=medfilt2(filter2);
    filter4=medfilt2(filter3);
    filter5=medfilt2(filter4);
    %����5����ֵ�˲�������������Ч��ȥ����
    figure ,imshow(~filter1);
    figure,imshow(~filter2);
    %figure,imshow(~filter3);
    %figure,imshow(~filter4);
    figure,imshow(~filter5);



bw2=edge(filter5,'canny');
figure;imshow(bw1);
title('��ɫ����ָ�')
figure;imshow(bw2);
title('�ָ���Ե��ȡ')
figure,%subplot(121),
imshow(~bw1);
%subplot(122),imshow(~bw2);
i=gray2ind(g);
figure,imshow(i);
figure,imshow(~i);