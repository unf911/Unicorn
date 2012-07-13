unit NaklPeremBux;

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
    
	Registry, NaklPeremBuxEdit,
  NaklPeremBuxDet,
  Variants,
  Naklpbux;


type
	TfrmNaklPeremBux = class(TForm)
		ActionList1: TActionList;
		actSettings: TAction;
		actGrid1ListShow: TAction;
		actPostIf: TAction;
		actRefresh: TAction;
		actGrid2ListShow: TAction;
		actPostIf2: TAction;
		actRecalc: TAction;
		actAutoRecalc: TAction;
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
    cdsNakloID_MANAGER: TIntegerField;
    cdsNakloID_SKLAD: TIntegerField;
		cdsNakloPOSTED: TSmallintField;
		cdsNakloCOMMENT: TStringField;
    cdsNakloIZG: TStringField;
		cdsNakloMANAGER: TStringField;
    cdsNakloDAT: TSQLTimeStampField;
    cdsNakloDELMARKED: TSmallintField;
    N2: TMenuItem;
    PopupMenu1: TPopupMenu;
    actShowDeleted: TAction;
		sdsRepNaklo: TSQLDataSet;
    frRepNaklo: TfrxReport;
    frDBNaklot: TfrxDBDataset;
    dspRepNaklo: TDataSetProvider;
    cdsRepNaklo: TClientDataSet;
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
    cdsNaklotKOLOTP: TFMTBCDField;
    cdsNaklotTOVAR: TStringField;
		Splitter1: TSplitter;
		Panel2: TPanel;
    dbgNaklo: TDBGridEh;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    btnUnpost: TBitBtn;
    BitBtn5: TBitBtn;
		BitBtn7: TBitBtn;
    sdsNaklotID_NAKLD: TIntegerField;
		sdsNaklotID_NAKL: TIntegerField;
    sdsNaklotID_POS: TIntegerField;
    sdsNaklotID_TOVAR: TIntegerField;
    sdsNaklotKOLOTP: TFMTBCDField;
    qeNaklot: TQueryExtender;
		PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    UnfFilter1: TUnfFilter;
    UnfFilter2: TUnfFilter;
    PopupMenu2: TPopupMenu;
    actOrder: TAction;
    actUndeleteNakl: TAction;
    N8: TMenuItem;
    cdsNakloSKLAD: TStringField;
    dbgNaklot: TDBGridEh;
    actAddDet: TAction;
    actShowSravnPriceList: TAction;
    actSetColumnValue: TAction;
    actIncColumnValue: TAction;
    actMultColumnValue: TAction;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
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
    sdsNakloID: TStringField;
    sdsNakloID_NAKL: TIntegerField;
    sdsNakloID_SKLAD: TIntegerField;
    sdsNakloID_SKLAD_TO: TIntegerField;
    sdsNakloDAT: TSQLTimeStampField;
    sdsNakloPOSTED: TSmallintField;
    sdsNakloCOMMENT: TStringField;
    sdsNakloID_IZG: TIntegerField;
    sdsNakloID_MANAGER: TIntegerField;
    sdsNakloDELMARKED: TSmallintField;
    cdsNakloID_SKLAD_TO: TIntegerField;
    cdsNakloSKLAD_TO: TStringField;
    actPreview: TAction;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    actDesign: TAction;
    cdsNaklotFULLNAME: TStringField;
    cdsNaklotEDIZ: TStringField;
    cdsNakloIZGFULLNAME: TStringField;
    cdsRepNakloID_POS: TIntegerField;
    cdsRepNakloID_NAKLD: TIntegerField;
    cdsRepNakloID_NAKL: TIntegerField;
    cdsRepNakloID_TOVAR: TIntegerField;
    cdsRepNakloKOLOTP: TFMTBCDField;
    cdsRepNakloCENA: TFloatField;
    cdsRepNakloNALOG_NDS: TFloatField;
    cdsRepNakloTOVAR: TStringField;
    cdsRepNakloFULLNAME: TStringField;
    cdsRepNakloEDIZ: TStringField;
    cdsNakloSKLADFULLNAME: TStringField;
    cdsNakloSKLAD_TO_FULLNAME: TStringField;
    Curr2StrUA1: TCurr2StrRU;
    cdsRepNakloSUMA: TFloatField;
    cdsRepNakloSUMNDS: TAggregateField;
    actPreviewPrice: TAction;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    frDBNaklo: TfrxDBDataset;
    actPost: TAction;
    sdsNakloID_VYGRUZKA: TIntegerField;
    cdsNakloID_VYGRUZKA: TIntegerField;
    cdsNakloREYS_NOMER_AVTO: TStringField;
    cdsNakloREYS_FIO_VODITELYA: TStringField;
    cdsNakloREYS_DAT_REYS: TSQLTimeStampField;
    cdsNakloREYS_PEREVOZCHIK: TStringField;
    cdsNakloREYS_PUNKT_ZAGRUZKI: TStringField;
    cdsNakloREYS_PUNKT_VYGRUZKI: TStringField;
    cdsNakloREYS_NOMER_PRITSEPA: TStringField;
    cdsNakloREYS_POKUPATEL_PLATIT: TIntegerField;
    actPreviewTtn: TAction;
    actPreviewTtn1: TMenuItem;
    actDebug: TAction;
    N9: TMenuItem;
    frTtn: TfrxReport;
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
    procedure cdsNaklotAfterDelete(DataSet: TDataSet);
    procedure actShowSravnPriceListExecute(Sender: TObject);
    procedure dspNaklotGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure actSetColumnValueExecute(Sender: TObject);
    procedure actMultColumnValueExecute(Sender: TObject);
    procedure actIncColumnValueExecute(Sender: TObject);
    procedure cdsNakloPARENT_ID_NAKLChange(Sender: TField);
    procedure dspNakloGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure actMakeSpecExecute(Sender: TObject);
    procedure actMakeSpecDetExecute(Sender: TObject);
    procedure actPreviewExecute(Sender: TObject);
    procedure actDesignExecute(Sender: TObject);
    procedure frRepNakloGetValue(const ParName: String;
      var ParValue: Variant);
    procedure actPreviewPriceExecute(Sender: TObject);
    procedure actPostExecute(Sender: TObject);
    procedure actPreviewTtnExecute(Sender: TObject);
    procedure actDebugExecute(Sender: TObject);

	private
		intNpp : integer; //номер позиции по порядку
    FiSklad : integer;
    FiIZG : integer;
		frmEdit : TfrmNaklPeremBuxEdit;
		frmDet : TfrmNaklPeremBuxDet;
    procedure ShowDetail2;
		procedure ShowDetail1;
		procedure ProcessShowDeleted;
		procedure qurNaklrCommit;
		//procedure Order;
		procedure ProcessSettings;
    //function ShowNaklrList : variant;
    procedure PrepareReport(Mode: integer);

	public
		{ Public declarations }
		setT : TfrmSettings;
    Semaphore : boolean; {Семафор для изменения цен в нижней решётке}
    procedure DefaultStartup;
    function DefaultOpen:boolean;
    procedure RecountNakl;
    procedure CreateDocFromMem(slHead:TStringList);
	end;
