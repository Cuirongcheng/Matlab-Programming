%  MATLAB  ����edge����ʵ�ָ����ӽ��б�Ե�������
I = imread('rice.png');   % ����ԭʼ�Ҷ�ͼ����ʾ
BW1 = edge(I,'log',0.01);    % ��LOG���ӽ��б�Ե��⣬�б���ֵΪ0.01
figure(1),imshow(BW1)
BW2= edge(I,'canny',0.1);  % ��Canny���ӽ��б�Ե��⣬�б���ֵΪ0.1
figure(2),imshow(BW2)
