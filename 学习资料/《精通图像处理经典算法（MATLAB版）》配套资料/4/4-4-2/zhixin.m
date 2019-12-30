I = imread('coins.png');
L = logical(I);%将数据类型转换为逻辑类型
s  = regionprops(L, 'centroid'); %统计被标记的区域的面积分布
centroids = cat(1, s.Centroid);%获取质心
imshow(I);
