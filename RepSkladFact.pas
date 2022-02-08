unit RepSkladFact;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DB, DBClient, Provider, SqlExpr, QueryExtender,
  PropFilerEh,   Menus, PropStorageEh,
  UnfFilter, ActnList, GridsEh, DBGridEh, ExtCtrls, AutoPnl, StdCtrls,
  Buttons, frxClass, frxDBSet,
  Grids,
  untEx,
  untSettings,
  SettingsPlugin, //TfmSettingsPlugin
  atsAssert, //AssertInternal
  untRound, //ColumnByName
  RepSkladFactDet //TfrmRepSkladFactDet

  ;

type
  TfrmRepSkladFact = class(TForm)
    GroupBox1: TGroupBox;
    cbxNotNull: TCheckBox;
    AutoPanel1: TAutoPanel;
    dbgRep: TDBGridEh;
    ActionList1: TActionList;
    actCall: TAction;
    actSettings: TAction;
    actDetail: TAction;
    actRefresh: TAction;
    actNotNull: TAction;
    actRecalc: TAction;
    actDebug: TAction;
    UnfFilter1: TUnfFilter;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    mnuRefresh: TMenuItem;
    N2: TMenuItem;
    N6: TMenuItem;
    N4: TMenuItem;
    qeRep: TQueryExtender;
    sdsRep: TSQLDataSet;
    dspRep: TDataSetProvider;
    cdsRep: TClientDataSet;
    cdsRepSUB1: TIntegerField;
    cdsRepSUB2: TIntegerField;
    cdsRepDEBETBEFORE: TFloatField;
    cdsRepKREDITBEFORE: TFloatField;
    cdsRepDEBET: TFloatField;
    cdsRepKREDIT: TFloatField;
    cdsRepDEBETAFTER: TFloatField;
    cdsRepKREDITAFTER: TFloatField;
    cdsRepKOLOTP_BEFORE: TFloatField;
    cdsRepDEBET_KOLOTP: TFloatField;
    cdsRepKREDIT_KOLOTP: TFloatField;
    cdsRepKOLOTP_AFTER: TFloatField;
    dsRep: TDataSource;
    actShowColumnsSum: TAction;
    actShowColumnsKolotp: TAction;
    CheckBox1: TCheckBox;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn6: TBitBtn;
    cdsRepSUB1_NAME: TStringField;
    cdsRepSUB2_NAME: TStringField;
    cdsRepCENA: TFloatField;
    actPartiyaRecount: TAction;
    sdsSebestRecountUsual: TSQLDataSet;
    N5: TMenuItem;
    sdsPartiyaMinus: TSQLDataSet;
    actPartiyaMinus: TAction;
    N7: TMenuItem;
    PopupMenu1: TPopupMenu;
    MenuItem1: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    cdsRepSUB3: TFMTBCDField;
    procedure actRefreshExecute(Sender: TObject);
    procedure actSettingsExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
     procedure actDetailExecute(Sender: TObject);
    procedure actShowColumnsSumExecute(Sender: TObject);
    procedure actShowColumnsKolotpExecute(Sender: TObject);
    procedure actDebugExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgRepKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgRepDblClick(Sender: TObject);
    procedure cdsRepCalcFields(DataSet: TDataSet);
    procedure actPartiyaRecountExecute(Sender: TObject);
    procedure actPartiyaMinusExecute(Sender: TObject);
  private
    { Private declarations }
    setT: TfrmSettings;
    SettingsTovar : TfmSettingsPlugin;
    SettingsSklad : TfmSettingsPlugin;
    SettingsTipGroup : TfmSettingsPlugin;
    iSchet : integer;
    procedure ProcessSklad;
    procedure ProcessTovar;
    procedure ProcessDate;
    procedure ProcessColumns;
    procedure ProcessTipDetail;
    procedure UpdateCaption;
    procedure ProcessGroup;
    procedure ProcessPart(iMode: integer);
    procedure FillSklad;
    procedure FillTovar;
    procedure FillGroup;
    procedure ShowForBuxgAndPoweruser;
    procedure ProcessSettings;

  public
    { Public declarations }
    function Defaultopen:boolean;
    procedure ShowDetail(
      tip_detail_in,tip_group_in: integer;
     id_sklad_in, id_tovar_in, id_vlad_in: variant;
     dat_from, dat_to: TDate);
  end;
  procedure ProcessPartiyaRecount (dbgNaklot: TDBGridEh;param:variant;Object1:Pointer=nil );
  
var
  frmRepSkladFact: TfrmRepSkladFact;

implementation

{$R *.dfm}

uses SqlTimSt;  //Sqltimestamp

procedure TfrmRepSkladFact.actRefreshExecute(Sender: TObject);
begin
try
	dmdEx.StartWaiting;
  //cdsRep.Close;
	qeRep.Refresh;
	dmdEx.StopWaiting;
except
  AssertInternal('F6F7B3A0-06CD-4188-AC6B-C6B5BAC6AD9A');
end;
end;

procedure TfrmRepSkladFact.actSettingsExecute(Sender: TObject);
begin
  actSettings.checked := setT.ProcessSettingsChange2(DefaultOpen);
end;

function TfrmRepSkladFact.Defaultopen:boolean;
begin
  ProcessSettings;
	actRefresh.Execute;
  Result :=true;
  if not dsRep.DataSet.Active then begin
    Result :=false;
  end;
end;

procedure TfrmRepSkladFact.ProcessSettings;
begin
  ProcessTipDetail;
  ProcessColumns;
  ProcessGroup;
  ProcessTovar;
  ProcessSklad;
  ProcessDate;
  UpdateCaption;
end;

procedure TfrmRepSkladFact.ProcessSklad;
var
  sTemp : string;
begin
  sTemp := setT.GetPluginResult('fmSettingsSklad');
  if sTemp = '' then begin
    cdsRep.Params.ParamByName('sub2_in').Clear;
  end else begin
    cdsRep.Params.ParamByName('sub2_in').AsString := sTemp;
  end; //if все склады
end;

procedure TfrmRepSkladFact.ProcessTovar;
var
  sTemp : string;
begin
  sTemp := setT.GetPluginResult('fmSettingsTovar');
  if sTemp = '' then begin
    cdsRep.Params.ParamByName('sub1_in').Clear;
  end else begin
    cdsRep.Params.ParamByName('sub1_in').AsString := sTemp;
  end;
end;

procedure TfrmRepSkladFact.ProcessTipDetail;
begin
  cdsRep.Params.ParamByName('id_schet').asInteger := iSchet;
end; 

procedure TfrmRepSkladFact.ProcessDate;
var
  dFrom, dTo : Tdate;
begin
  dFrom := setT.DateFrom;
  dTo := setT.DateTo;
  cdsRep.Params.ParamByName('dat_from').AsDate := dFrom;
  cdsRep.Params.ParamByName('dat_to').AsDate := dTo;
end;

procedure TfrmRepSkladFact.UpdateCaption;
begin
  self.Caption := 'Остатки и обороты склада: с ' +
    datetostr (setT.DateFrom) +
    ' до ' + datetostr(setT.dateTo);
end;


procedure TfrmRepSkladFact.FormCreate(Sender: TObject);
var
  iSchetTip : integer;
begin
  iSchetTip := dmdEx.GetOidObjects('ТИП СЧЕТА',-100);
  iSchet := dmdEx.GetOidObjects('СЕБЕСТОИМОСТЬ СКЛАД',iSchetTip);
  qeRep.DefSql := sdsRep.CommandText;
  setT := TfrmSettings.Create(self);
  setT.actDataOnly.Execute;
  FillSklad;
  FillTovar;
  FillGroup;
  ShowForBuxgAndPoweruser;
end;

procedure TfrmRepSkladFact.actDetailExecute(Sender: TObject);
var
  frmDet : TfrmRepSkladFactDet;
