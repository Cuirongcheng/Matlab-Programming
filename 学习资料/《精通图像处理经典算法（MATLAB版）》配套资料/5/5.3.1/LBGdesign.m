function LBGdesign()
%����lenaͼ�����������ѵ��
figure(1);
sig=imread('lena.bmp');
%��size�����õ�ͼ�������������
[m_sig,n_sign]=size(sig);
%�������ֵĴ�С��4*4
siz_word=4;
%���������С
siz_book=64;
%��ͼ��ָ��4*4����ͼ����Ϊ����ѵ������������
num=m_sig/siz_word;
ss=siz_word*siz_word;           %���ֵĴ�С
nn=num*num;
re_sig=[];
for i=1:m_sig
    for j=1:m_sig
        f1=floor(i./siz_word); 
%floorΪ�������ķ���ȡ����Ŀ���Ǳ��ÿ�����������ĸ������
        m1=mod(i,siz_word);                         %modΪģ������
        if m1==0
            m1=siz_word;
            f1=f1-1;
        end
        f2=floor(j./siz_word);
        m2=mod(j,siz_word);
        if m2==0
            m2=siz_word;
            f2=f2-1;
        end
        re_sig(num*f1+f2+1,siz_word*(m1-1)+m2)=sig(i,j);
    end
end
%�����ʼ������nn������ʸ�����ȡsiz_book��ʸ����Ϊ��ʼʸ��
codebook=[];
for i=1:siz_book
    r=floor(rand*nn)+1;                     %randΪ�ڣ�0��1�������ȡһ�����Ӿ��ȷֲ������������Ϊ�����ȡnn�е�Ԫ��
    codebook=[codebook;re_sig(r,:)];         %�ó����������
end
%LBGѵ���㷨
%d0,d1���ڴ�Ÿ�ѵ��ʸ������������������������ֵľ���ƽ��֮��
%sea���ڴ�ŵ�������
d0=0;
for i=1:nn
    d0=d0+distance(ss,re_sig(i,:),codebook(1,:));
end
while 1
    d1=0.0;
    for i=1:siz_book
        vectornumber(i)=0;
    end
    for i=1:nn
        codenumber(i)=1;
        min=distance(ss,re_sig(i,:),codebook(1,:));
        for j=2:siz_book
            d=0.0;
            for l=2:ss
                d=d+(re_sig(i,l)-codebook(j,l))^2;
                if d>=min
                    break;
                end
            end
            if d<min
                 min=d;
                 codenumber(i)=j;
             end
         end
         vectornumber(codenumber(i))=vectornumber(codenumber(i))+1;
         d1=d1+min;
     end
     sea=(d0-d1)/d1;
     if sea<=0.0001
         break;
     end
     d0=d1;
     for j=1:siz_book
         if vectornumber[j]~=0
             dd=zeros(1,ss);
             for l=1:nn
                 if codenumber(l)==j
                     for k=1:ss
                         dd(k)=dd(k)+re_sig(l,k);
                     end
                 end
             end
             for k=1:ss
                 codebook(j,k)=dd(k)/vectornumber(j);
             end
         else
             l=floor(rand*nn)+1;
             codebook(j,:)=re_sig(l,:);
         end
     end
 end
save codebook_kn codebook;
