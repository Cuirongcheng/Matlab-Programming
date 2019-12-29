function varargout = DigitalWatermarking(varargin)
% DIGITALWATERMARKING MATLAB code for DigitalWatermarking.fig
%      DIGITALWATERMARKING, by itself, creates a new DIGITALWATERMARKING or raises the existing
%      singleton*.
%
%      H = DIGITALWATERMARKING returns the handle to a new DIGITALWATERMARKING or the handle to
%      the existing singleton*.
%
%      DIGITALWATERMARKING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DIGITALWATERMARKING.M with the given input arguments.
%
%      DIGITALWATERMARKING('Property','Value',...) creates a new DIGITALWATERMARKING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DigitalWatermarking_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DigitalWatermarking_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DigitalWatermarking

% Last Modified by GUIDE v2.5 29-Nov-2019 10:00:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DigitalWatermarking_OpeningFcn, ...
                   'gui_OutputFcn',  @DigitalWatermarking_OutputFcn, ...
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


% --- Executes just before DigitalWatermarking is made visible.
function DigitalWatermarking_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DigitalWatermarking (see VARARGIN)

% Choose default command line output for DigitalWatermarking
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DigitalWatermarking wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DigitalWatermarking_OutputFcn(hObject, eventdata, handles) 
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
[filename,pathname]=uigetfile({'*.*';'*.bmp';'*.jpg';'*.tif';'*.jpg'},'选择图像');
if isequal(filename,0)||isequal(pathname,0)
    errordlg('您还没有选取图片！！','温馨提示');%如果没有输入，则创建错误对话框
    return;
end
global image
image = [pathname,filename];%合成路径+文件名
global im 
im = imread(image);%读取图像
set(handles.axes1,'HandleVisibility','ON');%打开坐标，方便操作
axes(handles.axes1);%%使用图像，操作在坐标1
imshow(im);%在坐标axes1显示原图像 


% --- Executes on button press in openWatermarking.
function openWatermarking_Callback(hObject, eventdata, handles)
% hObject    handle to openWatermarking (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname]=uigetfile({'*.*';'*.bmp';'*.jpg';'*.tif';'*.jpg'},'选择图像');
if isequal(filename,0)||isequal(pathname,0)
    errordlg('您还没有选取图片！！','温馨提示');%如果没有输入，则创建错误对话框
    return;
end
global syimage
syimage = [pathname,filename];%合成路径+文件名
global syim 
syim = imread(syimage);%读取图像
set(handles.axes2,'HandleVisibility','ON');%打开坐标，方便操作
axes(handles.axes2);%%使用图像，操作在坐标1
imshow(syim);%在坐标axes1显示原图像 


% --- Executes on button press in inputWatermarking.
function inputWatermarking_Callback(hObject, eventdata, handles)
% hObject    handle to inputWatermarking (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global syimage im lsb; 
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
result = im;
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
axes(handles.axes3);%%使用图像，操作在坐标3
%在坐标axes1显示原图像 
imshow(result);title('加水印图像');
imwrite(result, 'result.bmp');  


% --- Executes on button press in restoreWatermarking.
function restoreWatermarking_Callback(hObject, eventdata, handles)
% hObject    handle to restoreWatermarking (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global lsb; 
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
            axes(handles.axes4);%%使用图像，操作在坐标4
            imshow(j);title('水印图像');
            imwrite(j,'recover.bmp');
            return;
        end
        index = index + 1;
        flag = tmp_bin(9);
    end
end
