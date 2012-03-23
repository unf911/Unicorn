unit PriceChange;

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

  PriceChangeEdit,
  PriceChangeDet,
  UslPostavkaChange, // TfrmUslPostavkaChange
  Variants //vararrayhighbound
  ;


type
	TfrmPriceChange = class(TForm)
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
    cdsNaklotCENA: TFMTBCDField;
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
		btnBlock: TBitBtn;
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
    cdsNaklotID_SEBEST: TIntegerField;
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
    sdsNaklotCENA: TFMTBCDField;
    sdsNaklotID_SEBEST: TIntegerField;
    sdsNakloID_SKLAD: TIntegerField;
    cdsNakloID_SKLAD: TIntegerField;
    mtePriceDetGen: TMemTableEh;
    dsPriceDetGen: TDataSource;
    actMakePriceChange: TAction;
    N3: TMenuItem;
    N4: TMenuItem;
    actSetColumnValue: TAction;
    actIncColumnValue: TAction;
    actMultColumnValue: TAction;
    N6: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    mtePriceDetGenID_TOVAR: TIntegerField;
    mtePriceDetGenID_SEBEST: TIntegerField;
    mtePriceDetGenCENA: TFloatField;
    sdsNaklotTOVAR_TEXT: TStringField;
    cdsNaklotTOVAR_TEXT: TStringField;
    actMultColumnOnLmeChange: TAction;
    N11: TMenuItem;
    mtePriceDetGenSKIDKA: TFloatField;
    actMakeSkidkaChange: TAction;
    N12: TMenuItem;
    actMakeUslPostavkaChange: TAction;
    N13: TMenuItem;
    sdsNaklotSKIDKA: TFloatField;
    cdsNaklotSKIDKA: TFloatField;
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
    procedure actOrderExecute(Sender: TObject);
    procedure actUndeleteNaklExecute(Sender: TObject);
    procedure dbgNakloKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgNaklotKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actAddDetExecute(Sender: TObject);
    procedure dbgNaklotColumns1EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure cdsNaklotBeforePost(DataSet: TDataSet);
    procedure dbgNaklotExit(Sender: TObject);
    procedure actMakePriceChangeExecute(Sender: TObject);
    procedure actSetColumnValueExecute(Sender: TObject);
    procedure actIncColumnValueExecute(Sender: TObject);
    procedure actMultColumnValueExecute(Sender: TObject);
    procedure cdsNakloAfterPost(DataSet: TDataSet);
    procedure cdsNaklotID_TOVARChange(Sender: TField);
    procedure actMultColumnOnLmeChangeExecute(Sender: TObject);
    procedure actMakeSkidkaChangeExecute(Sender: TObject);
    procedure actMakeUslPostavkaChangeExecute(Sender: TObject);
    procedure actPostExecute(Sender: TObject);
    procedure actUnpostExecute(Sender: TObject);
	private
		intNpp : integer; //номер позиции по порядку
		frmEdit : TfrmPriceChangeEdit;
		procedure ProcessShowDeleted;
		procedure qurNaklrCommit;


	public
		{ Public declarations }
		setT : TfrmSettings;
    procedure ProcessSettings;
    procedure DefaultStartup;
    function DefaultOpen:boolean;
    procedure CreateDocFromMem(slHead:TStringList);
    function ShowDetail1:integer;
    procedure CreateDetailFromMem;
	end;
var
	frmPriceChange: TfrmPriceChange;

implementation

{$R *.dfm}

uses
  DateUtils,
  DetSelect, //TfrmDetSelect
  SkidkaChange, //TfrmSkidkaChange;
  PriceSpr //TfrmPrice
  ;

procedure TfrmPriceChange.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qurNaklrCommit;
  //закрытие справочника прайсов при закрытии этой формы
  dmdex.CloseQuery(dmdEx.cdsPrice,false);
  dmdEx.CloseQuery(dmdEx.cdsManager,false);
  dmdEx.CloseQuery(dmdEx.cdsTovarAll,false);
  dmdEx.CloseQuery(dmdEx.cdsTovarAllND,false);
	Action := caFree;
end;

