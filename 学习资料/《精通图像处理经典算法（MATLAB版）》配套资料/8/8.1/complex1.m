function CM=complex1(image_BW)
BW=edge(image_BW,'roberts');
A=minrectangle(image_BW);
t=A(5);
% figure
% imshow(BW)
% title('\fontsize{20}��Ե�����')
[x y]=find(BW>0);
m=size(x,1);
CM=m/t;
