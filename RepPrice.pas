unit RepPrice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DB, DBClient, Provider, SqlExpr, QueryExtender,
  PropFilerEh, Menus, PropStorageEh, UnfFilter, ActnList, GridsEh,
  DBGridEh, ExtCtrls, AutoPnl, StdCtrls, Buttons,
  Grids,
  untEx,
  untSettings,
  SettingsPlugin, //TfmSettingsPlugin
  SettingsDate, //TfmSettingsDate
  atsAssert, //AssertInternal
  untRound, //ColumnByName
  SettingsDataset, //TfmSettingsDataset
  RepSkladBuxDet, //TfrmRepSkladBuxDet
  DateUtils, //Endofthemonth
  PriceChangeDet, //TfrmPriceChangeDet
  SkidkaChangeDet, //TfrmSkidkaChangeDet
  SettingsTipGroup ,//TfmSettingsTipGroup
  SettingsNumber ,//TfrmSettingsNumber
  UslPostavkaChangeDet //TfrmUslPostavkaChangeDet

  ;

type
  TfrmRepPrice = class(TForm)
    GroupBox1: TGroupBox;
    AutoPanel1: TAutoPanel;
    dbgRep: TDBGridEh;
    ActionList1: TActionList;
    actSettings: TAction;
    actDetail: TAction;
    actRefresh: TAction;
    actDebug: TAction;
    UnfFilter1: TUnfFilter;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    mnuRefresh: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    qeRep: TQueryExtender;
    sdsRep: TSQLDataSet;
    dspRep: TDataSetProvider;
    cdsRep: TClientDataSet;
    dsRep: TDataSource;
    actShowColumnsSum: TAction;
    actShowColumnsKolotp: TAction;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn6: TBitBtn;
    cdsRepID_TOVAR: TIntegerField;
    cdsRepID_PRICE: TIntegerField;
    cdsRepID_CURRENCY: TIntegerField;
    cdsRepINCLUDE_NDS: TIntegerField;
    cdsRepDAT: TSQLTimeStampField;
    cdsRepID_NAKL: TIntegerField;
    cdsRepTIP: TIntegerField;
    cdsRepCENA: TFloatField;
    cdsRepKURS: TFloatField;
    cdsRepCENA_FROM: TFloatField;
    cdsRepCURRENCY: TStringField;
    cdsRepTOVAR: TStringField;
    cdsRepPRICE: TStringField;
    sdsPriceChangeInsert: TSQLDataSet;
    sdsNaklot: TSQLDataSet;
    sdsNaklotID_NAKLD: TIntegerField;
    sdsNaklotID_NAKL: TIntegerField;
    sdsNaklotID_POS: TIntegerField;
    sdsNaklotID_TOVAR: TIntegerField;
    sdsNaklotCENA: TFMTBCDField;
    sdsNaklotID_SEBEST: TIntegerField;
    dspNaklot: TDataSetProvider;
    cdsNaklot: TClientDataSet;
    cdsNaklotID_NAKLD: TIntegerField;
    cdsNaklotID_NAKL: TIntegerField;
    cdsNaklotID_POS: TIntegerField;
    cdsNaklotID_TOVAR: TIntegerField;
    cdsNaklotTOVAR: TStringField;
    cdsNaklotCENA: TFMTBCDField;
    cdsNaklotID_SEBEST: TIntegerField;
    cdsNaklotPRICE: TStringField;
    dsNaklot: TDataSource;
    cdsRepKURS_INDIRECT: TIntegerField;
    cdsRepSKIDKA: TFloatField;
    cdsRepID_SKIDKA: TIntegerField;
    cdsRepID_POST: TIntegerField;
    cdsRepPOST: TStringField;
    sdsSkidkaChangeInsert: TSQLDataSet;
    sdsSkidkaChangeDet: TSQLDataSet;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    sdsNaklotSKIDKA: TFMTBCDField;
    IntegerField5: TIntegerField;
    dspSkidkaChangeDet: TDataSetProvider;
    cdsSkidkaChangeDet: TClientDataSet;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    IntegerField9: TIntegerField;
    StringField1: TStringField;
    IntegerField10: TIntegerField;
    StringField2: TStringField;
    cdsNaklotSKIDKA: TFMTBCDField;
    dsSkidkaChangeDet: TDataSource;
    cdsRepZATRATY: TFloatField;
    cdsRepID_USL_POSTAVKA: TIntegerField;
    cdsRepUSL_POSTAVKA: TStringField;
    cdsRepSKIDKA_SPR: TStringField;
    cdsRepID_ANALOG: TIntegerField;
    sdsUslPostavkaChangeInsert: TSQLDataSet;
    cdsRepZAKUPKA: TFloatField;
    psGrid: TPropStorageEh;
    RegPropStorageManEh1: TRegPropStorageManEh;
    cdsRepTRANSPORT: TFloatField;
    cdsRepTARA: TFloatField;
    cdsRepVALUTA: TFloatField;
    cdsRepTAMOGNYA: TFloatField;
    cdsRepPROCENT_PREDOPL: TFloatField;
    cdsRepOTSROCHKA: TFloatField;
    cdsRepSTAVKA_BANKA: TFloatField;
    actCreateUslPostavkaChange: TAction;
    ppmRep: TPopupMenu;
    N5: TMenuItem;
    actCreateSkidkaChange: TAction;
    N6: TMenuItem;
    actCreatePriceChange: TAction;
    actCreatePriceChange1: TMenuItem;
    cdsRepSKIDKA_ID_NAKL: TIntegerField;
    cdsRepUSL_POSTAVKA_ID_NAKL: TIntegerField;
    cdsRepTOVAR_EXACT: TStringField;
    sdsPost: TSQLDataSet;
    dspPost: TDataSetProvider;
    cdsPostWithPrice: TClientDataSet;
    cdsPostWithPriceID: TIntegerField;
    cdsPostWithPriceNAME: TStringField;
    dsPostWithPrice: TDataSource;
    procedure actRefreshExecute(Sender: TObject);
    procedure actSettingsExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
     procedure actDetailExecute(Sender: TObject);
    procedure actDebugExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgRepKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgRepDblClick(Sender: TObject);
    procedure cdsNaklotAfterInsert(DataSet: TDataSet);
    procedure cdsNaklotBeforeInsert(DataSet: TDataSet);
    procedure cdsNaklotReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsSkidkaChangeDetAfterInsert(DataSet: TDataSet);
    procedure cdsSkidkaChangeDetBeforeInsert(DataSet: TDataSet);
    procedure cdsUslPostavkaChangeDetAfterInsert(DataSet: TDataSet);
    procedure cdsUslPostavkaChangeDetBeforeInsert(DataSet: TDataSet);
    procedure cdsNaklotBeforePost(DataSet: TDataSet);
    procedure cdsSkidkaChangeDetBeforePost(DataSet: TDataSet);
    procedure cdsUslPostavkaChangeDetBeforePost(DataSet: TDataSet);
    procedure actCreateUslPostavkaChangeExecute(Sender: TObject);
    procedure actCreateSkidkaChangeExecute(Sender: TObject);
    procedure actCreatePriceChangeExecute(Sender: TObject);
  private
    { Private declarations }
    setT: TfrmSettings;
    SettingsTovar : TfmSettingsPlugin;
    SettingsDataset : TfmSettingsDataset;
    SettingsDate : TfmSettingsDate;
    SettingsDataset2 : TfmSettingsDataset;
    SettingsNumber : TfmSettingsNumber;
  	frmDet : TfrmPriceChangeDet;
    frmDetSkidka: TfrmSkidkaChangeDet;
    frmDetUslPostavka : TfrmUslPostavkaChangeDet;
    iNpp : integer;
    iNppSkidka : integer;
    iNakl : integer;
    iNaklSkidka : integer;//номер изменения скидки в которую
       //сейчас вбивают изменения
    iNaklUslPostavka : integer;//номер изменения условий поставки
    iNppUslPostavka : integer;
    procedure ProcessPost;
    procedure ProcessTovar;
    procedure ProcessDate;
    procedure ProcessColumns;
    procedure ProcessCurrency;
    procedure ProcessKurs;
    //procedure ProcessGroup;


    procedure UpdateCaption;
    procedure FillPost;
    procedure FillTovar;
    procedure FillCurrency;
    procedure FillDate;
    procedure FillKurs;
    //procedure FillGroup;
    procedure AddPositionUslPostavka(DataSet:TDataSet);
    procedure AddPositionSkidka(DataSet:TDataSet);
    procedure AddPositionPrice(DataSet:TDataSet);
  public
    { Public declarations }
    procedure SetTovar(IdTovar : variant);
    procedure SetDate(Date : variant);
    procedure SetCurrency(IdCurrency: variant);
    procedure SetPost(IdPost : variant);
    procedure SetKurs(vKurs: variant);
  end;

