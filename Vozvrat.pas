unit Vozvrat;

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
  SettingsPlugin,
  VozvratEdit,
  VozvratDet,
  Variants, //vararrayhighbound
  SettingsPost, frxClass, frxDBSet //TfmSettingsPost

  ;


type
	TfrmVozvrat = class(TForm)
		ActionList1: TActionList;
		actSettings: TAction;
		actGrid1ListShow: TAction;
		actRefresh: TAction;
		actGrid2ListShow: TAction;
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
    actUndeleteNakl: TAction;
    N8: TMenuItem;
    cdsNakloSKLAD: TStringField;
    cdsNakloCURRENCY: TStringField;
    sdsGetKurs: TSQLDataSet;
    sdsGetKursKURS: TFloatField;
    sdsNakloPARENT_ID_NAKL: TIntegerField;
    cdsNakloPARENT_ID_NAKL: TIntegerField;
    sdsNakloPARENT_ID: TStringField;
    cdsNakloPARENT_ID: TStringField;
    actAddDet: TAction;
    actChangeSpecForPosit: TAction;
    N11: TMenuItem;
    sdsSebestRecount: TSQLDataSet;
    actSebestRecount: TAction;
    actDetAddSum: TAction;
    sdsNakloID_CURRENCY_TO: TIntegerField;
    sdsNakloNDS_FROM: TFMTBCDField;
    sdsNakloKURS_INDIRECT: TSmallintField;
    cdsNakloID_CURRENCY_TO: TIntegerField;
    cdsNakloNDS_FROM: TFMTBCDField;
    cdsNakloKURS_INDIRECT: TSmallintField;
    cdsNakloCURRENCY_TO: TStringField;
    actDesign: TAction;
    frdNaklo: TfrxDBDataset;
    cdsNakloIZGFULLNAME: TStringField;
    cdsNakloZAKFULLNAME: TStringField;
    Curr2StrUA1: TCurr2StrRU;
    frdNaklot: TfrxDBDataset;
    actSebestRecountBux: TAction;
    actPost: TAction;
    actShowNaklr: TAction;
    N4: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    actUnpost: TAction;
    actShowNaklp: TAction;
    N6: TMenuItem;
    actShowNaklpOst: TAction;
    N9: TMenuItem;
    N10: TMenuItem;
    actRecountNakl: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actSettingsExecute(Sender: TObject);
		procedure actGrid1ListShowExecute(Sender: TObject);
    procedure dbgNaklrDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actGrid2ListShowExecute(Sender: TObject);
		procedure FormDeactivate(Sender: TObject);
		procedure cdsNakloAfterInsert(DataSet: TDataSet);
    procedure cdsNaklotAfterInsert(DataSet: TDataSet);
    procedure cdsNaklotBeforeInsert(DataSet: TDataSet);
		procedure cdsNaklotBeforeScroll(DataSet: TDataSet);
		procedure cdsNakloBeforeScroll(DataSet: TDataSet);
    procedure dbgNaklotDblClick(Sender: TObject);
    procedure dbgNakloDblClick(Sender: TObject);
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
    procedure actUndeleteNaklExecute(Sender: TObject);
    procedure dbgNakloKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgNaklotKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dspNakloGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure actAddDetExecute(Sender: TObject);

    procedure cdsNaklotCENANDSChange(Sender: TField);
    procedure cdsNaklotKOLOTPChange(Sender: TField);
    procedure cdsNaklotSUMAChange(Sender: TField);
    procedure cdsNaklotSUMANDSChange(Sender: TField);
    procedure cdsNaklotCENAChange(Sender: TField);
    procedure cdsNaklotCalcFields(DataSet: TDataSet);
    procedure cdsNaklotAfterDelete(DataSet: TDataSet);
    procedure dspNaklotGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure actPostExecute(Sender: TObject);
    procedure actShowNaklrExecute(Sender: TObject);
    procedure actUnpostExecute(Sender: TObject);
    procedure actShowNaklpExecute(Sender: TObject);
    procedure actShowNaklpOstExecute(Sender: TObject);
    procedure actRecountNaklExecute(Sender: TObject);
	private
		intNpp : integer; //номер позиции по порядку
		frmEdit : TfrmVozvratEdit;
		frmDet : TfrmVozvratDet;
    FiSklad : integer;// номер склада укк
    Semaphore : boolean;
    SettingsManager : TfmSettingsPlugin;
    SettingsVlad : TfmSettingsPlugin;
    SettingsClient : TfmSettingsPlugin;
		procedure ShowDetail2;
    function ShowDetail1:integer;
		procedure ProcessShowDeleted;
		procedure qurNaklrCommit;
    procedure ProcessSettings(ProcessOnlySecurityMeasures:boolean=false);
    //procedure RecountNakl;
    procedure FillSettings;

	public
		{ Public declarations }
		setT : TfrmSettings;
    procedure DefaultStartup;
    function DefaultOpen:boolean;

	end;
