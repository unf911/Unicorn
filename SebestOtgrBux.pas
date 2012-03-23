unit SebestOtgrBux;

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
  DBCtrls,  untSettings,
  SettingsPlugin, //fmSettingsPlugin
  SettingsTipDetail , //fmSettingsDetailTip.
  untRound, MemTableDataEh, DataDriverEh, MemTableEh //ColumnByName
  ;

type
  TfrmSebestOtgrBux = class(TForm)
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
    dbgRasx: TDBGridEh;
    sdsRasx: TSQLDataSet;
    dspRasx: TDataSetProvider;
    cdsRasx: TClientDataSet;
    qeRasx: TQueryExtender;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    N2: TMenuItem;
    UnfFilter1: TUnfFilter;
    actSettings: TAction;
    BitBtn4: TBitBtn;
    PropStorageEh1: TPropStorageEh;
    rpsSebestOst1: TRegPropStorageManEh;
    N4: TMenuItem;
    PopupMenu1: TPopupMenu;
    N5: TMenuItem;
    actClose: TAction;
    PropStorageEh2: TPropStorageEh;
    rpsSebestOst2: TRegPropStorageManEh;
    actDebug: TAction;
    N6: TMenuItem;
    cdsRasxDAT: TSQLTimeStampField;
    cdsRasxID_IZG: TIntegerField;
    cdsRasxID_ZAK: TIntegerField;
    cdsRasxID_MANAGER: TIntegerField;
    cdsRasxID_SKLAD: TIntegerField;
    cdsRasxID_TOVAR: TIntegerField;
    cdsRasxKOLOTP: TFloatField;
    cdsRasxNDS_FACT: TFloatField;
    cdsRasxNDS_SEBEST: TFloatField;
    cdsRasxDOXOD: TFloatField;
    cdsRasxRENT: TFloatField;
    cdsRasxIZG: TStringField;
    cdsRasxZAK: TStringField;
    cdsRasxMANAGER: TStringField;
    cdsRasxSKLAD: TStringField;
    cdsRasxTOVAR: TStringField;
    cdsRasxID_NAKL: TIntegerField;
    actShowNakl: TAction;
    N7: TMenuItem;
    N8: TMenuItem;
    cdsRasxID_ANALOG: TIntegerField;
    cdsRasxANALOG: TStringField;
    MemTableEh1: TMemTableEh;
    SQLDataDriverEh1: TSQLDataDriverEh;
    MemTableEh1DAT: TSQLTimeStampField;
    MemTableEh1IZG: TStringField;
    MemTableEh1ZAK: TStringField;
    MemTableEh1MANAGER: TStringField;
    MemTableEh1SKLAD: TStringField;
    MemTableEh1ANALOG: TStringField;
    MemTableEh1TOVAR: TStringField;
    MemTableEh1KOLOTP: TFloatField;
    MemTableEh1NDS_FACT: TFloatField;
    MemTableEh1NDS_SEBEST: TFloatField;
    MemTableEh1DOXOD: TFloatField;
    MemTableEh1RENT: TFloatField;
    MemTableEh1ID_TOVAR: TIntegerField;
    MemTableEh1ID_SKLAD: TIntegerField;
    MemTableEh1ID_MANAGER: TIntegerField;
    MemTableEh1ID_ZAK: TIntegerField;
    MemTableEh1ID_IZG: TIntegerField;
    MemTableEh1ID_NAKL: TIntegerField;
    MemTableEh1ID_ANALOG: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure actDetailExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure frRasxGetValue(const ParName: String; var ParValue: Variant);
    procedure Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actSettingsExecute(Sender: TObject);
    procedure dbgRasxDblClick(Sender: TObject);
    procedure dbgRasxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actCloseExecute(Sender: TObject);
    procedure actDebugExecute(Sender: TObject);
    procedure actShowNaklExecute(Sender: TObject);
  private
    { Private declarations }

    SettingsSklad : TfmSettingsPlugin;
    SettingsTovar : TfmSettingsPlugin;
    SettingsVlad : TfmSettingsPlugin;
    SettingsTipDetail : TfmSettingsPlugin;
    SettingsClient : TfmSettingsPlugin;
    SettingsTipGroup : TfmSettingsPlugin;
    SettingsTipDetail2 : TfmSettingsPlugin;

    //заполнение и выбор текущей даты - месяца
    procedure FillDate;
    //готовимся к выбору склада
    procedure FillSklad;
    procedure FillVlad;
    //ставим условия в зависимости от выбора даты
    //procedure ProcessDate;
    //ставим условия в зависимости от выбора фирмы
    //procedure ProcessFirm;

    procedure UpdateCaption;
    procedure ProcessSklad;
    procedure ProcessTovar;
    procedure ProcessClient;
    procedure ProcessManager;
    procedure ProcessDate;
    procedure ProcessMode;
    procedure ProcessGroup;
    procedure ProcessSchet;
    procedure ProcessVlad;
  public
    setT : TfrmSettings;
    procedure ShowDetail(mode: integer; dat_from,dat_to,
      id_zak_in,id_manager_in, id_sklad_in, id_tovar_in : variant);

    { Public declarations }
  end;