var
	frmNaklPeremBux: TfrmNaklPeremBux;
  
implementation

{$R *.dfm}

uses
  DateUtils, //IncYear
  SpecOst, // TfrmSpecOst
  DetSelect, // TfrmDetSelect
  SravnPriceList, //TSravnPriceList
  untNaklrList,
  SkladAux, //DefaultOpenInputForm
  DesignReport //ProcessReportDesigner
  ;

procedure TfrmNaklPeremBux.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	Action := caFree;
end;

procedure TfrmNaklPeremBux.actSettingsExecute(Sender: TObject);
begin
  actSettings.checked := setT.ProcessSettingsChange2(DefaultOpen);
end;

procedure TfrmNaklPeremBux.actGrid1ListShowExecute(Sender: TObject);
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

procedure TfrmNaklPeremBux.dbgNaklrDblClick(Sender: TObject);
begin
  actGrid1ListShow.Execute;
end;

procedure TfrmNaklPeremBux.DefaultStartup;
begin
try
  setT.IDManager:=0; // all
  setT.SetPeriod(5);
  //ProcessSettings;
  //DefaultOpen;
except
  AssertInternal('3732FE67-BE35-4B68-8856-01BA9060A04E');
end;
end;

function TfrmNaklPeremBux.DefaultOpen:boolean;
begin
	dmdEx.startWaiting;
  ProcessSettings;
  Result:=DefaultOpenInputForm(qeNaklo);
 	cdsNaklo.Last;
	dmdEx.StopWaiting;
end;

