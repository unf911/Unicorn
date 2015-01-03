unit RepDvigDenSredstv;

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

  TfrmRepDvigDenSredstv = class(TfrmRepDolgBuxPost)
    sdsDolgBux2: TSQLDataSet;
    dspDolgBux2: TDataSetProvider;
    cdsDolgBux2: TClientDataSet;
    cdsDolgBux2SUB1_NAME: TStringField;
    cdsDolgBux2SUB2_NAME: TStringField;
    cdsDolgBux2SUB3_NAME: TStringField;
    cdsDolgBux2KURS: TFMTBCDField;
    cdsDolgBux2KURS_INDIRECT: TFMTBCDField;
    cdsDolgBux2DEBET: TFloatField;
    cdsDolgBux2KREDIT: TFloatField;
    cdsDolgBux2SUM_FINAL: TFMTBCDField;
    cdsDolgBux2SUB1: TIntegerField;
    cdsDolgBux2SUB2: TIntegerField;
    cdsDolgBux2SUB3: TIntegerField;

    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
    SettingsDate : TfmSettingsPlugin;
    SettingsDataset : TfmSettingsDataset;
    procedure SetDatasets;
    procedure ComputeSumFinal;
    procedure ComputeKurs;
    procedure ComputeOneRow;
    procedure ComputeRowsOfBalans;
  protected
    procedure FillSettings;
    procedure FillCurrency;
    procedure FillDate;
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
  frmRepDvigDenSredstv: TfrmRepDvigDenSredstv;

implementation

uses 
  RepSkladFactDet, //TfrmRepSkladFactDet
  SkladAux, //OpenDocument
  DateUtils, // Today, StartOfTheMonth
  RepDengiNaSchetax,   //TfrmRepDengiNaSchetax
  RepDolgNal,
  RepDolgAgent, //TfrmRepDolgAgent 
  untRound //InIde
;

{$R *.dfm}

procedure TfrmRepDvigDenSredstv.FormCreate(Sender: TObject);
begin
  SetDatasets;
  FillSettings;
end;

procedure TfrmRepDvigDenSredstv.FillSettings;
begin
  setT := TfrmSettings.Create(self);
  setT.actManagerOff.Execute;
  FillCurrency;
  FillCopy(DBGridEh1);
  //before was error on refresh about sub1
  qeDolgBux.KeyField:='';
  PropStorageEh1.section := 'TfrmRepDvigDenSredstv';
end;

procedure TfrmRepDvigDenSredstv.FillCurrency;
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


procedure TfrmRepDvigDenSredstv.Refresh;
begin
  dmdEx.startWaiting;
  if dsDolgBux.DataSet.active then begin
    if not actDebug.checked then begin
      PropStorageEh1.SaveProperties;
    end;
  end;
  if cdsDolgBux2.active then begin
    cdsDolgBux2.cancelupdates;
  end;
  qeDolgBux.Refresh;
  ComputeRowsOfBalans;
  ProcessColumns(cdsDolgBux2);
  PropStorageEh1.LoadProperties;
  dmdEx.stopWaiting;
end;

procedure TfrmRepDvigDenSredstv.ShowDetail;
var
  frmDet : TfrmRepSkladFactDet;
  idSchet : integer;
begin
  idSchet:=dmdEx.GetParamCached('ТИП СЧЕТА',
    'select oid from GET_OID_OBJECTS_PC('+quotedstr('ТИП СЧЕТА')+',-100)',
    'oid');
  idSchet:=dmdEx.GetParamCached('ФИНАНСОВЫЙ РЕЗУЛЬТАТ',
    'select oid from GET_OID_OBJECTS_PC('+quotedstr('ФИНАНСОВЫЙ РЕЗУЛЬТАТ')+','+
      inttostr(idSchet)+')',
    'oid');


  frmDet :=TfrmRepSkladFactDet.Create(Self);
  frmDet.ShowDetailForDvigDenSredstv(idSchet,setT.DateFrom,setT.DateTo,
    cdsDolgBux2.FieldByName('sub1').asInteger,
    cdsDolgBux2.FieldByName('sub2').asInteger,
    cdsDolgBux2.FieldByName('sub3').asInteger,
    null,null,null,null,null,null,null
    );
end;

procedure TfrmRepDvigDenSredstv.DefaultStartup;
var
  idCurrencyUSD : integer;
begin
  //выбор доллара как валюты отчёта
  idCurrencyUSD:=dmdEx.GetParamCached('ТИП ВАЛЮТ',
    'select oid from GET_OID_OBJECTS_PC('+quotedstr('ТИП ВАЛЮТ')+',-100)',
    'oid');
  idCurrencyUSD :=dmdEx.GetParamCached('USD',
    'select oid from GET_OID_OBJECTS_PC('+quotedstr('USD')+','+inttostr(idCurrencyUSD)+')',
    'oid');
  SettingsDataset.setKeyValue(idCurrencyUSD);
end;



procedure TfrmRepDvigDenSredstv.UpdateCaption;
begin
  self.Caption := 'Статьи дохода и расхода с ' +
    DateToStr(setT.DateFrom) +
    ' по '+DateToStr(setT.DateTo)+
    '. Валюта '+
    setT.GetPluginTextResult('fmSettingsDataset');
    ;
end;

procedure TfrmRepDvigDenSredstv.Debug;
begin
  actDebug.Checked := not actDebug.Checked;
  if actDebug.Checked then begin
    MakeFieldVisible(dsDolgBux.DataSet, 'SUB1', true);
    MakeFieldLast(dsDolgBux.DataSet,'SUB1');
    MakeFieldVisible(dsDolgBux.DataSet, 'SUB2', true);
    MakeFieldLast(dsDolgBux.DataSet,'SUB2');
    MakeFieldVisible(dsDolgBux.DataSet, 'SUB3', true);
    MakeFieldLast(dsDolgBux.DataSet,'SUB3');
  end else begin
    MakeFieldVisible(dsDolgBux.DataSet, 'SUB1', false);
    MakeFieldVisible(dsDolgBux.DataSet, 'SUB2', false);
    MakeFieldVisible(dsDolgBux.DataSet, 'SUB3', false);
  end;

end;

procedure TfrmRepDvigDenSredstv.SetDatasets;
begin
  qeDolgBux.Query := cdsDolgBux2;
  qeDolgBux.DefSql := sdsDolgBux2.CommandText;
  qeDolgBux.KeyField := 'sub2';
  dsDolgBux.DataSet := cdsDolgBux2;
end;

procedure TfrmRepDvigDenSredstv.ProcessSettings;
begin
  cdsDolgBux2.Params.ParamByName('dat_to').AsDate := setT.DateTo;
  cdsDolgBux2.params.ParamByName('dat_from').AsDate := setT.DateFrom;

  {dmdEx.SetIntegerParamValue(
    cdsDolgBux2.Params.ParamByName('id_currency_to'),
    setT.GetPluginResult('fmSettingsDataset'));
  }
  UpdateCaption;
end;

procedure TfrmRepDvigDenSredstv.FillDate;
begin
  SettingsDate := setT.createPlugin('TfmSettingsDate');
  setT.AddPlugin(SettingsDate);
  SettingsDate.SetResultType(1);
  SettingsDate.SetKeyValue (Today);
end;

function TfrmRepDvigDenSredstv.Defaultopen: boolean;
begin
  ProcessSettings;
  Refresh;
  ProcessColumns(cdsDolgBux2);
  Result :=true;
end;


procedure TfrmRepDvigDenSredstv.ProcessColumns(DataSet: TDataSet);
begin

  with  Dataset do begin
    FindField('SUB1').Visible := false;
    FindField('SUB2').Visible := false;
    FindField('SUB3').Visible := false;
    FindField('KURS').DisplayLabel := 'Курс';
    FindField('KURS_INDIRECT').DisplayLabel := 'Обратный курс';
    FindField('SUB1_NAME').DisplayLabel := 'Проект';
    FindField('SUB2_NAME').DisplayLabel := 'Статья';
    FindField('SUB3_NAME').DisplayLabel := 'Валюта';
    FindField('DEBET').DisplayLabel := 'Дебет';
    TNumericField(FindField('DEBET')).DisplayFormat := '0.00';
    FindField('KREDIT').DisplayLabel := 'Кредит';
    TNumericField(FindField('KREDIT')).DisplayFormat := '0.00';
    FindField('SUM_FINAL').DisplayLabel := 'Сумма';
    TNumericField(FindField('SUM_FINAL')).DisplayFormat := '0.00'
  end;//with
  //поле "Обратный курс" должно быть в виде галочки
  ShowCheckboxForColumn(ColumnByName(DBGridEh1.Columns,'KURS_INDIRECT'));
  ColumnByName(DBGridEh1.Columns,'DEBET').Footer.ValueType:=fvtSum;
  ColumnByName(DBGridEh1.Columns,'KREDIT').Footer.ValueType:=fvtSum;  
  ColumnByName(DBGridEh1.Columns,'SUM_FINAL').Footer.ValueType:=fvtSum;

end;

procedure TfrmRepDvigDenSredstv.ComputeRowsOfBalans;
begin
try
  dsDolgBux.DataSet.First;
  while not dsDolgBux.DataSet.eof do begin
    ComputeOneRow;
    dsDolgBux.DataSet.Next;
  end;
except
  AssertInternal('A5ACFA3E-BD13-4C92-99A8-1737D9226899');
end;
end;

procedure TfrmRepDvigDenSredstv.ComputeOneRow;
begin
  ComputeKurs;
  ComputeSumFinal;
end;

procedure TfrmRepDvigDenSredstv.ComputeKurs;
var
  dKurs : double;
  iKursIndirect: integer;
begin
  if not dsDolgBux.DataSet.FieldByName('sub3').isNull then begin
    //курс на дату ранее, т.е. начало 01.12. Курс на 30.11. Чтобы совпадал
    //с курсом предыдущего баланса
    dmdEx.GetKurs(
      dsDolgBux.DataSet.FieldByName('sub3').AsInteger,
      strtoint(setT.GetPluginResult('fmSettingsDataset')),
      Incday(setT.DateFrom,-1),
      dKurs,
      iKursIndirect
    );
    dsDolgBux.DataSet.Edit;
    dsDolgBux.DataSet.FieldByName('kurs').asFloat:= dKurs;
    dsDolgBux.DataSet.FieldByName('kurs_indirect').asInteger:= iKursIndirect;
    dsDolgBux.DataSet.CheckBrowseMode;
  end;
end;

procedure TfrmRepDvigDenSredstv.ComputeSumFinal;
begin
  dsDolgBux.DataSet.Edit;
  if dsDolgBux.DataSet.FieldByName('kurs_indirect').asInteger<>1 then begin
    dsDolgBux.DataSet.FieldByName('sum_final').asFloat :=
      (dsDolgBux.DataSet.FieldByName('debet').asFloat-
      dsDolgBux.DataSet.FieldByName('kredit').asFloat)*
      dsDolgBux.DataSet.FieldByName('kurs').asFloat;
  end else begin
    dsDolgBux.DataSet.FieldByName('sum_final').asFloat :=
      (dsDolgBux.DataSet.FieldByName('debet').asFloat-
      dsDolgBux.DataSet.FieldByName('kredit').asFloat)/
      dsDolgBux.DataSet.FieldByName('kurs').asFloat;
  end;
  dsDolgBux.DataSet.CheckBrowseMode;
end;

end.
