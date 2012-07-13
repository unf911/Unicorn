unit SravnPriceList;

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
	ATSAssert, PropFilerEh,   UnfFilter, PropStorageEh,
  GridsEh, frxClass, frxDBSet,
    
	Registry,
  Variants, //vararrayhighbound
  SravnPrice, // TfrmSravnPrice
  PrixSklad, //TfrmPrixSklad;
  SravnSpec //  TfrmSravnSpec

  ;


type
	TfrmSravnPriceList = class(TForm)
		ActionList1: TActionList;
		actSettings: TAction;
		actGrid1ListShow: TAction;
		actRefresh: TAction;
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
		btnBlock: TBitBtn;
		cdsNakloBLOCKED: TSmallintField;
		PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    UnfFilter1: TUnfFilter;
    UnfFilter2: TUnfFilter;
    actOrder: TAction;
    actUndeleteNakl: TAction;
    N8: TMenuItem;
    frddNaklo: TfrxDBDataset;
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
    sdsNaklotKOLOTP: TFMTBCDField;
    sdsNaklotIN_LIST: TIntegerField;
    cdsNaklotKOLOTP: TFMTBCDField;
    cdsNaklotIN_LIST: TIntegerField;
    sdsNaklot2: TSQLDataSet;
    dspNaklot2: TDataSetProvider;
    cdsNaklot2: TClientDataSet;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    IntegerField10: TIntegerField;
    dsNaklot2: TDataSource;
    sdsNaklot2ID_NAKLD: TIntegerField;
    sdsNaklot2ID_NAKL: TIntegerField;
    sdsNaklot2ID_POS: TIntegerField;
    sdsNaklot2ID_POST: TIntegerField;
    sdsNaklot2DAT: TSQLTimeStampField;
    sdsNaklot2IN_LIST: TIntegerField;
    cdsNaklot2ID_POST: TIntegerField;
    cdsNaklot2DAT: TSQLTimeStampField;
    cdsNaklot2POST: TStringField;
    Panel1: TPanel;
    dbgNaklot: TDBGridEh;
    Splitter2: TSplitter;
    dbgNaklot2: TDBGridEh;
    sdsNakloID_SKLAD: TIntegerField;
    cdsNakloID_SKLAD: TIntegerField;
    cdsNakloCURRENCY: TStringField;
    sdsNaklot2KURS: TFMTBCDField;
    cdsNaklot2KURS: TFMTBCDField;
    actGrid1SklOborotyShow: TAction;
    ppmGrid1: TPopupMenu;
    actGrid1ListShow1: TMenuItem;
    N3: TMenuItem;
    qeNaklot: TQueryExtender;
    qeNaklot2: TQueryExtender;
    sdsNaklotKOLOTP_PROGNOZ: TFMTBCDField;
    cdsNaklotKOLOTP_PROGNOZ: TFMTBCDField;
    sdsNaklotKOEF: TFMTBCDField;
    cdsNaklotKOEF: TFMTBCDField;
    sdsNaklotPROCENT: TFMTBCDField;
    sdsNaklotID_POST: TIntegerField;
    sdsNaklotID_POST_BEST: TIntegerField;
    cdsNaklotPROCENT: TFMTBCDField;
    cdsNaklotID_POST: TIntegerField;
    cdsNaklotID_POST_BEST: TIntegerField;
    sdsNaklotCENA_FROM: TFMTBCDField;
    cdsNaklotCENA_FROM: TFMTBCDField;
    actGrid1SravnPriceSpecShow: TAction;
    N4: TMenuItem;
    cdsNaklotPOST: TStringField;
    UnfFilter3: TUnfFilter;
    sdsNaklotCENA: TFMTBCDField;
    cdsNaklotCENA: TFMTBCDField;
    actShowSpec: TAction;
    N5: TMenuItem;
    actPost: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actSettingsExecute(Sender: TObject);
		procedure actGrid1ListShowExecute(Sender: TObject);
    procedure dbgNaklrDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
		procedure cdsNakloAfterInsert(DataSet: TDataSet);
    procedure cdsNaklotAfterInsert(DataSet: TDataSet);
    procedure cdsNaklotBeforeInsert(DataSet: TDataSet);
    procedure btnUnpostClick(Sender: TObject);
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
		procedure actBlockExecute(Sender: TObject);
    procedure actOrderExecute(Sender: TObject);
    procedure actUndeleteNaklExecute(Sender: TObject);
    procedure dbgNakloKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgNaklotKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actAddDetExecute(Sender: TObject);
    procedure cdsNaklotBeforePost(DataSet: TDataSet);
    procedure dbgNaklotExit(Sender: TObject);
    procedure cdsNaklot2AfterInsert(DataSet: TDataSet);
    procedure cdsNaklot2BeforeInsert(DataSet: TDataSet);
    procedure cdsNaklot2BeforePost(DataSet: TDataSet);
    procedure actGrid1SklOborotyShowExecute(Sender: TObject);
    procedure actGrid1SravnPriceSpecShowExecute(Sender: TObject);
    procedure dspNaklotGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure actShowSpecExecute(Sender: TObject);
    procedure actPostExecute(Sender: TObject);
	private
		intNpp, intNpp2 : integer; //номер позиции по порядку
    SravnPrice : TfrmSravnPrice;
    PrixSklad : TfrmPrixSklad;
		procedure ShowDetail1;
		procedure ProcessShowDeleted;
		procedure ProcessSettings;

	public
		{ Public declarations }
		setT : TfrmSettings;
    procedure DefaultStartup;
    procedure DefaultOpen;
    procedure qurNaklrCommit;

	end;
