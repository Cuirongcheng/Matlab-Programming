d1=0;
for n=1:5%������������temp0��temp1֮��ľ���
   d0=[temp0(1,n)-temp1(1,n)]^2;
    d1=d1+d0;
end
 d1=sqrt(d1)
 
d2=0;
for n=1:5%������������temp0��temp2֮��ľ���
   d0=[temp0(1,n)-temp2(1,n)]^2;
    d2=d2+d0;
end
 d2=sqrt(d2)
d3=0;
for n=1:5%������������temp0��temp2֮��ľ���
   d0=[temp0(1,n)-temp3(1,n)]^2;
    d3=d3+d0;
end
 d3=sqrt(d3)
  d4=0;
for n=1:5%������������temp0��temp4֮��ľ���
   d0=[temp0(1,n)-temp4(1,n)]^2;
    d4=d4+d0;
end
 d4=sqrt(d4)
dm=[d1 d2 d3 d4];
[dm,i]=min(dm)
 switch i
      case 1
       disp('a����ƽ');figure,imshow('ע��a.bmp');
     case 2
       disp('b');  figure,imshow('ע��b.bmp');
     case 3
       disp('c');figure,imshow('ע��c.bmp');
     case 4
       disp('d');figure,imshow('ע��d.bmp');
         otherwise
       disp('error�޷�ʶ��');figure,imshow('��ʶ��ͼ��.BMP'),title('δע����Ա');
 end
datestr(now,31);
