unit SebestOst3;

interface

uses
  Windows, Messages, SysUtils,
  Variants, Classes,
  Graphics, Controls, Forms,
  Dialogs,
  FMTBcd, DBClient, Provider, SqlExpr, DBGridEh, PropFilerEh, Menus,
  PropStorageEh, UnfFilter, QueryExtender, DB,   
  ActnList, StdCtrls, Buttons, GridsEh, frxClass, frxDBSet, 
  DBGrids,
  DateUtils,
  ATSAssert,
  untSkladRasxDetEx,
  untSettings,
  SettingsPlugin, //fmSettingsPlugin
  SettingsNumber, //fmSettingsNumber
  SettingsTipDetail , //fmSettingsDetailTip
  SettingsDate , //fmSettingsDate
  SebestOstDet3, //TfrmSebestOstDet
  untRound //ColumnByName
  ;

type
  TfrmSebestOst3 = class(TForm)
    dsRasx: TDataSource;
    ActionList1: TActionList;
    actRefresh: TAction;
    actDetail: TAction;
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
    cdsRasxID_SKLAD: TIntegerField;
    cdsRasxID_TOVAR: TIntegerField;
    cdsRasxID_PARTIYA: TFMTBCDField;
    cdsRasxKOLOTP: TFloatField;
    cdsRasxSEBEST: TFloatField;
    cdsRasxSEBESTSUM: TFloatField;
    cdsRasxSKLAD: TStringField;
    cdsRasxTOVAR: TStringField;
    PropStorageEh2: TPropStorageEh;
    rpsSebestOst2: TRegPropStorageManEh;
    cdsRasxDAT: TSQLTimeStampField;
    actDebug: TAction;
    N6: TMenuItem;
    cdsRasxID_MANAGER: TIntegerField;
    cdsRasxMANAGER: TStringField;
    cdsRasxANALOG: TStringField;
    sdsSebestRecount: TSQLDataSet;
    actPartiyaRecount: TAction;
    N7: TMenuItem;
    N8: TMenuItem;
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
    procedure cdsRasxCalcFields(DataSet: TDataSet);
    procedure actDebugExecute(Sender: TObject);
    procedure actPartiyaRecountExecute(Sender: TObject);
  private
    { Private declarations }
    SettingsSklad : TfmSettingsPlugin;
    SettingsNumber : TfmSettingsNumber;
    SettingsTovar : TfmSettingsPlugin;
    SettingsTipDetail : TfmSettingsPlugin;
    SettingsDate : TfmSettingsDate;
    //заполнение и выбор текущей даты - месяца
    procedure FillDate;
    //готовимся к выбору склада
    procedure FillSklad;

    procedure UpdateCaption;
    procedure ProcessSklad;
    procedure ProcessTovar;

    procedure ProcessMode;
    procedure ProcessDate;
    procedure ProcessPartiyaRecount(sMode: string);
    procedure ProcessSettings;
  public
    setT : TfrmSettings;
    function Defaultopen:boolean;
    procedure ShowDetail(mode: integer;
      id_sklad_in : variant;
      id_tovar_in :variant;
      id_currency_to : variant;
      dat_to : variant
    );
    { Public declarations }

  end;
  procedure ProcessPartRecount (dbgNaklot: TDBGridEh;param:variant;Object1:Pointer=nil );

var
  frmSebestOst3: TfrmSebestOst3;

implementation

uses untEx,
  SqlTimSt;  //Sqltimestamp;

{$R *.dfm}

procedure TfrmSebestOst3.FormCreate(Sender: TObject);
begin
	dmdEx.startwaiting;
	cdsRasx.CommandText:=sdsRasx.CommandText;
	qeRasx.DefSql := sdsRasx.CommandText;
	//заполняем
  setT := TfrmSettings.Create(self);
  FillSklad;
	FillDate;
end;


//заполнение и выбор текущей даты - месяца
procedure TfrmSebestOst3.FillDate;
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


procedure TfrmSebestOst3.ProcessSklad;
var
  sTemp : string;
begin
  sTemp := setT.GetPluginResult('fmSettingsSklad');
  if (setT.GetPluginResult('fmSettingsTipDetail') <> '3') then begin
    //по умолчанию склад ставиться из панели выбора складов
    if sTemp = '' then begin
      cdsRasx.Params.ParamByName('id_sklad_in').Clear;
    end else begin
      cdsRasx.Params.ParamByName('id_sklad_in').AsString := sTemp;
    end; //if все склады
  end else begin
    //а если режим по накладным, то номер накладной
    //вводиться руками и ставиться в параметр id_sklad_in
    sTemp := setT.GetPluginResult('fmSettingsNumber');
    if sTemp = '' then begin
      sTemp := '0';
    end;
    cdsRasx.Params.ParamByName('id_sklad_in').AsString := sTemp;
  end
end;

procedure TfrmSebestOst3.ProcessTovar;
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

procedure TfrmSebestOst3.ProcessPartiyaRecount(sMode: string);
begin
  actPartiyaRecount.Enabled := false;
  //по партиям
  if sMode = '2' then begin
    actPartiyaRecount.Enabled := true;
  end;
end;

procedure TfrmSebestOst3.ProcessMode;
var
  sTemp : string;
begin
  sTemp := setT.GetPluginResult('fmSettingsTipDetail');
  ProcessPartiyaRecount(sTemp);

  //'По складам'
  if sTemp = '0' then begin
    cdsRasx.Params.ParamByName('mode').AsInteger := 1;
    //cdsRasx.Params.ParamByName('dat_to').Clear;
    qeRasx.SetSQL('order by','1',0);
    ColumnByName(dbgRasx.Columns,'TOVAR').visible:=false;
    ColumnByName(dbgRasx.Columns,'ID_PARTIYA').visible:=false;
    ColumnByName(dbgRasx.Columns,'DAT').visible:=true;
    ColumnByName(dbgRasx.Columns,'MANAGER').visible:=false;
    ColumnByName(dbgRasx.Columns,'ANALOG').visible:=false;
    exit;
  end;
  //по партиям
  if sTemp = '2' then begin
    cdsRasx.Params.ParamByName('mode').AsInteger := 3;
    //cdsRasx.Params.ParamByName('dat_to').Clear;
    qeRasx.SetSQL('order by','1, 2, 5 ',0);
    ColumnByName(dbgRasx.Columns,'TOVAR').visible:=true;
    ColumnByName(dbgRasx.Columns,'ID_PARTIYA').visible:=true;
    ColumnByName(dbgRasx.Columns,'DAT').visible:=true;
    ColumnByName(dbgRasx.Columns,'MANAGER').visible:=false;
    ColumnByName(dbgRasx.Columns,'ANALOG').visible:=true;
    exit;
  end;
  //по накладным
  if sTemp = '3' then begin
    cdsRasx.Params.ParamByName('mode').AsInteger := 4;
    //cdsRasx.Params.ParamByName('dat_to').Clear;
    qeRasx.SetSQL('order by','1, 2, 5 ',0);
    ColumnByName(dbgRasx.Columns,'TOVAR').visible:=true;
    ColumnByName(dbgRasx.Columns,'ID_PARTIYA').visible:=true;
    ColumnByName(dbgRasx.Columns,'DAT').visible:=true;
    ColumnByName(dbgRasx.Columns,'MANAGER').visible:=false;
    ColumnByName(dbgRasx.Columns,'ANALOG').visible:=true;
    exit;
  end;
  //по товарам по умолчанию,
  cdsRasx.Params.ParamByName('mode').AsInteger := 2;
  //cdsRasx.Params.ParamByName('dat_to').Clear;
  qeRasx.SetSQL('order by','1, 2',0);
  ColumnByName(dbgRasx.Columns,'TOVAR').visible:=true;
  ColumnByName(dbgRasx.Columns,'ID_PARTIYA').visible:=false;
  ColumnByName(dbgRasx.Columns,'DAT').visible:=true;
  ColumnByName(dbgRasx.Columns,'MANAGER').visible:=false;
  ColumnByName(dbgRasx.Columns,'ANALOG').visible:=true;
end;

procedure TfrmSebestOst3.UpdateCaption;
var
  sTemp : string;
begin
try
  sTemp := 'Отчёт по себестоимости склада.'
  + ' Тип отчёта: '
  + setT.GetPluginTextResult('fmSettingsTipDetail');
  if setT.GetPluginTextResult('fmSettingsSklad')<>'' then begin
    sTemp := sTemp + '. Склад: '
    + setT.GetPluginTextResult('fmSettingsSklad');
  end;
  if (setT.GetPluginTextResult('fmSettingsTipDetail')<>'По складам') then begin
    //если товар не выбран, то нечего его высвечивать в названии
    if (setT.GetPluginTextResult('fmSettingsTovar')<>'') then begin
      sTemp := sTemp + '. Товар: ' +
        setT.GetPluginTextResult('fmSettingsTovar');
    end;
  end;
  self.Caption := sTemp;
