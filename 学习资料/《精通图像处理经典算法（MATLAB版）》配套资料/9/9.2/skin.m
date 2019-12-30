function result = skin(Y,Cb,Cr)  
% ����  
a = 25.39;  
b = 14.03;  
ecx = 1.60;  
ecy = 2.41;  
sita = 2.53;  
cx = 109.38;  
cy = 152.02;  
xishu = [cos(sita) sin(sita);-sin(sita) cos(sita)];  
% ������ȴ���230���򽫳�����ͬʱ����Ϊԭ����1.1��  
if(Y > 230)  
    a = 1.1*a;  
    b = 1.1*b;  
end  
% ���ݹ�ʽ���м���  
Cb = double(Cb);  
Cr = double(Cr);  
t = [(Cb-cx);(Cr-cy)];  
temp = xishu*t;  
value = (temp(1) - ecx)^2/a^2 + (temp(2) - ecy)^2/b^2;  
% ����1���Ƿ�ɫ������0������Ϊ��ɫ������1  
if value > 1  	
    result = 0;  
else  
    result = 1;  
end  
