function Img_duozhen
mri=uint8(zeros(128,128,1,27));
for frame=1:27
[mri(:,:,:,frame),map]=imread('mri.tif',frame);
%��ÿһ֡�����ڴ���
end
montage(mri,map);