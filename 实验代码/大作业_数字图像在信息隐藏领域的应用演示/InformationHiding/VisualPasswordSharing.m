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
[filename,pathname]=uigetfile({'*.*';'*.bmp';'*.jpg';'*.tif';'*.jpg'},'ѡ��ͼ��');
if isequal(filename,0)||isequal(pathname,0)
    errordlg('����û��ѡȡͼƬ����','��ܰ��ʾ');%���û�����룬�򴴽�����Ի���
    return;
end
global image
image = [pathname,filename];%�ϳ�·��+�ļ���
global img
img = imread(image);%��ȡͼ��
set(handles.axes1,'HandleVisibility','ON');%�����꣬�������
axes(handles.axes1);%%ʹ��ͼ�񣬲���������1
imshow(img);%������axes1��ʾԭͼ�� 


% --- Executes on button press in grayscale.
function grayscale_Callback(hObject, eventdata, handles)
% hObject    handle to grayscale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img im 
im = rgb2gray(img);% �ҶȻ�
set(handles.axes7,'HandleVisibility','ON');%�����꣬�������
axes(handles.axes7);%%ʹ��ͼ�񣬲���������1
imshow(im);%������axes1��ʾԭͼ�� 

% --- Executes on button press in GenerateShadow.
function GenerateShadow_Callback(hObject, eventdata, handles)
% hObject    handle to GenerateShadow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im m n x yy1 yy2 yy3 yy4
[m,n]=size(im);% ��ȡͼƬ�Ĵ�С
for i=1:m*n %�ѻҶ�ֵ����250�����ر��250
	if im(i)>250
        im(i)=250;
    end
end                              
s=double(im)+1; %����������ת���ɺ�������Ҫ���˫��������           
x=[1 2 3 4];    %x��ȡֵΪ1��2��3��4
g1=zeros(m,n);  %Ϊÿ���ִ�ͼ��Ԥ����ռ�             
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
for j=1:m*n          %ѭ������ÿ����������Ӱ��ͼ��        
    a1=mod(2*j,251);    %�������ϵ��
    a2=mod(3*j,251);
    f=[a1 a2 s(j)];     %���캯��
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
% figure,imshow(y1);%��ʾͼ�� 
axes(handles.axes2);%%ʹ��ͼ�񣬲���������2
imshow(y1);%������axes2��ʾԭͼ�� 
axes(handles.axes3);%%ʹ��ͼ�񣬲���������3
imshow(y2);%������axes3��ʾԭͼ��            
axes(handles.axes4);%%ʹ��ͼ�񣬲���������4
imshow(y3);%������axes4��ʾԭͼ�� 
axes(handles.axes5);%%ʹ��ͼ�񣬲���������5
imshow(y4);%������axes5��ʾԭͼ�� 


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
rr1(j)=mod(yy1(j)*l1+yy2(j)*l2+yy3(j)*l3,251);  % �ָ���ÿ�����ص�ֵ
end

r=uint8(rr1-1);
axes(handles.axes6);%%ʹ��ͼ�񣬲���������6
imshow(r);%������axes6��ʾԭͼ��    


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
