unit SebMain3;
{Формы ввода. Себестоимость.}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, ToolWin, ComCtrls, Grids, DBGrids,
  ExtCtrls, Buttons,DB,
  Mask,Math,
  untEx,
  untRound,//rroundto
  SqlTimSt,//datetosqltimestamp
  DateUtils,//startofthemonth
  untRealPrice, //TfrmRealPrice
  untPrixDet, //TfrmPrixDet
  //custom units
  untSettings, untPosit, ActnList, QueryExtender, DBTables,
   FMTBcd, PropFilerEh, Menus, UnfFilter, PropStorageEh, DBClient,
  Provider, SqlExpr,   GridsEh, DBGridEh, frxClass,
  SettingsPlugin, //TfmSettingsPlugin
  frxDBSet,
  AtsAssert, DBCtrlsEh //AssertInternal

  ;

type
  TfrmSebMain3 = class(TForm)
    ActionList1: TActionList;
    actSettings: TAction;
    actKurs: TAction;
    dsNaklo: TDataSource;
    qeQuery2: TQueryExtender;
    dsNaklot: TDataSource;
    qeQuery3: TQueryExtender;
    dsPrice: TDataSource;
    qePrice: TQueryExtender;
    actPreview: TAction;
    actRefresh: TAction;
    frRepSebest: TfrxReport;
    frDBNaklo: TfrxDBDataset;
    frDBNaklot: TfrxDBDataset;
    frRepDoxod: TfrxReport;
    SQLDataSet1: TSQLDataSet;
    DataSetProvider1: TDataSetProvider;
    qurQuery1: TClientDataSet;
    qurQuery1ID: TStringField;
    qurQuery1DAT: TSQLTimeStampField;
    qurQuery1ID_NAKL: TIntegerField;
    qurQuery1ID_IZG: TIntegerField;
    qurQuery1ID_ZAK: TIntegerField;
    qurQuery1ID_MANAGER: TIntegerField;
    qurQuery1KURS2: TFloatField;
    qurQuery1NDS: TFloatField;
    qurQuery1TARA: TFloatField;
    qurQuery1NDS_FACT: TFloatField;
    qurQuery1OBOROT: TFloatField;
    qurQuery1NDS_SEBEST: TFloatField;
    qurQuery1NDS_SEBEST2: TFloatField;
    qurQuery1OPLACH: TFloatField;
    qurQuery1OPLACH_ZA_PERIOD: TFloatField;
    qurQuery1PERC_OPLACH: TFloatField;
    qurQuery1MAX_DOXOD: TFloatField;
    qurQuery1MAX_DOXOD_OPL: TFloatField;
    qurQuery1VYPL_DOXOD: TFloatField;
    qurQuery1DOXOD: TFloatField;
    qurQuery1RENT: TFloatField;
    qurQuery1IZG: TStringField;
    qurQuery1ZAK: TStringField;
    qurQuery1MANAGER: TStringField;
    DataSetProvider2: TDataSetProvider;
    SQLDataSet2: TSQLDataSet;
    qurQuery3: TClientDataSet;
    qurQuery3ID_POS: TIntegerField;
    qurQuery3ID_NAKLD: TIntegerField;
    qurQuery3ID_TOVAR: TIntegerField;
    qurQuery3TARA: TIntegerField;
    qurQuery3NALOG_NDS: TFMTBCDField;
    qurQuery3KURS: TFloatField;
    qurQuery3KURS2: TFloatField;
    qurQuery3SKIDKA: TFMTBCDField;
    qurQuery3CENA: TFMTBCDField;
    qurQuery3KOLOTP: TFloatField;
    qurQuery3CENA_SEBEST: TFMTBCDField;
    qurQuery3TOVAR: TStringField;
    qurQuery3SUM_GRN_NDS: TFloatField;
    qurQuery3SSUM_YE_NDS: TFloatField;
    qurQuery3NDS_SEBEST: TFloatField;
    qurQuery3CENA_GRN: TFMTBCDField;
    qurQuery3DOXOD: TFloatField;
    qurQuery3PERCENT: TFloatField;
    PropStorageEh1: TPropStorageEh;
    RegPropStorageManEh1: TRegPropStorageManEh;
    qurQuery3DAT: TSQLTimeStampField;
    UnfFilter1: TUnfFilter;
    UnfFilter2: TUnfFilter;
    sdsPremiyaVypl: TSQLDataSet;
    actPremiyaVypl: TAction;
    actRealPrice: TAction;
    SQLDataSet2ID_POS: TIntegerField;
    SQLDataSet2ID_NAKLD: TIntegerField;
    SQLDataSet2ID_TOVAR: TIntegerField;
    SQLDataSet2TARA: TIntegerField;
    SQLDataSet2NALOG_NDS: TFMTBCDField;
    SQLDataSet2KURS: TFloatField;
    SQLDataSet2KURS2: TFloatField;
    SQLDataSet2SKIDKA: TFMTBCDField;
    SQLDataSet2CENA: TFMTBCDField;
    SQLDataSet2KOLOTP: TFloatField;
    SQLDataSet2CENA_SEBEST: TFMTBCDField;
    SQLDataSet2CENA_GRN: TFMTBCDField;
    SQLDataSet2DAT: TSQLTimeStampField;
    SQLDataSet2SUM_GRN_NDS: TFloatField;
    SQLDataSet2SSUM_YE_NDS: TFloatField;
    SQLDataSet2NDS_SEBEST: TFloatField;
    SQLDataSet2DOXOD: TFloatField;
    SQLDataSet2PERCENT: TFloatField;
    Panel1: TPanel;
    btnSettings: TBitBtn;
    cbxPreview: TComboBox;
    btnPreview: TBitBtn;
    btnRefresh: TButton;
    BitBtn2: TBitBtn;
    DBGridEh1: TDBGridEh;
    Splitter1: TSplitter;
    Panel2: TPanel;
    DBGridEh2: TDBGridEh;
    BitBtn1: TBitBtn;
    actPrixDet: TAction;
    PopupMenu2: TPopupMenu;
    actSebestDet: TAction;
    SQLDataSet2ID_SKLAD: TIntegerField;
    qurQuery3ID_SKLAD: TIntegerField;
    N1: TMenuItem;
    PopupMenu1: TPopupMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    SQLDataSet2PRICE_MINUS_18_COMPARE: TFloatField;
    qurQuery3PRICE_MINUS_18_COMPARE: TFloatField;
    actShowRepPrice: TAction;
    SQLDataSet2ID_ANALOG: TIntegerField;
    qurQuery3ID_ANALOG: TIntegerField;
    actShowNaklr: TAction;
    N4: TMenuItem;
    actShowNaklo: TAction;
    N5: TMenuItem;
    actKurs1: TMenuItem;
    N6: TMenuItem;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    mnuRefresh: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    SQLDataSet2CENA_GRN_NDS: TFMTBCDField;
    qurQuery3CENA_GRN_NDS: TFMTBCDField;
    Label1: TLabel;
    pnlMaxSkidka: TPanel;
    dbeMaxSkidka: TDBNumberEditEh;
    Label2: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure actSettingsExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actKursExecute(Sender: TObject);

