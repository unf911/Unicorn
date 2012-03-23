unit SebestOtgr;

interface

uses
  Windows, Messages, SysUtils,
  Variants, Classes,
  Graphics, Controls, Forms,
  Dialogs,
  FMTBcd, DBClient, Provider, SqlExpr, DBGridEh, PropFilerEh, Menus,
  PropStorageEh, UnfFilter, QueryExtender, DB,   
  ActnList, StdCtrls, Buttons, GridsEh, frxClass, frxDBSet,

  DateUtils,
  ATSAssert,
  untSkladRasxDetEx,

  untSettings,
  SettingsPlugin, //fmSettingsPlugin
  untRound //ColumnByName
  ;

type
  TfrmSebestOtgr = class(TForm)
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
    BitBtn3: TBitBtn;
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
    cdsRasxNDS_SEBEST_IN_CURRENCY: TFloatField;
    cdsRasxID: TStringField;
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
    SettingsManager : TfmSettingsPlugin;
    SettingsTovar : TfmSettingsPlugin;
    SettingsTipDetail : TfmSettingsPlugin;
    SettingsClient : TfmSettingsPlugin;
    SettingsTipGroup : TfmSettingsPlugin;

    //заполнение и выбор текущей даты - месяца
    procedure FillDate;
    //готовимся к выбору склада
    procedure FillSklad;
    procedure FillManager;
    procedure FillSettings;
    procedure UpdateCaption;
    procedure ProcessSklad;
    procedure ProcessTovar;
    procedure ProcessClient;
    procedure ProcessManager;
    procedure ProcessDate;
    procedure ProcessMode;
    procedure ProcessGroup;
  public
    setT : TfrmSettings;
    procedure ShowDetail(mode: integer; dat_from,dat_to,
      id_zak_in,id_manager_in, id_sklad_in, id_tovar_in, id_nakl_in : variant);

    { Public declarations }
  end;

var
  frmSebestOtgr: TfrmSebestOtgr;

implementation

uses
  SebestOstDet3,//TfrmSebestOstDet
  skladaux //opendocument
  , untEx;
{$R *.dfm}

procedure TfrmSebestOtgr.FormCreate(Sender: TObject);
begin
	dmdEx.startwaiting;
	cdsRasx.CommandText:=sdsRasx.CommandText;
	qeRasx.DefSql := sdsRasx.CommandText;
	//заполняем
  setT := TfrmSettings.Create(self);
  FillSettings;
end;


//заполнение и выбор текущей даты - месяца
procedure TfrmSebestOtgr.FillDate;
begin
try
  setT.SetPeriod(7);
except
  AssertInternal('75F53FE3-BE6B-4BB7-8A37-B1AD19B85C55');
end;
end;

procedure TfrmSebestOtgr.ProcessSklad;
begin
  dmdEx.SetIntegerParamValue(
    cdsRasx.Params.ParamByName('id_sklad_in'),
    setT.GetPluginResult('fmSettingsSklad')
  );
end;

procedure TfrmSebestOtgr.ProcessTovar;
begin
  dmdEx.SetIntegerParamValue(
    cdsRasx.Params.ParamByName('id_tovar_in'),
    setT.GetPluginResult('fmSettingsTovar')
  );
end;

procedure TfrmSebestOtgr.ProcessMode;
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
  if sTemp = '4' then begin
    cdsRasx.Params.ParamByName('mode').AsInteger := 5;
  end;
  if sTemp = '5' then begin
    cdsRasx.Params.ParamByName('mode').AsInteger := 6;
  end;
end;

procedure TfrmSebestOtgr.UpdateCaption;
var
  sTemp : string;
begin
try
  sTemp := 'Отчёт по себестоимости отгрузок.'
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

procedure TfrmSebestOtgr.actRefreshExecute(Sender: TObject);
begin
try
	dmdEx.StartWaiting;
  cdsRasx.Close;
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
  AssertInternal('4BCFDDD1-66DF-465D-8657-F984D2CBD785');
end;
end;

