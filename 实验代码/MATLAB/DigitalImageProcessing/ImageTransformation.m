clc;%����������ĳ���
I=imread('lena.bmp');%����ͼƬ
I=rgb2gray(I);%ͼƬ���ж�ֵ������
subplot(1,3,1);%����1*3��ͼ����ʾ��һ��ͼ
imshow(I);%����ͼ��
title('ԭʼͼ��');%д����
J=fft2(I);%���ٸ���Ҷ�任
subplot(1,3,2)%����1*3��ͼ����ʾ�ڶ���ͼ
imshow(J);
title('FFT�任���')
subplot(1,3,3)
K=fftshift(J);%Ƶ�ʱ任
imshow(K);
title('���ƽ��');

f=zeros(30,30);
f(5:24,13:17)=1;
F=fft2(f,256,256);
F2=fftshift(F);
F3=log(1+abs(F2));
subplot(2,2,1);
imshow(f);
title('ԭͼ��');
subplot(2,2,2);
imshow(F3);
title('����ҶƵ��');
f1= imrotate(f,90);
F1=fft2(f1,256,256);
F21=fftshift(F1);
F31=log(1+abs(F21));
subplot(2,2,3);
imshow(f1);
title('ԭͼ����ת45');
subplot(2,2,4);
imshow(F31);
title('����ҶƵ��');

f = imread('circles.png');
subplot(131);
imshow (f);           
title('ԭͼ');
F1 = fft2(f);%��ά����Ҷ�任
F2 = log(abs(F1));%�Զ�ά����Ҷ�任���ȡ����ֵ��Ȼ��ȡ����
subplot(132);
imshow (F2,[-1 5]);           
title('�任1');
F3 = fft2(f,256,256);%�����ά����Ҷ�仯
F3 = fftshift(F3);%����F���� 
F4 = log(abs(F3));
subplot(133);
imshow (F4,[-1 5]);           
title('�任2');
