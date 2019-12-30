PartPicture = imread('2.jpg');%��ȡͼ��2
AllPicture = imread('1.jpg');% ��ȡͼ��1
figure; subplot(121)
imshow(PartPicture)%��ʾͼ��
subplot(122),
imshow(AllPicture)%��ʾͼ��
rect_PartPicture = [111 33 65 58];%ȷ��ͼ��2������
rect_AllPicture = [163 47 143 151];%ȷ��ͼ��1������
sub_PartPicture=imcrop(PartPicture,rect_PartPicture);%�ü�ͼ��2
sub_AllPicture = imcrop(AllPicture,rect_AllPicture);%�ü�ͼ��1
figure;  subplot(121),
imshow(sub_PartPicture)%��ʾ�ü������ͼ��
subplot(122),
imshow(sub_AllPicture)% ��ʾ�ü������ͼ��
c = normxcorr2(sub_PartPicture(:,:,1),...
    sub_AllPicture(:,:,1));%�Ժ�ɫɫ�����й�һ�������
figure, 
surf(c), %��ʾ������ͼ��Ĺ�һ�������
shading flat
[max_c, imax] = max(abs(c(:)));%ȷ����һ����������ֵ����λ��
[ypeak, xpeak] = ind2sub(size(c),imax(1));%��һά�����Ϊ2ά
corr_offset = [(xpeak-size(sub_PartPicture,2))
               (ypeak-size(sub_PartPicture,1))];%���������ƫ����?
rect_offset = [(rect_AllPicture(1)-rect_PartPicture(1))               (rect_AllPicture(2)-rect_PartPicture(2))];%λ�������ƫ����
offset = corr_offset + rect_offset;%�ܵ�ƫ����
xoffset = offset(1);%x�᷽���ƫ����?
yoffset = offset(2);%y�᷽���ƫ����?
xbegin = round(xoffset+1);%x����ʼλ��
xend   = round(xoffset+ size(PartPicture,2));%x?����λ��
ybegin = round(yoffset+1);%y����ʼλ��
yend   = round(yoffset+size(PartPicture,1));%y�����λ��
extracted_PartPicture = AllPicture(ybegin:yend,xbegin:xend,:);%��ȡ��ͼ
if isequal(PartPicture,extracted_PartPicture)
   disp('onion.png was extracted from peppers.png')%�ж���ͼ�Ƿ���ͬ
end
recovered_PartPicture = uint8(zeros(size(AllPicture)));
recovered_PartPicture(ybegin:yend,xbegin:xend,:)=PartPicture;%�ָ���ͼ
figure, 
imshow(recovered_PartPicture)%��ʾ
[m,n,p] = size(AllPicture);
 mask = ones(m,n);
i = find(recovered_PartPicture(:,:,1)==0);
mask(i) = .2; %��ʹ�ò�ͬ��ֵ����ʵ��
figure, 
imshow(AllPicture(:,:,1)) %��ʾ���ɫɫ��
hold on
h = imshow(recovered_PartPicture); % ��ʾ�ָ���ͼ��
set(h,'AlphaData',mask)
