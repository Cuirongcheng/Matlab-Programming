function luoji_yunsuan
A = imread('circles.png'); 
subplot(231);imshow(A);
title('图1');
[m,n] = size (A);
B = imread('coins.png');
B1= im2bw(B);
subplot(232);imshow(B1);
title('图2');
B1 = imresize(B1,[m,n]);
C_And = A & B1;
subplot(233);imshow(C_And);
title('与运算');
C_Or = A | B1;
subplot(234);imshow(C_Or);
title('或运算');
C_Not = ~ A ;
subplot(235);imshow(C_Not);
title('图A的非运算');
C_Xor = xor(A,B1);
subplot(236);imshow(C_Xor);
title('异或运算');




