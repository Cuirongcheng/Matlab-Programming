img_dst = imread('1.jpg');
BW = bwperim(img_dst,8);%��ȡ��ֵͼ���Ե
[x,y]=size(img_dst);
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
H=max(sum(img_dst)); % ����Ŀ��߶�
W=max(sum(img_dst')); % ͼ��I������ת�ú󣬼�����
A=bwarea(img_dst); % ����Ŀ�����
R=A/(H*W) % ������ζ�
