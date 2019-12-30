[I, map]= imread('winter.bmp' );      % ��ͼ���ļ��ж�ȡͼ��
noisy = imnoise(I, 'gaussian',0.01 );   % ��ԭͼ����Ӹ�˹����
imshow(noisy, map);               % ��ʾ�����˹�������ͼ��
[M N] =size(I);   
F=fft2(noisy);                     % ���ж�ά���ٸ���Ҷ�任
fftshift(F);                        % �ѿ��ٸ���Ҷ�任��DC����Ƶ���������
Dcut=100;
for u=1:M
  for v=1:N
     D(u,v) =sqrt(u^2 + v^2);
     BUTTERH(u, v)=1/(1+(sqrt(2)-1)*(D(u,v)/Dcut)^2); % ������˹��ͨ�˲������ݺ���
  end 
end
BUTTERG=BUTTERH.*F;
BUTTERfiltered=ifft2(BUTTERG);
subplot(2,2,1),imshow(noisy)            % ��ʾ�����˹�������ͼ��
subplot(2,2,2),imshow(BUTTERfiltered,map)  % ��ʾ������˹��ͨ�˲����ͼ��
