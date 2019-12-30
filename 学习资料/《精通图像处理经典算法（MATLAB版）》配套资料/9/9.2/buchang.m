function g=buchang(m)
I1=m;
I=double(I1);
r=I(:,:,1);
g=I(:,:,2);
b=I(:,:,3);
sum1=0;
sum2=0;
sum3=0;
[w,h]=size(I(:,:,1));
for i=1:w
    for j=1:h
        sum1=sum1+r(i,j);
    end
end
r1=sum1/(w*h);
for i=1:w
    for j=1:h
        sum2=sum2+g(i,j);
    end
end
g1=sum2/(w*h);
for i=1:w
    for j=1:h
        sum3=sum3+b(i,j);
   end
end
b1=sum3/(w*h);
aver=(r1+g1+b1)/3;
if (r1>136)
    rmax=max(r);
    gmax=max(g);
    bmax=max(b);
    factor1=rmax/255;
    factor2=gmax/255;
    factor3=bmax/255;
    for i=1:w
        for j=1:h
            r(i,j)=(aver/r1)*r(i,j);
        end
    end
    for i=1:w
        for j=1:h
            g(i,j)=(aver/g1)*g(i,j);
        end
    end
    for i=1:w
        for j=1:h
            b(i,j)=(aver/b1)*b(i,j);
        end
    end
    if(factor1>1)
        for i=1:w
            for j=1:h
                r(i,j)=r(i,j)/factor1;
            end
        end
    end
    if(factor2>1)
        for i=1:w
            for j=1:h
                g(i,j)=g(i,j)/factor2;
            end
        end
    end
    if(factor3>1)
        for i=1:w
            for j=1:h
                b(i,j)=b(i,j)/factor3;
            end
        end
    end
    g=cat(3,r,g,b);
else
    g=I1;
end
