 unit untNaklo;

interface

uses
	Windows, Messages, SysUtils,
	Classes, Graphics,
	Controls, Forms,
	Dialogs,
	DB, DBTables, Grids, DBGrids,
	ActnList,
	StdCtrls,
	QueryExtender,
	DBCtrls,
	ExtCtrls,
	untSchetList,untRound, Curr2StrRU,
	Mask, DBCtrlsEh, DBGridEh,
	untEx, FMTBcd,
	DBClient,
	Provider,
	SqlExpr,
	Buttons,
	Menus ,
	untNakloEdit,
	StrUtils,
	RecError ,
	untSettings,
	untNaklodet ,
	ATSAssert,
	untAfterCutOstatok, PropFilerEh, UnfFilter, PropStorageEh, 
    GridsEh, frxClass, frxDBSet, //отчёт по остаткам после накладной
    
	Registry,
  RepNakloWeight,
  SettingsPlugin, //TfmSettingsPlugin
  RepNakloDepend  // TfrmRepNakloDepend

  ;

type
	TfrmNaklo = class(TForm)
		ActionList1: TActionList;
		actSettings: TAction;
		actGrid1ListShow: TAction;
		actPostIf: TAction;
		actRefresh: TAction;
		actGrid2ListShow: TAction;
		actPostIf2: TAction;
		actRecalc: TAction;
		actAutoRecalc: TAction;
		actPreview: TAction;
		actPrint: TAction;
		actSchet: TAction;
		actCalculateSum: TAction;
		dbgNaklot: TDBGridEh;
		sdsNaklo: TSQLDataSet;
    dsNaklo: TDataSource;
    dspNaklo: TDataSetProvider;
    cdsNaklo: TClientDataSet;
		sdsPost: TSQLDataSet;
    sdsUnpost: TSQLDataSet;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
		qeNaklo: TQueryExtender;
		cdsNakloID_NAKL: TIntegerField;
		cdsNakloID_IZG: TIntegerField;
    cdsNakloID_ZAK: TIntegerField;
    cdsNakloID_MANAGER: TIntegerField;
    cdsNakloID_CURRENCY: TSmallintField;
    cdsNakloNALOG_NDS: TFMTBCDField;
    cdsNakloNDS: TFMTBCDField;
    cdsNakloID_SKLAD: TIntegerField;
		cdsNakloPOSTED: TSmallintField;
		cdsNakloCOMMENT: TStringField;
    cdsNakloIZG: TStringField;
		cdsNakloZAK: TStringField;
		cdsNakloMANAGER: TStringField;
    cdsNakloDAT: TSQLTimeStampField;
    cdsNakloKURS: TFloatField;
    cdsNakloTIP: TSmallintField;
    cdsNakloDELMARKED: TSmallintField;
    N2: TMenuItem;
		actAfterCutOstatok: TAction;
		N3: TMenuItem;
    PopupMenu1: TPopupMenu;
    N5: TMenuItem;
    actShowDeleted: TAction;
		sdsRepNaklo: TSQLDataSet;
    frDBDataSet1: TfrxDBDataset;
    dspRepNaklo: TDataSetProvider;
    cdsRepNaklo: TClientDataSet;
    cdsRepNakloNOMER_TARY: TStringField;
		cdsRepNakloKOLOTP: TFMTBCDField;
    cdsRepNakloKOLBUXT: TIntegerField;
		cdsRepNakloTIP: TIntegerField;
		N6: TMenuItem;
    cdsRepNakloKOLOTP_ITOG: TFMTBCDField;
    cdsRepNakloNOMER_TARY_ITOG: TStringField;
    sdsDelmark: TSQLDataSet;
    actBlock: TAction;
    N7: TMenuItem;
		cdsNakloTIPCONST: TStringField;
    cdsNakloID: TStringField;
		sdsNaklot: TSQLDataSet;
    dspNaklot: TDataSetProvider;
    cdsNaklot: TClientDataSet;
    dsNaklot: TDataSource;
		cdsNaklotID_NAKLD: TIntegerField;
    cdsNaklotCENA: TFMTBCDField;
		cdsNaklotID_NAKL: TIntegerField;
		cdsNaklotID_POS: TIntegerField;
		cdsNaklotID_TOVAR: TIntegerField;
    cdsNaklotKODCN: TSmallintField;
    cdsNaklotKOLOTP: TFMTBCDField;
    cdsNaklotSKIDKA: TFMTBCDField;
    cdsNaklotTOVAR: TStringField;
		cdsNakloSKLAD: TStringField;
    cdsNakloID_SKLAD_TO: TIntegerField;
		Splitter1: TSplitter;
		Panel2: TPanel;
    dbgNaklo: TDBGridEh;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    btnUnpost: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
		BitBtn7: TBitBtn;
		btnBlock: TBitBtn;
		cdsNakloBLOCKED: TSmallintField;
    sdsNaklotID_NAKLD: TIntegerField;
    sdsNaklotCENA: TFMTBCDField;
		sdsNaklotID_NAKL: TIntegerField;
    sdsNaklotID_POS: TIntegerField;
    sdsNaklotID_TOVAR: TIntegerField;
    sdsNaklotKODCN: TSmallintField;
    sdsNaklotKOLOTP: TFMTBCDField;
    sdsNaklotSKIDKA: TFMTBCDField;
    sdsNakloID_NAKL: TIntegerField;
    sdsNakloID: TStringField;
    sdsNakloNALOG_NDS: TFMTBCDField;
		sdsNakloID_SKLAD: TIntegerField;
    sdsNakloDAT: TSQLTimeStampField;
    sdsNakloPOSTED: TSmallintField;
    sdsNakloID_CURRENCY: TSmallintField;
		sdsNakloCOMMENT: TStringField;
		sdsNakloID_IZG: TIntegerField;
    sdsNakloID_ZAK: TIntegerField;
    sdsNakloID_MANAGER: TIntegerField;
    sdsNakloKURS: TFloatField;
		sdsNakloNDS: TFMTBCDField;
    sdsNakloTIP: TSmallintField;
    sdsNakloDELMARKED: TSmallintField;
    sdsNakloID_SKLAD_TO: TIntegerField;
		sdsNakloBLOCKED: TSmallintField;
    qeNaklot: TQueryExtender;
		PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    UnfFilter1: TUnfFilter;
    UnfFilter2: TUnfFilter;
    cdsRepNakloID_TOVAR: TIntegerField;
    cdsRepNakloID_TARA: TIntegerField;
    cdsRepNakloID_TARA_ITOG: TIntegerField;
    cdsRepNakloID_IZG_ITOG: TIntegerField;
    cdsRepNakloTOVAR: TStringField;
    cdsRepNakloEDIZ: TStringField;
    cdsRepNakloTARA: TStringField;
    cdsRepNakloTARA_ITOG: TStringField;
    cdsRepNakloIZG_ITOG: TStringField;
    sdsNakloPARENT_ID_NAKL: TIntegerField;
    cdsNakloPARENT_ID_NAKL: TIntegerField;
    sdsNakloPARENT_ID: TStringField;
    cdsNakloPARENT_ID: TStringField;
    PopupMenu2: TPopupMenu;
    actOrder: TAction;
    actUndeleteNakl: TAction;
    N8: TMenuItem;
    actRealPriceOpen: TAction;
    N9: TMenuItem;
    sdsRepNakloWeight: TSQLDataSet;
    dspRepNakloWeight: TDataSetProvider;
    cdsRepNakloWeight: TClientDataSet;
    StringField1: TStringField;
    FMTBCDField1: TFMTBCDField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    FMTBCDField2: TFMTBCDField;
    StringField2: TStringField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    actRepNakloWeight: TAction;
    N10: TMenuItem;
    N11: TMenuItem;
    cdsRepNakloCOMMENT: TStringField;
    actMakeNaklr: TAction;
    N4: TMenuItem;
    sdsMakeNaklo: TSQLDataSet;
    actMakeSchet: TAction;
    sdsMakeSchet: TSQLDataSet;
    N12: TMenuItem;
    cdsNakloSKLAD_TO: TStringField;
    actMakeNakloTop: TAction;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    actShowOtpravka: TAction;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    actMakeNaklPerem: TAction;
    sdsMakeNaklPeremBux: TSQLDataSet;
    N22: TMenuItem;
    actShowNaklr: TAction;
    N23: TMenuItem;
    N24: TMenuItem;
    actShowRepDependNaklo: TAction;
    N25: TMenuItem;
    frdNaklo: TfrxDBDataset;
    frRepNaklo: TfrxReport;
    cdsRepNakloPRIM: TStringField;
    cdsRepNakloTIP2: TStringField;
    actUnpost: TAction;
    actPost: TAction;
    actSetColumnValue: TAction;
    N26: TMenuItem;
    cdsNaklotCENANDS: TFloatField;
    cdsNaklotSUMA: TFloatField;
    cdsNaklotSUMANDS: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actSettingsExecute(Sender: TObject);
		procedure actGrid1ListShowExecute(Sender: TObject);
    procedure dbgNaklrDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actGrid2ListShowExecute(Sender: TObject);
    procedure actRecalcExecute(Sender: TObject);
		procedure FormDeactivate(Sender: TObject);
    procedure actCalculateSumExecute(Sender: TObject);
		procedure cdsNakloAfterInsert(DataSet: TDataSet);
    procedure cdsNaklotAfterInsert(DataSet: TDataSet);
    procedure cdsNaklotBeforeInsert(DataSet: TDataSet);
    procedure btnInsertClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
		procedure cdsNaklotBeforeScroll(DataSet: TDataSet);
		procedure cdsNakloBeforeScroll(DataSet: TDataSet);
    procedure dbgNaklotDblClick(Sender: TObject);
    procedure dbgNakloDblClick(Sender: TObject);
    procedure actAfterCutOstatokExecute(Sender: TObject);
    procedure actPreviewExecute(Sender: TObject);
    procedure dspNakloBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
		procedure actShowDeletedExecute(Sender: TObject);
    procedure cdsNakloReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
		procedure cdsNaklotReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
		procedure actBlockExecute(Sender: TObject);
    procedure actOrderExecute(Sender: TObject);
    procedure actUndeleteNaklExecute(Sender: TObject);
    procedure actRealPriceOpenExecute(Sender: TObject);
    procedure actRepNakloWeightExecute(Sender: TObject);
    procedure dbgNakloKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgNaklotKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actMakeNaklrExecute(Sender: TObject);
    procedure actMakeSchetExecute(Sender: TObject);
    procedure actMakeNakloTopExecute(Sender: TObject);
    procedure actShowOtpravkaExecute(Sender: TObject);
    procedure actMakeNaklPeremExecute(Sender: TObject);
    procedure actShowNaklrExecute(Sender: TObject);
    procedure actShowRepDependNakloExecute(Sender: TObject);
    procedure actUnpostExecute(Sender: TObject);
    procedure actPostExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cdsNaklotSKIDKAChange(Sender: TField);
    procedure actSetColumnValueExecute(Sender: TObject);
    procedure cdsNaklotCalcFields(DataSet: TDataSet);

	private
		intNpp : integer; //номер позиции по порядку
		frmNakloEdit : TfrmNakloEdit;
		frmNaklodet : TfrmNaklodet;
    FidCurrency  : integer;
    SettingsManager : TfmSettingsPlugin;
    SettingsSklad : TfmSettingsPlugin;
    SettingsSkladTo : TfmSettingsPlugin;
    SettingsVlad : TfmSettingsPlugin;
    SettingsClient : TfmSettingsPlugin;
    SettingsTipDetail : TfmSettingsPlugin;
    Semaphore :boolean;
		procedure ShowDetail2;
		procedure ShowDetail1;    
		procedure ProcessShowDeleted;
		procedure qurNaklrCommit;
		procedure Order;
    procedure ProcessSettings(ProcessOnlySecurityMeasures:boolean=false);
    procedure RecountNakl;
    procedure FillDate;
    Procedure FillSklad;
    procedure FillTip;
    procedure ProcessSklad;
    procedure ProcessTip;
    procedure ProcessLowerPanelVisible;

	public
		{ Public declarations }
		setT : TfrmSettings;
    procedure DefaultStartup;
    function DefaultOpen:boolean;
    function CheckForXranenie(iNakl,iTip: integer;DefaultAnswer:integer=0 ):boolean;
	end;
var
	frmNaklo: TfrmNaklo;

implementation

{$R *.dfm}

uses

untRealPrice, //frmRealPrice
//Naklr,  //TfrmNaklr
untSchet, //TfrmSchet
SkladAux, //OpenDocument
untOtpravka, //actShowOtpravka.TfrmOtpravka
DesignReport //ProcessReportDesigner
;

procedure TfrmNaklo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	Action := caFree;
end;

procedure TfrmNaklo.actSettingsExecute(Sender: TObject);
begin
  actSettings.checked := setT.ProcessSettingsChange2(Defaultopen);
 { actSettings.Checked := false;
  if setT.ChangeSettings=mrOk then begin
    actSettings.Checked :=true;
    ProcessSettings;
    Defaultopen;
  end;}
end;

procedure TfrmNaklo.actGrid1ListShowExecute(Sender: TObject);
begin
  if (cdsNaklo.FieldByName('ID_NAKL').AsInteger = 0) then  begin
    cdsNaklo.Insert;
  end
  else begin
    if (frmNakloEdit.Visible = false) then begin
      cdsNaklo.Edit;
      ShowDetail1;
    end;
  end;
end;

procedure TfrmNaklo.dbgNaklrDblClick(Sender: TObject);
begin
  actGrid1ListShow.Execute;
end;

procedure TfrmNaklo.DefaultStartup;
begin
  SettingsManager.SetKeyValue(dmdEx.GetIdManager);
  ProcessSettings;
end;

function TfrmNaklo.DefaultOpen:boolean;
begin
  ProcessSettings;
  Result:=DefaultOpenInputForm(qeNaklo);
end;

procedure TfrmNaklo.FormCreate(Sender: TObject);
begin
try
  FidCurrency := dmdEx.GetIdCurrencyUAH;
  qeNaklo.DefSql := sdsNaklo.CommandText;
  dmdEx.StartWaiting;
  dmdEx.OpenQuery(dmdEx.cdsNaklodetTip);
  dmdEx.OpenQuery(dmdEx.cdsNakloTip);
  dmdEx.OpenQuery(dmdEx.cdsVlad);
  dmdEx.OpenQuery(dmdEx.cdsClient);
  dmdEx.OpenQuery(dmdEx.cdsManager);
  dmdEx.OpenQuery(dmdEx.cdsTovarAll);

  //Инициализация настроек
  setT := TfrmSettings.Create(self);
  setT.actManagerOff.execute;

  SettingsManager := setT.CreatePlugin('TfmSettingsManager');

  setT.AddPlugin(SettingsManager);
  //менеджеры из зоны видимости
  SettingsManager.SetResultType(2);
  //SettingsManager.SetKeyValue(dmdEx.GetIdManager);

  SettingsVlad := setT.CreatePlugin('TfmSettingsVlad');
  SettingsVlad.SetResultType(2);
  setT.AddPlugin(SettingsVlad);

  SettingsClient := setT.CreatePlugin('TfmSettingsClient');
  setT.addplugin(SettingsClient);

  //Конец инициализации настроек
  FillSklad;
  FillTip;
  FillDate;
  ProcessSettings(true);
  //Конец инициализации спец-настроек 
  dmdEx.StopWaiting;
  frmNakloEdit := TfrmNakloEdit.Create(self);
  frmNakloEdit.dsNakloEdit.DataSet := cdsNaklo;
  frmNakloEdit.PrepareForRasxod;
  frmNakloDet := TfrmNaklodet.Create(self);
	frmNakloDet.dsNaklotEdit.dataset :=  cdsNaklot;
  frmNakloDet.dsNakloEdit.dataset :=  cdsNaklo;

  ProcessReportDesigner(ActionList1,MainMenu1,frRepNaklo);
except
  AssertInternal('D4263840-492C-49EC-AFEF-A63E44FA47D8');
end;
end;

procedure TfrmNaklo.qurNaklrCommit;
begin
  PostAndApplyOrCancel(cdsNaklo);
end;

procedure TfrmNaklo.actRefreshExecute(Sender: TObject);
begin
try
  dmdEx.StartWaiting;
	qurNaklrCommit;
	qeNaklo.Refresh;
  dmdEx.StopWaiting;
except
  AssertInternal('C1742518-B2F6-401C-A6C3-B3E760DC9467 '+cdsNaklo.CommandText);
end;
end;

procedure TfrmNaklo.FormDestroy(Sender: TObject);
begin
try
  dmdEx.CloseQuery(dmdEx.cdsNaklodetTip,false);
  dmdEx.CloseQuery(dmdEx.cdsNakloTip,false);
  dmdEx.CloseQuery(dmdEx.cdsVlad,false);
  dmdEx.CloseQuery(dmdEx.cdsClient,false);
  dmdEx.CloseQuery(dmdEx.cdsManager,false);
  dmdEx.CloseQuery(dmdEx.cdsTovarAll,false);


	frmNakloEdit.Free;
  frmNaklodet.Free;
except
  AssertInternal('C1F56324-D47F-4588-BE33-134E879A937D');
end;
end;

procedure TfrmNaklo.actGrid2ListShowExecute(Sender: TObject);
begin
  if cdsNaklo.Eof and cdsNaklo.Bof then begin
    MessageDlg('Создайте новую отгрузку',mtWarning,[mbok],0);
    abort;
  end;
  try
    if (cdsNaklot.FieldByName('ID_NAKLD').AsInteger = 0) then begin
      cdsNaklot.Insert;
    end else begin
      ShowDetail2;
    end;
  except
    AssertInternal('FF1AACF2-63AE-4AF0-92A7-71510B11DD20');
  end;
end;

//////////////////////////////////////////////
//  Процедура упорядочивания
///
procedure TfrmNaklo.Order;
begin
// Order2( qeNaklpt);
end;

procedure TfrmNaklo.actRecalcExecute(Sender: TObject);
begin
	Order;
	actCalculateSum.Execute;
end;

procedure TfrmNaklo.FormDeactivate(Sender: TObject);
begin
	qurNaklrCommit;
end;


procedure TfrmNaklo.actCalculateSumExecute(Sender: TObject);
begin
//  CalculateSum(qurNaklp,qurNaklpt );
end;

procedure TfrmNaklo.cdsNakloAfterInsert(DataSet: TDataSet);
var
  intGen : integer;
begin
  dmdEx.StartWaiting;
  intGen := dmdEx.GetGenValue('naklo_gen');
  cdsNaklo.FieldByName('id_nakl').AsInteger:= intGen;  //assign
  cdsNaklo.FieldByName('dat').AsDateTime := Date; //default date. time=0
  cdsNaklo.FieldByName('nalog_nds').AsFloat := dmdEx.GetNds ( Date );
  cdsNaklo.FieldByName('kurs').asFloat := 1.0000;
  cdsNaklo.FieldByName('id_sklad').asInteger := 0;
  cdsNaklo.FieldByName('id_manager').asInteger:=dmdEx.GetIdManager;
  cdsNaklo.FieldByName('id_currency').asInteger := FidCurrency;
  cdsNaklo.FieldByName('nds').AsFloat := 0;
	cdsNaklo.FieldByName('posted').asInteger := 0;
  cdsNaklo.FieldByName('tip').asInteger := 5; //отгрузка
  cdsNaklo.FieldByName('delmarked').asInteger := 0;
  cdsNaklo.FieldByName('blocked').asInteger := 0;  
  dmdEx.StopWaiting;
  ShowDetail1;
end;


procedure TfrmNaklo.cdsNaklotAfterInsert(DataSet: TDataSet);
var
  intGen : integer;
begin
  dmdEx.StartWaiting;
  intGen := dmdEx.GetGenValue('naklot_gen');
  cdsNaklot.FieldByName('id_nakld').AsInteger := intGen;
  cdsNaklot.FieldByName('id_nakl').AsInteger :=
    cdsNaklo.FieldByName('id_nakl').AsInteger;
  cdsNaklot.FieldByName('id_pos').asInteger := intNpp;
  cdsNaklot.FieldByName('cena').asFloat := 0;
  //По умолчанию вставляется первая колонка
  cdsNaklot.FieldByName('kodcn').asFloat := 1;
  cdsNaklot.FieldByName('kolotp').asFloat := 0;
  cdsNaklot.FieldByName('skidka').asFloat := 0;
  dmdEx.StopWaiting;
	ShowDetail2;
end;

procedure TfrmNaklo.cdsNaklotBeforeInsert(DataSet: TDataSet);
begin
  //ищем номер последней позиции
  cdsNaklot.Last;
  try
    intNpp:=cdsNaklot.fieldbyname('id_pos').asInteger;
  except
    intNpp:=0;
  end;
  inc(intNpp);
end;

procedure TfrmNaklo.btnInsertClick(Sender: TObject);
begin
  cdsNaklo.Insert;
end;

procedure TfrmNaklo.btnUpdateClick(Sender: TObject);
begin
  actGrid1ListShow.Execute;
end;

