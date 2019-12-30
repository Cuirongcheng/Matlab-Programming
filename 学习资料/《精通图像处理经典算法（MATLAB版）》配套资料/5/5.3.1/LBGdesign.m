function LBGdesign()
%读入lena图像，用于码书的训练
figure(1);
sig=imread('lena.bmp');
%用size函数得到图像的行数和列数
[m_sig,n_sign]=size(sig);
%设置码字的大小，4*4
siz_word=4;
%设置码书大小
siz_book=64;
%将图像分割成4*4的子图像，作为码书训练的输入向量
num=m_sig/siz_word;
ss=siz_word*siz_word;           %码字的大小
nn=num*num;
re_sig=[];
for i=1:m_sig
    for j=1:m_sig
        f1=floor(i./siz_word); 
%floor为向负无穷大的方向取数，目的是编号每个数据属于哪个标号内
        m1=mod(i,siz_word);                         %mod为模数求余
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
%码书初始化，从nn个输入矢量随机取siz_book个矢量作为初始矢量
codebook=[];
for i=1:siz_book
    r=floor(rand*nn)+1;                     %rand为在（0，1）间随机取一个服从均匀分布的随机数，作为随机抽取nn中的元素
    codebook=[codebook;re_sig(r,:)];         %得出随机的码书
end
%LBG训练算法
%d0,d1用于存放各训练矢量与其在码书中最相近的码字的距离平方之和
%sea用于存放迭代精度
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
