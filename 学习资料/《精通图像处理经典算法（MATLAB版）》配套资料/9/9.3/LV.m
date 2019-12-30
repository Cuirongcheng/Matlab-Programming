function z=LV(mbin,mbout)%局部变化量
uin=sum(sum(mbin))/9;
uout=sum(sum(mbout))/(81-9);
lins=0;louts=0;
for(k=1:3)
    for(l=1:3)
        lin=abs(double(mbin(k,l))-uin);
        lins=lin+lins;
    end
end
for (k=1:6)
    for(l=1:8)
        if(1<k<6&1<l<6)
            continue
        else
            lout=abs(mbout(k,l)-uout);
            louts=lout+louts;
        end
    end
end
z=lins/9-louts/(81-9);
