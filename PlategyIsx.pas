unit PlategyIsx;
   { TODO : Фильтр должен показывать только существующие фирмы }
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
  PlategyEdit, //TfrmPlategyEdit
  atsAssert, //AssertInternal
  StrUtils, //AnsiStartsText
  Naklru, //TfrmNaklru.CreateDocFromMem
  DBGridEh,
  SkladAux,
  PropStorageEh,
  UnfFilter, PropFilerEh, GridsEh

;

type

  TfrmPlategyIsx = class(TForm)
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    actFullTransh: TAction;
    actPartTransh: TAction;
    actClearNakl: TAction;
    actClearOpl: TAction;
    dsNaklo: TDataSource;
    qeNaklot: TQueryExtender;
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
    cdsNakloIDI: TIntegerField;
    cdsNakloDAT: TSQLTimeStampField;
    cdsNakloZAK: TStringField;
    cdsNakloIZG: TStringField;
    cdsNakloPRIM: TStringField;
    cdsNakloID_MANAGER: TIntegerField;
    qeNaklo: TQueryExtender;
    cdsNakloMANAGER: TStringField;
    sdsPlatDAT: TSQLTimeStampField;
    sdsPlatID_MANAGER: TIntegerField;
    sdsPlatID_ZAK: TIntegerField;
    sdsPlatID_IZG: TIntegerField;
    cdsNakloID_ZAK: TIntegerField;
    cdsNakloID_IZG: TIntegerField;
    cdsNakloOPL: TFMTBCDField;
    sdsPlatID: TStringField;
    cdsNakloID: TStringField;
    sdsPlatPOSTED: TSmallintField;
    cdsNakloPOSTED: TSmallintField;
    sdsPlatID_NAKL: TIntegerField;
    sdsPlatNDS: TFMTBCDField;
    sdsPlatCOMMENT: TStringField;
    sdsDelmark: TSQLDataSet;
    dbgNaklo: TDBGridEh;
    Panel4: TPanel;
    BitBtn2: TBitBtn;
    btnUnpost: TBitBtn;
    BitBtn7: TBitBtn;
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
    sdsPlatID_SKLAD: TIntegerField;
    cdsNakloID_SKLAD: TIntegerField;
    cdsNakloBANK_FROM: TStringField;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    UnfFilter1: TUnfFilter;
    sdsPlatPARENT_ID_NAKL: TIntegerField;
    sdsPlatZATRATY: TFMTBCDField;
    sdsPlatKURS: TFloatField;
    cdsNakloPARENT_ID_NAKL: TIntegerField;
    cdsNakloZATRATY: TFMTBCDField;
    cdsNakloKURS: TFloatField;
    sdsPlatID_CURRENCY: TSmallintField;
    cdsNakloID_CURRENCY: TSmallintField;
    cdsNakloCURRENCY: TStringField;
    cdsNakloCURRENCY_TO: TStringField;
    sdsPlatID_CURRENCY_TO: TIntegerField;
    sdsPlatKURS_INDIRECT: TSmallintField;
    sdsPlatNDS_FROM: TFMTBCDField;
    cdsNakloID_CURRENCY_TO: TIntegerField;
    cdsNakloKURS_INDIRECT: TSmallintField;
    cdsNakloNDS_FROM: TFMTBCDField;
    actKursChange: TAction;
    BitBtn3: TBitBtn;
    BitBtn6: TBitBtn;
    sdsXozoper: TSQLDataSet;
    dspXozOper: TDataSetProvider;
    cdsXozOper: TClientDataSet;
    dsXozOper: TDataSource;
    cdsXozOperOID: TIntegerField;
    cdsXozOperNAME: TStringField;
    cdsXozOperFULLNAME: TStringField;
    sdsPlatID_SKLAD_TO: TIntegerField;
    cdsNakloID_SKLAD_TO: TIntegerField;
    cdsNakloXOZ_OPER: TStringField;
    actDebug: TAction;
    N2: TMenuItem;
    actCreateNaklpBux: TAction;
    N7: TMenuItem;
    PopupMenu1: TPopupMenu;
    N8: TMenuItem;
    actMakePlategyIsx: TAction;
    actMakePlategFromPlateg: TAction;
    actCreateNaklpu: TAction;
    N9: TMenuItem;
    actCreatePlategyIsx: TAction;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
		procedure cdsNakloAfterInsert(DataSet: TDataSet);
    procedure cdsNakloBeforeScroll(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure actGrid1ListShowExecute(Sender: TObject);
    procedure udgGrid1DblClick(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure actShowDetExecute(Sender: TObject);
    procedure actSettingsExecute(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
    procedure cdsNakloReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure qurQuery2ReconcileError(DataSet: TCustomClientDataSet;
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
    procedure actDebugExecute(Sender: TObject);
    procedure actCreateNaklpBuxExecute(Sender: TObject);
    procedure actMakePlategyIsxExecute(Sender: TObject);
    procedure actMakePlategFromPlategExecute(Sender: TObject);
    procedure actCreateNaklpuExecute(Sender: TObject);
    procedure actCreatePlategyIsxExecute(Sender: TObject);
  private
    setT : TfrmSettings;
    SettingsVlad : TfmSettingsPlugin;
    //Vlad;
    SettingsPost : TfmSettingsPlugin;
    SettingsManager : TfmSettingsPlugin;
    frmEdit : TfrmPlategyEdit;
    function ShowDetail1:integer;
    procedure ProcessShowDeleted;
    procedure FillSettings;
    procedure ProcessSettings(ProcessOnlySecurityMeasures:boolean=false);
    procedure TestInsert;
    procedure TestCreateNaklpu;
    procedure TestCreatePlategIsx;
    procedure ShowForBuxgAndPoweruser;
    function CreateDocFromMemNaklru(frmF: TfrmNaklru;slHead:TStringList):integer;
    function CreateDocFromMemPlategIsx(slHead:TStringList):integer;
    procedure CreateDocFromMemNaklpbux(slHead:TStringList);
    function FillSlHead(DataSet:TDataSet):TStringList;
  public
    { Public declarations }
    procedure DefaultStartup;
    function Defaultopen:boolean;
    procedure Test;
    function CreateDocFromMem(slHead:TStringList):integer;
  end;

var
	frmPlategyIsx: TfrmPlategyIsx;

implementation

uses DateUtils, //Today
  NaklpBux, //TfrmNaklpBux
  Naklpu2, //TfrmNaklpu2
  Naklrf   //TfrmNaklrf.CreateFromMem
;


{$R *.dfm}


procedure TfrmPlategyIsx.FormClose(Sender: TObject;
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
end;


procedure TfrmPlategyIsx.FormCreate(Sender: TObject);
begin
	dmdEx.OpenQuery(dmdEx.cdsVlad);
	dmdEx.OpenQuery(dmdEx.cdsClient);
	dmdEx.OpenQuery(dmdEx.cdsManager);

	qeNaklo.DefSql:=sdsPlat.CommandText;

	setT := TfrmSettings.create (self);
  FillSettings;
  ProcessSettings(true);

  frmEdit := TfrmPlategyEdit.Create(self);
  frmEdit.dsNakloEdit.DataSet := cdsNaklo;
end;


function TfrmPlategyIsx.Defaultopen:boolean;
begin
  ProcessSettings;
  Result:=DefaultOpenInputForm(qeNaklo);
  //Result :=dmdEx.Defaultopen(qeNaklo.Query,actRefresh);
end;

procedure TfrmPlategyIsx.cdsNakloAfterInsert(DataSet: TDataSet);
begin
	Dataset.FieldByName('id_nakl').AsInteger :=
		dmdEx.GetGenValue('naklo_gen');
	Dataset.FieldByName('id').AsInteger :=
		dmdEx.GetGenValue('oplaty_gen');
  DataSet.FieldByName('posted').asInteger := 0;
  DataSet.FieldByName('nds').asFloat := 0;
  DataSet.FieldByName('nds_from').AsFloat := 0;
  DataSet.FieldByName('kurs').asFloat := 1;
  DataSet.FieldByName('kurs_indirect').asInteger := 0;
  DataSet.FieldByName('dat').asDateTime := Today;
  DataSet.FieldByName('id_manager').asInteger := dmdEx.getIdManager;
  DataSet.FieldByName('id_sklad_to').asInteger :=
    dsXozOper.Dataset.Lookup('name','ОПЛАТА ПОСТАВЩИКАМ ТОВАРОВ','oid');
  ShowDetail1;
end;

procedure TfrmPlategyIsx.cdsNakloBeforeScroll(DataSet: TDataSet);
begin
	ApplyOrCancel(DataSet);
end;

procedure TfrmPlategyIsx.FormDestroy(Sender: TObject);
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
procedure TfrmPlategyIsx.actGrid1ListShowExecute(Sender: TObject);
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

function TfrmPlategyIsx.ShowDetail1:integer;
begin
  Result := dmdEx.ShowDetail1(dsNaklo.DataSet,frmEdit);
end;

procedure TfrmPlategyIsx.udgGrid1DblClick(Sender: TObject);
begin
	actGrid1ListShow.Execute;
end;

procedure TfrmPlategyIsx.actRefreshExecute(Sender: TObject);
begin
  dmdex.startWaiting;
  //ProcessSettings;
  //DefaultOpen;
  //В детализации не открывался платёж из предыдущего месяца
  qeNaklo.Refresh;
  dmdEx.stopWaiting;
end;

procedure TfrmPlategyIsx.ProcessSettings(ProcessOnlySecurityMeasures:boolean=false);
begin
  ProcessSettingsPostVladManager(qeNaklo,setT,ProcessOnlySecurityMeasures);
  ProcessShowDeleted;
  if not ProcessOnlySecurityMeasures then begin
    self.Caption := UpdateCaptionPostVladManager('Исходящие платежи:',setT);
  end;
end;




procedure TfrmPlategyIsx.actShowDetExecute(Sender: TObject);
var
  frmPrixDet : TfrmPrixDet;
begin
	frmPrixDet := TfrmPrixDet.Create (Self);
	frmPrixDet.ShowDet(
    cdsNaklo.FieldByName('id_nakl').AsInteger,
		0
  );
end;

procedure TfrmPlategyIsx.actSettingsExecute(Sender: TObject);
begin
  actApply.Execute;
  actSettings.checked := setT.ProcessSettingsChange2(DefaultOpen);
end;

//////////////////////////////////////////////////////////
//appling changes
procedure TfrmPlategyIsx.actApplyExecute(Sender: TObject);
begin
	actApply.Checked := false;
	if PostAndApply(cdsNaklo)=0 then begin
  	actApply.Checked := true;
	end;
end;

procedure TfrmPlategyIsx.cdsNakloReconcileError(
	DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
	showmessage(e.Message);
	Action := raAbort;
end;

procedure TfrmPlategyIsx.qurQuery2ReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
	showmessage(e.Message);
	Action := raAbort;
end;

procedure TfrmPlategyIsx.dspPlatBeforeUpdateRecord(Sender: TObject;
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

procedure TfrmPlategyIsx.dbgNakloDblClick(Sender: TObject);
begin
  actGrid1ListShow.Execute;
end;

procedure TfrmPlategyIsx.actPostExecute(Sender: TObject);
begin
  dmdEx.PostNakl(
    TIntegerField(cdsNaklo.FieldByName('posted')),
    sdsPost,
    TIntegerField(cdsNaklo.FieldByName('id_nakl')),
    not actPost.Checked);
end;

procedure TfrmPlategyIsx.actUnpostExecute(Sender: TObject);
begin
  dmdEx.UnPostNakl(
    TIntegerField(cdsNaklo.FieldByName('posted')),
    sdsUnPost,
    TIntegerField(cdsNaklo.FieldByName('id_nakl')),
    not actUnpost.Checked);
end;


procedure TfrmPlategyIsx.ProcessShowDeleted;
begin
  if actShowDeleted.Checked then begin
		qeNaklo.SetSQL ('where','delmarked=1',5);
  end
  else begin
    qeNaklo.SetSQL ('where','delmarked=0',5);
  end;//checked
  qeNaklo.prepare;
end;

procedure TfrmPlategyIsx.DefaultStartup;
begin
try
  setT.IDManager:=0; // all
  setT.SetPeriod(2);
except
  AssertInternal('3732FE67-BE35-4B68-8856-01BA9060A04E');
end;
end;

procedure TfrmPlategyIsx.actShowDeletedExecute(Sender: TObject);
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

procedure TfrmPlategyIsx.actUndeleteNaklExecute(Sender: TObject);
begin
  if actShowDeleted.Checked then begin
    dmdEx.UndeleteNaklo(TintegerField(dsNaklo.DataSet.FieldByName('delmarked')),actRefresh);
  end;
end;

procedure TfrmPlategyIsx.dbgNakloKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmPlategyIsx.actDebugExecute(Sender: TObject);
begin
  actDebug.Checked := not actDebug.Checked;
  if actDebug.Checked then begin
    ColumnByName(dbgNaklo.Columns,'ID_NAKL').Visible := true;
  end else begin //if actDebug checked
    ColumnByName(dbgNaklo.Columns,'ID_NAKL').Visible := false;
  end;  //if actDebug checked
end;

function TfrmPlategyIsx.FillSlHead(DataSet:TDataSet):TStringList;
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
  slHead.Add('id_sklad='+DataSet.FieldByName('id_sklad').asString);//bank
  slHead.Add('id_currency='+DataSet.FieldByName('id_currency').asString);
  slHead.Add('id_sklad_to='+DataSet.FieldByName('id_sklad_to').asString);//xoz_oper
  slHead.Add('id='+DataSet.FieldByName('id').asString);
  slHead.Add('nds='+DataSet.FieldByName('nds').asString);
  Result :=  slHead;
end;

procedure TfrmPlategyIsx.CreateDocFromMemNaklpbux(slHead:TStringList);
var
  frmF :TfrmNaklpBux;
begin
  frmF := TfrmNaklpBux.Create(self);
  frmF.setT.DateFrom := Today;
  frmF.setT.DateTo := Today;
  frmF.setT.IDManager:=dmdex.GetIdManager;
  frmF.DefaultOpen;
  dmdEx.StartWaiting;
  frmF.dsNaklo.DataSet.DisableControls;
  dmdEx.StopWaiting;
  frmF.CreateDocFromMem(slHead);
  frmF.dsNaklo.DataSet.EnableControls;
end;

procedure TfrmPlategyIsx.actCreateNaklpBuxExecute(Sender: TObject);
var
  slHead : TStringList;
begin
try
  slHead := FillSlHead(dsNaklo.DataSet);
  if not Assigned(slHead) then exit;
  CreateDocFromMemNaklpbux(slHead);
  slHead.Free;
except
  AssertInternal('5BB3FE45-1469-4978-9D4A-F42F64E3827C');
end;
end;

procedure TfrmPlategyIsx.Test;
begin
  TestInsert;
  TestCreateNaklpu;
  TestCreatePlategIsx;
end;

procedure TfrmPlategyIsx.TestInsert;
begin
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
      dmdEx.cdsVlad.Lookup('name','Катран - А ЛТД','id');
    FieldByName('id_manager').AsInteger :=
      dmdEx.cdsManager.Lookup('name','Тест','id');
    FieldByName('id_sklad').asInteger :=
      dmdEx.cdsBank.Lookup('fullname','Катран - А ЛТД Счёт','oid');
    FieldByName('id_currency').asInteger := dmdEx.GetIdCurrencyUAH;
    Tag:=0;
    Post;
    ApplyUpdates(0);
  end;
  actPost.Checked := true;
  actPost.execute;
  //actPost.Execute;
  actUnPost.Checked := true;
  actUnpost.Execute;
  cdsNaklo.Delete;
  PostAndApply(cdsNaklo);
end;

procedure TfrmPlategyIsx.FillSettings;
begin
  setT.actDataOnly.Execute;
  SettingsPost := setT.CreatePlugin('TfmSettingsPost');
  setT.AddPlugin(SettingsPost);
  SettingsVlad := setT.CreatePlugin('TfmSettingsVlad');
  setT.AddPlugin(SettingsVlad);
  SettingsVlad.SetResultType(2);
  SettingsVlad.SetKeyValue(0);

  SettingsManager := setT.CreatePlugin('TfmSettingsManager');
  setT.AddPlugin(settingsManager);
  //менеджеры из зоны видимости
  SettingsManager.SetResultType(2);

  ShowForBuxgAndPoweruser;
end;

procedure TfrmPlategyIsx.ShowForBuxgAndPoweruser;
begin
  if ((dmdEx.getrole='POWER_USER') or (dmdEx.GetUser='SYSDBA'))
  then begin
    ColumnByName(dbgNaklo.Columns,'ZATRATY').Visible := true;
    ColumnByName(dbgNaklo.Columns,'CURRENCY_TO').Visible := true;
  end else begin
    ColumnByName(dbgNaklo.Columns,'ZATRATY').Visible := false;
    ColumnByName(dbgNaklo.Columns,'CURRENCY_TO').Visible := false;
  end;
end;

procedure TfrmPlategyIsx.actMakePlategyIsxExecute(Sender: TObject);
//var
//  slHead: TStringList;
begin
{
slHead := nil;
try
  try
    if (cdsNaklo.Eof and cdsNaklo.Bof) then begin
      Showmessage('Не выбран документ');
      exit;
    end;
    dmdEx.StartWaiting;
    dsNaklo.DataSet.DisableControls;
    slHead := TStringList.Create;
    slHead.Add('id_sklad='+dsNaklo.DataSet.FieldByName('id_sklad').asString);
    slHead.Add('id_manager='+dsNaklo.DataSet.FieldByName('id_manager').asString);
    slHead.Add('id='+dsNaklo.DataSet.FieldByName('id').asString);
    CreateDocFromMem(slHead);
    dsNaklot.DataSet.EnableControls;
    dsNaklo.DataSet.EnableControls;

  except
    AssertInternal('59DB0F0B-2C73-4244-89DA-3A18D1999F53');
  end;
finally
  slHead.Free;
}
end;
{
procedure TfrmPlategyIsx.CreateDocFromMem(slHead:TStringList);
begin
try
  dmdEx.StartWaiting;
  //master create
  dsNaklo.DataSet.Tag := 1;
  dsNaklo.DataSet.Insert;
  dsNaklo.DataSet.FieldByName('id_sklad').asInteger := strtoint(slHead.Values['id_sklad']);
  dsNaklo.DataSet.FieldByName('comment').asString:=  'Сгенерировано из №'+slHead.Values['id'];
  dsNaklo.DataSet.Post;
  dsNaklo.DataSet.Tag := 0;
  dmdEx.StopWaiting;
  ApplyOrCancel(dsNaklo.DataSet);
  //detail create
  dmdEx.StartWaiting;
  CreateDetailFromMem;
  dmdEx.StopWaiting;
except
  AssertInternal('72D6ACFE-9676-4790-9246-90A899DB7071');
end;
end;
     }
procedure TfrmPlategyIsx.actMakePlategFromPlategExecute(Sender: TObject);
var
  slHead: TStringList;
begin
slHead := nil;

try
  try
    with dsNaklo.DataSet do begin
    if (Eof and Bof) then begin
      Showmessage('Не выбран документ');
      exit;
    end;
    dmdEx.StartWaiting;
    DisableControls;
    slHead := TStringList.Create;
    slHead.Add('id_izg='+FieldByName('id_izg').asString);
    slHead.Add('id_sklad='+FieldByName('id_sklad').asString);
    slHead.Add('id_currency='+FieldByName('id_currency').asString);
    slHead.Add('id_zak='+FieldByName('id_zak').asString);
    slHead.Add('id_currency_to='+FieldByName('id_currency_to').asString);
    slHead.Add('id_manager='+FieldByName('id_manager').asString);
    slHead.Add('zatraty='+FieldByName('zatraty').asString);
    slHead.Add('nds_from='+FieldByName('nds_from').asString);
    slHead.Add('nds='+FieldByName('nds').asString);

    Tag := 1;
    Insert;
    FieldByName('id_izg').asInteger := strtoint(slHead.Values['id_izg']);
    FieldByName('id_sklad').asInteger := strtoint(slHead.Values['id_sklad']);
    FieldByName('id_currency').asInteger := strtoint(slHead.Values['id_currency']);
    FieldByName('id_zak').asInteger := strtoint(slHead.Values['id_zak']);
    FieldByName('id_currency_to').asInteger := strtoint(slHead.Values['id_currency_to']);
    FieldByName('id_manager').asInteger := strtoint(slHead.Values['id_manager']);
    FieldByName('zatraty').AsFloat := strtofloat(slHead.Values['zatraty']);
    FieldByName('nds_from').AsFloat := strtofloat(slHead.Values['nds_from']);
    FieldByName('nds').AsFloat := strtofloat(slHead.Values['nds']);    
    Post;
    Tag := 0;
    EnableControls;

    end;
  except
    AssertInternal('E2FC5591-3F48-4A7E-8794-268F09067D50');
  end;
finally
  slHead.Free;
  dmdEx.StopWaiting;
end;
end;

function TfrmPlategyIsx.CreateDocFromMemNaklru(frmF: TfrmNaklru;slHead:TStringList):integer;
begin
  frmF.setT.DateFrom := Today;
  frmF.setT.DateTo := Today;
  frmF.setT.GetPlugin('fmSettingsManager').SetKeyValue(dmdEx.GetIdManager);
 // setT.IDManager:=dmdex.GetIdManager;
  frmF.DefaultOpen;
  dmdEx.StartWaiting;
  frmF.dsNaklo.DataSet.DisableControls;
  dmdEx.StopWaiting;
  Result := frmF.CreateDocFromMem(slHead);
  frmF.dsNaklo.DataSet.EnableControls;
end;

function TfrmPlategyIsx.CreateDocFromMemPlategIsx(slHead:TStringList):integer;
var
  frmF :TfrmPlategyIsx;
begin
  frmF := TfrmPlategyIsx.Create(self);
  frmF.setT.DateFrom := Today;
  frmF.setT.DateTo := Today;
  frmF.setT.GetPlugin('fmSettingsManager').SetKeyValue(dmdEx.GetIdManager);
  frmF.DefaultOpen;
  dmdEx.StartWaiting;
  frmF.dsNaklo.DataSet.DisableControls;
  dmdEx.StopWaiting;
  Result := frmF.CreateDocFromMem(slHead);
  frmF.dsNaklo.DataSet.EnableControls;
end;

procedure TfrmPlategyIsx.actCreateNaklpuExecute(Sender: TObject);
var
  slHead : TStringList;
  frmNaklpu : TfrmNaklpu2;
begin
try
  actCreateNaklpu.tag := 0;
  slHead := FillSlHead(dsNaklo.DataSet);
  //если выбрана пустая строка, выход
  if not Assigned(slHead) then exit;
  //else выбран нормальный исходящий платёж
  frmNaklpu := TfrmNaklpu2.Create(Self);
  actCreateNaklpu.tag := CreateDocFromMemNaklru(frmNaklpu, slHead);
  slHead.Free;
except
  AssertInternal('FCF0EC37-37BC-4E68-8168-348DF8A47B2A');
end;
end;     

procedure TfrmPlategyIsx.TestCreateNaklpu;
begin
  DefaultStartup;
  if not DefaultOpen then begin
    AssertInternal('C8B50DEE-88A5-4EE7-A12D-20D057A6344F');
  end;
  if dsNaklo.DataSet.Bof and dsNaklo.DataSet.Eof then begin
    AssertInternal('C8B50DEE-88A5-4EE7-A12D-20D057A6344F_norecords');
  end;
  actCreateNaklpu.execute;
  dmdEx.DelmarkNaklo(actCreateNaklpu.tag);
end;

procedure TfrmPlategyIsx.actCreatePlategyIsxExecute(Sender: TObject);
var
  slHead : TStringList;
begin
try
  actCreatePlategyIsx.tag := 0;
  slHead := FillSlHead(dsNaklo.DataSet);
  if not Assigned(slHead) then exit;
  actCreatePlategyIsx.Tag := CreateDocFromMemPlategIsx(slHead);
  slHead.Free;
except
  AssertInternal('0FB2714A-0D16-4AAC-93C5-AFC0567834D3');
end;
end;

function TfrmPlategyIsx.CreateDocFromMem(slHead:TStringList):integer;
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
  dsNaklo.DataSet.FieldByName('id_sklad').asInteger:= strtoint(slHead.Values['id_sklad']);
  dsNaklo.DataSet.FieldByName('id_currency').asInteger:= strtoint(slHead.Values['id_currency']);
  dsNaklo.DataSet.FieldByName('id_sklad_to').asInteger:= strtoint(slHead.Values['id_sklad_to']);
  dsNaklo.DataSet.Post;
  dsNaklo.DataSet.tag:=0;
  dmdEx.StopWaiting;
  ApplyOrCancel(dsNaklo.DataSet);
  Result := dsNaklo.DataSet.FieldByName('id_nakl').asInteger;
except
  AssertInternal('0E77B20D-977D-4455-A452-642DBB776111');
end;
end;

procedure TfrmPlategyIsx.TestCreatePlategIsx;
begin
  DefaultStartup;
  if not DefaultOpen then begin
    AssertInternal('C8B50DEE-88A5-4EE7-A12D-20D057A6344F');
  end;
  if dsNaklo.DataSet.Bof and dsNaklo.DataSet.Eof then begin
    AssertInternal('C8B50DEE-88A5-4EE7-A12D-20D057A6344F_norecords');
  end;
  actCreatePlategyIsx.execute;
  dmdEx.DelmarkNaklo(actCreatePlategyIsx.tag);
end;

end.
