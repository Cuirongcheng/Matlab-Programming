I = imread('coins.png');
subplot(121);imshow(I);
title('原图');
J = imadjust(I);
subplot(122);imshow(J);
title('灰度调整');
