RGB = imread('9.jpg'); imshow(RGB);
g=rgb2gray(RGB); imshow(g);title('�Ҷ�ͼ��');
    r=RGB(:,:,1);figure,imshow(r);r=double(r);title('R�����Ҷ�ͼ')
    g=RGB(:,:,2);figure,imshow(g);g=double(g);title('G�����Ҷ�ͼ')
    b=RGB(:,:,3);figure,imshow(b);b=double(b);title('B�����Ҷ�ͼ')
 %����ɫ������ʾ  
RGB1=rgb2hsv(RGB);figure,imshow(RGB1);title('HSI ��ɫ�ռ��ɫͼ��')
    s=RGB1(:,:,1);figure,imshow(s);title('S�����Ҷ�ͼ')%s��
    h=RGB1(:,:,2);figure,imshow(h);title('H�����Ҷ�ͼ')%h�� 
    v=RGB1(:,:,3);figure,imshow(v);title('I�����Ҷ�ͼ')
