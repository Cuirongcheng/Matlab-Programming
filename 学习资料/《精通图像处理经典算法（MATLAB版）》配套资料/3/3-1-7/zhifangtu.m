J=imread('tire.tif');subplot(2,4,1),imshow(J);     
subplot(2,4,5),imhist(J,16);   %��ʾͼ��ĻҶ�ֱ��ͼ������16���Ҷȼ���
J=imread('pout.tif');subplot(2,4,2),imshow(J);
subplot(2,4,6),imhist(J,32);   %��ʾͼ��ĻҶ�ֱ��ͼ������32���Ҷȼ���
J=imread('liftingbody.png');subplot(2,4,3),imshow(J);
subplot(2,4,7),imhist(J,128);  %��ʾͼ��ĻҶ�ֱ��ͼ������128���Ҷȼ���
J=imread('cameraman.tif');subplot(2,4,4),imshow(J);
subplot(2,4,8),imhist(J,256);  %��ʾͼ��ĻҶ�ֱ��ͼ������256���Ҷȼ��� 
