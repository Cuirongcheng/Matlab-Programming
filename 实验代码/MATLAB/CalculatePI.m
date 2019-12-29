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


% ����ѡ��ʽ�б����
% --- Executes on selection change in lboxFormulas.
function lboxFormulas_Callback(hObject, eventdata, handles)
% hObject    handle to lboxFormulas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns lboxFormulas contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lboxFormulas
iFormula = round(get(handles.lboxFormulas,'value'));    %��ȡ�б���ڵĵ����
switch iFormula   %���ݵ����չʾ��Ӧ��ʽ����
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
image(FormulasDisplay);     %��ʽչʾ
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


% ���忪ʼ���㺯��
% --- Executes on button press in pbtnCal.
function pbtnCal_Callback(hObject, eventdata, handles)
% hObject    handle to pbtnCal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
iFormula = round(get(handles.lboxFormulas,'value'));    %��ȡ�б���ڵĵ����
N=round(str2num(get(handles.editCalTime,'String')));    %��ȡ���������ֵ

switch iFormula     %���ݵ������㲻ͬ��ʽ
    case 1
        for i=1:N
            CalcPI(i) = Formula1(i);
        end
        sLegend='��ʽ1';
    case 2
        for i=1:N
            CalcPI(i) = Formula2(i);
        end
        sLegend='��ʽ2';
    case 3
        for i=1:N
            CalcPI(i) = Formula3(i);
        end
        sLegend='��ʽ3';
    case 4
        for i=1:N
            CalcPI(i) = Formula4(i);
        end
        sLegend='��ʽ4';
    case 5
        h = waitbar(0,'���ڼ��㣬���Եȡ���');    %��ʾ���н�����
        for i=1:N
            CalcPI(1,i) = Formula1(i);
            CalcPI(2,i) = Formula2(i);
            CalcPI(3,i) = Formula3(i);
            CalcPI(4,i) = Formula4(i);
            waitbar(i/N,h);
        end
        close(h);   %�ر����н�����
        sLegend={'��ʽ1','��ʽ2','��ʽ3','��ʽ4'};
    otherwise
        disp('Unknown method.');
        return;
end

% ��ӿؼ���Ӧ������ʾ
set(handles.textShowResult,'String',char(CalcPI(1,N)));   %�������ı�����ʾ������
axes(handles.ImagesDisplay);    %���ƶ�Ӧ��ʽ�ļ���ͼ��
clc;
plot(1:N,CalcPI);     %���Ƽ���ͼ��
legend(sLegend);     % ���ͼ��
xlabel('�������');     % ����������ǩ
ylabel('�е�ֵ');      % �����������ǩ
line([1,N],[pi,pi],'LineStyle',':','Color','r');    % ������ʵpiֵ��ͼ�񣬺�ɫ����
            

% ����Formula1�ļ��㷽ʽ
function CalcPI=Formula1(N)
% ��ʽ1 ��=4*��((-1).^(n-1)./(2*n-1))

% ԭ��������ʵ�ֺ���ͼ����ƣ������޷���ȡ���ռ�����
% n=(1:N);
% f1=(-1).^(n-1)./(2*n-1);    %f1 ��¼�е��Ƶ���ʽ1
% f1=4*cumsum(f1);    % ��cumsum�����ۼӼ��㹫ʽ1����
% CalcPI=f1;      %����f1��ֵ
% disp(f1(N));
% disp(CalcPI);

% �·�������ѭ��ȡÿ�����������
p=1;a=1;b=1;item=1;f=1;
for i=1:N
    b=b+2;
    f=-f;
    item=f*(a/b);
    p=p+item;
end
% digits�涨���㾫��Ϊ256
digits(256);
p=vpa(p*4);     %vpa�����������㾫��
CalcPI=p;


% ����Formula2�ļ��㷽ʽ
function CalcPI=Formula2(N)
% ��ʽ2 ��=2*��(((2*n).^2)./(2*n-1)*(2*n+1))
p=1;
for i=1:N  
   a=i*2;
   p=p*((a*a)/((2*i-1)*(2*i+1)));
end
% digits�涨���㾫��Ϊ256
digits(256);
p=vpa(p*2);     %vpa�����������㾫��
CalcPI=p;


% ����Formula3�ļ��㷽ʽ
function CalcPI=Formula3(N)

%n=(1:N);
%f3=(n-1)./(2*n-1);     % f3�ȼ�¼ÿ���ۼ����е��۳���
%f3(1)=1;   % ��Ҫ�ر�˵����һ���۳���Ϊ1��������f3����Ϊ0
%f3=cumprod(f3);   % ������cumprod��������ÿ���۳�����۳˽��
%f3=2*cumsum(f3);    % �����cumsum������ÿ���۳˽���ۼ�
%CalcPI=f3;      %����f3��ֵ

n=1;
s=3;p=1;
for i=1:N
    a=n;
    n=(i/(s+(i-1)*2))*a;
    p=n+p;
end
% digits�涨���㾫��Ϊ256
digits(256);
p=vpa(p*2);     %vpa�����������㾫��
CalcPI=p;


% ����Formula4�ļ��㷽ʽ  
function CalcPI=Formula4(N)
% ��ʽ4 ��=2*��(1+1./(2*n-1)*(2*n+1))

%n=(1:N);
%f4=(1+1./(4*n.^2-1));   % f4��¼�е��Ƶ���ʽ4
%f4=2*cumprod(f4);   % ��cumprod�����۳˹�ʽ4����
%CalcPI=f4;      %����f4��ֵ

p=4/3;
for i=2:N
    a= 2*i-1;
    p = p*(1+1/(a*(a+2)));
end
% digits�涨���㾫��Ϊ256
digits(256);
p=vpa(p*2);     %vpa�����������㾫��
CalcPI=p;


% �˳�������
% --- Executes on button press in pbtnExit.
function pbtnExit_Callback(hObject, eventdata, handles)
% hObject    handle to pbtnExit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
quit = questdlg('�Ƿ�ȷ���˳� ?','�˳�����','�˳�','ȡ��','ȡ��');
if strcmp(quit,'ȡ��')
    return;
end
close
