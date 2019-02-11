unit Naklru;

interface

uses
  Windows, Messages, SysUtils,
  Variants, Classes, Graphics,
  Controls, Forms,
  Dialogs,
  DB, DBTables, Grids, DBGrids,
  ActnList, StdCtrls, untSettings,
  QueryExtender, DBCtrls, untUnfDbLookupListbox,
  untListBoxPosit, ExtCtrls, FMTBcd, PropFilerEh, Menus,
  PropStorageEh, DBClient, Provider, SqlExpr, Curr2StrRU,
  frxClass, frxDBSet,
  untRound,
  untSpecif,
  SettingsPlugin, // TfmSettingsPlugin
  NaklruEdit, //TfrmNaklruEdit
  AtsAssert,
  SkladAux, //ProcessSettingsVladClientManager

  untEx,   DBGridEh,
  UnfFilter,
  frxDesgn, GridsEh, Buttons
  ;

type
  TfrmNaklru = class(TForm)
    dbgNaklrt: TDbGridEh;
    ActionList1: TActionList;
    actSettings: TAction;
    actGrid1ListShow: TAction;
    actRefresh: TAction;
    actGrid2ListShow: TAction;
    actPreview: TAction;
    actSchet: TAction;
    qeNaklot: TQueryExtender;
    actCalculateSum: TAction;
    Curr2StrUA1: TCurr2StrRU;
    MainMenu1: TMainMenu;
    sdsNaklo: TSQLDataSet;
    sdsNakloID: TStringField;
    sdsNakloNALOG_NDS: TFMTBCDField;
    sdsNakloDAT: TSQLTimeStampField;
    sdsNakloPOSTED: TSmallintField;
    sdsNakloID_CURRENCY: TSmallintField;
    sdsNakloID_IZG: TIntegerField;
    sdsNakloID_ZAK: TIntegerField;
    sdsNakloID_MANAGER: TIntegerField;
    sdsNakloKURS: TFloatField;
    sdsNakloNDS: TFMTBCDField;
    sdsNakloDELMARKED: TSmallintField;
    sdsNakloBLOCKED: TSmallintField;
    dspNaklo: TDataSetProvider;
    cdsNaklo: TClientDataSet;
    cdsNakloID_IZG: TIntegerField;
    cdsNakloID_ZAK: TIntegerField;
    cdsNakloID_MANAGER: TIntegerField;
    cdsNakloID_CURRENCY: TSmallintField;
    cdsNakloNALOG_NDS: TFMTBCDField;
    cdsNakloNDS: TFMTBCDField;
    cdsNakloPOSTED: TSmallintField;
    cdsNakloIZG: TStringField;
    cdsNakloZAK: TStringField;
    cdsNakloMANAGER: TStringField;
    cdsNakloDAT: TSQLTimeStampField;
    cdsNakloKURS: TFloatField;
    cdsNakloDELMARKED: TSmallintField;
    cdsNakloID: TStringField;
    cdsNakloBLOCKED: TSmallintField;
    dsNaklo: TDataSource;
    qeNaklo: TQueryExtender;
    sdsNakloID_NAKL: TIntegerField;
    cdsNakloID_NAKL: TIntegerField;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    sdsDelmark: TSQLDataSet;
    actShowDeleted: TAction;
    cdsNakloIZGFULLNAME: TStringField;
    cdsNakloZAKFULLNAME: TStringField;
    sdsNaklot: TSQLDataSet;
    sdsNaklotID_NAKL: TIntegerField;
    sdsNaklotID_NAKLD: TIntegerField;
    sdsNaklotID_POS: TIntegerField;
    sdsNaklotKODCN: TSmallintField;
    sdsNaklotID_TOVAR: TIntegerField;
    sdsNaklotSKIDKA: TFMTBCDField;
    sdsNaklotCENA: TFMTBCDField;
    sdsNaklotKOLOTP: TFMTBCDField;
    dspNaklot: TDataSetProvider;
    cdsNaklot: TClientDataSet;
    cdsNaklotID_POS: TIntegerField;
    cdsNaklotTOVAR: TStringField;
    cdsNaklotSKIDKA: TFMTBCDField;
    cdsNaklotCENA: TFMTBCDField;
    cdsNaklotCENANDS: TFloatField;
    cdsNaklotKOLOTP: TFMTBCDField;
    cdsNaklotSUMA: TFloatField;
    cdsNaklotSUMANDS: TFloatField;
    cdsNaklotKODCN: TSmallintField;
    cdsNaklotID_NAKL: TIntegerField;
    cdsNaklotID_NAKLD: TIntegerField;
    cdsNaklotID_TOVAR: TIntegerField;
    cdsNaklotEDIZ: TStringField;
    cdsNaklotTARA: TIntegerField;
    dsNaklot: TDataSource;
    frdbNaklot: TfrxDBDataset;
    dsTemp: TDataSource;
    actPrint: TAction;
    actUndeleteNakl: TAction;
    sdsOrder: TSQLDataSet;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    SmallintField1: TSmallintField;
    IntegerField4: TIntegerField;
    FMTBCDField1: TFMTBCDField;
    FMTBCDField2: TFMTBCDField;
    FMTBCDField3: TFMTBCDField;
    cdsNaklotFULLNAME: TStringField;
    sdsNaklrPost: TSQLDataSet;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    SmallintField2: TSmallintField;
    IntegerField8: TIntegerField;
    FMTBCDField4: TFMTBCDField;
    FMTBCDField5: TFMTBCDField;
    FMTBCDField6: TFMTBCDField;
    actNaklrPost: TAction;
    ppmNaklr: TPopupMenu;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    actDebug: TAction;
    actShowNaklo: TAction;
    actDesigner: TAction;
    frxDesigner1: TfrxDesigner;
    frdbNaklo: TfrxDBDataset;
    UnfFilter1: TUnfFilter;
    UnfFilter2: TUnfFilter;
    sdsMakeVozvrat: TSQLDataSet;
    actPost: TAction;
    sdsNaklrUnpost: TSQLDataSet;
    IntegerField9: TIntegerField;
    IntegerField10: TIntegerField;
    IntegerField11: TIntegerField;
    SmallintField3: TSmallintField;
    IntegerField12: TIntegerField;
    FMTBCDField7: TFMTBCDField;
    FMTBCDField8: TFMTBCDField;
    FMTBCDField9: TFMTBCDField;
    actUnpost: TAction;
    actDefaultopen: TAction;
    N19: TMenuItem;
    Splitter1: TSplitter;
    Panel1: TPanel;
    dbgNaklr: TDBGridEh;
    Button3: TButton;
    actRecountNakl: TAction;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ppmNaklrt: TPopupMenu;
    actColumnSetValue: TAction;
    N20: TMenuItem;
    sdsNakloID_STATYA: TIntegerField;
    sdsNakloID_PROJECT: TIntegerField;
    sdsNakloID_XOZ_OPER: TIntegerField;
    cdsNakloID_STATYA: TIntegerField;
    cdsNakloID_PROJECT: TIntegerField;
    cdsNakloID_XOZ_OPER: TIntegerField;
    Button2: TButton;
    Button1: TButton;
    cdsNakloPROJECT: TStringField;
    cdsNakloSTATYAR: TStringField;
    sdsXozoper: TSQLDataSet;
    dspXozOper: TDataSetProvider;
    cdsXozOper: TClientDataSet;
    cdsXozOperOID: TIntegerField;
    cdsXozOperNAME: TStringField;
    cdsXozOperFULLNAME: TStringField;
    dsXozOper: TDataSource;
    cdsNakloXOZOPER: TStringField;
    sdsNakloPARENT_ID_NAKL: TIntegerField;
    sdsNakloPARENT_ID: TStringField;
    cdsNakloPARENT_ID_NAKL: TIntegerField;
    cdsNakloPARENT_ID: TStringField;
    ulbListBox2: TUnfDbLookupListbox;
    actPostIf2: TAction;
    cdsNakloCURRENCY: TStringField;
    actCreateNaklru: TAction;
    N6: TMenuItem;
    N10: TMenuItem;
    sdsNakloCOMMENT: TStringField;
    cdsNakloCOMMENT: TStringField;
    sdsNakloID_DOGOVOR: TIntegerField;
    cdsNakloID_DOGOVOR: TIntegerField;
    sdsDogovor: TSQLDataSet;
    dspDogovor: TDataSetProvider;
    cdsDogovor: TClientDataSet;
    dsDogovor: TDataSource;
    cdsDogovorID_DOGOVOR: TIntegerField;
    cdsDogovorID_KLIENT: TIntegerField;
    cdsDogovorDAT: TSQLTimeStampField;
    cdsDogovorID: TStringField;
    cdsDogovorIS_DEFAULT: TIntegerField;
    cdsDogovorDELMARKED: TSmallintField;
    cdsDogovorPREDMET: TStringField;
    cdsDogovorADRES: TStringField;
    cdsDogovorID_CONTACT: TIntegerField;
    cdsDogovorNAME: TStringField;
    cdsDogovorID_DOLGNOST: TIntegerField;
    cdsNakloDOGOVOR: TStringField;
    frdbDogovor: TfrxDBDataset;
    cdsDogovorDOLGNOST: TStringField;
    qeDogovor: TQueryExtender;
    actMakeNnakl: TAction;
    N11: TMenuItem;
    frNaklr2: TfrxReport;
    actPreviewActElvo: TAction;
    actPrintActElvo: TAction;
    N18: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    actPreviewNaklruSub: TAction;
    actPrintNaklruSub: TAction;
    N25: TMenuItem;
    N26: TMenuItem;
    actPrintOtoplenie: TAction;
    actPreviewOtoplenie: TAction;
    N27: TMenuItem;
    N28: TMenuItem;
    frNaklr: TfrxReport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actSettingsExecute(Sender: TObject);
    procedure dbgNaklrDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dbgNaklrtDblClick(Sender: TObject);
    procedure qurNaklrtBeforeScroll(DataSet: TDataSet);
    procedure actPreviewExecute(Sender: TObject);
    procedure actSchetExecute(Sender: TObject);
    procedure qurNaklrBeforeDelete(DataSet: TDataSet);
    procedure actCalculateSumExecute(Sender: TObject);
    procedure frNaklrGetValue(const ParName: String;
      var ParValue: Variant);
    procedure qurNaklrtAfterDelete(DataSet: TDataSet);
    procedure DBGridEh1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cdsNakloAfterInsert(DataSet: TDataSet);
    procedure dspNakloBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure cdsNakloBeforePost(DataSet: TDataSet);
    procedure actShowDeletedExecute(Sender: TObject);
    procedure cdsNaklotAfterOpen(DataSet: TDataSet);
    procedure cdsNaklotAfterInsert(DataSet: TDataSet);
    procedure cdsNaklotBeforeInsert(DataSet: TDataSet);
    procedure cdsNaklotBeforePost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure cdsNaklotCENANDSChange(Sender: TField);
    procedure cdsNaklotKOLOTPChange(Sender: TField);
    procedure cdsNaklotSUMAChange(Sender: TField);
    procedure cdsNaklotSUMANDSChange(Sender: TField);
    procedure cdsNaklotCENAChange(Sender: TField);
    procedure cdsNaklotSKIDKAChange(Sender: TField);
    procedure FormHide(Sender: TObject);
    procedure cdsNaklotAfterRefresh(DataSet: TDataSet);
    procedure cdsNaklotAfterDelete(DataSet: TDataSet);
    procedure cdsNakloBeforeScroll(DataSet: TDataSet);
    procedure cdsNaklotCalcFields(DataSet: TDataSet);
    procedure cdsNaklotBeforeEdit(DataSet: TDataSet);
    procedure actPrintExecute(Sender: TObject);
    procedure cdsNaklotBeforeScroll(DataSet: TDataSet);
    procedure actUndeleteNaklExecute(Sender: TObject);
    procedure cdsNakloReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsNaklotReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure actNaklrPostExecute(Sender: TObject);
    procedure actDebugExecute(Sender: TObject);
    procedure actShowNakloExecute(Sender: TObject);
    procedure actDesignerExecute(Sender: TObject);
    procedure actPostExecute(Sender: TObject);virtual; 
    procedure actUnpostExecute(Sender: TObject); virtual;
    procedure actDefaultopenExecute(Sender: TObject);
    procedure actGrid1ListShowExecute(Sender: TObject);
    procedure actRecountNaklExecute(Sender: TObject);
    procedure actGrid2ListShowExecute(Sender: TObject);
    procedure actColumnSetValueExecute(Sender: TObject);
    procedure dbgNaklrKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cdsNaklotID_TOVARChange(Sender: TField);
    procedure dspNakloGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure ulbListBox2DblClick(Sender: TObject);
    procedure ulbListBox2Exit(Sender: TObject);
    procedure ulbListBox2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actPostIf2Execute(Sender: TObject);
    procedure dbgNaklrtKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actCreateNaklruExecute(Sender: TObject);virtual;
    procedure actMakeNnaklExecute(Sender: TObject);
    procedure actPreviewActElvoExecute(Sender: TObject);
    procedure actPrintActElvoExecute(Sender: TObject);
    procedure actPreviewNaklruSubExecute(Sender: TObject);
    procedure actPrintNaklruSubExecute(Sender: TObject);
    procedure actPreviewOtoplenieExecute(Sender: TObject);
    procedure actPrintOtoplenieExecute(Sender: TObject);

  private
    curSum : currency;
    intNpp : integer; //номер позиции по порядку
    FidCurrencyUAH : integer;
    FIdNakl : integer;// Номер следующей накладной, до её попадания в базу
    Semaphore : boolean; //Для разрешения/запрещения редактирования цен
    
    SettingsManager : TfmSettingsPlugin;
    SettingsVlad : TfmSettingsPlugin ;
    SettingsClient : TfmSettingsPlugin;
    Rect2 : TRect;
    procedure MakeNakl (intSchet : integer);
    procedure Order;
    procedure FillSettings;
    function FillSlHead(DataSet:TDataSet):TStringList;
    function CreateDocFromMemNaklru(slHead:TStringList;bOpenInNewWindow:boolean=true):integer;
    procedure OpenSprDogovor();
    procedure OpenOneDogovor(id_dogovor :integer);
  protected
    frmEdit : TfrmNaklruEdit;
    procedure ProcessShowDeleted;  
    procedure ProcessSettings(ProcessOnlySecurityMeasures:boolean=false);virtual;
    function  GetIdXozOperBezKom: integer;virtual;
    function GetIdAllProject: integer;
    function GetIdAllStatya: integer;virtual;
    procedure CreateEditForm;virtual;
    procedure TestMakeNaklru;
    procedure TestInsert;
    function CreateNewInputForm: TfrmNaklru; virtual;
    procedure UpdateCaption; virtual;
  public
    { Public declarations }
    setT : TfrmSettings;
    function DefaultOpen:boolean;
    procedure DefaultStartup;
    function ShowDetail1:integer;
    function PrepareReport(sReportName:string):boolean;
    procedure Test; virtual;
    //Создать документ на основании полученных параметров
    function CreateDocFromMem(slHead:TStringList):integer;
    procedure CopyDetailFromDataset(DataSet:TDataSet;FieldList :string);
    //Открывает документ по номеру и номеру позиции
    procedure OpenDocument(iNakl: integer; iNaklDet: integer);
  end;
