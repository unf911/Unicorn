unit SpecOstAll;

interface

uses
  Windows, Messages, SysUtils,
  Variants, Classes,
  Graphics, Controls, Forms,
  Dialogs,
  FMTBcd, DBClient, Provider, SqlExpr, DBGridEh, PropFilerEh, Menus,
  PropStorageEh, UnfFilter, QueryExtender, DB,   
  ActnList, StdCtrls, Buttons, GridsEh, frxClass, frxDBSet, 
  DBTables, Grids,
  DBGrids,
  ComCtrls,
  untEx,   DateUtils,
  ATSAssert,
  untSkladRasxDetEx,
  DBCtrls,
  untSettings,
  SettingsPlugin, //TfmSettingsPlugin
  NaklpBux, //TfrmNaklpBux;
  Spec, //TfrmSpec;
  untRound
  ;

type
  TfrmSpecOstAll = class(TForm)
    dsNaklr: TDataSource;
    ActionList1: TActionList;
    actRefresh: TAction;
    actItogo: TAction;
    actPreview: TAction;
    actDetail: TAction;
    MainMenu1: TMainMenu;
    mnuActions: TMenuItem;
    N1: TMenuItem;
    N3: TMenuItem;
    dbgRep: TDBGridEh;
    sdsRasx: TSQLDataSet;
    dspRasx: TDataSetProvider;
    cdsRasx: TClientDataSet;
    qeRasx: TQueryExtender;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    N2: TMenuItem;
    UnfFilter1: TUnfFilter;
    actSettings: TAction;
    BitBtn4: TBitBtn;
    PropStorageEh1: TPropStorageEh;
    rpsSkladRasxDetEx: TRegPropStorageManEh;
    N4: TMenuItem;
    PopupMenu1: TPopupMenu;
    N5: TMenuItem;
    cdsRasxSUB5_NAME: TStringField;
    cdsRasxSUB4: TIntegerField;
    cdsRasxSUB5: TIntegerField;
    cdsRasxSUB6: TIntegerField;
    cdsRasxDEBET: TFloatField;
    cdsRasxKREDIT: TFloatField;
    cdsRasxDEBETAFTER: TFloatField;
    cdsRasxDEBET_KOLOTP: TFloatField;
    cdsRasxKREDIT_KOLOTP: TFloatField;
    cdsRasxDEBET_CENA: TFloatField;
    cdsRasxKREDIT_CENA: TFloatField;
    actClose: TAction;
    Label1: TLabel;
    cbxMode: TComboBox;
    cdsRasxDELTA_CENA: TFloatField;
    cdsRasxSUB7: TIntegerField;
    cdsRasxSUB1: TIntegerField;
    cdsRasxSUB2: TIntegerField;
    cdsRasxSUB3: TFMTBCDField;
    cdsRasxKOLOTP_AFTER: TFloatField;
    cdsRasxID: TStringField;
    cdsNakloIZG: TStringField;
    cdsNakloZAK: TStringField;
    cdsNakloMANAGER: TStringField;
    cdsRasxID_ANALOG: TIntegerField;
    cdsRasxANALOG: TStringField;
    cdsRasxDAT: TSQLTimeStampField;
    actManagerMode: TAction;
    actSelfTest: TAction;
    N6: TMenuItem;
    dspNaklpOst: TDataSetProvider;
    cdsNaklpOst: TClientDataSet;
    sdsNaklpOst: TSQLDataSet;
    cdsNaklpOstStringField: TStringField;
    cdsNaklpOstIntegerField2: TIntegerField;
    cdsNaklpOstFloatField2: TFloatField;
    cdsNaklpOstFloatField5: TFloatField;
    cdsNaklpOstFloatField7: TFloatField;
    cdsNaklpOstIntegerField5: TIntegerField;
    cdsNaklpOstIntegerField6: TIntegerField;
    cdsNaklpOstIntegerField7: TFMTBCDField;
    cdsNaklpOstSQLTimeStampField: TSQLTimeStampField;
    cdsNaklpOstStringField3: TStringField;
    cdsNaklpOstStringField4: TStringField;
    cdsNaklpOstStringField5: TStringField;
    cdsNaklpOstIntegerField8: TIntegerField;
    cdsNaklpOstStringField6: TStringField;
    cdsNaklpOstID_PRIX: TStringField;
    cdsNaklpOstDAT_PRIX: TSQLTimeStampField;
    cdsNaklpOstID: TStringField;
    cdsNaklpOstSUB4: TIntegerField;
    cdsNaklpOstID_NAKL: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure actDetailExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure frRasxGetValue(const ParName: String; var ParValue: Variant);
    procedure Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actSettingsExecute(Sender: TObject);
    procedure dbgRepDblClick(Sender: TObject);
    procedure dbgRepKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actCloseExecute(Sender: TObject);
    procedure cbxModeChange(Sender: TObject);
    procedure actManagerModeExecute(Sender: TObject);
    procedure actSelfTestExecute(Sender: TObject);
  private
    { Private declarations }
    sFilterOnlyPrixodPosition : string;
    SettingsPost : TfmSettingsPlugin;
    SettingsTipDetail : TfmSettingsPlugin;
    SettingsManager : TfmSettingsPlugin;
    SettingsTovar : TfmSettingsPlugin;
    FiSchetSpec : integer;
    //заполнение и выбор текущей даты - месяца
    procedure FillDate;
    procedure FillPost;
    procedure FillTipSpec;
    procedure FillSchet;
    procedure FillSettings;
    //ставим условия в зависимости от выбора даты
    procedure ProcessDate;
    procedure ProcessInitDataset;
    procedure ProcessTipSpec;
    procedure ProcessPost;
    procedure ProcessTovar;
    //ставим условия в зависимости от выбора менеджера
    procedure ProcessManager;
    //генерация заголовка формы
    procedure UpdateCaption;
    //Фильтрация по несовпадающим позициям
    procedure ProcessMode;
    procedure ProcessColumns(invisible: boolean);
    procedure FillManager;
    procedure FillTovar;
    procedure FillSelfTest;
    procedure TestSklost;
  public
    setT : TfrmSettings;
    procedure SetFilterOnlyPrixodPosition (sFilter: TStringList);
    function DefaultOpen: boolean;
    procedure DefaultStartup;      
    { Public declarations }
  end;