except
  AssertInternal('8F0E4FA4-191E-45DF-A61D-E8D599FFE7A2');
end;
end;

procedure TfrmSebestOst3.actRefreshExecute(Sender: TObject);
begin
try
	dmdEx.StartWaiting;
  //cdsRasx.Close;
	qeRasx.Refresh;
	dmdEx.StopWaiting;
except
  AssertInternal('80F3503A-043B-48D6-AA5A-2142FC539485');
end;
end;

procedure TfrmSebestOst3.ProcessSettings;
begin
  ProcessTovar;
  ProcessSklad;
  ProcessMode;
  ProcessDate;
  UpdateCaption;
end;
 
procedure  TfrmSebestOst3.actDetailExecute(Sender: TObject);
var
  frmSebestOst : TfrmSebestOst3;
  frmSebestOstDet :  TfrmSebestOstDet3;
  varTovar : variant;
  varSklad : variant;
  varCurrency : variant;
  varDate : variant;
begin
try

  if cdsRasx.Params.ParamByName('mode').asInteger <= 2 then begin
    frmSebestOst := TfrmSebestOst3.Create(Application);
    varSklad := cdsRasx.FieldByName('id_sklad').AsInteger;
    if cdsRasx.Params.ParamByName('mode').asInteger > 1 then begin
      varTovar := cdsRasx.FieldByName('id_tovar').AsInteger;
    end else begin
      varTovar := Null;
    end;
    varCurrency := Null;
    varDate := Null;
    if not cdsRasx.Params.ParamByName('dat_to').IsNull then begin
      varDate := cdsRasx.Params.ParamByName('dat_to').AsDateTime;
    end;

    frmSebestOst.ShowDetail(
      cdsRasx.Params.ParamByName('mode').asInteger,
      varSklad,
      varTovar,
      varCurrency,
      varDate
    );
    frmSebestOst.Show;
  end; //if mode<=2
  if (cdsRasx.Params.ParamByName('mode').asInteger in [3,4]) then begin
    frmSebestOstDet := TfrmSebestOstDet3.Create(Application);
    varCurrency := Null;
    varDate := Null;
    frmSebestOstDet.ShowDetail(
      1,
      cdsRasx.FieldByName('id_sklad').AsInteger,
      cdsRasx.FieldByName('id_tovar').AsInteger,
      varCurrency,
      varDate,
      VarFMTBcdCreate(cdsRasx.FieldByName('id_partiya').AsBCD),
      Null
    );
  end;
except
  AssertInternal('E9B478FE-A2AC-4945-8D40-6DAD9F5F8D14');
end;
end;

