h=0.1;%��ȡʱ�����
ts=[0:h:30];%ʱ������
x0=[10,10];%��ʼ����
opt=odeset('reltol',1e-6,'abstol',1e-9);%������1e-6���������1e-9
[t,x]=ode45(@fun,ts,x0,opt);%ʹ��5��4�����񡪿�����ʽ����
plot(t,x(:,1),'r',t,x(:,2),'b','LineWidth',2),grid;
pause;
plot(x(:,1),x(:,2),'LineWidth',2),grid  %�������