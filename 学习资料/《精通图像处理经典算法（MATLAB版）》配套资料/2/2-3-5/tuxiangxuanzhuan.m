I=imread('peppers.png');
I=rgb2gray(I);
subplot(2,2,1);
imshow(I);
title('原图');
I_rot30=imrotate(I,30,'nearest');  %旋转30度
subplot(2,2,2);
imshow(uint8(I_rot30));
title('旋转30度');
I_rot45=imrotate(I,45,'nearest');  %旋转45度
subplot(2,2,3);
imshow(uint8(I_rot45));
title('旋转45度');
I_rot60=imrotate(I,60,'nearest');  %旋转60度
subplot(2,2,4);
imshow(uint8(I_rot60));
title('旋转60度');
