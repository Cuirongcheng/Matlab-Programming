function zhouchang_main
i=bwperim(imread('circles.png'),8);%获取二值图像边界
c8=chain8(i);%8链码
sum1=0;sum2=0;
for k=1:length(c8)
    if c8(k)==0 ||c8(k)==2 ||c8(k)==4 ||c8(k)==6
        sum1=sum1+1;
    else
        sum2=sum2+1;
    end
end
L=sum1+sum2*sqrt(2)
%子函数：
%8连通链码
function out=chain8(I)
n=[0 1;-1 1;-1 0;-1 -1;0 -1;1 -1;1 0;1 1]; %设定标志
flag=1; %初始化输出链码串为空
cc=[];%找到起始点
[x y]=find(I==1);
x=min(x);
imx=I(x,:);
y=find(imx==1, 1 );
first=[x y];
dir=7;
while flag==1
          tt=zeros(1,8);
          newdir=mod(dir+7-mod(dir,2),8);
          for i=0:7
              j=mod(newdir+i,8)+1;
              tt(i+1)=I(x+n(j,1),y+n(j,2));
          end
    d=find(tt==1, 1 );
          dir=mod(newdir+d-1,8);
          %找到下一个像素点的方向码后补充在链码后面
    cc=[cc,dir];
    x=x+n(dir+1,1);y=y+n(dir+1,2);
    %判别链码的结束标志
    if x==first(1)&&y==first(2)
        flag=0;
    end
end
out=cc;
