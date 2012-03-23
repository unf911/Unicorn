unit RepDengiNaSchetax;

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
  SettingsPlugin,
  SettingsDataset , //TfmSettingsDataset
  untRound
 ;

type
  TfrmRepDengiNaSchetax = class(TfrmRepDolgBuxPost)
    sdsDolgBux2: TSQLDataSet;
    dspDolgBux2: TDataSetProvider;
    cdsDolgBux2: TClientDataSet;
    sdsDolgBux2SUB1_NAME: TStringField;
    sdsDolgBux2SUB2_NAME: TStringField;
    sdsDolgBux2SUB3_NAME: TStringField;
    sdsDolgBux2SUB1: TIntegerField;
    sdsDolgBux2SUB2: TIntegerField;
    sdsDolgBux2SUB3: TIntegerField;
    sdsDolgBux2IZGFULLNAME: TStringField;
    sdsDolgBux2BANKFULLNAME: TStringField;
    sdsDolgBux2DEBETBEFORE: TFloatField;
    sdsDolgBux2KREDITBEFORE: TFloatField;
    sdsDolgBux2DEBET: TFloatField;
    sdsDolgBux2KREDIT: TFloatField;
    sdsDolgBux2DEBETAFTER: TFloatField;
    sdsDolgBux2KREDITAFTER: TFloatField;
    sdsDolgBux2DEBETAFTERINCURRENCY: TFloatField;
    sdsDolgBux2KREDITAFTERINCURRENCY: TFloatField;
    cdsDolgBux2SUB1_NAME: TStringField;
    cdsDolgBux2SUB2_NAME: TStringField;
    cdsDolgBux2SUB3_NAME: TStringField;
    cdsDolgBux2SUB1: TIntegerField;
    cdsDolgBux2SUB2: TIntegerField;
    cdsDolgBux2SUB3: TIntegerField;
    cdsDolgBux2IZGFULLNAME: TStringField;
    cdsDolgBux2BANKFULLNAME: TStringField;
    cdsDolgBux2DEBETBEFORE: TFloatField;
    cdsDolgBux2KREDITBEFORE: TFloatField;
    cdsDolgBux2DEBET: TFloatField;
    cdsDolgBux2KREDIT: TFloatField;
    cdsDolgBux2DEBETAFTER: TFloatField;
    cdsDolgBux2KREDITAFTER: TFloatField;
    cdsDolgBux2DEBETAFTERINCURRENCY: TFloatField;
    cdsDolgBux2KREDITAFTERINCURRENCY: TFloatField;
    sdsBankNotlist: TSQLDataSet;
    sdsBankNotlistID_BANK: TIntegerField;
    dspBankNotlist: TDataSetProvider;
    cdsBankNotlist: TClientDataSet;
    cdsBankNotlistID_BANK: TIntegerField;
    sdsDolgBux2KURS: TFloatField;
    sdsDolgBux2KURS_INDIRECT: TIntegerField;
    cdsDolgBux2KURS: TFloatField;
    cdsDolgBux2KURS_INDIRECT: TIntegerField;
    procedure actSettingsExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEh2DblClick(Sender: TObject);

 //   procedure MakeFieldVisible(DataSet: TDataset;FieldName:string;Visible:boolean);

  protected
    { Private declarations }

//    SettingsClient : TfmSettingsPlugin;
//    SettingsManager : TfmSettingsPlugin;
    //SettingsDataset : TfmSettingsDataset;
    SettingsVlad : TfmSettingsPlugin;
    //SettingsTipGroup : TfmSettingsPlugin;
    iSchet : integer; //номер счёта из objects

    procedure Debug;override;
    procedure ProcessColumns;
    procedure FillSettings;
    procedure UpdateCaption;
    procedure Refresh; override;
    procedure ProcessSettings; override;
    procedure ShowDetail; override;
    procedure SetDataSets;
    procedure ProcessHideSchet;
  public
    //setT : TfrmSettings;
    procedure DefaultStartup;override;

  end;

var
  frmRepDengiNaSchetax: TfrmRepDengiNaSchetax;

implementation

uses untEx,
  RepDolgBuxPostDet //TfrmRepDolgBuxPostDet
  ;

{$R *.dfm}

procedure TfrmRepDengiNaSchetax.actSettingsExecute(Sender: TObject);
begin
  actSettings.checked := setT.ProcessSettingsChange2(DefaultOpen);
end;

procedure TfrmRepDengiNaSchetax.FormCreate(Sender: TObject);
begin
  SetDatasets;
  FillSettings;
  dmdEx.OpenQuery (dmdEx.cdsManager);
end;

