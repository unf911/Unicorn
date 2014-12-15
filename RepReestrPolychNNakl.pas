unit RepReestrPolychNNakl;

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
  untEx,
  DateUtils,
  ATSAssert,
  untSkladRasxDetEx,
	DBCtrls, 
  SettingsPlugin, //TfmSettingsPlugin
  untSettings,
  J1201508, //J1201508 IXMLDeclarContent
  XmlHelper //WriteNode
  ;

type
  TfrmRepReestrPolychNNakl = class(TForm)
    dsRasx: TDataSource;
    ActionList1: TActionList;
    frdNnaklp: TfrxDBDataset;
    dbgRasx: TDBGridEh;
    sdsRasx: TSQLDataSet;
    dspRasx: TDataSetProvider;
    cdsRasx: TClientDataSet;
    BitBtn5: TBitBtn;
    actSettings: TAction;
    qeRasx: TQueryExtender;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem3: TMenuItem;
    actRefresh: TAction;
    actBrowse: TAction;
    frRasx: TfrxReport;
    cdsRasxF1_NPP: TIntegerField;
    cdsRasxF2_DAT: TSQLTimeStampField;
    cdsRasxF3_DAT_VYPISKI: TSQLTimeStampField;
    cdsRasxF4_ID: TStringField;
    cdsRasxF5_VIDDOC: TStringField;
    cdsRasxF53_VIDDOC: TStringField;
    cdsRasxF6_IZG: TStringField;
    cdsRasxF7_IPN: TStringField;
    cdsRasxF8_SUMWITHNDS: TFMTBCDField;
    cdsRasxF9_BAZANDS: TFMTBCDField;
    cdsRasxF10_NDS: TFMTBCDField;
    cdsRasxF11: TFMTBCDField;
    cdsRasxF12_NDS: TFMTBCDField;
    cdsRasxF13_BAZANDS: TFMTBCDField;
    cdsRasxF14_NDS: TFMTBCDField;
    cdsRasxF15: TFMTBCDField;
    cdsRasxF16_NDS: TFMTBCDField;
    cdsRasxTIP: TIntegerField;
    procedure FormCreate(Sender: TObject);
		procedure FormClose(Sender: TObject; var Action: TCloseAction);
		procedure actSettingsExecute(Sender: TObject);
    procedure frRasxGetValue(const VarName: String; var Value: Variant);
    procedure actBrowseExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
  private
    { Private declarations } 
    SettingsVlad : TfmSettingsPlugin ;
    KlientDetail : TStringList;
    function GetKlientDetail():TStringList;

    procedure FillNNaklp(XMLDeclarContent: IXMLDeclarContent; cdsRasx :TDataSet);
    procedure FillBodyXML(XMLDeclarContent:IXMLDeclarContent);
    procedure FillNNaklpFooter(XMLDeclarContent: IXMLDeclarContent; dbgRep: TDBGridEh;
      FormatSettings: TFormatSettings);
	public
    setT : TfrmSettings;
		{ Public declarations }
    procedure FillXMLContent(XMLDeclarContent:IXMLDeclarContent);
    procedure ProcessSettings;
    function Defaultopen: boolean;    
	end;

var
	frmRepReestrPolychNNakl: TfrmRepReestrPolychNNakl;

implementation

uses
  DesignReport, //ProcessReportDesigner
  untRound //GetStringListFromSqlRecord
  ;
{$R *.dfm}

procedure TfrmRepReestrPolychNNakl.FormClose(Sender: TObject;
	var Action: TCloseAction);
begin
  KlientDetail.free;
	Action := caFree;
end;

procedure TfrmRepReestrPolychNNakl.FormCreate(Sender: TObject);
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
	//actSettings.Execute;
  ProcessReportDesigner(ActionList1,MainMenu1,frRasx);
	//if not actSettings.Checked then begin
	//	self.Close;
	//end;
end;


procedure TfrmRepReestrPolychNNakl.actSettingsExecute(Sender: TObject);
begin
  actSettings.checked := setT.ProcessSettingsChange2(DefaultOpen);
end;

procedure TfrmRepReestrPolychNNakl.ProcessSettings;
begin
  actSettings.Checked := true;

  cdsRasx.Params.ParamByName('id_zak').asInteger := strtoint(setT.GetPluginResult('fmSettingsVlad'));;
  cdsRasx.Params.ParamByName('date_from').asDate := setT.DateFrom;
  cdsRasx.Params.ParamByName('date_to').asDate := setT.DateTo;

  dmdEx.GetReport('ReestrPolychNNakl.fr3',frRasx);