begin
try
  if (cdsRep.eof and cdsRep.bof) then begin
    exit;
  end;
  frmDet := TfrmRepSkladFactDet.Create(self);
  if not actShowColumnsSum.Checked then begin
    frmDet.actShowSebestSumColumns.Checked:=false;
    frmDet.ProcessColumns;
  end;
  frmDet.ShowDetail(
    cdsRep.Params.ParamByName('id_schet').Value,
    setT.dateFrom,
    setT.DateTo,
    cdsRep.FieldByName('sub1').asVariant,
    cdsRep.FieldByName('sub2').AsVariant,
    cdsRep.FieldByName('sub3').AsVariant,
    null,
    null,null,
    null,null,null,null);
except
  AssertInternal('26C2B649-CF5F-4B2D-A54B-53BD91F9077A');
end;
end;

procedure TfrmRepSkladFact.actShowColumnsSumExecute(Sender: TObject);
begin
  actShowColumnsSum.Checked := not actShowColumnsSum.Checked;
  ProcessColumns;
end;

procedure TfrmRepSkladFact.ProcessGroup;
var
  sTemp : string;
  iMode : integer;
begin
try
  sTemp := setT.GetPluginResult('fmSettingsTipGroup');
  iMode := strtoint(sTemp);
  ProcessPart(iMode);
  case iMode of
    0: begin
      qeRep.SetSQL('select','cast(null as bigint) as sub3',0);
      qeRep.SetSQL('group by','',0);
      qeRep.SetSQL('order by','2',0);
      qeRep.Prepare;
      ColumnByName(dbgRep.Columns,'SUB3').Visible := false;
    end;
    1: begin
      qeRep.SetSQL('select','r.sub3',0);
      qeRep.SetSQL('group by','r.sub3',0);
      qeRep.SetSQL('order by','2, r.sub3',0);

      qeRep.Prepare;
      ColumnByName(dbgRep.Columns,'SUB3').Visible := true;
    end;
  end;//case
except
  AssertInternal('7BA1F412-60B8-4DBD-9CA3-2FD94764A18B')
end;
end;

procedure TfrmRepSkladFact.ProcessPart(iMode: integer);
begin
  actPartiyaRecount.Enabled := false;
  actPartiyaMinus.Enabled := false;
  //по партиям
  if iMode = 1 then begin
    actPartiyaRecount.Enabled := true;
    actPartiyaMinus.Enabled := true;
  end;
end;

procedure TfrmRepSkladFact.ProcessColumns;
begin
  if actShowColumnsSum.Checked then begin
    ColumnByName(dbgRep.Columns,'CENA').visible := true;
    ColumnByName(dbgRep.Columns,'DEBETBEFORE').visible := true;
    ColumnByName(dbgRep.Columns,'KREDITBEFORE').visible := true;
    ColumnByName(dbgRep.Columns,'KREDIT').visible := true;
    ColumnByName(dbgRep.Columns,'DEBET').visible := true;
    ColumnByName(dbgRep.Columns,'DEBETAFTER').visible := true;
    ColumnByName(dbgRep.Columns,'KREDITAFTER').visible := true;
  end else begin
    ColumnByName(dbgRep.Columns,'CENA').visible := false;
    ColumnByName(dbgRep.Columns,'DEBETBEFORE').visible := false;
    ColumnByName(dbgRep.Columns,'KREDITBEFORE').visible := false;
    ColumnByName(dbgRep.Columns,'DEBET').visible := false;
    ColumnByName(dbgRep.Columns,'KREDIT').visible := false;
    ColumnByName(dbgRep.Columns,'DEBETAFTER').visible := false;
    ColumnByName(dbgRep.Columns,'KREDITAFTER').visible := false;
  end;
  if actShowColumnsKolotp.Checked then begin
    ColumnByName(dbgRep.Columns,'KOLOTP_BEFORE').visible := true;
    ColumnByName(dbgRep.Columns,'KOLOTP_AFTER').visible := true;
    ColumnByName(dbgRep.Columns,'DEBET_KOLOTP').visible := true;
    ColumnByName(dbgRep.Columns,'KREDIT_KOLOTP').visible := true;
  end else begin
    ColumnByName(dbgRep.Columns,'KOLOTP_BEFORE').visible := false;
    ColumnByName(dbgRep.Columns,'KOLOTP_AFTER').visible := false;
    ColumnByName(dbgRep.Columns,'DEBET_KOLOTP').visible := false;
    ColumnByName(dbgRep.Columns,'KREDIT_KOLOTP').visible := false;
  end;
end;

procedure TfrmRepSkladFact.actShowColumnsKolotpExecute(Sender: TObject);
begin
  actShowColumnsKolotp.Checked := not actShowColumnsKolotp.Checked;
  ProcessColumns;
end;


procedure TfrmRepSkladFact.actDebugExecute(Sender: TObject);
begin
  actDebug.Checked := not actDebug.Checked;
  if actDebug.Checked then begin
    //показать колонки с номерами складов и товаров
    ColumnByName(dbgRep.Columns,'SUB1').visible := true;
    ColumnByName(dbgRep.Columns,'SUB2').visible := true;
  end else begin //if actDebug checked
    ColumnByName(dbgRep.Columns,'SUB1').visible := false;
    ColumnByName(dbgRep.Columns,'SUB2').visible := false;
  end;  //if actDebug checked
end;



procedure TfrmRepSkladFact.FillSklad;
var
  iSkladTreeOid : integer;
begin
  SettingsSklad := setT.CreatePlugin('TfmSettingsSklad');
  setT.AddPlugin(SettingsSklad);
  SettingsSklad.SetResultType(1);
  iSkladTreeOid:=dmdEx.GetOidObjects('ТИП НАЗВАНИЯ СКЛАДОВ',-100);
  iSkladTreeOid:=dmdEx.GetOidObjects('УКК Склад',iSkladTreeOid);
  SettingsSklad.SetKeyValue(iSkladTreeOid);
end;

procedure TfrmRepSkladFact.FillTovar;
begin
  SettingsTovar := setT.CreatePlugin('TfmSettingsTovar');
  setT.AddPlugin(SettingsTovar);
end;

procedure TfrmRepSkladFact.FillGroup;
begin
  SettingsTipGroup := setT.CreatePlugin('TfmSettingsTipGroup');
  SettingsTipGroup.AddDetailTip('По товарам');
  SettingsTipGroup.AddDetailTip('По партиям');
  setT.AddPlugin(SettingsTipGroup);
  SettingsTipGroup.SetKeyValue(0);
end;

procedure TfrmRepSkladFact.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmRepSkladFact.dbgRepKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return : begin
      actDetail.Execute;
    end;
  end;//case
end;

procedure TfrmRepSkladFact.dbgRepDblClick(Sender: TObject);
begin
  actDetail.Execute;
end;

procedure TfrmRepSkladFact.ShowDetail(
  tip_detail_in,tip_group_in: integer;
  id_sklad_in, id_tovar_in, id_vlad_in: variant;
  dat_from, dat_to: TDate);
begin
  SettingsSklad.SetKeyValue(id_sklad_in);
  SettingsTovar.SetKeyValue(id_tovar_in);
  SettingsTipGroup.SetKeyValue(tip_group_in);
  setT.DateFrom:=dat_from;
  setT.DateTo:=dat_to;
  actRefresh.Execute;
end;

procedure TfrmRepSkladFact.cdsRepCalcFields(DataSet: TDataSet);
begin
  //если был остаток, то считается цена остатка, иначе считается цена прихода
  if DataSet.State = dsInternalCalc then begin
    if RRoundTo(DataSet.FieldByName('kolotp_before').AsFloat,-3)=0 then begin
      if RRoundTo(DataSet.FieldByName('debet_kolotp').AsFloat,-2)=0 then begin
        DataSet.FieldByName('cena').Clear;
      end else begin
        DataSet.FieldByName('cena').AsFloat :=
        DataSet.FieldByName('debet').AsFloat
        /DataSet.FieldByName('debet_kolotp').AsFloat;
      end   //if DataSet.FieldByName('debet_kolotp').AsFloat=0
    end else begin  //  if DataSet.FieldByName('kolotp_before').AsFloat=0
      DataSet.FieldByName('cena').AsFloat :=
        DataSet.FieldByName('debetbefore').AsFloat
        /DataSet.FieldByName('kolotp_before').AsFloat;
    end;  //  if DataSet.FieldByName('kolotp_before').AsFloat=0
  end; //if DataSet.State = dsInternalCalc
