unit RepReestrVydanNnakl;

interface

uses
  Windows, Messages, SysUtils,
  Variants, Classes,
  Graphics, Controls, Forms,
  Dialogs,
  FMTBcd, DBClient, Provider, SqlExpr, DBGridEh, QueryExtender, DB,
     ActnList, StdCtrls, Buttons, GridsEh,
  frxClass, frxDBSet, 
    Menus,
  DBTables, Grids,
  DBGrids,
  ComCtrls,
  untEx, DateUtils,
  ATSAssert,
  untSkladRasxDetEx,
	DBCtrls,
  SettingsPlugin, //TfmSettingPlugin
  untSettings, xmldom,
  XMLIntf, msxmldom, XMLDoc,
  J1201506, //J1201506 IXMLDeclarContent
  XmlHelper, //WriteNode
  RepReestrPolychNNakl //TfrmRepReestrPolychNNakl

  ;

type

  TfrmRepReestrVydanNnakl = class(TForm)
    dsRasx: TDataSource;
    ActionList1: TActionList;
    frdRasx: TfrxDBDataset;
    dbgRep: TDBGridEh;
    sdsRasx: TSQLDataSet;
    dspRasx: TDataSetProvider;
    cdsRasx: TClientDataSet;
    BitBtn5: TBitBtn;
    actSettings: TAction;
    qeRasx: TQueryExtender;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem3: TMenuItem;
    Button1: TButton;
    XMLDocument1: TXMLDocument;
    frdNNaklp: TfrxDBDataset;
    BitBtn1: TBitBtn;
    Button2: TButton;
    actGenerateXml: TAction;
    actRefresh: TAction;
    cdsRasxF1_NPP: TIntegerField;
    cdsRasxF2_DAT: TSQLTimeStampField;
    cdsRasxF3_ID: TStringField;
    cdsRasxF4_VIDDOC: TStringField;
    cdsRasxF5_ZAK: TStringField;
    cdsRasxF6_IPN: TStringField;
    cdsRasxF7_SUMWITHNDS: TFMTBCDField;
    cdsRasxF8_BAZANDS: TFMTBCDField;
    cdsRasxF9_NDS: TFMTBCDField;
    cdsRasxF12_BAZANDSEXPORT: TFMTBCDField;
    cdsRasxTIP: TIntegerField;
    frxNNaklp: TfrxReport;
    SaveDialog: TSaveDialog;
    cdsRasxF11_BEZOBLOGENIYA: TFMTBCDField;
    frRasx: TfrxReport;
    cdsRasxF42_VIDDOC: TStringField;
    cdsRasxF43_VIDDOC: TStringField;
    cdsRasxF10: TFMTBCDField;
    cdsRasxF13: TFMTBCDField;
    procedure FormCreate(Sender: TObject);
		procedure FormClose(Sender: TObject; var Action: TCloseAction);
		procedure actSettingsExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure actGenerateXmlExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
  private
    { Private declarations }
    FiidTipNNakl : integer;
		setT : TfrmSettings;
    SettingsVlad : TfmSettingsPlugin;
    SettingsTipDetail : TfmSettingsPlugin;
    FGetOKPOsOKPO : string;
    frmNnaklpReestr : TfrmRepReestrPolychNNakl;
    procedure ProcessSettings;
    procedure FillHeadXml(XMLDeclarContent:IXMLDeclarContent);
    procedure FillNNaklrFooter(XMLDeclarContent: IXMLDeclarContent;
      dbgRep: TDBGridEh;FormatSettings:TFormatSettings);
    procedure TestGetStringListFromSqlRecord;
    function GetXmlFileName:string;
    function GetOblastKod :integer;
    function GetRajonKod: integer;
    function GetOKPO : string;
    function GetNumDocZaPeriod: integer;
    procedure CleanUpXml(var XMLDocument1 : TXMLDocument);
    procedure FillNNaklr(XMLDeclarContent: IXMLDeclarContent;
      cdsRasx :TDataSet);
    procedure CreateXMLFile;
    procedure InitNaklpReestr;
    procedure FillXMLContent(XMLDeclarContent: IXMLDeclarContent);
    function GetXMLDocument: TXMLDocument;
	public
    procedure Test;
    procedure TestCreateThreeDaysFile;
    function Defaultopen: boolean;
		{ Public declarations }
	end;
