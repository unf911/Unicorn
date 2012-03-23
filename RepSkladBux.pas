unit RepSkladBux;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DB, DBClient, Provider, SqlExpr, QueryExtender,
  PropFilerEh,   Menus, PropStorageEh, 
  UnfFilter, ActnList, GridsEh, DBGridEh, ExtCtrls, AutoPnl, StdCtrls,
  Buttons, frxClass, frxDBSet, 

  untEx,
  untSettings,
  atsAssert, //AssertInternal
  untRound, //ColumnByName
  SettingsPlugin, //TfmSettingsPlugin
  RepSkladBuxDet //TfrmRepSkladBuxDet
  ;

type
  TfrmRepSkladBux = class(TForm)
    GroupBox1: TGroupBox;
    cbxNotNull: TCheckBox;
    AutoPanel1: TAutoPanel;
    dbgRep: TDBGridEh;
    ActionList1: TActionList;
    actPreview: TAction;
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
    cdsRepSUB3: TIntegerField;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn6: TBitBtn;
    cdsRepSUB1_NAME: TStringField;
    cdsRepSUB2_NAME: TStringField;
    cdsRepCENA: TFloatField;
    cdsRepSUB5_NAME: TStringField;
    cdsRepSUB5: TIntegerField;
    actPartiyaRecount: TAction;
    sdsSebestRecount: TSQLDataSet;
    N5: TMenuItem;
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
  private
    { Private declarations }
    setT: TfrmSettings;
    SettingsTovar : TfmSettingsPlugin;
    SettingsSklad : TfmSettingsPlugin;
    SettingsTipGroup : TfmSettingsPlugin;
    SettingsVlad : TfmSettingsPlugin;
    SettingsPost : TfmSettingsPlugin;
    //Post;
    SettingsTipDetail : TfmSettingsPlugin;
    iSchet : integer;
    iSchetTara : integer;
    procedure ProcessSklad;
    procedure ProcessTovar;
    procedure ProcessDate;
    procedure ProcessColumns;
    procedure ProcessVlad;
    procedure ProcessPost;
    procedure ProcessTipDetail;
    procedure UpdateCaption;
    procedure ProcessGroup;
    procedure FillSklad;
    procedure FillTovar;
    procedure FillGroup;
    procedure FillVlad;
    procedure FillPost;
    procedure FillTipDetail;

  public
    { Public declarations }
    procedure ShowDetail(
      tip_detail_in,tip_group_in: integer;
     id_sklad_in, id_tovar_in, id_vlad_in,id_post_in: variant;
     dat_from, dat_to: TDate);
  end;
  procedure ProcessPartiyaRecount (dbgNaklot: TDBGridEh;param:variant;Object1:Pointer=nil );
  
var
  frmRepSkladBux: TfrmRepSkladBux;

implementation


uses SqlTimSt//datetosqltimestamp

;
{$R *.dfm}



procedure TfrmRepSkladBux.actRefreshExecute(Sender: TObject);
begin
try
	dmdEx.StartWaiting;
  //cdsRep.Close;
  ProcessTipDetail;
  ProcessColumns;
  ProcessGroup;
  ProcessTovar;
  ProcessSklad;
  ProcessDate;
  ProcessVlad;
  ProcessPost;
	qeRep.Refresh;
  UpdateCaption;
	dmdEx.StopWaiting;
except
  AssertInternal('F6F7B3A0-06CD-4188-AC6B-C6B5BAC6AD9A');
end;
end;

procedure TfrmRepSkladBux.actSettingsExecute(Sender: TObject);
begin
  actSettings.checked := setT.ProcessSettingsChange(actRefresh);
end;

procedure TfrmRepSkladBux.ProcessSklad;
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

procedure TfrmRepSkladBux.ProcessTovar;
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

procedure TfrmRepSkladBux.ProcessTipDetail;
var
  sTemp : string;
  iTemp : integer;
begin
  sTemp := setT.GetPluginResult('fmSettingsTipDetail');
  iTemp := strtoint(sTemp);
  case iTemp of
    0: begin
      cdsRep.Params.ParamByName('id_schet').asInteger := iSchet;
    end;
    1: begin
      cdsRep.Params.ParamByName('id_schet').asInteger := iSchetTara;
    end;
  end;
end;

procedure TfrmRepSkladBux.FillTipDetail;
begin
  SettingsTipDetail := setT.CreatePlugin('TfmSettingsTipDetail');
  SettingsTipDetail.AddDetailTip('По товарам');
  SettingsTipDetail.AddDetailTip('По таре');
  setT.AddPlugin(SettingsTipDetail);
  SettingsTipDetail.SetKeyValue(0);
end;

procedure TfrmRepSkladBux.ProcessVlad;
var
  strUkk : string;
begin
  strUkk := setT.GetPluginResult('fmSettingsVlad');
  if (strUkk<>'') then begin
    cdsRep.Params.ParamByName('sub4_in').AsString := strUkk;
  end else begin
    cdsRep.Params.ParamByName('sub4_in').Clear;
  end;
end;

procedure TfrmRepSkladBux.ProcessPost;
var
  strUkk : string;
begin
  strUkk := setT.GetPluginResult('fmSettingsPost');
  if (strUkk<>'') then begin
    cdsRep.Params.ParamByName('sub5_in').AsString := strUkk;
  end else begin
    cdsRep.Params.ParamByName('sub5_in').Clear;
  end;
end;

procedure TfrmRepSkladBux.ProcessDate;
var
  dFrom, dTo : Tdate;
begin
  dFrom := setT.DateFrom;
  dTo := setT.DateTo;
  cdsRep.Params.ParamByName('dat_from').AsDate := dFrom;
  cdsRep.Params.ParamByName('dat_to').AsDate := dTo;
end;

procedure TfrmRepSkladBux.UpdateCaption;
begin
  self.Caption := 'Остатки и обороты склада (бух): с ' +
    datetostr (setT.DateFrom) +
    ' до ' + datetostr(setT.dateTo);
end;


procedure TfrmRepSkladBux.FormCreate(Sender: TObject);
var
  iSchetTip : integer;
begin
  iSchetTip := dmdEx.GetOidObjects('ТИП СЧЕТА',-100);
  iSchet := dmdEx.GetOidObjects('СЕБЕСТОИМОСТЬ БУХ',iSchetTip);
  iSchetTara := dmdEx.GetOidObjects('СЕБЕСТОИМОСТЬ БУХ ТАРА',iSchetTip);  
  qeRep.DefSql := sdsRep.CommandText;
  setT := TfrmSettings.Create(self);
  setT.actDataOnly.Execute;
  setT.SetPeriod(7);
  FillTipDetail;
  FillSklad;
  FillTovar;
  FillGroup;
  FillVlad;
  FillPost;
end;

procedure TfrmRepSkladBux.actDetailExecute(Sender: TObject);
var
  frmDet : TfrmRepSkladBuxDet;
  frmRep : TfrmRepSkladBux;
  iGroupCase : integer;
begin
try
  if (cdsRep.eof and cdsRep.bof) then begin
    exit;
  end;
  iGroupCase := strtoint(setT.GetPluginResult('fmSettingsTipGroup'));
  if iGroupCase<>2 then begin
    frmDet := TfrmRepSkladBuxDet.Create(Application);
    frmDet.ShowDetail(
      cdsRep.Params.ParamByName('id_schet').Value,
      setT.dateFrom,
      setT.DateTo,
      cdsRep.FieldByName('sub1').asVariant,
      cdsRep.FieldByName('sub2').AsVariant,
      cdsRep.FieldByName('sub3').AsVariant,
      cdsRep.Params.ParamByName('sub4_in').Value,
      cdsRep.Params.ParamByName('sub5_in').Value,
      null,null,
      null,null,null,null,null,null);
  end else begin  //if iGroupCase=0
    frmRep := TfrmRepSkladBux.Create(Application);
    frmRep.ShowDetail(
      strtoint(setT.GetPluginResult('fmSettingsTipDetail')),
      0,
      cdsRep.Params.ParamByName('sub2_in').Value,
      cdsRep.FieldByName('sub1').asVariant,      
      cdsRep.Params.ParamByName('sub4_in').Value,
      cdsRep.FieldByName('sub5').AsVariant,
      setT.dateFrom,
      setT.DateTo      );
  end; //if iGroupCase=0
except
  AssertInternal('26C2B649-CF5F-4B2D-A54B-53BD91F9077A');
end;
end;

procedure TfrmRepSkladBux.actShowColumnsSumExecute(Sender: TObject);
begin
  actShowColumnsSum.Checked := not actShowColumnsSum.Checked;
  ProcessColumns;
end;

procedure TfrmRepSkladBux.ProcessGroup;
var
  sTemp : string;
  iTemp : integer;
begin
try
  sTemp := setT.GetPluginResult('fmSettingsTipGroup');
  iTemp := strtoint(sTemp);
  actPartiyaRecount.Visible := false;
  case iTemp of
    0: begin
      qeRep.SetSQL('select',
        ' (select name from objects o where o.oid=r.sub1) as sub1_name, '+
        ' (select name from objects o where o.oid=r.sub2) as sub2_name,'+
        ' cast(null as varchar(50)) as sub5_name,'+
        ' cast(null as integer) as sub5,'+
        '  r.sub1,r.sub2, cast(null as integer) as sub3',0);
      qeRep.SetSQL('group by','r.sub1,  r.sub2',0);
      qeRep.SetSQL('order by','1',0);
      qeRep.Prepare;
      ColumnByName(dbgRep.Columns,'SUB1_NAME').Visible := true;
      ColumnByName(dbgRep.Columns,'SUB2_NAME').Visible := true;
      ColumnByName(dbgRep.Columns,'SUB3').Visible := false;
      ColumnByName(dbgRep.Columns,'SUB5_NAME').Visible := false;
    end;
    1: begin
      qeRep.SetSQL('select',
        ' (select name from objects o where o.oid=r.sub1) as sub1_name, '+
        '(select name from objects o where o.oid=r.sub2) as sub2_name,'+
        ' cast(null as varchar(50)) as sub5_name,'+
        ' cast(null as integer) as sub5,'+
        '  r.sub1,r.sub2, r.sub3'
        ,0);
      qeRep.SetSQL('group by','r.sub1,  r.sub2, r.sub3',0);
      qeRep.SetSQL('order by','1, r.sub3',0);

      qeRep.Prepare;
      ColumnByName(dbgRep.Columns,'SUB1_NAME').Visible := true;
      ColumnByName(dbgRep.Columns,'SUB2_NAME').Visible := true;
      ColumnByName(dbgRep.Columns,'SUB3').Visible := true;
      ColumnByName(dbgRep.Columns,'SUB5_NAME').Visible := false;
      //пересчёт партий видет только если отчёт по партиям
      actPartiyaRecount.Visible := true;
    end;
    2: begin
      qeRep.SetSQL('select',
        'r.sub5, '+
        '(select name from objects o where o.oid=r.sub5) as sub5_name,'+        
        ' cast(null as varchar(50)) as sub1_name,'+
        ' cast(null as integer) as sub1,'+
        ' cast(null as varchar(50)) as sub2_name,'+
        ' cast(null as integer) as sub2, '+
        ' cast(null as integer) as sub3'
        ,0);
      qeRep.SetSQL('group by','r.sub5',0);
      qeRep.SetSQL('order by','2',0);

      qeRep.Prepare;
      ColumnByName(dbgRep.Columns,'SUB1_NAME').Visible := false;
      ColumnByName(dbgRep.Columns,'SUB2_NAME').Visible := false;
      ColumnByName(dbgRep.Columns,'SUB5_NAME').Visible := true;
      ColumnByName(dbgRep.Columns,'SUB3').Visible := false;
    end;
  end;//case
except
  AssertInternal('7BA1F412-60B8-4DBD-9CA3-2FD94764A18B')
end;
end;

procedure TfrmRepSkladBux.ProcessColumns;
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

procedure TfrmRepSkladBux.actShowColumnsKolotpExecute(Sender: TObject);
begin
  actShowColumnsKolotp.Checked := not actShowColumnsKolotp.Checked;
  ProcessColumns;
end;


procedure TfrmRepSkladBux.actDebugExecute(Sender: TObject);
begin
  actDebug.Checked := not actDebug.Checked;
  if actDebug.Checked then begin
    //показать колонки с номерами складов и товаров
    ColumnByName(dbgRep.Columns,'SUB1').visible := true;
    ColumnByName(dbgRep.Columns,'SUB2').visible := true;
    ColumnByName(dbgRep.Columns,'SUB5').visible := true;
  end else begin //if actDebug checked
    ColumnByName(dbgRep.Columns,'SUB1').visible := false;
    ColumnByName(dbgRep.Columns,'SUB2').visible := false;
    ColumnByName(dbgRep.Columns,'SUB5').visible := false;
  end;  //if actDebug checked
end;



procedure TfrmRepSkladBux.FillSklad;
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

procedure TfrmRepSkladBux.FillTovar;
begin
  SettingsTovar := setT.CreatePlugin('TfmSettingsTovar');
  setT.AddPlugin(SettingsTovar);
end;

procedure TfrmRepSkladBux.FillGroup;
begin
  SettingsTipGroup := setT.CreatePlugin('TfmSettingsTipGroup');
  SettingsTipGroup.AddDetailTip('По товарам');
  SettingsTipGroup.AddDetailTip('По партиям');
  SettingsTipGroup.AddDetailTip('По поставщикам');
  setT.AddPlugin(SettingsTipGroup);
  SettingsTipGroup.SetKeyValue(0);
end;

procedure TfrmRepSkladBux.FillVlad;
var
  iTemp : integer;
begin
  SettingsVlad := setT.CreatePlugin('TfmSettingsVlad');
  SettingsVlad.SetResultType(1);
  setT.AddPlugin(SettingsVlad);
  //выбираем точное название для Укк
  iTemp := dmdEx.GetDefaultVlad;
  SettingsVlad.SetKeyValue(iTemp);
end;

procedure TfrmRepSkladBux.FillPost;
//var
  //iTemp : integer;
begin
  SettingsPost := setT.CreatePlugin('TfmSettingsPost');
  //TfmSettingsPost.Create(setT);
  setT.AddPlugin(SettingsPost);
end;

procedure TfrmRepSkladBux.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmRepSkladBux.dbgRepKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return : begin
      actDetail.Execute;
    end;
  end;//case
end;

procedure TfrmRepSkladBux.dbgRepDblClick(Sender: TObject);
begin
  actDetail.Execute;
end;

procedure TfrmRepSkladBux.ShowDetail(
  tip_detail_in,tip_group_in: integer;
  id_sklad_in, id_tovar_in, id_vlad_in, id_post_in: variant;
  dat_from, dat_to: TDate);
begin
  SettingsSklad.SetKeyValue(id_sklad_in);
  SettingsTovar.SetKeyValue(id_tovar_in);
  SettingsVlad.SetKeyValue(id_vlad_in);
  SettingsPost.SetKeyValue(id_post_in);
  SettingsTipDetail.SetKeyValue(tip_detail_in);
  SettingsTipGroup.SetKeyValue(tip_group_in);
  setT.DateFrom:=dat_from;
  setT.DateTo:=dat_to;
  actRefresh.Execute;
end;

procedure TfrmRepSkladBux.cdsRepCalcFields(DataSet: TDataSet);
begin
  //если был остаток, то считается цена остатка, иначе считается цена прихода
  if DataSet.State = dsInternalCalc then begin
    if RRoundTo(DataSet.FieldByName('kolotp_before').AsFloat,-4)=0 then begin
      if RRoundTo(DataSet.FieldByName('debet_kolotp').AsFloat,-3)=0 then begin
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

procedure TfrmRepSkladBux.actPartiyaRecountExecute(Sender: TObject);
begin
  //Перепроводка расходной только по счёту "себестоимость бух"
  if cdsRep.eof and cdsRep.bof then begin
    MessageDlg('Не указана партия для пересчёта',mtWarning,[mbOk],0);
    exit;
  end;
  dmdEx.ColumnSelectAndProcess(dbgRep,Null,ProcessPartiyaRecount,sdsSebestRecount);
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
  sdsSebestRecount.ParamByName('id_schet_in').asInteger  :=
    TClientDataSet(DataSet).Params.ParamValues['id_schet'];  
  sdsSebestRecount.ParamByName('id_tovar_in').asInteger:=
    DataSet.FieldByName('sub1').asInteger;
  sdsSebestRecount.ParamByName('id_sklad_in').asInteger:=
    DataSet.FieldByName('sub2').asInteger;
  sdsSebestRecount.ParamByName('dat_from_in').AsSQLTimeStamp:=
   DateTimeToSQLTimeStamp(
          TClientDataSet(DataSet).Params.ParamValues['dat_from']);
  sdsSebestRecount.ParamByName('id_partiya_in').asInteger:=
    DataSet.FieldByName('sub3').asInteger;
  dmdEx.ExecSQL(sdsSebestRecount);
  dmdex.StopWaiting;
end;

end.