var
  frmSebestOtgrBux: TfrmSebestOtgrBux;

implementation

uses
  SebestOtgrBuxDet,//TfrmSebestOtgrBuxDet
  untNaklp,
  untNaklo
  ;
{$R *.dfm}

procedure TfrmSebestOtgrBux.FormCreate(Sender: TObject);
begin
	dmdEx.startwaiting;
	cdsRasx.CommandText:=sdsRasx.CommandText;
	qeRasx.DefSql := sdsRasx.CommandText;
	//заполняем
  setT := TfrmSettings.Create(self);
  FillSklad;
	FillDate;
  FillVlad;
end;

procedure TfrmSebestOtgrBux.ProcessVlad;
var
  strUkk : string;
begin
  strUkk := setT.GetPluginResult('fmSettingsVlad');
  if (strUkk<>'') then begin
    cdsRasx.Params.ParamByName('id_izg_in').AsString := strUkk;
  end else begin
    cdsRasx.Params.ParamByName('id_izg_in').Clear;
  end;
end;


//заполнение и выбор текущей даты - месяца
procedure TfrmSebestOtgrBux.FillDate;
begin
try
  setT.SetPeriod(7);
except
  AssertInternal('75F53FE3-BE6B-4BB7-8A37-B1AD19B85C55');
end;
end;

{
procedure TfrmSebestOst.ProcessDate;
begin

try
  //запись дат для последующей детализации
  dDate_from :=  setT.DateFrom;
  dDate_to := setT.DateTo;
  qeRasx.Query.close;
  TClientDataSet(qeRasx.Query).Params.ParamByName('dat_from').AsDate:=dDate_from;
  TClientDataSet(qeRasx.Query).Params.ParamByName('dat_to').AsDate:=dDate_to;
except
  AssertInternal('220EA05F-690C-4703-845E-5B27991F6D03');
end;

end;
}


procedure TfrmSebestOtgrBux.ProcessSklad;
var
  sTemp : string;
begin
  sTemp := setT.GetPluginResult('fmSettingsSklad');
  if sTemp = '' then begin
    cdsRasx.Params.ParamByName('id_sklad_in').Clear;
  end else begin
    cdsRasx.Params.ParamByName('id_sklad_in').AsString := sTemp;
  end; //if все склады
end;

procedure TfrmSebestOtgrBux.ProcessTovar;
var
  sTemp : string;
begin
  sTemp := setT.GetPluginResult('fmSettingsTovar');
  if sTemp = '' then begin
    cdsRasx.Params.ParamByName('id_tovar_in').Clear;
  end else begin
    cdsRasx.Params.ParamByName('id_tovar_in').AsString := sTemp;
  end;
end;

procedure TfrmSebestOtgrBux.ProcessMode;
var
  sTemp : string;
begin
  sTemp := setT.GetPluginResult('fmSettingsTipDetail');
  if sTemp = '0' then begin
    cdsRasx.Params.ParamByName('mode').AsInteger := 1;
  end;
  if sTemp = '1' then begin
    cdsRasx.Params.ParamByName('mode').AsInteger := 2;
  end;
  if sTemp = '2' then begin
    cdsRasx.Params.ParamByName('mode').AsInteger := 3;
  end;
  if sTemp = '3' then begin
    cdsRasx.Params.ParamByName('mode').AsInteger := 4;
  end;
  {
  if sTemp = '4' then begin
    cdsRasx.Params.ParamByName('mode').AsInteger := 5;
  end;
  if sTemp = '5' then begin
    cdsRasx.Params.ParamByName('mode').AsInteger := 6;
  end;}
  //cdsRasx.Params.ParamByName('id_schet_in').Clear;
