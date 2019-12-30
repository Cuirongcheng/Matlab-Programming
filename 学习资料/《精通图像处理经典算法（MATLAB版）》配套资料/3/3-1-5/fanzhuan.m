I = imread(' kids.tif ');
subplot(121);imshow(I);
title('Ô­Í¼');
J = imadjust(I,[0 1],[1,0]);
subplot(122);imshow(J);
title('Í¼ÏñÇó·´');
