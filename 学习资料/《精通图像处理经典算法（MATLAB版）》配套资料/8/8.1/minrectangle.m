function  location=minrectangle(image)
Label=bwlabel(image); % ��ע��ֵͼ���е���ͨ����
area_num=regionprops(Label,'Area');
len_area=length(area_num);% ������ͨ����ĸ���
%�ҳ�������Ӧ�������С����
area_bounding=regionprops(Label,'BoundingBox'); 
max_ind=1;
max_num=area_num(1).Area;
for i=1:len_area          %�ҳ����������������
if max_num<area_num(i).Area
     max_num=area_num(i).Area;
     max_ind=i;
end
end
area=area_num(max_ind).Area;    %Ŀ���������
%����Ŀ������ĳ����
Ration=area_bounding(max_ind).BoundingBox(4)/area_bounding(max_ind).BoundingBox(3);    
H1 = Ration;
%��������֮��ļ�������������������
location=[area_bounding(max_ind).BoundingBox area Ration];
format short g, location ;



