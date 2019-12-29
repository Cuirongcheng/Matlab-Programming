% 上机实验5第四题
% 崔荣成 2019.10.21
% 定义countNumber函数
head = input('请输入头的个数：');
foot = input('请输入脚的个数：');
countNumber(head, foot);
function [rabbit,chicken] = countNumber(head, foot)
    rabbit = foot/2 - head;
    chicken = 2 * head - foot / 2;
    fprintf('兔子的个数：%d\n' , rabbit);
    fprintf('鸡的个数：%d\n' , chicken);
end
