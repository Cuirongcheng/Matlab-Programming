function zhouchang_main
i=bwperim(imread('circles.png'),8);%��ȡ��ֵͼ��߽�
c8=chain8(i);%8����
sum1=0;sum2=0;
for k=1:length(c8)
    if c8(k)==0 ||c8(k)==2 ||c8(k)==4 ||c8(k)==6
        sum1=sum1+1;
    else
        sum2=sum2+1;
    end
end
L=sum1+sum2*sqrt(2)
%�Ӻ�����
%8��ͨ����
function out=chain8(I)
n=[0 1;-1 1;-1 0;-1 -1;0 -1;1 -1;1 0;1 1]; %�趨��־
flag=1; %��ʼ��������봮Ϊ��
cc=[];%�ҵ���ʼ��
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
          %�ҵ���һ�����ص�ķ�����󲹳����������
    cc=[cc,dir];
    x=x+n(dir+1,1);y=y+n(dir+1,2);
    %�б�����Ľ�����־
    if x==first(1)&&y==first(2)
        flag=0;
    end
end
out=cc;
