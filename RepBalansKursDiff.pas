unit RepBalansKursDiff;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RepDolgBuxPost, SettingsPlugin, untEx, untSettings, FMTBcd, DB,
  SqlExpr, ActnList, Menus, DbGridEh, DBClient, Provider,
  atsAssert, //AssertInternal
  SettingsDataset  //TfmSettingsDataset

  ;

type
  TFormReportClass = class of TfrmRepDolgBuxPost;

  TfrmRepBalansKursDiff = class(TfrmRepDolgBuxPost)
    ActionList2: TActionList;
    sdsRasxodNalMake: TSQLDataSet;
    sdsDolgBux2: TSQLDataSet;
    dspDolgBux2: TDataSetProvider;
    cdsDolgBux2: TClientDataSet;
    cdsDolgBux2OID: TIntegerField;
    cdsDolgBux2NAME: TStringField;
    cdsDolgBux2FULLNAME: TStringField;
    cdsDolgBux2ID_CURRENCY: TIntegerField;
    cdsDolgBux2SUM_FROM: TFloatField;
    cdsDolgBux2KURS_INDIRECT: TIntegerField;
    cdsDolgBux2KURS_DAT_FROM: TFloatField;
    cdsDolgBux2KURS_DAT_TO: TFloatField;
    cdsDolgBux2SUM_DAT_FROM: TFloatField;
    cdsDolgBux2SUM_DAT_TO: TFloatField;
    cdsDolgBux2KURS_DIFF: TFloatField;
    cdsDolgBux2CURRENCY: TStringField;

    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
    SettingsDataset : TfmSettingsDataset;
    procedure SetDatasets;
  protected
    procedure FillSettings;
    procedure FillCurrency;
    procedure Refresh; override;

    procedure ProcessSettings;override;
    procedure ShowDetail;override;
    procedure UpdateCaption;
    procedure Debug;override;
    procedure ProcessColumns(DataSet:TDataSet);
  public
    procedure  DefaultStartup; override;
    function Defaultopen: boolean;

  {  function Defaultopen:boolean;}

    { Public declarations }
  end;

var
  frmRepBalansKursDiff: TfrmRepBalansKursDiff;

implementation

uses 
  RepDolgBuxPostDet, //TfrmRepDolgBuxPostDet
  SkladAux, //OpenDocument
  DateUtils, // Today, StartOfTheMonth
  RepDengiNaSchetax,   //TfrmRepDengiNaSchetax
  RepDolgNal,
  RepDolgAgent, //TfrmRepDolgAgent 
  untRound //InIde
;

{$R *.dfm}

procedure TfrmRepBalansKursDiff.FormCreate(Sender: TObject);
begin
  SetDatasets;
  FillSettings;
end;

procedure TfrmRepBalansKursDiff.FillSettings;
begin
  setT := TfrmSettings.Create(self);
  setT.actManagerOff.Execute;
  FillCurrency;
  FillCopy(DBGridEh1);
  PropStorageEh1.section := 'TfrmRepBalansKursDiff';
  //before was error on refresh about sub1
  qeDolgBux.KeyField:='';
end;

procedure TfrmRepBalansKursDiff.FillCurrency;
begin
  SettingsDataset := TfmSettingsDataset.Create(self);
  SettingsDataset.SetLabelValue(
    'Валюта','Выбор валюты','Не выбрана валюта');
  SettingsDataset.SetListSource(dmdEx.dsCurrency,'name','oid');
  //обязательное заполнение валюты
  SettingsDataset.SetResultType(1);
  //SettingsDataset.SetKeyValue();
  setT.AddPlugin(SettingsDataset);
end;


procedure TfrmRepBalansKursDiff.Refresh;
begin
  dmdEx.startWaiting;
  if dsDolgBux.DataSet.active then begin
    if not actDebug.Checked then begin
      PropStorageEh1.SaveProperties;
    end;
  end;
  if cdsDolgBux2.active then begin
    cdsDolgBux2.cancelupdates;
  end;
  qeDolgBux.Refresh;
  ProcessColumns(cdsDolgBux2);
  PropStorageEh1.LoadProperties;
  dmdEx.stopWaiting;