procedure TfrmRepDengiNaSchetax.FillSettings;
begin
  setT := TfrmSettings.Create(self);
  setT.actManagerOff.Execute;
  setT.SetPeriod(1);


  //наша фирма
  SettingsVlad := setT.createplugin('TfmSettingsVlad');
  SettingsVlad.SetResultType(2);
  setT.AddPlugin(SettingsVlad);
  { TODO : 
добавить выбор счёта фирмы если выбрана фирма и группировка 
по счёту }

{  SettingsTipGroup := setT.createplugin('TfmSettingsTipGroup');
  SettingsTipGroup.AddDetailTip('По фирме');
  SettingsTipGroup.AddDetailTip('По счёту');
  setT.AddPlugin(SettingsTipGroup);}

  SettingsDataset := TfmSettingsDataset.Create(self);
  SettingsDataset.SetLabelValue(
    'Валюта','Выбор валюты','Не выбрана валюта');
  SettingsDataset.SetListSource(dmdEx.dsCurrency,'name','oid');
  //необязательное заполнение валюты
  SettingsDataset.SetResultType(2);
  setT.AddPlugin(SettingsDataset);

  PropStorageEh1.section := 'TfrmRepDengiNaSchetax';
end;

procedure TfrmRepDengiNaSchetax.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if cdsDolgBux2.Active then begin
    if not actDebug.Checked then begin
      PropStorageEh1.SaveProperties;
    end;
  end;
  //dmdEx.CloseQuery (dmdEx.cdsManager);
  Action := caFree;
end;

procedure TfrmRepDengiNaSchetax.DBGridEh2DblClick(Sender: TObject);
begin
  actDetail.Execute;
end;

procedure TfrmRepDengiNaSchetax.ProcessColumns;
var
  i : integer;
begin
  with  cdsDolgBux2 do begin
  if Assigned(SettingsDataset) then begin
    if setT.GetPluginResult('fmSettingsDataset')='' then begin
      FindField('DEBETAFTERINCURRENCY').Visible := false;
      FindField('KREDITAFTERINCURRENCY').Visible := false;
    end else begin
      if FindField('DEBETAFTERINCURRENCY')<>nil then begin
        FieldByName('DEBETAFTERINCURRENCY').DisplayLabel:=
          'Дебет в '+setT.getplugintextresult('fmSettingsDataset')+' на конец';
        TNumericField(FieldByName('DEBETAFTERINCURRENCY')).DisplayFormat:='0.00';
        FindField('DEBETAFTERINCURRENCY').Visible := true;
      end;
      if FindField('KREDITAFTERINCURRENCY')<>nil then begin
        FieldByName('KREDITAFTERINCURRENCY').DisplayLabel:=
          'Кредит в '+setT.getplugintextresult('fmSettingsDataset')+' на конец';
        TNumericField(FieldByName('KREDITAFTERINCURRENCY')).DisplayFormat:='0.00';
        FindField('KREDITAFTERINCURRENCY').Visible := true;
      end;
    end;
  end; //if Assigned(SettingsDataset)
  end;//with

  ColumnByName(DBGridEh1.Columns,'SUB1_NAME').Footer.ValueType:=fvtStaticText;
  ColumnByName(DBGridEh1.Columns,'SUB1_NAME').Footer.value:='Записей всего:';
  ColumnByName(DBGridEh1.Columns,'SUB2_NAME').Footer.ValueType:=fvtCount;
  ColumnByName(DBGridEh1.Columns,'DEBETBEFORE').Footer.ValueType:=fvtSum;
  ColumnByName(DBGridEh1.Columns,'KREDITBEFORE').Footer.ValueType:=fvtSum;
  ColumnByName(DBGridEh1.Columns,'DEBET').Footer.ValueType:=fvtSum;
  ColumnByName(DBGridEh1.Columns,'KREDIT').Footer.ValueType:=fvtSum;
  ColumnByName(DBGridEh1.Columns,'DEBETAFTER').Footer.ValueType:=fvtSum;
  ColumnByName(DBGridEh1.Columns,'KREDITAFTER').Footer.ValueType:=fvtSum;
  ColumnByName(DBGridEh1.Columns,'DEBETBEFORE').Footer.ValueType:=fvtSum;
  for i:=0 to DBGridEh1.Columns.Count-1 do begin
    if (DBGridEh1.Columns[i].FieldName='KREDITAFTERINCURRENCY') then begin
      DBGridEh1.Columns[i].Footer.ValueType :=fvtSum;
    end;
    if (DBGridEh1.Columns[i].FieldName='DEBETAFTERINCURRENCY') then begin
      DBGridEh1.Columns[i].Footer.ValueType :=fvtSum;
    end;
  end;
