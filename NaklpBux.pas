unit NaklpBux;

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

	StrUtils,
	RecError ,
	untSettings,
	ATSAssert,
  PropFilerEh,
  UnfFilter,
  PropStorageEh,
  GridsEh,
  frxClass,
  frxDBSet,
    
	Registry,
  NaklpBuxEdit,
  NaklpBuxDet,
  NaklpbuxZatraty,
  SettingsPlugin, //TfmSettingsPlugin
  Variants //vararrayhighbound

  //SettingsPost //TfmSettingsPost

  ;


type
	TfrmNaklpBux = class(TForm)
		ActionList1: TActionList;
		actSettings: TAction;
		actGrid1ListShow: TAction;
		actRefresh: TAction;
		actGrid2ListShow: TAction;
		actRecalc: TAction;
		actAutoRecalc: TAction;
		actPreview: TAction;
		actPrint: TAction;
		actSchet: TAction;
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
    cdsNakloDELMARKED: TSmallintField;
    N2: TMenuItem;
    PopupMenu1: TPopupMenu;
    actShowDeleted: TAction;
    frdRepNaklo: TfrxDBDataset;
    dspRepNaklo: TDataSetProvider;
    cdsRepNaklo: TClientDataSet;
		N6: TMenuItem;
    sdsDelmark: TSQLDataSet;
    actBlock: TAction;
    N7: TMenuItem;
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
    sdsNakloDELMARKED: TSmallintField;
		sdsNakloBLOCKED: TSmallintField;
    qeNaklot: TQueryExtender;
		PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    UnfFilter1: TUnfFilter;
    UnfFilter2: TUnfFilter;
    PopupMenu2: TPopupMenu;
    actOrder: TAction;
    actUndeleteNakl: TAction;
    N8: TMenuItem;
    dspRepZatratyBux: TDataSetProvider;
    cdsRepZatratyBux: TClientDataSet;
    cdsNakloSKLAD: TStringField;
    cdsNakloCURRENCY: TStringField;
    sdsGetKurs: TSQLDataSet;
    sdsGetKursKURS: TFloatField;
    sdsNakloPARENT_ID_NAKL: TIntegerField;
    cdsNakloPARENT_ID_NAKL: TIntegerField;
    sdsNakloPARENT_ID: TStringField;
    cdsNakloPARENT_ID: TStringField;
    actSpecOst: TAction;
    N3: TMenuItem;
    N4: TMenuItem;
    actAddDet: TAction;
    N5: TMenuItem;
    actShowZatr: TAction;
    N9: TMenuItem;
    sdsNakloZATRATY: TFMTBCDField;
    cdsNakloZATRATY: TFMTBCDField;
    actSpecList: TAction;
    sdsNaklotID_SEBEST: TIntegerField;
    cdsNaklotID_SEBEST: TIntegerField;
    sdsNaklotPARENT_ID: TStringField;
    cdsNaklotPARENT_ID: TStringField;
    actChangeSpecForPosit: TAction;
    actChangeSpecForPosit1: TMenuItem;
    actShowNaklp: TAction;
    N11: TMenuItem;
    N12: TMenuItem;
    sdsSebestRecount: TSQLDataSet;
    actSebestRecount: TAction;
    N13: TMenuItem;
    N14: TMenuItem;
    actDetAddSum: TAction;
    sdsNakloID_CURRENCY_TO: TIntegerField;
    sdsNakloNDS_FROM: TFMTBCDField;
    sdsNakloKURS_INDIRECT: TSmallintField;
    cdsNakloID_CURRENCY_TO: TIntegerField;
    cdsNakloNDS_FROM: TFMTBCDField;
    cdsNakloKURS_INDIRECT: TSmallintField;
    cdsNakloCURRENCY_TO: TStringField;
    sdsRepNaklo: TSQLDataSet;
    cdsRepNakloID_CURRENCY_TO: TIntegerField;
    cdsRepNakloTRANSH_IN_CURRENCY: TFloatField;
    cdsRepNakloKURS_NBU: TFloatField;
    cdsRepNakloTRANSH_IN_GRN: TFloatField;
    cdsRepNakloCURRENCY: TStringField;
    sdsRepZatratyBux: TSQLDataSet;
    cdsRepZatratyBuxNAME: TStringField;
    cdsRepZatratyBuxNDS: TFMTBCDField;
    actDesign: TAction;
    N15: TMenuItem;
    frdZatraty: TfrxDBDataset;
    frdNaklo: TfrxDBDataset;
    sdsRepBux: TSQLDataSet;
    dspRepBux: TDataSetProvider;
    cdsRepBux: TClientDataSet;
    cdsRepBuxID_POS: TIntegerField;
    cdsRepBuxID_TOVAR: TIntegerField;
    cdsRepBuxCENA: TFloatField;
    cdsRepBuxKOLOTP: TFloatField;
    cdsRepBuxNDS: TFloatField;
    frdBux: TfrxDBDataset;
    cdsRepBuxTOVAR: TStringField;
    actPreviewBux: TAction;
    N16: TMenuItem;
    actDesignBux: TAction;
    N17: TMenuItem;
    cdsNakloIZGFULLNAME: TStringField;
    cdsNakloZAKFULLNAME: TStringField;
    Curr2StrUA1: TCurr2StrRU;
    cdsRepBuxSUMNDS: TAggregateField;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    actSpecOst2: TAction;
    N21: TMenuItem;
    actShowNaklpOst: TAction;
    N22: TMenuItem;
    N23: TMenuItem;
    frdNaklot: TfrxDBDataset;
    actSebestRecountBux: TAction;
    N24: TMenuItem;
    N25: TMenuItem;
    actPost: TAction;
    actUnpost: TAction;
    frRepNaklpbuxZatraty: TfrxReport;
    sdsNakloID_XOZ_OPER: TIntegerField;
    cdsNakloID_XOZ_OPER: TIntegerField;
    sdsXozoper: TSQLDataSet;
    dspXozOper: TDataSetProvider;
    cdsXozOper: TClientDataSet;
    cdsXozOperOID: TIntegerField;
    cdsXozOperNAME: TStringField;
    cdsXozOperFULLNAME: TStringField;
    dsXozOper: TDataSource;
    cdsNakloXOZ_OPER: TStringField;
    frRepNaklpbuxSebest: TfrxReport;
    sdsNakloDOV: TStringField;
    sdsNakloDDO: TSQLTimeStampField;
    sdsNakloLICO: TStringField;
    cdsNakloDOV: TStringField;
    cdsNakloDDO: TSQLTimeStampField;
    cdsNakloLICO: TStringField;
    actMakeVozvratPost: TAction;
    N26: TMenuItem;
    N27: TMenuItem;
    sdsMakeVozvrat: TSQLDataSet;
    sdsNakloID_VYGRUZKA: TIntegerField;
    cdsNakloID_VYGRUZKA: TIntegerField;
    cdsNakloREYS_NOMER_AVTO: TStringField;
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
		procedure cdsNakloAfterInsert(DataSet: TDataSet);
    procedure cdsNaklotAfterInsert(DataSet: TDataSet);
    procedure cdsNaklotBeforeInsert(DataSet: TDataSet);
		procedure cdsNaklotBeforeScroll(DataSet: TDataSet);
		procedure cdsNakloBeforeScroll(DataSet: TDataSet);
    procedure dbgNaklotDblClick(Sender: TObject);
    procedure dbgNakloDblClick(Sender: TObject);
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
    procedure dbgNakloKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgNaklotKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cdsNakloID_CURRENCYChange(Sender: TField);
    procedure cdsNakloDATChange(Sender: TField);
    procedure dspNakloGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure actSpecOstExecute(Sender: TObject);
    procedure actAddDetExecute(Sender: TObject);
    procedure actShowZatrExecute(Sender: TObject);

    procedure cdsNaklotCENANDSChange(Sender: TField);
    procedure cdsNaklotKOLOTPChange(Sender: TField);
    procedure cdsNaklotSUMAChange(Sender: TField);
    procedure cdsNaklotSUMANDSChange(Sender: TField);
    procedure cdsNaklotCENAChange(Sender: TField);
    procedure cdsNaklotCalcFields(DataSet: TDataSet);
    procedure cdsNaklotAfterDelete(DataSet: TDataSet);
    procedure actSpecListExecute(Sender: TObject);
    procedure actChangeSpecForPositExecute(Sender: TObject);
    procedure dspNaklotGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure cdsNakloPARENT_ID_NAKLChange(Sender: TField);
    procedure actShowNaklpExecute(Sender: TObject);
    procedure actSebestRecountExecute(Sender: TObject);
    procedure actDetAddSumExecute(Sender: TObject);
    procedure actDesignExecute(Sender: TObject);
    procedure actDesignBuxExecute(Sender: TObject);
    procedure actPreviewBuxExecute(Sender: TObject);
    procedure frRepNaklpbuxSebestGetValue(const ParName: String;
      var ParValue: Variant);
    procedure dbgNakloTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure dbgNakloTitleClick(Column: TColumnEh);
    procedure actSpecOst2Execute(Sender: TObject);
    procedure actShowNaklpOstExecute(Sender: TObject);
    procedure actSebestRecountBuxExecute(Sender: TObject);
    procedure actPostExecute(Sender: TObject);
    procedure actUnpostExecute(Sender: TObject);
    procedure actMakeVozvratPostExecute(Sender: TObject);

	private
		intNpp : integer; //номер позиции по порядку
		frmEdit : TfrmNaklpBuxEdit;
		frmDet : TfrmNaklpBuxDet;
    FiTip : integer;  //oid приходных накладных
    FiSklad : integer;// номер склада укк
    Semaphore : boolean;
    SettingsPost : TfmSettingsPlugin;
    //Post;
    FidCurrencyUAH : integer;
		procedure ShowDetail2;
		function ShowDetail1:integer;
		procedure ProcessShowDeleted;
		procedure qurNaklrCommit;
