clear;
cr=0.5;
initialimage=imread('baboon.bmp');           %��ȡԭͼ��
imshow(initialimage);                      %��ʾԭͼ��
title('ԭʼͼ��')
initialimage=double(initialimage);
t=dctmtx(8);
dctcoe=blkproc(initialimage,[8,8],'P1*x*P2',t,t');  %��ͼ��ֳ�8��8��ͼ����DCT
coevar=im2col(dctcoe,[8,8],'distinct');          %���任ϵ��������������
coe=coevar;
[y,ind]=sort(coevar);
[m,n]=size(coevar);
snum=64-64*cr;                %����ѹ����ȷ��Ҫ��ϵ����Ϊ0�ĸ���
for i=1:n
    coe(ind(1:snum),i)=0;        %����С��snum���任ϵ����Ϊ0
end 
b2=col2im(coe,[8,8],[512,512],'distinct');      %��������ϵ������
i2=blkproc(b2,[8,8],'P1*x*P2',t',t);            %������ɢ���ұ任��IDCT��
i2=uint8(i2);
figure
imshow(i2)                                %��ʾѹ�����ͼ��
title('ѹ��ͼ��')
