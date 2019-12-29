% 上机实验5第三题
% 崔荣成 2019.10.21
% 定义Factorial函数
function y = program5_3_factorial(n);
if (n < 0)
    disp('输入错误，请输入不小于0的整数');
    return ;
end
if (n == 0 || n ==1)
    y = 1;
else
    y = n * factorial(n-1);
end