img = imread('circles.png');
img = im2bw(img);
img1 = bwperim(img,8);%�������ͼ���еı�Ե��
[m,n]=size(img);
P = 0;%�ܳ���ʼ��
for i = 1:m
    for j = 1:n
        if (img1(i,j)>0)
            P = P + 1;    %ͳ�Ʊ߽���ռ���ص�
        end
    end
end
