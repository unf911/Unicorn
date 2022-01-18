unit NaklpOst;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms,
  Dialogs, DBCtrls, untUnfDbLookupListbox,
  Grids, DBGrids,
  DB, DBTables,
  StdCtrls, QueryExtender,  //database
  untRound, //roundto
  untSettings, Buttons, ActnList,untRealPriceMake, Menus, FMTBcd, DBClient,
  Provider, SqlExpr, //frmSettings
  NaklpOstDet, //TfrmNaklpOstDet
  SettingsPlugin, //TfrmSettingsPlugin
  SettingsDataset, //TfrmSettingsDataset
  untEx, UnfFilter, DBGridEh, PropStorageEh, PropFilerEh, GridsEh

  ;

type
  TfrmNaklpOst = class(TForm)
    dsNaklr: TDataSource;
    ActionList1: TActionList;
    actSettings: TAction;
    qeNaklr: TQueryExtender;
    actRefresh: TAction;
    actDetail: TAction;
    MainMenu1: TMainMenu;
    mnuActions: TMenuItem;
    sdsNaklr: TSQLDataSet;
    dspNaklr: TDataSetProvider;
    cdsNaklr: TClientDataSet;
    cdsNaklrDAT: TSQLTimeStampField;
    cdsNaklrID: TStringField;
    UnfFilter1: TUnfFilter;
    N1: TMenuItem;
    N2: TMenuItem;
    PropStorageEh1: TPropStorageEh;
    RegPropStorageManEh1: TRegPropStorageManEh;
    dbgNaklr: TDBGridEh;
    cbxOnlyEmpty: TCheckBox;
    PopupMenu1: TPopupMenu;
    N4: TMenuItem;
    cdsNaklrSUB1: TIntegerField;
    cdsNaklrSUB2: TIntegerField;
    cdsNaklrSUB3: TFMTBCDField;
    cdsNaklrSUB4: TIntegerField;
    cdsNaklrSUB1_NAME: TStringField;
    cdsNaklrSUB2_NAME: TStringField;
    cdsNaklrSUB3_NAME: TStringField;
    cdsNaklrDEBETAFTER: TFloatField;
    cdsNaklrKREDITAFTER: TFloatField;
    cdsNaklrDIFF: TFloatField;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn3: TBitBtn;
    actShowNaklpbux: TAction;
    N3: TMenuItem;
    N5: TMenuItem;
    actShowNaklp: TAction;
    N6: TMenuItem;
    N7: TMenuItem;
    cdsNaklrDIFFBEFORE: TFloatField;
    cdsNaklrDIFF_IN_CURRENCY: TFloatField;
    cdsNaklrSUB6: TIntegerField;
    cdsNaklrSUB6_NAME: TStringField;


    
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actSettingsExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure actDetailExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dbgNaklrDblClick(Sender: TObject);
    procedure actShowNaklpbuxExecute(Sender: TObject);
    procedure actShowNaklpExecute(Sender: TObject);
  private
    { Private declarations }
    SettingsPost : TfmSettingsPlugin;
    //Post;
    SettingsManager : TfmSettingsPlugin;
    SettingsTipDetail : TfmSettingsPlugin;
    SettingsDataset : TfmSettingsDataset;

    FiSchetNedopost : integer;
//    procedure SetPrice;
    procedure ProcessSettings;
    procedure ProcessMode;
    procedure ProcessManager;
    procedure FillSettings;
    procedure FillCurrency;    
    procedure FillMode;

//    procedure Commit;

  public
    { Public declarations }
    setT : TfrmSettings;
    function Defaultopen:boolean;
    procedure DefaultStartup;
  end;

var
  frmNaklpOst: TfrmNaklpOst;

implementation

uses AtsAssert,
  NaklpBux,   //TfrmNaklpBux
  untNaklp, //TfrmNaklp
  SkladAux //OpenDocument
  ;

{$R *.dfm}

procedure TfrmNaklpOst.FormCreate(Sender: TObject);
begin
  dmdEx.OpenQuery(dmdEx.cdsManager);
  dmdEx.OpenQuery(dmdEx.cdsAllClient);
  //dmdEx.OpenQuery(dmdEx.cdsPost);
  qeNaklr.DefSql := sdsNaklr.CommandText;
  FillSettings;

