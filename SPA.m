function varargout = SPA(varargin)
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SPA_OpeningFcn, ...
                   'gui_OutputFcn',  @SPA_OutputFcn, ...
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

function SPA_OpeningFcn(hObject, eventdata, handles, varargin)
% Choose default command line output for SPA
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

function varargout = SPA_OutputFcn(hObject, eventdata, handles) 
% Get default command line output from handles structure
varargout{1} = handles.output;

function setGlobalzmienna(z)
%Funkcja set tworz¹ca zmienn¹ globaln¹ 

global zmienna
zmienna=z;

function [wynik] = getGlobalzmienna
%Funkcja get pobieraj¹ca wartoœæ zmiennej globalnej 

global zmienna
wynik=zmienna;

function przyciskWczytaj_Callback(hObject, eventdata, handles)
%Funkcja wczytywania pliku .pdb z dysku i tworzenia struktury zawieraj¹cej
%tylko informacjê o sk³adzie ³añcucha aminokwasów
[filename,filepath]=uigetfile('*.pdb','Wybierz plik .pdb do wczytania');
cd(filepath);
wynik=licznikamino(filename);
setGlobalzmienna(wynik);
set(hObject, 'string' , filename, 'enable', 'on');
 
function wyborAmino_Callback(hObject, eventdata, handles)
%Funkcja która determinuje zachowanie applikacji podczas zmiany w pop-up
%menu nazwy aminokwasu. Podaje pe³n¹ nazwê aminokwasu, jego wzór
%strukturalny oraz iloœæ w analizowanym bia³ku
str = get(hObject, 'String');
val = get(hObject,'Value');
wynik=getGlobalzmienna;
switch str{val};
case 'Ala'
    guidata(hObject, handles);
    axes(handles.wzorStruk);
     rysunek = imread('ALANINA.png');
     imshow(rysunek)
     set(handles.fullname, 'String', 'Alanina');
     set(handles.bialko, 'String', wynik(1).value);
     drawnow;
case 'Cys'  
    guidata(hObject, handles);
    axes(handles.wzorStruk);
    rysunek = imread('CYSTEINA.png');
     imshow(rysunek)
     set(handles.fullname, 'String', 'Cysteina');
     set(handles.bialko, 'String', wynik(2).value);
     drawnow;
case 'Asp'   
    guidata(hObject, handles);
    axes(handles.wzorStruk);
    rysunek = imread('KWAS ASPARAGINOWY.png');
     imshow(rysunek)
     set(handles.fullname, 'String', 'Kwas asparaginowy');
     set(handles.bialko, 'String', wynik(3).value);
     drawnow;
case 'Glu'
    guidata(hObject, handles);
    axes(handles.wzorStruk);
    rysunek = imread('KWAS GLUTAMINOWY.png');
     imshow(rysunek)
     set(handles.fullname, 'String', 'Kwas glutaminowy');
     set(handles.bialko, 'String', wynik(4).value);
     drawnow;
case 'Phe' 
    guidata(hObject, handles);
    axes(handles.wzorStruk);
     rysunek = imread('FENYLOALANINA.png');
     imshow(rysunek)
     set(handles.fullname, 'String', 'Fenyloalanina');
     set(handles.bialko, 'String', wynik(5).value);
     drawnow;
case 'Gly'
    guidata(hObject, handles);
    axes(handles.wzorStruk);
     rysunek = imread('GLICYNA.png');
     imshow(rysunek)
     set(handles.fullname,'String', 'Glicyna');
     set(handles.bialko, 'String', wynik(6).value);
     drawnow;
case 'His'
    guidata(hObject, handles);
    axes(handles.wzorStruk);
     rysunek = imread('HISTYDYNA.png');
     imshow(rysunek)
     set(handles.fullname, 'String', 'Histydyna');
     set(handles.bialko, 'String',wynik(7).value);
     drawnow;
case 'Ile' 
    guidata(hObject, handles);
    axes(handles.wzorStruk);
     rysunek = imread('IZOLEUCYNA.png');
     imshow(rysunek)
     set(handles.fullname, 'String', 'Izoleucyna');
     set(handles.bialko, 'String', wynik(8).value);
     drawnow;
