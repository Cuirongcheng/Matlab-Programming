I = imread('coins.png');
L = logical(I);%����������ת��Ϊ�߼�����
s  = regionprops(L, 'centroid'); %ͳ�Ʊ���ǵ����������ֲ�
centroids = cat(1, s.Centroid);%��ȡ����
imshow(I);