end;

procedure TfrmNaklpOst.FillMode;
begin
  SettingsTipDetail := setT.CreatePlugin('TfmSettingsTipDetail');
  setT.addplugin(SettingsTipDetail);
  SettingsTipDetail.AddDetailTip('По текущим накладным');
  SettingsTipDetail.AddDetailTip('По несовпадающим накладным');
  SettingsTipDetail.AddDetailTip('По всем накладным');
  SettingsTipDetail.SetKeyValue(0);
end;

procedure TfrmNaklpOst.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmdEx.CloseQuery(dmdEx.cdsManager,false);
  dmdEx.CloseQuery(dmdEx.cdsVlad,false);
  dmdEx.CloseQuery(dmdEx.cdsPost,false);
  Action := caFree;
end;

procedure TfrmNaklpOst.actSettingsExecute(Sender: TObject);
begin
  actSettings.checked := setT.ProcessSettingsChange2(DefaultOpen);
{
  if setT.ChangeSettings = mrOk then begin
    actSettings.Checked :=true;
    actRefresh.Execute;
  end
  else begin
    actSettings.Checked := false;
  end; //if change settings
  }
end;

procedure TfrmNaklpOst.actRefreshExecute(Sender: TObject);
begin
  dmdEx.StartWaiting;
  //ProcessSettings;
  qeNaklr.Refresh;
  dmdEx.stopwaiting;
end;

procedure TfrmNaklpOst.actDetailExecute(Sender: TObject);
var
  frmNaklpOstDet : TfrmNaklpOstDet;
  sNaklInfo : string;
begin
  if not (dsNaklr.DataSet.eof and dsNaklr.DataSet.bof) then begin
    frmNaklpOstDet :=TfrmNaklpOstDet.Create (self);
    sNaklInfo := '№'+
      cdsNaklr.FieldByName('id').AsString + ' от ' +
      cdsNaklr.FieldByName('dat').AsString + ' ' +
      cdsNaklr.FieldByName('sub2_name').AsString;
    frmNaklpOstDet.SetMode(1);
    frmNaklpOstDet.ShowDetail (
      cdsNaklr.Params.ParamByName('dat_from').asDate,
      cdsNaklr.Params.ParamByName('dat_to').asDate,
      dsNaklr.DataSet.FieldByName('sub4').AsInteger ,
      sNaklInfo
    );
  end;
end;

procedure TfrmNaklpOst.FormDestroy(Sender: TObject);
begin
  dmdEx.CloseQuery(dmdEx.cdsAllClient,false);
  dmdEx.CloseQuery(dmdEx.cdsManager,false);
end;

procedure TfrmNaklpOst.ProcessSettings;
var
  sTemp : string;
begin
  cdsNaklr.Close;
  cdsNaklr.Params.ParamByName('id_schet_nedopost').asInteger:= FiSchetNedopost;
  ProcessManager;
  sTemp := setT.GetPluginResult('fmSettingsPost');
  if sTemp<>'' then begin
    cdsNaklr.Params.ParamByName('sub1_in').AsString := sTemp;
  end else begin
    cdsNaklr.Params.ParamByName('sub1_in').Clear;
  end;
  cdsNaklr.Params.ParamByName('dat_from').asDate := setT.DateFrom;
  cdsNaklr.Params.ParamByName('dat_to').asDate := setT.DateTo;
  ProcessMode;
  dmdEx.SetIntegerParamValue(
    cdsNaklr.Params.ParamByName('id_currency_to'),
    setT.getpluginresult('fmSettingsDataSet'));

  self.Caption :='Отчёт по недопоставкам: '
    +setT.GetPluginTextResult('fmSettingsManager') +
    ' c ' + datetostr (setT.DateFrom) +
    ' по '+ datetostr(setT.DateTo)+ '. Поставщик: '+
    setT.GetPluginTextResult('fmSettingsPost')+ ' .'+
    setT.GetPluginTextResult('fmSettingsTipDetail');
end;

procedure TfrmNaklpOst.ProcessMode;
var
  iTemp : integer;
