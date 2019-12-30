img_dst = imread('circles.png');
[x,y]=size(img_dst);
BW = bwperim(img_dst,8);%提取二值图像边缘
P1=0;
Ny=0; % 垂直方向连续周长像素点个数
for i=1:x
   for j=1:y
     if (BW(i,j)>0)
       P2=j;
       if ((P2-P1)==1) %判断是否为垂直方向连续的周长像素点
       Ny=Ny+1;
       end
     P1=P2;
     end
    end
end
%水平方向连续周长像素点
P1=0;
Nx=0; % 记录水平方向连续周长像素点的个数
for j=1:y
    for i=1:x
       if (BW(i,j)>0)
          P2=i;
         if ((P2-P1)==1) % 判断是否为水平方向连续的周长像素点
            Nx=Nx+1;
         end
         P1=P2;
       end
     end
end 
L=Nx+Ny %隙码周长
