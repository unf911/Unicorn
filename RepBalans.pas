unit RepBalans;

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

  TfrmRepBalans = class(TfrmRepDolgBuxPost)
    ActionList2: TActionList;
    sdsRasxodNalMake: TSQLDataSet;
    sdsDolgBux2: TSQLDataSet;
    dspDolgBux2: TDataSetProvider;
    cdsDolgBux2: TClientDataSet;
    sdsRowBalans: TSQLDataSet;
    dspRowBalans: TDataSetProvider;
    cdsRowBalans: TClientDataSet;
    dsRowBalans: TDataSource;

    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
    SettingsDate : TfmSettingsPlugin;
    SettingsDataset : TfmSettingsDataset;
    procedure SetDatasets;
    procedure ComputeOneRow;
    procedure ComputeSumOrig;
    procedure ComputeKurs;
    procedure ComputeSumFinal;
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
  frmRepBalans: TfrmRepBalans;

implementation

uses 
  RepDolgBuxPostDet, //TfrmRepDolgBuxPostDet
  SkladAux, //OpenDocument
  DateUtils, // Today, StartOfTheMonth
  RepDengiNaSchetax,   //TfrmRepDengiNaSchetax
  RepDolgNal,
  RepDolgAgent, //TfrmRepDolgAgent
  NaklpOst, //TfrmNaklpOst;
  untRound //InIde
;

{$R *.dfm}

procedure TfrmRepBalans.FormCreate(Sender: TObject);
begin
  SetDatasets;
  FillSettings;
end;

procedure TfrmRepBalans.FillSettings;
begin
  setT := TfrmSettings.Create(self);
  setT.actManagerOff.Execute;
  setT.actDataOff.Execute;
  FillDate;
  FillCurrency;
  FillCopy(DBGridEh1);
  PropStorageEh1.section := 'TfrmRepBalans';
  //before was error on refresh about sub1
  qeDolgBux.KeyField:='';
end;

procedure TfrmRepBalans.FillCurrency;
begin
  SettingsDataset := TfmSettingsDataset.Create(self);
  SettingsDataset.SetLabelValue(
    '¬‡Î˛Ú‡','¬˚·Ó ‚‡Î˛Ú˚','ÕÂ ‚˚·‡Ì‡ ‚‡Î˛Ú‡');
  SettingsDataset.SetListSource(dmdEx.dsCurrency,'name','oid');
  //Ó·ˇÁ‡ÚÂÎ¸ÌÓÂ Á‡ÔÓÎÌÂÌËÂ ‚‡Î˛Ú˚
  SettingsDataset.SetResultType(1);
  //SettingsDataset.SetKeyValue();
  setT.AddPlugin(SettingsDataset);
end;


procedure TfrmRepBalans.Refresh;
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
  //if not InIDE then begin
  ComputeRowsOfBalans;
  //end;
  dmdEx.stopWaiting;


end;

procedure TfrmRepBalans.ShowDetail;
var
  frmRepDolgBux : TfrmRepDolgBuxPost;
  frmNaklpOst : TfrmNaklpOst;
