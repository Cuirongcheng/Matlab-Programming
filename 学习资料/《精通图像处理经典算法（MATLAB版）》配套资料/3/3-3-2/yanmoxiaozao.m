I=imread ('coins.png' );    % ��ͼ 
subplot(2,2,1); 
imshow (I);
title('ԭͼ');
J = imnoise(I, 'salt & pepper' ,0.02);   % ��Ӿ�ֵΪ0������Ϊ0.02������
subplot(2,2,2);
imshow (J);            % ��ʾ����ƽ�����ͼ��
title('���������ͼ��');
h1 = ones(3,3)/9;          %�˲���һ��ģ��
I2 = conv2 (J, h1);         % ��ģ����
I2 = uint8(I2);
subplot(2,2,3);        
imshow (I2);  
title('ģ��1��������')
h2 = ones(7,7)/49;          % �˲���һ��ģ��
I3 = conv2 (J, h2);         % ����
I3 = uint8(I3);
subplot(2,2,4);        
imshow (I3);  
title('ģ��2��������')