//    procedure actSebestExecute(Sender: TObject);
    procedure actPreviewExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure frRepSebestGetValue(const ParName: String;
      var ParValue: Variant);
    procedure frRepDoxodGetValue(const ParName: String;
      var ParValue: Variant);
    procedure cbxPreviewChange(Sender: TObject);
    procedure qurQuery1AfterScroll(DataSet: TDataSet);
    procedure DBGridEh2DblClick(Sender: TObject);
    procedure DBGridEh2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actRealPriceExecute(Sender: TObject);
    procedure actPrixDetExecute(Sender: TObject);
    procedure actSebestDetExecute(Sender: TObject);
    procedure actShowRepPriceExecute(Sender: TObject);
    procedure actShowNaklrExecute(Sender: TObject);
    procedure actShowNakloExecute(Sender: TObject);
    procedure dbeMaxSkidkaExit(Sender: TObject);
    //procedure actSebestExecute(Sender: TObject);


  private
    { Private declarations }
    setT : TfrmSettings;
    SettingsClient : TfmSettingsPlugin;
    procedure ProcessClient;
    procedure UpdateCaption;
    procedure ProcessSettings;
    procedure ProcessSkidkaFilter;
  public
    { Public declarations }
    function DefaultOpen: boolean;
  end;

var
  frmSebMain3: TfrmSebMain3;