//		procedure Order;
    procedure RecountNakl;
    function ShowNaklrList : integer;
    procedure FillSettings;

	public
		{ Public declarations }
		setT : TfrmSettings;
    procedure DefaultStartup;
		procedure ProcessSettings;
    function DefaultOpen:boolean;
    procedure CreateDocFromMem(slHead:TStringList);

	end;

  procedure ProcessSpecChange (dbgNaklot: TDBGridEh;param:variant;Object1:Pointer=nil);
var
	frmNaklpBux: TfrmNaklpBux;

implementation

{$R *.dfm}

uses

  SpecOst, //TfrmSpecOst
  DetSelect, //TfrmDetSelect
  Spec,
  untNaklrList,
  NaklpOstDet, //TfrmNaklpOstDet
  //untNaklp // TfrmNaklp
  SkladAux, //OpenDocument
  DesignReport ////ProcessReportDesigner
  ;



procedure TfrmNaklpBux.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	Action := caFree;
end;

procedure TfrmNaklpBux.actSettingsExecute(Sender: TObject);
begin
  actSettings.checked := setT.ProcessSettingsChange2(DefaultOpen);
end;

procedure TfrmNaklpBux.actGrid1ListShowExecute(Sender: TObject);
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

procedure TfrmNaklpBux.dbgNaklrDblClick(Sender: TObject);
begin
  actGrid1ListShow.Execute;
end;

