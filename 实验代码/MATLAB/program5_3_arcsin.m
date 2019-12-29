% 上机实验5第三题
% 崔荣成 2019.10.21
% 定义acrsin函数
function y = program5_3_arcsin(x)
if abs(x) >1
    disp('输入错误，请输入小于1的数');
    return ;
end
n = 0; y = 0; u = x;
while abs(u) >= eps
    u = (factorial(2 * n) * x ^ (2 * n + 1)) / (2 ^ (2 * n) * (factorial(n) ^ 2 * (2 * n + 1)));
    y = y + u;
    n = n + 1;
end