procedure  TfrmSebestOtgr.actDetailExecute(Sender: TObject);
var
  frmSebestOtgr : TfrmSebestOtgr;
  frmSebestOstDet : TfrmSebestOstDet3;
  varIdTovar : variant;
  varIdSklad : variant;
  varIdZak : variant;
  varIdManager : variant;
  varIdNakl : variant;
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
    if iTemp=6 then begin
      varIdNakl := cdsRasx.FieldByName('id_nakl').AsInteger;
      varIdManager :=cdsRasx.FieldByName('id_manager').AsInteger;
      varIdZak :=cdsRasx.FieldByName('id_zak').AsInteger;
      varIdSklad :=cdsRasx.FieldByName('id_sklad').AsInteger;
    end;
    frmSebestOtgr := TfrmSebestOtgr.Create(Application);
    frmSebestOtgr.ShowDetail(
      cdsRasx.Params.ParamByName('mode').asInteger,
      cdsRasx.Params.ParamByName('dat_from').AsDate,
      cdsRasx.Params.ParamByName('dat_to').AsDate,
      varIdZak,
      varIdManager,
      varIdSklad,
      varIdTovar,
      varIdNakl);
  end else begin
    //group=none
    frmSebestOstDet := TfrmSebestOstDet3.Create(Application);
    varCurrency := Null;
    varDate := Null;
    frmSebestOstDet.ShowDetail(
      3,
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

procedure TfrmSebestOtgr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmSebestOtgr.frRasxGetValue(const ParName: String;
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
except
	AssertInternal('A309C04A-3394-44C3-87C7-3B795D6A250F');
end;
end;

procedure TfrmSebestOtgr.FillSklad;
begin
try
  //setT.actManagerOff.Execute;

  SettingsTipDetail := setT.createplugin('TfmSettingsTipDetail');
  SettingsTipDetail.SetLabelValue('Тип документов');
  SettingsTipDetail.AddDetailTip('По недостачам');
  SettingsTipDetail.AddDetailTip('По излишкам');
  SettingsTipDetail.AddDetailTip('По отгрузкам');
  SettingsTipDetail.AddDetailTip('По хранению');
  SettingsTipDetail.AddDetailTip('По приходам');
  SettingsTipDetail.AddDetailTip('По приходам от хранения');
  setT.AddPlugin(SettingsTipDetail);
  SettingsTipDetail.SetKeyValue(2);

  SettingsTipGroup := setT.createplugin('TfmSettingsTipGroup');
  SettingsTipGroup.AddDetailTip('<Без группировки>');
  SettingsTipGroup.AddDetailTip('По складам');
  SettingsTipGroup.AddDetailTip('По товарам');
  SettingsTipGroup.AddDetailTip('По покупателям');
  SettingsTipGroup.AddDetailTip('По менеджерам');
  SettingsTipGroup.AddDetailTip('По аналогам');
  SettingsTipGroup.AddDetailTip('По отгрузкам');
  setT.AddPlugin(SettingsTipGroup);
  SettingsTipGroup.SetKeyValue(0);


  SettingsSklad := setT.CreatePlugin('TfmSettingsSklad');
  SettingsSklad.SetResultType(1);
  setT.AddPlugin(SettingsSklad);

  SettingsTovar := setT.CreatePlugin('TfmSettingsTovar');
  setT.AddPlugin(SettingsTovar);

  SettingsClient := sett.CreatePlugin('TfmSettingsClient');
  setT.AddPlugin(SettingsClient);

except
  AssertInternal('84C325BF-DBC3-4E7A-8323-F711FBFB67D1');
end;
end;

procedure TfrmSebestOtgr.Button1Click(Sender: TObject);
begin
  if setT.ChangeSettings=mrOk then begin
    showmessage(setT.GetPluginResult('fmSettingsSklad'));
  end;
end;

procedure TfrmSebestOtgr.FormDestroy(Sender: TObject);
begin
  setT.Free;
end;

procedure TfrmSebestOtgr.FillManager;
begin
  setT.actManagerOff.Execute;
  SettingsManager := setT.CreatePlugin('TfmSettingsManager');
  setT.AddPlugin(SettingsManager);
end;

procedure TfrmSebestOtgr.actSettingsExecute(Sender: TObject);
begin
  actSettings.checked := setT.ProcessSettingsChange(actRefresh);
end;

procedure TfrmSebestOtgr.dbgRasxDblClick(Sender: TObject);
begin
  actDetail.Execute;
end;

procedure TfrmSebestOtgr.dbgRasxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return : begin
      actDetail.Execute;
    end;
  end;//case
end;

procedure TfrmSebestOtgr.actCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmSebestOtgr.ShowDetail(mode: integer; dat_from,dat_to,
  id_zak_in,id_manager_in, id_sklad_in, id_tovar_in, id_nakl_in : variant);
begin
  SettingsSklad.SetKeyValue(id_sklad_in);
  SettingsTovar.SetKeyValue(id_tovar_in);
  SettingsClient.SetKeyValue(id_zak_in);
  SettingsTipDetail.SetKeyValue(mode-1);
  SettingsTipGroup.SetKeyValue(0);
  SettingsManager.SetKeyValue(id_manager_in);
  setT.DateFrom := dat_from;
  setT.DateTo := dat_to;
  if id_nakl_in <> Null then begin
    cdsRasx.Filter := 'id_nakl='+inttostr(vartoint(id_nakl_in,true));
    cdsRasx.Filtered := true;
  end;
  actRefresh.Execute;
end;

procedure TfrmSebestOtgr.actDebugExecute(Sender: TObject);
begin
  actDebug.Checked := not actDebug.Checked;
  if actDebug.Checked then begin
    //показать колонки с номерами складов и товаров
    ColumnByName(dbgRasx.Columns,'ID_NAKL').visible := true;
    ColumnByName(dbgRasx.Columns,'ID_IZG').visible := true;
    ColumnByName(dbgRasx.Columns,'ID_ZAK').visible := true;
    ColumnByName(dbgRasx.Columns,'ID_MANAGER').visible := true;
    ColumnByName(dbgRasx.Columns,'ID_TOVAR').visible := true;
    ColumnByName(dbgRasx.Columns,'ID_SKLAD').visible := true;
    ColumnByName(dbgRasx.Columns,'ID_ANALOG').visible := true;
    //ColumnByName(dbgRasx.Columns,'NDS_SEBEST_IN_CURRENCY').visible := true;
  end else begin //if actDebug checked
    ColumnByName(dbgRasx.Columns,'ID_NAKL').visible := false;
    ColumnByName(dbgRasx.Columns,'ID_IZG').visible := false;
    ColumnByName(dbgRasx.Columns,'ID_ZAK').visible := false;
    ColumnByName(dbgRasx.Columns,'ID_MANAGER').visible := false;
    ColumnByName(dbgRasx.Columns,'ID_TOVAR').visible := false;
    ColumnByName(dbgRasx.Columns,'ID_SKLAD').visible := false;
    ColumnByName(dbgRasx.Columns,'ID_ANALOG').visible := false;
    //ColumnByName(dbgRasx.Columns,'NDS_SEBEST_IN_CURRENCY').visible := false;
  end;  //if actDebug checked
end;

procedure TfrmSebestOtgr.ProcessClient;
begin
  dmdEx.SetIntegerParamValue(
    cdsRasx.Params.ParamByName('id_zak_in'),
    setT.GetPluginResult('fmSettingsClient')
  );
end;

procedure TfrmSebestOtgr.ProcessManager;
begin
  dmdEx.SetIntegerParamValue(
    cdsRasx.Params.ParamByName('id_manager_in'),
    setT.GetPluginResult('fmSettingsManager')
  );
end;

procedure TfrmSebestOtgr.ProcessDate;
var
  dFrom, dTo : Tdate;
begin
  dFrom := setT.DateFrom;
  dTo := setT.DateTo;
  cdsRasx.Params.ParamByName('dat_from').AsDate := dFrom;
  cdsRasx.Params.ParamByName('dat_to').AsDate := dTo;
end;

procedure TfrmSebestOtgr.ProcessGroup;
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
      qeRasx.SetSQL('select','r.dat,r.id, r.id_nakl,r.id_izg,r.id_zak,r.id_manager,'+
        'r.id_sklad,r.id_tovar, r.id_analog, r.kolotp,r.nds_fact,r.nds_sebest,'+
        'r.nds_sebest_in_currency, r.doxod,r.rent',
        0);
      qeRasx.SetSQL('group by','',0);
      qeRasx.Prepare;
      ///ColumnByName(dbgRasx.Columns,'ANALOG').Visible := false;
      ColumnByName(dbgRasx.Columns,'DAT').Visible := true;
      ColumnByName(dbgRasx.Columns,'ID').Visible := true;
      ColumnByName(dbgRasx.Columns,'IZG').Visible := true;
      ColumnByName(dbgRasx.Columns,'ZAK').Visible := true;
      ColumnByName(dbgRasx.Columns,'MANAGER').Visible := true;
      ColumnByName(dbgRasx.Columns,'TOVAR').Visible := true;
      ColumnByName(dbgRasx.Columns,'SKLAD').Visible := true;
      ColumnByName(dbgRasx.Columns,'ANALOG').Visible := true;

      ColumnByName(dbgRasx.Columns,'ANALOG').Width := 20;
      ColumnByName(dbgRasx.Columns,'DAT').Footer.ValueType :=fvtCount;
      //Только в режиме без группировки
      actShowNakl.Visible :=true;
    end;
    1: begin
      qeRasx.SetSQL('select',
        'cast(null as timestamp) as dat, cast(null as varchar(30)) as id, cast(null as integer) as id_izg, '+
        'cast(null as integer) as id_nakl,'+
        'cast(null as integer) as id_zak, cast(null as integer) as id_manager, '+
        'cast (null as integer) as id_tovar, '+
        'cast (null as integer) as id_analog, '+
        'r.id_sklad, sum(r.kolotp) as kolotp, '+
        'sum(r.nds_fact) as nds_fact,sum(r.nds_sebest) as nds_sebest,'+
        'sum(r.nds_sebest_in_currency) as nds_sebest_in_currency,'+
        'sum(r.doxod) as doxod,dzero(sum(r.doxod)*100,sum(r.nds_sebest),0) as rent',
        0);
      qeRasx.SetSQL('group by','r.id_sklad',0);
      qeRasx.Prepare;
      ColumnByName(dbgRasx.Columns,'DAT').Visible := false;
      ColumnByName(dbgRasx.Columns,'ID').Visible := false;
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
        'cast(null as timestamp) as dat, cast(null as varchar(30)) as id, cast(null as integer) as id_izg, '+
        'cast(null as integer) as id_nakl,'+
        'cast(null as integer) as id_zak, cast(null as integer) as id_manager, '+
        'cast (null as integer) as id_sklad, '+
        'cast (null as integer) as id_analog, '+
        'r.id_tovar, sum(r.kolotp) as kolotp,'+
        'sum(r.nds_fact) as nds_fact,sum(r.nds_sebest) as nds_sebest,'+
        'sum(r.nds_sebest_in_currency) as nds_sebest_in_currency,'+
        'sum(r.doxod) as doxod,dzero(sum(r.doxod)*100,sum(r.nds_sebest),0) as rent',
        0);
      qeRasx.SetSQL('group by','r.id_tovar',0);
      qeRasx.Prepare;
      ColumnByName(dbgRasx.Columns,'DAT').Visible := false;
      ColumnByName(dbgRasx.Columns,'ID').Visible := false;
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
        'cast(null as timestamp) as dat, cast(null as varchar(30)) as id, cast(null as integer) as id_izg, '+
        'cast(null as integer) as id_nakl,'+
        'cast(null as integer) as id_manager, '+
        'cast (null as integer) as id_sklad, '+
        'cast (null as integer) as id_tovar, '+
        'cast (null as integer) as id_analog, '+
        'r.id_zak, sum(r.kolotp) as kolotp,'+
        'sum(r.nds_fact) as nds_fact,sum(r.nds_sebest) as nds_sebest,'+
        'sum(r.nds_sebest_in_currency) as nds_sebest_in_currency,'+
        'sum(r.doxod) as doxod,dzero(sum(r.doxod)*100,sum(r.nds_sebest),0) as rent',
        0);
      qeRasx.SetSQL('group by','r.id_zak',0);
      qeRasx.Prepare;
      ColumnByName(dbgRasx.Columns,'DAT').Visible := false;
      ColumnByName(dbgRasx.Columns,'ID').Visible := false;
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
        'cast(null as timestamp) as dat, cast(null as varchar(30)) as id, cast(null as integer) as id_izg, '+
        'cast(null as integer) as id_nakl,'+
        'cast(null as integer) as id_manager, '+
        'cast (null as integer) as id_sklad, '+
        'cast (null as integer) as id_tovar, '+
        'cast (null as integer) as id_analog, '+
        'r.id_manager, sum(r.kolotp) as kolotp,'+
        'sum(r.nds_fact) as nds_fact,sum(r.nds_sebest) as nds_sebest,'+
        'sum(r.nds_sebest_in_currency) as nds_sebest_in_currency,'+
        'sum(r.doxod) as doxod,dzero(sum(r.doxod)*100,sum(r.nds_sebest),0) as rent',
        0);
      qeRasx.SetSQL('group by','r.id_manager',0);
      qeRasx.Prepare;
      ColumnByName(dbgRasx.Columns,'DAT').Visible := false;
      ColumnByName(dbgRasx.Columns,'ID').Visible := false;
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
        'cast(null as timestamp) as dat, cast(null as varchar(30)) as id, cast(null as integer) as id_izg, '+
        'cast(null as integer) as id_nakl,'+
        'cast(null as integer) as id_zak, cast(null as integer) as id_manager, '+
        'cast (null as integer) as id_sklad, '+
        'cast (null as integer) as id_tovar, '+
        'r.id_analog, sum(r.kolotp) as kolotp,'+
        'sum(r.nds_fact) as nds_fact,sum(r.nds_sebest) as nds_sebest,'+
        'sum(r.nds_sebest_in_currency) as nds_sebest_in_currency,'+
        'sum(r.doxod) as doxod,dzero(sum(r.doxod)*100,sum(r.nds_sebest),0) as rent',
        0);
      qeRasx.SetSQL('group by','r.id_analog',0);
      qeRasx.Prepare;
      ColumnByName(dbgRasx.Columns,'DAT').Visible := false;
      ColumnByName(dbgRasx.Columns,'ID').Visible := false;
      ColumnByName(dbgRasx.Columns,'IZG').Visible := false;
      ColumnByName(dbgRasx.Columns,'ZAK').Visible := false;
      ColumnByName(dbgRasx.Columns,'MANAGER').Visible := false;
      ColumnByName(dbgRasx.Columns,'SKLAD').Visible := false;
      ColumnByName(dbgRasx.Columns,'TOVAR').Visible := false;
      ColumnByName(dbgRasx.Columns,'ANALOG').Visible := true;
      ColumnByName(dbgRasx.Columns,'ANALOG').Footer.ValueType :=fvtCount;
    end;
    6: begin
      qeRasx.SetSQL('select',
        'r.dat, r.id, r.id_nakl, r.id_izg, r.id_zak, r.id_manager,'+
        'r.id_sklad, ' +
        'cast (null as integer) as id_tovar, ' +
        'cast (null as integer) as id_analog, ' +
        'sum(r.kolotp) as kolotp, ' +
        'sum(r.nds_fact) as nds_fact,sum(r.nds_sebest) as nds_sebest, ' +
        'sum(r.nds_sebest_in_currency) as nds_sebest_in_currency, ' +
        'sum(r.doxod) as doxod,dzero(sum(r.doxod)*100,sum(r.nds_sebest),0) as rent',
        0);
      qeRasx.SetSQL('group by','r.dat, r.id, r.id_nakl, r.id_izg, r.id_zak, r.id_manager, r.id_sklad',0);
      qeRasx.Prepare;
      ColumnByName(dbgRasx.Columns,'DAT').Visible := true;
      ColumnByName(dbgRasx.Columns,'ID').Visible := true;
      ColumnByName(dbgRasx.Columns,'IZG').Visible := true;
      ColumnByName(dbgRasx.Columns,'ZAK').Visible := true;
      ColumnByName(dbgRasx.Columns,'MANAGER').Visible := true;
      ColumnByName(dbgRasx.Columns,'SKLAD').Visible := true;
      ColumnByName(dbgRasx.Columns,'TOVAR').Visible := false;
      ColumnByName(dbgRasx.Columns,'ANALOG').Visible := false;
      ColumnByName(dbgRasx.Columns,'DAT').Footer.ValueType :=fvtCount;
    end;
  end;//case
except
  AssertInternal('3E95BAD6-091A-40AB-8470-44DAED3570DB')
end;
end;

procedure TfrmSebestOtgr.actShowNaklExecute(Sender: TObject);
begin
  OpenDocument(self,cdsRasx.FieldByName('id_nakl').asInteger,0,0);
end;

procedure TfrmSebestOtgr.FillSettings;
begin
  FillSklad;
	FillDate;
  FillManager;
end;

end.

