function z=LCMD(mbin,mbout)%�ֲ��ԱȶȾ�ֵ����
z=sum(sum(mbin))/9-(sum(sum(mbout))-sum(sum(mbin)))/(81-9);
