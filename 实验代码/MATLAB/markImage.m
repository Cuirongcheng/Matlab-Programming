clear                             %�����������
RGB=imread('image1.jpg');   %����ͼƬ
GRAY=rgb2gray(RGB);               %��ɫת�Ҷ�ͼ
figure,imshow(GRAY);               %��ʾ�Ҷ�ͼ
D=fft2(GRAY);                     %����dct�任
figure,imshow(log(abs(D)),[ ]);   %��ʾ�任����
colormap(gray(4));colorbar;
D(abs(D)<0.1)=0;
I=ifft2(D)/255;                   %������ֵ
figure,imshow(I)                %��ʾ�任���ͼ