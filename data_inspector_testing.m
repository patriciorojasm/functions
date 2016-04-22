%----------------------------------
%          DATA INSPECTOR   v0.15
%----------------------------------
%
%  Plot data vs time new, and draw a color line for each detected spike
%
%   v0.15  makes better use of memory, by plotting ONLY segment to plot 

function varargout = data_inspector(varargin)
% DATA_INSPECTOR MATLAB code for data_inspector.fig
%      DATA_INSPECTOR, by itself, creates a new DATA_INSPECTOR or raises the existing
%      singleton*.
%
%      H = DATA_INSPECTOR returns the handle to a new DATA_INSPECTOR or the handle to
%      the existing singleton*.
%
%      DATA_INSPECTOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DATA_INSPECTOR.M with the given input arguments.
%
%      DATA_INSPECTOR('Property','Value',...) creates a new DATA_INSPECTOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before data_inspector_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to data_inspector_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help data_inspector

% Last Modified by GUIDE v2.5 04-Feb-2016 13:16:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @data_inspector_OpeningFcn, ...
                   'gui_OutputFcn',  @data_inspector_OutputFcn, ...
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


% --- Executes just before data_inspector is made visible.
function data_inspector_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to data_inspector (see VARARGIN)

% Choose default command line output for data_inspector
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);



% UIWAIT makes data_inspector wait for user response (see UIRESUME)
% uiwait(handles.figure1);
 
% --- Outputs from this function are returned to the command line.
function varargout = data_inspector_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

global x1 x2
dat=evalin('base','data');
time=evalin('base','time_new');
global delta_x  %dat time 
delta_x=5;
dt=5e-5;
pre_x2 = x2;

%pre_x2 = max(find(time <x2));
delta_x = max(find(time <delta_x));
%disp(pre_x2);disp('----');
x1=1;
x2=delta_x;
%plot(time , dat);
tic;
plot(time(x1:x2) , dat(x1:x2),'color','k');
%xlim([x1 x2]);
%ylim([-1.5 1.5]);

%disp(x1);
%disp(x2);
%disp(delta_x);
%disp('----');
%disp('----');
%
%--------------------------
%adapted from rasters31
%--------------------------
hold on;
%c_num =max(cluster_class(:,1));
c_numb=evalin('base','c_num');
cluster_classb=evalin('base','cluster_class');
cc=lines(c_numb+2);
for c=0:c_numb;
    disp(c);
    j=find(cluster_classb(:,1)==c);    % indice of each clustered spike in cluster_classx1);
    ti_1=time(x1);                  % window start at this time
    ti_1= max(find(j < ti_1));   % point number of this time
    ti_2=time(x2);
    ti_2= max(find(j < ti_2));
    %j=j(ti_1:ti_2);
    
    t=cluster_classb(:,2);  % spike's time 
    t=.001*t';
    
    %if ti_1  == nan | ti_2  == nan
        % do nothing
    %else
        plot( [t(j);t(j)],[100*ones(size(t(j)));zeros(size(t(j)))], 'k', 'color',cc(c+1,:));    %'color',rand(1,3)); 
        length(t(j))
        %end
    %
end
xlim([time(x1) time(x2)]);
toc;
%hold off;
%

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x1 x2 delta_x %dat time 
%tic;
dat=evalin('base','data');
time=evalin('base','time_new');

x1=x1+delta_x;  %20;
%disp(x1);
x2=x2+delta_x;  %20;
%disp(x2);%
%disp(delta_x);
%disp('-----');
%disp(time(x1));
%disp(time(x2));

plot(time(x1:x2) ,dat(x1:x2),'color','k');hold on;
%ylim([-1.5 1.5]);
xlim([time(x1) time(x2)]);
%toc;
%hold off;

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x1 x2 delta_x %dat time 
%tic;
dat=evalin('base','data');
time=evalin('base','time_new');

x1=x1-delta_x;  %20;
%disp(x1);
x2=x2-delta_x;  %20;
%disp(x2);%
%disp(delta_x);
%disp('-----');
%disp(time(x1));
%disp(time(x2));

plot(time(x1:x2) ,dat(x1:x2),'color','k');hold on;
%ylim([-1.5 1.5]);
xlim([time(x1) time(x2)]);
%toc;

%{
function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
global time dat  delta_x x1 x2

delta_x= str2double(get(hObject,'String')); %returns contents of edit1 as a double
%display(delta_x);
%plot(time,dat);
%x1=x1+delta_x1
x2=x1+delta_x;
%handles.data=delta_x1;
%guidata(hObject,handles);
xlim([x1 x2]);

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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
global  delta_x x1
x1= str2double(get(hObject,'String'));

xlim([x1 x1+delta_x]);
%x1=new_x1;


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%}