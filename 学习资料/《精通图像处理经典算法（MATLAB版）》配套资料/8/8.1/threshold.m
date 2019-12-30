function Iout = threshold(I)
%I=imread('rootpath');% 单独运行该子程序时用，读入指定路径的图像
%求图像的灰度直方图H
s=size(I);
S=s(1)*s(2);%图像I的像素点个数S
H=zeros(1,256);
for m=1:S
    i=I(m)+1;
    H(i)=H(i)+1;
end
% figure(1)
% bar(H)
% title('直方图')
%单独运行该子程序时用到如下4行注释
%figure(2)
%subplot(1,2,1)
%imshow(I,[])
%title('处理前')
%最大类间方差法求最佳阈值
Gtemp=0;
G=zeros(1,256);
level=0;
for t=0:255    
    N0=0;N1=0;
    H0=0;H1=0;
%1.求目标、背景点数占图像比及平均灰度
    for j=1:256  
        if (j-1)<=t
            N0=N0+H(j);
            H0=H0+H(j)*j;
        else
            N1=N1+H(j);
            H1=H1+H(j)*j;
        end
    end
    W0=N0/S;    %目标点数占图像比
    W1=1-W0;    %背景点数占图像比
    U0=H0/N0;    %目标平均灰度
    U1=H1/N1;    %背景平均灰度
    U=W0*U0+W1*U1;    %总平均灰度
    G(t+1)=W0*(U0-U)^2+W1*(U1-U)^2;    %类间方差值
%2.遍历求出最大类间方差值时的t
    if G(t+1)>=Gtemp
        Gtemp=G(t+1);
        level=t;    %阈值level
    end
end
%根据阈值二值法分割
for i=1:S
    if I(i)<=level
        I(i)=255;
    else
        I(i)=0;
    end
end
Iout = I;
%单独运行该子程序时用
%subplot(1,2,2)
%imshow(I,[])
%title('处理后')