var
  frmNaklru: TfrmNaklru;

implementation

uses
  untNaklrList, //frmNaklrList
  untNaklo,  //frmNaklo
  untRealPrice,
  DateUtils, //Today
  DesignReport, //ProcessReportDesigner
  NNakl //TfrmNNakl
  ;

{$R *.dfm}

procedure TfrmNaklru.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ApplyOrCancel(dsNaklo.DataSet) then begin
    ApplyOrCancel(dsNaklot.DataSet);
  end;
  Action := caFree;
end;

procedure TfrmNaklru.actSettingsExecute(Sender: TObject);
begin
  actSettings.checked := setT.ProcessSettingsChange2(DefaultOpen);
end;

procedure TfrmNaklru.dbgNaklrDblClick(Sender: TObject);
begin
  actGrid1ListShow.Execute;
end;

procedure TfrmNaklru.FormCreate(Sender: TObject);

begin
  qeNaklo.DefSql := sdsNaklo.CommandText;
  qeNaklot.DefSql := sdsNaklot.CommandText;
  FIdNakl := -1;
  MonthToStrInitUa;
  FillSettings;

  ProcessSettings(true);
  //Конец инициализации настроек
  qeNaklot.SetSQL('order by','id_pos',0);
  dmdEx.OpenQuery (dmdEx.cdsTovarAllND);
  dmdEx.OpenQuery (dmdEx.cdsStatyaDR);
  dmdEx.OpenQuery (dmdEx.cdsProject);
  CreateEditForm;
  frmEdit.dsNakloEdit.DataSet := cdsNaklo;
  ProcessReportDesigner(ActionList1,MainMenu1,frNaklr);
  ShowCopyForRoleOrUser(dbgNaklr,'BUXG','SYSDBA');