implementation

uses untPrice, Kurs,
  SkladAux,//OpenDocument
  RepPrice, // TfrmRepPrice;
  SebestOstDet3, //TfrmSebestOstDet
  DesignReport //ProcessReportDesigner
  ;

{$R *.dfm}



procedure TfrmSebMain3.FormCreate(Sender: TObject);
begin
  setT :=TfrmSettings.Create(self);
  setT.actAllManagerOn.Execute;
  SettingsClient := setT.CreatePlugin('TfmSettingsClient');
  setT.AddPlugin(SettingsClient);
  ProcessReportDesigner(ActionList1,MainMenu1,frRepSebest);
  ProcessReportDesigner(ActionList1,MainMenu1,frRepDoxod);  
end;

//////////////////////////////////////////////////////
procedure TfrmSebMain3.actSettingsExecute(Sender: TObject);
begin
//  actSettings.checked := setT.ProcessSettingsChange(actRefresh);
  actSettings.checked := setT.ProcessSettingsChange2(DefaultOpen);
end;



procedure TfrmSebMain3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //qeItogo.Query.Close;
  qeQuery2.Query.Close;
  qeQuery3.Query.Close;
  Action := caFree;
end;


procedure TfrmSebMain3.actKursExecute(Sender: TObject);
var
  frmKurs : TfrmKurs ;
  curKurs : currency;
begin
  frmKurs := TfrmKurs.Create (Self);
  try
    curKurs := strtocurr (
    frmKurs.ShowForInput(
      qurQuery3.fieldbyname('dat').AsString,'usd'));
    DBGridEh2.DataSource.DataSet.Edit;
    DBGridEh2.SelectedField.AsCurrency := curKurs;
    DBGridEh2.DataSource.DataSet.Post;
  except
  end;
end;

procedure TfrmSebMain3.actPreviewExecute(Sender: TObject);
begin
  if (cbxPreview.ItemIndex=0) then begin
    qurQuery3.Filter:='((percent<=0) or (percent>80))';
    qurQuery3.Filtered:=True;
    dmdEx.GetReport('RepSebest3.fr3',frRepSebest);
    frRepSebest.ShowReport;
    qurQuery3.Filtered :=false;
  end;
  if (cbxPreview.ItemIndex=1) then begin
    dmdEx.GetReport('RepSebest3.fr3',frRepSebest);
    frRepSebest.ShowReport;
  end;
  if (cbxPreview.ItemIndex=2) then begin
    frRepDoxod.ShowReport;
  end;
  if (cbxPreview.ItemIndex=3) then begin
    dmdEx.GetReport('RepSebestMinPrice.fr3',frRepSebest);
    frRepSebest.ShowReport;
  end;
  if (cbxPreview.ItemIndex=4) then begin
    dmdEx.GetReport('RepSebestMinPriceWithSebest.fr3',frRepSebest);
    frRepSebest.ShowReport;
  end;
end;

procedure TfrmSebMain3.actRefreshExecute(Sender: TObject);
begin
  dmdEx.startwaiting;
  qeQuery2.Refresh;
  dmdEx.stopwaiting;
end;

function TfrmSebMain3.DefaultOpen: boolean;
begin
  ProcessSettings;
  CancelUpdates(qurQuery3);
	actRefresh.Execute;
  Result :=true;
  if not qurQuery1.Active then begin
    Result :=false;
  end;
end;

procedure TfrmSebMain3.frRepSebestGetValue(const ParName: String;
  var ParValue: Variant);
