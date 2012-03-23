unit RepSkladBuxVyravn;

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
  SettingsDate, //TfmSettingsDate
  atsAssert, //AssertInternal
  untRound, //ColumnByName
  SettingsPlugin, //TfmSettingsVlad
  RepSkladBuxDet, //TfrmRepSkladBuxDet
  DateUtils//Endofthemonth
  ;

type
  TfrmRepSkladBuxVyravn = class(TForm)
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
    frReport1: TfrxReport;
    rpsClientEdit: TRegPropStorageManEh;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    mnuRefresh: TMenuItem;
    N2: TMenuItem;
    N6: TMenuItem;
    N4: TMenuItem;
    frdDolgBux: TfrxDBDataset;
    qeRep: TQueryExtender;
    sdsRep: TSQLDataSet;
    dspRep: TDataSetProvider;
    cdsRep: TClientDataSet;
    dsRep: TDataSource;
    actShowColumnsSum: TAction;
    actShowColumnsKolotp: TAction;
    CheckBox1: TCheckBox;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn6: TBitBtn;
    cdsRepID_TOVAR: TIntegerField;
    cdsRepTOVAR: TStringField;
    cdsRepKOLOTP_BUX: TFloatField;
    cdsRepKOLOTP_ALL_SKLADS: TFloatField;
    cdsRepKOLOTP_SKLAD: TFloatField;
    cdsRepKOLOTP_REST_SKLADS: TFloatField;
    cdsRepDIFF: TFloatField;
    sdsPrixodCreate: TSQLDataSet;
    actPrixodCreate: TAction;
    N5: TMenuItem;
    sdsPrixodDetCreate: TSQLDataSet;
    actRasxodCreate: TAction;
    sdsRasxodCreate: TSQLDataSet;
    sdsRasxodDetCreate: TSQLDataSet;
    N7: TMenuItem;
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
    procedure actPrixodCreateExecute(Sender: TObject);
    procedure actRasxodCreateExecute(Sender: TObject);
  private
    { Private declarations }
    setT: TfrmSettings;
    SettingsTovar : TfmSettingsPlugin;
    SettingsSklad : TfmSettingsPlugin;
    //SettingsTipGroup : TfmSettingsTipGroup;
    SettingsVlad : TfmSettingsPlugin;
    SettingsTipDetail1 : TfmSettingsPlugin;
    SettingsDate : TfmSettingsDate;
    SettingsTipDetail2 : TfmSettingsPlugin;
    SettingsSklad2 :TfmSettingsPlugin;
    SettingsSklad3 :TfmSettingsPlugin;
    iSchet : integer;
    iSchetTara : integer;
    iSkladRestIn : integer;
    FTipVyravn : integer;
    procedure ProcessSklad;
    procedure ProcessTovar;
    procedure ProcessDate;
    procedure ProcessColumns;
    procedure ProcessVlad;
    procedure ProcessTipDetail;
    procedure ProcessTipVyravn;
    procedure UpdateCaption;
    procedure FillSklad;
    procedure FillTovar;
    procedure FillVlad;
    procedure FillTipDetail;
    procedure FillDate;
    procedure FillTipVyravn;

  public
    { Public declarations }
  end;

var
  frmRepSkladBuxVyravn: TfrmRepSkladBuxVyravn;

implementation

{$R *.dfm}

uses
  RepSkladBux,
  untSklost,
  NaklpBux,
  SkladAux; //OpenDocument
  


procedure TfrmRepSkladBuxVyravn.actRefreshExecute(Sender: TObject);
begin
try
	dmdEx.StartWaiting;
  cdsRep.Close;
  ProcessTipVyravn;
  ProcessTipDetail;
  ProcessColumns;
  ProcessTovar;
  ProcessSklad;
  ProcessDate;
  ProcessVlad;
	qeRep.Refresh;
  UpdateCaption;
	dmdEx.StopWaiting;
except
  AssertInternal('DAF35CD1-59AD-49FC-81BA-EFAE5F119C10');
end;
end;

procedure TfrmRepSkladBuxVyravn.actSettingsExecute(Sender: TObject);
begin
  actSettings.checked := setT.ProcessSettingsChange(actRefresh);
end;

procedure TfrmRepSkladBuxVyravn.ProcessSklad;
var
  sTemp : string;
