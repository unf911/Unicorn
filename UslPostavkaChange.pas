unit UslPostavkaChange;

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
	ATSAssert, PropFilerEh, MemTableDataEh, MemTableEh,  
  UnfFilter, PropStorageEh, GridsEh, frxClass, frxDBSet,
	Registry,
  UslPostavkaChangeEdit,
  UslPostavkaChangeDet,
  Variants, //vararrayhighbound
  SkladAux  //defaultopeninputform
  ;


type
	TfrmUslPostavkaChange = class(TForm)
		ActionList1: TActionList;
		actSettings: TAction;
		actGrid1ListShow: TAction;
		actRefresh: TAction;
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
    cdsNakloID_MANAGER: TIntegerField;
		cdsNakloPOSTED: TSmallintField;
		cdsNakloCOMMENT: TStringField;
		cdsNakloMANAGER: TStringField;
    cdsNakloDAT: TSQLTimeStampField;
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
		cdsNaklotID_NAKL: TIntegerField;
		cdsNaklotID_POS: TIntegerField;
		cdsNaklotID_TOVAR: TIntegerField;
    cdsNaklotTOVAR: TStringField;
		Splitter1: TSplitter;
		Panel2: TPanel;
    dbgNaklo: TDBGridEh;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    btnUnpost: TBitBtn;
    BitBtn5: TBitBtn;
		BitBtn7: TBitBtn;
		cdsNakloBLOCKED: TSmallintField;
    qeNaklot: TQueryExtender;
		PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    UnfFilter1: TUnfFilter;
    UnfFilter2: TUnfFilter;
    PopupMenu2: TPopupMenu;
    actOrder: TAction;
    actUndeleteNakl: TAction;
    N8: TMenuItem;
    N5: TMenuItem;
    frddNaklo: TfrxDBDataset;
    cdsNaklotPRICE: TStringField;
    actAddDet: TAction;
    cdsNakloPRICE: TStringField;
    sdsNakloID_NAKL: TIntegerField;
    sdsNakloID: TStringField;
    sdsNakloID_MANAGER: TIntegerField;
    sdsNakloDAT: TSQLTimeStampField;
    sdsNakloPOSTED: TSmallintField;
    sdsNakloBLOCKED: TSmallintField;
    sdsNakloDELMARKED: TSmallintField;
    sdsNakloCOMMENT: TStringField;
    sdsNaklotID_NAKLD: TIntegerField;
    sdsNaklotID_NAKL: TIntegerField;
    sdsNaklotID_POS: TIntegerField;
    sdsNaklotID_TOVAR: TIntegerField;
    sdsNakloID_SKLAD: TIntegerField;
    cdsNakloID_SKLAD: TIntegerField;
    sdsNaklotTRANSPORT: TFMTBCDField;
    sdsNaklotTARA: TFMTBCDField;
    sdsNaklotVALUTA: TFMTBCDField;
    sdsNaklotTAMOGNYA: TFMTBCDField;
    sdsNaklotPROCENT_PREDOPL: TFMTBCDField;
    sdsNaklotOTSROCHKA: TSmallintField;
    sdsNaklotSTAVKA_BANKA: TFMTBCDField;
    cdsNaklotTRANSPORT: TFMTBCDField;
    cdsNaklotTARA: TFMTBCDField;
    cdsNaklotVALUTA: TFMTBCDField;
    cdsNaklotTAMOGNYA: TFMTBCDField;
    cdsNaklotPROCENT_PREDOPL: TFMTBCDField;
    cdsNaklotOTSROCHKA: TSmallintField;
    cdsNaklotSTAVKA_BANKA: TFMTBCDField;
    sdsNaklotID_USL_POSTAVKA: TIntegerField;
    cdsNaklotID_USL_POSTAVKA: TIntegerField;
    cdsNaklotZATRATY: TFloatField;
    actSetColumnValue: TAction;
    actSetColumnValue1: TMenuItem;
    actIncColumnValue: TAction;
    actMultColumnValue: TAction;
    N3: TMenuItem;
    N4: TMenuItem;
    mtePriceDetGen: TMemTableEh;
    mtePriceDetGenID_TOVAR: TIntegerField;
    dsPriceDetGen: TDataSource;
    mtePriceDetGenID_USL_POSTAVKA: TIntegerField;
    mtePriceDetGenTRANSPORT: TFloatField;
    mtePriceDetGenTARA: TFloatField;
    mtePriceDetGenVALUTA: TFloatField;
    mtePriceDetGenTAMOGNYA: TFloatField;
    mtePriceDetGenSTAVKA_BANKA: TFloatField;
    mtePriceDetGenOTSROCHKA: TIntegerField;
    mtePriceDetGenPROCENT_PREDOPL: TFloatField;
    actMakeUslPostavkaChange: TAction;
    N6: TMenuItem;
    actPost: TAction;
    actUnpost: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actSettingsExecute(Sender: TObject);
		procedure actGrid1ListShowExecute(Sender: TObject);
    procedure dbgNaklrDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
		procedure FormDeactivate(Sender: TObject);
		procedure cdsNakloAfterInsert(DataSet: TDataSet);
    procedure cdsNaklotAfterInsert(DataSet: TDataSet);
    procedure cdsNaklotBeforeInsert(DataSet: TDataSet);
		procedure cdsNaklotBeforeScroll(DataSet: TDataSet);
		procedure cdsNakloBeforeScroll(DataSet: TDataSet);
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
    procedure actOrderExecute(Sender: TObject);
    procedure actUndeleteNaklExecute(Sender: TObject);
    procedure dbgNakloKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgNaklotKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actAddDetExecute(Sender: TObject);
    procedure cdsNaklotCalcFields(DataSet: TDataSet);
    procedure cdsNaklotBeforePost(DataSet: TDataSet);
    procedure dbgNaklotColumns1EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure dbgNaklotExit(Sender: TObject);
    procedure actSetColumnValueExecute(Sender: TObject);
    procedure actIncColumnValueExecute(Sender: TObject);
    procedure actMultColumnValueExecute(Sender: TObject);
    procedure cdsNakloAfterPost(DataSet: TDataSet);
    procedure actMakeUslPostavkaChangeExecute(Sender: TObject);
    procedure cdsNaklotID_TOVARChange(Sender: TField);
    procedure cdsNaklotID_USL_POSTAVKAChange(Sender: TField);
    procedure actPostExecute(Sender: TObject);
    procedure actUnpostExecute(Sender: TObject);
	private
		intNpp : integer; //номер позиции по порядку
		frmEdit : TfrmUslPostavkaChangeEdit;
		frmDet : TfrmUslPostavkaChangeDet;
		procedure ProcessShowDeleted;
		procedure qurNaklrCommit;
	public
		{ Public declarations }
		setT : TfrmSettings;
		procedure ProcessSettings;
    procedure DefaultStartup;
    function DefaultOpen:boolean;
    procedure CreateDocFromMem(slHead:TStringList);
    procedure CreateDetailFromMem;
    function ShowDetail1:integer;
	end;