end;

procedure TfrmSebestOtgrBux.UpdateCaption;
var
  sTemp : string;
begin
try
  sTemp := 'Отчёт по себестоимости отгрузок(бух).'
  + ' Тип документов: '
  + setT.GetPluginTextResult('fmSettingsTipDetail');
  if (setT.GetPluginTextResult('fmSettingsTipGroup')<>'<Без группировки>') then begin
    sTemp := sTemp + '. Группировать: '
      + setT.GetPluginTextResult('fmSettingsTipGroup');
  end;
  if setT.GetPluginTextResult('fmSettingsSklad')<>'' then begin
    sTemp := sTemp + '. Склад: '
    + setT.GetPluginTextResult('fmSettingsSklad');
  end;
  if setT.GetPluginTextResult('fmSettingsTovar')<>'Все товары' then begin
    sTemp := sTemp + '. Товар: '
    + setT.GetPluginTextResult('fmSettingsTovar');
  end;
  if setT.GetPluginTextResult('fmSettingsClient')<>'Все клиенты' then begin
    sTemp := sTemp + '. Клиент: '
    + setT.GetPluginTextResult('fmSettingsClient');
  end;
  self.Caption := sTemp;
except
  AssertInternal('8F0E4FA4-191E-45DF-A61D-E8D599FFE7A2');
end;
end;

procedure TfrmSebestOtgrBux.actRefreshExecute(Sender: TObject);
begin
try
	dmdEx.StartWaiting;
  cdsRasx.Close;
  ProcessSchet;
  ProcessVlad;
  ProcessGroup;
  ProcessTovar;
  ProcessSklad;
  ProcessClient;
  ProcessDate;
  ProcessManager;
  ProcessMode;
	qeRasx.Refresh;
  UpdateCaption;
	dmdEx.StopWaiting;
except
  AssertInternal('945CF2B2-A797-4C0A-8080-8AAB98B7E17');
end;
end;

procedure  TfrmSebestOtgrBux.actDetailExecute(Sender: TObject);
var
  frmSebestOtgr : TfrmSebestOtgrBux;
  frmSebestOtgrBuxDet : TfrmSebestOtgrBuxDet;
  varIdTovar : variant;
  varIdSklad : variant;
  varIdZak : variant;
  varIdManager : variant;
  varCurrency : variant;
  varDate : variant;
  iTemp : integer;
begin
  if cdsRasx.Eof and cdsRasx.Bof then begin
    exit; //нет строк в таблице
  end;
try
  iTemp := strtoint(setT.GetPluginResult('fmSettingsTipGroup'));
  if iTemp<>0 then begin
    //group<>none
    varIdSklad := Null;
    if not cdsRasx.Params.ParamByName('id_sklad_in').isNull then begin
      varIdSklad := cdsRasx.Params.ParamByName('id_sklad_in').AsInteger;
    end;
    varIdTovar := Null;
    if cdsRasx.Params.ParamByName('id_tovar_in').AsInteger<>0 then begin
      varIdTovar := cdsRasx.Params.ParamByName('id_tovar_in').AsInteger;
    end;
    varIdZak := Null;
    if cdsRasx.Params.ParamByName('id_zak_in').asInteger<>0 then begin
      varIdZak :=cdsRasx.Params.ParamByName('id_zak_in').asInteger;
    end;
    varIdManager := null;
    if cdsRasx.Params.ParamByName('id_manager_in').asInteger<>0 then begin
      varIdManager :=cdsRasx.Params.ParamByName('id_manager_in').asInteger;
    end;
    if iTemp=1 then begin
      varIdSklad :=cdsRasx.FieldByName('id_sklad').AsInteger;
    end;
    if iTemp=2 then begin
      varIdTovar :=cdsRasx.FieldByName('id_tovar').AsInteger;
    end;
    if iTemp=3 then begin
      varIdZak :=cdsRasx.FieldByName('id_zak').AsInteger;
    end;
    if iTemp=4 then begin
      varIdManager :=cdsRasx.FieldByName('id_manager').AsInteger;
    end;
    frmSebestOtgr := TfrmSebestOtgrBux.Create(Application);
    frmSebestOtgr.ShowDetail(
      cdsRasx.Params.ParamByName('mode').asInteger,
      cdsRasx.Params.ParamByName('dat_from').AsDate,
      cdsRasx.Params.ParamByName('dat_to').AsDate,
      varIdZak,
      varIdManager,
      varIdSklad,
      varIdTovar);
  end else begin
    //group=none
    frmSebestOtgrBuxDet := TfrmSebestOtgrBuxDet.Create(Application);
    varCurrency := Null;
    varDate := Null;
    frmSebestOtgrBuxDet.ShowDetail(
      3,
      cdsRasx.Params.ParamByName('id_schet_in').Value,
      cdsRasx.FieldByName('id_sklad').AsInteger,
      cdsRasx.FieldByName('id_tovar').AsInteger,
      varCurrency,
      varDate,
      Null,
      cdsRasx.FieldByName('id_nakl').AsInteger)
  end; //if group=none
