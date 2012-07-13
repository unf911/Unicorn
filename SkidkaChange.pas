unit SkidkaChange;

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
  SkidkaChangeEdit,
  SkidkaChangeDet,
  Variants //vararrayhighbound
  ;


type
	TfrmSkidkaChange = class(TForm)
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
    sdsNaklotSKIDKA: TFMTBCDField;
    sdsNaklotID_SEBEST: TIntegerField;
    cdsNaklotSKIDKA: TFMTBCDField;
    sdsNakloID_SKLAD: TIntegerField;
    cdsNakloID_SKLAD: TIntegerField;
    actSetColumnValue: TAction;
    actIncColumnValue: TAction;
    actMultColumnValue: TAction;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    mtePriceDetGen: TMemTableEh;
    mtePriceDetGenID_TOVAR: TIntegerField;
    mtePriceDetGenID_SEBEST: TIntegerField;
    dsPriceDetGen: TDataSource;
    mtePriceDetGenSKIDKA: TFloatField;
    actMakeSkidkaChange: TAction;
    N9: TMenuItem;
    actDebug: TAction;
    N10: TMenuItem;
    actPost: TAction;
    actUnpost: TAction;
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
    procedure dbgNaklotColumns1EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure cdsNaklotBeforePost(DataSet: TDataSet);
    procedure dbgNaklotExit(Sender: TObject);
    procedure cdsNakloAfterPost(DataSet: TDataSet);
    procedure actSetColumnValueExecute(Sender: TObject);
    procedure actIncColumnValueExecute(Sender: TObject);
    procedure actMultColumnValueExecute(Sender: TObject);
    procedure actMakeSkidkaChangeExecute(Sender: TObject);
    procedure cdsNaklotID_TOVARChange(Sender: TField);
    procedure actDebugExecute(Sender: TObject);
    procedure actPostExecute(Sender: TObject);
    procedure actUnpostExecute(Sender: TObject);
	private
		intNpp : integer; //номер позиции по порядку
		frmEdit : TfrmSkidkaChangeEdit;
		procedure ShowDetail2;


		procedure ProcessShowDeleted;
		procedure qurNaklrCommit;
		//procedure Order;
	public
		{ Public declarations }
		setT : TfrmSettings;
    function ShowDetail1:integer;    
    procedure ProcessSettings;
    procedure DefaultStartup;
    function DefaultOpen:boolean;
    procedure CreateDocFromMem(slHead:TStringList);
    procedure CreateDetailFromMem;
	end;
var
	frmSkidkaChange: TfrmSkidkaChange;

implementation

{$R *.dfm}

uses

  DetSelect, //TfrmDetSelect
  SkidkaSpr, //TfrmSkidkaSpr
  DateUtils //Today
  ;

procedure TfrmSkidkaChange.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qurNaklrCommit;
  //закрытие справочника прайсов при закрытии этой формы
  dmdex.CloseQuery(dmdEx.cdsSkidka,false);
  dmdex.CloseQuery(dmdEx.cdsManager,false);
  dmdex.CloseQuery(dmdEx.cdsTovarAll,false);
  dmdex.CloseQuery(dmdEx.cdsTovarAllND,false);
	Action := caFree;
end;

procedure TfrmSkidkaChange.FormCreate(Sender: TObject);
begin
try
  if not mtePriceDetGen.Active then begin
    mtePriceDetGen.CreateDataSet;
  end;
  dmdEx.StartWaiting;
  dmdEx.OpenQuery(dmdEx.cdsManager);
  dmdEx.OpenQuery(dmdEx.cdsTovarAll);
  dmdEx.OpenQuery(dmdEx.cdsTovarAllND);
  dmdEx.OpenQuery(dmdEx.cdsSkidka);
  setT := TfrmSettings.Create(self);
  setT.actAllManagerOn.Execute;
	qeNaklo.DefSql := sdsNaklo.CommandText;

	ProcessShowDeleted;

  dmdEx.StopWaiting;
  frmEdit := TfrmSkidkaChangeEdit.Create(self);
  frmEdit.dsNakloEdit.DataSet := cdsNaklo;

except
  AssertInternal('E69CC95E-E261-4389-801D-6A0E50FC8736');
end;
end;

procedure TfrmSkidkaChange.actSettingsExecute(Sender: TObject);
begin
  actSettings.checked := setT.ProcessSettingsChange2(DefaultOpen);
//  actRefresh
end;

procedure TfrmSkidkaChange.actGrid1ListShowExecute(Sender: TObject);
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

procedure TfrmSkidkaChange.dbgNaklrDblClick(Sender: TObject);
begin
  actGrid1ListShow.Execute;
end;

procedure TfrmSkidkaChange.DefaultStartup;
begin
try
  setT.IDManager:=0; // all
  setT.SetPeriod(2);
except
  AssertInternal('F2DB411E-8763-40B7-A9CC-6FFC53EEEF4C');
end;
end;

function TfrmSkidkaChange.DefaultOpen:boolean;
begin
Result := true;
try
  ProcessSettings;
  qeNaklo.Refresh;
except
  AssertInternal('3BDED84A-6A00-4EE8-A011-54FC5F56CE2E');
end;
end;

procedure TfrmSkidkaChange.qurNaklrCommit;
begin
  PostAndApplyOrCancel(cdsNaklo);
  PostAndApplyOrCancel(cdsNaklot);
end;

procedure TfrmSkidkaChange.actRefreshExecute(Sender: TObject);
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

procedure TfrmSkidkaChange.FormDestroy(Sender: TObject);
begin
try
  dmdEx.CloseQuery(dmdEx.cdsVlad,false);
  dmdEx.CloseQuery(dmdEx.cdsPost,false);
  dmdEx.CloseQuery(dmdEx.cdsManager,false);
  dmdEx.CloseQuery(dmdEx.cdsTovarAll,false);
  dmdEx.CloseQuery(dmdEx.cdsSklads,false);
  dmdEx.CloseQuery(dmdEx.cdsTovarAllND,false);
	frmEdit.Free;
  setT.Free;
except
  AssertInternal('6F6CE56C-B6D2-4461-B6A9-F4E0FC192E09');
end;
end;

procedure TfrmSkidkaChange.actGrid2ListShowExecute(Sender: TObject);
begin
  if (cdsNaklot.FieldByName('ID_NAKLD').AsInteger = 0) then begin
    cdsNaklot.Insert;
  end else begin
		ShowDetail2;
  end;
end;

//////////////////////////////////////////////
//  Процедура упорядочивания

procedure TfrmSkidkaChange.FormDeactivate(Sender: TObject);
begin
	qurNaklrCommit;
end;


procedure TfrmSkidkaChange.cdsNakloAfterInsert(DataSet: TDataSet);
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


procedure TfrmSkidkaChange.cdsNaklotAfterInsert(DataSet: TDataSet);
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
  DataSet.FieldByName('skidka').asFloat := 0;
  //заполнить поле прайс если в шапке выбран прайс по умолчанию
  if not dsNaklo.DataSet.FieldByName('id_sklad').IsNull then begin
    DataSet.FieldByName('id_sebest').asInteger :=
      dsNaklo.DataSet.FieldByName('id_sklad').asInteger;
  end;
  dmdEx.StopWaiting;
	ShowDetail2;
end;

procedure TfrmSkidkaChange.cdsNaklotBeforeInsert(DataSet: TDataSet);
begin
  intNpp:=0;
end;
procedure TfrmSkidkaChange.cdsNaklotBeforeScroll(DataSet: TDataSet);
begin
try
  if DataSet.Tag<>1 then begin
    ApplyOrCancel (Dataset);
  end;
except
  AssertInternal('5D22C051-79E5-4B0B-9517-8E5B2754C1F8');
end;
end;

procedure TfrmSkidkaChange.cdsNakloBeforeScroll(DataSet: TDataSet);
begin
try
  ApplyOrCancel (Dataset);
except
  AssertInternal('BB8DE88F-3FA9-4C61-8D1B-82500D64440D');
end;
end;


procedure TfrmSkidkaChange.dbgNakloDblClick(Sender: TObject);
begin
  actGrid1ListShow.Execute;
