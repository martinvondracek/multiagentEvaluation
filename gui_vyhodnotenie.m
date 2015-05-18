function varargout = gui_vyhodnotenie(varargin)
% GUI_VYHODNOTENIE MATLAB code for gui_vyhodnotenie.fig
%      GUI_VYHODNOTENIE, by itself, creates a new GUI_VYHODNOTENIE or raises the existing
%      singleton*.
%
%      H = GUI_VYHODNOTENIE returns the handle to a new GUI_VYHODNOTENIE or the handle to
%      the existing singleton*.
%
%      GUI_VYHODNOTENIE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_VYHODNOTENIE.M with the given input arguments.
%
%      GUI_VYHODNOTENIE('Property','Value',...) creates a new GUI_VYHODNOTENIE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_vyhodnotenie_OpetexxningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_vyhodnotenie_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_vyhodnotenie

% Last Modified by GUIDE v2.5 09-Apr-2015 08:35:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_vyhodnotenie_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_vyhodnotenie_OutputFcn, ...
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


% --- Executes just before gui_vyhodnotenie is made visible.
function gui_vyhodnotenie_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_vyhodnotenie (see VARARGIN)

% Choose default command line output for gui_vyhodnotenie
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

handles.edit1.String = '1';

title(handles.axes1, 'Mapa prostredia');
xlabel(handles.axes1, 'X [mm]');
ylabel(handles.axes1, 'Y [mm]');

title(handles.axes2, 'Mapa pokrytia prostredia');
xlabel(handles.axes2, 'X [mm]');
ylabel(handles.axes2, 'Y [mm]');

% UIWAIT makes gui_vyhodnotenie wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_vyhodnotenie_OutputFcn(hObject, eventdata, handles) 
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
host = 'localhost';
port = 3306;
user = 'martin';
password = 'heslo';
dbname = 'diplomovka';
cla(handles.axes1)
cla(handles.axes2)
handles.text4.String='';

% farba = [
%     0, 0, 0;
%     0, 0, 1;
%     0, 1, 0;
%     0, 1, 1;
%     1, 0, 0;
%     1, 0, 1;
%     1, 1, 0;
%     1, 1, 1
% ];

farba = [
    1, 0, 0;
    0, 1, 0;
    0, 0, 1;
    0, 0, 0;
    1, 0, 1;
    0, 1, 1;
    1, 1, 0;
    0, 0, 0;
    0, 0, 0;
    0, 0, 0;
    0, 0, 0;
    0, 0, 0;
    0, 0, 0;
    0, 0, 0;
    0, 0, 0;
    0, 0, 0;
    0, 0, 0;
    0, 0, 0;
    0, 0, 0;
    0, 0, 0;
    0, 0, 0;
    0, 0, 0;
    0, 0, 0;
    0, 0, 0;
    0, 0, 0;
    0, 0, 0;
    0, 0, 0;
    0, 0, 0;
    0, 0, 0;
    0, 0, 0;
    0, 0, 0
];

prostredie = [
    -3500,-3500;
    3540,-3500;
    3540,-2440;
    3160,-2440;
    3160, -1620;
    3540,-1620;
    3540,3500;
    3160,3500;
    3160, 3750;
    -3150,3750;
    -3150, 3450;
    -3500, 3450;
    -3500, 2310;
    -3180, 2310;
    -3180, -810;
    -3500, -810;
    -3500, -1940;
    -3140, -1940;
    -3140, -2540;
    -3500, -2540;
    -3500, -3500
    ];

prekazka1 = [
    650, 400;
    650, -1420;
    1050, -1420;
    1050, 400;
    650, 400
    ];

prekazka2 = [
    -1070, -1170;
    -1550, -1170;
    -1550, -1790;
    -1070, -1790;
    -1070, -1170;
];

prekazka3 = [
    -630, 1690;
    -1700, 1690;
    -1700, 2560;
    -1130, 2560;
    -1130, 1980;
    -630, 1980;
    -630, 1690;
];

conn = database(dbname, user, password, 'VENDOR', 'MySQL');

%ziskame data
query = strcat('SELECT * FROM polohy WHERE id_spustenia=', handles.edit1.String);
dat=fetch(conn, query);
polohyPom = [];
if ~isempty(dat)
    polohyPom = cell2mat(dat);
end

query = strcat('SELECT * FROM prekazky WHERE id_spustenia=', handles.edit1.String);
dat=fetch(conn, query);
prekazkyPom = [];
if ~isempty(dat)
    prekazkyPom = cell2mat(dat(:,1:9));
end

query = strcat('SELECT * FROM pokrytie WHERE id_spustenia=', handles.edit1.String);
dat=fetch(conn, query);
pokrytiePom = [];
pokrytiePom2 = [];
if ~isempty(dat)
    pokrytiePom = cell2mat(dat(:,1:9));
    pokrytiePom = [pokrytiePom, double(cell2mat(dat(:,10)))];
end

query = strcat('SELECT * FROM spustenia WHERE id=', handles.edit1.String);
dat=fetch(conn, query);
casSpustenia = [];
casUkoncenia = [];
if ~isempty(dat)
    casSpustenia = cell2mat(dat(1,2));
    handles.text4.String=casSpustenia;
    casUkoncenia = cell2mat(dat(1,3));
    handles.text15.String=casUkoncenia;
    
    datumStart = datevec(casSpustenia,'yyyy-mm-dd HH:MM:SS');
    datumStop = datevec(casUkoncenia,'yyyy-mm-dd HH:MM:SS');
    handles.text17.String=strcat(num2str(etime(datumStop, datumStart)), ' sekúnd');
