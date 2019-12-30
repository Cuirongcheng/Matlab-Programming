A=imread('a.bmp');
j=medfilt2(A);
figure,imshow(j);
B=imadjust(A,[0.2 0.8]);
figure;
subplot(2,2,1);imshow(A);
subplot(2,2,2);imhist(A);
subplot(2,2,3);imshow(B);
subplot(2,2,4);imhist(B); 
[x,y]=size(B);
m=double(B);
N=sqrt(100)*randn(x,y);
I=m+N;
for i=1:x
    for j=1:y
        if (I(i,j)>255)
            I(i,j)=255;
        end
        if (I(i,j)<0)
            I(i,j)=0;
        end
    end
end
z0=max(max(I));
z1=min(min(I));
T=(z0+z1)/2;
TT=0;
s0=0;n0=0;
s1=0;n1=0;
allow=0.5;
d=abs(T-TT);
count=0;
while(d>=allow)
    count=count+1;
    for i=1:x 
        for j=1:y
            if(I(i,j)>=T)
                s0=s0+I(i,j);
                n0=n0+1;
            end
            if(I(i,j)<T)
                s1=s1+I(i,j);
                n1=n1+1;
            end
        end
    end
    T0=s0/n0;
    T1=s1/n1;
    TT=(T0-T1)/2;
    d=abs(T-TT);
    T=TT;
end
seg=zeros(x,y);
for i=1:x
    for j=1:y
        if(I(i,j)>=T)
            seg(i,j)=1;
        end
    end
end
figure;
imshow(seg);
BW1=bwmorph(seg,'spur');
BW2=bwmorph(BW1,'fill');
BW3=bwmorph(BW2,'clean');
figure;
imshow(BW3);

