% �ϻ�ʵ��5������
% ���ٳ� 2019.10.21
% ����Factorial����
function y = program5_3_factorial(n);
if (n < 0)
    disp('������������벻С��0������');
    return ;
end
if (n == 0 || n ==1)
    y = 1;
else
    y = n * factorial(n-1);
end