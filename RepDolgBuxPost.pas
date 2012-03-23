unit RepDolgBuxPost;

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
  RepDolgBuxPostDet, //TfrmRepDolgBuxPostDet
  SettingsPlugin, //TfmSettingsPlugin
  SettingsDataset , //TfmSettingsDataset
  ATSAssert,
  untRound
 ;

type
  TfrmRepDolgBuxPost = class(TForm)
    dsDolgBux: TDataSource;
    qeDolgBux: TQueryExtender;
    ActionList1: TActionList;
    actCall: TAction;
    actSettings: TAction;
    actDetail: TAction;
    actRefresh: TAction;
    actNotNull: TAction;
    DBGridEh1: TDBGridEh;
    sdsDolgBux: TSQLDataSet;
    dspDolgBux: TDataSetProvider;
    cdsDolgBux: TClientDataSet;
    MainMenu1: TMainMenu;
    mnuAction: TMenuItem;
    N3: TMenuItem;
    mnuRefresh: TMenuItem;
    N2: TMenuItem;
    UnfFilter1: TUnfFilter;
    actDebug: TAction;
    N4: TMenuItem;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    actShowColums: TAction;
    GroupBox2: TGroupBox;
    cbxNotNull: TCheckBox;
    BitBtn3: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    PopupMenu1: TPopupMenu;
    procedure actSettingsExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actNotNullExecute(Sender: TObject);
    procedure actDetailExecute(Sender: TObject);
    procedure actDebugExecute(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure actShowColumsExecute(Sender: TObject);
    procedure MakeFieldVisible(DataSet: TDataset;FieldName:string;Visible:boolean);
    procedure MakeFieldLast(DataSet: TDataset;FieldName:string);
  protected
    { Private declarations }

    SettingsPost : TfmSettingsPlugin;
    SettingsVlad : TfmSettingsPlugin;
    SettingsTipGroup : TfmSettingsPlugin;
    SettingsManager : TfmSettingsPlugin;
    SettingsDataset : TfmSettingsDataset;
    SettingsTipDetail : TfmSettingsPlugin;
    iSchet : integer; //номер счёта из objects

    procedure Debug;virtual;
    procedure ProcessColumns(DataSet:TDataSet);
    procedure FillSettings;
    procedure FillCurrency;
    procedure UpdateCaption;
    procedure Refresh; virtual;
    procedure ProcessSettings; virtual;
    procedure ProcessGroup;
    procedure ShowDetail; virtual;
    procedure FillCopy(DBGridEh1: TDBGridEh);
    procedure AddMenuItem(Menu1: TMenu; actRasxodNalMake: TAction);
    procedure AddMenuItemToMenuItem(Menu1: TMenuItem;
      actRasxodNalMake: TAction);
    procedure ProcessTipDetail;
    procedure FillTipDetail;
  public
    setT : TfrmSettings;
    function Defaultopen: boolean;
    procedure DefaultStartup; virtual;
  end;

var
  frmRepDolgBuxPost: TfrmRepDolgBuxPost;

implementation

uses untEx;

{$R *.dfm}

procedure TfrmRepDolgBuxPost.actSettingsExecute(Sender: TObject);
begin
  actSettings.checked := setT.ProcessSettingsChange2(DefaultOpen);
end;

procedure TfrmRepDolgBuxPost.FormCreate(Sender: TObject);
begin
  qeDolgBux.DefSql := sdsDolgBux.CommandText;
  setT := TfrmSettings.Create(self);
  FillSettings;
  dmdEx.OpenQuery(dmdEx.dsCurrency.DataSet,true);
  dmdEx.OpenQuery(dmdEx.dsManager.DataSet,true);
  ShowCopyForRoleOrUser(DBGridEh1,'POWER_USER;BUXG','SYSDBA');
end;

procedure TfrmRepDolgBuxPost.FillSettings;
begin
  setT := TfrmSettings.Create(self);



  setT.actDataOnly.Execute;
  FillTipDetail;
  //поставщик
  SettingsPost := setT.createplugin('TfmSettingsPost');
  setT.AddPlugin(SettingsPost);
  //наша фирма
  SettingsVlad := setT.createplugin('TfmSettingsVlad');
  SettingsVlad.SetResultType(2);
  setT.AddPlugin(SettingsVlad);

  SettingsManager := setT.createplugin('TfmSettingsManager');
  SettingsManager.setResultType(3);
  setT.addPlugin(SettingsManager);

  SettingsTipGroup := setT.createplugin('TfmSettingsTipGroup');
  SettingsTipGroup.AddDetailTip('По поставщику, покупателю');
  SettingsTipGroup.AddDetailTip('По менеджеру');
  //SettingsTipGroup.AddDetailTip('По сделке');
  setT.addPlugin(SettingsTipGroup);
  FillCurrency;
  cbxNotNull.Checked := true;
  actNotNull.Execute;
  FillCopy(DBGridEh1);
  PropStorageEh1.section := 'TfrmRepDolgBuxPost';

  iSchet := dmdEx.GetOidObjects('ТИП СЧЕТА',-100);
  iSchet := dmdEx.GetOidObjects('РАСЧЁТЫ С ПОСТАВЩИКАМИ',iSchet);
  //iSchet := dmdEx.GetOidObjects('ДОЛГИ ЗА КАБЕЛЬ',iSchet);
end;

procedure TfrmRepDolgBuxPost.FillTipDetail;
begin
  SettingsTipDetail := setT.CreatePlugin('TfmSettingsTipDetail');
  SettingsTipDetail.SetLabelValue('Счёт');
  setT.addplugin(SettingsTipDetail);
  SettingsTipDetail.AddDetailTip('Взаиморасчёты с поставщиками');
  SettingsTipDetail.AddDetailTip('Взаиморасчёты с поставщиками услуг');
  SettingsTipDetail.AddDetailTip('Долги за кабель');
  SettingsTipDetail.AddDetailTip('Долги за аренду');
  SettingsTipDetail.AddDetailTip('Долги за услуги');
  SettingsTipDetail.SetKeyValue(0);
end;

procedure TfrmRepDolgBuxPost.actRefreshExecute(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmRepDolgBuxPost.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DBGridEh1.DataSource.DataSet.Active then begin
    if not actDebug.checked then begin
      PropStorageEh1.SaveProperties;
    end;
  end;
  dmdEx.CloseQuery(dmdEx.dsCurrency.DataSet,false);
  dmdEx.CloseQuery(dmdEx.dsManager.DataSet,false);
  Action := caFree;
end;


procedure TfrmRepDolgBuxPost.actNotNullExecute(Sender: TObject);
begin
  //actNotNull.Checked := not actNotNull.Checked;
  if (cbxNotNull.Checked) then begin
    qeDolgBux.SetFilter( '(debetafter<>0 or kreditafter<>0 '+
      'or debetbefore<>0 or kreditbefore<>0 or debet<>0 or kredit<>0)' ,0);
    qeDolgBux.ApplyFilter;
  end else begin
    qeDolgBux.SetFilter('',0);
    qeDolgBux.ApplyFilter;
  end; //if actNotNull.Checked
end;



procedure TfrmRepDolgBuxPost.actDetailExecute(Sender: TObject);
begin
  ShowDetail;
end;

procedure TfrmRepDolgBuxPost.actDebugExecute(Sender: TObject);
begin
  Debug;
end;

procedure TfrmRepDolgBuxPost.DBGridEh1DblClick(Sender: TObject);
begin
  actDetail.Execute;
end;

procedure TfrmRepDolgBuxPost.actShowColumsExecute(Sender: TObject);
begin
 // ShowColumns;
  ProcessColumns(cdsDolgBux);
end;


procedure TfrmRepDolgBuxPost.ProcessColumns(DataSet:TDataSet);
var
  i : integer;
begin
  with DataSet {cdsDolgBux} do begin
    if FindField('sub1_name')<>nil then begin
      FieldByName('sub1_name').DisplayLabel:='Поставщик';
    end;
    if FindField('sub2_name')<>nil then begin
      FieldByName('sub2_name').DisplayLabel:='Получатель';
    end;
    if FindField('sub4')<>nil then begin
      FieldByName('sub4').DisplayLabel:='Сделка';
      FieldByName('sub4').Index:=4;
    end;
    if FindField('sub3_name')<>nil then begin
      FieldByName('sub3_name').DisplayLabel:='Менеджер';
      FieldByName('sub3_name').Index:=3;
    end;

    if FindField('sub5_name')<>nil then begin
      FieldByName('sub5_name').DisplayLabel:='Валюта';
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
    if FindField('sub5')<>nil then begin
      FieldByName('sub5').Visible:=false;
    end;
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
    if FindField('debetafter')<>nil then begin
      FieldByName('debetafter').DisplayLabel:='Дебет на конец';
      TNumericField(FieldByName('debetafter')).DisplayFormat:=',0.00';
    end;
    if FindField('kreditafter')<>nil then begin
      FieldByName('kreditafter').DisplayLabel:='Кредит на конец';
      TNumericField(FieldByName('kreditafter')).DisplayFormat:=',0.00';
    end;
    if Assigned(SettingsDataset) then begin
      if setT.GetPluginResult('fmSettingsDataset')='' then begin
        FindField('DEBETAFTERINCURRENCY').Visible := false;
        FindField('KREDITAFTERINCURRENCY').Visible := false;
      end else begin
        if FindField('DEBETAFTERINCURRENCY')<>nil then begin
          FieldByName('DEBETAFTERINCURRENCY').DisplayLabel:=
            'Дебет в '+setT.getplugintextresult('fmSettingsDataset')+' на конец';
          TNumericField(FieldByName('DEBETAFTERINCURRENCY')).DisplayFormat:=',0.00';
        end;
        if FindField('KREDITAFTERINCURRENCY')<>nil then begin
          FieldByName('KREDITAFTERINCURRENCY').DisplayLabel:=
            'Кредит в '+setT.getplugintextresult('fmSettingsDataset')+' на конец';
          TNumericField(FieldByName('KREDITAFTERINCURRENCY')).DisplayFormat:=',0.00';
        end;
      end;
    end; //if Assigned(SettingsDataset)
  end;

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


procedure TfrmRepDolgBuxPost.UpdateCaption;
begin
  self.Caption :=
    //'Отчёт по взаиморасчётам с поставщиками: с ' +
    setT.GetPluginTextResult('fmSettingsTipDetail') + ': c ' +
    datetostr (setT.DateFrom) +
    ' до ' + datetostr(setT.dateTo);
end;

procedure TfrmRepDolgBuxPost.FillCopy(DBGridEh1 : TDBGridEh);
begin
  if  ((dmdEx.getrole='POWER_USER') or (dmdEx.GetUser='SYSDBA')) then begin
    DBGridEh1.EditActions:=[geaCopyEh,geaSelectAllEh];
  end;
end;

procedure TfrmRepDolgBuxPost.Refresh;
begin
  dmdEx.startWaiting;
  if cdsDolgBux.active then begin
    if not actDebug.Checked then begin
      PropStorageEh1.SaveProperties;
    end;
  end;

  qeDolgBux.Refresh;
  ProcessColumns(cdsDolgBux);
  PropStorageEh1.LoadProperties;
  dmdEx.stopWaiting;
end;

procedure TfrmRepDolgBuxPost.ShowDetail;
var
  frmDolgBuxDet : TfrmRepDolgBuxPostDet;
  //Params : TParams;
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
      cdsDolgBux.FieldByName('sub1_name').AsString);
    SetParamForDetail(
      'sub2_in',
      cdsDolgBux.FieldByName('sub2').asInteger,
      'Покупатель',
      cdsDolgBux.FieldByName('sub2_name').AsString);
    if setT.getPluginResult('fmSettingsTipGroup')='1' then begin
      SetParamForDetail(
        'sub3_in',
        cdsDolgBux.FieldByName('sub3').asInteger,
        'Менеджер',
        cdsDolgBux.FieldByName('sub3_name').AsString);
      SetGroupForDetail ('sub1,sub2,sub3');
    end;
    if not cdsDolgBux.FieldByName('sub5').IsNull then begin
      SetParamForDetail(
        'sub5_in',
        cdsDolgBux.FieldByName('sub5').asInteger,
        'Валюта',
        cdsDolgBux.FieldByName('sub5_name').AsString);
    end;
    actRefresh.Execute;
  end;
  dmdex.StopWaiting;
  frmDolgBuxDet.Show;
end;

procedure TfrmRepDolgBuxPost.MakeFieldVisible(DataSet: TDataset;
  FieldName: string; Visible: boolean);
begin
  if Assigned(DataSet.FindField(FieldName)) then begin
    DataSet.FieldByName(FieldName).Visible :=Visible;
  end;
end;

procedure TfrmRepDolgBuxPost.Debug;
begin
  actDebug.Checked := not actDebug.Checked;
  if actDebug.Checked then begin
    //последние две колонки содержат номера фирм и клиентов
    //информация для отладки
    MakeFieldVisible(cdsDolgBux, 'sub1', true);
    MakeFieldLast(cdsDolgBux,'sub1');
    MakeFieldVisible(cdsDolgBux, 'sub2', true);
    MakeFieldLast(cdsDolgBux,'sub2');
    MakeFieldVisible(cdsDolgBux, 'sub3', false);
    MakeFieldLast(cdsDolgBux,'sub3');
    MakeFieldVisible(cdsDolgBux, 'sub5', true);
    MakeFieldLast(cdsDolgBux,'sub5');
  end else begin //if actDebug.Checked
    MakeFieldVisible(cdsDolgBux, 'sub1', false);
    MakeFieldVisible(cdsDolgBux, 'sub2', false);
    MakeFieldVisible(cdsDolgBux, 'sub3', false);
    MakeFieldVisible(cdsDolgBux, 'sub5', false);
  end; //if actDebug.Checked
end;

procedure TfrmRepDolgBuxPost.MakeFieldLast(DataSet: TDataset;
  FieldName: string);
begin
  if Assigned(DataSet.FindField(FieldName)) then begin
    DataSet.FieldByName(FieldName).Index :=DataSet.FieldCount-1;
  end;
end;

procedure TfrmRepDolgBuxPost.AddMenuItem(Menu1: TMenu;
  actRasxodNalMake: TAction);
var
  NewItem :TMenuItem;
begin
  NewItem := TMenuItem.Create(Menu1);
  Menu1.Items.Add(NewItem);
  NewItem.Action := actRasxodNalMake;
end;

procedure TfrmRepDolgBuxPost.AddMenuItemToMenuItem(Menu1: TMenuItem;
  actRasxodNalMake: TAction);
var
  NewItem :TMenuItem;
begin
  NewItem := TMenuItem.Create(Menu1);
  Menu1.Add(NewItem);
  NewItem.Action := actRasxodNalMake;
end;

function TfrmRepDolgBuxPost.Defaultopen: boolean;
begin
  DBGridEh1.DataSource.DataSet.Close;
  ProcessSettings;
  Refresh;
  Result :=true;
end;

procedure TfrmRepDolgBuxPost.DefaultStartup;
begin
  //текущий месяц
  setT.SetPeriod(1);
  SettingsTipGroup.SetKeyValue(0);
end;

procedure TfrmRepDolgBuxPost.FillCurrency;
begin
  SettingsDataset := TfmSettingsDataset.Create(self);
  SettingsDataset.SetLabelValue(
    'Валюта','Выбор валюты','Не выбрана валюта');
  SettingsDataset.SetListSource(dmdEx.dsCurrency,'name','oid');
  //необязательное заполнение валюты
  SettingsDataset.SetResultType(2);
  setT.AddPlugin(SettingsDataset);
end;


procedure TfrmRepDolgBuxPost.ProcessTipDetail;
var
  iSchetTip,iSchet: integer;
begin
try
  iSchetTip := dmdEx.GetOidObjects('ТИП СЧЕТА',-100);
  iSchet := 0;
  if setT.GetPluginResult('fmSettingsTipDetail') ='0' then begin
    iSchet := dmdEx.GetOidObjects('РАСЧЁТЫ С ПОСТАВЩИКАМИ',iSchetTip);
  end;
  if setT.GetPluginResult('fmSettingsTipDetail') ='1' then begin
    iSchet := dmdEx.GetOidObjects('РАСЧЁТЫ С ПОСТАВЩИКАМИ УСЛУГ',iSchetTip);
  end;
  if setT.GetPluginResult('fmSettingsTipDetail') ='2' then begin
    iSchet := dmdEx.GetOidObjects('ДОЛГИ ЗА КАБЕЛЬ',iSchetTip);
  end;
  if setT.GetPluginResult('fmSettingsTipDetail') ='3' then begin
    iSchet := dmdEx.GetOidObjects('ДОЛГИ ЗА АРЕНДУ',iSchetTip);
  end;
  if setT.GetPluginResult('fmSettingsTipDetail') ='4' then begin
    iSchet := dmdEx.GetOidObjects('ДОЛГИ ЗА ФИНУСЛУГИ',iSchetTip);
  end;
  dmdEx.SetIntegerParamValue(
    cdsDolgBux.Params.ParamByName('id_schet'),
    inttostr(iSchet));
except
  AssertInternal('B5C2369D-A902-4252-B217-27662EAF69FD');
end;
end;

procedure TfrmRepDolgBuxPost.ProcessSettings;
begin
  TClientDataSet(qeDolgBux.Query).Params.ParamByName('dat_to').AsDate := setT.DateTo;
  TClientDataSet(qeDolgBux.Query).params.ParamByName('dat_from').AsDate := setT.DateFrom;
  dmdEx.SetIntegerParamValue(
    cdsDolgBux.Params.ParamByName('sub3_in'),
    setT.GetPluginResult('fmSettingsManager'));
  dmdEx.SetIntegerParamValue(
    cdsDolgBux.Params.ParamByName('sub2_in'),
    setT.GetPluginResult('fmSettingsVlad'));
  dmdEx.SetIntegerParamValue(
    cdsDolgBux.Params.ParamByName('sub1_in'),
    setT.GetPluginResult('fmSettingsPost'));
  dmdEx.SetIntegerParamValue(
    cdsDolgBux.Params.ParamByName('id_currency_to'),
    setT.GetPluginResult('fmSettingsDataset'));
  ProcessGroup;
  ProcessTipDetail;
  UpdateCaption;
end;

procedure TfrmRepDolgBuxPost.ProcessGroup;
begin
  if setT.GetPluginResult('fmSettingsTipGroup')='0' then begin
    //'По поставщику, покупателю'
    qeDolgBux.setsql(
      'select','',
      0);
    qeDolgBux.setsql(
      'group by','',
      0);
    qeDolgBux.setsql(
      'order by','1,2', //sub1_name,sub2_name,
      0);
    if setT.GetPluginResult('fmSettingsDataset')='' then begin
      PropStorageEh1.section := 'TfrmRepDolgBuxPost_group0';
    end else begin
      PropStorageEh1.section := 'TfrmRepDolgBuxPost_group0_curr';
    end;
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
      'order by','3,4,1', //sub1_name,sub2_name,sub3_name
      0);
    if setT.GetPluginResult('fmSettingsDataset')='' then begin
      PropStorageEh1.section := 'TfrmRepDolgBuxPost_group1';
    end else begin
      PropStorageEh1.section := 'TfrmRepDolgBuxPost_group1_curr';
    end;
  end;
  {
  if setT.GetPluginResult('fmSettingsTipGroup')='2' then begin
    //'По сделке'
    qeDolgBux.setsql(
      'select',
      '(select name from objects o where o.oid=r.sub3) as sub3_name, r.sub3, r.sub4',
      0);
    qeDolgBux.setsql(
      'group by','r.sub3,r.sub4',
      0);
    qeDolgBux.setsql(
      'order by','4,5,1,3', //sub1_name,sub2_name,sub3_name
      0);
  end
  }
end;

end.