except
  AssertInternal('3A2BF7E7-651C-4C4E-B821-F685F785A2E1');
end;

end;

procedure TfrmSebestOtgrBux.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmSebestOtgrBux.frRasxGetValue(const ParName: String;
  var ParValue: Variant);
var
  strTemp : string;
begin
try
	if AnsiUpperCase(ParName) = 'TITLE' then begin
    //генерация заголовка
    strTemp :=self.Caption;
    if (cdsRasx.Filtered = true) then begin
      //если отчёт отфильтрован
      strTemp := strTemp+ ' [Фильтр]';
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

procedure TfrmSebestOtgrBux.FillVlad;
var
  iTemp : integer;
begin
  SettingsVlad := setT.CreatePlugin('TfmSettingsVlad');
  SettingsVlad.SetResultType(1);
  setT.AddPlugin(SettingsVlad);
  //выбираем точное название для Укк
  iTemp := dmdEx.GetDefaultVlad;
  SettingsVlad.SetKeyValue(iTemp);
end;

procedure TfrmSebestOtgrBux.FillSklad;
var
  iSkladTreeOid : integer;
begin
try
  //Все менеджеры по умолчанию
  setT.IDManager :=0;

  SettingsTipDetail2 := setT.CreatePlugin('TfmSettingsTipDetail');
  SettingsTipDetail2.Name := 'fmSettingsTipDetail2';
  setT.addplugin(SettingsTipDetail2);
  SettingsTipDetail2.AddDetailTip('По товарам');
  SettingsTipDetail2.AddDetailTip('По таре');
  SettingsTipDetail2.SetKeyValue(0);

  //setT.actManagerOff.Execute;
  //setT.actDataOff.Execute;
  SettingsTipDetail := setT.CreatePlugin('TfmSettingsTipDetail');
  SettingsTipDetail.SetLabelValue('Тип документов');
  SettingsTipDetail.AddDetailTip('По приходным накладным');
  SettingsTipDetail.AddDetailTip('По перемещениям');
  SettingsTipDetail.AddDetailTip('По расходным накладным');
  SettingsTipDetail.AddDetailTip('По перемещениям как приходам');
  setT.AddPlugin(SettingsTipDetail);
  SettingsTipDetail.SetKeyValue(2);



  SettingsTipGroup := setT.CreatePlugin('TfmSettingsTipGroup');
  SettingsTipGroup.AddDetailTip('<Без группировки>');
  SettingsTipGroup.AddDetailTip('По складам');
  SettingsTipGroup.AddDetailTip('По товарам');
  SettingsTipGroup.AddDetailTip('По покупателям');
  SettingsTipGroup.AddDetailTip('По менеджерам');
  SettingsTipGroup.AddDetailTip('По аналогам');
  setT.AddPlugin(SettingsTipGroup);
  SettingsTipGroup.SetKeyValue(0);


  SettingsSklad := setT.CreatePlugin('TfmSettingsSklad');
  SettingsSklad.SetResultType(1);
  setT.AddPlugin(SettingsSklad);
  iSkladTreeOid:=dmdEx.GetOidObjects('ТИП НАЗВАНИЯ СКЛАДОВ',-100);
  iSkladTreeOid:=dmdEx.GetOidObjects('УКК Склад',iSkladTreeOid);
  SettingsSklad.SetKeyValue(iSkladTreeOid);
  //SettingsSklad2.dlcSklad.KeyValue := 0;

  SettingsTovar := setT.CreatePlugin('TfmSettingsTovar');
  setT.AddPlugin(SettingsTovar);

  SettingsClient := setT.CreatePlugin('TfmSettingsClient');
  setT.AddPlugin(SettingsClient);