var
  frmRepPrice: TfrmRepPrice;

implementation

uses UslPostavkaChange, SkidkaChange, PriceChange;

{$R *.dfm}

//uses
  //RepSkladBux, untSklost,
  //NaklpBux, Naklr
  //;


procedure TfrmRepPrice.actRefreshExecute(Sender: TObject);
begin
try
	dmdEx.StartWaiting;
  if cdsRep.Active then begin
    psGrid.SaveProperties;
  end;
  cdsRep.Close;
  ProcessDate;
  ProcessPost;
  ProcessTovar;
  ProcessCurrency;
  ProcessKurs;
	qeRep.Refresh;
  ProcessColumns;
  psGrid.LoadProperties;
  UpdateCaption;
	dmdEx.StopWaiting;
except
  AssertInternal('BDA207A1-21D8-407B-88E1-17A3ACC32153');
end;
end;

procedure TfrmRepPrice.actSettingsExecute(Sender: TObject);
begin
  actSettings.checked := setT.ProcessSettingsChange(actRefresh);
end;

procedure TfrmRepPrice.ProcessPost;
var
  sTemp : string;
begin
  sTemp := setT.GetPluginResult('fmSettingsDataset2');
  if sTemp = '' then begin
    cdsRep.Params.ParamByName('id_post_in').Clear;
  end else begin
    cdsRep.Params.ParamByName('id_post_in').AsString := sTemp;
  end; //if все прайсы
end;

procedure TfrmRepPrice.ProcessTovar;
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

procedure TfrmRepPrice.ProcessCurrency;
var
  sTemp : string;
begin
  sTemp := setT.GetPluginResult('fmSettingsDataset');
  if sTemp = '' then begin
    cdsRep.Params.ParamByName('id_currency_in').Clear;
  end else begin
    cdsRep.Params.ParamByName('id_currency_in').AsString := sTemp;
  end;
end;

procedure TfrmRepPrice.ProcessDate;
var
  sTemp : string;
  dTo : Tdate;
begin
  sTemp := setT.GetPluginResult('fmSettingsDate');
  if sTemp = '' then begin
    cdsRep.Params.ParamByName('dat_in').Clear;
  end else begin
    dTo := strtodate(sTemp);
    cdsRep.Params.ParamByName('dat_in').AsDate := dTo;
  end;
end;

procedure TfrmRepPrice.UpdateCaption;
var
  sCaption,sTemp : string;
begin
  sCaption :=  'Отчёт по ценам на ' +
    setT.GetPluginTextResult('fmSettingsDate');
  sTemp := setT.GetPluginTextResult('fmSettingsDataset');
  if sTemp<>'' then begin
    sCaption := sCaption+'. Валюта: '+ sTemp;
  end;
  sTemp := setT.GetPluginTextResult('fmSettingsDataset2');
  if sTemp <>'' then begin
    sCaption := sCaption+'. Поставщик: '+ sTemp;
  end;
  sTemp := setT.GetPluginTextResult('fmSettingsTovar');
  if sTemp <>'' then begin
    sCaption := sCaption+'. Товар: '+ sTemp;
  end;
  sTemp := setT.GetPluginTextResult('fmSettingsNumber');
  if sTemp <>'' then begin
    sCaption := sCaption+'. Курс: '+ sTemp;
  end;
  self.Caption := sCaption;
end;

procedure TfrmRepPrice.actDetailExecute(Sender: TObject);
var
  frmPriceChange : TfrmPriceChange;
  frmSkidkaChange : TfrmSkidkaChange;
  frmUslPostavkaChange : TfrmUslPostavkaChange;
