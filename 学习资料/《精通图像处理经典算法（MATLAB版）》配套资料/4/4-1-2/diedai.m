I = imread('coins.png');
subplot(121);imshow(I);title('ԭͼ');
I = im2double(I);
T = 0.5 * (min(I(:))+max(I(:)));
U = false;
while ~U
    g = I >= T;
    TT = 0.5 * (mean(I(g))+mean(I(~g)));
    if (abs(T - TT)< 0.1) %����TΪ������ֵ����ͬ��Tֵ�£�ͼ��ָ�Ч����ͬ��
       U = 1;
    end
    T = TT;
end
J = im2bw(I,T);
subplot(122);imshow(J);title('��������ֵ�ָ�');
