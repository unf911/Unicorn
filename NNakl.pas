unit NNakl;
//Налоговые накладные

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
  untListBoxPosit, ExtCtrls, FMTBcd, DBClient, Provider, SqlExpr,
    frxClass, frxDBSet,
  untSchetList,untRound , untNaklrList,
  untEx,
  SettingsPlugin, // TfmSettingsPlugin
  RecError, Menus, MemTableDataEh, MemTableEh, GridsEh, DBGridEh, UnfFilter,
  PropFilerEh, PropStorageEh, Buttons

    ;

const KlientTipExport: integer = 1;
const KlientTipNeplNds: integer = 2;

type


  TfrmNNakl = class(TForm)
    dbgNaklr: TDbGridEh;
    dsNaklr: TDataSource;
    dbgNaklrt: TDbGridEh;
    Button1: TButton;
    ActionList1: TActionList;
    actSettings: TAction;
    qeNaklr: TQueryExtender;
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
    Button3: TButton;
    actRecalc: TAction;
    rdbCol0: TRadioButton;
    actAutoRecalc: TAction;
    frdNaklot: TfrxDBDataset;
    Button4: TButton;
    actPreview: TAction;
    Button5: TButton;
    actPrint: TAction;
    Button6: TButton;
    actSchet: TAction;
    qeNaklrt: TQueryExtender;
    actCalculateSum: TAction;
    sdsNaklr: TSQLDataSet;
    sdsNaklrt: TSQLDataSet;
    dspNaklr: TDataSetProvider;
    dspNaklrt: TDataSetProvider;
    cdsNaklr: TClientDataSet;
    cdsNaklrt: TClientDataSet;
    dsNaklrSrc2: TDataSource;
    cdsNaklrSCHET: TIntegerField;
    cdsNaklrID_ZAK: TIntegerField;
    cdsNaklrID_MANAGER: TIntegerField;
    cdsNaklrNDS: TFMTBCDField;
    cdsNaklrNAKL: TIntegerField;
    cdsNaklrKURS: TFMTBCDField;
    cdsNaklrVSEGO: TFMTBCDField;
    cdsNaklrVIDOPL: TStringField;
    cdsNaklrUSL: TStringField;
    cdsNaklrNALOG_NDS: TFMTBCDField;
    cdsNaklrZAK: TStringField;
    cdsNaklrIZG: TStringField;
    cdsNaklrMANAGER: TStringField;
    cdsNaklrDAT: TSQLTimeStampField;
    cdsNaklrtSCHET: TIntegerField;
    cdsNaklrtNPP: TIntegerField;
    cdsNaklrtKODCN: TIntegerField;
    cdsNaklrtSCH: TIntegerField;
    cdsNaklrtSKIDKA: TFMTBCDField;
    cdsNaklrtCENA: TFMTBCDField;
    cdsNaklrtKOLOTP: TFloatField;
    cdsNaklrtNDS: TFMTBCDField;
    cdsNaklrtSUMA2: TFMTBCDField;
    cdsNaklrID_IZG: TIntegerField;
    cdsNaklrtID_TOVAR: TIntegerField;
    cdsNaklrtEDIZ: TStringField;
    cdsNaklrtVSEGO: TFMTBCDField;
    sdsNaklrtSCHET: TIntegerField;
    sdsNaklrtNPP: TIntegerField;
    sdsNaklrtKODCN: TIntegerField;
    sdsNaklrtID_TOVAR: TIntegerField;
    sdsNaklrtTARA: TSmallintField;
    sdsNaklrtSCH: TIntegerField;
    sdsNaklrtSKIDKA: TFMTBCDField;
    sdsNaklrtCENA: TFMTBCDField;
    sdsNaklrtNDS: TFMTBCDField;
    sdsNaklrtKOLOTP: TFloatField;
    sdsNaklrtSUMA2: TFMTBCDField;
    sdsNaklrtVSEGO: TFMTBCDField;
    Button7: TButton;
    actMarkCorrect: TAction;
    cdsNaklrTIP: TSmallintField;
    sdsNaklrSCHET: TIntegerField;
    sdsNaklrID_IZG: TIntegerField;
    sdsNaklrID_ZAK: TIntegerField;
    sdsNaklrID_MANAGER: TIntegerField;
    sdsNaklrDAT: TSQLTimeStampField;
    sdsNaklrNDS: TFMTBCDField;
    sdsNaklrNAKL: TIntegerField;
    sdsNaklrKURS: TFMTBCDField;
    sdsNaklrVSEGO: TFMTBCDField;
    sdsNaklrUSL: TStringField;
    sdsNaklrNALOG_NDS: TFMTBCDField;
    sdsNaklrTIP: TSmallintField;
    cdsNaklrtFULLNAME: TStringField;
    sdsTipNNakl: TSQLDataSet;
    dspTipNNakl: TDataSetProvider;
    cdsTipNNakl: TClientDataSet;
    dsTipNNakl: TDataSource;
    cdsNaklrTIPNAME: TStringField;
    sdsNaklrVIDOPL: TStringField;
    MainMenu1: TMainMenu;
    mnuActions: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N1: TMenuItem;
    N5: TMenuItem;
    frdNaklo: TfrxDBDataset;
    mtePriceDetGen: TMemTableEh;
    mtePriceDetGenID_TOVAR: TIntegerField;
    mtePriceDetGenCENA: TFloatField;
    mtePriceDetGenSKIDKA: TFloatField;
    mtePriceDetGenKOLOTP: TFloatField;
    dsPriceDetGen: TDataSource;
    mtePriceDetGenTARA: TIntegerField;
    mtePriceDetGenKODCN: TIntegerField;
    mtePriceDetGenNPP: TIntegerField;
    UnfFilter1: TUnfFilter;
    UnfFilter2: TUnfFilter;
    cdsNaklrtTARA: TIntegerField;
    actMakeNNaklrFromNNaklr: TAction;
    N2: TMenuItem;
    ppmNaklr: TPopupMenu;
    N13: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    sdsNaklrSIGNATURE: TStringField;
    cdsNaklrSIGNATURE: TStringField;
    actPreviewOld: TAction;
    N8: TMenuItem;
    actPreviewCopy: TAction;
    N9: TMenuItem;
    sdsDogovor: TSQLDataSet;
    dspDogovor: TDataSetProvider;
    cdsDogovor: TClientDataSet;
    cdsDogovorID_DOGOVOR: TIntegerField;
    cdsDogovorID_KLIENT: TIntegerField;
    cdsDogovorDAT: TSQLTimeStampField;
    cdsDogovorID: TStringField;
    cdsDogovorIS_DEFAULT: TIntegerField;
    dsDogovor: TDataSource;
    cdsDogovorTIP_DOGOVORA: TStringField;
    cdsDogovorDELMARKED: TSmallintField;
    sdsNaklrID_DOGOVOR: TIntegerField;
    cdsNaklrID_DOGOVOR: TIntegerField;
    cdsNaklrDOGOVOR: TStringField;
    sdsDogovorForClient: TSQLDataSet;
    dspDogovorForClient: TDataSetProvider;
    cdsDogovorForClient: TClientDataSet;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    SQLTimeStampField1: TSQLTimeStampField;
    StringField1: TStringField;
    IntegerField3: TIntegerField;
    StringField2: TStringField;
    SmallintField1: TSmallintField;
    dsDogovorForClient: TDataSource;
    cdsNaklrDOGOVOR_DAT: TDateField;
    cdsNaklrTIP_DOGOVORA: TStringField;
    rpsClientEdit: TRegPropStorageManEh;
    PropStorageEh1: TPropStorageEh;
    qeDogovor: TQueryExtender;
    cdsNaklrTIP_CODE: TStringField;
    actPrintCopy: TAction;
    N10: TMenuItem;
    sdsNaklrID2: TIntegerField;
    cdsNaklrID2: TIntegerField;
    cdsNaklrtTOVAR: TStringField;
    cdsNaklrtKODVED: TFMTBCDField;
    actGenerateXML: TAction;
    XML1: TMenuItem;
    frNaklr: TfrxReport;
    procedure dbgNaklrKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actSettingsExecute(Sender: TObject);
    procedure actGrid1ListShowExecute(Sender: TObject);
    procedure dbgNaklrDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ulbListBox1DblClick(Sender: TObject);
    procedure ulbListBox1Exit(Sender: TObject);
    procedure ulbListBox1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
    procedure rdbCol1Click(Sender: TObject);
    procedure actPreviewExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actSchetExecute(Sender: TObject);
    procedure actRecalcExecute(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure actCalculateSumExecute(Sender: TObject);
    procedure frNaklrGetValue(const ParName: String;
      var ParValue: Variant);
    procedure cdsNaklrtAfterInsert(DataSet: TDataSet);
    procedure cdsNaklrtBeforeInsert(DataSet: TDataSet);
    procedure cdsNaklrtBeforeScroll(DataSet: TDataSet);
    procedure cdsNaklrBeforePost(DataSet: TDataSet);
    procedure cdsNaklrBeforeScroll(DataSet: TDataSet);
    procedure cdsNaklrBeforeDelete(DataSet: TDataSet);
    procedure cdsNaklrAfterInsert(DataSet: TDataSet);
    procedure cdsNaklrtNDSChange(Sender: TField);
    procedure cdsNaklrtCENAChange(Sender: TField);
    procedure cdsNaklrtKOLOTPChange(Sender: TField);
    procedure cdsNaklrtVSEGOChange(Sender: TField);
    procedure cdsNaklrtSUMA2Change(Sender: TField);
    procedure cdsNaklrtSKIDKAChange(Sender: TField);
    procedure cdsNaklrtTOVARChange(Sender: TField);
    procedure dbgNaklrEnter(Sender: TObject);
    procedure dbgNaklrtEnter(Sender: TObject);
    procedure actPostIfExecute(Sender: TObject);
		procedure dbgNaklrtKeyDown(Sender: TObject; var Key: Word;
			Shift: TShiftState);
		procedure cdsNaklrtReconcileError(DataSet: TCustomClientDataSet;
			E: EReconcileError; UpdateKind: TUpdateKind;
			var Action: TReconcileAction);
		procedure cdsNaklrReconcileError(DataSet: TCustomClientDataSet;
			E: EReconcileError; UpdateKind: TUpdateKind;
			var Action: TReconcileAction);
    procedure actMarkCorrectExecute(Sender: TObject);
    procedure cdsNaklrtBeforeEdit(DataSet: TDataSet);
    procedure cdsNaklrtBeforeDelete(DataSet: TDataSet);
    procedure cdsNaklrtAfterDelete(DataSet: TDataSet);
    procedure frNaklrBeginDoc(Sender: TObject);
    procedure cdsNaklrID_ZAKChange(Sender: TField);
    procedure actMakeNNaklrFromNNaklrExecute(Sender: TObject);
    procedure cdsNaklrID_MANAGERChange(Sender: TField);
    procedure actPreviewOldExecute(Sender: TObject);
    procedure actPreviewCopyExecute(Sender: TObject);
    procedure actPrintCopyExecute(Sender: TObject);
    procedure actGenerateXMLExecute(Sender: TObject);

	private

		intVis : integer; //в отчёте видна ли дата
		intNpp : integer; //номер позиции по порядку
		cdIzg, cdZak : TClientDetail;
		//sState : string; //for debug changing fields in lower grid
    Semaphore : boolean;
		Rect1 : TRect;
		Rect2 : TRect;
    SettingsManager : TfmSettingsPlugin;
    SettingsVlad : TfmSettingsPlugin ;
    SettingsClient : TfmSettingsPlugin;
		procedure qurNaklrCommit;
		procedure qurNaklrtCommit; 
		procedure Order;
		procedure AutoRecalc(Price : currency);
		procedure AutoRecalcSuma2;
		procedure ProcessSettings;
    procedure CreateDocFromMem(slHead:TStringList);
    procedure CreateDetailFromMem;
    procedure PreviewNNakl( reportName :String);
    function GetIsCopyFlag:boolean;
    procedure OpenDogovorForClient;
    function GetIdDogovor(id_zak:integer): variant;
    function GetNnaklTipName(id_zak: integer): variant;
    function PrepareReport(sReportName:string):boolean;
    function HasTovarWithKVED():boolean;
	public
		{ Public declarations }
		setT : TfrmSettings;
    function DefaultOpen:boolean;
    procedure DefaultStartup;
		procedure MakeNakl (intSchet : integer);
	end;
var
  frmNNakl: TfrmNNakl;

implementation
  uses
    AtsAssert,
    SkladAux, //ProcessSettingsVladClientManager
    DesignReport, //ProcessReportDesigner
    RepNNaklXml  //TfrmRepNNaklXml
  , Naklr;
{$R *.dfm}

procedure TfrmNNakl.dbgNaklrKeyUp(Sender: TObject; var Key: Word;
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
        dsNaklr.DataSet.Delete;
        qurNaklrCommit;
      end;
    end;
    {73: begin  // if ctrl+i
      if  ([ssCtrl] = Shift ) then begin
      end; //shift
    end; //73}
  end; //case
end;

procedure TfrmNNakl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PostAndApplyOrCancel(dsNaklr.Dataset);
//  qurNaklrCommit;
  Action := caFree;
end;

procedure TfrmNNakl.actSettingsExecute(Sender: TObject);
begin
  actSettings.checked := setT.ProcessSettingsChange2(DefaultOpen);
end;

procedure TfrmNNakl.actGrid1ListShowExecute(Sender: TObject);
//var
//  strSql : string;
begin
try
  if (dbgNaklr.SelectedField.FieldName ='IZG') then begin
    Rect1:= LookupBoxEnterEh (ulbListBox1, dbgNaklr, dmdEx.dsVlad, 70);
  end; //izg
  if (dbgNaklr.SelectedField.FieldName ='ZAK') then begin
    Rect1:= LookupBoxEnterEh (ulbListBox1, dbgNaklr, dmdEx.dsClient, 70);
  end; //izg
  if (dbgNaklr.SelectedField.FieldName ='MANAGER') then begin
    Rect1:= LookupBoxEnterEh (ulbListBox1, dbgNaklr, dmdEx.dsManagerSel, 70);
  end;
  if (dbgNaklr.SelectedField.FieldName ='DOGOVOR') then begin
    OpenDogovorForClient;
    Rect1:= LookupBoxEnterEh (ulbListBox1, dbgNaklr, dsDogovorForClient, 70);
  end;
  if (dbgNaklr.SelectedField.FieldName ='TIPNAME') then begin
    Rect1:= LookupBoxEnterEh (ulbListBox1, dbgNaklr, dsTipNNakl, 70);
  end;
except
  AssertInternal('{92A5515F-FD66-4FD5-9626-B5FA7BB9A87B}');
end;
end;

procedure TfrmNNakl.dbgNaklrDblClick(Sender: TObject);
begin
  actGrid1ListShow.Execute;
end;

procedure TfrmNNakl.FormCreate(Sender: TObject);
begin
  dmdEx.StartWaiting;
  sdsNaklr.Close;
  sdsNaklrt.Close;
  dsNaklr.DataSet.Close;
  dsNaklrt.DataSet.Close;
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
  ProcessSettings;
  //Конец инициализации настроек

  dmdEx.cdsNds.Open;

  dmdEx.OpenQuery(dmdex.cdsTovarAll);
  dmdEx.OpenQuery(dmdex.cdsVlad);
  dmdEx.OpenQuery(dmdEx.cdsClient);
  dmdEx.OpenQuery(dmdEx.cdsmanager);
  dmdEx.OpenQuery(cdsTipNNakl);
  dmdEx.OpenQuery(cdsDogovor);
  qeNaklr.DefSql := sdsNaklr.CommandText;
  qeNaklrt.DefSql := sdsNaklrt.CommandText;
  qeNaklrt.SetSQL('order by','q.npp',0);
  ProcessReportDesigner(ActionList1,MainMenu1,frNaklr);
  ShowCopyForRoleOrUser(dbgNaklr,'BUXG','SYSDBA');
  //dmdEx.StopWaiting;

end;

procedure TfrmNNakl.ulbListBox1DblClick(Sender: TObject);
begin
try
  LookupBoxExitOkEh (ulbListBox1 , dbgNaklr, Rect1);
  actPostIf.Execute;
except
  AssertInternal('{4A156AE2-55AE-47BD-8813-634CA7D6A37E}');
end;
end;

procedure TfrmNNakl.ulbListBox1Exit(Sender: TObject);
begin
  LookupBoxExitCancel (ulbListBox1, dbgNaklr, Rect1);
end;

procedure TfrmNNakl.ulbListBox1KeyUp(Sender: TObject; var Key: Word;
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

procedure TfrmNNakl.qurNaklrCommit;
begin
	PostAndApply(dsNaklr.DataSet);
end;

procedure TfrmNNakl.actRefreshExecute(Sender: TObject);
begin
  dmdEx.StartWaiting;
  qeDogovor.Refresh;
  qurNaklrCommit;
  qeNaklr.Refresh;
  dmdEx.StopWaiting;
end;

procedure TfrmNNakl.FormDestroy(Sender: TObject);
begin
  dmdEx.CloseQuery(dmdEx.cdsVlad,false);
  dmdEx.CloseQuery(dmdEx.cdsClient,false);
  dmdEx.CloseQuery(dmdEx.cdsTovarAll,false);
  dmdEx.CloseQuery(dmdEx.cdsmanager,false);
  setT.Free;
end;

procedure TfrmNNakl.actGrid2ListShowExecute(Sender: TObject);
//var
//  strSql : string;
begin
try
  if (dbgNaklrt.SelectedField.FieldName ='TOVAR') then begin
    { TODO : Перебить на dmdEx.cdsTovarND }
		dmdEx.cdsTovarAll.Filter:='delmarked=0';
		dmdEx.cdsTovarAll.Filtered := true;
		//dsTemp.DataSet := dmdEx.cdsTovarAll;
		Rect2:= LookupBoxEnterEh (ulbListBox2, dbgNaklrt, dmdEx.dsTovarAll, 70);
	end; //tovar
except
	AssertInternal('{39D9364E-0AA7-4FD4-A5EB-F6A053B75627}');
end;
end;

procedure TfrmNNakl.dbgNaklrtDblClick(Sender: TObject);
begin
  actGrid2listshow.Execute;
end;

procedure TfrmNNakl.dbgNaklrtKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
try
  case key of
    vk_return : begin
      actGrid2ListShow.Execute;
    end; //vk_return
    vk_f8 : begin
      if (MessageDlg('Вы хотите удалить позицию?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
        if dsNaklrt.Dataset.State = dsInsert then begin
          dsNaklrt.Dataset.Cancel;
        end else begin
          if not (dsNaklrt.Dataset.eof and dsNaklrt.Dataset.bof) then begin
            dsNaklrt.Dataset.CheckBrowseMode;
            dsNaklrt.Dataset.Delete;
          end;//if
        end;
      end;
    end;

    {
    73: begin  // if ctrl+i
      if  ([ssCtrl] = Shift ) then begin
    end; //73
    }
  end; //case
except
  AssertInternal('4D954EFC-A951-4E72-AA76-C3A275F568DE');
end;
end;

procedure TfrmNNakl.ulbListBox2DblClick(Sender: TObject);
begin
  LookupBoxExitOkEh (ulbListBox2 , dbgNaklrt, Rect2);
  actPostIf2.Execute;
end;

procedure TfrmNNakl.ulbListBox2Exit(Sender: TObject);
begin
	dmdEx.cdsTovarAll.Filter:='';
	dmdEx.cdsTovarAll.Filtered := false;
	LookupBoxExitCancel (ulbListBox2, dbgNaklrt, Rect2);
end;

procedure TfrmNNakl.ulbListBox2KeyUp(Sender: TObject; var Key: Word;
	Shift: TShiftState);
begin
try
  case key of
    vk_return : begin
      LookupBoxExitOkEh (ulbListBox2 , dbgNaklrt, Rect2);
      actPostIf2.Execute;
    end;
    vk_escape : begin
      ulbListBox2.Hide;
    end;
  end;
except
  AssertInternal('{16A3FA30-9032-4F0F-A695-A59C7B399A9D}');
end;
end;

procedure TfrmNNakl.actPostIf2Execute(Sender: TObject);
var
  dPrice : double;
begin
try
  if (dsNaklrt.DataSet.State in [dsBrowse]) then begin
    dsNaklrt.DataSet.Edit;
  end;//if dsBrowse
  if GetPrice(
    dmdEx.cdsTemp,
    1,
    dsNaklrt.DataSet.FieldByName('id_tovar').asinteger,
    dsNaklr.DataSet.FieldByName('dat').AsDateTime,
    false,
    0,dPrice) then begin
    //такой товар был найден в прайсе
    dsNaklrt.DataSet.FieldByName('cena').asFloat:= rroundto(dPrice,-2);
  end else begin
    dsNaklrt.DataSet.FieldByName('cena').asFloat:=0;
  end;

  {
  dmdEx.cdsTemp.Close;
  dmdEx.cdsTemp.CommandText := 'select cena,cenavx,'+
    ' kod1,kod2,kod3,tara ' +
    'from tovar t where t.oid='+
    quotedstr(dsNaklrt.DataSet.FIeldbyname('id_tovar').asString);
  dmdEx.cdsTemp.Open;
  curPrice := 0;
  }


  if rdbCol0.Checked then begin
    //rPrice:= dmdEx.cdsTemp.Fieldbyname('cena').AsFloat;
    dsNaklrt.DataSet.FieldByName('kodcn').asinteger:=1;
  end;
  if rdbCol1.Checked then begin
    //rPrice:= dmdEx.cdsTemp.Fieldbyname('kod1').AsFloat;
    dsNaklrt.DataSet.FieldByName('kodcn').asinteger:=2;
  end;
  if rdbCol2.Checked then begin
    //rPrice:= dmdEx.cdsTemp.Fieldbyname('kod2').AsFloat;
    dsNaklrt.DataSet.FieldByName('kodcn').asinteger:=3;
  end;
  if rdbCol3.Checked then begin
    //rPrice:= dmdEx.cdsTemp.Fieldbyname('kod3').AsFloat;
    dsNaklrt.DataSet.FieldByName('kodcn').asinteger:=4;
  end;
  if rdbCol4.Checked then begin
    //rPrice:= dmdEx.cdsTemp.Fieldbyname('cenavx').AsFloat;
    dsNaklrt.DataSet.FieldByName('kodcn').asinteger:=5;
  end;
  //dsNaklrt.DataSet.FieldByName('tara').asInteger:=
  //  dmdEx.cdsTemp.FieldByName('tara').asInteger;
  dsNaklrt.DataSet.FieldByName('cena').AsFloat := rroundto(dPrice,-2)*
    (1-dsNaklrt.DataSet.fieldbyname('skidka').asfloat/100);
  AutoRecalc(dsNaklrt.DataSet.FieldByName('cena').AsFloat);
except
  AssertInternal('9895EBDB-C9D1-4A17-8358-48B6C0FD0600');
end;
                       {
  if (dsNaklrt.Dataset.State in [dsBrowse]) then begin
    dsNaklrt.Dataset.Edit;
  end;//if dsBrowse
  if rdbCol0.Checked then begin
    dsNaklrt.Dataset.FieldByName('kodcn').asinteger:=1;
  end;
  if rdbCol1.Checked then begin
    dsNaklrt.Dataset.FieldByName('kodcn').asinteger:=2;
  end;
  if rdbCol2.Checked then begin
    dsNaklrt.Dataset.FieldByName('kodcn').asinteger:=3;
  end;
  if rdbCol3.Checked then begin
    dsNaklrt.Dataset.FieldByName('kodcn').asinteger:=4;
  end;
  if rdbCol4.Checked then begin
    dsNaklrt.Dataset.FieldByName('kodcn').asinteger:=5;
  end;
  Semaphore :=true;
  FromCenaRecount(5,dsNaklr.DataSet,dsNaklrt.Dataset);
  semaphore := false; }
end;

procedure TfrmNNakl.rdbCol1Click(Sender: TObject);
begin
  dsNaklrt.DataSet.FieldByName('kodcn').asinteger:=2;
  dmdEx.cdsTemp.Close;
  dmdEx.cdsTemp.CommandText :='select kod1 as cena from tovar t where t.tovar='+
    dsNaklr.DataSet.fieldbyname('tovar').AsString;
  dmdEx.cdsTemp.Open;
  dsNaklrt.DataSet.FieldByName('cena').AsFloat := //rround(
  dmdEx.cdsTemp.FieldByName('cena').AsFloat;
  //,2);
  dmdEx.cdsTemp.Close;

end;

procedure TfrmNNakl.qurNaklrtCommit;
begin
  PostAndApplyOrCancel(dsNaklrt.DataSet);
end;

procedure TfrmNNakl.AutoRecalc(Price : currency);
begin
	AutoRecalc3(dsNaklr.DataSet,dsNaklrt.DataSet,Price);
end;

//////////////////////////////////////////////
//  Процедура упорядочивания
///
procedure TfrmNNakl.Order;
begin
  Order2( qeNaklrt);
end;



procedure PrintUsl (dbgNaklot: TDBGridEh;param:variant;Object1:Pointer=nil );
var
  frmNNakl : TfrmNNakl;
  bReadyToPrint : boolean;
begin
  frmNNakl := TfrmNNakl(Object1);
  bReadyToPrint := frmNNakl.PrepareReport('NNakl141122.fr3');
  if bReadyToPrint then begin
    frmNNakl.frNaklr.PrintOptions.ShowDialog :=false;
    frmNNakl.frNaklr.Print;
  end;
end;

procedure TfrmNNakl.actPrintExecute(Sender: TObject);
begin
  try
    dmdEx.StartWaiting;
    MonthToStrInit;
    dmdEx.ColumnSelectAndProcess(dbgNaklr,Null,PrintUsl,self);
  finally
    dmdEx.StopWaiting;
  end;
end;




function TfrmNNakl.PrepareReport(sReportName:string):boolean;
begin
  try
    dsNaklr.DataSet.DisableControls;
    Result := true;
    actCalculateSum.Execute;
    MonthToStrInit;
    dmdEx.GetReport(sReportName,frNaklr);
    frNaklr.PrepareReport;
  finally
    dsNaklr.DataSet.EnableControls;
  end;
end;

procedure TfrmNNakl.actSchetExecute(Sender: TObject);
var
  frmNaklrList : TfrmNaklrList;
  intTemp : integer;
begin
  frmNaklrList := TfrmNaklrList.Create(self);
  frmNaklrList.DefaultStartup;
  intTemp := frmNaklrList.GetSchet;
  frmNaklrList.Free;
  if (intTemp <>0) then begin
    //запрещение отображения данных и редактирования
    dsNaklrt.DataSet.DisableControls;
    dsNaklr.DataSet.DisableControls;
    //отключить кнопки, чтобы
    //во время обрабоки польз случайно их не нажал
    actPreview.Enabled := false;
    actPrint.Enabled := false;
    //заполнение данными
    MakeNakl(intTemp);
    //включение кнопок
    actPreview.Enabled := true;
    actPrint.Enabled := true;
    //разрешение отображения данных и редактирования
    dsNaklr.DataSet.EnableControls;
    dsNaklrt.DataSet.EnableControls;
    actCalculateSum.Execute;
    qurNaklrtCommit;
    qurNaklrCommit;
  end; //if
end;

///////////////////////////////////////////////////
///  create nakl from schet. intSchet = schet.schet
///
procedure TfrmNNakl.MakeNakl(intSchet: integer);
var
  slHead: TStringList;
  procedure ClearMemTableEh(mtePriceDetGen:TMemTableEh);
  begin
    if mtePriceDetGen.Active then begin
    mtePriceDetGen.EmptyTable;
    mtePriceDetGen.Close;
    end else begin
      mtePriceDetGen.CreateDataSet;
    end;
    mtePriceDetGen.Open;
  end;
begin
  slHead := nil;
  try
    slHead := TStringList.Create;
  try
    dmdEx.StartWaiting;
    //предотвращает ошибку, когда новая накладная прячется под фильтр
    //а её позиции попадают в чужую
    dsNaklr.DataSet.Filtered := false;
    dmdEx.cdsTemp.Close;
    dmdEx.cdsTemp.CommandText := 'select n.dat,n.id_izg,n.id_zak,n.id_manager,n.kurs,n.nds,n.nalog_nds '+
      'from naklo n where n.id_nakl ='+ inttostr (intSchet);
    dmdEx.cdsTemp.Open;


    slHead.Add('id_izg='+dmdEx.cdsTemp.FieldByName ('id_izg').Asstring);
    slHead.Add('id_zak='+dmdEx.cdsTemp.FieldByName ('id_zak').Asstring);
    slHead.Add('id_manager='+dmdEx.cdsTemp.FieldByName('id_manager').asstring);
    slHead.Add('kurs='+dmdEx.cdsTemp.FieldByName('kurs').Asstring);
    slHead.Add('vsego='+floattostr(RRoundTo(
      dmdEx.cdsTemp.FieldByName('nds').AsFloat/
      (1+dmdEx.cdsTemp.FieldByName('nalog_nds').AsFloat),
      -2)));
    slHead.Add('nds='+dmdEx.cdsTemp.FieldByName('nds').Asstring);
    slHead.Add('nalog_nds='+dmdEx.cdsTemp.FieldByName('nalog_nds').Asstring);
    slHead.Add('nakl='+inttostr(intSchet));
    dmdEx.cdsTemp.close;

    ClearMemTableEh(mtePriceDetGen);


    dmdEx.cdsTemp.Close;
    dmdEx.cdsTemp.CommandText := 'select id_nakld, id_pos as npp, kodcn,'+
      ' id_tovar, skidka, Round(cena,2) as cena, kolotp, '+
      '(select tara from TOVAR_ALL_VW t2 where t2.id=ot.id_tovar) as tara from naklot ot where' +
      ' ot.id_nakl='+inttostr (intSchet)+' order by id_pos';
    dmdEx.cdsTemp.Open;
    //Semaphore := true;
    CopyDatasetFields(
      dmdEx.dsTemp.Dataset,
      dsPriceDetGen.DataSet,
      'npp;kolotp;tara;id_tovar;cena;kodcn;skidka',
      'npp;kolotp;tara;id_tovar;cena;kodcn;skidka',
      '','',3);
    //Semaphore := false;
    dmdEx.cdsTemp.close;
    CreateDocFromMem(slHead);

  except
    AssertInternal('07EA883A-99C9-4C02-910E-A17F0A3EB013');
  end;
  finally
    slHead.Free;
  end;
end;

procedure TfrmNNakl.actRecalcExecute(Sender: TObject);
begin
  Order;
  actCalculateSum.Execute;
end;

procedure TfrmNNakl.FormDeactivate(Sender: TObject);
begin
  PostAndApplyOrCancel(dsNaklr.Dataset);
//  qurNaklrCommit;
end;


procedure TfrmNNakl.actCalculateSumExecute(Sender: TObject);
begin
  CalculateSum(dsNaklr.DataSet,dsNaklrt.DataSet );
end;


procedure TfrmNNakl.frNaklrGetValue(const ParName: String;
  var ParValue: Variant);
begin
  if AnsiUpperCase(ParName)='SUMA2GRN' then begin
    ParValue := Suma2Grn(dsNaklr.DataSet,dsNaklrt.DataSet);
  end; //if parname
  if AnsiUpperCase(ParName)='Z_IPN' then begin
    if (cdZAK.lgoty =KlientTipNeplNds) then begin
      ParValue := '100000000000';
    end else if (cdZAK.lgoty = KlientTipExport) then begin
      ParValue := '300000000000';
    end else begin
      ParValue := cdZAK.ipn;
    end;
  end; //if parname
  if AnsiUpperCase(ParName)='Z_ADRP' then begin
      ParValue := cdZAK.adrp;
  end; //if parname
  if AnsiUpperCase(ParName)='Z_TEL' then begin
      ParValue := cdZAK.tel;
  end; //if parname
  if AnsiUpperCase(ParName)='Z_SVREG' then begin
      ParValue := cdZAK.svreg;
  end; //if parname
  if AnsiUpperCase(ParName)='Z_FULLNAME' then begin
    if (cdZAK.lgoty <>KlientTipNeplNds) then begin
      ParValue := cdZAK.fullname;
    end else begin
      ParValue := '«Неплатник»';
    end;
  end; //if parname

  if AnsiUpperCase(ParName)='TIP_DOGOVORA' then begin
      ParValue := dsNaklr.DataSet.FieldByName('TIP_DOGOVORA').asString;
  end;
  if AnsiUpperCase(ParName)='DOGOVOR_DAT' then begin
      ParValue := dsNaklr.DataSet.FieldByName('DOGOVOR_DAT').AsDateTime;
  end;
  if AnsiUpperCase(ParName)='DOGOVOR' then begin
      ParValue := dsNaklr.DataSet.FieldByName('DOGOVOR').AsString;
  end;



  if AnsiUpperCase(ParName)='I_IPN' then begin
    if (cdIZG.lgoty <>KlientTipNeplNds) and (cdIZG.lgoty <> KlientTipExport) then begin
      ParValue := cdIZG.ipn;
    end else begin
      ParValue := '0';
    end;
  end; //if parname
  if AnsiUpperCase(ParName)='I_ADRP' then begin
    ParValue := cdIZG.adrp;
  end; //if parname
  if AnsiUpperCase(ParName)='I_TEL' then begin
    ParValue := cdIZG.tel;
  end; //if parname
  if AnsiUpperCase(ParName)='I_SVREG' then begin
    if (cdIZG.lgoty <>KlientTipNeplNds) and (cdIZG.lgoty <> 1) then begin
      ParValue := cdIZG.svreg;
    end else begin
      ParValue := '0';
    end;
  end; //if parname
  if AnsiUpperCase(ParName)='I_FULLNAME' then begin
    ParValue := cdIZG.fullname;
  end; //if parname
  if AnsiUpperCase(ParName)='IS_COPY' then begin
    ParValue := GetIsCopyFlag;
  end; //if parname
  if AnsiUpperCase(ParName)='ORIGINAL_VYDAETSYA_POLUPATELYU' then begin
    if (not GetIsCopyFlag)
      and (cdZAK.lgoty <>KlientTipNeplNds)
      and (cdZAK.lgoty <> KlientTipExport)
    then begin
      ParValue := 'X';
    end else begin
      ParValue := ' ';
    end;
  end; //if parname
  if AnsiUpperCase(ParName)='ORIGINAL_OSTAYETSYA_U_PRODAVTSA' then begin
    if (not GetIsCopyFlag and
      ((cdZAK.lgoty = KlientTipNeplNds) or (cdZAK.lgoty = KlientTipExport)))
    then begin
      ParValue := 'X';
    end else begin
      ParValue := ' ';
    end;
  end;  //if parname
  if AnsiUpperCase(ParName)='ORIGINAL_OSTAYETSYA_U_PRODAVTSA_TIP_PRICHINY' then begin
    ParValue := '';
    if not GetIsCopyFlag then begin
      if trim(cdsNaklr.fieldByName('tip_code').AsString)<>'00' then begin
        ParValue := trim(cdsNaklr.fieldByName('tip_code').AsString);
      end;
    end;
  end;  //if parname
  if AnsiUpperCase(ParName)='VKLUCHENO_V_EDINIY_REESTR_PN' then begin
    ParValue := '';
    if AnsiUpperCase(cdsNaklr.FieldByName('tipname').AsString) = AnsiUpperCase('Налоговая') then begin
      if cdsNaklr.FieldByName('nds').AsFloat >= 60000 then begin
        ParValue := 'X';
      end else if hasTovarWithKVED then begin
        ParValue := 'X';
      end;
    end;
  end;
end;

function TfrmNNakl.HasTovarWithKVED():boolean;
begin
  Result := false;
  with dsNaklrt.DataSet do begin
    First;
    while not Eof do begin
      if FieldByName('KODVED').AsCurrency>0 then begin
        Result := true;
        First;
        exit;
      end;
      next;
    end;
  end;
end;

function TfrmNNakl.GetIsCopyFlag:boolean;
begin
  Result := false;
  if actPreviewCopy.Checked then begin
    Result := true;
  end;
end;

procedure TfrmNNakl.cdsNaklrtAfterInsert(DataSet: TDataSet);
begin
  dsNaklrt.DataSet.FieldByName('sch').asInteger :=
    dmdEx.GetGenValue('naklrast_gen');
  intNpp := intNpp +1;
  dsNaklrt.DataSet.FieldByName('npp').asinteger:= intNpp;
//  dsNaklrt.DataSet.FieldByName('ediz').asstring:='км';
  dsNaklrt.DataSet.FieldByName('kolotp').asinteger:=0;
  dsNaklrt.DataSet.FieldByName('schet').asInteger :=
    dsNaklr.DataSet.FieldByName('schet').asInteger;
  dsNaklrt.DataSet.FieldByName('kolotp').asFloat := 0;
  dsNaklrt.DataSet.FieldByName('id_tovar').asInteger := 0;
end;

procedure TfrmNNakl.cdsNaklrtBeforeInsert(DataSet: TDataSet);
begin
	if PostAndApply(cdsNaklr)<>0 then begin
		abort;
	end;
  DataSet.Last;
  try
    intNpp:=DataSet.fieldbyname('npp').asInteger;
  except
    intNpp:=0;
	end;
end;


procedure TfrmNNakl.cdsNaklrtBeforeScroll(DataSet: TDataSet);
begin
	ApplyOrCancel (DataSet);
end;

procedure TfrmNNakl.cdsNaklrBeforePost(DataSet: TDataSet);
begin
  if dsNaklr.DataSet.FieldByName('dat').isNull then begin
    showmessage ('Введите дату');
    abort;
  end;
  dsNaklr.DataSet.FieldByName('kurs').AsFloat :=
		rroundto( dsNaklr.DataSet.FieldByName('kurs').AsFloat,-4);
  dsNaklr.DataSet.FieldByName('nds').AsFloat :=
    rroundto( dsNaklr.DataSet.FIeldbyname('nds').AsFloat,-2);
end;

procedure TfrmNNakl.cdsNaklrBeforeScroll(DataSet: TDataSet);
begin
	ApplyOrCancel(DataSet);
//  qurNaklrCommit;
end;

procedure TfrmNNakl.cdsNaklrBeforeDelete(DataSet: TDataSet);
begin
  dsNaklrt.DataSet.first;
  while (not dsNaklrt.DataSet.Eof) do begin
    dsNaklrt.DataSet.Delete;
  end;
end;

procedure TfrmNNakl.cdsNaklrAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('schet').AsInteger:=dmdEx.GetGenValue('naklras_gen');
  DataSet.FieldByName('id2').AsInteger:=dmdEx.GetGenValue('naklras_id_gen');
  DataSet.FieldByName('dat').AsDateTime := Date; //default date. time=0
  DataSet.FieldByName('nalog_nds').AsFloat := dmdEx.GetNds ( Date );
  DataSet.FieldByName('kurs').asFloat := 1.0000;
  DataSet.FieldByName('usl').asString :='купля-продажа';
  DataSet.FieldByName('vidopl').asString := 'оплата з поточного рахунку';
  DataSet.FieldByName('id_zak').asInteger := 0;
  DataSet.FieldByName('id_izg').asInteger := 0;
  DataSet.FieldByName('id_manager').asInteger := dmdEx.GetIdManager;
  SetManager(TIntegerField(DataSet.FieldByName('id_manager')),SettingsManager);
end;

procedure TfrmNNakl.ProcessSettings;
begin
try
  ProcessSettingsVladClientManager(qeNaklr,setT);
  self.Caption := UpdateCaptionVladClientManager('Налоговые накладные:',setT);
except
  AssertInternal('28ACFA9E-605D-4C4F-81BB-B8DB8088F4EF');
end;
end;

procedure TfrmNNakl.cdsNaklrtNDSChange(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    dbgNaklrt.DataSource.dataset.FieldByName('cena').AsFloat:=
      rroundto(
      dsNaklrt.DataSet.FieldByName('nds').AsFloat /
      (1+dsNaklr.DataSet.FieldByName('nalog_nds').AsFloat),-2);
    AutoRecalc (dsNaklrt.dataset.FieldByName('cena').AsFloat);
    Semaphore := false;
  end;
  {
  if  sState ='nds_enter' then begin
    sState := 'nds_changed';
try
      dsNaklrt.DataSet.FieldByName('skidka').AsString:='';
except
  AssertInternal('1676D0B9-C2D8-4C1D-923A-1A364D0DF378');
end;
try
      dbgNaklrt.DataSource.dataset.FieldByName('cena').AsFloat:=
         rroundto(
          dsNaklrt.DataSet.FieldByName('nds').AsFloat /
          (1+dsNaklr.DataSet.FieldByName('nalog_nds').AsFloat),-2);
except
  AssertInternal('7E2A4755-AEB7-43E6-B6D2-F254BFF13DBD');
end;
try
      AutoRecalc (dsNaklrt.dataset.FieldByName('cena').AsFloat);
except
  AssertInternal('F183D049-F84F-4810-ADB7-02BA8877FB12');
end;
  end;
  }
end;


procedure TfrmNNakl.cdsNaklrtCENAChange(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    dsNaklrt.DataSet.FieldByName('skidka').AsString:='';
    AutoRecalc (dsNaklrt.dataset.FieldByName('cena').AsFloat);
    Semaphore := false;
  end;
end;

procedure TfrmNNakl.cdsNaklrtKOLOTPChange(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    AutoRecalc (dsNaklrt.DataSet.FieldByName('cena').AsFloat);
    Semaphore := false;
  end;
{
  if  sState ='kolotp_enter' then begin
    AutoRecalc (dsNaklrt.DataSet.FieldByName('cena').AsFloat);
  end;  }
end;

procedure TfrmNNakl.cdsNaklrtVSEGOChange(Sender: TField);
var
  curPrice : currency;
begin
  if not Semaphore then begin
    Semaphore := true;
    dsNaklrt.DataSet.FieldByName('skidka').AsString:='';
    curPrice :=
      rroundto (dsNaklrt.DataSet.FieldByName('vsego').AsFloat /
      (1+dsNaklr.DataSet.FieldByName('nalog_nds').AsFloat),-2);
     dsNaklrt.DataSet.FieldByName('suma2').AsFloat := curPrice;
    AutoRecalcSuma2;
    Semaphore := false;
  end;
{  if  sState ='vsego_enter' then begin
    dsNaklrt.DataSet.FieldByName('skidka').AsString:='';
    curPrice :=
      rroundto (dsNaklrt.DataSet.FieldByName('vsego').AsFloat /
      (1+dsNaklr.DataSet.FieldByName('nalog_nds').AsFloat),-2);
     dsNaklrt.DataSet.FieldByName('suma2').AsFloat := curPrice;
    AutoRecalcSuma2;
  end;}
end;

procedure TfrmNNakl.cdsNaklrtSUMA2Change(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    AutoRecalcSuma2;
    Semaphore := false;
  end;
  {
  if  sState ='suma2_enter' then begin
    AutoRecalcSuma2;
  end;
  }
end;

procedure TfrmNNakl.cdsNaklrtSKIDKAChange(Sender: TField);
var
  curPrice : Currency;
  dPrice : double;
begin
  if not Semaphore then begin
    Semaphore := true;
    if GetPrice(dmdEx.cdsTemp,1,
      dsNaklrt.DataSet.FieldByName('id_tovar').asinteger,Now,false,
      0,dPrice) then begin
      //такой товар был найден в прайсе
      curPrice := rroundto(rroundto(dPrice,-2)
          *(1-dsNaklrt.DataSet.fieldbyname('skidka').asfloat/100),-2);
    end else begin
      curPrice :=0;
    end;
    dsNaklrt.DataSet.FieldByName('cena').AsFloat := curPrice;
    AutoRecalc(curPrice);
    Semaphore := false;
  end;
end;

procedure TfrmNNakl.cdsNaklrtTOVARChange(Sender: TField);
begin
  {if sState ='tovar_enter' then begin
    sState := 'tovar_changed';
  end;}
end;

procedure TfrmNNakl.AutoRecalcSuma2;
var
	curPrice :Currency;
begin
 	//dsNaklrt.DataSet.CheckBrowseMode;
	//dsNaklrt.DataSet.Edit;
	dsNaklrt.DataSet.FieldByName('skidka').AsString:='';
	curPrice :=
		 rroundto(dsNaklrt.DataSet.FieldByName('SUMA2').AsFloat *
		 (1+dsNaklr.DataSet.FieldByName('nalog_nds').AsFloat),-2);
	if  rroundto(dsNaklrt.DataSet.FieldByName('VSEGO').AsFloat-curPrice,-2)<>0 then begin
		dsNaklrt.DataSet.FieldByName('VSEGO').AsFloat := curPrice;
	end;
	if (dsNaklrt.DataSet.FieldByName('kolotp').AsFloat<>0) then begin
		curPrice :=
			 rroundto (dsNaklrt.DataSet.FieldByName('suma2').AsFloat /
				 dsNaklrt.DataSet.FieldByName('kolotp').AsFloat,-2);
			 dsNaklrt.DataSet.FieldByName('cena').AsFloat := curPrice;
			 AutoRecalc (curPrice);
	end else begin //'kolotp').AsFloat<>0
		dsNaklrt.DataSet.FieldByName('cena').AsString := '';
		dsNaklrt.DataSet.FieldByName('nds').AsString := '';
//    dsNaklrt.DataSet.Post;
	end;//'kolotp').AsFloat<>0
end;

procedure TfrmNNakl.dbgNaklrEnter(Sender: TObject);
begin
	PostAndApply(dsNaklrt.Dataset);
end;

procedure TfrmNNakl.dbgNaklrtEnter(Sender: TObject);
begin
  PostAndApply(dsNaklr.Dataset);
end;

procedure TfrmNNakl.actPostIfExecute(Sender: TObject);
begin
  dsNaklr.Dataset.Post;
end;

procedure TfrmNNakl.dbgNaklrtKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_escape : begin
       dsNaklrt.DataSet.Cancel;
    end;
  end;
end;

procedure TfrmNNakl.cdsNaklrtReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
	showmessage(e.message);
	Action := raAbort;
//	Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TfrmNNakl.cdsNaklrReconcileError(DataSet: TCustomClientDataSet;
	E: EReconcileError; UpdateKind: TUpdateKind;
	var Action: TReconcileAction);
begin
	showmessage(e.message);
	Action := raAbort;
end;

procedure TfrmNNakl.actMarkCorrectExecute(Sender: TObject);
var
  iIdCorr, iIdNNakl : integer;
begin
try
  iIdCorr := cdsTipNNakl.Lookup('name','КОРРЕКТИРОВКА','oid');
	if  cdsNaklr.FieldByName('tip').asInteger=iIdCorr then begin
		//корректировка
		if (MessageDlg('Вы хотите снять пометку о корректировке?',
			mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
			if (cdsNaklr.State in [dsBrowse]) then begin
				cdsNaklr.Edit;
			end;
      iIdNNakl := cdsTipNNakl.Lookup('name','НАЛОГОВАЯ','oid');
			cdsNaklr.FieldByName('tip').asInteger:=iIdNNakl;
			cdsNaklr.Post;
			ApplyOrCancel(cdsNaklr);
		end;
	end else begin
		//накладная налоговая
		if (MessageDlg('Вы хотите пометить данную накладную как корректировку?',
			mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
			if (cdsNaklr.State in [dsBrowse]) then begin
				cdsNaklr.Edit;
			end;
			cdsNaklr.FieldByName('tip').asInteger:=iIdCorr;
			cdsNaklr.Post;
			ApplyOrCancel(cdsNaklr);
		end;
	end;
except
  AssertInternal('4FDB861F-2338-48CC-8F60-6337146D8D73');
end;
end;

procedure TfrmNNakl.cdsNaklrtBeforeEdit(DataSet: TDataSet);
begin
	if PostAndApply(cdsNaklr)<>0 then begin
		abort;
	end;
end;

procedure TfrmNNakl.cdsNaklrtBeforeDelete(DataSet: TDataSet);
begin
	if PostAndApply(cdsNaklr)<>0 then begin
		abort;
	end;
end;

procedure TfrmNNakl.cdsNaklrtAfterDelete(DataSet: TDataSet);
begin
	ApplyOrCancel(DataSet);
end;

function TfrmNNakl.DefaultOpen:boolean;
begin
  ProcessSettings;
  Result:=DefaultOpenInputForm(qeNaklr);
end;

procedure TfrmNNakl.DefaultStartup;
begin
  SettingsManager.SetKeyValue(dmdEx.GetIdManager);
  ProcessSettings;
end;

procedure TfrmNNakl.frNaklrBeginDoc(Sender: TObject);
begin
  cdIzg :=  dmdEx.GetClientDetail(cdsNaklr.FieldByName('id_izg').asInteger);
  cdZak :=  dmdEx.GetClientDetail(cdsNaklr.FieldByName('id_zak').asInteger);

  //!!! HACK. Легче дальше строить условия, если не проверять и тип накладной
  //и тип клиента. Так мы в тип клиента записали уже и тип накладной.
  if cdsNaklr.FieldByName('tipname').AsString = 'Экспорт' then begin
    cdZak.lgoty := KlientTipExport;
  end;

  intVis := 1;
end;

function TfrmNNakl.GetIdDogovor(id_zak: integer): variant;
var
  iIdDogovor : integer;
begin
  with dmdEx.cdsTemp do begin
    try
      Close;
      CommandText:=
        'select id_dogovor from dogovor_vw d where d.id_klient='
          +inttostr(id_zak)
          +' and d.delmarked=0 order by is_default desc';
      open;
      if RecordCount>0 then begin
        iIdDogovor := FieldByName('id_dogovor').asInteger;
        result := iIdDogovor;
      end else begin
        result := Null;
      end;
    finally
        close;
    end; //try
  end;  //with dmdEx.cdsTemp
end;

function TfrmNNakl.GetNnaklTipName(id_zak: integer): variant;
begin
  with dmdEx.cdsTemp do begin
    try
      Close;
      CommandText:=
        'select lgoty from klient k where k.id='
          +inttostr(id_zak)
          +' and k.delmarked=0';
      open;
      if RecordCount>0 then begin
        result := Null;
        if FieldByName('lgoty').asInteger = KlientTipExport then begin
          result := cdsTipNNakl.Lookup('name','НАЛОГОВАЯ ЭКСПОРТНАЯ','oid');
        end;
        if FieldByName('lgoty').asInteger = KlientTipNeplNds then begin
          result := cdsTipNNakl.Lookup('name','ПОСТАВКА НЕПЛАТЕЛЬЩИКУ НДС','oid');
        end;
      end else begin
        result := Null;
      end;
    finally
        close;
    end; //try
  end;  //with dmdEx.cdsTemp
end;

//Заполнить поле условия последним договором и поле тип накладной в соотв с типом клиент
procedure TfrmNNakl.cdsNaklrID_ZAKChange(Sender: TField);
var
  iZak : integer;
  NnaklTip : variant;
begin
try
  if ((not Sender.DataSet.FieldByName('id_zak').IsNull)
    and  (Sender.DataSet.FieldByName('id_zak').AsInteger<>0))
  then begin
    iZak :=Sender.DataSet.FieldByName('id_zak').asInteger;
    Sender.DataSet.FieldByName('id_dogovor').AsVariant := GetIdDogovor(iZak);

    NnaklTip := GetNnaklTipName(iZak);
    if NnaklTip<> Null then begin
      Sender.DataSet.FieldByName('tip').AsVariant := NnaklTip;
    end;

  end;   //if not null
except
  AssertInternal('1DC19921-4A83-47D7-9CFE-65F131D31392');
end
end;


procedure TfrmNNakl.CreateDetailFromMem;
begin
  //dsPriceDetGen.DataSet.Tag := 1;
  Semaphore :=true;
  dsPriceDetGen.DataSet.First;
  CopyDatasetFields(
    dsPriceDetGen.DataSet,
    dsNaklrt.DataSet,
    'npp;kolotp;tara;id_tovar;cena;kodcn;skidka',
    'npp;kolotp;tara;id_tovar;cena;kodcn;skidka',
    '','',3);
  Semaphore :=false;
  //dsNaklrt.DataSet.Tag := 0;
  ApplyOrCancel(dsNaklrt.DataSet);
end;

procedure TfrmNNakl.CreateDocFromMem(slHead:TStringList);
begin
try
  dmdEx.StartWaiting;
  dsNaklr.DataSet.Tag := 1;
  dsNaklr.DataSet.Append;
  dsNaklr.DataSet.FieldByName('id_izg').AsInteger :=
    strtoint(slHead.Values['id_izg']);
  dsNaklr.DataSet.FieldByName('id_zak').AsInteger :=
    strtoint(slHead.Values['id_zak']);
  dsNaklr.DataSet.FieldByName('kurs').AsFloat :=
    strtofloat(slHead.Values['kurs']);
  dsNaklr.DataSet.FieldByName('vsego').AsFloat :=
    strtofloat(slHead.Values['vsego']);
  dsNaklr.DataSet.FieldByName('nds').AsFloat :=
    strtofloat(slHead.Values['nds']);
  dsNaklr.DataSet.FieldByName('nalog_nds').AsFloat :=
    strtofloat(slHead.Values['nalog_nds']);
  dsNaklr.DataSet.FieldByName('id_manager').asInteger:=
    strtoint(slHead.Values['id_manager']);
  dsNaklr.DataSet.FieldByName('nakl').asInteger :=
    strtoint(slHead.Values['nakl']);
  dsNaklr.DataSet.Post;
  dsNaklr.DataSet.Tag := 0;
  dmdEx.StopWaiting;
  ApplyOrCancel(dsNaklr.DataSet);
  //detail create
  dmdEx.StartWaiting;
  CreateDetailFromMem;
  dmdEx.StopWaiting;
except
  AssertInternal('75C93372-AE12-4AC7-AD8F-F95EF2B85B21');
end;
end;

procedure TfrmNNakl.actMakeNNaklrFromNNaklrExecute(Sender: TObject);
var
  slHead: TStringList;
begin
slHead := nil;

try
  try
    with dsNaklr.DataSet do begin
    if (Eof and Bof) then begin
      Showmessage('Не выбран документ');
      exit;
    end;
    dmdEx.StartWaiting;
    DisableControls;
    slHead := TStringList.Create;
    slHead.Add('id_izg='+FieldByName('id_izg').asString);
    slHead.Add('id_zak='+FieldByName('id_zak').asString);
    slHead.Add('id_manager='+FieldByName('id_manager').asString);
    slHead.Add('dat='+FieldByName('dat').asString);

    Tag := 1;
    Insert;
    FieldByName('id_izg').asInteger := strtoint(slHead.Values['id_izg']);
    FieldByName('id_zak').asInteger := strtoint(slHead.Values['id_zak']);
    FieldByName('id_manager').asInteger := strtoint(slHead.Values['id_manager']);
    FieldByName('dat').asDateTime := strtodate(slHead.Values['dat']);
    Post;
    Tag := 0;
    EnableControls;

    end;
  except
    AssertInternal('48D9AE03-13C3-49EB-B35F-33792F3C27EB');
  end;
finally
  slHead.Free;
  dmdEx.StopWaiting;
end;
end;

//Заполнить поле подпись подписью менеджера
procedure TfrmNNakl.cdsNaklrID_MANAGERChange(Sender: TField);
begin
  Sender.DataSet.FieldByName('signature').AsString :=
    VarToStr(dmdEx.cdsManager.Lookup('id',Sender.NewValue,'signature'));
end;

procedure TfrmNNakl.actPreviewOldExecute(Sender: TObject);
begin
  PreviewNNakl('NNakl140114.fr3');
end;

procedure TfrmNNakl.PreviewNNakl( reportName :String);
begin
  try
    dmdEx.StartWaiting;
    dsNaklr.DataSet.DisableControls;
    dsNaklrt.DataSet.DisableControls;
    actCalculateSum.Execute;
    MonthToStrInit;
    dmdEx.GetReport(reportName,frNaklr);
    frNaklr.PrepareReport;
    frNaklr.ShowReport;
  finally
    dsNaklrt.DataSet.EnableControls;
    dsNaklr.DataSet.EnableControls;
    dmdEx.StopWaiting;
  end;
end;

procedure TfrmNNakl.actPreviewCopyExecute(Sender: TObject);
begin
  try
    actPreviewCopy.Checked := true;
    PreviewNNakl('NNakl141122.fr3');
  finally
    actPreviewCopy.Checked := false;
  end;
end;

procedure TfrmNNakl.actPreviewExecute(Sender: TObject);
begin
  PreviewNNakl('NNakl141122.fr3');
end;

procedure TfrmNNakl.OpenDogovorForClient;
begin
  cdsDogovorForClient.Close;
  cdsDogovorForClient.Params.ParamByName('id_klient').asInteger:=
    cdsNaklr.FieldByName('id_zak').AsInteger;
  dmdEx.OpenQuery(cdsDogovorForClient);
end;

procedure TfrmNNakl.actPrintCopyExecute(Sender: TObject);
begin
  try
    dmdEx.StartWaiting;
    actPreviewCopy.Checked := true;
    MonthToStrInit;
    dmdEx.ColumnSelectAndProcess(dbgNaklr,Null,PrintUsl,self);
  finally
    actPreviewCopy.Checked := false;
    dmdEx.StopWaiting;
  end;
end;



procedure TfrmNNakl.actGenerateXMLExecute(Sender: TObject);
var
  frmRepNNaklXml : TfrmRepNnaklXml;
begin
  frmRepNNaklXml := TfrmRepNnaklXml.Create(self);
  frmRepNNaklXml.GenerateXML(cdsNaklr.FieldByName('schet').AsInteger);
  frmRepNNaklXml.free;
end;

end.

