% �ϻ�ʵ��5�ڶ���
% ���ٳ� 2019.10.21
clear;
x = input('������x��ֵ��');
if (x < 0)
    y = x + 1;
elseif ((x >= 0) & (x < 1))
    y = 1;
elseif(x >= 1)
    y = x ^ 3;
end
y