end;

procedure TfrmNaklru.CreateEditForm;
begin
  frmEdit := TfrmNaklruEdit.Create(self);
end;

procedure TfrmNaklru.actRefreshExecute(Sender: TObject);
begin
  dmdEx.startWaiting;
	ApplyOrCancel(dsNaklot.Dataset);
	ApplyOrCancel(dsNaklo.DataSet);
  qeNaklo.Refresh;
  dmdEx.StopWaiting;
end;

procedure TfrmNaklru.FormDestroy(Sender: TObject);
begin
  dmdEx.CloseQuery(dmdEx.cdsClient,false);
  dmdEx.CloseQuery (dmdEx.cdsVlad,false);
  dmdEx.CloseQuery (dmdEx.cdsManager,false);
  dmdEx.CloseQuery (dmdEx.cdsAllClient,false);
  dmdEx.CloseQuery (dmdEx.cdsStatyaDR,false);
  dmdEx.CloseQuery (dmdEx.cdsProject,false);
  setT.Free;
end;

procedure TfrmNaklru.dbgNaklrtDblClick(Sender: TObject);
begin
  actGrid2listshow.Execute;
end;


procedure TfrmNaklru.qurNaklrtBeforeScroll(DataSet: TDataSet);
begin
	ApplyOrCancel(DataSet);
end;

//////////////////////////////////////////////
//  Процедура упорядочивания
///
procedure TfrmNaklru.Order;
begin
  sdsOrder.Params.ParamByName('id_nakl').asInteger :=
    dsNaklo.Dataset.FieldByName('id_nakl').asInteger;
  dmdEx.ExecSQL(sdsOrder);  
  qeNaklot.Refresh;
end;



procedure TfrmNaklru.actSchetExecute(Sender: TObject);
var
  frmSchetList : TfrmNaklrList;
  intTemp : integer;
begin
  frmSchetList := TfrmNaklrList.Create(self);
  frmSchetList.ShowSchet;
  frmSchetList.DefaultStartup;
  intTemp := frmSchetList.GetSchet;
  frmSchetList.Free;
  if (intTemp <>0) then begin
    MakeNakl(intTemp);
  end; //if
end;

///////////////////////////////////////////////////
///  create nakl from schet. intSchet = schet.schet
///
procedure TfrmNaklru.MakeNakl(intSchet: integer);
var
  dtNaklr : TDataSet;
  dtNaklrt : TDataSet;
  dtTemp : TDataSet;
begin
try
  try
    dtTemp := dmdEx.cdsTemp;
    dtNaklrt := dsNaklot.DataSet;
    dtNaklr := dsNaklo.DataSet;

    dtNaklr.Open;
    dtNaklrt.Open;
    dtNaklr.Filtered := false;
    dtNaklrt.Filtered := false;
    dtNaklr.Tag:=1;
    dtNaklr.Append;

    dtTemp.Close;
    TClientDataSet(dtTemp).CommandText := 'select s.dat,'+
      's.id_izg,s.id_zak,s.id_manager, '+
      's.kurs,s.nds '+
      'from schet s where s.schet ='+ inttostr (intSchet);
    dtTemp.Open;

    dtNaklr.FieldByName('ID_IZG').asInteger :=
      dtTemp.FieldByName ('ID_IZG').asInteger;

    dtNaklr.FieldByName('ID_ZAK').asInteger :=
      dtTemp.FieldByName ('ID_ZAK').asInteger;

    dtNaklr.FieldByName('id_manager').asVariant :=
      dtTemp.FieldByName ('id_manager').asInteger;;
    dtNaklr.FieldByName('kurs').AsCurrency :=
      dtTemp.FieldByName('kurs').AsCurrency;
    dtNaklr.FieldByName('nds').AsFloat :=
      dtTemp.FieldByName('nds').AsFloat;

    dtTemp.Close;
    dsNaklo.DataSet.tag:=0;

    TClientDataSet(dtTemp).CommandText := 'select npp,id_tovar,kolotp,'
      +' skidka,Round(cena,2) as cena'
      +' from schett where schet = '
      + inttostr (intSchet)+ ' order by npp';
    dtTemp.Open;
    dtNaklrt.Tag := 1;
    while (not dtTemp.eof ) do begin
      dtNaklrt.Append;
      Semaphore := true;
      dtNaklrt.FieldByName('id_pos').AsInteger:=
        dtTemp.FieldByName('npp').AsInteger;
      dtNaklrt.FieldByName('id_nakl').AsInteger:=
        dtNaklr.FieldByName('id_nakl').AsInteger;
      dtNaklrt.FieldByName('id_tovar').AsInteger:=
        dtTemp.FieldByName('id_tovar').AsInteger;
      dtNaklrt.FieldByName('kolotp').AsFloat:=
        dtTemp.FieldByName('kolotp').AsFloat;
      dtNaklrt.FieldByName('skidka').AsVariant:=
        dtTemp.FieldByName('skidka').AsVariant;
      dtNaklrt.FieldByName('cena').AsFloat:=
        dtTemp.FieldByName('cena').asFloat;
      Semaphore := false;
      dtNaklrt.Post;
      dtTemp.Next;
    end;
    dtNaklrt.Tag:=0;
    dtTemp.Close;
    try
      PostAndApply(dtNaklr);
      PostAndApply(dtNaklrt);
    except
      AssertInternal('BBA7888F-20B3-468C-833B-51E05DFE8AD5');
    end;
  finally
    dsNaklo.DataSet.tag:=0;
  end
