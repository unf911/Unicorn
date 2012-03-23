unit untSkladRasxEx;

interface

uses
  Windows, Messages, SysUtils,
  Variants, Classes,
  Graphics, Controls, Forms,
  Dialogs,
  FMTBcd, DBClient, Provider, SqlExpr, DBGridEh, PropFilerEh, Menus,
  PropStorageEh, UnfFilter, QueryExtender, DB,   
  ActnList, StdCtrls, Buttons, GridsEh, frxClass, frxDBSet, 
 DBTables, Grids,
  DBGrids,
  ComCtrls,
  untEx,
  DateUtils,
  ATSAssert,
  untSkladRasxDetEx,
  DBCtrls,
  untSettings,
  StrUtils, //AnsiStartsStr
  SettingsPlugin //TfmSettingsPlugin
  ;

type
  TfrmSkladRasxEx = class(TForm)
    dsRasx: TDataSource;
    ActionList1: TActionList;
    actRefresh: TAction;
    actItogo: TAction;
    actPreview: TAction;
    actDetail: TAction;
    actWithoutTara: TAction;
    MainMenu1: TMainMenu;
    mnuActions: TMenuItem;
    N1: TMenuItem;
    N3: TMenuItem;
    frRasx: TfrxReport;
    frdRasx: TfrxDBDataset;
    dbhRasx: TDBGridEh;
    sdsRasx: TSQLDataSet;
    dspRasx: TDataSetProvider;
    cdsRasx: TClientDataSet;
    cdsRasxTOVAR: TStringField;
    qeRasx: TQueryExtender;
    cdsRasxKOLOTP: TFMTBCDField;
    cdsRasxID_TOVAR: TIntegerField;
    N2: TMenuItem;
    UnfFilter1: TUnfFilter;
    actSettings: TAction;
    PropStorageEh1: TPropStorageEh;
    rpsSkladRasxDetEx: TRegPropStorageManEh;
    N4: TMenuItem;
    PopupMenu1: TPopupMenu;
    N5: TMenuItem;
    cdsRasxSUM: TFloatField;
    cdsRasxCOUNT_NUM: TIntegerField;
    GroupBox1: TGroupBox;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    cdsRasxWEIGHT: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure actPreviewExecute(Sender: TObject);
    procedure actDetailExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure frRasxGetValue(const ParName: String; var ParValue: Variant);
    procedure actItogoExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actSettingsExecute(Sender: TObject);
    procedure dbhRasxDblClick(Sender: TObject);
    procedure dbhRasxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    dDate_from,dDate_to : TDate;
    curSum : currency;
    setT : TfrmSettings;
    SettingsSklad : TfmSettingsPlugin;
    SettingsTovar : TfmSettingsPlugin;
    SettingsNakloTip : TfmSettingsPlugin;
    SettingsVlad : TfmSettingsPlugin;
    SettingsManager : TfmSettingsPlugin;
    //заполнение и выбор текущей даты - мес€ца
    procedure FillDate;
    //готовимс€ к выбору склада
    procedure FillSklad;
    //ставим услови€ в зависимости от выбора даты
    procedure ProcessDate;
    //ставим услови€ в зависимости от выбора фирмы
    procedure ProcessFirm;
    //ставим услови€ в зависимости от выбора менеджера

    procedure UpdateCaption;
  public
    { Public declarations }
    function DefaultOpen:boolean;
    procedure DefaultStartup;

  end;

var
  frmSkladRasxEx: TfrmSkladRasxEx;

implementation

{$R *.dfm}
uses

  DesignReport //ProcessReportDesigner
  ;

procedure TfrmSkladRasxEx.FormCreate(Sender: TObject);
begin
	dmdEx.startwaiting;
	//чтобы не было ошибки при processmanager
	dmdEx.cdsManager.Open;
	//просто дл€ удобства
	cdsRasx.CommandText:=sdsRasx.CommandText;
	qeRasx.DefSql := sdsRasx.CommandText;
	//заполн€ем

  setT := TfrmSettings.Create(self);
  FillSklad;

	FillDate;
  SettingsTovar := setT.CreatePlugin('TfmSettingsTovar');
  setT.AddPlugin(SettingsTovar);
  ProcessReportDesigner(ActionList1,MainMenu1,frRasx);
  dmdEx.StopWaiting;
//  cdsRasx.Open;
end;


//заполнение и выбор текущей даты - мес€ца
procedure TfrmSkladRasxEx.FillDate;
begin
try
  setT.SetPeriod(7);
except
  AssertInternal('75F53FE3-BE6B-4BB7-8A37-B1AD19B85C55');
end;
end;


procedure TfrmSkladRasxEx.ProcessDate;
begin
try
  //запись дат дл€ последующей детализации
  dDate_from :=  setT.DateFrom;
  dDate_to := setT.DateTo;

  qeRasx.SetSQL('where',
    'om.dat <='+quotedstr(datetostr(dDate_to)), 0);
  qeRasx.SetSQL('where',
    'om.dat >= '+quotedstr(datetostr(dDate_from)), 1);
except
  AssertInternal('220EA05F-690C-4703-845E-5B27991F6D03');
end;

end;

procedure TfrmSkladRasxEx.ProcessFirm;
var
  strUkk : string;
  sTip : string;
//  iIdIzg : integer;
begin
try
  strUkk := setT.GetPluginResult('fmSettingsVlad');
  if (strUkk<>'') then begin
    qeRasx.SetSql('where','om.id_izg'+strUkk,3);
  end else begin
    qeRasx.SetSql('where','',3);
  end;
  sTip := setT.GetPluginResult('fmSettingsNakloTip');
  if sTip='6' then begin
    qeRasx.SetSql('where',' (om.tip=103 and om.id_sklad_to '+
      setT.GetPluginResult('fmSettingsSklad')+
      ')',4);
    qeRasx.SetSql('where','',5);
    exit;
  end;
  if sTip='7' then begin
    qeRasx.SetSql('where','((om.tip in(1,2) and om.id_sklad '+
      setT.GetPluginResult('fmSettingsSklad')+
      ') or (om.tip=103 and om.id_sklad_to '+
      setT.GetPluginResult('fmSettingsSklad')+
      '))',4);
    qeRasx.SetSql('where','',5);
    exit;
  end;
    strUkk := setT.GetPluginResult('fmSettingsSklad');
    if (strUkk<>'') then begin
      qeRasx.SetSql('where','om.id_sklad '+strUkk,4);
    end else begin
      qeRasx.SetSql('where','',4);
    end;
    strUkk := setT.GetPluginResult('fmSettingsNakloTip');
    if (strUkk<>'') then begin
      qeRasx.SetSql('where','om.tip'+strUkk,5);
    end else begin
      qeRasx.SetSql('where','',5);
    end;
  //end; //if приход
except
  AssertInternal('8E23A2EE-9E8D-4AF0-B8B7-883D8BF6B305');
end;

end;

procedure TfrmSkladRasxEx.UpdateCaption;
var
  strTemp : string;
begin
try
  strTemp :=AnsiLowerCase(sett.GetPluginTextResult('fmSettingsNakloTip'))+'у';
  if strTemp = 'излишеку' then begin
    strTemp := 'излишкам';
  end;
  if strTemp = 'недостачау' then begin
    strTemp := 'недостачам';
  end;
  if strTemp = 'хранениеу' then begin
    strTemp := 'хранению';
  end;
  if strTemp = 'расход без хранени€у' then begin
    strTemp := 'расходу без хранени€';
  end;
  self.Caption := 'ќтчЄт по '+
    strTemp +
    ' со склада c '+
    datetostr(sett.DateFrom)+' до ' +
    datetostr(setT.DateTo)+ '. ‘ирма: '+
    sett.GetPluginTextResult('fmSettingsVlad') +
    '. ћенеджер: '+
    setT.GetPluginTextResult('fmSettingsManager')+'. —клад:'+
    setT.GetPluginTextResult('fmSettingsSklad')+'.';

except
  AssertInternal('6AE681E4-199B-4714-A367-EBE98745F582');
end;
end;

procedure TfrmSkladRasxEx.actRefreshExecute(Sender: TObject);
begin
try
	dmdEx.StartWaiting;
	UpdateCaption;
	ProcessDate;
	//ProcessManager;
  qeRasx.ProcessPlugin(
    'om.id_manager',
    setT.GetPluginResult('fmSettingsManager'),
    2,
    'in');
	ProcessFirm;
  qeRasx.ProcessPlugin(
    'ot.id_tovar',
    setT.GetPluginResult('fmSettingsTovar'),
    6,
    '=');
	qeRasx.Refresh;
	dmdEx.StopWaiting;
except
  AssertInternal('7557D238-1F1F-4C75-843A-0B7E0F5CFADA');
end;
end;


procedure TfrmSkladRasxEx.actPreviewExecute(Sender: TObject);
begin
try
  dmdEx.GetReport('RepRasxEx.fr3',frRasx);
	frRasx.PrepareReport;
  frRasx.ShowPreparedReport;
except
  AssertInternal('6F904CE6-C1B0-4A10-AB94-22CD8D89501C');
end;

end;

