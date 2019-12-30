I=imread('moon.tif');
subplot(131);imshow(I);title('原图');
I = double(I);
I_enlarge=imresize(I,5,'nearest');   %放大5倍
subplot(132);imshow(uint8(I_enlarge));title('放大五倍');
I_reduce=imresize(I,0.5,'nearest');  %缩小2倍
subplot(133);imshow(uint8(I_reduce));title('缩小两倍');
