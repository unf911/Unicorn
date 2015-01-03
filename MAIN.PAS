unit MAIN;

{$define economist}

interface

uses
  Windows, SysUtils, Classes,
  Graphics, Forms, Controls, Menus,
  StdCtrls, Dialogs, Buttons, Messages,
  ExtCtrls, ComCtrls, StdActns,
  ActnList, ToolWin, ImgList,
  untSettings, ElegantMDI,
  RepDolgBux,
  ClientSpr,
  TovarSpr,
  Schet,
  NNakl,
  untSqlLog,
  untSklost,
  untNaklo,
  ManagerSpr,
  untSkladRasxEx,
  atsassert,
  SkladSpr,
  RepReestrVydanNnakl,
  untOtpravka,
  PrixSklad,
  untSkladRasxBux,
  RepDolg,
  Zakaz,
  Spec,   //TfrmSpec
  PlategyIsx,  //TfrmPlategy
  NaklpBux, //TfrmNaklpBux
  RepDolgBuxPost, //TfrmRepDolgBuxPost
  Currency,
  NaklpOst, //TfrmNaklpOst
  SebestOtgr, //TfrmSebestOtgr
  RepSkladBux, // TfrmRepSkladBux
  SebestOst3, //TfrmSebestOst3
  RepSkladBuxVyravn,   //TfrmRepSkladBuxVyravn
  PriceSpr, //TfrmPriceSpr
  PriceChange, //TfrmPriceChange ,
  RepPrice,  //TfrmRepPrice
  NNaklp, // TfrmNNaklp
  RepReestrPolychNNakl, //TfrmRepReestrPolychNNakl
  SkidkaSpr, //TfrmSkidkaSpr
  SkidkaChange,  //TfrmSkidkaChange
  UslPostavkaSpr, //TfrmUslPostavkaSpr
  UslPostavkaChange,  //TfrmUslPostavkaChange
  VidDostavkiSpr, //TfrmVidDostavkiSpr
  SravnPrice, //TfrmSravnPrice
  SravnPriceList, //TfrmSravnPriceList
  SpecOstAll, //TfrmSpecOstAll
  NaklPeremBux , //TfrmNaklPeremBux
  RepSkladFact, //TfrmRepSkladFact
  SebestOtgrBux, // TfrmSebestOtgrBux;
  DetSelect, //TfrmDetSelect
  Vozvrat, //TfrmVozvrat
  RepNakloDepend, //TfrmRepNakloDepend
  RasxPoKasse, // TfrmRasxPoKasse;
  RepDolgNal, //TfrmRepDolgNal
  RepDolgSebest, //TfrmRepDolgSebest
  RepDengiNaSchetax, //TfrmRepDengiNaSchetax
  RepClientLastContact, //TfrmRepClientLastContact
  Perevod, //TfrmPerevod
  AgentSpr, //TfrmAgentSpr
  RepDolgAgent, //TfrmRepDolgAgent
  untNaklp, //TfrmNaklp
  RepBalans, //TfrmRepBalans
  Naklr,  //TfrmNaklr
  NNaklReestr, // TfrmNNaklReestr
  Naklru, //TfrmNaklru
  //Naklpu, //TfrmNaklpu
  ProjectSpr, //TfrmProjectSpr
  StatyadrSpr, //TfrmStatyadrSpr
  Naklpu2,  //TfrmNaklpu2
  untPrixDet, //TfrmPrixDet
  RepDvigDenSredstv, //TfrmRepDvigDenSredstv
  RepBalansKursDiff, //TfrmRepBalansKursDiff
  Naklrf, //TfrmNaklrf
  RepDoxodRasxod, //TfrmRepDoxodRasxod
  RepDoxodRasxodKorr, //TfrmRepDoxodRasxodKorr
  VozvratPost, //TfrmVozvratPost
  ReysSpr, //TfrmReysSpr
  DolgnostSpr, //TfrmDolgnostSpr
  RepReys, // TfrmRepReys
  RepNNaklXml, // TfrmRepNNaklXml
  RepPribylPrilogEdnal, //TfrmRepPribylPrilogEdnal
  EdizSpr //TfrmEdizSpr
  ;

