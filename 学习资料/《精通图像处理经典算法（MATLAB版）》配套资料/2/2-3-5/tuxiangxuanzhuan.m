I=imread('peppers.png');
I=rgb2gray(I);
subplot(2,2,1);
imshow(I);
title('ԭͼ');
I_rot30=imrotate(I,30,'nearest');  %��ת30��
subplot(2,2,2);
imshow(uint8(I_rot30));
title('��ת30��');
I_rot45=imrotate(I,45,'nearest');  %��ת45��
subplot(2,2,3);
imshow(uint8(I_rot45));
title('��ת45��');
I_rot60=imrotate(I,60,'nearest');  %��ת60��
subplot(2,2,4);
imshow(uint8(I_rot60));
title('��ת60��');