var
	frmRepReestrVydanNnakl: TfrmRepReestrVydanNnakl;

implementation


{$R *.dfm}
uses
  DesignReport, //ProcessReportDesigner
  untRound, //ColumnByName
  StrUtils //AnsiReplaceStr

  ;

procedure TfrmRepReestrVydanNnakl.FormClose(Sender: TObject;
	var Action: TCloseAction);
begin
	Action := caFree;
end;



procedure TfrmRepReestrVydanNnakl.FormCreate(Sender: TObject);
begin
	setT := TfrmSettings.Create(Self);
	setT.actManagerOff.Execute;
  //предыдущий месяц
  setT.SetPeriod(7);
  SettingsVlad := setT.CreatePlugin('TfmSettingsVlad');
  setT.addplugin(SettingsVlad);
  SettingsVlad.setresulttype(1);
  SettingsVlad.SetKeyValue(dmdEx.GetDefaultVlad);
  qeRasx.DefSql := sdsRasx.CommandText;
  SettingsTipDetail := setT.CreatePlugin('TfmSettingsTipDetail');
  setT.AddPlugin(SettingsTipDetail);
  SettingsTipDetail.AddDetailTip('Все налоговые');
  SettingsTipDetail.AddDetailTip('Только корректировки');
  SettingsTipDetail.AddDetailTip('Только налоговые');
  SettingsTipDetail.SetKeyValue(0);

  FiidTipNNakl:=dmdEx.GetOidObjects('ТИП НАЛОГОВЫХ НАКЛАДНЫХ',-100);
  FiidTipNNakl :=  dmdEx.GetOidObjects('НАЛОГОВАЯ',FiidTipNNakl);
  ProcessReportDesigner(ActionList1,MainMenu1,frRasx);

end;


procedure TfrmRepReestrVydanNnakl.actSettingsExecute(Sender: TObject);
begin
  actSettings.checked := setT.ProcessSettingsChange2(DefaultOpen);
end;


procedure TfrmRepReestrVydanNnakl.ProcessSettings;
var
  sTemp : string;
begin

  sTemp := sett.GetPluginResult('fmSettingsTipDetail');
  if sTemp = '1' then begin
    qeRasx.SetSQL('where','tip<>'+inttostr(FiidTipNNakl),0);
  end;
  if sTemp='0' then begin
    //все налоговые на печать
    qeRasx.SetSQL('where','',0);
  end;
  if sTemp ='2' then begin
    qeRasx.SetSQL('where','tip='+inttostr(FiidTipNNakl),0);
  end;
  cdsRasx.Params.ParamByName('id_izg').asInteger := strtoint(setT.GetPluginResult('fmSettingsVlad'));
  cdsRasx.Params.ParamByName('date_from').asDate := setT.DateFrom;
  cdsRasx.Params.ParamByName('date_to').asDate := setT.DateTo;

  dmdEx.GetReport('TovarKniga.fr3',frRasx);
end;

function TfrmRepReestrVydanNnakl.Defaultopen: boolean;
begin
  cdsRasx.Close;
  ProcessSettings;
  qeRasx.Refresh;
  Result :=true;
  frRasx.PrepareReport;
  frRasx.ShowPreparedReport;
end;

procedure TfrmRepReestrVydanNnakl.FillHeadXml(XMLDeclarContent:IXMLDeclarContent);
begin
  //И tin брать оттуда
  with XMLDeclarContent.DECLARHEAD do begin
    TIN:=GetOKPO;
    C_DOC:='J12';
    C_DOC_SUB:='015';
    C_DOC_VER:='6';//
    C_DOC_TYPE:=0;//тип документа. 0-основной
    C_DOC_CNT := GetNumDocZaPeriod;//1; //номер документа за период
    C_REG := GetOblastKod;//15;//код области
    C_RAJ :=GetRajonKod;//52;//код района
    //C_STI_ORIG := GetOblastKod*100+ GetRajonKod;
    PERIOD_MONTH := MonthOf(setT.dateFrom);//месяц
    PERIOD_TYPE:=1; //тип месяц
    PERIOD_YEAR:=YearOf(setT.dateFrom);
    D_FILL:=FormatDateTime('ddmmyyyy',Today);//дата заполнения
  end;