end;

procedure TfrmRepBalansKursDiff.ShowDetail;
begin
  //Пока намеренно пустой метод
end;

procedure TfrmRepBalansKursDiff.DefaultStartup;
var
  idCurrencyUSD : integer;
begin
  //Предыдущий месяц
  setT.SetPeriod(7);
  //выбор доллара как валюты отчёта
  idCurrencyUSD:=dmdEx.GetParamCached('ТИП ВАЛЮТ',
    'select oid from GET_OID_OBJECTS_PC('+quotedstr('ТИП ВАЛЮТ')+',-100)',
    'oid');
  idCurrencyUSD :=dmdEx.GetParamCached('USD',
    'select oid from GET_OID_OBJECTS_PC('+quotedstr('USD')+','+inttostr(idCurrencyUSD)+')',
    'oid');
  SettingsDataset.setKeyValue(idCurrencyUSD);
end;



procedure TfrmRepBalansKursDiff.UpdateCaption;
begin
  self.Caption := 'Отчёт по курсовым разницам на с ' +
    datetostr (setT.DateFrom) +
    ' до ' + datetostr(setT.dateTo)+ '. Валюта '+
    setT.GetPluginTextResult('fmSettingsDataset');
end;

procedure TfrmRepBalansKursDiff.Debug;
begin
  actDebug.Checked := not actDebug.Checked;
  if actDebug.Checked then begin
    MakeFieldVisible(dsDolgBux.DataSet, 'is_minus', true);
    MakeFieldLast(dsDolgBux.DataSet,'is_minus');
    MakeFieldVisible(dsDolgBux.DataSet, 'kurs', true);
    MakeFieldLast(dsDolgBux.DataSet,'kurs');
    MakeFieldVisible(dsDolgBux.DataSet, 'kurs_indirect', true);
    MakeFieldLast(dsDolgBux.DataSet,'kurs_indirect');
  end else begin
    MakeFieldVisible(dsDolgBux.DataSet, 'is_minus', false);
    MakeFieldVisible(dsDolgBux.DataSet, 'kurs', false);
    MakeFieldVisible(dsDolgBux.DataSet, 'kurs_indirect', false);
  end;

end;

procedure TfrmRepBalansKursDiff.SetDatasets;
begin
  qeDolgBux.Query := cdsDolgBux2;
  qeDolgBux.DefSql := sdsDolgBux2.CommandText;
  qeDolgBux.KeyField := 'sub1';
  dsDolgBux.DataSet := cdsDolgBux2;
end;

procedure TfrmRepBalansKursDiff.ProcessSettings;
begin
  TClientDataSet(qeDolgBux.Query).Params.ParamByName('dat_to').AsDate := setT.DateTo;
  TClientDataSet(qeDolgBux.Query).params.ParamByName('dat_from').AsDate := setT.DateFrom;
  dmdEx.SetIntegerParamValue(
    TClientDataSet(qeDolgBux.Query).Params.ParamByName('id_currency_to'),
    setT.GetPluginResult('fmSettingsDataset'));
  UpdateCaption;
end;

function TfrmRepBalansKursDiff.Defaultopen: boolean;
begin
  ProcessSettings;
  Refresh;
  ProcessColumns(cdsDolgBux2);
  Result :=true;
end;

procedure TfrmRepBalansKursDiff.ProcessColumns(DataSet: TDataSet);
begin
  ColumnByName(DBGridEh1.Columns,'KURS_DIFF').Footer.ValueType:=fvtSum;
  ColumnByName(DBGridEh1.Columns,'KURS_INDIRECT').KeyList.Clear;
  ColumnByName(DBGridEh1.Columns,'KURS_INDIRECT').KeyList.Add('1');
  ColumnByName(DBGridEh1.Columns,'KURS_INDIRECT').KeyList.Add('0');
  ColumnByName(DBGridEh1.Columns,'KURS_INDIRECT').CheckBoxes := true;
end;

end.
