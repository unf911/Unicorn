unit RepDolgNal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RepDolgBuxPost, SettingsPlugin, untEx, untSettings, FMTBcd, DB,
  SqlExpr, ActnList, Menus, DbGridEh, DBClient,
  SettingsDataset , //TfmSettingsDataset
  Provider;

type
  TfrmRepDolgNal = class(TfrmRepDolgBuxPost)
    ActionList2: TActionList;
    actRasxodNalMake: TAction;
    sdsRasxodNalMake: TSQLDataSet;
    sdsDolgBux2: TSQLDataSet;
    dspDolgBux2: TDataSetProvider;
    cdsDolgBux2: TClientDataSet;
    actNaklr: TAction;

    procedure FormCreate(Sender: TObject);
    procedure actRasxodNalMakeExecute(Sender: TObject);
    procedure actNaklrExecute(Sender: TObject);

  private
    { Private declarations }
    procedure ProcessNewColumns;
    procedure ProcessGroup;
    procedure SetDatasets;
    procedure FillCurrency;
  protected
    SettingsManager : TfmSettingsPlugin;
    SettingsClient : TfmSettingsPlugin;
    SettingsTipGroup : TfmSettingsPlugin;
    SettingsVlad : TfmSettingsPlugin;
    SettingsDataset : TfmSettingsDataset;
    procedure FillSettings;
    procedure Refresh; override;
    procedure ProcessSettings;override;
    procedure ShowDetail;override;
    procedure UpdateCaption;
    procedure Debug;override;
  public
    procedure  DefaultStartup;override;
  {  function Defaultopen:boolean;}

    { Public declarations }
  end;
  procedure ProcessRasxodNalMake(dbgNaklot: TDBGridEh;param:variant;Object1:Pointer=nil);
var
  frmRepDolgNal: TfrmRepDolgNal;

implementation

uses 
  RepDolgBuxPostDet, //TfrmRepDolgBuxPostDet
  SkladAux //OpenDocument
;

{$R *.dfm}

procedure TfrmRepDolgNal.FormCreate(Sender: TObject);
begin
  SetDatasets;
  FillSettings;
end;

procedure TfrmRepDolgNal.FillSettings;
begin
  setT := TfrmSettings.Create(self);
  setT.actDataOnly.Execute;
  //пред месяц
  //setT.SetPeriod(7);

  //наша фирма
  SettingsVlad := setT.createplugin('TfmSettingsVlad');
  SettingsVlad.SetResultType(2);
  setT.AddPlugin(SettingsVlad);

  SettingsClient := setT.createplugin('TfmSettingsClient');
  SettingsClient.SetResultType(2);
  setT.AddPlugin(SettingsClient);

  SettingsManager := setT.CreatePlugin('TfmSettingsManager');
  SettingsManager.SetResultType(3);
  setT.AddPlugin(SettingsManager);

  SettingsTipGroup := setT.CreatePlugin('TfmSettingsTipGroup');
  SettingsTipGroup.AddDetailTip('По продавцу, покупателю, менеджеру');
  SettingsTipGroup.AddDetailTip('По сделкам');
  setT.AddPlugin(SettingsTipGroup);

  FillCurrency;

  cbxNotNull.Checked := true;
  actNotNull.Execute;
  FillCopy(DBGridEh1);
  PropStorageEh1.section := 'TfrmRepDolgNal_group0';

  AddMenuItem(DbGridEh1.PopupMenu,actRasxodNalMake);
  AddMenuItemToMenuItem(mnuAction,actRasxodNalMake);

  AddMenuItem(DbGridEh1.PopupMenu,actNaklr);
  AddMenuItemToMenuItem(mnuAction,actNaklr);
  iSchet := dmdEx.GetOidObjects('ТИП СЧЕТА',-100);
  iSchet := dmdEx.GetOidObjects('НАЛИЧНЫЕ ДОЛГИ',iSchet);
