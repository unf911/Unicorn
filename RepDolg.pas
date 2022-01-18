unit RepDolg;
  { DONE : удалить лишнее }
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, PropFilerEh, PropStorageEh, Menus, SqlExpr, Provider,
  DB, DBClient, UnfFilter, QueryExtender,   
  ActnList, GridsEh, DBGridEh, StdCtrls, Buttons, frxClass, frxDBSet,
  DBTables, Grids, DBGrids,
  DBCtrls,
  ImgList,
  SettingsPlugin,
  untSettings,  // TfrmSettings
  DolgDet3, //TfrmDolgDet3
  untEx
  ;

type
  TfrmRepDolg3 = class(TForm)
    dsDolg: TDataSource;
    GroupBox1: TGroupBox;
    ActionList1: TActionList;
    actPreview: TAction;
    frDolg: TfrxReport;
    frDBDataSet1: TfrxDBDataset;
    actSumRecalc: TAction;
    actCall: TAction;
    qeDolg: TQueryExtender;
    actSettings: TAction;
    actRefresh: TAction;
    actDetail: TAction;
    cbxNotNull: TCheckBox;
    actNotNull: TAction;
    dbgDolg: TDBGridEh;
    UnfFilter1: TUnfFilter;
    cdsDolg: TClientDataSet;
    dspDolg: TDataSetProvider;
    sdsDolg: TSQLDataSet;
    cdsDolgIZG: TStringField;
    cdsDolgZAK: TStringField;
    cdsDolgMANAGER: TStringField;
    cdsDolgSUB1P: TIntegerField;
    cdsDolgSUB2P: TIntegerField;
    cdsDolgSUB3P: TFMTBCDField;
    cdsDolgDEBET: TFloatField;
    cdsDolgKREDIT: TFloatField;
    PopupMenu1: TPopupMenu;
    N21: TMenuItem;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    mnuRefresh: TMenuItem;
    N2: TMenuItem;
    N6: TMenuItem;
    N3: TMenuItem;
    sdsDolgIZG: TStringField;
    sdsDolgZAK: TStringField;
    sdsDolgMANAGER: TStringField;
    sdsDolgSUB1P: TIntegerField;
    sdsDolgSUB2P: TIntegerField;
    sdsDolgSUB3P: TFMTBCDField;
    sdsDolgDEBET: TFloatField;
    sdsDolgKREDIT: TFloatField;
    actTest: TAction;
    sdsProvodkiRefresh: TSQLDataSet;
    N5: TMenuItem;
    sdsDolgLAST_OPL_DAT: TSQLTimeStampField;
    sdsDolgLAST_OTG_NEOPL_DAT: TSQLTimeStampField;
    sdsDolgLAST_OTG_SUM: TFloatField;
    cdsDolgLAST_OPL_DAT: TSQLTimeStampField;
    cdsDolgLAST_OTG_NEOPL_DAT: TSQLTimeStampField;
    cdsDolgLAST_OTG_SUM: TFloatField;
    actDebug: TAction;
    N7: TMenuItem;
    N8: TMenuItem;
    rpsClientEdit: TRegPropStorageManEh;
    PropStorageEh1: TPropStorageEh;
    N9: TMenuItem;
    sdsDolgProsrochen: TSQLDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TFMTBCDField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    SQLTimeStampField1: TSQLTimeStampField;
    SQLTimeStampField2: TSQLTimeStampField;
    FloatField3: TFloatField;
    dspDolgProsrochen: TDataSetProvider;
    cdsDolgProsrochen: TClientDataSet;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    IntegerField6: TFMTBCDField;
    SQLTimeStampField3: TSQLTimeStampField;
    SQLTimeStampField4: TSQLTimeStampField;
    FloatField6: TFloatField;
    qeDolgProsrochen: TQueryExtender;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    procedure actPreviewExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure frDolgGetValue(const ParName: String; var ParValue: Variant);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actPrintExecute(Sender: TObject);
    procedure actSettingsExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure actDetailExecute(Sender: TObject);
    procedure actNotNullExecute(Sender: TObject);
    procedure cbxNotNullClick(Sender: TObject);
    procedure actTestExecute(Sender: TObject);
    procedure actDebugExecute(Sender: TObject);
    procedure dbgDolgDblClick(Sender: TObject);
    procedure dbgDolgKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    SettingsTipDetail : TfmSettingsPlugin;
    SettingsManager : TfmSettingsPlugin;
    SettingsVlad : TfmSettingsPlugin;
    SettingsClient : TfmSettingsPlugin;
    procedure FillSettings;
    procedure UpdateCaption;
    procedure ProcessColumns;
    procedure ProcessVlad;
    procedure ProcessClient;
    procedure FillCopy(DBGridEh1 : TDBGridEh);
    procedure ProcessSettings;
  public
    { Public declarations }
    setT : TfrmSettings;
    procedure DefaultStartup;
    function Defaultopen:boolean;
  end;

var
  frmRepDolg3: TfrmRepDolg3;

implementation

{$R *.dfm}

uses
  DesignReport, //ProcessReportDesigner
  AtsAssert, //AssertInternal
  SkladAux, //UpdateCaptionVladClientManager
  untRound //
  ;

function TfrmRepDolg3.Defaultopen:boolean;
begin
  ProcessSettings;
	actRefresh.Execute;
  Result :=true;
  if not dsDolg.DataSet.Active then begin
    Result :=false;
  end;
end;

procedure TfrmRepDolg3.DefaultStartup;
begin
try
  SettingsManager.SetKeyValue(dmdEx.GetIdManager);
  //месяц с 15.07 по 15.08
  setT.SetPeriod(2);
  SettingsTipDetail.SetKeyValue(1);
except
  AssertInternal('F57A336B-69F2-4AA3-88C5-BFE7653F6E36');
end;
end;

procedure TfrmRepDolg3.actPreviewExecute(Sender: TObject);
begin
  dmdEx.GetReport('RepDolg.fr3',frDolg);
  frDolg.PrepareReport;
  frDolg.ShowReport;
end;

procedure TfrmRepDolg3.FormCreate(Sender: TObject);
begin
  qeDolg.Defsql := sdsDolg.CommandText;
  FillSettings;
  ProcessReportDesigner(ActionList1,MainMenu1,frDolg);

end;

//--------------- report procedures
procedure TfrmRepDolg3.frDolgGetValue(const ParName: String;
  var ParValue: Variant);
begin
  if AnsiUpperCase(ParName) = 'TITLE' then begin
    ParValue := self.caption;
{    'Отчёт по должникам. Менеджер: '+
      setT.Manager+ ' на '+datetostr(Date)};
  end;
end;

// -------------- end report procedures -------------------

procedure TfrmRepDolg3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmRepDolg3.actPrintExecute(Sender: TObject);
begin
  frDolg.PrepareReport;
  frDolg.Print;
  //PreparedReport('',1,false,frAll);
end;

procedure TfrmRepDolg3.actSettingsExecute(Sender: TObject);
begin
  //actSettings.checked := setT.ProcessSettingsChange(actRefresh);
  actSettings.checked := setT.ProcessSettingsChange2(DefaultOpen);
end;

procedure TfrmRepDolg3.actRefreshExecute(Sender: TObject);
begin
  dmdEx.StartWaiting;
  if setT.GetPluginResult('fmSettingsTipDetail')='1' then begin
    qeDolgProsrochen.Refresh;
  end else begin
    qeDolg.Refresh;
  end;
  dmdEx.StopWaiting;
end;

////////////////////////////////////////////////////////////
//показ детализации с неоплаченными накладными и преоплатами
// идея Тани
procedure TfrmRepDolg3.actDetailExecute(Sender: TObject);
var
  frmDolgDet3 : TfrmDolgDet3;
begin
  frmDolgDet3 :=TfrmDolgDet3.Create (Application);
  frmDolgDet3.showdetail(
    setT.DateTo,
    dsDolg.Dataset.FieldByName('sub1p').AsInteger,
    dsDolg.Dataset.FieldByName('sub2p').AsInteger,
    dsDolg.Dataset.FieldByName('sub3p').AsInteger
    );
end;

///////////////////////////////////
// нажатие кнопки "только активные"
procedure TfrmRepDolg3.actNotNullExecute(Sender: TObject);
begin
   { DONE :
Реализовать notnull  в отчёте по должникам.
Скорее всего при помощи детализации. }
  if cbxNotNull.Checked then begin
    qeDolg.SetSQL('where','(Round(debet,4)<>0 or Round(kredit,4)<>0)',1);
  end
  else begin
    qeDolg.SetSQL('where','',1);
  end;
end;

procedure TfrmRepDolg3.cbxNotNullClick(Sender: TObject);
begin
  actNotNull.Execute;
  qeDolg.Refresh;
end;

procedure TfrmRepDolg3.actTestExecute(Sender: TObject);
begin
  dmdEx.startWaiting;
  with sdsProvodkiRefresh do begin
    Params.ParamByName('id_schet').asInteger:=8211;
    Params.ParamByName('sub1').asInteger:=
      cdsDolg.FieldByName('sub1p').asInteger;
    Params.ParamByName('sub2').asInteger:=
      cdsDolg.FieldByName('sub2p').asInteger;
    Params.ParamByName('sub3').asinteger:=
      cdsDolg.FieldByName('sub3p').AsInteger;
    ExecSql;
  end;
  dmdEx.StopWaiting;
end;

procedure TfrmRepDolg3.actDebugExecute(Sender: TObject);
var
  i : integer;
begin
  actDebug.Checked := not actDebug.Checked;
  if actDebug.Checked then begin
    //показать колонки с номерами фирм и менеджеров
    for i:=0 to dbgDolg.Columns.Count-1 do begin
      if dbgDolg.Columns[i].Tag=1 then begin
        dbgDolg.Columns[i].Visible := true;
      end;
    end;
  end else begin //if actDebug checked
    // скрыть колонки с номерами фирм и менеджеров
    for i:=0 to dbgDolg.Columns.Count-1 do begin
      if dbgDolg.Columns[i].Tag=1 then begin
        dbgDolg.Columns[i].Visible := false;
      end;
    end;
  end;  //if actDebug checked