procedure TfrmNaklo.btnDeleteClick(Sender: TObject);
begin
  if (MessageDlg('Вы хотите удалить накладную?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
    cdsNaklo.Delete;
    qurNaklrCommit;
  end;
end;

procedure TfrmNaklo.cdsNaklotBeforeScroll(DataSet: TDataSet);
begin
try
//  PostAndApplyOrCancel (cdsNaklot);
{  if cdsNaklot.ChangeCount>0 then begin
    cdsNaklot.ApplyUpdates(0);
  end;
 }
  ApplyOrCancel (cdsNaklot);
except
  AssertInternal('12404786-1063-452D-B3F8-4F296F068A1E');
end;
end;

procedure TfrmNaklo.cdsNakloBeforeScroll(DataSet: TDataSet);
begin
try
  if cdsNaklo.ChangeCount >0 then begin
    cdsNaklo.ApplyUpdates(0);
  end;
except
  AssertInternal('BA048F7A-8F3A-4C7B-8101-465489CDEE0C');
end;
end;


procedure TfrmNaklo.dbgNaklotDblClick(Sender: TObject);
begin
  actGrid2ListShow.Execute;
end;

procedure TfrmNaklo.dbgNakloDblClick(Sender: TObject);
begin
  actGrid1ListShow.Execute;  
end;

procedure TfrmNaklo.actAfterCutOstatokExecute(Sender: TObject);
var
  frmRep: TfrmAfterCutOstatok;    //форма для отчёта по остаткам после отрезки
begin
  frmRep := TfrmAfterCutOstatok.Create(self);
  frmRep.ShowDetail (cdsNaklo.FieldByName('id_nakl').AsInteger);
	frmRep.Free;
end;


procedure TfrmNaklo.actPreviewExecute(Sender: TObject);
begin
try
  frRepNaklo.SelectPrinter;
  frRepNaklo.SelectPrinter;
  sdsRepNaklo.close;
	cdsRepNaklo.Close;
  cdsRepNaklo.Params.ParamByName('id_nakl').AsInteger :=
		cdsNaklo.fieldByName('id_nakl').AsInteger;
	cdsRepNaklo.Open;
  dmdEx.GetReport('RepNaklo.fr3',frRepNaklo);
  frRepNaklo.ShowReport;
except
  on E: Exception do begin
    showmessage (e.message);
  end;
end;
end;


procedure TfrmNaklo.dspNakloBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
begin
  if (ukDelete=UpdateKind) and (SourceDS.name='sdsNaklo') then begin
    Applied:=false;
    sdsDelmark.ParamByName('id_nakl').AsInteger:=
      DeltaDS.fieldByName('id_nakl').asInteger;
		dmdEx.ExecSQL(sdsDelmark);
    Applied:=true;
  end;
end;

procedure TfrmNaklo.actShowDeletedExecute(Sender: TObject);
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

//отображение удалённых накладных для отладки
procedure TfrmNaklo.ProcessShowDeleted;
begin
  if actShowDeleted.Checked then begin
		qeNaklo.SetSQL ('where','om.delmarked=1',8);
  end
  else begin
    qeNaklo.SetSQL ('where','om.delmarked=0',8);
  end;//checked
  qeNaklo.prepare;
end;

{показываем окно нижней детализации
разные окна для отгрузки, для порезки}
procedure TfrmNaklo.ShowDetail2;
begin
 //if not prohibited to user edit
 if dsNaklot.DataSet.Tag<>1 then begin
  dmdEx.StartWaiting;
	if (cdsNaklo.FieldByName('tip').asInteger = 5) then begin //отгрузки
    frmNaklodet.ShowDetail(
      cdsNaklo.fieldbyname('id_sklad').AsInteger,
      cdsNaklo.fieldbyname('posted').asInteger
    );
  end; //отгрузки
  if (cdsNaklo.FieldByName('tip').asInteger = 6) then begin //порезка
    frmNaklodet.ShowDetail(
      cdsNaklo.fieldbyname('id_sklad').AsInteger,
      cdsNaklo.fieldbyname('posted').asInteger
    );
  end;
  //oid хранения = 103
	if (cdsNaklo.FieldByName('tip').asInteger = 103) then begin //хранение
    frmNaklodet.ShowDetail(
      cdsNaklo.fieldbyname('id_sklad').AsInteger,
      cdsNaklo.fieldbyname('posted').asInteger
    );
  end;
	if (cdsNaklo.FieldByName('tip').asInteger = 30) then begin //недостача
    frmNaklodet.ShowDetail(
      cdsNaklo.fieldbyname('id_sklad').AsInteger,
      cdsNaklo.fieldbyname('posted').asInteger
    );
  end;
  RecountNakl;
  dmdEx.StopWaiting;
 end;//tag<>1
end;

procedure TfrmNaklo.RecountNakl;
begin
  qeNaklot.Refresh;
  dmdEx.CalculateSumNaklo(cdsNaklo,cdsNaklot);
end;

procedure TfrmNaklo.cdsNakloReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  showmessage(e.message);
  Action := raCancel;
end;

procedure TfrmNaklo.ProcessSettings(ProcessOnlySecurityMeasures:boolean=false);
begin
try
  ProcessSettingsVladClientManager(qeNaklo,setT,ProcessOnlySecurityMeasures);
  ProcessShowDeleted;
  self.Caption := UpdateCaptionVladClientManager('Отгрузки со склада:',setT);
  ProcessSklad;
  ProcessTip;
except
  AssertInternal('A10145AD-4810-40E2-92CE-C380AE4A9858');
end;
end;

procedure TfrmNaklo.cdsNaklotReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  showmessage (e.Message);
  Action := raCancel;
end;

procedure TfrmNaklo.actBlockExecute(Sender: TObject);
begin
  if (cdsNaklo.FieldByName('blocked').asInteger<>0) then begin
    if (MessageDlg('Вы хотите снять блокировку на изменения с отгрузки?',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
				cdsNaklo.Edit;
        cdsNaklo.FieldByName('blocked').asInteger:=0;
        cdsNaklo.Post;
        PostAndApplyOrCancel(cdsNaklo);
    end;
  end else begin
    if (MessageDlg('Вы хотите поставить блокировку на изменения для отгрузки?',
			 mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
        cdsNaklo.Edit;
        cdsNaklo.FieldByName('blocked').asInteger:=1;
        cdsNaklo.Post;
        PostAndApplyOrCancel(cdsNaklo);
    end;
  end;
end;

procedure TfrmNaklo.ShowDetail1;
begin
  if (frmNakloEdit.Visible = false)
   and (dsNaklo.DataSet.Tag<>1) then begin
    frmNakloEdit.PrepareForRasxod;
    frmNakloEdit.DisableSkladEdit(
      ((dsNaklot.DataSet.RecordCount > 0) or (dsNaklo.DataSet.FieldByName('nds').asFloat > 0)) and
      (dsNaklo.DataSet.State = dsEdit)
    );
    frmNakloEdit.ShowModal;
    RecountNakl;
  end;
end;

procedure TfrmNaklo.actOrderExecute(Sender: TObject);
begin
 { TODO : Упорядочить по таре }
end;

procedure TfrmNaklo.actUndeleteNaklExecute(Sender: TObject);
begin
  if actShowDeleted.Checked then begin
    dmdEx.UndeleteNaklo(TintegerField(dsNaklo.DataSet.FieldByName('delmarked')),actRefresh);
  end;
end;

procedure TfrmNaklo.actRealPriceOpenExecute(Sender: TObject);
var
  frmRealPrice :TfrmRealPrice;
begin
  if dsNaklo.DataSet.Eof and dsNaklo.DataSet.Bof then begin
     exit;
  end;
  if dsNaklo.DataSet.FieldByName('TIPCONST').AsString<>'Отгрузка' then begin
    MessageDlg('Тип накладной должен быть ''Отгрузка''',mtWarning,[mbOk],0);
    exit;
  end;
  if dsNaklo.DataSet.FieldByName('parent_id_nakl').IsNull then begin
    MessageDlg('Незаполено поле ''№расх накл''',mtWarning,[mbOk],0);
    exit;
  end;
  frmRealPrice := TfrmRealPrice.Create(Application);

  frmRealPrice.qeNaklr.SetSQL('where','om.id_nakl='+
    dsNaklo.DataSet.FieldByName('parent_id_nakl').AsString,5);
  frmRealPrice.actRefresh.execute;
end;

procedure TfrmNaklo.actRepNakloWeightExecute(Sender: TObject);
var
  frmRep: TfrmNakloWeight;    //форма для отчёта по остаткам после отрезки
begin
  frmRep := TfrmNakloWeight.Create(self);
  frmRep.ShowDetail (cdsNaklo.FieldByName('id_nakl').AsInteger);
end;

procedure TfrmNaklo.dbgNakloKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
try
  case key of
		vk_return :begin
      actGrid1ListShow.Execute;
		end; //vk_return
    vk_f8: begin
      if (MessageDlg('Вы хотите удалить накладную?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
        if (cdsNaklo.FieldByName('posted').asInteger=1) then begin
          showmessage('Нельзя удалить проведенную накладную');
        end
        else begin //ok to delete
          if not (cdsNaklo.bof and cdsNaklo.eof) then begin
            cdsNaklo.Delete;
          end;
          PostAndApply(cdsNaklo);
        end;   //if posted
      end; //if messagedlg
    end;//vk_f8
  end;//case
except
  AssertInternal('55A530A4-D853-4F4E-AD6C-4E152E681FEE');
end; //try
end;

procedure TfrmNaklo.dbgNaklotKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
		vk_return : begin
      actGrid2ListShow.Execute;
    end; //vk_return
    vk_f8: begin
      if (MessageDlg('Вы хотите удалить позицию?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
        if not (cdsNaklot.bof and cdsNaklot.eof) then begin
          cdsNaklot.Delete;
        end;
        PostAndApply(cdsNaklot);
      end;
    end;
	end; //case
end;


procedure TfrmNaklo.actMakeNaklrExecute(Sender: TObject);
begin
  if  cdsNaklo.Eof and cdsNaklo.Bof then begin
    exit;
  end;
try
  sdsMakeNaklo.Params.ParamByName('id_nakl_in').asInteger :=
    cdsNaklo.FieldByName('id_nakl').asInteger;
  try
    dmdEx.ExecSQL(sdsMakeNaklo,false);
  except
    on E:EDatabaseError do begin
      if AnsiContainsText(e.message,'Родительская расходная накладная уже существует') then begin
        MessageDlg ('Родительская расходная накладная уже существует',mtWarning,[mbOK],0);
        exit;
      end;
      raise;
    end
  end;
  //iTemp := sdsMakeNaklo.Params.ParamByName('id_nakl').asInteger;
  OpenDocument(self,
    sdsMakeNaklo.Params.ParamByName('id_nakl').asInteger,
    dmdEx.GetOidObjects('РАСХОДНЫЕ НАКЛАДНЫЕ',-100),
    0);
  dsNaklo.DataSet.Tag :=1;
  dsNaklo.DataSet.Edit;
  dsNaklo.DataSet.FieldByName('parent_id_nakl').asInteger :=
    sdsMakeNaklo.Params.ParamByName('id_nakl').asInteger;
  dsNaklo.DataSet.Post;
  dsNaklo.DataSet.Tag :=0;
except
  AssertInternal('E130E4C7-BE0E-44AC-9DCF-C1E18A68BF05');
end;
end;

procedure TfrmNaklo.actMakeSchetExecute(Sender: TObject);
var
  frmSchet : TfrmSchet;
  sTemp : string;
begin
  if  cdsNaklo.Eof and cdsNaklo.Bof then begin
    exit;
  end;
try
  sdsMakeSchet.Params.ParamByName('id_nakl_in').asInteger :=
    cdsNaklo.FieldByName('id_nakl').asInteger;
  dmdEx.ExecSQL(sdsMakeSchet,false);
  sTemp := sdsMakeSchet.Params.ParamByName('id_nakl').asString;
  frmSchet := TfrmSchet.Create (Application);
  frmSchet.qeNaklo.SetSQL(
      'where',
      'schet='+sTemp,
      5
    ); //только наш документ
  frmSchet.DefaultOpen;//Открытие данных
except
  AssertInternal('18B249D6-F0A0-4F9E-ABDA-899265B1AA00');
end;
end;

procedure TfrmNaklo.FillDate;
begin
  //
end;

procedure TfrmNaklo.FillSklad;
begin
  SettingsSkladTo := setT.CreatePlugin('TfmSettingsSklad');
  SettingsSkladTo.Name := 'fmSettingsSkladTo';
  SettingsSkladTo.SetLabelValue('Склад назначения');
  SettingsSkladTo.SetResultType(1);

  SettingsSklad := setT.CreatePlugin('TfmSettingsSklad');
  SettingsSklad.SetResultType(1);
  setT.addplugin(SettingsSklad);
  setT.addplugin(SettingsSkladTo);
end;

procedure TfrmNaklo.FillTip;
begin
  SettingsTipDetail := setT.CreatePlugin('TfmSettingsTipDetail');
  SettingsTipDetail.SetLabelValue ('Тип накладных');
  SettingsTipDetail.AddDetailTip('Недостача');
  SettingsTipDetail.AddDetailTip('Отгрузка');
  SettingsTipDetail.AddDetailTip('Порезка');
  SettingsTipDetail.AddDetailTip('Хранение');
  SettingsTipDetail.SetResultType(1);
  setT.AddPlugin(SettingsTipDetail);
end;


procedure TfrmNaklo.ProcessSklad;
var
  sTemp : string;
begin
  sTemp := setT.GetPluginResult('fmSettingsSklad');
  if (sTemp<>'') then begin
    qeNaklo.SetSql('where','om.id_sklad='+sTemp,5);
  end else begin
    qeNaklo.SetSql('where','',5);
  end;
  sTemp := setT.GetPluginResult('fmSettingsSkladTo');
  if (sTemp<>'') then begin
    qeNaklo.SetSql('where','om.id_sklad_to='+sTemp,6);
  end else begin
    qeNaklo.SetSql('where','',6);
  end;
end;

procedure TfrmNaklo.ProcessTip;
var
  sTemp : string;
  iCase : integer;
begin
try
  sTemp := setT.GetPluginResult('fmSettingsTipDetail');
  iCase := strtoint(sTemp);
  case iCase of
    -1: begin
      qeNaklo.SetSql('where','',7);
     end;
    0:  begin
      qeNaklo.SetSql('where','om.tip=30',7);
    end;
    1: begin
      qeNaklo.SetSql('where','om.tip=5',7);
    end;
    2: begin
      qeNaklo.SetSql('where','om.tip=6',7);
    end;
    3: begin
      qeNaklo.SetSQL('where','om.tip=103',7);
    end;
  end;
except
  AssertInternal('337DAF12-E160-4334-8A24-322959B68313');
end;
end;

procedure TfrmNaklo.actMakeNakloTopExecute(Sender: TObject);
var
  slSchet : TStringList;
begin
  if cdsNaklo.Eof and cdsNaklo.Bof then begin
    MessageDlg('Не выбран документ',mtWarning,[mbOk],0);
    exit;
  end;
  slSchet := TStringList.Create;
  slSchet.Add('id_izg='+cdsNaklo.FieldByName('id_izg').asString);
  slSchet.Add('id_zak='+cdsNaklo.FieldByName('id_zak').asString);
  slSchet.Add('id_manager='+cdsNaklo.FieldByName('id_manager').asString);
  slSchet.Add('id_sklad='+cdsNaklo.FieldByName('id_sklad').asString);
  slSchet.Add('id_sklad_to='+cdsNaklo.FieldByName('id_sklad_to').asString);
  slSchet.Add('tip='+cdsNaklo.FieldByName('tip').asString);
  slSchet.Add('kurs='+cdsNaklo.FieldByName('kurs').asString);
  //запрещение пользовательского редактирования
  cdsNaklo.Tag:=1;
  cdsNaklo.Insert;
  cdsNaklo.FieldByName('id_izg').asInteger := strtoint(slSchet.Values['id_izg']);
  cdsNaklo.FieldByName('id_zak').asInteger := strtoint(slSchet.Values['id_zak']);
  cdsNaklo.FieldByName('id_manager').asInteger := strtoint(slSchet.Values['id_manager']);
  cdsNaklo.FieldByName('id_sklad').asInteger := strtoint(slSchet.Values['id_sklad']);
  if  slSchet.Values['id_sklad_to']<>'' then begin
    cdsNaklo.FieldByName('id_sklad_to').asInteger := strtoint(slSchet.Values['id_sklad_to']);
  end else begin
    cdsNaklo.FieldByName('id_sklad_to').Clear;
  end;
  cdsNaklo.FieldByName('tip').asInteger := strtoint(slSchet.Values['tip']);
  if slSchet.Values['parent_id_nakl']<>'' then begin
    cdsNaklo.FieldByName('parent_id_nakl').asInteger := strtoint(slSchet.Values['parent_id_nakl']);
  end else begin
    cdsNaklo.FieldByName('parent_id_nakl').Clear;
  end;
  cdsNaklo.FieldByName('kurs').asFloat := strtofloat(slSchet.Values['kurs']);
  cdsNaklo.Post;
  //разрешение дальнейшего редактирования
  cdsNaklo.Tag:=0;
  ApplyOrCancel(cdsNaklo);
end;

procedure TfrmNaklo.actShowOtpravkaExecute(Sender: TObject);
var
  frmFrom : TfrmOtpravka;
begin
  if dsNaklo.DataSet.Eof and dsNaklo.DataSet.Bof then begin
     exit;
  end;
  if (dsNaklo.DataSet.FieldByName('TIPCONST').AsString <> 'Отгрузка')
    and (dsNaklo.DataSet.FieldByName('TIPCONST').AsString <>'Хранение')
  then begin
    MessageDlg('Тип накладной должен быть ''Отгрузка'' или ''Хранение''',mtWarning,[mbOk],0);
    exit;
  end;
  frmFrom := TfrmOtpravka.Create(Application);
  frmFrom.qeSklost.SetSQL(
    'where',
    'id_nakl=(select id_nakl from otpravkit_vw ot where ot.id_pos='+
    dsNaklo.DataSet.FieldByName('id_nakl').asString+')',
    0);
  frmFrom.qeSklost.Refresh;
  //  DefaultOpen;
  frmFrom.dsSklostt.dataset.Locate('id_pos',dsNaklo.DataSet.FieldByName('id_nakl').asString,[]);
end;

procedure TfrmNaklo.actMakeNaklPeremExecute(Sender: TObject);
//var
  //sTemp : string;
begin
  if  cdsNaklo.Eof and cdsNaklo.Bof then begin
    exit;
  end;
try
  sdsMakeNaklPeremBux.Params.ParamByName('id_nakl_in').asInteger :=
    cdsNaklo.FieldByName('id_nakl').asInteger;
  dmdEx.ExecSQL(sdsMakeNaklPeremBux,false);
  //sTemp := sdsMakeNaklPeremBux.Params.ParamByName('id_nakl').asString;
  OpenDocument(self,
    sdsMakeNaklPeremBux.Params.ParamByName('id_nakl').asInteger,
    dmdEx.GetOidObjects('БУХГАЛТЕРСКОЕ ПЕРЕМЕЩЕНИЕ',-100),
    0);
except
  AssertInternal('B22FE621-ED3D-4ED0-ACAF-B8EB5D1C635E');
end;
end;

procedure TfrmNaklo.actShowNaklrExecute(Sender: TObject);
begin
  if dsNaklo.DataSet.Eof and dsNaklo.DataSet.Bof then begin
     exit;
  end;
  OpenDocument(self,
    dsNaklo.DataSet.FieldByName('parent_id_nakl').asInteger,
    dmdEx.GetOidObjects('РАСХОДНЫЕ НАКЛАДНЫЕ',-100),
    0);
end;

procedure TfrmNaklo.actShowRepDependNakloExecute(Sender: TObject);
var
  INakloDependImp : INakloDepend;
begin
  INakloDependImp := TfrmRepNakloDepend.Create(self);
  INakloDependImp._addRef;
  INakloDependImp.ShowDetail(dsNaklo.DataSet.FieldByName('id_nakl').asInteger);
end;

function TfrmNaklo.CheckForXranenie(iNakl,iTip,DefaultAnswer: integer): boolean;
var
  INakloDependImp : INakloDepend;
  iRecordCount : integer;
begin
  if iTip<>103 then begin
    Result :=true;
  end else begin
    INakloDependImp := TfrmRepNakloDepend.Create(self);
    //INakloDependImp._AddRef;
    iRecordCount :=
      INakloDependImp.ShowDetail(iNakl);
    INakloDependImp:=nil;
    if iRecordCount<=0 then begin
      Result:=true;
    end else begin
      if DefaultAnswer=0 then begin
        if (MessageDlg('У данной накладной на хранение есть зависимые отгрузки. '+
         'Вы уверены что хотите её вернуть?',
           mtConfirmation, [mbYes, mbNo], 0) = mrYes)
        then begin
          Result :=true;
        end else begin
          Result:=false;
        end;
      end else begin //if DefaultAnswer=0
        //default noniteractive result
        Result :=true;
        if DefaultAnswer=mrNo then begin
          Result :=false;
        end;
      end;  //if DefaultAnswer=0
    end;  //if iRecordCount<=0
  end; //if iTip<>103
end;

procedure TfrmNaklo.actUnpostExecute(Sender: TObject);
begin
try
 if (cdsNaklo.FieldByName('posted').asInteger = 1) then begin
  if (MessageDlg('Вы хотите вернуть отгрузку на склад?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
    try
      dmdEx.StartWaiting;
      if CheckForXranenie(
        cdsNaklo.fieldbyname('id_nakl').AsInteger,
        cdsNaklo.fieldbyname('tip').AsInteger)
      then begin
        sdsUNPost.Params[0].AsInteger :=
          cdsNaklo.fieldbyname('id_nakl').AsInteger;
        dmdEx.ExecSQL(sdsUNPost,false);
        cdsNaklo.edit;
        cdsNaklo.FieldByName('posted').AsInteger := 0;
        cdsNaklo.Post;
        cdsNaklo.ApplyUpdates(0);
        dmdEx.StopWaiting;
      end;
    except
      on E:EDatabaseError do begin
        dmdEx.StopWaiting;
        if AnsiStartsText('no permission', e.message) then begin
          MessageDlg ('Вы не имеете права проводить накладные',mtWarning,[mbOK],0);
        end
        else begin
          showmessage (e.message);
        end; //if
      end;
		end; //try
  end; //if
 end else begin //if posted
   MessageDlg ('Нельзя возвратить не проведенную накладную',mtWarning,[mbOK],0);
 end; //if posted
except
  AssertInternal('0AF05D43-20F4-468E-9298-3469C7031860');
end;
end;

procedure TfrmNaklo.actPostExecute(Sender: TObject);
begin
  dmdEx.PostNakl(
    TIntegerField(cdsNaklo.FieldByName('posted')),
    sdsPost,
    TIntegerField(cdsNaklo.FieldByName('id_nakl')),
    not actPost.Checked); 
end;

procedure TfrmNaklo.ProcessLowerPanelVisible;
begin
  if splitter1.top>self.ClientHeight then begin
    //self.Height:=parent.ClientHeight;
    Panel2.Height:=self.ClientHeight-dbgNaklot.Constraints.MinHeight;
  end;
end;

procedure TfrmNaklo.FormShow(Sender: TObject);
begin
  ProcessLowerPanelVisible;
end;

procedure TfrmNaklo.cdsNaklotSKIDKAChange(Sender: TField);
begin
  if (not Semaphore) and (not frmNaklodet.Visible) then begin
    Semaphore := true;
    FromCenaRecount(5,dsNaklo.DataSet,dsNaklot.DataSet);
    Semaphore := false;
  end;
end;

procedure TfrmNaklo.actSetColumnValueExecute(Sender: TObject);
begin
  if dbgNaklot.SelectedField.FieldName='SKIDKA' then begin
    dmdEx.ColumnSet(dbgNaklot);
    RecountNakl;
  end else begin
    Showmessage('Заполнить значением возможно только поле "Скидка"');
  end;
end;

procedure TfrmNaklo.cdsNaklotCalcFields(DataSet: TDataSet);
begin
  if not Semaphore and (DataSet.state =dsInternalCalc) then begin
    Semaphore := true;
    FromCenaRecount(1,dsNaklo.DataSet,dsNaklot.DataSet,1);
    Semaphore := false;
  end;
end;

end.

