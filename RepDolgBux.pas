unit RepDolgBux;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  QueryExtender, DB, DBTables, FMTBcd, PropFilerEh,
  PropStorageEh, UnfFilter, Menus, DBClient, Provider, SqlExpr, ActnList,
  GridsEh, DBGridEh, StdCtrls, Buttons,
  frxClass,
  Grids, DBGrids,
  untSettings,
  DolgBuxDet,
  RepDolgBuxPostDet, //TfrmRepDolgBuxPostDet
  frxDBSet,
  untEx,
  untRound, //columnbyname
  SettingsPlugin

  ;

type
  TfrmRepDolgBux = class(TForm)
    dsDolgBux: TDataSource;
    qeDolgBux: TQueryExtender;
    GroupBox1: TGroupBox;
    ActionList1: TActionList;
    actCall: TAction;
    actSettings: TAction;
    actDetail: TAction;
    actRefresh: TAction;
    actNotNull: TAction;
    actRecalc: TAction;
    DBGridEh1: TDBGridEh;
    sdsDolgBux: TSQLDataSet;
    dspDolgBux: TDataSetProvider;
    cdsDolgBux: TClientDataSet;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    mnuRefresh: TMenuItem;
    N2: TMenuItem;
    N6: TMenuItem;
    UnfFilter1: TUnfFilter;
    actDebug: TAction;
    N4: TMenuItem;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    frReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn6: TBitBtn;
    actShowNO: TAction;
    procedure actSettingsExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actDetailExecute(Sender: TObject);
    procedure actDebugExecute(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure actShowNOExecute(Sender: TObject);
  private
    procedure ShowRepDolgBuxDetail;
    procedure ShowNaklrasDetail;
  protected
    { Private declarations }
    procedure UpdateCaption;
    procedure ProcessGroup;
    procedure ProcessTipDetail;
    procedure ProcessTipDetail2;
    procedure ProcessColumns(DataSet:TDataSet);
    procedure FillSettings;
    procedure FillTipDetail;
    procedure FillTipDetail2;
    procedure ProcessSettings;
    procedure Refresh;
  public
    { Public declarations }
    setT : TfrmSettings;
    procedure DefaultStartup;
    function Defaultopen: boolean;
  end;

var
  frmRepDolgBux: TfrmRepDolgBux;

implementation

uses NNakl, //TfrmNNakl
  Atsassert
;

{$R *.dfm}


procedure TfrmRepDolgBux.actSettingsExecute(Sender: TObject);
begin
  actSettings.checked := setT.ProcessSettingsChange2(DefaultOpen);
end;

procedure TfrmRepDolgBux.DefaultStartup;
begin
  //пред месяц
  setT.SetPeriod(7);
  setT.GetPlugin('fmSettingsTipGroup').SetKeyValue(0);
end;

function TfrmRepDolgBux.Defaultopen: boolean;
begin
  cdsDolgBux.Close;
  ProcessSettings;
  Refresh;
  Result :=true;
end;

procedure TfrmRepDolgBux.FormCreate(Sender: TObject);
begin
  qeDolgBux.DefSql := sdsDolgBux.CommandText;
  FillSettings;
  ShowCopyForRoleOrUser(DBGridEh1,'POWER_USER;BUXG','SYSDBA');
end;

procedure TfrmRepDolgBux.actRefreshExecute(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmRepDolgBux.Refresh;
begin
	dmdEx.StartWaiting;
  if cdsDolgBux.active then begin
    if not actDebug.Checked then begin
      PropStorageEh1.SaveProperties;
    end;
  end;
  qeDolgBux.Refresh;
  ProcessColumns(cdsDolgBux);
  PropStorageEh1.LoadProperties;
	dmdEx.StopWaiting;
end;

procedure TfrmRepDolgBux.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DBGridEh1.DataSource.DataSet.Active then begin
    if not actDebug.Checked then begin
      PropStorageEh1.SaveProperties;
    end;
  end;
  Action := caFree;
end;

procedure TfrmRepDolgBux.ShowNaklrasDetail;
var
  NNakl: TfrmNNakl;
  bQueryOpened: boolean;
begin
  NNakl := TfrmNNakl.Create (Application);
  NNakl.setT.DateFrom := setT.DateFrom;
  NNakl.setT.DateTo := setT.DateTo;
  NNakl.setT.GetPlugin('fmSettingsVlad').SetKeyValue(cdsDolgBux.fieldbyname('sub1').AsInteger);
  NNakl.setT.GetPlugin('fmSettingsClient').SetKeyValue(cdsDolgBux.fieldbyname('sub2').AsInteger);
  //группировка по поставщику, покупателю, менеджеру
  if setT.GetPluginResult('fmSettingsTipGroup')='1' then begin
    NNakl.setT.GetPlugin('fmSettingsManager').SetKeyValue(cdsDolgBux.fieldbyname('sub3').AsInteger);
  end;
  bQueryOpened :=NNakl.DefaultOpen;
  if not bQueryOpened then begin
    AssertInternal('E5E472C6-E74A-415C-8CF5-4B89FFA52104');
  end;
end;

procedure TfrmRepDolgBux.ShowRepDolgBuxDetail;
var
  frmDolgBuxDet : TfrmRepDolgBuxPostDet;
begin
    dmdex.StartWaiting;
    frmDolgBuxDet :=TfrmRepDolgBuxPostDet.Create (self);
    with frmDolgBuxDet do begin
      SetSchetDates(
        cdsDolgBux.Params.ParamByName('id_schet').asInteger,
        cdsDolgBux.Params.parambyName('dat_from').asDate,
        cdsDolgBux.Params.ParamByName('dat_to').asDate);
      SetParamForDetail(
        'sub1_in',
        cdsDolgBux.FieldByName('sub1').asInteger,
        'Поставщик',
        cdsDolgBux.FieldByName('izg').AsString);
      SetParamForDetail(
        'sub2_in',
        cdsDolgBux.FieldByName('sub2').asInteger,
        'Покупатель',
        cdsDolgBux.FieldByName('zak').AsString);
      if setT.getPluginResult('fmSettingsTipGroup')='1' then begin
        SetParamForDetail(
          'sub3_in',
          cdsDolgBux.FieldByName('sub3').asInteger,
          'Менеджер',
          cdsDolgBux.FieldByName('sub3_name').AsString);
        SetGroupForDetail ('sub1,sub2,sub3');
      end;

      actRefresh.Execute;
    end;
    dmdex.StopWaiting;
    frmDolgBuxDet.Show;
end;

procedure TfrmRepDolgBux.actDetailExecute(Sender: TObject);

  //Params : TParams;
begin
  if ((DBGridEh1.SelectedField.FieldName='N0')
   or (DBGridEh1.SelectedField.FieldName='N0_DELTA')
   or (DBGridEh1.SelectedField.FieldName='NAKLRAS_SUM'))
  then begin
    ShowNaklrasDetail;
  end else begin
    ShowRepDolgBuxDetail;
  end;
end;


procedure TfrmRepDolgBux.actDebugExecute(Sender: TObject);
begin
  actDebug.Checked := not actDebug.Checked;
  if actDebug.Checked then begin
    //последние две колонки содержат номера фирм и клиентов
    //информация для отладки
    cdsDolgBux.FieldByName('sub1').Visible := true;
    cdsDolgBux.FieldByName('sub2').Visible := true;
    cdsDolgBux.FieldByName('ipn').Visible := true;
    cdsDolgBux.FieldByName('okpo').Visible := true;
    cdsDolgBux.FieldByName('svreg').Visible := true;
    cdsDolgBux.FieldByName('adres').Visible := true;
  end else begin //if actDebug.Checked
    cdsDolgBux.FieldByName('sub1').Visible := false;
    cdsDolgBux.FieldByName('sub2').Visible := false;
    cdsDolgBux.FieldByName('ipn').Visible := false;
    cdsDolgBux.FieldByName('okpo').Visible := false;
    cdsDolgBux.FieldByName('svreg').Visible := false;
    cdsDolgBux.FieldByName('adres').Visible := false;

  end; //if actDebug.Checked
end;

procedure TfrmRepDolgBux.DBGridEh1DblClick(Sender: TObject);
begin
  actDetail.Execute;
end;

procedure TfrmRepDolgBux.UpdateCaption;
var
  sCaption : string;
begin
  sCaption:=
    //'Долги (бухгалтерия): с ' +
    setT.GetPluginTextResult('fmSettingsTipDetailSchet') + ': c ' +
    datetostr (setT.DateFrom) +
    ' до ' + datetostr(setT.dateTo);
  if setT.GetPluginResult('fmSettingsVlad')<>'' then begin
    sCaption := sCaption + '. Фирма: '+
      sett.GetPluginTextResult('fmSettingsVlad');
  end;
  if setT.GetPluginResult('fmSettingsClient')<>'' then begin
    sCaption := sCaption + '. Клиент: '+
      sett.GetPluginTextResult('fmSettingsClient');
  end;
  self.Caption := sCaption;
end;

procedure TfrmRepDolgBux.FillSettings;
var
  SettingsVlad : TfmSettingsPlugin;
  SettingsClient : TfmSettingsPlugin;
  SettingsManager : TfmSettingsPlugin;
  SettingsTipGroup : TfmSettingsPlugin;
begin
  setT := TfrmSettings.Create(self);
  setT.actDataOnly.Execute;
  //пред месяц
  setT.SetPeriod(7);
  FillTipDetail;
  //поставщик - можно всех
  SettingsVlad := setT.CreatePlugin('TfmSettingsVlad');
  SettingsVlad.SetResultType(2);
  setT.AddPlugin(SettingsVlad);
  //получатель
  SettingsClient := setT.CreatePlugin('TfmSettingsClient');
  setT.AddPlugin(SettingsClient);

  SettingsManager := setT.createplugin('TfmSettingsManager');
  SettingsManager.setResultType(3);
  setT.addPlugin(SettingsManager);

  //cbxNotNull.Checked := true;
  //actNotNull.Execute;

  SettingsTipGroup := setT.CreatePlugin('TfmSettingsTipGroup');
  SettingsTipGroup.AddDetailTip('По поставщику, покупателю');
  SettingsTipGroup.AddDetailTip('По менеджеру');
  //SettingsTipGroup.AddDetailTip('По сделке');
  setT.addPlugin(SettingsTipGroup);
  SettingsTipGroup.SetKeyValue(0);

  FillTipDetail2;  
end;

procedure TfrmRepDolgBux.FillTipDetail;
var
  SettingsTipDetailSchet : TfmSettingsPlugin;
begin
  SettingsTipDetailSchet := setT.CreatePlugin('TfmSettingsTipDetail');
  SettingsTipDetailSchet.Name := 'fmSettingsTipDetailSchet';
  SettingsTipDetailSchet.SetLabelValue('Счёт');
  setT.addplugin(SettingsTipDetailSchet);
  SettingsTipDetailSchet.AddDetailTip('Долги за кабель');
  SettingsTipDetailSchet.AddDetailTip('Долги за аренду');
  SettingsTipDetailSchet.AddDetailTip('Долги за услуги');
  SettingsTipDetailSchet.SetKeyValue(0);
end;

procedure TfrmRepDolgBux.FillTipDetail2;
var
  SettingsTipDetailTemp : TfmSettingsPlugin;
begin
  SettingsTipDetailTemp := setT.CreatePlugin('TfmSettingsTipDetail');
  SettingsTipDetailTemp.name := 'fmSettingsTipDetail2';
  SettingsTipDetailTemp.SetLabelValue('Показывать НО');
  setT.addplugin(SettingsTipDetailTemp);
  SettingsTipDetailTemp.AddDetailTip('Не показывать');
  SettingsTipDetailTemp.AddDetailTip('Показать');
  SettingsTipDetailTemp.SetKeyValue(0);
end;

procedure TfrmRepDolgBux.ProcessTipDetail;
var
  iSchetTip,iSchet: integer;
  sPluginResultValue: string;
begin
  iSchetTip := dmdEx.GetOidObjects('ТИП СЧЕТА',-100);
  iSchet := 0;
  sPluginResultValue := setT.GetPluginResult('fmSettingsTipDetailSchet');
  if sPluginResultValue ='0' then begin
    iSchet := dmdEx.GetOidObjects('ДОЛГИ ЗА КАБЕЛЬ',iSchetTip);
  end;
  if sPluginResultValue ='1' then begin
    iSchet := dmdEx.GetOidObjects('ДОЛГИ ЗА АРЕНДУ',iSchetTip);
  end;
  if sPluginResultValue ='2' then begin
    iSchet := dmdEx.GetOidObjects('ДОЛГИ ЗА ФИНУСЛУГИ',iSchetTip);
  end;
  dmdEx.SetIntegerParamValue(
    cdsDolgBux.Params.ParamByName('id_schet'),
    inttostr(iSchet));
end;

procedure TfrmRepDolgBux.ProcessTipDetail2;
begin
  if setT.GetPluginResult('fmSettingsTipDetail2') ='0' then begin
    qeDolgBux.SetSQL('select', '', 1);
    qeDolgBux.SetSQL('select', '', 2);
    qeDolgBux.SetSQL('select', '', 3);
    actShowNO.Checked := false;
  end;
  if setT.GetPluginResult('fmSettingsTipDetail2') ='1' then begin
    //группировка по поставщику, покупателю
    if setT.GetPluginResult('fmSettingsTipGroup')='0' then begin
      qeDolgBux.SetSQL(
        'select',
        ' (select sum(nds)/6 from naklras n where n.dat between :dat_from and '+
          ':dat_to and n.id_izg=r.sub1 and n.id_zak=r.sub2) as naklras_sum',
        1);
      qeDolgBux.SetSQL(
        'select',
        ' ((select sum(nds)/6 from naklras n where n.dat between :dat_from and '+
          ':dat_to and n.id_izg=r.sub1 and n.id_zak=r.sub2) - '+
          '(sum(r.debet)+sum(r.kreditafter)-sum(r.kreditbefore))/6 ) as N0_DELTA',
        3);

    end; //if группировка по поставщику, покупателю
    //группировка по поставщику, покупателю, менеджеру
    if setT.GetPluginResult('fmSettingsTipGroup')='1' then begin
      qeDolgBux.SetSQL(
        'select',
        ' (select sum(nds)/6 from naklras n where n.dat between :dat_from and '+
          ':dat_to and n.id_izg=r.sub1 and n.id_zak=r.sub2 and n.id_manager=r.sub3) as naklras_sum',
        1);
      qeDolgBux.SetSQL(
        'select',
        ' ((select sum(nds)/6 from naklras n where n.dat between :dat_from and '+
          ':dat_to and n.id_izg=r.sub1 and n.id_zak=r.sub2 and n.id_manager=r.sub3) - '+
          '(sum(r.debet)+sum(r.kreditafter)-sum(r.kreditbefore))/6 ) as N0_DELTA',
        3);
    end; //if  группировка по поставщику, покупателю, менеджеру
    qeDolgBux.SetSQL('select', ' (sum(r.debet)+sum(r.kreditafter)-sum(r.kreditbefore))/6 as N0', 2);
    actShowNO.Checked := true;
  end; //if setT.GetPluginResult('fmSettingsTipDetail2') ='1'
end;

procedure TfrmRepDolgBux.ProcessGroup;
begin
  if setT.GetPluginResult('fmSettingsTipGroup')='0' then begin
    //'По поставщику, покупателю'
    qeDolgBux.setsql(
      'select','',
      0);
    qeDolgBux.setsql(
      'group by','',
      0);
    //чтобы украинские фирмы не попадали в конец по collate pxw_cyrl взяли другой collate win1251
    //а чтобы большие буквы не шли раньше маленьких (МАРИОН, мавекс) добавил upper
    qeDolgBux.setsql(
      'order by','(select name from objects o where o.oid=r.sub1),' +
        'upper((select name from objects o where o.oid=r.sub2)) collate win1251_ua', //sub1_name,sub2_name,
      0);
    PropStorageEh1.section := 'TfrmRepDolgBux_group0';
  end;
  if setT.GetPluginResult('fmSettingsTipGroup')='1' then begin
    //'По менеджеру'
    qeDolgBux.setsql(
      'select',
      '(select name from objects o where o.oid=r.sub3) as sub3_name, r.sub3',
      0);
    qeDolgBux.setsql(
      'group by','r.sub3',
      0);
    qeDolgBux.setsql(
      'order by','(select name from objects o where o.oid=r.sub1), ' +
        'upper((select name from objects o where o.oid=r.sub2)) collate win1251_ua, ' +
        '(select name from objects o where o.oid=r.sub3)', //sub1_name,sub2_name,sub3_name,
      0);
    PropStorageEh1.section := 'TfrmRepDolgBux_group1';
  end;
end;

procedure TfrmRepDolgBux.ProcessColumns(DataSet:TDataSet);
begin
  with DataSet {cdsDolgBux} do begin
    if FindField('izg')<>nil then begin
      FieldByName('izg').DisplayLabel:='Поставщик';
    end;
    if FindField('zak')<>nil then begin
      FieldByName('zak').DisplayLabel:='Покупатель';
    end;
    if FindField('sub1')<>nil then begin
      FieldByName('sub1').Visible:=false;
    end;
    if FindField('sub2')<>nil then begin
      FieldByName('sub2').Visible:=false;
    end;
    if FindField('sub3')<>nil then begin
      FieldByName('sub3').Visible := false;
    end;
    if FindField('ipn')<>nil then begin
      FieldByName('ipn').Visible := false;
    end;
    if FindField('okpo')<>nil then begin
      FieldByName('okpo').Visible := false;
    end;
    if FindField('svreg')<>nil then begin
      FieldByName('svreg').Visible := false;
    end;
    if FindField('adres')<>nil then begin
      FieldByName('adres').Visible := false;
    end;
    if FindField('n0')<>nil then begin
      FieldByName('n0').Visible := false;
    end;

    FieldByName('sub5_name').Visible := false;
    FieldByName('sub5').Visible := false;

    if FindField('izgfullname')<>nil then begin
      FieldByName('izgfullname').Visible:=false;
    end;
    if FindField('zakfullname')<>nil then begin
      FieldByName('zakfullname').Visible:=false;
    end;
    if FindField('debet')<>nil then begin
      FieldByName('debet').DisplayLabel:='Дебет';
      TNumericField(FieldByName('debet')).DisplayFormat:=',0.00';
    end;
    if FindField('kredit')<>nil then begin
      FieldByName('kredit').DisplayLabel:='Кредит';
      TNumericField(FieldByName('kredit')).DisplayFormat:=',0.00';
    end;
    if FindField('debetbefore')<>nil then begin
      FieldByName('debetbefore').DisplayLabel:='Дебет на начало';
      TNumericField(FieldByName('debetbefore')).DisplayFormat:=',0.00';
    end;
    if FindField('kreditbefore')<>nil then begin
      FieldByName('kreditbefore').DisplayLabel:='Кредит на начало';
      TNumericField(FieldByName('kreditbefore')).DisplayFormat:=',0.00';
    end;
    FieldByName('debetafter').DisplayLabel:='Дебет на конец';
    TNumericField(FieldByName('debetafter')).DisplayFormat:=',0.00';
    FieldByName('kreditafter').DisplayLabel:='Кредит на конец';
    TNumericField(FieldByName('kreditafter')).DisplayFormat:=',0.00';


  end;

  ColumnByName(DBGridEh1.Columns,'IZG').Footer.ValueType:=fvtStaticText;
  ColumnByName(DBGridEh1.Columns,'IZG').Footer.value:='Записей всего:';
  ColumnByName(DBGridEh1.Columns,'ZAK').Footer.ValueType:=fvtCount;
  ColumnByName(DBGridEh1.Columns,'DEBETBEFORE').Footer.ValueType:=fvtSum;
  ColumnByName(DBGridEh1.Columns,'KREDITBEFORE').Footer.ValueType:=fvtSum;
  ColumnByName(DBGridEh1.Columns,'DEBET').Footer.ValueType:=fvtSum;
  ColumnByName(DBGridEh1.Columns,'KREDIT').Footer.ValueType:=fvtSum;
  ColumnByName(DBGridEh1.Columns,'DEBETAFTER').Footer.ValueType:=fvtSum;
  ColumnByName(DBGridEh1.Columns,'KREDITAFTER').Footer.ValueType:=fvtSum;
  ColumnByName(DBGridEh1.Columns,'DEBETBEFORE').Footer.ValueType:=fvtSum;

  actShowNO.Execute;
end;

procedure TfrmRepDolgBux.ProcessSettings;
begin
  TClientDataSet(qeDolgBux.Query).Params.ParamByName('dat_to').AsDate := setT.DateTo;
  TClientDataSet(qeDolgBux.Query).params.ParamByName('dat_from').AsDate := setT.DateFrom;
  dmdEx.SetIntegerParamValue(
    cdsDolgBux.Params.ParamByName('sub3_in'),
    setT.GetPluginResult('fmSettingsManager'));
  dmdEx.SetIntegerParamValue(
    cdsDolgBux.Params.ParamByName('sub1_in'),
    setT.GetPluginResult('fmSettingsVlad'));
  dmdEx.SetIntegerParamValue(
    cdsDolgBux.Params.ParamByName('sub2_in'),
    setT.GetPluginResult('fmSettingsClient')
  );
  ProcessTipDetail2;
  ProcessTipDetail;
  ProcessGroup;
	UpdateCaption;
end;

procedure TfrmRepDolgBux.actShowNOExecute(Sender: TObject);
begin
  if actShowNO.Checked then begin
    //последние две колонки содержат номера фирм и клиентов
    //информация для отладки
    with cdsDolgBux {cdsDolgBux} do begin
      FieldByName('NAKLRAS_SUM').DisplayLabel:='Налоговые';
      TNumericField(FieldByName('NAKLRAS_SUM')).DisplayFormat:=',0.00';
      FieldByName('NAKLRAS_SUM').Visible := true;
      FieldByName('n0').DisplayLabel:='НО';
      TNumericField(FieldByName('n0')).DisplayFormat:=',0.00';
      FieldByName('N0').Visible := true;
      FieldByName('N0_DELTA').DisplayLabel := 'НО Разница';
      TNumericField(FieldByName('N0_DELTA')).DisplayFormat:=',0.00';
      FieldByName('N0_DELTA').Visible := true;


      //группировка по поставщику, покупателю
      if setT.GetPluginResult('fmSettingsTipGroup')='0' then begin
        FieldByName('N0_DELTA').Index:=13;
        FieldByName('NAKLRAS_SUM').Index:=12;
        FieldByName('n0').Index:=11;
      end;
      //группировка по поставщику, покупателю, менеджеру
      if setT.GetPluginResult('fmSettingsTipGroup')='1' then begin
        FieldByName('N0_DELTA').Index:=15;
        FieldByName('NAKLRAS_SUM').Index:=14;
        FieldByName('n0').Index:=13;
      end;

      if FindField('sub3_name')<>nil then begin
        FieldByName('sub3_name').DisplayLabel:='Менеджер';
        FieldByName('sub3_name').Index:=6;
      end;
    end;
    ColumnByName(DBGridEh1.Columns,'N0').Footer.ValueType:=fvtSum;
    ColumnByName(DBGridEh1.Columns,'NAKLRAS_SUM').Footer.ValueType:=fvtSum;
    ColumnByName(DBGridEh1.Columns,'N0_DELTA').Footer.ValueType:=fvtSum;


  end else begin //if actShowNO.Checked
    with cdsDolgBux {cdsDolgBux} do begin
      if FindField('sub3_name')<>nil then begin
        FieldByName('sub3_name').DisplayLabel:='Менеджер';
        FieldByName('sub3_name').Index:=3;
      end;
    end;
  end;  //if actShowNO.Checked
end;

end.
