%上机实验四第一题
%崔荣成 2019.11.14
x = [1,2,4,0,5,10,11,21,3,1];
plot(x)

%上机实验四第二题
%崔荣成 2019.11.14
aplha=0:pi/40:2*pi;
r=1;
x=r*cos(aplha);
y=r*sin(aplha);
plot(x,y,'-');
axis('square')
x = [1,2,4,0,5,10,11,21,3,1];
plot(x)

%上机实验四第三题
%崔荣成 2019.11.14
I = 0:0.01:5;
R1=1; R2=5; R3=10; R4=20;
U1=I*R1; U2=I*R2; U3=I*R3; U4=I*R4;
plot(I,U1,I,U2,I,U3,I,U4)
legend('R=1','R=5','R=10','R=20')

%上机实验四第四题
%崔荣成 2019.11.14
mon=1:12;
temp=[0.2 2.3 8.7 18.5 24.6 32.1 36.8 37.1 28.3 17.8 6.4 -3.2];
rainf=[4.6 3.6 2.1 2.9 3.0 2.7 2.2 2.5 4.3 3.4 2.1 3.7];
plot(mon,temp,'r.-',mon,rainf,'b*-.');
title('Temperature and Rainfall Curve');
xlabel('month');
ylabel('temperature and rainfall');
text(7,30,'\uparrowtemperature');
text(5,10,'\downarrowrainfall');
flag=1;
while(flag<=12)
text(mon(flag),temp(flag),['(',num2str(mon(flag)),',',num2str(temp(flag)),')']);
text(mon(flag),rainf(flag),['(',num2str(mon(flag)),',',num2str(rainf(flag)),')']);
flag=flag+1;
end

%上机实验四第五题
%崔荣成 2019.11.14
A=[1 1 1 1 1 1 1;1 2 2 2 2 2 1;1 2 2 2 2 2 1;1 2 2 2 2 2 1;1 1 1 1 1 1 1];
mesh(A)

%上机实验四第六题
%崔荣成 2019.11.14
x=-10:0.5:10; y=x;
[X,Y]=meshgrid(x,y);
Z=X.^2+Y.^2;
surf(X,Y,Z)
x=-10:0.5:10; y=x;
[X,Y]=meshgrid(x,y);
Z=X^2+Y^2;
surf(X,Y,Z)

%上机实验四第七题
%崔荣成 2019.11.14
[x,y,z]=ellipsoid(0,0,0,2,3,4,80);
subplot(2,2,1);
mesh(x,y,z);
title('三维立体图')
subplot(2,2,2);
mesh(x,y,z);
view(90,0);
title('X轴视图')
subplot(2,2,3);
mesh(x,y,z);
view(0,0);
title('Y轴视图');
subplot(2,2,4);
mesh(x,y,z);
view(0,90);
title('Z轴视图');
