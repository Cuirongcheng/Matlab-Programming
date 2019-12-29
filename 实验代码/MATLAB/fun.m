function dx=fun(t,x,r1,r2,n1,n2,s1,s2)
r1=1;
r2=1;
n1=100;
n2=100;
s1=0.5;
s2=2;
dx=[r1*x(1)*(1-x(1)/n1-s1*x(2)/n2);r2*x(2)*(1-s2*x(1)/n1-x(2)/n2)];