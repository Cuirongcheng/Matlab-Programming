I=imread('cameraman.tif');
figure,imshow(I),title('ԭͼ')
I=double(I);
[M,N]=size(I);
 [y,x]=getpts;   %��ȡ������ʼ��
x1=round(x);         
y1=round(y);         
seed=I(x1,y1);           %�������㱣��
Y=zeros(M,N);          %�½����ͼ��
Y(x1,y1)=1;            
sum=seed;             %�洢����������ĻҶ�ֵ�ĺ�
suit=1;                 %�洢���������ĵ����
count=1;               %��¼ÿ���ж�һ����Χ�ĵ�����������µ����Ŀ
threshold=100;       %�趨������ֵ
while count>0
 s=0;                  
count=0;
 for i=1:M
   for j=1:N
     if Y(i,j)==1
      if (i-1)>0 && (i+1)<(M+1) && (j-1)>0 && (j+1)<(N+1) %��ֹԽ��     
 for u= -1:1                               %�ж�����Χ�������Ƿ��������
        for v= -1:1                               
          if  Y(i+u,j+v)==0 & abs(I(i+u,j+v)-seed)<=threshold  %��������           Y(i+u,j+v)=1;                       %�������������
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
sum=sum+s;        %��s������ϵ�ĻҶ�ֵ��                           
seed=sum/suit; %�����»Ҷ�ƽ��ֵ                                   
end
figure,imshow(Y),title('����������')
