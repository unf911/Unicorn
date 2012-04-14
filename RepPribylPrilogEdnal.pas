unit RepPribylPrilogEdnal;

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
  J0111901, UnfFilter,  // IXMLDeclarContent
  XMLHelper, PropFilerEh, PropStorageEh, ExtCtrls;

const KlientTipExport: integer = 1;
const KlientTipNeplNds: integer = 2;

type
  TFormatNode = function (XMLNode : IXMLNode;Field:TField):string;

  TfrmRepPribylPrilogEdnal = class(TForm)
    ActionList1: TActionList;
    frdRasx: TfrxDBDataset;
    actSettings: TAction;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem3: TMenuItem;
    sdsNNakl: TSQLDataSet;
    dspNNakl: TDataSetProvider;
    cdsFizLico: TClientDataSet;
    dsNNakl: TDataSource;
    XMLDocument1: TXMLDocument;
    frdNNaklp: TfrxDBDataset;
    actGenerateXml: TAction;
    SaveDialog: TSaveDialog;
    UnfFilter1: TUnfFilter;
    Xml1: TMenuItem;
    PopupMenu1: TPopupMenu;
    Xml2: TMenuItem;
    rpsClientEdit: TRegPropStorageManEh;
    PropStorageEh1: TPropStorageEh;
    dbgFizLico: TDBGridEh;
    UnfFilter2: TUnfFilter;
    sdsNNaklNAME: TStringField;
    sdsNNaklOKPO: TStringField;
    sdsNNaklVSEGO: TFMTBCDField;
    cdsFizLicoNAME: TStringField;
    cdsFizLicoOKPO: TStringField;
    cdsFizLicoVSEGO: TFMTBCDField;
    dbgYurLico: TDBGridEh;
    sdsYurLico: TSQLDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    FMTBCDField1: TFMTBCDField;
    dspYurLico: TDataSetProvider;
    cdsYurLico: TClientDataSet;
    StringField3: TStringField;
    StringField4: TStringField;
    FMTBCDField2: TFMTBCDField;
    dsYurLico: TDataSource;
    sdsNNaklFULLNAME: TStringField;
    cdsFizLicoFULLNAME: TStringField;
    sdsYurLicoFULLNAME: TStringField;
    cdsYurLicoFULLNAME: TStringField;
    cdsFizLicoNPP: TIntegerField;
    cdsYurLicoNPP: TIntegerField;
    Splitter1: TSplitter;
    procedure FormCreate(Sender: TObject);
		procedure FormClose(Sender: TObject; var Action: TCloseAction);
		procedure actSettingsExecute(Sender: TObject);
    procedure actGenerateXmlExecute(Sender: TObject);
    procedure cdsFizLicoCalcFields(DataSet: TDataSet);
    procedure cdsFizLicoAfterOpen(DataSet: TDataSet);
    procedure cdsYurLicoAfterOpen(DataSet: TDataSet);
    procedure cdsYurLicoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    nppFiz, nppYur: integer;
		setT : TfrmSettings;
    FGetOKPOsOKPO : string;

    procedure FillHeadXml(XMLDeclarContent:IXMLDeclarContent; dat: TDateTime);
    procedure FillBodyXML(XMLDeclarContent:IXMLDeclarContent; FormatSettings:TFormatSettings);
    procedure FillFooter(XMLDeclarContent: IXMLDeclarContent;  DataSet :TDataSet;
      FormatSettings:TFormatSettings);
    procedure FillSecondPart(XMLDeclarContent:IXMLDeclarContent; dsNNakl: TDataSet);
    procedure FillFirstPart(XMLDeclarContent:IXMLDeclarContent; dsNNakl: TDataSet);
    procedure CloseAndOpen(cdsDataset:TClientDataSet);

    function GetXmlFileName(dat: TDateTime; ReportPath:String=''):string;
    function GetOblastKod :integer;
    function GetRajonKod: integer;
    function GetOKPO : string;
    procedure CleanUpXml(var XMLDocument1 : TXMLDocument);
    procedure CreateXMLFile(IsSilent:boolean; FileName:String='');
    procedure ProcessSettings(cdsRasx:TClientDataSet);
    function FillSettings():TfrmSettings;
    function GetXMLDocument:TXMLDocument;
    function GetTip(month: integer): integer;
	public
    function Defaultopen: boolean;
    function GenerateXML(id: integer): integer;

		{ Public declarations }
	end;

var
	frmRepPribylPrilogEdnal: TfrmRepPribylPrilogEdnal;

implementation


{$R *.dfm}
uses
  untRound, //ColumnByName
  StrUtils //AnsiReplaceStr
  ;

procedure TfrmRepPribylPrilogEdnal.FormClose(Sender: TObject;
	var Action: TCloseAction);
begin
	Action := caFree;
end;

procedure TfrmRepPribylPrilogEdnal.FormCreate(Sender: TObject);
begin
  setT := FillSettings;
end;

function TfrmRepPribylPrilogEdnal.FillSettings():TfrmSettings;
var
  setTLocal : TfrmSettings;
  SettingsVlad : TfmSettingsPlugin;
begin
	setTLocal := TfrmSettings.Create(Self);
	setTLocal.actManagerOff.Execute;
  //текущий мес€ц
  setTLocal.SetPeriod(1);

  SettingsVlad := setTLocal.CreatePlugin('TfmSettingsVlad');
  setTLocal.addplugin(SettingsVlad);
  SettingsVlad.setresulttype(1);
  SettingsVlad.SetKeyValue(dmdEx.GetDefaultVlad);

  Result := setTLocal;
end;


procedure TfrmRepPribylPrilogEdnal.actSettingsExecute(Sender: TObject);
begin
  actSettings.checked := setT.ProcessSettingsChange2(DefaultOpen);
end;


procedure TfrmRepPribylPrilogEdnal.ProcessSettings(cdsRasx:TClientDataSet);
begin
  cdsRasx.Close;
  cdsRasx.Params.ParamByName('id_izg').AsInteger := strtoint(setT.GetPluginResult('fmSettingsVlad'));
  cdsRasx.Params.ParamByName('dat_from').AsDate := setT.DateFrom;
  cdsRasx.Params.ParamByName('dat_to').AsDate := setT.DateTo;
  cdsRasx.Open;

  cdsRasx.First;

  self.Caption :='ѕриложение к декларации по прибыли: '
    + ' c ' + datetostr (setT.DateFrom)
    + ' по '+ datetostr(setT.DateTo);
end;

procedure TfrmRepPribylPrilogEdnal.FillHeadXml(XMLDeclarContent:IXMLDeclarContent; dat: TDateTime);
begin
  //» tin брать оттуда
  with XMLDeclarContent.DECLARHEAD do begin
    TIN:=GetOKPO;
    C_DOC:='J01';
    C_DOC_SUB:='119';
    C_DOC_VER:='1';//
    C_DOC_TYPE:=0;//тип документа. 0-основной
    C_DOC_CNT := 1; //номер документа за период
    C_REG:=GetOblastKod;//15;//код области
    C_RAJ :=GetRajonKod;//52;//код района
    PERIOD_MONTH := MonthOf(dat);//мес€ц
    PERIOD_TYPE:= GetTip(MonthOf(dat));
    PERIOD_YEAR:=YearOf(dat);
    C_STI_ORIG := GetOblastKod + GetRajonKod;
    C_DOC_STAN := 1;//отчЄтный документ
    D_FILL:=FormatDateTime('ddmmyyyy',Today);//дата заполнени€
  end;
end;

procedure TfrmRepPribylPrilogEdnal.CleanUpXml(var XMLDocument1 : TXMLDocument);
begin
  XMLDocument1.XML.Text := AnsiReplaceStr(XMLDocument1.XML.Text,'<DECLAR>',
    '<DECLAR xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" '+
    'xsi:noNamespaceSchemaLocation="J0111901.xsd">'
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
    XMLNode.Attributes['ROWNUM'] := Field.DataSet.FieldByName('NPP').AsInteger;
    FormatNode(XMLNode,Field);
    Field.DataSet.Next;
  end;//while not eof
end;

procedure TfrmRepPribylPrilogEdnal.FillFooter(XMLDeclarContent: IXMLDeclarContent; DataSet :TDataSet;
  FormatSettings:TFormatSettings);
begin
  XMLDeclarContent.DECLARBODY.HBOS := dmdEx.GetBoss;
  XMLDeclarContent.DECLARBODY.HBUH := dmdEx.GetBux;
{

    XMLDeclarContent.DECLARBODY.R01G9 := FormatFloat ('0.00',
      DataSet.fieldbyname('vsego').AsFloat , FormatSettings);
    XMLDeclarContent.DECLARBODY.R03G9 := FormatFloat ('0.00',
      DataSet.fieldbyname('vsego').AsFloat*
      DataSet.fieldbyname('NALOG_NDS').AsFloat , FormatSettings);

  }
end;

procedure TfrmRepPribylPrilogEdnal.FillFirstPart(XMLDeclarContent:IXMLDeclarContent; dsNNakl: TDataSet);
begin
  WriteNode(XMLDeclarContent.DECLARBODY.T11RXXXXG2S,
    'T11RXXXXG2S',
    FormatNodeString,
    dsNNakl.FieldByName('FULLNAME'));
  WriteNode(XMLDeclarContent.DECLARBODY.T11RXXXXG3,
    'T11RXXXXG3',
    FormatNodeString,
    dsNNakl.FieldByName('OKPO'));
  WriteNode(XMLDeclarContent.DECLARBODY.T11RXXXXG4,
    'T11RXXXXG4',
    FormatNodeFloat,
    dsNNakl.FieldByName('VSEGO'));
end;

procedure TfrmRepPribylPrilogEdnal.FillSecondPart(XMLDeclarContent:IXMLDeclarContent; dsNNakl: TDataSet);
begin
  WriteNode(XMLDeclarContent.DECLARBODY.T12RXXXXG2S,
    'T12RXXXXG2S',
    FormatNodeString,
    dsNNakl.FieldByName('FULLNAME'));
  WriteNode(XMLDeclarContent.DECLARBODY.T12RXXXXG3,
    'T12RXXXXG3',
    FormatNodeString,
    dsNNakl.FieldByName('OKPO'));
  WriteNode(XMLDeclarContent.DECLARBODY.T12RXXXXG4,
    'T12RXXXXG4',
    FormatNodeFloat,
    dsNNakl.FieldByName('VSEGO'));
end;

procedure TfrmRepPribylPrilogEdnal.FillBodyXML(XMLDeclarContent:IXMLDeclarContent; FormatSettings:TFormatSettings);
begin
  FillFirstPart(XMLDeclarContent, dsNNakl.DataSet);

  XMLDeclarContent.DECLARBODY.R011G4 :=
    FormatFloat('0.00',VarToDbl(Columnbyname(dbgFizLico.Columns,'VSEGO').Footer.SumValue),FormatSettings);

  FillSecondPart(XMLDeclarContent, dsYurLico.DataSet);

  XMLDeclarContent.DECLARBODY.R012G4 :=
    FormatFloat('0.00',VarToDbl(Columnbyname(dbgYurLico.Columns,'VSEGO').Footer.SumValue),FormatSettings);
  XMLDeclarContent.DECLARBODY.R001G4 :=
    FormatFloat('0.00',
      VarToDbl(Columnbyname(dbgYurLico.Columns,'VSEGO').Footer.SumValue)+
        VarToDbl(Columnbyname(dbgFizLico.Columns,'VSEGO').Footer.SumValue),
      FormatSettings);

  XMLDeclarContent.DECLARBODY.HZY := YearOf(setT.dateto);
  XMLDeclarContent.DECLARBODY.HTIN := GetOKPO;
  XMLDeclarContent.DECLARBODY.HZ := 1; //звитна
  case GetTip(MonthOf(setT.dateTo)) of
    2: XMLDeclarContent.DECLARBODY.H1KV := 1; //1 квартал
    3: XMLDeclarContent.DECLARBODY.HHY := 1; //полгода
    4: XMLDeclarContent.DECLARBODY.H3KV := 1; //9 мес€цев
    5: XMLDeclarContent.DECLARBODY.HY := 1; //12 мес€цев
  end;

  with XMLDeclarContent.DECLARBODY do begin
  end;

end;

//тип мес€ц, квартал, полугодие, 9 мес€цев, год
function TfrmRepPribylPrilogEdnal.GetTip(month: integer): integer;
var
  tip : integer;
begin
  tip := 1;//мес€ц
  case month of
    1..3: tip:=2;
    4..6: tip:=3;
    7..9: tip:=4;
    10..12: tip :=5;
  end;
  result := tip;
end;

function TfrmRepPribylPrilogEdnal.GetXmlFileName(dat: TDateTime; ReportPath:String=''): string;
begin
  if ReportPath = '' then begin
    ReportPath := dmdex.GetReportPath;
  end;
  Result :=
    ReportPath +
    FormatFloat('00', GetOblastKod ) +
    FormatFloat('00', GetRajonKod ) +
    FormatFloat('0000000000',strtoint(GetOKPO)) +
    'J0111901'+'100'+
    FormatFloat('0000000', 1 ) +
    FormatFloat('0', GetTip(MonthOf(dat))) +
    FormatFloat('00', ((MonthOf(dat)-1) div 3 + 1) * 3 ) +
    FormatFloat('0000', YearOf(dat))+
    FormatFloat('00',GetOblastKod ) +
    FormatFloat('00',GetRajonKod ) +
    '.xml';
end;

function TfrmRepPribylPrilogEdnal.GetOblastKod: integer;
begin
  Result :=15;//код области
end;

function TfrmRepPribylPrilogEdnal.GetRajonKod: integer;
begin
  Result :=52;//код района
end;

function TfrmRepPribylPrilogEdnal.GetOKPO: string;
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
  Result  := FGetOKPOsOKPO;
end;

procedure TfrmRepPribylPrilogEdnal.actGenerateXmlExecute(Sender: TObject);
begin
  SaveDialog.FileName := GetXmlFileName(setT.DateTo);
  if SaveDialog.Execute then begin
    try
      dmdEx.StartWaiting;
      CreateXMLFile(true, SaveDialog.FileName);
    finally
      dmdEx.StopWaiting;
    end;
  end;
end;



function TfrmRepPribylPrilogEdnal.GetXMLDocument:TXMLDocument;
var
  XMLDocument1:TXMLDocument;
begin
  XMLDocument1 := TXMLDocument.Create(self);
  XMLDocument1.Options := XMLDocument1.Options + [doNodeAutoIndent];
  XMLDocument1.Active := true;
  XMLDocument1.Encoding := 'windows-1251';
  Result := XMLDocument1;
end;

procedure TfrmRepPribylPrilogEdnal.CreateXMLFile(IsSilent:boolean; FileName:String='');
var
  XMLDeclarContent: IXMLDeclarContent;
  XMLDocument1:TXMLDocument;
  FormatSettings : TFormatSettings;
begin
  //чтобы цифры сохран€лись в xml с точкой, а не зап€той
  GetLocaleFormatSettings(GetThreadLocale,FormatSettings);
  FormatSettings.DecimalSeparator:='.';

  XMLDocument1 := GetXMLDocument;
  XMLDeclarContent := GetDECLAR(XMLDocument1);

  FillHeadXML(XMLDeclarContent, setT.DateTo);
  FillBodyXML(XMLDeclarContent, FormatSettings);
  FillFooter(XMLDeclarContent, dsNNakl.DataSet, FormatSettings);

  CleanUpXml(XMLDocument1);
  if IsSilent then begin
    XMLDocument1.SaveToFile(FileName);
  end; //if IsSilent
end;

procedure TfrmRepPribylPrilogEdnal.CloseAndOpen(cdsDataset: TClientDataSet);
begin
  cdsDataset.Close;
  ProcessSettings(cdsDataset);
  cdsDataset.Open;
end;

function TfrmRepPribylPrilogEdnal.Defaultopen: boolean;
begin
  CloseAndOpen(cdsFizLico);
  CloseAndOpen(cdsYurLico);
  Result :=true;
end;



function TfrmRepPribylPrilogEdnal.GenerateXML(id: integer): integer;
begin
  CreateXMLFile(false);
  result := 0;
end;


procedure TfrmRepPribylPrilogEdnal.cdsFizLicoCalcFields(DataSet: TDataSet);
begin
  if (DataSet.state =dsInternalCalc) then begin
    inc(nppFiz);
    DataSet.FieldByName('npp').AsInteger := nppFiz;
  end;
end;

procedure TfrmRepPribylPrilogEdnal.cdsFizLicoAfterOpen(DataSet: TDataSet);
begin
  nppFiz:=0;
end;

procedure TfrmRepPribylPrilogEdnal.cdsYurLicoAfterOpen(DataSet: TDataSet);
begin
  nppYur:=0;
end;

procedure TfrmRepPribylPrilogEdnal.cdsYurLicoCalcFields(DataSet: TDataSet);
begin
  if (DataSet.state =dsInternalCalc) then begin
    inc(nppYur);
    DataSet.FieldByName('npp').AsInteger := nppYur;
  end;
end;

end.



