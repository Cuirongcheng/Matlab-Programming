clear all
close all
M=imread('0.jpg');
ss=rgb2gray(M);                       
 figure
 imshow(ss);  
 
 [m n]=size(ss);
 for i=1:m*n
 if ss(i)>250
ss(i)=250;
end
  end                              
 s=double(ss)+1;            
 x=[1 2 3 4];
g1=zeros(m,n);                   
g2=zeros(m,n);
g3=zeros(m,n);
g4=zeros(m,n);

yy1=zeros(m,n);
yy2=zeros(m,n);
yy3=zeros(m,n);
yy4=zeros(m,n);

y1=zeros(m,n);
y2=zeros(m,n);
y3=zeros(m,n);
y4=zeros(m,n);

for j=1:m*n                  
a1=mod(2*j,251);
a2=mod(3*j,251);
f=[a1 a2 s(j)];
g1(j)=polyval(f,x(1));
yy1(j)=mod(g1(j),251);
g2(j)=polyval(f,x(2));
yy2(j)=mod(g2(j),251);
g3(j)=polyval(f,x(3));
yy3(j)=mod(g3(j),251);
g4(j)=polyval(f,x(4));
yy4(j)=mod(g4(j),251);

end

y1=uint8(yy1-1)
y2=uint8(yy2-1);
y3=uint8(yy3-1);
y4=uint8(yy3-1);

figure,imshow(y1);               
figure,imshow(y2)
figure,imshow(y3);
figure,imshow(y4);
 
             
l1=x(2)*x(3)/[(x(1)-x(2))*(x(1)-x(3))];
l2=x(1)*x(3)/[(x(2)-x(1))*(x(2)-x(3))];
l3=x(1)*x(2)/[(x(3)-x(1))*(x(3)-x(2))];
rr1=zeros(m,n);
r=zeros(m,n);
for j=1:m*n
rr1(j)=mod(yy1(j)*l1+yy2(j)*l2+yy3(j)*l3,251);
end

r=uint8(rr1-1);
figure,imshow(r);         
