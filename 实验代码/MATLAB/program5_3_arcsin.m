% �ϻ�ʵ��5������
% ���ٳ� 2019.10.21
% ����acrsin����
function y = program5_3_arcsin(x)
if abs(x) >1
    disp('�������������С��1����');
    return ;
end
n = 0; y = 0; u = x;
while abs(u) >= eps
    u = (factorial(2 * n) * x ^ (2 * n + 1)) / (2 ^ (2 * n) * (factorial(n) ^ 2 * (2 * n + 1)));
    y = y + u;
    n = n + 1;
end
