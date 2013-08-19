unit untRepMan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, ToolWin, ComCtrls, Grids, DBGrids,
  ExtCtrls, Buttons,DB,
  Mask,Math,

  //custom units
  untSettings,  ActnList, QueryExtender,
  DBTables,  FMTBcd, PropFilerEh, Menus, UnfFilter, PropStorageEh,
  DBClient, Provider, SqlExpr,   GridsEh, DBGridEh,
  frxClass, frxDBSet,
  untEx,
  untRealPrice, //TfrmRealPrice
  atsassert, 
  DateUtils, //startofthemonth
  SqlTimSt, //datetimetosqltimestamp
  SettingsPlugin, //TfmSettingsPlugin
  untPrixDet, //TfrmPrixDet
  untRound
  ;
  //untRepManag;

type
  TfrmRepMan = class(TForm)
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    actSettings: TAction;
    dtSource2: TDataSource;
    qeQuery2: TQueryExtender;
    dtSource3: TDataSource;
    qeQuery3: TQueryExtender;
    actPrepareReport: TAction;
    btnSettings: TBitBtn;
    btnPreview: TBitBtn;
    actSumsRecalc: TAction;
    actPrint: TAction;
    frDBNaklo: TfrxDBDataset;
    frDBOplaty: TfrxDBDataset;
    frDBNaklot: TfrxDBDataset;
    dtOplaty: TDataSource;
    qeOplaty: TQueryExtender;
    actRefresh: TAction;
    BitBtn1: TBitBtn;
    actPreview: TAction;
    BitBtn2: TBitBtn;
    actRealPrice: TAction;
    DBGridEh1: TDBGridEh;
    sdsQuery1: TSQLDataSet;
    sdsQuery2: TSQLDataSet;
    sdsQuery3: TSQLDataSet;
    dspQuery1: TDataSetProvider;
    dspQuery2: TDataSetProvider;
    dspQuery3: TDataSetProvider;
    cdsQuery1: TClientDataSet;
    cdsQuery2: TClientDataSet;
    cdsQuery3: TClientDataSet;
    cdsQuery1DAT: TSQLTimeStampField;
    cdsQuery1ID: TStringField;
    cdsQuery1ID_NAKL: TIntegerField;
    cdsQuery1ID_IZG: TIntegerField;
    cdsQuery1ID_ZAK: TIntegerField;
    cdsQuery1ID_MANAGER: TIntegerField;
    cdsQuery1NDS: TFloatField;
    cdsQuery1NDS_FACT: TFloatField;
    cdsQuery1TARA: TFloatField;
    cdsQuery1OTKAT: TFloatField;
    cdsQuery1OPLACH: TFloatField;
    cdsQuery1PERC_OPLACH: TFloatField;
    cdsQuery1MAX_PREM: TFloatField;
    cdsQuery1MAX_PREM_OPL: TFloatField;
    cdsQuery1VYPL_PREM: TFloatField;
    cdsQuery1PREMIYA: TFloatField;
    sdsQuery1DAT: TSQLTimeStampField;
    sdsQuery1ID: TStringField;
    sdsQuery1ID_NAKL: TIntegerField;
    sdsQuery1ID_IZG: TIntegerField;
    sdsQuery1ID_ZAK: TIntegerField;
    sdsQuery1ID_MANAGER: TIntegerField;
    sdsQuery1NDS: TFloatField;
    sdsQuery1NDS_FACT: TFloatField;
    sdsQuery1TARA: TFloatField;
    sdsQuery1OTKAT: TFloatField;
    sdsQuery1OPLACH: TFloatField;
    sdsQuery1PERC_OPLACH: TFloatField;
    sdsQuery1MAX_PREM: TFloatField;
    sdsQuery1MAX_PREM_OPL: TFloatField;
    sdsQuery1VYPL_PREM: TFloatField;
    sdsQuery1PREMIYA: TFloatField;
    cdsQuery1IZG: TStringField;
    cdsQuery1ZAK: TStringField;
    cdsQuery1MANAGER: TStringField;
    PropStorageEh2: TPropStorageEh;
    RegPropStorageManEh2: TRegPropStorageManEh;
    UnfFilter1: TUnfFilter;
    sdsQuery1COMMENT: TStringField;
    sdsQuery1OPLACH_ZA_PERIOD: TFloatField;
    cdsQuery2ID_POS: TIntegerField;
    cdsQuery2ID_TOVAR: TIntegerField;
    cdsQuery2CENA: TFMTBCDField;
    cdsQuery2KOLOTP: TFMTBCDField;
    cdsQuery2ID_NAKLD: TIntegerField;
    cdsQuery2ID_NAKL: TIntegerField;
    cdsQuery2SKIDKA: TFMTBCDField;
    cdsQuery2KODCN: TSmallintField;
    cdsQuery2KURS: TFloatField;
    cdsQuery2PARENT_ID_NAKL: TIntegerField;
    cdsQuery2NALOG_NDS: TFMTBCDField;
    cdsQuery2TOVAR: TStringField;
    DBGridEh2: TDBGridEh;
    cdsQuery1COMMENT: TStringField;
    cdsQuery1OPLACH_ZA_PERIOD: TFloatField;
    BitBtn3: TBitBtn;
    actPremiyaVypl: TAction;
    sdsPremiyaVypl: TSQLDataSet;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    cdsQuery3TRANSH: TFMTBCDField;
    cdsQuery3DAT: TSQLTimeStampField;
    cdsQuery3ID_TO: TIntegerField;
    BitBtn4: TBitBtn;
    actPrixDet: TAction;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    mnuRefresh: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    cdsQuery2TARA: TSmallintField;
    N5: TMenuItem;
    frReport1: TfrxReport;

    procedure FormCreate(Sender: TObject);
    procedure actSettingsExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
