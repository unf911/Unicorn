unit Spec;

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
	ATSAssert, PropFilerEh, MemTableDataEh, MemTableEh, UnfFilter,
  PropStorageEh,    GridsEh, frxClass, frxDBSet,
    
	Registry,

  SpecEdit,
  SpecDet,
  Variants,
  SettingsPlugin, //TfmSettingsPlugin
  //SettingsPost, //TfmSettingsPost
  Naklpbux;


type
	TfrmSpec = class(TForm)
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
		sdsRepNaklo: TSQLDataSet;
    frRepNaklo: TfrxReport;
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
    cdsRepNakloID_TOVAR: TIntegerField;
    cdsRepNakloID_TARA: TIntegerField;
    cdsRepNakloID_TARA_ITOG: TIntegerField;
    cdsRepNakloID_IZG_ITOG: TIntegerField;
    cdsRepNakloTOVAR: TStringField;
    cdsRepNakloEDIZ: TStringField;
    cdsRepNakloTARA: TStringField;
    cdsRepNakloTARA_ITOG: TStringField;
    cdsRepNakloIZG_ITOG: TStringField;
    PopupMenu2: TPopupMenu;
    actOrder: TAction;
    actUndeleteNakl: TAction;
    N8: TMenuItem;
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
    cdsNakloSKLAD: TStringField;
    cdsNakloCURRENCY: TStringField;
    actKursChange: TAction;
    sdsGetKurs: TSQLDataSet;
    sdsGetKursKURS: TFloatField;
    actSpecOst: TAction;
    N3: TMenuItem;
    N4: TMenuItem;
    actNaklpbuxList: TAction;
    N5: TMenuItem;
    dbgNaklot: TDBGridEh;
    actAddDet: TAction;
    N9: TMenuItem;
    sdsNaklotID_SEBEST: TIntegerField;
    cdsNaklotID_SEBEST: TIntegerField;
    sdsNaklotPARENT_ID: TStringField;
    cdsNaklotPARENT_ID: TStringField;
    actShowSravnPriceList: TAction;
    N10: TMenuItem;
    actSetColumnValue: TAction;
    actIncColumnValue: TAction;
    actMultColumnValue: TAction;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    sdsNakloPARENT_ID_NAKL: TIntegerField;
    actChangeSpecForPosit: TAction;
    N14: TMenuItem;
    sdsNakloPARENT_ID: TStringField;
    cdsNakloPARENT_ID_NAKL: TIntegerField;
    cdsNakloPARENT_ID: TStringField;
    mtePriceDetGen: TMemTableEh;
    dsPriceDetGen: TDataSource;
    actMakeSpec: TAction;
    N15: TMenuItem;
    mtePriceDetGenID_TOVAR: TIntegerField;
    mtePriceDetGenID_SEBEST: TIntegerField;
    mtePriceDetGenCENA2: TFloatField;
    mtePriceDetGenKOLOTP: TFloatField;
    mtePriceDetGenSKIDKA: TFloatField;
    actMakeSpecDet: TAction;
    N16: TMenuItem;
    sdsNakloCONFIRMED: TIntegerField;
    cdsNakloCONFIRMED: TIntegerField;
    BitBtn2: TBitBtn;
    actConfirm: TAction;
    actMakePriceChange: TAction;
    N17: TMenuItem;
    actPost: TAction;
    sdsNaklotANALOG: TStringField;
    cdsNaklotANALOG: TStringField;
    cdsNakloID_PRICE: TStringField;
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
    procedure btnUnpostClick(Sender: TObject);
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
    procedure actKursChangeExecute(Sender: TObject);
    procedure actSpecOstExecute(Sender: TObject);
    procedure actNaklpbuxListExecute(Sender: TObject);

    procedure cdsNaklotCENANDSChange(Sender: TField);
    procedure cdsNaklotKOLOTPChange(Sender: TField);
    procedure cdsNaklotSUMAChange(Sender: TField);
    procedure cdsNaklotSUMANDSChange(Sender: TField);
    procedure cdsNaklotCENAChange(Sender: TField);
    procedure cdsNaklotCalcFields(DataSet: TDataSet);
    procedure cdsNaklotAfterDelete(DataSet: TDataSet);
    procedure actAddDetExecute(Sender: TObject);
    procedure actShowSravnPriceListExecute(Sender: TObject);
    procedure dspNaklotGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure actSetColumnValueExecute(Sender: TObject);
    procedure actMultColumnValueExecute(Sender: TObject);
    procedure actIncColumnValueExecute(Sender: TObject);
    procedure actChangeSpecForPositExecute(Sender: TObject);
    procedure cdsNakloPARENT_ID_NAKLChange(Sender: TField);
    procedure dspNakloGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure actMakeSpecExecute(Sender: TObject);
    procedure actMakeSpecDetExecute(Sender: TObject);
    procedure actConfirmExecute(Sender: TObject);
    procedure actMakePriceChangeExecute(Sender: TObject);
    procedure actPostExecute(Sender: TObject);
    procedure cdsNaklotSKIDKAChange(Sender: TField);
    procedure cdsNaklotID_TOVARChange(Sender: TField);

	private
		intNpp : integer; //номер позиции по порядку
    FiSklad : integer;
		frmSpecEdit : TfrmSpecEdit;
		frmSpecDet : TfrmSpecDet;
    SettingsPost : TfmSettingsPlugin;
    //Post;
    procedure ShowDetail2;
		procedure ShowDetail1;
		procedure ProcessShowDeleted;
		procedure qurNaklrCommit;
		//procedure Order;
		procedure ProcessSettings;
    function ShowNaklrList : variant;

	public
		{ Public declarations }
		setT : TfrmSettings;
    Semaphore : boolean; {Семафор для изменения цен в нижней решётке}
    procedure DefaultStartup;
    procedure DefaultOpen;
    procedure RecountNakl;
    procedure CreateDocFromMem(slHead:TStringList);
	end;
  procedure ProcessSravnPriceChange (dbgNaklot: TDBGridEh;param:variant;Object1:Pointer=nil);