end;

function TfrmRepReestrPolychNNakl.Defaultopen: boolean;
begin
  cdsRasx.Close;
  ProcessSettings;
  qeRasx.Refresh;
  Result :=true;
  frRasx.PrepareReport;
  frRasx.ShowPreparedReport;  
end;

function TfrmRepReestrPolychNNakl.GetKlientDetail():TStringList;
begin
  if (not (Assigned(KlientDetail))) then begin
    KlientDetail := TStringList.Create;
    GetStringListFromSqlRecord('select k.fullname,k.tel, k.ipn, k.svreg,k.adrp,k.name from klient_all_vw k '+
      'where k.id='+ setT.GetPluginResult('fmSettingsVlad'), dmdEx.cdsTemp,KlientDetail);
  end;
  result := KlientDetail;
end;

procedure TfrmRepReestrPolychNNakl.frRasxGetValue(const VarName: String;
  var Value: Variant);
begin
  if AnsiUpperCase(VarName)='FULLNAME' then begin
    Value := GetKlientDetail.Values['FULLNAME'];
  end;
  if AnsiUpperCase(VarName)='IPN' then begin
    Value := GetKlientDetail.Values['IPN'];
  end;
  if AnsiUpperCase(VarName)='SVREG' then begin
    Value := GetKlientDetail.Values['SVREG'];
  end;
  if AnsiUpperCase(VarName)='ADRP' then begin
    Value := GetKlientDetail.Values['ADRP'];
  end;
  if AnsiUpperCase(VarName)='ADRP' then begin
    Value := GetKlientDetail.Values['ADRP'];
  end;
  if AnsiUpperCase(VarName)='MONTH_OF_REESTR' then begin
    Value := MonthOf(setT.DateFrom);
  end;
  if AnsiUpperCase(VarName)='YEAR_OF_REESTR' then begin
    Value := YearOf(setT.datefrom);
  end;
  if AnsiUpperCase(VarName)='REESTR_FROM_DAT' then begin
    Value := FormatDateTime('dd.mm.yyyy',setT.DateFrom);//реестр от;
  end;
  if AnsiUpperCase(VarName)='REESTR_TO_DAT' then begin
    Value := FormatDateTime('dd.mm.yyyy',setT.DateTo); //реестр до;
  end;
end;

procedure TfrmRepReestrPolychNNakl.FillBodyXML(XMLDeclarContent:IXMLDeclarContent);
//var
  //StringList : TstringList;
begin
  //StringList := TStringList.Create;
  //GetStringListFromSqlRecord('select k.fullname,k.tel, k.ipn, k.svreg,k.adrp,k.name from klient_all_vw k '+
  //  'where k.id='+ setT.GetPluginResult('fmSettingsVlad'), dmdEx.cdsTemp,stringList);

  //подається до декларації з податку на додану вартість. Звітної
  XMLDeclarContent.DECLARBODY.HZ := 1;
  //подається до декларації з податку на додану вартість. Номер порції реєстру
  XMLDeclarContent.DECLARBODY.HNP := 1;
  XMLDeclarContent.DECLARBODY.HZY:=YearOf(setT.datefrom);//;
  XMLDeclarContent.DECLARBODY.HZM := MonthOf(setT.DateFrom);
  XMLDeclarContent.DECLARBODY.ChildNodes['HNAME'].NodeValue := ShortString(GetKlientDetail.Values['FULLNAME']);
  XMLDeclarContent.DECLARBODY.ChildNodes['HLOC'].NodeValue :=ShortString	(GetKlientDetail.Values['ADRP']);
  XMLDeclarContent.DECLARBODY.HNPDV := GetKlientDetail.values['IPN'];  //налоговый номер 11 знаков ипн
  //XMLDeclarContent.DECLARBODY.HNSPDV := StrToInt(GetKlientDetail.values['SVREG']); //8 знаков свидетельство
  //XMLDeclarContent.DECLARBODY.H01G01D := FormatDateTime('ddmmyyyy',setT.DateFrom);//реестр от
  //  XMLDeclarContent.DECLARBODY.H02G01D := FormatDateTime('ddmmyyyy',setT.DateTo); //реестр до
  //stringList.Free;
end;