except
  AssertInternal('84C325BF-DBC3-4E7A-8323-F711FBFB67D1');
end;
end;

procedure TfrmSebestOtgrBux.Button1Click(Sender: TObject);
begin
  if setT.ChangeSettings=mrOk then begin
    showmessage(setT.GetPluginResult('fmSettingsSklad'));
  end;
end;

procedure TfrmSebestOtgrBux.FormDestroy(Sender: TObject);
begin
  setT.Free;
end;

procedure TfrmSebestOtgrBux.actSettingsExecute(Sender: TObject);
begin
  actSettings.checked := setT.ProcessSettingsChange(actRefresh);
end;

procedure TfrmSebestOtgrBux.dbgRasxDblClick(Sender: TObject);
begin
  actDetail.Execute;
end;

procedure TfrmSebestOtgrBux.dbgRasxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return : begin
      actDetail.Execute;
    end;
  end;//case
end;

procedure TfrmSebestOtgrBux.actCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmSebestOtgrBux.ShowDetail(mode: integer; dat_from,dat_to,
  id_zak_in,id_manager_in, id_sklad_in, id_tovar_in : variant);
begin
  SettingsSklad.SetKeyValue(id_sklad_in);
  SettingsTovar.SetKeyValue(id_tovar_in);
  SettingsClient.SetKeyValue(id_zak_in);
  SettingsTipDetail.SetKeyValue(mode-1);
  SettingsTipGroup.SetKeyValue(0);
  setT.IdManager:= vartoint(id_manager_in,true);
  setT.DateFrom := dat_from;
  setT.DateTo := dat_to;
//  cdsRasx.Params.ParamValues['dat_to']:=dat_to;
//  cdsRasx.Params.ParamValues['dat_from']:=dat_from;
  {dsRasx.Params.ParamValues['dat_to']:=dat_to;}
  {cdsRasx.Params.ParamValues['id_currency_to']:=id_currency_to;}
  actRefresh.Execute;
end;

procedure TfrmSebestOtgrBux.actDebugExecute(Sender: TObject);
begin
  actDebug.Checked := not actDebug.Checked;
  if actDebug.Checked then begin
    //показать колонки с номерами складов и товаров
    ColumnByName(dbgRasx.Columns,'ID_IZG').visible := true;
    ColumnByName(dbgRasx.Columns,'ID_ZAK').visible := true;
    ColumnByName(dbgRasx.Columns,'ID_MANAGER').visible := true;
    ColumnByName(dbgRasx.Columns,'ID_TOVAR').visible := true;
    ColumnByName(dbgRasx.Columns,'ID_SKLAD').visible := true;
    ColumnByName(dbgRasx.Columns,'ID_ANALOG').visible := true;
  end else begin //if actDebug checked
    ColumnByName(dbgRasx.Columns,'ID_IZG').visible := false;
    ColumnByName(dbgRasx.Columns,'ID_ZAK').visible := false;
    ColumnByName(dbgRasx.Columns,'ID_MANAGER').visible := false;
    ColumnByName(dbgRasx.Columns,'ID_TOVAR').visible := false;
    ColumnByName(dbgRasx.Columns,'ID_SKLAD').visible := false;
    ColumnByName(dbgRasx.Columns,'ID_ANALOG').visible := false;
  end;  //if actDebug checked
end;

procedure TfrmSebestOtgrBux.ProcessClient;
begin
  dmdEx.SetIntegerParamValue(
    cdsRasx.Params.ParamByName('id_zak_in'),
    setT.GetPluginResult('fmSettingsClient')
  );