end;



procedure TfrmSkidkaChange.dspNakloBeforeUpdateRecord(Sender: TObject;
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

procedure TfrmSkidkaChange.actShowDeletedExecute(Sender: TObject);
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
procedure TfrmSkidkaChange.ProcessShowDeleted;
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
procedure TfrmSkidkaChange.ShowDetail2;
begin
end;

procedure TfrmSkidkaChange.cdsNakloReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  showmessage(e.message);
  Action := raCancel;
end;

procedure TfrmSkidkaChange.ProcessSettings;
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

    self.Caption :='Изменения скидок. '
      +'Менеджер: '+setT.Manager + '. Период: c ' + datetostr (setT.DateFrom)
      + ' по '+ datetostr(setT.DateTo);
except
  AssertInternal('412930BA-3B9E-42CD-BC46-87A0220D8ACB');
end;
end;

procedure TfrmSkidkaChange.cdsNaklotReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  showmessage (e.Message);
  Action := raCancel;
end;

function TfrmSkidkaChange.ShowDetail1:integer;
begin
  Result := dmdEx.ShowDetail1(dsNaklo.DataSet,frmEdit);
end;

procedure TfrmSkidkaChange.actOrderExecute(Sender: TObject);
begin
 { TODO : Упорядочить по таре }
end;

procedure TfrmSkidkaChange.actUndeleteNaklExecute(Sender: TObject);
begin
  if actShowDeleted.Checked then begin
    dmdEx.UndeleteNaklo(TintegerField(dsNaklo.DataSet.FieldByName('delmarked')),actRefresh);
  end;
end;

procedure TfrmSkidkaChange.dbgNakloKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmSkidkaChange.dbgNaklotKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmSkidkaChange.actAddDetExecute(Sender: TObject);
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
    MessageDlg('Не выбран скидка по умолчанию',mtWarning,[mbOk],0);
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

procedure TfrmSkidkaChange.dbgNaklotColumns1EditButtons0Click(
  Sender: TObject; var Handled: Boolean);
var
  iOid : integer;
  frmSpr : TfrmSkidkaSpr;
begin
  frmSpr := TfrmSkidkaSpr.Create(self);
  iOid := frmSpr.ShowModalForInsert;
  if cdsNaklot.State=dsBrowse then begin
    cdsNaklot.Edit;
  end;
  cdsNaklot.FieldByName('id_sebest').asInteger := iOid;
  Handled := true;
end;

procedure TfrmSkidkaChange.cdsNaklotBeforePost(DataSet: TDataSet);
begin
	if DataSet.FieldByName('skidka_spr').IsNull then begin
		showmessage ('Заполните поле ''Скидка''');
		dbgNaklot.SetFocus;
    dbgNaklot.SelectedField := DataSet.FieldByName('skidka_spr');
		abort;
	end;
	if DataSet.FieldByName('tovar').IsNull then begin
		showmessage ('Заполните поле ''Товар''');
    dbgNaklot.SetFocus;
    dbgNaklot.SelectedField := DataSet.FieldByName('tovar');
		abort;
	end;
	if DataSet.FieldByName('skidka').asFloat<0 then begin
		showmessage ('% скидки не может быть отрацательным');
		dbgNaklot.SetFocus;
    dbgNaklot.SelectedField := DataSet.FieldByName('skidka');
		abort;
	end;
end;

procedure TfrmSkidkaChange.dbgNaklotExit(Sender: TObject);
begin
  if cdsNaklot.State in [dsInsert,dsEdit] then begin
    cdsNaklot.Post;
  end;
end;

procedure TfrmSkidkaChange.cdsNakloAfterPost(DataSet: TDataSet);
begin
  if dsNaklo.DataSet.FieldByName('id_sklad').NewValue<>dsNaklo.DataSet.FieldByName('id_sklad').OldValue then begin
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

procedure TfrmSkidkaChange.actSetColumnValueExecute(Sender: TObject);
begin
  dmdEx.ColumnSet(dbgNaklot);
end;

procedure TfrmSkidkaChange.actIncColumnValueExecute(Sender: TObject);
begin
  dmdEx.ColumnInc(dbgNaklot);
end;

procedure TfrmSkidkaChange.actMultColumnValueExecute(Sender: TObject);
begin
  dmdEx.ColumnMult(dbgNaklot);
end;

procedure TfrmSkidkaChange.actMakeSkidkaChangeExecute(Sender: TObject);
var
  slHead: TStringList;
begin
slHead := nil;  
try
  try
    if (cdsNaklo.Eof and cdsNaklo.Bof) then begin
      Showmessage('Не выбран документ');
      exit;
    end;
    dmdEx.StartWaiting;
    dsNaklo.DataSet.DisableControls;
    dsNaklot.DataSet.DisableControls;
    slHead := TStringList.Create;
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
      dsPriceDetGen.DataSet.FieldByName('id_sebest').AsInteger:=
        dsNaklot.DataSet.FieldByName('id_sebest').AsInteger;
      dsPriceDetGen.DataSet.FieldByName('skidka').AsFloat:=
        dsNaklot.DataSet.FieldByName('skidka').AsFloat;
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

procedure TfrmSkidkaChange.CreateDocFromMem(slHead:TStringList);
var
  iResult : integer;
begin
try
  dmdEx.StartWaiting;
  dsNaklo.DataSet.tag:=1;
  dsNaklo.DataSet.Insert;
  dmdEx.StopWaiting;
  dsNaklo.DataSet.tag:=0;
  iResult := ShowDetail1;
  if iResult = mrCancel then begin
    //пользователь нажал отмену
    exit;
  end;


  ApplyOrCancel(dsNaklo.DataSet);
  //detail create
  dmdEx.StartWaiting;
  CreateDetailFromMem;
  dmdEx.StopWaiting;
except
  AssertInternal('72D6ACFE-9676-4790-9246-90A899DB7071');
end;
end;



procedure TfrmSkidkaChange.cdsNaklotID_TOVARChange(Sender: TField);
var
   vValue :variant;
begin
  if (sender.newvalue<>sender.OldValue) and (Sender.DataSet.State=dsEdit) then begin
    MessageDlg('В существующей позиции запрещено менять товар',mtError,[mbok],0);
    vValue := sender.OldValue;
    sender.Value := vValue;
  end;
end;

procedure TfrmSkidkaChange.CreateDetailFromMem;
begin
  dsNaklot.DataSet.Tag := 1;
  dsPriceDetGen.DataSet.First;
  while not  dsPriceDetGen.DataSet.Eof do begin
    dsNaklot.DataSet.Append;
    CopyFieldValues(dsPriceDetGen.DataSet,dsNaklot.DataSet,
    'id_tovar;id_sebest;skidka','id_tovar;id_sebest;skidka');
    dsNaklot.DataSet.Post;
    dsPriceDetGen.DataSet.Next;
  end;
  dsNaklot.DataSet.Tag := 0;
  ApplyOrCancel(dsNaklot.DataSet);
end;

procedure TfrmSkidkaChange.actDebugExecute(Sender: TObject);
begin
  actDebug.Checked := not actDebug.Checked;
  if not actDebug.Checked then begin
    dbgNaklot.SumList.Active := false;
    dbgNaklo.SumList.Active := false;
  end else begin
    dbgNaklo.SumList.Active := true;
    dbgNaklot.SumList.Active := true;
  end; 
end;

procedure TfrmSkidkaChange.actPostExecute(Sender: TObject);
begin
  dmdEx.PostNakl(
    TIntegerField(cdsNaklo.FieldByName('posted')),
    sdsPost,
    TIntegerField(cdsNaklo.FieldByName('id_nakl')),
    not actPost.Checked);
end;

procedure TfrmSkidkaChange.actUnpostExecute(Sender: TObject);
begin
  dmdEx.UnPostNakl(
    TIntegerField(cdsNaklo.FieldByName('posted')),
    sdsUnPost,
    TIntegerField(cdsNaklo.FieldByName('id_nakl')),
    not actUnpost.Checked);
end;

end.