procedure TfrmRepReestrPolychNNakl.FillNNaklp(XMLDeclarContent: IXMLDeclarContent;
  cdsRasx :TDataSet);
begin
  WriteNode(XMLDeclarContent.DECLARBODY.T2RXXXXG1,
    'T2RXXXXG1',
    FormatInteger,
    cdsRasx.FieldByName('F1_NPP'));
  WriteNode(XMLDeclarContent.DECLARBODY.T2RXXXXG2D,
    'T2RXXXXG2D',
    FormatNodeDateTime,
    cdsRasx.FieldByName('F2_DAT'));
  WriteNode(XMLDeclarContent.DECLARBODY.T2RXXXXG3D,
    'T2RXXXXG3D',
    FormatNodeDateTime,
    cdsRasx.FieldByName('F3_DAT_VYPISKI'));
  WriteNode(XMLDeclarContent.DECLARBODY.T2RXXXXG4S,
    'T2RXXXXG4S',
    FormatNodeString,
    cdsRasx.FieldByName('F4_ID'));
  WriteNode(XMLDeclarContent.DECLARBODY.T2RXXXXG51S,
    'T2RXXXXG51S',
    FormatNodeString,
    cdsRasx.FieldByName('F5_VIDDOC'));
  WriteNode(XMLDeclarContent.DECLARBODY.T2RXXXXG53S,
    'T2RXXXXG53S',
    FormatNodeString,
    cdsRasx.FieldByName('F53_VIDDOC'));
  WriteNode(XMLDeclarContent.DECLARBODY.T2RXXXXG6S,
    'T2RXXXXG6S',
    FormatNodeString,
    cdsRasx.FieldByName('F6_IZG'));
  WriteNode(XMLDeclarContent.DECLARBODY.T2RXXXXG7,
    'T2RXXXXG7',
    FormatNodeStringIpn,
    cdsRasx.FieldByName('F7_IPN'));
  WriteNode(XMLDeclarContent.DECLARBODY.T2RXXXXG8,
    'T2RXXXXG8',
    FormatNodeFloat,
    cdsRasx.FieldByName('F8_SUMWITHNDS'));
  WriteNode(XMLDeclarContent.DECLARBODY.T2RXXXXG9,
    'T2RXXXXG9',
    FormatNodeFloat,
    cdsRasx.FieldByName('F9_BAZANDS'));
  WriteNode(XMLDeclarContent.DECLARBODY.T2RXXXXG10,
    'T2RXXXXG10',
    FormatNodeFloat,
    cdsRasx.FieldByName('F10_NDS'));
  WriteNode(XMLDeclarContent.DECLARBODY.T2RXXXXG11,
    'T2RXXXXG11',
    FormatNodeFloat,
    cdsRasx.FieldByName('F11'));
  WriteNode(XMLDeclarContent.DECLARBODY.T2RXXXXG12,
    'T2RXXXXG12',
    FormatNodeFloat,
    cdsRasx.FieldByName('F12_NDS'));
  WriteNode(XMLDeclarContent.DECLARBODY.T2RXXXXG13,
    'T2RXXXXG13',
    FormatNodeFloat,
    cdsRasx.FieldByName('F13_BAZANDS'));
   WriteNode(XMLDeclarContent.DECLARBODY.T2RXXXXG14,
    'T2RXXXXG14',
    FormatNodeFloat,
    cdsRasx.FieldByName('F14_NDS'));
   WriteNode(XMLDeclarContent.DECLARBODY.T2RXXXXG15,
    'T2RXXXXG15',
    FormatNodeFloat,
    cdsRasx.FieldByName('F15'));
   WriteNode(XMLDeclarContent.DECLARBODY.T2RXXXXG16,
    'T2RXXXXG16',
    FormatNodeFloat,
    cdsRasx.FieldByName('F16_NDS'));
{
  WriteNode(XMLDeclarContent.DECLARBODY.T1RXXXXG7,
    'T1RXXXXG7',
    FormatNodeFloat,
    cdsRasx.FieldByName('F7_NDS'));
  WriteNode(XMLDeclarContent.DECLARBODY.T1RXXXXG8,
    'T1RXXXXG8',
    FormatNodeFloat,
    cdsRasx.FieldByName('F8_NDS'));
  WriteNode(XMLDeclarContent.DECLARBODY.T1RXXXXG9,
    'T1RXXXXG9',
    FormatNodeFloatZero,
    cdsRasx.FieldByName('F8_NDS'));
  WriteNode(XMLDeclarContent.DECLARBODY.T1RXXXXG10,
    'T1RXXXXG10',
    FormatNodeFloatZero,
    cdsRasx.FieldByName('F8_NDS'));
  WriteNode(XMLDeclarContent.DECLARBODY.T1RXXXXG11,
    'T1RXXXXG11',
    FormatNodeFloat,
    cdsRasx.FieldByName('f11'));
  WriteNode(XMLDeclarContent.DECLARBODY.T1RXXXXG12,
    'T1RXXXXG12',
    FormatNodeFloat,
    cdsRasx.FieldByName('f12'));
  WriteNode(XMLDeclarContent.DECLARBODY.T1RXXXXG13,
    'T1RXXXXG13',
    FormatNodeFloatZero,
    cdsRasx.FieldByName('f12'));
  WriteNode(XMLDeclarContent.DECLARBODY.T1RXXXXG14,
    'T1RXXXXG14',
    FormatNodeFloatZero,
    cdsRasx.FieldByName('f12'));
}    
end;