var
  frmSpecOstAll: TfrmSpecOstAll;

implementation

{$R *.dfm}

procedure TfrmSpecOstAll.FormCreate(Sender: TObject);
begin
	//dmdEx.startwaiting;
	cdsRasx.CommandText:=sdsRasx.CommandText;
	qeRasx.DefSql := sdsRasx.CommandText;
  setT := TfrmSettings.Create(self);
  FillSettings;
end;


//заполнение и выбор текущей даты - месяца
procedure TfrmSpecOstAll.FillDate;
begin
try
  SetT.SetPeriod(6);
except
  AssertInternal('0E0F8121-0CCC-4280-BF30-C4D62C05DA24');
end;
end;


procedure TfrmSpecOstAll.ProcessDate;
var
  dDate_from, dDate_To : TDate;
begin
try
  //запись дат для последующей детализации


  dDate_from :=  setT.DateFrom;
  dDate_to :=  setT.DateTo;
  TClientDataSet(qeRasx.Query).Params.ParamByName('dat_from').AsDate:=dDate_from;
  TClientDataSet(qeRasx.Query).Params.ParamByName('dat_to').AsDate:=dDate_to;
  TClientDataSet(qeRasx.Query).Params.ParamByName('id_schet_spec').asInteger:=FiSchetSpec;
except
  AssertInternal('220EA05F-690C-4703-845E-5B27991F6D03');
end;

end;


procedure TfrmSpecOstAll.ProcessManager;
begin
  dmdEx.SetIntegerParamValue(
    TClientDataSet(qeRasx.Query).Params.ParamByName('sub3_in'),
    setT.GetPluginResult('fmSettingsManager'));
