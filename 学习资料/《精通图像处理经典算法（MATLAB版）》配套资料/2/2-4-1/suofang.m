I=imread('moon.tif');
subplot(131);imshow(I);title('ԭͼ');
I = double(I);
I_enlarge=imresize(I,5,'nearest');   %�Ŵ�5��
subplot(132);imshow(uint8(I_enlarge));title('�Ŵ��屶');
I_reduce=imresize(I,0.5,'nearest');  %��С2��
subplot(133);imshow(uint8(I_reduce));title('��С����');