begin
  if cdsDolgBux2.FieldByName('Name').asString='ƒ≈Õ‹√» Õ¿ —◊≈“¿’' then begin
    frmRepDolgBux:=TfrmRepDengiNaSchetax.Create(Application);
    frmRepDolgBux.setT.GetPlugin('fmSettingsDataset').SetKeyValue(setT.GetPluginResult('fmSettingsDataset'));
    frmRepDolgBux.setT.DateTo := strtodate(setT.GetPluginResult('fmSettingsDate'));
    frmRepDolgBux.setT.DateFrom :=  StartOfTheMonth( strtodate(setT.GetPluginResult('fmSettingsDate')));
    frmRepDolgBux.Defaultopen;
  end;
  if cdsDolgBux2.FieldByName('Name').asString='–¿—◊®“€ — œŒ—“¿¬Ÿ» ¿Ã»' then begin
    frmRepDolgBux:=TfrmRepDolgBuxPost.Create(Application);
    frmRepDolgBux.setT.GetPlugin('fmSettingsDataset').SetKeyValue(setT.GetPluginResult('fmSettingsDataset'));
    frmRepDolgBux.setT.DateTo := strtodate(setT.GetPluginResult('fmSettingsDate'));
    frmRepDolgBux.setT.DateFrom :=  StartOfTheMonth( strtodate(setT.GetPluginResult('fmSettingsDate')));
    frmRepDolgBux.Defaultopen;
  end;
  if cdsDolgBux2.FieldByName('Name').asString='–¿—◊®“€ — œŒ—“¿¬Ÿ» ¿Ã» ”—À”√' then begin
    frmRepDolgBux:=TfrmRepDolgBuxPost.Create(Application);
    frmRepDolgBux.setT.GetPlugin('fmSettingsTipDetail').SetKeyValue(1);
    frmRepDolgBux.setT.GetPlugin('fmSettingsDataset').SetKeyValue(setT.GetPluginResult('fmSettingsDataset'));
    frmRepDolgBux.setT.DateTo := strtodate(setT.GetPluginResult('fmSettingsDate'));
    frmRepDolgBux.setT.DateFrom :=  StartOfTheMonth( strtodate(setT.GetPluginResult('fmSettingsDate')));
    frmRepDolgBux.Defaultopen;
  end;
  if cdsDolgBux2.FieldByName('Name').asString='ƒŒÀ√» œŒ ”œ¿“≈À≈…' then begin
    frmRepDolgBux:=TfrmRepDolgBuxPost.Create(Application);
    frmRepDolgBux.setT.GetPlugin('fmSettingsTipDetail').SetKeyValue(2);
    frmRepDolgBux.setT.GetPlugin('fmSettingsDataset').SetKeyValue(setT.GetPluginResult('fmSettingsDataset'));
    frmRepDolgBux.setT.DateTo := strtodate(setT.GetPluginResult('fmSettingsDate'));
    frmRepDolgBux.setT.DateFrom :=  StartOfTheMonth( strtodate(setT.GetPluginResult('fmSettingsDate')));
    frmRepDolgBux.Defaultopen;
  end;
  if cdsDolgBux2.FieldByName('Name').asString='ƒŒÀ√» œŒ ”œ¿“≈À≈… ¿–≈Õƒ€' then begin
    frmRepDolgBux:=TfrmRepDolgBuxPost.Create(Application);
    frmRepDolgBux.setT.GetPlugin('fmSettingsTipDetail').SetKeyValue(3);
    frmRepDolgBux.setT.GetPlugin('fmSettingsDataset').SetKeyValue(setT.GetPluginResult('fmSettingsDataset'));
    frmRepDolgBux.setT.DateTo := strtodate(setT.GetPluginResult('fmSettingsDate'));
    frmRepDolgBux.setT.DateFrom :=  StartOfTheMonth( strtodate(setT.GetPluginResult('fmSettingsDate')));
    frmRepDolgBux.Defaultopen;
  end;
  if cdsDolgBux2.FieldByName('Name').asString='ƒŒÀ√» œŒ ”œ¿“≈À≈… ”—À”√' then begin
    frmRepDolgBux:=TfrmRepDolgBuxPost.Create(Application);
    frmRepDolgBux.setT.GetPlugin('fmSettingsTipDetail').SetKeyValue(4);
    frmRepDolgBux.setT.GetPlugin('fmSettingsDataset').SetKeyValue(setT.GetPluginResult('fmSettingsDataset'));
    frmRepDolgBux.setT.DateTo := strtodate(setT.GetPluginResult('fmSettingsDate'));
    frmRepDolgBux.setT.DateFrom :=  StartOfTheMonth( strtodate(setT.GetPluginResult('fmSettingsDate')));
    frmRepDolgBux.Defaultopen;
  end;
  if cdsDolgBux2.FieldByName('Name').asString='Õ¿À»◊Õ€≈ ƒŒÀ√»' then begin
    frmRepDolgBux:=TfrmRepDolgNal.Create(Application);
    frmRepDolgBux.setT.GetPlugin('fmSettingsTipGroup').SetKeyValue(0);
    frmRepDolgBux.setT.DateTo := strtodate(setT.GetPluginResult('fmSettingsDate'));
    frmRepDolgBux.setT.DateFrom :=  StartOfTheMonth( strtodate(setT.GetPluginResult('fmSettingsDate')));
    frmRepDolgBux.setT.GetPlugin('fmSettingsDataset').SetKeyValue(setT.GetPluginResult('fmSettingsDataset'));
    frmRepDolgBux.Defaultopen;
  end;
  if cdsDolgBux2.FieldByName('Name').asString='–¿—◊®“€ — ¿√≈Õ“¿Ã»' then begin
    frmRepDolgBux:=TfrmRepDolgAgent.Create(Application);
    //frmRepDolgBux.setT.GetPlugin('fmSettingsTipDetail').SetKeyValue(3);
    frmRepDolgBux.setT.GetPlugin('fmSettingsDataset').SetKeyValue(setT.GetPluginResult('fmSettingsDataset'));
    frmRepDolgBux.setT.DateTo := strtodate(setT.GetPluginResult('fmSettingsDate'));
    frmRepDolgBux.setT.DateFrom :=  StartOfTheMonth( strtodate(setT.GetPluginResult('fmSettingsDate')));
    frmRepDolgBux.Defaultopen;
  end;
  if cdsDolgBux2.FieldByName('Name').asString='Õ≈—Œ¡Àﬁƒ≈Õ»≈ œ–»’ŒƒŒ¬' then begin
    frmNaklpOst:=TfrmNaklpOst.Create(Application);
    frmNaklpOst.setT.GetPlugin('fmSettingsTipDetail').SetKeyValue(2);
    frmNaklpOst.setT.GetPlugin('fmSettingsDataset').SetKeyValue(setT.GetPluginResult('fmSettingsDataset'));
    frmNaklpOst.setT.DateTo := strtodate(setT.GetPluginResult('fmSettingsDate'));
    frmNaklpOst.setT.DateFrom :=  StartOfTheMonth( strtodate(setT.GetPluginResult('fmSettingsDate')));
    frmNaklpOst.Defaultopen;
  end;

end;

procedure TfrmRepBalans.DefaultStartup;
var
  idCurrencyUSD : integer;
begin
  SettingsDate.SetKeyValue(Today);
  //‚˚·Ó ‰ÓÎÎ‡‡ Í‡Í ‚‡Î˛Ú˚ ÓÚ˜∏Ú‡
  idCurrencyUSD:=dmdEx.GetParamCached('“»œ ¬¿Àﬁ“',
    'select oid from GET_OID_OBJECTS_PC('+quotedstr('“»œ ¬¿Àﬁ“')+',-100)',
    'oid');
  idCurrencyUSD :=dmdEx.GetParamCached('USD',
    'select oid from GET_OID_OBJECTS_PC('+quotedstr('USD')+','+inttostr(idCurrencyUSD)+')',
    'oid');
  SettingsDataset.setKeyValue(idCurrencyUSD);
end;



procedure TfrmRepBalans.UpdateCaption;
begin
  self.Caption := '¡‡Î‡ÌÒ Ì‡ ' +
    setT.GetPluginTextResult('fmSettingsDate') + '. ¬‡Î˛Ú‡ '+
    setT.GetPluginTextResult('fmSettingsDataset');
    ;
end;

procedure TfrmRepBalans.Debug;
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

procedure TfrmRepBalans.SetDatasets;
begin
  qeDolgBux.Query := cdsDolgBux2;
  qeDolgBux.DefSql := sdsDolgBux2.CommandText;
  qeDolgBux.KeyField := 'sub1';
  dsDolgBux.DataSet := cdsDolgBux2;
end;

procedure TfrmRepBalans.ProcessSettings;
begin
//  TClientDataSet(qeDolgBux.Query).Params.ParamByName('id_schet').AsInteger :=iSchet;
//  TClientDataSet(qeDolgBux.Query).Params.ParamByName('dat_to').AsDate := setT.DateTo;
//  TClientDataSet(qeDolgBux.Query).params.ParamByName('dat_from').AsDate := setT.DateFrom;
{  dmdEx.SetIntegerParamValue(
    TClientDataSet(qeDolgBux.Query).Params.ParamByName('id_currency_to'),
    setT.GetPluginResult('fmSettingsDataset'));}
  UpdateCaption;
end;

procedure TfrmRepBalans.FillDate;
begin
  SettingsDate := setT.createPlugin('TfmSettingsDate');
  setT.AddPlugin(SettingsDate);
  SettingsDate.SetResultType(1);
  SettingsDate.SetKeyValue (Today);
end;

function TfrmRepBalans.Defaultopen: boolean;
begin
  ProcessSettings;
  Refresh;
  ProcessColumns(cdsDolgBux2);
  Result :=true;
end;

procedure TfrmRepBalans.ComputeRowsOfBalans;
begin
try
  dsDolgBux.DataSet.First;
  while not dsDolgBux.DataSet.eof do begin
    if dsDolgBux.DataSet.FieldByName('sql_text').asString <> '' then begin
      //showmessage (dsDolgBux.DataSet.FieldByName('sql_text').asString);
      ComputeOneRow;
    end;
    dsDolgBux.DataSet.Next;
  end;
except
  AssertInternal('F0DBF39F-5EFF-4C46-83C9-1A48A4BDB055');
end;
end;

procedure TfrmRepBalans.ComputeOneRow;
begin
  if ((not InIDE) or (InIDE and actDebug.Checked)) then begin
    ComputeSumOrig;
  end;
  ComputeKurs;
  ComputeSumFinal;
end;

procedure TfrmRepBalans.ComputeSumOrig;
begin
  cdsRowBalans.close;
  cdsRowBalans.CommandText := dsDolgBux.DataSet.FieldByName('sql_text').asString;
  cdsRowBalans.Params.ParamByName('dat_to').asstring := setT.getpluginresult('fmSettingsDate');
  if Assigned(cdsRowBalans.Params.FindParam('id_currency_to')) then begin
    cdsRowBalans.Params.FindParam('id_currency_to').AsString := setT.GetPluginResult('fmSettingsDataset');
  end;
  cdsRowBalans.Open;
  dsDolgBux.DataSet.Edit;
  dsDolgBux.DataSet.FieldByName('sum_orig').asFloat:= cdsRowBalans.Fields[0].AsFloat;
  dsDolgBux.DataSet.CheckBrowseMode;
  cdsRowBalans.close;
