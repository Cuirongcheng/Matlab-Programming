function z=LCMD(mbin,mbout)%局部对比度均值反差
z=sum(sum(mbin))/9-(sum(sum(mbout))-sum(sum(mbin)))/(81-9);
