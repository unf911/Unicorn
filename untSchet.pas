unit untSchet;

interface

uses
  Windows, Messages, SysUtils,
  Variants, Classes, Graphics,
  Controls, Forms,
  Dialogs,
  DB, DBTables, Grids, DBGrids,
  ActnList,
  StdCtrls, untSettings,
  QueryExtender, DBCtrls,
  untUnfDbLookupListbox,
  untListBoxPosit, ExtCtrls, FMTBcd,  Menus,
  SqlExpr, DBClient, Provider,   frxClass, frxDBSet,
  untSchetList,untRound,untEx,
  SettingsPlugin, // TfmSettingsPlugin
  AtsAssert, frxExportCSV, frxExportImage, GridsEh, DBGridEh, UnfFilter

  ;

type
  TfrmSchet = class(TForm)
    dbgNaklr: TDbGridEh;
    dsNaklr: TDataSource;
    dbgNaklrt: TDbGridEh;
    Button1: TButton;
    ActionList1: TActionList;
    actSettings: TAction;
    qeNaklo: TQueryExtender;
    actGrid1ListShow: TAction;
    ulbListBox1: TUnfDbLookupListbox;
    dsTemp: TDataSource;
    dsNaklrt: TDataSource;
    actPostIf: TAction;
    Button2: TButton;
    actRefresh: TAction;
    ulbListBox2: TUnfDbLookupListbox;
    actGrid2ListShow: TAction;
    Panel1: TPanel;
    actPostIf2: TAction;
    RadioGroup2: TRadioGroup;
    rdbCol1: TRadioButton;
    rdbCol3: TRadioButton;
    rdbCol2: TRadioButton;
    rdbCol4: TRadioButton;
    dsTovar: TDataSource;
    Button3: TButton;
    actRecalc: TAction;
    rdbCol0: TRadioButton;
    actAutoRecalc: TAction;
    frDBNaklot: TfrxDBDataset;
    Button4: TButton;
    actPreview: TAction;
    Button5: TButton;
    actPrint: TAction;
    qeNaklot: TQueryExtender;
    actCalculateSum: TAction;
    dspNaklr: TDataSetProvider;
    qurNaklr: TClientDataSet;
    qurNaklrt: TClientDataSet;
    dspNaklrt: TDataSetProvider;
    sdsNaklr: TSQLDataSet;
    sdsNaklrt: TSQLDataSet;
    qurNaklrID: TStringField;
    qurNaklrKURS: TFloatField;
    qurNaklrSCHET: TIntegerField;
    qurNaklrID_BANK: TIntegerField;
    qurNaklrBANK: TStringField;
    qurNaklrtNPP: TIntegerField;
    qurNaklrtKODCN: TIntegerField;
    qurNaklrtSCH: TIntegerField;
    qurNaklrtSCHET: TIntegerField;
    qurNaklrDAT2: TSQLTimeStampField;
    qurNaklrNDS: TFMTBCDField;
    qurNaklrVSEGO: TFMTBCDField;
    qurNaklrNALOG_NDS: TFMTBCDField;
    qurNaklrtSKIDKA: TFMTBCDField;
    qurNaklrtCENA: TFMTBCDField;
    qurNaklrtKOLOTP: TFloatField;
    qurNaklrtSUMA2: TFloatField;
    sdsTemp: TSQLDataSet;
    dspTemp: TDataSetProvider;
    cdsTemp: TClientDataSet;
    qurNaklrIZG: TStringField;
    qurNaklrZAK: TStringField;
    qurNaklrMANAGER: TStringField;
    qurNaklrID_IZG: TIntegerField;
    qurNaklrID_ZAK: TIntegerField;
    qurNaklrID_MANAGER: TIntegerField;
    qurNaklrIZGFULLNAME: TStringField;
    qurNaklrZAKFULLNAME: TStringField;
    sdsTemp2: TSQLDataSet;
    dspTemp2: TDataSetProvider;
    cdsTemp2: TClientDataSet;
    dsTemp2: TDataSource;
    qurNaklrtEDIZ: TStringField;
    qurNaklrtTARA: TIntegerField;
    qurNaklrtID_TOVAR: TIntegerField;
    qurNaklrtTOVAR: TStringField;
    qurNaklrtCENANDS: TFloatField;
    qurNaklrtSUMANDS: TFloatField;
    sdsNaklrtSCHET: TIntegerField;
    sdsNaklrtNPP: TIntegerField;
    sdsNaklrtKODCN: TIntegerField;
    sdsNaklrtSCH: TIntegerField;
    sdsNaklrtID_TOVAR: TIntegerField;
    sdsNaklrtSKIDKA: TFMTBCDField;
    sdsNaklrtKOLOTP: TFloatField;
    sdsOrder: TSQLDataSet;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    SmallintField1: TSmallintField;
    IntegerField4: TIntegerField;
    FMTBCDField1: TFMTBCDField;
    FMTBCDField2: TFMTBCDField;
    FMTBCDField3: TFMTBCDField;
    MainMenu1: TMainMenu;
    mnuActions: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N1: TMenuItem;
    N5: TMenuItem;
    sdsNaklrSCHET: TIntegerField;
    sdsNaklrID: TStringField;
    sdsNaklrID_IZG: TIntegerField;
    sdsNaklrID_ZAK: TIntegerField;
    sdsNaklrKURS: TFloatField;
    sdsNaklrID_MANAGER: TIntegerField;
    sdsNaklrNDS: TFMTBCDField;
    sdsNaklrVSEGO: TFMTBCDField;
    sdsNaklrDAT: TSQLTimeStampField;
    sdsNaklrNALOG_NDS: TFMTBCDField;
    sdsNaklrID_BANK: TIntegerField;
    qurNaklrtFULLNAME: TStringField;
    PopupMenu1: TPopupMenu;
    actMakeSchetTop: TAction;
    N2: TMenuItem;
    N6: TMenuItem;
    frdbNaklo: TfrxDBDataset;
    frxGIFExport1: TfrxGIFExport;
    UnfFilter1: TUnfFilter;
    UnfFilter2: TUnfFilter;
    actPreviewUsl: TAction;
    N7: TMenuItem;
    actPrintUsl: TAction;
    N8: TMenuItem;
    sdsSchetMakeFromSchet: TSQLDataSet;
    actCopySchet: TAction;
    N9: TMenuItem;
    N10: TMenuItem;
    sdsNaklrtCENA: TFMTBCDField;
    frNaklr: TfrxReport;
    procedure dbgNaklrKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actSettingsExecute(Sender: TObject);
    procedure actGrid1ListShowExecute(Sender: TObject);
    procedure dbgNaklrDblClick(Sender: TObject);
    procedure qurNaklrAfterInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure ulbListBox1DblClick(Sender: TObject);
    procedure ulbListBox1Exit(Sender: TObject);
    procedure ulbListBox1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qurNaklrBeforeScroll(DataSet: TDataSet);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actGrid2ListShowExecute(Sender: TObject);
    procedure dbgNaklrtDblClick(Sender: TObject);
    procedure dbgNaklrtKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ulbListBox2DblClick(Sender: TObject);
    procedure ulbListBox2Exit(Sender: TObject);
    procedure ulbListBox2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actPostIf2Execute(Sender: TObject);
    procedure actPostIfExecute(Sender: TObject);
    procedure qurNaklrtAfterInsert(DataSet: TDataSet);
    procedure qurNaklrtBeforeInsert(DataSet: TDataSet);
    procedure qurNaklrtBeforeScroll(DataSet: TDataSet);
    procedure qurNaklrBeforePost(DataSet: TDataSet);
    procedure actPreviewExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actRecalcExecute(Sender: TObject);
    procedure dbgNaklrExit(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure qurNaklrBeforeDelete(DataSet: TDataSet);
    procedure actCalculateSumExecute(Sender: TObject);
    procedure frNaklrGetValue(const ParName: String;
      var ParValue: Variant);
    procedure qurNaklrtSKIDKAChange(Sender: TField);
    procedure qurNaklrtCENAChange(Sender: TField);
    procedure qurNaklrtCalcFields(DataSet: TDataSet);
    procedure qurNaklrtCENANDSChange(Sender: TField);
    procedure qurNaklrtSUMANDSChange(Sender: TField);
    procedure qurNaklrtKOLOTPChange(Sender: TField);
    procedure qurNaklrtSUMAChange(Sender: TField);
    procedure qurNaklrtBeforePost(DataSet: TDataSet);
    procedure qurNaklrReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure qurNaklrtAfterRefresh(DataSet: TDataSet);
    procedure qurNaklrtAfterDelete(DataSet: TDataSet);
    procedure qurNaklrtAfterOpen(DataSet: TDataSet);
    procedure qurNaklrtBeforeEdit(DataSet: TDataSet);
    procedure qurNaklrtBeforeDelete(DataSet: TDataSet);
    procedure qurNaklrtReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure actMakeSchetTopExecute(Sender: TObject);
    procedure frNaklrBeginDoc(Sender: TObject);
    procedure frNaklrEndDoc(Sender: TObject);
    procedure actPreviewUslExecute(Sender: TObject);
    procedure actPrintUslExecute(Sender: TObject);
    procedure actCopySchetExecute(Sender: TObject);

  private
    { Private declarations }
    intNpp : integer; //номер позиции по порядку
    Semaphore : boolean; //Для разрешения/запрещения редактирования цен
    SettingsManager : TfmSettingsPlugin;
    SettingsVlad : TfmSettingsPlugin ;
    SettingsClient : TfmSettingsPlugin;
    Rect1 : TRect;
    Rect2 : TRect;
    procedure qurNaklrCommit;
    procedure qurNaklrtCommit;
    function GetOrientation :integer;
    procedure Order;
    function ValidNaklr :boolean;
    procedure ProcessSettings(ProcessOnlySecurityMeasures:boolean=false);
    function PrepareReport(sReportName:string):boolean;    
  public
    { Public declarations }
    setT : TfrmSettings;
    function DefaultOpen:boolean;
    procedure DefaultStartup;


  end;
var
  frmSchet: TfrmSchet;

implementation

uses

  SkladAux, //ProcessSettingsVladClientManager
  DesignReport //ProcessReportDesigner
  ;
{$R *.dfm}

procedure TfrmSchet.dbgNaklrKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return :begin
      actGrid1ListShow.Execute;
    end; //vk_return
    vk_f8: begin
      if (MessageDlg('Вы хотите удалить запись?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      begin
        qurNaklr.Delete;
        qurNaklrCommit;
      end;
    end;
  end; //case
end;

procedure TfrmSchet.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qurNaklrCommit;
  Action := caFree;
end;

procedure TfrmSchet.actSettingsExecute(Sender: TObject);
begin
  actSettings.checked := setT.ProcessSettingsChange2(DefaultOpen);
end;

procedure TfrmSchet.actGrid1ListShowExecute(Sender: TObject);
var
  strSql : string;
begin
  if (dbgNaklr.SelectedField.FieldName ='BANK') then begin
    if qurNaklr.FieldByName('izg').IsNull then begin
      showmessage ('Введите отправителя');
    end
    else  begin
      strSql := ' where b.delmarked=0 and b.id_klient='+qurNaklr.FieldByName('id_izg').asString;
      strSql := 'select b.fullname,b.oid from bank_vw b '+
        strSql+
        ' order by b.fullname';
      SetDatasetCommandText(dsTemp.DataSet,strSql);
      Rect1:= LookupBoxEnterEh (ulbListBox1, dbgNaklr, dsTemp, 70);
    end;
  end; //izg
  if (dbgNaklr.SelectedField.FieldName ='IZG') then begin
    cdsTemp2.Close;
    cdsTemp2.CloneCursor(dmdEx.cdsVlad,True);
    Rect1:= LookupBoxEnterEh (ulbListBox1, dbgNaklr, dsTemp2, 70);
  end; //izg
  if (dbgNaklr.SelectedField.FieldName ='ZAK') then begin
    cdsTemp2.Close;
    cdsTemp2.CloneCursor(dmdEx.cdsClient,True);
    Rect1:= LookupBoxEnterEh (ulbListBox1, dbgNaklr, dsTemp2, 70);
  end; //zak
  if (dbgNaklr.SelectedField.FieldName ='MANAGER') then begin
    cdsTemp2.Close;
    cdsTemp2.CloneCursor(dmdEx.cdsManagerSel,True);
    Rect1:= LookupBoxEnterEh (ulbListBox1, dbgNaklr, dsTemp2, 70);
  end; //manager
end;

procedure TfrmSchet.dbgNaklrDblClick(Sender: TObject);
begin
  actGrid1ListShow.Execute;
end;

procedure TfrmSchet.qurNaklrAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('schet').AsInteger:= dmdEx.GetGenValue('schet_gen');
  DataSet.FieldByName('id').AsString:= Inttostr(dmdEx.GetGenValue('SCHET_ID_GEN'));
  DataSet.FieldByName('dat').AsDateTime := Date; //default date. time=0
  DataSet.FieldByName('nalog_nds').AsFloat := dmdEx.GetNds ( Date );
  DataSet.FieldByName('kurs').asFloat := 1.0000;
  SetManager(TIntegerField(DataSet.FieldByName('id_manager')),SettingsManager);
end;

procedure TfrmSchet.FormCreate(Sender: TObject);
begin
  qeNaklo.DefSql := sdsNaklr.CommandText;
  qeNaklot.DefSql := sdsNaklrt.CommandText;
  MonthToStrInit;
  //Инициализация настроек
  setT := TfrmSettings.Create(self);
  setT.actManagerOff.execute;

  SettingsManager := setT.CreatePlugin('TfmSettingsManager');

  setT.AddPlugin(SettingsManager);
  //менеджеры из зоны видимости
  SettingsManager.SetResultType(2);
  
  SettingsVlad := setT.CreatePlugin('TfmSettingsVlad');
  SettingsVlad.SetResultType(2);
  setT.AddPlugin(SettingsVlad);

  SettingsClient := setT.CreatePlugin('TfmSettingsClient');
  setT.addplugin(SettingsClient);
  ProcessSettings(true);
  //Конец инициализации настроек
  qeNaklot.SetSQL('order by','d.npp',0);
  dmdEx.OpenQuery(dmdEx.cdsTovarAll);
  dmdEx.OpenQuery(dmdEx.cdsVlad);
  dmdEx.OpenQuery(dmdEx.cdsClient);
  dmdEx.OpenQuery(dmdEx.cdsManager);
  dmdEx.OpenQuery(dmdEx.cdsBank);
end;

procedure TfrmSchet.ProcessSettings(ProcessOnlySecurityMeasures:boolean=false);
begin
try
  ProcessSettingsVladClientManager(qeNaklo,setT,ProcessOnlySecurityMeasures);
  self.Caption := UpdateCaptionVladClientManager('Счета:',setT);
except
  AssertInternal('CF82D21A-6794-41FD-A6DC-C2D0A5D968FF');
end;
end;

procedure TfrmSchet.ulbListBox1DblClick(Sender: TObject);
begin
  LookupBoxExitOkEh (ulbListBox1 , dbgNaklr, Rect1);
  actPostIf.Execute;
end;

procedure TfrmSchet.ulbListBox1Exit(Sender: TObject);
begin
  LookupBoxExitCancel (ulbListBox1, dbgNaklr, Rect1);
end;

procedure TfrmSchet.ulbListBox1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return : begin
        LookupBoxExitOkEh (ulbListBox1 , dbgNaklr, Rect1);
        actPostIf.Execute;
    end; //enter
    vk_escape : begin
      ulbListBox1.Hide;
    end;
  end;//case
end;

procedure TfrmSchet.qurNaklrCommit;
begin
  qurNaklrCommit2(qurNaklr,qurNaklrt);
end;

procedure TfrmSchet.qurNaklrBeforeScroll(DataSet: TDataSet);
begin
  qurNaklrtCommit;
  qurNaklrCommit;
end;

procedure TfrmSchet.actRefreshExecute(Sender: TObject);
begin
  qurNaklrCommit;
  qeNaklo.Refresh;
//  ProcessSettings;
//  DefaultOpen;
end;

procedure TfrmSchet.FormDestroy(Sender: TObject);
begin
  dmdEx.CloseQuery(dmdEx.cdsVlad,false);
  dmdEx.CloseQuery(dmdEx.cdsClient,false);
  dmdEx.CloseQuery(dmdEx.cdsTovarAll,false);
  dmdEx.CloseQuery(dmdEx.cdsManager,false);
  dmdEx.CloseQuery(dmdEx.cdsBank,false);
  setT.Free;
end;

procedure TfrmSchet.actGrid2ListShowExecute(Sender: TObject);
begin
  if (dbgNaklrt.SelectedField.FieldName ='TOVAR') then begin
    { TODO : Перебить на dmdEx.cdsTovarND }
    cdsTemp2.Close;
    cdsTemp2.CloneCursor(dmdEx.cdsTovarAll,True);
    cdsTemp2.Filter:='delmarked=0';
		cdsTemp2.Filtered := true;
		Rect2:=	LookupBoxEnterEh (ulbListBox2, dbgNaklrt, dsTemp2, 70);
	end; //tovar
end;

procedure TfrmSchet.dbgNaklrtDblClick(Sender: TObject);
begin
  actGrid2listshow.Execute;
end;

procedure TfrmSchet.dbgNaklrtKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return : begin
      actGrid2ListShow.Execute;
    end; //vk_return
    vk_f8 : begin
      if (MessageDlg('Вы хотите удалить позицию?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
        qurNaklrt.Delete;
      end;
    end;
  end; //case
end;

procedure TfrmSchet.ulbListBox2DblClick(Sender: TObject);
begin
  LookupBoxExitOkEh (ulbListBox2 , dbgNaklrt, Rect2);
  actPostIf2.Execute;
end;

procedure TfrmSchet.ulbListBox2Exit(Sender: TObject);
begin
  LookupBoxExitCancel (ulbListBox2, dbgNaklrt, Rect2);
end;

procedure TfrmSchet.ulbListBox2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return : begin
      LookupBoxExitOkEh (ulbListBox2 , dbgNaklrt, Rect2);
      actPostIf2.Execute;
    end;
    vk_escape : begin
      ulbListBox2.Hide;
    end;
  end;
end;

procedure TfrmSchet.actPostIf2Execute(Sender: TObject);
begin
  if (qurNaklrt.State in [dsBrowse]) then begin
    qurNaklrt.Edit;
  end;//if dsBrowse
  if rdbCol0.Checked then begin
    qurNaklrt.FieldByName('kodcn').asinteger:=1;
  end;
  if rdbCol1.Checked then begin
    qurNaklrt.FieldByName('kodcn').asinteger:=2;
  end;
  if rdbCol2.Checked then begin
    qurNaklrt.FieldByName('kodcn').asinteger:=3;
  end;
  if rdbCol3.Checked then begin
    qurNaklrt.FieldByName('kodcn').asinteger:=4;
  end;
  if rdbCol4.Checked then begin
    qurNaklrt.FieldByName('kodcn').asinteger:=5;
  end;
  Semaphore :=true;
  FromCenaRecount(5,dsNaklr.DataSet,dsNaklrt.Dataset);
  semaphore := false;
end;

procedure TfrmSchet.actPostIfExecute(Sender: TObject);
var
  strSql : string;
begin
  if (dbgNaklr.SelectedField.FieldName='IZG') then begin
      strSql := ' where b.id_klient='+qurNaklr.FieldByName('id_izg').asString;
      strSql := 'select b.fullname,b.oid from bank_vw b '+
        strSql+
        ' order by b.fullname';
      cdsTemp.Close;
      cdsTemp.CommandText := strSql;
      cdsTemp.Open;
      if (cdsTemp.RecordCount=1) then begin
        qurNaklr.FieldByName('id_bank').asInteger:=
          cdsTemp.FieldByName('oid').asInteger;
      end else begin
         qurNaklr.FieldByName('id_bank').clear;
      end;
      cdsTemp.Close;
  end;
end;

procedure TfrmSchet.qurNaklrtAfterInsert(DataSet: TDataSet);
begin
  qurNaklrt.FieldByName('sch').asInteger :=
    dmdEx.GetGenValue('naklrt_gen');
  intNpp := intNpp +1;
  qurNaklrt.FieldByName('npp').asinteger:= intNpp;
  qurNaklrt.FieldByName('kolotp').asinteger:=0;
  qurNaklrt.FieldByName('schet').asInteger :=
    qurNaklr.FieldByName('schet').asInteger;
  qurNaklrt.FieldByName('kolotp').asFloat := 0;
end;

procedure TfrmSchet.qurNaklrtBeforeInsert(DataSet: TDataSet);
begin
  if PostAndApply(dsNaklr.DataSet)<>0 then begin
    abort;
  end;
  DataSet.Last;
  try
    intNpp:=DataSet.fieldbyname('npp').asInteger;
  except
    intNpp:=0;
  end;
end;

procedure TfrmSchet.qurNaklrtCommit;
begin
  qurNaklrtCommit2(qurNaklrt);
end;

procedure TfrmSchet.qurNaklrtBeforeScroll(DataSet: TDataSet);
begin
  ApplyOrCancel(DataSet);
end;

//////////////////////////////////////////////
//  Процедура упорядочивания
///
procedure TfrmSchet.Order;
begin
  sdsOrder.Params.ParamByName('id_nakl').asInteger :=
    dsNaklr.Dataset.FieldByName('schet').asInteger;
  dmdEx.ExecSQL(sdsOrder);
  qeNaklot.Refresh;
  //Order2( qeNaklot);
end;

////////////////////////////////////////////////////////////
// 1- portrait orientation
// 0-landscape orientation (default)
function TfrmSchet.GetOrientation: integer;
var
  iMax : integer;  //максимальная длина поля
  iCount : integer; //колво строк
begin
  iMax :=0;
  iCount :=0;
  qurNaklrt.First;
  while (not qurNaklrt.Eof) do begin
    inc(iCount);
    if (Length(qurNaklrt.FieldByName('fullname').asString)>iMax) then begin
      iMax := Length(qurNaklrt.FieldByName('fullname').asString);
    end;
    qurNaklrt.Next;
  end; //while
  Result := 0; //landscape default
  if iMax > 39 then begin
    Result := 1; //portrait
  end;
  if iCount >= 14 then begin
    Result := 1;
  end;
end;
/////////////////////////////////////////////////////////////

procedure TfrmSchet.qurNaklrBeforePost(DataSet: TDataSet);
begin
	if DataSet.FieldByName('dat').IsNull then begin
		showmessage ('Заполните поле ''Дата''');
		abort;
	end;
	if DataSet.FieldByName('id_izg').IsNull then begin
		showmessage ('Заполните поле ''Поставщик''');
		abort;
	end;
	if DataSet.FieldByName('id_zak').IsNull then begin
		showmessage ('Заполните поле ''Получатель''');
		abort;
	end;
	if DataSet.FieldByName('id_manager').IsNull then begin
		showmessage ('Заполните поле ''Менеджер''');
		abort;
	end;
	if DataSet.FieldByName('kurs').IsNull then begin
		showmessage ('Заполните поле ''Курс''');
		abort;
	end else begin
    DataSet.FieldByName('kurs').AsFloat :=
      rroundto( DataSet.FieldByName('kurs').AsFloat,-4);
  end;
end;

procedure TfrmSchet.actPreviewExecute(Sender: TObject);
var
  bReadyToPrint : boolean;
begin
  if (GetOrientation = 0) then begin
    bReadyToPrint := PrepareReport('Schet.fr3');
  end else begin
    bReadyToPrint := PrepareReport('Schet2.fr3');
  end;
  if bReadyToPrint then frNaklr.ShowReport;
end;

procedure TfrmSchet.actPrintExecute(Sender: TObject);
var
  bReadyToPrint : boolean;
begin
  if (GetOrientation = 0) then begin
    bReadyToPrint := PrepareReport('Schet.fr3');
  end else begin
    bReadyToPrint := PrepareReport('Schet2.fr3');
  end;
  if bReadyToPrint then frNaklr.Print;
end;

procedure TfrmSchet.actRecalcExecute(Sender: TObject);
begin
  actCalculateSum.Execute;
  Order;
end;

procedure TfrmSchet.dbgNaklrExit(Sender: TObject);
begin
  qurNaklrCommit;
end;

procedure TfrmSchet.FormDeactivate(Sender: TObject);
begin
  qurNaklrCommit ;
end;

procedure TfrmSchet.qurNaklrBeforeDelete(DataSet: TDataSet);
begin
  qurNaklrt.first;
  while (not qurNaklrt.Eof) do begin
    qurNaklrt.Delete;
  end;
end;

procedure TfrmSchet.actCalculateSumExecute(Sender: TObject);
begin
  SumRecount(qurNaklr,qurNaklrt,1);
  PostAndApply(dsNaklr.Dataset);
end;

procedure TfrmSchet.frNaklrGetValue(const ParName: String;
  var ParValue: Variant);
begin
  if AnsiUpperCase (ParName)='OKPO' then begin
    ParValue := cdsTemp.FieldByName('okpo').asString;
  end;
  if AnsiUpperCase (ParName)='ADR' then begin
    ParValue := cdsTemp.FieldByName('adrp').asString;
  end;
  if AnsiUpperCase (ParName)='RASCH' then begin
    ParValue := cdsTemp.FieldByName('rasch').asString;
  end;
  if AnsiUpperCase (ParName)='BANK_NAME' then begin
    ParValue := cdsTemp.FieldByName('bank_name').asString;
  end;
  if AnsiUpperCase (ParName)='SVID' then begin
    ParValue := cdsTemp.FieldByName('svid').asString;
  end;
  if AnsiUpperCase (ParName)='IPN' then begin
    ParValue := cdsTemp.FieldByName('IPN').asString;
  end;
  if AnsiUpperCase (ParName)='MFO' then begin
    ParValue := cdsTemp.FieldByName('MFO').asString;
  end;
  if AnsiUpperCase(ParName)='SUMA2GRN' then begin
    ParValue := Suma2Grn(qurNaklr,qurNaklrt,1);
  end;
  if AnsiUpperCase(ParName)='SCHET_REKLAMA' then begin
    ParValue :=  dmdEx.GetParamCachedString(
    'schet_reklama',
    'select p_value from get_param_pc(''schet_reklama'')',
    'p_value');
  end
end;


function TfrmSchet.ValidNaklr :boolean;
begin
  result := false;
  if not (qurNaklr.FieldByName('id_bank').IsNull) then begin
    result := true;
  end else begin
    showmessage ('Выберите счёт фирмы');
  end;
end;

procedure TfrmSchet.qurNaklrtCalcFields(DataSet: TDataSet);
begin
  if not Semaphore and (DataSet.state =dsInternalCalc) then begin
    Semaphore := true;
    FromCenaRecount(1,dsNaklr.DataSet,dsNaklrt.DataSet,1);
    Semaphore := false;
  end;
end;

procedure TfrmSchet.qurNaklrtSKIDKAChange(Sender: TField);

begin
  if not Semaphore then begin
    Semaphore := true;
    FromCenaRecount(5,dsNaklr.DataSet,dsNaklrt.DataSet,1);
    Semaphore := false;
  end;
end;

procedure TfrmSchet.qurNaklrtCENAChange(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    FromCenaRecount(6,dsNaklr.DataSet,dsNaklrt.Dataset,1);
    Semaphore := false;
  end;
end;

procedure TfrmSchet.qurNaklrtCENANDSChange(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    FromCenaRecount(2,dsNaklr.DataSet,dsNaklrt.Dataset,1);
    Semaphore := false;
  end;
end;

procedure TfrmSchet.qurNaklrtKOLOTPChange(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    FromCenaRecount(1,dsNaklr.DataSet,dsNaklrt.Dataset,1);
    Semaphore := false;
  end;
end;

procedure TfrmSchet.qurNaklrtSUMAChange(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    FromCenaRecount(3,dsNaklr.DataSet,dsNaklrt.Dataset,1);
    Semaphore := false;
  end;
end;

procedure TfrmSchet.qurNaklrtSUMANDSChange(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    FromCenaRecount(4,dsNaklr.DataSet,dsNaklrt.DataSet,1);
    Semaphore := false;
  end;
end;

procedure TfrmSchet.qurNaklrtBeforePost(DataSet: TDataSet);
begin
	if DataSet.FieldByName('id_tovar').IsNull then begin
		showmessage ('Заполните поле ''Товар''');
		abort;
	end;
end;

procedure TfrmSchet.qurNaklrReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  showmessage(e.message);
  Action := raAbort;
end;

procedure TfrmSchet.qurNaklrtAfterRefresh(DataSet: TDataSet);
begin
  with qurNaklrt do begin
    DisableControls;
    First;
    while not Eof do begin
      Edit;
      if not Semaphore then begin
        Semaphore := true;
        FromCenaRecount(1,dsNaklr.DataSet,dsNaklrt.DataSet);
        Semaphore := false;
      end;
      Next;
    end;
    First;
    EnableControls;
  end;
end;

procedure TfrmSchet.qurNaklrtAfterDelete(DataSet: TDataSet);
begin
  ApplyOrCancel(DataSet);
end;

procedure TfrmSchet.qurNaklrtAfterOpen(DataSet: TDataSet);
begin
  with qurNaklrt do begin
    DisableControls;
    First;
    while not Eof do begin
      Edit;
      if not Semaphore then begin
        Semaphore := true;
        FromCenaRecount(1,dsNaklr.DataSet,dsNaklrt.DataSet);
        Semaphore := false;
      end;
      Next;
    end;
    First;
    EnableControls;
  end;
end;

procedure TfrmSchet.qurNaklrtBeforeEdit(DataSet: TDataSet);
begin
	if PostAndApply(dsNaklr.DataSet)<>0 then begin
    Abort;
	end;  
end;

procedure TfrmSchet.qurNaklrtBeforeDelete(DataSet: TDataSet);
begin
	if PostAndApply(dsNaklr.DataSet)<>0 then begin
    abort;
	end;
end;

procedure TfrmSchet.qurNaklrtReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  showmessage(e.message);
  Action := raAbort;  
end;

function TfrmSchet.DefaultOpen:boolean;
begin
  ProcessSettings;
  Result:=DefaultOpenInputForm(qeNaklo);
end;

procedure TfrmSchet.DefaultStartup;
begin
  SettingsManager.SetKeyValue(dmdEx.GetIdManager);
  ProcessSettings;
end;

procedure TfrmSchet.actMakeSchetTopExecute(Sender: TObject);
var
  slSchet : TStringList;
begin
  slSchet := TStringList.Create;
  try
    if qurNaklr.Eof and qurNaklr.Bof then begin
      MessageDlg('Не выбран документ',mtWarning,[mbOk],0);
      exit;
    end;                        
    slSchet.Add('id_izg='+qurNaklr.FieldByName('id_izg').asString);
    slSchet.Add('id_zak='+qurNaklr.FieldByName('id_zak').asString);
    slSchet.Add('id_manager='+qurNaklr.FieldByName('id_manager').asString);
    slSchet.Add('id_bank='+qurNaklr.FieldByName('id_bank').asString);

    qurNaklr.Insert;
    qurNaklr.FieldByName('id_izg').asInteger := strtoint(slSchet.Values['id_izg']);
    qurNaklr.FieldByName('id_zak').asInteger := strtoint(slSchet.Values['id_zak']);
    qurNaklr.FieldByName('id_manager').asInteger := strtoint(slSchet.Values['id_manager']);
    qurNaklr.FieldByName('id_bank').asInteger := strtoint(slSchet.Values['id_bank']);
    qurNaklr.Post;
  finally
    slSchet.Free;
  end;
end;

procedure TfrmSchet.frNaklrBeginDoc(Sender: TObject);
begin
  cdsTemp.Close;
  cdsTemp.ProviderName:='dspTemp';
  cdsTemp.CommandText :=
    'select v.svreg as svid,v.ipn,v.okpo,b.bank_name,b.rasch,b.mfo,v.adrp'+
    '  from klient v left join bank_vw b on b.id_klient=v.id where v.id='+
    qurNaklr.FieldByName('id_izg').asString+
    ' and (b.oid='+
    inttostr(qurNaklr.FieldByName('id_bank').asInteger)+' or b.oid is null)';
  cdsTemp.Open;
  frxGIFExport1.FileName:=
    'Schet_'+
    FormatDateTime('yymmdd',qurNaklr.FieldByName('dat').AsDateTime)+
    '_'+qurNaklr.FieldByName('id').AsString+'.gif';
end;

procedure TfrmSchet.frNaklrEndDoc(Sender: TObject);
begin
  cdsTemp.Close;
end;

procedure TfrmSchet.actPreviewUslExecute(Sender: TObject);
var
  bReadyToPrint : boolean;
begin
  if (GetOrientation = 0) then begin
    bReadyToPrint := PrepareReport('SchetUsl.fr3');
  end else begin
    bReadyToPrint := PrepareReport('SchetUsl2.fr3');
  end;
  if bReadyToPrint then frNaklr.ShowReport; 
end;

function TfrmSchet.PrepareReport(sReportName:string):boolean;
begin
  Result := true;
  if (not ValidNaklr) then begin
    result := false;
  end;
  actCalculateSum.Execute;
  PostAndApply(dsNaklr.Dataset);
  Order;
  MonthToStrInit;
  dmdEx.GetReport(sReportName,frNaklr);
  frNaklr.PrepareReport;
end;

procedure PrintUsl (dbgNaklot: TDBGridEh;param:variant;Object1:Pointer=nil );
var
  frmSchet : TfrmSchet;
  bReadyToPrint : boolean;
begin
  frmSchet := TfrmSchet(Object1);
  if (frmSchet.GetOrientation = 0) then begin
    bReadyToPrint := frmSchet.PrepareReport('SchetUsl.fr3');
  end else begin
    bReadyToPrint := frmSchet.PrepareReport('SchetUsl2.fr3');
  end;
  if bReadyToPrint then begin
    frmSchet.frNaklr.PrintOptions.ShowDialog :=false;
    frmSchet.frNaklr.Print;
  end;
end;



procedure TfrmSchet.actPrintUslExecute(Sender: TObject);
begin
  MonthToStrInit;
  dmdEx.ColumnSelectAndProcess(dbgNaklr,Null,PrintUsl,self);
end;

procedure CopySchet (dbgNaklot: TDBGridEh;param:variant;Object1:Pointer=nil );
var
  frmSchet : TfrmSchet;
begin
  frmSchet := TfrmSchet(Object1);
  frmSchet.sdsSchetMakeFromSchet.Params.ParamByName('id_nakl_in').AsInteger :=
    dbgNaklot.DataSource.DataSet.fieldByName('schet').asInteger;
  frmSchet.sdsSchetMakeFromSchet.ExecSQL;
  frmSchet.actCopySchet.Tag :=
    frmSchet.sdsSchetMakeFromSchet.Params.ParamByName('id_nakl').AsInteger;
end;

procedure FillSettings2(setT2: TfrmSettings);
var
  SettingsDate,SettingsTovarOld,SettingsTovar : TfmSettingsPlugin;
begin

  setT2.actDataOff.Execute;
  setT2.actManagerOff.Execute;
  SettingsDate := setT2.CreatePlugin('TfmSettingsDate');
  setT2.AddPlugin(SettingsDate);
  SettingsDate.SetResultType(1);
  SettingsTovarOld := setT2.CreatePlugin('TfmSettingsTovar');
  SettingsTovarOld.Name := 'fmSettingsTovarOld';
  setT2.AddPlugin(SettingsTovarOld);
  SettingsTovar := setT2.CreatePlugin('TfmSettingsTovar');
  setT2.AddPlugin(SettingsTovar);
end;

procedure TfrmSchet.actCopySchetExecute(Sender: TObject);
var
  setT2 : TfrmSettings;

begin
  actCopySchet.Tag:=0;
  if  dbgNaklr.DataSource.DataSet.eof and dbgNaklr.DataSource.DataSet.bof then begin
    exit;
  end;

  //new date
  //old tovar
  //new tovar
  setT2 := TfrmSettings.Create(self);
  FillSettings2(setT2);

  //procedure call
  if setT2.ChangeSettings = mrOk then begin
    //sdsSchetMakeFromSchet.Params.ParamByName('id_nakl_in').AsInteger :=
    //  dbgNaklr.DataSource.DataSet.fieldByName('schet').asInteger;
    sdsSchetMakeFromSchet.Params.ParamByName('dat_new').AsDate :=
      StrToDate(setT2.getpluginresult('fmSettingsDate'));
    dmdEx.SetIntegerParamValue(sdsSchetMakeFromSchet.Params.ParamByName('id_tovar_from'),
      setT2.getpluginresult('fmSettingsTovarOld')) ;
    dmdEx.SetIntegerParamValue(sdsSchetMakeFromSchet.Params.ParamByName('id_tovar_to'),
      setT2.getpluginresult('fmSettingsTovar')) ;
    dmdEx.ColumnSelectAndProcess(dbgNaklr,Null,CopySchet,self);
    //sdsSchetMakeFromSchet.ExecSQL;
    //actCopySchet.Tag := sdsSchetMakeFromSchet.Params.ParamByName('id_nakl').AsInteger;
  end;
  //refresh
  qeNaklo.Refresh();
end;




end.