end;


procedure TfrmSpecOstAll.UpdateCaption;
var
  sTemp : string;
begin
try
  sTemp := 'Отчёт по остаткам на спецификациях';
{  +
    ' c '+
    datetostr(sett.DateFrom)+' до ' +
    datetostr(setT.DateTo);  }
  if sett.GetPluginTextResult('fmSettingsTovar')<>'' then begin
    sTemp := sTemp
      + '. Товар: '+
      sett.GetPluginTextResult('fmSettingsTovar');
  end;
  if setT.GetPluginTextResult('fmSettingsPost')<>'' then begin
    sTemp := sTemp
      + '. Поставщик: '+
      sett.GetPluginTextResult('fmSettingsPost');
  end;
  if setT.GetPluginTextResult('fmSettingsManager')<>'' then begin
    sTemp := sTemp
      + '. Менеджер: '+
      sett.GetPluginTextResult('fmSettingsManager');
  end;
  self.Caption := sTemp;
except
  AssertInternal('8F0E4FA4-191E-45DF-A61D-E8D599FFE7A2');
end;
end;

procedure  TfrmSpecOstAll.ProcessInitDataset;
begin
  //в разрезе приходных
  if setT.GetPluginResult('fmSettingsTipDetail') = '3' then begin
    qeRasx.Query := cdsNaklpOst;
  end else begin
    qeRasx.Query := cdsRasx;
  end;
end;

procedure TfrmSpecOstAll.actRefreshExecute(Sender: TObject);
begin
try
	dmdEx.StartWaiting;
  qeRasx.Query.Close;
	UpdateCaption;
  ProcessInitDataset;
	ProcessDate;
  ProcessManager;
  ProcessPost;
  ProcessTipSpec;
  ProcessTovar;
  ProcessColumns(actManagerMode.Checked);

	qeRasx.Refresh;
	dmdEx.StopWaiting;
except
  AssertInternal('190E2CAE-AFB1-4091-A61E-B015FACD8D43');
end;
end;

procedure TfrmSpecOstAll.actDetailExecute(Sender: TObject);
var
  frmNaklpBux: TfrmNaklpBux;
  frmSpec : TfrmSpec;
begin
try
  if dsNaklr.DataSet.Eof and dsNaklr.DataSet.Bof then begin
     exit;
  end;
  if dsNaklr.DataSet.FieldByName('sub4').IsNull then begin
    MessageDlg('Неизвестен номер спецификации',mtWarning,[mbOk],0);
    exit;
  end;
  if ((dbgRep.SelectedField.FieldName='DEBET_KOLOTP')
   or (dbgRep.SelectedField.FieldName='DEBET_CENA')
   or (dbgRep.SelectedField.FieldName='DEBET')
   or (dbgRep.SelectedField.FieldName='ID')
   or (dbgRep.SelectedField.FieldName='IZG')
   or (dbgRep.SelectedField.FieldName='ZAK')
   or (dbgRep.SelectedField.FieldName='SUB5_NAME')
   or (dbgRep.SelectedField.FieldName='MANAGER'))  then begin
    frmSpec := TfrmSpec.Create(application);
    frmSpec.qeNaklo.SetSQL('where','id_nakl ='+
      dsNaklr.DataSet.FieldByName('sub4').asString,0);
    frmSpec.DefaultOpen;
    frmSpec.dsNaklot.dataset.Locate('id_tovar',dsNaklr.DataSet.FieldByName('sub5').asString,[]);
  end;
  if ((dbgRep.SelectedField.FieldName='KREDIT_KOLOTP')
    or (dbgRep.SelectedField.FieldName='KREDIT_CENA')
    or (dbgRep.SelectedField.FieldName='KREDIT')) then begin
    //в разрезе приходных
    if setT.GetPluginResult('fmSettingsTipDetail') = '3' then begin
      frmNaklpBux := TfrmNaklpBux.Create(Application);
      frmNaklpBux.qeNaklo.SetSQL(
        'where',
        'id_nakl ='+ dsNaklr.DataSet.FieldByName('id_nakl').asString,
        0);
      frmNaklpBux.actRefresh.Execute;
      frmNaklpBux.dsNaklot.dataset.Locate('id_tovar',dsNaklr.DataSet.FieldByName('sub5').asString,[]);
    end else begin
      frmNaklpBux := TfrmNaklpBux.Create(Application);
      frmNaklpBux.qeNaklo.SetSQL('where','id_nakl in (select ot.id_nakl from NAKLP_DET_VW ot where ot.id_sebest='+
        dsNaklr.DataSet.FieldByName('sub4').asString+' and ot.id_tovar='+
        dsNaklr.DataSet.FieldByName('sub5').asString+')',0);
      frmNaklpBux.actRefresh.Execute;
      frmNaklpBux.dsNaklot.dataset.Locate('id_tovar',dsNaklr.DataSet.FieldByName('sub5').asString,[]);
    end;
  end;
except
  AssertInternal('CC4606EB-B950-4D7F-B6CD-30B80EA17132');
end;
end;

procedure TfrmSpecOstAll.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmSpecOstAll.frRasxGetValue(const ParName: String;
  var ParValue: Variant);
var
  strTemp : string;
begin
try
	if AnsiUpperCase(ParName) = 'TITLE' then begin
    //генерация заголовка
    strTemp :=self.Caption;
    if (cdsRasx.Filtered = true) then begin
      //если отчёт отфильтрован
      strTemp := strTemp+ ' [Фильтр]';
    end;
    ParValue := strTemp;
  end;
	{
	if AnsiUpperCase(ParName)='TOTALSUM' then begin
		ParValue :=  curSum;
	end;
	}
except
	AssertInternal('A309C04A-3394-44C3-87C7-3B795D6A250F');
end;
end;

procedure TfrmSpecOstAll.Button1Click(Sender: TObject);
begin
  if setT.ChangeSettings=mrOk then begin
    showmessage(setT.GetPluginResult('fmSettingsSklad'));
  end;
end;

procedure TfrmSpecOstAll.FormDestroy(Sender: TObject);
begin
  setT.Free;
end;

procedure TfrmSpecOstAll.actSettingsExecute(Sender: TObject);
begin
  actSettings.checked := setT.ProcessSettingsChange(actRefresh);
end;

procedure TfrmSpecOstAll.dbgRepDblClick(Sender: TObject);
begin
  actDetail.Execute;
end;

procedure TfrmSpecOstAll.dbgRepKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return : begin
      actDetail.Execute;
    end;
  end;//case
end;

procedure TfrmSpecOstAll.actCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmSpecOstAll.cbxModeChange(Sender: TObject);
begin
  ProcessMode;
end;

procedure TfrmSpecOstAll.ProcessMode;
begin
  with cdsRasx do begin
    case cbxMode.ItemIndex of
      0: begin
        Filtered := false;
      end;
      1: begin
        Filter := '([KOLOTP_AFTER]<>0 or [DELTA_CENA]<>0)';
        Filtered := true;
      end;
      2: begin
        Filter := '[DELTA_CENA]<>0 and [DEBET_KOLOTP]>0 and [KREDIT_KOLOTP]>0';
        Filtered := true;
      end;
      3: begin
        Filter := '[KOLOTP_AFTER]<>0';
        Filtered := true;
      end;
      4 : begin
        Filter := '[SUB5] in ('+sFilterOnlyPrixodPosition+')';
        Filtered := true;
      end;
    end;//case ItemIndex
  end;//with
end;

procedure TfrmSpecOstAll.SetFilterOnlyPrixodPosition(sFilter : TStringList);
var
  sTemp : string;
  i: integer;
begin
  //add list item for user selection
  for i:= 0 to sFilter.Count - 1 do begin
    sTemp := sTemp + sFilter.Strings[i]+', ';
  end;
  sTemp :=copy(sTemp,0,Length(sTemp)-2);
  sFilterOnlyPrixodPosition := sTemp;
  cbxMode.Items.Add('Только позиции из приходной накладной');
  //переключаем режим отчёта
  cbxMode.ItemIndex := 4;
  ProcessMode;
end;


procedure TfrmSpecOstAll.FillPost;
begin
  SettingsPost := setT.CreatePlugin('TfmSettingsPost');
  setT.AddPlugin(SettingsPost);
end;

procedure TfrmSpecOstAll.FillTipSpec;
begin
  SettingsTipDetail := setT.CreatePlugin('TfmSettingsTipDetail');
  SettingsTipDetail.SetLabelValue('Спецификации');
  setT.addplugin(SettingsTipDetail);
  SettingsTipDetail.AddDetailTip('По всем спецификациям');
  SettingsTipDetail.AddDetailTip('По незакрытым спецификациям');
  SettingsTipDetail.AddDetailTip('По закрытым спецификациям');
  SettingsTipDetail.AddDetailTip('В разрезе приходных');
  SettingsTipDetail.SetKeyValue(1);
end;

procedure TfrmSpecOstAll.ProcessPost;
begin
  dmdEx.SetIntegerParamValue(
    TClientDataSet(qeRasx.Query).Params.ParamByName('sub1_in'),
    setT.GetPluginResult('fmSettingsPost'));
end;

procedure TfrmSpecOstAll.ProcessTipSpec;
var
  sTemp : string;
begin
  sTemp := setT.GetPluginResult('fmSettingsTipDetail');
  //в разрезе приходных
  if sTemp = '3' then begin
    dsNaklr.DataSet := cdsNaklpOst;
    exit;
  end else begin
    dsNaklr.DataSet := cdsRasx;
    if sTemp ='0' then begin
      sTemp :='';
    end;
    if sTemp ='1' then begin
      sTemp :='0';
    end;
    if sTemp ='2' then begin
      sTemp :='1';
    end;

    dmdEx.SetIntegerParamValue(
      cdsRasx.Params.ParamByName('sub7_in'),
      sTemp);
  end;
end;

procedure TfrmSpecOstAll.FillManager;
begin
  setT.actManagerOff.Execute;
  SettingsManager := setT.CreatePlugin('TfmSettingsManager');
  setT.AddPlugin(SettingsManager);
end;


function TfrmSpecOstAll.DefaultOpen: boolean;
begin
	actRefresh.Execute;
  Result :=true;
  if not cdsRasx.Active then begin
    Result :=false;
  end;
end;

procedure TfrmSpecOstAll.DefaultStartup;
begin
  SettingsManager.SetKeyValue(dmdEx.GetIdManager);
end;

procedure TfrmSpecOstAll.ProcessTovar;
begin
  dmdEx.SetIntegerParamValue(
    cdsRasx.Params.ParamByName('sub8_in'),
    setT.GetPluginResult('fmSettingsTovar'));
end;

procedure TfrmSpecOstAll.actManagerModeExecute(Sender: TObject);
begin
  actManagerMode.Checked := not  actManagerMode.Checked ;
  ProcessColumns(actManagerMode.Checked);
  actSettings.Enabled := false;
  actDetail.Enabled :=false;
end;

procedure TfrmSpecOstAll.FillTovar;
begin
  SettingsTovar := setT.CreatePlugin('TfmSettingsTovar');
  setT.AddPlugin(SettingsTovar);
  SettingsTovar.setLabelValue('Осн. аналог');
end;

procedure TfrmSpecOstAll.ProcessColumns(invisible: boolean);
begin

  //вне зависимости от менеджерского режима скрывать ненужное в разрезе приходных
  if setT.GetPluginResult('fmSettingsTipDetail') = '3' then begin
    ColumnByName(dbgRep.Columns,'DEBET_KOLOTP').Footer.ValueType := fvtNon;
    ColumnByName(dbgRep.Columns,'DEBET_KOLOTP').Visible := false;

    ColumnByName(dbgRep.Columns,'DEBET').Footer.ValueType := fvtNon;
    ColumnByName(dbgRep.Columns,'DEBET').Visible := false;

    ColumnByName(dbgRep.Columns,'DEBET_CENA').Visible := false;

    ColumnByName(dbgRep.Columns,'KOLOTP_AFTER').Footer.ValueType := fvtNon;
    ColumnByName(dbgRep.Columns,'KOLOTP_AFTER').Visible := false;

    ColumnByName(dbgRep.Columns,'DEBETAFTER').Footer.ValueType := fvtNon;
    ColumnByName(dbgRep.Columns,'DEBETAFTER').Visible := false;

    ColumnByName(dbgRep.Columns,'DELTA_CENA').Visible := false;
    ColumnByName(dbgRep.Columns,'ID_PRIX').Visible := true;
    ColumnByName(dbgRep.Columns,'DAT_PRIX').Visible := true;
  end else begin
    ColumnByName(dbgRep.Columns,'DEBET_KOLOTP').Visible := true;
    ColumnByName(dbgRep.Columns,'DEBET_KOLOTP').Footer.ValueType := fvtSum;    

    ColumnByName(dbgRep.Columns,'DEBET').Visible := not invisible;
    ColumnByName(dbgRep.Columns,'DEBET').Footer.ValueType := fvtSum;

    ColumnByName(dbgRep.Columns,'DEBET_CENA').Visible :=not invisible;

    ColumnByName(dbgRep.Columns,'KOLOTP_AFTER').Visible := true;
    ColumnByName(dbgRep.Columns,'KOLOTP_AFTER').Footer.ValueType := fvtSum;

    ColumnByName(dbgRep.Columns,'DEBETAFTER').Visible := not invisible;
    ColumnByName(dbgRep.Columns,'DEBETAFTER').Footer.ValueType := fvtSum;

    ColumnByName(dbgRep.Columns,'DELTA_CENA').Visible := not invisible;
    ColumnByName(dbgRep.Columns,'ID_PRIX').Visible := false;
    ColumnByName(dbgRep.Columns,'DAT_PRIX').Visible := false;
    
    ColumnByName(dbgRep.Columns,'KREDIT_CENA').Visible := not invisible;




  ColumnByName(dbgRep.Columns,'KREDIT').Visible := not invisible;

  end;

end;

procedure TfrmSpecOstAll.FillSchet;
begin
	//заполняем
  FiSchetSpec:=dmdex.GetOidObjects('ТИП СЧЕТА',-100);
  FiSchetSpec:=dmdex.GetOidObjects('НЕСОБЛЮДЕНИЕ СПЕЦИФИКАЦИЙ',FiSchetSpec);
end;

procedure TfrmSpecOstAll.FillSettings;
begin
  FillSchet;
	FillDate;
  FillPost;
  FillManager;
  FillTipSpec;
  FillTovar;
  FillSelfTest;
end;

procedure TfrmSpecOstAll.actSelfTestExecute(Sender: TObject);
begin
  TestSklost;
end;

procedure TfrmSpecOstAll.TestSklost;
var
  iTovar : integer;
begin
  actManagerMode.Execute;
  dmdEx.OpenQuery(dmdEx.cdsTovar);
  iTovar := dmdEx.cdsTovar.Lookup('name','АВВГ-3*185+1*95','id');
  dmdEx.CloseQuery(dmdEx.cdsTovar,false);
  if iTovar=0 then begin
    AssertInternal('TfrmSpecOstAll.TestSklost. #1');
  end;
  sett.GetPlugin('fmSettingsTovar').SetKeyValue(
    iTovar
  );
  DefaultOpen;
  if dsNaklr.DataSet.Recordcount<=0 then begin
    AssertInternal('TfrmSpecOstAll.TestSklost. #2');
  end;
  if dsNaklr.DataSet.FieldByName('sub5').AsInteger <>iTovar then begin
    AssertInternal('TfrmSpecOstAll.TestSklost. #3');
  end;
end;

procedure TfrmSpecOstAll.FillSelfTest;
begin
  if inIde then begin
    actSelfTest.Visible :=true;
  end
end;

end.