except
	AssertInternal('AC8C891D-5FEA-4F87-9AAA-E44FF66268B6');
end;
end;

procedure TfrmNaklru.qurNaklrBeforeDelete(DataSet: TDataSet);
begin
  dsNaklot.DataSet.first;
  while (not dsNaklot.DataSet.Eof) do begin
    dsNaklot.DataSet.Delete;
  end;
end;

procedure TfrmNaklru.actCalculateSumExecute(Sender: TObject);
begin
  SumRecount(dsNaklo.DataSet,cdsNaklot);
  PostAndApply(dsNaklot.Dataset);
  PostAndApply(dsNaklo.Dataset);
  Order;
end;

procedure TfrmNaklru.frNaklrGetValue(const ParName: String;
  var ParValue: Variant);
begin
  if AnsiUpperCase(ParName)='NDSTEXT' then begin
    Curr2StrUA1.Active := false;
    Curr2StrUA1.Summa := dsNaklo.DataSet.FieldByName('nds').AsCurrency;
    Curr2StrUA1.Active := true;
    ParValue := Curr2StrUA1.Value;
  end;
  if AnsiUpperCase(ParName)='NDSONLYTEXT' then begin
    Curr2StrUA1.Active := false;
    Curr2StrUA1.Summa := CurSum*dsNaklo.DataSet.FieldByName('nalog_nds').AsCurrency;
    Curr2StrUA1.Active := true;
    ParValue := Curr2StrUA1.Value;
  end;
end;

procedure TfrmNaklru.qurNaklrtAfterDelete(DataSet: TDataSet);
begin
	ApplyOrCancel(DataSet);
end;

