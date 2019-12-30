I = imread('coins.png');
subplot(121);imshow(I);title('原图');
I = im2double(I);
T = 0.5 * (min(I(:))+max(I(:)));
U = false;
while ~U
    g = I >= T;
    TT = 0.5 * (mean(I(g))+mean(I(~g)));
    if (abs(T - TT)< 0.1) %其中T为收敛阈值，不同的T值下，图像分割效果不同。
       U = 1;
    end
    T = TT;
end
J = im2bw(I,T);
subplot(122);imshow(J);title('迭代法阈值分割');
