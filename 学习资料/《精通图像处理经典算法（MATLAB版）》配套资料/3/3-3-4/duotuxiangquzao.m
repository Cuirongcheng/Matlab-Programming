I=imread ('coins.png' );    % ����ԭʼͼ�� 
subplot(2,2,1); 
imshow (I);
title('ԭͼ');
J = imnoise(I, 'salt & pepper' ,0.02);   % �������
subplot(2,2,2);
imshow (J);            %��ʾͼ��
title('����������ͼ��');
[a,b]= size(J);
I2 = zeros(a,b);
for n = 1 : 30 
    I1 = imnoise(I, 'salt & pepper' ,0.02);
    I2 = I2+double(I1);
end;
I2=I2/n;
I2 = uint8(I2);
subplot(2,2,3);        
imshow (I2);  % ��ʾȥ�������ͼ��
title('��ͼ��ƽ����ȥ��')  
