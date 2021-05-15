function varargout = representasicitra(varargin)
% REPRESENTASICITRA MATLAB code for representasicitra.fig
%      REPRESENTASICITRA, by itself, creates a new REPRESENTASICITRA or raises the existing
%      singleton*.
%
%      H = REPRESENTASICITRA returns the handle to a new REPRESENTASICITRA or the handle to
%      the existing singleton*.
%
%      REPRESENTASICITRA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REPRESENTASICITRA.M with the given input arguments.
%
%      REPRESENTASICITRA('Property','Value',...) creates a new REPRESENTASICITRA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before representasicitra_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to representasicitra_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help representasicitra

% Last Modified by GUIDE v2.5 15-May-2021 09:01:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @representasicitra_OpeningFcn, ...
                   'gui_OutputFcn',  @representasicitra_OutputFcn, ...
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


% --- Executes just before representasicitra is made visible.
function representasicitra_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to representasicitra (see VARARGIN)

% Choose default command line output for representasicitra
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes representasicitra wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = representasicitra_OutputFcn(hObject, eventdata, handles) 
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
[nama_file,nama_path]=uigetfile({'.jpg';'.bmp';'.png';'.tif';'.JPEG';'.JPG'},...
    'Pilih Gambar');
if ~isequal(nama_file,0)
    Img=imread(fullfile(nama_path,nama_file));
    axes(handles.axes1)
    imshow(Img);
    title(nama_file);
    R = Img(:,:,1);
    G = Img(:,:,2);
    B = Img(:,:,3);
else
    return
end
handles.Img=Img;
handles.R=R;
handles.G=G;
handles.B=B;
guidata(hObject,handles)

% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
set (hObject,'Value',1)
set (handles.radiobutton2,'Value',0)
set (handles.radiobutton3,'Value',0)
set (handles.radiobutton4,'Value',0)
set (handles.radiobutton5,'Value',0)
set (handles.radiobutton6,'Value',0)

Img=handles.Img;
R=handles.R;
G=handles.G;
B=handles.B;
axes(handles.axes2)
imshow(Img)
title('Citra RGB')
axes(handles.axes3)
h=histogram(R,256);
h.FaceColor='r';
h.EdgeColor='r';
xlim([0,255])
grid on
hold on
h=histogram(G,256);
h.FaceColor='g';
h.EdgeColor='g';
xlim([0,255])
grid on
h=histogram(B,256);
h.FaceColor='b';
h.EdgeColor='b';
xlim([0,255])
grid on
hold off
title('Histogram')

% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
set (hObject,'Value',1)
set (handles.radiobutton1,'Value',0)
set (handles.radiobutton3,'Value',0)
set (handles.radiobutton4,'Value',0)
set (handles.radiobutton5,'Value',0)
set (handles.radiobutton6,'Value',0)

R=handles.R;
G=handles.G;
B=handles.B;
axes(handles.axes2)
Red=cat(3,R,G*0,B*0);
imshow(Red)
title('Kanal Merah')
axes(handles.axes3)
h=histogram(R,256);
h.FaceColor='r';
h.EdgeColor='r';
xlim([0,255])
grid on
title('Histogram')
guidata(hObject, handles);


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3
set (hObject,'Value',1)
set (handles.radiobutton1,'Value',0)
set (handles.radiobutton2,'Value',0)
set (handles.radiobutton4,'Value',0)
set (handles.radiobutton5,'Value',0)
set (handles.radiobutton6,'Value',0)

R=handles.R;
G=handles.G;
B=handles.B;

axes(handles.axes2)
Red=cat(3,R*0,G,B*0);
imshow(Red)
title('Kanal Hijau')

axes(handles.axes3)
h=histogram(G,256);
h.FaceColor='g';
h.EdgeColor='g';
xlim([0,255])
grid on
title('Histogram')
guidata(hObject, handles);

% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4
set (hObject,'Value',1)
set (handles.radiobutton1,'Value',0)
set (handles.radiobutton2,'Value',0)
set (handles.radiobutton3,'Value',0)
set (handles.radiobutton5,'Value',0)
set (handles.radiobutton6,'Value',0)

R=handles.R;
G=handles.G;
B=handles.B;

axes(handles.axes2)
Red=cat(3,R*0,G*0,B);
imshow(Red)
title('Kanal Biru')

axes(handles.axes3)
h=histogram(B,256);
h.FaceColor='b';
h.EdgeColor='b';
xlim([0,255])
grid on
title('Histogram')
guidata(hObject, handles);

% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5
set (hObject,'Value',1)
set (handles.radiobutton1,'Value',0)
set (handles.radiobutton2,'Value',0)
set (handles.radiobutton3,'Value',0)
set (handles.radiobutton4,'Value',0)
set (handles.radiobutton6,'Value',0)

Img=handles.Img;
Img_Gray=rgb2gray(Img);

axes(handles.axes2)
imshow(Img_Gray)
title('Citra Grayscale')

axes(handles.axes3)
h=histogram(Img_Gray,256);
h.FaceColor=[.5 .5 .5];
h.EdgeColor=[.5 .5 .5];
xlim([0,255])
grid on
title('Histogram')
guidata(hObject, handles);

% --- Executes on button press in radiobutton6.
function radiobutton6_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton6
set (hObject,'Value',1)
set (handles.radiobutton1,'Value',0)
set (handles.radiobutton2,'Value',0)
set (handles.radiobutton3,'Value',0)
set (handles.radiobutton4,'Value',0)
set (handles.radiobutton5,'Value',0)

Img=handles.Img;
Img_Gray=rgb2gray(Img);
Img_bw=im2bw(Img_Gray);

axes(handles.axes2)
imshow(Img_bw)
title('Citra Biner')

axes(handles.axes3)
h=histogram(double(Img_bw(:)),2);
h.FaceColor='k';
h.EdgeColor='w';
h.FaceAlpha=1;
xlim([0,1])
gride on
title('Histogram')
guidata(hObject, handles);