//    procedure actPrepareReportExecute(Sender: TObject);
//    procedure actSumsRecalcExecute(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure actRefreshExecute(Sender: TObject);
    procedure udgGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actRealPriceExecute(Sender: TObject);
    procedure actPreviewExecute(Sender: TObject);
    procedure DBGridEh1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actPremiyaVyplExecute(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure actPrixDetExecute(Sender: TObject);
    procedure frReport1BeginDoc(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);

  private
    { Private declarations }
    setT : TfrmSettings;
    SettingsManager : TfmSettingsPlugin;
    SettingsVlad : TfmSettingsPlugin;
    SettingsClient : TfmSettingsPlugin;

  public
    { Public declarations }
    procedure DefaultStartup;
    function DefaultOpen:boolean;

  end;

var
  frmRepMan: TfrmRepMan;

implementation

uses
  SkladAux, //UpdateCaption
  DesignReport //ProcessReportDesigner
  ;

{$R *.dfm}

procedure TfrmRepMan.FormCreate(Sender: TObject);
begin
  qeQuery2.DefSql:=sdsQuery1.CommandText;
  //Инициализация настроек
  setT := TfrmSettings.Create(self);
  setT.actManagerOff.execute;
  SettingsManager := setT.CreatePlugin('TfmSettingsManager');

  setT.AddPlugin(SettingsManager);
  //
  SettingsManager.SetResultType(3);
  //SettingsManager.SetKeyValue(dmdEx.GetIdManager);

  SettingsVlad := setT.CreatePlugin('TfmSettingsVlad');
  //Нельзя выбрать пустое значение, менеджеры только из разрешённого списка
  SettingsVlad.SetResultType(2);
  setT.AddPlugin(SettingsVlad);

  SettingsClient := setT.CreatePlugin('TfmSettingsClient');
  setT.addplugin(SettingsClient);

  //Конец инициализации настроек
  setT.setperiod(1);

  dmdEx.OpenQuery(dmdex.cdsAllClient);
  dmdEx.OpenQuery(dmdEx.cdsManager);
  ProcessReportDesigner(ActionList1,MainMenu1,frReport1);
end;

procedure TfrmRepMan.actSettingsExecute(Sender: TObject);
begin
//  actSettings.checked := setT.ProcessSettingsChange(actRefresh);
  actSettings.checked := setT.ProcessSettingsChange2(DefaultOpen);
end;

procedure TfrmRepMan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmdEx.CloseQuery(dmdex.cdsAllClient,false);
  dmdEx.CloseQuery(dmdEx.cdsManager,false);
  Action := caFree;
end;

{procedure TfrmRepMan.actSumsRecalcExecute(Sender: TObject);
var
  curNds , curPremOpl, curOplNakl,curPremAll : currency;
begin
  qeQuery2.Refresh;
  UdgGrid1.visible := false;
  qurQuery3.Close;
  qurQuery2.First;
  curNds := 0;
  curPremOpl := 0;
  curOplNakl := 0;
  curPremAll :=0;
  while not qurQuery2.Eof do begin
    curNds := curNds+qurQuery2.FieldByName('nds').AsCurrency;
    curPremOpl := curPremOpl +
      qurQuery2.fieldbyname('prem_opl').AsCurrency;
    curOplNakl := curOplNakl +
      qurQuery2.fieldbyname('opl_nakl').AsCurrency;
    curPremAll := curPremAll +
      qurQuery2.fieldbyname('prem_all').AsCurrency;
    qurQuery2.Next;
  end;
  edtOplNakl.Text := format ('%6.2f',[curOplNakl]);
  edtPremOpl.Text :=format ('%6.2f',[curPremOpl]);
  edtNdsAll.Text :=format ('%6.2f',[curNds]);
  edtPremAll.Text := format ('%6.2f',[curPremAll]);
  qurQuery3.Open;
  UdgGrid1.visible := true;

  showmessage ('Сумма+НДС = '+format ('%6.2f',[curNds])+chr(10)+chr(13)+
    'Максимальная премия = ' + format ('%6.2f',[curPremAll])+chr(10)+chr(13)+
    'Сумма оплат = '+ format ('%6.2f',[curOplNakl])+chr(10)+chr(13)+
    'Фактическая премия = ' +format ('%6.2f',[curPremOpl])
  );

end;
}


procedure TfrmRepMan.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
var
  strTemp : string;
begin
  if AnsiUpperCase(ParName) = 'TITLE' then begin
    if  cdsQuery1.Filtered then begin
      strTemp :=' (фильтр)';
    end else begin
      strTemp := '';
    end;
    ParValue := 'Отчёт по менеджеру: '
      +setT.GetPluginTextResult('fmSettingsManager') + ' c ' + datetostr (setT.DateFrom)
      + ' по '+ datetostr(setT.DateTo) + strTemp;
  end;
end;



procedure TfrmRepMan.actRefreshExecute(Sender: TObject);
begin
try
  dmdEx.StartWaiting;
  cdsQuery1.Close;
  //чтобы при нажатии кнопки обновлялись данные с сервера, а не закрывался ClientDataset
  sdsQuery1.Close;
  {
  cdsQuery1.Close;
  //чтобы при нажатии кнопки обновлялись данные с сервера, а не закрывался ClientDataset
  sdsQuery1.Close;
  self.Caption := UpdateCaptionVladClientManager('Отчёт по менеджеру:',setT);

  cdsQuery1.Params.ParamByName('date_from').AsDate:=setT.DateFrom;
  cdsQuery1.Params.ParamByName('date_to').AsDate:=setT.DateTo;
  dmdEx.SetIntegerParamValue(
    cdsQuery1.Params.ParamByName('id_manager_in'),
    setT.GetPluginResult('fmSettingsManager'));
  dmdEx.SetIntegerParamValue(
    cdsQuery1.Params.ParamByName('id_izg_in'),
    setT.GetPluginResult('fmSettingsVlad'));
  dmdEx.SetIntegerParamValue(
    cdsQuery1.Params.ParamByName('id_zak_in'),
    setT.GetPluginResult('fmSettingsClient'));
    }
  cdsQuery1.Open;
  cdsQuery2.Open;
  dmdEx.StopWaiting;
except
  AssertInternal('378D050F-F3C9-455F-BFC0-2DA532F942E0')
end;
end;

procedure TfrmRepMan.udgGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return: begin
      actRealPrice.Execute;
    end;//vk_return
  end;//case
end;

procedure TfrmRepMan.actRealPriceExecute(Sender: TObject);
begin
  frmRealPrice := TfrmRealPrice.Create(Application);
  frmRealPrice.qeNaklr.SetSQL('where','om.id_nakl='+
    cdsQuery1.FieldByName('id_nakl').AsString,5);
  frmRealPrice.actRefresh.Execute;
end;

procedure TfrmRepMan.actPreviewExecute(Sender: TObject);
begin
try
  dmdEx.GetReport('RepManager.fr3',frReport1);
  frReport1.ShowReport;
except
  AssertInternal('D119330B-FFC4-40E2-BCB5-BF0655472B1D');
end;
end;

procedure TfrmRepMan.DBGridEh1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return: begin
      actRealPrice.Execute;
    end;//vk_return
  end;//case
end;


procedure TfrmRepMan.actPremiyaVyplExecute(Sender: TObject);
begin
  if MessageDlg('Вы уверены что хотите выплатить премию по всем накладным из '
    +'данного отчёта',mtConfirmation, mbOKCancel,0)<>mrOk then begin
    exit;
  end;
  if setT.DateTo != EndOfTheMonth(setT.DateTo) then begin
    MessageDlg('Дата окончания периода отчёта не совпадает с концом месяца.');
    exit;
  end;
  if setT.DateFrom != StartOfTheMonth(setT.DateFrom) then begin
    MessageDlg('Дата начала периода отчёта не совпадает с началом месяца.');
    exit;
  end;

  try
  cdsQuery2.Close;
  cdsQuery3.Close;
  cdsQuery1.first;
  while not cdsQuery1.eof do begin
      sdsPremiyaVypl.Params.parambyName('id_nakl').asInteger :=
        cdsQuery1.FieldByName('id_nakl').AsInteger;

      sdsPremiyaVypl.Params.parambyName('dat').AsSQLTimeStamp:=
        DateTimeToSQLTimeStamp(
        StartOfTheMonth(
         IncMonth(cdsQuery1.Params.parambyname('date_to').AsDateTime,1)
        ));

      sdsPremiyaVypl.Params.parambyName('premiya').AsCurrency :=
        cdsQuery1.FieldByName('premiya').AsCurrency;

      dmdEx.ExecSQL(sdsPremiyaVypl,false);
    cdsQuery1.next;
  end; //while
  finally
    begin
      cdsQuery2.Open;
      cdsQuery3.Open;
    end;
  end;//try finally

end;

procedure TfrmRepMan.DBGridEh1DblClick(Sender: TObject);
begin
  actRealPrice.Execute;
end;

procedure TfrmRepMan.actPrixDetExecute(Sender: TObject);
var
  frmPrixDet : TfrmPrixDet;
begin
	frmPrixDet := TfrmPrixDet.Create (Application);
	frmPrixDet.ShowDet(
    0,
		dtSource2.DataSet.FieldByName('id_nakl').AsInteger
  );
end;

procedure TfrmRepMan.DefaultStartup;
begin
  SettingsManager.SetKeyValue(dmdEx.GetIdManager);
end;

function TfrmRepMan.DefaultOpen: boolean;
begin
  cdsQuery1.Close;
  //чтобы при нажатии кнопки обновлялись данные с сервера, а не закрывался ClientDataset
  sdsQuery1.Close;
  self.Caption := UpdateCaptionVladClientManager('Отчёт по менеджеру:',setT);

  cdsQuery1.Params.ParamByName('date_from').AsDate:=setT.DateFrom;
  cdsQuery1.Params.ParamByName('date_to').AsDate:=setT.DateTo;
  dmdEx.SetIntegerParamValue(
    cdsQuery1.Params.ParamByName('id_manager_in'),
    setT.GetPluginResult('fmSettingsManager'));
  dmdEx.SetIntegerParamValue(
    cdsQuery1.Params.ParamByName('id_izg_in'),
    setT.GetPluginResult('fmSettingsVlad'));
  dmdEx.SetIntegerParamValue(
    cdsQuery1.Params.ParamByName('id_zak_in'),
    setT.GetPluginResult('fmSettingsClient'));

	actRefresh.Execute;
  Result :=true;
  if not cdsQuery1.Active then begin
    Result :=false;
  end;
end;  

procedure TfrmRepMan.frReport1BeginDoc(Sender: TObject);
begin
  cdsQuery3.Open;
end;

procedure TfrmRepMan.actPrintExecute(Sender: TObject);
begin
try
  dmdEx.GetReport('RepManagerShort.fr3',frReport1);
  frReport1.ShowReport;
except
  AssertInternal('DD5E9A37-FD37-4BF0-A7C1-20A35A3D7434');
end;
end;

end.
