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
