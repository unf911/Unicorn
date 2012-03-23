unit untSkladRasxBux;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms,
  Dialogs,
  DB,
  ActnList, StdCtrls, Menus, Grids, DBGrids,
  DateUtils, QueryExtender, ComCtrls,
  FMTBcd, PropFilerEh, PropStorageEh,
  UnfFilter, DBClient,
  Provider, SqlExpr,
  Buttons, GridsEh,
  DBGridEh, frxClass, frxDBSet,
    untSkladRasxBuxDet,  untEx,
  SettingsPlugin, //fmSettingsPlugin
  untSettings

  ;

type
  TfrmSkladRasxBux = class(TForm)
    ActionList1: TActionList;
    MainMenu1: TMainMenu;
    mnuActions: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    actRefresh: TAction;
    qeRasx: TQueryExtender;
    dsRasx: TDataSource;
    actItogo: TAction;
    frdRasx: TfrxDBDataset;
    actPrint: TAction;
    actPreview: TAction;
    actDetail: TAction;
    actWithoutTara: TAction;
    sdsRasx: TSQLDataSet;
    dspRasx: TDataSetProvider;
    qurRasx: TClientDataSet;
    qurRasxTOVAR: TStringField;
    qurRasxID_TOVAR: TIntegerField;
    UnfFilter1: TUnfFilter;
    udgRasx: TDBGridEh;
    qurRasxKOLOTP2: TFMTBCDField;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    actSettings: TAction;
    qurRasxSUM: TFloatField;
    GroupBox1: TGroupBox;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn3: TBitBtn;
    frRasx: TfrxReport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure actItogoExecute(Sender: TObject);
    procedure frRasxGetValue(const ParName: String; var ParValue: Variant);
    procedure actPrintExecute(Sender: TObject);
    procedure actPreviewExecute(Sender: TObject);
    procedure actDetailExecute(Sender: TObject);
    procedure actSettingsExecute(Sender: TObject);
    procedure udgRasxDblClick(Sender: TObject);
    procedure udgRasxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure frRasxBeginDoc(Sender: TObject);
    procedure frRasxEndDoc(Sender: TObject);
  private
    { Private declarations }

    curSum : currency;
    dDate_from,dDate_to : TDate;
    SettingsVlad : TfmSettingsPlugin;
    SettingsSklad : TfmSettingsPlugin;
    SettingsTipDetail1 : TfmSettingsPlugin;
    SettingsTipDetail2 : TfmSettingsPlugin;
    SettingsTipDetail3 : TfmSettingsPlugin;
    setT : TfrmSettings;

    procedure ProcessDate;
    procedure ProcessFirm;
    procedure ProcessManager;
    procedure ProcessTara;
    procedure ProcessMode;
    procedure ProcessPrixRasx;

    procedure UpdateCaption;

    //procedure SortOnLookup(Field: TField; sSortString:string='');
    procedure FillSettings;
    procedure FillPrixRasx;
    procedure FillMode;
    procedure FillTara;
    procedure FillVlad;
  public
    { Public declarations }
  end;

var
  frmSkladRasxBux: TfrmSkladRasxBux;

implementation


uses
  DesignReport //ProcessReportDesigner
  ;
{$R *.dfm}

procedure TfrmSkladRasxBux.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

//ставим условия в зависимости от выбора даты
procedure TfrmSkladRasxBux.ProcessDate;
begin
  //запись дат для последующей детализации
  dDate_from :=  setT.DateFrom;
  dDate_to := setT.DateTo;

  qeRasx.SetSQL('where',
    'n.dat <='+quotedstr(datetostr(dDate_to)), 0);
  qeRasx.SetSQL('where',
    'n.dat >= '+quotedstr(datetostr(dDate_from)), 1);
end;

//ставим условия в зависимости от выбора фирмы
procedure TfrmSkladRasxBux.ProcessFirm;
var
  strUkk : string;
  //strSklad : string;
  iCase : integer;
//  id_UKK : integer;
begin
  strUkk := setT.GetPluginResult('fmSettingsTipDetail3');
  iCase := strtoint(strUkk);
  strUkk := setT.GetPluginResult('fmSettingsVlad');
  if (strUkk<>'') then begin
    if iCase<>1 then begin
      qeRasx.SetSql('where','n.id_izg'+strUkk,3);
    end else begin
      qeRasx.SetSql('where','n.id_zak'+strUkk,3);
    end;
  end else begin
    qeRasx.SetSql('where','',3);
  end