var
	frmVozvrat: TfrmVozvrat;

implementation

{$R *.dfm}

uses

  DetSelect, //TfrmDetSelect
  untNaklrList,
  SkladAux, //OpenDocument
  NaklpOstDet // TfrmNaklpOstDet

  ;

procedure TfrmVozvrat.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	Action := caFree;
end;

procedure TfrmVozvrat.actSettingsExecute(Sender: TObject);
begin
  actSettings.checked := setT.ProcessSettingsChange2(DefaultOpen);
end;

procedure TfrmVozvrat.actGrid1ListShowExecute(Sender: TObject);
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

procedure TfrmVozvrat.dbgNaklrDblClick(Sender: TObject);
begin
  actGrid1ListShow.Execute;
end;

procedure TfrmVozvrat.DefaultStartup;
begin
  SettingsManager.SetKeyValue(dmdEx.GetIdManager);
  //setT.SetPeriod(2);
  ProcessSettings;
end;

function  TfrmVozvrat.DefaultOpen:boolean;
begin
  ProcessSettings;
  Result:=DefaultOpenInputForm(qeNaklo);
end;
{
procedure TfrmVozvrat.DefaultOpen;
begin
try
	dmdEx.startWaiting;
  qeNaklo.Refresh;
	dmdEx.StopWaiting;
except
  AssertInternal('EDEE6ADF-1A02-42DD-8F41-20B8DEEF560D');
end;
end; }

procedure TfrmVozvrat.FormCreate(Sender: TObject);
begin
try
  dmdEx.StartWaiting;

  PropStorageEh1.Section := self.ClassName;
  PropStorageEh1.LoadProperties;
  PropStorageEh1.Active := true;

  dmdEx.OpenQuery(dmdEx.cdsVlad);
  dmdEx.OpenQuery(dmdEx.cdsClient);
  dmdEx.OpenQuery(dmdEx.cdsManager);
  dmdEx.OpenQuery(dmdEx.cdsTovarAll);
  dmdEx.OpenQuery(dmdEx.cdsTovarAllND);
  dmdEx.OpenQuery(dmdEx.cdsSklads);

  FillSettings;
	qeNaklo.DefSql := sdsNaklo.CommandText;

	ProcessShowDeleted;

  dmdEx.StopWaiting;
  frmEdit := TfrmVozvratEdit.Create(self);
  frmEdit.dsNakloEdit.DataSet := cdsNaklo;

  frmDet := TfrmVozvratDet.Create(self);
	frmDet.dsNaklotEdit.dataset :=  cdsNaklot;


  FiSklad := dmdEx.GetOidObjects('ТИП НАЗВАНИЯ СКЛАДОВ',-100);
  FiSklad := dmdEx.GetOidObjects('УКК Склад',FiSklad);
except
  AssertInternal('E69CC95E-E261-4389-801D-6A0E50FC8736');
end;
end;

procedure TfrmVozvrat.qurNaklrCommit;
begin
  PostAndApplyOrCancel(cdsNaklo);
end;

procedure TfrmVozvrat.actRefreshExecute(Sender: TObject);
begin
try
  dmdEx.StartWaiting;
	qurNaklrCommit;
  qeNaklo.Refresh;
  //defaultopen;
  dmdEx.StopWaiting;
except
  AssertInternal('FDA31B8B-F0AE-4CA0-87FF-9F81D08B92C0');
end;
end;

procedure TfrmVozvrat.FormDestroy(Sender: TObject);
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

procedure TfrmVozvrat.actGrid2ListShowExecute(Sender: TObject);
begin
  if (cdsNaklot.FieldByName('ID_NAKLD').AsInteger = 0) then begin
    cdsNaklot.Insert;
  end else begin
		ShowDetail2;
  end;
end;

procedure TfrmVozvrat.FormDeactivate(Sender: TObject);
begin
	qurNaklrCommit;
end;