end;

procedure TfrmRepReestrVydanNnakl.CleanUpXml(var XMLDocument1 : TXMLDocument);
begin
  XMLDocument1.XML.Text := AnsiReplaceStr(XMLDocument1.XML.Text,'<DECLAR>',
    '<DECLAR xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" '+
    'xsi:noNamespaceSchemaLocation="J1201506.xsd">');
  XMLDocument1.XML.Text := AnsiReplaceStr(XMLDocument1.XML.Text,'</D_FILL>',
    '</D_FILL><LINKED_DOCS xsi:nil="true"/>'
    );    
  XMLDocument1.active := true;
end;


procedure TfrmRepReestrVydanNnakl.FillNNaklr(XMLDeclarContent: IXMLDeclarContent;
  cdsRasx :TDataSet);
begin
  WriteNode(XMLDeclarContent.DECLARBODY.T1RXXXXG2D,
    'T1RXXXXG1',
    FormatInteger,
    cdsRasx.FieldByName('F1_NPP'));
  WriteNode(XMLDeclarContent.DECLARBODY.T1RXXXXG1,
    'T1RXXXXG2D',
    FormatNodeDateTime,
    cdsRasx.FieldByName('F2_DAT'));
  WriteNode(XMLDeclarContent.DECLARBODY.T1RXXXXG3S,
    'T1RXXXXG3S',
    FormatNodeString,
    cdsRasx.FieldByName('F3_ID'));
  WriteNode(XMLDeclarContent.DECLARBODY.T1RXXXXG41S,
    'T1RXXXXG41S',
    FormatNodeString,
    cdsRasx.FieldByName('F4_VIDDOC'));
  WriteNode(XMLDeclarContent.DECLARBODY.T1RXXXXG42S,
    'T1RXXXXG42S',
    FormatNodeString,
    cdsRasx.FieldByName('F42_VIDDOC'));
  WriteNode(XMLDeclarContent.DECLARBODY.T1RXXXXG43S,
    'T1RXXXXG43S',
    FormatNodeString,
    cdsRasx.FieldByName('F43_VIDDOC'));
  WriteNode(XMLDeclarContent.DECLARBODY.T1RXXXXG5S,
    'T1RXXXXG5S',
    FormatNodeString,
    cdsRasx.FieldByName('F5_ZAK'));
  WriteNode(XMLDeclarContent.DECLARBODY.T1RXXXXG6,
    'T1RXXXXG6',
    FormatNodeStringIpn,
    cdsRasx.FieldByName('F6_IPN'));
  WriteNode(XMLDeclarContent.DECLARBODY.T1RXXXXG7,
    'T1RXXXXG7',
    FormatNodeFloat,
    cdsRasx.FieldByName('F7_SUMWITHNDS'));
  WriteNode(XMLDeclarContent.DECLARBODY.T1RXXXXG8,
    'T1RXXXXG8',
    FormatNodeFloat,
    cdsRasx.FieldByName('F8_BAZANDS'));
  WriteNode(XMLDeclarContent.DECLARBODY.T1RXXXXG9,
    'T1RXXXXG9',
    FormatNodeFloat,
    cdsRasx.FieldByName('F9_NDS'));
  WriteNode(XMLDeclarContent.DECLARBODY.T1RXXXXG10,
    'T1RXXXXG10',
    FormatNodeFloat,
    cdsRasx.FieldByName('F10'));
  WriteNode(XMLDeclarContent.DECLARBODY.T1RXXXXG11,
    'T1RXXXXG11',
    FormatNodeFloat,
    cdsRasx.FieldByName('F11_BEZOBLOGENIYA'));
  WriteNode(XMLDeclarContent.DECLARBODY.T1RXXXXG12,
    'T1RXXXXG12',
    FormatNodeFloat,
    cdsRasx.FieldByName('F12_BAZANDSEXPORT'));
  WriteNode(XMLDeclarContent.DECLARBODY.T1RXXXXG13,
    'T1RXXXXG13',
    FormatNodeFloat,
    cdsRasx.FieldByName('F13'));
