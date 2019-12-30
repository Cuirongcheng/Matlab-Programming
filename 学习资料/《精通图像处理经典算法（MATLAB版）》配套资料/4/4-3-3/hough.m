%��Hough�任��ֱ�ߵļ��
clc;
close all;
I = imread('circuit.tif');               %����ԭʼͼ��
figure(1);subplot(1,3,1), imshow(I);title('ԭʼͼ��');%��ʾ����·�� ԭʼͼ��
Img = edge(I,'prewitt');               %����prewitt������ȡ��Ե
subplot(1,3,2), imshow(Img);title('��ȡͼ���Ե');      %��ʾ��ȡ��Ե��ͼƬ
[H, T, R] = hough(Img);              %hough�任
figure(2),imshow(sqrt(H), []); title('ӳ�䵽һ������ '); %��ʾhough�任��ӳ��
P = houghpeaks(H, 15, 'threshold', ceil(0.3*max(H(:))));  %Ѱ������
lines=houghlines(Img,T,R,P,'FillGap',10,'MinLength',20 );%�����ҵ���ֱ��
figure(1);subplot(1,3,3), imshow(I),title('��ʾ��ͼ����ҵ�ֱ��');
hold on       % ��ԭʼͼ���ϱ�ʶ�����ҵ�ֱ��
   max_len = 0;
   for k = 1:length(lines)
      xy = [lines(k).point1; lines(k).point2];
      plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
      plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
      plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
   end 
