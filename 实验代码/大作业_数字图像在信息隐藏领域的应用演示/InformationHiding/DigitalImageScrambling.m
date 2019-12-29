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
[filename,pathname]=uigetfile({'*.*';'*.bmp';'*.jpg';'*.tif';'*.jpg'},'ѡ��ͼ��');
if isequal(filename,0)||isequal(pathname,0)
    errordlg('����û��ѡȡͼƬ����','��ܰ��ʾ');%���û�����룬�򴴽�����Ի���
    return;
end
global image
image = [pathname,filename];%�ϳ�·��+�ļ���
global im 
im = imread(image);%��ȡͼ��
set(handles.axes1,'HandleVisibility','ON');%�����꣬�������
axes(handles.axes1);%%ʹ��ͼ�񣬲���������1
imshow(im);%������axes1��ʾԭͼ�� 


% --- Executes on button press in ImageScrambling.
function ImageScrambling_Callback(hObject, eventdata, handles)
% hObject    handle to ImageScrambling (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
k=imresize(im,[380,380]);%ͼƬ�ߴ�任Ϊ380��380��
j=rgb2gray(k);%ͼƬ���лҶȻ�����
axes(handles.axes2);%%ʹ��ͼ�񣬲���������2
imshow(j);%������axes2��ʾԭͼ�� 
title('ԭʼͼƬ�ҶȻ�')

size_j=size(j);
q=size_j;
for t=1:10
for a=1:q
for b=1:q
h(mod(a+b-2,q)+1,mod(a+2*b-3,q)+1)=j(a,b);%���о���任
end
end
j=h;
end
axes(handles.axes3);%%ʹ��ͼ�񣬲���������3
imshow(j);%������axes1��ʾԭͼ�� 
title('10������ͼƬ')%���10������ͼƬ

for t=1:40
for a=1:q
for b=1:q
h(mod(a+b-2,q)+1,mod(a+2*b-3,q)+1)=j(a,b);
end
end
j=h;
end
axes(handles.axes4);%%ʹ��ͼ�񣬲���������4
imshow(j);%������axes1��ʾԭͼ�� 
title('50������ͼƬ')

for t=1:40
for a=1:q
for b=1:q
h(mod(a+b-2,q)+1,mod(a+2*b-3,q)+1)=j(a,b);
end
end
j=h;
end
axes(handles.axes5);%%ʹ��ͼ�񣬲���������5
imshow(j);%������axes5��ʾԭͼ�� 
title('90������ͼƬ')%���һ���任���ں��ͼƬ


% --- Executes on button press in ScramblingRecovery.
function ScramblingRecovery_Callback(hObject, eventdata, handles)
% hObject    handle to ScramblingRecovery (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
k=imresize(im,[256,256]);%ͼƬ�ߴ�任Ϊ256��256��
j=rgb2gray(k);%ͼƬ���лҶȻ�����
h=fft2(j);
axes(handles.axes6);%%ʹ��ͼ�񣬲���������6
imshow(h),
title('����ͼƬ')
p=ifft2(h)/255;
axes(handles.axes7);%%ʹ��ͼ�񣬲���������7
imshow(p),
title('���һָ�')