procedure TfrmSebestOst3.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmSebestOst3.frRasxGetValue(const ParName: String;
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

procedure TfrmSebestOst3.FillSklad;
var
  iSkladUkk : integer;
begin
try
  setT.actManagerOff.Execute;
  setT.actDataOff.Execute;
  SettingsTipDetail := setT.CreatePlugin('TfmSettingsTipDetail');
  SettingsTipDetail.AddDetailTip('По складам');
  SettingsTipDetail.AddDetailTip('По товарам');
  SettingsTipDetail.AddDetailTip('По партиям');
  SettingsTipDetail.AddDetailTip('По накладным');
  setT.AddPlugin(SettingsTipDetail);

  SettingsSklad := setT.CreatePlugin('TfmSettingsSklad');
  SettingsSklad.SetResultType(1);
  setT.AddPlugin(SettingsSklad);
  //SettingsSklad2.dlcSklad.KeyValue := 0;

  iSkladUkk:=dmdEx.GetOidObjects('ТИП НАЗВАНИЯ СКЛАДОВ',-100);
  iSkladUkk:=dmdEx.GetOidObjects('Все склады УКК',iSkladUkk);
  SettingsSklad.SetKeyValue(iSkladUkk);
  SettingsTovar := setT.CreatePlugin('TfmSettingsTovar');
  setT.AddPlugin(SettingsTovar);
  SettingsNumber := TfmSettingsNumber.Create(setT);
  setT.AddPlugin(SettingsNumber);
  SettingsDate := TfmSettingsDate.Create(setT);
  setT.AddPlugin(SettingsDate);
except
  AssertInternal('A665C6D4-B842-4BC4-8312-08F79B71D881');
end;
end;

procedure TfrmSebestOst3.Button1Click(Sender: TObject);
begin
  if setT.ChangeSettings=mrOk then begin
    showmessage(setT.GetPluginResult('fmSettingsSklad'));
  end;
end;

procedure TfrmSebestOst3.FormDestroy(Sender: TObject);
begin
  setT.Free;
end;

procedure TfrmSebestOst3.actSettingsExecute(Sender: TObject);
begin
  actSettings.checked := setT.ProcessSettingsChange2(DefaultOpen);
//  actRefresh
end;

function TfrmSebestOst3.Defaultopen:boolean;
begin
  ProcessSettings;
	actRefresh.Execute;
  Result :=true;
  if not dsRasx.DataSet.Active then begin
    Result :=false;
  end;
end;

procedure TfrmSebestOst3.dbgRasxDblClick(Sender: TObject);
begin
  actDetail.Execute;
end;

procedure TfrmSebestOst3.dbgRasxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return : begin
      actDetail.Execute;
    end;
  end;//case
end;

procedure TfrmSebestOst3.actCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmSebestOst3.cdsRasxCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('Delta_cena').asCurrency :=
    DataSet.FieldByName('debet_cena').asCurrency -
    DataSet.FieldByName('kredit_cena').AsCurrency;
end;

procedure TfrmSebestOst3.ShowDetail(mode: integer; id_sklad_in, id_tovar_in,
  id_currency_to, dat_to: variant);
begin
  SettingsSklad.SetKeyValue(id_sklad_in);
  SettingsTovar.SetKeyValue(id_tovar_in);
  SettingsDate.SetKeyValue(dat_to);
  SettingsTipDetail.SetKeyValue(mode);
  cdsRasx.Params.ParamValues['dat_to']:=dat_to;
  cdsRasx.Params.ParamValues['id_currency_to']:=id_currency_to;
  DefaultOpen;
end;

procedure TfrmSebestOst3.actDebugExecute(Sender: TObject);
begin
  actDebug.Checked := not actDebug.Checked;
  if actDebug.Checked then begin
    //показать колонки с номерами складов и товаров
    dbgRasx.Columns[9].Visible :=true;
    dbgRasx.Columns[10].Visible :=true;
   //id_manager
    dbgRasx.Columns[11].Visible := true;
  end else begin //if actDebug checked
    dbgRasx.Columns[9].Visible :=false;
    dbgRasx.Columns[10].Visible :=false;
   //id_manager
    dbgRasx.Columns[11].Visible := false;    
  end;  //if actDebug checked
   
end;

procedure TfrmSebestOst3.ProcessDate;
var
  sTemp : string;
begin
  sTemp := setT.GetPluginResult('fmSettingsDate');
  if sTemp<>'' then begin
    cdsRasx.Params.ParamByName('dat_to').AsString := sTemp;
  end else begin
    cdsRasx.Params.ParamByName('dat_to').Clear;
  end;
end;

procedure ProcessPartRecount (dbgNaklot: TDBGridEh; param: variant;Object1: Pointer = nil);
var
  DataSet : TDataSet;
  sdsSebestRecount : TSQLDataSet;
begin
  sdsSebestRecount := TSQLDataSet(Object1);
  DataSet := dbgNaklot.DataSource.DataSet;
  //Перепроводка расходной только по счёту "себестоимость бух"
  dmdEx.StartWaiting;
  sdsSebestRecount.ParamByName('id_tovar_in').asInteger:=
    DataSet.FieldByName('id_tovar').asInteger;
  sdsSebestRecount.ParamByName('id_sklad_in').asInteger:=
    DataSet.FieldByName('id_sklad').asInteger;
{  sdsSebestRecount.ParamByName('dat_from_in').AsSQLTimeStamp:=
   DateTimeToSQLTimeStamp(
          TClientDataSet(DataSet).Params.ParamValues['dat_from']);
}
  sdsSebestRecount.ParamByName('id_partiya_in').asBcd:=
    VarFMTBcdCreate(DataSet.FieldByName('id_partiya').asBcd);
  dmdEx.ExecSQL(sdsSebestRecount);
  dmdex.StopWaiting;
end;

procedure TfrmSebestOst3.actPartiyaRecountExecute(Sender: TObject);
begin
  //Перепроводка расходной только по счёту "себестоимость бух"
  if cdsRasx.eof and cdsRasx.bof then begin
    MessageDlg('Не указана партия для пересчёта',mtWarning,[mbOk],0);
    exit;
  end;
  dmdEx.ColumnSelectAndProcess(dbgRasx, Null, ProcessPartRecount, sdsSebestRecount);
end;




end.