procedure TfrmPriceChange.FormCreate(Sender: TObject);
begin
try
  if not mtePriceDetGen.Active then begin
    mtePriceDetGen.CreateDataSet;
  end;
  dmdEx.StartWaiting;
  dmdEx.OpenQuery(dmdEx.cdsManager);
  dmdEx.OpenQuery(dmdEx.cdsTovarAll);
  dmdEx.OpenQuery(dmdEx.cdsTovarAllND);
  dmdEx.OpenQuery(dmdEx.cdsPrice);
  setT := TfrmSettings.Create(self);
	setT.actAllManagerOn.Execute;

	qeNaklo.DefSql := sdsNaklo.CommandText;
	ProcessShowDeleted;
  dmdEx.StopWaiting;
  frmEdit := TfrmPriceChangeEdit.Create(self);
  frmEdit.dsNakloEdit.DataSet := cdsNaklo;
except
  AssertInternal('E69CC95E-E261-4389-801D-6A0E50FC8736');
end;
end;

procedure TfrmPriceChange.actSettingsExecute(Sender: TObject);
begin
  actSettings.checked := setT.ProcessSettingsChange2(DefaultOpen);
end;

procedure TfrmPriceChange.actGrid1ListShowExecute(Sender: TObject);
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

procedure TfrmPriceChange.dbgNaklrDblClick(Sender: TObject);
begin
  actGrid1ListShow.Execute;
end;

procedure TfrmPriceChange.DefaultStartup;
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

function TfrmPriceChange.DefaultOpen:boolean;
begin
  ProcessSettings;
  Result:=DefaultOpenInputForm(qeNaklo);
end;

procedure TfrmPriceChange.qurNaklrCommit;
begin
  PostAndApplyOrCancel(cdsNaklo);
  PostAndApplyOrCancel(cdsNaklot);
end;

procedure TfrmPriceChange.actRefreshExecute(Sender: TObject);
begin
try
  dmdEx.StartWaiting;
	qeNaklo.Refresh;
  dmdEx.StopWaiting;
except
  AssertInternal('FDA31B8B-F0AE-4CA0-87FF-9F81D08B92C0');
end;
end;

procedure TfrmPriceChange.FormDestroy(Sender: TObject);
begin
try
  dmdEx.CloseQuery(dmdEx.cdsVlad,false);
  dmdEx.CloseQuery(dmdEx.cdsPost,false);
  dmdEx.CloseQuery(dmdEx.cdsManager,false);
  dmdEx.CloseQuery(dmdEx.cdsTovarAll,false);
  dmdEx.CloseQuery(dmdEx.cdsSklads,false);
  dmdEx.CloseQuery(dmdEx.cdsTovarAllND,false);
	frmEdit.Free;
  //frmDet.Free;
  setT.Free;
except
  AssertInternal('6F6CE56C-B6D2-4461-B6A9-F4E0FC192E09');
end;
end;

procedure TfrmPriceChange.FormDeactivate(Sender: TObject);
begin
	qurNaklrCommit;
end;


procedure TfrmPriceChange.cdsNakloAfterInsert(DataSet: TDataSet);
var
  intGen, iManager : integer;
begin
  //dmdEx.StartWaiting;
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
  ShowDetail1;
end;


procedure TfrmPriceChange.cdsNaklotAfterInsert(DataSet: TDataSet);
var
  intGen : integer;
begin
  if cdsNaklo.FieldByName('id_nakl').AsInteger=0 then begin
    if cdsNaklo.Eof and cdsNaklo.Bof then begin
      messagedlg('Не выбрана документ',mtWarning,[mbOK],0);
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
  //заполнить поле прайс если в шапке выбран прайс по умолчанию
  if not dsNaklo.DataSet.FieldByName('id_sklad').IsNull then begin
    DataSet.FieldByName('id_sebest').asInteger :=
      dsNaklo.DataSet.FieldByName('id_sklad').asInteger;
  end;
//	ShowDetail2;
end;

procedure TfrmPriceChange.cdsNaklotBeforeScroll(DataSet: TDataSet);
begin
try
  if dsNaklot.DataSet.Tag<>1 then begin
    ApplyOrCancel (Dataset);
  end;
except
  AssertInternal('5D22C051-79E5-4B0B-9517-8E5B2754C1F8');
end;
end;

procedure TfrmPriceChange.cdsNakloBeforeScroll(DataSet: TDataSet);
begin
try
  ApplyOrCancel (Dataset);
except
  AssertInternal('BB8DE88F-3FA9-4C61-8D1B-82500D64440D');
end;
end;


procedure TfrmPriceChange.dbgNaklotDblClick(Sender: TObject);
begin
//  actGrid2ListShow.Execute;
end;