procedure TfrmNaklPeremBux.FormCreate(Sender: TObject);
begin
try
  dmdEx.StartWaiting;
  PropStorageEh1.Section := self.Name;
  PropStorageEh1.Active := true;
  dmdEx.OpenQuery(dmdEx.cdsVlad);
  dmdEx.OpenQuery(dmdEx.cdsManager);
  dmdEx.OpenQuery(dmdEx.cdsClient);
  dmdEx.OpenQuery(dmdEx.cdsVygruzka);
  dmdEx.OpenQuery(dmdEx.cdsTovarAll);
  dmdEx.OpenQuery(dmdEx.cdsTovarAllND);
  dmdEx.OpenQuery(dmdEx.cdsSklads);
  
  //выбираем точное название для Укк
  FiIZG := dmdEx.GetDefaultVlad;

  setT := TfrmSettings.Create(self);
  setT.actAllManagerOn.Execute;
	qeNaklo.DefSql := sdsNaklo.CommandText;
  ProcessShowDeleted;

  dmdEx.StopWaiting;
  frmEdit := TfrmNaklPeremBuxEdit.Create(self);
  frmEdit.dsNakloEdit.DataSet := cdsNaklo;

  frmDet := TfrmNaklPeremBuxDet.Create(self);
	frmDet.dsNaklotEdit.dataset :=  cdsNaklot;

  FiSklad := dmdEx.GetOidObjects('ТИП НАЗВАНИЯ СКЛАДОВ',-100);
  FiSklad := dmdEx.GetOidObjects('УКК Склад',FiSklad);
  ProcessReportDesigner(ActionList1,MainMenu1,frRepNaklo);
except
  AssertInternal('E69CC95E-E261-4389-801D-6A0E50FC8736');
end;
end;

procedure TfrmNaklPeremBux.qurNaklrCommit;
begin
  PostAndApplyOrCancel(cdsNaklo);
end;

procedure TfrmNaklPeremBux.actRefreshExecute(Sender: TObject);
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

procedure TfrmNaklPeremBux.FormDestroy(Sender: TObject);
begin
try
  dmdEx.CloseQuery(dmdEx.cdsVlad, false);
  dmdEx.CloseQuery(dmdEx.cdsClient, false);
  dmdEx.CloseQuery(dmdEx.cdsManager, false);
  dmdEx.CloseQuery(dmdEx.cdsTovarAll, false);
  dmdEx.CloseQuery(dmdEx.cdsTovarAllND, false);
  dmdEx.CloseQuery(dmdEx.cdsSklads, false);
  dmdEx.CloseQuery(dmdEx.cdsClient, false);
  dmdEx.CloseQuery(dmdEx.cdsVygruzka, false);

	frmEdit.Free;
  frmDet.Free;
  setT.Free;
except
  AssertInternal('6F6CE56C-B6D2-4461-B6A9-F4E0FC192E09');
end;
end;

procedure TfrmNaklPeremBux.actGrid2ListShowExecute(Sender: TObject);
begin
  if (cdsNaklot.FieldByName('ID_NAKLD').AsInteger = 0) then begin
    cdsNaklot.Insert;
  end else begin
		ShowDetail2;
  end;
end;


procedure TfrmNaklPeremBux.actRecalcExecute(Sender: TObject);
begin
	//Order;
	//actCalculateSum.Execute;
end;

procedure TfrmNaklPeremBux.FormDeactivate(Sender: TObject);
begin
	qurNaklrCommit;
end;


procedure TfrmNaklPeremBux.actCalculateSumExecute(Sender: TObject);
begin
//  CalculateSum(qurNaklp,qurNaklpt );
end;


procedure TfrmNaklPeremBux.cdsNakloAfterInsert(DataSet: TDataSet);
var
  intGen, iManager : integer;
begin
  //dmdEx.StartWaiting;
  intGen := dmdEx.GetGenValue('naklo_gen');
  DataSet.FieldByName('id_nakl').AsInteger:= intGen;  //assign
  DataSet.FieldByName('id').AsString := inttostr(intGen);
  DataSet.FieldByName('dat').AsDateTime := Date; //default date. time=0
  DataSet.FieldByName('id_izg').asInteger := FiIZG;
	DataSet.FieldByName('posted').asInteger := 0;
  DataSet.FieldByName('delmarked').asInteger := 0;
  DataSet.FieldByName('id_sklad').asInteger := FiSklad;
  iManager := dmdEx.GetIdManager;
  if iManager<>0 then begin
    DataSet.FieldByName('id_manager').asInteger := iManager;
  end;
//  DataSet.FieldByName('id_zak').asInteger := 0;
  //dmdEx.StopWaiting;
  ShowDetail1;
end;