end;

procedure TfrmRepBalans.ComputeKurs;
var
  dKurs : double;
  iKursIndirect: integer;
begin
  if not dsDolgBux.DataSet.FieldByName('id_currency').isNull then begin
    dmdEx.GetKurs(
      dsDolgBux.DataSet.FieldByName('id_currency').AsInteger,
      strtoint(setT.GetPluginResult('fmSettingsDataset')),
      StrToDate(setT.getpluginresult('fmSettingsDate')),
      dKurs,
      iKursIndirect
    );
    dsDolgBux.DataSet.Edit;
    dsDolgBux.DataSet.FieldByName('kurs').asFloat:= dKurs;
    dsDolgBux.DataSet.FieldByName('kurs_indirect').asInteger:= iKursIndirect;
    dsDolgBux.DataSet.CheckBrowseMode;
  end;
end;

procedure TfrmRepBalans.ComputeSumFinal;
begin
  dsDolgBux.DataSet.Edit;
  if dsDolgBux.DataSet.FieldByName('kurs_indirect').asInteger<>1 then begin
    dsDolgBux.DataSet.FieldByName('sum_final').asFloat :=
      dsDolgBux.DataSet.FieldByName('sum_orig').asFloat*
      dsDolgBux.DataSet.FieldByName('kurs').asFloat;
  end else begin
    dsDolgBux.DataSet.FieldByName('sum_final').asFloat :=
      dsDolgBux.DataSet.FieldByName('sum_orig').asFloat/
      dsDolgBux.DataSet.FieldByName('kurs').asFloat;
  end;
  dsDolgBux.DataSet.CheckBrowseMode;
  dsDolgBux.DataSet.Edit;
  if dsDolgBux.DataSet.FieldByName('is_minus').asInteger=1 then begin
    dsDolgBux.DataSet.FieldByName('sum_final').asFloat :=
      -dsDolgBux.DataSet.FieldByName('sum_final').asFloat;
  end;
  dsDolgBux.DataSet.CheckBrowseMode;
end;

procedure TfrmRepBalans.ProcessColumns(DataSet: TDataSet);
begin
  with  Dataset do begin
    FindField('OID').Visible := false;
    FindField('NAME').Visible := false;
    FindField('DELMARKED').Visible := false;
    FindField('ID_CURRENCY').Visible := false;
    FindField('SQL_TEXT').Visible := false;
    FindField('FULLNAME').DisplayWidth := 20;
    FindField('FULLNAME').DisplayLabel := '—Ú‡Ú¸ˇ ·‡Î‡ÌÒ‡';
    FindField('CURRENCY').DisplayLabel := '¬‡Î˛Ú‡ ËÒıÓ‰Ì‡ˇ';
    FindField('SUM_ORIG').DisplayLabel := '—ÛÏÏ‡ ‚ ËÒıÓ‰ÌÓÈ ‚‡Î˛ÚÂ';
    FindField('KURS').Visible := true;
    FindField('KURS').DisplayLabel := ' ÛÒ';
    FindField('IS_MINUS').Visible := false;
    FindField('IS_MINUS').DisplayLabel := '—Ú‡Ú¸ˇ ÏËÌÛÒ';
    FindField('KURS_INDIRECT').Visible := true;
    FindField('KURS_INDIRECT').DisplayLabel := 'Œ·‡ÚÌ˚È ÍÛÒ';
    TNumericField(FindField('SUM_ORIG')).DisplayFormat := '0.00';
    //œÓÍ‡ ÌÂ Á‡ÔÓÎÌˇÂÚÒˇ ÔÓÎÂ ÒÍ˚Ú¸ Â„Ó
    FindField('SUM_FINAL').Visible := true;
    FindField('SUM_FINAL').DisplayLabel := '—ÛÏÏ‡';
    TNumericField(FindField('SUM_FINAL')).DisplayFormat := '0.00'
  end;//with

  ColumnByName(DBGridEh1.Columns,'SUM_FINAL').Footer.ValueType:=fvtSum;

  ColumnByName(DBGridEh1.Columns,'KURS_INDIRECT').KeyList.Clear;
  ColumnByName(DBGridEh1.Columns,'KURS_INDIRECT').KeyList.Add('1');
  ColumnByName(DBGridEh1.Columns,'KURS_INDIRECT').KeyList.Add('0');
  ColumnByName(DBGridEh1.Columns,'KURS_INDIRECT').CheckBoxes := true;
end;

end.
