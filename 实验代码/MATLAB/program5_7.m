% 上机实验5第六题
% 崔荣成 2019.10.21
clear
for i=1:10  %i用来循环遍历1~10，代表10行
    array(i,1)=i; %array第1列用来存放数值
    array(i,2)=factorial(i);    %array第2列用来存放数值的阶乘
end
array  %输出结果
% 如何控制输出格式，例如右对齐？
% for i=1:10
%     fprintf('%10d',array(i,1))   %输出结果
%     fprintf('%10d\n',array(i,2))   %输出结果   
% end