procedure TfrmVozvrat.cdsNakloAfterInsert(DataSet: TDataSet);
begin
  dmdEx.StartWaiting;
  DataSet.FieldByName('id_nakl').AsInteger:= dmdEx.GetGenValue('naklo_gen');  //assign
  DataSet.FieldByName('id').AsString := DataSet.FieldByName('id_nakl').AsString;
  DataSet.FieldByName('dat').AsDateTime := Date; //default date. time=0
  DataSet.FieldByName('nalog_nds').AsFloat := dmdEx.GetNds ( Date );
  DataSet.FieldByName('kurs').asFloat := 1.0000;
  DataSet.FieldByName('id_sklad').asInteger := 0;
  DataSet.FieldByName('nds').AsFloat := 0;
	DataSet.FieldByName('posted').asInteger := 0;
  DataSet.FieldByName('delmarked').asInteger := 0;
  DataSet.FieldByName('blocked').asInteger := 0;
  DataSet.FieldByName('id_sklad').asInteger := FiSklad;
  DataSet.FieldByName('nds_from').AsFloat := 0;
  DataSet.FieldByName('id_currency').asInteger := dmdEx.GetIdCurrencyUAH;
  DataSet.FieldByName('id_currency_to').asInteger := dmdEx.GetIdCurrencyUAH;
  DataSet.FieldByName('kurs').asFloat := 1;
  DataSet.FieldByName('kurs_indirect').asInteger := 0;
  if dmdEx.GetIdManager<>0 then begin
    DataSet.FieldByName('id_manager').asInteger := dmdEx.GetIdManager;
  end;
  dmdEx.StopWaiting;
  ShowDetail1;
end;


procedure TfrmVozvrat.cdsNaklotAfterInsert(DataSet: TDataSet);
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
  dmdEx.StopWaiting;
	ShowDetail2;
end;

procedure TfrmVozvrat.cdsNaklotBeforeInsert(DataSet: TDataSet);
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

procedure TfrmVozvrat.cdsNaklotBeforeScroll(DataSet: TDataSet);
begin
try
  ApplyOrCancel (Dataset);
except
  AssertInternal('5D22C051-79E5-4B0B-9517-8E5B2754C1F8');
end;
end;

procedure TfrmVozvrat.cdsNakloBeforeScroll(DataSet: TDataSet);
begin
try
  ApplyOrCancel (Dataset);
except
  AssertInternal('BB8DE88F-3FA9-4C61-8D1B-82500D64440D');
end;
end;


procedure TfrmVozvrat.dbgNaklotDblClick(Sender: TObject);
begin
  actGrid2ListShow.Execute;
end;

procedure TfrmVozvrat.dbgNakloDblClick(Sender: TObject);
begin
  actGrid1ListShow.Execute;
end;


