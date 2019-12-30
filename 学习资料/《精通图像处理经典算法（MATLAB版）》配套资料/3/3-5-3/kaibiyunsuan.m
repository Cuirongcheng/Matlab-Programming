f=imread('tt.bmp');
figure(1);
imshow(f);
se=strel('disk',1);%构建结构元素
f1=imopen(f,se);%开运算
f2=imclose(f1,se);%闭运算
figure(2),
imshow(f2);
f3=imclose(f,se);%闭运算
f4=imopen(f3,se); %开运算
figure(3);
imshow(f4);
f5=f;
for k=2:3
se=strel('disk',k);%构建结构元素
f5=imclose(imopen(f5,se),se);%先执行开运算，再执行闭运算
end
figure(4);
imshow(f5);
