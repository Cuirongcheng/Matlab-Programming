c=imread('hua.jpg');
t=rgb2gray(c);
d=histeq(t);
d=double(d);
[M N]=size(d);    
R(:,:)=r*d(:,:);%��ɫ����
G(:,:)=g*d(:,:);%��ɫ����
B(:,:)=b*d(:,:);%��ɫ����
for i=1:M
    for j=1:N
        OUT(i,j,1)=R(i,j);
        OUT(i,j,2)=G(i,j);
        OUT(i,j,3)=B(i,j);
    end
end
OUT=OUT/256;%��һ��
figure(3),imshow(OUT)
