function  location=minrectangle(image)
Label=bwlabel(image); % 标注二值图像中的连通区域
area_num=regionprops(Label,'Area');
len_area=length(area_num);% 计算连通区域的个数
%找出包含相应区域的最小矩形
area_bounding=regionprops(Label,'BoundingBox'); 
max_ind=1;
max_num=area_num(1).Area;
for i=1:len_area          %找出矩形面积最大的区域
if max_num<area_num(i).Area
     max_num=area_num(i).Area;
     max_ind=i;
end
end
area=area_num(max_ind).Area;    %目标区域面积
%计算目标区域的长宽比
Ration=area_bounding(max_ind).BoundingBox(4)/area_bounding(max_ind).BoundingBox(3);    
H1 = Ration;
%给出计算之后的几个特征量所需的相关量
location=[area_bounding(max_ind).BoundingBox area Ration];
format short g, location ;