var
	frmSravnPriceList: TfrmSravnPriceList;

implementation

{$R *.dfm}

uses
  DateUtils, //StartOfthemonth
  DetSelect, //TfrmDetSelect
  Spec , // TfrmSpec
  UslPostavkaSpr //TfrmUslPostavkaSpr
  ;

procedure TfrmSravnPriceList.FormCreate(Sender: TObject);
begin
try
  dmdEx.StartWaiting;
  dmdEx.OpenQuery(dmdEx.cdsManager);
  dmdEx.OpenQuery(dmdEx.cdsTovarAll);
  dmdEx.OpenQuery(dmdEx.cdsPost);
  dmdEx.OpenQuery(dmdEx.cdsCurrency);
  setT := TfrmSettings.Create(self);
  setT.actAllManagerOn.Execute;
	qeNaklo.DefSql := sdsNaklo.CommandText;
	ProcessShowDeleted;
  dmdEx.StopWaiting;
except
  AssertInternal('E69CC95E-E261-4389-801D-6A0E50FC8736');
end;
end;

procedure TfrmSravnPriceList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qurNaklrCommit;
  dmdex.CloseQuery(dmdEx.cdsManager,false);
  dmdex.CloseQuery(dmdEx.cdsTovarAll,false);
  dmdex.CloseQuery(dmdEx.cdsPost,false);
  dmdex.CloseQuery(dmdEx.cdsCurrency,false);
  setT.SaveProperties('TfrmSettings_SravnPriceList');
	Action := caFree;
end;

procedure TfrmSravnPriceList.actSettingsExecute(Sender: TObject);
begin
  actSettings.checked := setT.ProcessSettingsChange(actRefresh);
end;

procedure TfrmSravnPriceList.actGrid1ListShowExecute(Sender: TObject);
begin
  if cdsNaklo.eof and cdsNaklo.Bof then begin
    exit;
  end;
  SravnPrice := TfrmSravnPrice.Create(self);
  SravnPrice.SetInternalDatasetsForSave (cdsNaklo,cdsNaklot,cdsNaklot2);
  SravnPrice.SetSettings;
  SravnPrice.actRefresh.Execute;
  SravnPrice.SetTovarPostSettings;
end;

procedure TfrmSravnPriceList.dbgNaklrDblClick(Sender: TObject);
begin
  actGrid1ListShow.Execute;
end;

procedure TfrmSravnPriceList.DefaultStartup;
begin
try
  setT.IDManager:=0; // all
  setT.SetPeriod(2);
  setT.LoadProperties('TfrmSettings_SravnPriceList',true);
  ProcessSettings;
  DefaultOpen;
except
  AssertInternal('F2DB411E-8763-40B7-A9CC-6FFC53EEEF4C');
end;
end;

procedure TfrmSravnPriceList.DefaultOpen;
begin
try
	dmdEx.startWaiting;
  qeNaklo.Refresh;
  cdsNaklot.Open;
  cdsNaklot2.Open;
	dmdEx.StopWaiting;
except
  AssertInternal('3BDED84A-6A00-4EE8-A011-54FC5F56CE2E');
end;
end;

procedure TfrmSravnPriceList.qurNaklrCommit;
begin
  PostAndApplyOrCancel(cdsNaklo);
  PostAndApplyOrCancel (dsNaklot.DataSet);
  PostAndApplyOrCancel(dsNaklot2.DataSet);
end;

procedure TfrmSravnPriceList.actRefreshExecute(Sender: TObject);
begin
try
  dmdEx.StartWaiting;
	qurNaklrCommit;
  ProcessSettings;
  defaultopen;
  dmdEx.StopWaiting;
except
  AssertInternal('FDA31B8B-F0AE-4CA0-87FF-9F81D08B92C0');
end;
end;

