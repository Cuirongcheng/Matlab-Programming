I = imread('coins.png');
subplot(121);imshow(I);
title('ԭͼ');
J = imadjust(I,[0.3;0.8],[0.6;1]);
subplot(122);imshow(J);
title('ָ���Ҷȷ�Χ��ͼ����ǿ');
