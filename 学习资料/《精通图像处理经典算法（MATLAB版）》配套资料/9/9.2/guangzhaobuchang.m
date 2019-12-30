function segment=guangzhaobuchang(m)
I=m;
I=double(I);
Y = 0.299 * I(:,:,1) +0.587 * I(:,:,2) + 0.114* I(:,:,3);
avmY=meafunction segment=guangzhaobuchang(m)
I=m;
I=double(I);
Y = 0.299 * I(:,:,1) +0.587 * I(:,:,2) + 0.114* I(:,:,3);
avmY=mean(mean(Y));
if avmY<=175
            
       I(:,:,1)=log(I(:,:,1)+1)*255*log(1.2)/log(255);
       I(:,:,2)=log(I(:,:,2)+1)*255*log(1.2)/log(255);
       I(:,:,3)=log(I(:,:,3)+1)*255*log(1.2)/log(255);
 
else
             
       I(:,:,1)=255.^(I(:,:,1)/255)+1;
       I(:,:,2)=255.^(I(:,:,2)/255)+1;
       I(:,:,3)=255.^(I(:,:,3)/255)+1;
   
end
 segment=I;
n(mean(Y));
if avmY<=175
            
       I(:,:,1)=log(I(:,:,1)+1)*255*log(1.2)/log(255);
       I(:,:,2)=log(I(:,:,2)+1)*255*log(1.2)/log(255);
       I(:,:,3)=log(I(:,:,3)+1)*255*log(1.2)/log(255);
 
else
             
       I(:,:,1)=255.^(I(:,:,1)/255)+1;
       I(:,:,2)=255.^(I(:,:,2)/255)+1;
       I(:,:,3)=255.^(I(:,:,3)/255)+1;
   
end
 segment=I;
