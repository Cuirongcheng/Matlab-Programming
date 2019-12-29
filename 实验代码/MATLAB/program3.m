%�ϻ�ʵ���� No.1
%���ٳ� 2019.10.12
clear all;clc;
syms x;
limit((cos(sqrt(x))^(pi/x)),x,0,'right')

%�ϻ�ʵ���� No.2
%���ٳ� 2019.10.12
syms x;
limit((3*sin(x)+x^2*cos(1/x))/((1+cos(x))*log(1+x)),x,0)

%�ϻ�ʵ���� No.3
%���ٳ� 2019.10.12
syms x;
limit((sqrt(4*x^2+x-1)+x+1)/(sqrt(x^2+sin(x))),x,-inf)

%�ϻ�ʵ���� No.4
%���ٳ� 2019.10.12
syms x y;
limit(limit((x^2+y^2)^(x^2*y^2),x,0),y,0)

%�ϻ�ʵ���� No.5
%���ٳ� 2019.10.12
syms x;
y=(tan(sqrt(x+sqrt(x+sqrt(2*x)))))^2;
diff(y)

%�ϻ�ʵ���� No.6
%���ٳ� 2019.10.12
syms x;
y=cos(x^2)*(sin(1/x))^2;
diff(y)

%�ϻ�ʵ���� No.7
%���ٳ� 2019.10.12
syms x;
int(sqrt(sin(x)-(sin(x))^3),x,0,pi)

%�ϻ�ʵ���� No.8
%���ٳ� 2019.10.12
syms x
int((1/x)*sqrt((x+1)/(x-1)))

%�ϻ�ʵ���� No.9
%���ٳ� 2019.10.12
dsolve('D2y+4*Dy+4*y=exp(-2*x)','x')

%�ϻ�ʵ���� No.10
%���ٳ� 2019.10.12
dsolve('x^2*Dy+x*y=y^2','y(1)=1')