end;

procedure TfrmRepDolgNal.Refresh;
begin
  dmdEx.startWaiting;
  if dsDolgBux.DataSet.active then begin
    if not actDebug.checked then begin
      PropStorageEh1.SaveProperties;
    end;
  end;
  UpdateCaption;
  qeDolgBux.Refresh;

  ProcessColumns(cdsDolgBux2);
  ProcessNewColumns;

  PropStorageEh1.LoadProperties;
  dmdEx.stopWaiting;
end;

procedure TfrmRepDolgNal.actRasxodNalMakeExecute(Sender: TObject);
begin
  if setT.getPluginResult('fmSettingsTipGroup')<>'1' then begin
    MessageDlg('Возможно только при группировке по сделкам',mtWarning,[mbOk],0);
    exit;
  end;
  //Перепроводка расходной только по счёту "себестоимость бух"
  if dsDolgBux.DataSet.eof and dsDolgBux.DataSet.bof then begin
    MessageDlg('Не указана сделка для создания платежа',mtWarning,[mbOk],0);
    exit;
  end;
  dmdEx.ColumnSelectAndProcess(DBGridEh1,Null,ProcessRasxodNalMake,sdsRasxodNalMake);
end;

procedure ProcessRasxodNalMake(dbgNaklot: TDBGridEh;param:variant;Object1:Pointer=nil);
var
  DataSet : TDataSet;
  sdsRasxodNalMake : TSQLDataSet;
begin
  sdsRasxodNalMake := TSQLDataSet(Object1);
  DataSet := dbgNaklot.DataSource.DataSet;
  dmdEx.StartWaiting;
  sdsRasxodNalMake.ParamByName('id_nakl_in').asInteger:=
    DataSet.FieldByName('sub4').asInteger;
  dmdEx.ExecSQL(sdsRasxodNalMake);
  dmdex.StopWaiting;
end;

procedure TfrmRepDolgNal.ShowDetail;
var
  frmDolgBuxDet : TfrmRepDolgBuxPostDet;
begin
  dmdex.StartWaiting;
  frmDolgBuxDet :=TfrmRepDolgBuxPostDet.Create (self);
  with frmDolgBuxDet do begin
    SetSchetDates(
      cdsDolgBux2.Params.ParamByName('id_schet').asInteger,
      cdsDolgBux2.Params.parambyName('dat_from').asDate,
      cdsDolgBux2.Params.ParamByName('dat_to').asDate);
    SetParamForDetail(
      'sub1_in',
      cdsDolgBux2.FieldByName('sub1').asInteger,
      'Поставщик',
      cdsDolgBux2.FieldByName('sub1_name').AsString);
    SetParamForDetail(
      'sub2_in',
      cdsDolgBux2.FieldByName('sub2').asInteger,
      'Покупатель',
      cdsDolgBux2.FieldByName('sub2_name').AsString);
    SetParamForDetail(
      'sub3_in',
      cdsDolgBux2.FieldByName('sub3').asInteger,
      'Менеджер',
      cdsDolgBux2.FieldByName('sub3_name').AsString);
    SetParamForDetail(
      'sub5_in',
      cdsDolgBux2.FieldByName('sub5').asInteger,
      'Валюта',
      cdsDolgBux2.FieldByName('sub5_name').AsString);
    if setT.getPluginResult('fmSettingsTipGroup')='1' then begin
      SetParamForDetail(
        'sub4_in',
        cdsDolgBux2.FieldByName('sub4').asInteger,
        'Сделка',
        cdsDolgBux2.FieldByName('sub4_name').AsString);
      SetGroupForDetail ('sub1,sub2,sub3,sub4');
    end else begin
      SetGroupForDetail ('sub1,sub2,sub3');
    end;
    actRefresh.Execute;
    actPreview.Visible :=false;
  end;
  dmdex.StopWaiting;
  frmDolgBuxDet.Show;
