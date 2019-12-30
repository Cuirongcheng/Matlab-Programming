clear,clc;
close all;
cr=0.5;
initialimage=imread(' cameraman.tif');           %读取原图像
imshow(initialimage);                      %显示原图像
title('原始图像')
initialimage=double(initialimage);
t=dctmtx(16);
dctcoe=blkproc(initialimage,[16,16],'P1*x*P2',t,t');  %将图像分成8×8子图像，求DCT
coevar=im2col(dctcoe,[16,16],'distinct');          %将变换系数矩阵重新排列
coe=coevar;
[y,ind]=sort(coevar);
[m,n]=size(coevar);
snum=256-256*cr;                %根据压缩比确定要将系数变为0的个数
for i=1:n
    coe(ind(1:snum),i)=0;        %将最小的snum个变换系数设为0
end 
b2=col2im(coe,[16,16],[256,256],'distinct');      %重新排列系数矩阵
i2=blkproc(b2,[16,16],'P1*x*P2',t',t);            %求逆离散余弦变换（IDCT）
i2=uint8(i2);
figure
imshow(i2)                                %显示压缩后的图像。
title('压缩图像')