procedure TfrmNaklru.DBGridEh1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_insert : begin
      cdsNaklo.Insert;
    end;
    vk_f8 : begin
      if (MessageDlg('Вы хотите удалить запись?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      begin
        cdsNaklo.Delete;
        ApplyOrCancel(cdsNaklo);
      end;
    end;  //vk_f8
  end;//case
end;

function TfrmNaklru.DefaultOpen:boolean;
begin
  ProcessSettings;
  Result:=DefaultOpenInputForm(qeNaklo);
end;

procedure TfrmNaklru.DefaultStartup;
begin
  SettingsManager.SetKeyValue(dmdEx.GetIdManager);
  ProcessSettings;
end;

procedure TfrmNaklru.ProcessSettings(ProcessOnlySecurityMeasures:boolean=false);
begin
try
  ProcessSettingsVladClientManager(qeNaklo,setT,ProcessOnlySecurityMeasures);
  ProcessShowDeleted;
  if not ProcessOnlySecurityMeasures then begin
    UpdateCaption;
  end;
except
  AssertInternal('5CE18C1E-A0A0-41E3-85DB-2AFC8794FC92');
end;
end;

procedure TfrmNaklru.cdsNakloAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('id_nakl').AsString :=
    inttostr(dmdEx.GetGenValue('naklo_gen'));
  DataSet.FieldByName('nalog_nds').AsFloat :=
    dmdEx.GetNds ( Date );
  DataSet.FieldByName('dat').AsDateTime := Date; //default date. time=0
  DataSet.FieldByName('id_nakl').AsInteger :=
    dmdEx.GetGenValue('naklo_gen');
  DataSet.FieldByName('nalog_nds').AsFloat := dmdEx.GetNds(Date);
  DataSet.FieldByName('id').AsString :=
    inttostr(dmdEx.GetGenValue('naklr_gen_id'));
  DataSet.FieldByName('kurs').asFloat := 1.0000;
  DataSet.FieldByName('posted').asInteger := 0;
  DataSet.FieldByName('id_currency').asInteger := FidCurrencyUAH;
  DataSet.FieldByName('ID_PROJECT').asInteger := GetIdAllProject;
  DataSet.FieldByName('ID_STATYA').asInteger := GetIdAllStatya;

  DataSet.FieldByName('ID_XOZ_OPER').asInteger := GetIdXozOperBezKom;
  SetManager(TIntegerField(DataSet.FieldByName('id_manager')),SettingsManager);
  ShowDetail1;
end;


procedure TfrmNaklru.dspNakloBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
var
  IdNakl : integer;
begin
  { DONE : Delmark }
  if (UpdateKind = ukDelete) and (SourceDS = sdsNaklo) then
  begin
    Applied:=false;
    sdsDelmark.ParamByName('oid').AsInteger:=
      DeltaDS.fieldByName('id_nakl').asInteger;
		dmdEx.ExecSQL(sdsDelmark,false);
    Applied:=true;
  end;

  if (UpdateKind = ukInsert) and (SourceDS = sdsNaklo) and
     (DeltaDS.FieldByName('id_nakl').NewValue < 0) then
  begin
    IdNakl := dmdEx.GetGenValue('naklo_gen');
    DeltaDS.FieldByName('id_nakl').NewValue := IdNakl;
  end;
end;

procedure TfrmNaklru.cdsNakloBeforePost(DataSet: TDataSet);
begin
	if DataSet.FieldByName('dat').IsNull then begin
		showmessage ('Заполните поле ''Дата''');
		abort;
	end;
	if DataSet.FieldByName('id_izg').IsNull then begin
		showmessage ('Заполните поле ''Поставщик''');
		abort;
	end;
	if DataSet.FieldByName('id_zak').IsNull then begin
		showmessage ('Заполните поле ''Получатель''');
		abort;
	end;
	if DataSet.FieldByName('id_manager').IsNull then begin
		showmessage ('Заполните поле ''Менеджер''');
		abort;
	end;
	if DataSet.FieldByName('currency').IsNull then begin
		showmessage ('Заполните поле ''Валюта''');
		abort;
	end;
	if DataSet.FieldByName('kurs').IsNull then begin
		showmessage ('Заполните поле ''Курс''');
		abort;
	end;
	if DataSet.FieldByName('statyar').IsNull then begin
		showmessage ('Заполните поле ''Статья''');
		abort;
	end;
	if DataSet.FieldByName('project').IsNull then begin
		showmessage ('Заполните поле ''Проект''');
		abort;
	end;
	if DataSet.FieldByName('xozoper').IsNull then begin
		showmessage ('Заполните поле ''Хозоперация''');
		abort;
	end;

end;

procedure TfrmNaklru.actShowDeletedExecute(Sender: TObject);
begin
  dmdEx.StartWaiting;
	actShowDeleted.Checked := not actShowDeleted.Checked;
  if actShowDeleted.Checked then begin
    actUndeleteNakl.Visible := true;
  end else begin
    actUndeleteNakl.Visible := false;
  end;
  ProcessShowDeleted;
  cdsNaklo.Close;
  cdsNaklo.Open;
  dmdEx.StopWaiting;
end;

procedure TfrmNaklru.ProcessShowDeleted;
begin
  if actShowDeleted.Checked then begin
		qeNaklo.SetSQL ('where','delmarked=1',5);
  end
  else begin
    qeNaklo.SetSQL ('where','delmarked=0',5);
  end;//checked
  qeNaklo.prepare;
end;

procedure TfrmNaklru.cdsNaklotAfterOpen(DataSet: TDataSet);
begin
  with  cdsNaklot do begin
    DisableControls;
    First;
    while not Eof do begin
      Edit;
      if not Semaphore then begin
        Semaphore := true;
        FromCenaRecount(1,dsNaklo.DataSet,dsNaklot.DataSet);
        Semaphore := false;
      end;
      Next;
    end;
    First;
    EnableControls;
  end;
end;

procedure TfrmNaklru.cdsNaklotAfterInsert(DataSet: TDataSet);
begin
  if cdsNaklo.FieldByName('id_nakl').AsInteger=0 then begin
    if cdsNaklo.Eof and cdsNaklo.Bof then begin
      messagedlg('Не выбран документ',mtWarning,[mbOK],0);
      abort;
    end;
  end;
  DataSet.FieldByName('id_nakld').asInteger :=
    dmdEx.GetGenValue('naklot_gen');
  DataSet.FieldByName('id_nakl').asInteger :=
    dsNaklo.DataSet.FieldByName('id_nakl').asInteger;
  intNpp := intNpp +1;
  DataSet.FieldByName('id_pos').asInteger := intNpp;
end;

procedure ProcessCreateNaklru (dbgNaklot: TDBGridEh;param:variant;Object1:Pointer=nil);
var
  slHead : TStringList;
  Form : TfrmNaklru;
begin
try
  Form := TfrmNaklru(Object1);
  Form.actCreateNaklru.tag := 0;
  slHead := Form.FillSlHead(Form.dsNaklo.DataSet);
  if not Assigned(slHead) then exit;
  Form.actCreateNaklru.Tag := Form.CreateDocFromMemNaklru(slHead,false);
  slHead.Free;
except
  AssertInternal('0FB2714A-0D16-4AAC-93C5-AFC0567834D3');
end;
end;

procedure TfrmNaklru.cdsNaklotBeforeInsert(DataSet: TDataSet);
begin
  if (dsNaklo.DataSet.Tag=0) then begin
    if (PostAndApply(dsNaklo.DataSet)<>0) then begin
      abort;
    end;
  end;
  //ищем номер последней позиции
  DataSet.Last;
  try
    intNpp:=DataSet.fieldbyname('id_pos').asInteger;
  except
    intNpp:=0;
  end;
end;

procedure TfrmNaklru.cdsNaklotBeforePost(DataSet: TDataSet);
begin
	if DataSet.FieldByName('id_tovar').IsNull then begin
		showmessage ('Заполните поле ''Товар''');
		abort;
	end;
end;

procedure TfrmNaklru.FormShow(Sender: TObject);
begin
  Semaphore := false;
end;

procedure TfrmNaklru.cdsNaklotCENANDSChange(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    FromCenaRecount(2,dsNaklo.DataSet,dsNaklot.Dataset);
    Semaphore := false;
  end;
end;

procedure TfrmNaklru.cdsNaklotKOLOTPChange(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    FromCenaRecount(1,dsNaklo.DataSet,dsNaklot.Dataset);
    Semaphore := false;
  end;
end;

procedure TfrmNaklru.cdsNaklotSUMAChange(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    FromCenaRecount(3,dsNaklo.DataSet,dsNaklot.Dataset);
    Semaphore := false;
  end;
end;

procedure TfrmNaklru.cdsNaklotSUMANDSChange(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    FromCenaRecount(4,dsNaklo.DataSet,dsNaklot.DataSet);
    Semaphore := false;
  end;
end;

procedure TfrmNaklru.cdsNaklotCENAChange(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    FromCenaRecount(6,dsNaklo.DataSet,dsNaklot.DataSet);
    Semaphore := false;
  end;
end;

procedure TfrmNaklru.cdsNaklotSKIDKAChange(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    FromCenaRecount(5,dsNaklo.DataSet,dsNaklot.DataSet);
    Semaphore := false;
  end;
end;

procedure TfrmNaklru.FormHide(Sender: TObject);
begin
  Semaphore := false;
end;



procedure TfrmNaklru.cdsNaklotAfterRefresh(DataSet: TDataSet);
begin
  with  cdsNaklot do begin
    DisableControls;
    First;
    while not Eof do begin
      Edit;
      if not Semaphore then begin
        Semaphore := true;
        FromCenaRecount(1,dsNaklo.DataSet,dsNaklot.DataSet);
        Semaphore := false;
      end;
      Next;
    end;
    First;
    EnableControls;
  end;
end;

procedure TfrmNaklru.cdsNaklotAfterDelete(DataSet: TDataSet);
begin
  ApplyOrCancel(DataSet);
  //По просебе Тани из ТПП убрал, чтобы позиции
  //удалялись быстрее 
  //  SumRecount(dsNaklr.Dataset,dsNaklrt.Dataset);
end;

procedure TfrmNaklru.cdsNakloBeforeScroll(DataSet: TDataSet);
begin
  //ApplyOrCancel(DataSet);
end;

procedure TfrmNaklru.cdsNaklotCalcFields(DataSet: TDataSet);
begin
  if not Semaphore and (DataSet.state =dsInternalCalc) then begin
    Semaphore := true;
    FromCenaRecount(1,dsNaklo.DataSet,dsNaklot.DataSet);
    Semaphore := false;
  end;
end;

procedure TfrmNaklru.cdsNaklotBeforeEdit(DataSet: TDataSet);
begin
	if PostAndApply(dsNaklo.DataSet)<>0 then begin
    Abort;
	end;
end;


procedure TfrmNaklru.actPreviewExecute(Sender: TObject);
begin
  if cdsNaklo.FieldByName('id_dogovor').IsNull then begin
    messagedlg('Не выбран договор',mtWarning,[mbOK],0);
    exit;
  end;
try
  dsNaklot.dataset.DisableControls;
  PrepareReport('Naklru.fr3');
  frNaklr.ShowReport;
//  Curr2StrUA1.Active := false;
finally
  dsNaklot.dataset.EnableControls;
end;
end;

function TfrmNaklru.PrepareReport(sReportName:string):boolean;
begin
  Result := true;
  if cdsNaklo.FieldByName('id_dogovor').IsNull then begin
    messagedlg('Не выбран договор',mtWarning,[mbOK],0);
    result := false;
    exit;
  end;
  curSum := SumRecount(dsNaklo.Dataset,dsNaklot.Dataset);
  PostAndApply(dsNaklot.Dataset);
  PostAndApply(dsNaklo.Dataset);
  Order;
  MonthToStrInitUa;
  OpenOneDogovor(cdsNaklo.FieldByName('id_dogovor').AsInteger);
  Curr2StrUA1.Active := false;
  Curr2StrUA1.Summa := dsNaklo.DataSet.FieldByName('nds').AsCurrency;
  Curr2StrUA1.Active := true;
  dmdEx.GetReport(sReportName,frNaklr);
  frNaklr.PrepareReport;
end;

procedure PrintUsl (dbgNaklot: TDBGridEh;param:variant;Object1:Pointer=nil );
var
  frmNaklru : TfrmNaklru;
  bReadyToPrint : boolean;
begin
  frmNaklru := TfrmNaklru(Object1);
  bReadyToPrint := frmNaklru.PrepareReport('Naklru.fr3');
  if bReadyToPrint then begin
    frmNaklru.frNaklr.PrintOptions.ShowDialog :=false;
    frmNaklru.frNaklr.Print;
  end;
end;

procedure PrintActElvo (dbgNaklot: TDBGridEh;param:variant;Object1:Pointer=nil );
var
  frmNaklru : TfrmNaklru;
  bReadyToPrint : boolean;
begin
  frmNaklru := TfrmNaklru(Object1);
  bReadyToPrint := frmNaklru.PrepareReport('NaklruActElvo.fr3');
  if bReadyToPrint then begin
    frmNaklru.frNaklr.PrintOptions.ShowDialog :=false;
    frmNaklru.frNaklr.Print;
  end;
end;

procedure PrintNaklruSub (dbgNaklot: TDBGridEh;param:variant;Object1:Pointer=nil );
var
  frmNaklru : TfrmNaklru;
  bReadyToPrint : boolean;
begin
  frmNaklru := TfrmNaklru(Object1);
  bReadyToPrint := frmNaklru.PrepareReport('NaklruSub.fr3');
  if bReadyToPrint then begin
    frmNaklru.frNaklr.PrintOptions.ShowDialog :=false;
    frmNaklru.frNaklr.Print;
  end;
end;

procedure TfrmNaklru.actPrintExecute(Sender: TObject);
begin
  dmdEx.ColumnSelectAndProcess(dbgNaklr,Null,PrintUsl,self);
end;

procedure TfrmNaklru.cdsNaklotBeforeScroll(DataSet: TDataSet);
begin
  ApplyOrCancel(DataSet);
end;

procedure TfrmNaklru.actUndeleteNaklExecute(Sender: TObject);
begin
  if actShowDeleted.Checked then begin
    dmdEx.UndeleteNaklo(TintegerField(dsNaklo.DataSet.FieldByName('delmarked')),actRefresh);
  end;
end;

procedure TfrmNaklru.cdsNakloReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  showmessage(e.message);
  Action := raAbort;
end;

procedure TfrmNaklru.cdsNaklotReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  showmessage(e.message);
  Action := raAbort;
end;

procedure TfrmNaklru.actNaklrPostExecute(Sender: TObject);
begin
  dmdEx.StartWaiting;
  sdsNaklrPost.Params.ParamByName('id_nakl').asInteger :=
    dsNaklo.DataSet.FieldByName('id_nakl').asInteger;
  dmdEx.ExecSQL(sdsNaklrPost);
  dmdEx.StopWaiting;
end;

procedure TfrmNaklru.actDebugExecute(Sender: TObject);
begin
  actDebug.Checked := not actDebug.Checked;
  if actDebug.Checked then begin
    ColumnByName(dbgNaklr.Columns,'ID_NAKL').Visible := true;
    dbgNaklr.FooterRowCount := 1;
    dbgNaklr.SumList.Active := true;
  end else begin //if actDebug checked
    ColumnByName(dbgNaklr.Columns,'ID_NAKL').Visible := false;
    dbgNaklr.FooterRowCount := 0;
    dbgNaklr.SumList.Active := false;
  end;  //if actDebug checked
end;

procedure TfrmNaklru.actShowNakloExecute(Sender: TObject);
var
  iTip : integer;
begin
  if dsNaklo.DataSet.Eof and dsNaklo.DataSet.Bof then begin
     exit;
  end;
  iTip := dmdEx.GetOidObjects('РАСХОДНЫЕ НАКЛАДНЫЕ НА УСЛУГИ',-100);
  SkladAux.OpenDocument(self,dsNaklo.DataSet.FieldByName('id_nakl').asInteger,iTip,0,true);
end;

procedure TfrmNaklru.actDesignerExecute(Sender: TObject);
begin
  dmdEx.GetReport('Naklru.fr3',frNaklr);
  frNaklr.DesignReport;
end;

procedure TfrmNaklru.actPostExecute(Sender: TObject);
begin
  actCalculateSum.Execute;
  dmdEx.PostNakl(
    TIntegerField(cdsNaklo.FieldByName('posted')),
    sdsNaklrPost,
    TIntegerField(cdsNaklo.FieldByName('id_nakl')),
    not actPost.Checked);
end;

procedure TfrmNaklru.actUnpostExecute(Sender: TObject);
begin
  dmdEx.UnPostNakl(
    TIntegerField(cdsNaklo.FieldByName('posted')),
    sdsNaklrUnpost,
    TIntegerField(cdsNaklo.FieldByName('id_nakl')),
    not actUnpost.Checked);
end;

procedure TfrmNaklru.actDefaultopenExecute(Sender: TObject);
begin
  ProcessSettings;
  actDefaultopen.Checked:=DefaultOpenInputForm(qeNaklo);
end;

procedure TfrmNaklru.FillSettings;
begin
  //Инициализация настроек
  setT := TfrmSettings.Create(self);
  setT.actManagerOff.execute;

  SettingsManager := setT.CreatePlugin('TfmSettingsManager');

  setT.AddPlugin(SettingsManager);
  //менеджеры из зоны видимости
  SettingsManager.SetResultType(2);

  SettingsVlad := setT.CreatePlugin('TfmSettingsVlad');
  SettingsVlad.SetResultType(2);
  setT.AddPlugin(SettingsVlad);

  SettingsClient := setT.CreatePlugin('TfmSettingsClient');
  setT.addplugin(SettingsClient);
  FidCurrencyUAH :=dmdEx.GetIdCurrencyUAH;
end;

function TfrmNaklru.GetIdXozOperBezKom: integer;
var
  iXozOperFact : integer;
begin
  iXozOperFact:=dmdEx.GetParamCached('ХОЗЯЙСТВЕННЫЕ ОПЕРАЦИИ',
    'select oid from GET_OID_OBJECTS_PC('+quotedstr('ХОЗЯЙСТВЕННЫЕ ОПЕРАЦИИ')+',-100)',
    'oid');
  Result :=dmdEx.GetParamCached('РАСХОДНАЯ НА УСЛУГИ БЕЗ КОМИССИЙ',
    'select oid from GET_OID_OBJECTS_PC('
      +quotedstr('РАСХОДНАЯ НА УСЛУГИ БЕЗ КОМИССИЙ')
      +','+inttostr(iXozOperFact)+')',
    'oid');
end;

function TfrmNaklru.GetIdAllProject: integer;
var
  iTipProject : integer;
begin
  iTipProject:=dmdEx.GetParamCached('ТИП ПРОЕКТЫ',
    'select oid from GET_OID_OBJECTS_PC('+quotedstr('ТИП ПРОЕКТЫ')+',-100)',
    'oid');
  Result :=dmdEx.GetParamCached('ВСЕ ПРОЕКТЫ',
    'select oid from GET_OID_PREDEFINED_PC('
      +quotedstr('ВСЕ ПРОЕКТЫ')
      +','+inttostr(iTipProject)+')',
    'oid');
end;

procedure TfrmNaklru.actGrid1ListShowExecute(Sender: TObject);
begin
  if (cdsNaklo.FieldByName('ID_NAKL').AsInteger = 0) then  begin
    cdsNaklo.Insert;
  end
  else begin
    if (frmEdit.Visible = false) then begin
      cdsNaklo.Edit;
      ShowDetail1;
    end;
  end;
end;

function TfrmNaklru.ShowDetail1:integer;
begin
  OpenSprDogovor;
  Result := dmdEx.ShowDetail1(dsNaklo.DataSet,frmEdit,actRecountNakl);
end;

procedure TfrmNaklru.actRecountNaklExecute(Sender: TObject);
begin
  SumRecount(dsNaklo.DataSet,cdsNaklot);
end;

procedure TfrmNaklru.actGrid2ListShowExecute(Sender: TObject);
begin
  if (dbgNaklrt.SelectedField.FieldName ='TOVAR') then begin
		dmdEx.cdsTovarAll.Filter:='delmarked=0';
		dmdEx.cdsTovarAll.Filtered := true;
    Rect2:= LookupBoxEnterEh (ulbListBox2, dbgNaklrt, dmdEx.dsTovarAll, 70 );
	end; //tovar
end;

procedure TfrmNaklru.actColumnSetValueExecute(Sender: TObject);
begin
  if dbgNaklrt.SelectedField.FieldName='SKIDKA' then begin
    dmdEx.ColumnSet(dbgNaklrt);
    actCalculateSum.Execute;
  end else begin
    Showmessage('Заполнить значением возможно только поле "Скидка"');
  end;
end;

procedure TfrmNaklru.dbgNaklrKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return :begin
      actGrid1ListShow.Execute;
    end; //vk_return
    vk_f8: begin
      if (MessageDlg('Вы хотите удалить ВЕСЬ документ?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
        if (dsNaklo.Dataset.FieldByName('posted').asInteger=1) then begin
          showmessage('Нельзя удалить проведенный документ');
        end
        else begin //ok to delete
          if not (dsNaklo.Dataset.bof and dsNaklo.Dataset.eof) then begin
            dsNaklo.Dataset.Delete;
          end;
          ApplyOrCancel(dsNaklo.Dataset);
        end; //if posted
      end;//if messagedlg
    end; //case vk_f8

    vk_insert : begin
      cdsNaklo.Append;
    end;  //case vk_insert
  end; //case
end;


procedure TfrmNaklru.cdsNaklotID_TOVARChange(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    FromCenaRecount(5,dsNaklo.DataSet,dsNaklot.DataSet);
    Semaphore := false;
  end;
end;

procedure TfrmNaklru.dspNakloGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
  TableName:='NAKLRU_VW';
end;





procedure TfrmNaklru.ulbListBox2DblClick(Sender: TObject);
begin
  LookupBoxExitOkEh (ulbListBox2 , dbgNaklrt, Rect2);
  actPostIf2.Execute;
end;

procedure TfrmNaklru.actPostIf2Execute(Sender: TObject);
begin
  Semaphore :=true;
  FromCenaRecount(5,dsNaklo.DataSet,cdsNaklot);
  semaphore := false;
end;

procedure TfrmNaklru.ulbListBox2Exit(Sender: TObject);
begin
  LookupBoxExitCancel (ulbListBox2, dbgNaklrt, Rect2);
end;

procedure TfrmNaklru.ulbListBox2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return : begin
      LookupBoxExitOkEh (ulbListBox2 , dbgNaklrt, Rect2);
      actPostIf2.Execute;
    end;
    vk_escape : begin
      ulbListBox2.Hide;
    end;
  end;
end;

procedure TfrmNaklru.dbgNaklrtKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return : begin
      actGrid2ListShow.Execute;
    end; //vk_return
    vk_f8 : begin
      if (MessageDlg('Вы хотите удалить позицию?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
        if dsNaklot.Dataset.State = dsInsert then begin
          dsNaklot.Dataset.Cancel;
        end else begin
          dsNaklot.Dataset.CheckBrowseMode;
          dsNaklot.Dataset.Delete;
        end;
      end;
    end;
  end; //case

end;

procedure TfrmNaklru.Test;
begin
  dmdEx.GetIdCurrencyUAH;
  TestInsert;
  TestMakeNaklru;
  cdsNaklo.Delete;  
end;

procedure TfrmNaklru.OpenDocument(iNakl: integer; iNaklDet: integer);
begin
  qeNaklo.AddSQL('where','id_nakl=' + inttostr(iNakl)); //только наш документ
  actRefresh.Execute;//Открытие данных
  if iNaklDet>0 then begin
    cdsNaklot.Locate('id_nakld', iNaklDet, []);
  end;
end; 

function TfrmNaklru.GetIdAllStatya: integer;
var
  iTipProject : integer;
begin
  iTipProject:=dmdEx.GetParamCached('ТИП СТАТЬИ ДОХОДОВ И РАСХОДОВ',
    'select oid from GET_OID_OBJECTS_PC('+quotedstr('ТИП СТАТЬИ ДОХОДОВ И РАСХОДОВ')+',-100)',
    'oid');
  Result :=dmdEx.GetParamCached('ВСЕ СТАТЬИ ДОХОДОВ',
    'select oid from GET_OID_PREDEFINED_PC('
      +quotedstr('ВСЕ СТАТЬИ ДОХОДОВ')
      +','+inttostr(iTipProject)+')',
    'oid');
end;

procedure TfrmNaklru.actCreateNaklruExecute(Sender: TObject);
begin
  dmdEx.ColumnSelectAndProcess(dbgNaklr,null,ProcessCreateNaklru,self);
  actRefresh.Execute;
end;



function TfrmNaklru.FillSlHead(DataSet:TDataSet):TStringList;
var
  slHead : TStringList;
begin
  Result := nil;
  if (Dataset.bof and Dataset.eof) then begin
    exit;
  end;
  slHead := TStringList.Create;
  slHead.Add('id_izg='+DataSet.FieldByName('id_izg').asString);
  slHead.Add('id_zak='+DataSet.FieldByName('id_zak').asString);
  slHead.Add('id_xoz_oper='+DataSet.FieldByName('id_xoz_oper').asString);
  slHead.Add('id_currency='+DataSet.FieldByName('id_currency').asString);
  slHead.Add('id_statya='+DataSet.FieldByName('id_statya').asString);
  slHead.Add('id_project='+DataSet.FieldByName('id_project').asString);
  slHead.Add('parent_id_nakl='+DataSet.FieldByName('parent_id_nakl').asString);
  slHead.Add('id='+DataSet.FieldByName('id').asString);
  slHead.Add('nds='+DataSet.FieldByName('nds').asString);
  Result :=  slHead;
end;

function TfrmNaklru.CreateDocFromMemNaklru(slHead:TStringList;bOpenInNewWindow:boolean=true):integer;
var
  frmF :TfrmNaklru;
begin
  frmF := CreateNewInputForm;
  //frmF := TfrmNaklru.Create(self);
  frmF.setT.DateFrom := Today;
  frmF.setT.DateTo := Today;
  frmF.setT.GetPlugin('fmSettingsManager').SetKeyValue(dmdEx.GetIdManager);
  frmF.DefaultOpen;
  frmF.dsNaklo.DataSet.DisableControls;

  Result := frmF.CreateDocFromMem(slHead);
  frmF.CopyDetailFromDataset(dsNaklot.DataSet,'id_pos;id_tovar;kolotp;cena');
  frmF.dsNaklo.DataSet.EnableControls;
  if not bOpenInNewWindow then begin
    frmF.Free;
  end;
end;

function TfrmNaklru.CreateNewInputForm: TfrmNaklru;
begin
  Result := TfrmNaklru.Create(self);
end;

procedure TfrmNaklru.CopyDetailFromDataset(DataSet:TDataSet;FieldList :string);
begin
  CopyDatasetFields(DataSet,dsNaklot.DataSet,'','',FieldList,FieldList,3);
end;

function TfrmNaklru.CreateDocFromMem(slHead:TStringList):integer;
begin
  Result := 0;
try
  dmdEx.StartWaiting;
  //master create
  dsNaklo.DataSet.Tag := 1;
  dsNaklo.DataSet.Insert;
  dsNaklo.DataSet.FieldByName('id_izg').asInteger := strtoint(slHead.Values['id_izg']);
  dsNaklo.DataSet.FieldByName('id_zak').asInteger:= strtoint(slHead.Values['id_zak']);
  dsNaklo.DataSet.FieldByName('nds').AsFloat := strtofloat(slHead.Values['nds']);
  dsNaklo.DataSet.FieldByName('id_xoz_oper').asInteger:= strtoint(slHead.Values['id_xoz_oper']);
  dsNaklo.DataSet.FieldByName('id_currency').asInteger:= strtoint(slHead.Values['id_currency']);
  dsNaklo.DataSet.FieldByName('id_statya').asInteger:= strtoint(slHead.Values['id_statya']);
  dsNaklo.DataSet.FieldByName('id_project').asInteger:= strtoint(slHead.Values['id_project']);
  if slHead.Values['parent_id_nakl']<>'' then begin
    dsNaklo.DataSet.FieldByName('parent_id_nakl').asInteger:= strtoint(slHead.Values['parent_id_nakl']);
  end;
  dsNaklo.DataSet.Post;
  dsNaklo.DataSet.tag:=0;
  dmdEx.StopWaiting;
  ApplyOrCancel(dsNaklo.DataSet);
  Result := dsNaklo.DataSet.FieldByName('id_nakl').asInteger;
except
  AssertInternal('6212ED9B-5D97-416A-9CA9-4F996A380B0B');
end;
end;

procedure TfrmNaklru.TestMakeNaklru;
begin
  DefaultStartup;
  DefaultOpen;
  if dsNaklo.DataSet.Eof and dsNaklo.DataSet.Bof then begin
    AssertInternal('4B6EE4B6-F711-49BC-91A9-4B953393F5A8');
  end;
  actCreateNaklru.execute;
  dmdEx.DelmarkNaklo(actCreateNaklru.tag);
end;

procedure TfrmNaklru.TestInsert;
var
  i : integer;
begin
  DefaultStartup;
  //bQueryOpened :=Naklru.actDefaultOpen.Execute;
  if not DefaultOpen then begin
    AssertInternal('F3ABF02B-8261-43BD-A5A7-60255F54D7F6');
  end;
  with cdsNaklo do begin
    Tag:=1;
    try
      Insert;
      FieldByName('id_izg').asInteger :=
        dmdEx.cdsVlad.Lookup('name','нал','id');
      FieldByName('id_zak').asInteger :=
        dmdEx.cdsClient.Lookup('name','123','id');
      FieldByName('id_manager').AsInteger :=
        dmdEx.cdsManager.Lookup('name','Тест','id');
      Post;
      ApplyUpdates(0);
    finally
      Tag:=0;
    end;
  end;
  for i:= 0 to 1 do begin
    with cdsNaklot do begin
      Tag:=1;
      Insert;
      FieldByName('id_tovar').asInteger :=
        dmdEx.cdsTovarAllND.Lookup('name','222','id');
      Post;
      Tag:=0;
    end;
  end;

end;

procedure TfrmNaklru.OpenSprDogovor();
begin
  cdsDogovor.Close;
  qeDogovor.SetSQL('where','',0);
  qeDogovor.prepare;
  cdsDogovor.Params.ParamByName('id_klient').asInteger:=
    cdsNaklo.FieldByName('id_zak').AsInteger;
  dmdEx.OpenQuery(cdsDogovor);
end;

procedure TfrmNaklru.OpenOneDogovor(id_dogovor: integer);
begin
  cdsDogovor.Close;
  qeDogovor.SetSQL('where','id_dogovor='+inttostr(id_dogovor),0);
  qeDogovor.prepare;
  cdsDogovor.Params.ParamByName('id_klient').asInteger:=
    cdsNaklo.FieldByName('id_zak').AsInteger;
  dmdEx.OpenQuery(cdsDogovor);
end;

procedure TfrmNaklru.UpdateCaption;
begin
  self.Caption := UpdateCaptionVladClientManager('Расходные по аренде:',setT);
end;

procedure TfrmNaklru.actMakeNnaklExecute(Sender: TObject);
begin
  if  cdsNaklo.Eof and cdsNaklo.Bof then begin
    exit;
  end;
try
  frmNNakl := TfrmNNakl.Create (Application);
  frmNNakl.DefaultOpen;//Открытие данных
  frmNNakl.makeNakl(cdsNaklo.FieldByName('id_nakl').asInteger);
except
  AssertInternal('979554F8-3163-4DB5-B7DA-5F1CB791ADA8');
end;
end;

procedure TfrmNaklru.actPreviewActElvoExecute(Sender: TObject);
begin
  if cdsNaklo.FieldByName('id_dogovor').IsNull then begin
    messagedlg('Не выбран договор',mtWarning,[mbOK],0);
    exit;
  end;
  try
    dsNaklot.dataset.DisableControls;
    PrepareReport('NaklruActElvo.fr3');
    frNaklr.ShowReport;
  finally
    dsNaklot.dataset.EnableControls;
  end;
end;

procedure TfrmNaklru.actPrintActElvoExecute(Sender: TObject);
begin
  dmdEx.ColumnSelectAndProcess(dbgNaklr,Null,PrintActElvo,self);
end;

procedure TfrmNaklru.actPreviewNaklruSubExecute(Sender: TObject);
begin
  if cdsNaklo.FieldByName('id_dogovor').IsNull then begin
    messagedlg('Не выбран договор',mtWarning,[mbOK],0);
    exit;
  end;
  try
    dsNaklot.dataset.DisableControls;
    PrepareReport('NaklruSub.fr3');
    frNaklr.ShowReport;
  finally
    dsNaklot.dataset.EnableControls;
  end;
end;

procedure TfrmNaklru.actPrintNaklruSubExecute(Sender: TObject);
begin
  dmdEx.ColumnSelectAndProcess(dbgNaklr,Null,PrintNaklruSub,self);
end;



procedure TfrmNaklru.actPreviewOtoplenieExecute(Sender: TObject);
begin
  if cdsNaklo.FieldByName('id_dogovor').IsNull then begin
    messagedlg('Не выбран договор',mtWarning,[mbOK],0);
    exit;
  end;
  try
    dsNaklot.dataset.DisableControls;
    PrepareReport('NaklruActOtoplenie.fr3');
    frNaklr.ShowReport;
  finally
    dsNaklot.dataset.EnableControls;
  end;
end;

procedure PrintActOtoplenie (dbgNaklot: TDBGridEh;param:variant;Object1:Pointer=nil );
var
  frmNaklru : TfrmNaklru;
  bReadyToPrint : boolean;
begin
  frmNaklru := TfrmNaklru(Object1);
  bReadyToPrint := frmNaklru.PrepareReport('NaklruActOtoplenie.fr3');
  if bReadyToPrint then begin
    frmNaklru.frNaklr.PrintOptions.ShowDialog :=false;
    frmNaklru.frNaklr.Print;
  end;
end;

procedure TfrmNaklru.actPrintOtoplenieExecute(Sender: TObject);
begin
  dmdEx.ColumnSelectAndProcess(dbgNaklr,Null,PrintActOtoplenie,self);
end;



end.
