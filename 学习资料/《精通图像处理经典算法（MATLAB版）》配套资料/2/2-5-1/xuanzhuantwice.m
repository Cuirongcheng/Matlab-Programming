I=imread('cameraman.tif');
subplot(131),imshow(I)
J1=imrotate(I,30,'nearest');   %��һ����ת
subplot(132),imshow(J1)
J2=imrotate(J1,45,'nearest');   %�ڶ�����ת
subplot(133),imshow(J2)
