unit Naklr;

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
  NaklrEdit, //TfrmNaklr2Edit
  untEx,   DBGridEh,
  UnfFilter,
  frxDesgn, GridsEh, Buttons, Curr2StrUA
  ;

type
  TfrmNaklr = class(TForm)
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
    actShowAll: TAction;
    MainMenu1: TMainMenu;
    mnuActions: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    actCreateSpecif: TAction;
    N6: TMenuItem;
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
    sdsNakloDOV: TStringField;
    sdsNakloDDO: TSQLTimeStampField;
    sdsNakloLICO: TStringField;
    sdsNakloFR: TStringField;
    sdsNakloSCH: TIntegerField;
    cdsNakloDOV: TStringField;
    cdsNakloDDO: TSQLTimeStampField;
    cdsNakloLICO: TStringField;
    cdsNakloFR: TStringField;
    cdsNakloSCH: TIntegerField;
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
    N7: TMenuItem;
    actPrint: TAction;
    actUndeleteNakl: TAction;
    N8: TMenuItem;
    sdsOrder: TSQLDataSet;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    SmallintField1: TSmallintField;
    IntegerField4: TIntegerField;
    FMTBCDField1: TFMTBCDField;
    FMTBCDField2: TFMTBCDField;
    FMTBCDField3: TFMTBCDField;
    sdsNakloID_SKLAD: TIntegerField;
    cdsNakloID_SKLAD: TIntegerField;
    cdsNakloSKLAD: TStringField;
    cdsNaklotFULLNAME: TStringField;
    sdsNakloID_SKLAD_TO: TIntegerField;
    cdsNakloID_SKLAD_TO: TIntegerField;
    cdsNakloVID_DOSTAVKI: TStringField;
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
    N9: TMenuItem;
    actRealPrice: TAction;
    N10: TMenuItem;
    ppmNaklr: TPopupMenu;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    actDebug: TAction;
    N15: TMenuItem;
    actShowNaklo: TAction;
    N16: TMenuItem;
    N17: TMenuItem;
    frxDesigner1: TfrxDesigner;
    frdbNaklo: TfrxDBDataset;
    UnfFilter1: TUnfFilter;
    UnfFilter2: TUnfFilter;
    actMakeVozvrat: TAction;
    N18: TMenuItem;
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
    Panel3: TPanel;
    Button6: TButton;
    Button5: TButton;
    Button4: TButton;
    Button2: TButton;
    Button1: TButton;
    dbgNaklr: TDBGridEh;
    Button3: TButton;
    actRecountNakl: TAction;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ppmNaklrt: TPopupMenu;
    actColumnSetValue: TAction;
    N20: TMenuItem;
    actCopyDover: TAction;
    actPasteDover: TAction;
    N21: TMenuItem;
    N22: TMenuItem;
    ulbListBox2: TUnfDbLookupListbox;
    actPostIf2: TAction;
    DataSetProvider1: TDataSetProvider;
    sdsXozoper: TSQLDataSet;
    dspXozOper: TDataSetProvider;
    cdsXozOper: TClientDataSet;
    cdsXozOperOID: TIntegerField;
    cdsXozOperNAME: TStringField;
    cdsXozOperFULLNAME: TStringField;
    dsXozOper: TDataSource;
    sdsNakloID_XOZ_OPER: TIntegerField;
    cdsNakloID_XOZ_OPER: TIntegerField;
    cdsNakloXOZOPER: TStringField;
    actPreviewTtn: TAction;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    cdsNakloREYS: TStringField;
    cdsNakloREYS_FIO_VODITELYA: TStringField;
    cdsNakloREYS_DAT_REYS: TSQLTimeStampField;
    cdsNakloREYS_PEREVOZCHIK: TStringField;
    cdsNakloREYS_PUNKT_ZAGRUZKI: TStringField;
    cdsNakloREYS_PUNKT_VYGRUZKI: TStringField;
    cdsNakloREYS_NOMER_PRITSEPA: TStringField;
    sdsNakloID_VYGRUZKA: TIntegerField;
    cdsNakloID_VYGRUZKA: TIntegerField;
    cdsNakloREYS_POKUPATEL_PLATIT: TIntegerField;
    frTtn: TfrxReport;
    Curr2StrUA1: TCurr2StrUA;
    frNaklr2: TfrxReport;
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
    procedure cbxShowAllClick(Sender: TObject);
    procedure frNaklrGetValue(const ParName: String;
      var ParValue: Variant);
    procedure actCreateSpecifExecute(Sender: TObject);
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
    procedure actRealPriceExecute(Sender: TObject);
    procedure actDebugExecute(Sender: TObject);
    procedure actShowNakloExecute(Sender: TObject);
    procedure actDesignerExecute(Sender: TObject);
    procedure actMakeVozvratExecute(Sender: TObject);
    procedure actPostExecute(Sender: TObject);
    procedure actUnpostExecute(Sender: TObject);
    procedure actDefaultopenExecute(Sender: TObject);
    procedure actGrid1ListShowExecute(Sender: TObject);
    procedure actRecountNaklExecute(Sender: TObject);
    procedure actGrid2ListShowExecute(Sender: TObject);
    procedure actColumnSetValueExecute(Sender: TObject);
    procedure dbgNaklrKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cdsNaklotID_TOVARChange(Sender: TField);
    procedure actCopyDoverExecute(Sender: TObject);
    procedure actPasteDoverExecute(Sender: TObject);
    procedure ulbListBox2DblClick(Sender: TObject);
    procedure ulbListBox2Exit(Sender: TObject);
    procedure ulbListBox2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actPostIf2Execute(Sender: TObject);
    procedure dbgNaklrtKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actPreviewTtnExecute(Sender: TObject);
    procedure frNaklrBeginDoc(Sender: TObject);

  private
    curSum : currency;
    intNpp : integer; //����� ������� �� �������
    FOidNakl : integer ; //����� ���� "��������� ���������"
    FiSklad : integer; //����� ������ ���
    FIdNakl : integer;// ����� ��������� ���������, �� � ��������� � ����
    FiVidDostavki : integer;
    Semaphore : boolean; //��� ����������/���������� �������������� ���
    frmEdit : TfrmNaklrEdit;
    SettingsManager : TfmSettingsPlugin;
    SettingsVlad : TfmSettingsPlugin ;
    SettingsClient : TfmSettingsPlugin;
    slDover : TStringList;
    Rect2 : TRect;
 		cdIzg : TClientDetail;
    procedure MakeNakl (intSchet : integer);
    function GetOrientation :integer;
    procedure Order;

    procedure ProcessSettings(ProcessOnlySecurityMeasures:boolean=false);
    procedure ProcessShowDeleted;
    procedure FillSettings;
    function GetDefXozOper: integer;

  public
    { Public declarations }
    setT : TfrmSettings;
    function DefaultOpen:boolean;
    procedure DefaultStartup;
    function ShowDetail1:integer;
    procedure ShowReys(id_reys: integer);
    procedure ShowNaklr(id_nakl: integer; id_nakld: integer);

  end;
var
  frmNaklr: TfrmNaklr;

implementation

uses AtsAssert,
  untNaklrList, //frmNaklrList
  untNaklo,  //frmNaklo
  untRealPrice,
  SkladAux, //ProcessSettingsVladClientManager
  DesignReport //ProcessReportDesigner
  ;

{$R *.dfm}

procedure TfrmNaklr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  { DONE : ���������� �� qurNaklrCommit � ��������� ��������� ������ �� ������ ����� }
  if ApplyOrCancel(dsNaklo.DataSet) then begin
    ApplyOrCancel(dsNaklot.DataSet);
  end;
  Action := caFree;
end;

procedure TfrmNaklr.actSettingsExecute(Sender: TObject);
begin
  actSettings.checked := setT.ProcessSettingsChange2(DefaultOpen);
end;

procedure TfrmNaklr.dbgNaklrDblClick(Sender: TObject);
begin
  actGrid1ListShow.Execute;
end;

procedure TfrmNaklr.FormCreate(Sender: TObject);
begin
try
  qeNaklo.DefSql := sdsNaklo.CommandText;
  qeNaklot.DefSql := sdsNaklot.CommandText;

  FOidNakl := dmdEx.GetOidObjects('��������� ���������',-100);
  FIdNakl := -1;
  MonthToStrInitUa;
  FillSettings;
  ProcessSettings(true);
  //����� ������������� ��������
  qeNaklot.SetSQL('order by','id_pos',0);

  dmdEx.OpenQuery (dmdEx.cdsTovarAllND);
  dmdEx.OpenQuery (dmdEx.cdsSklads);
  dmdEx.OpenQuery (dmdEx.cdsVidDostavki);
  dmdEx.OpenQuery (dmdEx.cdsVygruzka);

  frmEdit := TfrmNaklrEdit.Create(self);
  frmEdit.dsNakloEdit.DataSet := cdsNaklo;

  FiVidDostavki := dmdEx.cdsVidDostavki.Lookup('isdefault','1','oid');
  try
    FiSklad := dmdEx.cdsSklads.Lookup('isdefault','1','oid');
  except
    on EVariantTypeCastError do begin
      AssertInternal('A8BBF66C-32ED-4F77-B66A-9DA5B6C23200'+ ' �� ������ ����� �� ���������');
    end;
  end;

  ProcessReportDesigner(ActionList1,MainMenu1,frNaklr);
  ProcessReportDesigner(ActionList1,MainMenu1,frTtn);

  ShowCopyForRoleOrUser(dbgNaklr,'BUXG','SYSDBA');
except
  AssertInternal('3416FAEE-A5B2-47C9-B9C4-3267F7F3FC00');
end;
end;

procedure TfrmNaklr.actRefreshExecute(Sender: TObject);
begin
  dmdEx.startWaiting;
	ApplyOrCancel(dsNaklot.Dataset);
	ApplyOrCancel(dsNaklo.DataSet);
  qeNaklo.Refresh;
  dmdEx.StopWaiting;
end;

procedure TfrmNaklr.FormDestroy(Sender: TObject);
begin
  dmdEx.CloseQuery(dmdEx.cdsClient, false);
  dmdEx.CloseQuery(dmdEx.cdsVlad, false);
  dmdEx.CloseQuery(dmdEx.cdsManager, false);
  dmdEx.CloseQuery(dmdEx.cdsAllClient, false);
  dmdEx.CloseQuery(dmdEx.cdsSklads, false);
  dmdEx.CloseQuery(dmdEx.cdsVidDostavki, false);
  dmdEx.CloseQuery(dmdEx.cdsVygruzka, false);
  setT.Free;
end;

procedure TfrmNaklr.dbgNaklrtDblClick(Sender: TObject);
begin
  actGrid2listshow.Execute;
end;


procedure TfrmNaklr.qurNaklrtBeforeScroll(DataSet: TDataSet);
begin
	ApplyOrCancel(DataSet);
end;

//////////////////////////////////////////////
//  ��������� ��������������
///
procedure TfrmNaklr.Order;
begin
  sdsOrder.Params.ParamByName('id_nakl').asInteger :=
    dsNaklo.Dataset.FieldByName('id_nakl').asInteger;
  dmdEx.ExecSQL(sdsOrder);  
  qeNaklot.Refresh;
end;


////////////////////////////////////////////////////////////
// 1- portrait orientation
// 0-landscape orientation (default)
function TfrmNaklr.GetOrientation: integer;
var
  intRes : integer;
  intMax : integer;
  intCount : integer;
begin
  intMax :=0;
  intCount :=0;
  dsNaklot.Dataset.First;
  while (not dsNaklot.Dataset.Eof) do begin
    intRes:=Length(dsNaklot.Dataset.FieldByName('fullname').asString);
    intCount := intCount+1;
    dsNaklot.Dataset.Next;
    if (intRes>intMax) then begin
      intMax := intRes;
    end;
  end; //while
  Result := 0; //landscape default
  if intMax > 29 then begin
    Result := 1; //portrait
  end;
  if intCount > 16 then begin
    Result := 1;
  end;
end;

procedure TfrmNaklr.actSchetExecute(Sender: TObject);
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
procedure TfrmNaklr.MakeNakl(intSchet: integer);
var
  dtNaklr : TDataSet;
  dtNaklrt : TDataSet;
  dtTemp : TDataSet;
begin
try
  dtTemp := dmdEx.cdsTemp;
  dtNaklrt := dsNaklot.DataSet;
  dtNaklr := dsNaklo.DataSet;

  dtNaklr.Open;
  dtNaklrt.Open;
  dtNaklr.Filtered := false;
  dtNaklrt.Filtered := false;
  dsNaklo.DataSet.Tag:=1;
  dtNaklr.Append;

  dtTemp.Close;
  TClientDataSet(dtTemp).CommandText := 'select s.dat,'+
    's.id_izg,s.id_zak,s.id_manager, '+
    's.kurs,s.nds '+
    'from SCHET s where s.schet ='+ inttostr (intSchet);
  dtTemp.Open;

  dtNaklr.FieldByName('id_izg').asInteger :=
    dtTemp.FieldByName ('id_izg').asInteger;

  dtNaklr.FieldByName('id_zak').asInteger :=
    dtTemp.FieldByName ('id_zak').asInteger;

  dtNaklr.FieldByName('id_manager').asVariant :=
    dtTemp.FieldByName ('id_manager').asInteger;;
  dtNaklr.FieldByName('kurs').AsCurrency :=
    dtTemp.FieldByName('kurs').AsCurrency;
  dtNaklr.FieldByName('nds').AsFloat :=
    dtTemp.FieldByName('nds').AsFloat;
	dtNaklr.FieldByName('sch').asInteger :=intSchet;

  dtTemp.Close;
  dsNaklo.DataSet.tag:=0;

  TClientDataSet(dtTemp).CommandText := 'select npp,id_tovar,kolotp,'
    +' skidka,cena'
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
			RRoundTo(dtTemp.FieldByName('cena').asFloat,-2);
    Semaphore := false;
		dtNaklrt.Post;
		dtTemp.Next;
	end;
  dtNaklrt.Tag:=0;
	dtTemp.Close;
  try
  	PostAndApply(dtNaklrt);
  	PostAndApply(dtNaklr);
    //actNaklrPost.Execute;
  except
    AssertInternal('BBA7888F-20B3-468C-833B-51E05DFE8AD5');
  end;
except
	AssertInternal('AC8C891D-5FEA-4F87-9AAA-E44FF66268B6');
end;
end;

procedure TfrmNaklr.qurNaklrBeforeDelete(DataSet: TDataSet);
begin
  dsNaklot.DataSet.first;
  while (not dsNaklot.DataSet.Eof) do begin
    dsNaklot.DataSet.Delete;
  end;
end;

procedure TfrmNaklr.actCalculateSumExecute(Sender: TObject);
begin
  SumRecount(dsNaklo.DataSet,cdsNaklot);
  PostAndApply(dsNaklot.Dataset);
  PostAndApply(dsNaklo.Dataset);
  Order;
end;

procedure TfrmNaklr.cbxShowAllClick(Sender: TObject);
begin
  actShowAll.Execute;
  qeNaklo.Refresh;
end;

procedure TfrmNaklr.frNaklrGetValue(const ParName: String;
  var ParValue: Variant);
begin
  if AnsiUpperCase(ParName)='SUMA2GRN' then begin
    ParValue := Suma2Grn(dsNaklo.DataSet,dsNaklot.DataSet);
  end; //if parname
  if AnsiUpperCase(ParName)='NDSTEXT' then begin
    ParValue := Curr2StrUA1.Value;
  end;
  if AnsiUpperCase(ParName)='VSEGO' then begin
    ParValue := CurSum;
  end;
  if AnsiUpperCase(ParName)='I_OKPO' then begin
    ParValue := cdIZG.okpo;
  end; //if parname
  if AnsiUpperCase(ParName)='OTPUSTIL_DOLGNOST' then begin
    ParValue := dmdEx.cdsManager.Lookup('ID', cdsNaklo.fieldByName('id_manager').AsInteger, 'DOLGNOST');
  end; //if parname
  if AnsiUpperCase(ParName)='OTPUSTIL_PODPIS' then begin
    ParValue := dmdEx.cdsManager.Lookup('ID', cdsNaklo.fieldByName('id_manager').AsInteger, 'SIGNATURE');
  end; //if parname
  if AnsiUpperCase(ParName)='I_ADRP' then begin
    ParValue := cdIZG.adrp;
  end;

end;

procedure TfrmNaklr.actCreateSpecifExecute(Sender: TObject);
var
  frmSpecif : TfrmSpecif;
begin
  { DONE : ���������� ������������ }
	//�������� ����� ������������
	dsNaklo.DataSet.CheckBrowseMode;
  PostAndApply(dsNaklo.DataSet);
	qeNaklo.Refresh;
	frmSpecif :=TfrmSpecif.Create (self);
	frmSpecif.ShowSpecif(
    dsNaklo.DataSet.FieldByName('id_nakl').asInteger,
    dsNaklo,
    dsNaklot
  );
  frmSpecif.Free;
end;

procedure TfrmNaklr.qurNaklrtAfterDelete(DataSet: TDataSet);
begin
	ApplyOrCancel(DataSet);
end;