end;


procedure TfrmRepSkladFact.ShowForBuxgAndPoweruser;
begin
  if ((dmdEx.getrole='POWER_USER') or (dmdEx.getrole='BUXG')
    or (dmdEx.GetUser='SYSDBA'))
  then begin
    actShowColumnsSum.Enabled :=true;
    actShowColumnsSum.Visible :=true;
  end else begin
    if actShowColumnsSum.Checked then begin
      //actShowColumnsSum.Checked :=false;
      actShowColumnsSum.execute;
    end;
    ProcessColumns;
    actShowColumnsSum.Enabled :=false;
    actShowColumnsSum.Visible :=false;
  end;
end;

procedure TfrmRepSkladFact.actPartiyaRecountExecute(Sender: TObject);
begin
  //Перепроводка расходной только по счёту "себестоимость бух"
  if cdsRep.eof and cdsRep.bof then begin
    MessageDlg('Не указана партия для пересчёта',mtWarning,[mbOk],0);
    exit;
  end;
  dmdEx.ColumnSelectAndProcess(dbgRep,Null,ProcessPartiyaRecount,sdsSebestRecountUsual);
end;

procedure ProcessPartiyaRecount (dbgNaklot: TDBGridEh;param:variant;Object1:Pointer=nil );
var
  DataSet : TDataSet;
  sdsSebestRecount : TSQLDataSet;
begin
  sdsSebestRecount := TSQLDataSet(Object1);
  DataSet := dbgNaklot.DataSource.DataSet;
  //Перепроводка расходной только по счёту "себестоимость бух"
  dmdEx.StartWaiting;
  sdsSebestRecount.ParamByName('id_tovar_in').asInteger:=
    DataSet.FieldByName('sub1').asInteger;
  sdsSebestRecount.ParamByName('id_sklad_in').asInteger:=
    DataSet.FieldByName('sub2').asInteger;
  sdsSebestRecount.ParamByName('dat_from_in').AsSQLTimeStamp:=
   DateTimeToSQLTimeStamp(
          TClientDataSet(DataSet).Params.ParamValues['dat_from']);
  sdsSebestRecount.ParamByName('id_partiya_in').asBcd:=
    VarFMTBcdCreate(DataSet.FieldByName('sub3').asBcd);
  dmdEx.ExecSQL(sdsSebestRecount);
  dmdex.StopWaiting;
end;

procedure ProcessPartiyaMinusRecount (dbgNaklot: TDBGridEh;param:variant;Object1:Pointer=nil );
var
  DataSet : TDataSet;
  sdsSebestRecount : TSQLDataSet;
begin
  sdsSebestRecount := TSQLDataSet(Object1);
  DataSet := dbgNaklot.DataSource.DataSet;
  dmdEx.StartWaiting;
  sdsSebestRecount.ParamByName('id_tovar_in').asInteger:=
    DataSet.FieldByName('sub1').asInteger;
  sdsSebestRecount.ParamByName('id_sklad_in').asInteger:=
    DataSet.FieldByName('sub2').asInteger;
  dmdEx.CloseQuery(sdsSebestRecount);
  dmdEx.OpenQuery(sdsSebestRecount);
  dmdex.StopWaiting;
end;

procedure TfrmRepSkladFact.actPartiyaMinusExecute(Sender: TObject);
begin
  //Перепроводка расходной только по счёту "себестоимость бух"
  if cdsRep.eof and cdsRep.bof then begin
    MessageDlg('Не указана партия для пересчёта',mtWarning,[mbOk],0);
    exit;
  end;
  dmdEx.ColumnSelectAndProcess(
    dbgRep,
    Null,
    ProcessPartiyaMinusRecount,
    sdsPartiyaMinus);
end;

end.