begin
try
  if (cdsRep.eof and cdsRep.bof) then begin
    exit;
  end;
  if AnsiUpperCase(dbgRep.SelectedField.FieldName)=
    AnsiUpperCase('CENA_FROM') then begin
    try
      if cdsRep.FieldByName('id_price').IsNull then begin
        MessageDlg ('Для данного поставщика не указан прайс',mtWarning,[mbOK],0);
        exit;
      end;
      if dsRep.DataSet.FieldByName('id_nakl').isNull then begin
        MessageDlg ('Пустое значение. Нечего показывать в детализации',mtWarning,[mbOK],0);
        exit;
      end;
      frmPriceChange := TfrmPriceChange.Create(Application);
      frmPriceChange.qeNaklo.SetSQL(
        'where',
        'id_nakl=(select id_nakl from naklot ot where ot.id_nakld='+
        dsRep.DataSet.FieldByName('id_nakl').asString+')',
        0);
      frmPriceChange.DefaultOpen;
      frmPriceChange.dsNaklot.dataset.Locate('id_nakld',dsRep.DataSet.FieldByName('id_nakl').asString,[]);
    except
      AssertInternal('50478DF9-1424-45A7-84DB-C6654C03EDFF');
    end;
  end;
  if AnsiUpperCase(dbgRep.SelectedField.FieldName)=
    AnsiUpperCase('SKIDKA') then begin
    try
      if  cdsRep.FieldByName('id_skidka').IsNull then begin
        MessageDlg ('Для данного поставщика не указана скидочная политика',mtWarning,[mbOK],0);
        exit;
      end;
      if dsRep.DataSet.FieldByName('skidka_id_nakl').isNull then begin
        MessageDlg ('Пустое значение. Нечего показывать в детализации',mtWarning,[mbOK],0);
        exit;
      end;
      frmSkidkaChange := TfrmSkidkaChange.Create(Application);
      frmSkidkaChange.qeNaklo.SetSQL(
        'where',
        'id_nakl=(select id_nakl from naklot ot where ot.id_nakld='+
        dsRep.DataSet.FieldByName('skidka_id_nakl').asString+')',
        0);
      frmSkidkaChange.actRefresh.Execute; //.DefaultOpen;

      frmSkidkaChange.dsNaklot.dataset.Locate('id_nakld',dsRep.DataSet.FieldByName('skidka_id_nakl').asString,[]);
    except
      AssertInternal('B4DF1243-E665-47BF-8C64-6A9AB88144B7');
    end;
  end;
  if (AnsiUpperCase(dbgRep.SelectedField.FieldName)=
    AnsiUpperCase('ZATRATY')) or
    (AnsiUpperCase(dbgRep.SelectedField.FieldName)=
    AnsiUpperCase('TRANSPORT')) or
    (AnsiUpperCase(dbgRep.SelectedField.FieldName)=
    AnsiUpperCase('TARA')) or
    (AnsiUpperCase(dbgRep.SelectedField.FieldName)=
    AnsiUpperCase('VALUTA')) or
   (AnsiUpperCase(dbgRep.SelectedField.FieldName)=
    AnsiUpperCase('TAMOGNYA')) or
   (AnsiUpperCase(dbgRep.SelectedField.FieldName)=
    AnsiUpperCase('PROCENT_PREDOPL')) or
   (AnsiUpperCase(dbgRep.SelectedField.FieldName)=
    AnsiUpperCase('OTSROCHKA')) or
   (AnsiUpperCase(dbgRep.SelectedField.FieldName)=
    AnsiUpperCase('STAVKA_BANKA'))
  then begin
    try
      if  cdsRep.FieldByName('id_usl_postavka').IsNull then begin
        MessageDlg ('Для данного поставщика не указаны условия поставки',mtWarning,[mbOK],0);
        exit;
      end;
      if dsRep.DataSet.FieldByName('usl_postavka_id_nakl').isNull then begin
        MessageDlg ('Пустое значение. Нечего показывать в детализации',mtWarning,[mbOK],0);
        exit;
      end;
      frmUslPostavkaChange := TfrmUslPostavkaChange.Create(Application);
      frmUslPostavkaChange.qeNaklo.SetSQL(
        'where',
        'id_nakl=(select id_nakl from naklot ot where ot.id_nakld='+
        dsRep.DataSet.FieldByName('usl_postavka_id_nakl').asString+')',
        0);
      frmUslPostavkaChange.DefaultOpen;
      frmUslPostavkaChange.dsNaklot.dataset.Locate('id_nakld',dsRep.DataSet.FieldByName('usl_postavka_id_nakl').asString,[]);
    except
      AssertInternal('262EEA37-2ABA-4BF8-91CC-53F0AD1FEF56');
    end;
  end;
except
  AssertInternal('FC5467A4-8DA6-4D51-A52B-00B1DA649185');
end;
end;


procedure TfrmRepPrice.ProcessColumns;
var
  sTemp : string;
begin
  //sTemp := setT.GetPluginResult('fmSettingsDate');
  //дата документа отображается если только
  //отчёт идёт за всю историю, а не за конкретную дату
  //if sTemp='' then begin
  cdsRep.FieldByName('dat').Visible := true;
  //end else begin
  //  cdsRep.FieldByName('dat').Visible := false;
  //end;
  sTemp := setT.GetPluginResult('fmSettingsDataset');
  //если валюта отчёта не указывать, то
  //важно знать в какой валюте данный прайс
  if sTemp='' then begin
    cdsRep.FieldByName('currency').Visible := true;
    cdsRep.FieldByName('CENA').Visible := false;
    cdsRep.FieldByName('KURS').Visible := false;
    cdsRep.FieldByName('SKIDKA').Visible := false;
    cdsRep.FieldByName('TRANSPORT').Visible := false;
    cdsRep.FieldByName('TARA').Visible := false;
    cdsRep.FieldByName('VALUTA').Visible := false;
    cdsRep.FieldByName('TAMOGNYA').Visible := false;
    cdsRep.FieldByName('PROCENT_PREDOPL').Visible := false;
    cdsRep.FieldByName('OTSROCHKA').Visible := false;
    cdsRep.FieldByName('STAVKA_BANKA').Visible := false;
    cdsRep.FieldByName('ZATRATY').Visible := false;
  end else begin
    cdsRep.FieldByName('currency').Visible := true;
    cdsRep.FieldByName('CENA').Visible := true;
    cdsRep.FieldByName('KURS').Visible := true;
    cdsRep.FieldByName('SKIDKA').Visible := true;
    cdsRep.FieldByName('TRANSPORT').Visible := true;
    cdsRep.FieldByName('TARA').Visible := true;
    cdsRep.FieldByName('VALUTA').Visible := true;
    cdsRep.FieldByName('TAMOGNYA').Visible := true;
    cdsRep.FieldByName('PROCENT_PREDOPL').Visible := true;
    cdsRep.FieldByName('OTSROCHKA').Visible := true;
    cdsRep.FieldByName('STAVKA_BANKA').Visible := true;
    cdsRep.FieldByName('ZATRATY').Visible := true;
  end;
  ColumnByName(dbgRep.Columns,'INCLUDE_NDS').KeyList.Clear;
  ColumnByName(dbgRep.Columns,'INCLUDE_NDS').KeyList.Add('1');
  ColumnByName(dbgRep.Columns,'INCLUDE_NDS').KeyList.Add('0');
  ColumnByName(dbgRep.Columns,'INCLUDE_NDS').CheckBoxes := true;  
  //поле "Обратный курс" должно быть в виде галочки
  ColumnByName(dbgRep.Columns,'KURS_INDIRECT').KeyList.Clear;
  ColumnByName(dbgRep.Columns,'KURS_INDIRECT').KeyList.Add('1');
  ColumnByName(dbgRep.Columns,'KURS_INDIRECT').KeyList.Add('0');
  ColumnByName(dbgRep.Columns,'KURS_INDIRECT').CheckBoxes := true;

  ColumnByName(dbgRep.Columns,'POST').Footer.ValueType :=fvtStaticText;
  ColumnByName(dbgRep.Columns,'POST').Footer.value := 'Записей всего:';
  ColumnByName(dbgRep.Columns,'TOVAR').Footer.ValueType :=fvtCount;
  
  if cdsRep.Active then begin
    psGrid.LoadProperties;
  end
end;

procedure TfrmRepPrice.actDebugExecute(Sender: TObject);
begin
  actDebug.Checked := not actDebug.Checked;
  if actDebug.Checked then begin
    //показать колонки с номерами складов и товаров

    cdsRep.FieldByName('ID_CURRENCY').visible := true;
    cdsRep.FieldByName('ID_PRICE').visible := true;
    cdsRep.FieldByName('ID_TOVAR').visible := true;
    cdsRep.FieldByName('ID_SKIDKA').visible := true;
    cdsRep.FieldByName('ID_POST').visible := true;
    cdsRep.FieldByName('ID_USL_POSTAVKA').visible := true;
    cdsRep.FieldByName('ID_ANALOG').visible := true;


    //cdsRep.FieldByName('DAT').visible := true;
    cdsRep.FieldByName('ID_NAKL').visible := true;
    cdsRep.FieldByName('TIP').visible := true;
    cdsRep.FieldByName('skidka_id_nakl').visible := true;
    cdsRep.FieldByName('usl_postavka_id_nakl').visible := true;

  end else begin //if actDebug checked
    cdsRep.FieldByName('ID_CURRENCY').visible := false;
    cdsRep.FieldByName('ID_PRICE').visible := false;
    cdsRep.FieldByName('ID_TOVAR').visible := false;
    cdsRep.FieldByName('ID_SKIDKA').visible := false;
    cdsRep.FieldByName('ID_POST').visible := false;
    cdsRep.FieldByName('ID_USL_POSTAVKA').visible := false;
    cdsRep.FieldByName('ID_ANALOG').visible := false;

    //cdsRep.FieldByName('DAT').visible := false;
    cdsRep.FieldByName('ID_NAKL').visible := false;
    cdsRep.FieldByName('TIP').visible := false;
    cdsRep.FieldByName('skidka_id_nakl').visible := false;
    cdsRep.FieldByName('usl_postavka_id_nakl').visible := false;
  end;  //if actDebug checked
end;



procedure TfrmRepPrice.FillPost;
//var
//  iSkladTreeOid : integer;
begin
  SettingsDataset2 := TfmSettingsDataset.Create(self);
  SettingsDataset2.Name := 'fmSettingsDataset2';
  //все надписи для пользователя
  //включая даже не нужное сообщение об ошибке заполнения
  SettingsDataset2.SetLabelValue(
    'Поставщик','Выбор поставщика','Не выбран поставщик');
  SettingsDataset2.SetListSource(dsPostWithPrice,'name','id');
  //необязательное заполнение прайса
  SettingsDataset2.SetResultType(2);
  setT.AddPlugin(SettingsDataset2);
end;

procedure TfrmRepPrice.FillTovar;
begin
  SettingsTovar := setT.CreatePlugin('TfmSettingsTovar');
  setT.AddPlugin(SettingsTovar);
end;

procedure TfrmRepPrice.FillCurrency;
begin
  SettingsDataset := TfmSettingsDataset.Create(self);
  //все надписи для пользователя
  //включая даже не нужное сообщение об ошибке заполнения
  SettingsDataset.SetLabelValue(
    'Валюта','Выбор валюты','Не выбрана валюта');
  SettingsDataset.SetListSource(dmdEx.dsCurrency,'name','oid');
  //обязательное заполнение валюты
  SettingsDataset.SetResultType(1);
  setT.AddPlugin(SettingsDataset);
end;

procedure TfrmRepPrice.FillKurs;
begin
  SettingsNumber := TfmSettingsNumber.Create(self);
  //необязательное заполнение курса с 8 знаками после запятой
  SettingsNumber.SetResultType(2);
  //все надписи для пользователя
  //включая даже не нужное сообщение об ошибке заполнения
  SettingsNumber.SetLabelValue(
    'Курс','Ввод курса','Не введён курс');
  setT.AddPlugin(SettingsNumber);
end;

procedure TfrmRepPrice.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmdEx.CloseQuery(dmdEx.dsPrice.DataSet,false);
  dmdEx.CloseQuery(dmdEx.dsCurrency.DataSet,false);
  dmdEx.CloseQuery(dmdEx.dsPost.DataSet,false);
  dmdEx.OpenQuery(dsPostWithPrice.DataSet,false);
  dmdEx.CloseQuery(dmdEx.dsSkidka.DataSet,false);
  dmdEx.CloseQuery(dmdEx.dsUslPostavka.DataSet,false);
  if cdsRep.Active then begin
    //чтобы не записывалась ширина колонок с отладочной инфой
    //и при открытии нового отчёта в отладчике не выскакивали
    //ошибки о том что таких колонок нет
    if actDebug.Checked then begin
      actDebug.Execute;
    end;
    psGrid.SaveProperties;
  end;
  Action := caFree;
end;

procedure TfrmRepPrice.FormCreate(Sender: TObject);
//var
//  iSchetTip : integer;
begin
  qeRep.DefSql := sdsRep.CommandText;
  setT := TfrmSettings.Create(self);
  setT.actDataOff.Execute;
  setT.actManagerOff.Execute;
  dmdEx.OpenQuery(dmdEx.dsPrice.DataSet,true);
  dmdEx.OpenQuery(dmdEx.dsCurrency.DataSet,true);
  dmdEx.OpenQuery(dmdEx.dsPost.DataSet,true);
  dmdEx.OpenQuery(dsPostWithPrice.DataSet,true);
  dmdEx.OpenQuery(dmdEx.dsSkidka.DataSet,true);
  dmdEx.OpenQuery(dmdEx.dsUslPostavka.DataSet,true);
  FillDate;
  FillPost;
  FillTovar;
  FillCurrency;
  FillKurs;
  iNakl:=0;
  iNaklSkidka :=0;
  iNaklUslPostavka :=0;
end;

procedure TfrmRepPrice.dbgRepKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return : begin
      actDetail.Execute;
    end;
  end;//case
end;

procedure TfrmRepPrice.dbgRepDblClick(Sender: TObject);
begin
  actDetail.Execute;
end;

procedure TfrmRepPrice.FillDate;
//var
//  EndOfPreviousMonth : TDate;
begin
  SettingsDate := TfmSettingsDate.Create(setT);
  setT.AddPlugin(SettingsDate);
  //EndOfPreviousMonth:= EndOfTheMonth(IncMonth (Today,-1));
  //необязательное заполнение даты
  SettingsDate.SetResultType(1);
  SettingsDate.SetKeyValue (Today);
end;

procedure TfrmRepPrice.cdsNaklotAfterInsert(DataSet: TDataSet);
var
  intGen : integer;
begin
  dmdEx.StartWaiting;
  intGen := dmdEx.GetGenValue('naklot_gen');
  DataSet.FieldByName('id_nakld').AsInteger := intGen;
  //DataSet.FieldByName('id_nakl').AsInteger := iNakl;
  DataSet.FieldByName('id_pos').asInteger := iNpp;
  DataSet.FieldByName('cena').asFloat :=
    cdsRep.FieldByName('cena_from').asFloat;
  //заполнить поле прайс если в шапке выбран прайс по умолчанию
  DataSet.FieldByName('id_sebest').asInteger :=
    cdsRep.FieldByName('id_price').asInteger;
  DataSet.FieldByName('id_tovar').asInteger :=
    cdsRep.FieldByName('id_tovar').asInteger;
  dmdEx.StopWaiting;