begin
  sTemp := setT.GetPluginResult('fmSettingsSklad');
  if sTemp = '' then begin
    cdsRep.Params.ParamByName('id_sklad_in').Clear;
  end else begin
    cdsRep.Params.ParamByName('id_sklad_in').AsString := sTemp;
  end; //if все склады


  sTemp := setT.GetPluginResult('fmSettingsSklad2');
  if sTemp = '' then begin
    cdsRep.Params.ParamByName('id_sklad_bux').Clear;
  end else begin
    cdsRep.Params.ParamByName('id_sklad_bux').AsString := sTemp;
  end; //if все склады

  sTemp := setT.GetPluginResult('fmSettingsSklad3');
  if sTemp = '' then begin
    cdsRep.Params.ParamByName('id_sklad_rest_in').Clear;
  end else begin
    cdsRep.Params.ParamByName('id_sklad_rest_in').AsString := sTemp;
  end; //if все склады
  //cdsRep.Params.ParamByName('id_sklad_rest_in').asInteger :=iSkladRestIn;
end;

procedure TfrmRepSkladBuxVyravn.ProcessTovar;
var
  sTemp : string;
begin
  sTemp := setT.GetPluginResult('fmSettingsTovar');
  if sTemp = '' then begin
    cdsRep.Params.ParamByName('id_tovar_in').Clear;
  end else begin
    cdsRep.Params.ParamByName('id_tovar_in').AsString := sTemp;
  end;
end;

procedure TfrmRepSkladBuxVyravn.ProcessTipDetail;
var
  sTemp : string;
  iTemp : integer;
begin
  sTemp := setT.GetPluginResult('fmSettingsTipDetail1');
  iTemp := strtoint(sTemp);
  case iTemp of
    0: begin
      cdsRep.Params.ParamByName('id_schet_in').asInteger := iSchet;
      cdsRep.Params.ParamByName('id_tara_in').asInteger := 2;
    end;
    1: begin
      cdsRep.Params.ParamByName('id_schet_in').asInteger := iSchetTara;
      cdsRep.Params.ParamByName('id_tara_in').asInteger := 1;
    end;
  end;
end;

procedure TfrmRepSkladBuxVyravn.ProcessTipVyravn;
var
  sTemp : string;
  iTemp : integer;
begin
  sTemp := setT.GetPluginResult('fmSettingsTipDetail2');
  iTemp := strtoint(sTemp);
  case iTemp of
    0: begin
      FTipVyravn :=0;
    end;
    1: begin
      FTipVyravn :=1;
    end;
  end;
end;

procedure TfrmRepSkladBuxVyravn.FillTipDetail;
begin
  SettingsTipDetail1 := setT.CreatePlugin('TfmSettingsTipDetail');
  SettingsTipDetail1.Name := 'fmSettingsTipDetail1';
  SettingsTipDetail1.AddDetailTip('По товарам');
  SettingsTipDetail1.AddDetailTip('По таре');
  setT.AddPlugin(SettingsTipDetail1);
  SettingsTipDetail1.SetKeyValue(0);
end;

procedure TfrmRepSkladBuxVyravn.FillTipVyravn;
begin
  SettingsTipDetail2 := setT.CreatePlugin('TfmSettingsTipDetail');
  SettingsTipDetail2.Name := 'fmSettingsTipDetail2';
  SettingsTipDetail2.SetLabelValue('Выравнивание');
  setT.addplugin(SettingsTipDetail2);

  SettingsTipDetail2.AddDetailTip('Экстренное');
  SettingsTipDetail2.AddDetailTip('Плановое');
  SettingsTipDetail2.SetKeyValue(1);
end;

procedure TfrmRepSkladBuxVyravn.ProcessVlad;
var
  strUkk : string;
begin
  strUkk := setT.GetPluginResult('fmSettingsVlad');
  if (strUkk<>'') then begin
    cdsRep.Params.ParamByName('id_izg_in').AsString := strUkk;
  end else begin
    cdsRep.Params.ParamByName('id_izg_in').Clear;
  end;
end;

procedure TfrmRepSkladBuxVyravn.ProcessDate;
var
  strUkk : string;
  dTo : Tdate;
begin
  strUkk := setT.GetPluginResult('fmSettingsDate');
  dTo := strtodate(strUkk);
  cdsRep.Params.ParamByName('dat_to').AsDate := dTo;
end;