end

close(conn)

%zistime pocet agentov
agentCount = max(polohyPom(:,3));
polohyPomCount = size(polohyPom, 1);
prekazkyPomCount = size(prekazkyPom, 1);

prejdenaDrahaCelkovo = 0;
prejdenaDrahaMapovanieCelkovo = 0;

% figure;
hold(handles.axes1,'on')
hold(handles.axes2,'on')
plot(handles.axes1, prostredie(:,1), prostredie(:,2),'Color',[0 0 0])
plot(handles.axes1, prekazka1(:,1), prekazka1(:,2),'Color',[0 0 0])
plot(handles.axes1, prekazka2(:,1), prekazka2(:,2),'Color',[0 0 0])
plot(handles.axes1, prekazka3(:,1), prekazka3(:,2),'Color',[0 0 0])
for i=1:agentCount
    
    polohy = [];
    for j=1:polohyPomCount
        if polohyPom(j, 3)==i
            polohy = [polohy; polohyPom(j, :)];
        end
    end
    if ~isempty(polohy)
        plot(handles.axes1, polohy(1,4), polohy(1,5), '*','Color',farba(i,:))
        plot(handles.axes1, polohy(:,4), polohy(:,5), ':','Color',farba(i,:))
        %spocitame celkovu prejdenu drahu agenta
        last = [polohy(1,4), polohy(1,5)];
        prejdenaDraha = 0;
        polohySize = size(polohy, 1);
        for j=1:polohySize
            prejdenaDraha = prejdenaDraha + sqrt(((polohy(j,4) - last(1))*(polohy(j,4) - last(1))) + ((polohy(j,5) - last(2))*(polohy(j,5) - last(2))));
            last = [polohy(j,4), polohy(j,5)];
        end
        prejdenaDrahaCelkovo = prejdenaDrahaCelkovo + prejdenaDraha;
    end
    
    prekazky = [];
    C = unique(prekazkyPom(:, 3));
    for k=1:size(C)
        prekazky = [];
        for j=1:prekazkyPomCount
            if prekazkyPom(j, 4)==i && prekazkyPom(j, 3)==C(k)
                 if prekazkyPom(j, 3)~=0
                    prekazky = [prekazky; prekazkyPom(j, :)];
                end
            end
        end
        if ~isempty(prekazky)
            %prekazky = [prekazky; prekazky(1, :)];
            plot(handles.axes1, prekazky(:,8), prekazky(:,9), '-','Color',farba(i,:))
            %spocitame celkovu drahu kedy mapoval agent
            last = [prekazky(1,5), prekazky(1,6)];
            prejdenaDrahaMapovanie = 0;
            prekazkyCount = size(prekazky, 1);
            for j=1:prekazkyCount
                prejdenaDrahaMapovanie = prejdenaDrahaMapovanie + sqrt(((prekazky(j,5) - last(1))*(prekazky(j,5) - last(1))) + ((prekazky(j,6) - last(2))*(prekazky(j,6) - last(2))));
                last = [prekazky(j,5), prekazky(j,6)];
            end
            prejdenaDrahaMapovanieCelkovo = prejdenaDrahaMapovanieCelkovo + prejdenaDrahaMapovanie;
        end
        
    end
end
% handles.axes1 equal
title(handles.axes1, 'Mapa prostredia');
xlabel(handles.axes1, 'X [mm]');
ylabel(handles.axes1, 'Y [mm]');

handles.text23.String=strcat(num2str(floor(prejdenaDrahaCelkovo)), ' mm');
handles.text24.String=strcat(num2str(floor(prejdenaDrahaCelkovo - prejdenaDrahaMapovanieCelkovo)), ' mm');
handles.text25.String=strcat(num2str(floor(prejdenaDrahaMapovanieCelkovo)), ' mm');
if (prejdenaDrahaCelkovo - prejdenaDrahaMapovanieCelkovo) == 0
    handles.text27.String=strcat('1 : ', 'inf');
else
    prejdenaDrahaMapovanieCelkovo
    handles.text27.String=strcat('1 : ', num2str( prejdenaDrahaMapovanieCelkovo / (prejdenaDrahaCelkovo - prejdenaDrahaMapovanieCelkovo)));
end



if ~isempty(pokrytiePom)
%     figure
%     hold on
    
    n = pokrytiePom(1,6);
    hrana = pokrytiePom(1,7);
    
    covered = 0;
    
    for i=1:size(pokrytiePom, 1)
        x = pokrytiePom(i,8) * 1000 - (n/2*hrana);
        y = pokrytiePom(i,9) * 1000 - (n/2*hrana);
        if pokrytiePom(i,10)==1
            rectangle('Position',[x y hrana hrana], 'FaceColor','g')
            covered = covered + 1;
        else
            rectangle('Position',[x y hrana hrana], 'FaceColor','r')
        end
    end
    
    handles.text19.String=strcat(num2str(covered/size(pokrytiePom, 1)*100), ' %');
    
    axis equal
    title(handles.axes2, 'Mapa pokrytia prostredia');
    xlabel(handles.axes2, 'X [mm]');
    ylabel(handles.axes2, 'Y [mm]');
    linkaxes([handles.axes2,handles.axes1],'xy')
end


% --- Executes during object creation, after setting all properties.
function pushbutton1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
plot(1,1)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cislo = str2num(handles.edit1.String);
if cislo<0
    cislo = 0;
end
cislo = cislo + 1;
handles.edit1.String = num2str(cislo);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cislo = str2num(handles.edit1.String);
if cislo>1
    cislo = cislo - 1;
end
handles.edit1.String = num2str(cislo);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close();