end;

procedure TfrmRepDolg3.dbgDolgDblClick(Sender: TObject);
begin
  actDetail.Execute;
end;

procedure TfrmRepDolg3.dbgDolgKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return: begin
      actDetail.Execute;
    end;
  end;//case
end;

procedure TfrmRepDolg3.FillSettings;
begin
  setT := TfrmSettings.create (self);
  setT.actManagerOff.execute;
  
  SettingsManager := setT.CreatePlugin('TfmSettingsManager');
  SettingsManager.SetResultType(3);
  setT.AddPlugin(SettingsManager);
  
  SettingsVlad := setT.CreatePlugin('TfmSettingsVlad');
  SettingsVlad.SetResultType(2);
  setT.AddPlugin(SettingsVlad);

  SettingsClient := setT.CreatePlugin('TfmSettingsClient');
  setT.addplugin(SettingsClient);

  actNotNull.Execute;
  SettingsTipDetail := setT.CreatePlugin('TfmSettingsTipDetail');
  SettingsTipDetail.AddDetailTip('По всем долгам');
  SettingsTipDetail.AddDetailTip('По просроченным долгам');
  setT.AddPlugin(SettingsTipDetail);
  FillCopy(dbgDolg);
end;

procedure TfrmRepDolg3.FillCopy(DBGridEh1 : TDBGridEh);
begin
  if  ((dmdEx.getrole='POWER_USER') or (dmdEx.GetUser='SYSDBA')) then begin
    DBGridEh1.EditActions:=[geaCopyEh,geaSelectAllEh];
  end;
end;

procedure TfrmRepDolg3.UpdateCaption;
begin
  if setT.GetPluginResult('fmSettingsTipDetail')='1' then begin
    self.Caption := UpdateCaptionVladClientManager('Просроченные долги.',setT);
  end else begin
    self.Caption := UpdateCaptionVladClientManager('Отчёт по должникам.',setT);
  end;
end;

procedure TfrmRepDolg3.ProcessColumns;
begin
  if setT.GetPluginResult('fmSettingsTipDetail')='1' then begin
    ColumnByName(dbgDolg.Columns,'LAST_OPL_DAT').Visible := false;
    ColumnByName(dbgDolg.Columns,'LAST_OTG_SUM').Visible := false;
  end else begin
    ColumnByName(dbgDolg.Columns,'LAST_OPL_DAT').Visible := true;
    ColumnByName(dbgDolg.Columns,'LAST_OTG_SUM').Visible := true;
  end;
end;

procedure TfrmRepDolg3.ProcessClient;
begin
  if setT.GetPluginResult('fmSettingsTipDetail')='1' then begin
    dmdEx.SetIntegerParamValue(
      cdsDolgProsrochen.Params.ParamByName('sub2_in'),
      setT.GetPluginResult('fmSettingsClient'));
  end else begin
    dmdEx.SetIntegerParamValue(
      cdsDolg.Params.ParamByName('sub2_in'),
      setT.GetPluginResult('fmSettingsClient'));
  end;
end;

procedure TfrmRepDolg3.ProcessVlad;
begin
  if setT.GetPluginResult('fmSettingsTipDetail')='1' then begin
    dmdEx.SetIntegerParamValue(
      cdsDolgProsrochen.Params.ParamByName('sub1_in'),
      setT.GetPluginResult('fmSettingsVlad'));
  end else begin
    dmdEx.SetIntegerParamValue(
      cdsDolg.Params.ParamByName('sub1_in'),
      setT.GetPluginResult('fmSettingsVlad'));
  end;
end;

procedure TfrmRepDolg3.ProcessSettings;
begin
  UpdateCaption;
  ProcessColumns;
  ProcessVlad;
  ProcessClient;
  if setT.GetPluginResult('fmSettingsTipDetail')='1' then begin
    cdsDolgProsrochen.Close;
    dsDolg.DataSet := cdsDolgProsrochen;
    dmdEx.SetIntegerParamValue(
      cdsDolgProsrochen.Params.ParamByName('sub3_in'),
      setT.GetPluginResult('fmSettingsManager'));
    cdsDolgProsrochen.Params.ParamByName('dat_from_in').AsDate :=
      setT.DateFrom;
    cdsDolgProsrochen.Params.ParamByName('dat_to_in').AsDate :=
      setT.DateTo;
  end else begin
    dsDolg.DataSet := cdsDolg;
    cdsDolg.Close;
    dmdEx.SetIntegerParamValue(
      cdsDolg.Params.ParamByName('sub3_in'),
      setT.GetPluginResult('fmSettingsManager'));
    cdsDolg.Params.ParamByName('dat_in').AsDate :=
      setT.DateTo;
  end;
end;

end.
