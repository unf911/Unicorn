unit RepDolgSebest;

interface

uses
  Windows, Messages, SysUtils, Variants,
  Classes, Graphics, Controls, Forms,
  Dialogs,
  QueryExtender, DB, DBTables, FMTBcd, PropFilerEh,
  PropStorageEh, UnfFilter, Menus, DBClient, Provider, SqlExpr, ActnList,
  GridsEh, DBGridEh, StdCtrls, Buttons, frxClass,
  frxDBSet,   
  Grids, DBGrids,
  untSettings,
  RepDolgBuxPost ,//TfrmDolgBuxPost
  //DolgBuxDetPost, //TfrmDolgBuxDelPost
  SettingsPlugin,
  untRound
 ;

type
  TfrmRepDolgSebest = class(TfrmRepDolgBuxPost)
    sdsDolgBux2: TSQLDataSet;
    dspDolgBux2: TDataSetProvider;
    cdsDolgBux2: TClientDataSet;
    sdsDolgBux2IZG: TStringField;
    sdsDolgBux2ZAK: TStringField;
    sdsDolgBux2MANAGER: TStringField;
    sdsDolgBux2ID: TStringField;
    sdsDolgBux2DAT: TSQLTimeStampField;
    sdsDolgBux2ID_NAKL: TIntegerField;
    sdsDolgBux2ID_IZG: TIntegerField;
    sdsDolgBux2ID_ZAK: TIntegerField;
    sdsDolgBux2ID_MANAGER: TIntegerField;
    sdsDolgBux2NDS: TFloatField;
    sdsDolgBux2DOLG: TFloatField;
    sdsDolgBux2PERCENT_NEOPL: TFloatField;
    sdsDolgBux2SUM_OTGR: TFloatField;
    sdsDolgBux2SUM_SEBEST: TFloatField;
    sdsDolgBux2PRIBYL: TFloatField;
    sdsDolgBux2OTKAT: TFloatField;
    sdsDolgBux2SEBEST: TFloatField;
    cdsDolgBux2IZG: TStringField;
    cdsDolgBux2ZAK: TStringField;
    cdsDolgBux2MANAGER: TStringField;
    cdsDolgBux2ID: TStringField;
    cdsDolgBux2DAT: TSQLTimeStampField;
    cdsDolgBux2ID_NAKL: TIntegerField;
    cdsDolgBux2ID_IZG: TIntegerField;
    cdsDolgBux2ID_ZAK: TIntegerField;
    cdsDolgBux2ID_MANAGER: TIntegerField;
    cdsDolgBux2NDS: TFloatField;
    cdsDolgBux2DOLG: TFloatField;
    cdsDolgBux2PERCENT_NEOPL: TFloatField;
    cdsDolgBux2SUM_OTGR: TFloatField;
    cdsDolgBux2SUM_SEBEST: TFloatField;
    cdsDolgBux2PRIBYL: TFloatField;
    cdsDolgBux2OTKAT: TFloatField;
    cdsDolgBux2SEBEST: TFloatField;
    procedure actSettingsExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEh2DblClick(Sender: TObject);

 //   procedure MakeFieldVisible(DataSet: TDataset;FieldName:string;Visible:boolean);

  protected
    { Private declarations }

    SettingsClient : TfmSettingsPlugin;
    SettingsManager : TfmSettingsPlugin;
    SettingsDate : TfmSettingsPlugin;    
    SettingsVlad : TfmSettingsPlugin;
    SettingsTipGroup : TfmSettingsPlugin;
    iSchet : integer; //номер счёта из objects

    procedure Debug;override;
    procedure ProcessColumns;
    procedure FillSettings;
    procedure UpdateCaption;
    procedure Refresh; override;
    procedure ProcessSettings; override;
    procedure ShowDetail; override;
    procedure FillCopy(DBGridEh1: TDBGridEh);
    procedure SetDataSets;    
  public
    setT : TfrmSettings;
    procedure DefaultStartup; override;

  end;

var
  frmRepDolgSebest: TfrmRepDolgSebest;

implementation

uses untEx;

{$R *.dfm}

procedure TfrmRepDolgSebest.actSettingsExecute(Sender: TObject);
begin
  actSettings.checked := setT.ProcessSettingsChange2(DefaultOpen);
end;

procedure TfrmRepDolgSebest.FormCreate(Sender: TObject);
begin
  SetDatasets;
  FillSettings;
  dmdEx.OpenQuery (dmdEx.cdsManager);
end;

procedure TfrmRepDolgSebest.FillSettings;
begin
  setT := TfrmSettings.Create(self);
  setT.actManagerOff.Execute;
  setT.actDataOff.Execute;

  //наша фирма
  SettingsVlad := setT.createplugin('TfmSettingsVlad');
  SettingsVlad.SetResultType(2);
  setT.AddPlugin(SettingsVlad);
  //Покупатель
  SettingsClient := setT.createplugin('TfmSettingsClient');
  setT.AddPlugin(SettingsClient);

  SettingsManager := setT.createplugin('TfmSettingsManager');
  SettingsManager.setresulttype(3);
  setT.AddPlugin(SettingsManager);
  
  SettingsDate := setT.createplugin('TfmSettingsDate');
  setT.AddPlugin(SettingsDate);
  SettingsDate.SetResultType(1);

  SettingsTipGroup := setT.createplugin('TfmSettingsTipGroup');
  SettingsTipGroup.AddDetailTip('По накладным');
  SettingsTipGroup.AddDetailTip('По клиентам');
  setT.AddPlugin(SettingsTipGroup);

  PropStorageEh1.section := 'TfrmRepDolgSebest';
  FillCopy(DBGridEh1);
