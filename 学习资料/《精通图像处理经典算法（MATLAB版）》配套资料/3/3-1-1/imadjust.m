I = imread('coins.png');
subplot(121);imshow(I);
title('ԭͼ');
J = imadjust(I);
subplot(122);imshow(J);
title('�Ҷȵ���');
