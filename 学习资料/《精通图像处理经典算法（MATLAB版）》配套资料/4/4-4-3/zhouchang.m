img_dst = imread('circles.png');
[x,y]=size(img_dst);
BW = bwperim(img_dst,8);%��ȡ��ֵͼ���Ե
P1=0;
Ny=0; % ��ֱ���������ܳ����ص����
for i=1:x
   for j=1:y
     if (BW(i,j)>0)
       P2=j;
       if ((P2-P1)==1) %�ж��Ƿ�Ϊ��ֱ�����������ܳ����ص�
       Ny=Ny+1;
       end
     P1=P2;
     end
    end
end
%ˮƽ���������ܳ����ص�
P1=0;
Nx=0; % ��¼ˮƽ���������ܳ����ص�ĸ���
for j=1:y
    for i=1:x
       if (BW(i,j)>0)
          P2=i;
         if ((P2-P1)==1) % �ж��Ƿ�Ϊˮƽ�����������ܳ����ص�
            Nx=Nx+1;
         end
         P1=P2;
       end
     end
end 
L=Nx+Ny %϶���ܳ�
