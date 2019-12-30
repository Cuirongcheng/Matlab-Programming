% function [ IArnold ] 
i=imread('zhiwu.jpg');
k=imresize(i,[250,250]);
j=rgb2gray(k);
h=dct2(j);
subplot(1,2,1),imshow(h),title('ÖÃÂÒÍ¼Æ¬')
p=idct2(h)/255;
subplot(1,2,2),imshow(p),title('ÖÃÂÒ»Ö¸´')

% end

