I=imread('cameraman.tif');      % ����ԭͼ��I����
J=histeq(I);           % MATLABֱ��ͼ���⻯����histeq����ͼ��I����ֱ��ͼ���⻯ 
subplot(2,2,1),imshow(I);   % ��ʾԭͼ��                                     
subplot(2,2,2), imshow(J);  % ��ʾ������ͼ��
subplot(2,2,3),imhist (I,128); % ��ʾԭͼ���ֱ��ͼ�Ҷȷֲ�
subplot(2,2,4), imhist (J,128); % ��ʾ���⻯���ͼ��ֱ��ͼ
