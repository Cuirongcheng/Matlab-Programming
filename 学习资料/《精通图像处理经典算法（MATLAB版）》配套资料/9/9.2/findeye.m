function eye = findeye(bImage,x,y,w,h)   
part = zeros(h,w);   
% ��ֵ��   
for i = y:(y+h)   
    for j = x:(x+w)   
        if bImage(i,j) == 0   
            part(i-y+1,j-x+1) = 255;   
        else   
            part(i-y+1,j-x+1) = 0;   
        end   
    end   
end   
[L,num] = bwlabel(part,8);   
% ������������������ϵľ�������Ϊ���۾�   
if num < 2   
    eye = 0;   
else   
    eye = 1;   
end
