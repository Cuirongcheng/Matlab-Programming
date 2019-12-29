%读入原始图像和水印图像并显示
I=imread('lena512.jpg');
figure(1);
axes(handles.axes1);%%使用图像，操作在坐标1
imshow(I);
title('原始图像');
J=imread('xiaohui64.jpg');
axes(handles.axes2);%%使用图像，操作在坐标2
imshow(J);
title('水印图像');
%对水印图像进行arnold置乱预处理
H=double(J);
tempImg=H; %图像矩阵赋给tempImg
for n=1:5  %置乱次数
for u=1:64
for v=1:64
temp=tempImg(u,v);
ax=mod((u-1)+(v-1),64)+1;%新像素行位置
ay=mod((u-1)+2*(v-1),64)+1;%新像素列位置
outImg(ax,ay)=temp;
end
end
tempImg=outImg;
end
G=uint8(outImg);%得到置乱后的水印图像
%嵌入水印
for p=1:64
for q=1:64 %p、q都是1到64，是因为有64*64个8*8的块，每次循环处理一个块
BLOCK1=I(((p-1)*8+1):p*8,((q-1)*8+1):q*8);%每个8*8的块
BLOCK1=dct2(BLOCK1);%做2维的dct变换
BLOCK1(4,5)=BLOCK1(4,5)+0.2*G(p,q);%在每块dct系数的4行5列处嵌入水印，系数可调
W(((p-1)*8+1):p*8,((q-1)*8+1):q*8)=idct2(BLOCK1);%做dct反变换
end
end
%显示嵌入水印后的图像
imwrite(uint8(W), 'lena_mark.jpg ', 'jpg');
axes(handles.axes3);%%使用图像，操作在坐标3
imshow('lena_mark.jpg');
title('嵌入水印后的图像');
for p=1:64
for q=1:64
BLOCK1=W(((p-1)*8+1):p*8,((q-1)*8+1):q*8);
BLOCK2=I(((p-1)*8+1):p*8,((q-1)*8+1):q*8);
BLOCK1=dct2(BLOCK1);
BLOCK2=dct2(BLOCK2);
Y(p,q)=(BLOCK1(4,5)-BLOCK2(4,5))/0.2;
end
end
% 对水印进行arnold反置乱
for n=1:43 % 循环次数为48-5
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
%显示提取出来的水印图像
imwrite(uint8(Y), 'watermark.jpg ', 'jpg');
axes(handles.axes4);%%使用图像，操作在坐标4
imshow('watermark.jpg');
title('提取出来的水印图像');
