I=imread ('coins.png' );    % ��ȡԭͼ
subplot(2,2,1); 
imshow (I);
title('ԭͼ');
J = imnoise(I, 'salt & pepper' ,0.02);   %��Ӿ�ֵΪ0������Ϊ0.02������
subplot(2,2,2);
imshow (J);            % ��ʾ����������ͼ��
title('���������ͼ��');
h = [1,1,1;1,0,1;1,1,1];%�趨ģ�����
h1 = h/8;          % �˲���һ��ģ��
I2 = conv2 (J, h1);         % ����ƽ��
I2 = uint8(I2);
subplot(2,2,3);        
imshow (I2);  % ��ʾ����ͼ��
title('����ȥ��')
