function H=character_distill(image_BW)
A=minrectangle(image_BW);%��С��Ӿ���
TR = image_BW(A(2):A(2)+A(4)-1,A(1):A(1)+A(3)-1);
figure
imshow(TR)
title('�������ȷ��')
H1=A(6);
H2=complex1(TR);%���Ӷ�
H3=tight_measure(image_BW);%���ն�
H=[H1 H2 H3 ];



