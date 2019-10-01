unit RasxPoKasse;
interface

uses
  Windows, Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms,
  Dialogs, DBCtrls, ToolWin, ComCtrls, Grids,
  DBGrids,
  ExtCtrls, Buttons,DB,
  Mask, FMTBcd, DBClient, Provider, SqlExpr, Menus, QueryExtender,
  ActnList, untUnfDbLookupListbox, StdCtrls, untEx,untRound,
  //custom units
  untSettings, untUnfListBox, //Transh,
  untListBoxPosit,
  ActnMan, ActnCtrls ,
  untPrixDet ,
  SettingsPlugin, //TfmSettingsPlugin
  RasxPoKasseEdit, //TfrmRasxPoKasseEdit
  atsAssert, //AssertInternal
  StrUtils, DBGridEh,

  PropStorageEh, UnfFilter, PropFilerEh, GridsEh //AnsiStartsText
;

type

  TfrmRasxPoKasse = class(TForm)
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    actFullTransh: TAction;
    actPartTransh: TAction;
    actClearNakl: TAction;
    actClearOpl: TAction;
    dsNaklo: TDataSource;
    dsNaklot: TDataSource;
    qeNaklot: TQueryExtender;
    dsTemp: TDataSource;
    actGrid1ListShow: TAction;
    actClearOplaty: TAction;
    actRefresh: TAction;
    actShowDet: TAction;
    actNerazn: TAction;
    actAllOpl: TAction;
    actAllNakl: TAction;
    actSettings: TAction;
    actApply: TAction;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    actFinance: TAction;
    sdsPlat: TSQLDataSet;
    dspPlat: TDataSetProvider;
    cdsNaklo: TClientDataSet;
    cdsNaklot: TClientDataSet;
    dspNaklr: TDataSetProvider;
    sdsNaklr: TSQLDataSet;
    cdsNakloIDI: TIntegerField;
    cdsNakloDAT: TSQLTimeStampField;
    cdsNakloZAK: TStringField;
    cdsNakloIZG: TStringField;
    cdsNakloPRIM: TStringField;
    cdsNakloID_MANAGER: TIntegerField;
    stpTransh: TSQLDataSet;
    qeNaklo: TQueryExtender;
    cdsNakloMANAGER: TStringField;
    cdsNaklotID: TStringField;
    cdsNaklotDAT: TSQLTimeStampField;
    cdsNaklotNDS: TFMTBCDField;
    sdsFinTransh: TSQLDataSet;
    stpClearTransh: TSQLDataSet;
    cdsNakloID_ZAK: TIntegerField;
    cdsNakloID_IZG: TIntegerField;
    cdsNakloOPL: TFMTBCDField;
    cdsNakloID: TStringField;
    cdsNakloPOSTED: TSmallintField;
    sdsOplatyPost: TSQLDataSet;
    sdsDelmark: TSQLDataSet;
    actPost: TAction;
    actUnpost: TAction;
    sdsPost: TSQLDataSet;
    sdsUnpost: TSQLDataSet;
    actShowDeleted: TAction;
    actUndeleteNakl: TAction;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N3: TMenuItem;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    UnfFilter1: TUnfFilter;
    cdsNakloPARENT_ID_NAKL: TIntegerField;
    cdsNakloZATRATY: TFMTBCDField;
    cdsNakloKURS: TFloatField;
    cdsNakloID_CURRENCY: TSmallintField;
    cdsNakloCURRENCY: TStringField;
    cdsNakloKURS_INDIRECT: TSmallintField;
    actKursChange: TAction;
    dbgNaklot: TDBGridEh;
    Panel1: TPanel;
    Panel4: TPanel;
    BitBtn2: TBitBtn;
    btnUnpost: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn7: TBitBtn;
    dbgNaklo: TDBGridEh;
    Splitter1: TSplitter;
    cdsNaklotID_NAKL: TIntegerField;
    cdsNaklotOTKAT: TFloatField;
    cdsNaklotSUB1: TIntegerField;
    cdsNaklotSUB2: TIntegerField;
    cdsNaklotSUB3: TIntegerField;
    cdsNakloOSTATOK: TFloatField;
    sdsPlatID_NAKL: TIntegerField;
    sdsPlatDAT: TSQLTimeStampField;
    sdsPlatID_ZAK: TIntegerField;
    sdsPlatID_IZG: TIntegerField;
    sdsPlatNDS: TFMTBCDField;
    sdsPlatCOMMENT: TStringField;
    sdsPlatID_MANAGER: TIntegerField;
    sdsPlatID: TStringField;
    sdsPlatPOSTED: TSmallintField;
    sdsPlatPARENT_ID_NAKL: TIntegerField;
    sdsPlatZATRATY: TFMTBCDField;
    sdsPlatKURS: TFloatField;
    sdsPlatID_CURRENCY: TSmallintField;
    sdsPlatKURS_INDIRECT: TSmallintField;
    sdsPlatOSTATOK: TFloatField;
    actDebug: TAction;
    N2: TMenuItem;
    cdsNaklotDAT_FIRST: TSQLTimeStampField;
    cdsNaklotOSTATOK: TFloatField;
    sdsNaklrID: TStringField;
    sdsNaklrDAT: TSQLTimeStampField;
    sdsNaklrSUB1: TIntegerField;
    sdsNaklrSUB2: TIntegerField;
    sdsNaklrSUB3: TIntegerField;
    sdsNaklrID_NAKL: TIntegerField;
    sdsNaklrOTKAT: TFloatField;
    sdsNaklrDAT_FIRST: TSQLTimeStampField;
    sdsNaklrOSTATOK: TFloatField;
    sdsNaklrNDS: TFMTBCDField;
    actShowRealPrice: TAction;
    PopupMenu1: TPopupMenu;
    N7: TMenuItem;
    N8: TMenuItem;
    actShowRepDolgNal: TAction;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    N9: TMenuItem;
    sdsBank: TSQLDataSet;
    sdsBankID: TIntegerField;
    sdsBankBANK_NAME: TStringField;
    sdsBankRASCH: TStringField;
    sdsBankMFO: TFloatField;
    sdsBankID_KLIENT: TIntegerField;
    sdsBankID_CURRENCY: TIntegerField;
    sdsBankDELMARKED: TSmallintField;
    sdsBankFULLNAME: TStringField;
    dspBank: TDataSetProvider;
    cdsBank: TClientDataSet;
    cdsBankID: TIntegerField;
    cdsBankBANK_NAME: TStringField;
    cdsBankRASCH: TStringField;
    cdsBankMFO: TFloatField;
    cdsBankID_KLIENT: TIntegerField;
    cdsBankID_CURRENCY: TIntegerField;
    cdsBankDELMARKED: TSmallintField;
    cdsBankFULLNAME: TStringField;
    dsBank: TDataSource;
    sdsPlatID_SCHET: TIntegerField;
    sdsPlatID_VLAD_SCHET: TIntegerField;
    cdsNakloID_SCHET: TIntegerField;
    cdsNakloID_VLAD_SCHET: TIntegerField;
    cdsNakloVLAD_SCHET: TStringField;
    cdsNakloBANK_FROM: TStringField;
    sdsPlatNDS_FROM: TFMTBCDField;
    cdsNakloNDS_FROM: TFMTBCDField;
    btnSettings: TBitBtn;
    Button1: TButton;
    sdsPlatID_XOZ_OPER: TIntegerField;
    cdsNakloID_XOZ_OPER: TIntegerField;
    sdsXozoper: TSQLDataSet;
    dspXozOper: TDataSetProvider;
    cdsXozOper: TClientDataSet;
    cdsXozOperOID: TIntegerField;
    cdsXozOperNAME: TStringField;
    cdsXozOperFULLNAME: TStringField;
    dsXozOper: TDataSource;
    cdsNakloXOZOPER: TStringField;
    procedure actFullTranshExecute(Sender: TObject);
    procedure actClearOplExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
		procedure cdsNakloAfterInsert(DataSet: TDataSet);
    procedure cdsNakloBeforeScroll(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure actGrid1ListShowExecute(Sender: TObject);
    procedure udgGrid1DblClick(Sender: TObject);
    procedure actClearOplatyExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure actShowDetExecute(Sender: TObject);
    procedure actSettingsExecute(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
    procedure actFinanceExecute(Sender: TObject);
    procedure cdsNakloReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsNaklotReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure dspPlatBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dbgNakloDblClick(Sender: TObject);
    procedure actPostExecute(Sender: TObject);
    procedure actUnpostExecute(Sender: TObject);
    procedure actUndeleteNaklExecute(Sender: TObject);
    procedure actShowDeletedExecute(Sender: TObject);
    procedure dbgNakloKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dspPlatGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure cdsNakloAfterScroll(DataSet: TDataSet);
    procedure actDebugExecute(Sender: TObject);
    procedure actShowRealPriceExecute(Sender: TObject);
    procedure cdsNaklotBeforeOpen(DataSet: TDataSet);
    procedure actShowRepDolgNalExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    setT : TfrmSettings;
    SettingsVlad : TfmSettingsPlugin;
    SettingsClient : TfmSettingsPlugin;
    frmEdit : TfrmRasxPoKasseEdit;
    FidSchet : integer;
    FbScrollLowerGrid : boolean;
    function ShowDetail1:integer;
    procedure ProcessSettings;
    procedure ProcessShowDeleted;
    procedure ChangeOstatki(dTransh : double);
    procedure FillSettings;
    function  GetDefXozOper : integer;
  public
    { Public declarations }
    procedure DefaultStartup;
    function Defaultopen:boolean;
  end;

var
	frmRasxPoKasse: TfrmRasxPoKasse;

implementation

uses
  skladAux, //DefaultOpenInputForm
  DateUtils, //Today
  RepDolgNal, //TfrmRepDolgNal
  untRealPrice //TfrmRealPrice
;


{$R *.dfm}

procedure TfrmRasxPoKasse.actFullTranshExecute(Sender: TObject);
begin
	stpTransh.ParamByName('type1').AsInteger := dmdEx.getoidobjects('РАСХОД ПО КАССЕ',-100);
  stpTransh.ParamByName('type2').AsInteger := dmdEx.getoidobjects('РАСХОДНЫЕ НАКЛАДНЫЕ',-100);
  stpTransh.ParamByName('what_id').AsInteger := 1;
  stpTransh.ParamByName('id1').AsInteger :=
    dsNaklo.Dataset.fieldbyname('id_nakl').AsInteger;
  stpTransh.ParamByName('id2').AsInteger :=
    dsNaklot.DataSet.fieldbyname('id_nakl').AsInteger;

  dsNaklo.Dataset.CheckBrowseMode;
  actApply.Execute;
	dmdex.ExecSQL(stpTransh);
  if (stpTransh.ParamByName('result').asCurrency >0) then begin
    StatusBar1.SimpleText := 'Переведена с платежа №'+
      dsNaklo.Dataset.fieldbyname('id').AsString + ' на накладную №'+
      dsNaklot.DataSet.fieldbyname('id').AsString + ' сумма: ' +
      format('%8.2f',[stpTransh.ParamByName('result').asFloat]);
    ChangeOstatki(stpTransh.ParamByName('result').asFloat);
  end;
  //qeNaklo.Refresh;
end;

procedure TfrmRasxPoKasse.actClearOplExecute(Sender: TObject);
begin
  dsNaklo.DataSet.CheckBrowseMode;

  actApply.Execute;
  actClearOplaty.Execute;
	qeNaklo.Refresh;
  if (stpTransh.ParamByName('result').asInteger>=1) then begin
    StatusBar1.simpletext := 'Платёж был успешно сброшен';
  end
  else begin
    StatusBar1.SimpleText := 'Платёж не был сброшен !!!';
  end;
end;

procedure TfrmRasxPoKasse.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	//если остались неприменённые изменения
	actApply.Execute;
	if not actApply.Checked then begin
		if (MessageDlg('Вы закрыть несмотря на ошибки',mtConfirmation ,
			[mbOk, mbCancel	],0) = mrOk) then begin

		end;
	end;
	Action := caFree;
	{
	ApplyOrCancel(qurQuery1);
	if ((qurQuery1.UpdatesPending = true)
		or (qurQuery2.UpdatesPending = true)) then begin
		if (MessageDlg('Вы хотите сохранить изменения',mtConfirmation ,
		[mbOk, mbCancel	],0) = mrOk) then begin

		end;//dlg
	end;//pending
	}
//	Action := caFree;
end;


procedure TfrmRasxPoKasse.FormCreate(Sender: TObject);

begin
	dmdEx.OpenQuery(dmdEx.cdsVlad);
	dmdEx.OpenQuery(dmdEx.cdsClient);
	dmdEx.OpenQuery(dmdEx.cdsManager);

	qeNaklo.DefSql:=sdsPlat.CommandText;
	qeNaklot.DefSql:=sdsNaklr.CommandText;

  FillSettings;

  frmEdit := TfrmRasxPoKasseEdit.Create(self);
  frmEdit.dsNakloEdit.DataSet := cdsNaklo;

  FidSchet := dmdEx.getoidObjects('ТИП СЧЕТА',-100);
  FidSchet := dmdEx.getoidObjects('НАЛИЧНЫЕ ДОЛГИ',FidSchet);
  cdsNaklo.Params.ParamByName('id_schet').AsInteger := FidSchet;
  FbScrollLowerGrid := true;
end;


function TfrmRasxPoKasse.Defaultopen:boolean;
begin
  ProcessSettings;
  //Result :=dmdEx.Defaultopen(qeNaklo.Query,actRefresh);
  Result:=DefaultOpenInputForm(qeNaklo);
end;

procedure TfrmRasxPoKasse.cdsNakloAfterInsert(DataSet: TDataSet);
begin
	Dataset.FieldByName('id_nakl').AsInteger :=
		dmdEx.GetGenValue('naklo_gen');
	Dataset.FieldByName('id').AsInteger :=
		Dataset.FieldByName('id_nakl').AsInteger;
  DataSet.FieldByName('posted').asInteger := 0;
  DataSet.FieldByName('nds').asFloat := 0;
  //DataSet.FieldByName('nds_from').AsFloat := 0;
  //валюта платежа по умолчанию
  DataSet.FieldByName('id_currency').asInteger := dmdEx.GetIdCurrencyUAH;
  //валюта исходная
  DataSet.FieldByName('kurs').asFloat := 1;
  DataSet.FieldByName('kurs_indirect').asInteger := 0;
  DataSet.FieldByName('dat').asDateTime := Today;
  DataSet.FieldByName('zatraty').asFloat := 5; // 5% по умолчанию % комиссии
  DataSet.FieldByName('id_vlad_schet').asInteger := dmdEx.cdsVlad.Lookup('name','нал','id');
  DataSet.FieldByName('id_schet').asInteger := dmdEx.cdsBank.Lookup('fullname','нал счёт','oid');
  DataSet.FieldByName('id_xoz_oper').asInteger := GetDefXozOper;
  ShowDetail1;
end;

function  TfrmRasxPoKasse.GetDefXozOper : integer;
var
  iXozOperFact : integer;
begin
  iXozOperFact:=dmdEx.GetParamCached('ХОЗЯЙСТВЕННЫЕ ОПЕРАЦИИ',
    'select oid from GET_OID_OBJECTS_PC('+quotedstr('ХОЗЯЙСТВЕННЫЕ ОПЕРАЦИИ')+',-100)',
    'oid');
  Result :=dmdEx.GetParamCached('РАСХОД ПО КАССЕ ОБЫЧНЫЙ',
    'select oid from GET_OID_OBJECTS_PC('
      +quotedstr('РАСХОД ПО КАССЕ ОБЫЧНЫЙ')
      +','+inttostr(iXozOperFact)+')',
    'oid');
end;

procedure TfrmRasxPoKasse.cdsNakloBeforeScroll(DataSet: TDataSet);
begin
	ApplyOrCancel(DataSet);
  qeNaklot.SavePosition;
end;

procedure TfrmRasxPoKasse.FormDestroy(Sender: TObject);
begin
try
  dmdEx.CloseQuery(dmdEx.cdsVlad,false);
  dmdEx.CloseQuery(dmdEx.cdsClient,false);
  dmdEx.CloseQuery(dmdEx.cdsManager,false);
	frmEdit.Free;
  setT.Free;
except
  AssertInternal('56C666AE-A116-45CB-A6FB-6F112B71BB4C');
end;
end;

//обрабатывает выбор пользователем даты и прописывает заголовок

procedure TfrmRasxPoKasse.actGrid1ListShowExecute(Sender: TObject);
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


function TfrmRasxPoKasse.ShowDetail1:integer;
begin
  Result := dmdEx.ShowDetail1(dsNaklo.DataSet,frmEdit);
end;

procedure TfrmRasxPoKasse.udgGrid1DblClick(Sender: TObject);
begin
	actGrid1ListShow.Execute;
end;

procedure TfrmRasxPoKasse.actClearOplatyExecute(Sender: TObject);
begin
	stpClearTransh.ParamByName('type1').AsInteger :=
    dmdEx.GetOidObjects('РАСХОД ПО КАССЕ',-100);
	stpClearTransh.ParamByName('id1').AsInteger :=
		dsNaklo.DataSet.fieldbyname('id_nakl').AsInteger;
//	stpClearTransh.ParamByName('what_id').AsInteger :=4;
	try
		dmdEx.ExecSQL(stpClearTransh,false);
	except
		on E:EDatabaseError do begin
			if AnsiStartsText('no permission', e.message) then begin
				MessageDlg ('Только бухгалтерия имеет право сбрасывать платежи',mtWarning,[mbOK],0);
			end
			else begin
				showmessage (e.message);
			end; //if
		end;
	end;
end;

procedure TfrmRasxPoKasse.actRefreshExecute(Sender: TObject);
begin
  dmdEx.startwaiting;
  qeNaklot.SavePosition;
  FbScrollLowerGrid := false;
  qeNaklot.Query.Close;
  qeNaklo.Refresh;
  FbScrollLowerGrid := true;
  qeNaklot.Refresh;
  dmdEx.stopwaiting;
end;

procedure TfrmRasxPoKasse.actShowDetExecute(Sender: TObject);
var
  frmPrixDet : TfrmPrixDet;
begin
	frmPrixDet := TfrmPrixDet.Create (Self);
	frmPrixDet.ShowDet(
    cdsNaklo.FieldByName('id_nakl').AsInteger,
		cdsNaklot.FieldByName('id_nakl').AsInteger
  );
  //frmPrixDet.Free;
end;

procedure TfrmRasxPoKasse.actSettingsExecute(Sender: TObject);
begin
  actApply.Execute;
  actSettings.checked := setT.ProcessSettingsChange2(DefaultOpen);
  //actSettings.checked := setT.ProcessSettingsChange(actRefresh);
end;

procedure TfrmRasxPoKasse.ProcessSettings;
begin
try
  self.Caption :='Расходы по кассе: '
    +'Менеджер: '+setT.Manager + '. Период: c ' + datetostr (setT.DateFrom)
    + ' по '+ datetostr(setT.DateTo)+'.';
  if (setT.IDManager<>0) then begin
    qeNaklo.SetSQL('where',
      'id_manager='+ inttostr(setT.IDManager),0);
  end
  else begin
    qeNaklo.SetSQL('where',
      '',0);
  end;
  qeNaklo.SetSQL('where',
    'dat>='+ QuotedStr(datetostr(setT.DateFrom)),1);
  qeNaklo.SetSQL('where',
    'dat<='+ QuotedStr(datetostr(setT.DateTo))  ,2);
  ProcessShowDeleted;
  qeNaklo.ProcessPlugin(
    'id_izg',
    setT.GetPluginResult('fmSettingsVlad'),
    4);
  qeNaklo.ProcessPlugin(
    'id_zak',
    setT.GetPluginResult('fmSettingsClient'),
    5);
  qeNaklo.Prepare;
except
  AssertInternal('43F89656-56F6-40F9-8B54-C59B2ECD26E2');
end;
end;

//////////////////////////////////////////////////////////
//appling changes
procedure TfrmRasxPoKasse.actApplyExecute(Sender: TObject);
begin
	actApply.Checked := false;
	if PostAndApply(cdsNaklo)=0 then begin
		if PostAndApply(cdsNaklot)=0 then begin
			actApply.Checked := true;
		end;
	end;
end;

procedure TfrmRasxPoKasse.actFinanceExecute(Sender: TObject);
begin
{
  qeNaklo.Refresh;
	if (qurQuery1.FieldByName('ostatok').AsCurrency<>0) then begin
		sdsFinTransh.ParamByName('id').AsInteger :=
			qurQuery1.FieldbyName('id_nakl').AsInteger;
		dmdEx.execsql(sdsFinTransh);
    qeNaklo.Refresh;
		qeNaklot.Refresh;
	end else begin  //if
		showmessage ('Остаток платежа = 0, нечем оплачивать.');
	end; //if
}
end;

procedure TfrmRasxPoKasse.cdsNakloReconcileError(
	DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
	showmessage(e.Message);
	Action := raAbort;
end;

procedure TfrmRasxPoKasse.cdsNaklotReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
	showmessage(e.Message);
	Action := raAbort;
end;

procedure TfrmRasxPoKasse.dspPlatBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
begin
  if (ukDelete=UpdateKind) and (SourceDS.name='sdsPlat') then begin
    Applied:=false;
    sdsDelmark.ParamByName('id_nakl').AsInteger:=
      DeltaDS.fieldByName('id_nakl').asInteger;
		dmdEx.ExecSQL(sdsDelmark);
    Applied:=true;
  end;
end;

procedure TfrmRasxPoKasse.dbgNakloDblClick(Sender: TObject);
begin
  actGrid1ListShow.Execute;
end;

procedure TfrmRasxPoKasse.actPostExecute(Sender: TObject);
begin
  dmdEx.PostNakl(
    TIntegerField(cdsNaklo.FieldByName('posted')),
    sdsPost,
    TIntegerField(cdsNaklo.FieldByName('id_nakl')),
    not actPost.Checked);
  with dsNaklo.DataSet do begin
    Edit;
    FieldByName('ostatok').asFloat := FieldByName('nds').asFloat;
    Post;
  end;
end;

procedure TfrmRasxPoKasse.actUnpostExecute(Sender: TObject);
begin
  dmdEx.UnPostNakl(
    TIntegerField(cdsNaklo.FieldByName('posted')),
    sdsUnPost,
    TIntegerField(cdsNaklo.FieldByName('id_nakl')),
    not actUnpost.Checked);
  with dsNaklo.DataSet do begin
    Edit;
    FieldByName('ostatok').Clear;
    Post;
  end;
end;


procedure TfrmRasxPoKasse.ProcessShowDeleted;
begin
  if actShowDeleted.Checked then begin
		qeNaklo.SetSQL ('where','delmarked=1',3);
  end
  else begin
    qeNaklo.SetSQL ('where','delmarked=0',3);
  end;//checked
  qeNaklo.prepare;
end;

procedure TfrmRasxPoKasse.DefaultStartup;
begin
try
  setT.IDManager:=dmdEx.GetIdManager; // all
  setT.SetPeriod(2);
  ProcessSettings;
except
  AssertInternal('3732FE67-BE35-4B68-8856-01BA9060A04E');
end;
end;

procedure TfrmRasxPoKasse.actShowDeletedExecute(Sender: TObject);
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

procedure TfrmRasxPoKasse.actUndeleteNaklExecute(Sender: TObject);
begin
  if actShowDeleted.Checked then begin
    dmdEx.UndeleteNaklo(TintegerField(dsNaklo.DataSet.FieldByName('delmarked')),actRefresh);
  end;
end;

procedure TfrmRasxPoKasse.dbgNakloKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_f8: begin
      if (MessageDlg('Вы хотите удалить документ?',
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
    vk_return:  begin
      actGrid1ListShow.Execute;
    end;
    vk_insert: begin
      cdsNaklo.Append;
    end;
  end; //case
end;


procedure TfrmRasxPoKasse.dspPlatGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
  TableName := 'RASXOD_NAL_VW';
end;

procedure TfrmRasxPoKasse.cdsNakloAfterScroll(DataSet: TDataSet);
begin
  with cdsNaklot do begin
    if FbScrollLowerGrid then begin
      Close;
      {Params.ParamByName('id_izg').AsInteger :=
        DataSet.FieldByName('id_izg').AsInteger;
      Params.ParamByName('id_zak').asInteger :=
        DataSet.FieldByName('id_zak').asinteger;
      Params.ParamByName('id_manager').asInteger :=
        DataSet.FieldByName('id_manager').asinteger;}
      Open;
      qeNaklot.GetPosition(False);
    end;
  end;//with

end;

procedure TfrmRasxPoKasse.actDebugExecute(Sender: TObject);
begin
  actDebug.Checked := not actDebug.Checked;
  if actDebug.Checked then begin
    columnByName(dbgNaklo.Columns,'ID_NAKL').Visible :=true;
    columnByName(dbgNaklot.Columns,'ID_NAKL').Visible :=true;
    dbgNaklo.SumList.Active := true;
    dbgNaklo.FooterRowCount := 1;
  end else begin //if actDebug.Checked
    columnByName(dbgNaklo.Columns,'ID_NAKL').Visible :=false;
    columnByName(dbgNaklot.Columns,'ID_NAKL').Visible :=false;
    dbgNaklo.SumList.Active := false;
    dbgNaklo.FooterRowCount := 0;
  end; //if actDebug.Checked
end;

procedure TfrmRasxPoKasse.ChangeOstatki(dTransh: double);
begin
  with dsNaklo.DataSet do begin
    edit;
    FieldByName('ostatok').AsFloat :=
      FieldByName('ostatok').AsFloat -
      dTransh;
    post;
  end;
  with dsNaklot.DataSet do begin
    edit;
    FieldByName('ostatok').AsFloat :=
      FieldByName('ostatok').AsFloat -
      dTransh;
    post;
  end;
end;

procedure TfrmRasxPoKasse.actShowRealPriceExecute(Sender: TObject);
var
  frmRealPrice : TfrmRealPrice;
begin
  if dsNaklo.DataSet.Eof and dsNaklo.DataSet.Bof then begin
     exit;
  end;
  frmRealPrice := TfrmRealPrice.Create(Application);
  frmRealPrice.qeNaklr.SetSQL('where','om.id_nakl='+
    dsNaklot.DataSet.FieldByName('id_nakl').AsString,5);
  frmRealPrice.actRefresh.Execute;
end;

procedure TfrmRasxPoKasse.FillSettings;
begin
	setT := TfrmSettings.create (self);

  SettingsVlad := setT.createplugin('TfmSettingsVlad');
  setT.AddPlugin(SettingsVlad);
  SettingsVlad.SetResultType(2);
  SettingsVlad.SetKeyValue(0);

  SettingsClient := setT.createplugin('TfmSettingsClient');
  setT.AddPlugin(SettingsClient);
end;

procedure TfrmRasxPoKasse.cdsNaklotBeforeOpen(DataSet: TDataSet);
begin
  with TClientDataSet(DataSet) do begin
    Params.ParamByName('id_izg').AsInteger :=
      dsNaklo.DataSet.FieldByName('id_izg').AsInteger;
    Params.ParamByName('id_zak').asInteger :=
      dsNaklo.DataSet.FieldByName('id_zak').asinteger;
    Params.ParamByName('id_manager').asInteger :=
      dsNaklo.DataSet.FieldByName('id_manager').asinteger;
  end;//with
end;

procedure TfrmRasxPoKasse.actShowRepDolgNalExecute(Sender: TObject);
var
  frmRepDolgNal :TfrmRepDolgNal;
begin
try
  frmRepDolgNal:=TfrmRepDolgNal.Create(Application);
  frmRepDolgNal.DefaultStartup;
  frmRepDolgNal.setT.GetPlugin('fmSettingsVlad').SetKeyValue(
    dsNaklo.DataSet.FieldByName('id_izg').asString
    );
  frmRepDolgNal.setT.GetPlugin('fmSettingsClient').SetKeyValue(
    dsNaklo.DataSet.FieldByName('id_zak').asString
    );
  frmRepDolgNal.Defaultopen;
except
  AssertInternal ('98B1D726-50A1-437B-889E-CD26032673B5');
end;
end;

procedure TfrmRasxPoKasse.FormShow(Sender: TObject);
begin
  dbgNaklo.SetFocus;
end;

end.
