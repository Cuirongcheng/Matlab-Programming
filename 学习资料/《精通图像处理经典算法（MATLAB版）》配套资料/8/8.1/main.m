function main(a)
clc
rootpath = 'D:\ѧϰ\ѧϰ���\�������\Դ����\������ȡ�㷨1\' ;
I1=imread([ rootpath 'f22�Ҷ�ͼ.jpg']);
 tic
 if isrgb(I1)
     I1 = im2bw(I1);
 end
I0 = threshold(I1);
% figure
% imshow(I0);
b1 = character_distill(I0);
B = LightAndMean(I1);%���Ⱥ;�ֵ�Աȶ�
H4 = B(1);
H5 = B(2);
b2 = [H4 H5];
b = [b1 b2];
D = Compute_ED(b);
H2=msgbox(['��ģ��ľ���:','[',num2str(D),']']);
 if D<0.5 
      msgbox(['��ģ��ɻ���ͬ�����ͷɻ�']);
     else
     msgbox(['��ģ��ɻ�����ͬ�����ͷɻ�']);
 end
 toc

    

