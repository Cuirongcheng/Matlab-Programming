function H=character_distill(image_BW)
A=minrectangle(image_BW);%最小外接矩形
TR = image_BW(A(2):A(2)+A(4)-1,A(1):A(1)+A(3)-1);
figure
imshow(TR)
title('检测区域确定')
H1=A(6);
H2=complex1(TR);%复杂度
H3=tight_measure(image_BW);%紧凑度
H=[H1 H2 H3 ];