end;

procedure TfrmRepReestrVydanNnakl.FillNNaklrFooter(XMLDeclarContent: IXMLDeclarContent;
  dbgRep :TDBGridEh;FormatSettings:TFormatSettings);
begin
  XMLDeclarContent.DECLARBODY.R011G7 :=
    FormatFloat('0.00',VarToDbl(Columnbyname(dbgRep.Columns,'F7_SUMWITHNDS').Footer.SumValue),FormatSettings);
  XMLDeclarContent.DECLARBODY.R011G8 :=
    FormatFloat('0.00',VarToDbl(Columnbyname(dbgRep.Columns,'F8_BAZANDS').Footer.SumValue),FormatSettings);
  XMLDeclarContent.DECLARBODY.R011G9 :=
    FormatFloat('0.00',VarToDbl(Columnbyname(dbgRep.Columns,'F9_NDS').Footer.SumValue),FormatSettings);
  XMLDeclarContent.DECLARBODY.R011G11 :=
    FormatFloat('0.00',VarToDbl(Columnbyname(dbgRep.Columns,'F11_BEZOBLOGENIYA').Footer.SumValue),FormatSettings);
  XMLDeclarContent.DECLARBODY.R011G12 :=
    FormatFloat('0.00',VarToDbl(Columnbyname(dbgRep.Columns,'F12_BAZANDSEXPORT').Footer.SumValue),FormatSettings);
  XMLDeclarContent.DECLARBODY.HFILL := FormatDateTime('ddmmyyyy',Today); //дата заполнения
  XMLDeclarContent.DECLARBODY.HBOS := dmdEx.GetBoss;
  XMLDeclarContent.DECLARBODY.HBUH := dmdEx.GetBux;
end;



procedure TfrmRepReestrVydanNnakl.Button1Click(Sender: TObject);
begin
  CreateXMLFile;
end;

procedure TfrmRepReestrVydanNnakl.Test;
begin
try
  TestCreateThreeDaysFile;
  TestGetStringListFromSqlRecord;
except
  AssertInternal('73DD1396-5DBC-45A7-B9AC-FAF6E9B2C6C5');
end;
end;



procedure TfrmRepReestrVydanNnakl.TestGetStringListFromSqlRecord;
var
  StringList : TstringList;
  sTemp: string;
begin
  StringList := TStringList.Create;
  GetStringListFromSqlRecord('select k.fullname,k.tel, k.ipn, k.svreg,k.adrp,k.name from klient_all_vw k '+
    'where k.id='+ setT.GetPluginResult('fmSettingsVlad'), dmdEx.cdsTemp,stringList);
  sTemp :=stringList.Values['NAME'];
  if sTemp<>setT.GetPluginTextResult('fmSettingsVlad') then begin
    AssertInternal('37481E69-BBCB-4D63-A68C-6C426B04542E GetStringListFromSqlRecord');
  end;
end;

function TfrmRepReestrVydanNnakl.GetXmlFileName: string;
begin
  Result :=
    dmdex.GetReportPath +
    FormatFloat('00',GetOblastKod ) +
    FormatFloat('00',GetRajonKod ) +
    FormatFloat('0000000000',strtoint(GetOKPO)) +
    'J1201506'+'100'+
    FormatFloat('0000000',GetNumDocZaPeriod) +
    '1' +
    FormatFloat('00', MonthOf(setT.dateFrom))+
    FormatFloat('0000', YearOf(setT.dateFrom))+
    FormatFloat('00',GetOblastKod ) +
    FormatFloat('00',GetRajonKod ) +

    '.xml';
end;

function TfrmRepReestrVydanNnakl.GetOblastKod: integer;
begin
  Result :=15;//код области
end;

function TfrmRepReestrVydanNnakl.GetRajonKod: integer;
begin
  Result :=52;//код района
end;

function TfrmRepReestrVydanNnakl.GetOKPO: string;
var
  StringList : TstringList;
