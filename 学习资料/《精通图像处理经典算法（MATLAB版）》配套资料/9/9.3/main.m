 im=imread('ht.jpg');
        im=TOGRAY(im);%ͼ���ֵ��
        a=size(im);%��ȡͼ��ߴ�
        global R;
        R=a(1)-4;
        global C;
        C=a(2)-4;
        r1=im(1,:);%��չ����
        r127=im(R+4,:);
        im1=[r1;r1;im;r127;r127];
        c1=im1(:,1);
        c128=im1(:,C+4);
        im2=[c1 c1 im1 c128 c128];
        avr=zeros(4,R);
for(i=1:R)%��
    for(j=1:C)%��
        I=[i i+1 i+2 i+3 i+4];
        J=[j j+1 j+2 j+3 j+4];
        I1=[i i+1 i+2 i+3 i+4 i+5 i+6 i+7 i+8];
        J1=[j j+1 j+2 j+3 j+4 j+5 j+6 j+7 j+8];
        mbin=im(I,J);% ģ������
        mbout=im2(I1,J1);%ģ������
        lmgl=LMGL(mbin); %���ֲ��Ҷ�ֵM�ļ�
        lcmd=LCMD(mbin,mbout);%�ֲ���ֵ����M�ļ�
        lags=LAGS(mbin,mbout);%�ֲ�ƽ���ݶ�ǿ��M�ļ�
        lv=LV(mbin,mbout);%�ֲ��仯M�ļ�
        F(i,j)={[double(lmgl);double(lcmd);double(lags);double(lv)]};%������������
        avr(:,i)=avr(:,i)+F{i,j};
    end
    avr(:,i)=avr(:,i)/C;%��I�о�ֵ
end
mfdm=MFDM(F,avr);%���������ں�M�ļ�
fgim=FG(mfdm);% ��������ӦĿ��ָ�M�ļ�
imshow(fgim);
