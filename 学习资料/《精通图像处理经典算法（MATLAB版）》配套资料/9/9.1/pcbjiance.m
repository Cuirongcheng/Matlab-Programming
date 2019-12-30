function pcbjiance()
dcpcbrgb=imread('dcpcbrgb1.bmp');%读入待检测pcb图像
figure()
imshow(dcpcbrgb);
title('待检测pcb');
t=rgb2gray(dcpcbrgb);%待检测pcb图像灰度化
lvbo=medfilt2(t);%中值滤波
uu=im2bw(lvbo);%二值化
u=bwmorph(uu,'spur',8);%去除物体小的分支
p=bwmorph(u,'fill');%填充孤立黑点
dc=bwmorph(p,'clean');%去除孤立亮点
figure()
imshow(dc);
title('预处理后待检测pcb图像');
goldenpcbrgb=imread('hh.bmp');%读入标准pcb图像
biaozhungray=rgb2gray(goldenpcbrgb);%标准pcb图像灰度化
bj=im2bw(biaozhungray);%二值化
figure()
imshow(goldenpcbrgb);
title('标准pcb');
figure()
imshow(bj);
title('标准pcb二值化图像')
dc_rect=[80 370 150 130];%待检测pcb图像中选取参与互相关计算区域的矩阵
bj_rect=[40 320 200 190];% 标准pcb图像中选取参与互相关计算区域的矩阵
bj_sub=imcrop(bj,bj_rect);%剪裁标准pcb图像
  max_c=0;%初始化互相关最大值
 for rr=-2:1:2%待检测pcb图像依次旋转的角度（步进值可调）
    dc_rot=imrotate(dc,rr,'nearest');%待检测pcb图像旋转，使用邻近插值法
    dc_sub=imcrop(dc_rot,dc_rect);%裁剪带检测pcb图像
    c=normxcorr2(dc_sub,bj_sub);%计算互相系数
[max_c1,imax1]=max(abs(c(:)));%max_c1为系数最大值，imax1为系数最大值对应的位置下标
   if(max_c1>max_c)%每一次循环的最大值进行比较
      max_c=max_c1;%取最大的值
      angle=rr;%把取得最大值时对应的旋转角度赋给angle
   end
end
dc_tz=imrotate(dc,angle,'nearest');%按angle角，对待检测pcb图像进行旋转修正
dc_tz_sub=imcrop(dc_tz,dc_rect);%此时两幅图像的轴向已平行，重新计算互相关系数
cc=normxcorr2(dc_tz_sub,bj_sub);%
 [max_cc,imax]=max(abs(cc(:)));%
 [ypeak,xpeak]=ind2sub(size(cc),imax);%将下标转化为行列的表示形式  
yd=[ypeak-(dc_rect(4)+1) xpeak-(dc_rect(3)+1)];%子图需移动的量
 bj_dc=[yd(1)+bj_rect(2) yd(2)+bj_rect(1)];%标准pcb图像在调整后的待检测图像中的坐标
 xz=[bj_dc(1)-dc_rect(2) bj_dc(2)-dc_rect(1)];%像素修正值
 dc_qu_rect=[1-xz(2) 1-xz(1) size(bj,2)-1 size(bj,1)-1]; %调整后的待检测图像中选取与标准图像同等大小的区域矩阵
 dc_qu=imcrop(dc_tz,dc_qu_rect);%裁剪调整后的待检测pcb图像
 figure()
imshow(dc_qu)
title('匹配后的待检测pcb图像')
yihuo=xor(bj,dc_qu);%图像异或运算
MN=[3 3]; 
se=strel('rectangle',MN);%定义结构元素
imr=imerode(yihuo,se);%腐蚀运算
imd=imdilate(imr,se);%膨胀运算
rgb=label2rgb(imd,@autumn,'g');%标注对象变为彩色，采用autumn映射表，背景为绿色
biaoji=imlincomb(.6,rgb,.4,goldenpcbrgb);%将两幅图像按比例线性组合
figure()
imshow(biaoji);
title('缺陷标注'); 
a1=bj;
b1=dc_qu;
c1=a1-b1;
c2=b1-a1;
MN=[5 3];
se=strel('rectangle',MN);
h1=imerode(c1,se);
h2=imerode(c2,se);
[i,j]=find(h1==1);
p1=bwselect(c1,j,i,8);
[q1,mu1]=bwlabel(p1);
num1=0;
num1=mu1;
hpqs=0;%焊盘缺失数初始化 
dxqs=0;%导线缺失数初始化
aoxian=0;%凹陷数初始化
duan4lu=0;%断路数初始化
for k1=1:num1
r1=zeros(size(q1));
ij1=find(q1==k1);
r1(ij1)=1;
[i1,j1]=find(q1==k1);
f1=bwselect(a1,j1,i1,8);
if bweuler(r1)==0;
    hpqs=hpqs+1;
else 
    if bwarea(r1)>500
        dxqs=dxqs+1;
    else 
      s1=f1-r1;
      if bweuler(s1)==bweuler(f1)
          aoxian=aoxian+1;
       else bweuler(s1)>bweuler(f1)
         duan4lu=duan4lu+1;  
      end
    end
end
end
[i0,j0]=find(h2==1);
p2=bwselect(c2,j0,i0,8); 
[q2,mu2]=bwlabel(p2);
num2=0;
num2=mu2;
hpds=0; %焊盘阻塞数初始化
dxdy=0;%导线多余数初始化
tuqi=0;%突起数初始化
duan3lu=0;%短路数初始化
tongban=0;%铜斑数初始化
for k2=1:num2
r2=zeros(size(q2));
ij2=find(q2==k2);
r2(ij2)=1;
[i2,j2]=find(q2==k2);
f2=bwselect(b1,j2,i2,8);
if bwarea(f2)-bwarea(r2)<=10
    tongban=tongban+1;
else 
    if bwarea(r2)>300
        dxdy=dxdy+1;
    else 
      s2=f2-r2;
      if bweuler(s2)==bweuler(f2)
          tuqi=tuqi+1;  
       elseif bweuler(s2)>bweuler(f2)
         duan3lu=duan3lu+1;    
        else bweuler(s2)<bweuler(f2)
        hpds=hpds+1;    
       end
    end
end
end
hpqs
dxqs
aoxian
duan4lu
hpds
dxdy
tuqi
duan3lu
tongban