procedure TfrmSravnPriceList.FormDestroy(Sender: TObject);
begin
try
  setT.Free;
except
  AssertInternal('6F6CE56C-B6D2-4461-B6A9-F4E0FC192E09');
end;
end;

procedure TfrmSravnPriceList.cdsNakloAfterInsert(DataSet: TDataSet);
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
  //dmdEx.StopWaiting;
  ShowDetail1;

end;


procedure TfrmSravnPriceList.cdsNaklotAfterInsert(DataSet: TDataSet);
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
  DataSet.FieldByName('in_list').asInteger := 0;
  //DataSet.FieldByName('dat').AsDateTime := cdsNaklo.FieldByName('dat').asDateTime;
  dmdEx.StopWaiting;
	//ShowDetail2;
end;

procedure TfrmSravnPriceList.cdsNaklotBeforeInsert(DataSet: TDataSet);
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

procedure TfrmSravnPriceList.btnUnpostClick(Sender: TObject);
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
            MessageDlg ('Вы не имеете права возвращать изменения условий поставки',mtWarning,[mbOK],0);
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
  AssertInternal('21EE3B41-152C-41AE-B014-9CBA1B52C21F');
end;
end;

procedure TfrmSravnPriceList.cdsNakloBeforeScroll(DataSet: TDataSet);
begin
try
  qurNaklrCommit;
except
  AssertInternal('BB8DE88F-3FA9-4C61-8D1B-82500D64440D');
end;
end;

procedure TfrmSravnPriceList.dbgNakloDblClick(Sender: TObject);
begin
  actGrid1ListShow.Execute;
end;



