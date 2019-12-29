% 上机实验5第一题
% 崔荣成 2019.10.21
clear;
x = -1.5 : 0.01 : 1.5;
for i = 1 : 301
    if (x(i) < 0)
        y(i) = x(i) + 1;
    elseif ((x(i) >= 0) & (x(i) < 1))
        y(i) = 1;
    elseif(x(i) >= 1)
        y(i) = x(i) ^ 3;
    end
end
plot(x, y)