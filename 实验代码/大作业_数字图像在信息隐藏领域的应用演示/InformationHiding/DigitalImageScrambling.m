function varargout = DigitalImageScrambling(varargin)
% DIGITALIMAGESCRAMBLING MATLAB code for DigitalImageScrambling.fig
%      DIGITALIMAGESCRAMBLING, by itself, creates a new DIGITALIMAGESCRAMBLING or raises the existing
%      singleton*.
%
%      H = DIGITALIMAGESCRAMBLING returns the handle to a new DIGITALIMAGESCRAMBLING or the handle to
%      the existing singleton*.
%
%      DIGITALIMAGESCRAMBLING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DIGITALIMAGESCRAMBLING.M with the given input arguments.
%
%      DIGITALIMAGESCRAMBLING('Property','Value',...) creates a new DIGITALIMAGESCRAMBLING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DigitalImageScrambling_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DigitalImageScrambling_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DigitalImageScrambling

% Last Modified by GUIDE v2.5 28-Nov-2019 16:40:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DigitalImageScrambling_OpeningFcn, ...
                   'gui_OutputFcn',  @DigitalImageScrambling_OutputFcn, ...
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


% --- Executes just before DigitalImageScrambling is made visible.
function DigitalImageScrambling_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DigitalImageScrambling (see VARARGIN)

% Choose default command line output for DigitalImageScrambling
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DigitalImageScrambling wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DigitalImageScrambling_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in ImageScrambling.
function ImageScrambling_Callback(hObject, eventdata, handles)
% hObject    handle to ImageScrambling (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
k=imresize(im,[380,380]);%图片尺寸变换为380×380的
j=rgb2gray(k);%图片进行灰度化处理
axes(handles.axes2);%%使用图像，操作在坐标2
imshow(j);%在坐标axes2显示原图像 
title('原始图片灰度化')

size_j=size(j);
q=size_j;
for t=1:10
for a=1:q
for b=1:q
h(mod(a+b-2,q)+1,mod(a+2*b-3,q)+1)=j(a,b);%进行矩阵变换
end
end
j=h;
end
axes(handles.axes3);%%使用图像，操作在坐标3
imshow(j);%在坐标axes1显示原图像 
title('10次置乱图片')%输出10次置乱图片

for t=1:40
for a=1:q
for b=1:q
h(mod(a+b-2,q)+1,mod(a+2*b-3,q)+1)=j(a,b);
end
end
j=h;
end
axes(handles.axes4);%%使用图像，操作在坐标4
imshow(j);%在坐标axes1显示原图像 
title('50次置乱图片')

for t=1:40
for a=1:q
for b=1:q
h(mod(a+b-2,q)+1,mod(a+2*b-3,q)+1)=j(a,b);
end
end
j=h;
end
axes(handles.axes5);%%使用图像，操作在坐标5
imshow(j);%在坐标axes5显示原图像 
title('90次置乱图片')%输出一个变换周期后的图片


% --- Executes on button press in ScramblingRecovery.
function ScramblingRecovery_Callback(hObject, eventdata, handles)
% hObject    handle to ScramblingRecovery (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
k=imresize(im,[256,256]);%图片尺寸变换为256×256的
j=rgb2gray(k);%图片进行灰度化处理
h=fft2(j);
axes(handles.axes6);%%使用图像，操作在坐标6
imshow(h),
title('置乱图片')
p=ifft2(h)/255;
axes(handles.axes7);%%使用图像，操作在坐标7
imshow(p),
title('置乱恢复')