end;

//ставим условия в зависимости от выбора менеджера
procedure TfrmSkladRasxBux.ProcessManager;
begin
  if (sett.IDManager <>0) then begin
    //один менеджер
    qeRasx.SetSQL('where',
      'n.id_manager='+inttostr(sett.IDManager),
      2
    );
  end
  else begin
    //все менеджеры
    qeRasx.SetSql('where','',2);
  end;

end;

procedure TfrmSkladRasxBux.FormCreate(Sender: TObject);
begin
  dmdEx.OpenQuery(dmdEx.cdsAllClient);
  qurRasx.Close;
  qeRasx.DefSql:=sdsRasx.CommandText;
  setT := TfrmSettings.Create(self);
  FillSettings;
  ProcessReportDesigner(ActionList1,MainMenu1,frRasx);
end;

procedure TfrmSkladRasxBux.actRefreshExecute(Sender: TObject);
begin
  dmdEx.StartWaiting;
  UpdateCaption;
  ProcessDate;
  ProcessManager;
  ProcessFirm;
  ProcessTara;
  ProcessMode;
  ProcessPrixRasx;
  qeRasx.Refresh;
  dmdEx.StopWaiting;
//  SortOnLookup(qurRasx.FieldByName('tovar'));
end;


//обновление заголовка окна в зависимости от выбранных условий
procedure TfrmSkladRasxBux.UpdateCaption;
begin
{
  self.Caption := 'Отчёт по расходу со склада (бух) c '+
    datetostr(dtpDateFrom.Date)+' до ' +
    datetostr(dtpDateTo.Date)+ '. Фирма : '+
    cbxFirm.Items[cbxFirm.ItemIndex] +'. Менеджер : '+
    cbxManager.Items[cbxManager.ItemIndex]+'.';
}
  self.Caption := 'Отчёт по '+
    AnsiLowerCase(setT.GetPluginTextResult('fmSettingsTipDetail3')) +
    ' (бух) c '+
    datetostr(sett.DateFrom)+' до ' +
    datetostr(setT.DateTo)+ '. Фирма: '+
    sett.GetPluginTextResult('fmSettingsVlad') +
    '. Менеджер: '+
    setT.Manager+'. Склад:'+
    setT.GetPluginTextResult('fmSettingsSklad')+'.';
end;

procedure TfrmSkladRasxBux.actItogoExecute(Sender: TObject);
begin
  if qurRasx.Active then begin
    curSum :=0;
    qurRasx.First;
    while (not qurRasx.Eof) do begin
      curSum := curSum + qurRasx.FieldByName ('kolotp').asCurrency;
      qurRasx.Next;
    end;
  end;
end;

procedure TfrmSkladRasxBux.frRasxGetValue(const ParName: String;
  var ParValue: Variant);
var
  strTemp : string;
begin
  if AnsiUpperCase(ParName) = 'TITLE' then begin
    //генерация заголовка
    strTemp :=self.Caption;
    if (qurRasx.Filtered = true) then begin
      //если отчёт отфильтрован
      strTemp := strTemp+ ' [Фильтр]';
    end;
    ParValue := strTemp;
  end ;
  if AnsiUpperCase(ParName) = 'TOTALSUM' then begin
    //сумма вычисленная actItogo
    ParValue := curSum;
  end ;
end;

procedure TfrmSkladRasxBux.actPrintExecute(Sender: TObject);
begin
  frRasx.PrepareReport;
  frRasx.Print;
  //PreparedReport('',1,false,frAll);
end;

procedure TfrmSkladRasxBux.actPreviewExecute(Sender: TObject);
begin
  dmdEx.GetReport('RepRasx.fr3',frRasx);
  frRasx.PrepareReport;
  frRasx.ShowReport;
end;

procedure TfrmSkladRasxBux.actDetailExecute(Sender: TObject);
var
  frmSkladRasxBuxDet : TfrmSkladRasxBuxDet;
begin
  dmdEx.StartWaiting;
  frmSkladRasxBuxDet := TfrmSkladRasxBuxDet.Create(self);
  frmSkladRasxBuxDet.ShowSkladRasxBuxDet(qeRasx, qurRasx.fieldbyname('id_tovar').asInteger);
  dmdEx.StopWaiting;