var
	frmSpec: TfrmSpec;
  
implementation

{$R *.dfm}

uses
  DateUtils, //IncYear
  SpecOst, // TfrmSpecOst
  DetSelect, // TfrmDetSelect
  PriceChange, // TfrmPriceChange;
  SravnPriceList //TSravnPriceList
, untNaklrList;

procedure TfrmSpec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	Action := caFree;
end;

procedure TfrmSpec.actSettingsExecute(Sender: TObject);
begin
  actSettings.checked := setT.ProcessSettingsChange(actRefresh);
end;

procedure TfrmSpec.actGrid1ListShowExecute(Sender: TObject);
begin
  if (cdsNaklo.FieldByName('ID_NAKL').AsInteger = 0) then  begin
    cdsNaklo.Insert;
  end
  else begin
    if (frmSpecEdit.Visible = false) then begin
      cdsNaklo.Edit;
      ShowDetail1;
    end;
  end;
end;

procedure TfrmSpec.dbgNaklrDblClick(Sender: TObject);
begin
  actGrid1ListShow.Execute;
end;

procedure TfrmSpec.DefaultStartup;
begin
try
  setT.IDManager:=0; // all
  setT.SetPeriod(5);
//  setT.LoadProperties('TfrmSettings_Spec');
  ProcessSettings;
  DefaultOpen;
except
  AssertInternal('3732FE67-BE35-4B68-8856-01BA9060A04E');
end;
end;

procedure TfrmSpec.DefaultOpen;
begin
try
	dmdEx.startWaiting;
  qeNaklo.Refresh;
	dmdEx.StopWaiting;
except
  AssertInternal('3BDED84A-6A00-4EE8-A011-54FC5F56CE2E');
end;
end;

procedure TfrmSpec.FormCreate(Sender: TObject);
begin
try
  dmdEx.StartWaiting;

  dmdEx.OpenQuery(dmdEx.cdsVlad);
  dmdEx.OpenQuery(dmdEx.cdsClient);
  dmdEx.OpenQuery(dmdEx.cdsManager);
  dmdEx.OpenQuery(dmdEx.cdsTovarAll);
  dmdEx.OpenQuery(dmdEx.cdsTovarAllND);
  dmdEx.OpenQuery(dmdEx.cdsSklads);
  setT := TfrmSettings.Create(self);
  setT.actAllManagerOn.Execute;
  SettingsPost := setT.CreatePlugin('TfmSettingsPost');
  //TfmSettingsPost.Create(setT);
  setT.AddPlugin(SettingsPost);
	qeNaklo.DefSql := sdsNaklo.CommandText;

	ProcessShowDeleted;
  //DefaultStartup;
  
  dmdEx.StopWaiting;
  frmSpecEdit := TfrmSpecEdit.Create(self);
  frmSpecEdit.dsNakloEdit.DataSet := cdsNaklo;

  frmSpecDet := TfrmSpecdet.Create(self);
	frmSpecDet.dsNaklotEdit.dataset :=  cdsNaklot;

  FiSklad := dmdEx.GetOidObjects('ТИП НАЗВАНИЯ СКЛАДОВ',-100);
  FiSklad := dmdEx.GetOidObjects('УКК Склад',FiSklad);
except
  AssertInternal('E69CC95E-E261-4389-801D-6A0E50FC8736');
end;
end;

procedure TfrmSpec.qurNaklrCommit;
begin
  PostAndApplyOrCancel(cdsNaklo);
end;

procedure TfrmSpec.actRefreshExecute(Sender: TObject);
begin
try
  dmdEx.StartWaiting;
	qurNaklrCommit;
  ProcessSettings;
  defaultopen;
	//qeNaklo.Refresh;
  dmdEx.StopWaiting;
except
  AssertInternal('FDA31B8B-F0AE-4CA0-87FF-9F81D08B92C0');
end;
end;

procedure TfrmSpec.FormDestroy(Sender: TObject);
begin
try
  dmdEx.CloseQuery(dmdEx.cdsVlad,false);
  dmdEx.CloseQuery(dmdEx.cdsClient,false);
  dmdEx.CloseQuery(dmdEx.cdsManager,false);
  dmdEx.CloseQuery(dmdEx.cdsTovarAll,false);
  dmdEx.CloseQuery(dmdEx.cdsTovarAllND,false);
  dmdEx.CloseQuery(dmdEx.cdsSklads,false);
	frmSpecEdit.Free;
  frmSpecDet.Free;
  setT.Free;
except
  AssertInternal('6F6CE56C-B6D2-4461-B6A9-F4E0FC192E09');
end;
end;

procedure TfrmSpec.actGrid2ListShowExecute(Sender: TObject);
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
procedure TfrmSpec.Order;
begin
// Order2( qeNaklpt);
end;
}
procedure TfrmSpec.actRecalcExecute(Sender: TObject);
begin
	//Order;
	//actCalculateSum.Execute;
end;

procedure TfrmSpec.FormDeactivate(Sender: TObject);
begin
	qurNaklrCommit;
end;


procedure TfrmSpec.actCalculateSumExecute(Sender: TObject);
begin
//  CalculateSum(qurNaklp,qurNaklpt );
end;


procedure TfrmSpec.cdsNakloAfterInsert(DataSet: TDataSet);
var
  intGen, iManager : integer;
