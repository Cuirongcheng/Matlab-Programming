function z=MFDM(F,avr)
global R;
global C;
for(i=1:R)%��
    for(j=1:C)%��
    z1(i,j)=sqrt((double(F{i,j})-avr(:,i))'*(double(F{i,j})-avr(:,i)));
end
end
z=z1;
function z=LCMD(mbin,mbout)
z=sum(sum(mbin))/9-(sum(sum(mbout))-sum(sum(mbin)))/(81-9);