end;

procedure TfrmRepDolgNal.DefaultStartup;
begin
  setT.SetPeriod(1);
  SettingsTipGroup.SetKeyValue(1);
end;

procedure TfrmRepDolgNal.ProcessNewColumns;
begin
  with cdsDolgBux2 do begin
    if FindField('sub3')<>nil then begin
      FieldByName('sub3').Visible := false;
    end;
    if FindField('sub4')<>nil then begin
      FieldByName('sub4').Visible := false;
    end;
    {if FindField('sub5_name')<>nil then begin
      FieldByName('sub5_name').visible := false;
    end;
    }
  end; //with cdsDolgBux
  if dsDolgBux.DataSet.FindField('sub4_date')<>nil then begin
    dsDolgBux.DataSet.FieldByName('sub4_date').Index:=0;
    dsDolgBux.DataSet.FieldByName('sub4_date').DisplayLabel:='Дата';
    TDateTimeField(dsDolgBux.DataSet.FieldByName('sub4_date')).DisplayFormat:='dd.mm.yy';
    dsDolgBux.DataSet.FieldByName('sub4_date').visible := true;
  end;
  if dsDolgBux.DataSet.FindField('sub4_name')<>nil then begin
    dsDolgBux.DataSet.FieldByName('sub4_name').Index:=1;
    dsDolgBux.DataSet.FieldByName('sub4_name').DisplayLabel:='№расх накл';
    dsDolgBux.DataSet.FieldByName('sub4_name').visible := true;
  end;

  if dsDolgBux.DataSet.FindField('sub3_name')<>nil then begin
    if setT.GetPluginResult('fmSettingsTipGroup')='0' then begin
      dsDolgBux.DataSet.FieldByName('sub3_name').Index:=3;
    end else begin
      dsDolgBux.DataSet.FieldByName('sub3_name').Index:=6;
    end;
    dsDolgBux.DataSet.FieldByName('sub3_name').DisplayLabel:='Менеджер';
    dsDolgBux.DataSet.FieldByName('sub3_name').visible := true;
  end;
  with dsDolgBux.DataSet {cdsDolgBux} do begin
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
  end;//with
end;

procedure TfrmRepDolgNal.FillCurrency;
begin
  SettingsDataset := TfmSettingsDataset.Create(self);
  SettingsDataset.SetLabelValue(
    'Валюта','Выбор валюты','Не выбрана валюта');
  SettingsDataset.SetListSource(dmdEx.dsCurrency,'name','oid');
  //необязательное заполнение валюты
  SettingsDataset.SetResultType(2);
  setT.AddPlugin(SettingsDataset);
end;

procedure TfrmRepDolgNal.ProcessGroup;
begin
  if setT.getPluginResult('fmSettingsTipGroup')='0' then begin
    qeDolgBux.SetSql('group by','sub3',1);
    qeDolgBux.SetSql('select',
      '(select name from objects o where o.oid=r.sub3) as sub3_name,sub3',
      1);
    qeDolgBux.SetSql('order by',
      '3,4,1',
      1);
    if setT.GetPluginResult('fmSettingsDataset')='' then begin
      PropStorageEh1.section := 'TfrmRepDolgNal_group0';
    end else begin
      PropStorageEh1.section := 'TfrmRepDolgNal_group0_curr';
    end;

    //PropStorageEh1.section := 'TfrmRepDolgNal_group0';
    actRasxodNalMake.visible := false;
  end;
  if setT.getPluginResult('fmSettingsTipGroup')='1' then begin
    qeDolgBux.SetSql('select',
      '(select name from objects o where o.oid=r.sub3) as sub3_name,sub3,'+
      '(select dat from naklo om where om.id_nakl=r.sub4) as sub4_date,'+
      '(select id from naklo om where om.id_nakl=r.sub4) as sub4_name,sub4',
      1);
    qeDolgBux.SetSql('group by','sub3,sub4',1);
    qeDolgBux.SetSql('order by',
      '3,6,8',
      1);
    if setT.GetPluginResult('fmSettingsDataset')='' then begin
      PropStorageEh1.section := 'TfrmRepDolgNal_group1';
    end else begin
      PropStorageEh1.section := 'TfrmRepDolgNal_group1_curr';
    end;
    //PropStorageEh1.section := 'TfrmRepDolgNal_group1';
    actRasxodNalMake.Visible := true;
  end;
end;

procedure TfrmRepDolgNal.UpdateCaption;
begin
  self.Caption := 'Наличные долги: с ' +
    datetostr (setT.DateFrom) +
    ' до ' + datetostr(setT.dateTo);
end;

procedure TfrmRepDolgNal.Debug;
begin
  inherited;
  if actDebug.checked then begin
    MakeFieldVisible(dsDolgBux.DataSet, 'sub1', true);
    MakeFieldLast(dsDolgBux.DataSet,'sub1');
    MakeFieldVisible(dsDolgBux.DataSet, 'sub2', true);
    MakeFieldLast(dsDolgBux.DataSet,'sub2');
    MakeFieldVisible(dsDolgBux.DataSet, 'sub3', true);
    MakeFieldLast(dsDolgBux.DataSet,'sub3');
    MakeFieldVisible(dsDolgBux.DataSet, 'sub4', true);
    MakeFieldLast(dsDolgBux.DataSet,'sub4');
  end else begin
    MakeFieldVisible(dsDolgBux.DataSet, 'sub1', false);
    MakeFieldVisible(dsDolgBux.DataSet, 'sub2', false);
    MakeFieldVisible(dsDolgBux.DataSet, 'sub3', false);
    MakeFieldVisible(dsDolgBux.DataSet, 'sub4', false);
  end;
end;

procedure TfrmRepDolgNal.SetDatasets;
begin
  qeDolgBux.Query := cdsDolgBux2;
  qeDolgBux.DefSql := sdsDolgBux2.CommandText;
  qeDolgBux.KeyField := 'sub2';
  dsDolgBux.DataSet := cdsDolgBux2;
end;

procedure TfrmRepDolgNal.actNaklrExecute(Sender: TObject);
begin
  if dsDolgBux.DataSet.Eof and dsDolgBux.DataSet.Bof then begin
    exit;
  end;
  OpenDocument(self,
    dsDolgBux.DataSet.FieldByName('sub4').asInteger,
    dmdEx.GetOidObjects('РАСХОДНЫЕ НАКЛАДНЫЕ',-100),
    0);
end;

procedure TfrmRepDolgNal.ProcessSettings;
begin
  TClientDataSet(qeDolgBux.Query).Params.ParamByName('id_schet').AsInteger :=iSchet;
  TClientDataSet(qeDolgBux.Query).Params.ParamByName('dat_to').AsDate := setT.DateTo;
  TClientDataSet(qeDolgBux.Query).params.ParamByName('dat_from').AsDate := setT.DateFrom;
  dmdEx.SetIntegerParamValue(
    TClientDataSet(qeDolgBux.Query).Params.ParamByName('sub1_in'),
    setT.GetPluginResult('fmSettingsVlad'));
  dmdEx.SetIntegerParamValue(
    TClientDataSet(qeDolgBux.Query).Params.ParamByName('sub2_in'),
    setT.GetPluginResult('fmSettingsClient'));
  dmdEx.SetIntegerParamValue(
    TClientDataSet(qeDolgBux.Query).Params.ParamByName('sub3_in'),
    setT.GetPluginResult('fmSettingsManager'));
  dmdEx.SetIntegerParamValue(
    TClientDataSet(qeDolgBux.Query).Params.ParamByName('id_currency_to'),
    setT.GetPluginResult('fmSettingsDataset'));
  ProcessGroup;
end;

end.
