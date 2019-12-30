I=imread('cameraman.tif');
figure,imshow(I),title('原图')
I=double(I);
[M,N]=size(I);
 [y,x]=getpts;   %获取生长起始点
x1=round(x);         
y1=round(y);         
seed=I(x1,y1);           %将生长点保存
Y=zeros(M,N);          %新建输出图像
Y(x1,y1)=1;            
sum=seed;             %存储符合条件点的灰度值的和
suit=1;                 %存储符合生长的点个数
count=1;               %记录每次判断一点周围的点符合条件的新点的数目
threshold=100;       %设定生长阈值
while count>0
 s=0;                  
count=0;
 for i=1:M
   for j=1:N
     if Y(i,j)==1
      if (i-1)>0 && (i+1)<(M+1) && (j-1)>0 && (j+1)<(N+1) %防止越界     
 for u= -1:1                               %判断邻域范围内像素是否符合条件
        for v= -1:1                               
          if  Y(i+u,j+v)==0 & abs(I(i+u,j+v)-seed)<=threshold  %生长条件           Y(i+u,j+v)=1;                       %符合条件即输出
             count=count+1;                                 
             s=s+I(i+u,j+v);                      
          end
        end  
       end
      end
     end
   end
 end
suit=suit+count;                                   
sum=sum+s;        %将s加入符合点的灰度值中                           
seed=sum/suit; %计算新灰度平均值                                   
end
figure,imshow(Y),title('区域生长法')
