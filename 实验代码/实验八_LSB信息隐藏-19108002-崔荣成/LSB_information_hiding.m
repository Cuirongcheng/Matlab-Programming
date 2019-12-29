function varargout = LSB_information_hiding(varargin)
% LSB_INFORMATION_HIDING MATLAB code for LSB_information_hiding.fig
%      LSB_INFORMATION_HIDING, by itself, creates a new LSB_INFORMATION_HIDING or raises the existing
%      singleton*.
%
%      H = LSB_INFORMATION_HIDING returns the handle to a new LSB_INFORMATION_HIDING or the handle to
%      the existing singleton*.
%
%      LSB_INFORMATION_HIDING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LSB_INFORMATION_HIDING.M with the given input arguments.
%
%      LSB_INFORMATION_HIDING('Property','Value',...) creates a new LSB_INFORMATION_HIDING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LSB_information_hiding_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LSB_information_hiding_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LSB_information_hiding

% Last Modified by GUIDE v2.5 14-Dec-2019 16:57:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LSB_information_hiding_OpeningFcn, ...
                   'gui_OutputFcn',  @LSB_information_hiding_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before LSB_information_hiding is made visible.
function LSB_information_hiding_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LSB_information_hiding (see VARARGIN)

% Choose default command line output for LSB_information_hiding
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes LSB_information_hiding wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = LSB_information_hiding_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in openImage.
function openImage_Callback(hObject, eventdata, handles)
% hObject    handle to openImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global picture
global filename
axes(handles.axes1)
[filename,pathname]=uigetfile({ ...
    '*.*','All Files(*.*)';},...
    '选择文件');
if isequal([filename,pathname],[0,0])
    return
else   
   videoname = fullfile(pathname,filename);
   mov=imread(videoname);
   imshow(mov);
   picture=mov;  
   title('原始图像');
end


% --- Executes on button press in clearImage.
function clearImage_Callback(hObject, eventdata, handles)
% hObject    handle to clearImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
imshow([255]);
set(handles.edit1,'String','');
set(handles.edit2,'String','');


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in openhideImage.
function openhideImage_Callback(hObject, eventdata, handles)
% hObject    handle to openhideImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global picture_shuiyin syimage
global filename
axes(handles.axes2)
[filename,pathname]=uigetfile({ ...
    '*.*','All Files(*.*)';},...
    '选择文件');
if isequal([filename,pathname],[0,0])
    return
else   
   syimage = fullfile(pathname,filename);
   mov=imread(syimage);
   imshow(mov);
   picture_shuiyin=mov;  
   title('水印图像');
end


% --- Executes on button press in hideImage.
function hideImage_Callback(hObject, eventdata, handles)
% hObject    handle to hideImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global picture syimage lsb psy; 
lsb = 3;
msg_origin = unicode2native(syimage, 'UTF-8');  
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
result = picture;
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
axes(handles.axes2);%%使用图像，操作在坐标3
%在坐标axes1显示原图像 
psy = result;
imshow(result);title('加水印图像'); 


% --- Executes on button press in hideText.
function hideText_Callback(hObject, eventdata, handles)
% hObject    handle to hideText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global picture
global hide_picture
str=get(handles.edit1,'String');
[img,st]=hide_text(picture,str);
axes(handles.axes1);
imshow(img);
title('嵌入隐藏信息后的图像');
hide_picture=img;


% --- Executes on button press in savetextImage.
function savetextImage_Callback(hObject, eventdata, handles)
% hObject    handle to savetextImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global hide_picture
    [filename, pathname] = uiputfile('*.bmp', '保存文本水印图像');        
    name = fullfile(pathname,filename);
    imwrite(hide_picture,name,'bmp');


% --- Executes on button press in savehideImage.
function savehideImage_Callback(hObject, eventdata, handles)
% hObject    handle to savehideImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global psy
    [filename, pathname] = uiputfile('*.bmp', '保存图像水印图像');        
    name = fullfile(pathname,filename);
    imwrite(psy,name,'bmp');


% --- Executes on button press in openImage2.
function openImage2_Callback(hObject, eventdata, handles)
% hObject    handle to openImage2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global picture syimage2
global filename
axes(handles.axes5)
[filename,pathname]=uigetfile({ ...
    '*.*','All Files(*.*)';},...
    '选择文件');
if isequal([filename,pathname],[0,0])
    return
else   
   syimage2 = fullfile(pathname,filename);
   mov=imread(syimage2);
   imshow(mov);
   picture=mov;  
   title('带水印图像');
end


% --- Executes on button press in clearImage2.
function clearImage2_Callback(hObject, eventdata, handles)
% hObject    handle to clearImage2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes5);
imshow([255]);
set(handles.edit1,'String','');
set(handles.edit2,'String','');



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in showImage.
function showImage_Callback(hObject, eventdata, handles)
% hObject    handle to showImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global lsb syimage2; 
image = imread(syimage2);
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
            axes(handles.axes6);%%使用图像，操作在坐标4
            imshow(j);title('水印图像');
            return;
        end
        index = index + 1;
        flag = tmp_bin(9);
    end
end


% --- Executes on button press in showText.
function showText_Callback(hObject, eventdata, handles)
% hObject    handle to showText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global picture
axes(handles.axes5);
str=extract_info(picture);
set(handles.edit2,'String',str);


% --- Executes on button press in saveshowImage.
function saveshowImage_Callback(hObject, eventdata, handles)
% hObject    handle to saveshowImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in saveText.
function saveText_Callback(hObject, eventdata, handles)
% hObject    handle to saveText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
