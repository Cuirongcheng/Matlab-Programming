function varargout = InformationHiding(varargin)
% INFORMATIONHIDING MATLAB code for InformationHiding.fig
%      INFORMATIONHIDING, by itself, creates a new INFORMATIONHIDING or raises the existing
%      singleton*.
%
%      H = INFORMATIONHIDING returns the handle to a new INFORMATIONHIDING or the handle to
%      the existing singleton*.
%
%      INFORMATIONHIDING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INFORMATIONHIDING.M with the given input arguments.
%
%      INFORMATIONHIDING('Property','Value',...) creates a new INFORMATIONHIDING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before InformationHiding_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to InformationHiding_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help InformationHiding

% Last Modified by GUIDE v2.5 01-Dec-2019 20:56:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @InformationHiding_OpeningFcn, ...
                   'gui_OutputFcn',  @InformationHiding_OutputFcn, ...
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


% --- Executes just before InformationHiding is made visible.
function InformationHiding_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to InformationHiding (see VARARGIN)

% Choose default command line output for InformationHiding
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes InformationHiding wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = InformationHiding_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
VisualPasswordSharing;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
DigitalImageScrambling;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
DigitalWatermarking;


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
ha=axes('units','normalized','pos',[0 0 1 1]);
uistack(ha,'down');
ii=imread('./menu.jpg');
image(ii);
colormap gray
set(ha,'handlevisibility','off','visible','on');
