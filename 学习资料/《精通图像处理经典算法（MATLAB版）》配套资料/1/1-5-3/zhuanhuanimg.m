load trees %װ��ͼ��
I5 = ind2gray(X,map);%������ͼ��ת��Ϊ�Ҷ�ͼ��
imshow(X,map)
figure,imshow(I5);

load trees %װ��ͼ��
BW6 = im2bw(X,map,0.4);%������ɫͼ�������ֵΪ0.4�Ķ�ֵ������
imshow(X,map)
figure, imshow(BW6)

I8 = imread('snowflakes.png');%����ͼ��
X8 = grayslice(I8,16);%���Ҷ�ͼ��ת��Ϊ����ɫͼ��
imshow(I8)
figure,imshow(X8,jet(16))
