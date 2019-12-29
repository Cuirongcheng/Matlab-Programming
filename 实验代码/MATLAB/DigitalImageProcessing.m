function varargout = DigitalImageProcessing(varargin)
%DIGITALIMAGEPROCESSING MATLAB code file for DigitalImageProcessing.fig
%      DIGITALIMAGEPROCESSING, by itself, creates a new DIGITALIMAGEPROCESSING or raises the existing
%      singleton*.
%
%      H = DIGITALIMAGEPROCESSING returns the handle to a new DIGITALIMAGEPROCESSING or the handle to
%      the existing singleton*.
%
%      DIGITALIMAGEPROCESSING('Property','Value',...) creates a new DIGITALIMAGEPROCESSING using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to DigitalImageProcessing_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      DIGITALIMAGEPROCESSING('CALLBACK') and DIGITALIMAGEPROCESSING('CALLBACK',hObject,...) call the
%      local function named CALLBACK in DIGITALIMAGEPROCESSING.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DigitalImageProcessing

% Last Modified by GUIDE v2.5 28-Nov-2019 10:41:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DigitalImageProcessing_OpeningFcn, ...
                   'gui_OutputFcn',  @DigitalImageProcessing_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before DigitalImageProcessing is made visible.
function DigitalImageProcessing_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for DigitalImageProcessing
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DigitalImageProcessing wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DigitalImageProcessing_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function FileOperation_Callback(hObject, eventdata, handles)
% hObject    handle to FileOperation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ImageTransformation_Callback(hObject, eventdata, handles)
% hObject    handle to ImageTransformation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ImageEnhancement_Callback(hObject, eventdata, handles)
% hObject    handle to ImageEnhancement (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ImageAnalysis_Callback(hObject, eventdata, handles)
% hObject    handle to ImageAnalysis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ImageCompression_Callback(hObject, eventdata, handles)
% hObject    handle to ImageCompression (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function InformationHiding_Callback(hObject, eventdata, handles)
% hObject    handle to InformationHiding (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ImageRecognition_Callback(hObject, eventdata, handles)
% hObject    handle to ImageRecognition (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ImageDetection_Callback(hObject, eventdata, handles)
% hObject    handle to ImageDetection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Help_Callback(hObject, eventdata, handles)
% hObject    handle to Help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function PCBDefectDetection_Callback(hObject, eventdata, handles)
% hObject    handle to PCBDefectDetection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function FaceDetection_Callback(hObject, eventdata, handles)
% hObject    handle to FaceDetection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function InfraredMicroTargetDetection_Callback(hObject, eventdata, handles)
% hObject    handle to InfraredMicroTargetDetection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function InfraredImageRecognition_Callback(hObject, eventdata, handles)
% hObject    handle to InfraredImageRecognition (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function WeedImageRecognition_Callback(hObject, eventdata, handles)
% hObject    handle to WeedImageRecognition (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function FingerprintAttendanceAlgorithm_Callback(hObject, eventdata, handles)
% hObject    handle to FingerprintAttendanceAlgorithm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function VisualPasswordSharing_Callback(hObject, eventdata, handles)
% hObject    handle to VisualPasswordSharing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function DigitalImageScrambling_Callback(hObject, eventdata, handles)
% hObject    handle to DigitalImageScrambling (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ImageDigitalWatermark_Callback(hObject, eventdata, handles)
% hObject    handle to ImageDigitalWatermark (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function DCTCompression_Callback(hObject, eventdata, handles)
% hObject    handle to DCTCompression (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function WaveletTransformCompression_Callback(hObject, eventdata, handles)
% hObject    handle to WaveletTransformCompression (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function VectorQuantizationCompression_Callback(hObject, eventdata, handles)
% hObject    handle to VectorQuantizationCompression (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ThresholdSegmentation_Callback(hObject, eventdata, handles)
% hObject    handle to ThresholdSegmentation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function RegionSegmentation_Callback(hObject, eventdata, handles)
% hObject    handle to RegionSegmentation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function EdgeExtraction_Callback(hObject, eventdata, handles)
% hObject    handle to EdgeExtraction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function GeometryAndShapeFeatureAnalysis_Callback(hObject, eventdata, handles)
% hObject    handle to GeometryAndShapeFeatureAnalysis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function TextureFeatureAnalysis_Callback(hObject, eventdata, handles)
% hObject    handle to TextureFeatureAnalysis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ImageRegistration_Callback(hObject, eventdata, handles)
% hObject    handle to ImageRegistration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ImageMosaic_Callback(hObject, eventdata, handles)
% hObject    handle to ImageMosaic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function GrayscaleEnhancement_Callback(hObject, eventdata, handles)
% hObject    handle to GrayscaleEnhancement (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function PseudocolorEnhancement_Callback(hObject, eventdata, handles)
% hObject    handle to PseudocolorEnhancement (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function SpatialDomainDenoising_Callback(hObject, eventdata, handles)
% hObject    handle to SpatialDomainDenoising (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function FrequencyDomainDenoising_Callback(hObject, eventdata, handles)
% hObject    handle to FrequencyDomainDenoising (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function MorphologicalFilterDenoising_Callback(hObject, eventdata, handles)
% hObject    handle to MorphologicalFilterDenoising (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function DFT_Callback(hObject, eventdata, handles)
% hObject    handle to DFT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function DCT_Callback(hObject, eventdata, handles)
% hObject    handle to DCT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenImage_Callback(hObject, eventdata, handles)
% hObject    handle to OpenImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function SaveImage_Callback(hObject, eventdata, handles)
% hObject    handle to SaveImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
