I1=imread('lena.bmp'); %����ͼƬ
I1=rgb2gray(I1);%ͼ���ֵ��ת��
subplot(1,2,1)
imshow(I1);  
title('ԭʼͼ��');
I2=dct2(I1);%��ɢ���ұ任 
subplot(1,2,2);
imshow(log(abs(I2)),[]);%������ʾͼ��
title('��ɢ���ұ任��');