end;

procedure TfrmSebestOtgrBux.ProcessManager;
var
  sTemp : string;
begin
  if setT.IdManager<>0 then begin
    sTemp :=  inttostr(setT.IDManager);
  end;
  if sTemp = '' then begin
    cdsRasx.Params.ParamByName('id_manager_in').Clear;
  end else begin
    cdsRasx.Params.ParamByName('id_manager_in').AsString := sTemp;
  end; //if все склады
end;

procedure TfrmSebestOtgrBux.ProcessDate;
var
  dFrom, dTo : Tdate;
begin
  dFrom := setT.DateFrom;
  dTo := setT.DateTo;
  cdsRasx.Params.ParamByName('dat_from').AsDate := dFrom;
  cdsRasx.Params.ParamByName('dat_to').AsDate := dTo;
end;

procedure TfrmSebestOtgrBux.ProcessSchet;
var
  sTemp : string;
  iTemp : integer;
  iSchet : integer;
begin
  sTemp := setT.GetPluginResult('fmSettingsTipDetail2');
  iTemp := strtoint(sTemp);
  case iTemp of
    0: begin
      iSchet := dmdEx.GetOidObjects('ТИП СЧЕТА',-100);
      iSchet := dmdEx.GetOidObjects('СЕБЕСТОИМОСТЬ БУХ',iSchet);
      cdsRasx.Params.ParamByName('id_schet_in').AsInteger := iSchet;
    end;
    1: begin
      iSchet := dmdEx.GetOidObjects('ТИП СЧЕТА',-100);
      iSchet := dmdEx.GetOidObjects('СЕБЕСТОИМОСТЬ БУХ ТАРА',iSchet);
      cdsRasx.Params.ParamByName('id_schet_in').AsInteger := iSchet;
    end;
  end;
end;

procedure TfrmSebestOtgrBux.ProcessGroup;
var
  sTemp : string;
  iTemp : integer;
