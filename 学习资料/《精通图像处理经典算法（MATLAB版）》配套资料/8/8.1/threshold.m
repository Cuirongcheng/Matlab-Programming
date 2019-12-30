function Iout = threshold(I)
%I=imread('rootpath');% �������и��ӳ���ʱ�ã�����ָ��·����ͼ��
%��ͼ��ĻҶ�ֱ��ͼH
s=size(I);
S=s(1)*s(2);%ͼ��I�����ص����S
H=zeros(1,256);
for m=1:S
    i=I(m)+1;
    H(i)=H(i)+1;
end
% figure(1)
% bar(H)
% title('ֱ��ͼ')
%�������и��ӳ���ʱ�õ�����4��ע��
%figure(2)
%subplot(1,2,1)
%imshow(I,[])
%title('����ǰ')
%�����䷽��������ֵ
Gtemp=0;
G=zeros(1,256);
level=0;
for t=0:255    
    N0=0;N1=0;
    H0=0;H1=0;
%1.��Ŀ�ꡢ��������ռͼ��ȼ�ƽ���Ҷ�
    for j=1:256  
        if (j-1)<=t
            N0=N0+H(j);
            H0=H0+H(j)*j;
        else
            N1=N1+H(j);
            H1=H1+H(j)*j;
        end
    end
    W0=N0/S;    %Ŀ�����ռͼ���
    W1=1-W0;    %��������ռͼ���
    U0=H0/N0;    %Ŀ��ƽ���Ҷ�
    U1=H1/N1;    %����ƽ���Ҷ�
    U=W0*U0+W1*U1;    %��ƽ���Ҷ�
    G(t+1)=W0*(U0-U)^2+W1*(U1-U)^2;    %��䷽��ֵ
%2.������������䷽��ֵʱ��t
    if G(t+1)>=Gtemp
        Gtemp=G(t+1);
        level=t;    %��ֵlevel
    end
end
%������ֵ��ֵ���ָ�
for i=1:S
    if I(i)<=level
        I(i)=255;
    else
        I(i)=0;
    end
end
Iout = I;
%�������и��ӳ���ʱ��
%subplot(1,2,2)
%imshow(I,[])
%title('�����')