case 'Lys'
    guidata(hObject, handles);
    axes(handles.wzorStruk);
     rysunek = imread('LIZYNA.png');
     imshow(rysunek)
     set(handles.fullname, 'String', 'Lizyna');
     set(handles.bialko, 'String', wynik(9).value);
     drawnow;
case 'Leu'
    guidata(hObject, handles);
    axes(handles.wzorStruk);
     rysunek = imread('LEUCYNA.png');
     imshow(rysunek)
     set(handles.fullname, 'String', 'Leucyna');
     set(handles.bialko, 'String', wynik(10).value);
     drawnow;
case 'Met'
    guidata(hObject, handles);
    axes(handles.wzorStruk);
     rysunek = imread('METIONINA.png');
     imshow(rysunek)
     set(handles.fullname, 'String', 'Metionina');
     set(handles.bialko, 'String', wynik(11).value);
     drawnow;
case 'Asn'
    guidata(hObject, handles);
    axes(handles.wzorStruk);
     rysunek = imread('ASPARAGINA.png');
     imshow(rysunek)
     set(handles.fullname, 'String', 'Asparagina');
     set(handles.bialko, 'String', wynik(12).value);
     drawnow;
case 'Pro' 
    guidata(hObject, handles);
    axes(handles.wzorStruk);
     rysunek = imread('PROLINA.png');
     imshow(rysunek)
     set(handles.fullname, 'String', 'Prolina');
     set(handles.bialko, 'String', wynik(13).value);
     drawnow;
case 'Gln'
    guidata(hObject, handles);
    axes(handles.wzorStruk);
     rysunek = imread('GLUTAMINA.png');
     imshow(rysunek)
     set(handles.fullname, 'String', 'Glutamina');
     set(handles.bialko, 'String', wynik(14).value);
     drawnow;
case 'Arg'
    guidata(hObject, handles);
    axes(handles.wzorStruk);
     rysunek = imread('ARGININA.png');
     imshow(rysunek)
     set(handles.fullname, 'String', 'Arginina');
     set(handles.bialko, 'String', wynik(15).value);
     drawnow;
case 'Ser' 
    guidata(hObject, handles);
    axes(handles.wzorStruk);
     rysunek = imread('SERYNA.png');
     imshow(rysunek)
     set(handles.fullname, 'String', 'Seryna');
     set(handles.bialko, 'String', wynik(16).value);
     drawnow;
case 'Thr' 
    guidata(hObject, handles);
    axes(handles.wzorStruk);
     rysunek = imread('TREONINA.png');
     imshow(rysunek)
     set(handles.fullname, 'String', 'Treonina');
     set(handles.bialko, 'String', wynik(17).value);
     drawnow;
case 'Val'
    guidata(hObject, handles);
    axes(handles.wzorStruk);
     rysunek = imread('WALINA.png');
     imshow(rysunek)
     set(handles.fullname, 'String', 'Walina');
     set(handles.bialko, 'String', wynik(18).value);
     drawnow;
case 'Trp' 
    guidata(hObject, handles);
    axes(handles.wzorStruk);
     rysunek = imread('TRYPTOFAN.png');
     imshow(rysunek)
     set(handles.fullname, 'String', 'Tryptofan');
     set(handles.bialko, 'String', wynik(19).value);
     drawnow;
case 'Tyr' 
    guidata(hObject, handles);
    axes(handles.wzorStruk);
     rysunek = imread('TYROZYNA.png');
     imshow(rysunek)
     set(handles.fullname, 'String', 'Tyrozyna');
     set(handles.bialko, 'String', wynik(20).value);
     drawnow;
end
% Save the handles structure.
guidata(hObject,handles);

function wyborAmino_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function rysunekAmino_CreateFcn(hObject, eventdata, handles)

