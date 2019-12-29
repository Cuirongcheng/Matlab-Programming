img_rgb = imread('pi.jpeg');
img = rgb2gray(img_rgb);
% img=im2double(img);  %��fת��Ϊ��һ����double��ͼ��
figure();
imshow(img);
%���о�ֵ�˲�
a_bmp = filter2(fspecial('average',3),img)/255; %����3*3��ֵ�˲�
imwrite(a_bmp,'A.bmp');
%%��Ե��ȡ
bw1 = edge(a_bmp,'sobel');
bw2 = edge(a_bmp,'roberts');
bw3 = edge(a_bmp,'log');
bw4 = edge(a_bmp,'canny');
figure
subplot(2,2,1); imshow(bw1);title('sobel����');
subplot(2,2,2);imshow(bw2);title('roberts����');
subplot(2,2,3);imshow(bw3);title('log����');
subplot(2,2,4);imshow(bw4);title('canny����');

%������
p1 =fspecial('sobel');
figure();
add1 =imfilter(a_bmp,p1);
out1=add1+a_bmp;
imshow(out1);
title('sobel�񻯽��');

p2 =fspecial('prewitt');
figure();
add2 =imfilter(a_bmp,p2);
out2=add2+a_bmp;
imshow(out2);
title('prewitt�񻯽��');

p3 =fspecial('laplacian');
figure();
add3 =imfilter(a_bmp,p3);
out3=add3+a_bmp;
imshow(out3);
title('laplacian�񻯽��');

%���и�˹�˲���Ƶ���񻯣�
%ͼ��ı�Ե��ϸ����Ҫλ�ڸ�Ƶ���֣���ͼ���ģ�������ڸ�Ƶ�ɷ������������ġ�

gaus=fspecial('gaussian', [3,3], 1);
figure
gausout=imfilter(a_bmp,gaus,'replicate');
imshow(gausout)
title('��˹Ƶ���˲�');

f= double(img);[r,c]=size(f);  
F=fft2(f);G=fftshift(F);  
d0=15; %�뾶��Χ  
n=2;%������˹�״�  
a=0.2;b=2.0; %��Ƶǿ���˲����ݺ���ϵ��  
mu=floor(r/2);mv=floor(c/2);  
for u=1:r  
    for v=1:c  
        d=sqrt((u-mu)^2+(v-mv)^2);  
        Hlpbtw=1/(1+0.414*(d/d0)^(2*n));  
        Hhpbtw=1-Hlpbtw;    Ghpbtw(u,v)=Hhpbtw*G(u,v);  
        Hhfebtw=a+b*Hhpbtw; Ghfebtw(u,v)=Hhfebtw*G(u,v);  
    end  
end  
ghpbtw=ifftshift(Ghpbtw);  
fhpbtw=uint8(real(ifft2(ghpbtw)));  
subplot(1,3,1);imshow(fhpbtw);title(' ������˹��ͨ');  
ghfebtw=ifftshift(Ghfebtw);  
fhfebtw=uint8(real(ifft2(ghfebtw)));  
subplot(1,3,2);imshow(fhfebtw);title('������˹��Ƶǿ���˲�');  
histeq_fhfebtw=histeq(fhfebtw,256);  
subplot(1,3,3);imshow(histeq_fhfebtw);title('���⻯���');