var
	frmUslPostavkaChange: TfrmUslPostavkaChange;

implementation

{$R *.dfm}

uses

  DetSelect, //TfrmDetSelect
  UslPostavkaSpr //TfrmUslPostavkaSpr
  ;

procedure TfrmUslPostavkaChange.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qurNaklrCommit;
  //закрытие справочника прайсов при закрытии этой формы
  dmdex.CloseQuery(dmdEx.cdsUslPostavka,false);
  dmdex.CloseQuery(dmdEx.cdsManager,false);
  dmdex.CloseQuery(dmdEx.cdsTovarAll,false);
  dmdex.CloseQuery(dmdEx.cdsTovarAllND,false);
	Action := caFree;
end;

procedure TfrmUslPostavkaChange.FormCreate(Sender: TObject);
begin
try
  if not mtePriceDetGen.Active then begin
    mtePriceDetGen.CreateDataSet;
  end;
  dmdEx.StartWaiting;
  dmdEx.OpenQuery(dmdEx.cdsManager);
  dmdEx.OpenQuery(dmdEx.cdsTovarAll);
  dmdEx.OpenQuery(dmdEx.cdsTovarAllND);
  dmdEx.OpenQuery(dmdEx.cdsUslPostavka);
  setT := TfrmSettings.Create(self);
  setT.actAllManagerOn.Execute;
	qeNaklo.DefSql := sdsNaklo.CommandText;
	ProcessShowDeleted;
  dmdEx.StopWaiting;
  frmEdit := TfrmUslPostavkaChangeEdit.Create(self);
  frmEdit.dsNakloEdit.DataSet := cdsNaklo;
except
  AssertInternal('E69CC95E-E261-4389-801D-6A0E50FC8736');
end;
end;

procedure TfrmUslPostavkaChange.actSettingsExecute(Sender: TObject);
begin
  actSettings.checked := setT.ProcessSettingsChange2(DefaultOpen);
