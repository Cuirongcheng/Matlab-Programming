PartPicture = imread('2.jpg');%读取图像2
AllPicture = imread('1.jpg');% 读取图像1
figure; subplot(121)
imshow(PartPicture)%显示图像
subplot(122),
imshow(AllPicture)%显示图像
rect_PartPicture = [111 33 65 58];%确定图像2的区域
rect_AllPicture = [163 47 143 151];%确定图像1的区域
sub_PartPicture=imcrop(PartPicture,rect_PartPicture);%裁剪图像2
sub_AllPicture = imcrop(AllPicture,rect_AllPicture);%裁剪图像1
figure;  subplot(121),
imshow(sub_PartPicture)%显示裁剪后的子图像
subplot(122),
imshow(sub_AllPicture)% 显示裁剪后的子图像
c = normxcorr2(sub_PartPicture(:,:,1),...
    sub_AllPicture(:,:,1));%对红色色带进行归一化互相关
figure, 
surf(c), %显示两幅子图像的归一化互相关
shading flat
[max_c, imax] = max(abs(c(:)));%确定归一化互相关最大值及其位置
[ypeak, xpeak] = ind2sub(size(c),imax(1));%把一维坐标变为2维
corr_offset = [(xpeak-size(sub_PartPicture,2))
               (ypeak-size(sub_PartPicture,1))];%利用相关找偏移量?
rect_offset = [(rect_AllPicture(1)-rect_PartPicture(1))               (rect_AllPicture(2)-rect_PartPicture(2))];%位置引起的偏移量
offset = corr_offset + rect_offset;%总得偏移量
xoffset = offset(1);%x轴方向的偏移量?
yoffset = offset(2);%y轴方向的偏移量?
xbegin = round(xoffset+1);%x轴起始位置
xend   = round(xoffset+ size(PartPicture,2));%x?结束位置
ybegin = round(yoffset+1);%y轴起始位置
yend   = round(yoffset+size(PartPicture,1));%y轴结束位置
extracted_PartPicture = AllPicture(ybegin:yend,xbegin:xend,:);%提取子图
if isequal(PartPicture,extracted_PartPicture)
   disp('onion.png was extracted from peppers.png')%判断两图是否相同
end
recovered_PartPicture = uint8(zeros(size(AllPicture)));
recovered_PartPicture(ybegin:yend,xbegin:xend,:)=PartPicture;%恢复子图
figure, 
imshow(recovered_PartPicture)%显示
[m,n,p] = size(AllPicture);
 mask = ones(m,n);
i = find(recovered_PartPicture(:,:,1)==0);
mask(i) = .2; %可使用不同的值进行实验
figure, 
imshow(AllPicture(:,:,1)) %显示其红色色带
hold on
h = imshow(recovered_PartPicture); % 显示恢复的图像
set(h,'AlphaData',mask)