end;


procedure TfrmRepDengiNaSchetax.UpdateCaption;
begin
  self.Caption := 'Отчёт по движению денежных средств c ' +
    datetostr(setT.datefrom)+' по '+ datetostr(setT.DateTo);
end;

procedure TfrmRepDengiNaSchetax.Refresh;
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

procedure TfrmRepDengiNaSchetax.ShowDetail;
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
      'Фирма',
      cdsDolgBux2.FieldByName('sub1_name').AsString);
//    if setT.getPluginResult('fmSettingsTipGroup')='1' then begin
      SetParamForDetail(
        'sub2_in',
        cdsDolgBux2.FieldByName('sub2').asInteger,
        'Счёт',
        cdsDolgBux2.FieldByName('sub2_name').AsString);
      SetParamForDetail(
        'sub3_in',
        cdsDolgBux2.FieldByName('sub3').asInteger,
        'Валюта',
        cdsDolgBux2.FieldByName('sub3_name').AsString);
      SetGroupForDetail ('sub1,sub2,sub3');
{    end else begin
      SetGroupForDetail ('sub1');
    end;}
    actRefresh.Execute;
    actPreview.Visible :=false;
  end;
  dmdex.StopWaiting;
  frmDolgBuxDet.Show;
end;

procedure TfrmRepDengiNaSchetax.Debug;
begin
  actDebug.Checked := not actDebug.Checked;
  if actDebug.Checked then begin
    //последние две колонки содержат номера фирм и клиентов
    //информация для отладки
    MakeFieldVisible(cdsDolgBux2, 'sub1', true);
    MakeFieldLast(cdsDolgBux2,'sub1');
    MakeFieldVisible(cdsDolgBux2, 'sub2', true);
    MakeFieldLast(cdsDolgBux2,'sub2');
    MakeFieldVisible(cdsDolgBux2, 'sub3', true);
    MakeFieldLast(cdsDolgBux2,'sub3');
    MakeFieldVisible(cdsDolgBux2, 'kurs', true);
    MakeFieldLast(cdsDolgBux2,'kurs');
    MakeFieldVisible(cdsDolgBux2, 'kurs_indirect', true);
    MakeFieldLast(cdsDolgBux2,'kurs_indirect');
  end else begin //if actDebug.Checked
    MakeFieldVisible(cdsDolgBux2, 'sub1', false);
    MakeFieldVisible(cdsDolgBux2, 'sub2', false);
    MakeFieldVisible(cdsDolgBux2, 'sub3', false);
    MakeFieldVisible(cdsDolgBux2, 'kurs', false);
    MakeFieldVisible(cdsDolgBux2, 'kurs_indirect', false);
  end; //if actDebug.Checked
end;

procedure TfrmRepDengiNaSchetax.DefaultStartup;
begin
//  SettingsTipGroup.SetKeyValue(0);
end;

procedure TfrmRepDengiNaSchetax.SetDataSets;
begin
  qeDolgBux.Query := cdsDolgBux2;
  qeDolgBux.DefSql := sdsDolgBux2.CommandText;  
  qeDolgBux.KeyField := 'sub1';
  dsDolgBux.DataSet := cdsDolgBux2;
end;

procedure TfrmRepDengiNaSchetax.ProcessSettings;
begin
  //cdsDolgBux.Params.ParamByName('id_schet').AsInteger :=iSchet;
  TClientDataSet(dsDolgBux.DataSet).Params.ParamByName('dat_from').AsDate :=
    setT.DateFrom;
  TClientDataSet(dsDolgBux.DataSet).Params.ParamByName('dat_to').AsDate :=
    setT.DateTo;
  dmdEx.SetIntegerParamValue(
    TClientDataSet(dsDolgBux.DataSet).Params.ParamByName('sub1_in'),
    setT.GetPluginResult('fmSettingsVlad'));
  dmdEx.SetIntegerParamValue(
    TClientDataSet(dsDolgBux.DataSet).Params.ParamByName('id_currency_to'),
    setT.GetPluginResult('fmSettingsDataset'));
  ProcessHideSchet;
  UpdateCaption;
end;

procedure TfrmRepDengiNaSchetax.ProcessHideSchet;
var
  sTemp : string;
begin
  cdsBankNotlist.close;
  cdsBankNotlist.Open;
  sTemp := dmdEx.GetWhereInList(cdsBankNotlist,'id_bank');
  if sTemp<>'' then begin
    sTemp := 'r.sub2 not in '+sTemp;
    qeDolgBux.SetSQL('where',sTemp,0);
  end else begin
    qeDolgBux.SetSQL('where','',0);
  end;
end;




















end.