end;

procedure TfrmSkladRasxBux.ProcessTara;
var
  strUkk : string;
  iMode: integer;
begin
  strUkk := setT.GetPluginResult('fmSettingsTipDetail2');
  iMode := strtoint(strUkk);
  case iMode of  
    0: begin
      qeRasx.SetSQL('having','',0);
    end;
    1: begin
      qeRasx.SetSQL('having','((select t2.tara from tovar t2 where t2.oid=t.id_tovar)=2)',0);
    end;
    2: begin
      qeRasx.SetSQL('having','((select t2.tara from tovar t2 where t2.oid=t.id_tovar)=1)',0);
    end;
    3: begin
      qeRasx.SetSQL('having','((select t2.tara from tovar t2 where t2.oid=t.id_tovar)=3)',0);
    end;
  end;//case
end;

procedure TfrmSkladRasxBux.FillSettings;
begin
  setT.actAllManagerOn.Execute;
  setT.actAllManager.Execute;
  setT.IDManager :=0;
  //пред месяц
  setT.SetPeriod(7);

  SettingsSklad := setT.CreatePlugin('TfmSettingsSklad');
  SettingsSklad.SetResultType(1);
  setT.AddPlugin(SettingsSklad);
  SettingsSklad.SetKeyValue(0);

  
  FillVlad;

  FillMode;
  FillTara;
  FillPrixRasx;
end;

procedure TfrmSkladRasxBux.FillVlad;
var
  iTemp : integer;
begin
  SettingsVlad := setT.CreatePlugin('TfmSettingsVlad');
  SettingsVlad.SetResultType(0);
  setT.AddPlugin(SettingsVlad);
  //выбираем точное название для Укк
  iTemp := dmdEx.GetDefaultVlad;
  SettingsVlad.SetKeyValue(iTemp);
end;

procedure TfrmSkladRasxBux.actSettingsExecute(Sender: TObject);
begin
  actSettings.Checked := false;
  if setT.ChangeSettings=mrOk then begin
	  //нажимаем обновить
    actSettings.Checked := true;
  	actRefresh.Execute;
  end;
end;

procedure TfrmSkladRasxBux.FillMode;
begin
  SettingsTipDetail1 := setT.CreatePlugin('TfmSettingsTipDetail');
  SettingsTipDetail1.Name := 'fmSettingsTipDetail1';
  setT.addplugin(SettingsTipDetail1);
  SettingsTipDetail1.AddDetailTip('По всем расходным');
  SettingsTipDetail1.AddDetailTip('По уехавшим со склада');
  SettingsTipDetail1.AddDetailTip('По неуехавшим со склада');
  SettingsTipDetail1.SetKeyValue(0);
end;

procedure TfrmSkladRasxBux.FillTara;
begin
  SettingsTipDetail2 := setT.CreatePlugin('TfmSettingsTipDetail');
  SettingsTipDetail2.Name := 'fmSettingsTipDetail2';
  SettingsTipDetail2.SetLabelValue('Тип товаров');
  setT.addplugin(SettingsTipDetail2);
  SettingsTipDetail2.AddDetailTip('По всем товарам');
  SettingsTipDetail2.AddDetailTip('По кабелю');
  SettingsTipDetail2.AddDetailTip('По таре');
  SettingsTipDetail2.AddDetailTip('По услугам');  
  SettingsTipDetail2.SetKeyValue(1);
end;

procedure TfrmSkladRasxBux.ProcessMode;
var
  strUkk : string;
  sTemp : string;
begin
  strUkk := setT.GetPluginResult('fmSettingsTipDetail1');
  if (strUkk='1') then begin
  //Уехавшие
    sTemp :=
'  exists (select id_nakl'+
'    from naklo om'+
'    where om.parent_id_nakl=n.id_nakl and'+
'    om.tip=5 and'+
'    om.delmarked=0) and'+
'  not exists (select id_nakl'+
'    from naklo om'+
'    where om.parent_id_nakl=n.id_nakl and'+
'    om.tip=5 and'+
'    om.delmarked=0 and om.posted=0)';
    qeRasx.SetSql('where',sTemp,5);
    qeRasx.SetSql('where','',6);
    exit;
  end;
  if (strUkk='2') then begin
    //Неуехавшие

    sTemp :=