procedure TfrmRepSkladBuxVyravn.UpdateCaption;
begin
  self.Caption := 'Выравнивание склада на ' +
    setT.GetPluginTextResult('fmSettingsDate');
end;


procedure TfrmRepSkladBuxVyravn.FormCreate(Sender: TObject);
var
  iSchetTip : integer;
begin
  iSchetTip := dmdEx.GetOidObjects('ТИП СЧЕТА',-100);
  iSchet := dmdEx.GetOidObjects('СЕБЕСТОИМОСТЬ БУХ',iSchetTip);
  iSchetTara := dmdEx.GetOidObjects('СЕБЕСТОИМОСТЬ БУХ ТАРА',iSchetTip);


  qeRep.DefSql := sdsRep.CommandText;
  setT := TfrmSettings.Create(self);
  setT.actDataOff.Execute;
  setT.actManagerOff.Execute;
  FillTipVyravn;  
  FillTipDetail;
  FillSklad;
  FillTovar;
  FillVlad;
  FillDate;
end;

procedure TfrmRepSkladBuxVyravn.actDetailExecute(Sender: TObject);
var
//  frmDet : TfrmRepSkladBuxDet;
  frmRepSkladBux : TfrmRepSkladBux;
  frmSklost : TfrmSklost;
  dFrom,dTo: TDate;
begin
try
  if (cdsRep.eof and cdsRep.bof) then begin
    exit;
  end;
  if AnsiUpperCase(dbgRep.SelectedField.FieldName)=
    AnsiUpperCase('KOLOTP_BUX') then begin
    dTo := strtodate(setT.GetPluginResult('fmSettingsDate'));
    dFrom := StartOfTheMonth(dTo);
    frmRepSkladBux := TfrmRepSkladBux.Create(Application);
    frmRepSkladBux.ShowDetail(
      0,1,
      setT.GetPluginResult('fmSettingsSklad2'),
      //setT.GetPluginResult('fmSettingsSklad'),
      dsRep.DataSet.FieldByName('id_tovar').asInteger,
      setT.GetPluginResult('fmSettingsVlad'),
      Null,
      dFrom,
      dTo
      );
  end;
  if AnsiUpperCase(dbgRep.SelectedField.FieldName)=
    AnsiUpperCase('KOLOTP_SKLAD') then begin
    dTo := strtodate(setT.GetPluginResult('fmSettingsDate'));
    frmSklost := TfrmSklost.Create(Application);
    frmSklost.ShowDetail(2,
      setT.GetPluginResult('fmSettingsSklad'),
      dsRep.DataSet.FieldByName('id_tovar').asInteger,
      dTo,
      null
      );
  end;
  if AnsiUpperCase(dbgRep.SelectedField.FieldName)=
    AnsiUpperCase('KOLOTP_REST_SKLADS') then begin
    dTo := strtodate(setT.GetPluginResult('fmSettingsDate'));
    frmSklost := TfrmSklost.Create(Application);
    frmSklost.ShowDetail(2,
      iSkladRestIn,
      dsRep.DataSet.FieldByName('id_tovar').asInteger,
      dTo,
      null
      );
  end;
except
  AssertInternal('26C2B649-CF5F-4B2D-A54B-53BD91F9077A');
end;
end;

procedure TfrmRepSkladBuxVyravn.actShowColumnsSumExecute(Sender: TObject);
begin
  actShowColumnsSum.Checked := not actShowColumnsSum.Checked;
  ProcessColumns;
end;

procedure TfrmRepSkladBuxVyravn.ProcessColumns;
begin
{
  if actShowColumnsSum.Checked then begin
    ColumnByName(dbgRep.Columns,'DEBETBEFORE').visible := true;
  end else begin
    ColumnByName(dbgRep.Columns,'DEBETBEFORE').visible := false;
  end;
  if actShowColumnsKolotp.Checked then begin
    ColumnByName(dbgRep.Columns,'KOLOTP_BEFORE').visible := true;
  end else begin
    ColumnByName(dbgRep.Columns,'KOLOTP_BEFORE').visible := false;
  end;
}
end;

procedure TfrmRepSkladBuxVyravn.actShowColumnsKolotpExecute(Sender: TObject);
begin
  actShowColumnsKolotp.Checked := not actShowColumnsKolotp.Checked;
  ProcessColumns;
end;


