unit NNaklRepXml;

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
  J1201004, UnfFilter// IXMLDeclarContent

  ;

type
  TFormatNode = function (XMLNode : IXMLNode;Field:TField):string;

  TfrmNnaklRepXml = class(TForm)
    dsNaklrt: TDataSource;
    ActionList1: TActionList;
    frdRasx: TfrxDBDataset;
    dbgRep: TDBGridEh;
    sdsNaklrt: TSQLDataSet;
    dspNaklrt: TDataSetProvider;
    cdsNaklrt: TClientDataSet;
    BitBtn5: TBitBtn;
    actSettings: TAction;
    qeRasx: TQueryExtender;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem3: TMenuItem;
    frRasx: TfrxReport;
    actRefresh: TAction;
    sdsNNakl: TSQLDataSet;
    dspNNakl: TDataSetProvider;
    cdsNNakl: TClientDataSet;
    dsNNakl: TDataSource;
    XMLDocument1: TXMLDocument;
    frdNNaklp: TfrxDBDataset;
    BitBtn1: TBitBtn;
    actRefreshNNaklp: TAction;
    Button2: TButton;
    actGenerateXml: TAction;
    dbgNNaklpNexoz: TDBGridEh;
    SaveDialog: TSaveDialog;
    BitBtn2: TBitBtn;
    actShowNNaklr: TAction;
    actShowNNaklp: TAction;
    BitBtn3: TBitBtn;
    UnfFilter1: TUnfFilter;
    procedure FormCreate(Sender: TObject);
		procedure FormClose(Sender: TObject; var Action: TCloseAction);
		procedure actSettingsExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure actGenerateXmlExecute(Sender: TObject);
    procedure actShowNNaklrExecute(Sender: TObject);
    procedure actShowNNaklpExecute(Sender: TObject);
  private
    { Private declarations }
		//procedure UpdateCaption;
    FiidTipNNakl : integer;
		setT : TfrmSettings;
    SettingsVlad : TfmSettingsPlugin;
    FGetOKPOsOKPO : string;
    procedure ProcessSettings(cdsRasx:TClientDataSet);
//    procedure ProcessSettingsNNaklp;
//    procedure ProcessSettingsNNaklpNexoz;
    procedure FillHeadXml(XMLDeclarContent:IXMLDeclarContent);
    procedure FillBodyXML(XMLDeclarContent:IXMLDeclarContent);
    procedure FillNNaklpFooter(XMLDeclarContent: IXMLDeclarContent;
      dbgRep :TDBGridEh;FormatSettings:TFormatSettings);
    procedure FillNNaklpNexozFooter(XMLDeclarContent: IXMLDeclarContent;
      dbgRep :TDBGridEh;FormatSettings:TFormatSettings);
    procedure FillNNaklrFooter(XMLDeclarContent: IXMLDeclarContent;
      dbgRep: TDBGridEh;FormatSettings:TFormatSettings);
    procedure FillFooter(XMLDeclarContent: IXMLDeclarContent);

    function GetXmlFileName:string;
    function GetOblastKod :integer;
    function GetRajonKod: integer;
    function GetOKPO : string;
    function GetNumDocZaPeriod: integer;
    procedure CleanUpXml(var XMLDocument1 : TXMLDocument);
    procedure FillNNaklr(XMLDeclarContent: IXMLDeclarContent;
      cdsRasx :TDataSet);
    procedure FillNNaklp(XMLDeclarContent: IXMLDeclarContent;
      cdsRasx :TDataSet);
    procedure FillNNaklpNexoz(XMLDeclarContent: IXMLDeclarContent;
      cdsRasx :TDataSet);
    procedure CreateXMLFile;
    function  CheckIPN(DataSet :TDataSet):boolean;
    procedure TestCreateThreeDaysFile;
    procedure TestGetStringListFromSqlRecord;

	public
    procedure Test;
    function Defaultopen: boolean;

		{ Public declarations }
	end;
  function FormatNodeDateTime (XMLNode : IXMLNode;Field:TField):string;
  function FormatNodeString (XMLNode : IXMLNode;Field:TField):string;
  function FormatNodeFloat (XMLNode : IXMLNode;Field:TField):string;
  function FormatNodeFloatZero (XMLNode : IXMLNode;Field:TField):string;
  function FormatNodeStringIPN (XMLNode : IXMLNode;Field:TField):string;
  function FormatNodeInteger (XMLNode : IXMLNode;Field:TField):string;
var
	frmNnaklRepXml: TfrmNnaklRepXml;

implementation


{$R *.dfm}
uses
  DesignReport, //ProcessReportDesigner
  untRound, //ColumnByName
  StrUtils //AnsiReplaceStr
  ;

procedure TfrmNnaklRepXml.FormClose(Sender: TObject;
	var Action: TCloseAction);
begin
	Action := caFree;
end;

procedure TfrmNnaklRepXml.FormCreate(Sender: TObject);
begin
//	actSettings.execute;
	setT := TfrmSettings.Create(Self);
	setT.actManagerOff.Execute;
  //предыдущий месяц
  setT.SetPeriod(7);
  SettingsVlad := setT.CreatePlugin('TfmSettingsVlad');
  setT.addplugin(SettingsVlad);
  SettingsVlad.setresulttype(1);
  SettingsVlad.SetKeyValue(dmdEx.GetDefaultVlad);
  //qeRasx.DefSql := sdsRasx.CommandText;
  ProcessReportDesigner(ActionList1,MainMenu1,frRasx);

end;


procedure TfrmNnaklRepXml.actSettingsExecute(Sender: TObject);
begin
  actSettings.checked := setT.ProcessSettingsChange2(DefaultOpen);
end;

procedure TfrmNnaklRepXml.actRefreshExecute(Sender: TObject);
begin
//  ProcessSettings(cdsRasx);
//  frRasx.PrepareReport;
//  frRasx.ShowPreparedReport;
end;

procedure TfrmNnaklRepXml.ProcessSettings(cdsRasx:TClientDataSet);
begin
  cdsRasx.Close;
  cdsRasx.Params.ParamByName('id_izg').asInteger := strtoint(setT.GetPluginResult('fmSettingsVlad'));
  cdsRasx.Params.ParamByName('date_from').asDate := setT.DateFrom;
  cdsRasx.Params.ParamByName('date_to').asDate := setT.DateTo;
  if Assigned(cdsRasx.Params.FindParam('mode')) then begin
    cdsRasx.Params.ParamByName('mode').asInteger :=
      strtoint(setT.GetPluginResult('fmSettingsTipDetail'))
  end;
  cdsRasx.open;
  cdsRasx.First;
  //чтоб суммы брал из таблицы
  //dsRasx.DataSet := cdsRasx;
end;

procedure TfrmNnaklRepXml.FillHeadXml(XMLDeclarContent:IXMLDeclarContent);
begin
  //И tin брать оттуда
  with XMLDeclarContent.DECLARHEAD do begin
    TIN:=GetOKPO;
    C_DOC:='J02';
    C_DOC_SUB:='151';
    C_DOC_VER:='2';//
    C_DOC_TYPE:=0;//тип документа. 0-основной
    C_DOC_CNT := GetNumDocZaPeriod;//1; //номер документа за период
    C_REG:=GetOblastKod;//15;//код области
    C_RAJ :=GetRajonKod;//52;//код района
    PERIOD_MONTH := MonthOf(setT.dateFrom);//месяц
    PERIOD_TYPE:=1; //тип месяц
    PERIOD_YEAR:=YearOf(setT.dateFrom);
    C_DOC_STAN := 1;//отчётный документ
    D_FILL:=FormatDateTime('ddmmyyyy',Today);//дата заполнения
  end;
end;

procedure TfrmNnaklRepXml.CleanUpXml(var XMLDocument1 : TXMLDocument);
begin
  XMLDocument1.XML.Text := AnsiReplaceStr(XMLDocument1.XML.Text,'<DECLAR>',
    '<DECLAR xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" '+
    'xsi:noNamespaceSchemaLocation="J0215101.xsd">'
    );
  XMLDocument1.active := true;
end;


procedure WriteNode(Node: IXMLNodeCollection;
  sNodeName: string;FormatNode :TFormatNode;Field:TField);
var
  XMLNode : IXMLNode;
begin
  Field.DataSet.First;
  while not Field.DataSet.eof do begin
    XMLNode :=Node.AddChild(sNodeName);
    XMLNode.Attributes['ROWNUM'] := Field.DataSet.FieldByName('F1_NPP').AsInteger;
    FormatNode(XMLNode,Field);
    Field.DataSet.Next;
  end;//while not eof
end;

procedure WriteNodeNoX(Node: IXMLNodeCollection;
  sNodeName: string;FormatNode :TFormatNode;Field:TField);
var
  XMLNode : IXMLNode;
begin
  Field.DataSet.First;
  while not Field.DataSet.eof do begin
    if Field.DataSet.FieldByName('F5_IPN').AsString<>'X' then begin
      XMLNode :=Node.AddChild(sNodeName);
      XMLNode.Attributes['ROWNUM'] := Field.DataSet.FieldByName('F1_NPP').AsInteger;
      FormatNode(XMLNode,Field);
    end;
    Field.DataSet.Next;
  end;//while not eof
end;

procedure TfrmNnaklRepXml.FillNNaklr(XMLDeclarContent: IXMLDeclarContent;
  cdsRasx :TDataSet);
begin
  WriteNodeNoX(XMLDeclarContent.DECLARBODY..T1RXXXXG2,
    'T1RXXXXG2',
    FormatNodeStringIpn,
    cdsRasx.FieldByName('F5_IPN'));
  WriteNodeNoX(XMLDeclarContent.DECLARBODY.T1RXXXXG3,
    'T1RXXXXG3',
    FormatNodeFloat,
    cdsRasx.FieldByName('F7_NDS'));
  WriteNodeNoX(XMLDeclarContent.DECLARBODY.T1RXXXXG4,
    'T1RXXXXG4',
    FormatNodeFloat,
    cdsRasx.FieldByName('F8_NDS'));
end;

procedure TfrmNnaklRepXml.FillNNaklp(XMLDeclarContent: IXMLDeclarContent;
  cdsRasx :TDataSet);
begin
  WriteNodeNoX(XMLDeclarContent.DECLARBODY.T2RXXXXG2,
    'T2RXXXXG2',
    FormatNodeStringIpn,
    cdsRasx.FieldByName('F5_IPN'));
  WriteNodeNoX(XMLDeclarContent.DECLARBODY.T2RXXXXG3A,
    'T2RXXXXG3A',
    FormatNodeInteger,
    cdsRasx.FieldByName('DAT_MONTH'));
  WriteNodeNoX(XMLDeclarContent.DECLARBODY.T2RXXXXG3B,
    'T2RXXXXG3B',
    FormatNodeInteger,
    cdsRasx.FieldByName('DAT_YEAR'));
  WriteNodeNoX(XMLDeclarContent.DECLARBODY.T2RXXXXG4,
    'T2RXXXXG4',
    FormatNodeFloat,
    cdsRasx.FieldByName('F7_NDS'));
  WriteNodeNoX(XMLDeclarContent.DECLARBODY.T2RXXXXG5,
    'T2RXXXXG5',
    FormatNodeFloat,
    cdsRasx.FieldByName('F8_NDS'));
end;

procedure TfrmNnaklRepXml.FillNNaklpFooter(XMLDeclarContent: IXMLDeclarContent;
  dbgRep :TDBGridEh;FormatSettings:TFormatSettings);
begin
  dbgRep.DataSource.DataSet.Last;
  XMLDeclarContent.DECLARBODY.R020G4 :=
    FormatFloat('0.00',VarToDbl(Columnbyname(dbgRep.Columns,'F7_NDS').Footer.SumValue),FormatSettings);
  XMLDeclarContent.DECLARBODY.R020G5 :=
    FormatFloat('0.00',VarToDbl(Columnbyname(dbgRep.Columns,'F8_NDS').Footer.SumValue),FormatSettings);
end;

procedure TfrmNnaklRepXml.FillBodyXML(XMLDeclarContent:IXMLDeclarContent);
var
  StringList : TstringList;
begin
  StringList := TStringList.Create;
  GetStringListFromSqlRecord('select k.fullname,k.tel, k.ipn, k.svreg,k.adrp,k.name from klient_all_vw k '+
    'where k.id='+ setT.GetPluginResult('fmSettingsVlad'), dmdEx.cdsTemp,stringList);
  //XMLDeclarContent.DECLARBODY.hnum := '';
  XMLDeclarContent.DECLARBODY.HZ := 1; 
  XMLDeclarContent.DECLARBODY.HZY:=YearOf(setT.datefrom);//;
  //XMLDeclarContent.DECLARBODY.HZKV:=((MonthOf(setT.DateFrom)-1) div 3)+1;
  XMLDeclarContent.DECLARBODY.HZM := MonthOf(setT.DateFrom);

  //XMLDeclarContent.DECLARBODY.ChildNodes['HNAME'].NodeValue :=stringList.Values['FULLNAME'];  //todo
  XMLDeclarContent.DECLARBODY.HNAME :=stringList.Values['FULLNAME'];  //todo
  XMLDeclarContent.DECLARBODY.HTIN := GetOkpo;

  XMLDeclarContent.DECLARBODY.HNPDV := stringList.values['IPN'];  //налоговый номер 11 знаков ипн
  XMLDeclarContent.DECLARBODY.HNSPDV := strtoint(stringList.values['SVREG']) ; //8 знаков свидетельство
  //XMLDeclarContent.DECLARBODY.ChildNodes['HLOC'].NodeValue :=ShortString	('ADRP');  //todo


  //XMLDeclarContent.DECLARBODY.H01G01D := FormatDateTime('ddmmyyyy',setT.DateFrom);//реестр от
  //XMLDeclarContent.DECLARBODY.H02G01D := FormatDateTime('ddmmyyyy',setT.DateTo); //реестр до

  stringList.Free;
end;

procedure TfrmNnaklRepXml.Test;
begin
try
  TestCreateThreeDaysFile;
  TestGetStringListFromSqlRecord;
except
  AssertInternal('73DD1396-5DBC-45A7-B9AC-FAF6E9B2C6C5');
end;
end;

procedure TfrmNnaklRepXml.FillNNaklrFooter(
  XMLDeclarContent: IXMLDeclarContent; dbgRep: TDBGridEh;
  FormatSettings: TFormatSettings);
begin
  dbgRep.DataSource.DataSet.Last;
  XMLDeclarContent.DECLARBODY.R001G3 :=
    FormatFloat('0.00',dbgRep.DataSource.DataSet.fieldbyname('F7_NDS').AsFloat,FormatSettings);
  XMLDeclarContent.DECLARBODY.R001G4 :=
    FormatFloat('0.00',dbgRep.DataSource.DataSet.fieldbyname('F8_NDS').AsFloat,FormatSettings);
  XMLDeclarContent.DECLARBODY.R010G3 :=
    FormatFloat('0.00',VarToDbl(Columnbyname(dbgRep.Columns,'F7_NDS').Footer.SumValue),FormatSettings);
  XMLDeclarContent.DECLARBODY.R010G4 :=
    FormatFloat('0.00',VarToDbl(Columnbyname(dbgRep.Columns,'F8_NDS').Footer.SumValue),FormatSettings);
end;

procedure TfrmNnaklRepXml.TestGetStringListFromSqlRecord;
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

function TfrmNnaklRepXml.GetXmlFileName: string;
begin
  Result :=
    dmdex.GetReportPath +
    FormatFloat('00',GetOblastKod ) +
    FormatFloat('00',GetRajonKod ) +
    FormatFloat('0000000000',strtoint(GetOKPO)) +
    'J0215102'+'100'+
    FormatFloat('0000000',GetNumDocZaPeriod ) +
    '1' +
    FormatFloat('00', MonthOf(setT.dateFrom))+
    FormatFloat('0000', YearOf(setT.dateFrom))+
    FormatFloat('00',GetOblastKod ) +
    FormatFloat('00',GetRajonKod ) +
    '.xml';
end;

function TfrmNnaklRepXml.GetOblastKod: integer;
begin
  Result :=15;//код области
end;

function TfrmNnaklRepXml.GetRajonKod: integer;
begin
  Result :=52;//код района
end;

function TfrmNnaklRepXml.GetOKPO: string;
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

function TfrmNnaklRepXml.GetNumDocZaPeriod: integer;
begin
  Result :=1; //номер документа за период
end;

function FormatNodeDateTime (XMLNode : IXMLNode;Field:TField):string;
begin
  Result := FormatDateTime('ddmmyyyy',Field.AsDateTime );
  XMLNode.NodeValue := Result;
end;

function FormatNodeString (XMLNode : IXMLNode;Field:TField):string;
begin
  Result := Field.asString;
  XMLNode.NodeValue := Result;
end;

function FormatNodeStringIPN (XMLNode : IXMLNode;Field:TField):string;
begin
  Result := Field.asString;
  if Result='X' then begin
    XMLNode.Attributes['xsi:nil']:='true';
  end else begin
    XMLNode.NodeValue := Result;
  end;
end;

function FormatNodeFloat (XMLNode : IXMLNode;Field:TField):string;
var
  FormatSettings : TFormatSettings;
begin
  //чтобы цифры сохранялись в xml с точкой, а не запятой
  GetLocaleFormatSettings(GetThreadLocale, FormatSettings);
  FormatSettings.DecimalSeparator:='.';
  Result :=FormatFloat('0.00',Field.asFloat,FormatSettings);
  XMLNode.NodeValue := Result;
end;

function FormatNodeInteger (XMLNode : IXMLNode;Field:TField):string;
begin
  Result :=inttostr(Field.asInteger);
  XMLNode.NodeValue := Result;
end;

function FormatNodeFloatZero (XMLNode : IXMLNode;Field:TField):string;
var
  FormatSettings : TFormatSettings;
begin
  //чтобы цифры сохранялись в xml с точкой, а не запятой
  GetLocaleFormatSettings(GetThreadLocale,FormatSettings);
  FormatSettings.DecimalSeparator:='.';
  Result :=FormatFloat('0.00',0,FormatSettings);
  XMLNode.NodeValue := Result;
end;

procedure TfrmNnaklRepXml.actGenerateXmlExecute(Sender: TObject);
begin
//  actSettings.checked := setT.ProcessSettingsChange(actRefresh);
//  actRefreshNNaklp.Execute;
//  if MessageDlg('Генерировать файл?',mtConfirmation, [mbOk,mbCancel],0)=mrOk then begin
//    if (CheckIPN(cdsNNaklp)  and CheckIPN(cdsRasx)) then begin
      CreateXMLFile;
//    end;
//  end;
end;

procedure TfrmNnaklRepXml.CreateXMLFile;
var
  XMLDeclarContent: IXMLDeclarContent;
  XMLDocument1:TXMLDocument;
  FormatSettings : TFormatSettings;
begin

  //чтобы цифры сохранялись в xml с точкой, а не запятой
  GetLocaleFormatSettings(GetThreadLocale,FormatSettings);
  FormatSettings.DecimalSeparator:='.';

  XMLDocument1 := TXMLDocument.Create(self);
  XMLDocument1.Options := XMLDocument1.Options + [doNodeAutoIndent];
  XMLDocument1.Active := true;
  XMLDocument1.Encoding := 'windows-1251';

  XMLDeclarContent := GetDECLAR(XMLDocument1);
  FillHeadXML(XMLDeclarContent);
  FillBodyXML(XMLDeclarContent);



  //выданные накладные покупателям
  ProcessSettings(cdsRasx);

  if not CheckIPN(cdsRasx) then exit;
  dmdEx.GetReport('TovarKniga.fr3',frRasx);
  
  FillNNaklr(XMLDeclarContent,cdsRasx);
  FillNNaklrFooter(XMLDeclarContent,dbgRep,FormatSettings);

  //полученные накладные от поставщиков
  ProcessSettings(cdsNnaklp);
  if not CheckIPN(cdsNnaklp) then exit;
  dmdEx.GetReport('ReestrPolychNNakl2.fr3',frxNNaklp);
  FillNNaklp(XMLDeclarContent,cdsNNaklp);
  FillNNaklpFooter(XMLDeclarContent,dbgRep,FormatSettings);

  ProcessSettings(cdsNNaklpnexoz);
  FillNNaklpNexoz(XMLDeclarContent,cdsNNaklpNexoz);
  FillNNaklpNexozFooter(XMLDeclarContent,dbgNNaklpNexoz,FormatSettings);

  FillFooter(XMLDeclarContent);

  CleanUpXml(XMLDocument1);
  SaveDialog.FileName := GetXmlFileName;
  if SaveDialog.Execute then begin
    XMLDocument1.SaveToFile(SaveDialog.FileName);
  end;
end;

function  TfrmNnaklRepXml.CheckIPN(DataSet :TDataSet):boolean;
begin
  Result := true;
  dataset.first;
  while not dataset.eof do begin
    if ((Length(dataset.FieldByName('f5_ipn').asString)<4) and
      (dataset.FieldByName('f5_ipn').asString<>'X'))
    then begin
      showmessage ('Для фирмы '+
        dataset.FieldByName('F4_zak').asstring+
        ' не указан ИНН в справочнике клиентов');
      Result := false;
      exit;
    end;
    dataset.next;
  end;
end;

procedure TfrmNnaklRepXml.TestCreateThreeDaysFile;
begin
  setT.dateto := incmonth(today,-1);
  setT.datefrom := incday(setT.dateto,-15);
  CreateXMLFile;
end;
{
procedure TfrmNnaklRepXml.FillNNaklpNexoz(
  XMLDeclarContent: IXMLDeclarContent; cdsRasx: TDataSet);
begin
  WriteNodeNoX(XMLDeclarContent.DECLARBODY.T3RXXXXG2,
    'T3RXXXXG2',
    FormatNodeStringIpn,
    cdsRasx.FieldByName('F5_IPN'));
  WriteNodeNoX(XMLDeclarContent.DECLARBODY.T3RXXXXG3A,
    'T3RXXXXG3A',
    FormatNodeInteger,
    cdsRasx.FieldByName('DAT_MONTH'));
  WriteNodeNoX(XMLDeclarContent.DECLARBODY.T3RXXXXG3B,
    'T3RXXXXG3B',
    FormatNodeInteger,
    cdsRasx.FieldByName('DAT_YEAR'));
  WriteNodeNoX(XMLDeclarContent.DECLARBODY.T3RXXXXG4,
    'T3RXXXXG4',
    FormatNodeFloat,
    cdsRasx.FieldByName('F7_NDS'));
  WriteNodeNoX(XMLDeclarContent.DECLARBODY.T3RXXXXG5,
    'T3RXXXXG5',
    FormatNodeFloat,
    cdsRasx.FieldByName('F8_NDS'));
end;
}
procedure TfrmNnaklRepXml.FillNNaklpNexozFooter(
  XMLDeclarContent: IXMLDeclarContent; dbgRep: TDBGridEh;
  FormatSettings: TFormatSettings);
begin
  dbgRep.DataSource.DataSet.Last;
  XMLDeclarContent.DECLARBODY.R030G4 :=
    FormatFloat('0.00',VarToDbl(Columnbyname(dbgRep.Columns,'F7_NDS').Footer.SumValue),FormatSettings);
  XMLDeclarContent.DECLARBODY.R030G5 :=
    FormatFloat('0.00',VarToDbl(Columnbyname(dbgRep.Columns,'F8_NDS').Footer.SumValue),FormatSettings);
end;

procedure TfrmNnaklRepXml.FillFooter(XMLDeclarContent: IXMLDeclarContent);
begin
  XMLDeclarContent.DECLARBODY.HFILL := FormatDateTime('ddmmyyyy',Today);
  XMLDeclarContent.DECLARBODY.HBOS := dmdEx.GetBoss;
  XMLDeclarContent.DECLARBODY.HBUH := dmdEx.GetBux;
end;

function TfrmNnaklRepXml.Defaultopen: boolean;
begin
  actShowNNaklr.Execute;
  Result :=true;
end;

procedure TfrmNnaklRepXml.actShowNNaklrExecute(Sender: TObject);
begin
  ProcessSettings(cdsRasx);
  dsRasx.DataSet := cdsRasx;
  self.caption := 'Реестр выданных налоговых накладных';
end;

procedure TfrmNnaklRepXml.actShowNNaklpExecute(Sender: TObject);
begin
  ProcessSettings(cdsNnaklp);
  dsRasx.DataSet := cdsNnaklp;
  self.caption := 'Реестр полученных налоговых накладных';
end;

end.


