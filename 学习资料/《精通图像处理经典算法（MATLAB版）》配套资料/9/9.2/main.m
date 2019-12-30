I = imread('4.jpg');   
gray = rgb2gray(I);   
YCbCr = rgb2ycbcr(I); % ��ͼ��ת��ΪYCbCr��ɫ�ռ�  
heigth = size(gray,1); % ��ȡͼ��ߴ�
width = size(gray,2);   
for i = 1:heigth % ���÷�ɫģ�Ͷ�ֵ��ͼ��   
    for j = 1:width   
        Y = YCbCr(i,j,1);   
        Cb = YCbCr(i,j,2);   
        Cr = YCbCr(i,j,3);   
        if(Y < 80)   
            gray(i,j) = 0;   
        else   
            if(skin(Y,Cb,Cr) == 1) %����ɫ��ģ�ͽ���ͼ���ֵ��  
                gray(i,j) = 255;   
            else   
                gray(i,j) = 0;   
            end   
        end   
    end   
end   
SE=strel('arbitrary',eye(5)); % ��ֵͼ����̬ѧ����   
gray = imopen(gray,SE);%������    
imshow(gray);%��ʾ��ֵͼ��   
 [L,num] = bwlabel(gray,8); % ���ñ�Ƿ���ѡȡ��ͼ�еİ�ɫ����  
STATS = regionprops(L,'BoundingBox');%������������   
n = 1;   % ��ž���ɸѡ�Ժ�õ������о��ο�   
result = zeros(n,4);   
figure,imshow(I);   
hold on;   
for i = 1:num   %��ʼɸѡ�ض�����
    box = STATS(i).BoundingBox;   
    x = box(1);    %��������x   
    y = box(2);    %��������y   
    w = box(3);    %���ο��w   
    h = box(4);    %���θ߶�h   
    ratio = h/w;   % ��Ⱥ͸߶ȵı���   
    ux = uint8(x);   
    uy = uint8(y);   
    if ux > 1   
        ux = ux - 1;   
    end   
    if uy > 1   
        uy = uy - 1;   
    end   
    if w < 20 || h < 20 || w*h < 400   %���εĳ���ķ�Χ����������������趨
        continue   
    elseif ratio < 2 && ratio > 0.6 && findeye(gray,ux,uy,w,h) == 1
  %���ݡ���ͥ���ۡ�����߶ȺͿ�ȱ���Ӧ���ڣ�0.6,2���ڣ�
        result(n,:) = [ux uy w h];   % �洢�����ľ�������   
        n = n+1;   
    end   
end   
if  size(result,1) == 1 && result(1,1) > 0   % �Կ�����������������б��
    rectangle('Position',[result(1,1),result(1,2),result(1,3),result(1,4)],'EdgeColor','r');   
else   
    % ������������ľ����������1���ٸ���������Ϣ����ɸѡ   
    for m = 1:size(result,1)   
        m1 = result(m,1);   
        m2 = result(m,2);   
        m3 = result(m,3);   
        m4 = result(m,4);   
        % ������յ���������   
        if m1 + m3 < width && m2 + m4 < heigth   
            rectangle('Position',[m1,m2,m3,m4],'EdgeColor','r');   
        end   
    end   
end   
