unit untRealPrice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms,
  Dialogs, DBCtrls, untUnfDbLookupListbox,
  Grids, DBGrids,
  DB, DBTables,
  StdCtrls, QueryExtender,  //database
  untRound, //roundto
  untSettings, //frmSettings
  Buttons, ActnList,untRealPriceMake, Menus, FMTBcd, DBClient,
  Provider, SqlExpr,
  SettingsPlugin, //TfmSettingsPlugin
  untEx, UnfFilter, DBGridEh, PropStorageEh, PropFilerEh, GridsEh

  ;

type
  TfrmRealPrice = class(TForm)
    dsNaklr: TDataSource;
    dtsNaklrt: TDataSource;
    dtsPrice: TDataSource;
    qePrice: TQueryExtender;
    ActionList1: TActionList;
    actSettings: TAction;
    qeNaklr: TQueryExtender;
    qeNaklrt: TQueryExtender;
    btnSettings: TBitBtn;
    bntRecalc: TBitBtn;
    actNdsFactRecalc: TAction;
    btnRefresh: TBitBtn;
    actRefresh: TAction;
    actOnlyEmpty: TAction;
    BitBtn1: TBitBtn;
    dsTemp: TDataSource;
    actRealMake: TAction;
    MainMenu1: TMainMenu;
    mnuActions: TMenuItem;
    sdsNaklr: TSQLDataSet;
    dspNaklr: TDataSetProvider;
    cdsNaklr: TClientDataSet;
    cdsNaklrID_IZG: TIntegerField;
    cdsNaklrID_ZAK: TIntegerField;
    cdsNaklrID_MANAGER: TIntegerField;
    cdsNaklrID_NAKL: TIntegerField;
    cdsNaklrIZG: TStringField;
    cdsNaklrZAK: TStringField;
    cdsNaklrMANAGER: TStringField;
    cdsNaklrDAT: TSQLTimeStampField;
    cdsNaklrDAT_FACT: TSQLTimeStampField;
    cdsNaklrIZG2: TStringField;
    cdsNaklrOTKAT: TFloatField;
    cdsNaklrNDS2: TFMTBCDField;
    cdsNaklrNDS_FACT2: TFMTBCDField;
    cdsNaklrID: TStringField;
    UnfFilter1: TUnfFilter;
    N1: TMenuItem;
    N2: TMenuItem;
    PropStorageEh1: TPropStorageEh;
    RegPropStorageManEh1: TRegPropStorageManEh;
    actRefreshRecord: TAction;
    N3: TMenuItem;
    dbgNaklr: TDBGridEh;
    sdsNaklrID: TStringField;
    sdsNaklrDAT: TSQLTimeStampField;
    sdsNaklrDAT_FACT: TSQLTimeStampField;
    sdsNaklrNDS_FACT: TFMTBCDField;
    sdsNaklrID_IZG: TIntegerField;
    sdsNaklrID_ZAK: TIntegerField;
    sdsNaklrID_MANAGER: TIntegerField;
    sdsNaklrID_NAKL: TIntegerField;
    sdsNaklrNDS: TFMTBCDField;
    cbxOnlyEmpty: TCheckBox;
    sdsNaklrCOMMENT: TStringField;
    cdsNaklrCOMMENT: TStringField;
    PopupMenu1: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;


    
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actSettingsExecute(Sender: TObject);
    //пересчёт суммы факт при нажатии "пересчитать"
    procedure actRefreshExecute(Sender: TObject);
    procedure actOnlyEmptyExecute(Sender: TObject);
    procedure actRealMakeExecute(Sender: TObject);
    procedure cdsNaklrBeforeScroll(DataSet: TDataSet);
    procedure cdsNaklrCalcFields(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure actRefreshRecordExecute(Sender: TObject);
    procedure dspNaklrGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dbgNaklrDblClick(Sender: TObject);
    procedure dbgNaklrExit(Sender: TObject);
  private
    { Private declarations }
    setT : TfrmSettings;
    SettingsVlad : TfmSettingsPlugin;
    SettingsClient : TfmSettingsPlugin;
    SettingsManager : TfmSettingsPlugin;
    procedure ProcessSettings(ProcessOnlySecurityMeasures:boolean=false);

  public
    { Public declarations }
    function Defaultopen:boolean;
    procedure DefaultStartup;
  end;

var
  frmRealPrice: TfrmRealPrice;

implementation

uses AtsAssert,
  SkladAux //ProcessSettingsVladClientManager
;

{$R *.dfm}

procedure TfrmRealPrice.FormCreate(Sender: TObject);
begin
  dmdEx.OpenQuery(dmdEx.cdsAllClient);
  dmdEx.OpenQuery(dmdEx.cdsManager);
  qeNaklr.DefSql := sdsNaklr.CommandText;

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
  ProcessSettings(true);
  //Конец инициализации настроек

end;

procedure TfrmRealPrice.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if dbgNaklr.DataSource.DataSet.State = dsEdit then begin
    dbgNaklr.DataSource.DataSet.Post;
    ApplyOrCancel(dbgNaklr.DataSource.DataSet);
  end;
  Action := caFree;
end;

procedure TfrmRealPrice.actSettingsExecute(Sender: TObject);
begin
  //actSettings.checked := setT.ProcessSettingsChange(actRefresh);
  actSettings.checked := setT.ProcessSettingsChange2(DefaultOpen);
end;  

procedure TfrmRealPrice.actRefreshExecute(Sender: TObject);
begin
  dmdEx.StartWaiting;
  //ProcessSettings;
  //DefaultOpen;
  qeNaklr.Refresh;
  dmdEx.stopwaiting;
end;

procedure TfrmRealPrice.actOnlyEmptyExecute(Sender: TObject);
begin
  { TODO : Чтоб работала галочка внести в факт ценах }
  if cbxOnlyEmpty.Checked then begin
    qeNaklr.SetSQL('where',
      'exists (select * from naklrt b where b.nakl=n.nakl and b.cena_fact=0)',
      3);
  end
  else begin
    qeNaklr.SetSQL('where','',3);
  end;
  qeNaklr.Refresh;  
end;

procedure TfrmRealPrice.actRealMakeExecute(Sender: TObject);
var
  frmRealPriceMake : TfrmRealPriceMake;
begin
  if not (dsNaklr.DataSet.eof and dsNaklr.DataSet.bof) then begin
    frmRealPriceMake :=TfrmRealPriceMake.Create (self);
    frmRealPriceMake.dsNakloEdit.DataSet := cdsNaklr;
    frmRealPriceMake.ShowNakl ( dsNaklr.DataSet.FieldByName('id_nakl').AsInteger);
  end else begin
    showmessage('Нет накладной для изменения');
  end;
end;

procedure TfrmRealPrice.cdsNaklrBeforeScroll(DataSet: TDataSet);
begin
  ApplyOrCancel(DataSet);
end;

procedure TfrmRealPrice.cdsNaklrCalcFields(DataSet: TDataSet);
begin
  if DataSet.State = dsInternalCalc then begin
    DataSet.FieldByName('OTKAT').AsFloat :=
      DataSet.FieldByName('NDS').AsFloat-
      DataSet.FieldByName('NDS_FACT').AsFloat;
  end;
end;

procedure TfrmRealPrice.FormDestroy(Sender: TObject);
begin
  dmdEx.CloseQuery(dmdEx.cdsAllClient,false);
  dmdEx.CloseQuery(dmdEx.cdsManager,false);
end;

procedure TfrmRealPrice.ProcessSettings(ProcessOnlySecurityMeasures:boolean=false);
begin
try
  ProcessSettingsVladClientManager(qeNaklr,setT,ProcessOnlySecurityMeasures);
  self.Caption := UpdateCaptionVladClientManager('Факт цены:',setT);
except
  AssertInternal('4AC3D907-EF7C-4ADA-BA69-1980181FFE84');
end;
end;

function TfrmRealPrice.Defaultopen:boolean;
begin
  ProcessSettings; 
  Result:=DefaultOpenInputForm(qeNaklr);
end;

procedure TfrmRealPrice.DefaultStartup;
begin
try
  SettingsManager.SetKeyValue(dmdEx.GetIdManager);
  ProcessSettings;
  { TODO : При старте запускаются накладные этого менеджера за месяц }
  //DefaultOpen;
except
  AssertInternal('60C5DB14-2A05-4343-AAF7-148C1C6AADF8');
end;
end;

procedure TfrmRealPrice.actRefreshRecordExecute(Sender: TObject);
begin
  cdsNaklr.RefreshRecord;
end;

procedure TfrmRealPrice.dspNaklrGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
  TableName := 'NAKLR_VW';
end;

procedure TfrmRealPrice.dbgNaklrDblClick(Sender: TObject);
begin
  actRealMake.Execute;
end;

procedure TfrmRealPrice.dbgNaklrExit(Sender: TObject);
begin
  if dbgNaklr.DataSource.DataSet.State = dsEdit then begin
    dbgNaklr.DataSource.DataSet.Post;
    ApplyOrCancel(dbgNaklr.DataSource.DataSet);
  end;
end;

end.