function wyborWykr_SelectionChangeFcn(hObject, eventdata, handles)
%Funkcja zajmuje siê rysowaniem wykresów. W zale¿noœci od wyboru w panelu
%radiobuttonów rysuje wykres.
%Mo¿liwe wykresy to:
% -Ogólne: wykres s³upkowy obrazuj¹cy ile aminokwasów danego 
%               rodzaju znajduje siê w bia³ku.
% -Charakter chemiczny: wykres ko³owy obrazuj¹cy stosunek 
%               aminokwasów kwasowych, zasadowych i obojêtnych
% -Egzo/Endo: wykres ko³owy obrazuj¹cy stosunek aminokwasów endogennych do
%               egzogennych
ogol = get(handles.ogolne,'Value');
char = get(handles.charakter,'Value');
endo= get(handles.egzoendo,'Value');
wynik=getGlobalzmienna;
macierzWszystkichAmino=[wynik(1).value wynik(2).value wynik(3).value wynik(4).value wynik(5).value wynik(6).value wynik(7).value wynik(8).value wynik(9).value wynik(10).value wynik(11).value wynik(12).value wynik(13).value wynik(14).value wynik(15).value wynik(16).value wynik(17).value wynik(18).value wynik(19).value wynik(20).value];
macierzCharChem=zeros(1,3);
macierzWyk=zeros(1,2);
for n=1:20
    if strcmp(wynik(n).name,'ASP') || strcmp(wynik(n).name,'GLU')
        macierzCharChem(2)=macierzCharChem(2)+1*wynik(n).value;
    elseif strcmp(wynik(n).name,'HIS') || strcmp(wynik(n).name,'LYS') || strcmp(wynik(n).name,'ARG')
        macierzCharChem(1)=macierzCharChem(1)+1*wynik(n).value;
    else
        macierzCharChem(3)=macierzCharChem(3)+1*wynik(n).value;
    end
end
for n=1:20
    if strcmp(wynik(n).name,'ALA') ||strcmp(wynik(n).name,'ASN')||strcmp(wynik(n).name,'CYS')||strcmp(wynik(n).name,'GLY')||strcmp(wynik(n).name,'GLN')||strcmp(wynik(n).name,'ASP')||strcmp(wynik(n).name,'GLU')||strcmp(wynik(n).name,'PRO')||strcmp(wynik(n).name,'SER')
        macierzWyk(1)=macierzWyk(1)+1*wynik(n).value;
    else
        macierzWyk(2)=macierzWyk(2)+1*wynik(n).value;
    end
end   

if ogol==1;
  guidata(hObject, handles);
    axes(handles.poleWykresu);
    aminokwasy={'Ala','Cys','Asp','Glu','Phe','Gly','His','Ile','Lys','Leu','Met','Asn','Pro','Gln','Arg','Ser','Thr','Val','Trp','Tyr' };
    bar(macierzWszystkichAmino);
    set(gca, 'XTick', 1:20, 'XTickLabel', aminokwasy,'FontSize',6);
    xlabel('Aminokwas','FontSize',10,'FontName','Cambria');
    ylabel('Liczba w bia³ku','FontSize',10,'FontName','Cambria');
elseif char==1;
    guidata(hObject, handles);
    axes(handles.poleWykresu);
    label={'Zasadowe','Kwasowe','Obojêtne'};
    ciastko=pie(macierzCharChem);
    legend(label,'Location','southoutside','Orientation','horizontal','FontSize',10)
    hp = findobj(ciastko, 'Type', 'patch');
    set(hp(1),'FaceColor','w');
    set(hp(2),'FaceColor',[90/255 155/255 213/255]);
    set(hp(3),'FaceColor','c');
    hText = findobj(ciastko,'Type','text');
    textPositions_cell = get(hText,{'Position'}); 
    textPositions = cell2mat(textPositions_cell); 
    textPositions = textPositions * 0.4; 
    set(hText,{'Position'},num2cell(textPositions,[3,2])) 
   
elseif endo==1;
    guidata(hObject, handles);
    axes(handles.poleWykresu);
    labels={'Egzogenne','Endogenne'};
    ciastko2 = pie(macierzWyk);
    legend(labels,'Location','southoutside','Orientation','horizontal','FontSize',10)
    hap = findobj(ciastko2, 'Type', 'patch');
    set(hap(1),'FaceColor','m');
    set(hap(2),'FaceColor','w');

hText = findobj(ciastko2,'Type','text');
textPositions_cell = get(hText,{'Position'}); % cell array
textPositions = cell2mat(textPositions_cell); % numeric array
textPositions = textPositions * 0.4; % scale position
set(hText,{'Position'},num2cell(textPositions,[3,2])) % set new position

end      
guidata(hObject,handles)
