%  MATLAB  ����edge����ʵ�ָ����ӽ��б�Ե�������
I = imread('tire.tif');   % ����ԭʼ�Ҷ�ͼ����ʾ
figure(1),imshow(I); 
BW1 = edge(I,'sobel',0.1);    % ��Sobel���ӽ��б�Ե��⣬�б���ֵΪ0.1
figure(2),imshow(BW1)
BW2 = edge(I,'roberts',0.1);  %��Roberts���ӽ��б�Ե��⣬�б���ֵΪ0.1
figure(3),imshow(BW2)
BW3 = edge(I,'prewitt',0.1);  %��Prewitt���ӽ��б�Ե��⣬�б���ֵΪ0.1
figure(4),imshow(BW3)
