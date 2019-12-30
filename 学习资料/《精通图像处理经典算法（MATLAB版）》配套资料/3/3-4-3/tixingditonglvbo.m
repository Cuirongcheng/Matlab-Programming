[I, map]= imread('cameraman.tif' );      % ��ͼ���ļ��ж�ȡͼ��
noisy = imnoise(I, 'gaussian',0.01 );   % ��ԭͼ����Ӹ�˹����
imshow(noisy, map);               % ��ʾ�����˹�������ͼ��
[M N] =size(I);   
F=fft2(noisy);                     % ���ж�ά���ٸ���Ҷ�任
fftshift(F);                        % �ѿ��ٸ���Ҷ�任��DC����Ƶ���������
Dcut=100;
D0=150;
D1=250;
for u=1: M
  for v=1: N
     D(u,v) =sqrt(u^2 + v^2);
     if  D(u,v)< D0                                % ���ε�ͨ�˲������ݺ���
           TRAPEH(u, v)=1;
       elseif  D(u,v) <=D1 
           TRAPEH(u ,v) =(D(u ,v)-D1)/(D0-D1);
       else 
           TRAPEH(u,v) =0;
     end 
  end 
end
TRAPEG=TRAPEH.*F;
TRAPEfiltered = ifft2(TRAPEG);
subplot(2,2,1),imshow(noisy)            % ��ʾ�����˹�������ͼ��
subplot(2,2,4), imshow(TRAPEfiltered,map)   % ��ʾ���ε�ͨ�˲����ͼ��
