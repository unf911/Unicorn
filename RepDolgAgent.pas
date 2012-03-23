unit RepDolgAgent;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RepDolgBuxPost, SettingsPlugin, untEx, untSettings, FMTBcd, DB,
  SqlExpr, ActnList, Menus, DbGridEh, DBClient, Provider,
  SettingsDataset  //TfmSettingsDataset
  ;

type
  TfrmRepDolgAgent = class(TfrmRepDolgBuxPost)
    ActionList2: TActionList;
    sdsRasxodNalMake: TSQLDataSet;
    sdsDolgBux2: TSQLDataSet;
    dspDolgBux2: TDataSetProvider;
    cdsDolgBux2: TClientDataSet;

    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
    procedure ProcessNewColumns;
    procedure SetDatasets;
  protected
    SettingsManager : TfmSettingsPlugin;
    SettingsClient : TfmSettingsPlugin;
    SettingsTipGroup : TfmSettingsPlugin;
    SettingsVlad : TfmSettingsPlugin;
    procedure FillSettings;
    procedure FillCurrency;
    procedure ProcessGroup;
    procedure Refresh; override;
    procedure ProcessSettings;override;
    procedure ShowDetail;override;
    procedure UpdateCaption;
    procedure Debug;override;
  public
    procedure  DefaultStartup; override;
  {  function Defaultopen:boolean;}

    { Public declarations }
  end;

var
  frmRepDolgAgent: TfrmRepDolgAgent;

implementation

uses 
  RepDolgBuxPostDet, //TfrmRepDolgBuxPostDet
  SkladAux //OpenDocument
;

{$R *.dfm}

procedure TfrmRepDolgAgent.FormCreate(Sender: TObject);
begin
  SetDatasets;
  FillSettings;
end;

procedure TfrmRepDolgAgent.FillSettings;
begin
  setT := TfrmSettings.Create(self);
  setT.actDataOnly.Execute;
  //пред месяц
  //setT.SetPeriod(7);

  FillCurrency;
  cbxNotNull.Checked := true;
  actNotNull.Execute;
  //FillCopy(DBGridEh1);
  PropStorageEh1.section := 'TfrmRepDolgAgent_nocurr';
  iSchet := dmdEx.GetOidObjects('ТИП СЧЕТА',-100);
  iSchet := dmdEx.GetOidObjects('РАСЧЕТЫ С АГЕНТАМИ',iSchet);
end;

procedure TfrmRepDolgAgent.FillCurrency;
begin
  SettingsDataset := TfmSettingsDataset.Create(self);
  SettingsDataset.SetLabelValue(
    'Валюта','Выбор валюты','Не выбрана валюта');
  SettingsDataset.SetListSource(dmdEx.dsCurrency,'name','oid');
  //необязательное заполнение валюты
  SettingsDataset.SetResultType(2);
  setT.AddPlugin(SettingsDataset);
end;

procedure TfrmRepDolgAgent.ProcessGroup;
begin
  if setT.GetPluginResult('fmSettingsDataset')='' then begin
    PropStorageEh1.section := 'TfrmRepDolgAgent_nocurr';
  end else begin
    PropStorageEh1.section := 'TfrmRepDolgAgent_currency';
  end;
end;

procedure TfrmRepDolgAgent.Refresh;
begin
  dmdEx.startWaiting;
  if dsDolgBux.DataSet.active then begin
    PropStorageEh1.SaveProperties;
  end;
  qeDolgBux.Refresh;
  ProcessGroup;
  ProcessColumns(cdsDolgBux2);
  ProcessNewColumns;

  PropStorageEh1.LoadProperties;
  dmdEx.stopWaiting;
end;

procedure TfrmRepDolgAgent.ShowDetail;
var
  frmDolgBuxDet : TfrmRepDolgBuxPostDet;
begin
  dmdex.StartWaiting;
  frmDolgBuxDet :=TfrmRepDolgBuxPostDet.Create (self);
  with frmDolgBuxDet do begin
    SetSchetDates(
      cdsDolgBux2.Params.ParamByName('id_schet').asInteger,
      cdsDolgBux2.Params.parambyName('dat_from').asDate,
      cdsDolgBux2.Params.ParamByName('dat_to').asDate);
    SetParamForDetail(
      'sub1_in',
      cdsDolgBux2.FieldByName('sub1').asInteger,
      'Агент',
      cdsDolgBux2.FieldByName('sub1_name').AsString);
    SetParamForDetail(
      'sub2_in',
      cdsDolgBux2.FieldByName('sub2').asInteger,
      'Валюта',
      cdsDolgBux2.FieldByName('sub2_name').AsString);
    SetGroupForDetail ('sub1,sub2');
    actRefresh.Execute;
    SetFieldProperty('cdsNakl','sub3_name').Visible:=false;
    SetFieldProperty('cdsOpl','sub3_name').Visible:=false;
    actPreview.Visible :=false;
  end;
  dmdex.StopWaiting;
  frmDolgBuxDet.Show;
end;

procedure TfrmRepDolgAgent.DefaultStartup;
begin
  setT.SetPeriod(1);
end;

procedure TfrmRepDolgAgent.ProcessNewColumns;
begin

end;


procedure TfrmRepDolgAgent.UpdateCaption;
begin
  self.Caption := 'Долги агентов: с ' +
    datetostr (setT.DateFrom) +
    ' до ' + datetostr(setT.dateTo);
end;

procedure TfrmRepDolgAgent.Debug;
begin
  inherited;
  if actDebug.checked then begin
    MakeFieldVisible(dsDolgBux.DataSet, 'sub1', true);
    MakeFieldLast(dsDolgBux.DataSet,'sub1');
    MakeFieldVisible(dsDolgBux.DataSet, 'sub2', true);
    MakeFieldLast(dsDolgBux.DataSet,'sub2');
  end else begin
    MakeFieldVisible(dsDolgBux.DataSet, 'sub1', false);
    MakeFieldVisible(dsDolgBux.DataSet, 'sub2', false);
  end;
end;

procedure TfrmRepDolgAgent.SetDatasets;
begin
  qeDolgBux.Query := cdsDolgBux2;
  qeDolgBux.DefSql := sdsDolgBux2.CommandText;
  qeDolgBux.KeyField := 'sub1';
  dsDolgBux.DataSet := cdsDolgBux2;
end;

procedure TfrmRepDolgAgent.ProcessSettings;
begin
  TClientDataSet(qeDolgBux.Query).Params.ParamByName('id_schet').AsInteger :=iSchet;
  TClientDataSet(qeDolgBux.Query).Params.ParamByName('dat_to').AsDate := setT.DateTo;
  TClientDataSet(qeDolgBux.Query).params.ParamByName('dat_from').AsDate := setT.DateFrom;
  dmdEx.SetIntegerParamValue(
    TClientDataSet(qeDolgBux.Query).Params.ParamByName('id_currency_to'),
    setT.GetPluginResult('fmSettingsDataset'));
  UpdateCaption;
end;

end.
