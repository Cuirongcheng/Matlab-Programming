I=imread('liftingbody.png');   % ����Ҷ�ͼ��
imshow(I);                 % ��ʾ�Ҷ�ͼ��
title('originalimage')
X=grayslice(I,16);         % ԭ�Ҷ�ͼ��Ҷȷ�16��
figure,imshow(X,hot(16));  % ��ʾα��ɫ�����ͼ��
title('graysliceimage')