type

  TFormReportClass = class of TfrmRepDolgBuxPost;

  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Window1: TMenuItem;
    FileExitItem: TMenuItem;
    WindowCascadeItem: TMenuItem;
    WindowTileItem: TMenuItem;
    WindowArrangeItem: TMenuItem;
    OpenDialog: TOpenDialog;
		Edit1: TMenuItem;
    CutItem: TMenuItem;
    CopyItem: TMenuItem;
    PasteItem: TMenuItem;
    WindowMinimizeItem: TMenuItem;
    actlist1: TActionList;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    FileNew1: TAction;
    FileSave1: TAction;
    FileExit1: TAction;
    FileOpen1: TAction;
    FileSaveAs1: TAction;
    WindowCascade1: TWindowCascade;
    WindowTileHorizontal1: TWindowTileHorizontal;
    WindowArrangeAll1: TWindowArrange;
    WindowMinimizeAll1: TWindowMinimizeAll;
		HelpAbout1: TAction;
    FileClose1: TWindowClose;
    WindowTileVertical1: TWindowTileVertical;
    WindowTileItem2: TMenuItem;
    ToolBar2: TToolBar;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ImageList1: TImageList;
    mnuItem1: TMenuItem;
		N2: TMenuItem;
    mnuSprSebest: TMenuItem;
    mnuSprKurs: TMenuItem;
    actRealPrice: TAction;
    mnuRepMan: TMenuItem;
    actRepMan: TAction;
    mnuInputForms: TMenuItem;
    mnuVvodSebest: TMenuItem;
    N4: TMenuItem;
    actSebest: TAction;
		actPrixod: TAction;
    N5: TMenuItem;
    ElegantMDI1: TElegantMDI;
    actEconomist: TAction;
		actRepDolgBux: TAction;
    actRepDolgBux1: TMenuItem;
    actClient: TAction;
    actKlient1: TMenuItem;
    N3: TMenuItem;
    mnuTovar: TMenuItem;
    actTovar: TAction;
    actSchet: TAction;
    N7: TMenuItem;
    actNNakl: TAction;
    N8: TMenuItem;
    Connect1: TMenuItem;
    actNaklp: TAction;
    mnuSklad: TMenuItem;
    N9: TMenuItem;
    mnuSqlLog: TMenuItem;
    actSqlLog: TAction;
    mnuSklost: TMenuItem;
    actSklost: TAction;
    actNaklo: TAction;
    N12: TMenuItem;
    actManager: TAction;
    N13: TMenuItem;
    actSkladRasxEx: TAction;
    N14: TMenuItem;
    actRefreshReferenceTables: TAction;
    N1: TMenuItem;
    actSklad: TAction;
    N16: TMenuItem;
    actRepReestrVydanNnakl: TAction;
    N17: TMenuItem;
    actOtpravki: TAction;
    N18: TMenuItem;
    N19: TMenuItem;
    actPrixSklad: TAction;
    N20: TMenuItem;
    actSkladRasxBux: TAction;
    N21: TMenuItem;
    actRepDolg3: TAction;
    N15: TMenuItem;
    actPrixZakaz: TAction;
    N6: TMenuItem;
    actCurrency: TAction;
    N10: TMenuItem;
    actSpec: TAction;
    N11: TMenuItem;
    actNaklpBux: TAction;
    N22: TMenuItem;
    actPlategy: TAction;
    N23: TMenuItem;
    actRepDolgBuxPost: TAction;
    N24: TMenuItem;
    N26: TMenuItem;
    actNaklpOst: TAction;
    N27: TMenuItem;
    actSebestOtgr: TAction;
    N28: TMenuItem;
    actRepSkladBux: TAction;
    actRepSkladBux1: TMenuItem;
    actSebest3: TAction;
    N31: TMenuItem;
    actSebestOst: TAction;
    actSebestOst31: TMenuItem;
    actRepSkladBuxVyravn: TAction;
    N29: TMenuItem;
    actPriceSpr: TAction;
    N25: TMenuItem;
    actPriceChange: TAction;
    N30: TMenuItem;
    actRepPrice: TAction;
    N32: TMenuItem;
    actNNaklp: TAction;
    N33: TMenuItem;
    actRepReestrPolychNNakl: TAction;
    N34: TMenuItem;
    actSkidkaSpr: TAction;
    N35: TMenuItem;
    actSkidkaChange: TAction;
    N36: TMenuItem;
    actUslPostavkaSpr: TAction;
    N37: TMenuItem;
    actUslPostavkaChange: TAction;
    N38: TMenuItem;
    actVidDostavkiSpr: TAction;
    N39: TMenuItem;
    actSravnPrice: TAction;
    N40: TMenuItem;
    actSravnPriceList: TAction;
    N41: TMenuItem;
    actSpecOstAll: TAction;
    N42: TMenuItem;
    actRepSkladFact: TAction;
    N43: TMenuItem;
    actNaklPeremBux: TAction;
    N44: TMenuItem;
    actSebestOtgrBux: TAction;
    N45: TMenuItem;
    actTest: TAction;
    N46: TMenuItem;
    actVozvrat: TAction;
    N47: TMenuItem;
    actRasxPoKasse: TAction;
    N48: TMenuItem;
    actRepDolgNal: TAction;
    N49: TMenuItem;
    actRepDolgSebest: TAction;
    N50: TMenuItem;
    actRepDengiNaSchetax: TAction;
    N51: TMenuItem;
    actTestShort: TAction;
    actRepClientData: TAction;
    N53: TMenuItem;
    actPerevod: TAction;
    N54: TMenuItem;
    actAgentSpr: TAction;
    N55: TMenuItem;
    actRepDolgAgent: TAction;
    N56: TMenuItem;
    N57: TMenuItem;
    actRepBalans: TAction;
    N58: TMenuItem;
    actShowAnyDocByNum: TAction;
    N52: TMenuItem;
    actNaklr: TAction;
    N59: TMenuItem;
    ArrangeAll1: TMenuItem;
    Cascade1: TMenuItem;
    ileHorizontally1: TMenuItem;
    ileVertically1: TMenuItem;
    actNNaklrReestr: TAction;
    N510: TMenuItem;
    actNaklru: TAction;
    N60: TMenuItem;
    actProjectSpr: TAction;
    N61: TMenuItem;
    actStatyadr: TAction;
    N62: TMenuItem;
    actNaklpu: TAction;
    N63: TMenuItem;
    actRepDvigDenSredstv: TAction;
    N64: TMenuItem;
    actRepBalansKursDiff: TAction;
    N65: TMenuItem;
    actNaklrf: TAction;
    N66: TMenuItem;
    actDoxodRasxod: TAction;
    N67: TMenuItem;
    actRepDoxodRasxodKorr: TAction;
    N68: TMenuItem;
    N69: TMenuItem;
    actVozvratPost: TAction;
    N70: TMenuItem;
    actReysSpr: TAction;
    N71: TMenuItem;
    actDolgnostSpr: TAction;
    N72: TMenuItem;
    actRepReys: TAction;
    N73: TMenuItem;
    actRepReestrEDRPN: TAction;
    N74: TMenuItem;
    actRepPribylPrilogEdnal: TAction;
    N75: TMenuItem;
    actEdizSpr: TAction;
    N76: TMenuItem;

    procedure FileNew1Execute(Sender: TObject);
    procedure FileOpen1Execute(Sender: TObject);
    procedure FileExit1Execute(Sender: TObject);
    procedure mnuItem12Click(Sender: TObject);
    procedure mnuItem14Click(Sender: TObject);
    procedure mnuSprSebestClick(Sender: TObject);
    procedure mnuSprKursClick(Sender: TObject);
    procedure actRealPriceExecute(Sender: TObject);
    procedure actRepManExecute(Sender: TObject);
    procedure actSebestExecute(Sender: TObject);
    procedure actPrixodExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actEconomistExecute(Sender: TObject);
    procedure actRepDolgBuxExecute(Sender: TObject);
		procedure actClientExecute(Sender: TObject);
    procedure actTovarExecute(Sender: TObject);
    procedure actSchetExecute(Sender: TObject);
    procedure Connect1Click(Sender: TObject);
    procedure actNNaklExecute(Sender: TObject);
    procedure actNaklpExecute(Sender: TObject);
    procedure actSqlLogExecute(Sender: TObject);
    procedure actSklostExecute(Sender: TObject);
    procedure actNakloExecute(Sender: TObject);
    procedure actManagerExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actSkladRasxExExecute(Sender: TObject);
    procedure actRefreshReferenceTablesExecute(Sender: TObject);
    procedure actSkladExecute(Sender: TObject);
		procedure actRepReestrVydanNnaklExecute(Sender: TObject);
    procedure actOtpravkiExecute(Sender: TObject);
    procedure actPrixSkladExecute(Sender: TObject);
    procedure actSkladRasxBuxExecute(Sender: TObject);
    procedure actRepDolg3Execute(Sender: TObject);
    procedure actPrixZakazExecute(Sender: TObject);
    procedure actCurrencyExecute(Sender: TObject);
    procedure actSpecExecute(Sender: TObject);
    procedure actNaklpBuxExecute(Sender: TObject);
    procedure actPlategyExecute(Sender: TObject);
    procedure actRepDolgBuxPostExecute(Sender: TObject);
    procedure actNaklpOstExecute(Sender: TObject);
    procedure actSebestOtgrExecute(Sender: TObject);
    procedure actRepSkladBuxExecute(Sender: TObject);
    procedure actSebest3Execute(Sender: TObject);
    procedure actSebestOst3Execute(Sender: TObject);
    procedure actRepSkladBuxVyravnExecute(Sender: TObject);
    procedure actPriceSprExecute(Sender: TObject);
    procedure actPriceChangeExecute(Sender: TObject);
    procedure actRepPriceExecute(Sender: TObject);
    procedure actNNaklpExecute(Sender: TObject);
    procedure actRepReestrPolychNNaklExecute(Sender: TObject);
    procedure actSkidkaSprExecute(Sender: TObject);
    procedure actSkidkaChangeExecute(Sender: TObject);
    procedure actUslPostavkaSprExecute(Sender: TObject);
    procedure actUslPostavkaChangeExecute(Sender: TObject);
    procedure actVidDostavkiSprExecute(Sender: TObject);
    procedure actSravnPriceExecute(Sender: TObject);
    procedure actSravnPriceListExecute(Sender: TObject);
    procedure actSpecOstAllExecute(Sender: TObject);
    procedure actRepSkladFactExecute(Sender: TObject);
    procedure actNaklPeremBuxExecute(Sender: TObject);
    procedure actSebestOtgrBuxExecute(Sender: TObject);
    procedure actTestExecute(Sender: TObject);
    procedure actVozvratExecute(Sender: TObject);
    procedure actRasxPoKasseExecute(Sender: TObject);
    procedure actRepDolgNalExecute(Sender: TObject);
    procedure actRepDolgSebestExecute(Sender: TObject);
    procedure actRepDengiNaSchetaxExecute(Sender: TObject);
    procedure actRepClientDataExecute(Sender: TObject);
    procedure actPerevodExecute(Sender: TObject);
    procedure actAgentSprExecute(Sender: TObject);
    procedure actRepDolgAgentExecute(Sender: TObject);
    procedure actRepBalansExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actShowAnyDocByNumExecute(Sender: TObject);
    procedure actNaklrExecute(Sender: TObject);

    procedure actNNaklrReestrExecute(Sender: TObject);
    procedure actNaklruExecute(Sender: TObject);
    procedure actProjectSprExecute(Sender: TObject);
    procedure actStatyadrExecute(Sender: TObject);
    procedure actNaklpuExecute(Sender: TObject);
    procedure actRepDvigDenSredstvExecute(Sender: TObject);
    procedure actRepBalansKursDiffExecute(Sender: TObject);
    procedure actNaklrfExecute(Sender: TObject);
    procedure actDoxodRasxodExecute(Sender: TObject);
    procedure actRepDoxodRasxodKorrExecute(Sender: TObject);
    procedure actVozvratPostExecute(Sender: TObject);
    procedure actReysSprExecute(Sender: TObject);
    procedure actDolgnostSprExecute(Sender: TObject);
    procedure actRepReysExecute(Sender: TObject);
    procedure actTestShortExecute(Sender: TObject);
    procedure actRepReestrEDRPNExecute(Sender: TObject);
    procedure actRepPribylPrilogEdnalExecute(Sender: TObject);
    procedure actEdizSprExecute(Sender: TObject);
  private
    { Private declarations }
    procedure CreateMDIChild(const Name: string);
  {$HINTS OFF}
    procedure TestNaklpOst;
    procedure TestSkladRasxEx;
    procedure TestNNakl;
    procedure TestSchet;
    procedure TestNaklo;
    procedure TestRealPrice;
    procedure TestRepManager;
    procedure TestSpecOstAll;
    procedure TestRepNakloDepend;
    procedure TestNakloUnpostXranenieDepend;
    procedure TestZakaz;
    procedure TestZakazAddDetail;
    procedure TestSklost;
    procedure TestPlategy;
    procedure TestPlategyVxod;
    procedure TestVozvrat;
    procedure TestVozvratMakeFromNaklr;
    procedure TestNaklpOstDet;
    procedure TestDolgProsrochen;
    procedure TestRasxPoKasse;
    procedure TestRepDolgNalDet;
    procedure TestRepDolgSebest;
    procedure TestRepDolgBuxPost;
    procedure TestRepDengiNaSchetax;
    procedure TestRepClientLastContact;
    procedure TestPerevod;
    procedure TestTovarKnigaXml;
    procedure TestRepDolgAgent;
    procedure TestOpenNaklPeremBux;
    procedure TestOpenNaklp;
    procedure TestRepBalans;
    procedure TestRasxPoKasseRefresh;
    procedure TestNaklr2;
    procedure TestNNaklReestr;
    procedure TestRepDolgBux;
    procedure TestRepDolgBuxN0;
    procedure TestNaklru;
    procedure TestNaklpu;
    procedure TestPrixDet;
    procedure TestRepDvigDenSredstv;
    procedure TestRepReys;
  {$HINTS ON}
    procedure ShowForPowerUser;
    procedure HideForKievManagers;
  public
    { Public declarations }
    setT : TfrmSettings;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses Kurs, 
  untSebMain, untPrice,
  untRealPrice,
  untRepMan,
  PlategyVxod,
  untRound, //InIDE
  Variants, //Null
  untEx,
  SebMain3,
  SkladAux //OpenDocument
  ;

procedure TMainForm.CreateMDIChild(const Name: string);
var
  Child: TfrmKurs;
begin
  { create a new MDI child window }
try
  Child := TfrmKurs.Create(Application);
  Child.Caption := Name;
except
  AssertInternal('53CE8CA4-2CBA-4AEF-A576-150D63B06AD0');
end;
end;

procedure TMainForm.FileNew1Execute(Sender: TObject);
begin
  CreateMDIChild('NONAME' + IntToStr(MDIChildCount + 1));
end;

procedure TMainForm.FileOpen1Execute(Sender: TObject);
begin
  if OpenDialog.Execute then
    CreateMDIChild(OpenDialog.FileName);
end;