//	ShowDetail2;
  frmDet.ShowDetail(0);
end;


procedure TfrmRepPrice.cdsNaklotBeforeInsert(DataSet: TDataSet);
begin
  //ищем номер последней позиции
  DataSet.Last;
  try
    iNpp:=DataSet.fieldbyname('id_pos').asInteger;
  except
    iNpp:=0;
  end;
  inc(iNpp);
end;

procedure TfrmRepPrice.cdsNaklotReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  showmessage (e.Message);
  Action := raCancel;
end;

procedure TfrmRepPrice.cdsSkidkaChangeDetAfterInsert(DataSet: TDataSet);
var
  intGen : integer;
begin
  dmdEx.StartWaiting;
  intGen := dmdEx.GetGenValue('naklot_gen');
  DataSet.FieldByName('id_nakld').AsInteger := intGen;
//  DataSet.FieldByName('id_nakl').AsInteger :=
//    iNaklSkidka;
  DataSet.FieldByName('id_pos').asInteger := iNppSkidka;

  DataSet.FieldByName('skidka').asFloat :=
    cdsRep.FieldByName('skidka').asFloat;
  //заполнить поле прайс если в шапке выбран прайс по умолчанию
  DataSet.FieldByName('id_sebest').asInteger :=
    cdsRep.FieldByName('id_skidka').asInteger;
  DataSet.FieldByName('id_tovar').asInteger :=
    cdsRep.FieldByName('id_tovar').asInteger;
  dmdEx.StopWaiting;
	frmDetSkidka.ShowDetail(0);
end;

procedure TfrmRepPrice.cdsSkidkaChangeDetBeforeInsert(DataSet: TDataSet);
begin
  //ищем номер последней позиции
  DataSet.Last;
  try
    iNppSkidka:=DataSet.fieldbyname('id_pos').asInteger;
  except
    iNppSkidka:=0;
  end;
  inc(iNppSkidka);
end;

procedure TfrmRepPrice.cdsUslPostavkaChangeDetAfterInsert(
  DataSet: TDataSet);
var
  intGen : integer;
begin
  dmdEx.StartWaiting;
  intGen := dmdEx.GetGenValue('naklot_gen');
  DataSet.FieldByName('id_nakld').AsInteger := intGen;
//  DataSet.FieldByName('id_nakl').AsInteger :=
//    iNaklUslPostavka;
  DataSet.FieldByName('id_pos').asInteger := iNppUslPostavka;

  //DataSet.FieldByName('skidka').asFloat :=
  //  cdsRep.FieldByName('skidka').asFloat;
  //заполнить поле прайс если в шапке выбран прайс по умолчанию
  DataSet.FieldByName('id_usl_postavka').asInteger :=
    cdsRep.FieldByName('id_usl_postavka').asInteger;
  DataSet.FieldByName('id_tovar').asInteger :=
    cdsRep.FieldByName('id_tovar').asInteger;
  DataSet.FieldByName('transport').asFloat :=
    cdsRep.FieldByName('transport').asFloat;
  DataSet.FieldByName('tara').asFloat :=
    cdsRep.FieldByName('tara').asFloat;
  DataSet.FieldByName('valuta').asFloat :=
    cdsRep.FieldByName('valuta').asFloat;
  DataSet.FieldByName('tamognya').asFloat :=
    cdsRep.FieldByName('tamognya').asFloat;
  DataSet.FieldByName('procent_predopl').asFloat :=
    cdsRep.FieldByName('procent_predopl').asFloat;
  DataSet.FieldByName('otsrochka').asInteger :=
    cdsRep.FieldByName('otsrochka').asInteger;
  DataSet.FieldByName('stavka_banka').asFloat :=
    cdsRep.FieldByName('stavka_banka').asFloat;
  dmdEx.StopWaiting;
	frmDetUslPostavka.ShowDetail(0);
end;

procedure TfrmRepPrice.cdsUslPostavkaChangeDetBeforeInsert(
  DataSet: TDataSet);
begin
  //ищем номер последней позиции
  DataSet.Last;
  try
    iNppUslPostavka:=DataSet.fieldbyname('id_pos').asInteger;
  except
    iNppUslPostavka:=0;
  end;
  inc(iNppUslPostavka);
end;

procedure TfrmRepPrice.cdsNaklotBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then begin
    if iNakl=0 then begin
//    sdsPriceChangeInsert.Params.ParamByName('id_nakl').AsInteger
      sdsPriceChangeInsert.Params.ParamByName('comment').AsString:=
        'Сгенерировано в '+TimeToStr(Time);
      sdsPriceChangeInsert.Params.ParamByName('id_price').AsInteger:=
        cdsRep.FieldByName('id_price').asInteger;
      dmdEx.ExecSQL(sdsPriceChangeInsert,false);
      iNakl :=sdsPriceChangeInsert.Params.ParamByName('id_nakl').AsInteger;
    end;
    DataSet.FieldByName('id_nakl').asInteger:=iNakl;
  end;
end;

procedure TfrmRepPrice.cdsSkidkaChangeDetBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then begin
    if iNaklSkidka=0 then begin
      sdsSkidkaChangeInsert.Params.ParamByName('comment').AsString:=
        'Сгенерировано в '+TimeToStr(Time);
      sdsSkidkaChangeInsert.Params.ParamByName('id_skidka').AsInteger:=
        cdsRep.FieldByName('id_skidka').asInteger;
      dmdEx.ExecSQL(sdsSkidkaChangeInsert,false);
      iNaklSkidka :=sdsSkidkaChangeInsert.Params.ParamByName('id_nakl').AsInteger;
    end;
    DataSet.FieldByName('id_nakl').asInteger:=iNaklSkidka;
  end;
end;