begin
  StringList := TStringList.Create;
  try
    if FGetOKPOsOKPO ='' then begin
    GetStringListFromSqlRecord('select k.OKPO from klient_all_vw k '+
      'where k.id='+ setT.GetPluginResult('fmSettingsVlad'), dmdEx.cdsTemp,stringList);
    FGetOKPOsOKPO := stringList.Values['OKPO'];
    end;
  finally
    StringList.Free;
  end;
  Result  :=FGetOKPOsOKPO;
end;

function TfrmRepReestrVydanNnakl.GetNumDocZaPeriod: integer;
begin
  Result :=1; //номер документа за период
end;

procedure TfrmRepReestrVydanNnakl.actGenerateXmlExecute(Sender: TObject);
begin
  if setT.ChangeSettings = mrOk then begin
    ProcessSettings;
    actRefresh.execute;
  end else begin
    exit;
  end;
  InitNaklpReestr();
  if MessageDlg('Генерировать файл?',mtConfirmation, [mbOk,mbCancel],0)=mrOk then begin
    if (CheckIPN(frmNNaklpReestr.cdsRasx,'F7_IPN','F6_IZG','F4_ID') and CheckIPN(cdsRasx)) then begin
      CreateXMLFile;
    end;
  end;
end;

procedure TfrmRepReestrVydanNnakl.FillXMLContent(
  XMLDeclarContent: IXMLDeclarContent);
var
  FormatSettings : TFormatSettings;
begin
  //чтобы цифры сохранялись в xml с точкой, а не запятой
  GetLocaleFormatSettings(GetThreadLocale,FormatSettings);
  FormatSettings.DecimalSeparator:='.';

  //выданные накладные покупателям
  ProcessSettings;
  cdsRasx.First;
  while not cdsRasx.eof do begin
    FillNNaklr(XMLDeclarContent,cdsRasx);
    cdsRasx.Next;
  end;//while not eof
  FillNNaklrFooter(XMLDeclarContent,dbgRep,FormatSettings);
end;

function TfrmRepReestrVydanNnakl.GetXMLDocument:TXMLDocument;
var
  XMLDocument1:TXMLDocument;
begin
  XMLDocument1 := TXMLDocument.Create(self);
  XMLDocument1.Options := XMLDocument1.Options + [doNodeAutoIndent];
  XMLDocument1.Active := true;
  XMLDocument1.Encoding := 'windows-1251';
  Result := XMLDocument1;
end;

procedure TfrmRepReestrVydanNnakl.CreateXMLFile;
var
  XMLDeclarContent: IXMLDeclarContent;
  XMLDocument1:TXMLDocument;
begin
  SaveDialog.FileName := GetXmlFileName;
  if SaveDialog.Execute then begin
    XMLDocument1 := GetXMLDocument;
    XMLDeclarContent := GetDECLAR(XMLDocument1);
    FillHeadXML(XMLDeclarContent);
    FillXMLContent(XMLDeclarContent);
    frmNnaklpReestr.FillXMLContent(XMLDeclarContent);

    CleanUpXml(XMLDocument1);
    XMLDocument1.SaveToFile(SaveDialog.FileName);
    Showmessage ('Файл '+ SaveDialog.FileName+ ' сохранён.');
  end; //if SaveDialog.Execute
end;



procedure TfrmRepReestrVydanNnakl.TestCreateThreeDaysFile;
begin
  setT.dateto := incmonth(today,-1);
  setT.datefrom := incday(setT.dateto,-3);
  Button1Click(self);
end;


procedure TfrmRepReestrVydanNnakl.InitNaklpReestr;
begin
  frmNnaklpReestr := TfrmRepReestrPolychNNakl.Create(self);
  frmNnaklpReestr.FormStyle := fsNormal;
  frmNnaklpReestr.visible := false;
  frmNnaklpReestr.setT.DateFrom := setT.DateFrom;
  frmNnaklpReestr.setT.DateTo := setT.DateTo;
  frmNnaklpReestr.setT.GetPlugin('fmSettingsVlad').SetKeyValue(setT.GetPluginResult('fmSettingsVlad'));
  frmNnaklpReestr.ProcessSettings;
  frmNnaklpReestr.actRefresh.Execute;
end;

procedure TfrmRepReestrVydanNnakl.actRefreshExecute(Sender: TObject);
begin
  cdsRasx.Close;
  qeRasx.Refresh;
end;




end.

