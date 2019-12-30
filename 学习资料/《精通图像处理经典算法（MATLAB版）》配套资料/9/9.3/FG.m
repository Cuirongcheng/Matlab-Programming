function z=FG(mfdm)
global R;
global C;
Gmax=max(max(mfdm))
Gav=sum(sum(mfdm))/(R*C)
hi2t=0;f=0;lo2t=0;g=0;m=1;
for(t=Gav:Gmax)
   for(j=1:C)%列
      for(i=1:R)%行
          if(mfdm(i,j)>t)
              hi2t=hi2t+mfdm(i,j);
              f=f+1;
          elseif(mfdm(i,j)<t)
              lo2t=lo2t+mfdm(i,j);
              g=g+1;
          else
              iiii=1;
          end
      end 
  end
  c(m)=min(abs(t-hi2t/f),abs(t-lo2t/g));
  m=m+1;
end
cmax=max(c);
for(k=1:(m-1))
    if(c(k)==cmax)
        zg=Gav+k-1
        break
    end
end
for(j=1:C)% 对原始图像分割
    for(i=1:R)%对原始图像分割
        if(mfdm(i,j)>=zg)
            mfdm(i,j)=255;
        else
            mfdm(i,j)=0;
        end
     end
end
z=mfdm;
