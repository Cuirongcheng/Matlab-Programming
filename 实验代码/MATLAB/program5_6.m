% 上机实验5第六题
% 崔荣成 2019.10.21
x = input('请输入一个正整数：');
isPrime(x);
function y = isPrime(x)
y = 1;  %y标记是否为素数，默认y = 1，x是一个素数
    for i = 2 : fix(x / 2)  %循环遍历2~x开根号
        if(rem(x, i) == 0)  %如果x能被除1和它本身的数整除，则不是素数
            y = 0;  %y标记为0，x不是素数
        end
    end
    if(y == 0)
        fprintf('%d不是一个素数！\n', x);
    else
        fprintf('%d是一个素数！\n', x);
    end
end