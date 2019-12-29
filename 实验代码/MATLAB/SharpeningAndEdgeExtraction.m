img_rgb = imread('pi.jpeg');
img = rgb2gray(img_rgb);
% img=im2double(img);  %将f转换为归一化的double类图像
figure();
imshow(img);
%进行均值滤波
a_bmp = filter2(fspecial('average',3),img)/255; %进行3*3均值滤波
imwrite(a_bmp,'A.bmp');
%%边缘提取
bw1 = edge(a_bmp,'sobel');
bw2 = edge(a_bmp,'roberts');
bw3 = edge(a_bmp,'log');
bw4 = edge(a_bmp,'canny');
figure
subplot(2,2,1); imshow(bw1);title('sobel算子');
subplot(2,2,2);imshow(bw2);title('roberts算子');
subplot(2,2,3);imshow(bw3);title('log算子');
subplot(2,2,4);imshow(bw4);title('canny算子');

%空域锐化
p1 =fspecial('sobel');
figure();
add1 =imfilter(a_bmp,p1);
out1=add1+a_bmp;
imshow(out1);
title('sobel锐化结果');

p2 =fspecial('prewitt');
figure();
add2 =imfilter(a_bmp,p2);
out2=add2+a_bmp;
imshow(out2);
title('prewitt锐化结果');

p3 =fspecial('laplacian');
figure();
add3 =imfilter(a_bmp,p3);
out3=add3+a_bmp;
imshow(out3);
title('laplacian锐化结果');

%进行高斯滤波及频域锐化；
%图像的边缘、细节主要位于高频部分，而图像的模糊是由于高频成分弱化而产生的。

gaus=fspecial('gaussian', [3,3], 1);
figure
gausout=imfilter(a_bmp,gaus,'replicate');
imshow(gausout)
title('高斯频域滤波');

f= double(img);[r,c]=size(f);  
F=fft2(f);G=fftshift(F);  
d0=15; %半径范围  
n=2;%巴特沃斯阶次  
a=0.2;b=2.0; %高频强调滤波传递函数系数  
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
subplot(1,3,1);imshow(fhpbtw);title(' 巴特沃斯高通');  
ghfebtw=ifftshift(Ghfebtw);  
fhfebtw=uint8(real(ifft2(ghfebtw)));  
subplot(1,3,2);imshow(fhfebtw);title('巴特沃斯高频强调滤波');  
histeq_fhfebtw=histeq(fhfebtw,256);  
subplot(1,3,3);imshow(histeq_fhfebtw);title('均衡化结果');