%��һ��
function ImgAdd
Ibackground=imread('pears.png');%�����һ��ͼ��
Ibackground=imresize(Ibackground,[200,200]);%����ͼ��ߴ��С
subplot(221),imshow(Ibackground);
title('ͼ1');
J=imread('peppers.png');%����ڶ���ͼ��
J=imresize(J,[200,200]);%����ͼ��ߴ��С
subplot(222),imshow(J);
title('ͼ2');
K1=imadd(Ibackground,J);%ͼ�����
subplot(223),imshow(K1);
title('ͼ����ͼ�����');
K2 = imadd(J,100);
subplot(224),imshow(K2);
title('ͼ���볣�����');

