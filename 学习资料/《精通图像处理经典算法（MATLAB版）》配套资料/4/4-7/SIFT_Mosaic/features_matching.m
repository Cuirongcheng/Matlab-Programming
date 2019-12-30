function [pt1,pt2] = features_matching( database, desc,  dist_ratio , pos1 , pos2 )
num = 1;
for k = 1:size(desc,1)
    dist   = sqrt(sum((database.desc - repmat(desc(k,:),size(database.desc,1),1)).^2,2));
    [B,IX] = sort(dist);
    if B(1)/B(2) >= dist_ratio %nn2_dist >= dist_ratio
        idx = 0;
    else
        pt22(num,:) = pos2(k,:);
        pt11(num,:) = pos1(IX(1),:);
        num = num + 1;
    end
end
[B1,IX] = sort(pt11(:,1));
Pt1 = pt11(IX,:);
Pt2 = pt22(IX,:);  
k = 1;
for i = 2:num-1
    Dist =  sqrt((Pt1(i,1) - Pt1(i-1,1))^2 +(Pt1(i,2) - Pt1(i-1,2))^2);
    if Dist > 3
        pt1(k,:) = Pt1(i,:);
        pt2(k,:) = Pt2(i,:);
        k = k + 1;
    end
end

[B1,IX] = sort(pt2(:,1));
Pt1 = pt1(IX,:);
Pt2 = pt2(IX,:);  
kk = 1;
pt1 = [];
pt2 = [];
for i = 2:k-1
    Dist =  sqrt((Pt2(i,1) - Pt2(i-1,1))^2 +(Pt2(i,2) - Pt2(i-1,2))^2);
    if Dist > 3
        pt1(kk,:) = Pt1(i,:);
        pt2(kk,:) = Pt2(i,:);
        kk = kk + 1;
    end
end


%pos2是按照顺序来的，POS1是检索后的结果