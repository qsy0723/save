function varargout = untitledxiiu1(varargin)
% UNTITLEDXIIU1 MATLAB code for untitledxiiu1.fig
%      UNTITLEDXIIU1, by itself, creates a new UNTITLEDXIIU1 or raises the existing
%      singleton*.
%
%      H = UNTITLEDXIIU1 returns the handle to a new UNTITLEDXIIU1 or the handle to
%      the existing singleton*.
%
%      UNTITLEDXIIU1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLEDXIIU1.M with the given input arguments.
%
%      UNTITLEDXIIU1('Property','Value',...) creates a new UNTITLEDXIIU1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitledxiiu1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitledxiiu1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitledxiiu1

% Last Modified by GUIDE v2.5 02-Apr-2019 18:44:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitledxiiu1_OpeningFcn, ...
                   'gui_OutputFcn',  @untitledxiiu1_OutputFcn, ...
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


% --- Executes just before untitledxiiu1 is made visible.
function untitledxiiu1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitledxiiu1 (see VARARGIN)

% Choose default command line output for untitledxiiu1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitledxiiu1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitledxiiu1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tic
word=fileread('C:\Users\��ʯ��\Desktop\234.txt'); %����ȫ��
word=regexprep(word,'\W',' '); %�����ַ��ģ���ת��Ϊ�ո���Ҫ��ȥ��������
word=lower(word); %���Сд
words=regexp(word,' ','split')'; %���ݿո�ָ�Ϊ����cell
%����ÿ�����ʶ��ó�����
rank = tabulate(words); %rank�������������������ƣ����ִ����Ͱٷֱ�
ans=sortrows(rank,-3); %ֻ���ݵڶ��н������� -2��ʾ����
a=ans;
b=ceil(rand(1,5)*20);
% ���򣬻�ͼ��Ȼ���޸�TickLable
[b,idx]=sort(b(:),1,'descend');
a=a(idx);
bar(1:length(a),b)
set(gca,'xticklabel',a)    
 xlswrite('results',ans);%���Ϊexcel�ļ�
toc

% --- Executes on button press in close.
function close_Callback(hObject, eventdata, handles)
% hObject    handle to close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close

% --- Executes on button press in sum.
function sum_Callback(hObject, eventdata, handles)
% hObject    handle to sum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tic

fid=fopen('*.txt');

N=length(fid);
c='�й�';%Ҫ���ҵ��ַ�
k=length(c);
count=0;
for i=1:N-k+1
    if(strcmp(s(i:i+k-1),c))
        count=count+1;
    end
end
fprintf('����ַ������ܹ���%d��%s\n',count,c)

toc
% --- Executes on button press in survey.
function survey_Callback(hObject, eventdata, handles)
% hObject    handle to survey (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tic
[fn,pn]=uigetfile({'*.txt'},'ѡ��һ���ļ�');
if fn~=0
f=fopen(strcat(pn,fn),'r');
data=fread(f,inf,'*char');
fclose(f);
data=data';
str=inputdlg('������Ҫͳ�Ƶĵ���','�Ի���',1);
if ~isempty(str)
n=length(regexp(data,strcat('(?<=\W+)',str{1},'(?=\W+)')));
msgbox(sprintf('�ļ��й���%d������%s',n,str{1}));
end
end
toc


% --- Executes on button press in row.
function row_Callback(hObject, eventdata, handles)
% hObject    handle to row (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tic
fid=fopen('234.txt'); % ���ļ�

row=0;

while ~feof(fid) % �Ƿ��ȡ���ļ���β
 
[~]=fgets(fid); % ����fgetl

row=row+1; % �����ۼ�

end

fclose(fid); % ��ʱ�ر��ļ��Ǹ���ϰ��

row

toc