begin
  //dmdEx.StartWaiting;
  intGen := dmdEx.GetGenValue('naklo_gen');
  DataSet.FieldByName('id_nakl').AsInteger:= intGen;  //assign
  DataSet.FieldByName('id').AsString := inttostr(intGen);
  DataSet.FieldByName('dat').AsDateTime := Date; //default date. time=0
  DataSet.FieldByName('nalog_nds').AsFloat := dmdEx.GetNds ( Date );
  DataSet.FieldByName('kurs').asFloat := 1.0000;
  DataSet.FieldByName('id_sklad').asInteger := 0;
  DataSet.FieldByName('nds').AsFloat := 0;
	DataSet.FieldByName('posted').asInteger := 0;
  DataSet.FieldByName('delmarked').asInteger := 0;
  DataSet.FieldByName('blocked').asInteger := 0;
  DataSet.FieldByName('confirmed').asInteger := 0;
  DataSet.FieldByName('id_sklad').asInteger := FiSklad;
  iManager := dmdEx.GetIdManager;
  if iManager<>0 then begin
    DataSet.FieldByName('id_manager').asInteger := iManager;
  end;
//  DataSet.FieldByName('id_zak').asInteger := 0;
  //dmdEx.StopWaiting;
  ShowDetail1;
end;


procedure TfrmSpec.cdsNaklotAfterInsert(DataSet: TDataSet);
var
  intGen : integer;
begin
  if cdsNaklo.FieldByName('id_nakl').AsInteger=0 then begin
    if cdsNaklo.Eof and cdsNaklo.Bof then begin
      messagedlg('Не выбран документ',mtWarning,[mbOK],0);
      abort;
    end;
  end;
  //dmdEx.StartWaiting;
  intGen := dmdEx.GetGenValue('naklot_gen');
  DataSet.FieldByName('id_nakld').AsInteger := intGen;
  DataSet.FieldByName('id_nakl').AsInteger :=
    cdsNaklo.FieldByName('id_nakl').AsInteger;
  DataSet.FieldByName('id_pos').asInteger := intNpp;
  DataSet.FieldByName('cena').asFloat := 0;
  DataSet.FieldByName('kolotp').asFloat := 0;
  DataSet.FieldByName('skidka').asFloat := 0;
  DataSet.FieldByName('kodcn').asFloat := 0;
  if cdsNaklo.FieldByName('parent_id_nakl').AsInteger<>0 then begin
    DataSet.FieldByName('id_sebest').asInteger :=
      cdsNaklo.FieldByName('parent_id_nakl').AsInteger;
    Dataset.FieldByName('parent_id').asString :=
      cdsNaklo.FieldByName('parent_id').AsString;
  end;
  //dmdEx.StopWaiting;
	ShowDetail2;
end;

procedure TfrmSpec.cdsNaklotBeforeInsert(DataSet: TDataSet);
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

