f=imread('tt.bmp');
figure(1);
imshow(f);
se=strel('disk',1);%�����ṹԪ��
f1=imopen(f,se);%������
f2=imclose(f1,se);%������
figure(2),
imshow(f2);
f3=imclose(f,se);%������
f4=imopen(f3,se); %������
figure(3);
imshow(f4);
f5=f;
for k=2:3
se=strel('disk',k);%�����ṹԪ��
f5=imclose(imopen(f5,se),se);%��ִ�п����㣬��ִ�б�����
end
figure(4);
imshow(f5);