procedure TfrmNaklpBux.DefaultStartup;
begin
try
  setT.IDManager:=0; // all
  setT.SetPeriod(2);
  //setT.LoadProperties('TfrmSettings_NaklpBux');
  ProcessSettings;
  DefaultOpen;
except
  AssertInternal('3732FE67-BE35-4B68-8856-01BA9060A04E');
end;
end;

function TfrmNaklpBux.DefaultOpen:boolean;
begin
  ProcessSettings;
  Result:=DefaultOpenInputForm(qeNaklo);
end;

procedure TfrmNaklpBux.FormCreate(Sender: TObject);
begin
try
  dmdEx.StartWaiting;

  dmdEx.OpenQuery(dmdEx.cdsVlad);
  dmdEx.OpenQuery(dmdEx.cdsPost);
  dmdEx.OpenQuery(dmdEx.cdsManager);
  dmdEx.OpenQuery(dmdEx.cdsTovarAll);
  dmdEx.OpenQuery(dmdEx.cdsTovarAllND);
  dmdEx.OpenQuery(dmdEx.cdsSklads);
  FillSettings;
	qeNaklo.DefSql := sdsNaklo.CommandText;

	ProcessShowDeleted;
  
  dmdEx.StopWaiting;
  frmEdit := TfrmNaklpBuxEdit.Create(self);
  frmEdit.dsNakloEdit.DataSet := cdsNaklo;

  frmDet := TfrmNaklpBuxDet.Create(self);
	frmDet.dsNaklotEdit.dataset :=  cdsNaklot;

  FiTip := dmdEx.GetOidObjects('ПРИХОДНЫЕ НАКЛАДНЫЕ',-100);
  FiSklad := dmdEx.GetOidObjects('ТИП НАЗВАНИЯ СКЛАДОВ',-100);
  FiSklad := dmdEx.GetOidObjects('УКК Склад',FiSklad);
  FidCurrencyUAH := dmdEx.GetIdCurrencyUAH;
  frmEdit.FidCurrencyUAH := FidCurrencyUAH;
  ProcessReportDesigner(ActionList1,MainMenu1,frRepNaklpbuxZatraty);
  ProcessReportDesigner(ActionList1,MainMenu1,frRepNaklpbuxSebest);
except
  AssertInternal('E69CC95E-E261-4389-801D-6A0E50FC8736');
end;
end;

procedure TfrmNaklpBux.qurNaklrCommit;
begin
  PostAndApplyOrCancel(cdsNaklo);
end;

procedure TfrmNaklpBux.actRefreshExecute(Sender: TObject);
begin
try
  dmdEx.StartWaiting;
	qurNaklrCommit;
	qeNaklo.Refresh;
  dmdEx.StopWaiting;
except
  AssertInternal('FDA31B8B-F0AE-4CA0-87FF-9F81D08B92C0');
end;
end;

procedure TfrmNaklpBux.FormDestroy(Sender: TObject);
begin
try
  dmdEx.CloseQuery(dmdEx.cdsVlad,false);
  dmdEx.CloseQuery(dmdEx.cdsPost,false);
  dmdEx.CloseQuery(dmdEx.cdsManager,false);
  dmdEx.CloseQuery(dmdEx.cdsTovarAll,false);
  dmdEx.CloseQuery(dmdEx.cdsSklads,false);
  dmdEx.CloseQuery(dmdEx.cdsTovarAllND,false);
	frmEdit.Free;
  frmDet.Free;
  setT.Free;
except
  AssertInternal('6F6CE56C-B6D2-4461-B6A9-F4E0FC192E09');
end;
end;

procedure TfrmNaklpBux.actGrid2ListShowExecute(Sender: TObject);
begin
  if (cdsNaklot.FieldByName('ID_NAKLD').AsInteger = 0) then begin
    cdsNaklot.Insert;
  end else begin
		ShowDetail2;
  end;
end;

//////////////////////////////////////////////
//  Процедура упорядочивания
///
{
procedure TfrmNaklpBux.Order;
begin
// Order2( qeNaklpt);
end;
}

procedure TfrmNaklpBux.actRecalcExecute(Sender: TObject);
begin
	//Order;
	//actCalculateSum.Execute;
end;

procedure TfrmNaklpBux.FormDeactivate(Sender: TObject);
begin
	qurNaklrCommit;
end;

procedure TfrmNaklpBux.cdsNakloAfterInsert(DataSet: TDataSet);
var
  intGen, iManager : integer;
begin
  dmdEx.StartWaiting;
  intGen := dmdEx.GetGenValue('naklo_gen');
  DataSet.FieldByName('id_nakl').AsInteger:= intGen;  //assign
  DataSet.FieldByName('dat').AsDateTime := Date; //default date. time=0
  DataSet.FieldByName('nalog_nds').AsFloat := dmdEx.GetNds ( Date );
  DataSet.FieldByName('kurs').asFloat := 1.0000;
  DataSet.FieldByName('id_sklad').asInteger := 0;
  DataSet.FieldByName('nds').AsFloat := 0;
	DataSet.FieldByName('posted').asInteger := 0;
  DataSet.FieldByName('delmarked').asInteger := 0;
  DataSet.FieldByName('blocked').asInteger := 0;
  DataSet.FieldByName('id_sklad').asInteger := FiSklad;
  DataSet.FieldByName('zatraty').AsFloat := 0;
  DataSet.FieldByName('nds_from').AsFloat := 0;
  DataSet.FieldByName('id_currency').asInteger := FidCurrencyUAH;
  DataSet.FieldByName('id_currency_to').asInteger := FidCurrencyUAH;
  DataSet.FieldByName('kurs').asFloat := 1;
  DataSet.FieldByName('kurs_indirect').asInteger := 0;
  DataSet.FieldByName('id_xoz_oper').asInteger :=
    dsXozOper.Dataset.Lookup('name','ПРИХОДНАЯ БУХ НАКЛАДНАЯ НА ТОВАР','oid');
  iManager := dmdEx.GetIdManager;
  if iManager<>0 then begin
    DataSet.FieldByName('id_manager').asInteger := iManager;
  end;