end;

procedure TfrmUslPostavkaChange.actGrid1ListShowExecute(Sender: TObject);
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

procedure TfrmUslPostavkaChange.dbgNaklrDblClick(Sender: TObject);
begin
  actGrid1ListShow.Execute;
end;

procedure TfrmUslPostavkaChange.DefaultStartup;
begin
try
  setT.IDManager:=0; // all
  setT.SetPeriod(2);
  ProcessSettings;
  DefaultOpen;
except
  AssertInternal('F2DB411E-8763-40B7-A9CC-6FFC53EEEF4C');
end;
end;

function TfrmUslPostavkaChange.DefaultOpen:boolean;
begin
  ProcessSettings;
  Result:=DefaultOpenInputForm(qeNaklo);
end;

procedure TfrmUslPostavkaChange.qurNaklrCommit;
begin
  PostAndApplyOrCancel(cdsNaklo);
  PostAndApplyOrCancel(cdsNaklot);
end;

procedure TfrmUslPostavkaChange.actRefreshExecute(Sender: TObject);
begin
try
  dmdEx.StartWaiting;
//	qurNaklrCommit;
//  ProcessSettings;
//  defaultopen;
	qeNaklo.Refresh;
  dmdEx.StopWaiting;
except
  AssertInternal('FDA31B8B-F0AE-4CA0-87FF-9F81D08B92C0');
end;
end;

procedure TfrmUslPostavkaChange.FormDestroy(Sender: TObject);
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


procedure TfrmUslPostavkaChange.FormDeactivate(Sender: TObject);
begin
	qurNaklrCommit;
end;


procedure TfrmUslPostavkaChange.cdsNakloAfterInsert(DataSet: TDataSet);
var
  intGen, iManager : integer;
begin
  dmdEx.StartWaiting;
  intGen := dmdEx.GetGenValue('naklo_gen');
  DataSet.FieldByName('id_nakl').AsInteger:= intGen;  //assign
  DataSet.FieldByName('dat').AsDateTime := Date; //default date. time=0
	DataSet.FieldByName('posted').asInteger := 0;
  DataSet.FieldByName('delmarked').asInteger := 0;
  DataSet.FieldByName('blocked').asInteger := 0;
  DataSet.FieldByName('id').asString:=inttostr(intGen);
  iManager := dmdEx.GetIdManager;
  if iManager<>0 then begin
    DataSet.FieldByName('id_manager').asInteger := iManager;
  end;
  dmdEx.StopWaiting;
  ShowDetail1;
end;


procedure TfrmUslPostavkaChange.cdsNaklotAfterInsert(DataSet: TDataSet);
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
  //заполнить поле прайс если в шапке выбран прайс по умолчанию
  if not dsNaklo.DataSet.FieldByName('id_sklad').IsNull then begin
    DataSet.FieldByName('id_usl_postavka').asInteger :=
      dsNaklo.DataSet.FieldByName('id_sklad').asInteger;
  end;
  dmdEx.StopWaiting;
	//ShowDetail2;
end;

procedure TfrmUslPostavkaChange.cdsNaklotBeforeInsert(DataSet: TDataSet);
begin
  intNpp:=0;
end;

procedure TfrmUslPostavkaChange.cdsNaklotBeforeScroll(DataSet: TDataSet);
begin
try
  if dsNaklot.DataSet.Tag<>1 then begin
    ApplyOrCancel (Dataset);
  end;
except
  AssertInternal('5D22C051-79E5-4B0B-9517-8E5B2754C1F8');
end;
end;

procedure TfrmUslPostavkaChange.cdsNakloBeforeScroll(DataSet: TDataSet);
begin
try
  ApplyOrCancel (Dataset);
except
  AssertInternal('BB8DE88F-3FA9-4C61-8D1B-82500D64440D');
end;
end;


procedure TfrmUslPostavkaChange.dbgNakloDblClick(Sender: TObject);
begin
  actGrid1ListShow.Execute;
end;



