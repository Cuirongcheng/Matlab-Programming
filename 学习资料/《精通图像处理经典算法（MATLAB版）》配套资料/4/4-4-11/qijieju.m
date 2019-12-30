clc
I=imread('pout.tif');               %��ȡͼ��
I1=I;
I0=I;
subplot(141);imshow(I1);                     %��ʾͼ��
I2=imrotate(I,5,'bilinear');          %��ת�仯
subplot(142);imshow(I2)
I3=fliplr(I);                      %����仯
subplot(143);imshow(I3)
I4=imresize(I,0.1,'bilinear');         %�߶ȱ仯
subplot(144);imshow(I4)
display('ԭͼ��')
qijieju(I1);                       %����ԭͼ����߽׾�
display('��ת�仯')
qijieju(I2);                       %������ת�仯ͼ����߽׾�
display('����仯')
qijieju(I3);                       %���㾵��仯ͼ����߽׾�
display('�߶ȱ仯')
qijieju(I4);                       %����߶ȱ仯ͼ����߽׾�
%�ӳ���MATLABԴ�������£�
function qijieju(I0)                %���߽׾�qijieju�����嵥:
A=double(I0);
[nc,nr]=size(A);
[x,y]=meshgrid(1:nr,1:nc);
x=x(:);
y=y(:);
A=A(:);
m00=sum(A);
if m00==0
    m00=eps;
end
m10=sum(x.*A);
m01=sum(y.*A);
xmean=m10/ m00;
ymean= m01/ m00; 
cm00=m00;
cm02=(sum((y-ymean).^2.*A))/( m00^2);
cm03=(sum((y-ymean).^3.*A))/( m00^2.5);
cm11=(sum((x-xmean).*(y-ymean).*A))/( m00^2);
cm12=(sum((x-xmean).*(y-ymean).^2.*A))/(m00^2.5);
cm20=(sum((x-xmean).^2.*A))/( m00^2);
cm21=(sum((x-xmean).^2.*(y-ymean).*A))/(m00^2.5);
cm30=(sum((x-xmean).^3.*A))/(m00^2.5);
ju(1)=cm20+cm02;                              %���߽׾�
ju(2)=(cm20-cm02)^2+4*cm11^2;
ju(3)=(cm30-3*cm12)^2+(3*cm21-cm03)^2;
ju(4)=(cm30+cm12)^2+(cm21+cm03)^2;
ju(5)=(cm30-3*cm12)*(cm30+cm12)*((cm30+cm12)^2-3*(cm21+cm03)^2)+(3*cm21-cm03)*(cm21+cm03)*(3*(cm30+cm12)^2-(cm21+cm03)^2);
ju(6)=(cm20-cm02)*((cm30+cm12)^2-(cm21+cm03)^2)+4*cm11*(cm30+cm12)*(cm21+cm03);
ju(7)=(3*cm21-cm03)*(cm30+cm12)*((cm30+cm12)^2-3*(cm21+cm03)^2)+(3*cm12-cm30)*(cm21+cm03)*(3*(cm30+cm12)^2-(cm21+cm03)^2);
qijieju=abs(log(ju))