procedure TfrmSpec.btnUnpostClick(Sender: TObject);
begin
try
  if (cdsNaklo.FieldByName('posted').asInteger = 1) then begin
    if (MessageDlg('Вы хотите вернуть документ?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
      try
        sdsUNPost.Params[0].AsInteger :=
          cdsNaklo.fieldbyname('id_nakl').AsInteger;
        dmdEx.ExecSQL(sdsUNPost,false);
        cdsNaklo.edit;
        cdsNaklo.FieldByName('posted').AsInteger := 0;
        cdsNaklo.Post;
        cdsNaklo.ApplyUpdates(0);
      except
        on E:EDatabaseError do begin
          if AnsiStartsText('no permission', e.message) then begin
            MessageDlg ('Вы не имеете права проводить спецификации',mtWarning,[mbOK],0);
          end
          else begin
            showmessage (e.message);
          end; //if
        end;
      end; //try
    end; //if messagedlg
  end else begin //if posted
    MessageDlg ('Нельзя возвратить не проведенный документ',mtWarning,[mbOK],0);
  end; //if posted
except
  AssertInternal('701B256E-EBEE-4953-A0DB-7ACF724E301E');
end;
end;

procedure TfrmSpec.cdsNaklotBeforeScroll(DataSet: TDataSet);
begin
try
  if DataSet.Tag<>1 then begin
    ApplyOrCancel (Dataset);
  end;
except
  AssertInternal('5D22C051-79E5-4B0B-9517-8E5B2754C1F8');
end;
end;

procedure TfrmSpec.cdsNakloBeforeScroll(DataSet: TDataSet);
begin
try
  ApplyOrCancel (Dataset);
except
  AssertInternal('BB8DE88F-3FA9-4C61-8D1B-82500D64440D');
end;
end;


procedure TfrmSpec.dbgNaklotDblClick(Sender: TObject);
begin
  actGrid2ListShow.Execute;
end;

procedure TfrmSpec.dbgNakloDblClick(Sender: TObject);
begin
  actGrid1ListShow.Execute;
end;


procedure TfrmSpec.actPreviewExecute(Sender: TObject);
begin
{
try
	cdsRepNaklo.Close;
	cdsRepNaklo.Params.ParamByName('id_nakl').AsInteger :=
		cdsNaklo.fieldByName('id_nakl').AsInteger;
	cdsRepNaklo.Open;
  frRepNaklo.ShowReport;
except
  on E: Exception do begin
    showmessage (e.message);
  end;
end;
}
end;

procedure TfrmSpec.dspNakloBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
begin
  if (ukDelete=UpdateKind) and (SourceDS.name='sdsNaklo') then begin
    Applied:=false;
    sdsDelmark.ParamByName('oid').AsInteger:=
      DeltaDS.fieldByName('id_nakl').asInteger;
		dmdEx.ExecSQL(sdsDelmark);
    Applied:=true;
  end;
end;

procedure TfrmSpec.actShowDeletedExecute(Sender: TObject);
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
procedure TfrmSpec.ProcessShowDeleted;
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
procedure TfrmSpec.ShowDetail2;
begin
 //if not prohibited to user edit
 if dsNaklot.DataSet.Tag=0 then begin
  dmdEx.StartWaiting;
  frmSpecDet.ShowDetail(
      cdsNaklo.fieldbyname('posted').asInteger);
  RecountNakl;
  dmdEx.StopWaiting;
 end;//tag<>1
end;

procedure TfrmSpec.RecountNakl;
begin
  dmdEx.CalculateSumNaklo(cdsNaklo,cdsNaklot,1);
end;

procedure TfrmSpec.cdsNakloReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  showmessage(e.message);
  Action := raCancel;
end;

procedure TfrmSpec.ProcessSettings;
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

    self.Caption :='Спецификации. '
      +'Менеджер: '+setT.Manager + '. Период: c ' + datetostr (setT.DateFrom)
      + ' по '+ datetostr(setT.DateTo)+'. Поставщик: '+
     setT.GetPluginTextResult('fmSettingsPost');
except
  AssertInternal('B19CBD0A-30F6-4509-BCF9-1C31D8036815');
end;
end;

procedure TfrmSpec.cdsNaklotReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  showmessage (e.Message);
  Action := raCancel;
end;

procedure TfrmSpec.actBlockExecute(Sender: TObject);
var
  i: integer;
begin
  if (cdsNaklo.FieldByName('blocked').asInteger<>0) then begin
    if (MessageDlg('Вы хотите сделать спецификацию открытой?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes)
    then begin
      if dbgNaklo.Selection.SelectionType=gstRecordBookmarks then begin
        for i:= 0 to dbgNaklo.Selection.Rows.Count-1 do begin
          cdsNaklo.GotoBookmark(pointer(dbgNaklo.SelectedRows.Items[i]));
          cdsNaklo.Edit;
          cdsNaklo.FieldByName('blocked').asInteger:=0;
          cdsNaklo.Post;
          PostAndApplyOrCancel(cdsNaklo);
        end;
      end else begin
        cdsNaklo.Edit;
        cdsNaklo.FieldByName('blocked').asInteger:=0;
        cdsNaklo.Post;
        PostAndApplyOrCancel(cdsNaklo);
      end;
    end; //if dbgNaklot.Selection.SelectionType=gstRecordBookmarks
  end else begin
    if (MessageDlg('Вы хотите закрыть спецификацию?',
			 mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
      if dbgNaklo.Selection.SelectionType=gstRecordBookmarks then begin
        for i:= 0 to dbgNaklo.Selection.Rows.Count-1 do begin
          cdsNaklo.GotoBookmark(pointer(dbgNaklo.SelectedRows.Items[i]));
          cdsNaklo.Edit;
          cdsNaklo.FieldByName('blocked').asInteger:=1;
          cdsNaklo.Post;
          PostAndApplyOrCancel(cdsNaklo);
        end;
      end else begin
        cdsNaklo.Edit;
        cdsNaklo.FieldByName('blocked').asInteger:=1;
        cdsNaklo.Post;
        PostAndApplyOrCancel(cdsNaklo);
      end;
    end;
  end;
end;

procedure TfrmSpec.ShowDetail1;
begin
  if dsNaklo.DataSet.Tag = 0 then begin
    //dmdEx.startWaiting;
    if (frmSpecEdit.Visible = false) then begin
      frmSpecEdit.ShowModal;
    end;                 
    RecountNakl;
    //dmdEx.stopWaiting;
  end;
end;

procedure TfrmSpec.actOrderExecute(Sender: TObject);
begin
 { TODO : Упорядочить по таре }
end;

procedure TfrmSpec.actUndeleteNaklExecute(Sender: TObject);
begin
  if actShowDeleted.Checked then begin
    dmdEx.UndeleteNaklo(TintegerField(dsNaklo.DataSet.FieldByName('delmarked')),actRefresh);
  end;
end;

procedure TfrmSpec.dbgNakloKeyDown(Sender: TObject; var Key: Word;
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
    end; //if vk_f8
    vk_insert: begin
      cdsNaklo.Append;
    end;//vk_insert
  end;//case
except
  AssertInternal('5156BD0F-1CA6-435D-A6FB-95E229300329');
end;
end;

procedure TfrmSpec.dbgNaklotKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
		vk_return : begin
      actGrid2ListShow.Execute;
    end; //vk_return
    vk_f8 : begin
      dmdEx.DbGridEhDeletePositions(dbgNaklot);
    end; //vk_f8
    vk_insert: begin
      cdsNaklot.Append;
    end; //vk_insert
	end; //case
end;

procedure TfrmSpec.cdsNakloID_CURRENCYChange(Sender: TField);
begin
  actKursChange.Execute;
end;

procedure TfrmSpec.cdsNakloDATChange(Sender: TField);
begin
  actKursChange.Execute;
end;

procedure TfrmSpec.actKursChangeExecute(Sender: TObject);
var
  dKurs : double;
begin
  if (not dsNaklo.DataSet.FieldByName('id_currency').isNull) then begin
    if (not dsNaklo.DataSet.FieldByName('dat').isNull) then begin
       try
        sdsGetKurs.Close;
        sdsGetKurs.params.ParamByName('dat').AsDate :=dsNaklo.DataSet.FieldByName('dat').AsDateTime;
        sdsGetKurs.params.ParamByName('id_currency').AsInteger :=dsNaklo.DataSet.FieldByName('id_currency').AsInteger;
        sdsGetKurs.Open;
        if not sdsGetKurs.FieldByName('kurs').IsNull then begin
          dKurs := sdsGetKurs.FieldByName('kurs').asFloat;
          dsNaklo.DataSet.FieldByName('kurs').asFloat := dKurs;
        end; //if kurs not null
      finally //try
        sdsGetKurs.Close;
      end;  //try
    end; //if dat not null
  end;//if currency not null
end;

procedure TfrmSpec.actSpecOstExecute(Sender: TObject);
var
  SpecOst : TfrmSpecOst;
begin
  if not(cdsNaklo.Eof and cdsNaklo.bof) then begin
    if not(cdsNaklo.FieldByName('id_nakl').IsNull) then begin
      SpecOst:=TfrmSpecOst.Create(Application);
      SpecOst.setT.DateFrom := strtodate('01.01.1900');
      SpecOst.setT.DateTo := IncYear(Now);
      SpecOst.qeRasx.Query.close;
      TClientDataSet(SpecOst.qeRasx.Query).Params.ParamByName('sub4_in').asInteger :=
        cdsNaklo.FieldByName('id_nakl').asInteger;
      SpecOst.actRefresh.execute;
    end;
  end;
end;

procedure TfrmSpec.actNaklpbuxListExecute(Sender: TObject);
var
  frmNaklpBux: TfrmNaklpBux;
  sIdNakl : string;
begin
  sIdNakl :=cdsNaklo.FieldByName('id_nakl').asString;
  frmNaklpBux := TfrmNaklpBux.Create(application);
  frmNaklpBux.qeNaklo.SetSQL('where',
    'delmarked=0 and '+
    '((id_nakl in (select id_nakl from naklp_det_vw ot '+
    'where ot.id_sebest ='+sIdNakl+
    ' group by ot.id_nakl)) or (parent_id_nakl='+sIdNakl+'))'
    ,0);
  frmNaklpBux.actRefresh.execute;
  //.DefaultOpen;
//  frmNaklo.Show;
end;

procedure TfrmSpec.cdsNaklotCENANDSChange(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    FromCenaRecount(2,dsNaklo.DataSet,dsNaklot.Dataset, 1,
      VarToInt(dsNaklo.DataSet.FieldByName('id_price').asVariant,true),
      dsNaklo.DataSet.FieldByName('id_currency').asInteger);
    Semaphore := false;
  end;
end;

procedure TfrmSpec.cdsNaklotKOLOTPChange(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    FromCenaRecount(1,dsNaklo.DataSet,dsNaklot.Dataset, 1,
      VarToInt(dsNaklo.DataSet.FieldByName('id_price').asVariant,true),
      dsNaklo.DataSet.FieldByName('id_currency').asInteger);
    Semaphore := false;
  end;
end;

procedure TfrmSpec.cdsNaklotSUMAChange(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    FromCenaRecount(3,dsNaklo.DataSet,dsNaklot.Dataset, 1,
      VarToInt(dsNaklo.DataSet.FieldByName('id_price').asVariant,true),
      dsNaklo.DataSet.FieldByName('id_currency').asInteger);
    Semaphore := false;
  end;
end;

procedure TfrmSpec.cdsNaklotSUMANDSChange(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    FromCenaRecount(4,dsNaklo.DataSet,dsNaklot.DataSet, 1,
      VarToInt(dsNaklo.DataSet.FieldByName('id_price').asVariant,true),
      dsNaklo.DataSet.FieldByName('id_currency').asInteger);
    Semaphore := false;
  end;
end;

procedure TfrmSpec.cdsNaklotCENAChange(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    FromCenaRecount(6,dsNaklo.DataSet,dsNaklot.DataSet, 1,
      VarToInt(dsNaklo.DataSet.FieldByName('id_price').asVariant,true),
      dsNaklo.DataSet.FieldByName('id_currency').asInteger);
    Semaphore := false;
  end;
end;

procedure TfrmSpec.cdsNaklotCalcFields(DataSet: TDataSet);
begin
  if not Semaphore and (DataSet.state =dsInternalCalc) then begin
    Semaphore := true;
    FromCenaRecount(1,dsNaklo.DataSet,dsNaklot.DataSet, 1,
      VarToInt(dsNaklo.DataSet.FieldByName('id_price').asVariant,true),
      dsNaklo.DataSet.FieldByName('id_currency').asInteger
      );
    Semaphore := false;
  end;
end;

procedure TfrmSpec.cdsNaklotAfterDelete(DataSet: TDataSet);
begin
  RecountNakl
end;

procedure TfrmSpec.actAddDetExecute(Sender: TObject);
var
  frmDetSelect : TfrmDetSelect;
  TovarList: TStringList;
  i : integer;
begin
  if cdsNaklo.Eof and cdsNaklo.Bof then begin
    MessageDlg('Не выбрана спецификация',mtWarning,[mbOk],0);
    exit;
  end;
  frmDetSelect := TfrmDetSelect.Create(Self);
  frmDetSelect.ShowSprTovar;
  TovarList := TStringList.Create;
  if frmDetSelect.GetTovarPositions(TovarList)=mrOk then begin
    //чтобы после вставки не открывалось окно редактирования
    dsNaklot.DataSet.Tag :=1;
    for i :=0 to TovarList.Count-1 do begin
      cdsNaklot.Insert;
      cdsNaklot.FieldByName('id_tovar').AsInteger := strtoint(TovarList.Strings[i]);
      cdsNaklot.Post;
    end;
    //чтобы после вставки опять открывалось окно редактирования
    dsNaklot.DataSet.Tag :=0;
    ApplyOrCancel(cdsNaklot);
    cdsNaklot.Refresh;
  end;
  frmDetSelect.Free;
end;



procedure TfrmSpec.actShowSravnPriceListExecute(Sender: TObject);
var
  SravnPriceList :TfrmSravnPriceList;
begin
  if not CheckExistenceOfSelectedRecord(dsNaklot.DataSet) then begin
    exit;
  end;
  SravnPriceList :=TfrmSravnPriceList.Create(Application);
  SravnPriceList.qeNaklo.SetSQL('where','id_nakl='+
    dsNaklot.DataSet.FieldByName('id_sebest').AsString,0);
  SravnPriceList.DefaultOpen;
end;

procedure TfrmSpec.dspNaklotGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
  TableName:='SPEC_DET_VW';
end;

procedure TfrmSpec.actSetColumnValueExecute(Sender: TObject);
begin
  dbgNaklot.ReadOnly:=false;
  dmdEx.ColumnSet(dbgNaklot);
  dbgNaklot.ReadOnly:=true;
end;

procedure TfrmSpec.actMultColumnValueExecute(Sender: TObject);
begin
  dbgNaklot.ReadOnly := false;
  dmdEx.ColumnMult(dbgNaklot);
  dbgNaklot.ReadOnly := true;
end;

procedure TfrmSpec.actIncColumnValueExecute(Sender: TObject);
begin
  dbgNaklot.ReadOnly := false;
  dmdEx.ColumnInc(dbgNaklot);
  dbgNaklot.ReadOnly := true;
end;

procedure TfrmSpec.actChangeSpecForPositExecute(Sender: TObject);
var
  //frmDetSelect : TfrmDetSelect;
  //set_id_nakld : Variant;
  //id_nakl : integer;
  ResultOfShowNaklrList : variant;
  //i : integer;
begin
  if cdsNaklo.Eof and cdsNaklo.Bof then begin
    MessageDlg('Не выбрана накладная',mtWarning,[mbOk],0);
    exit;
  end;
  if cdsNaklo.FieldByName('posted').asInteger<>0 then begin
    MessageDlg('Спецификация проведена',mtWarning,[mbOk],0);
    exit;
  end;
  if cdsNaklo.FieldByName('blocked').asInteger<>0 then begin
    MessageDlg('Спецификация закрыта',mtWarning,[mbOk],0);
    exit;
  end;
  ResultOfShowNaklrList:=ShowNaklrList;
  if ResultOfShowNaklrList[0]<>0 then begin
    dmdEx.ColumnSelectAndProcess(dbgNaklot,ResultOfShowNaklrList,ProcessSravnPriceChange,nil);
  end;
end;

function TfrmSpec.ShowNaklrList : variant;
var
  intTemp : integer;
  strIdTemp : string;
  dFrom,dTo : TDate;
begin
try
   { DONE :
Добавить ограничения на выбор расходных
(только для этого менеджера и допустим не старше 3 месяцев) }
  frmNaklrList := TfrmNaklrList.Create(self);
  frmNaklrList.ShowSravnPrice;
  //менеджер только этот
  frmNaklrList.setT.IDManager:= 0;
   // dsNakloEdit.dataset.fieldbyname('id_manager').asInteger;
  dFrom := IncMonth(dsNaklo.DataSet.FieldByName('dat').AsDateTime,-12);
  frmNaklrList.setT.DateFrom:=dFrom;
  dTo := IncMonth(dsNaklo.DataSet.FieldByName('dat').asDateTime,12);
  frmNaklrList.setT.DateTo:=dTo;
   //фирма только эта
  frmNaklrList.ProcessSettings;
  frmNaklrList.DefaultOpen;
  if not frmNaklrList.Locate(
   dsNaklot.Dataset.FieldByName('id_sebest').asInteger) then begin
//  ShowMessage('Указанная накладная не была найдена в списке.'+
//  ' Возможной причиной является период времени за который отбражаются накладные');
  end;
  intTemp := frmNaklrList.GetSchet;
  strIdTemp := frmNaklrList.qeNaklr.Query.FieldByName('id').asString;
  Result := vararrayof([intTemp,strIdTemp]);
finally
  frmNaklrList.Free;
end;
  //Result := intTemp;
end;

procedure ProcessSravnPriceChange (dbgNaklot: TDBGridEh;param:variant;Object1:Pointer=nil);
var
  DataSet : TDataSet;
  id_nakl : integer;
  strIdTemp :string;
begin
  id_nakl := vartoint(param[0],true);
  strIdTemp := varastype(param[1],varString);
  if id_nakl<>0 then begin
    DataSet := dbgNaklot.DataSource.DataSet;
    DataSet.Edit;
    DataSet.FieldByName('id_sebest').AsInteger := id_nakl;
    DataSet.FieldByName('parent_id').asString := strIdTemp;
    DataSet.Post;
  end;
end;

procedure TfrmSpec.cdsNakloPARENT_ID_NAKLChange(Sender: TField);
var
  vParentNakl : variant;
begin
  vParentNakl:=vartoint(Sender.NewValue);
  if Sender.DataSet.FieldByName('posted').asInteger<>0 then begin
    MessageDlg('Спецификация проведена',mtWarning,[mbok],0);
    abort;
  end;
  if Sender.DataSet.FieldByName('blocked').asInteger<>0 then begin
    MessageDlg('Спецификация закрыта',mtWarning,[mbok],0);
    abort;
  end;
  if vParentNakl<>Null then begin
    with dsNaklot.Dataset do begin
      First;
      while not eof do begin
        Edit;
        FieldByName('id_sebest').asInteger := vartoint(vParentNakl,true);
        Post;
        Next;
      end;//while
    end;//with
    if dsNaklot.Tag<>1 then begin
      ApplyOrCancel(dsNaklot.Dataset);
      TClientDataSet(dsNaklot.Dataset).Refresh;
    end;
  end;
end;

procedure TfrmSpec.dspNakloGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: String);
begin
  TableName := 'SPEC_VW';
end;

procedure TfrmSpec.actMakeSpecExecute(Sender: TObject);
var
  slHead: TStringList;
begin
slHead := TStringList.Create;
try
  try
    if (cdsNaklo.Eof and cdsNaklo.Bof) then begin
      Showmessage('Не выбран документ');
      exit;
    end;
    dmdEx.StartWaiting;
    dsNaklo.DataSet.DisableControls;
    dsNaklot.DataSet.DisableControls;

    slHead.Add('id_izg='+dsNaklo.DataSet.FieldByName('id_izg').asString);
    slHead.Add('id_zak='+dsNaklo.DataSet.FieldByName('id_zak').asString);
    slHead.Add('id_currency='+dsNaklo.DataSet.FieldByName('id_currency').asString);
    slHead.Add('nalog_nds='+dsNaklo.DataSet.FieldByName('nalog_nds').asString);
    slHead.Add('parent_id_nakl='+dsNaklo.DataSet.FieldByName('parent_id_nakl').asString);
    slHead.Add('id_sklad='+dsNaklo.DataSet.FieldByName('id_sklad').asString);
    //slHead.Add('id_manager='+dsNaklo.DataSet.FieldByName('id_manager').asString);
    slHead.Add('id='+dsNaklo.DataSet.FieldByName('id').asString);
    if mtePriceDetGen.Active then begin
      mtePriceDetGen.EmptyTable;
      mtePriceDetGen.Close;
    end else begin
      mtePriceDetGen.CreateDataSet;
    end;
    mtePriceDetGen.Open;
    dsNaklot.DataSet.Tag :=1;
    CopyDatasetFields(dsNaklot.DataSet,dsPriceDetGen.DataSet,
      'id_tovar;cena;skidka;kolotp;id_sebest',
      'id_tovar;cena;skidka;kolotp;id_sebest',
      '','',3);
    //detail copy
    CreateDocFromMem(slHead);
    dsNaklot.DataSet.Tag :=0;    
    dmdEx.StopWaiting;
    dsNaklot.DataSet.EnableControls;
    dsNaklo.DataSet.EnableControls;
  except
    AssertInternal('87232320-AC98-4793-8324-646BED10CCBE');
  end;
finally
  slHead.Free;
end;
end;

procedure TfrmSpec.CreateDocFromMem(slHead:TStringList);
var
  I :integer;
begin
try
  //dmdEx.StartWaiting;
  //master create
  dsNaklo.DataSet.Tag := 1;
  dsNaklo.DataSet.Insert;
  //dsNaklo.DataSet.FieldByName('id_manager').asInteger := strtoint(slHead.Values['id_manager']);
  dsNaklo.DataSet.FieldByName('id_sklad').asInteger := strtoint(slHead.Values['id_sklad']);
  dsNaklo.DataSet.FieldByName('id_izg').asInteger := strtoint(slHead.Values['id_izg']);
  dsNaklo.DataSet.FieldByName('id_zak').asInteger := strtoint(slHead.Values['id_zak']);
  dsNaklo.DataSet.FieldByName('id_currency').asInteger := strtoint(slHead.Values['id_currency']);
  dsNaklo.DataSet.FieldByName('parent_id_nakl').asVariant := VarToInt(slHead.Values['parent_id_nakl']);
  dsNaklo.DataSet.FieldByName('comment').asString:=  'Сгенерировано из №'+slHead.Values['id'];
  dsNaklo.DataSet.FieldByName('nalog_nds').asFloat := strtofloat(slHead.Values['nalog_nds']);
  dsNaklo.DataSet.Post;
  dsNaklo.DataSet.Tag := 0;
  //dmdEx.StopWaiting;
  //ApplyOrCancel(dsNaklo.DataSet);
  //dsNaklo.DataSet.EnableControls;
  //detail create
  //dmdEx.StartWaiting;
  dsNaklot.DataSet.Tag := 1;
  dsPriceDetGen.DataSet.First;
  i:=1;
  while not dsPriceDetGen.DataSet.eof do begin
    dsNaklot.DataSet.Insert;
    CopyFieldValues(dsPriceDetGen.DataSet,
      dsNaklot.DataSet,
      'id_tovar;cena;skidka;kolotp;id_sebest',
      'id_tovar;cena;skidka;kolotp;id_sebest');
    dsNaklot.DataSet.FieldByName('id_pos').asInteger:=i;
    inc(i);
    dsNaklot.DataSet.Post;
    dsPriceDetGen.DataSet.Next;
  end;
  {
  CopyDatasetFields(dsPriceDetGen.DataSet,
    dsNaklot.DataSet,
    'id_tovar;cena;skidka;kolotp;id_sebest',
    'id_tovar;cena;skidka;kolotp;id_sebest',
    '','',3);                   }

  ApplyOrCancel(dsNaklot.DataSet);
  RecountNakl;
  dsNaklot.DataSet.Tag := 0;
  ApplyOrCancel(dsNaklo.DataSet);
  //dmdEx.StopWaiting;
except
  AssertInternal('DC390ED0-739F-4FB1-9264-BCA652397A71');
end;
end;

procedure TfrmSpec.actMakeSpecDetExecute(Sender: TObject);
var
  slHead: TStringList;
  i:integer;
begin
slHead := TStringList.Create;
try
  try
    if (cdsNaklo.Eof and cdsNaklo.Bof) then begin
      Showmessage('Не выбран документ');
      exit;
    end;
    dmdEx.StartWaiting;
    //dsNaklo.DataSet.DisableControls;
    //dsNaklot.DataSet.DisableControls;
    slHead.Add('id_izg='+dsNaklo.DataSet.FieldByName('id_izg').asString);
    slHead.Add('id_zak='+dsNaklo.DataSet.FieldByName('id_zak').asString);
    slHead.Add('id_currency='+dsNaklo.DataSet.FieldByName('id_currency').asString);
    slHead.Add('nalog_nds='+dsNaklo.DataSet.FieldByName('nalog_nds').asString);
    slHead.Add('parent_id_nakl='+dsNaklo.DataSet.FieldByName('parent_id_nakl').asString);
    slHead.Add('id_sklad='+dsNaklo.DataSet.FieldByName('id_sklad').asString);
    //slHead.Add('id_manager='+dsNaklo.DataSet.FieldByName('id_manager').asString);
    slHead.Add('id='+dsNaklo.DataSet.FieldByName('id').asString);
    if mtePriceDetGen.Active then begin
      mtePriceDetGen.EmptyTable;
      mtePriceDetGen.Close;
    end else begin
      mtePriceDetGen.CreateDataSet;
    end;
    mtePriceDetGen.Open;
    dsNaklot.DataSet.Tag :=1;
    if dbgNaklot.Selection.SelectionType=gstRecordBookmarks then begin
      for i:= 0 to dbgNaklot.Selection.Rows.Count-1 do begin
        dbgNaklot.DataSource.dataset.GotoBookmark(pointer(dbgNaklot.SelectedRows.Items[i]));
        mtePriceDetGen.Insert;
        CopyFieldValues(
          dbgNaklot.DataSource.dataset,
          mtePriceDetGen,
            'id_tovar;cena;skidka;kolotp;id_sebest',
            'id_tovar;cena;skidka;kolotp;id_sebest'
          );
        mtePriceDetGen.Post;
      end;
    end else begin
      mtePriceDetGen.Insert;
      CopyFieldValues(
        dbgNaklot.DataSource.dataset,
        mtePriceDetGen,
          'id_tovar;cena;skidka;kolotp;id_sebest',
          'id_tovar;cena;skidka;kolotp;id_sebest'
        );
      mtePriceDetGen.Post;
    end;
    //detail copy
    CreateDocFromMem(slHead);
    dsNaklot.DataSet.Tag :=0;
    dmdEx.StopWaiting;
    //dsNaklot.DataSet.EnableControls;
    //dsNaklo.DataSet.EnableControls;
  except
    AssertInternal('87232320-AC98-4793-8324-646BED10CCBE');
  end;
finally
  slHead.Free;
end;
end;



procedure TfrmSpec.actConfirmExecute(Sender: TObject);
var
  i: integer;
begin
  if (cdsNaklo.FieldByName('confirmed').asInteger<>0) then begin
    if (MessageDlg('Вы хотите снять подтвеждение спецификации?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes)
    then begin
      if dbgNaklo.Selection.SelectionType=gstRecordBookmarks then begin
        for i:= 0 to dbgNaklo.Selection.Rows.Count-1 do begin
          cdsNaklo.GotoBookmark(pointer(dbgNaklo.SelectedRows.Items[i]));
          cdsNaklo.Edit;
          cdsNaklo.FieldByName('confirmed').asInteger:=0;
          cdsNaklo.Post;
          PostAndApplyOrCancel(cdsNaklo);
        end;
      end else begin
        cdsNaklo.Edit;
        cdsNaklo.FieldByName('confirmed').asInteger:=0;
        cdsNaklo.Post;
        PostAndApplyOrCancel(cdsNaklo);
      end;
    end; //if dbgNaklot.Selection.SelectionType=gstRecordBookmarks
  end else begin
    if (MessageDlg('Вы хотите подтвердить спецификацию?',
			 mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
      if dbgNaklo.Selection.SelectionType=gstRecordBookmarks then begin
        for i:= 0 to dbgNaklo.Selection.Rows.Count-1 do begin
          cdsNaklo.GotoBookmark(pointer(dbgNaklo.SelectedRows.Items[i]));
          cdsNaklo.Edit;
          cdsNaklo.FieldByName('confirmed').asInteger:=1;
          cdsNaklo.Post;
          PostAndApplyOrCancel(cdsNaklo);
        end;
      end else begin
        cdsNaklo.Edit;
        cdsNaklo.FieldByName('confirmed').asInteger:=1;
        cdsNaklo.Post;
        PostAndApplyOrCancel(cdsNaklo);
      end;
    end;
  end;
end;

procedure TfrmSpec.actMakePriceChangeExecute(Sender: TObject);
var
  frmPriceChange : TfrmPriceChange;
  DataSet : TDataSet;
  iResult : integer;
begin
try
  if (cdsNaklo.Eof and cdsNaklo.Bof) then begin
    Showmessage('Не выбран документ');
    exit;
  end;
  dmdEx.StartWaiting;

  frmPriceChange := TfrmPriceChange.Create(Application);
  frmPriceChange.setT.DateFrom := Today;
  frmPriceChange.setT.DateTo := Today;
  frmPriceChange.setT.IDManager:=dmdex.GetIdManager;
  frmPriceChange.ProcessSettings;
  frmPriceChange.DefaultOpen;
  frmPriceChange.dsNaklo.DataSet.tag:=1;
  frmPriceChange.dsNaklo.DataSet.Insert;
  frmPriceChange.dsNaklo.DataSet.FieldByName('comment').asString :=
    'Из спецификации №'+dsNaklo.DataSet.FieldByName('id').asString;
  frmPriceChange.dsNaklo.DataSet.tag:=0;
  iResult :=frmPriceChange.ShowDetail1;
  if iResult = mrCancel then begin
    //пользователь нажал отмену
    exit;
  end;
  DataSet:=frmPriceChange.mtePriceDetGen;
  //если отмена?
  if DataSet.Active then begin
    TMemTableEh(DataSet).EmptyTable;
    DataSet.Close;
  end else begin
    TMemTableEh(DataSet).CreateDataSet;
  end;
  DataSet.Open;
  //detail copy
  dsNaklot.DataSet.first;
  while not  dsNaklot.DataSet.Eof do begin
    DataSet.Insert;
    DataSet.FieldByName('id_tovar').AsInteger:=
      dsNaklot.DataSet.FieldByName('id_tovar').AsInteger;
    DataSet.FieldByName('cena').AsFloat:=
      dsNaklot.DataSet.FieldByName('cena').AsFloat;
    DataSet.Post;
    dsNaklot.DataSet.Next;
  end;
  frmPriceChange.CreateDetailFromMem;
except
  AssertInternal('2329A40A-C704-420C-A8BC-FDDFA22D51C8');
end;
end;

procedure TfrmSpec.actPostExecute(Sender: TObject);
begin
  dmdEx.PostNakl(
    TIntegerField(cdsNaklo.FieldByName('posted')),
    sdsPost,
    TIntegerField(cdsNaklo.FieldByName('id_nakl')),
    not actPost.Checked);
end;

procedure TfrmSpec.cdsNaklotSKIDKAChange(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    FromCenaRecount(5,dsNaklo.DataSet,dsNaklot.DataSet, 1,
      VarToInt(dsNaklo.DataSet.FieldByName('id_price').asVariant, true),
      dsNaklo.DataSet.FieldByName('id_currency').asInteger);
    Semaphore := false;
  end;
end;

procedure TfrmSpec.cdsNaklotID_TOVARChange(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    FromCenaRecount(5,dsNaklo.DataSet,dsNaklot.DataSet, 1,
      VarToInt(dsNaklo.DataSet.FieldByName('id_price').asVariant, true),
      dsNaklo.DataSet.FieldByName('id_currency').asInteger);
    Semaphore := false;
  end;
end;

end.

