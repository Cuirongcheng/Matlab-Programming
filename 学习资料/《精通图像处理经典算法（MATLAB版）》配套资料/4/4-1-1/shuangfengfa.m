%    ֱ��ͼ˫�巨��ֵ�ָ�ͼ�����  
clear
I=imread('pout.tif');    % ����Ҷ�ͼ����ʾ
subplot(1,3,1);
imshow(I);             
subplot(1,3,2);
imhist(I);       % ��ʾ�Ҷ�ͼ��ֱ��ͼ
Inew=im2bw(I,100/255);  % ͼ���ֵ��������100/255ȷ������ֵ������Ŀ���뱳��    subplot(1,3,3);
imshow(Inew);    % ��ʾ�ָ��Ķ�ֵͼ��
