unit RepNNaklXml;

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
  J1201007, UnfFilter,  // IXMLDeclarContent
  XMLHelper, PropFilerEh, PropStorageEh;

const KlientTipExport: integer = 1;
const KlientTipNeplNds: integer = 2;

type
  TFormatNode = function (XMLNode : IXMLNode;Field:TField):string;

  TfrmRepNnaklXml = class(TForm)
    dsNNaklrt: TDataSource;
    ActionList1: TActionList;
    frdRasx: TfrxDBDataset;
    sdsNaklrt: TSQLDataSet;
    dspNaklrt: TDataSetProvider;
    cdsNaklrt: TClientDataSet;
    actSettings: TAction;
    qeNNakl: TQueryExtender;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem3: TMenuItem;
    sdsNNakl: TSQLDataSet;
    dspNNakl: TDataSetProvider;
    cdsNNakl: TClientDataSet;
    dsNNakl: TDataSource;
    XMLDocument1: TXMLDocument;
    frdNNaklp: TfrxDBDataset;
    actGenerateXml: TAction;
    SaveDialog: TSaveDialog;
    UnfFilter1: TUnfFilter;
    cdsNaklrtKOLOTP: TFloatField;
    cdsNaklrtNPP: TIntegerField;
    cdsNaklrtSCHET: TIntegerField;
    cdsNaklrtTARA: TSmallintField;
    cdsNaklrtSCH: TIntegerField;
    cdsNaklrtKODCN: TIntegerField;
    cdsNaklrtCENA: TFMTBCDField;
    cdsNaklrtNDS: TFMTBCDField;
    cdsNaklrtVSEGO: TFMTBCDField;
    cdsNaklrtSUMA2: TFMTBCDField;
    cdsNaklrtSKIDKA: TFMTBCDField;
    cdsNaklrtID_TOVAR: TIntegerField;
    cdsNaklrtDAT: TSQLTimeStampField;
    cdsNaklrtFULLNAME: TStringField;
    cdsNaklrtKODVED: TFMTBCDField;
    cdsNaklrtSUMA2GRN: TFMTBCDField;
    cdsNNaklSCHET: TIntegerField;
    cdsNNaklID: TIntegerField;
    cdsNNaklID_IZG: TIntegerField;
    cdsNNaklID_ZAK: TIntegerField;
    cdsNNaklID_MANAGER: TIntegerField;
    cdsNNaklDAT: TSQLTimeStampField;
    cdsNNaklNDS: TFMTBCDField;
    cdsNNaklNAKL: TIntegerField;
    cdsNNaklKURS: TFMTBCDField;
    cdsNNaklVSEGO: TFMTBCDField;
    cdsNNaklVIDOPL: TStringField;
    cdsNNaklUSL: TStringField;
    cdsNNaklNALOG_NDS: TFMTBCDField;
    cdsNNaklTIP: TSmallintField;
    cdsNNaklBLOCKED: TSmallintField;
    cdsNNaklSIGNATURE: TStringField;
    cdsNNaklID_DOGOVOR: TIntegerField;
    cdsNNaklDAT_DOGOVORA: TSQLTimeStampField;
    cdsNNaklNOMER_DOGOVORA: TStringField;
    cdsNNaklTIP_DOGOVORA: TStringField;
    cdsNNaklTIP_CODE: TStringField;
    sdsTipNNakl: TSQLDataSet;
    dspTipNNakl: TDataSetProvider;
    cdsTipNNakl: TClientDataSet;
    dsTipNNakl: TDataSource;
    cdsNaklrtEDIZ: TStringField;
    cdsNNaklIZG: TStringField;
    cdsNNaklZAK: TStringField;
    cdsNNaklMANAGER: TStringField;
    Xml1: TMenuItem;
    PopupMenu1: TPopupMenu;
    Xml2: TMenuItem;
    rpsClientEdit: TRegPropStorageManEh;
    PropStorageEh1: TPropStorageEh;
    dbgNaklr: TDBGridEh;
    UnfFilter2: TUnfFilter;
    cdsNNaklOTOSLANO_V_GNU: TSmallintField;
    cdsNNaklPOLUCHEN_OTVET_IZ_GNU: TSmallintField;
    sdsNNaklSCHET: TIntegerField;
    sdsNNaklID: TIntegerField;
    sdsNNaklID_IZG: TIntegerField;
    sdsNNaklID_ZAK: TIntegerField;
    sdsNNaklID_MANAGER: TIntegerField;
    sdsNNaklDAT: TSQLTimeStampField;
    sdsNNaklNDS: TFMTBCDField;
    sdsNNaklNAKL: TIntegerField;
    sdsNNaklKURS: TFMTBCDField;
    sdsNNaklVSEGO: TFMTBCDField;
    sdsNNaklVIDOPL: TStringField;
    sdsNNaklUSL: TStringField;
    sdsNNaklNALOG_NDS: TFMTBCDField;
    sdsNNaklTIP: TSmallintField;
    sdsNNaklBLOCKED: TSmallintField;
    sdsNNaklSIGNATURE: TStringField;
    sdsNNaklID_DOGOVOR: TIntegerField;
    sdsNNaklOTOSLANO_V_GNU: TSmallintField;
    sdsNNaklPOLUCHEN_OTVET_IZ_GNU: TSmallintField;
    sdsNNaklDAT_DOGOVORA: TSQLTimeStampField;
    sdsNNaklNOMER_DOGOVORA: TStringField;
    sdsNNaklTIP_DOGOVORA: TStringField;
    cdsNaklrtEDIZ_KOD: TIntegerField;
    procedure FormCreate(Sender: TObject);
		procedure FormClose(Sender: TObject; var Action: TCloseAction);
		procedure actSettingsExecute(Sender: TObject);
    procedure actGenerateXmlExecute(Sender: TObject);
    procedure cdsNaklrtCalcFields(DataSet: TDataSet);
    procedure dspNNaklGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure cdsNNaklBeforeScroll(DataSet: TDataSet);
  private
    { Private declarations }
		setT : TfrmSettings;
    FGetOKPOsOKPO : string;
 		cdIzg, cdZak : TClientDetail;
    FiidTipNNakl : integer;
    //procedure ProcessSettings(cdsRasx:TClientDataSet);
    procedure FillHeadXml(XMLDeclarContent:IXMLDeclarContent; dat: TDateTime);
    procedure FillBodyXML(XMLDeclarContent:IXMLDeclarContent; dsNNakl: TDataSet);
    procedure FillFooter(XMLDeclarContent: IXMLDeclarContent;  DataSet :TDataSet;
      FormatSettings:TFormatSettings);

    function GetXmlFileName(dat: TDateTime; ReportPath:String=''):string;
    function GetOblastKod :integer;
    function GetRajonKod: integer;
    function GetOKPO : string;
    function GetNumDocZaPeriod: integer;
    procedure CleanUpXml(var XMLDocument1 : TXMLDocument);
    procedure FillTovar(XMLDeclarContent: IXMLDeclarContent; dsTovar: TDataSet);
    procedure CreateXMLFile(IsSilent:boolean; FolderName:String='');
    //function  CheckIPN(DataSet :TDataSet):boolean;
    procedure TestGetStringListFromSqlRecord;
    function GetOrigUProdTipPrichiny: string;
    function GetOriginalOstaetsyUProdavtsa: integer;
    function GetXMLDocument:TXMLDocument;
    procedure ProcessSettings(cdsRasx:TClientDataSet);
    function FillSettings():TfrmSettings;
	public
    procedure Test;
    function Defaultopen: boolean;
    function GenerateXML(id: integer): integer;

		{ Public declarations }
	end;

var
	frmRepNnaklXml: TfrmRepNnaklXml;

implementation


{$R *.dfm}
uses
  DesignReport, //ProcessReportDesigner
  untRound, //ColumnByName
  StrUtils //AnsiReplaceStr
  ;

procedure TfrmRepNnaklXml.FormClose(Sender: TObject;
	var Action: TCloseAction);
begin
  PostAndApplyOrCancel(dsNNakl.Dataset);
	Action := caFree;
end;

procedure TfrmRepNnaklXml.FormCreate(Sender: TObject);
begin
  setT := FillSettings;

  dmdEx.OpenQuery(cdsTipNNakl);

  qeNNakl.DefSql := sdsNNakl.CommandText;

  FiidTipNNakl:=dmdEx.GetOidObjects('��� ��������� ���������',-100);
  FiidTipNNakl :=  dmdEx.GetOidObjects('���������',FiidTipNNakl);
end;

function TfrmRepNnaklXml.FillSettings():TfrmSettings;
var
  setTLocal : TfrmSettings;
  SettingsVlad : TfmSettingsPlugin;
  SettingsTipDetail : TfmSettingsPlugin;
begin
	setTLocal := TfrmSettings.Create(Self);
	setTLocal.actManagerOff.Execute;
  //������� �����
  setTLocal.SetPeriod(1);

  SettingsVlad := setTLocal.CreatePlugin('TfmSettingsVlad');
  setTLocal.addplugin(SettingsVlad);
  SettingsVlad.setresulttype(1);
  SettingsVlad.SetKeyValue(dmdEx.GetDefaultVlad);

  SettingsTipDetail := setTLocal.CreatePlugin('TfmSettingsTipDetail');
  setTLocal.addplugin(SettingsTipDetail);
  SettingsTipDetail.AddDetailTip('�� ��� �����');
  SettingsTipDetail.AddDetailTip('�� ���');
  SettingsTipDetail.AddDetailTip('��� ���� ���������');
  SettingsTipDetail.SetKeyValue(0);
  Result := setTLocal;
end;


procedure TfrmRepNnaklXml.actSettingsExecute(Sender: TObject);
begin
  actSettings.checked := setT.ProcessSettingsChange2(DefaultOpen);
end;


procedure TfrmRepNnaklXml.ProcessSettings(cdsRasx:TClientDataSet);
begin
  cdsRasx.Close;

  qeNNakl.SetSQL('where','om.id_izg=' + setT.GetPluginResult('fmSettingsVlad'), 0);
  qeNNakl.SetSQL('where','om.dat>=' + QuotedStr(DateToStr(setT.DateFrom)), 1);
  qeNNakl.SetSQL('where','om.dat<=' + QuotedStr(DateToStr(setT.DateTo)), 2);
  case strtoint(setT.GetPluginResult('fmSettingsTipDetail')) of
    0 : begin
      qeNNakl.SetSQL('where',
        'om.tip=' + inttostr(FiidTipNNakl) + ' and (om.nds>=60000 or exists ' +
        '( select * from tovar t inner join naklrast ot on ot.id_tovar=t.oid ' +
        'where ot.schet=om.schet and t.kodved>0 ))' ,3);
    end;
    1: begin
      qeNNakl.SetSQL('where','om.tip=' + inttostr(FiidTipNNakl), 3);
    end;
    2: begin
      qeNNakl.SetSQL('where', '', 3);
    end;
  end;
  qeNNakl.Refresh();
  cdsRasx.First;

  self.Caption :='����� ��� �����: '
    + ' c ' + datetostr (setT.DateFrom)
    + ' �� '+ datetostr(setT.DateTo);
end;

procedure TfrmRepNnaklXml.FillHeadXml(XMLDeclarContent:IXMLDeclarContent; dat: TDateTime);
begin
  //� tin ����� ������
  with XMLDeclarContent.DECLARHEAD do begin
    TIN:=GetOKPO;
    C_DOC:='J12';
    C_DOC_SUB:='010';
    C_DOC_VER:='7';//
    C_DOC_TYPE:=0;//��� ���������. 0-��������
    C_DOC_CNT := GetNumDocZaPeriod; //����� ��������� �� ������ = ������ ���������
    C_REG:=GetOblastKod;//15;//��� �������
    C_RAJ :=GetRajonKod;//52;//��� ������
    PERIOD_MONTH := MonthOf(dat);//�����
    PERIOD_TYPE:=1; //��� �����
    PERIOD_YEAR:=YearOf(dat);
    C_STI_ORIG := GetOblastKod + GetRajonKod;
    C_DOC_STAN := 1;//�������� ��������
    D_FILL:=FormatDateTime('ddmmyyyy',Today);//���� ����������
  end;
end;

procedure TfrmRepNnaklXml.CleanUpXml(var XMLDocument1 : TXMLDocument);
begin
  XMLDocument1.XML.Text := AnsiReplaceStr(XMLDocument1.XML.Text,'<DECLAR>',
    '<DECLAR xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" '+
    'xsi:noNamespaceSchemaLocation="J1201004.xsd">'
    );
  XMLDocument1.XML.Text := AnsiReplaceStr(XMLDocument1.XML.Text,'</D_FILL>',
    '</D_FILL><LINKED_DOCS xsi:nil="true"/>'
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

procedure TfrmRepNnaklXml.FillTovar(XMLDeclarContent: IXMLDeclarContent; dsTovar :TDataSet);
begin
  WriteNode(XMLDeclarContent.DECLARBODY.RXXXXG2D,
    'RXXXXG2D',
    FormatNodeDateTime,
    dsTovar.FieldByName('DAT'));
  WriteNode(XMLDeclarContent.DECLARBODY.RXXXXG3S,
    'RXXXXG3S',
    FormatNodeString,
    dsTovar.FieldByName('FULLNAME'));
  WriteNode(XMLDeclarContent.DECLARBODY.RXXXXG4,
    'RXXXXG4',
    FormatNodeString,
    dsTovar.FieldByName('KODVED'));
  WriteNode(XMLDeclarContent.DECLARBODY.RXXXXG4S,
    'RXXXXG4S',
    FormatNodeString,
    dsTovar.FieldByName('EDIZ'));
  WriteNode(XMLDeclarContent.DECLARBODY.RXXXXG105_2S,
    'RXXXXG105_2S',
    FormatInteger4Digits,
    dsTovar.FieldByName('EDIZ_KOD'));
  WriteNode(XMLDeclarContent.DECLARBODY.RXXXXG5,
    'RXXXXG5',
    FormatNodeFloat3Digits,
    dsTovar.FieldByName('kolotp'));
  WriteNode(XMLDeclarContent.DECLARBODY.RXXXXG6,
    'RXXXXG6',
    FormatNodeFloat,
    dsTovar.FieldByName('cena'));
  WriteNode(XMLDeclarContent.DECLARBODY.RXXXXG7,
    'RXXXXG7',
    FormatNodeFloat,
    dsTovar.FieldByName('SUMA2GRN'));
end;

procedure TfrmRepNnaklXml.FillFooter(XMLDeclarContent: IXMLDeclarContent; DataSet :TDataSet;
  FormatSettings:TFormatSettings);
begin
  if DataSet.FieldByName('tip').AsInteger = -32 then begin
    //���������� � �.�.
    XMLDeclarContent.DECLARBODY.r01g7 := FormatFloat ('0.00', 0 , FormatSettings);
    XMLDeclarContent.DECLARBODY.R03G7 := FormatFloat ('0.00', 0 , FormatSettings);
    XMLDeclarContent.DECLARBODY.R04G7 := FormatFloat ('0.00', 0 , FormatSettings);

    XMLDeclarContent.DECLARBODY.R01G9 := FormatFloat ('0.00',
      DataSet.fieldbyname('vsego').AsFloat , FormatSettings);
    XMLDeclarContent.DECLARBODY.R03G109 := FormatFloat ('0.00',
      DataSet.fieldbyname('vsego').AsFloat*
      DataSet.fieldbyname('NALOG_NDS').AsFloat , FormatSettings);
    XMLDeclarContent.DECLARBODY.R04G9 := FormatFloat ('0.00',
      DataSet.fieldbyname('nds').AsFloat , FormatSettings);
  end else begin
    XMLDeclarContent.DECLARBODY.r01g7 := FormatFloat ('0.00',
      DataSet.fieldbyname('vsego').AsFloat , FormatSettings);
    XMLDeclarContent.DECLARBODY.R03G7 := FormatFloat (
      '0.00', DataSet.fieldbyname('vsego').AsFloat*
        DataSet.fieldbyname('NALOG_NDS').AsFloat,
      FormatSettings);
    XMLDeclarContent.DECLARBODY.R04G7 := FormatFloat ('0.00',
      DataSet.fieldbyname('nds').AsFloat , FormatSettings);
  end;

  XMLDeclarContent.DECLARBODY.R01G11 := FormatFloat ('0.00',
    DataSet.fieldbyname('vsego').AsFloat , FormatSettings);
  XMLDeclarContent.DECLARBODY.R03G11 := FormatFloat (
      '0.00', DataSet.fieldbyname('vsego').AsFloat*
        DataSet.fieldbyname('NALOG_NDS').AsFloat,
      FormatSettings);
  XMLDeclarContent.DECLARBODY.R04G11 := FormatFloat (
      '0.00', DataSet.fieldbyname('nds').AsFloat, FormatSettings);
  XMLDeclarContent.DECLARBODY.R02G11 := FormatFloat ('0.00', 0 , FormatSettings);
  XMLDeclarContent.DECLARBODY.H10G1S := DataSet.fieldbyname('SIGNATURE').AsString;
end;

function TfrmRepNnaklXml.GetOriginalOstaetsyUProdavtsa: integer;
begin
  result := 0;
  if (cdZAK.lgoty = KlientTipNeplNds) or (cdZAK.lgoty = KlientTipExport) then begin
      result := 1;
  end;
end;

function TfrmRepNnaklXml.GetOrigUProdTipPrichiny: string;
begin
  result := '';
  if trim(cdsNNakl.fieldByName('tip_code').AsString)<>'00' then begin
    result := trim(cdsNNakl.fieldByName('tip_code').AsString);
  end;
end;

procedure TfrmRepNnaklXml.FillBodyXML(XMLDeclarContent:IXMLDeclarContent; dsNNakl: TDataSet);
begin
  with XMLDeclarContent.DECLARBODY do begin
    HORIG1 := 1; //�������� ��������� �������
    HORIG1 := GetOriginalOstaetsyUProdavtsa;//0. �������� ������� � ��������
    HTYPR := GetOrigUProdTipPrichiny;
    HFILL := FormatDateTime('ddmmyyyy',dsNNakl.FieldByName('dat').AsDateTime);
    HNUM := dsNNakl.FieldByName('id').AsInteger;

    HNAMESEL := cdIzg.fullname;
    HNAMEBUY := cdZak.fullname;
    HKSEL := cdIzg.ipn;
    HKBUY := cdZak.ipn;
    HLOCSEL := cdIzg.adrp;
    HLOCBUY := cdZak.adrp;
    HTELSEL := cdIzg.tel;
    HTELBUY := cdZak.tel;

    H01G1S := cdsNnakl.FieldByName('tip_dogovora').AsString;
    H01G2D := FormatDateTime('ddmmyyyy', dsNNakl.FieldByName('dat_dogovora').AsDateTime);
    H01G3S := cdsNnakl.FieldByName('nomer_dogovora').AsString;
    H02G1S := cdsNnakl.FieldByName('VIDOPL').AsString;
  end;
end;

procedure TfrmRepNnaklXml.Test;
begin
try
  TestGetStringListFromSqlRecord;
except
  AssertInternal('73DD1396-5DBC-45A7-B9AC-FAF6E9B2C6C5');
end;
end;

procedure TfrmRepNnaklXml.TestGetStringListFromSqlRecord;
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

function TfrmRepNnaklXml.GetXmlFileName(dat: TDateTime; ReportPath:String=''): string;
begin
  if ReportPath = '' then begin
    ReportPath := dmdex.GetReportPath;
  end;
  Result :=
    ReportPath +
    FormatFloat('00', GetOblastKod ) +
    FormatFloat('00', GetRajonKod ) +
    FormatFloat('0000000000',strtoint(GetOKPO)) +
    'J1201007'+'100'+
    FormatFloat('0000000', GetNumDocZaPeriod ) +
    '1' +
    FormatFloat('00', MonthOf(dat))+
    FormatFloat('0000', YearOf(dat))+
    FormatFloat('00',GetOblastKod ) +
    FormatFloat('00',GetRajonKod ) +
    '.xml';
end;

function TfrmRepNnaklXml.GetOblastKod: integer;
begin
  Result :=15;//��� �������
end;

function TfrmRepNnaklXml.GetRajonKod: integer;
begin
  Result :=52;//��� ������
end;

function TfrmRepNnaklXml.GetOKPO: string;
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

function TfrmRepNnaklXml.GetNumDocZaPeriod: integer;
begin
  Result := cdsNNakl.FieldByName('id').AsInteger; //����� ��������� �� ������
end;

procedure PrintToXml (dbgNaklot: TDBGridEh;param:variant;Object1:Pointer=nil );
var
  frmRepNNaklXml : TfrmRepNNaklXml;
  FolderName : String;
begin
  FolderName := String(param);
  frmRepNNaklXml := TfrmRepNNaklXml(Object1);
  frmRepNNaklXml.CreateXMLFile(true, FolderName);
end;

procedure TfrmRepNnaklXml.actGenerateXmlExecute(Sender: TObject);
var
  FolderName : String;
begin
  SaveDialog.FileName := GetXmlFileName(dsNNakl.DataSet.FieldByName('dat').AsDateTime);
  if SaveDialog.Execute then begin
    FolderName := ExtractFilePath(SaveDialog.FileName);
    try
      dmdEx.StartWaiting;
      dmdEx.ColumnSelectAndProcess(dbgNaklr,FolderName,PrintToXml,self);
    finally
      dmdEx.StopWaiting;
    end;
  end;
  //CreateXMLFile;
end;



function TfrmRepNnaklXml.GetXMLDocument:TXMLDocument;
var
  XMLDocument1:TXMLDocument;
begin
  XMLDocument1 := TXMLDocument.Create(self);
  XMLDocument1.Options := XMLDocument1.Options + [doNodeAutoIndent];
  XMLDocument1.Active := true;
  XMLDocument1.Encoding := 'windows-1251';
  Result := XMLDocument1;
end;

procedure TfrmRepNnaklXml.CreateXMLFile(IsSilent:boolean; FolderName:String='');
var
  XMLDeclarContent: IXMLDeclarContent;
  XMLDocument1:TXMLDocument;
  FormatSettings : TFormatSettings;
begin
  cdIzg :=  dmdEx.GetClientDetail(cdsNNakl.FieldByName('id_izg').asInteger);
  cdZak :=  dmdEx.GetClientDetail(cdsNNakl.FieldByName('id_zak').asInteger);

  //����� ����� ����������� � xml � ������, � �� �������
  GetLocaleFormatSettings(GetThreadLocale,FormatSettings);
  FormatSettings.DecimalSeparator:='.';

  XMLDocument1 := GetXMLDocument;
  XMLDeclarContent := GetDECLAR(XMLDocument1);

  FillHeadXML(XMLDeclarContent, dsNNakl.DataSet.FieldByName('dat').AsDateTime);
  FillBodyXML(XMLDeclarContent, dsNNakl.DataSet);
  FillTovar(XMLDeclarContent, dsNNaklrt.dataset);
  FillFooter(XMLDeclarContent, dsNNakl.DataSet, FormatSettings);

  CleanUpXml(XMLDocument1);
  if IsSilent then begin
    XMLDocument1.SaveToFile(GetXmlFileName(dsNNakl.DataSet.FieldByName('dat').AsDateTime, FolderName));
  end else begin //if IsSilent
    SaveDialog.FileName := GetXmlFileName(dsNNakl.DataSet.FieldByName('dat').AsDateTime);
    if SaveDialog.Execute then begin
      XMLDocument1.SaveToFile(SaveDialog.FileName);
    end;
  end; //if IsSilent

end;

{
function  TfrmRepNnaklXml.CheckIPN(DataSet :TDataSet):boolean;
begin
//������� �����
  Result := true;
  dataset.first;
  while not dataset.eof do begin
    if ((Length(dataset.FieldByName('f5_ipn').asString)<4) and
      (dataset.FieldByName('f5_ipn').asString<>'X'))
    then begin
      showmessage ('��� ����� '+
        dataset.FieldByName('F4_zak').asstring+
        ' �� ������ ��� � ����������� ��������');
      Result := false;
      exit;
    end;
    dataset.next;
  end;

end;
}

function TfrmRepNnaklXml.Defaultopen: boolean;
begin
  cdsNNakl.Close;
  ProcessSettings(cdsNNakl);
  qeNNakl.Refresh;
  dmdEx.OpenQuery(cdsNaklrt);
  Result :=true;
end;

procedure TfrmRepNnaklXml.cdsNaklrtCalcFields(DataSet: TDataSet);
var
  curKurs : currency;
  curSuma2Grn : currency;
begin

  if (DataSet.fieldByName('TARA').AsInteger=2) then begin
    curKurs := dsNNakl.DataSet.fieldByName('KURS').asFloat;
  end else begin
    curKurs := 1;
  end;
  If (DataSet.FieldByName('CENA').AsFloat>0) then begin
    curSuma2Grn :=
      RRoundTo(
        RRoundTo(
          DataSet.fieldByName('CENA').AsFloat*curKurs,-2
        ) * DataSet.fieldbyname('KOLOTP').asfloat,
        -2
      );
  end else begin //if
    if DataSet.FindField('SUMA2')<>nil then begin
      curSuma2Grn :=RRoundTo(
        DataSet.fieldbyname('SUMA2').asfloat*curKurs,
        -2
      );
    end else begin
      //��� ������ ���� � ������
      curSuma2Grn :=0;
    end;//if <>nil
  end; //if

  DataSet.FieldByName('SUMA2GRN').AsFloat:= curSuma2Grn;
end;

function TfrmRepNnaklXml.GenerateXML(id: integer): integer;
begin
  dmdEx.CloseQuery(cdsNNakl);
  qeNNakl.SetSQL('where',
    'om.schet=' + inttostr(id),
    0);
  qeNNakl.Refresh;
  //cdsNNakl.Params.ParamByName('id_schet').asInteger := id;
  dmdEx.OpenQuery(cdsNNakl);
  dmdEx.OpenQuery(cdsNaklrt);

  CreateXMLFile(false);
  result := 0;
end;


procedure TfrmRepNnaklXml.dspNNaklGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
  TableName := 'NAKLRAS';
end;

procedure TfrmRepNnaklXml.cdsNNaklBeforeScroll(DataSet: TDataSet);
begin
  ApplyOrCancel(DataSet);
end;

end.