procedure TfrmSravnPriceList.dspNakloBeforeUpdateRecord(Sender: TObject;
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

procedure TfrmSravnPriceList.actShowDeletedExecute(Sender: TObject);
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
procedure TfrmSravnPriceList.ProcessShowDeleted;
begin
  if actShowDeleted.Checked then begin
		qeNaklo.SetSQL ('where','n.delmarked=1',3);
  end
  else begin
    qeNaklo.SetSQL ('where','n.delmarked=0',3);
  end;//checked
  qeNaklo.prepare;
end;

procedure TfrmSravnPriceList.cdsNakloReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  showmessage(e.message);
  Action := raCancel;
end;

procedure TfrmSravnPriceList.ProcessSettings;
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

    self.Caption :='Список сравнений прайсов. '
      +'Менеджер: '+setT.Manager + '. Период: c ' + datetostr (setT.DateFrom)
      + ' по '+ datetostr(setT.DateTo);
except
  AssertInternal('1C0604B1-D408-4261-9400-1FC925C7DC11');
end;
end;

procedure TfrmSravnPriceList.cdsNaklotReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  showmessage (e.Message);
  Action := raCancel;
end;

procedure TfrmSravnPriceList.actBlockExecute(Sender: TObject);
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

procedure TfrmSravnPriceList.ShowDetail1;
begin
  if dsNaklo.DataSet.Tag<>1 then begin
    SravnPrice := TfrmSravnPrice.Create(self);
    SravnPrice.SetInternalDatasetsForSave (cdsNaklo,cdsNaklot,cdsNaklot2);
    SravnPrice.actSettings.Execute;
    if (not SravnPrice.actSettings.Checked) then begin
      SravnPrice.Close;
    end;  //if checked
  end; //if tag
end;

procedure TfrmSravnPriceList.actOrderExecute(Sender: TObject);
begin
 { TODO : Упорядочить по таре }
end;

procedure TfrmSravnPriceList.actUndeleteNaklExecute(Sender: TObject);
begin
  if actShowDeleted.Checked then begin
    dmdEx.UndeleteNaklo(TintegerField(dsNaklo.DataSet.FieldByName('delmarked')),actRefresh);
  end;
end;

procedure TfrmSravnPriceList.dbgNakloKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmSravnPriceList.dbgNaklotKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i : integer;
begin
  case key of
		//vk_return : begin
    //  actGrid2ListShow.Execute;
    //end; //vk_return
    vk_f8 : begin
      if (MessageDlg('Вы хотите удалить позицию?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
        if not (cdsNaklot.bof and cdsNaklot.eof) then begin
          if dbgNaklot.Selection.SelectionType=gstRecordBookmarks then begin
            for i:=dbgNaklot.Selection.Rows.Count-1 downto 0 do begin
              dbgNaklot.DataSource.DataSet.GotoBookmark(pointer(dbgNaklot.SelectedRows.Items[i]));
              cdsNaklot.Delete;
            end;
            dbgNaklot.Selection.Clear;
          end else begin
            cdsNaklot.Delete;
          end;
        end;
        PostAndApply(cdsNaklot);
      end;//if messagedlg
    end; //vk_f8
	end; //case
end;

procedure TfrmSravnPriceList.actAddDetExecute(Sender: TObject);
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

procedure TfrmSravnPriceList.cdsNaklotBeforePost(DataSet: TDataSet);
begin
	if DataSet.FieldByName('id_tovar').IsNull then begin
		showmessage ('Заполните поле ''Товар''');
    dbgNaklot.SetFocus;
		dbgNaklot.SelectedField := DataSet.FieldByName('tovar');
		abort;
	end;
end;

procedure TfrmSravnPriceList.dbgNaklotExit(Sender: TObject);
begin
  if cdsNaklot.State in [dsInsert,dsEdit] then begin
    cdsNaklot.Post;
  end;
end;


procedure TfrmSravnPriceList.cdsNaklot2AfterInsert(DataSet: TDataSet);
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
  DataSet.FieldByName('id_pos').asInteger := 0;
  DataSet.FieldByName('in_list').asInteger := 1;
  DataSet.FieldByName('dat').AsDateTime := cdsNaklo.FieldByName('dat').asDateTime;
  dmdEx.StopWaiting;
end;

procedure TfrmSravnPriceList.cdsNaklot2BeforeInsert(DataSet: TDataSet);
begin
  if PostAndApply(dsNaklo.DataSet)<>0 then begin
    abort;
  end;
  //ищем номер последней позиции
  DataSet.Last;
  try
    intNpp2:=DataSet.fieldbyname('id_pos').asInteger;
  except
    intNpp2:=0;
  end;
  inc(intNpp);
end;

procedure TfrmSravnPriceList.cdsNaklot2BeforePost(DataSet: TDataSet);
begin
	if DataSet.FieldByName('post').IsNull then begin
		showmessage ('Заполните поле ''Поставщик''');
    dbgNaklot2.SetFocus;
		dbgNaklot2.SelectedField := DataSet.FieldByName('post');
		abort;
	end;
end;

procedure TfrmSravnPriceList.actGrid1SklOborotyShowExecute(
  Sender: TObject);
var
  dDateTo, dDateFrom : TDate;
begin
  if cdsNaklo.eof and cdsNaklo.Bof then begin
    exit;
  end;
  PrixSklad := TfrmPrixSklad.Create(self);
  PrixSklad.SetInternalDatasetsForSave (cdsNaklo,cdsNaklot);
  PrixSklad.SetTovarSettings;
  dDateTo:=dsNaklo.DataSet.FieldByName('dat').asDateTime;
  dDateFrom :=StartOfTheMonth(IncMonth(dDateTo,-13));
  PrixSklad.setT.DateTo:= dDateTo;
  PrixSklad.setT.DateFrom:= dDateFrom;
  PrixSklad.actSettings.execute;
  if not PrixSklad.actSettings.checked then begin
    PrixSklad.Close;
  end;
end;

procedure TfrmSravnPriceList.actGrid1SravnPriceSpecShowExecute(
  Sender: TObject);
var
  SravnSpec :  TfrmSravnSpec;
begin
  if cdsNaklo.eof and cdsNaklo.Bof then begin
    exit;
  end;
  SravnSpec := TfrmSravnSpec.Create(self);
  SravnSpec.SetInternalDatasetsForSave (cdsNaklo,cdsNaklot,cdsNaklot2);
  SravnSpec.SetSettings;
  SravnSpec.SetTovarPostSettings;
  SravnSpec.actSettings.Execute;
  if not SravnSpec.actSettings.Checked then begin
    SravnSpec.Close;
  end;
  //SravnSpec.actRefresh.Execute;

end;

procedure TfrmSravnPriceList.dspNaklotGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
  TableName:='SRAVN_PRICE_DET_VW';
end;

procedure TfrmSravnPriceList.actShowSpecExecute(Sender: TObject);
var
  frmSpec: TfrmSpec;
  sIdNakl :string;
begin
  frmSpec := TfrmSpec.Create(application);
  sIdNakl :=  dsNaklo.DataSet.FieldByName('id_nakl').asString;
  frmSpec.qeNaklo.SetSQL('where',
    'delmarked=0 and ((id_nakl in (select id_nakl from spec_det_vw sd where '+
    'sd.id_sebest='+sIdNakl+
    ' group by sd.id_nakl)) or ('+
    'parent_id_nakl='+sIdNakl+'))'
    ,0);
  frmSpec.DefaultOpen;
end;

procedure TfrmSravnPriceList.actPostExecute(Sender: TObject);
begin
  dmdEx.PostNakl(
    TIntegerField(cdsNaklo.FieldByName('posted')),
    sdsPost,
    TIntegerField(cdsNaklo.FieldByName('id_nakl')),
    not actPost.Checked);
end;



end.

