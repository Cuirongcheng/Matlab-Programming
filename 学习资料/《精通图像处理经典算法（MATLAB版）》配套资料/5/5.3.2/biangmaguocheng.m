%���룬ѹ��ͼ��
%�򿪺���ʾҪ�����ͼ��
 figure(1);
 sig=imread('lena.bmp');
 imagesc(sig);                      %imagesc������ʾ����ͼ��
 colormap(gray);                    %colormap��������ɫͼ��gray������ʾ���ԻҶ�
 axis square                        %ais���ڿ���������Ŀ̶ȱ���
 axis off
 [m_sig,n_sig]=size(sig);
 %�������е��������÷ָ���ͼ��Ĵ�С������Ĵ�С
 siz_word=4;
 siz_book=64;
 %��������
 load codebook_kn
 %���������Ҫ�󣬷ָ�Ҫ�����ͼ��
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
 %��LBG�㷨����
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