begin
try
  sTemp := setT.GetPluginResult('fmSettingsTipGroup');
  iTemp := strtoint(sTemp);
  //По умолчанию нельзя сразу открыть складскую накладную
  actShowNakl.Visible :=false;
  ColumnByName(dbgRasx.Columns,'SKLAD').Footer.ValueType :=fvtNon;
  ColumnByName(dbgRasx.Columns,'TOVAR').Footer.ValueType :=fvtNon;
  ColumnByName(dbgRasx.Columns,'DAT').Footer.ValueType :=fvtNon;
  ColumnByName(dbgRasx.Columns,'ZAK').Footer.ValueType :=fvtNon;
  ColumnByName(dbgRasx.Columns,'MANAGER').Footer.ValueType :=fvtNon;
  ColumnByName(dbgRasx.Columns,'ANALOG').Footer.ValueType :=fvtNon;
  case iTemp of
    0: begin
      qeRasx.SetSQL('select','r.dat,r.id_nakl,r.id_izg,r.id_zak,r.id_manager,'+
        'r.id_sklad,r.id_tovar, r.id_analog, r.kolotp,r.nds_fact,r.nds_sebest, r.doxod,r.rent',
        0);
      qeRasx.SetSQL('group by','',0);
      qeRasx.Prepare;
      ColumnByName(dbgRasx.Columns,'DAT').Visible := true;
      ColumnByName(dbgRasx.Columns,'IZG').Visible := true;
      ColumnByName(dbgRasx.Columns,'ZAK').Visible := true;
      ColumnByName(dbgRasx.Columns,'MANAGER').Visible := true;
      ColumnByName(dbgRasx.Columns,'TOVAR').Visible := true;
      ColumnByName(dbgRasx.Columns,'SKLAD').Visible := true;
      ColumnByName(dbgRasx.Columns,'ANALOG').Visible := true;
      //ColumnByName(dbgRasx.Columns,'ANALOG').Width := 20;
      ColumnByName(dbgRasx.Columns,'DAT').Footer.ValueType :=fvtCount;
      //Только в режиме без группировки
      actShowNakl.Visible :=true;
    end;
    1: begin
      qeRasx.SetSQL('select',
        'cast(null as date) as dat, cast(null as integer) as id_izg, '+
        'cast(null as integer) as id_nakl,'+
        'cast(null as integer) as id_zak, cast(null as integer) as id_manager, '+
        'cast (null as integer) as id_tovar, '+
        'cast (null as integer) as id_analog, '+
        'r.id_sklad, sum(r.kolotp) as kolotp, '+
        'sum(r.nds_fact) as nds_fact,sum(r.nds_sebest) as nds_sebest,'+
        'sum(r.doxod) as doxod,dzero(sum(r.doxod)*100,sum(r.nds_sebest),0) as rent',
        0);
      qeRasx.SetSQL('group by','r.id_sklad',0);
      qeRasx.Prepare;
      ColumnByName(dbgRasx.Columns,'DAT').Visible := false;
      ColumnByName(dbgRasx.Columns,'IZG').Visible := false;
      ColumnByName(dbgRasx.Columns,'ZAK').Visible := false;
      ColumnByName(dbgRasx.Columns,'MANAGER').Visible := false;
      ColumnByName(dbgRasx.Columns,'TOVAR').Visible := false;
      ColumnByName(dbgRasx.Columns,'SKLAD').Visible := true;
      ColumnByName(dbgRasx.Columns,'ANALOG').Visible := false;
      ColumnByName(dbgRasx.Columns,'SKLAD').Footer.ValueType :=fvtCount;
    end;
    2: begin
      qeRasx.SetSQL('select',
        'cast(null as date) as dat, cast(null as integer) as id_izg, '+
        'cast(null as integer) as id_nakl,'+
        'cast(null as integer) as id_zak, cast(null as integer) as id_manager, '+
        'cast (null as integer) as id_sklad, '+
        'cast (null as integer) as id_analog, '+
        'r.id_tovar, sum(r.kolotp) as kolotp,'+
        'sum(r.nds_fact) as nds_fact,sum(r.nds_sebest) as nds_sebest,'+
        'sum(r.doxod) as doxod,dzero(sum(r.doxod)*100,sum(r.nds_sebest),0) as rent',
        0);
      qeRasx.SetSQL('group by','r.id_tovar',0);
      qeRasx.Prepare;
      ColumnByName(dbgRasx.Columns,'DAT').Visible := false;
      ColumnByName(dbgRasx.Columns,'IZG').Visible := false;
      ColumnByName(dbgRasx.Columns,'ZAK').Visible := false;
      ColumnByName(dbgRasx.Columns,'MANAGER').Visible := false;
      ColumnByName(dbgRasx.Columns,'SKLAD').Visible := false;
      ColumnByName(dbgRasx.Columns,'TOVAR').Visible := true;
      ColumnByName(dbgRasx.Columns,'ANALOG').Visible := false;
      ColumnByName(dbgRasx.Columns,'TOVAR').Footer.ValueType :=fvtCount;
    end;
    3: begin
      qeRasx.SetSQL('select',
        'cast(null as date) as dat, cast(null as integer) as id_izg, '+
        'cast(null as integer) as id_nakl,'+
        'cast(null as integer) as id_manager, '+
        'cast (null as integer) as id_sklad, '+
        'cast (null as integer) as id_tovar, '+
        'cast (null as integer) as id_analog, '+
        'r.id_zak, sum(r.kolotp) as kolotp,'+
        'sum(r.nds_fact) as nds_fact,sum(r.nds_sebest) as nds_sebest,'+
        'sum(r.doxod) as doxod,dzero(sum(r.doxod)*100,sum(r.nds_sebest),0) as rent',
        0);
      qeRasx.SetSQL('group by','r.id_zak',0);
      qeRasx.Prepare;
      ColumnByName(dbgRasx.Columns,'DAT').Visible := false;
      ColumnByName(dbgRasx.Columns,'IZG').Visible := false;
      ColumnByName(dbgRasx.Columns,'ZAK').Visible := true;
      ColumnByName(dbgRasx.Columns,'MANAGER').Visible := false;
      ColumnByName(dbgRasx.Columns,'SKLAD').Visible := false;
      ColumnByName(dbgRasx.Columns,'TOVAR').Visible := false;
      ColumnByName(dbgRasx.Columns,'ANALOG').Visible := false;
      ColumnByName(dbgRasx.Columns,'ZAK').Footer.ValueType :=fvtCount;
    end;
    4: begin
      qeRasx.SetSQL('select',
        'cast(null as date) as dat, cast(null as integer) as id_izg, '+
        'cast(null as integer) as id_nakl,'+
        'cast(null as integer) as id_manager, '+
        'cast (null as integer) as id_sklad, '+
        'cast (null as integer) as id_tovar, '+
        'cast (null as integer) as id_analog, '+
        'r.id_manager, sum(r.kolotp) as kolotp,'+
        'sum(r.nds_fact) as nds_fact,sum(r.nds_sebest) as nds_sebest,'+
        'sum(r.doxod) as doxod,dzero(sum(r.doxod)*100,sum(r.nds_sebest),0) as rent',
        0);
      qeRasx.SetSQL('group by','r.id_manager',0);
      qeRasx.Prepare;
      ColumnByName(dbgRasx.Columns,'DAT').Visible := false;
      ColumnByName(dbgRasx.Columns,'IZG').Visible := false;
      ColumnByName(dbgRasx.Columns,'ZAK').Visible := false;
      ColumnByName(dbgRasx.Columns,'MANAGER').Visible := true;
      ColumnByName(dbgRasx.Columns,'SKLAD').Visible := false;
      ColumnByName(dbgRasx.Columns,'TOVAR').Visible := false;
      ColumnByName(dbgRasx.Columns,'ANALOG').Visible := false;
      ColumnByName(dbgRasx.Columns,'MANAGER').Footer.ValueType :=fvtCount;
    end;
    5: begin
      qeRasx.SetSQL('select',
        'cast(null as date) as dat, cast(null as integer) as id_izg, '+
        'cast(null as integer) as id_nakl,'+
        'cast(null as integer) as id_zak, cast(null as integer) as id_manager, '+
        'cast (null as integer) as id_sklad, '+
        'cast (null as integer) as id_tovar, '+
        'r.id_analog, sum(r.kolotp) as kolotp,'+
        'sum(r.nds_fact) as nds_fact,sum(r.nds_sebest) as nds_sebest,'+
        'sum(r.doxod) as doxod,dzero(sum(r.doxod)*100,sum(r.nds_sebest),0) as rent',
        0);
      qeRasx.SetSQL('group by','r.id_analog',0);
      qeRasx.Prepare;
      ColumnByName(dbgRasx.Columns,'DAT').Visible := false;
      ColumnByName(dbgRasx.Columns,'IZG').Visible := false;
      ColumnByName(dbgRasx.Columns,'ZAK').Visible := false;
      ColumnByName(dbgRasx.Columns,'MANAGER').Visible := false;
      ColumnByName(dbgRasx.Columns,'SKLAD').Visible := false;
      ColumnByName(dbgRasx.Columns,'TOVAR').Visible := false;
      ColumnByName(dbgRasx.Columns,'ANALOG').Visible := true;
      ColumnByName(dbgRasx.Columns,'ANALOG').Footer.ValueType :=fvtCount;
    end;
  end;//case
except
  AssertInternal('3E95BAD6-091A-40AB-8470-44DAED3570DB')
end;
end;

procedure TfrmSebestOtgrBux.actShowNaklExecute(Sender: TObject);
var
  frmNaklo : TfrmNaklo;
  frmNaklp : TfrmNaklp;
  iTemp : integer;
begin
  itemp := strtoint(setT.GetPluginResult('fmSettingsTipDetail'));
  if iTemp =0 then begin
    //недостачи
    frmNaklo := TfrmNaklo.Create(Application);
    frmNaklo.qeNaklo.SetSQL('where','n.id_nakl='+ cdsRasx.FieldByName('id_nakl').asString,0);
    frmNaklo.qeNaklo.Prepare;
    frmNaklo.DefaultOpen;
    frmNaklo.Show;
  end;
  if iTemp =1 then begin
    //излишки
    frmNaklp := TfrmNaklp.Create(Application);
    frmNaklp.qeNaklo.SetSQL('where','id_nakl='+ cdsRasx.FieldByName('id_nakl').asString,0);
    frmNaklp.qeNaklo.Prepare;
    frmNaklp.DefaultOpen;
    frmNaklp.Show;
  end;

end;

end.

