Im=imread('image1.jpg');
ImgR=double(Im(:, :, 1));
ImgG=double(Im(:,:,2));
fR=fft2(ImgR); %傅里叶变换
fG=fft2(ImgG);
fG2=reshape(fG,1,[]);
fR1=reshape(fR,1,[]);
flag1=angle(fR1)./angle(fG2);
for i0=1:250*250
if flag1(indexG(initPos+2*i0-2)) < 0 %indexG：密钥位置
tp(i0)=0;
else
tp(i0)=1;
end
end
water=reshape(tp,W1,W2);
subplot(2,2,4);
imshow(water);
title('提取的水印');