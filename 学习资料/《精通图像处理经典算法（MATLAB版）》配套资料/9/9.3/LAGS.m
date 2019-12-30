function z=LAGS(mbin,mbout)%局部平局梯度强度
Gin=0;Gout=0;
for (k=1:4)
    for(l=1:4)
        Ginh=abs(double(mbin(k,l))-double(mbin(k,l+1)));
        Ginv=abs(double(mbin(k,l))-double(mbin(k+1,l)));
        Gin=Ginh+ Ginv+ Gin;
    end
end
for (k=1:8)
    for(l=1:8)
        if(1<k<8&1<l<8)
            continue
        else
        Gouth=abs(mbout(k,l)-mbout(k,l+1));
        Goutv=abs(mbout(k,l)-mbout(k+1,l));
        Gout=Gouth+ Goutv+ Gout;
        end
    end
end
z=Gin/25-Gout/(81-25);
