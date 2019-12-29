% 上机实验5第五题
% 崔荣成 2019.10.21
fprintf('  2~999之间满足以下条件的自然数有：\n（1）该数各位数字之和为奇数；\n（2）该数是素数。\n' );
for i = 2 : 999 %循环遍历2~999
    one = rem(i, 10);   %计算个位的数值
    ten = rem(fix(i / 10), 10); %计算十位的数值
    hundred = fix(i / 100); %计算百位的数值
    if rem((one + ten + hundred), 2) & isprime(i)   %判断是否符合条件
        fprintf('\t%d', i); %满足条件则输出
    end
end
