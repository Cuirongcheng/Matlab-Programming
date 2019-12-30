clear,clc;
close all;
cr=0.5;
initialimage=imread(' cameraman.tif');           %��ȡԭͼ��
imshow(initialimage);                      %��ʾԭͼ��
title('ԭʼͼ��')
initialimage=double(initialimage);
t=dctmtx(16);
dctcoe=blkproc(initialimage,[16,16],'P1*x*P2',t,t');  %��ͼ��ֳ�8��8��ͼ����DCT
coevar=im2col(dctcoe,[16,16],'distinct');          %���任ϵ��������������
coe=coevar;
[y,ind]=sort(coevar);
[m,n]=size(coevar);
snum=256-256*cr;                %����ѹ����ȷ��Ҫ��ϵ����Ϊ0�ĸ���
for i=1:n
    coe(ind(1:snum),i)=0;        %����С��snum���任ϵ����Ϊ0
end 
b2=col2im(coe,[16,16],[256,256],'distinct');      %��������ϵ������
i2=blkproc(b2,[16,16],'P1*x*P2',t',t);            %������ɢ���ұ任��IDCT��
i2=uint8(i2);
figure
imshow(i2)                                %��ʾѹ�����ͼ��
title('ѹ��ͼ��')
