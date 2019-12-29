function varargout = CalculatePI(varargin)
% CALCULATEPI MATLAB code for CalculatePI.fig
%      CALCULATEPI, by itself, creates a new CALCULATEPI or raises the existing
%      singleton*.
%
%      H = CALCULATEPI returns the handle to a new CALCULATEPI or the handle to
%      the existing singleton*.
%
%      CALCULATEPI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CALCULATEPI.M with the given input arguments.
%
%      CALCULATEPI('Property','Value',...) creates a new CALCULATEPI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CalculatePI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CalculatePI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CalculatePI

% Last Modified by GUIDE v2.5 04-Nov-2019 21:37:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CalculatePI_OpeningFcn, ...
                   'gui_OutputFcn',  @CalculatePI_OutputFcn, ...
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


% --- Executes just before CalculatePI is made visible.
function CalculatePI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CalculatePI (see VARARGIN)

% Choose default command line output for CalculatePI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes CalculatePI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = CalculatePI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% 定义选择公式列表框函数
% --- Executes on selection change in lboxFormulas.
function lboxFormulas_Callback(hObject, eventdata, handles)
% hObject    handle to lboxFormulas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns lboxFormulas contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lboxFormulas
iFormula = round(get(handles.lboxFormulas,'value'));    %获取列表框内的点击项
switch iFormula   %根据点击项展示对应公式内容
    case 1
        FormulasDisplay = imread('Formula1.jpeg');
    case 2
        FormulasDisplay = imread('Formula2.jpeg');
    case 3
        FormulasDisplay = imread('Formula3.jpeg');
    case 4
        FormulasDisplay = imread('Formula4.jpeg');
    case 5
        FormulasDisplay = imread('pi.jpeg');
    otherwise
         return;
end        
axes(handles.FormulasDisplay);
clc;
image(FormulasDisplay);     %公式展示
axis off;


% --- Executes during object creation, after setting all properties.
function lboxFormulas_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lboxFormulas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editCalTime_Callback(hObject, eventdata, handles)
% hObject    handle to editCalTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editCalTime as text
%        str2double(get(hObject,'String')) returns contents of editCalTime as a double


% --- Executes during object creation, after setting all properties.
function editCalTime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editCalTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% 定义开始计算函数
% --- Executes on button press in pbtnCal.
function pbtnCal_Callback(hObject, eventdata, handles)
% hObject    handle to pbtnCal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
iFormula = round(get(handles.lboxFormulas,'value'));    %获取列表框内的点击项
N=round(str2num(get(handles.editCalTime,'String')));    %获取计算次数数值

switch iFormula     %根据点击项计算不同公式
    case 1
        for i=1:N
            CalcPI(i) = Formula1(i);
        end
        sLegend='公式1';
    case 2
        for i=1:N
            CalcPI(i) = Formula2(i);
        end
        sLegend='公式2';
    case 3
        for i=1:N
            CalcPI(i) = Formula3(i);
        end
        sLegend='公式3';
    case 4
        for i=1:N
            CalcPI(i) = Formula4(i);
        end
        sLegend='公式4';
    case 5
        h = waitbar(0,'正在计算，请稍等……');    %显示运行进度条
        for i=1:N
            CalcPI(1,i) = Formula1(i);
            CalcPI(2,i) = Formula2(i);
            CalcPI(3,i) = Formula3(i);
            CalcPI(4,i) = Formula4(i);
            waitbar(i/N,h);
        end
        close(h);   %关闭运行进度条
        sLegend={'公式1','公式2','公式3','公式4'};
    otherwise
        disp('Unknown method.');
        return;
end

% 添加控件相应内容显示
set(handles.textShowResult,'String',char(CalcPI(1,N)));   %计算结果文本框显示计算结果
axes(handles.ImagesDisplay);    %绘制对应公式的计算图像
clc;
plot(1:N,CalcPI);     %绘制计算图像
legend(sLegend);     % 添加图例
xlabel('计算次数');     % 定义横坐标标签
ylabel('π的值');      % 定义纵坐标标签
line([1,N],[pi,pi],'LineStyle',':','Color','r');    % 绘制真实pi值的图像，红色点线
            

% 定义Formula1的计算方式
function CalcPI=Formula1(N)
% 公式1 π=4*∑((-1).^(n-1)./(2*n-1))

% 原方法可以实现函数图像绘制，但是无法获取最终计算结果
% n=(1:N);
% f1=(-1).^(n-1)./(2*n-1);    %f1 记录π的推导公式1
% f1=4*cumsum(f1);    % 用cumsum函数累加计算公式1各项
% CalcPI=f1;      %返回f1的值
% disp(f1(N));
% disp(CalcPI);

% 新方法利用循环取每个点进行运算
p=1;a=1;b=1;item=1;f=1;
for i=1:N
    b=b+2;
    f=-f;
    item=f*(a/b);
    p=p+item;
end
% digits规定运算精度为256
digits(256);
p=vpa(p*4);     %vpa用来控制运算精度
CalcPI=p;


% 定义Formula2的计算方式
function CalcPI=Formula2(N)
% 公式2 π=2*∏(((2*n).^2)./(2*n-1)*(2*n+1))
p=1;
for i=1:N  
   a=i*2;
   p=p*((a*a)/((2*i-1)*(2*i+1)));
end
% digits规定运算精度为256
digits(256);
p=vpa(p*2);     %vpa用来控制运算精度
CalcPI=p;


% 定义Formula3的计算方式
function CalcPI=Formula3(N)

%n=(1:N);
%f3=(n-1)./(2*n-1);     % f3先记录每个累加项中的累乘项
%f3(1)=1;   % 需要特别说明第一个累乘项为1，否则按照f3计算为0
%f3=cumprod(f3);   % 接着用cumprod函数计算每个累乘项的累乘结果
%f3=2*cumsum(f3);    % 最后用cumsum函数把每个累乘结果累加
%CalcPI=f3;      %返回f3的值

n=1;
s=3;p=1;
for i=1:N
    a=n;
    n=(i/(s+(i-1)*2))*a;
    p=n+p;
end
% digits规定运算精度为256
digits(256);
p=vpa(p*2);     %vpa用来控制运算精度
CalcPI=p;


% 定义Formula4的计算方式  
function CalcPI=Formula4(N)
% 公式4 π=2*∏(1+1./(2*n-1)*(2*n+1))

%n=(1:N);
%f4=(1+1./(4*n.^2-1));   % f4记录π的推导公式4
%f4=2*cumprod(f4);   % 用cumprod函数累乘公式4各项
%CalcPI=f4;      %返回f4的值

p=4/3;
for i=2:N
    a= 2*i-1;
    p = p*(1+1/(a*(a+2)));
end
% digits规定运算精度为256
digits(256);
p=vpa(p*2);     %vpa用来控制运算精度
CalcPI=p;


% 退出程序函数
% --- Executes on button press in pbtnExit.
function pbtnExit_Callback(hObject, eventdata, handles)
% hObject    handle to pbtnExit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
quit = questdlg('是否确定退出 ?','退出界面','退出','取消','取消');
if strcmp(quit,'取消')
    return;
end
close
