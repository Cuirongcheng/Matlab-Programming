d1=0;
for n=1:5%计算纹理特征temp0与temp1之间的距离
   d0=[temp0(1,n)-temp1(1,n)]^2;
    d1=d1+d0;
end
 d1=sqrt(d1)
 
d2=0;
for n=1:5%计算纹理特征temp0与temp2之间的距离
   d0=[temp0(1,n)-temp2(1,n)]^2;
    d2=d2+d0;
end
 d2=sqrt(d2)
d3=0;
for n=1:5%计算纹理特征temp0与temp2之间的距离
   d0=[temp0(1,n)-temp3(1,n)]^2;
    d3=d3+d0;
end
 d3=sqrt(d3)
  d4=0;
for n=1:5%计算纹理特征temp0与temp4之间的距离
   d0=[temp0(1,n)-temp4(1,n)]^2;
    d4=d4+d0;
end
 d4=sqrt(d4)
dm=[d1 d2 d3 d4];
[dm,i]=min(dm)
 switch i
      case 1
       disp('a，赵平');figure,imshow('注册a.bmp');
     case 2
       disp('b');  figure,imshow('注册b.bmp');
     case 3
       disp('c');figure,imshow('注册c.bmp');
     case 4
       disp('d');figure,imshow('注册d.bmp');
         otherwise
       disp('error无法识别');figure,imshow('待识别图像.BMP'),title('未注册人员');
 end
datestr(now,31);