procedure TfrmVozvrat.dspNakloBeforeUpdateRecord(Sender: TObject;
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

procedure TfrmVozvrat.actShowDeletedExecute(Sender: TObject);
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
procedure TfrmVozvrat.ProcessShowDeleted;
begin
  if actShowDeleted.Checked then begin
		qeNaklo.SetSQL ('where','om.delmarked=1',5);
  end
  else begin
    qeNaklo.SetSQL ('where','om.delmarked=0',5);
  end;//checked
  qeNaklo.prepare;
end;

procedure TfrmVozvrat.ShowDetail2;
begin
 if dsNaklot.DataSet.Tag<>1 then begin
   frmDet.ShowDetail(
     cdsNaklo.fieldbyname('posted').asInteger);
   actRecountNakl.Execute;
 end;//tag<>1
end;

procedure TfrmVozvrat.cdsNakloReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  showmessage(e.message);
  Action := raCancel;
end;

procedure TfrmVozvrat.ProcessSettings(ProcessOnlySecurityMeasures:boolean=false);
begin
try
  ProcessSettingsVladClientManager(qeNaklo,setT,ProcessOnlySecurityMeasures);
  ProcessShowDeleted;
  self.Caption := UpdateCaptionVladClientManager('Возвратные накладные:',setT);
except
  AssertInternal('DB229E86-4A39-4997-A7AE-FA877A195323');
end;
end; 

procedure TfrmVozvrat.cdsNaklotReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  showmessage (e.Message);
  Action := raCancel;
end;

procedure TfrmVozvrat.actBlockExecute(Sender: TObject);
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

function TfrmVozvrat.ShowDetail1:integer;
begin
  Result := dmdEx.ShowDetail1(dsNaklo.DataSet,frmEdit,actRecountNakl);
  {
  Result :=0;
  if dsNaklo.DataSet.Tag <> 1 then begin
    if (frmEdit.Visible = false) then begin
      Result := frmEdit.ShowModal;
    end;
  end;
  RecountNakl;
  }
end;

procedure TfrmVozvrat.actUndeleteNaklExecute(Sender: TObject);
begin
  if actShowDeleted.Checked then begin
    dmdEx.UndeleteNakl(TintegerField(dsNaklo.DataSet.FieldByName('delmarked')),actRefresh);
  end;
end;

procedure TfrmVozvrat.dbgNakloKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmVozvrat.dbgNaklotKeyDown(Sender: TObject; var Key: Word;
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


procedure TfrmVozvrat.dspNakloGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
  TableName := 'VOZVRAT_VW';
end;

procedure TfrmVozvrat.actAddDetExecute(Sender: TObject);
var
  frmDetSelect : TfrmDetSelect;
begin
  if cdsNaklo.Eof and cdsNaklo.Bof then begin
    MessageDlg('Не выбрана накладная',mtWarning,[mbOk],0);
    exit;
  end;
  if cdsNaklo.FieldByName('parent_id_nakl').isNull then begin
    MessageDlg('Не выбрана родительская накладная',mtWarning,[mbOk],0);
    exit;
  end;
  frmDetSelect := TfrmDetSelect.Create(Self);
  frmDetSelect.ShowDet(
    cdsNaklo.FieldByName('parent_id_nakl').asInteger,
    cdsNaklo.FieldByName('id_nakl').asInteger,
    dmdEx.GetOidObjects('ВОЗВРАТЫ',-100)
  );
  frmDetSelect.DefaultStartUp;
    if frmDetSelect.GetSchet=mrOk then begin
      cdsNaklot.Refresh;
    end;
  frmDetSelect.Free;
  actRecountNakl.execute;
end;

procedure TfrmVozvrat.cdsNaklotCENANDSChange(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    FromCenaRecount(2,dsNaklo.DataSet,dsNaklot.Dataset,1);
    Semaphore := false;
  end;
end;

procedure TfrmVozvrat.cdsNaklotKOLOTPChange(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    FromCenaRecount(1,dsNaklo.DataSet,dsNaklot.Dataset,1);
    Semaphore := false;
  end;
end;

procedure TfrmVozvrat.cdsNaklotSUMAChange(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    FromCenaRecount(3,dsNaklo.DataSet,dsNaklot.Dataset,1);
    Semaphore := false;
  end;
end;

procedure TfrmVozvrat.cdsNaklotSUMANDSChange(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    FromCenaRecount(4,dsNaklo.DataSet,dsNaklot.DataSet,1);
    Semaphore := false;
  end;
end;

procedure TfrmVozvrat.cdsNaklotCENAChange(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    FromCenaRecount(6,dsNaklo.DataSet,dsNaklot.DataSet,1);
    Semaphore := false;
  end;
end;

procedure TfrmVozvrat.cdsNaklotCalcFields(DataSet: TDataSet);
begin
  if not Semaphore and (DataSet.state =dsInternalCalc) then begin
    Semaphore := true;
    FromCenaRecount(1,dsNaklo.DataSet,dsNaklot.DataSet,1);
    Semaphore := false;
  end;
end;

procedure TfrmVozvrat.cdsNaklotAfterDelete(DataSet: TDataSet);
begin
  actRecountNakl.Execute;
end;

procedure TfrmVozvrat.dspNaklotGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
  TableName := 'VOZVRAT_DET_VW';
end;


procedure TfrmVozvrat.FillSettings;
begin
  //Инициализация настроек
  setT := TfrmSettings.Create(self);
  setT.actManagerOff.execute;
  SettingsManager := setT.CreatePlugin('TfmSettingsManager');
  SettingsManager.SetResultType(2);
  //менеджеры из зоны видимости
  setT.addPlugin(SettingsManager);
  SettingsManager.SetKeyValue(dmdEx.GetIdManager);
  setT.SetPeriod(2);

  SettingsVlad := setT.CreatePlugin('TfmSettingsVlad');
  SettingsVlad.SetResultType(2);
  setT.addPlugin(SettingsVlad);
  
  SettingsClient := setT.CreatePlugin('TfmSettingsClient');
  setT.addPlugin(SettingsClient);
end;

procedure TfrmVozvrat.actPostExecute(Sender: TObject);
begin
  dmdEx.PostNakl(
    TIntegerField(cdsNaklo.FieldByName('posted')),
    sdsPost,
    TIntegerField(cdsNaklo.FieldByName('id_nakl')),
    not actPost.Checked);
end;



procedure TfrmVozvrat.actShowNaklrExecute(Sender: TObject);
begin
  if dsNaklo.DataSet.Eof and dsNaklo.DataSet.Bof then begin
    exit;
  end;
  OpenDocument(self,
    dsNaklo.DataSet.FieldByName('parent_id_nakl').asInteger,
    dmdEx.GetOidObjects('РАСХОДНЫЕ НАКЛАДНЫЕ',-100),
    0);
end;


procedure TfrmVozvrat.actUnpostExecute(Sender: TObject);
begin
  dmdEx.UnPostNakl(
    TIntegerField(cdsNaklo.FieldByName('posted')),
    sdsUnPost,
    TIntegerField(cdsNaklo.FieldByName('id_nakl')),
    not actUnpost.Checked);
end;

procedure TfrmVozvrat.actShowNaklpExecute(Sender: TObject);
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


procedure TfrmVozvrat.actShowNaklpOstExecute(Sender: TObject);
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

procedure TfrmVozvrat.actRecountNaklExecute(Sender: TObject);
begin
  dmdEx.CalculateSumNaklo(cdsNaklo,cdsNaklot,2);
end;


end.