begin
  iTemp := strtoint(setT.GetPluginResult('fmSettingsTipDetail'));
  case iTemp of
    0: begin
      qeNaklr.SetSQL('having','((sum(r.debet)>0) or (sum(r.kredit)>0))',0);
    end;
    1: begin
      qeNaklr.SetSQL('having',
        '(((sum(r.debet)>0) or (sum(r.kredit)>0))) '+
        'and Round(sum(r.debet)-sum(kredit),2)<>0',0);
    end;
    else begin
      qeNaklr.SetSQL('having','',0);
    end;
  end;//case
  {
  if sTemp='1' then begin
    qeNaklr.SetSQL('having','Round(sum(r.debet)-sum(kredit),2)<>0',0);
  end;
  if sTemp else begin
    qeNaklr.SetSQL('having','',0);
  end; }
end;


function TfrmNaklpOst.Defaultopen:boolean;
begin
  ProcessSettings;
	actRefresh.Execute;
  Result :=true;
  if not cdsNaklr.Active then begin
    Result :=false;
  end;
end;

procedure TfrmNaklpOst.DefaultStartup;
begin
try
  SettingsManager.SetKeyValue(dmdEx.GetIdManager);
  setT.SetPeriod(6);
  //DefaultOpen;
except
  AssertInternal('60C5DB14-2A05-4343-AAF7-148C1C6AADF8');
end;
end;

procedure TfrmNaklpOst.dbgNaklrDblClick(Sender: TObject);
begin
  actDetail.Execute;
end;

procedure TfrmNaklpOst.actShowNaklpbuxExecute(Sender: TObject);
begin
  if dsNaklr.DataSet.Eof and dsNaklr.DataSet.Bof then begin
     exit;
  end;
  if dsNaklr.DataSet.FieldByName('sub4').IsNull then begin
    MessageDlg('Неизвестен номер приходной накладной',mtWarning,[mbOk],0);
    exit;
  end;
  OpenDocument(self, dsNaklr.DataSet.FieldByName('sub4').asInteger,0,0);
end;

procedure TfrmNaklpOst.actShowNaklpExecute(Sender: TObject);
var
  iTip : integer;
begin
  if dsNaklr.DataSet.Eof and dsNaklr.DataSet.Bof then begin
     exit;
  end;
  iTip := dmdEx.GetOidObjects('ТИП НАКЛАДНЫХ ДЛЯ СКЛАДА',-100);
  iTip := dmdEx.GetOidObjects('Приход',iTip);
  OpenDocument(
    self,
    dsNaklr.DataSet.FieldByName('sub4').asInteger,
    iTip,
    0,
    true);
end;

procedure TfrmNaklpOst.FillSettings;
begin
  setT := TfrmSettings.Create (self);

  setT.actManagerOff.execute;
  SettingsManager := setT.CreatePlugin('TfmSettingsManager');
  setT.AddPlugin(SettingsManager);
  SettingsManager.SetResultType(1);

  SettingsPost := setT.CreatePlugin('TfmSettingsPost');
  //TfmSettingsPost.Create(setT);
  setT.AddPlugin(SettingsPost);
  setT.SetPeriod(2);
  FiSchetNedopost:=dmdex.GetOidObjects('ТИП СЧЕТА',-100);
  FiSchetNedopost:=dmdex.GetOidObjects('НЕСОБЛЮДЕНИЕ ПРИХОДОВ',FiSchetNedopost);
  FillMode;
  FillCurrency;
end;

procedure TfrmNaklpOst.FillCurrency;
begin
  SettingsDataset := TfmSettingsDataset.Create(self);
  SettingsDataset.SetLabelValue(
    'Валюта','Выбор валюты','Не выбрана валюта');
  SettingsDataset.SetListSource(dmdEx.dsCurrency,'name','oid');
  //необязательное заполнение валюты
  SettingsDataset.SetResultType(2);
  //SettingsDataset.SetKeyValue();
  setT.AddPlugin(SettingsDataset);
end;

procedure TfrmNaklpOst.ProcessManager;
begin
  dmdEx.SetIntegerParamValue(
    cdsNaklr.Params.ParamByName('sub3_in'),
    setT.GetPluginResult('fmSettingsManager')
  );
end;


end.
