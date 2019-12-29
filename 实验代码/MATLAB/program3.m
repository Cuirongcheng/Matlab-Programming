%上机实验三 No.1
%崔荣成 2019.10.12
clear all;clc;
syms x;
limit((cos(sqrt(x))^(pi/x)),x,0,'right')

%上机实验三 No.2
%崔荣成 2019.10.12
syms x;
limit((3*sin(x)+x^2*cos(1/x))/((1+cos(x))*log(1+x)),x,0)

%上机实验三 No.3
%崔荣成 2019.10.12
syms x;
limit((sqrt(4*x^2+x-1)+x+1)/(sqrt(x^2+sin(x))),x,-inf)

%上机实验三 No.4
%崔荣成 2019.10.12
syms x y;
limit(limit((x^2+y^2)^(x^2*y^2),x,0),y,0)

%上机实验三 No.5
%崔荣成 2019.10.12
syms x;
y=(tan(sqrt(x+sqrt(x+sqrt(2*x)))))^2;
diff(y)

%上机实验三 No.6
%崔荣成 2019.10.12
syms x;
y=cos(x^2)*(sin(1/x))^2;
diff(y)

%上机实验三 No.7
%崔荣成 2019.10.12
syms x;
int(sqrt(sin(x)-(sin(x))^3),x,0,pi)

%上机实验三 No.8
%崔荣成 2019.10.12
syms x
int((1/x)*sqrt((x+1)/(x-1)))

%上机实验三 No.9
%崔荣成 2019.10.12
dsolve('D2y+4*Dy+4*y=exp(-2*x)','x')

%上机实验三 No.10
%崔荣成 2019.10.12
dsolve('x^2*Dy+x*y=y^2','y(1)=1')