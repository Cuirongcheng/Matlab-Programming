I=imread('cao.jpg');
gray=rgb2gray(I);
figure,imshow(gray);title('�Ҷ�ͼ��');
figure,imhist(gray,256); %��ʾ�Ҷ�ֱ��ͼ
g=im2bw(gray);
BW1=edge(g,'Roberts');%ʹ��roberts���ӽ��б�Ե��ȡ
figure,imshow(BW1);
title('roberts���ӱ�Ե��')
figure,imshow(~BW1);
BW2=edge(g,'sobel');%ʹ��sobel���ӽ��б�Ե��ȡ
figure,imshow(BW2);
title('sobel���ӱ�Ե��')
figure,imshow(~BW2);
BW3=edge(g,'Canny');%ʹ��Canny���ӽ��б�Ե��ȡ
figure,imshow(BW3);
title('Canny���ӱ�Ե��')
figure,imshow(~BW3);

