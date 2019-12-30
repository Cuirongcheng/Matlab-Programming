% function [ Arnold192 ] 
i=imread('zhiwu.jpg');%进行Arnold变换的原始图片
k=imresize(i,[256,256]);%图片尺寸变换为256×256的
j=rgb2gray(k);%图片进行灰度化处理
subplot(1,2,1),imshow(j),title('原始图片')
size_j=size(j);
q=size_j;
for t=1:2
for a=1:q
for b=1:q
h(mod(a+b-2,q)+1,mod(a+2*b-3,q)+1)=j(a,b);%进行矩阵变换
end
end
j=h;
end
for t=1:40
for a=1:q
for b=1:q
h(mod(a+b-2,q)+1,mod(a+2*b-3,q)+1)=j(a,b);
end
end
j=h;
end
for t=1:50
for a=1:q
for b=1:q
h(mod(a+b-2,q)+1,mod(a+2*b-3,q)+1)=j(a,b);
end
end
j=h;
end
for t=1:50
for a=1:q
for b=1:q
h(mod(a+b-2,q)+1,mod(a+2*b-3,q)+1)=j(a,b);
end
end
j=h;
end
for t=1:50
for a=1:q
for b=1:q
h(mod(a+b-2,q)+1,mod(a+2*b-3,q)+1)=j(a,b);
end
end
j=h;
end
subplot(1,2,2),imshow(j),title('192次置乱图片')%输出一个变换周期后的图片


% end