//  DataSet.FieldByName('id_zak').asInteger := 0;
  dmdEx.StopWaiting;
  ShowDetail1;
end;


procedure TfrmNaklpBux.cdsNaklotAfterInsert(DataSet: TDataSet);
var
  intGen : integer;
begin
  if cdsNaklo.FieldByName('id_nakl').AsInteger=0 then begin
    if cdsNaklo.Eof and cdsNaklo.Bof then begin
      messagedlg('Не выбран документ',mtWarning,[mbOK],0);
      abort;
    end;
  end;
  dmdEx.StartWaiting;
  intGen := dmdEx.GetGenValue('naklot_gen');
  DataSet.FieldByName('id_nakld').AsInteger := intGen;
  DataSet.FieldByName('id_nakl').AsInteger :=
    cdsNaklo.FieldByName('id_nakl').AsInteger;
  DataSet.FieldByName('id_pos').asInteger := intNpp;
  DataSet.FieldByName('cena').asFloat := 0;
  DataSet.FieldByName('kolotp').asFloat := 0;
  DataSet.FieldByName('skidka').asFloat := 0;
  if cdsNaklo.FieldByName('parent_id_nakl').AsInteger<>0 then begin
    DataSet.FieldByName('id_sebest').asInteger :=
      cdsNaklo.FieldByName('parent_id_nakl').AsInteger;
    Dataset.FieldByName('parent_id').asString :=
      cdsNaklo.FieldByName('parent_id').AsString;
  end;
  dmdEx.StopWaiting;
	ShowDetail2;
end;

procedure TfrmNaklpBux.cdsNaklotBeforeInsert(DataSet: TDataSet);
begin
  if PostAndApply(dsNaklo.DataSet)<>0 then begin
    abort;
  end;
  //ищем номер последней позиции
  DataSet.Last;
  try
    intNpp:=DataSet.fieldbyname('id_pos').asInteger;
  except
    intNpp:=0;
  end;
  inc(intNpp);
end;



procedure TfrmNaklpBux.cdsNaklotBeforeScroll(DataSet: TDataSet);
begin
try
  ApplyOrCancel (Dataset);
except
  AssertInternal('5D22C051-79E5-4B0B-9517-8E5B2754C1F8');
end;
end;

procedure TfrmNaklpBux.cdsNakloBeforeScroll(DataSet: TDataSet);
begin
try
  ApplyOrCancel (Dataset);
//  if cdsNaklo.ChangeCount >0 then begin
//    cdsNaklo.ApplyUpdates(0);
//  end;
except
  AssertInternal('BB8DE88F-3FA9-4C61-8D1B-82500D64440D');
end;
end;


procedure TfrmNaklpBux.dbgNaklotDblClick(Sender: TObject);
begin
  actGrid2ListShow.Execute;
end;

procedure TfrmNaklpBux.dbgNakloDblClick(Sender: TObject);
begin
  actGrid1ListShow.Execute;
end;


procedure TfrmNaklpBux.actPreviewExecute(Sender: TObject);
begin
try
  with cdsRepNaklo do begin
    Close;
	  Params.ParamByName('id_nakl').AsInteger :=
		  cdsNaklo.fieldByName('id_nakl').AsInteger;
	  Open;
  end;
  with cdsRepZatratyBux do begin
    Close;
	  Params.ParamByName('id_nakl').AsInteger :=
		  cdsNaklo.fieldByName('id_nakl').AsInteger;
	  Open;
  end;
  dmdEx.GetReport('NaklpBuxZatraty.fr3',frRepNaklpbuxZatraty);
  frRepNaklpbuxZatraty.ShowReport;
except
  on E: Exception do begin
    showmessage (e.message);
  end;
end;
end;


procedure TfrmNaklpBux.dspNakloBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
begin
  if (ukDelete=UpdateKind) and (SourceDS.name='sdsNaklo') then begin
    Applied:=false;
    sdsDelmark.ParamByName('oid').AsInteger:=
      DeltaDS.fieldByName('id_nakl').asInteger;
		dmdEx.ExecSQL(sdsDelmark,false);
    Applied:=true;
  end;
end;

procedure TfrmNaklpBux.actShowDeletedExecute(Sender: TObject);
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
procedure TfrmNaklpBux.ProcessShowDeleted;
begin
  if actShowDeleted.Checked then begin
		qeNaklo.SetSQL ('where','n.delmarked=1',3);
  end
  else begin
    qeNaklo.SetSQL ('where','n.delmarked=0',3);
  end;//checked
  qeNaklo.prepare;
end;

{показываем окно нижней детализации
разные окна для отгрузки, для порезки}
procedure TfrmNaklpBux.ShowDetail2;
begin
 //if not prohibited to user edit
 if dsNaklot.DataSet.Tag<>1 then begin
  dmdEx.StartWaiting;
  frmDet.ShowDetail(
      cdsNaklo.fieldbyname('posted').asInteger);
  RecountNakl;
  dmdEx.StopWaiting;
 end;//tag<>1
end;

procedure TfrmNaklpBux.RecountNakl;
begin
  dmdEx.CalculateSumNaklo(cdsNaklo,cdsNaklot,2);
end;

procedure TfrmNaklpBux.cdsNakloReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  showmessage(e.message);
  Action := raCancel;
end;

procedure TfrmNaklpBux.ProcessSettings;
var
  sTemp : string;
