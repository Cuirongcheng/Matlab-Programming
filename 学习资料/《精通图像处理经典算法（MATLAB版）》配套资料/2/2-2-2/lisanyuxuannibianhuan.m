I1=imread('pears.png'); 
I1=rgb2gray(I1);%�ҶȻ�
subplot(1,2,1)
imshow(I1);  
title('ԭͼ');
I2=dct2(I1);%��ά��ɢ���ұ任 
I2(abs(I2) < 10) = 0;
K = idct2(I2);
subplot(1,2,2);
imshow(K, [0 255]);
title('ѹ���ع�ͼ��');