procedure TfrmRepReestrPolychNNakl.FillNNaklpFooter(
  XMLDeclarContent: IXMLDeclarContent; dbgRep: TDBGridEh;
  FormatSettings: TFormatSettings);
begin
  XMLDeclarContent.DECLARBODY.R021G8 :=
    FormatFloat('0.00',VarToDbl(Columnbyname(dbgRasx.Columns,'F8_SUMWITHNDS').Footer.SumValue),FormatSettings);
  XMLDeclarContent.DECLARBODY.R021G9 :=
    FormatFloat('0.00',VarToDbl(Columnbyname(dbgRasx.Columns,'F9_BAZANDS').Footer.SumValue),FormatSettings);
  XMLDeclarContent.DECLARBODY.R021G10 :=
    FormatFloat('0.00',VarToDbl(Columnbyname(dbgRasx.Columns,'F10_NDS').Footer.SumValue),FormatSettings);
  XMLDeclarContent.DECLARBODY.R021G11 :=
    FormatFloat('0.00',VarToDbl(Columnbyname(dbgRasx.Columns,'F11').Footer.SumValue),FormatSettings); 
  XMLDeclarContent.DECLARBODY.r021g12 :=
    FormatFloat('0.00',VarToDbl(Columnbyname(dbgRasx.Columns,'F12_NDS').Footer.SumValue),FormatSettings);
  XMLDeclarContent.DECLARBODY.r021g13 :=
    FormatFloat('0.00',VarToDbl(Columnbyname(dbgRasx.Columns,'F13_BAZANDS').Footer.SumValue),FormatSettings);
  XMLDeclarContent.DECLARBODY.R021G14 :=
    FormatFloat('0.00',VarToDbl(Columnbyname(dbgRasx.Columns,'F14_NDS').Footer.SumValue),FormatSettings);
  XMLDeclarContent.DECLARBODY.R021G15 :=
    FormatFloat('0.00',VarToDbl(Columnbyname(dbgRasx.Columns,'F15').Footer.SumValue),FormatSettings);
  XMLDeclarContent.DECLARBODY.R021G16 :=
    FormatFloat('0.00',VarToDbl(Columnbyname(dbgRasx.Columns,'F16_NDS').Footer.SumValue),FormatSettings);

end;

procedure TfrmRepReestrPolychNNakl.FillXMLContent(
  XMLDeclarContent: IXMLDeclarContent);
var
  FormatSettings : TFormatSettings;
begin
  //чтобы цифры сохранялись в xml с точкой, а не запятой
  GetLocaleFormatSettings(GetThreadLocale,FormatSettings);
  FormatSettings.DecimalSeparator:='.';

  FillBodyXML(XMLDeclarContent);
  //полученные накладные от поставщиков
  ProcessSettings;
  cdsRasx.First;
  while not cdsRasx.eof do begin
    FillNNaklp(XMLDeclarContent,cdsRasx);
    cdsRasx.Next;
  end;//while not eof
  FillNNaklpFooter(XMLDeclarContent,dbgRasx,FormatSettings);
end;

procedure TfrmRepReestrPolychNNakl.actBrowseExecute(Sender: TObject);
begin
  actSettings.Execute;

end;

procedure TfrmRepReestrPolychNNakl.actRefreshExecute(Sender: TObject);
begin
  cdsRasx.Close;
  qeRasx.Refresh;
end;

end.