begin
try

    if (setT.IDManager<>0) then begin
      qeNaklo.SetSQL('where',
				'n.id_manager='+ inttostr(setT.IDManager),0);
    end
    else begin
      qeNaklo.SetSQL('where',
        '',0);
    end;
    qeNaklo.SetSQL('where',
      'n.dat>='+ QuotedStr(datetostr(setT.DateFrom)),1);
    qeNaklo.SetSQL('where',
      'n.dat<='+ QuotedStr(datetostr(setT.DateTo))  ,2);

    sTemp := setT.GetPluginResult('fmSettingsPost');
    if sTemp<>'' then begin
      qeNaklo.SetSQL('where',
        'n.id_izg='+sTemp, 4);
    end else begin
      qeNaklo.SetSQL('where','', 4);
    end;
    qeNaklo.Prepare;

    self.Caption :='Приходные накладные. '
      +'Менеджер: '+setT.Manager + '. Период: c ' + datetostr (setT.DateFrom)
      + ' по '+ datetostr(setT.DateTo)+ '. Поставщик: '+
     setT.GetPluginTextResult('fmSettingsPost');
except
  AssertInternal('5D48F47A-04C8-4B2D-85CB-45349AF989E1');
end;
end;

procedure TfrmNaklpBux.cdsNaklotReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  showmessage (e.Message);
  Action := raCancel;
end;

