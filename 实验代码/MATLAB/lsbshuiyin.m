message='image2.jpg';
lsb = 3; name = 'image1.jpg';
image = imread(name);image2=imread(message);
subplot(2,2,1),imshow(image);title('Í¼Ïñ');
subplot(2,2,2),imshow(image2);title('Ë®Ó¡');
msg_origin = unicode2native(message, 'UTF-8');  
msg_bin = dec2bin(msg_origin, 8);
msg = blanks(9);
for i = 1 : size(msg_bin, 1)
    msg(i, :) = strcat(msg_bin(i, :), char(mod(i, 2) + '0'));
end
msg = strjoin(cellstr(msg)','');
msg(end) = char(mod(size(msg_bin, 1) + 1, 2) + '0');  

len = length(msg) / lsb;
tmp = blanks(len);
for i = 1 : len
    tmp(i) = char(bin2dec(msg((i - 1) * lsb + 1 : i * lsb)) + '0');  
end

% use RGB
result = image;
rgb = 1;
[len_R, len_G, len_B] = size(result);

for R = 1 : len_R
    for G = 1 : len_G
        for B = 1 : len_B
            if rgb <= len
                result(R, G, B) = result(R, G, B) - mod(result(R, G, B), 2^lsb) + double(tmp(rgb) - '0');
                rgb = rgb + 1;
            end
        end
    end
end
subplot(2,2,3),imshow(result);title('¼ÓË®Ó¡Í¼Ïñ');
imwrite(result, 'result.bmp');  

name='result.bmp';
image = imread(name);
lsb = 3;
index = 1;
rgb = zeros(0);
[len_R, len_G, len_B] = size(image);
flag = char('0');   
for R = 1 : len_R
    for G = 1 : len_G
        tmp = blanks(0);
        for B = 1 : len_B
            tmp = strcat(tmp, mod(image(R, G, B), 2^lsb) + '0');  
        end
        tmp_bin = dec2bin(tmp - '0', 3)';
        rgb(index) = bin2dec(tmp_bin(1 : 8));
        if flag + tmp_bin(9) ~= 97  
            msg_origin = native2unicode(rgb, 'UTF-8');
            j=imread(msg_origin);
            subplot(2,2,4),imshow(j);title('Ë®Ó¡Í¼Ïñ');
            imwrite(j,'recover.bmp');
            return;
        end
        index = index + 1;
        flag = tmp_bin(9);
    end
end



