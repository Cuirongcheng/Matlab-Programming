%解码算法
 for i=1:nn
     re_sig(i,:)=codebook(codenumber(i),:);     
 end
 %重建图像，重新编排码书码字的顺序
 for ni=1:nn
     for nj=1:ss
         f1=floor(ni./num);
         f2=mod(ni,num);
         if f2==0
             f2=num;
             f1=f1-1;
         end
         m1=floor(nj./siz_word)+1;
         m2=mod(nj,siz_word);
         if m2==0
             m2=siz_word;
             m1=m1-1;
         end
         re_re_sig(siz_word*f1+m1,siz_word*(f2-1)+m2)=re_sig(ni,nj);
     end
 end
 %显示解压后图像
 figure(2);
 imagesc(re_re_sig);
 colormap(gray);
 axis square
 axis off