var
  strTemp : string;
begin
  if AnsiUpperCase(ParName) = 'REPORTTITLE' then begin

    if  qurQuery1.Filtered or qurQuery3.Filtered then begin
       strTemp :=' (фильтр)';
    end
    else begin
      strTemp := '';
    end;

    ParValue := 'Отчёт по себестоимости: '
      +setT.Manager + ' c ' + datetostr (setT.DateFrom)
      + ' по '+ datetostr(setT.DateTo) + strTemp;

  end;
end;

procedure TfrmSebMain3.frRepDoxodGetValue(const ParName: String;
  var ParValue: Variant);
begin
  if AnsiUpperCase(ParName) = 'REPORTTITLE' then begin
    ParValue := 'Отчёт по доходам: '
      +setT.Manager + ' c ' + datetostr (setT.DateFrom)
      + ' по '+ datetostr(setT.DateTo);
  end;

end;

procedure TfrmSebMain3.cbxPreviewChange(Sender: TObject);
begin
  if cbxPreview.ItemIndex in [0,1,2] then begin
    pnlMaxSkidka.Visible := false;
  end else begin
    pnlMaxSkidka.Visible := true;
  end;
  if (cbxPreview.ItemIndex=0) then begin
    qurQuery3.Filter:='((percent<=0) or (percent>80))';
    qurQuery3.Filtered:=True;
  end;
  if (cbxPreview.ItemIndex=1) then begin
    qurQuery3.Filtered :=false;
  end;
  if (cbxPreview.ItemIndex=2) then begin
    qurQuery3.Filtered :=false;
  end;
  if (cbxPreview.ItemIndex in [3,4]) then begin
    ProcessSkidkaFilter;
  end;
end;

procedure TfrmSebMain3.ProcessSkidkaFilter;
begin
    qurQuery3.Filter:='(price_minus_18_compare>' + FloatToStr(VarToDbl(dbeMaxSkidka.Value)) + ' and tara<>1) '+
      'or (price_minus_18_compare>0 and tara=1)';
    qurQuery3.Filtered:=True;
end;

procedure TfrmSebMain3.qurQuery1AfterScroll(DataSet: TDataSet);
begin
  if not DataSet.ControlsDisabled then begin
    qurQuery3.Close;
    qurQuery3.Params.ParamByName('id_nakl').AsInteger :=
      DataSet.FieldByName('id_nakl').AsInteger;
    qurQuery3.Open;
  end;//if
end;

procedure TfrmSebMain3.DBGridEh2DblClick(Sender: TObject);
begin
  if (DBGridEh2.SelectedField.FieldName = 'CENA_SEBEST') then begin
    actSebestDet.Execute;
  end;
  if (DBGridEh2.SelectedField.FieldName = 'KURS2') then begin
    actKurs.Execute;
  end;
  if (DBGridEh2.SelectedField.FieldName = 'PRICE_MINUS_18_COMPARE') then begin
    actShowRepPrice.Execute;
  end;
end;

procedure TfrmSebMain3.DBGridEh2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN : begin
      if (DBGridEh2.SelectedField.FieldName = 'CENA_SEBEST') then begin
        actSebestDet.Execute;
      end ; //if
      if (DBGridEh1.SelectedField.FieldName = 'KURS') then begin
        actKurs.Execute;
      end; //if
    end; //vk_return
  end; //case
end; 

procedure TfrmSebMain3.actRealPriceExecute(Sender: TObject);
begin
  frmRealPrice := TfrmRealPrice.Create(Application);
  frmRealPrice.qeNaklr.SetSQL('where','om.id_nakl='+
    qurQuery1.FieldByName('id_nakl').AsString,5);
  frmRealPrice.actRefresh.Execute;
end;

procedure TfrmSebMain3.actPrixDetExecute(Sender: TObject);
var
  frmPrixDet : TfrmPrixDet;
begin
	frmPrixDet := TfrmPrixDet.Create (Application);
	frmPrixDet.ShowDet(
    0,
		dsNaklo.DataSet.FieldByName('id_nakl').AsInteger
  );