procedure TfrmRepSkladBuxVyravn.actDebugExecute(Sender: TObject);
begin
  actDebug.Checked := not actDebug.Checked;
  if actDebug.Checked then begin
    //показать колонки с номерами складов и товаров
    ColumnByName(dbgRep.Columns,'ID_TOVAR').visible := true;
  end else begin //if actDebug checked
    ColumnByName(dbgRep.Columns,'ID_TOVAR').visible := false;
  end;  //if actDebug checked
end;



procedure TfrmRepSkladBuxVyravn.FillSklad;
var
  iSkladTreeOid : integer;
  iSkladUKK : integer;
begin
  SettingsSklad3 := setT.CreatePlugin('TfmSettingsSklad');
  SettingsSklad3.Name :=  'fmSettingsSklad3';
  SettingsSklad3.SetResultType(1);
  SettingsSklad3.SetLabelValue('Склад хранения');
  setT.AddPlugin(SettingsSklad3);
  iSkladTreeOid := dmdEx.GetOidObjects('ТИП НАЗВАНИЯ СКЛАДОВ',-100);
  iSkladRestIn := dmdEx.GetOidObjects('Все склады кроме УКК',iSkladTreeOid);

  //iSkladTreeOid:=dmdEx.GetOidObjects('ТИП НАЗВАНИЯ СКЛАДОВ',-100);
  //iSkladRestIn := dmdEx.GetOidObjects('УКК Склад',iSkladTreeOid);
  SettingsSklad3.SetKeyValue(iSkladRestIn );

  SettingsSklad2 := setT.CreatePlugin('TfmSettingsSklad');
  SettingsSklad2.Name :=  'fmSettingsSklad2';
  SettingsSklad2.SetResultType(1);
  SettingsSklad2.SetLabelValue('Бухгалтерский склад');
  setT.AddPlugin(SettingsSklad2);
  //iSkladTreeOid:=dmdEx.GetOidObjects('ТИП НАЗВАНИЯ СКЛАДОВ',-100);
  iSkladUKK := dmdEx.GetOidObjects('УКК Склад',iSkladTreeOid);
  SettingsSklad2.SetKeyValue(iSkladUKK);

  SettingsSklad := setT.CreatePlugin('TfmSettingsSklad');
  setT.AddPlugin(SettingsSklad);
  SettingsSklad.SetResultType(1);

  //iSkladTreeOid:=dmdEx.GetOidObjects('УКК Склад',iSkladTreeOid);

  iSkladTreeOid:=dmdEx.GetOidObjects('Все склады УКК',iSkladTreeOid);
  SettingsSklad.SetKeyValue(iSkladTreeOid);


end;

procedure TfrmRepSkladBuxVyravn.FillTovar;
begin
  SettingsTovar := setT.CreatePlugin('TfmSettingsTovar');
  setT.AddPlugin(SettingsTovar);
end;

procedure TfrmRepSkladBuxVyravn.FillVlad;
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

procedure TfrmRepSkladBuxVyravn.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmRepSkladBuxVyravn.dbgRepKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return : begin
      actDetail.Execute;
    end;
  end;//case
end;

procedure TfrmRepSkladBuxVyravn.dbgRepDblClick(Sender: TObject);
begin
  actDetail.Execute;
end;

procedure TfrmRepSkladBuxVyravn.FillDate;
var
  EndOfPreviousMonth : TDate;
begin
  SettingsDate := TfmSettingsDate.Create(setT);
  setT.AddPlugin(SettingsDate);
  EndOfPreviousMonth:= EndOfTheMonth(IncMonth (Today,-1));
  SettingsDate.SetResultType(1);
  SettingsDate.SetKeyValue (TDateTime(EndOfPreviousMonth));
end;


procedure TfrmRepSkladBuxVyravn.cdsRepCalcFields(DataSet: TDataSet);
var
  dDiff : double;
begin
  if DataSet.State =dsInternalCalc then begin
    case FTipVyravn of
      0: begin
        DataSet.FieldByName('diff').asFloat :=
          RRoundTo(
            -(DataSet.FieldByName('kolotp_bux').asFloat-
            DataSet.FieldByName('kolotp_sklad').asFloat),
            -3);
      end;
      1: begin
        dDiff :=
          RRoundTo(-(DataSet.FieldByName('kolotp_bux').asFloat-
            DataSet.FieldByName('kolotp_sklad').asFloat-
            DataSet.FieldByName('kolotp_rest_sklads').asFloat),
          -3
          );
        if (dDiff >0) then begin
          dDiff :=0;
        end;
        if ((dDiff=0) and
          (DataSet.FieldByName('kolotp_bux').asFloat<0)) then begin
          dDiff := RRoundTo(-DataSet.FieldByName('kolotp_bux').asFloat,-3);
        end;
        DataSet.FieldByName('diff').asFloat := dDiff;
      end;
    end; //case
  end;//if DataSet.State =dsInternalCalc
end;

procedure TfrmRepSkladBuxVyravn.actPrixodCreateExecute(Sender: TObject);
var
  strUkk : string;
  dTo : Tdate;
  iNakl : integer;
  //frmNaklpBux: TfrmNaklpBux;
begin
  strUkk := setT.GetPluginResult('fmSettingsDate');
  dTo := strtodate(strUkk);
  sdsPrixodCreate.Params.ParamByName('dat').asDate :=  dTo;
  strUkk := setT.GetPluginResult('fmSettingsVlad');
  sdsPrixodCreate.Params.ParamByName('id_izg').asInteger :=  strtoint(strUkk);
  strUkk := setT.GetPluginResult('fmSettingsSklad');
  sdsPrixodCreate.Params.ParamByName('id_sklad').asInteger :=  strtoint(strUkk);
  sdsPrixodCreate.Open;
  iNakl:=sdsPrixodCreate.FieldByName('id_nakl').asInteger;
  sdsPrixodCreate.Close;
  cdsRep.First;
  while not cdsRep.Eof do begin
    if  cdsRep.FieldByName('diff').AsFloat>0 then begin
      sdsPrixodDetCreate.Params.ParamByName('id_nakl').asInteger := iNakl;
      sdsPrixodDetCreate.Params.ParamByName('id_tovar').asInteger :=
        cdsRep.FieldByName('id_tovar').AsInteger;
      sdsPrixodDetCreate.Params.ParamByName('cena').asFloat:=0;
      sdsPrixodDetCreate.Params.ParamByName('kolotp').asFloat:=
        cdsRep.FieldByName('diff').asFloat;
      dmdEx.ExecSQL(sdsPrixodDetCreate,true);
    end;//if kolotp>0
    cdsRep.Next;
  end; //while  not eof
  //show naklpbux
  OpenDocument(self, iNakl, 0, 0);
end;

procedure TfrmRepSkladBuxVyravn.actRasxodCreateExecute(Sender: TObject);
var
  strUkk : string;
  dTo : Tdate;
  iNakl : integer;
  iPos : integer;
begin
  strUkk := setT.GetPluginResult('fmSettingsDate');
  dTo := strtodate(strUkk);
  sdsRasxodCreate.Params.ParamByName('dat').asDate :=  dTo;
  strUkk := setT.GetPluginResult('fmSettingsVlad');
  sdsRasxodCreate.Params.ParamByName('id_izg').asInteger :=  strtoint(strUkk);
  strUkk := setT.GetPluginResult('fmSettingsSklad2');
  sdsRasxodCreate.Params.ParamByName('id_sklad').asInteger :=  strtoint(strUkk);
  sdsRasxodCreate.Open;
  iNakl:=sdsRasxodCreate.FieldByName('id_nakl').asInteger;
  sdsRasxodCreate.Close;
  cdsRep.First;
  iPos:=0;
  while not cdsRep.Eof do begin
    if  cdsRep.FieldByName('diff').AsFloat<0 then begin
      inc(iPos);
      sdsRasxodDetCreate.Params.ParamByName('id_nakl').asInteger := iNakl;
      sdsRasxodDetCreate.Params.ParamByName('id_pos').asInteger :=iPos;
      sdsRasxodDetCreate.Params.ParamByName('id_tovar').asInteger :=
        cdsRep.FieldByName('id_tovar').AsInteger;
      sdsRasxodDetCreate.Params.ParamByName('cena').asFloat:=0;
      sdsRasxodDetCreate.Params.ParamByName('kolotp').asFloat:=
        -cdsRep.FieldByName('diff').asFloat;
      dmdEx.ExecSQL(sdsRasxodDetCreate,true);
    end;//if kolotp>0
    cdsRep.Next;
  end; //while  not eof
  //show naklr
  OpenDocument(self,iNakl,0,0);
end;

end.