'  (not exists (select id_nakl'+
'    from naklo om'+
'    where om.parent_id_nakl=n.id_nakl and'+
'    om.tip=5 and'+
'    om.delmarked=0) or'+
'  exists (select id_nakl'+
'    from naklo om'+
'    where om.parent_id_nakl=n.id_nakl and'+
'    om.tip=5 and'+
'    om.delmarked=0 and om.posted=0))';
    qeRasx.SetSql('where',sTemp,6);
    qeRasx.SetSql('where','',5);
    exit;
  end;
  qeRasx.SetSql('where','',5);
  qeRasx.SetSql('where','',6);
end;

procedure ProcessPrixRasx;
begin

end;

procedure TfrmSkladRasxBux.udgRasxDblClick(Sender: TObject);
begin
  actDetail.Execute;
end;

procedure TfrmSkladRasxBux.udgRasxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return: begin
      actDetail.Execute;
    end;
  end;
end;

procedure TfrmSkladRasxBux.FillPrixRasx;
begin
  SettingsTipDetail3 := setT.CreatePlugin('TfmSettingsTipDetail');
  SettingsTipDetail3.Name := 'fmSettingsTipDetail3';
  SettingsTipDetail3.SetLabelValue('Отчёт по');
  setT.addplugin(SettingsTipDetail3);
  SettingsTipDetail3.AddDetailTip('Расходу со склада');
  SettingsTipDetail3.AddDetailTip('Приходу на склад');
  SettingsTipDetail3.AddDetailTip('Перемещениям со склада');
  SettingsTipDetail3.AddDetailTip('Перемещениям на склад');
  SettingsTipDetail3.AddDetailTip('Расходу услуг');
  SettingsTipDetail3.SetKeyValue(0);
end;

procedure TfrmSkladRasxBux.ProcessPrixRasx;
var
  strUkk : string;
  strSklad : string;
  iCase : integer;
begin
  strUkk := setT.GetPluginResult('fmSettingsTipDetail3');
  iCase := strtoint(strUkk);
  strSklad := setT.GetPluginResult('fmSettingsSklad');
  if iCase <>3 then begin
    if (strSklad<>'') then begin
      qeRasx.SetSql('where','n.id_sklad='+strSklad,4);
    end else begin
      qeRasx.SetSql('where','',4);
    end;
  end else begin
    if (strSklad<>'') then begin
      qeRasx.SetSql('where','n.id_sklad_to='+strSklad,4);
    end else begin
      qeRasx.SetSql('where','',4);
    end;
  end;//if iCase <>3
  case iCase of
    0 : begin
      qeRasx.SetSql('where',
        'n.tip = ( select oid from get_oid_objects_pc(''РАСХОДНЫЕ НАКЛАДНЫЕ'',-100))',
        7);
    end;
    1 : begin
      qeRasx.SetSql('where',
        'n.tip = ( select oid from get_oid_objects_pc(''ПРИХОДНЫЕ НАКЛАДНЫЕ'',-100))',
        7);
    end;
    2: begin
      qeRasx.SetSql('where',
        'n.tip = ( select oid from get_oid_objects_pc(''БУХГАЛТЕРСКОЕ ПЕРЕМЕЩЕНИЕ'',-100))',
        7);
    end;
    3: begin
      qeRasx.SetSql('where',
        'n.tip = ( select oid from get_oid_objects_pc(''БУХГАЛТЕРСКОЕ ПЕРЕМЕЩЕНИЕ'',-100))',
        7);
    end;
    4 : begin
      qeRasx.SetSql('where',
        'n.tip = ( select oid from get_oid_objects_pc(''РАСХОДНЫЕ НАКЛАДНЫЕ НА УСЛУГИ'',-100)) and '
        +'n.id_sklad_to <>(select oid from spr_xozoper_vw x where x.name=''РАСХОДНАЯ НА УСЛУГИ ФАКТ ЧАСТЬ'')',
        7);
    end;
  end;
end;

procedure TfrmSkladRasxBux.frRasxBeginDoc(Sender: TObject);
begin
  //прячем грид для ускорения
  udgRasx.Visible := false;
  actItogo.Execute;
end;

procedure TfrmSkladRasxBux.frRasxEndDoc(Sender: TObject);
begin
  //восстанавливаем грид после отчёта
  udgRasx.Visible := true;
end;


end.
