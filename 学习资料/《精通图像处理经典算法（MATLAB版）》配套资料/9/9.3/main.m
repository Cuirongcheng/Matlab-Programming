 im=imread('ht.jpg');
        im=TOGRAY(im);%图像二值化
        a=size(im);%读取图像尺寸
        global R;
        R=a(1)-4;
        global C;
        C=a(2)-4;
        r1=im(1,:);%扩展矩阵
        r127=im(R+4,:);
        im1=[r1;r1;im;r127;r127];
        c1=im1(:,1);
        c128=im1(:,C+4);
        im2=[c1 c1 im1 c128 c128];
        avr=zeros(4,R);
for(i=1:R)%行
    for(j=1:C)%列
        I=[i i+1 i+2 i+3 i+4];
        J=[j j+1 j+2 j+3 j+4];
        I1=[i i+1 i+2 i+3 i+4 i+5 i+6 i+7 i+8];
        J1=[j j+1 j+2 j+3 j+4 j+5 j+6 j+7 j+8];
        mbin=im(I,J);% 模板生成
        mbout=im2(I1,J1);%模板生成
        lmgl=LMGL(mbin); %最大局部灰度值M文件
        lcmd=LCMD(mbin,mbout);%局部均值反差M文件
        lags=LAGS(mbin,mbout);%局部平均梯度强度M文件
        lv=LV(mbin,mbout);%局部变化M文件
        F(i,j)={[double(lmgl);double(lcmd);double(lags);double(lv)]};%生成特征向量
        avr(:,i)=avr(:,i)+F{i,j};
    end
    avr(:,i)=avr(:,i)/C;%第I行均值
end
mfdm=MFDM(F,avr);%调用特征融合M文件
fgim=FG(mfdm);% 调用自适应目标分割M文件
imshow(fgim);
