I=imread('cao.jpg');
imshow(I);
title('ԭʼͼ��');
g=rgb2gray(I);
figure,imshow(g);
title('�Ҷ�ͼ��');
figure,imhist(g,256); %��ʾ�Ҷ�ֱ��ͼ
J=imadjust(g,[0.2,0.8],[]);%�Ҷȵ��� ���Աȶ���ǿ��
subplot(1,2,1),imshow(g)
subplot(1,2,2),imshow(J)%��ʾ��������ԭͼ�ĶԱ�ͼ
figure,subplot(1,2,1),imhist(g)
subplot(1,2,2),imhist(J);%��������ԭͼ��ֱ��ͼ�Ա