end;

procedure TfrmRepDolgSebest.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if cdsDolgBux.Active then begin
    if not actDebug.Checked then begin
      PropStorageEh1.SaveProperties;
    end;
  end;
  dmdEx.CloseQuery (dmdEx.cdsManager,false);
  Action := caFree;
end;

procedure TfrmRepDolgSebest.DBGridEh2DblClick(Sender: TObject);
begin
  actDetail.Execute;
end;

procedure TfrmRepDolgSebest.ProcessColumns;
begin
  ColumnByName(DBGridEh1.Columns,'IZG').Footer.ValueType:=fvtCount;
  ColumnByName(DBGridEh1.Columns,'DOLG').Footer.ValueType:=fvtSum;
  ColumnByName(DBGridEh1.Columns,'NDS').Footer.ValueType:=fvtSum;
  ColumnByName(DBGridEh1.Columns,'PRIBYL').Footer.ValueType:=fvtSum;
  ColumnByName(DBGridEh1.Columns,'SUM_OTGR').Footer.ValueType:=fvtSum;
  ColumnByName(DBGridEh1.Columns,'SUM_SEBEST').Footer.ValueType:=fvtSum;
  ColumnByName(DBGridEh1.Columns,'OTKAT').Footer.ValueType:=fvtSum;
  ColumnByName(DBGridEh1.Columns,'SEBEST').Footer.ValueType:=fvtSum;
end;


procedure TfrmRepDolgSebest.UpdateCaption;
begin
  self.Caption := 'Себестоимость долгов на ' +
    setT.getpluginresult('fmSettingsDate');
end;

procedure TfrmRepDolgSebest.FillCopy(DBGridEh1 : TDBGridEh);
begin
  if  ((dmdEx.getrole='POWER_USER') or (dmdEx.GetUser='SYSDBA')) then begin
    DBGridEh1.EditActions:=[geaCopyEh,geaSelectAllEh];
  end;
end;

procedure TfrmRepDolgSebest.Refresh;
begin
  dmdEx.startWaiting;
  if cdsDolgBux.active then begin
    PropStorageEh1.SaveProperties;
  end;
  qeDolgBux.Refresh;
  ProcessColumns;
  PropStorageEh1.LoadProperties;
  dmdEx.stopWaiting;
end;

procedure TfrmRepDolgSebest.ShowDetail;
begin

end;


procedure TfrmRepDolgSebest.Debug;
begin
  actDebug.Checked := not actDebug.Checked;
  if actDebug.Checked then begin
    //последние две колонки содержат номера фирм и клиентов
    //информация для отладки
    MakeFieldVisible(cdsDolgBux, 'id_nakl', true);
    MakeFieldVisible(cdsDolgBux, 'id_izg', true);
    MakeFieldVisible(cdsDolgBux, 'id_zak', true);
    MakeFieldVisible(cdsDolgBux, 'id_manager', true);
  end else begin //if actDebug.Checked
    MakeFieldVisible(cdsDolgBux, 'id_nakl', false);
    MakeFieldVisible(cdsDolgBux, 'id_izg', false);
    MakeFieldVisible(cdsDolgBux, 'id_zak', false);
    MakeFieldVisible(cdsDolgBux, 'id_manager', false);
  end; //if actDebug.Checked
end;



procedure TfrmRepDolgSebest.DefaultStartup;
begin
  SettingsTipGroup.SetKeyValue(0);
end;

procedure TfrmRepDolgSebest.SetDataSets;
begin
  qeDolgBux.Query := cdsDolgBux2;
  qeDolgBux.DefSql := sdsDolgBux2.CommandText;  
  qeDolgBux.KeyField := 'id_zak';
  dsDolgBux.DataSet := cdsDolgBux2;
end;

procedure TfrmRepDolgSebest.ProcessSettings;
begin
  //cdsDolgBux.Params.ParamByName('id_schet').AsInteger :=iSchet;
  TClientDataSet(dsDolgBux.DataSet).Params.ParamByName('dat_to_in').AsDate :=
    strtodate(setT.GetPluginResult('fmSettingsDate'));
  //TClientDataSet(qeDolgBux.Query).params.ParamByName('dat_from').AsDate := setT.DateFrom;
  dmdEx.SetIntegerParamValue(
    TClientDataSet(dsDolgBux.DataSet).Params.ParamByName('id_izg'),
    setT.GetPluginResult('fmSettingsVlad'));
  dmdEx.SetIntegerParamValue(
    TClientDataSet(dsDolgBux.DataSet).Params.ParamByName('id_zak'),
    setT.GetPluginResult('fmSettingsClient'));
  dmdEx.SetIntegerParamValue(
    TClientDataSet(dsDolgBux.DataSet).Params.ParamByName('id_manager'),
    setT.GetPluginResult('fmSettingsManager'));
  UpdateCaption;
end;

end.
