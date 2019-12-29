function varargout = VisualPasswordSharing(varargin)
% VISUALPASSWORDSHARING MATLAB code for VisualPasswordSharing.fig
%      VISUALPASSWORDSHARING, by itself, creates a new VISUALPASSWORDSHARING or raises the existing
%      singleton*.
%
%      H = VISUALPASSWORDSHARING returns the handle to a new VISUALPASSWORDSHARING or the handle to
%      the existing singleton*.
%
%      VISUALPASSWORDSHARING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VISUALPASSWORDSHARING.M with the given input arguments.
%
%      VISUALPASSWORDSHARING('Property','Value',...) creates a new VISUALPASSWORDSHARING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before VisualPasswordSharing_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to VisualPasswordSharing_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help VisualPasswordSharing

% Last Modified by GUIDE v2.5 01-Dec-2019 21:24:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @VisualPasswordSharing_OpeningFcn, ...
                   'gui_OutputFcn',  @VisualPasswordSharing_OutputFcn, ...
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


% --- Executes just before VisualPasswordSharing is made visible.
function VisualPasswordSharing_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to VisualPasswordSharing (see VARARGIN)

% Choose default command line output for VisualPasswordSharing
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes VisualPasswordSharing wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = VisualPasswordSharing_OutputFcn(hObject, eventdata, handles) 
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
global img
img = imread(image);%读取图像
set(handles.axes1,'HandleVisibility','ON');%打开坐标，方便操作
axes(handles.axes1);%%使用图像，操作在坐标1
imshow(img);%在坐标axes1显示原图像 


% --- Executes on button press in grayscale.
function grayscale_Callback(hObject, eventdata, handles)
% hObject    handle to grayscale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img im 
im = rgb2gray(img);% 灰度化
set(handles.axes7,'HandleVisibility','ON');%打开坐标，方便操作
axes(handles.axes7);%%使用图像，操作在坐标1
imshow(im);%在坐标axes1显示原图像 

% --- Executes on button press in GenerateShadow.
function GenerateShadow_Callback(hObject, eventdata, handles)
% hObject    handle to GenerateShadow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im m n x yy1 yy2 yy3 yy4
[m,n]=size(im);% 读取图片的大小
for i=1:m*n %把灰度值大于250的像素变成250
	if im(i)>250
        im(i)=250;
    end
end                              
s=double(im)+1; %把数据类型转换成函数符合要求的双精度类型           
x=[1 2 3 4];    %x的取值为1、2、3、4
g1=zeros(m,n);  %为每个分存图像预分配空间             
g2=zeros(m,n);
g3=zeros(m,n);
g4=zeros(m,n);
yy1=zeros(m,n);
yy2=zeros(m,n);
yy3=zeros(m,n);
yy4=zeros(m,n);
y1=zeros(m,n);
y2=zeros(m,n);
y3=zeros(m,n);
y4=zeros(m,n);
for j=1:m*n          %循环处理每个像素生成影子图像        
    a1=mod(2*j,251);    %随机生成系数
    a2=mod(3*j,251);
    f=[a1 a2 s(j)];     %构造函数
    g1(j)=polyval(f,x(1));
    yy1(j)=mod(g1(j),251);
    g2(j)=polyval(f,x(2));
    yy2(j)=mod(g2(j),251);
    g3(j)=polyval(f,x(3));
    yy3(j)=mod(g3(j),251);
    g4(j)=polyval(f,x(4));
    yy4(j)=mod(g4(j),251);
end
y1=uint8(yy1-1)
y2=uint8(yy2-1);
y3=uint8(yy3-1);
y4=uint8(yy3-1);
% figure,imshow(y1);%显示图像 
axes(handles.axes2);%%使用图像，操作在坐标2
imshow(y1);%在坐标axes2显示原图像 
axes(handles.axes3);%%使用图像，操作在坐标3
imshow(y2);%在坐标axes3显示原图像            
axes(handles.axes4);%%使用图像，操作在坐标4
imshow(y3);%在坐标axes4显示原图像 
axes(handles.axes5);%%使用图像，操作在坐标5
imshow(y4);%在坐标axes5显示原图像 


% --- Executes on button press in restoreImage.
function restoreImage_Callback(hObject, eventdata, handles)
% hObject    handle to restoreImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global m n x yy1 yy2 yy3
l1=x(2)*x(3)/[(x(1)-x(2))*(x(1)-x(3))];
l2=x(1)*x(3)/[(x(2)-x(1))*(x(2)-x(3))];
l3=x(1)*x(2)/[(x(3)-x(1))*(x(3)-x(2))];
rr1=zeros(m,n);
r=zeros(m,n);
for j=1:m*n
rr1(j)=mod(yy1(j)*l1+yy2(j)*l2+yy3(j)*l3,251);  % 恢复出每个像素的值
end

r=uint8(rr1-1);
axes(handles.axes6);%%使用图像，操作在坐标6
imshow(r);%在坐标axes6显示原图像    


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
