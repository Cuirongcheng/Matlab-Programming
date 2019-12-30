I= imread('rice.png' );      % ��ͼ���ļ��ж�ȡͼ��
I = medfilt2(I,[3,3]);    %��ֵ�˲�
[M N]=size(I);   
F=fft2(I);                     %���ж�ά���ٸ���Ҷ�任
fftshift(F);                   %�ѿ��ٸ���Ҷ�任��DC����Ƶ���������
Dcut=T;%TΪ��ֹƵ��
for u=1:M
  for v=1:N
     D(u,v) =sqrt(u^2 + v^2);
     BUTTERH(u,v)=1/(1+(sqrt(2)-1)*Dcut/D(u,v)^2); %������˹��ͨ���ݺ���
     EXPOTH(u,v)=exp(log(1/sqrt(2))*(Dcut/D(u,v))^2);%ָ���͵�ͨ���ݺ���
  end
end
BUTTERG=BUTTERH.*F;
BUTTERfiltered=ifft2(BUTTERG);
EXPOTG=EXPOTH.*F;
EXPOTGfiltered=ifft2(EXPOTG);
figure,imshow(BUTTERfiltered);
 figure,imshow(EXPOTGfiltered); 