procedure TfrmUslPostavkaChange.dspNakloBeforeUpdateRecord(Sender: TObject;
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

procedure TfrmUslPostavkaChange.actShowDeletedExecute(Sender: TObject);
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
procedure TfrmUslPostavkaChange.ProcessShowDeleted;
begin
  if actShowDeleted.Checked then begin
		qeNaklo.SetSQL ('where','n.delmarked=1',3);
  end
  else begin
    qeNaklo.SetSQL ('where','n.delmarked=0',3);
  end;//checked
  qeNaklo.prepare;
end;

procedure TfrmUslPostavkaChange.cdsNakloReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  showmessage(e.message);
  Action := raCancel;
end;

procedure TfrmUslPostavkaChange.ProcessSettings;
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

    qeNaklo.Prepare;

    self.Caption :='Изменения условий поставки. '
      +'Менеджер: '+setT.Manager + '. Период: c ' + datetostr (setT.DateFrom)
      + ' по '+ datetostr(setT.DateTo);
except
  AssertInternal('313661D7-B7BC-4F0D-8AD8-F1EE37D5DD10');
end;
end;

procedure TfrmUslPostavkaChange.cdsNaklotReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  showmessage (e.Message);
  Action := raCancel;
end;

function TfrmUslPostavkaChange.ShowDetail1:integer;
begin
  Result := dmdEx.ShowDetail1(dsNaklo.DataSet,frmEdit);
end;

procedure TfrmUslPostavkaChange.actOrderExecute(Sender: TObject);
begin
 { TODO : Упорядочить по таре }
end;

procedure TfrmUslPostavkaChange.actUndeleteNaklExecute(Sender: TObject);
begin
  if actShowDeleted.Checked then begin
    dmdEx.UndeleteNakl(TintegerField(dsNaklo.DataSet.FieldByName('delmarked')),actRefresh);
  end;
end;

procedure TfrmUslPostavkaChange.dbgNakloKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmUslPostavkaChange.dbgNaklotKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
		//vk_return : begin
    //  actGrid2ListShow.Execute;
    //end; //vk_return
    vk_f8 : begin
      dmdEx.DbGridEhDeletePositions(dbgNaklot);
    end; //vk_f8
    vk_insert : begin
      dbgNaklot.DataSource.DataSet.Append;
    end;    
	end; //case
end;

procedure TfrmUslPostavkaChange.actAddDetExecute(Sender: TObject);
var
  frmDetSelect : TfrmDetSelect;
begin
  if cdsNaklo.Eof and cdsNaklo.Bof then begin
    MessageDlg('Не выбран документ',mtWarning,[mbOk],0);
    exit;
  end;
  if cdsNaklo.FieldByName('id_sklad').isNull then begin
    MessageDlg('Не выбран прайс по умолчанию',mtWarning,[mbOk],0);
    exit;
  end;
  frmDetSelect := TfrmDetSelect.Create(Self);
  frmDetSelect.ShowSprTovarSnab;
  if frmDetSelect.ShowModal=mrOk then begin
    //чтобы после вставки не открывалось окно редактирования
    frmDetSelect.InsertDetRows(dsNaklot.DataSet,'id_tovar');
    ApplyOrCancel(dsNaklot.DataSet);
  end;
  frmDetSelect.Free;
end;

procedure TfrmUslPostavkaChange.cdsNaklotCalcFields(DataSet: TDataSet);
var
  dProcentPredopl,dZatratyBanka : double;
begin
  if DataSet.State = dsCalcFields then begin
    if DataSet.FieldByName('PROCENT_PREDOPL').IsNull then begin
      dProcentPredopl:=100;
    end else begin
      dProcentPredopl:=DataSet.FieldByName('PROCENT_PREDOPL').AsFloat;
    end;
    dZatratyBanka :=
      (100-dProcentPredopl)/100
      *DataSet.FieldByName('STAVKA_BANKA').asFloat
      *(DataSet.FieldByName('OTSROCHKA').asFloat/365);
    DataSet.FieldByName('zatraty').asFloat :=
      DataSet.FieldByName('transport').asFloat
      +DataSet.FieldByName('tara').asFloat
      +DataSet.FieldByName('valuta').asFloat
      +DataSet.FieldByName('tamognya').asFloat
      -dZatratyBanka;
  end;
end;

procedure TfrmUslPostavkaChange.cdsNaklotBeforePost(DataSet: TDataSet);
begin
	if DataSet.FieldByName('usl_postavka').IsNull then begin
		showmessage ('Заполните поле ''Условия поставки''');
    dbgNaklot.SetFocus;
		dbgNaklot.SelectedField := DataSet.FieldByName('usl_postavka');
		abort;
	end;
	if DataSet.FieldByName('tovar').IsNull then begin
		showmessage ('Заполните поле ''Товар''');
    dbgNaklot.SetFocus;
		dbgNaklot.SelectedField := DataSet.FieldByName('tovar');
		abort;
	end;
end;

procedure TfrmUslPostavkaChange.dbgNaklotColumns1EditButtons0Click(
  Sender: TObject; var Handled: Boolean);
var
  iOid : integer;
  frmSpr : TfrmUslPostavkaSpr;
begin
  frmSpr := TfrmUslPostavkaSpr.Create(self);
  iOid := frmSpr.ShowModalForInsert;
  if cdsNaklot.State=dsBrowse then begin
    cdsNaklot.Edit;
  end;
  cdsNaklot.FieldByName('id_usl_postavka').asInteger := iOid;
  Handled := true;
end;

procedure TfrmUslPostavkaChange.dbgNaklotExit(Sender: TObject);
begin
  if cdsNaklot.State in [dsInsert,dsEdit] then begin
    cdsNaklot.Post;
  end;
end;

procedure TfrmUslPostavkaChange.actSetColumnValueExecute(Sender: TObject);
begin
  dmdEx.ColumnSet(dbgNaklot);
end;

procedure TfrmUslPostavkaChange.actIncColumnValueExecute(Sender: TObject);
begin
  dmdEx.ColumnInc(dbgNaklot);
end;

procedure TfrmUslPostavkaChange.actMultColumnValueExecute(Sender: TObject);
begin
  dmdEx.ColumnMult(dbgNaklot);
end;

procedure TfrmUslPostavkaChange.cdsNakloAfterPost(DataSet: TDataSet);
begin
  if dsNaklo.DataSet.FieldByName('id_sklad').NewValue<>dsNaklo.DataSet.FieldByName('id_sklad').OldValue then begin
    if dsNaklot.DataSet.RecordCount>0 then begin
      //if (MessageDlg('Хотите ли вы также изменить значение поля ''Прайс'' для позиций детализации',mtConfirmation ,
      //[ mbOk,mbCancel],0) = mrOk) then begin
        dsNaklot.DataSet.First;
        dsNaklot.DataSet.Tag :=1;
        while not dsNaklot.DataSet.Eof do begin
          dsNaklot.DataSet.Edit;
          dsNaklot.DataSet.FieldByName('id_usl_postavka').asInteger :=
            dsNaklo.DataSet.FieldByName('id_sklad').NewValue;
          dsNaklot.DataSet.Post;
          dsNaklot.DataSet.next;
        end;//while
        dsNaklot.DataSet.Tag :=0;
      //end;  //if ok
    end;  //if recordcount>0
  end;//if old<>new
end;

procedure TfrmUslPostavkaChange.actMakeUslPostavkaChangeExecute(Sender: TObject);
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
    
    slHead.Add('id_sklad='+dsNaklo.DataSet.FieldByName('id_sklad').asString);
    slHead.Add('id_manager='+dsNaklo.DataSet.FieldByName('id_manager').asString);
    slHead.Add('id='+dsNaklo.DataSet.FieldByName('id').asString);
    if mtePriceDetGen.Active then begin
      mtePriceDetGen.EmptyTable;
      mtePriceDetGen.Close;
    end else begin
      mtePriceDetGen.CreateDataSet;
    end;
    mtePriceDetGen.Open;
    //detail copy
    dsNaklot.DataSet.first;
    while not  dsNaklot.DataSet.Eof do begin
      dsPriceDetGen.DataSet.Insert;
      dsPriceDetGen.DataSet.FieldByName('id_tovar').AsInteger:=
        dsNaklot.DataSet.FieldByName('id_tovar').AsInteger;
      dsPriceDetGen.DataSet.FieldByName('id_usl_postavka').AsInteger:=
        dsNaklot.DataSet.FieldByName('id_usl_postavka').AsInteger;
      dsPriceDetGen.DataSet.FieldByName('transport').AsFloat:=
        dsNaklot.DataSet.FieldByName('transport').AsFloat;
      dsPriceDetGen.DataSet.FieldByName('tara').AsFloat:=
        dsNaklot.DataSet.FieldByName('tara').AsFloat;
      dsPriceDetGen.DataSet.FieldByName('valuta').AsFloat:=
        dsNaklot.DataSet.FieldByName('valuta').AsFloat;
      dsPriceDetGen.DataSet.FieldByName('tamognya').AsFloat:=
        dsNaklot.DataSet.FieldByName('tamognya').AsFloat;
      dsPriceDetGen.DataSet.FieldByName('stavka_banka').AsFloat:=
        dsNaklot.DataSet.FieldByName('stavka_banka').AsFloat;
      dsPriceDetGen.DataSet.FieldByName('procent_predopl').AsFloat:=
        dsNaklot.DataSet.FieldByName('procent_predopl').AsFloat;
      dsPriceDetGen.DataSet.FieldByName('otsrochka').AsInteger:=
        dsNaklot.DataSet.FieldByName('otsrochka').AsInteger;
      dsPriceDetGen.DataSet.Post;
      dsNaklot.DataSet.Next;
    end;
    dmdEx.StopWaiting;
    CreateDocFromMem(slHead);
    dsNaklot.DataSet.EnableControls;
    dsNaklo.DataSet.EnableControls;
  except
    AssertInternal('87232320-AC98-4793-8324-646BED10CCBE');
  end;
finally
  slHead.Free;
end;
end;

procedure TfrmUslPostavkaChange.CreateDetailFromMem;
begin
  dsNaklot.DataSet.Tag := 1;
  dsPriceDetGen.DataSet.First;
  while not  dsPriceDetGen.DataSet.Eof do begin
    dsNaklot.DataSet.Append;
    CopyFieldValues(dsPriceDetGen.DataSet,dsNaklot.DataSet,
      'id_tovar;id_usl_postavka;transport;tara;valuta;tamognya;stavka_banka;procent_predopl;otsrochka',
      'id_tovar;id_usl_postavka;transport;tara;valuta;tamognya;stavka_banka;procent_predopl;otsrochka');
    dsNaklot.DataSet.Post;
    dsPriceDetGen.DataSet.Next;
  end;
  dsNaklot.DataSet.Tag := 0;
  ApplyOrCancel(dsNaklot.DataSet);
end;

procedure TfrmUslPostavkaChange.CreateDocFromMem(slHead:TStringList);
begin
try

  dmdEx.StartWaiting;
  //master create
  dsNaklo.DataSet.Tag := 1;
  dsNaklo.DataSet.Insert;
  dsNaklo.DataSet.FieldByName('id_sklad').asInteger := strtoint(slHead.Values['id_sklad']);
  dsNaklo.DataSet.FieldByName('comment').asString:=  'Сгенерировано из №'+slHead.Values['id'];;
  dsNaklo.DataSet.Post;
  dsNaklo.DataSet.Tag := 0;
  dmdEx.StopWaiting;
  ApplyOrCancel(dsNaklo.DataSet);
  dmdEx.StartWaiting;
  //detail create
  dmdEx.StartWaiting;
  CreateDetailFromMem;
  dmdEx.StopWaiting;
except
  AssertInternal('4134F1AD-1C88-41A6-9C23-4594E006B9E3');
end;
end;

procedure TfrmUslPostavkaChange.cdsNaklotID_TOVARChange(Sender: TField);
var
   vValue :variant;
begin
try
  if (sender.newvalue<>sender.OldValue) and (Sender.DataSet.State=dsEdit) then begin
    MessageDlg('В существующей позиции запрещено менять товар',mtError,[mbok],0);
    vValue := sender.OldValue;
    sender.Value := vValue;
  end;
except
  AssertInternal('3D511673-4E9F-4D19-B463-7BCA8D382E84');
end;
end;

procedure TfrmUslPostavkaChange.cdsNaklotID_USL_POSTAVKAChange(
  Sender: TField);
var
   vValue :variant;  
begin
try
  if (sender.newvalue<>sender.OldValue)
   and (Sender.DataSet.State=dsEdit)
   and (Sender.DataSet.Tag=0)
  then begin
    MessageDlg('В существующей позиции запрещено менять условия поставки',mtError,[mbok],0);
    vValue := sender.OldValue;
    sender.Value := vValue;
  end;
except
  AssertInternal('1A4C5A50-DD2A-4BA6-A16D-2E641678D115');
end;
end;

procedure TfrmUslPostavkaChange.actPostExecute(Sender: TObject);
begin
  dmdEx.PostNakl(
    TIntegerField(cdsNaklo.FieldByName('posted')),
    sdsPost,
    TIntegerField(cdsNaklo.FieldByName('id_nakl')),
    not actPost.Checked);
end;

procedure TfrmUslPostavkaChange.actUnpostExecute(Sender: TObject);
begin
  dmdEx.UnPostNakl(
    TIntegerField(cdsNaklo.FieldByName('posted')),
    sdsUnPost,
    TIntegerField(cdsNaklo.FieldByName('id_nakl')),
    not actUnpost.Checked);
end;

end.

