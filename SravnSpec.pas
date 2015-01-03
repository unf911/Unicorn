unit SravnSpec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DB, DBClient, Provider, SqlExpr, QueryExtender,
  PropFilerEh, MemTableDataEh, Menus, MemTableEh, PropStorageEh, UnfFilter,
  ActnList, ComCtrls, GridsEh, DBGridEh, ExtCtrls, AutoPnl, StdCtrls,
  Buttons, 
   Grids,

  untEx, SettingsTovar, untSettings,
  SettingsDate, //TfmSettingsDate
  atsAssert, //AssertInternal
  untRound, //ColumnByName ,FilterListCreate
  SettingsPlugin, //TfmSettingPlugin
  SettingsDataset, //TfmSettingsDataset
  SettingsNumber, //TfmSettingsNumber;
  RepSkladBuxDet, //TfrmRepSkladBuxDet
  DateUtils, //Endofthemonth
  PriceChangeDet, //TfrmPriceChangeDet
  SkidkaChangeDet, //TfrmSkidkaChangeDet
  UslPostavkaChangeDet, //TfrmUslPostavkaChangeDet
  SravnPriceCompare, //TfrmSravnPriceCompare
  Spec //TfrmSpec
  ;

type
  TProcessPositForSpec = procedure (dbgGrid: TDbGridEh;
    DataSet,dtsSravnPricePost,dtsFactTable: TDataSet;iIdNakl: integer);
  TfrmSravnSpec = class(TForm)
    GroupBox1: TGroupBox;
    AutoPanel1: TAutoPanel;
    ActionList1: TActionList;
    actSettings: TAction;
    actDetail: TAction;
    actRefresh: TAction;
    actDebug: TAction;
    ufRep: TUnfFilter;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    mnuRefresh: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    BitBtn3: TBitBtn;
    BitBtn6: TBitBtn;
    psGrid: TPropStorageEh;
    RegPropStorageManEh1: TRegPropStorageManEh;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    mtePost: TMemTableEh;
    tsAllPrices: TTabSheet;
    dbgRepFact: TDBGridEh;
    dbgPost: TDBGridEh;
    dsPost: TDataSource;
    mtePostPOST: TStringField;
    mtePostDAT: TDateField;
    mtePostID_POST: TIntegerField;
    mtePostIN_LIST: TSmallintField;
    mteTovar: TMemTableEh;
    SmallintField1: TSmallintField;
    dsTovar: TDataSource;
    mteTovarID_TOVAR: TIntegerField;
    mteTovarTOVAR: TStringField;
    dbgTovar: TDBGridEh;
    actFillFact: TAction;
    dsFactTable: TDataSource;
    tsSravnPrice: TTabSheet;
    dsSravnPrice: TDataSource;
    actSravnPrice: TAction;
    mteSravnPricePost: TMemTableEh;
    DateField1: TDateField;
    IntegerField15: TIntegerField;
    dsSravnPricePost: TDataSource;
    mteSravnPricePostID_COLUMN: TIntegerField;
    mteSravnPricePostCOLUMN_NAME: TStringField;
    ufRepFact: TUnfFilter;
    ppmTovar: TPopupMenu;
    actAddDet1: TMenuItem;
    ppmPost: TPopupMenu;
    actAddPost1: TMenuItem;
    actChooseBestPost: TAction;
    BitBtn5: TBitBtn;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    actSave: TAction;
    mtePostEXCLUDED: TIntegerField;
    ppmRep: TPopupMenu;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    actFillFactAndSravnPrice: TAction;
    N15: TMenuItem;
    mteTovarGRUPPA1: TStringField;
    mteTovarGRUPPA2: TFloatField;
    mteTovarGRUPPA3: TFloatField;
    mteTovarGRUPPA4: TFloatField;
    pbAllPrices: TProgressBar;
    dbgRep: TDBGridEh;
    mtePostKURS: TFloatField;
    cdsSravnPrice: TClientDataSet;
    mteTovarKOLOTP: TFloatField;
    sdsSravnPriceMakeSpec: TSQLDataSet;
    actShowSpec: TAction;
    N19: TMenuItem;
    sdsSpecOstNerazm: TSQLDataSet;
    sdsSpecOstRazm: TSQLDataSet;
    dspSpecOstRazm: TDataSetProvider;
    dspSpecOstNerazm: TDataSetProvider;
    cdsSpecOstNerazm: TClientDataSet;
    cdsSpecOstNerazmTOVAR: TStringField;
    cdsSpecOstNerazmID_ANALOG: TIntegerField;
    cdsSpecOstNerazmKOLOTP_NERAZM: TFMTBCDField;
    cdsSpecOstRazm: TClientDataSet;
    StringField3: TStringField;
    IntegerField1: TIntegerField;
    cdsSpecOstRazmKOLOTP_RAZM: TFMTBCDField;
    dsSpecOstRazm: TDataSource;
    dsSpecNerazm: TDataSource;
    sdsSpecPrice: TSQLDataSet;
    dspSpecPrice: TDataSetProvider;
    cdsSpecPrice: TClientDataSet;
    dsSpecPrice: TDataSource;
    mteFactTable: TClientDataSet;
    mteFactTablePOST: TStringField;
    mteFactTableANALOG: TStringField;
    mteFactTableTOVAR: TStringField;
    mteFactTableCENA: TFloatField;
    mteFactTableCENA_FROM: TFloatField;
    mteFactTableID_ANALOG: TIntegerField;
    mteFactTableID_POST: TIntegerField;
    mteFactTableID_TOVAR: TIntegerField;
    mteFactTableKOLOTP: TFloatField;
    mteFactTableDAT: TSQLTimeStampField;
    mteFactTableZATRATY: TFloatField;
    mteFactTableUSL_POSTAVKA_ID_NAKL: TIntegerField;
    mteFactTableID_NAKL: TIntegerField;
    qeSravnPrice: TQueryExtender;
    sdsRep: TSQLDataSet;
    dspRep: TDataSetProvider;
    cdsRep: TClientDataSet;
    cdsRepPOST: TStringField;
    cdsRepTOVAR: TStringField;
    cdsRepCURRENCY: TStringField;
    cdsRepCENA_FROM: TFloatField;
    cdsRepINCLUDE_NDS: TIntegerField;
    cdsRepKURS: TFloatField;
    cdsRepKURS_INDIRECT: TIntegerField;
    cdsRepSKIDKA: TFloatField;
    cdsRepZAKUPKA: TFloatField;
    cdsRepTRANSPORT: TFloatField;
    cdsRepTARA: TFloatField;
    cdsRepVALUTA: TFloatField;
    cdsRepTAMOGNYA: TFloatField;
    cdsRepPROCENT_PREDOPL: TFloatField;
    cdsRepOTSROCHKA: TFloatField;
    cdsRepSTAVKA_BANKA: TFloatField;
    cdsRepZATRATY: TFloatField;
    cdsRepCENA: TFloatField;
    cdsRepTOVAR_EXACT: TStringField;
    cdsRepUSL_POSTAVKA: TStringField;
    cdsRepSKIDKA_SPR: TStringField;
    cdsRepPRICE: TStringField;
    cdsRepDAT: TSQLTimeStampField;
    cdsRepID_NAKL: TIntegerField;
    cdsRepTIP: TIntegerField;
    cdsRepID_CURRENCY: TIntegerField;
    cdsRepID_PRICE: TIntegerField;
    cdsRepID_TOVAR: TIntegerField;
    cdsRepID_SKIDKA: TIntegerField;
    cdsRepID_POST: TIntegerField;
    cdsRepID_USL_POSTAVKA: TIntegerField;
    cdsRepID_ANALOG: TIntegerField;
    cdsRepSKIDKA_ID_NAKL: TIntegerField;
    cdsRepUSL_POSTAVKA_ID_NAKL: TIntegerField;
    dsRep: TDataSource;
    sdsPost: TSQLDataSet;
    dspPost: TDataSetProvider;
    cdsPostWithPrice: TClientDataSet;
    cdsPostWithPriceID: TIntegerField;
    cdsPostWithPriceNAME: TStringField;
    dsPostWithPrice: TDataSource;
    actFillPrice: TAction;
    qeRep: TQueryExtender;
    cdsSravnPricePOST: TStringField;
    cdsSravnPriceANALOG: TStringField;
    cdsSravnPriceCENA: TFloatField;
    cdsSravnPriceID_ANALOG: TIntegerField;
    cdsSravnPriceID_POST: TIntegerField;
    cdsSravnPriceDELTA_KOLOTP: TFloatField;
    cdsSravnPriceKOLOTP_SPEC: TFloatField;
    cdsSravnPriceCENA_AVG: TFloatField;
    cdsSravnPriceKOLOTP: TFloatField;
    cdsSravnPriceVXOD_POST: TFloatField;
    cdsSravnPriceSKIDKA_POST: TFloatField;
    cdsSravnPriceSPEC_OST_RAZM: TFloatField;
    mteFactTableCURRENCY: TStringField;
    mteFactTableKURS: TFloatField;
    mteFactTableKURS_INDIRECT: TIntegerField;
    mteFactTableID_CURRENCY: TIntegerField;
    tsSravnPostWithPrice: TTabSheet;
    dbgRepSpecWithPrice: TDBGridEh;
    ProgressBar1: TProgressBar;
    dsSravnPostWithPrice: TDataSource;
    actRefreshPrice: TAction;
    cdsSravnPostWithPrice: TClientDataSet;
    cdsSravnPostWithPricePOST: TStringField;
    cdsSravnPostWithPriceANALOG: TStringField;
    cdsSravnPostWithPriceID_ANALOG: TIntegerField;
    cdsSravnPostWithPriceID_POST: TIntegerField;
    cdsSravnPostWithPriceKOLOTP_SPEC: TFloatField;
    cdsSravnPostWithPriceCENA_AVG: TFloatField;
    cdsSravnPostWithPriceVXOD_POST: TFloatField;
    cdsSravnPostWithPriceSKIDKA_POST: TFloatField;
    ufRepWithPrice: TUnfFilter;
    cdsSravnPostWithPriceSUMA: TFloatField;
    cdsSravnPostWithPriceSUMANDS: TFloatField;
    mteFactTableNALOG_NDS: TFloatField;
    cdsSravnPostWithPriceNALOG_NDS: TFloatField;
    mteTovarCENA: TFloatField;
    mteTovarID_POST: TIntegerField;
    procedure actRefreshExecute(Sender: TObject);
    procedure actSettingsExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
     procedure actDetailExecute(Sender: TObject);
    procedure actDebugExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgRepFactKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgRepDblClick(Sender: TObject);
    procedure cdsNaklotReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure TabSheet1Exit(Sender: TObject);
    procedure TabSheet2Exit(Sender: TObject);
    procedure mtePostAfterInsert(DataSet: TDataSet);
    procedure mteTovarAfterInsert(DataSet: TDataSet);
    procedure actSravnPriceExecute(Sender: TObject);
    procedure mteSravnPricePostBeforeInsert(DataSet: TDataSet);
    procedure mteSravnPricePostAfterInsert(DataSet: TDataSet);
    procedure dbgPostKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgTovarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mtePostBeforePost(DataSet: TDataSet);
    procedure dbgPostExit(Sender: TObject);
    procedure dbgTovarExit(Sender: TObject);
    procedure actChooseBestPostExecute(Sender: TObject);
    procedure mteTovarBeforePost(DataSet: TDataSet);
    procedure TabSheet1Show(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure tsSravnPriceShow(Sender: TObject);
    procedure tsAllPricesShow(Sender: TObject);
    procedure actFillFactAndSravnPriceExecute(Sender: TObject);
    procedure mtePostEXCLUDEDChange(Sender: TField);
    procedure actShowSpecExecute(Sender: TObject);
    procedure cdsSravnPriceCalcFields(DataSet: TDataSet);
    procedure actFillFactExecute(Sender: TObject);
    procedure actFillPriceExecute(Sender: TObject);
    procedure dbgRepFactDblClick(Sender: TObject);
    procedure actRefreshPriceExecute(Sender: TObject);
    procedure cdsSravnPostWithPriceCalcFields(DataSet: TDataSet);
    procedure tsSravnPostWithPriceShow(Sender: TObject);
  private
    { Private declarations }
    setT: TfrmSettings;
    SettingsDataset : TfmSettingsDataset;
    SettingsDate : TfmSettingsDate;
    SettingsNumber :TfmSettingsNumber;
    SettingsTipDetail1 : TfmSettingsPlugin;
    SettingsTipDetail2 : TfmSettingsPlugin;
    FiColumn : integer;
    FdtsNaklo : TDataSet;
    FdtsNaklot : TDataSet;
    FdtsNaklot2 : TDataSet;
    sFilter : string; //фильтр по товарам. налагается на отчёт по прайсам
    SemaphoremtePostAfterPost :boolean;//отключает сброс галочек в списке поставщиков
    //FdOldDate : TDate;//дата сравнения до изменения настроек, используется, чтобы
    //узнать каких поставщиков перебивать на новую дату
    //FbCompareSelectedToOthers : boolean;
    //FbCompareManuallySelectedToOthers : boolean;
    //Fid_column_selected : integer;
    FIdSravnPrice : integer;
    procedure ProcessColumns;
    procedure UnProcessColumns;
    procedure UpdateCaption;
    procedure FillDate;
    procedure AddPriceToFactTable;
    procedure SravnPriceColumnCreate;
    //procedure FillSravnPrice2;
    procedure FillSravnPrice3;
    procedure  FillColumnName2;
    procedure ChooseBestPost ;
 //   function  ShowSpecList: integer;
    //function SpecShow(iSpec: integer):TForm;
    //function GetNewOrExistedSpec(bAutoCreate:boolean=false): integer;
{    function ProcessSelectedRecords(dbgRep :TDbGridEh;
      ProcessPositForSpec:TProcessPositForSpec;
      frmSpec:TfrmSpec):integer;
      }
    //procedure LocateRecordInFactTable(dbgGrid: TDbGridEh;
    //  dtsSravnPricePost,dtsFactTable: TDataSet);
//    function CheckIfFColumnsSelected(dbgGrid: TDbGridEh) : boolean;
    procedure FillSpecOstRazm(id_nakl: integer);
    procedure ProcessMode;
    procedure ProcessTipPosit;
    procedure FillMode;
    procedure FillPosit;
    procedure FillPrice;
    procedure ProcessColumnsPrice;
    procedure UnProcessColumnsPrice;
    procedure FillSpecWithPrice(
      DataSetRep, DataSetFromPost,DataSetFromPrice : TDataSet);
  public
    { Public declarations }
    function SetInternalDatasetsForSave(dsNaklo,dsNaklot ,dsNaklot2 : TDataSet):boolean;
    function SetSettings: boolean;
    function SetTovarPostSettings : boolean;
  end;

var
  frmSravnSpec: TfrmSravnSpec;

implementation

{$R *.dfm}


uses RepPrice, //TfrmRepPrice
  Math, // MaxDouble
  StrUtils, //AnsiStartsStr
  DetSelect, //frmDetSelect

  untNaklrList;


procedure TfrmSravnSpec.actRefreshExecute(Sender: TObject);
begin
try
  if not FdtsNaklo.Locate('id_nakl', FIdSravnPrice,[]) then begin
    AssertInternal('DE7F50D1-4AE0-4F80-91F1-70790FFF0AE0'+inttostr(FIdSravnPrice));
  end;
  UpdateCaption;
  actFillFact.Execute;
  UnProcessColumns;
  actSravnPrice.Execute;
  actFillPrice.Execute;
  //закрыть оравнение с прайсом, чтобы при
  //переключении на эту вкладку отчёт пересчитался
  if cdsSravnPostWithPrice.active then begin
    //cdsSravnPostWithPrice.EmptyDataSet;
  end;
  cdsSravnPostWithPrice.Close;
  cdsSravnPostWithPrice.FieldDefs.Clear;
  //dsSravnPostWithPrice.DataSet.createdataset;
  ProcessColumns;
except
  AssertInternal('0C853FC3-A65D-4E46-B1CE-A5D779940F89');
end;
end;

procedure TfrmSravnSpec.actSettingsExecute(Sender: TObject);
begin
  actSettings.checked := setT.ProcessSettingsChange(actRefresh);
end;

procedure TfrmSravnSpec.UpdateCaption;
begin
  self.Caption := 'Сравнение спецификаций в ' +
    FdtsNaklo.fieldByName('currency').asString + ' на '+
    FdtsNaklo.fieldByName('dat').asString+ ' для сравнения : '+
    FdtsNaklo.fieldByName('comment').asString;
end;


procedure TfrmSravnSpec.FormCreate(Sender: TObject);
begin
  if not mtePost.Active then begin
    mtePost.CreateDataSet;
  end;
  if not mteTovar.Active then begin
    mteTovar.CreateDataSet;
  end;
  if not mteSravnPricePost.Active then begin
    mteSravnPricePost.CreateDataSet;
  end;
  if not mteFactTable.Active then begin
    mteFactTable.CreateDataSet;
  end;
  setT := TfrmSettings.Create(self);
  setT.actDataOff.Execute;
  setT.actManagerOff.Execute;
  dmdEx.OpenQuery(dmdEx.dsPrice.DataSet,true);
  dmdEx.OpenQuery(dmdEx.dsCurrency.DataSet,true);
  dmdEx.OpenQuery(dmdEx.dsPost.DataSet,true);
  dmdEx.OpenQuery(dmdEx.dsVlad.DataSet,true);
  FillPosit;
  FillDate;
  FillPrice;
  FillMode;
  PageControl1.ActivePage :=tsSravnPrice;
end;

procedure TfrmSravnSpec.actDetailExecute(Sender: TObject);
var
  frmRepPrice : TfrmRepPrice;
  sFieldName,sTemp :string;
  iNumberField : integer;
  //dZakupka, dCenaFrom,dMinPrice,dPrice,
  dTo: double;
  //iTovar,i,id_analog: integer;
begin
try
  if PageControl1.ActivePage= tsAllPrices then begin
    if not dsFactTable.dataset.Active then begin
      exit;
    end;
    if (dsFactTable.dataset.eof and dsFactTable.DataSet.Bof)  then begin
      exit;
    end;
    frmSpec := TfrmSpec.Create(application);
    frmSpec.qeNaklo.SetSQL('where','id_nakl ='+
      dsFactTable.DataSet.FieldByName('id_nakl').asString,0);
    frmSpec.DefaultOpen;
    frmSpec.dsNaklot.dataset.Locate('id_tovar',
      dsFactTable.DataSet.FieldByName('id_tovar').asString,[]);
    exit;
  end; //if PageControl1.ActivePage= tsAllPrices
  if PageControl1.ActivePage= tsSravnPrice then begin
    if not dsSravnPrice.dataset.Active then begin
      exit;
    end;
    if (dsSravnPrice.dataset.eof and dsSravnPrice.DataSet.Bof)  then begin
      exit;
    end;

    if dbgRep.SelectedField.FieldName='CENA' then begin
      if not FdtsNaklo.Locate('id_nakl', FIdSravnPrice,[]) then begin
        AssertInternal('B1C95837-F903-4F86-A350-9165978F0192'+inttostr(FIdSravnPrice));
      end;
      frmRepPrice :=TfrmRepPrice.Create(Self);
      frmRepPrice.SetPost(dsSravnPrice.DataSet.FieldByName('id_post').asInteger);
      frmRepPrice.SetDate(FdtsNaklo.FieldByName('dat').AsDateTime);
      frmRepPrice.SetCurrency(FdtsNaklo.FieldByName('id_sklad').asInteger);
      //если сохранённый лучший поставщик ещё участвует в сравнении
      //то для лучшего входа взять сохранённый курс и дату поставщика
      //если же поставщик не найден, то дата и курс берутся текущие
      //при этом получаются другие входы
      if dsPost.DataSet.Locate(
        'id_post;in_list',
        vararrayof([dsSravnPrice.DataSet.FieldByName('id_post').asInteger,
        1]),[])
      then begin
        frmRepPrice.SetKurs(dsPost.DataSet.FieldByName('kurs').AsVariant);
        frmRepPrice.SetDate(dsPost.DataSet.FieldByName('dat').AsDateTime);
      end;

      frmRepPrice.actRefresh.execute;
      frmRepPrice.qeRep.SetFilter(
        '[id_analog]='+
        dsSravnPrice.DataSet.FieldByName('id_analog').asString,
        1);
      frmRepPrice.qeRep.ApplyFilter;
    end;
    if (AnsiStartsStr('F',dbgRep.SelectedField.FieldName) or
    AnsiStartsStr('M',dbgRep.SelectedField.FieldName)) then begin
      sFieldName := Copy(dbgRep.SelectedField.FieldName,2,Length(dbgRep.SelectedField.FieldName)-1);
      iNumberField := strtoint(sFieldName);
      if dsSravnPricePost.DataSet.Locate('id_column',iNumberField,[]) then begin
        //получить закупку и всё остальное для выбранной позиции
        dsFactTable.DataSet.Filter:=
          '[id_post]='+
          dsSravnPricePost.DataSet.FieldByName('id_post').asString+
          ' and [id_analog]='+
          dsSravnPrice.dataset.FieldByName('id_analog').AsString+
          ' and [dat]='+
          quotedstr(dsSravnPricePost.dataset.FieldByName('dat').asString);
        dsFactTable.DataSet.Filtered :=true;
        PageControl1.ActivePage :=tsAllPrices;
      end else begin
        AssertInternal('336D909A-56DD-4671-951E-D3DACAD26CAD_id_column_not_found'+inttostr(iNumberField));
      end;
    end;  //if AnsiStartsStr('F',dbgRep.SelectedField.FieldName) then begin
    if  dbgRep.SelectedField.FieldName='VXOD_POST' then begin
      if not FdtsNaklo.Locate('id_nakl', FIdSravnPrice,[]) then begin
        AssertInternal('8D886F62-123E-409D-AA8A-2815B0951E54'+inttostr(FIdSravnPrice));
      end;
      frmRepPrice :=TfrmRepPrice.Create(Application);
      self.SetFocus;
      sTemp := setT.GetPluginResult('fmSettingsDataset');
      frmRepPrice.SetPost(sTemp);
      sTemp := setT.GetPluginResult('fmSettingsDate');
      frmRepPrice.SetDate(sTemp);
      //Валюта
      frmRepPrice.SetCurrency(FdtsNaklo.FieldByName('id_sklad').asInteger);
      sTemp := setT.GetPluginResult('fmSettingsNumber');
      if sTemp = '' then begin
        frmRepPrice.SetKurs(Null);
      end else begin
        dTo := strtofloat(sTemp);
        frmRepPrice.SetKurs(dTo);
      end;
      frmRepPrice.actRefresh.Execute;
      frmRepPrice.qeRep.SetFilter(
        '[id_analog]='+
        dsSravnPrice.DataSet.FieldByName('id_analog').asString,
        1);
      frmRepPrice.qeRep.ApplyFilter;
    end; //if  dbgRep.SelectedField.FieldName='VXOD_POST'
  end; //if PageControl1.ActivePage= tsSravnPrice
except
  AssertInternal('0A5681C4-68F0-4507-838C-CA2125CDD1DD');
end;
end;

procedure TfrmSravnSpec.actDebugExecute(Sender: TObject);
begin
{
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


    cdsRep.FieldByName('DAT').visible := true;
    cdsRep.FieldByName('ID_NAKL').visible := true;
    cdsRep.FieldByName('TIP').visible := true;
  end else begin //if actDebug checked
    cdsRep.FieldByName('ID_CURRENCY').visible := false;
    cdsRep.FieldByName('ID_PRICE').visible := false;
    cdsRep.FieldByName('ID_TOVAR').visible := false;
    cdsRep.FieldByName('ID_SKIDKA').visible := false;
    cdsRep.FieldByName('ID_POST').visible := false;
    cdsRep.FieldByName('ID_USL_POSTAVKA').visible := false;
    cdsRep.FieldByName('ID_ANALOG').visible := false;

    cdsRep.FieldByName('DAT').visible := false;
    cdsRep.FieldByName('ID_NAKL').visible := false;
    cdsRep.FieldByName('TIP').visible := false;
  end;  //if actDebug checked      }
end;

procedure TfrmSravnSpec.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
try
  FdtsNaklot:=nil;
  FdtsNaklot2:=nil;
  FdtsNaklo:=nil;  
  //actSave.Execute;
  dmdEx.CloseQuery(dmdEx.dsPrice.DataSet,false);
  dmdEx.CloseQuery(dmdEx.dsCurrency.DataSet,false);
  dmdEx.CloseQuery(dmdEx.dsPost.DataSet,false);
  dmdEx.CloseQuery(dmdEx.dsVlad.DataSet,false);
  Action := caFree;
except
  AssertInternal('571D40C4-BC50-4695-B81E-0CD4AE2185F8');
end;
end;

procedure TfrmSravnSpec.dbgRepFactKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return : begin
      actDetail.Execute;
    end;
  end;//case
end;

procedure TfrmSravnSpec.dbgRepDblClick(Sender: TObject);
begin
  actDetail.Execute;
end;

procedure TfrmSravnSpec.FillDate;
begin
  SettingsDate := TfmSettingsDate.Create(setT);
  setT.AddPlugin(SettingsDate);
  SettingsDate.SetResultType(1);
end;


procedure TfrmSravnSpec.cdsNaklotReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  showmessage (e.Message);
  Action := raCancel;
end;

procedure TfrmSravnSpec.TabSheet1Exit(Sender: TObject);
begin
  if dsPost.DataSet.State in [dsEdit,dsInsert] then begin
    dsPost.DataSet.Post;
  end;
end;

procedure TfrmSravnSpec.TabSheet2Exit(Sender: TObject);
begin
  if dsTovar.DataSet.State in [dsEdit,dsInsert] then begin
    dsTovar.DataSet.Post;
  end;
end;

procedure TfrmSravnSpec.mtePostAfterInsert(DataSet: TDataSet);
var
  sTemp : string;
  dTo : Tdate;
begin
  DataSet.FieldByName('in_list').asInteger :=1;
  DataSet.FieldByName('excluded').asInteger :=0;
  //если почему либо не известна дата, то это - сегодня
  dTo := Today;
  //Но вообще-то дата всегда должна быть в настройках
  sTemp := setT.GetPluginResult('fmSettingsDate');
  if sTemp <> '' then begin
    dTo := strtodate(sTemp);
  end;
  DataSet.FieldByName('dat').AsDateTime := dTo;
end;

procedure TfrmSravnSpec.mteTovarAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('in_list').asInteger :=1;
end;

procedure TfrmSravnSpec.actFillFactExecute(Sender: TObject);
var
  id_post : integer;
  dat  : TDate;
//  Bookmark: TBookmark;
begin
try
  dmdEx.StartWaiting;
  PageControl1.ActivePage := tsAllPrices;
  
  mteFactTable.EmptyDataSet;
  mteFactTable.close;
  mteFactTable.open;
  mteFactTable.Filtered:=false;
  mteSravnPricePost.EmptyTable;
  dsSravnPricePost.DataSet.Close;
  dsSravnPricePost.DataSet.Open;

  dsFactTable.DataSet.DisableControls;
  mteTovar.SortByFields('GRUPPA1,GRUPPA2,GRUPPA3,GRUPPA4');
  sFilter := FilterListCreate(FdtsNaklot,'id_tovar');
  //разные имена полей, переименовываем
  sFilter := AnsiReplaceStr (sFilter,'id_tovar','[id_analog]');
  dsPost.DataSet.First;

  while not dsPost.DataSet.Eof do begin
    dat := dsPost.DataSet.FieldByName('dat').asDateTime;
    id_post := dsPost.DataSet.FieldByName('id_post').asInteger;
    dsPost.DataSet.Filter:='[id_post]='+inttostr(id_post)+
      ' and  [dat]>='+quotedstr(datetostr(dat));
    dsPost.DataSet.Filtered:=true;
    if dsPost.DataSet.RecordCount=1 then begin
      AddPriceToFactTable;
    end;
    dsPost.DataSet.Filtered:=false;
    dsPost.DataSet.Locate('id_post;dat',vararrayof([id_post,datetostr(dat)]),[]);
    dsPost.DataSet.Next;
  end; //while not eof post
  dsFactTable.DataSet.EnableControls;
  dmdEx.StopWaiting;
except
  AssertInternal('5A27204E-5ACA-4EEB-96EC-BD6A79629BC0');
end;
end;

procedure TfrmSravnSpec.AddPriceToFactTable;
var
  DataSet, FactDataSet : TDataSet;
begin
  DataSet :=dsSpecPrice.DataSet;
  FactDataSet := dsFactTable.DataSet;
  DataSet.Close;
  TClientDataSet(DataSet).Params.ParamByName('id_post_in').asInteger :=
    dsPost.DataSet.FieldByName('id_post').asInteger;
  TClientDataSet(DataSet).Params.ParamByName('id_sravn_price_in').asInteger :=
    FdtsNaklo.FieldByName('id_nakl').asInteger;
  TClientDataSet(DataSet).Params.ParamByName('dat_in').AsDate :=
    dsPost.DataSet.FieldByName('dat').AsDateTime;
  TClientDataSet(DataSet).Params.ParamByName('id_currency_in').asInteger :=
    FdtsNaklo.FieldByName('id_sklad').asInteger;
  if dsPost.DataSet.FieldByName('kurs').isNull then begin
    TClientDataSet(DataSet).Params.ParamByName('kurs_in').Clear;
  end else begin
    TClientDataSet(DataSet).Params.ParamByName('kurs_in').asFloat :=
      dsPost.DataSet.FieldByName('kurs').asFloat;
  end;
  ProcessMode;
  //TClientDataSet(DataSet).Params.ParamByName('mode_in').asInteger := 0;
  DataSet.Open;
  DataSet.Filter := sFilter;
  DataSet.Filtered := true;
  if DataSet.RecordCount>0 then begin
    //Колонки добавляем только для поставщиков со спецификациями
    dsSravnPricePost.DataSet.Insert;
    dsSravnPricePost.DataSet.FieldByName('id_post').asInteger :=
      dsPost.DataSet.FieldByName('id_post').asInteger;
    dsSravnPricePost.DataSet.FieldByName('dat').AsDateTime :=
      dsPost.DataSet.FieldByName('dat').AsDateTime;
    dsSravnPricePost.DataSet.FieldByName('column_name').asString :=
      dsPost.DataSet.FieldByName('post').AsString+'_'
      +dsPost.DataSet.FieldByName('dat').AsString;
    dsSravnPricePost.DataSet.Post;
  end;

  CopyDatasetFields(DataSet,FactDataSet,
    'dat;id_post;id_tovar;id_analog;cena;cena_from;kolotp;zatraty;id_nakl;'+
    'usl_postavka_id_nakl;kurs;kurs_indirect;id_currency;nalog_nds',
    'dat;id_post;id_tovar;id_analog;cena;cena_from;kolotp;zatraty;id_nakl;'+
    'usl_postavka_id_nakl;kurs;kurs_indirect;id_currency;nalog_nds',
    '', '', 3);

  DataSet.Close;
  DataSet.Filtered := false;
end;

procedure TfrmSravnSpec.actSravnPriceExecute(Sender: TObject);
//var
//  id_nakl : integer;
begin
try
  if dsFactTable.DataSet.Active then begin
    dmdEx.StartWaiting;
    if dsSravnPrice.DataSet.Active then begin
      psGrid.SaveProperties;
    end;
    if cdsSravnPrice.Active then begin
      qeSravnPrice.SavePosition;
    end;
    //UnProcessColumns;
    FillColumnName2;
    SravnPriceColumnCreate;
    dsFactTable.DataSet.DisableControls;
    dsSravnPrice.DataSet.DisableControls;
    FillSravnPrice3;
    if cdsSpecPrice.Params.ParamByName('mode_in').asInteger=2 then begin
      FillSpecOstRazm(FIdSravnPrice);
    end;
    ProcessTipPosit;
    psGrid.LoadProperties;
    qeSravnPrice.GetPosition(false);
    dsSravnPrice.DataSet.EnableControls;
    dsFactTable.DataSet.EnableControls;
    dmdEx.StopWaiting;
  end else begin
    MessageDlg ('Рассчитайте цены',mtWarning,[mbOK],0);
  end;
except
  AssertInternal('98A38B7C-EDD6-4418-B40F-C544ABE39322');
end;
end;

//Выбираем лучшего поставщика по строке
procedure  TfrmSravnSpec.ChooseBestPost;
var
  iMinColumn , id_post, id_column_selected:integer;
  dMinPrice, dMinPreviousPrice,dPrice :double;
  sFieldName : string;
  dat : TDate;
  vResult : variant;
  bCompareSelectedToOthers : boolean;
begin
try
//  dsSravnPrice.DataSet.DisableControls;
//  dsFactTable.DataSet.DisableControls;
  ProgressBar1.Min :=0;
  ProgressBar1.Max := dsSravnPrice.DataSet.RecordCount;
  ProgressBar1.Show;
  id_column_selected:=0;
  iMinColumn:=0;
  //режим сравнения по поставщику или по лидеру
  if dsPost.DataSet.Locate('excluded','1',[]) then begin
    bCompareSelectedToOthers := true;
    id_column_selected  := dsSravnPricePost.DataSet.Lookup('id_post;dat',
      vararrayof([
        dsPost.DataSet.FieldByName('id_post').asInteger,
        dsPost.DataSet.FieldByName('dat').asDateTime
      ]),
      'id_column'
    );
  end else begin
    bCompareSelectedToOthers := false;
  end;

  //все строчки таблицы сравнения
  dsSravnPrice.DataSet.First;
  while not dsSravnPrice.DataSet.eof do begin
    dMinPreviousPrice := MaxLongint;
    dMinPrice := MaxLongint;
    dsSravnPricePost.DataSet.First;
    while not dsSravnPricePost.DataSet.eof do begin
      sFieldName := 'F'+inttostr(dsSravnPricePost.DataSet.FieldByName('id_column').asInteger);
      if (not dsSravnPrice.DataSet.FieldByName(sFieldName).isNull) then begin
        dPrice:=dsSravnPrice.DataSet.FieldByName(sFieldName).AsFloat;
        //если режим сравнения по поставщику, то его цены не попадают в минимальные,
        //а минимальные без него сравниваюся с его ценами
        if not bCompareSelectedToOthers then begin
          if dPrice<dMinPrice then begin
            dMinPreviousPrice := dMinPrice;
            dMinPrice:=dPrice;
            iMinColumn:= dsSravnPricePost.DataSet.FieldByName('id_column').asInteger;
          end else begin
            //если минимум уже найден, а вторая цена ещё нет
            if dPrice<dMinPreviousPrice then begin
              dMinPreviousPrice := dPrice;
            end; //if dPrice<dMinPreviousPrice
          end;
        end else begin
          if dsSravnPricePost.DataSet.FieldByName('id_column').asInteger<>id_column_selected then begin
            if dPrice<dMinPrice then begin
              dMinPrice:=dPrice;
              iMinColumn:= dsSravnPricePost.DataSet.FieldByName('id_column').asInteger;
            end;
          end;
        end;
      end; //
      dsSravnPricePost.DataSet.Next;
    end; //   while not dsSravnPricePost.DataSet.eof
    dsSravnPrice.DataSet.Edit;
    //если был хоть один поставщик по товару
    if  dMinPrice<> MaxLongint then begin
      dsSravnPrice.DataSet.FieldByName('cena').asFloat :=dMinPrice;
      vResult:= dsSravnPricePost.DataSet.Lookup('id_column',iMinColumn,'id_post;dat');
      id_post := varasType(vResult[0],varInteger);
      dat := varasType(vResult[1],varDate);
      dsSravnPrice.DataSet.FieldByName('id_post').asInteger := id_post;
      dsSravnPrice.DataSet.FieldByName('dat').asDateTime := dat;
      if dsFactTable.DataSet.Locate(
        'id_post;dat;id_analog;cena',
        vararrayof([
          dsSravnPrice.DataSet.FieldByName('id_post').asInteger,
          dsSravnPrice.DataSet.FieldByName('dat').asDateTime,
          dsSravnPrice.DataSet.FieldByName('id_analog').asInteger,
          dsSravnPrice.DataSet.FieldByName('cena').asFloat
        ]),[]) then begin
        dsSravnPrice.DataSet.FieldByName('zakupka').asFloat :=
          dsFactTable.DataSet.FieldByName('zakupka').asFloat;
        dsSravnPrice.DataSet.FieldByName('cena_from').asFloat :=
          dsFactTable.DataSet.FieldByName('cena_from').asFloat;
        dsSravnPrice.DataSet.FieldByName('id_tovar').asInteger :=
          dsFactTable.DataSet.FieldByName('id_tovar').asInteger;
      end; //if dsFactTable.DataSet.Locate(
    end; //if  dMinPrice<> MaxLongint
    //если режим сравнения по лидеру, то второй ценой будет цена лидера.
    if bCompareSelectedToOthers then begin
      sFieldName := 'F'+inttostr(id_column_selected);
      if (not dsSravnPrice.DataSet.FieldByName(sFieldName).isNull) then begin
        dMinPreviousPrice := dsSravnPrice.DataSet.FieldByName(sFieldName).AsFloat;
      end;
    end;
    //Если было хоть две цены на товар, то сравнить их
    //были найдены минимумы и предминимумы
    if ((dMinPreviousPrice<> MaxLongint) and (dMinPrice<> MaxLongint)) then begin
      if dMinPrice=0 then begin
        //при делении на 0 результат null
        dsSravnPrice.DataSet.FieldByName('procent').Clear;
      end else begin
        if dMinPrice<dMinPreviousPrice then begin
          //сколько процентов должен скинуть 2-ой, чтобы стать 1-м
          dsSravnPrice.DataSet.FieldByName('procent').asFloat :=
            (1-(dMinPrice/dMinPreviousPrice))*100;
        end else begin
          if (dMinPreviousPrice=0) then begin
            //при делении на 0 результат null
            dsSravnPrice.DataSet.FieldByName('procent').Clear;
          end else begin
            //при минусе. Сколько процентов должен стать первый кроме выбранного
            //чтобы стать выбранным
            dsSravnPrice.DataSet.FieldByName('procent').asFloat :=
              ((dMinPreviousPrice/dMinPrice)-1)*100;
          end;
        end;
      end;
    end;
    dsSravnPrice.DataSet.Post;

    dsSravnPrice.DataSet.Next;
    ProgressBar1.StepIt;
  end;  //while not dsSravnPrice.DataSet.eof
//  dsFactTable.DataSet.EnableControls;
//  dsSravnPrice.DataSet.enablecontrols;
  ProgressBar1.Hide;
  PageControl1.ActivePage := tsSravnPrice;
except
  AssertInternal('B5E502D7-4939-46D8-A4E0-1723BE41912A');
end;
end;

//создаёт в результате кол-во колонок по количеству поставщиков
//даже если цен у них нет
//должна работать быстрее
procedure  TfrmSravnSpec.FillColumnName2;
begin
try
  FiColumn :=  0;
except
  AssertInternal('114B088B-70D3-42C8-86A4-4F37001F40D1');
end;
end;

//создаёт в результате кол-во колонок по которым  есть хоть одна цена
procedure   TfrmSravnSpec.SravnPriceColumnCreate;
var
  T: TFloatField;
  i: integer;
begin
  if cdsSravnPrice.Active then begin
    cdsSravnPrice.Close;
  end;
  dbgRep.Columns.Clear;
  for i:=cdsSravnPrice.fields.count-1 downto 0 do begin
    if AnsiStartsText('F',cdsSravnPrice.fields[i].FieldName) then begin
      cdsSravnPrice.fields[i].Free;
    end;
  end;
  for i:=cdsSravnPrice.fields.count-1 downto 0 do begin
    if AnsiStartsText('M',cdsSravnPrice.fields[i].FieldName) then begin
      cdsSravnPrice.fields[i].Free;
    end;
  end;
  for i:=cdsSravnPrice.fields.count-1 downto 0 do begin
    if AnsiStartsText('N',cdsSravnPrice.fields[i].FieldName) then begin
      cdsSravnPrice.fields[i].Free;
    end;
  end;
  for i:=cdsSravnPrice.fields.count-1 downto 0 do begin
    if AnsiStartsText('Z',cdsSravnPrice.fields[i].FieldName) then begin
      cdsSravnPrice.fields[i].Free;
    end;
  end;
  cdsSravnPrice.FieldDefs.Clear;
  dsSravnPricePost.DataSet.First;
  while not dsSravnPricePost.DataSet.eof do begin
    //цена
    T := TFloatField.Create(cdsSravnPrice);
    T.Precision := 15;
    T.FieldName := 'F'+inttostr(dsSravnPricePost.DataSet.FieldByName('id_column').asInteger);
    T.Name := cdsSravnPrice.Name + T.FieldName;
    T.Index := cdsSravnPrice.FieldCount;
    T.DisplayLabel := dsSravnPricePost.DataSet.FieldByName('column_name').asString;
    //T.DisplayWidth := Length (dsSravnPricePost.DataSet.FieldByName('column_name').asString);
    T.DisplayWidth := 10;
    T.DisplayFormat := '0.00';
    T.DataSet := cdsSravnPrice;
    //колво
    T := TFloatField.Create(cdsSravnPrice);
    T.Precision := 15;
    T.FieldName := 'M'+inttostr(dsSravnPricePost.DataSet.FieldByName('id_column').asInteger);
    T.Name := cdsSravnPrice.Name + T.FieldName;
    T.Index := cdsSravnPrice.FieldCount;
    T.DisplayLabel := 'Кол-во '+dsSravnPricePost.DataSet.FieldByName('column_name').asString;
    T.DisplayWidth := 6;
    T.DisplayFormat := '0.000';
    T.DataSet := cdsSravnPrice;
    //%
    T := TFloatField.Create(cdsSravnPrice);
    T.Precision := 15;
    T.FieldKind := fkInternalCalc;
    T.FieldName := 'N'+inttostr(dsSravnPricePost.DataSet.FieldByName('id_column').asInteger);
    T.Name := cdsSravnPrice.Name + T.FieldName;
    T.Index := cdsSravnPrice.FieldCount;
    T.DisplayLabel := '% '+dsSravnPricePost.DataSet.FieldByName('column_name').asString;
    T.DisplayWidth := 5;
    T.DisplayFormat := '0.00';
    T.FieldKind := fkInternalCalc;
    T.DataSet := cdsSravnPrice;
    //сумма
    T := TFloatField.Create(cdsSravnPrice);
    T.Precision := 15;
    T.FieldName := 'Z'+inttostr(dsSravnPricePost.DataSet.FieldByName('id_column').asInteger);
    T.Name := cdsSravnPrice.Name + T.FieldName;
    T.Index := cdsSravnPrice.FieldCount;
    T.DisplayLabel := 'Сумма '+dsSravnPricePost.DataSet.FieldByName('column_name').asString;
    T.DisplayWidth := 10;
    T.DisplayFormat := '0.00';
    T.FieldKind := fkInternalCalc;
    T.DataSet := cdsSravnPrice;

    dsSravnPricePost.DataSet.Next;
  end;
  cdsSravnPrice.CreateDataSet;
end;


procedure TfrmSravnSpec.FillSravnPrice3;
var
  vFieldName : variant;
  sFieldName,sFieldNameCena,sFieldNameKolotp : string;
  iTovar : integer;
  dPrice :double;
  //dMinPreviousPrice , dMinPrice,dPrice,dZakupka,dCenaFrom :double;
  //sMinColumn : string;
  dKolotp: double;
  //sTemp : string;
begin
try
  dsTovar.DataSet.First;
  ProgressBar1.Min:= 0;
  ProgressBar1.Max:=dsTovar.DataSet.RecordCount;
  ProgressBar1.Show;
  //фильтруем таблицу фактов по одному товару
  while not dsTovar.DataSet.Eof do begin
    if dsTovar.DataSet.FieldByName('in_list').asInteger=1 then begin
      iTovar := dsTovar.DataSet.FieldByName('id_tovar').asInteger;
      dsSravnPrice.DataSet.Append;
      dsSravnPrice.DataSet.FieldByName('kolotp').asFloat :=
        dsTovar.DataSet.FieldByName('kolotp').asFloat;
      dsSravnPrice.DataSet.FieldByName('cena').asFloat :=
        dsTovar.DataSet.FieldByName('cena').asFloat;
      dsSravnPrice.DataSet.FieldByName('id_post').asFloat :=
        dsTovar.DataSet.FieldByName('id_post').asFloat;
      dsSravnPrice.DataSet.FieldByName('id_analog').AsInteger :=
        dsTovar.DataSet.FieldByName('id_tovar').AsInteger;
      dsSravnPrice.DataSet.FieldByName('analog').AsVariant :=
        dsTovar.DataSet.FieldByName('tovar').AsVariant;
      dsFactTable.DataSet.Filter:='[id_analog]='+inttostr(iTovar);
      dsFactTable.DataSet.Filtered:=true;
      if dsFactTable.DataSet.RecordCount>0 then begin
        dsFactTable.DataSet.First;
        while not dsFactTable.DataSet.Eof do begin
          vFieldName := dsSravnPricePost.DataSet.Lookup('id_post;dat',
            vararrayof([dsFactTable.DataSet.FieldByName('id_post').asInteger,
              dsFactTable.DataSet.FieldByName('dat').asDateTime]),
            'id_column');
          sFieldName:= VarAsType(vFieldName,varString);
          //т.е у поставщика убрана галочка "Участвует в сравнении
          if sFieldName<>'' then begin
            sFieldNameCena := 'F'+sFieldName;
            sFieldNameKolotp := 'M'+sFieldName;
              dPrice := dsFactTable.DataSet.FieldByName('cena').asFloat;
              dKolotp := dsFactTable.DataSet.FieldByName('kolotp').asFloat;
              //если были две спецификации одного поставщика на один товар,
              //то цена - средневзвешенная
              if dsSravnPrice.DataSet.FieldByName(sFieldNameKolotp).AsFloat>0 then begin
                dsSravnPrice.DataSet.FieldByName(sFieldNameCena).AsFloat :=
                RRoundTo((dsSravnPrice.DataSet.FieldByName(sFieldNameCena).AsFloat*
                dsSravnPrice.DataSet.FieldByName(sFieldNameKolotp).AsFloat+
                dPrice*dKolotp)/
                (dKolotp+dsSravnPrice.DataSet.FieldByName(sFieldNameKolotp).AsFloat),-4);
                dsSravnPrice.DataSet.FieldByName(sFieldNameKolotp).AsFloat :=
                  RRoundTo(dsSravnPrice.DataSet.FieldByName(sFieldNameKolotp).AsFloat
                  +dKolotp,-3);
              end else begin
                dsSravnPrice.DataSet.FieldByName(sFieldNameCena).AsFloat := dPrice;
                dsSravnPrice.DataSet.FieldByName(sFieldNameKolotp).AsFloat := dKolotp;
              end;
          end;//if   if vFieldName<>Null
          dsFactTable.DataSet.Next;          
        end; // while not dsFactTable.DataSet.Eof
      end; //if dsFactTable.DataSet.RecordCount>0
      dsSravnPrice.DataSet.CheckBrowseMode;
    end;  //if in_list
    dsTovar.DataSet.Next;
    ProgressBar1.StepIt;
  end; //while not dsTovar.DataSet.Eof
  ProgressBar1.Hide;
  dsFactTable.DataSet.Filter:='';
  dsFactTable.DataSet.Filtered:=false;

except
  AssertInternal('929A5DF8-80A1-42E4-ADAD-BE6B529E5357');
end;
end;


procedure TfrmSravnSpec.mteSravnPricePostBeforeInsert(DataSet: TDataSet);
begin
  inc(FiColumn);
end;

procedure TfrmSravnSpec.mteSravnPricePostAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('id_column').asInteger := FiColumn;
end;

procedure TfrmSravnSpec.dbgPostKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i: integer;
begin
  case key of
    vk_f8 : begin
      if not (dbgPost.DataSource.DataSet.bof and dbgPost.DataSource.DataSet.eof) then begin
        if dbgPost.Selection.SelectionType=gstRecordBookmarks then begin
          for i:= dbgPost.Selection.Rows.Count-1 downto 0 do begin

            dbgPost.DataSource.DataSet.GotoBookmark(pointer(dbgPost.SelectedRows.Items[i]));
            dbgPost.DataSource.DataSet.Delete;
          end;
          dbgPost.Selection.Clear;
        end else begin
          dbgPost.DataSource.DataSet.Delete;
        end;
      end;
      PostAndApply(dbgPost.DataSource.DataSet);
    end; //vk_f8
    vk_insert: begin
      dbgPost.DataSource.DataSet.Append;
    end;
  end;//case
end;

procedure TfrmSravnSpec.dbgTovarKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i: integer;
begin
  case key of
    vk_f8 : begin
      if not (dbgTovar.DataSource.DataSet.bof and dbgTovar.DataSource.DataSet.eof) then begin
        if dbgTovar.Selection.SelectionType=gstRecordBookmarks then begin
          for i:=dbgTovar.Selection.Rows.Count-1 downto 0 do begin
            dbgTovar.DataSource.DataSet.GotoBookmark(pointer(dbgTovar.SelectedRows.Items[i]));
            dbgTovar.DataSource.DataSet.Delete;
          end;
          dbgTovar.Selection.Clear;
        end else begin
          dbgTovar.DataSource.DataSet.Delete;
        end;
      end;
      PostAndApply(dbgTovar.DataSource.DataSet);
    end; //vk_f8
    vk_insert: begin
      dbgTovar.DataSource.DataSet.Append;
    end;
  end;//case
end;

procedure TfrmSravnSpec.mtePostBeforePost(DataSet: TDataSet);
begin
  if DataSet.FieldByName('id_post').isNull then begin
    DatabaseError('Введите поставщика', nil);
    //DATABASEERROR
    //showmessage();
    //abort;
  end
end;

procedure TfrmSravnSpec.dbgPostExit(Sender: TObject);
begin
  if dsPost.DataSet.State in [dsEdit,dsInsert] then begin
    dsPost.DataSet.Post;
  end;
end;

procedure TfrmSravnSpec.dbgTovarExit(Sender: TObject);
begin
  if dsTovar.DataSet.State in [dsEdit,dsInsert] then begin
    dsTovar.DataSet.Post;
  end;
end;


procedure TfrmSravnSpec.actChooseBestPostExecute(Sender: TObject);
begin
  ChooseBestPost;
end;

function TfrmSravnSpec.SetInternalDatasetsForSave(dsNaklo, dsNaklot,
  dsNaklot2: TDataSet): boolean;
begin
  Result :=true;
  FdtsNaklo := dsNaklo;
  FdtsNaklot := dsNaklot;
  FdtsNaklot2 := dsNaklot2;
  //dsTovar.DataSet := FdtsNaklot;
  //dsPost.DataSet  := FdtsNaklot2;
end;

function TfrmSravnSpec.SetSettings: boolean;
var
  iTemp : integer;
begin
  Result :=true;
  FIdSravnPrice := FdtsNaklo.FieldBYName('id_nakl').asINteger;
  //выбираем точное название для Укк
  iTemp := dmdEx.GetDefaultVlad;
  SettingsDataset.SetKeyValue(iTemp);

  SettingsDate.SetKeyValue (FdtsNaklo.FieldBYName('dat').AsDateTime);  
{
  Result :=true;
  if Assigned(FdtsNaklo) then begin
    SettingsDataset.SetKeyValue(FdtsNaklo.FieldByName('id_sklad').asInteger);
    SettingsDate.SetKeyValue(FdtsNaklo.FieldByName('dat').AsDateTime);
  end;}
end;

function TfrmSravnSpec.SetTovarPostSettings : boolean;
begin
  Result :=true;
  FdtsNaklot.First;
  while not FdtsNaklot.eof do begin
    try
      dsTovar.DataSet.Append;
      dsTovar.DataSet.fieldByName('id_tovar').AsInteger :=
        FdtsNaklot.FieldByName('id_tovar').asInteger;
      dsTovar.DataSet.fieldByName('id_post').AsInteger :=
        FdtsNaklot.FieldByName('id_post').asInteger;
      dsTovar.DataSet.FieldByName('in_list').asInteger :=
        FdtsNaklot.FieldByName('in_list').asInteger;
      dsTovar.DataSet.FieldByName('kolotp').asFloat :=
        FdtsNaklot.FieldByName('kolotp').asFloat;
      dsTovar.DataSet.FieldByName('cena').asFloat :=
        FdtsNaklot.FieldByName('cena').asFloat;
      dsTovar.DataSet.Post;
    except
      dsTovar.DataSet.Cancel;
    end;
    FdtsNaklot.Next;
  end;
  FdtsNaklot2.First;
  while not FdtsNaklot2.Eof do begin
    dsPost.DataSet.Append;
    dsPost.DataSet.fieldByName('id_post').AsInteger:=
      FdtsNaklot2.FieldByName('id_post').asInteger;
    dsPost.DataSet.fieldByName('dat').asDateTime :=
      FdtsNaklot2.FieldByName('dat').asDateTime;
    dsPost.DataSet.FieldByName('in_list').asInteger :=
      FdtsNaklot2.FieldByName('in_list').asInteger;
    dsPost.DataSet.FieldByName('excluded').asInteger :=
      FdtsNaklot2.FieldByName('id_pos').asInteger;
    dsPost.DataSet.FieldByName('kurs').AsVariant :=
      FdtsNaklot2.FieldByName('kurs').AsVariant;
    dsPost.DataSet.Post;
    FdtsNaklot2.Next;
  end;
end;

procedure TfrmSravnSpec.mteTovarBeforePost(DataSet: TDataSet);
var
  vResult  : Variant;
  iTovar : integer;
begin
  if DataSet.FieldByName('id_tovar').isNull then begin
    DatabaseError('Введите товар', nil);
   // showmessage('Введите товар');
   // abort;
  end;
  iTovar :=DataSet.FieldByName('id_tovar').asInteger;
  vResult :=dmdEx.cdsTovarAll.Lookup(
    'id',
    iTovar,
    'gruppa1;gruppa2;gruppa3;gruppa4');
  if vartype(vResult) <> varNull then begin
    DataSet.FieldByName('gruppa1').AsVariant := vResult[VarArrayLowBound(vResult,1)];
    DataSet.FieldByName('gruppa2').AsVariant := vResult[VarArrayLowBound(vResult,1)+1];
    DataSet.FieldByName('gruppa3').AsVariant := vResult[VarArrayLowBound(vResult,1)+2];
    DataSet.FieldByName('gruppa4').AsVariant := vResult[VarArrayLowBound(vResult,1)+3];
  end;
end;

procedure TfrmSravnSpec.TabSheet1Show(Sender: TObject);
begin
  dbgPost.SetFocus;
end;

procedure TfrmSravnSpec.TabSheet2Show(Sender: TObject);
begin
  dbgTovar.SetFocus;
end;


procedure TfrmSravnSpec.tsSravnPriceShow(Sender: TObject);
begin
  dbgRep.SetFocus;
end;

procedure TfrmSravnSpec.tsAllPricesShow(Sender: TObject);
begin
  dbgRepFact.SetFocus;
end;

procedure TfrmSravnSpec.actFillFactAndSravnPriceExecute(Sender: TObject);
begin
  actFillFact.Execute;
  actSravnPrice.Execute;
end;

procedure TfrmSravnSpec.mtePostEXCLUDEDChange(Sender: TField);
var
  id_post : integer;
  dat : TDate;
begin
  if ((Sender.NewValue=1) and (not SemaphoremtePostAfterPost)) then begin
    id_post := Sender.DataSet.FieldByName('id_post').asInteger;
    dat := Sender.DataSet.FieldByName('dat').asDateTime;
    Sender.dataset.first;
    while not Sender.dataset.Eof do begin
      if ((Sender.DataSet.FieldByName('id_post').asInteger<> id_post) or
        (dat <> Sender.DataSet.FieldByName('dat').asDateTime)) then begin
        //не та же запись
        if Sender.DataSet.FieldByName('excluded').asInteger=1 then begin
          //надо сбрось флаг
          SemaphoremtePostAfterPost := true;
          Sender.dataset.Edit;
          Sender.DataSet.FieldByName('excluded').asInteger:=0;
          Sender.dataset.Post;
          SemaphoremtePostAfterPost := false;
        end;
      end;
      Sender.dataset.next;
    end; //while not dataset.Eof
    Sender.dataset.Locate( 'id_post;dat',
        vararrayof([
          id_post,
          dat
        ]),[]);
    Sender.dataset.edit;
  end;// if not SemaphoremtePostAfterPost
end;

procedure TfrmSravnSpec.ProcessColumns;
var
  i : integer; 
begin
try
  //поле "Обратный курс" должно быть в виде галочки
  ShowCheckboxForColumn(ColumnByName(dbgRepFact.Columns,'KURS_INDIRECT'));
except
  AssertInternal('DD9FB5C0-42FF-494F-9267-B24726E36141');
end;
try
  //Всё для чтения
  for i:=0 to dbgRep.Columns.Count-1 do begin
    //Для сумм по поставщикам
    if AnsiStartsStr('Z',dbgRep.Columns[i].FieldName) then begin
      dbgRep.Columns[i].Footer.ValueType := fvtSum;
    end;//
    //Для количеств по поставщикам
    if AnsiStartsStr('M',dbgRep.Columns[i].FieldName) then begin
      dbgRep.Columns[i].Footer.ValueType := fvtSum;
    end;
    dbgRep.Columns[i].ReadOnly := true;
  end;
except
  AssertInternal('DE585837-CDC0-421C-980A-F5427C433C8B');
end;
try
  dbgRep.Columns[0].Footer.ValueType :=fvtCount;
  ColumnByName(dbgRep.Columns,'KOLOTP').Footer.ValueType :=fvtSum;
  ColumnByName(dbgRep.Columns,'KOLOTP_SPEC').Footer.ValueType :=fvtSum;
  ColumnByName(dbgRep.Columns,'DELTA_KOLOTP').Footer.ValueType :=fvtSum;
  //ColumnByName(dbgRep.Columns,'KOLOTP').ReadOnly:=false;
except
  AssertInternal('D81AF9AB-B3F8-443A-B49D-00B53E7CD0FC');
end;
end;

procedure TfrmSravnSpec.UnProcessColumns;
var
  i : integer; 
begin
  for i:=0 to dbgRep.Columns.Count-1 do begin
    dbgRep.Columns[i].ReadOnly := false;
  end;
end;

procedure TfrmSravnSpec.actShowSpecExecute(Sender: TObject);
var
  frmSpec: TfrmSpec;
begin
  frmSpec := TfrmSpec.Create(application);
  frmSpec.qeNaklo.SetSQL('where',
    'delmarked=0 and id_nakl in (select id_nakl from spec_det_vw sd where '+
    'sd.id_sebest='+FdtsNaklo.FieldByName('id_nakl').asString+
    ' group by sd.id_nakl)',0);
  frmSpec.DefaultOpen;
end;

procedure TfrmSravnSpec.cdsSravnPriceCalcFields(DataSet: TDataSet);
var
  i: integer;
  dSum,dKolotp,dCena,dSumWeight,dCenaVxodPrice,dCenaVxodPost,dSumPost : double;
  FieldCena : TField;
  sCenaFieldName,sCenaFieldName2,sIdColumnPost : string;
begin
  dCena:=0;
try
  if (DataSet.State = dsInternalCalc) then begin
    //Рассчёт суммы по постащику
    for i:=0 to DataSet.Fields.Count-1 do begin
      if AnsiStartsStr('Z',DataSet.Fields[i].FieldName) then begin
        sIdColumnPost :=DataSet.Fields[i].FieldName;
        sIdColumnPost := Copy(sIdColumnPost,2,Length(sIdColumnPost)-1);
        dSumPost := RRoundTo(DataSet.FieldByName('M'+sIdColumnPost).asFloat*
          DataSet.FieldByName('F'+sIdColumnPost).asFloat,
          -4);
        if dSumPost<>0 then begin
          DataSet.Fields[i].asFloat := dSumPost;
        end;
      end;
    end;//
    //рассчёт средневзвешенной цены и количества общего
    dSum :=0;
    dSumWeight:=0;
    for i:=0 to DataSet.Fields.Count-1 do begin
      if AnsiStartsStr('M',DataSet.Fields[i].FieldName) then begin
        dKolotp := DataSet.Fields[i].asFloat;
        sCenaFieldName := Copy(DataSet.Fields[i].FieldName,2,Length(DataSet.Fields[i].FieldName)-1);
        sCenaFieldName := 'F'+sCenaFieldName;
        FieldCena :=DataSet.FindField(sCenaFieldName);
        if FieldCena<>nil then begin
          dCena := FieldCena.asFloat;
        end;
        dSum := dSum+dKolotp;
        dSumWeight:= dSumWeight+ dCena*dKolotp;
      end;
    end;//for i:=0 to DataSet.Fields.Count
    if dSum<>0 then begin
      dSumWeight := dSumWeight/dSum;
      DataSet.FieldByName('cena_avg').asFloat := dSumWeight;
    end;
    DataSet.FieldByName('kolotp_spec').asFloat := dSum;
    //расчёт разниц в процентах между ценами заявок, и
    //лучшими теоретическими ценами
    for i:=0 to DataSet.Fields.Count-1 do begin
      if AnsiStartsStr('F',DataSet.Fields[i].FieldName) then begin
        sCenaFieldName2 := Copy(DataSet.Fields[i].FieldName,2,Length(DataSet.Fields[i].FieldName)-1);
        dCena:= DataSet.Fields[i].asFloat;
        if dCena<>0 then begin
          //нет цены в заявке - следовательно нет разницы цен
          dCenaVxodPrice :=DataSet.FieldByName('CENA').asFloat;
          if dCenaVxodPrice<>0 then begin
            //если есть средняя цена
            DataSet.FieldByName('N'+sCenaFieldName2).asFloat :=
              (1-(dCena/dCenaVxodPrice))*100;
          end;//if dCenaVxodPrice<>0
        end; //if dCena<>0
      end; //if AnsiStartsStr('F',DataSet.Fields[i].FieldName)
    end; //for i:=0 to DataSet.Fields.Count-1

    //разница количеств
    DataSet.FieldByName('DELTA_KOLOTP').asFloat :=
      RRoundTo(DataSet.FieldByName('kolotp').asFloat-
      DataSet.FieldByName('kolotp_spec').asFloat,
      -3);
    //% (к прайсу).

    if ((not DataSet.FieldByName('VXOD_POST').Isnull) and
      (not DataSet.FieldByName('cena_avg').Isnull))
    then begin
      dCenaVxodPost := DataSet.FieldByName('VXOD_POST').asFloat;
      //dSumWeight
      if  dCenaVxodPost > dSumWeight then begin
        DataSet.FieldByName('SKIDKA_POST').asFloat :=
          (1-(dSumWeight/dCenaVxodPost))*100;
      end else begin
        DataSet.FieldByName('SKIDKA_POST').asFloat :=
          (1-(dCenaVxodPost/dSumWeight))*100;
      end;
    end;
  end;  // if (DataSet.State = dsInternalCalc)
except
  AssertInternal('F3BDB58D-AE23-4CA5-971C-09E5B202BFDF');
end; 
end;

procedure TfrmSravnSpec.FillSpecOstRazm(id_nakl: integer);
//var
//  sTemp : string;
begin
try
  cdsSpecOstRazm.Close;
  cdsSpecOstRazm.Params.ParamByName('id_nakl').AsInteger := id_nakl;
  cdsSpecOstRazm.Open;
  
  CopyDatasetFields(dsSpecOstRazm.DataSet,dsSravnPrice.DataSet,
    'id_analog',
    'id_analog',
    'kolotp_razm',
    'spec_ost_razm', 0);
  cdsSpecOstRazm.Close;
  dsSravnPrice.DataSet.First;

  while not dsSravnPrice.DataSet.Eof do begin
    dsSravnPrice.DataSet.Edit;
    dsSravnPrice.DataSet.FieldByName('kolotp').asFloat :=
      dsSravnPrice.DataSet.FieldByName('kolotp').asFloat-
      dsSravnPrice.DataSet.FieldByName('spec_ost_razm').asFloat;
    dsSravnPrice.DataSet.Post;
    //очистка от пустых строк после вычитания спецификаций

    dsSravnPrice.DataSet.Next;
  end;
except
  AssertInternal('8A6F0673-A625-4505-9609-7277A88F4294');
end;
end;



procedure TfrmSravnSpec.FillMode;
begin
  SettingsTipDetail1 := setT.CreatePlugin('TfmSettingsTipDetail');
  setT.AddPlugin(SettingsTipDetail1);
  SettingsTipDetail1.SetLabelValue('Тип отчёта');
  SettingsTipDetail1.AddDetailTip('По всем документам');
  SettingsTipDetail1.AddDetailTip('По спецификациям');
  SettingsTipDetail1.AddDetailTip('По заявкам');
  SettingsTipDetail1.AddDetailTip('По подтвержденным заявкам');
  SettingsTipDetail1.SetKeyValue(0);
end;

procedure TfrmSravnSpec.FillPrice;
//var
//  iTemp : integer;
begin
  SettingsNumber := TfmSettingsNumber.Create(setT);
  //необязательное заполнение курса с 8 знаками после запятой
  SettingsNumber.SetResultType(2);
  //все надписи для пользователя
  //включая даже не нужное сообщение об ошибке заполнения
  SettingsNumber.SetLabelValue(
    'Курс','Ввод курса','Не введён курс');
  setT.AddPlugin(SettingsNumber);

  SettingsDataset := TfmSettingsDataset.Create(setT);
  //SettingsDataset2.Name := 'fmSettingsDataset2';
  //все надписи для пользователя
  //включая даже не нужное сообщение об ошибке заполнения
  SettingsDataset.SetLabelValue(
    'Поставщик','Выбор поставщика','Не выбран поставщик');
  SettingsDataset.SetListSource(dsPostWithPrice,'name','id');
  //необязательное заполнение прайса
  SettingsDataset.SetResultType(2);
  setT.AddPlugin(SettingsDataset);
end;

procedure TfrmSravnSpec.ProcessMode;
var
  sTemp : string;
begin
  sTemp := setT.GetPluginResult('fmSettingsTipDetail1');
  if (sTemp='0') then begin
    cdsSpecPrice.Params.ParamByName('mode_in').asInteger:=0;
  end;
  if (sTemp='1') then begin
    cdsSpecPrice.Params.ParamByName('mode_in').asInteger:=1;
  end;
  if (sTemp='2') then begin
    cdsSpecPrice.Params.ParamByName('mode_in').asInteger:=2;
  end;
  if (sTemp='3') then begin
    cdsSpecPrice.Params.ParamByName('mode_in').asInteger:=3;
  end;
end; 

procedure TfrmSravnSpec.actFillPriceExecute(Sender: TObject);
var
  frmRepPrice : TfrmRepPrice;
  sTemp, sTempPost : string;
  dTo : double;
begin
  sTempPost := setT.GetPluginResult('fmSettingsDataset');
  if sTempPost<>'' then begin
    try
      if not FdtsNaklo.Locate('id_nakl', FIdSravnPrice,[]) then begin
        AssertInternal('E39D0E14-F986-412F-A16E-D32C17056852'+inttostr(FIdSravnPrice));
      end;
      sFilter := FilterListCreate(dsTovar.DataSet,'id_tovar');
      sFilter := AnsiReplaceStr (sFilter,'id_tovar','[id_analog]');

      //self.SetFocus;
    except
      AssertInternal('EE9AA34A-FD3F-4CD4-8954-7A973801EB7F');
    end;
    try
      frmRepPrice :=TfrmRepPrice.Create(Application);
      frmRepPrice.SetPost(sTempPost);
      sTemp := setT.GetPluginResult('fmSettingsDate');
      frmRepPrice.SetDate(sTemp);
      //Валюта
      frmRepPrice.SetCurrency(FdtsNaklo.FieldByName('id_sklad').asInteger);
      sTemp := setT.GetPluginResult('fmSettingsNumber');
      if sTemp = '' then begin
        frmRepPrice.SetKurs(Null);
      end else begin
        dTo := strtofloat(sTemp);
        frmRepPrice.SetKurs(dTo);
      end;
      frmRepPrice.actRefresh.Execute;
      frmRepPrice.cdsRep.Filter := sFilter;
      frmRepPrice.cdsRep.Filtered := true;
      CopyDatasetFields(frmRepPrice.dsRep.DataSet,dsSravnPrice.DataSet,
        'id_analog','id_analog',
        'cena', 'vxod_post', 0);
      frmRepPrice.Close;
    except
      AssertInternal('65AA4988-F60B-4DD7-8F12-1EB295B40714');
    end;//try
  end;//if sTempPost<>''
end;





procedure TfrmSravnSpec.FillPosit;
begin
  SettingsTipDetail2 := setT.CreatePlugin('TfmSettingsTipDetail');
  SettingsTipDetail2.Name := 'fmSettingsTipDetail2';
  setT.AddPlugin(SettingsTipDetail2);
  SettingsTipDetail2.SetLabelValue('Позиции');
  SettingsTipDetail2.AddDetailTip('Только заказываемые позиции');
  SettingsTipDetail2.AddDetailTip('Все позиции');
  SettingsTipDetail2.SetKeyValue(0);
end;

procedure TfrmSravnSpec.dbgRepFactDblClick(Sender: TObject);
begin
  actDetail.execute;
end;

procedure TfrmSravnSpec.ProcessTipPosit;
var
  sTemp : string;
begin
  sTemp := setT.GetPluginResult('fmSettingsTipDetail2');
  if (sTemp='0') then begin
    dsSravnPrice.DataSet.First;
    while not dsSravnPrice.DataSet.Eof do begin
      DeleteRowIfEmpty(dsSravnPrice.DataSet,'kolotp;kolotp_spec');
      dsSravnPrice.DataSet.Next;
    end; //while not dsSravnPrice.DataSet.Eof
  end;
end;

procedure TfrmSravnSpec.actRefreshPriceExecute(Sender: TObject);
begin
try
  if not cdsSravnPostWithPrice.Active then begin
    cdsSravnPostWithPrice.CreateDataSet;
  end else begin
    cdsSravnPostWithPrice.EmptyDataSet;
  end;
  UnProcessColumnsPrice;
  dsSravnPostWithPrice.DataSet.DisableControls;
  FillSpecWithPrice(
    dsSravnPostWithPrice.DataSet,
    dsFactTable.DataSet,
    dsSravnPrice.DataSet,
    );
  dsSravnPostWithPrice.DataSet.EnableControls;
  ProcessColumnsPrice;
except
  AssertInternal('4684CE06-837B-4342-9D8A-9039634F1F0F');
end;
end;

procedure TfrmSravnSpec.ProcessColumnsPrice;
var
  dbgRep : TDbGridEh;
 // i : integer;
begin
dbgRep :=dbgRepSpecWithPrice;
try
  dbgRep.ReadOnly:=true;
  //Всё для чтения
  //for i:=0 to dbgRep.Columns.Count-1 do begin
  //  dbgRep.Columns[i].ReadOnly := true;
  //end;
except
  AssertInternal('0C240C7D-9F84-40DE-8B99-646A53C59B65');
end;
try
  dbgRep.Columns[0].Footer.ValueType :=fvtCount;
  ColumnByName(dbgRep.Columns,'KOLOTP_SPEC').Footer.ValueType :=fvtSum;
  ColumnByName(dbgRep.Columns,'SUMA').Footer.ValueType :=fvtSum;
  ColumnByName(dbgRep.Columns,'SUMANDS').Footer.ValueType :=fvtSum;
except
  AssertInternal('9BE18E01-67D7-4398-97D1-A532E9878A34');
end;
end;

procedure TfrmSravnSpec.UnProcessColumnsPrice;
var
  dbgRep : TDbGridEh;
//  i : integer;
begin
try
  {for i:=0 to cdsSravnPostWithPrice.FieldCount-1 do begin
    cdsSravnPostWithPrice.Fields[i].Readonly:=false;
  end;}
  dbgRep :=dbgRepSpecWithPrice;
  dbgRep.ReadOnly:=false;
  //Всё для чтения
  //for i:=0 to dbgRep.Columns.Count-1 do begin
  //  dbgRep.Columns[i].ReadOnly := FALSE;
  //end;
except
  AssertInternal('CCAED793-DFEF-408C-BC19-3EB6D98E7038');
end;

end;

procedure TfrmSravnSpec.cdsSravnPostWithPriceCalcFields(DataSet: TDataSet);
var
  dCenaVxodPost,dSumWeight : double;
begin
try
  if (DataSet.State = dsInternalCalc) then begin
    if ((not DataSet.FieldByName('VXOD_POST').Isnull) and
      (not DataSet.FieldByName('cena_avg').Isnull))
    then begin
      dCenaVxodPost := DataSet.FieldByName('VXOD_POST').asFloat;
      dSumWeight :=DataSet.FieldByName('cena_avg').asFloat;
      //dSumWeight
      if  dCenaVxodPost > dSumWeight then begin
        DataSet.FieldByName('SKIDKA_POST').asFloat :=
          (1-(dSumWeight/dCenaVxodPost))*100;
      end else begin
        DataSet.FieldByName('SKIDKA_POST').asFloat :=
          (1-(dCenaVxodPost/dSumWeight))*100;
      end;
    end;
    DataSet.FieldByName('SUMA').asFloat:=
      RRoundTo(
        DataSet.FieldByName('cena_avg').asFloat*
          DataSet.FieldByName('kolotp_spec').asFloat,
        -4
      );
    DataSet.FieldByName('SUMANDS').asFloat :=
      RRoundTo(
        DataSet.FieldByName('SUMA').asFloat*
          (1+DataSet.FieldByName('NALOG_NDS').asFloat),
        -4
      );

  end;  // if (DataSet.State = dsInternalCalc)
except
  AssertInternal('0F6188B1-D491-489C-8B0A-1296A54504E3');
end;
end;

procedure TfrmSravnSpec.FillSpecWithPrice(
  DataSetRep, DataSetFromPost,DataSetFromPrice : TDataSet);
var
  sFilter: string;
begin
try
  if not FdtsNaklo.Locate('id_nakl', FIdSravnPrice,[]) then begin
    AssertInternal('47ECB11A-81AD-4DC6-8F60-380D6B38A8D0'+inttostr(FIdSravnPrice));
  end;
  sFilter:=GetFilter(DataSetFromPost);
  DataSetFromPost.Filtered :=true;
  CopyDataSetFields(
    DataSetFromPost,DataSetRep,
    'id_post;id_analog;analog;cena;kolotp;nalog_nds',
    'id_post;id_analog;analog;cena_avg;kolotp_spec;nalog_nds',
    '','',
    1
    );
  SetFilter(DataSetFromPost,sFilter);
  sFilter:=GetFilter(DataSetFromPrice);
  CopyDatasetFieldsTo(
    DataSetFromPrice,DataSetRep,
    'id_analog','id_analog',
    'vxod_post',
    'vxod_post',
    0
    );
  SetFilter(DataSetFromPrice,sFilter);
except
  AssertInternal('F33CA3EC-6DCB-4D01-AE94-274354AFBCD9');
end;
end;

procedure TfrmSravnSpec.tsSravnPostWithPriceShow(Sender: TObject);
begin
  if not dsSravnPostWithPrice.DataSet.Active then begin
    actRefreshPrice.Execute;
  end;
end;

end.
