%编码，压缩图像
%打开和显示要编码的图像
 figure(1);
 sig=imread('lena.bmp');
 imagesc(sig);                      %imagesc用于显示亮度图像
 colormap(gray);                    %colormap用于设置色图；gray用于显示线性灰度
 axis square                        %ais用于控制坐标轴的刻度表现
 axis off
 [m_sig,n_sig]=size(sig);
 %根据已有的码书设置分割子图像的大小和码书的大小
 siz_word=4;
 siz_book=64;
 %调用码书
 load codebook_kn
 %根据码书的要求，分割要编码的图像
 num=m_sig/siz_word;
 ss=siz_word*siz_word;
 nn=num*num;
 re_sig=[];
 for i=1:m_sig
     for j=1:m_sig
         f1=floor(i./siz_word);
         m1=mod(i,siz_word);
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
 %用LBG算法编码
 d1=0.0;
 for i=1:nn
     codenumber(i)=1;
     min=distance(ss,re_sig(i,:),codebook(1,:));
     for j=2:siz_book
         d=0.0;
         for l=1:ss
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
     d1=d1+min;
 end