procedure TfrmNaklpBux.actBlockExecute(Sender: TObject);
begin
  if (cdsNaklo.FieldByName('blocked').asInteger<>0) then begin
    if (MessageDlg('Вы хотите снять блокировку на изменения?',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
				cdsNaklo.Edit;
        cdsNaklo.FieldByName('blocked').asInteger:=0;
        cdsNaklo.Post;
        PostAndApplyOrCancel(cdsNaklo);
    end;
  end else begin
    if (MessageDlg('Вы хотите поставить блокировку на изменения?',
			 mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
        cdsNaklo.Edit;
        cdsNaklo.FieldByName('blocked').asInteger:=1;
        cdsNaklo.Post;
        PostAndApplyOrCancel(cdsNaklo);
    end;
  end;
end;

function TfrmNaklpBux.ShowDetail1:integer;
begin
  Result := dmdEx.ShowDetail1(dsNaklo.DataSet,frmEdit);
{  dmdEx.startWaiting;
  if (frmEdit.Visible = false) then begin
    frmEdit.ShowModal;
  end;
  RecountNakl;
  dmdEx.stopWaiting;}
end;

procedure TfrmNaklpBux.actOrderExecute(Sender: TObject);
begin
 { TODO : Упорядочить по таре }
end;

procedure TfrmNaklpBux.actUndeleteNaklExecute(Sender: TObject);
begin
  if actShowDeleted.Checked then begin
    dmdEx.UndeleteNaklo(TintegerField(dsNaklo.DataSet.FieldByName('delmarked')),actRefresh);
  end;
end;

procedure TfrmNaklpBux.dbgNakloKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
try
  case key of
		vk_return :begin
      actGrid1ListShow.Execute;
		end; //vk_return
    vk_f8: begin
      if (MessageDlg('Вы хотите удалить ВЕСЬ документ?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
        if (cdsNaklo.FieldByName('posted').asInteger=1) then begin
          showmessage('Нельзя удалить проведенный документ');
        end
        else begin //ok to delete
          if not (cdsNaklo.bof and cdsNaklo.eof) then begin
            cdsNaklo.Delete;
          end;
          PostAndApply(cdsNaklo);
        end; //if posted
      end;//if messagedlg
    end; //case vk_f8
    vk_insert : begin
      cdsNaklo.Append;
    end;  //case vk_insert
  end;//case
except
  AssertInternal('5156BD0F-1CA6-435D-A6FB-95E229300329');
end;
end;

procedure TfrmNaklpBux.dbgNaklotKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
		vk_return : begin
      actGrid2ListShow.Execute;
    end; //vk_return
    vk_f8 : begin
      if (MessageDlg('Вы хотите удалить позицию?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
        if not (cdsNaklot.bof and cdsNaklot.eof) then begin
          cdsNaklot.Delete;
        end;
        PostAndApply(cdsNaklot);
      end;//if messagedlg
    end; //vk_f8
    vk_insert: begin
      cdsNaklot.Append;
    end; //vk_insert
	end; //case
end;

procedure TfrmNaklpBux.cdsNakloID_CURRENCYChange(Sender: TField);
begin
//  actKursChange.Execute;
end;

procedure TfrmNaklpBux.cdsNakloDATChange(Sender: TField);
begin
//  actKursChange.Execute;
end;

procedure TfrmNaklpBux.dspNakloGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
  TableName := 'NAKLP_VW';
end;

procedure TfrmNaklpBux.actSpecOstExecute(Sender: TObject);
var
  SpecOst : TfrmSpecOst;
  sFilter : TstringList;
  //i: integer;
begin
  if not(cdsNaklo.Eof and cdsNaklo.bof) then begin
    if not(cdsNaklo.FieldByName('parent_id_nakl').IsNull) then begin
      SpecOst:=TfrmSpecOst.Create(Application);
      SpecOst.setT.DateFrom := strtodate('01.01.1900');
      SpecOst.setT.DateTo := Now;
      SpecOst.qeRasx.Query.close;
      TClientDataSet(SpecOst.qeRasx.Query).Params.ParamByName('sub4_in').asInteger :=
        cdsNaklo.FieldByName('parent_id_nakl').asInteger;
      SpecOst.actRefresh.execute;
      qeNaklot.SavePosition;
      cdsNaklot.First;
      //i:=0;
      sFilter := TStringList.Create;
      while not cdsNaklot.eof do begin
        sFilter.Add(cdsNaklot.FieldByName('id_tovar').asString);
        //inc(i);
        cdsNaklot.Next;
      end;
      qeNaklot.GetPosition(false);
      SpecOst.SetFilterOnlyPrixodPosition(sFilter);
    end; //if parent spec exists
  end;  //if not emtpy nakl
end;

procedure TfrmNaklpBux.actAddDetExecute(Sender: TObject);
var
  frmDetSelect : TfrmDetSelect;
begin
  if cdsNaklo.Eof and cdsNaklo.Bof then begin
    MessageDlg('Не выбрана накладная',mtWarning,[mbOk],0);
    exit;
  end;
  if cdsNaklo.FieldByName('parent_id_nakl').isNull then begin
    MessageDlg('Не выбрана родительская спецификация',mtWarning,[mbOk],0);
    exit;
  end;
  frmDetSelect := TfrmDetSelect.Create(Self);
  frmDetSelect.ShowDet(
    cdsNaklo.FieldByName('parent_id_nakl').asInteger,
    cdsNaklo.FieldByName('id_nakl').asInteger,
    FiTip
  );
  frmDetSelect.DefaultStartUp;
    if frmDetSelect.GetSchet=mrOk then begin
      cdsNaklot.Refresh;
    end;
  frmDetSelect.Free;
  RecountNakl;
end;

procedure TfrmNaklpBux.actShowZatrExecute(Sender: TObject);
var
  frmDet : TfrmNaklpbuxZatraty;
  iTip : integer;
begin
  iTip := dmdEx.GetOidObjects('ПРИХОДНЫЕ НАКЛАДНЫЕ ЗАТРАТЫ',-100);
  frmDet := TfrmNaklpbuxZatraty.Create(self);
  frmDet.ShowDet(
    cdsNaklo.FieldByName('id_nakl').asInteger,
    iTip,
    dsNaklo);
  frmDet.DefaultStartup;
  frmDet.ShowModal;
  frmDet.Free;
end;

procedure TfrmNaklpBux.cdsNaklotCENANDSChange(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    FromCenaRecount(2,dsNaklo.DataSet,dsNaklot.Dataset,1);
    Semaphore := false;
  end;
end;

procedure TfrmNaklpBux.cdsNaklotKOLOTPChange(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    FromCenaRecount(1,dsNaklo.DataSet,dsNaklot.Dataset,1);
    Semaphore := false;
  end;
end;

procedure TfrmNaklpBux.cdsNaklotSUMAChange(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    FromCenaRecount(3,dsNaklo.DataSet,dsNaklot.Dataset,1);
    Semaphore := false;
  end;
end;

procedure TfrmNaklpBux.cdsNaklotSUMANDSChange(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    FromCenaRecount(4,dsNaklo.DataSet,dsNaklot.DataSet,1);
    Semaphore := false;
  end;
end;

procedure TfrmNaklpBux.cdsNaklotCENAChange(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    FromCenaRecount(6,dsNaklo.DataSet,dsNaklot.DataSet,1);
    Semaphore := false;
  end;
end;

procedure TfrmNaklpBux.cdsNaklotCalcFields(DataSet: TDataSet);
begin
  if not Semaphore and (DataSet.state =dsInternalCalc) then begin
    Semaphore := true;
    FromCenaRecount(1,dsNaklo.DataSet,dsNaklot.DataSet,1);
    Semaphore := false;
  end;
end;

procedure TfrmNaklpBux.cdsNaklotAfterDelete(DataSet: TDataSet);
begin
  RecountNakl;
end;

procedure TfrmNaklpBux.actSpecListExecute(Sender: TObject);
var
  frmSpec: TfrmSpec;
begin
  frmSpec := TfrmSpec.Create(application);
  frmSpec.qeNaklo.SetSQL('where','id_nakl='+ cdsNaklo.FieldByName('parent_id_nakl').asString,0);
  frmSpec.DefaultOpen;
end;

procedure TfrmNaklpBux.actChangeSpecForPositExecute(Sender: TObject);
var
//  frmDetSelect : TfrmDetSelect;
//  set_id_nakld : Variant;
  id_nakl : integer;
//  i : integer;
begin
  if cdsNaklo.Eof and cdsNaklo.Bof then begin
    MessageDlg('Не выбрана накладная',mtWarning,[mbOk],0);
    exit;
  end;
  id_nakl:=ShowNaklrList;
  if id_nakl<>0 then begin
    dmdEx.ColumnSelectAndProcess(dbgNaklot,id_nakl,ProcessSpecChange);
  end;
end;

function TfrmNaklpBux.ShowNaklrList : integer;
var
  intTemp : integer;
//  strIdTemp : string;
  dFrom,dTo : TDate;
begin
   { DONE :
Добавить ограничения на выбор расходных
(только для этого менеджера и допустим не старше 3 месяцев) }
  frmNaklrList := TfrmNaklrList.Create(self);
  frmNaklrList.ShowSpec;
  //менеджер только этот
  frmNaklrList.setT.IDManager:= 0;
   // dsNakloEdit.dataset.fieldbyname('id_manager').asInteger;
  dFrom := IncMonth(dsNaklo.DataSet.FieldByName('dat').AsDateTime,-12);
  frmNaklrList.setT.DateFrom:=dFrom;
  dTo := IncMonth(dsNaklo.DataSet.FieldByName('dat').asDateTime,12);
  frmNaklrList.setT.DateTo:=dTo;
   //фирма только эта
  frmNaklrList.qeNaklr.SetSql('where','id_izg='+
   dsNaklo.dataset.fieldbyname('id_izg').asString,3);
  frmNaklrList.qeNaklr.SetSql('where','id_zak='+
   dsNaklo.dataset.fieldbyname('id_zak').asString,4);
  frmNaklrList.qeNaklr.SetSql('where','posted=1',5);
  frmNaklrList.ProcessSettings;
  frmNaklrList.DefaultOpen;

  if not frmNaklrList.Locate(
   dsNaklot.Dataset.FieldByName('id_sebest').asInteger) then begin
//  ShowMessage('Указанная накладная не была найдена в списке.'+
//  ' Возможной причиной является период времени за который отбражаются накладные');
  end;
  intTemp := frmNaklrList.GetSchet;
  frmNaklrList.Free;
  Result := intTemp;
end;

procedure TfrmNaklpBux.dspNaklotGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
  TableName := 'NAKLP_DET_VW';
end;

procedure TfrmNaklpBux.cdsNakloPARENT_ID_NAKLChange(Sender: TField);
//var
//  iParentNakl : integer;
begin
//Убрал каскадное обновление родительской спецификации при смене спецификации наклданой.
//по просьбе Ани Гордо
{
  iParentNakl:=vartoint(Sender.NewValue);
  with dsNaklot.Dataset do begin
    First;
    while not eof do begin
      Edit;
      FieldByName('id_sebest').asInteger := iParentNakl;
      Post;
      Next;
    end;//while
  end;//with
  ApplyOrCancel(dsNaklot.Dataset);
  TClientDataSet(dsNaklot.Dataset).Refresh;
}
end;

procedure TfrmNaklpBux.actShowNaklpExecute(Sender: TObject);
var
  iTip : integer;
begin
  if dsNaklo.DataSet.Eof and dsNaklo.DataSet.Bof then begin
     exit;
  end;
  iTip := dmdEx.GetOidObjects('ТИП НАКЛАДНЫХ ДЛЯ СКЛАДА',-100);
  iTip := dmdEx.GetOidObjects('Приход',iTip);
  OpenDocument(self,dsNaklo.DataSet.FieldByName('id_nakl').asInteger,iTip,0,true);
end;

procedure TfrmNaklpBux.actSebestRecountExecute(Sender: TObject);
var
  iSchet : integer;
begin
  dmdEx.startwaiting;
  iSchet := dmdEx.GetOidObjects('ТИП СЧЕТА',-100);
  iSchet := dmdEx.GetOidObjects('СЕБЕСТОИМОСТЬ СКЛАД',iSchet);
  with sdsPost.Params do begin
    ParamByName('id_nakl').asInteger :=
      dsNaklo.DataSet.FieldByName('id_nakl').asInteger;
    ParamByName('id_schet').asInteger := iSchet;
  end;
  //sdsSebestRecount.Params.
  //sdsSebestRecount.Params.ParamByName('mode_in').asInteger := 3;
  dmdEx.ExecSQL(sdsPost,false);
  //end;
  dmdEx.stopwaiting;
end;

procedure TfrmNaklpBux.actDetAddSumExecute(Sender: TObject);
var
  InputString : string;
  //curSum : currency;
  iError :integer;
  //j : array of integer;
begin
  repeat
  InputString:= InputBox(
    'Введите сумму для разнесения на выбранные позиции',
    'Введите сумму',
    '0');
  iError:=0;
  try
    //curSum :=
    strtofloat(InputString);
  except;
    iError:=1;
  end;
  until iError=0;
end;

procedure TfrmNaklpBux.actDesignExecute(Sender: TObject);
begin
  frRepNaklpbuxZatraty.DesignReport;
end;

procedure TfrmNaklpBux.actDesignBuxExecute(Sender: TObject);
begin
  frRepNaklpbuxSebest.DesignReport;
end;

procedure TfrmNaklpBux.actPreviewBuxExecute(Sender: TObject);
begin
try
  with cdsRepBux do begin
    Close;
	  Params.ParamByName('id_nakl').AsInteger :=
		  cdsNaklo.fieldByName('id_nakl').AsInteger;
	  Open;
  end;
  dmdEx.GetReport('NaklpbuxSebest.fr3',frRepNaklpbuxSebest);
  frRepNaklpbuxSebest.ShowReport;
except
  on E: Exception do begin
    showmessage (e.message);
  end;
end;
end;

procedure TfrmNaklpBux.frRepNaklpbuxSebestGetValue(const ParName: String;
  var ParValue: Variant);
begin
  if AnsiUpperCase(ParName)='NDSTEXT' then begin
    Curr2StrUA1.Active := false;
    Curr2StrUA1.Summa := cdsRepBux.FieldByName('sumnds').Value;
    Curr2StrUA1.Active := true;
    ParValue := Curr2StrUA1.Value;
  end;
end;

procedure TfrmNaklpBux.dbgNakloTitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
begin
  showmessage(inttostr(ACol));
end;

procedure TfrmNaklpBux.dbgNakloTitleClick(Column: TColumnEh);
begin
  showmessage(Column.DisplayText);
end;


procedure TfrmNaklpBux.actSpecOst2Execute(Sender: TObject);
var
  SpecOst : TfrmSpecOst;
  sFilter : TstringList;
  iSpec: integer;
begin
  if not(cdsNaklot.Eof and cdsNaklot.bof) then begin
    if not(cdsNaklot.FieldByName('id_sebest').IsNull) then begin
      SpecOst:=TfrmSpecOst.Create(Application);
      SpecOst.setT.DateFrom := strtodate('01.01.1900');
      SpecOst.setT.DateTo := Now;
      SpecOst.qeRasx.Query.close;
      iSpec := cdsNaklot.FieldByName('id_sebest').asInteger;
      TClientDataSet(SpecOst.qeRasx.Query).Params.ParamByName('sub4_in').asInteger :=
        iSpec;
      SpecOst.actRefresh.execute;
      qeNaklot.SavePosition;
      cdsNaklot.First;
      //i:=0;
      sFilter := TStringList.Create;
      while not cdsNaklot.eof do begin
        if iSpec=cdsNaklot.FieldByName('id_sebest').asInteger then begin
          sFilter.Add(cdsNaklot.FieldByName('id_tovar').asString);
        end;
        cdsNaklot.Next;
      end;
      qeNaklot.GetPosition(false);
      SpecOst.SetFilterOnlyPrixodPosition(sFilter);
    end; //if parent spec exists
  end;  //if not emtpy nakl
end;

procedure TfrmNaklpBux.actShowNaklpOstExecute(Sender: TObject);
var
  frmNaklpOstDet : TfrmNaklpOstDet;
  sNaklInfo : string;
begin
  if not (dsNaklo.DataSet.eof and dsNaklo.DataSet.bof) then begin
    frmNaklpOstDet :=TfrmNaklpOstDet.Create (self);
    sNaklInfo := '№'+
      dsNaklo.DataSet.FieldByName('id').AsString + ' от ' +
      dsNaklo.DataSet.FieldByName('dat').AsString + ' ' +
      dsNaklo.DataSet.FieldByName('zak').AsString;
    frmNaklpOstDet.SetMode(1);
    frmNaklpOstDet.ShowDetail (
      dsNaklo.DataSet.FieldByName('dat').AsDateTime,
      dsNaklo.DataSet.FieldByName('dat').AsDateTime,
      dsNaklo.DataSet.FieldByName('id_nakl').AsInteger,
      sNaklInfo
    );
  end;
end;

procedure ProcessSpecChange (dbgNaklot: TDBGridEh;param:variant;Object1:pointer=nil);
var
  DataSet : TDataSet;
  id_nakl : integer;
begin
  id_nakl := vartoint(param,true);
  if id_nakl<>0 then begin
    DataSet := dbgNaklot.DataSource.DataSet;
    DataSet.Edit;
    DataSet.FieldByName('id_sebest').AsInteger := id_nakl;
    DataSet.Post;
  end;
end;

procedure TfrmNaklpBux.actSebestRecountBuxExecute(Sender: TObject);
var
  iSchet : integer;
begin
  dmdEx.startwaiting;
  iSchet := dmdEx.GetOidObjects('ТИП СЧЕТА',-100);
  iSchet := dmdEx.GetOidObjects('СЕБЕСТОИМОСТЬ БУХ',iSchet);
  with sdsPost.Params do begin
    ParamByName('id_nakl').asInteger :=
      dsNaklo.DataSet.FieldByName('id_nakl').asInteger;
    ParamByName('id_schet').asInteger := iSchet;
  end;
  dmdEx.ExecSQL(sdsPost,false);
  dmdEx.stopwaiting;
end;

procedure TfrmNaklpBux.FillSettings;
begin
  setT := TfrmSettings.Create(self);
  setT.actAllManagerOn.Execute;
  SettingsPost := setT.CreatePlugin('TfmSettingsPost');
  //TfmSettingsPost.Create(setT);
  setT.AddPlugin(SettingsPost);
  setT.IDManager:=dmdex.GetIdManager;
  setT.SetPeriod(2);
end;

procedure TfrmNaklpBux.actPostExecute(Sender: TObject);
begin
  dmdEx.PostNakl(
    TIntegerField(cdsNaklo.FieldByName('posted')),
    sdsPost,
    TIntegerField(cdsNaklo.FieldByName('id_nakl')),
    not actPost.Checked);
end;

procedure TfrmNaklpBux.actUnpostExecute(Sender: TObject);
begin
  dmdEx.UnPostNakl(
    TIntegerField(cdsNaklo.FieldByName('posted')),
    sdsUnPost,
    TIntegerField(cdsNaklo.FieldByName('id_nakl')),
    not actUnpost.Checked);
end;

procedure TfrmNaklpBux.CreateDocFromMem(slHead:TStringList);
begin
try
  dmdEx.StartWaiting;
  //master create
  dsNaklo.DataSet.Tag := 1;
  dsNaklo.DataSet.Insert;
  dsNaklo.DataSet.FieldByName('id_izg').asInteger := strtoint(slHead.Values['id_izg']);
  dsNaklo.DataSet.FieldByName('id_zak').asInteger:= strtoint(slHead.Values['id_zak']);
  dsNaklo.DataSet.FieldByName('comment').asString:= 'Сгенерировано из №'+slHead.Values['id'];;
  dsNaklo.DataSet.Post;
  dsNaklo.DataSet.Tag := 0;
  dmdEx.StopWaiting;
  ApplyOrCancel(dsNaklo.DataSet);
except
  AssertInternal('0E77B20D-977D-4455-A452-642DBB776111');
end;
end;

procedure TfrmNaklpBux.actMakeVozvratPostExecute(Sender: TObject);
begin
  if  cdsNaklo.Eof and cdsNaklo.Bof then begin
    exit;
  end;
try
  sdsMakeVozvrat.Params.ParamByName('id_nakl_in').asInteger :=
    cdsNaklo.FieldByName('id_nakl').asInteger;
  dmdEx.ExecSQL(sdsMakeVozvrat,false);
  actMakeVozvratPost.Tag :=sdsMakeVozvrat.Params.ParamByName('id_nakl').asInteger;
  OpenDocument(self,
    sdsMakeVozvrat.Params.ParamByName('id_nakl').asInteger,
    dmdEx.GetOidObjects('ВОЗВРАТ ПОСТАВЩИКУ',-100),
    0); 
except
  AssertInternal('0F3BC73A-8073-41DD-A8CA-ECB15F5A5560');
end;
end;

end.

