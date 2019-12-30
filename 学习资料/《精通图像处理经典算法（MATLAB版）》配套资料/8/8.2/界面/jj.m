function varargout = jj(varargin)
% JJ M-file for jj.fig
%      JJ, by itself, creates a new JJ or raises the existing
%      singleton*.
%
%      H = JJ returns the handle to a new JJ or the handle to
%      the existing singleton*.
%
%      JJ('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in JJ.M with the given input arguments.
%
%      JJ('Property','Value',...) creates a new JJ or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before jj_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to jj_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help jj

% Last Modified by GUIDE v2.5 22-May-2006 15:23:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @jj_OpeningFcn, ...
                   'gui_OutputFcn',  @jj_OutputFcn, ...
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


% --- Executes just before jj is made visible.
function jj_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to jj (see VARARGIN)
global imageA HSI HSIG glcms1 temp0 

% Choose default command line output for jj
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes jj wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = jj_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double

global edit1 imageA
edit1=get(handles.edit1,'string');
imageA=imread(edit1);


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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global imageA
[filename, pathname] = uigetfile( ...
{'*.bmp;*.jpg;*.tif;*.hdf;*.ico','Image Files (*.bmp,*.jpg,*.tif,*.ico)';
    '*.bmp',  'Image Files(*.bmp)'; ...
    '*.jpg','Image Files(*.jpg)'; ...
    '*.tif','Image Files(*.tif)'; ...
    '*.hdf','Image Files(*.hdf)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Pick a file');
fullname=[pathname filename];
if fullname~=0
    imageA=imread(fullname);
    set(handles.edit1,'string',fullname);
end




% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global imageA;
axes(handles.axes1);
imshow(imageA),title('原始彩色图像');

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global imageA HSI
HSI=rgb2hsv(imageA); %hsi是HSI颜色空间彩色图像
axes(handles.axes1);
imshow(HSI),title('HSI 空间彩色图像')


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global  HSI HSIG glcms stats temp0
HSIG=rgb2gray(HSI); % hsig:灰度图像
axes(handles.axes1);
imshow(HSIG),title('灰度图像')

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global HSIG glcms1 ga1 ga2 ga3 ga4 stats temp0

%计算64位灰度共生矩阵
 glcms1=graycomatrix(HSIG,'numlevels',64,'offset',[0 1;-1 1;-1 0; -1 -1]);
 %纹理特征统计值（对比度、相关性、熵、平稳度、二阶矩也叫能量）
 stats=graycoprops(glcms1,{'contrast','correlation','energy','homogeneity'});
 ga1=glcms1(:,:,1);%0度
 ga2=glcms1(:,:,2);%45
 ga3=glcms1(:,:,3);%90
 ga4=glcms1(:,:,4);%135
 energya1=0; energya2=0; energya3=0; energya4=0;
for i=1:64
  for  j=1:64
        energya1=energya1+sum(ga1(i,j)^2);
         energya2=energya2+sum(ga2(i,j)^2);
          energya3=energya3+sum(ga3(i,j)^2);
           energya4=energya4+sum(ga4(i,j)^2);
         j=j+1;
  end
i=i+1;
end
s1=0;s2=0;s3=0;s4=0;s5=0;
for m=1:4
    s1=stats.Contrast(1,m)+s1;
    m=m+1;
end
for m=1:4
    s2=stats.Correlation(1,m)+s2;
    m=m+1;
end
for m=1:4
    s3=stats.Energy(1,m)+s3;
    m=m+1;
end
for m=1:4
    s4=stats.Homogeneity(1,m)+s4;
    m=m+1;
end
s5=0.000001*(energya1+energya2+energya3+energya4);
temp0=[s1 s2 s3 s4 s5];
plot(temp0,'b.');
zoom on;


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global temp0 jpg RGB imageA

%输入a
temp1=[0 0 0 0 0];
for k=1:4
    jpg=strcat('a',num2str(k),'.jpg');
    RGB=imread(jpg);%temp1=im2bw(temp1);temp1=temp1(:);
    R=RGB(:,:,1);G=RGB(:,:,2);B=RGB(:,:,3);
    HSI=rgb2hsv(RGB);
    HSIG=rgb2gray(HSI);%figure,imshow(HSIG)
   %计算S分量的共生矩阵
   glcms1=graycomatrix(HSIG,'numlevels',64,'offset',[0 1;-1 1;-1 0; -1 -1]);
   %纹理特征统计值（对比度、相关性、熵、平稳度、二阶矩也叫能量）
  stats=graycoprops(glcms1,{'contrast','correlation','energy','homogeneity'});
 ga1=glcms1(:,:,1);%0度
 ga2=glcms1(:,:,2);%45
 ga3=glcms1(:,:,3);%90
 ga4=glcms1(:,:,4);%135
 energya1=0; energya2=0; energya3=0; energya4=0;
for i=1:64
  for  j=1:64
        energya1=energya1+sum(ga1(i,j)^2);
         energya2=energya2+sum(ga2(i,j)^2);
          energya3=energya3+sum(ga3(i,j)^2);
           energya4=energya4+sum(ga4(i,j)^2);
         j=j+1; 
  end
i=i+1;
end
s1=0;s2=0;s3=0;s4=0;s5=0;
for m=1:4
    s1=stats.Contrast(1,m)+s1;
    m=m+1;
end
for m=1:4
    s2=stats.Correlation(1,m)+s2;
    m=m+1;
end
for m=1:4
    s3=stats.Energy(1,m)+s3;
    m=m+1;
end
for m=1:4
    s4=stats.Homogeneity(1,m)+s4;
    m=m+1;
end
s5=0.000001*(energya1+energya2+energya3+energya4);
temp=[s1 s2 s3 s4 s5];
temp1=temp1+temp;
end
temp1=1/4*(temp1);

%输入b
temp2=[0 0 0 0 0];
for k=1:4
    jpg=strcat('b',num2str(k),'.jpg');
    RGB=imread(jpg);%temp1=im2bw(temp1);temp1=temp1(:);
    R=RGB(:,:,1);G=RGB(:,:,2);B=RGB(:,:,3);
    HSI=rgb2hsv(RGB);
    HSIG=rgb2gray(HSI);%figure,imshow(HSIG)
   %计算S分量的共生矩阵
   glcms1=graycomatrix(HSIG,'numlevels',64,'offset',[0 1;-1 1;-1 0; -1 -1]);
   %纹理特征统计值（对比度、相关性、熵、平稳度、二阶矩也叫能量）
  stats=graycoprops(glcms1,{'contrast','correlation','energy','homogeneity'});
 ga1=glcms1(:,:,1);%0度
 ga2=glcms1(:,:,2);%45
 ga3=glcms1(:,:,3);%90
 ga4=glcms1(:,:,4);%135
 energya1=0; energya2=0; energya3=0; energya4=0;
for i=1:64
  for  j=1:64
        energya1=energya1+sum(ga1(i,j)^2);
         energya2=energya2+sum(ga2(i,j)^2);
          energya3=energya3+sum(ga3(i,j)^2);
           energya4=energya4+sum(ga4(i,j)^2);
         j=j+1; 
  end
i=i+1;
end
s1=0;s2=0;s3=0;s4=0;s5=0;
for m=1:4
    s1=stats.Contrast(1,m)+s1;
    m=m+1;
end
for m=1:4
    s2=stats.Correlation(1,m)+s2;
    m=m+1;
end
for m=1:4
    s3=stats.Energy(1,m)+s3;
    m=m+1;
end
for m=1:4
    s4=stats.Homogeneity(1,m)+s4;
    m=m+1;
end
s5=0.000001*(energya1+energya2+energya3+energya4);
temp=[s1 s2 s3 s4 s5];
temp2=temp2+temp;
end
temp2=1/4*(temp2);

%输入e
temp3=[0 0 0 0 0];
for k=1:4
    jpg=strcat('e',num2str(k),'.jpg');
    RGB=imread(jpg);%temp1=im2bw(temp1);temp1=temp1(:);
    R=RGB(:,:,1);G=RGB(:,:,2);B=RGB(:,:,3);
    HSI=rgb2hsv(RGB);
    HSIG=rgb2gray(HSI);%figure,imshow(HSIG)
   %计算S分量的共生矩阵
   glcms1=graycomatrix(HSIG,'numlevels',64,'offset',[0 1;-1 1;-1 0; -1 -1]);
   %纹理特征统计值（对比度、相关性、熵、平稳度、二阶矩也叫能量）
  stats=graycoprops(glcms1,{'contrast','correlation','energy','homogeneity'});
 ga1=glcms1(:,:,1);%0度
 ga2=glcms1(:,:,2);%45
 ga3=glcms1(:,:,3);%90
 ga4=glcms1(:,:,4);%135
 energya1=0; energya2=0; energya3=0; energya4=0;
for i=1:64
  for  j=1:64
        energya1=energya1+sum(ga1(i,j)^2);
         energya2=energya2+sum(ga2(i,j)^2);
          energya3=energya3+sum(ga3(i,j)^2);
           energya4=energya4+sum(ga4(i,j)^2);
         j=j+1; 
  end
i=i+1;
end
s1=0;s2=0;s3=0;s4=0;s5=0;
for m=1:4
    s1=stats.Contrast(1,m)+s1;
    m=m+1;
end
for m=1:4
    s2=stats.Correlation(1,m)+s2;
    m=m+1;
end
for m=1:4
    s3=stats.Energy(1,m)+s3;
    m=m+1;
end
for m=1:4
    s4=stats.Homogeneity(1,m)+s4;
    m=m+1;
end
s5=0.000001*(energya1+energya2+energya3+energya4);
temp=[s1 s2 s3 s4 s5];
temp3=temp+temp3;
end
temp3=1/4*(temp3);

%输入m
temp4=[0 0 0 0 0];
for k=1:4
    jpg=strcat('m',num2str(k),'.jpg');
    RGB=imread(jpg);%temp1=im2bw(temp1);temp1=temp1(:);
    R=RGB(:,:,1);G=RGB(:,:,2);B=RGB(:,:,3);
    HSI=rgb2hsv(RGB);
    HSIG=rgb2gray(HSI);%figure,imshow(HSIG)
   %计算S分量的共生矩阵
   glcms1=graycomatrix(HSIG,'numlevels',64,'offset',[0 1;-1 1;-1 0; -1 -1]);
   %纹理特征统计值（对比度、相关性、熵、平稳度、二阶矩也叫能量）
  stats=graycoprops(glcms1,{'contrast','correlation','energy','homogeneity'});
 ga1=glcms1(:,:,1);%0度
 ga2=glcms1(:,:,2);%45
 ga3=glcms1(:,:,3);%90
 ga4=glcms1(:,:,4);%135
 energya1=0; energya2=0; energya3=0; energya4=0;
for i=1:64
  for  j=1:64
        energya1=energya1+sum(ga1(i,j)^2);
         energya2=energya2+sum(ga2(i,j)^2);
          energya3=energya3+sum(ga3(i,j)^2);
           energya4=energya4+sum(ga4(i,j)^2);
         j=j+1; 
  end
i=i+1;
end
s1=0;s2=0;s3=0;s4=0;s5=0;
for m=1:4
    s1=stats.Contrast(1,m)+s1;
    m=m+1;
end
for m=1:4
    s2=stats.Correlation(1,m)+s2;
    m=m+1;
end
for m=1:4
    s3=stats.Energy(1,m)+s3;
    m=m+1;
end
for m=1:4
    s4=stats.Homogeneity(1,m)+s4;
    m=m+1;
end
s5=0.000001*(energya1+energya2+energya3+energya4);
temp=[s1 s2 s3 s4 s5];
temp4=temp4+temp;
end
temp4=1/4*(temp4);

%输入g
temp5=[0 0 0 0 0];
for k=1:4
    jpg=strcat('g',num2str(k),'.jpg');
    RGB=imread(jpg);%temp1=im2bw(temp1);temp1=temp1(:);
    R=RGB(:,:,1);G=RGB(:,:,2);B=RGB(:,:,3);
    HSI=rgb2hsv(RGB);
    HSIG=rgb2gray(HSI);%figure,imshow(HSIG)
   %计算S分量的共生矩阵
   glcms1=graycomatrix(HSIG,'numlevels',64,'offset',[0 1;-1 1;-1 0; -1 -1]);
   %纹理特征统计值（对比度、相关性、熵、平稳度、二阶矩也叫能量）
  stats=graycoprops(glcms1,{'contrast','correlation','energy','homogeneity'});
 ga1=glcms1(:,:,1);%0度
 ga2=glcms1(:,:,2);%45
 ga3=glcms1(:,:,3);%90
 ga4=glcms1(:,:,4);%135
 energya1=0; energya2=0; energya3=0; energya4=0;
for i=1:64
  for  j=1:64
        energya1=energya1+sum(ga1(i,j)^2);
         energya2=energya2+sum(ga2(i,j)^2);
          energya3=energya3+sum(ga3(i,j)^2);
           energya4=energya4+sum(ga4(i,j)^2);
         j=j+1; 
  end
i=i+1;
end
s1=0;s2=0;s3=0;s4=0;s5=0;
for m=1:4
    s1=stats.Contrast(1,m)+s1;
    m=m+1;
end
for m=1:4
    s2=stats.Correlation(1,m)+s2;
    m=m+1;
end
for m=1:4
    s3=stats.Energy(1,m)+s3;
    m=m+1;
end
for m=1:4
    s4=stats.Homogeneity(1,m)+s4;
    m=m+1;
end
s5=0.000001*(energya1+energya2+energya3+energya4);
temp=[s1 s2 s3 s4 s5];
temp5=temp5+temp;
end
temp5=1/4*(temp5);

%输入h
temp6=[0 0 0 0 0];
for k=1:4
    jpg=strcat('h',num2str(k),'.jpg');
    RGB=imread(jpg);%temp1=im2bw(temp1);temp1=temp1(:);
    R=RGB(:,:,1);G=RGB(:,:,2);B=RGB(:,:,3);
    HSI=rgb2hsv(RGB);
    HSIG=rgb2gray(HSI);%figure,imshow(HSIG)
   %计算S分量的共生矩阵
   glcms1=graycomatrix(HSIG,'numlevels',64,'offset',[0 1;-1 1;-1 0; -1 -1]);
   %纹理特征统计值（对比度、相关性、熵、平稳度、二阶矩也叫能量）
  stats=graycoprops(glcms1,{'contrast','correlation','energy','homogeneity'});
 ga1=glcms1(:,:,1);%0度
 ga2=glcms1(:,:,2);%45
 ga3=glcms1(:,:,3);%90
 ga4=glcms1(:,:,4);%135
 energya1=0; energya2=0; energya3=0; energya4=0;
for i=1:64
  for  j=1:64
        energya1=energya1+sum(ga1(i,j)^2);
         energya2=energya2+sum(ga2(i,j)^2);
          energya3=energya3+sum(ga3(i,j)^2);
           energya4=energya4+sum(ga4(i,j)^2);
         j=j+1; 
  end
i=i+1;
end
s1=0;s2=0;s3=0;s4=0;s5=0;
for m=1:4
    s1=stats.Contrast(1,m)+s1;
    m=m+1;
end
for m=1:4
    s2=stats.Correlation(1,m)+s2;
    m=m+1;
end
for m=1:4
    s3=stats.Energy(1,m)+s3;
    m=m+1;
end
for m=1:4
    s4=stats.Homogeneity(1,m)+s4;
    m=m+1;
end
s5=0.000001*(energya1+energya2+energya3+energya4);
temp=[s1 s2 s3 s4 s5];
temp6=temp6+temp;
end
temp6=1/4*(temp6);

%判别
d1=0;
for n=1:5
   d0=[temp0(1,n)-temp1(1,n)]^2;
    d1=d1+d0;
end
 d1=sqrt(d1);
 
d2=0;
for n=1:5
   d0=[temp0(1,n)-temp2(1,n)]^2;
    d2=d2+d0;
end
 d2=sqrt(d2);
 
 d3=0;
for n=1:5
   d0=[temp0(1,n)-temp3(1,n)]^2;
    d3=d3+d0;
end
 d3=sqrt(d3);
 
 d4=0;
for n=1:5
   d0=[temp0(1,n)-temp4(1,n)]^2;
    d4=d4+d0;
end
 d4=sqrt(d4);
 
 d5=0;
for n=1:5
   d0=[temp0(1,n)-temp5(1,n)]^2;
    d5=d5+d0;
end
 d5=sqrt(d5);
 
 d6=0;
for n=1:5
   d0=[temp0(1,n)-temp6(1,n)]^2;
    d6=d6+d0;
end
 d6=sqrt(d6);
 
 dm=[d1 d2 d3 d4 d5 d6];
 [dm,i]=min(dm);
 switch i
     case 1
         axes(handles.axes2);imshow(imageA),title('小叶黎');   %axes(handles.axes3);disp(num2str(temp0));不知道如何才能把特征值显示出来
     case 2
       axes(handles.axes2);imshow(imageA),title('打碗碗花')
     case 3
        axes(handles.axes2);imshow(imageA),title('播娘蒿')
     case 4
         axes(handles.axes2);imshow(imageA),title('小麦')
     case 5
         axes(handles.axes2);imshow(imageA),title('独荇菜')
     case 6
          axes(handles.axes2);imshow(imageA),title('马鞭草')
     otherwise
          axes(handles.axes2);imshow(),title('无法识别 ')
 end



% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global imageA 

axes(handles.axes1);
imshow(imageA ),title('RGB 空间彩色图像')

