%����ԭʼͼ���ˮӡͼ����ʾ
I=imread('lena512.jpg');
figure(1);
axes(handles.axes1);%%ʹ��ͼ�񣬲���������1
imshow(I);
title('ԭʼͼ��');
J=imread('xiaohui64.jpg');
axes(handles.axes2);%%ʹ��ͼ�񣬲���������2
imshow(J);
title('ˮӡͼ��');
%��ˮӡͼ�����arnold����Ԥ����
H=double(J);
tempImg=H; %ͼ����󸳸�tempImg
for n=1:5  %���Ҵ���
for u=1:64
for v=1:64
temp=tempImg(u,v);
ax=mod((u-1)+(v-1),64)+1;%��������λ��
ay=mod((u-1)+2*(v-1),64)+1;%��������λ��
outImg(ax,ay)=temp;
end
end
tempImg=outImg;
end
G=uint8(outImg);%�õ����Һ��ˮӡͼ��
%Ƕ��ˮӡ
for p=1:64
for q=1:64 %p��q����1��64������Ϊ��64*64��8*8�Ŀ飬ÿ��ѭ������һ����
BLOCK1=I(((p-1)*8+1):p*8,((q-1)*8+1):q*8);%ÿ��8*8�Ŀ�
BLOCK1=dct2(BLOCK1);%��2ά��dct�任
BLOCK1(4,5)=BLOCK1(4,5)+0.2*G(p,q);%��ÿ��dctϵ����4��5�д�Ƕ��ˮӡ��ϵ���ɵ�
W(((p-1)*8+1):p*8,((q-1)*8+1):q*8)=idct2(BLOCK1);%��dct���任
end
end
%��ʾǶ��ˮӡ���ͼ��
imwrite(uint8(W), 'lena_mark.jpg ', 'jpg');
axes(handles.axes3);%%ʹ��ͼ�񣬲���������3
imshow('lena_mark.jpg');
title('Ƕ��ˮӡ���ͼ��');
for p=1:64
for q=1:64
BLOCK1=W(((p-1)*8+1):p*8,((q-1)*8+1):q*8);
BLOCK2=I(((p-1)*8+1):p*8,((q-1)*8+1):q*8);
BLOCK1=dct2(BLOCK1);
BLOCK2=dct2(BLOCK2);
Y(p,q)=(BLOCK1(4,5)-BLOCK2(4,5))/0.2;
end
end
% ��ˮӡ����arnold������
for n=1:43 % ѭ������Ϊ48-5
for u=1:64
for v=1:64
temp1=Y(u,v);
bx=mod((u-1)+(v-1),64)+1;
by=mod((u-1)+2*(v-1),64)+1;
outImg1(bx,by)=temp1;
end
end
Y=outImg1;
end
%��ʾ��ȡ������ˮӡͼ��
imwrite(uint8(Y), 'watermark.jpg ', 'jpg');
axes(handles.axes4);%%ʹ��ͼ�񣬲���������4
imshow('watermark.jpg');
title('��ȡ������ˮӡͼ��');