procedure TfrmRepPrice.cdsUslPostavkaChangeDetBeforePost(
  DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then begin
    if iNaklUslPostavka=0 then begin
      sdsUslPostavkaChangeInsert.Params.ParamByName('comment').AsString:=
        'Сгенерировано в '+TimeToStr(Time);
      sdsUslPostavkaChangeInsert.Params.ParamByName('id_usl_postavka').AsInteger:=
        cdsRep.FieldByName('id_usl_postavka').asInteger;
      dmdEx.ExecSQL(sdsUslPostavkaChangeInsert,false);
      iNaklUslPostavka :=sdsUslPostavkaChangeInsert.Params.ParamByName('id_nakl').AsInteger;
    end;
    DataSet.FieldByName('id_nakl').asInteger:=iNaklUslPostavka;
  end;
end;

procedure TfrmRepPrice.SetCurrency(IdCurrency: variant);
begin
  SettingsDataset.SetKeyValue(IdCurrency);
end;

procedure TfrmRepPrice.SetKurs(vKurs: variant);
begin
  SettingsNumber.SetKeyValue(vKurs);
end;

procedure TfrmRepPrice.SetDate(Date: variant);
begin
  SettingsDate.SetKeyValue(Date);
end;

procedure TfrmRepPrice.SetPost(IdPost: variant);
begin
  SettingsDataset2.SetKeyValue(IdPost);
end;

procedure TfrmRepPrice.SetTovar(IdTovar: variant);
begin
  SettingsTovar.SetKeyValue(IdTovar);
end;

procedure TfrmRepPrice.actCreateUslPostavkaChangeExecute(Sender: TObject);
var
  frmUslPostavkaChange :TfrmUslPostavkaChange;
  i : integer;
  slHead : TStringList;
begin
try
  if cdsRep.FieldByName('id_usl_postavka').IsNull then begin
    MessageDlg('Укажите условия поставки',mtError,[mbOk],0);
    exit;
  end;
  if (dsRep.Dataset.bof and dsRep.Dataset.eof) then begin
    exit;
  end;
  frmUslPostavkaChange := TfrmUslPostavkaChange.Create(Application);
  frmUslPostavkaChange.setT.DateFrom := Today;
  frmUslPostavkaChange.setT.DateTo := Today;
  frmUslPostavkaChange.setT.IDManager:=dmdex.GetIdManager;
  frmUslPostavkaChange.ProcessSettings;
  frmUslPostavkaChange.DefaultOpen;
  slHead := TStringList.Create;
  slHead.Add('id_sklad='+cdsRep.FieldByName('id_usl_postavka').asString);
  slHead.Add('id_manager='+inttostr(dmdex.GetIdManager));
  slHead.Add('id=отчёта по ценам');
  dmdex.StartWaiting;
  frmUslPostavkaChange.dsNaklo.DataSet.DisableControls;
  frmUslPostavkaChange.dsNaklot.DataSet.DisableControls;
  if (dbgRep.Selection.SelectionType=gstRecordBookmarks) then begin
    for i:=0 to dbgRep.Selection.Rows.Count-1 do begin
      dbgRep.DataSource.DataSet.GotoBookmark(pointer(dbgRep.SelectedRows.Items[i]));
      AddPositionUslPostavka(frmUslPostavkaChange.dsPriceDetGen.dataset);
    end;
  end else begin
    if  (dbgRep.Selection.SelectionType=gstAll) then begin
      dbgRep.DataSource.DataSet.First;
      while not dbgRep.DataSource.DataSet.eof do begin
        AddPositionUslPostavka(frmUslPostavkaChange.dsPriceDetGen.dataset);
        dbgRep.DataSource.DataSet.next;
      end;
    end else begin
      AddPositionUslPostavka(frmUslPostavkaChange.dsPriceDetGen.dataset);
    end;
  end;
  dmdex.StopWaiting;
  frmUslPostavkaChange.CreateDocFromMem(slHead);

  frmUslPostavkaChange.dsNaklot.DataSet.EnableControls;
  frmUslPostavkaChange.dsNaklo.DataSet.EnableControls;
except
  AssertInternal('ED468E0B-9CD6-45E3-BBD6-742C5516827A');
end;
end;


procedure TfrmRepPrice.AddPositionUslPostavka(DataSet:TDataSet);
begin
try
  DataSet.Insert;
  DataSet.FieldByName('id_usl_postavka').asInteger :=
    cdsRep.FieldByName('id_usl_postavka').asInteger;
  DataSet.FieldByName('id_tovar').asInteger :=
    cdsRep.FieldByName('id_tovar').asInteger;

  DataSet.FieldByName('transport').asFloat :=
    cdsRep.FieldByName('transport').asFloat;
  DataSet.FieldByName('tara').asFloat :=
    cdsRep.FieldByName('tara').asFloat;
  DataSet.FieldByName('valuta').asFloat :=
    cdsRep.FieldByName('valuta').asFloat;
  DataSet.FieldByName('tamognya').asFloat :=
    cdsRep.FieldByName('tamognya').asFloat;
  DataSet.FieldByName('procent_predopl').asFloat :=
    cdsRep.FieldByName('procent_predopl').asFloat;
  DataSet.FieldByName('otsrochka').asInteger :=
    cdsRep.FieldByName('otsrochka').asInteger;
  DataSet.FieldByName('stavka_banka').asFloat :=
    cdsRep.FieldByName('stavka_banka').asFloat;

  DataSet.Post;
except
  AssertInternal('0825116E-C325-4C30-88A9-B8CD3B30FF01');
end;
end;

procedure TfrmRepPrice.actCreateSkidkaChangeExecute(Sender: TObject);
var
  frmSkidkaChange :TfrmSkidkaChange;
  i : integer;
  slHead : TStringList;
begin
try
  if cdsRep.FieldByName('id_skidka').IsNull then begin
    MessageDlg('Укажите скидочную политику',mtError,[mbOk],0);
    exit;
  end;
  if (dsRep.Dataset.bof and dsRep.Dataset.eof) then begin
    exit;
  end;
  frmSkidkaChange := TfrmSkidkaChange.Create(Application);
  frmSkidkaChange.setT.DateFrom := Today;
  frmSkidkaChange.setT.DateTo := Today;
  frmSkidkaChange.setT.IDManager:=dmdex.GetIdManager;
  //frmSkidkaChange.ProcessSettings;
  frmSkidkaChange.DefaultOpen;
  slHead := TStringList.Create;
  slHead.Add('id_sklad='+cdsRep.FieldByName('id_skidka').asString);
  slHead.Add('id_manager='+inttostr(dmdex.GetIdManager));
  slHead.Add('id=отчёта по ценам');

  dmdEx.StartWaiting;
  frmSkidkaChange.dsNaklo.DataSet.DisableControls;
  frmSkidkaChange.dsNaklot.DataSet.DisableControls;

  if dbgRep.Selection.SelectionType=gstRecordBookmarks then begin
    for i:=0 to dbgRep.Selection.Rows.Count-1 do begin
      dbgRep.DataSource.DataSet.GotoBookmark(pointer(dbgRep.SelectedRows.Items[i]));
      AddPositionSkidka(frmSkidkaChange.dsPriceDetGen.dataset);
    end;
  end else begin
    if  (dbgRep.Selection.SelectionType=gstAll) then begin
      dbgRep.DataSource.DataSet.First;
      while not dbgRep.DataSource.DataSet.eof do begin
        AddPositionSkidka(frmSkidkaChange.dsPriceDetGen.dataset);
        dbgRep.DataSource.DataSet.next;
      end;
    end else begin
      AddPositionSkidka(frmSkidkaChange.dsPriceDetGen.dataset);
    end;
  end;
  dmdex.StopWaiting;
  frmSkidkaChange.CreateDocFromMem(slHead);

  frmSkidkaChange.dsNaklot.DataSet.EnableControls;
  frmSkidkaChange.dsNaklo.DataSet.EnableControls;
except
  AssertInternal('58F3EFBA-14A6-4089-94F7-C168DCDA92B3');
end;
end;

procedure TfrmRepPrice.AddPositionSkidka(DataSet:TDataSet);
begin
try
  DataSet.Insert;
  DataSet.FieldByName('skidka').asFloat :=
    cdsRep.FieldByName('skidka').asFloat;
  //заполнить поле прайс если в шапке выбран прайс по умолчанию
  DataSet.FieldByName('id_sebest').asInteger :=
    cdsRep.FieldByName('id_skidka').asInteger;
  DataSet.FieldByName('id_tovar').asInteger :=
    cdsRep.FieldByName('id_tovar').asInteger;
  DataSet.Post;
except
  AssertInternal('EB18A54B-B00A-47A1-85F0-BC466904C12D');
end;
end;



procedure TfrmRepPrice.actCreatePriceChangeExecute(Sender: TObject);
var
  frmPriceChange :TfrmPriceChange;
  i : integer;
  slHead : TStringList;
begin
try
  if cdsRep.FieldByName('id_price').IsNull then begin
    MessageDlg('Укажите прайс',mtError,[mbOk],0);
    exit;
  end;
  if (dsRep.Dataset.bof and dsRep.Dataset.eof) then begin
    exit;
  end;
  frmPriceChange := TfrmPriceChange.Create(Application);
  frmPriceChange.setT.DateFrom := Today;
  frmPriceChange.setT.DateTo := Today;
  frmPriceChange.setT.IDManager:=dmdex.GetIdManager;
  frmPriceChange.ProcessSettings;
  frmPriceChange.DefaultOpen;
  slHead := TStringList.Create;
  slHead.Add('id_sklad='+cdsRep.FieldByName('id_price').asString);
  slHead.Add('id_manager='+inttostr(dmdex.GetIdManager));
  slHead.Add('id=отчёта по ценам');
  
  dmdEx.StartWaiting;
  frmPriceChange.dsNaklo.DataSet.DisableControls;
  frmPriceChange.dsNaklot.DataSet.DisableControls;


  if dbgRep.Selection.SelectionType=gstRecordBookmarks then begin
    for i:=0 to dbgRep.Selection.Rows.Count-1 do begin
      dbgRep.DataSource.DataSet.GotoBookmark(pointer(dbgRep.SelectedRows.Items[i]));
      AddPositionPrice(frmPriceChange.dsPriceDetGen.dataset);
    end;
  end else begin
    if  (dbgRep.Selection.SelectionType=gstAll) then begin
      dbgRep.DataSource.DataSet.First;
      while not dbgRep.DataSource.DataSet.eof do begin
        AddPositionPrice(frmPriceChange.dsPriceDetGen.dataset);
        dbgRep.DataSource.DataSet.next;
      end;
    end else begin
      AddPositionPrice(frmPriceChange.dsPriceDetGen.dataset);
    end;
  end;
  dmdEx.StopWaiting;
  frmPriceChange.CreateDocFromMem(slHead);

  frmPriceChange.dsNaklot.DataSet.EnableControls;
  frmPriceChange.dsNaklo.DataSet.EnableControls;
except
  AssertInternal('19C31E16-635E-46D3-9A8E-B9818C14BA72');
end;
end;

procedure TfrmRepPrice.AddPositionPrice(DataSet:TDataSet);
begin
try
  DataSet.Insert;
  DataSet.FieldByName('cena').asFloat :=
    cdsRep.FieldByName('cena_from').asFloat;
  //заполнить поле прайс если в шапке выбран прайс по умолчанию
  DataSet.FieldByName('id_sebest').asInteger :=
    cdsRep.FieldByName('id_price').asInteger;
  DataSet.FieldByName('id_tovar').asInteger :=
    cdsRep.FieldByName('id_tovar').asInteger;
  DataSet.Post;
except
  AssertInternal('06AB04A0-1DA7-46B1-8D58-059095A1F371');
end;
end;

procedure TfrmRepPrice.ProcessKurs;
var
  sTemp : string;
  dTo : double;
begin
  sTemp := setT.GetPluginResult('fmSettingsNumber');
  if sTemp = '' then begin
    cdsRep.Params.ParamByName('kurs_in').Clear;
  end else begin
    dTo := strtofloat(sTemp);
    cdsRep.Params.ParamByName('kurs_in').AsFloat := dTo;
  end;
end;

{
procedure TfrmRepPrice.FillGroup;
begin
  SettingsTipGroup := TfmSettingsTipGroup.Create(setT);
  SettingsTipGroup.AddDetailTip('<Без группировки>');
  SettingsTipGroup.AddDetailTip('По скидкам и условиям поставки');
  setT.AddPlugin(SettingsTipGroup);
  SettingsTipGroup.SetKeyValue(0);
end;
}
{
procedure TfrmRepPrice.ProcessGroup;
var
  sTemp : string;
  //iTemp : integer;
begin
try
  sTemp := setT.GetPluginResult('fmSettingsTipGroup');
  }
  //iTemp := strtoint(sTemp);


  {
  ColumnByName(dbgRep.Columns,'SKLAD').Footer.ValueType :=fvtNon;
  ColumnByName(dbgRep.Columns,'TOVAR').Footer.ValueType :=fvtNon;
  ColumnByName(dbgRep.Columns,'DAT').Footer.ValueType :=fvtNon;
  ColumnByName(dbgRep.Columns,'ZAK').Footer.ValueType :=fvtNon;
  ColumnByName(dbgRep.Columns,'MANAGER').Footer.ValueType :=fvtNon;
  ColumnByName(dbgRep.Columns,'ANALOG').Footer.ValueType :=fvtNon;
  }
  {
  case iTemp of
    0: begin
      qeRep.SetSQL('select','r.dat,r.id_nakl,r.id_izg,r.id_zak,r.id_manager,'+
        'r.id_sklad,r.id_tovar, r.id_analog, r.kolotp,r.nds_fact,r.nds_sebest, r.doxod,r.rent',
        0);
      qeRasx.SetSQL('group by','',0);
      qeRasx.Prepare;
      ///ColumnByName(dbgRasx.Columns,'ANALOG').Visible := false;
      ColumnByName(dbgRasx.Columns,'DAT').Visible := true;
      ColumnByName(dbgRasx.Columns,'IZG').Visible := true;
      ColumnByName(dbgRasx.Columns,'ZAK').Visible := true;
      ColumnByName(dbgRasx.Columns,'MANAGER').Visible := true;
      ColumnByName(dbgRasx.Columns,'TOVAR').Visible := true;
      ColumnByName(dbgRasx.Columns,'SKLAD').Visible := true;
      ColumnByName(dbgRasx.Columns,'ANALOG').Visible := true;

      ColumnByName(dbgRasx.Columns,'ANALOG').Width := 20;
      ColumnByName(dbgRasx.Columns,'DAT').Footer.ValueType :=fvtCount;
      //Только в режиме без группировки
      actShowNakl.Visible :=true;
    end;
    1: begin
      qeRasx.SetSQL('select',
        'cast(null as date) as dat, cast(null as integer) as id_izg, '+
        'cast(null as integer) as id_nakl,'+
        'cast(null as integer) as id_zak, cast(null as integer) as id_manager, '+
        'cast (null as integer) as id_tovar, '+
        'cast (null as integer) as id_analog, '+
        'r.id_sklad, sum(r.kolotp) as kolotp, '+
        'sum(r.nds_fact) as nds_fact,sum(r.nds_sebest) as nds_sebest,'+
        'sum(r.doxod) as doxod,dzero(sum(r.doxod)*100,sum(r.nds_sebest),0) as rent',
        0);
      qeRasx.SetSQL('group by','r.id_sklad',0);
      qeRasx.Prepare;
      ColumnByName(dbgRasx.Columns,'DAT').Visible := false;
      ColumnByName(dbgRasx.Columns,'IZG').Visible := false;
      ColumnByName(dbgRasx.Columns,'ZAK').Visible := false;
      ColumnByName(dbgRasx.Columns,'MANAGER').Visible := false;
      ColumnByName(dbgRasx.Columns,'TOVAR').Visible := false;
      ColumnByName(dbgRasx.Columns,'SKLAD').Visible := true;
      ColumnByName(dbgRasx.Columns,'ANALOG').Visible := false;
      ColumnByName(dbgRasx.Columns,'SKLAD').Footer.ValueType :=fvtCount;
    end;
    2: begin
      qeRasx.SetSQL('select',
        'cast(null as date) as dat, cast(null as integer) as id_izg, '+
        'cast(null as integer) as id_nakl,'+
        'cast(null as integer) as id_zak, cast(null as integer) as id_manager, '+
        'cast (null as integer) as id_sklad, '+
        'cast (null as integer) as id_analog, '+
        'r.id_tovar, sum(r.kolotp) as kolotp,'+
        'sum(r.nds_fact) as nds_fact,sum(r.nds_sebest) as nds_sebest,'+
        'sum(r.doxod) as doxod,dzero(sum(r.doxod)*100,sum(r.nds_sebest),0) as rent',
        0);
      qeRasx.SetSQL('group by','r.id_tovar',0);
      qeRasx.Prepare;
      ColumnByName(dbgRasx.Columns,'DAT').Visible := false;
      ColumnByName(dbgRasx.Columns,'IZG').Visible := false;
      ColumnByName(dbgRasx.Columns,'ZAK').Visible := false;
      ColumnByName(dbgRasx.Columns,'MANAGER').Visible := false;
      ColumnByName(dbgRasx.Columns,'SKLAD').Visible := false;
      ColumnByName(dbgRasx.Columns,'TOVAR').Visible := true;
      ColumnByName(dbgRasx.Columns,'ANALOG').Visible := false;
      ColumnByName(dbgRasx.Columns,'TOVAR').Footer.ValueType :=fvtCount;
    end;
    3: begin
      qeRasx.SetSQL('select',
        'cast(null as date) as dat, cast(null as integer) as id_izg, '+
        'cast(null as integer) as id_nakl,'+
        'cast(null as integer) as id_manager, '+
        'cast (null as integer) as id_sklad, '+
        'cast (null as integer) as id_tovar, '+
        'cast (null as integer) as id_analog, '+
        'r.id_zak, sum(r.kolotp) as kolotp,'+
        'sum(r.nds_fact) as nds_fact,sum(r.nds_sebest) as nds_sebest,'+
        'sum(r.doxod) as doxod,dzero(sum(r.doxod)*100,sum(r.nds_sebest),0) as rent',
        0);
      qeRasx.SetSQL('group by','r.id_zak',0);
      qeRasx.Prepare;
      ColumnByName(dbgRasx.Columns,'DAT').Visible := false;
      ColumnByName(dbgRasx.Columns,'IZG').Visible := false;
      ColumnByName(dbgRasx.Columns,'ZAK').Visible := true;
      ColumnByName(dbgRasx.Columns,'MANAGER').Visible := false;
      ColumnByName(dbgRasx.Columns,'SKLAD').Visible := false;
      ColumnByName(dbgRasx.Columns,'TOVAR').Visible := false;
      ColumnByName(dbgRasx.Columns,'ANALOG').Visible := false;
      ColumnByName(dbgRasx.Columns,'ZAK').Footer.ValueType :=fvtCount;
    end;
    4: begin
      qeRasx.SetSQL('select',
        'cast(null as date) as dat, cast(null as integer) as id_izg, '+
        'cast(null as integer) as id_nakl,'+
        'cast(null as integer) as id_manager, '+
        'cast (null as integer) as id_sklad, '+
        'cast (null as integer) as id_tovar, '+
        'cast (null as integer) as id_analog, '+
        'r.id_manager, sum(r.kolotp) as kolotp,'+
        'sum(r.nds_fact) as nds_fact,sum(r.nds_sebest) as nds_sebest,'+
        'sum(r.doxod) as doxod,dzero(sum(r.doxod)*100,sum(r.nds_sebest),0) as rent',
        0);
      qeRasx.SetSQL('group by','r.id_manager',0);
      qeRasx.Prepare;
      ColumnByName(dbgRasx.Columns,'DAT').Visible := false;
      ColumnByName(dbgRasx.Columns,'IZG').Visible := false;
      ColumnByName(dbgRasx.Columns,'ZAK').Visible := false;
      ColumnByName(dbgRasx.Columns,'MANAGER').Visible := true;
      ColumnByName(dbgRasx.Columns,'SKLAD').Visible := false;
      ColumnByName(dbgRasx.Columns,'TOVAR').Visible := false;
      ColumnByName(dbgRasx.Columns,'ANALOG').Visible := false;
      ColumnByName(dbgRasx.Columns,'MANAGER').Footer.ValueType :=fvtCount;
    end;
    5: begin
      qeRasx.SetSQL('select',
        'cast(null as date) as dat, cast(null as integer) as id_izg, '+
        'cast(null as integer) as id_nakl,'+
        'cast(null as integer) as id_zak, cast(null as integer) as id_manager, '+
        'cast (null as integer) as id_sklad, '+
        'cast (null as integer) as id_tovar, '+
        'r.id_analog, sum(r.kolotp) as kolotp,'+
        'sum(r.nds_fact) as nds_fact,sum(r.nds_sebest) as nds_sebest,'+
        'sum(r.doxod) as doxod,dzero(sum(r.doxod)*100,sum(r.nds_sebest),0) as rent',
        0);
      qeRasx.SetSQL('group by','r.id_analog',0);
      qeRasx.Prepare;
      ColumnByName(dbgRasx.Columns,'DAT').Visible := false;
      ColumnByName(dbgRasx.Columns,'IZG').Visible := false;
      ColumnByName(dbgRasx.Columns,'ZAK').Visible := false;
      ColumnByName(dbgRasx.Columns,'MANAGER').Visible := false;
      ColumnByName(dbgRasx.Columns,'SKLAD').Visible := false;
      ColumnByName(dbgRasx.Columns,'TOVAR').Visible := false;
      ColumnByName(dbgRasx.Columns,'ANALOG').Visible := true;
      ColumnByName(dbgRasx.Columns,'ANALOG').Footer.ValueType :=fvtCount;
    end;
  end;//case
  }
  {
except
  AssertInternal('73221BFE-E875-4A42-A7A5-6DD587146840')
end;

end;
   }
end.