procedure TfrmSkladRasxEx.actDetailExecute(Sender: TObject);
var
  frmSkladRasxDetEx : TfrmSkladRasxDetEx;
begin
try
  frmSkladRasxDetEx := TfrmSkladRasxDetEx.Create(Application);
  frmSkladRasxDetEx.ShowSkladRasxDet (qeRasx,
    cdsRasx.fieldByName('id_tovar').asInteger);
  frmSkladRasxDetEx.Caption := frmSkladRasxDetEx.Caption+ ': '+
    cdsRasx.fieldByName('tovar').asstring;
  frmSkladRasxDetEx.Show;
//  frmSkladRasxDetEx.Free;
except
  AssertInternal('E610BA75-1E90-4490-B1B7-D062A0AC248D');
end;
end;

procedure TfrmSkladRasxEx.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmSkladRasxEx.frRasxGetValue(const ParName: String;
  var ParValue: Variant);
var
  strTemp : string;
begin
try
	if AnsiUpperCase(ParName) = 'TITLE' then begin
    //генераци€ заголовка
    strTemp :=self.Caption;
    if (cdsRasx.Filtered = true) then begin
      //если отчЄт отфильтрован
      strTemp := strTemp+ ' [‘ильтр]';
    end;
    ParValue := strTemp;
  end;
	{
	if AnsiUpperCase(ParName)='TOTALSUM' then begin
		ParValue :=  curSum;
	end;
	}
except
	AssertInternal('A309C04A-3394-44C3-87C7-3B795D6A250F');
end;
end;

procedure TfrmSkladRasxEx.actItogoExecute(Sender: TObject);
begin
try
   if cdsRasx.Active then begin
    curSum :=0;
    cdsRasx.First;
    while (not cdsRasx.Eof) do begin
      curSum := curSum + cdsRasx.FieldByName ('kolotp').asCurrency;
      cdsRasx.Next;
    end;
  end;
except
  AssertInternal('83B2588F-39E6-4AA1-8739-4E2ED23437C1');
end;
end;


procedure TfrmSkladRasxEx.FillSklad;
var
  iSkladTreeOid ,iSkladUKK : integer;
begin
  setT.actManagerOff.execute;
  //пред мес€ц
  setT.SetPeriod(7);
  SettingsManager := setT.CreatePlugin('TfmSettingsManager');
  SettingsManager.SetResultType(2);
  setT.AddPlugin(SettingsManager);

  SettingsNakloTip:= setT.CreatePlugin('TfmSettingsNakloTip');
    //TfmSettingsNakloTip.Create(setT);
  SettingsNakloTip.SetKeyValue(1);
  setT.AddPlugin(SettingsNakloTip);

  SettingsSklad :=  setT.CreatePlugin('TfmSettingsSklad');
  //было тип =2. “еперь хочу смотреть сколько пришло
  //и ушло только по этому складу без подчинЄнныъ
  //чтобы сравнивать с себестоимостью
  SettingsSklad.SetResultType(2);
  setT.AddPlugin(SettingsSklad);
  iSkladTreeOid := dmdEx.GetOidObjects('“»ѕ Ќј«¬јЌ»я — Ћјƒќ¬',-100);
  iSkladUKK := dmdEx.GetOidObjects('”   —клад',iSkladTreeOid);
  SettingsSklad.SetKeyValue(iSkladUKK);


  SettingsVlad := setT.CreatePlugin('TfmSettingsVlad');
  SettingsVlad.SetKeyValue(null);
  setT.AddPlugin(SettingsVlad);

end;

procedure TfrmSkladRasxEx.Button1Click(Sender: TObject);
begin
  if setT.ChangeSettings=mrOk then begin
    showmessage(setT.GetPluginResult('fmSettingsSklad'));
  end;
end;

procedure TfrmSkladRasxEx.FormDestroy(Sender: TObject);
begin
  setT.Free;
end;

procedure TfrmSkladRasxEx.actSettingsExecute(Sender: TObject);
begin
  actSettings.checked := setT.ProcessSettingsChange(actRefresh);
end;

procedure TfrmSkladRasxEx.dbhRasxDblClick(Sender: TObject);
begin
  actDetail.Execute;
end;

procedure TfrmSkladRasxEx.dbhRasxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return : begin
      actDetail.Execute;
    end;
  end;//case
end;

function TfrmSkladRasxEx.DefaultOpen:boolean;
begin
	actRefresh.Execute;
  Result :=true;
  if not cdsRasx.active then begin
    Result :=false;
  end;
end;


procedure TfrmSkladRasxEx.DefaultStartup;
begin
  SettingsManager.SetKeyValue(dmdEx.GetIdManager);
end;

end.

