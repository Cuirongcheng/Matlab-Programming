function pcbjiance()
dcpcbrgb=imread('dcpcbrgb1.bmp');%��������pcbͼ��
figure()
imshow(dcpcbrgb);
title('�����pcb');
t=rgb2gray(dcpcbrgb);%�����pcbͼ��ҶȻ�
lvbo=medfilt2(t);%��ֵ�˲�
uu=im2bw(lvbo);%��ֵ��
u=bwmorph(uu,'spur',8);%ȥ������С�ķ�֧
p=bwmorph(u,'fill');%�������ڵ�
dc=bwmorph(p,'clean');%ȥ����������
figure()
imshow(dc);
title('Ԥ���������pcbͼ��');
goldenpcbrgb=imread('hh.bmp');%�����׼pcbͼ��
biaozhungray=rgb2gray(goldenpcbrgb);%��׼pcbͼ��ҶȻ�
bj=im2bw(biaozhungray);%��ֵ��
figure()
imshow(goldenpcbrgb);
title('��׼pcb');
figure()
imshow(bj);
title('��׼pcb��ֵ��ͼ��')
dc_rect=[80 370 150 130];%�����pcbͼ����ѡȡ���뻥��ؼ�������ľ���
bj_rect=[40 320 200 190];% ��׼pcbͼ����ѡȡ���뻥��ؼ�������ľ���
bj_sub=imcrop(bj,bj_rect);%���ñ�׼pcbͼ��
  max_c=0;%��ʼ����������ֵ
 for rr=-2:1:2%�����pcbͼ��������ת�ĽǶȣ�����ֵ�ɵ���
    dc_rot=imrotate(dc,rr,'nearest');%�����pcbͼ����ת��ʹ���ڽ���ֵ��
    dc_sub=imcrop(dc_rot,dc_rect);%�ü������pcbͼ��
    c=normxcorr2(dc_sub,bj_sub);%���㻥��ϵ��
[max_c1,imax1]=max(abs(c(:)));%max_c1Ϊϵ�����ֵ��imax1Ϊϵ�����ֵ��Ӧ��λ���±�
   if(max_c1>max_c)%ÿһ��ѭ�������ֵ���бȽ�
      max_c=max_c1;%ȡ����ֵ
      angle=rr;%��ȡ�����ֵʱ��Ӧ����ת�Ƕȸ���angle
   end
end
dc_tz=imrotate(dc,angle,'nearest');%��angle�ǣ��Դ����pcbͼ�������ת����
dc_tz_sub=imcrop(dc_tz,dc_rect);%��ʱ����ͼ���������ƽ�У����¼��㻥���ϵ��
cc=normxcorr2(dc_tz_sub,bj_sub);%
 [max_cc,imax]=max(abs(cc(:)));%
 [ypeak,xpeak]=ind2sub(size(cc),imax);%���±�ת��Ϊ���еı�ʾ��ʽ  
yd=[ypeak-(dc_rect(4)+1) xpeak-(dc_rect(3)+1)];%��ͼ���ƶ�����
 bj_dc=[yd(1)+bj_rect(2) yd(2)+bj_rect(1)];%��׼pcbͼ���ڵ�����Ĵ����ͼ���е�����
 xz=[bj_dc(1)-dc_rect(2) bj_dc(2)-dc_rect(1)];%��������ֵ
 dc_qu_rect=[1-xz(2) 1-xz(1) size(bj,2)-1 size(bj,1)-1]; %������Ĵ����ͼ����ѡȡ���׼ͼ��ͬ�ȴ�С���������
 dc_qu=imcrop(dc_tz,dc_qu_rect);%�ü�������Ĵ����pcbͼ��
 figure()
imshow(dc_qu)
title('ƥ���Ĵ����pcbͼ��')
yihuo=xor(bj,dc_qu);%ͼ���������
MN=[3 3]; 
se=strel('rectangle',MN);%����ṹԪ��
imr=imerode(yihuo,se);%��ʴ����
imd=imdilate(imr,se);%��������
rgb=label2rgb(imd,@autumn,'g');%��ע�����Ϊ��ɫ������autumnӳ�������Ϊ��ɫ
biaoji=imlincomb(.6,rgb,.4,goldenpcbrgb);%������ͼ�񰴱����������
figure()
imshow(biaoji);
title('ȱ�ݱ�ע'); 
a1=bj;
b1=dc_qu;
c1=a1-b1;
c2=b1-a1;
MN=[5 3];
se=strel('rectangle',MN);
h1=imerode(c1,se);
h2=imerode(c2,se);
[i,j]=find(h1==1);
p1=bwselect(c1,j,i,8);
[q1,mu1]=bwlabel(p1);
num1=0;
num1=mu1;
hpqs=0;%����ȱʧ����ʼ�� 
dxqs=0;%����ȱʧ����ʼ��
aoxian=0;%��������ʼ��
duan4lu=0;%��·����ʼ��
for k1=1:num1
r1=zeros(size(q1));
ij1=find(q1==k1);
r1(ij1)=1;
[i1,j1]=find(q1==k1);
f1=bwselect(a1,j1,i1,8);
if bweuler(r1)==0;
    hpqs=hpqs+1;
else 
    if bwarea(r1)>500
        dxqs=dxqs+1;
    else 
      s1=f1-r1;
      if bweuler(s1)==bweuler(f1)
          aoxian=aoxian+1;
       else bweuler(s1)>bweuler(f1)
         duan4lu=duan4lu+1;  
      end
    end
end
end
[i0,j0]=find(h2==1);
p2=bwselect(c2,j0,i0,8); 
[q2,mu2]=bwlabel(p2);
num2=0;
num2=mu2;
hpds=0; %������������ʼ��
dxdy=0;%���߶�������ʼ��
tuqi=0;%ͻ������ʼ��
duan3lu=0;%��·����ʼ��
tongban=0;%ͭ������ʼ��
for k2=1:num2
r2=zeros(size(q2));
ij2=find(q2==k2);
r2(ij2)=1;
[i2,j2]=find(q2==k2);
f2=bwselect(b1,j2,i2,8);
if bwarea(f2)-bwarea(r2)<=10
    tongban=tongban+1;
else 
    if bwarea(r2)>300
        dxdy=dxdy+1;
    else 
      s2=f2-r2;
      if bweuler(s2)==bweuler(f2)
          tuqi=tuqi+1;  
       elseif bweuler(s2)>bweuler(f2)
         duan3lu=duan3lu+1;    
        else bweuler(s2)<bweuler(f2)
        hpds=hpds+1;    
       end
    end
end
end
hpqs
dxqs
aoxian
duan4lu
hpds
dxdy
tuqi
duan3lu
tongban