procedure TfrmPriceChange.dbgNakloDblClick(Sender: TObject);
begin
  actGrid1ListShow.Execute;
end;



procedure TfrmPriceChange.dspNakloBeforeUpdateRecord(Sender: TObject;
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

procedure TfrmPriceChange.actShowDeletedExecute(Sender: TObject);
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
procedure TfrmPriceChange.ProcessShowDeleted;
begin
  if actShowDeleted.Checked then begin
		qeNaklo.SetSQL ('where','n.delmarked=1',3);
  end
  else begin
    qeNaklo.SetSQL ('where','n.delmarked=0',3);
  end;//checked
  qeNaklo.prepare;
end;


procedure TfrmPriceChange.cdsNakloReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  showmessage(e.message);
  Action := raCancel;
end;

procedure TfrmPriceChange.ProcessSettings;
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

    self.Caption :='Изменения прайсов. '
      +'Менеджер: '+setT.Manager + '. Период: c ' + datetostr (setT.DateFrom)
      + ' по '+ datetostr(setT.DateTo);
except
  AssertInternal('95CED985-E0E3-4F20-A4DA-F8C4DFF0728C');
end;
end;

procedure TfrmPriceChange.cdsNaklotReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  showmessage (e.Message);
  Action := raCancel;
end;

procedure TfrmPriceChange.actBlockExecute(Sender: TObject);
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

function TfrmPriceChange.ShowDetail1:integer;
begin
  Result := dmdEx.ShowDetail1(dsNaklo.DataSet,frmEdit);
end;

procedure TfrmPriceChange.actOrderExecute(Sender: TObject);
begin
 { TODO : Упорядочить по таре }
end;

procedure TfrmPriceChange.actUndeleteNaklExecute(Sender: TObject);
begin
  if actShowDeleted.Checked then begin
    dmdEx.UndeleteNakl(TintegerField(dsNaklo.DataSet.FieldByName('delmarked')),actRefresh);
  end;
end;

procedure TfrmPriceChange.dbgNakloKeyDown(Sender: TObject; var Key: Word;
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
            dmdEx.StartWaiting;
            cdsNaklo.Delete;
            dmdEx.StopWaiting;
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

procedure TfrmPriceChange.dbgNaklotKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
		vk_return : begin
      actGrid2ListShow.Execute;
    end; //vk_return
    vk_f8 : begin
      dmdEx.DbGridEhDeletePositions(dbgNaklot);
    end; //vk_f8
    vk_insert : begin
      dbgNaklot.DataSource.DataSet.Append;
    end;
	end; //case
end;


procedure TfrmPriceChange.actAddDetExecute(Sender: TObject);
var
  frmDetSelect : TfrmDetSelect;
//  TovarList: TStringList;
//  i : integer;
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

procedure TfrmPriceChange.dbgNaklotColumns1EditButtons0Click(
  Sender: TObject; var Handled: Boolean);
var
  iOid : integer;
  frmSpr : TfrmPriceSpr;
begin
  frmSpr := TfrmPriceSpr.Create(self);
  iOid := frmSpr.ShowModalForInsert;
  if cdsNaklot.State=dsBrowse then begin
    cdsNaklot.Edit;
  end;
  cdsNaklot.FieldByName('id_sebest').asInteger := iOid;
  Handled := true;
end;

procedure TfrmPriceChange.cdsNaklotBeforePost(DataSet: TDataSet);
begin
	if DataSet.FieldByName('price').IsNull then begin
		showmessage ('Заполните поле ''Прайс''');
		dbgNaklot.SetFocus;
    dbgNaklot.SelectedField := DataSet.FieldByName('price');
		abort;
	end;
	if DataSet.FieldByName('tovar').IsNull then begin
		showmessage ('Заполните поле ''Товар''');
		dbgNaklot.SetFocus;
    dbgNaklot.SelectedField := DataSet.FieldByName('tovar');
		abort;
	end;
	if DataSet.FieldByName('cena').asFloat<0 then begin
		showmessage ('Цена не может быть отрацательной');
		dbgNaklot.SetFocus;
    dbgNaklot.SelectedField := DataSet.FieldByName('cena');
		abort;
	end;
  if ((DataSet.State=dsInsert)
    and (DataSet.FieldByName('skidka').IsNull))
  then begin
    DataSet.FieldByName('skidka').asVariant :=
      dmdEx.cdsTovarAll.Lookup(
        'id',
        DataSet.FieldByName('id_tovar').asInteger,
        'copperperkm')
        ;
  end;
end;

procedure TfrmPriceChange.dbgNaklotExit(Sender: TObject);
begin
  if cdsNaklot.State in [dsInsert,dsEdit] then begin
    cdsNaklot.Post;
  end;
end;


procedure TfrmPriceChange.actMakePriceChangeExecute(Sender: TObject);
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
      dsPriceDetGen.DataSet.Append;
      dsPriceDetGen.DataSet.FieldByName('id_tovar').AsInteger:=
        dsNaklot.DataSet.FieldByName('id_tovar').AsInteger;
      dsPriceDetGen.DataSet.FieldByName('id_sebest').AsInteger:=
        dsNaklot.DataSet.FieldByName('id_sebest').AsInteger;
      dsPriceDetGen.DataSet.FieldByName('cena').AsFloat:=
        dsNaklot.DataSet.FieldByName('cena').AsFloat;
      dsPriceDetGen.DataSet.FieldByName('skidka').AsVariant:=
        dsNaklot.DataSet.FieldByName('skidka').AsVariant;
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

procedure TfrmPriceChange.CreateDocFromMem(slHead:TStringList);
begin
try
  dmdEx.StartWaiting;
  //master create
  dsNaklo.DataSet.Tag := 1;
  dsNaklo.DataSet.Insert;
  //dsNaklo.DataSet.FieldByName('id_manager').asInteger := strtoint(slHead.Values['id_manager']);
  dsNaklo.DataSet.FieldByName('id_sklad').asInteger := strtoint(slHead.Values['id_sklad']);
  dsNaklo.DataSet.FieldByName('comment').asString:=  'Сгенерировано из №'+slHead.Values['id'];;
  dsNaklo.DataSet.Post;
  dsNaklo.DataSet.Tag := 0;
  dmdEx.StopWaiting;
  ApplyOrCancel(dsNaklo.DataSet);

  //detail create
  dmdEx.StartWaiting;
  CreateDetailFromMem;
  dmdEx.StopWaiting;
except
  AssertInternal('EE7BFDD4-18CF-40DF-B974-F3A4B29322C3');
end;
end;

procedure TfrmPriceChange.actSetColumnValueExecute(Sender: TObject);
begin
  dmdEx.ColumnSet(dbgNaklot);
end;

procedure TfrmPriceChange.actIncColumnValueExecute(Sender: TObject);
begin
  dmdEx.ColumnInc(dbgNaklot);
end;

procedure TfrmPriceChange.actMultColumnValueExecute(Sender: TObject);
begin
  dmdEx.ColumnMult(dbgNaklot);
end;

procedure TfrmPriceChange.cdsNakloAfterPost(DataSet: TDataSet);
begin
  if (dsNaklo.DataSet.FieldByName('id_sklad').NewValue<>
    dsNaklo.DataSet.FieldByName('id_sklad').OldValue) or
    (dsNaklo.DataSet.FieldByName('id_sklad').OldValue  = null)
  then begin
    if dsNaklot.DataSet.RecordCount>0 then begin
      //if (MessageDlg('Хотите ли вы также изменить значение поля ''Прайс'' для позиций детализации',mtConfirmation ,
      //[ mbOk,mbCancel],0) = mrOk) then begin
        dsNaklot.DataSet.First;
        while not dsNaklot.DataSet.Eof do begin
          dsNaklot.DataSet.Edit;
          dsNaklot.DataSet.FieldByName('id_sebest').asInteger :=
            dsNaklo.DataSet.FieldByName('id_sklad').NewValue;
          dsNaklot.DataSet.Post;
          dsNaklot.DataSet.next;
        end;//while
      //end;  //if ok
    end;  //if recordcount>0
  end;//if old<>new
end;


procedure TfrmPriceChange.cdsNaklotID_TOVARChange(Sender: TField);
var
   vValue :variant;
begin
  if (sender.newvalue<>sender.OldValue) and (Sender.DataSet.State=dsEdit) then begin
    MessageDlg('В существующей позиции запрещено менять товар',mtError,[mbok],0);
    vValue := sender.OldValue;
    sender.Value := vValue;
  end;
end;

procedure TfrmPriceChange.actMultColumnOnLmeChangeExecute(Sender: TObject);
begin
  dmdEx.ColumnMultOnLmeChange(
    dbgNaklot,
    'SKIDKA',
    'Введите изменение курса меди',
    0.001);
end;

procedure TfrmPriceChange.actMakeSkidkaChangeExecute(Sender: TObject);
var
  frmSkidkaChange : TfrmSkidkaChange;
  DataSet : TDataSet;
  iResult : integer;
begin
try
  if (cdsNaklo.Eof and cdsNaklo.Bof) then begin
    Showmessage('Не выбран документ');
    exit;
  end;
  dmdEx.StartWaiting;

  frmSkidkaChange := TfrmSkidkaChange.Create(Application);
  frmSkidkaChange.setT.DateFrom := Today;
  frmSkidkaChange.setT.DateTo := Today;
  frmSkidkaChange.setT.IDManager:=dmdex.GetIdManager;
  frmSkidkaChange.DefaultOpen;
  frmSkidkaChange.dsNaklo.DataSet.tag:=1;
  frmSkidkaChange.dsNaklo.DataSet.Insert;
  frmSkidkaChange.dsNaklo.DataSet.tag:=0;
  iResult :=frmSkidkaChange.ShowDetail1;
  if iResult = mrCancel then begin
    //пользователь нажал отмену
    exit;
  end;
  DataSet:=frmSkidkaChange.mtePriceDetGen;
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
    DataSet.Post;
    dsNaklot.DataSet.Next;
  end;

  frmSkidkaChange.CreateDetailFromMem;
except
  AssertInternal('790B4127-9E69-4C49-A412-BE23BCF20276');
end;
end;

procedure TfrmPriceChange.actMakeUslPostavkaChangeExecute(Sender: TObject);
var
  frmUslPostavkaChange : TfrmUslPostavkaChange;
  DataSet : TDataSet;
  iResult : integer;
begin
try
  if (cdsNaklo.Eof and cdsNaklo.Bof) then begin
    Showmessage('Не выбран документ');
    exit;
  end;
  dmdEx.StartWaiting;

  frmUslPostavkaChange := TfrmUslPostavkaChange.Create(Application);
  frmUslPostavkaChange.setT.DateFrom := Today;
  frmUslPostavkaChange.setT.DateTo := Today;
  frmUslPostavkaChange.setT.IDManager:=dmdex.GetIdManager;
  frmUslPostavkaChange.ProcessSettings;
  frmUslPostavkaChange.DefaultOpen;
  //.DefaultStartup;
  frmUslPostavkaChange.dsNaklo.DataSet.tag:=1;
  frmUslPostavkaChange.dsNaklo.DataSet.Insert;
  frmUslPostavkaChange.dsNaklo.DataSet.tag:=0;
  iResult :=frmUslPostavkaChange.ShowDetail1;
  if iResult = mrCancel then begin
    //пользователь нажал отмену
    exit;
  end;
  DataSet:=frmUslPostavkaChange.mtePriceDetGen;
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
    DataSet.Post;
    dsNaklot.DataSet.Next;
  end;

  frmUslPostavkaChange.CreateDetailFromMem;
except
  AssertInternal('16A61567-4D36-486B-8B57-7E906AE48FC1');
end;
end;

procedure TfrmPriceChange.CreateDetailFromMem;
begin
  dsNaklot.DataSet.Tag := 1;
  dsPriceDetGen.DataSet.First;
  while not  dsPriceDetGen.DataSet.Eof do begin
    dsNaklot.DataSet.Append;
    CopyFieldValues(dsPriceDetGen.DataSet,dsNaklot.DataSet,
      'id_tovar;cena;skidka;id_sebest','id_tovar;cena;skidka;id_sebest');
    dsNaklot.DataSet.Post;
    dsPriceDetGen.DataSet.Next;
  end;
  dsNaklot.DataSet.Tag := 0;
  ApplyOrCancel(dsNaklot.DataSet);
end;

procedure TfrmPriceChange.actPostExecute(Sender: TObject);
begin
  dmdEx.PostNakl(
    TIntegerField(cdsNaklo.FieldByName('posted')),
    sdsPost,
    TIntegerField(cdsNaklo.FieldByName('id_nakl')),
    not actPost.Checked);
end;

procedure TfrmPriceChange.actUnpostExecute(Sender: TObject);
begin
  dmdEx.UnPostNakl(
    TIntegerField(cdsNaklo.FieldByName('posted')),
    sdsUnPost,
    TIntegerField(cdsNaklo.FieldByName('id_nakl')),
    not actUnpost.Checked);
end;

end.