procedure TMainForm.FileExit1Execute(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.mnuItem12Click(Sender: TObject);
var
  frmPrice : TfrmPrice;
begin
try
  frmPrice :=TfrmPrice.Create(Application);
  frmPrice.FormStyle := fsMDIChild;
  frmPrice.Show;
except
  AssertInternal('5BD315F0-ADD7-45B9-B1E8-21EF56BD5B2C');
end;
end;

procedure TMainForm.mnuItem14Click(Sender: TObject);
var
  frmKurs :TfrmKurs;
begin
try
  frmKurs := TfrmKurs.Create (Application);
  frmKurs.FormStyle := fsMDIChild;
  frmKurs.Show;
except
  AssertInternal('C8354F46-F2A4-4723-B357-52952FFB9195');
end;
end;

procedure TMainForm.mnuSprSebestClick(Sender: TObject);
var
  frmPrice : TfrmPrice;
begin
try
  frmPrice :=TfrmPrice.Create(Application);
  frmPrice.FormStyle := fsMDIChild;
  frmPrice.Show;
except
  AssertInternal('616536B3-9E92-4BA2-91FD-8FE2A0CD7734');
end;
end;

procedure TMainForm.mnuSprKursClick(Sender: TObject);
var
  frmKurs :TfrmKurs;
begin
try
  frmKurs := TfrmKurs.Create (Application);
  frmKurs.DefaultOpen;
except
  AssertInternal('133EA361-537F-40D5-A51B-A2570FD2080A');
end;
end;

procedure TMainForm.actRealPriceExecute(Sender: TObject);
var
  frmRealPrice : TfrmRealPrice;
begin
try
  frmRealPrice := TfrmRealPrice.Create (Application);
  frmRealPrice.DefaultStartup;
  frmRealPrice.actSettings.Execute;
  if not frmRealPrice.actSettings.Checked then begin
    frmRealPrice.Close;
  end;
except
  AssertInternal('2B263E71-F741-4153-934D-2DAD1FFAE3EC');
end;
end;

procedure TMainForm.actRepManExecute(Sender: TObject);
var
  frmRepMan : TfrmRepMan;
begin
try
  frmRepMan := TfrmRepMan.Create (Application);
  frmRepMan.DefaultStartup;
  frmRepMan.actSettings.Execute;
  if not frmRepMan.actSettings.Checked then begin
    frmRepMan.Close;
  end;
except
  AssertInternal('3C466C2B-26BA-473F-8613-FB9B5415585D');
end;
end;

procedure TMainForm.actSebestExecute(Sender: TObject);
var
  frmSebMain : TfrmSebMain;
begin
try
  frmSebMain := TfrmSebMain.Create(Application);
  frmSebMain.actSettings.Execute;
  if (not frmSebMain.actSettings.Checked) then begin
    frmSebMain.Close;
  end;
except
  AssertInternal('47B14ED2-BC7C-4158-AEBE-9754840F7CAC');
end;
end;

procedure TMainForm.actPrixodExecute(Sender: TObject);
var
  frmPrixMain : TfrmPlategyVxod;
begin
try
  frmPrixMain := TfrmPlategyVxod.Create(Application);
  frmPrixMain.actSettings.Execute;
  if not frmPrixMain.actSettings.Checked then begin
    frmPrixMain.Close;
  end;
except
  AssertInternal('6746C2F8-D92B-4AD8-8996-30DD954FF900');
end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  {$IFDEF economist}
    actEconomist.Execute;
  {$endif}
end;

//в расширенной версии программы видны дополнительные меню
procedure TMainForm.actEconomistExecute(Sender: TObject);
begin
try
  mnuSprSebest.Visible:=true;
  mnuSklad.Visible := true;
except
  AssertInternal('6D86B8A3-49EA-4F33-89CE-2E3D2F34A075');
end;
end;

procedure TMainForm.actRepDolgBuxExecute(Sender: TObject);
var
  frmRepDolgBux :TfrmRepDolgBux;
begin
try
  frmRepDolgBux:=TfrmRepDolgBux.Create(Application);
  frmRepDolgBux.actSettings.Execute;
  if  not frmRepDolgBux.actSettings.Checked then begin
    frmRepDolgBux.Close;
  end;
except
  AssertInternal ('72BE26A7-3E13-4C28-A00C-8A6FEF67D19F');
end;
end;

procedure TMainForm.actClientExecute(Sender: TObject);
begin
try
  TfrmClientSpr.Create (Application);
except
  AssertInternal('5E9BC64F-A0E1-46C4-8BA4-B890DA38485D');
end;
end;
{
procedure TMainForm.actNaklrExecute(Sender: TObject);
var
  frmNaklr : TfrmNaklr;
begin
try
  frmNaklr := TfrmNaklr.Create (Application);
  frmNaklr.DefaultStartup;
  frmNaklr.actSettings.Execute;
  if not frmNaklr.actSettings.Checked then begin
    frmNaklr.Close;
  end;
except
  AssertInternal ('AF3FA054-3CD7-43B6-986D-A6B14F6C0FFC');
end;
end;
}

procedure TMainForm.actTovarExecute(Sender: TObject);
var
  frmTovarSpr : TfrmTovarSpr;
begin
try
  frmTovarSpr:=TfrmTovarSpr.Create (Application);
  frmTovarSpr.DefaultOpen;
except
  AssertInternal ('47BBF59E-9023-4649-86B9-9982BE63C360');
end;
end;

procedure TMainForm.actSchetExecute(Sender: TObject);
var
  frmSchet : TfrmSchet;
begin
try
  frmSchet := TfrmSchet.Create(Application);
  frmSchet.DefaultStartup;
  frmSchet.actSettings.Execute;
  if not frmSchet.actSettings.Checked then begin
    frmSchet.Close;
  end;
except
  AssertInternal('0E10C9D8-2B9E-45CC-9FA4-A50DED61DB6E');
end;
end;

procedure TMainForm.Connect1Click(Sender: TObject);
begin
try
  if (dmdEx.AfterConnect<>0) then begin
  end;
except
  AssertInternal('881CD6B3-ED9B-49DD-9277-6EA74C7DC37B');
end;
end;

procedure TMainForm.actNNaklExecute(Sender: TObject);
var
  frmNNakl : TfrmNNakl;
begin
try
  frmNNakl := TfrmNNakl.Create (application);
  frmNNakl.DefaultStartup;
  frmNNakl.actSettings.Execute;
  if not frmNNakl.actSettings.Checked then begin
    frmNNakl.Close;
  end;
except
  AssertInternal('6E118014-CD9D-4AC5-92C1-D2942FA9665F');
end;
end;

procedure TMainForm.actNaklpExecute(Sender: TObject);
var
  frmNaklp :TfrmNaklp;
begin
try
  frmNaklp := TfrmNaklp.Create (application);
  with frmNaklp do begin
    actSettings.Execute;
    if not actSettings.Checked then begin
      Close;
    end;
  end; //with
  //frmNaklp.DefaultStartup;
except
  AssertInternal('BDB4165C-07F8-427A-B1DF-1DE83ED1A384');
end;
end;

procedure TMainForm.actSqlLogExecute(Sender: TObject);
begin
try
  TfrmSqlLog.Create(Application);
except
  AssertInternal('CB0ACC52-0F01-4052-A97D-2BA6EC5B891D');
end;
end;

procedure TMainForm.actSklostExecute(Sender: TObject);
var
  frmSklost : TfrmSklost;
begin
try
  frmSklost:=TfrmSklost.Create(Application);
  frmSklost.actRefresh.Execute;
except
  AssertInternal('F6BD6A23-8989-4D85-BABA-52882A4FAA78');
end;
end;

procedure TMainForm.actNakloExecute(Sender: TObject);
var
  frmNaklo :TfrmNaklo;
begin
try
  frmNaklo := TfrmNaklo.Create(Application);
  frmNaklo.DefaultStartup;
  frmNaklo.actSettings.Execute;
  if not frmNaklo.actSettings.Checked then begin
    frmNaklo.Close;
  end;
except
  AssertInternal('6A1FD008-DCAE-4623-8771-F0DD6956A490');
end;
end;

procedure TMainForm.actManagerExecute(Sender: TObject);
begin
try
  TfrmManagerSpr.Create(self);
except
  AssertInternal('60033C21-A009-40A4-95CF-EECD8FCB5E69');
end;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
try
  if not dmdEx.Connect then begin
    Application.Terminate;
  end else begin
    if inIDE then begin
      actTestShort.Execute;
    end;
    ShowForPowerUser;
    HideForKievManagers;
  end;
except
  AssertInternal('4AAE8EEB-0E57-4F7B-8FFB-ECA4F6E99D99');
end;
end;

procedure TMainForm.actSkladRasxExExecute(Sender: TObject);
var
  SkladRasx :TfrmSkladRasxEx;
begin
try
  SkladRasx := TfrmSkladRasxEx.Create (Application);
  SkladRasx.DefaultStartup;
  SkladRasx.actSettings.Execute;
  if not SkladRasx.actSettings.Checked then begin
    SkladRasx.Close;
  end;
except
  AssertInternal('C51FCD42-0772-48B9-AFFF-46258AA5450E');
end;
end;

procedure TMainForm.actRefreshReferenceTablesExecute(Sender: TObject);
begin
  dmdEx.RefreshReferenceTables;
end;

procedure TMainForm.actSkladExecute(Sender: TObject);
begin
try
	TfrmSkladSpr.Create (Application);
except
	AssertInternal ('47BBF594-9023-4649-86B9-9982BE63C360');
end;
end;

procedure TMainForm.actRepReestrVydanNnaklExecute(Sender: TObject);
var
  frmRepReestrVydanNnakl: TfrmRepReestrVydanNnakl;
begin
try
	frmRepReestrVydanNnakl := TfrmRepReestrVydanNnakl.Create(Application);
  with frmRepReestrVydanNnakl do begin
  	actSettings.Execute;
    if not actSettings.Checked then begin
      Close;
    end;
  end;
except
	AssertInternal ('B1309960-05A1-4589-BE87-F8146220564F');
end;
end;

procedure TMainForm.actOtpravkiExecute(Sender: TObject);
begin
try
  TfrmOtpravka.Create(application);
except
  AssertInternal('117083E1-7922-428F-9F95-1DAB69014540');
end;
end;

procedure TMainForm.actPrixSkladExecute(Sender: TObject);
var
  frmPrixSklad: TfrmPrixSklad;
begin
  frmPrixSklad := TfrmPrixSklad.Create(application);
  frmPrixSklad.actSettings.Execute;
  if not frmPrixSklad.actSettings.Checked then begin
    frmPrixSklad.Close;
  end;
end;

procedure TMainForm.actSkladRasxBuxExecute(Sender: TObject);
var
  SkladRasxBux : TfrmSkladRasxBux;
begin
try
  SkladRasxBux:= TfrmSkladRasxBux.Create (Application);
  SkladRasxBux.actSettings.Execute;
  if not SkladRasxBux.actSettings.Checked then begin
    SkladRasxBux.Close;
  end;
except
  AssertInternal('C38D859B-24DE-4E41-94D1-4BE68427D3B1');
end;
end;

procedure TMainForm.actRepDolg3Execute(Sender: TObject);
begin
try
  frmRepDolg3 := TfrmRepDolg3.Create(Application);
  frmRepDolg3.DefaultStartup;
  frmRepDolg3.actSettings.Execute;
  if not frmRepDolg3.actSettings.Checked then begin
    frmRepDolg3.Close;
  end;
except
  AssertInternal('288B1872-F0E3-47AF-BE35-D13D60862B7B');
end;
end;

procedure TMainForm.actPrixZakazExecute(Sender: TObject);
var
  Zakaz: TfrmZakaz;
begin
try
  Zakaz := TfrmZakaz.Create(application);
    with Zakaz do begin
    actSettings.Execute;
    if not actSettings.Checked then begin
      Close;
    end;
  end; //with
except
  AssertInternal('5A31DB45-4DF6-40FE-90F8-408D21BA8583');
end;//try
end;

procedure TMainForm.actCurrencyExecute(Sender: TObject);
begin
try
	TfrmCurrency.Create (Application);
except
	AssertInternal ('6C6310AB-70C2-4C4E-914D-81027D81F562');
end;
end;

procedure TMainForm.actSpecExecute(Sender: TObject);
var
  frmSpec: TfrmSpec;
begin
try
  frmSpec := TfrmSpec.Create(application);
  frmSpec.DefaultStartup;
except
  AssertInternal('E2CD8330-66BF-4EFE-A827-262AE04E4401');
end;//try
end;

procedure TMainForm.actNaklpBuxExecute(Sender: TObject);
var
  frmNaklpBux: TfrmNaklpBux;
begin
try
  frmNaklpBux := TfrmNaklpBux.Create(application);
  frmNaklpBux.actSettings.Execute;
  if not frmNaklpBux.actSettings.Checked then begin
    frmNaklpBux.Close;
  end;
  //frmNaklpBux.DefaultStartup;
except
  AssertInternal('B2D1A52E-B955-42BF-A297-0C97CE89B1E3');
end;//try
end;

procedure TMainForm.actPlategyExecute(Sender: TObject);
var
  frmPlategy: TfrmPlategyIsx;
begin
try
  frmPlategy := TfrmPlategyIsx.Create(application);
  with frmPlategy do begin
    DefaultStartup;
    actSettings.Execute;
    if not actSettings.Checked then begin
      Close;
    end;
  end;//with
except
  AssertInternal('AAE8649C-8D5B-4D34-AA60-5ADBCFD33AA2');
end;//try
end;

procedure ShowReportForm(Type2 :TFormReportClass);
var
  frmRepDolgBux :TfrmRepDolgBuxPost;
begin
try
  frmRepDolgBux:=Type2.Create(Application);
  frmRepDolgBux.DefaultStartup;
  frmRepDolgBux.actSettings.Execute;
  if  not frmRepDolgBux.actSettings.Checked then begin
    frmRepDolgBux.Close;
  end;
except
  AssertInternal ('53BEA3F7-B067-42C5-B0C3-77929CDFA17D_'+Type2.ClassName);
end;
end;

procedure TMainForm.actRepDolgBuxPostExecute(Sender: TObject);
begin
  ShowReportForm(TfrmRepDolgBuxPost);
end; 


procedure TMainForm.actNaklpOstExecute(Sender: TObject);
var
  frmNaklpOst : TfrmNaklpOst;
begin
try
  frmNaklpOst := TfrmNaklpOst.Create (Application);
  frmNaklpOst.actSettings.Execute;
  if not frmNaklpOst.actSettings.Checked then begin
    //user pressed cancel
    frmNaklpOst.Close;
  end;
except
  AssertInternal('41D765D5-3D81-4D74-B555-E9FDC220423C');
end;
end;

procedure TMainForm.actSebestOtgrExecute(Sender: TObject);
var
  frmSebestOtgr : TfrmSebestOtgr;
begin
try
  frmSebestOtgr := TfrmSebestOtgr.Create(Application);
  frmSebestOtgr.actSettings.Execute;
  if (not frmSebestOtgr.actSettings.Checked) then begin
    frmSebestOtgr.Close;
  end;
except
  AssertInternal('277B1F8F-2F15-4C65-BA8D-95A95B3CE154');
end;
end;

procedure TMainForm.actRepSkladBuxExecute(Sender: TObject);
var
  frmRepSkladBux : TfrmRepSkladBux;
begin
try
  frmRepSkladBux := TfrmRepSkladBux.Create(Application);
  frmRepSkladBux.actSettings.Execute;
  if (not frmRepSkladBux.actSettings.Checked) then begin
    frmRepSkladBux.Close;
  end;
except
  AssertInternal('5E3ADD4D-3346-41BD-8E2D-E243EC36BF0F');
end;
end;

procedure TMainForm.actSebest3Execute(Sender: TObject);
var
  frmSebMain3 : TfrmSebMain3;
begin
try
  frmSebMain3 := TfrmSebMain3.Create(Application);
  frmSebMain3.actSettings.Execute;
  if (not frmSebMain3.actSettings.Checked) then begin
    frmSebMain3.Close;
  end;
except
  AssertInternal('CCD3AB5F-AB59-4CFF-BD27-31E581C3688A');
end;
end;

procedure TMainForm.actSebestOst3Execute(Sender: TObject);
var
  frmSebestOst3 : TfrmSebestOst3;
begin
try
  frmSebestOst3 := TfrmSebestOst3.Create(Application);
  frmSebestOst3.actSettings.Execute;
  if (not frmSebestOst3.actSettings.Checked) then begin
    frmSebestOst3.Close;
  end;
except
  AssertInternal('4E74E617-0B34-46AA-B5F3-A471EDF7B0A0');
end;
end;

procedure TMainForm.actRepSkladBuxVyravnExecute(Sender: TObject);
var
  frmRepSkladBuxVyravn : TfrmRepSkladBuxVyravn;
begin
try
  frmRepSkladBuxVyravn := TfrmRepSkladBuxVyravn.Create(Application);
  frmRepSkladBuxVyravn.actSettings.Execute;
  if (not frmRepSkladBuxVyravn.actSettings.Checked) then begin
    frmRepSkladBuxVyravn.Close;
  end;
except
  AssertInternal('57E12712-88B3-4C67-A115-60561777C9C3');
end;
end;

procedure TMainForm.actPriceSprExecute(Sender: TObject);
begin
try
	TfrmPriceSpr.Create (Application);
except
	AssertInternal ('188B303C-1A21-45CD-8AD9-CD2BF39DF9D6');
end;
end;

procedure TMainForm.actPriceChangeExecute(Sender: TObject);
var
  frmPriceChange :TfrmPriceChange;
begin
try
  frmPriceChange := TfrmPriceChange.Create(Application);
  frmPriceChange.DefaultStartup;
except
  AssertInternal('E2BA725F-6010-4895-AD87-4B519AF72A81');
end;
end;

procedure TMainForm.actRepPriceExecute(Sender: TObject);
var
  frmRepPrice : TfrmRepPrice;
begin
try
  frmRepPrice := TfrmRepPrice.Create(Application);
  frmRepPrice.actSettings.Execute;
  if (not frmRepPrice.actSettings.Checked) then begin
    frmRepPrice.Close;
  end;
except
  AssertInternal('57E12712-88B3-4C67-A115-60561777C9C3');
end;
end;

procedure TMainForm.actNNaklpExecute(Sender: TObject);
var
  frmNNaklp : TfrmNNaklp;
begin
try
  frmNNaklp := TfrmNNaklp.Create(Application);
  frmNNaklp.actSettings.Execute;
  if (not frmNNaklp.actSettings.Checked) then begin
    frmNNaklp.Close;
  end;
except
  AssertInternal('584FB5FE-4561-4021-B0C1-37302CDA62C2');
end;
end;

procedure TMainForm.actRepReestrPolychNNaklExecute(Sender: TObject);
var
  frmReestrNNaklp : TfrmRepReestrPolychNNakl;
begin
try
	frmReestrNNaklp := TfrmRepReestrPolychNNakl.Create(Application);
  with frmReestrNNaklp do begin
  	actSettings.Execute;
    if not actSettings.Checked then begin
      Close;
    end;
  end;
except
	AssertInternal ('39D01665-E322-467B-941C-0CFF4FC553BF');
end;
end;

procedure TMainForm.actSkidkaSprExecute(Sender: TObject);
begin
try
	TfrmSkidkaSpr.Create (Application);
except
	AssertInternal ('0713B078-7775-4715-86A1-B8B2DC4CBC4B');
end;
end;

procedure TMainForm.actSkidkaChangeExecute(Sender: TObject);
var
  frmSkidkaChange :TfrmSkidkaChange;
begin
try
  frmSkidkaChange := TfrmSkidkaChange.Create(Application);
  frmSkidkaChange.DefaultStartup;
  frmSkidkaChange.actSettings.Execute;
  if  not frmSkidkaChange.actSettings.Checked then begin
    frmSkidkaChange.Close;
  end;
except
  AssertInternal('36397F10-7F55-4DDE-BA0F-12F0558881E6');
end;
end;

procedure TMainForm.actUslPostavkaSprExecute(Sender: TObject);
begin
try
	TfrmUslPostavkaSpr.Create (Application);
except
	AssertInternal ('E6E8933C-9E6A-4AB7-A60F-068FBECA0E85');
end;
end;

procedure TMainForm.actUslPostavkaChangeExecute(Sender: TObject);
var
  frmUslPostavkaChange :TfrmUslPostavkaChange;
begin
try
  frmUslPostavkaChange := TfrmUslPostavkaChange.Create(Application);
  frmUslPostavkaChange.DefaultStartup;
except
  AssertInternal('E4161D40-7EC6-4424-81E9-498005D551CC');
end;
end;

procedure TMainForm.actVidDostavkiSprExecute(Sender: TObject);
begin
try
	TfrmVidDostavkiSpr.Create (Application);
except
	AssertInternal ('8100DAEC-563B-41E6-B867-C033A1B60DB6');
end;
end;

procedure TMainForm.actSravnPriceExecute(Sender: TObject);
var
  frmSravnPrice : TfrmSravnPrice;
begin
try
  frmSravnPrice := TfrmSravnPrice.Create(Application);
  frmSravnPrice.actSettings.Execute;
  if (not frmSravnPrice.actSettings.Checked) then begin
    frmSravnPrice.Close;
  end;
except
  AssertInternal('D106A578-CA79-4AF5-B7A6-B8DD31355A1E');
end;
end;

procedure TMainForm.actSravnPriceListExecute(Sender: TObject);
var
  frmSravnPriceList :TfrmSravnPriceList;
begin
try
  frmSravnPriceList := TfrmSravnPriceList.Create(Application);
  frmSravnPriceList.DefaultStartup;
except
  AssertInternal('55AE9A01-59AE-4D22-8D4B-C5989B1F071A');
end;
end;

procedure TMainForm.actSpecOstAllExecute(Sender: TObject);
var
  frmSpecOstAll :TfrmSpecOstAll;
begin
try
  frmSpecOstAll := TfrmSpecOstAll.Create(Application);
  frmSpecOstAll.actSettings.Execute;
  if (not frmSpecOstAll.actSettings.Checked) then begin
    frmSpecOstAll.Close;
  end;
except
  AssertInternal('3111C23F-8AD7-4C91-B8FC-70B1D1AF522C');
end;
end;

procedure TMainForm.actRepSkladFactExecute(Sender: TObject);
var
  frmRepSkladFact : TfrmRepSkladFact;
begin
try
  frmRepSkladFact := TfrmRepSkladFact.Create(Application);
  frmRepSkladFact.actSettings.Execute;
  if (not frmRepSkladFact.actSettings.Checked) then begin
    frmRepSkladFact.Close;
  end;
except
  AssertInternal('8D367445-4008-4F6D-81D5-D1B8EC9071F1');
end;
end;



procedure TMainForm.actNaklPeremBuxExecute(Sender: TObject);
var
  frmNaklPeremBux : TfrmNaklPeremBux;
begin
try
  frmNaklPeremBux := TfrmNaklPeremBux.Create(Application);
  frmNaklPeremBux.DefaultStartup;
  frmNaklPeremBux.actSettings.Execute;
  if (not frmNaklPeremBux.actSettings.Checked) then begin
    frmNaklPeremBux.Close;
  end;
except
  AssertInternal('0283E7AF-CC95-49EC-9202-CAED67196A6B');
end;
end;

procedure TMainForm.actSebestOtgrBuxExecute(Sender: TObject);
var
  frmSebestOtgrBux : TfrmSebestOtgrBux;
begin
try
  frmSebestOtgrBux := TfrmSebestOtgrBux.Create(Application);
  frmSebestOtgrBux.actSettings.Execute;
  if (not frmSebestOtgrBux.actSettings.Checked) then begin
    frmSebestOtgrBux.Close;
  end;
except
  AssertInternal('277B1F8F-2F15-4C65-BA8D-95A95B3CE154');
end;
end;


procedure TMainForm.TestSkladRasxEx;
var
  SkladRasx :TfrmSkladRasxEx;
  bQueryOpened:boolean;
begin
  SkladRasx := TfrmSkladRasxEx.Create (Application);
  SkladRasx.DefaultStartup;
  bQueryOpened :=SkladRasx.DefaultOpen;
  if not bQueryOpened then begin
    AssertInternal('B8C71908-DB11-47D4-BA77-F5D8DDD43058');
  end;
  SkladRasx.Close;
end;

procedure TMainForm.TestNNakl;
var
  NNakl :TfrmNNakl;
  bQueryOpened:boolean;
begin
  NNakl := TfrmNNakl.Create (Application);
  NNakl.DefaultStartup;
  bQueryOpened :=NNakl.DefaultOpen;
  if not bQueryOpened then begin
    AssertInternal('70698F99-18AB-4706-8192-98B1A34CAAB7');
  end;
  NNakl.Close;
end;


procedure TMainForm.TestRealPrice;
var
  RealPrice :TfrmRealPrice;
  bQueryOpened:boolean;
begin
  RealPrice := TfrmRealPrice.Create (Application);
  RealPrice.DefaultStartup;
  bQueryOpened :=RealPrice.DefaultOpen;
  if not bQueryOpened then begin
    AssertInternal('C51657BD-9676-4B1C-B28F-6B878691F531');
  end;
  RealPrice.Close;
end;

procedure TMainForm.TestSchet;
var
  Schet :TfrmSchet;
  bQueryOpened:boolean;
begin
  Schet := TfrmSchet.Create (Application);
  Schet.DefaultStartup;
  bQueryOpened :=Schet.DefaultOpen;
  if not bQueryOpened then begin
    AssertInternal('C51657BD-9676-4B1C-B28F-6B878691F531');
  end;
  Schet.actCopySchet.execute;
  if Schet.actCopySchet.Tag<>0 then begin
    Schet.qurNaklr.Locate('schet',Schet.actCopySchet.Tag,[]);
    Schet.qurNaklr.Delete;
    Schet.qurNaklr.ApplyUpdates(0);
  end;
  Schet.Close;
end;

procedure TMainForm.actTestExecute(Sender: TObject);
begin
//  TestPlategy;    //фиг
//  TestRepClientLastContact; //долго
//  TestPerevod;  //фиг
  TestRepDvigDenSredstv;
  TestZakazAddDetail;
  TestSpecOstAll;
  TestSkladRasxEx;
  TestNNakl;
  TestSchet;
  TestRealPrice;
  TestNaklo;
  TestRepManager;
  TestRepNakloDepend;
  TestNakloUnpostXranenieDepend;
  TestZakaz;
  TestSklost;
  TestNaklpOst;
  TestVozvrat;
  TestNaklpOstDet;
  TestDolgProsrochen;
  TestRepDolgNalDet;
  TestRepDolgSebest;
  TestRepDolgBuxPost;
  TestVozvratMakeFromNaklr;
  TestRasxPoKasse;
  TestRepDengiNaSchetax;
  TestTovarKnigaXml;
  TestRepDolgAgent;
  TestOpenNaklPeremBux;
  TestOpenNaklp;
  TestPerevod;
  TestPlategyVxod;
  TestRepBalans;
  TestRasxPoKasseRefresh;
  TestNaklr2;
  TestNaklru;
  TestNaklpu;
  dmdEx.GetNds(Now);
  TestSchet;
  TestRepDolgBuxN0;
  TestRepReys;
end;

procedure TMainForm.TestNaklo;
var
  Naklo :TfrmNaklo;
  bQueryOpened:boolean;
begin
  Naklo := TfrmNaklo.Create (Application);
  Naklo.DefaultStartup;
  bQueryOpened :=Naklo.DefaultOpen;
  if not bQueryOpened then begin
    AssertInternal('DF5E103C-019F-4F78-B2F2-56B206F612EB');
  end;
  Naklo.Close;
end;

procedure TMainForm.TestRepManager;
var
  Naklo :TfrmRepMan;
  bQueryOpened:boolean;
begin
  Naklo := TfrmRepMan.Create (Application);
  Naklo.DefaultStartup;
  bQueryOpened :=Naklo.DefaultOpen;
  if not bQueryOpened then begin
    AssertInternal('0630A51D-F67D-4572-89F8-DD52E0BAED16');
  end;
  Naklo.Close;
end;

procedure TMainForm.TestSpecOstAll;
var
  SpecOstAll :TfrmSpecOstAll;
  bQueryOpened : boolean;
begin
  SpecOstAll := TfrmSpecOstAll.Create(Application);
  SpecOstAll.DefaultStartup;
  bQueryOpened :=SpecOstAll.DefaultOpen;
  if not bQueryOpened then begin
    AssertInternal('TestSpecOstAll');
  end;
  //SpecOstAll.actSelfTest.Execute;
  SpecOstAll.Close;
end;

procedure TMainForm.TestRepNakloDepend;
var
  RepNakloDepend :TfrmRepNakloDepend;
begin
  RepNakloDepend := TfrmRepNakloDepend.Create(Application);
  RepNakloDepend.DefaultStartup;
  if not RepNakloDepend.DefaultOpen then begin
    AssertInternal('2C605CFA-4D9E-4C42-81FC-6A33312AF352');
  end;
  RepNakloDepend.Close;
end;

procedure TMainForm.TestNakloUnpostXranenieDepend;
var
  Naklo : TfrmNaklo;
begin
  Naklo := TfrmNaklo.Create(Application);
  if Naklo.CheckForXranenie(324808,103,mrNo) then begin
    AssertInternal('2C3544D3-A47A-4CF6-BD17-C149678ED9ED');
  end;
  Naklo.Close;
end;

procedure TMainForm.TestZakaz;
var
  Zakaz : TfrmZakaz;
begin
Zakaz := TfrmZakaz.Create(Application);
try
try
  with  Zakaz do begin
    DefaultStartup;
    with cdsNaklo do begin
      Tag:=1;
      Insert;
      FieldByName('id_zak').asInteger :=
        dmdEx.cdsClient.Lookup('name','123','id');
      FieldByName('id_manager').AsInteger :=
        dmdEx.cdsManager.Lookup('name','Тест','id');
      Post;
      Tag:=0;
      ApplyUpdates(0);
    end;
    with cdsNaklot do begin
      Tag:=1;
      Insert;
      FieldByName('id_tovar').asInteger :=
        dmdEx.cdsTovar.Lookup('name','ТППэп 10*2*0,32','id');
      Post;
      Tag:=0;
    end;
    with cdsNaklot do begin
      Tag:=1;
      Insert;
      FieldByName('id_tovar').asInteger :=
        dmdEx.cdsTovar.Lookup('name','ТППэп 10*2*0,32','id');
      Post;
      Tag:=0;
    end;

    cdsNaklot.Delete;
    cdsNaklot.Delete;
    cdsNaklo.Delete;

  end;//with  Zakaz
finally
  Zakaz.Free;
end;
except
  AssertInternal('945A50C9-507A-460E-BB51-D14A77AA19A9');
end;
end;

procedure TMainForm.TestZakazAddDetail;
var
  Zakaz : TfrmZakaz;
  frmDetSelect : TfrmDetSelect;
begin
Zakaz := TfrmZakaz.Create(Application);
try
  with  Zakaz do begin
    DefaultStartup;
    with cdsNaklo do begin
      Tag:=1;
      Insert;
      FieldByName('id_zak').asInteger :=
        dmdEx.cdsClient.Lookup('name','123','id');
      FieldByName('id_manager').AsInteger :=
        dmdEx.cdsManager.Lookup('name','Тест','id');
      Post;
      Tag:=0;
      ApplyUpdates(0);
    end;
    //Zakaz.actAddDet.Execute;
    frmDetSelect := TfrmDetSelect.Create(Self);
    with frmDetSelect do begin
      ShowSprTovarSnab;
      edtFilter.Text:='АВВГ 185';
      processfilter;
      actSelectAll.Execute;
      InsertDetRows(Zakaz.dsNaklot.DataSet,'id_tovar');
      //Zakaz.dbgNaklot.Selection.SelectionType
      Free;
    end;
    cdsNaklo.Delete;
    PostAndApply(cdsNaklo);
    Free;
  end;//with  Zakaz
except
  AssertInternal('FC687132-4B63-4D32-B003-6872E81237FB');
end;
end;

procedure TMainForm.TestSklost;
var
  Sklost : TfrmSklost;
begin
  Sklost := TfrmSklost.Create(Application);
try
try
  dmdEx.OpenQuery(dmdEx.cdsEdiz);
  dmdEx.OpenQuery(dmdEx.cdsSklads);
  dmdEx.OpenQuery(dmdEx.cdsTovarAll);


  Sklost.ShowDetail(2,
    0,
    dmdEx.cdsTovarAll.Lookup('name','Щека №20','id'),
    Date,
    null
  );
finally
  dmdEx.CloseQuery(dmdEx.cdsTovarAll,true);
  dmdEx.OpenQuery(dmdEx.cdsSklads,true);
  Sklost.Free;
end;
except
  AssertInternal('52497EAC-0408-4738-B11A-B535AE21F719');
end;
end;

procedure TMainForm.TestNaklpOst;
var
  frmNaklpOst :TfrmNaklpOst;
begin
  frmNaklpOst := TfrmNaklpOst.Create(Application);
  frmNaklpOst.DefaultStartup;
  if not frmNaklpOst.DefaultOpen then begin
    AssertInternal('49B72AFD-9B03-49F2-96C0-B1E898F5DCC5');
  end;
  frmNaklpOst.Close;
end;

procedure TMainForm.TestPlategy;
var
  Plategy : TfrmPlategyIsx;
begin
Plategy := TfrmPlategyIsx.Create(Application);
try
  with Plategy do begin
    Test;
    Free;
  end;//with  Zakaz
except
  AssertInternal('3974DE0A-2BFA-4932-B394-95DEA766739D');
end;
end;

procedure TMainForm.TestVozvrat;
var
  Vozvrat : TfrmVozvrat;
begin
  Vozvrat := TfrmVozvrat.Create(Application);
  try
  try
    with  Vozvrat do begin
      DefaultStartup;
      if not DefaultOpen then begin
        AssertInternal('0DE1F904-390B-4922-BE15-3E71A900300D');
      end;
      with cdsNaklo do begin
        Tag:=1;
        Insert;
        FieldByName('id_izg').asInteger :=
          dmdEx.cdsVlad.Lookup('name','нал','id');
        FieldByName('id_zak').asInteger :=
          dmdEx.cdsClient.Lookup('name','123','id');
        FieldByName('id_manager').AsInteger :=
          dmdEx.cdsManager.Lookup('name','Тест','id');
        Post;
        Tag:=0;
        ApplyUpdates(0);
      end;
      with cdsNaklot do begin
        Tag:=1;
        Insert;
        FieldByName('id_tovar').asInteger :=
          dmdEx.cdsTovarAllND.Lookup('name','ТППэп 10*2*0,32','id');
        Post;
        Tag:=0;
      end;
      with cdsNaklot do begin
        Tag:=1;
        Insert;
        FieldByName('id_tovar').asInteger :=
          dmdEx.cdsTovarAllND.Lookup('name','ТППэп 10*2*0,32','id');
        Post;
        Tag:=0;
      end;

      cdsNaklot.Delete;
      cdsNaklot.Delete;
      cdsNaklo.Delete;

    end;//with  Zakaz
  finally
    Vozvrat.Free;
  end;
  except
    AssertInternal('E984270B-2411-489F-8A07-A903A9BB667B');
  end;
end;

procedure TMainForm.actVozvratExecute(Sender: TObject);
var
  Vozvrat: TfrmVozvrat;
begin
try
  Vozvrat := TfrmVozvrat.Create(application);
    with Vozvrat do begin
    actSettings.Execute;
    if not actSettings.Checked then begin
      Close;
    end;
  end; //with
except
  AssertInternal('9A58540E-C9EE-4457-808A-4E3B321C0EB3');
end;//try
end;

procedure TMainForm.TestVozvratMakeFromNaklr;
var
  Naklr : TfrmNaklr;
  Vozvrat : TfrmVozvrat;
  iNakl : integer;
begin
  Naklr := TfrmNaklr.Create(Application);
  with Naklr do begin
  try
    DefaultOpen;
    Naklr.actMakeVozvrat.Execute;
    iNakl := Naklr.actMakeVozvrat.Tag;
  finally
    Free;
  end;
  end;//with
  if iNakl =0 then exit;
  Vozvrat := TfrmVozvrat.Create (Application);
  with Vozvrat do begin
    try
      qeNaklo.AddSQL(
        'where',
        'id_nakl='+
          inttostr(iNakl)
      ); //только наш документ
      DefaultOpen;//Открытие данных
      if cdsNaklo.Eof and cdsNaklo.bof then begin
        AssertInternal('EFDD0FD6-FD04-426F-9CF4-3341F4139941');
      end;
      cdsNaklo.Delete;
    finally
      Free;
    end;//try
  end;//with
end;

procedure TMainForm.TestNaklpOstDet;
var
  NaklpOst :TfrmNaklpOst;
begin
  NaklpOst := TfrmNaklpOst.Create(Application);
  try
    //окрыть по умолчанию
    NaklpOst.DefaultStartup;
    if not NaklpOst.DefaultOpen then begin
      AssertInternal('BE5E23AE-B1AF-45D0-BAD4-EE693AC61915');
    end;
    //окрыть детализацию
    try
      NaklpOst.actDetail.Execute;
    except
      AssertInternal('93989491-18EC-4558-BE43-6C63A4964B74');
    end;
  finally
    NaklpOst.Free;
  end;
  //всё закрыть
end;

procedure TMainForm.TestDolgProsrochen;
var
  RepDolg :TfrmRepDolg3;
begin
  RepDolg := TfrmRepDolg3.Create(Application);
  try
    //окрыть по умолчанию
    RepDolg.DefaultStartup;
    if not RepDolg.DefaultOpen then begin
      AssertInternal('046228FE-D4FD-4A06-9338-1111C9F5C434');
    end;
  finally
    RepDolg.Free;
  end;
end;

procedure TMainForm.actRasxPoKasseExecute(Sender: TObject);
var
  frmRasxPoKasse: TfrmRasxPoKasse;
begin
try
  frmRasxPoKasse := TfrmRasxPoKasse.Create(application);
  with frmRasxPoKasse do begin
    DefaultStartup;
    actSettings.Execute;
    if not actSettings.Checked then begin
      Close;
    end;
  end;//with
except
  AssertInternal('6CAF85F1-8810-4C37-A300-0362F5AE7033');
end;//try
end;

procedure TMainForm.TestRasxPoKasse;
var
  RasxPoKasse : TfrmRasxPoKasse;
begin
  RasxPoKasse := TfrmRasxPoKasse.Create(Application);
  try
    with RasxPoKasse do begin
      DefaultStartup;
      if not DefaultOpen then begin
        AssertInternal('C8B50DEE-88A5-4EE7-A12D-20D057A6344F');
      end;
      with cdsNaklo do begin
        Tag:=1;
        Insert;
        FieldByName('id_izg').asInteger :=
          dmdEx.cdsClient.Lookup('name','123','id');
        FieldByName('id_zak').asInteger :=
          dmdEx.cdsVlad.Lookup('name','Варан ООО','id');
        FieldByName('id_manager').AsInteger :=
          dmdEx.cdsManager.Lookup('name','Тест','id');
        Post;
        Tag:=0;
        ApplyUpdates(0);
      end;
      actPost.Checked := true;
      actPost.execute;
      actUnPost.Checked := true;
      actUnpost.Execute;
      cdsNaklo.Delete;
      PostAndApply(cdsNaklo);
      Free;
    end;//with  RasxPoKasse
  except
    AssertInternal('0282EDEB-A7FD-4547-A59F-1B066F479AE1');
  end;
end;

procedure TMainForm.actRepDolgNalExecute(Sender: TObject);
begin
  ShowReportForm(TfrmRepDolgNal);
end;

procedure TMainForm.TestRepDolgNalDet;
var
  RepDolgNal :TfrmRepDolgNal;
begin
  RepDolgNal := TfrmRepDolgNal.Create(Application);
  try
    RepDolgNal.DefaultStartup;
    RepDolgNal.setT.DateFrom := strtodate('01.01.07');
    RepDolgNal.setT.DateTo := strtodate('31.01.07');
    RepDolgNal.setT.GetPlugin('fmSettingsClient').SetKeyValue(
      dmdEx.cdsClient.Lookup('name','Телесистемы Украины 000','id')
    );
    if not RepDolgNal.DefaultOpen then begin
      AssertInternal('30DA385F-0E86-47EB-A3CD-1A828D59CF32');
    end;
    RepDolgNal.actDetail.Execute;
  finally
    RepDolgNal.Free;
  end;
end;

procedure TMainForm.ShowForPowerUser;
begin
  actRasxPoKasse.Enabled := false;
  actRasxPoKasse.Visible := false;

  actRepBalans.Enabled := false;
  actRepBalans.Visible :=false;

  actShowAnyDocByNum.Enabled:=false;
  actShowAnyDocByNum.Visible:=false;

  actManager.Enabled := false;
  actManager.Visible := false;
  if ((dmdEx.getrole='POWER_USER') or (dmdEx.GetUser='SYSDBA')) then begin
    actRasxPoKasse.Enabled := true;
    actRasxPoKasse.Visible := true;

    actRepBalans.Enabled := true;
    actRepBalans.Visible :=true;

    actShowAnyDocByNum.Enabled:=true;
    actShowAnyDocByNum.Visible:=true;

    actManager.Enabled := true;
    actManager.Visible := true;
  end;
end;

procedure TMainForm.actRepDolgSebestExecute(Sender: TObject);
begin
  ShowReportForm(TfrmRepDolgSebest);
end;

procedure TMainForm.TestRepDolgSebest;
var
  RepDolgSebest :TfrmRepDolgSebest;
begin
  RepDolgSebest := TfrmRepDolgSebest.Create(Application);
  try
    RepDolgSebest.DefaultStartup;
    RepDolgSebest.setT.GetPlugin('fmSettingsDate').SetKeyValue('01.01.07');
    RepDolgSebest.setT.GetPlugin('fmSettingsManager').SetKeyValue(
      dmdEx.cdsManager.Lookup('name','Шавловский С.-ТПП','id')
    );
    if not RepDolgSebest.DefaultOpen then begin
      AssertInternal('479557DE-1BB9-4D1F-BBD0-F251E132ABC5');
    end;
    //RepDolgSebest.actDetail.Execute;
  finally
    RepDolgSebest.Free;
  end;
end;

procedure TMainForm.TestRepDolgBuxPost;
var
  RepDolgBuxPost :TfrmRepDolgBuxPost;
begin
  RepDolgBuxPost := TfrmRepDolgBuxPost.Create(Application);
  try
    RepDolgBuxPost.DefaultStartup;
    RepDolgBuxPost.setT.GetPlugin('fmSettingsManager').SetKeyValue(
      dmdEx.cdsManager.Lookup('name','Альбина','id')
    );
    RepDolgBuxPost.setT.DateFrom := strtodate('01.01.07');
    RepDolgBuxPost.setT.DateTo := strtodate('31.01.07');

    if not RepDolgBuxPost.DefaultOpen then begin
      AssertInternal('479557DE-1BB9-4D1F-BBD0-F251E132ABC5');
    end;
    RepDolgBuxPost.actDetail.Execute;
  finally
    RepDolgBuxPost.Free;
  end;
end;

procedure TMainForm.TestRepDolgBux;
var
  RepDolgBux :TfrmRepDolgBux;
begin
  RepDolgBux := TfrmRepDolgBux.Create(Application);
  with RepDolgBux do begin
  try
    DefaultStartup;
    setT.DateFrom := strtodate('01.01.08');
    setT.DateTo := strtodate('31.01.08');

    if not DefaultOpen then begin
      AssertInternal('589CA543-8434-428E-8CBE-CD9FC9678E05');
    end;
    actDetail.Execute;
  finally
    Free;
  end;
  end;//with RepDolgBux
end;

procedure TMainForm.TestRepDolgBuxN0;
var
  RepDolgBux :TfrmRepDolgBux;
begin
  RepDolgBux := TfrmRepDolgBux.Create(Application);
  with RepDolgBux do begin
  try
    DefaultStartup;
    setT.DateFrom := strtodate('01.01.09');
    setT.DateTo := strtodate('31.01.09');
    //группировать по поставщику, покупателю, менеджеру
    setT.GetPlugin('fmSettingsTipGroup').SetKeyValue('1');
    //показывать Налоговые Обязательства
    setT.GetPlugin('fmSettingsTipDetail2').SetKeyValue(1);
    if not DefaultOpen then begin
      AssertInternal('691D465F-8F0E-4DA3-80CA-BE3F2D1E1208');
    end;
  finally
    Free;
  end;
  end;//with RepDolgBux
end;

procedure TMainForm.HideForKievManagers;
begin
{
  if (dmdEx.HasManagerParentKiev=1)
    and (dmdEx.GetUser<>'SKRYNNIK')
    and (dmdEx.GetUser<>'KISTIVA2')
    and (dmdEx.GetUser<>'SACHENKO2')
    and (dmdEx.GetRole='MANAGER')
  then begin
    actRealPrice.Visible := false;
    actPrixod.Visible := false;
    actRepDolg3.Visible := false;
    actRepDolgBux.Visible := false;
    actRepMan.Visible := false;
  end;
}
end;

procedure TMainForm.actRepDengiNaSchetaxExecute(Sender: TObject);
begin
  ShowReportForm(TfrmRepDengiNaSchetax);
end;

procedure TMainForm.TestRepDengiNaSchetax;
var
  RepDengiNaSchetax :TfrmRepDengiNaSchetax;
begin
  RepDengiNaSchetax := TfrmRepDengiNaSchetax.Create(Application);
  try
    RepDengiNaSchetax.DefaultStartup;
    RepDengiNaSchetax.setT.DateFrom := strtodate('01.05.07');
    RepDengiNaSchetax.setT.DateTo := strtodate('31.05.07');
    if not RepDengiNaSchetax.DefaultOpen then begin
      AssertInternal('232937CD-D7AE-43C1-8DEE-BDDFF83A923F');
    end;
    //RepDengiNaSchetax.actDetail.Execute;
  finally
    RepDengiNaSchetax.Free;
  end;
end;



procedure TMainForm.actRepClientDataExecute(Sender: TObject);
var
  frmRepClientLastContact : TfrmRepClientLastContact;
begin
try
  frmRepClientLastContact := TfrmRepClientLastContact.Create (Application);
  frmRepClientLastContact.DefaultStartup;
  frmRepClientLastContact.actSettings.Execute;
  if not frmRepClientLastContact.actSettings.Checked then begin
    frmRepClientLastContact.Close;
  end;
except
  AssertInternal ('E9DD564F-A0D4-41FA-BF01-36C59AC5A373');
end;
end;


procedure TMainForm.TestRepClientLastContact;
var
  RepClientLastContact :TfrmRepClientLastContact;
begin
  RepClientLastContact := TfrmRepClientLastContact.Create(Application);
  try
    RepClientLastContact.DefaultStartup;
    if not RepClientLastContact.DefaultOpen then begin
      AssertInternal('EA063665-8117-4992-A8F4-4C7CC2C1DA2B');
    end;
  finally
    RepClientLastContact.Free;
  end;
end;

procedure TMainForm.actPerevodExecute(Sender: TObject);
var
  frmPerevod: TfrmPerevod;
begin
try
  frmPerevod := TfrmPerevod.Create(application);
  with frmPerevod do begin
    DefaultStartup;
    actSettings.Execute;
    if not actSettings.Checked then begin
      Close;
    end;
  end;//with
except
  AssertInternal('525D59BB-DFB2-409D-BEB4-6DA8E8FD2EBC');
end;//try
end;

procedure TMainForm.TestPerevod;
var
  Perevod : TfrmPerevod;
begin
Perevod := TfrmPerevod.Create(Application);
try
  with Perevod do begin
    test;
    Free;
  end;//with Perevod
except
  AssertInternal('147512D6-9951-4425-B208-90335452C01F');
end;
end;


procedure TMainForm.actAgentSprExecute(Sender: TObject);
begin
try
	TfrmAgentSpr.Create (Application);
except
	AssertInternal ('556B6EB8-1A8F-467D-95C6-41B8FDF13372');
end;
end;

procedure TMainForm.TestTovarKnigaXml;
var
  frmRepReestrVydanNnakl: TfrmRepReestrVydanNnakl;
begin
  frmRepReestrVydanNnakl :=TfrmRepReestrVydanNnakl.Create(Application);
  with frmRepReestrVydanNnakl do begin
    Test;
    Close;
  end;
end;

procedure TMainForm.actRepDolgAgentExecute(Sender: TObject);
begin
  ShowReportForm(TfrmRepDolgAgent);
end;

procedure TMainForm.TestRepDolgAgent;
var
  RepDolgAgent :TfrmRepDolgAgent;
begin
  RepDolgAgent := TfrmRepDolgAgent.Create(Application);
  try
    RepDolgAgent.DefaultStartup;
    if not RepDolgAgent.DefaultOpen then begin
      AssertInternal('8D5BEAD5-8E2E-4637-A391-B810810402B3');
    end;
  finally
    RepDolgAgent.Free;
  end;
end;

procedure TMainForm.TestOpenNaklPeremBux;
var
  frmNaklPeremBux : TfrmNaklPeremBux;
begin
  frmNaklPeremBux := TfrmNaklPeremBux.Create(Application);
  frmNaklPeremBux.qeNaklo.AddSQL(
    'where',
    'id_nakl=521394'
  ); //выбор только одной накладной
  frmNaklPeremBux.actRefresh.Execute;
  if frmNaklPeremBux.cdsNaklo.RecordCount=0 then begin
    AssertInternal('77BB580C-3746-49C5-B4EC-3586B056A6B9');
  end;
  if frmNaklPeremBux.cdsNaklo.RecordCount>1 then begin
    AssertInternal('7690A7BC-2FB9-4344-8408-1918B567183C');
  end;
  frmNaklPeremBux.Close;
end;

procedure TMainForm.TestOpenNaklp;
var
  frmNaklp : TfrmNaklp;
begin
  frmNaklp := TfrmNaklp.Create(Application);
  frmNaklp.qeNaklo.AddSQL('where','parent_id_nakl=531606');
  frmNaklp.actRefresh.Execute;
  if frmNaklp.cdsNaklp.RecordCount=0 then begin
    AssertInternal('C9A26A97-930C-4D42-9F6E-0ED78B466F0F');
  end;
  if frmNaklp.cdsNaklp.RecordCount>1 then begin
    AssertInternal('6A59E239-BCBE-457B-96A1-AD8995A6975B');
  end;
  frmNaklp.Close;
end;


procedure TMainForm.TestPlategyVxod;
var
  Plategy : TfrmPlategyVxod;
begin
  Plategy := TfrmPlategyVxod.Create(Application);
  try
    with Plategy do begin
      Test;
      Free;
    end;//with  Zakaz
  except
    AssertInternal('F94A6005-1D20-4F7D-8A7C-7B16E5EF330D');
  end;
end;

procedure TMainForm.actRepBalansExecute(Sender: TObject);
begin
  ShowReportForm(TfrmRepBalans);
end;

procedure TMainForm.TestRepBalans;
var
  RepBalans :TfrmRepBalans;
begin
  RepBalans := TfrmRepBalans.Create(Application);
  try
    RepBalans.DefaultStartup;
    if not RepBalans.DefaultOpen then begin
      AssertInternal('B3095C6F-2063-4531-AEF1-9F733E494097');
    end;
  finally
    RepBalans.Free;// uncomment after testing
  end;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caNone;
  if InIde then begin
     Action := caFree;
  end else begin //if InIde
    if MessageDlg('Закрыть программу?',mtConfirmation,[mbOk,mbCancel],0) = mrOk then begin
       Action := caFree;
    end;
  end; //if InIde
end;


procedure TMainForm.actShowAnyDocByNumExecute(Sender: TObject);
var
  iNakl : integer;
  dValue :double;
begin
  if dmdEx.ColumnNumberInput('Введите идентификатор документа','', dValue)
  then begin
    iNakl := Round(dValue);
    OpenDocument(self, iNakl, 0,0);
  end;

end;

procedure TMainForm.TestRasxPoKasseRefresh;
var
  frmRasxPoKasse : TfrmRasxPoKasse;
begin
  frmRasxPoKasse := TfrmRasxPoKasse.Create(self);
  frmRasxPoKasse.qeNaklo.AddSQL(
    'where',
    'id_nakl=518089'
  ); //выбор только одной накладной
  frmRasxPoKasse.actRefresh.Execute;
  frmRasxPoKasse.actRefresh.Execute;
  if frmRasxPoKasse.cdsNaklo.RecordCount>1 then begin
    AssertInternal('AE22A4AD-FB19-4680-89C4-39F015AEC1CE');
  end;
  frmRasxPoKasse.Free;
end;

procedure TMainForm.actNaklrExecute(Sender: TObject);
var
  frmNaklr : TfrmNaklr;
begin
try
  frmNaklr := TfrmNaklr.Create (Application);
  with  frmNaklr do begin
    DefaultStartup;
    actSettings.Execute;
    if not actSettings.Checked then begin
      Close;
    end;
  end;//with
except
  AssertInternal ('4044E2C0-2376-4A3C-806D-DF1CE41F9EAF');
end;
end;

procedure TMainForm.TestNaklr2;
var
  Naklr :TfrmNaklr;
  bQueryOpened:boolean;
begin
  Naklr := TfrmNaklr.Create (Application);
  Naklr.DefaultStartup;
  bQueryOpened :=Naklr.actDefaultOpen.Execute;
  if not bQueryOpened then begin
    AssertInternal('B24DE2A5-AB47-47B4-B865-60A4CD438F55');
  end;
  Naklr.Close;
end;


procedure TMainForm.TestNNaklReestr;
var
  frmNNaklReestr: TfrmNNaklReestr;
begin
try
	frmNNaklReestr := TfrmNNaklReestr.Create(Application);
  with frmNNaklReestr do begin
  	Test;
    //Close;
  end;
except
	AssertInternal ('3030B733-B96E-477B-ADB2-65CFE2CEF3AE');
end;
end;


procedure TMainForm.actNNaklrReestrExecute(Sender: TObject);
var
  frmNNaklReestr: TfrmNNaklReestr;
begin
try
	frmNNaklReestr := TfrmNNaklReestr.Create(Application);
  with frmNNaklReestr do begin
  	actSettings.Execute;
    if not actSettings.Checked then begin
      Close;
    end;
  end;
except
	AssertInternal ('3BACFFEF-6E52-47E7-9C75-F322F7F4FAE3');
end;
end;

procedure TMainForm.actNaklruExecute(Sender: TObject);
var
  frmNaklru : TfrmNaklru;
begin
try
  frmNaklru := TfrmNaklru.Create (Application);
  with  frmNaklru do begin
    DefaultStartup;
    actSettings.Execute;
    if not actSettings.Checked then begin
      Close;
    end;
  end;//with
except
  AssertInternal ('93B1E969-5289-4E96-920F-4EB70DF99EDB');
end;
end;

procedure TMainForm.actProjectSprExecute(Sender: TObject);
begin
try
	TfrmProjectSpr.Create (Application);
except
	AssertInternal ('0713B078-7775-4715-86A1-B8B2DC4CBC4B');
end;
end;

procedure TMainForm.actStatyadrExecute(Sender: TObject);
begin
try
	TfrmStatyadrSpr.Create (Application);
except
	AssertInternal ('AFA7B975-B84E-422B-B813-2C94ED2AFC85');
end;
end;

procedure TMainForm.actNaklpuExecute(Sender: TObject);
var
  frmNaklpu : TfrmNaklpu2;
begin
try
  frmNaklpu := TfrmNaklpu2.Create (Application);
  with  frmNaklpu do begin
    DefaultStartup;
    actSettings.Execute;
    if not actSettings.Checked then begin
      Close;
    end;
  end;//with
except
  AssertInternal ('93B1E969-5289-4E96-920F-88B70DF99EDB');
end;
end;

procedure TMainForm.TestNaklru;
var
  frmNaklru: TfrmNaklru;
begin
try
	frmNaklru := TfrmNaklru.Create(Application);
  with frmNaklru do begin
  	Test;
    Close;
  end;
except
	AssertInternal ('DA29BAFF-9129-4D38-A437-8897585CCB6D');
end;
end;

procedure TMainForm.TestNaklpu;
var
  frmNaklru: TfrmNaklru;
begin
try
	frmNaklru := TfrmNaklpu2.Create(Application);
  with frmNaklru do begin
  	Test;
    Close;
  end;
except
	AssertInternal ('1B3B1CC2-D1FA-4A09-AA32-5B42EF617426');
end;
end;



procedure TMainForm.TestPrixDet;
var
  frmPrixDet : TfrmPrixDet;
begin
  frmPrixDet := TfrmPrixDet.Create (Self);
  frmPrixDet.Test;
end;


procedure TMainForm.actRepDvigDenSredstvExecute(Sender: TObject);
begin
  ShowReportForm(TfrmRepDvigDenSredstv);
end;

procedure TMainForm.TestRepDvigDenSredstv;
var
  RepDvigDenSredstv :TfrmRepDvigDenSredstv;
begin
  RepDvigDenSredstv := TfrmRepDvigDenSredstv.Create(Application);
  try
    RepDvigDenSredstv.DefaultStartup;
    if not RepDvigDenSredstv.DefaultOpen then begin
      AssertInternal('335E4B4F-2008-4E6B-8479-CB0D10D22C24');
    end;
  finally
    RepDvigDenSredstv.Free;
  end;
end;

procedure TMainForm.actRepBalansKursDiffExecute(Sender: TObject);
begin
  ShowReportForm(TfrmRepBalansKursDiff);
end;

procedure TMainForm.actNaklrfExecute(Sender: TObject);
var
  frmNaklrf : TfrmNaklrf;
begin
try
  frmNaklrf := TfrmNaklrf.Create (Application);
  with  frmNaklrf do begin
    DefaultStartup;
    actSettings.Execute;
    if not actSettings.Checked then begin
      Close;
    end;
  end;//with
except
  AssertInternal ('C19572C3-01E1-424D-AB79-F5B04795B233');
end;
end;

procedure TMainForm.actDoxodRasxodExecute(Sender: TObject);
begin
  ShowReportForm(TfrmRepDoxodRasxod);
end;


procedure TMainForm.actRepDoxodRasxodKorrExecute(Sender: TObject);
begin
  ShowReportForm(TfrmRepDoxodRasxodKorr);
end;


procedure TMainForm.actVozvratPostExecute(Sender: TObject);
var
  VozvratPost: TfrmVozvratPost;
begin
try
  VozvratPost := TfrmVozvratPost.Create(application);
    with VozvratPost do begin
    actSettings.Execute;
    if not actSettings.Checked then begin
      Close;
    end;
  end; //with
except
  AssertInternal('9D70725A-FFC3-4E3D-8D0B-25F8527282CA');
end;//try
end;

procedure TMainForm.actReysSprExecute(Sender: TObject);
var
  ReysSpr: TfrmReysSpr;
begin
try
	ReysSpr := TfrmReysSpr.Create (Application);
  ReysSpr.DefaultStartup;
  ReysSpr.DefaultOpen;
except
	AssertInternal ('47BBF594-9023-4649-86B9-9982BE63C360');
end;
end;

procedure TMainForm.actDolgnostSprExecute(Sender: TObject);
begin
try
	TfrmDolgnostSpr.Create (Application);
except
	AssertInternal ('F7CB4F30-D35A-4068-86F7-2D8E814A868E');
end;
end;

procedure TMainForm.actRepReysExecute(Sender: TObject);
begin
  ShowReportForm(TfrmRepReys);
end;

procedure TMainForm.TestRepReys;
var
  frmRepReys :TfrmRepReys;
begin
try
	frmRepReys := TfrmRepReys.Create(Application);
  with frmRepReys do begin
  	Test;
    Close;
  end;
except
	AssertInternal ('678C2466-14CE-4F63-9EFB-2364F6D913D7');
end;
end;

procedure TMainForm.actTestShortExecute(Sender: TObject);
begin
  //TestRepReys;
end;

procedure TMainForm.actRepReestrEDRPNExecute(Sender: TObject);
var
  frmRepNNaklXml: TfrmRepNNaklXml;
begin
try
	frmRepNNaklXml := TfrmRepNNaklXml.Create(Application);
  with frmRepNNaklXml do begin
  	actSettings.Execute;
    if not actSettings.Checked then begin
      Close;
    end;
  end;
except
	AssertInternal ('4CBFACD6-9CAE-460A-AC9B-0553A9278998');
end;
end;

procedure TMainForm.actRepPribylPrilogEdnalExecute(Sender: TObject);
var
  frmRepPribylPrilogEdnal: TfrmRepPribylPrilogEdnal;
begin
try
	frmRepPribylPrilogEdnal := TfrmRepPribylPrilogEdnal.Create(Application);
  with frmRepPribylPrilogEdnal do begin
  	actSettings.Execute;
    if not actSettings.Checked then begin
      Close;
    end;
  end;
except
	AssertInternal ('4F5CF63D-B83F-4A89-93C7-E782F43802BD');
end;
end;



procedure TMainForm.actEdizSprExecute(Sender: TObject);
var
  EdizSpr: TfrmEdizSpr;
begin
try
	EdizSpr := TfrmEdizSpr.Create (Application);
  EdizSpr.ShowSpr;
except
	AssertInternal ('E21E4A67-CB6F-4E92-A9D8-94AE3714004D');
end
end;

end.