procedure TfrmNaklr.DBGridEh1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_insert : begin
      cdsNaklo.Insert;
    end;
    vk_f8 : begin
      if (MessageDlg('�� ������ ������� ������?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      begin
        cdsNaklo.Delete;
        ApplyOrCancel(cdsNaklo);
      end;
    end;  //vk_f8
  end;//case
end;

function TfrmNaklr.DefaultOpen:boolean;
begin
  ProcessSettings;
  Result:=DefaultOpenInputForm(qeNaklo);
end;

procedure TfrmNaklr.DefaultStartup;
begin
  SettingsManager.SetKeyValue(dmdEx.GetIdManager);
  setT.SetPeriod(2);
  ProcessSettings;
end;

procedure TfrmNaklr.ShowReys(id_reys: integer);
begin
  try
    //instead of date_from
    qeNaklo.SetSQL('where',
      'om.id_vygruzka in (select id_vygruzka from spr_vygruzka_vw s where s.id_reys='
        + inttostr(id_reys) + ')' ,
      3);
    actRefresh.Execute;
  except
    AssertInternal('7430241A-B0D6-4396-9FFA-39DA6E8786AF');
  end
end;

procedure TfrmNaklr.ShowNaklr(id_nakl: integer; id_nakld: integer);
begin
  try
    //instead of date_from
    qeNaklo.SetSQL('where', 'id_nakl=' + inttostr(id_nakl), 3); //������ ��� ��������

    actRefresh.Execute;
    
    if (id_nakld > 0) then begin
      cdsNaklot.Locate('id_nakld', id_nakld, []);
    end;


  except
    AssertInternal('7430241A-B0D6-4396-9FFA-39DA6E8786AF');
  end
end;

procedure TfrmNaklr.ProcessSettings(ProcessOnlySecurityMeasures:boolean=false);
begin
try
  ProcessSettingsVladClientManager(qeNaklo,setT,ProcessOnlySecurityMeasures);
  ProcessShowDeleted;
  if not ProcessOnlySecurityMeasures then begin
    self.Caption := UpdateCaptionVladClientManager('��������� ���������:',setT);
  end;
except
  AssertInternal('5CE18C1E-A0A0-41E3-85DB-2AFC8794FC92');
end;
end;

procedure TfrmNaklr.cdsNakloAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('id_nakl').AsString :=
    inttostr(dmdEx.GetGenValue('naklo_gen'));
  DataSet.FieldByName('nalog_nds').AsFloat :=
    dmdEx.GetNds ( Date );
  DataSet.FieldByName('dat').AsDateTime := Date; //default date. time=0
  DataSet.FieldByName('id_nakl').AsInteger :=
    dmdEx.GetGenValue('naklo_gen');
  DataSet.FieldByName('nalog_nds').AsFloat := dmdEx.GetNds(Date);
  DataSet.FieldByName('fr').asString := '�/�';
  DataSet.FieldByName('id').AsString :=
    inttostr(dmdEx.GetGenValue('naklr_gen_id'));
  DataSet.FieldByName('kurs').asFloat := 1.0000;
  DataSet.FieldByName('posted').asInteger := 0;
  DataSet.FieldByName('id_sklad').asInteger := FiSklad;
  DataSet.FieldByName('id_sklad_to').asInteger := FiVidDostavki;
  DataSet.FieldByName('id_xoz_oper').asInteger := GetDefXozOper;
  DataSet.FieldByName('id_currency').asInteger := dmdEx.GetIdCurrencyUAH;
  SetManager(TIntegerField(DataSet.FieldByName('id_manager')),SettingsManager);
  ShowDetail1;
end;


procedure TfrmNaklr.dspNakloBeforeUpdateRecord(Sender: TObject;
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

procedure TfrmNaklr.cdsNakloBeforePost(DataSet: TDataSet);
begin
	if DataSet.FieldByName('dat').IsNull then begin
		showmessage ('��������� ���� ''����''');
		abort;
	end;
	if DataSet.FieldByName('id_izg').IsNull then begin
		showmessage ('��������� ���� ''���������''');
		abort;
	end;
	if DataSet.FieldByName('id_zak').IsNull then begin
		showmessage ('��������� ���� ''����������''');
		abort;
	end;
	if DataSet.FieldByName('id_manager').IsNull then begin
		showmessage ('��������� ���� ''��������''');
		abort;
	end;
	if DataSet.FieldByName('kurs').IsNull then begin
		showmessage ('��������� ���� ''����''');
		abort;
	end;
	if DataSet.FieldByName('vid_dostavki').IsNull then begin
		showmessage ('��������� ���� ''��� ��������''');
		abort;
	end;
end;

procedure TfrmNaklr.actShowDeletedExecute(Sender: TObject);
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

procedure TfrmNaklr.ProcessShowDeleted;
begin
  if actShowDeleted.Checked then begin
		qeNaklo.SetSQL ('where','delmarked=1',5);
  end
  else begin
    qeNaklo.SetSQL ('where','delmarked=0',5);
  end;//checked
  qeNaklo.prepare;
end;

procedure TfrmNaklr.cdsNaklotAfterOpen(DataSet: TDataSet);
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

procedure TfrmNaklr.cdsNaklotAfterInsert(DataSet: TDataSet);
begin
  if cdsNaklo.FieldByName('id_nakl').AsInteger=0 then begin
    if cdsNaklo.Eof and cdsNaklo.Bof then begin
      messagedlg('�� ������ ��������',mtWarning,[mbOK],0);
      abort;
    end;
  end;
  DataSet.FieldByName('id_nakld').asInteger :=
    dmdEx.GetGenValue('naklot_gen');
  DataSet.FieldByName('id_nakl').asInteger :=
    dsNaklo.DataSet.FieldByName('id_nakl').asInteger;
  intNpp := intNpp +1;  
  DataSet.FieldByName('id_pos').asInteger := intNpp;
//  ShowDetail2;
end;

procedure TfrmNaklr.cdsNaklotBeforeInsert(DataSet: TDataSet);
begin
  if (dsNaklo.DataSet.Tag=0) then begin
    if (PostAndApply(dsNaklo.DataSet)<>0) then begin
      abort;
    end;
  end;
  //���� ����� ��������� �������
  DataSet.Last;
  try
    intNpp:=DataSet.fieldbyname('id_pos').asInteger;
  except
    intNpp:=0;
  end;
end;

procedure TfrmNaklr.cdsNaklotBeforePost(DataSet: TDataSet);
begin
 { DONE : Tovar is not null }
	if DataSet.FieldByName('id_tovar').IsNull then begin
		showmessage ('��������� ���� ''�����''');
		abort;
	end;
end;

procedure TfrmNaklr.FormShow(Sender: TObject);
begin
  Semaphore := false;
end;

procedure TfrmNaklr.cdsNaklotCENANDSChange(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    FromCenaRecount(2,dsNaklo.DataSet,dsNaklot.Dataset);
    Semaphore := false;
  end;
end;

procedure TfrmNaklr.cdsNaklotKOLOTPChange(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    FromCenaRecount(1,dsNaklo.DataSet,dsNaklot.Dataset);
    Semaphore := false;
  end;
end;

procedure TfrmNaklr.cdsNaklotSUMAChange(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    FromCenaRecount(3,dsNaklo.DataSet,dsNaklot.Dataset);
    Semaphore := false;
  end;
end;

procedure TfrmNaklr.cdsNaklotSUMANDSChange(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    FromCenaRecount(4,dsNaklo.DataSet,dsNaklot.DataSet);
    Semaphore := false;
  end;
end;

procedure TfrmNaklr.cdsNaklotCENAChange(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    FromCenaRecount(6,dsNaklo.DataSet,dsNaklot.DataSet);
    Semaphore := false;
  end;
end;

procedure TfrmNaklr.cdsNaklotSKIDKAChange(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    FromCenaRecount(5,dsNaklo.DataSet,dsNaklot.DataSet);
    Semaphore := false;
  end;
end;

procedure TfrmNaklr.FormHide(Sender: TObject);
begin
  Semaphore := false;
end;



procedure TfrmNaklr.cdsNaklotAfterRefresh(DataSet: TDataSet);
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

procedure TfrmNaklr.cdsNaklotAfterDelete(DataSet: TDataSet);
begin
  ApplyOrCancel(DataSet);
  //�� ������� ���� �� ��� �����, ����� �������
  //��������� ������� 
  //  SumRecount(dsNaklr.Dataset,dsNaklrt.Dataset);
end;

procedure TfrmNaklr.cdsNakloBeforeScroll(DataSet: TDataSet);
begin
  //ApplyOrCancel(DataSet);
end;

procedure TfrmNaklr.cdsNaklotCalcFields(DataSet: TDataSet);
begin
  if not Semaphore and (DataSet.state =dsInternalCalc) then begin
    Semaphore := true;
    FromCenaRecount(1,dsNaklo.DataSet,dsNaklot.DataSet);
    Semaphore := false;
  end;
end;

procedure TfrmNaklr.cdsNaklotBeforeEdit(DataSet: TDataSet);
begin
	if PostAndApply(dsNaklo.DataSet)<>0 then begin
    Abort;
	end;
end;


procedure TfrmNaklr.actPreviewExecute(Sender: TObject);
begin
try
  dsNaklot.dataset.DisableControls;
  curSum := SumRecount(dsNaklo.Dataset,dsNaklot.Dataset);
  PostAndApply(dsNaklot.Dataset);
  PostAndApply(dsNaklo.Dataset);
  Order;
  if cdsNaklo.FieldByName('posted').AsInteger=0 then begin
    actPost.Execute;
  end;
  MonthToStrInitUa;
  Curr2StrUA1.Active := false;
  Curr2StrUA1.Summa := dsNaklo.DataSet.FieldByName('nds').AsCurrency;
  Curr2StrUA1.Active := true;
  if (GetOrientation = 0) then begin
    dmdEx.GetReport('Naklr.fr3',frNaklr);
    frNaklr.PrepareReport;
    frNaklr.ShowReport;
  end
  else begin
    dmdEx.GetReport('Naklr2.fr3',frNaklr2);
    frNaklr2.PrepareReport;
    frNaklr2.ShowReport;
  end;
  Curr2StrUA1.Active := false;
finally
  dsNaklot.dataset.EnableControls;
end;
end;

procedure TfrmNaklr.actPrintExecute(Sender: TObject);
begin
  curSum := SumRecount(dsNaklo.Dataset,dsNaklot.Dataset);
  PostAndApply(dsNaklot.Dataset);
  PostAndApply(dsNaklo.Dataset);
  if cdsNaklo.FieldByName('posted').AsInteger=0 then begin
    actPost.Execute;
  end;
  MonthToStrInitUa;
  Curr2StrUA1.Active := false;
  Curr2StrUA1.Summa := dsNaklo.DataSet.FieldByName('nds').AsCurrency;
  Curr2StrUA1.Active := true;
  curSum := SumRecount(dsNaklo.Dataset,dsNaklot.Dataset);
  if (GetOrientation = 0) then begin
    dmdEx.GetReport('Naklr.fr3',frNaklr);
    frNaklr.PrepareReport;
    frNaklr.PrintOptions.ShowDialog :=false;
    frNaklr.Print;
  end
  else begin
    dmdEx.GetReport('Naklr2.fr3',frNaklr2);
    frNaklr2.PrepareReport;
    frNaklr2.PrintOptions.ShowDialog :=false;
    frNaklr2.Print;
  end;
  Curr2StrUA1.Active := false;
end;

procedure TfrmNaklr.cdsNaklotBeforeScroll(DataSet: TDataSet);
begin
  ApplyOrCancel(DataSet);
end;

procedure TfrmNaklr.actUndeleteNaklExecute(Sender: TObject);
begin
  if actShowDeleted.Checked then begin
    dmdEx.UndeleteNaklo(TintegerField(dsNaklo.DataSet.FieldByName('delmarked')),actRefresh);
  end;
end;

procedure TfrmNaklr.cdsNakloReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  showmessage(e.message);
  Action := raAbort;
end;

procedure TfrmNaklr.cdsNaklotReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  showmessage(e.message);
  Action := raAbort;
end;

procedure TfrmNaklr.actNaklrPostExecute(Sender: TObject);
begin
  dmdEx.StartWaiting;
  sdsNaklrPost.Params.ParamByName('id_nakl').asInteger :=
    dsNaklo.DataSet.FieldByName('id_nakl').asInteger;
  dmdEx.ExecSQL(sdsNaklrPost);
  dmdEx.StopWaiting;
end;

procedure TfrmNaklr.actRealPriceExecute(Sender: TObject);
var
  frmRealPrice : TfrmRealPrice;
begin
  if dsNaklo.DataSet.Eof and dsNaklo.DataSet.Bof then begin
     exit;
  end;
  frmRealPrice := TfrmRealPrice.Create(Application);
  frmRealPrice.qeNaklr.SetSQL('where','om.id_nakl='+
    dsNaklo.DataSet.FieldByName('id_nakl').AsString,5);
  frmRealPrice.actRefresh.execute;
end;

procedure TfrmNaklr.actDebugExecute(Sender: TObject);
begin
  actDebug.Checked := not actDebug.Checked;
  if actDebug.Checked then begin
    ColumnByName(dbgNaklr.Columns,'ID_NAKL').Visible := true;
  end else begin //if actDebug checked
    ColumnByName(dbgNaklr.Columns,'ID_NAKL').Visible := false;
  end;  //if actDebug checked
end;

procedure TfrmNaklr.actShowNakloExecute(Sender: TObject);
var
  iTip : integer;
begin
  if dsNaklo.DataSet.Eof and dsNaklo.DataSet.Bof then begin
     exit;
  end;
  iTip := dmdEx.GetOidObjects('��� ��������� ��� ������',-100);
  iTip := dmdEx.GetOidObjects('��������',iTip);
  OpenDocument(self,dsNaklo.DataSet.FieldByName('id_nakl').asInteger,iTip,0,true);
end;

procedure TfrmNaklr.actDesignerExecute(Sender: TObject);
begin
  dmdEx.GetReport('Naklr.fr3',frNaklr);
  frNaklr.DesignReport;
end;

procedure TfrmNaklr.actMakeVozvratExecute(Sender: TObject);
begin
  if  cdsNaklo.Eof and cdsNaklo.Bof then begin
    exit;
  end;
try
  sdsMakeVozvrat.Params.ParamByName('id_nakl_in').asInteger :=
    cdsNaklo.FieldByName('id_nakl').asInteger;
  dmdEx.ExecSQL(sdsMakeVozvrat,false);
  actMakeVozvrat.Tag :=sdsMakeVozvrat.Params.ParamByName('id_nakl').asInteger;
  OpenDocument(self,
    sdsMakeVozvrat.Params.ParamByName('id_nakl').asInteger,
    dmdEx.GetOidObjects('�������',-100),
    0); 
except
  AssertInternal('1983AEC6-C455-4FE2-93C3-3594280E9659');
end;
end;

procedure TfrmNaklr.actPostExecute(Sender: TObject);
begin
  actCalculateSum.execute;
  dmdEx.PostNakl(
    TIntegerField(cdsNaklo.FieldByName('posted')),
    sdsNaklrPost,
    TIntegerField(cdsNaklo.FieldByName('id_nakl')),
    not actPost.Checked);
end;

procedure TfrmNaklr.actUnpostExecute(Sender: TObject);
begin
  dmdEx.UnPostNakl(
    TIntegerField(cdsNaklo.FieldByName('posted')),
    sdsNaklrUnpost,
    TIntegerField(cdsNaklo.FieldByName('id_nakl')),
    not actUnpost.Checked);
end;

procedure TfrmNaklr.actDefaultopenExecute(Sender: TObject);
begin
  ProcessSettings;
  actDefaultopen.Checked:=DefaultOpenInputForm(qeNaklo);
end;

procedure TfrmNaklr.FillSettings;
begin
  //������������� ��������
  setT := TfrmSettings.Create(self);
  setT.actManagerOff.execute;

  SettingsManager := setT.CreatePlugin('TfmSettingsManager');

  setT.AddPlugin(SettingsManager);
  //��������� �� ���� ���������
  SettingsManager.SetResultType(2);

  SettingsVlad := setT.CreatePlugin('TfmSettingsVlad');
  SettingsVlad.SetResultType(2);
  setT.AddPlugin(SettingsVlad);

  SettingsClient := setT.CreatePlugin('TfmSettingsClient');
  setT.addplugin(SettingsClient);
end;

procedure TfrmNaklr.actGrid1ListShowExecute(Sender: TObject);
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

function TfrmNaklr.ShowDetail1:integer;
begin
  Result := dmdEx.ShowDetail1(dsNaklo.DataSet,frmEdit,actRecountNakl);
end;

procedure TfrmNaklr.actRecountNaklExecute(Sender: TObject);
begin
  SumRecount(dsNaklo.DataSet,cdsNaklot);
end;

procedure TfrmNaklr.actGrid2ListShowExecute(Sender: TObject);
begin
{
  if (cdsNaklot.FieldByName('ID_NAKLD').AsInteger = 0) then begin
    cdsNaklot.Insert;
  end else begin
		ShowDetail2;
  end;
}
  if (dbgNaklrt.SelectedField.FieldName ='TOVAR') then begin
		dmdEx.cdsTovarAll.Filter:='delmarked=0';
		dmdEx.cdsTovarAll.Filtered := true;
    Rect2:= LookupBoxEnterEh (ulbListBox2, dbgNaklrt, dmdEx.dsTovarAll, 70 );
	end; //tovar
end;

procedure TfrmNaklr.actColumnSetValueExecute(Sender: TObject);
begin
  if dbgNaklrt.SelectedField.FieldName='SKIDKA' then begin
    dmdEx.ColumnSet(dbgNaklrt);
    actCalculateSum.Execute;
  end else begin
    Showmessage('��������� ��������� �������� ������ ���� "������"');
  end;
end;

procedure TfrmNaklr.dbgNaklrKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return :begin
      actGrid1ListShow.Execute;
    end; //vk_return
    vk_f8: begin
      if (MessageDlg('�� ������ ������� ���� ��������?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
        if (dsNaklo.Dataset.FieldByName('posted').asInteger=1) then begin
          showmessage('������ ������� ����������� ��������');
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


procedure TfrmNaklr.cdsNaklotID_TOVARChange(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    FromCenaRecount(5,dsNaklo.DataSet,dsNaklot.DataSet);
    Semaphore := false;
  end;
end;

procedure TfrmNaklr.actCopyDoverExecute(Sender: TObject);
begin
  slDover := TStringList.Create;
  slDover.Add('dov='+dsNaklo.DataSet.FieldByName('dov').asString);
  slDover.Add('lico='+dsNaklo.DataSet.FieldByName('lico').asString);
  slDover.Add('ddo='+dsNaklo.DataSet.FieldByName('ddo').asString);
end;

procedure TfrmNaklr.actPasteDoverExecute(Sender: TObject);
begin
  if Assigned(slDover) then begin
    dsNaklo.DataSet.Tag:=1;
    dsNaklo.DataSet.Edit;
    dsNaklo.DataSet.FieldByName('dov').asString := slDover.Values['dov'];
    dsNaklo.DataSet.FieldByName('lico').asString := slDover.Values['lico'];
    if slDover.Values['ddo']<>'' then begin
      dsNaklo.DataSet.FieldByName('ddo').AsDateTime := strtodate(slDover.Values['ddo']);
    end else begin
      dsNaklo.DataSet.FieldByName('ddo').Clear;
    end;
    dsNaklo.DataSet.Post;
    dsNaklo.DataSet.Tag:=0;
    ApplyOrCancel(dsNaklo.DataSet);
  end;
end;

procedure TfrmNaklr.ulbListBox2DblClick(Sender: TObject);
begin
  LookupBoxExitOkEh (ulbListBox2 , dbgNaklrt, Rect2);
  actPostIf2.Execute;
end;

procedure TfrmNaklr.ulbListBox2Exit(Sender: TObject);
begin
  LookupBoxExitCancel (ulbListBox2, dbgNaklrt, Rect2);
end;

procedure TfrmNaklr.ulbListBox2KeyUp(Sender: TObject; var Key: Word;
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

procedure TfrmNaklr.actPostIf2Execute(Sender: TObject);
begin
  Semaphore :=true;
  FromCenaRecount(5,dsNaklo.DataSet,cdsNaklot);
  semaphore := false;
end;

procedure TfrmNaklr.dbgNaklrtKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return : begin
      actGrid2ListShow.Execute;
    end; //vk_return
    vk_f8 : begin
      if (MessageDlg('�� ������ ������� �������?',
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

function TfrmNaklr.GetDefXozOper: integer;
var
  iXozOper : integer;
begin
  iXozOper:=dmdEx.GetParamCached('������������� ��������',
    'select oid from GET_OID_OBJECTS_PC('+quotedstr('������������� ��������')+',-100)',
    'oid');
  Result :=dmdEx.GetParamCached('��������� ��������� �� �����',
    'select oid from GET_OID_OBJECTS_PC('
      +quotedstr('��������� ��������� �� �����')
      +','+inttostr(iXozOper)+')',
    'oid');
end;

procedure TfrmNaklr.actPreviewTtnExecute(Sender: TObject);
begin
  MonthToStrInitUa;
  dmdEx.GetReport('Ttn.fr3',frTtn);
  frTtn.PrintOptions.ShowDialog := true;
  frTtn.PrepareReport;
  frTtn.ShowReport;
end;    

procedure TfrmNaklr.frNaklrBeginDoc(Sender: TObject);
begin
  cdIzg :=  dmdEx.GetClientDetail(cdsNaklo.FieldByName('id_izg').asInteger);
end;

end.