procedure TfrmNaklPeremBux.cdsNaklotAfterInsert(DataSet: TDataSet);
var
  intGen : integer;
begin
  if cdsNaklo.FieldByName('id_nakl').AsInteger=0 then begin
    if cdsNaklo.eof and cdsNaklo.bof then begin
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
  DataSet.FieldByName('kolotp').asFloat := 0;
	ShowDetail2;
end;

procedure TfrmNaklPeremBux.cdsNaklotBeforeInsert(DataSet: TDataSet);
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

procedure TfrmNaklPeremBux.btnUnpostClick(Sender: TObject);
var
  I : integer;
begin
try
  if (cdsNaklo.FieldByName('posted').asInteger = 1) then begin
    if (MessageDlg('Вы хотите вернуть документ?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
      try
        if dbgNaklo.Selection.SelectionType=gstRecordBookmarks then begin
          for i:= 0 to dbgNaklo.Selection.Rows.Count-1 do begin
            cdsNaklo.GotoBookmark(pointer(dbgNaklo.SelectedRows.Items[i]));
            sdsUNPost.Params[0].AsInteger :=
              cdsNaklo.fieldbyname('id_nakl').AsInteger;
            dmdEx.ExecSQL(sdsUNPost,false);
            cdsNaklo.edit;
            cdsNaklo.FieldByName('posted').AsInteger := 0;
            cdsNaklo.Post;
            cdsNaklo.ApplyUpdates(0);
          end;
        end else begin
          sdsUNPost.Params[0].AsInteger :=
            cdsNaklo.fieldbyname('id_nakl').AsInteger;
          dmdEx.ExecSQL(sdsUNPost,false);
          cdsNaklo.edit;
          cdsNaklo.FieldByName('posted').AsInteger := 0;
          cdsNaklo.Post;
          cdsNaklo.ApplyUpdates(0);
        end;  //if
      except
        on E:EDatabaseError do begin
          if AnsiStartsText('no permission', e.message) then begin
            MessageDlg ('Вы не имеете права проводить перемещиеня',mtWarning,[mbOK],0);
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

procedure TfrmNaklPeremBux.cdsNaklotBeforeScroll(DataSet: TDataSet);
begin
try
  if DataSet.Tag<>1 then begin
    ApplyOrCancel (Dataset);
  end;
except
  AssertInternal('5D22C051-79E5-4B0B-9517-8E5B2754C1F8');
end;
end;

procedure TfrmNaklPeremBux.cdsNakloBeforeScroll(DataSet: TDataSet);
begin
try
  ApplyOrCancel (Dataset);
except
  AssertInternal('BB8DE88F-3FA9-4C61-8D1B-82500D64440D');
end;
end;


procedure TfrmNaklPeremBux.dbgNaklotDblClick(Sender: TObject);
begin
  actGrid2ListShow.Execute;
end;

procedure TfrmNaklPeremBux.dbgNakloDblClick(Sender: TObject);
begin
  actGrid1ListShow.Execute;
end;

procedure TfrmNaklPeremBux.dspNakloBeforeUpdateRecord(Sender: TObject;
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

procedure TfrmNaklPeremBux.actShowDeletedExecute(Sender: TObject);
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
procedure TfrmNaklPeremBux.ProcessShowDeleted;
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
procedure TfrmNaklPeremBux.ShowDetail2;
begin
 //if not prohibited to user edit
 if dsNaklot.DataSet.Tag=0 then begin
  dmdEx.StartWaiting;
  frmDet.ShowDetail(
      cdsNaklo.fieldbyname('posted').asInteger);
  RecountNakl;
  dmdEx.StopWaiting;
 end;//tag<>1
end;

procedure TfrmNaklPeremBux.RecountNakl;
begin
  //dmdEx.CalculateSumNaklo(cdsNaklo,cdsNaklot,1);
end;

procedure TfrmNaklPeremBux.cdsNakloReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  showmessage(e.message);
  Action := raCancel;
end;

procedure TfrmNaklPeremBux.ProcessSettings;
//var
//  sTemp : string;
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

    self.Caption :='Перемещения. '
      +'Менеджер: '+setT.Manager + '. Период: c ' + datetostr (setT.DateFrom)
      + ' по '+ datetostr(setT.DateTo)+'. Поставщик: '+
     setT.GetPluginTextResult('fmSettingsPost');
except
  AssertInternal('753B981F-EBFE-4A6E-8AC5-68D8B410C34E');
end;
end;

procedure TfrmNaklPeremBux.cdsNaklotReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  showmessage (e.Message);
  Action := raCancel;
end;

procedure TfrmNaklPeremBux.ShowDetail1;
begin
  if dsNaklo.DataSet.Tag = 0 then begin
    //dmdEx.startWaiting;
    if (frmEdit.Visible = false) then begin
      frmEdit.ShowModal;
    end;
    RecountNakl;
    //dmdEx.stopWaiting;
  end;
end;

procedure TfrmNaklPeremBux.actOrderExecute(Sender: TObject);
begin
 { TODO : Упорядочить по таре }
end;

procedure TfrmNaklPeremBux.actUndeleteNaklExecute(Sender: TObject);
begin
  if actShowDeleted.Checked then begin
    dmdEx.UndeleteNaklo(TintegerField(dsNaklo.DataSet.FieldByName('delmarked')),actRefresh);
  end;
end;

procedure TfrmNaklPeremBux.dbgNakloKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmNaklPeremBux.dbgNaklotKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmNaklPeremBux.cdsNaklotAfterDelete(DataSet: TDataSet);
begin
  RecountNakl
end;

procedure TfrmNaklPeremBux.actShowSravnPriceListExecute(Sender: TObject);
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

procedure TfrmNaklPeremBux.dspNaklotGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
  TableName:='NAKL_PEREM_BUX_DET_VW';
end;

procedure TfrmNaklPeremBux.actSetColumnValueExecute(Sender: TObject);
begin
  dbgNaklot.ReadOnly:=false;
  dmdEx.ColumnSet(dbgNaklot);
  dbgNaklot.ReadOnly:=true;
end;

procedure TfrmNaklPeremBux.actMultColumnValueExecute(Sender: TObject);
begin
  dbgNaklot.ReadOnly := false;
  dmdEx.ColumnMult(dbgNaklot);
  dbgNaklot.ReadOnly := true;
end;

procedure TfrmNaklPeremBux.actIncColumnValueExecute(Sender: TObject);
begin
  dbgNaklot.ReadOnly := false;
  dmdEx.ColumnInc(dbgNaklot);
  dbgNaklot.ReadOnly := true;
end;

procedure TfrmNaklPeremBux.cdsNakloPARENT_ID_NAKLChange(Sender: TField);
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

procedure TfrmNaklPeremBux.dspNakloGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: String);
begin
  TableName := 'NAKL_PEREM_BUX_VW';
end;

procedure TfrmNaklPeremBux.actMakeSpecExecute(Sender: TObject);
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
    slHead.Add('id_sklad='+dsNaklo.DataSet.FieldByName('id_sklad').asString);
    slHead.Add('id_sklad_to='+dsNaklo.DataSet.FieldByName('id_sklad_to').asString);

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
      'id_tovar;kolotp',
      'id_tovar;kolotp',
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

procedure TfrmNaklPeremBux.CreateDocFromMem(slHead:TStringList);
var
  I :integer;
begin
try
  dsNaklo.DataSet.Tag := 1;
  dsNaklo.DataSet.Insert;
  dsNaklo.DataSet.FieldByName('id_sklad').asInteger := strtoint(slHead.Values['id_sklad']);
  dsNaklo.DataSet.FieldByName('id_sklad_to').asInteger := strtoint(slHead.Values['id_sklad_to']);
  dsNaklo.DataSet.FieldByName('id_izg').asInteger := strtoint(slHead.Values['id_izg']);
  dsNaklo.DataSet.FieldByName('comment').asString:=  'Сгенерировано из №'+slHead.Values['id'];
  dsNaklo.DataSet.Post;
  dsNaklo.DataSet.Tag := 0;
  dsNaklot.DataSet.Tag := 1;
  dsPriceDetGen.DataSet.First;
  i:=1;
  while not dsPriceDetGen.DataSet.eof do begin
    dsNaklot.DataSet.Insert;
    CopyFieldValues(dsPriceDetGen.DataSet,
      dsNaklot.DataSet,
      'id_tovar;kolotp',
      'id_tovar;kolotp');
    dsNaklot.DataSet.FieldByName('id_pos').asInteger:=i;
    inc(i);
    dsNaklot.DataSet.Post;
    dsPriceDetGen.DataSet.Next;
  end;                 

  ApplyOrCancel(dsNaklot.DataSet);
  //RecountNakl;
  dsNaklot.DataSet.Tag := 0;
  ApplyOrCancel(dsNaklo.DataSet);
except
  AssertInternal('8E8FD8AB-952B-4322-928F-C6F69E3279BE');
end;
end;

procedure TfrmNaklPeremBux.actMakeSpecDetExecute(Sender: TObject);
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
    slHead.Add('id_izg='+dsNaklo.DataSet.FieldByName('id_izg').asString);
    slHead.Add('id_sklad_to='+dsNaklo.DataSet.FieldByName('id_sklad_to').asString);
    slHead.Add('id_sklad='+dsNaklo.DataSet.FieldByName('id_sklad').asString);
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
          'id_tovar;kolotp',
          'id_tovar;kolotp'
        );
        mtePriceDetGen.Post;
      end;
    end else begin
      mtePriceDetGen.Insert;
      CopyFieldValues(
        dbgNaklot.DataSource.dataset,
        mtePriceDetGen,
        'id_tovar;kolotp',
        'id_tovar;kolotp'
      );
      mtePriceDetGen.Post;
    end;
    //detail copy
    CreateDocFromMem(slHead);
    dsNaklot.DataSet.Tag :=0;
    dmdEx.StopWaiting;
  except
    AssertInternal('2F595926-4247-49DF-8C2A-63F7CAAE3262');
  end;
finally
  slHead.Free;
end;
end; 



procedure TfrmNaklPeremBux.actPreviewExecute(Sender: TObject);
begin
try
  dmdEx.StartWaiting;
  PrepareReport(0);
  dmdEx.GetReport('NaklPeremBux.fr3',frRepNaklo);
  frRepNaklo.ShowReport;
  dmdEx.StopWaiting;
except
  AssertInternal('8E13F0AA-96FE-4C4A-B821-9782F126C8EA');
end;
end;

procedure TfrmNaklPeremBux.actDesignExecute(Sender: TObject);
begin
try
  dmdEx.StartWaiting;
  PrepareReport(0);
  dmdEx.GetReport('NaklPeremBux.fr3',frRepNaklo);
  frRepNaklo.DesignReport;
  dmdEx.StopWaiting;
except
  AssertInternal('F7086465-05A4-4420-8186-A30DA6B758A4');
end;
end;

procedure  TfrmNaklPeremBux.PrepareReport(Mode: integer);
begin
  cdsRepNaklo.Close;
  cdsRepNaklo.Params.ParamByName('id_nakl').asInteger:=
    cdsNaklo.FieldByName('id_nakl').asInteger;
  cdsRepNaklo.Params.ParamByName('mode').asInteger:=Mode;
  cdsRepNaklo.Open;
end;

procedure TfrmNaklPeremBux.frRepNakloGetValue(const ParName: String;
  var ParValue: Variant);
begin
  if AnsiUpperCase(ParName)='NDSTEXT' then begin
    Curr2StrUA1.Active := false;
    Curr2StrUA1.Summa := VarToDbl( cdsRepNaklo.FieldByName('sumnds').Value);
    Curr2StrUA1.Active := true;
    ParValue := Curr2StrUA1.Value;
  end;
end;

procedure TfrmNaklPeremBux.actPreviewPriceExecute(Sender: TObject);
begin
try
  dmdEx.StartWaiting;
  PrepareReport(1);
  dmdEx.GetReport('NaklPeremBux.fr3',frRepNaklo);
  frRepNaklo.ShowReport;
  dmdEx.StopWaiting;
except
  AssertInternal('54179932-EE98-4221-A91F-899352DC4567');
end;
end;

procedure TfrmNaklPeremBux.actPostExecute(Sender: TObject);
begin
  dmdEx.PostNakl(
    TIntegerField(cdsNaklo.FieldByName('posted')),
    sdsPost,
    TIntegerField(cdsNaklo.FieldByName('id_nakl')),
    not actPost.Checked);
end;

procedure TfrmNaklPeremBux.actPreviewTtnExecute(Sender: TObject);
begin
  MonthToStrInit;
  dmdEx.GetReport('TtnPeremBux.fr3',frTtn);
  frTtn.PrintOptions.ShowDialog := true;
  frTtn.PrepareReport;
  frTtn.ShowReport;
end;

procedure TfrmNaklPeremBux.actDebugExecute(Sender: TObject);
begin
  actDebug.Checked := not actDebug.Checked;
  if actDebug.Checked then begin
    ColumnByName(dbgNaklo.Columns,'ID_NAKL').Visible := true;
  end else begin //if actDebug checked
    ColumnByName(dbgNaklo.Columns,'ID_NAKL').Visible := false;
  end;  //if actDebug checked
end;

end.