end;

procedure TfrmSebMain3.actSebestDetExecute(Sender: TObject);
var
  frmSebestOstDet : TfrmSebestOstDet3;
  varCurrency :variant;
  varDate : variant;
begin
  frmSebestOstDet := TfrmSebestOstDet3.Create(Application);
  varCurrency := Null;
  varDate := Null;
  frmSebestOstDet.ShowDetail(
    2,
    qurQuery3.FieldByName('id_sklad').AsInteger,
    qurQuery3.FieldByName('id_tovar').AsInteger,
    varCurrency,
    varDate,
    Null,
    qurQuery3.FieldByName('id_nakld').asInteger
  );
end;


procedure TfrmSebMain3.ProcessClient;
begin
  dmdEx.SetIntegerParamValue(
    qurQuery1.Params.ParamByName('sub2_in'),
    setT.GetPluginResult('fmSettingsClient')
  );
end;

procedure TfrmSebMain3.UpdateCaption;
begin
  self.Caption :='Ввод себестоимости: '
    +setT.Manager + ' c ' + datetostr (setT.DateFrom)
    + ' по '+ datetostr(setT.DateTo);
    if setT.GetPluginResult('fmSettingsClient')<>'' then begin
      self.Caption := self.Caption +
        '. Клиент: '+setT.GetPluginTextResult('fmSettingsClient');
    end;
end;

procedure TfrmSebMain3.actShowRepPriceExecute(Sender: TObject);
var
  frmRepPrice : TfrmRepPrice;
  iCurrency : integer;
  iVlad : integer;
begin
  iCurrency :=dmdEx.GetIdCurrencyUAH;
  iVlad := dmdEx.GetDefaultVlad;
  frmRepPrice :=TfrmRepPrice.Create(Self);
  frmRepPrice.SetPost(iVlad);
  frmRepPrice.SetDate(dsNaklot.dataset.FieldByName('dat').AsDateTime);
  frmRepPrice.SetTovar(dsNaklot.dataset.FieldByName('id_analog').asInteger);
  //Валюта
  frmRepPrice.SetCurrency(iCurrency);
  frmRepPrice.actRefresh.execute;
end;



procedure TfrmSebMain3.actShowNaklrExecute(Sender: TObject);
var
  iNaklrTip : integer;
begin
  if dsNaklo.DataSet.Eof and dsNaklo.DataSet.Bof then begin
     exit;
  end;
  iNaklrTip := dmdEx.GetOidObjects('РАСХОДНЫЕ НАКЛАДНЫЕ',-100);
  OpenDocument(self,dsNaklo.DataSet.FieldByName('id_nakl').asInteger,iNaklrTip,0);
end;

procedure TfrmSebMain3.actShowNakloExecute(Sender: TObject);
var
  iTip : integer;
begin
  if dsNaklo.DataSet.Eof and dsNaklo.DataSet.Bof then begin
     exit;
  end;
  iTip := dmdEx.GetOidObjects('ТИП НАКЛАДНЫХ ДЛЯ СКЛАДА',-100);
  iTip := dmdEx.GetOidObjects('Отгрузка',iTip);
  OpenDocument(self,dsNaklo.DataSet.FieldByName('id_nakl').asInteger,iTip,0,true);
end;

procedure TfrmSebMain3.ProcessSettings;
begin
  if (setT.IDManager<>0) then begin
    qurQuery1.Params.ParamByName('sub3_in').asInteger := setT.IDManager;
  end
  else begin
    qurQuery1.Params.ParamByName('sub3_in').Clear;
  end;
  qurQuery1.Params.ParamByName('dat_from').asDate := setT.DateFrom;
  qurQuery1.Params.ParamByName('dat_to').asDate := setT.DateTo;
//    ProcessFirm;
  ProcessClient;
  UpdateCaption;
end;

procedure TfrmSebMain3.dbeMaxSkidkaExit(Sender: TObject);
begin
  ProcessSkidkaFilter;
end;

end.
