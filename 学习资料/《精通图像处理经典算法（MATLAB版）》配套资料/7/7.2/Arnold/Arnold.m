% function [ Arnold ] 

i=imread('zhiwu.jpg');%����Arnold�任��ԭʼͼƬ
k=imresize(i,[380,380]);%ͼƬ�ߴ�任Ϊ380��380��
j=rgb2gray(k);%ͼƬ���лҶȻ�����
subplot(1,4,1),imshow(j),title('ԭʼͼƬ')
size_j=size(j);
q=size_j;
for t=1:10
for a=1:q
for b=1:q
h(mod(a+b-2,q)+1,mod(a+2*b-3,q)+1)=j(a,b);%���о���任
end
end
j=h;
end
subplot(1,4,2),imshow(j),title('10������ͼƬ')%���10������ͼƬ
for t=1:40
for a=1:q
for b=1:q
h(mod(a+b-2,q)+1,mod(a+2*b-3,q)+1)=j(a,b);
end
end
j=h;
end
subplot(1,4,3),imshow(j),title('50������ͼƬ')
for t=1:40
for a=1:q
for b=1:q
h(mod(a+b-2,q)+1,mod(a+2*b-3,q)+1)=j(a,b);
end
end
j=h;
end
subplot(1,4,4),imshow(j),title('90������ͼƬ')%���һ���任���ں��ͼƬ

% end

