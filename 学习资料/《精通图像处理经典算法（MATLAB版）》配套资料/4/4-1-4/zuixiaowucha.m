I = imread('coins.png');
subplot(121);imshow(I);title('原图');
out_im=I;
MAX=double(max(I(:)));%求得最大值
 [M,N]=size(I); %得到图像的大小
tab(1:MAX+1)=0;
h=imhist(I);
h=h/(M*N);            %直方图归一化
 
p=0.0;u=0.0;
for i=0:MAX
    p=p+h(i+1);
    u=u+h(i+1)*i;
end
 
for t=0:MAX
    p1=0.0;u1=0.0;
    k1=0.0;k2=0.0;
    pp1=0.0;pp2=0.0;
    kk1=0.0;kk2=0.0;
    for i=0:t             %计算一阶统计矩  
       p1=p1+h(i+1);
       u1=u1+h(i+1)*i;
    end
    if((p-p1)~=0)
       u2=(u-u1)/(p-p1);
    else
       u2=0;
    end
    if(p1~=0)     
        u1=u1/p1;     
    else
        u1=0;
    end
   
    
    for j=0:t                %计算2阶统计矩
        k1=k1+(j-u1)*(j-u1)*h(j+1);
    end
    for m=t+1:MAX
        k2=k2+(m-u2)*(m-u2)*h(m+1);
    end
        
    if(p1~=0)       
        k1=sqrt(k1/p1);
        pp1=p1*log(p1);
    end   
    
    if((p-p1)~=0)
        k2=sqrt(k2/(p-p1));
        pp2=(p-p1)*log(p-p1);
    end
    if(k1~=0)
       kk1=p1*log(k1);
    end
    if((k2)~=0)
       kk2=(p-p1)*log(k2);
    end       
    tab(t+1)=1+2*(kk1+kk2)-2*(pp1+pp2);      %判别函数
end
 
Min=min(tab);
threshold=find(tab==Min);                 %最佳阈值
for i=1:M
    for j=1:N
        if (out_im(i,j)>threshold)
            out_im(i,j)=255;
        else
            out_im(i,j)=0;
        end
    end
end
subplot(122);imshow(out_im);title('最小误差法阈值分割');
