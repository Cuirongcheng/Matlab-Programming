% 上机实验5第二题
% 崔荣成 2019.10.21
clear;
x = input('请输入x的值：');
if (x < 0)
    y = x + 1;
elseif ((x >= 0) & (x < 1))
    y = 1;
elseif(x >= 1)
    y = x ^ 3;
end
y