% function [ Arnold192 ] 
i=imread('zhiwu.jpg');%����Arnold�任��ԭʼͼƬ
k=imresize(i,[256,256]);%ͼƬ�ߴ�任Ϊ256��256��
j=rgb2gray(k);%ͼƬ���лҶȻ�����
subplot(1,2,1),imshow(j),title('ԭʼͼƬ')
size_j=size(j);
q=size_j;
for t=1:2
for a=1:q
for b=1:q
h(mod(a+b-2,q)+1,mod(a+2*b-3,q)+1)=j(a,b);%���о���任
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
subplot(1,2,2),imshow(j),title('192������ͼƬ')%���һ���任���ں��ͼƬ


% end

