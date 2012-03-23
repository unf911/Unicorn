unit SravnPrice;

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
  SettingsDataset, //TfmSettingsDataset
  RepSkladBuxDet, //TfrmRepSkladBuxDet
  DateUtils, //Endofthemonth
  PriceChangeDet, //TfrmPriceChangeDet
  SkidkaChangeDet, //TfrmSkidkaChangeDet
  UslPostavkaChangeDet, //TfrmUslPostavkaChangeDet
  SravnPriceCompare, //TfrmSravnPriceCompare
  Spec //TfrmSpec



  ;

type
  TProcessPositForSpec =procedure (dbgGrid: TDbGridEh;
    DataSet,dtsSravnPricePost,dtsFactTable: TDataSet;iIdNakl: integer);
  TfrmSravnPrice = class(TForm)
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
    actShowColumnsSum: TAction;
    actShowColumnsKolotp: TAction;
    BitBtn2: TBitBtn;
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
    sdsPost: TSQLDataSet;
    dspPost: TDataSetProvider;
    cdsPostWithPrice: TClientDataSet;
    dsPostWithPrice: TDataSource;
    actFillFact: TAction;
    dsFactTable: TDataSource;
    BitBtn1: TBitBtn;
    tsSravnPrice: TTabSheet;
    dsSravnPrice: TDataSource;
    actSravnPrice: TAction;
    BitBtn4: TBitBtn;
    mteSravnPricePost: TMemTableEh;
    DateField1: TDateField;
    IntegerField15: TIntegerField;
    dsSravnPricePost: TDataSource;
    mteSravnPricePostID_COLUMN: TIntegerField;
    mteSravnPricePostCOLUMN_NAME: TStringField;
    cdsPostWithPriceID: TIntegerField;
    cdsPostWithPriceNAME: TStringField;
    actAddAllPostWithPrice: TAction;
    ufRepFact: TUnfFilter;
    ppmTovar: TPopupMenu;
    actAddTovar: TAction;
    actAddDet1: TMenuItem;
    ppmPost: TPopupMenu;
    actAddPost: TAction;
    actAddPost1: TMenuItem;
    actChooseBestPost: TAction;
    BitBtn5: TBitBtn;
    actDetail2: TAction;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    actSave: TAction;
    mtePostEXCLUDED: TIntegerField;
    ProgressBar1: TProgressBar;
    ppmRep: TPopupMenu;
    actShowPricePostWithTovar: TAction;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
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
    cdsSravnPriceDAT: TDateTimeField;
    cdsSravnPricePost: TStringField;
    cdsSravnPriceTovar: TStringField;
    cdsSravnPriceCena: TFloatField;
    cdsSravnPriceTovarExact: TStringField;
    cdsSravnPriceTovarZAKUPKA: TFloatField;
    cdsSravnPriceTovarCENA_FROM: TFloatField;
    cdsSravnPriceIdAnalog: TIntegerField;
    cdsSravnPriceIdPos: TIntegerField;
    cdsSravnPriceIdTovar: TIntegerField;
    cdsSravnPriceIdAnalogPROCENT: TFloatField;
    mteTovarKOLOTP: TFloatField;
    cdsSravnPriceKOLOTP: TFloatField;
    cbxManuallySelected: TCheckBox;
    actMakeSpecBest: TAction;
    N16: TMenuItem;
    sdsSravnPriceMakeSpec: TSQLDataSet;
    actMakeSpec: TAction;
    N17: TMenuItem;
    actMakeSpecOnlyForBestPosit: TAction;
    N18: TMenuItem;
    actShowSpec: TAction;
    N19: TMenuItem;
    actMakeSpecAllAuto: TAction;
    N20: TMenuItem;
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
    cdsSravnPriceSPEC_OST_NERAZM: TFloatField;
    cdsSravnPriceSPEC_OST_RAZM: TFloatField;
    cdsSravnPriceSPEC_FREE: TFloatField;
    cbxShowSpecOst: TCheckBox;
    mteFactTable: TClientDataSet;
    mteFactTablePOST: TStringField;
    mteFactTableANALOG: TStringField;
    mteFactTableTOVAR: TStringField;
    mteFactTableZAKUPKA: TFloatField;
    mteFactTableCENA_FROM: TFloatField;
    mteFactTableID_ANALOG: TIntegerField;
    mteFactTableID_POST: TIntegerField;
    mteFactTableID_TOVAR: TIntegerField;
    mteFactTableDAT: TSQLTimeStampField;
    mteFactTableCENA: TFMTBCDField;
    N21: TMenuItem;
    actMakeSpecBestVxod: TAction;
    N22: TMenuItem;
    actShowPriceChange: TAction;
    N23: TMenuItem;
    actRefreshOnePost: TAction;
    N24: TMenuItem;
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
    procedure actFillFactExecute(Sender: TObject);
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
    procedure actAddAllPostWithPriceExecute(Sender: TObject);
    procedure actAddTovarExecute(Sender: TObject);
    procedure actAddPostExecute(Sender: TObject);
    procedure actChooseBestPostExecute(Sender: TObject);
    procedure actDetail2Execute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure mteTovarBeforePost(DataSet: TDataSet);
    procedure TabSheet1Show(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure tsSravnPriceShow(Sender: TObject);
    procedure tsAllPricesShow(Sender: TObject);
    procedure actShowPricePostWithTovarExecute(Sender: TObject);
    procedure actFillFactAndSravnPriceExecute(Sender: TObject);
    procedure mtePostEXCLUDEDChange(Sender: TField);
    procedure cbxManuallySelectedClick(Sender: TObject);
    procedure actMakeSpecBestExecute(Sender: TObject);
    procedure actMakeSpecExecute(Sender: TObject);
    procedure actMakeSpecOnlyForBestPositExecute(Sender: TObject);
    procedure actShowSpecExecute(Sender: TObject);
    procedure actMakeSpecAllAutoExecute(Sender: TObject);
    procedure cdsSravnPriceCalcFields(DataSet: TDataSet);
    procedure actMakeSpecBestVxodExecute(Sender: TObject);
    procedure actShowPriceChangeExecute(Sender: TObject);
    procedure actRefreshOnePostExecute(Sender: TObject);
  private
    { Private declarations }
    setT: TfrmSettings;
    SettingsDataset : TfmSettingsDataset;
    SettingsDate : TfmSettingsDate;
    FiColumn : integer;
    FdtsNaklo : TDataSet;
    FdtsNaklot : TDataSet;
    FdtsNaklot2 : TDataSet;
    sFilter : string; //фильтр по товарам. налагается на отчёт по прайсам
    SemaphoremtePostAfterPost :boolean;//отключает сброс галочек в списке поставщиков
    FIdSravnPrice : integer; //номер сравнения прайсов. Используется для
      //сохранения изменений в то же сравнение прайсов, даже если пользователь
       //изменил активную запись
    FdOldDate : TDate;//дата сравнения до изменения настроек, используется, чтобы
    //узнать каких поставщиков перебивать на новую дату
    FbCompareSelectedToOthers : boolean;
    FbCompareManuallySelectedToOthers : boolean;
    Fid_column_selected : integer;
    FInternalDatasetsWereSet: boolean; //были ли установлены родительские наборы данных
    procedure ProcessDate;
    procedure ProcessColumns;
    procedure UnProcessColumns;
    procedure UpdateCaption;
    procedure FillCurrency;
    procedure FillDate;
    procedure AddPriceToFactTable;
    procedure SravnPriceColumnCreate;
    //procedure FillSravnPrice2;
    procedure FillSravnPrice3;
    procedure  FillColumnName2;
    procedure ChooseBestPost ;
    procedure ChooseBestPostBegin;
    procedure  FillBestPostForPosit(sMinColumn : string;
      dMinPrice,dMinPreviousPrice,dZakupka,dCenaFrom:double;iTovar : integer);
    function  ShowSpecList: integer;
    function SpecShow(iSpec: integer):TForm;
    function GetNewOrExistedSpec(bAutoCreate:boolean=false;mode:integer=0): integer;
    function ProcessSelectedRecords(dbgRep :TDbGridEh;
      ProcessPositForSpec:TProcessPositForSpec;
      frmSpec:TfrmSpec;mode:integer=0):integer;
    function LocateRecordInFactTable(dbgGrid: TDbGridEh;
      dtsSravnPricePost,dtsFactTable: TDataSet):boolean;
    function CheckIfFColumnsSelected(dbgGrid: TDbGridEh) : boolean;
    procedure FillSpecOstRazm(id_nakl: integer);
    procedure FillSpecOstNerazm(id_nakl: integer);
  public
    { Public declarations }
    function SetInternalDatasetsForSave(dsNaklo,dsNaklot ,dsNaklot2 : TDataSet):boolean;
    function SetSettings: boolean;
    function SetTovarPostSettings : boolean;
  end;

  procedure ProcessPositForSpecBest(dbgGrid: TDbGridEh;
    DataSet,dtsSravnPricePost,dtsFactTable: TDataSet;iIdNakl: integer);
  procedure ProcessPositForSpec(dbgGrid: TDbGridEh;
    DataSet,dtsSravnPricePost,dtsFactTable: TDataSet;iIdNakl: integer);
var
  frmSravnPrice: TfrmSravnPrice;

implementation

{$R *.dfm}


uses RepPrice, //TfrmRepPrice
  Math, // MaxDouble
  StrUtils, //AnsiStartsStr
  DetSelect, //frmDetSelect
  SqlTimSt ,
  untNaklrList, PriceChange;


procedure TfrmSravnPrice.actRefreshExecute(Sender: TObject);
var
  sTemp : string;
begin
try
  ProcessDate;
  sTemp := setT.GetPluginResult('fmSettingsDate');
  if sTemp<>'' then begin
    FdOldDate:= strtodate(sTemp);
  end;
  UpdateCaption;
except
  AssertInternal('1CFFC09D-5A84-4BEB-9FF7-12645CCF9172');
end;
end;

procedure TfrmSravnPrice.actSettingsExecute(Sender: TObject);
begin
  actSettings.checked := setT.ProcessSettingsChange(actRefresh);
end;

procedure TfrmSravnPrice.ProcessDate;
var
  sTemp : string;
  dTo : Tdate;
begin
  sTemp := setT.GetPluginResult('fmSettingsDate');
  dTo := strtodate(sTemp);
  with dsPost.DataSet do begin
    First;
    while not eof do begin
      if FieldByName('dat').asDateTime=FdOldDate then begin
        Edit;
        FieldByName('dat').asDateTime:= dTo;
        Post;
      end;
      Next;
    end;
  end;//with
end;

procedure TfrmSravnPrice.UpdateCaption;
begin
  self.Caption := 'Сравнение прайсов в ' +
    setT.GetPluginTextResult('fmSettingsDataset')+ ' на '+
    setT.GetPluginTextResult('fmSettingsDate') ;
end;


procedure TfrmSravnPrice.FormCreate(Sender: TObject);
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
  FInternalDatasetsWereSet:=false; //по умолчанию родительские
    //наборы данных не установлены, поэтому
    //форму сравнения можно закрыть без ошибок
  setT := TfrmSettings.Create(self);
  setT.actDataOff.Execute;
  setT.actManagerOff.Execute;
  dmdEx.OpenQuery(dmdEx.dsPrice.DataSet,true);
  dmdEx.OpenQuery(dmdEx.dsCurrency.DataSet,true);
  dmdEx.OpenQuery(dmdEx.dsPost.DataSet,true);
  dmdEx.OpenQuery(dsPostWithPrice.DataSet,true);
  dsPost.DataSet.Open;
  dsTovar.DataSet.Open;

  FillDate;
  FillCurrency;
  PageControl1.ActivePageIndex :=0;
end;

procedure TfrmSravnPrice.actDetailExecute(Sender: TObject);
var
  frmRepPrice : TfrmRepPrice;
  sFieldName :string;
  iNumberField : integer;
  dZakupka, dCenaFrom,dMinPrice,dPrice: double;
  iTovar,i: integer;
begin
try
  if not dsSravnPrice.dataset.Active then begin
    exit;
  end;
  if (dsSravnPrice.dataset.eof and dsSravnPrice.DataSet.Bof)  then begin
    exit;
  end;
  if not FbCompareManuallySelectedToOthers then begin
    if AnsiStartsStr('F',dbgRep.SelectedField.FieldName) then begin
      sFieldName := Copy(dbgRep.SelectedField.FieldName,2,Length(dbgRep.SelectedField.FieldName)-1);
      iNumberField := strtoint(sFieldName);
      if dsSravnPricePost.DataSet.Locate('id_column',iNumberField,[]) then begin
        frmRepPrice :=TfrmRepPrice.Create(Self);
        frmRepPrice.SetPost(dsSravnPricePost.DataSet.FieldByName('id_post').asInteger);
        frmRepPrice.SetDate(dsSravnPricePost.DataSet.FieldByName('dat').AsDateTime);
        if dsPost.DataSet.Locate(
          'id_post;dat',
          vararrayof([dsSravnPricePost.DataSet.FieldByName('id_post').asInteger,
          dsSravnPricePost.DataSet.FieldByName('dat').AsDateTime]),[])
        then begin
          frmRepPrice.SetKurs(dsPost.DataSet.FieldByName('kurs').AsVariant);
        end;
                //получить закупку и всё остальное для выбранной позиции
        if not dsFactTable.DataSet.Locate('cena;id_post;dat;id_analog',
          vararrayof([
            dsSravnPrice.dataset.FieldByName('F'+sFieldName).asFloat,
            dsSravnPricePost.DataSet.FieldByName('id_post').asInteger,
            VarSQLTimeStampCreate(
              DateTimeToSQLTimeStamp(
                dsSravnPricePost.dataset.FieldByName('dat').AsDateTime
              )
            ),
            dsSravnPrice.dataset.FieldByName('id_analog').AsInteger
            ]),[loPartialKey])
        then begin
          AssertInternal('4CB253A8-5A9F-49C9-BF05-763F189CED83');
          exit;
        end;
        frmRepPrice.SetTovar(dsFactTable.DataSet.FieldByName('id_tovar').asInteger);
        //Валюта
        frmRepPrice.SetCurrency(setT.GetPluginResult('fmSettingsDataset'));
        frmRepPrice.actRefresh.execute;
      end else begin
        AssertInternal('08FBA398-4DFA-4F5D-B104-9B081AE7F58A_id_column_not_found'+inttostr(iNumberField));
      end;
      //конкретная цена
    end else begin //if AnsiStartsStr('F',dbgRep.SelectedField.FieldName) then begin
      //просто строка
      frmRepPrice :=TfrmRepPrice.Create(Self);
      frmRepPrice.SetPost(dsSravnPrice.dataset.FieldByName('id_post').asInteger);
      frmRepPrice.SetDate(dsSravnPrice.dataset.FieldByName('dat').AsDateTime);
      frmRepPrice.SetTovar(dsSravnPrice.dataset.FieldByName('id_tovar').asInteger);
      if dsPost.DataSet.Locate(
        'id_post;dat',
        vararrayof([dsSravnPrice.dataset.FieldByName('id_post').asInteger,
        dsSravnPrice.dataset.FieldByName('dat').AsDateTime]),[])
      then begin
        frmRepPrice.SetKurs(dsPost.DataSet.FieldByName('kurs').AsVariant);
      end;
      //Валюта
      frmRepPrice.SetCurrency(setT.GetPluginResult('fmSettingsDataset'));
      frmRepPrice.actRefresh.execute;
    end;  //if AnsiStartsStr('F',dbgRep.SelectedField.FieldName) then begin
  end else begin
    //Ручной выбор поставщика
    if AnsiStartsStr('F',dbgRep.SelectedField.FieldName) then begin
      //узнать что выбрано
      sFieldName := Copy(dbgRep.SelectedField.FieldName,2,Length(dbgRep.SelectedField.FieldName)-1);
      iNumberField := strtoint(sFieldName);
      if dsSravnPricePost.DataSet.Locate('id_column',iNumberField,[]) then begin
        if dsSravnPrice.dataset.State=dsBrowse then begin
          dsSravnPrice.dataset.Edit;
        end;
        //получить закупку и всё остальное для выбранной позиции
        if not dsFactTable.DataSet.Locate('id_post;dat;id_analog',
          vararrayof([dsSravnPricePost.DataSet.FieldByName('id_post').asInteger,
            dsSravnPricePost.dataset.FieldByName('dat').AsDateTime,
            dsSravnPrice.dataset.FieldByName('id_analog').AsInteger
            ]),[])
        then begin
          exit;
        end;
        dPrice := dsFactTable.DataSet.FieldByName('cena').asFloat;
        dZakupka := dsFactTable.DataSet.FieldByName('zakupka').asFloat;
        dCenaFrom:= dsFactTable.DataSet.FieldByName('cena_from').asFloat;
        iTovar := dsFactTable.DataSet.FieldByName('id_tovar').asInteger;
        //узнать с какой ценой прийдётся сравнивать
        dMinPrice := MaxLongint;
        for i:=0 to dsSravnPrice.dataset.fields.count-1 do begin
          if AnsiStartsStr('F',dsSravnPrice.dataset.fields[i].FieldName) then begin
            if not dsSravnPrice.dataset.fields[i].isNull  then begin
              if dsSravnPrice.dataset.fields[i].asFloat<dMinPrice then begin
                dMinPrice:=dsSravnPrice.dataset.fields[i].asFloat;
              end;
            end;
          end;
        end;  //for
        //dMinPreviousPrice := dPrice;
        //записать в таблицу данные и пересчитать процент
        FillBestPostForPosit(sFieldName,
          dPrice,dMinPrice,dZakupka,dCenaFrom,iTovar);
        dsSravnPrice.dataset.Post;
      end else begin
        AssertInternal('9564A46A-0070-48D6-8BD7-1558CC517A50_id_column_not_found'+inttostr(iNumberField));
      end;
    end;
  end;
except
  AssertInternal('EB597BF8-5275-4ECF-9457-2340CB25D01D');
end;
end;

procedure TfrmSravnPrice.actDebugExecute(Sender: TObject);
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

procedure TfrmSravnPrice.FillCurrency;
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

procedure TfrmSravnPrice.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  actSave.Execute;
  dmdEx.CloseQuery(dmdEx.dsPrice.DataSet,false);
  dmdEx.CloseQuery(dmdEx.dsCurrency.DataSet,false);
  dmdEx.CloseQuery(dmdEx.dsPost.DataSet,false);
  dmdEx.CloseQuery(dsPostWithPrice.DataSet,false);

  Action := caFree;
end;

procedure TfrmSravnPrice.dbgRepFactKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return : begin
      actDetail.Execute;
    end;
  end;//case
end;

procedure TfrmSravnPrice.dbgRepDblClick(Sender: TObject);
begin
  actDetail.Execute;
end;

procedure TfrmSravnPrice.FillDate;
begin
  SettingsDate := TfmSettingsDate.Create(setT);
  setT.AddPlugin(SettingsDate);
  SettingsDate.SetResultType(1);
  SettingsDate.SetKeyValue (Today);
end;


procedure TfrmSravnPrice.cdsNaklotReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  showmessage (e.Message);
  Action := raCancel;
end;

procedure TfrmSravnPrice.TabSheet1Exit(Sender: TObject);
begin
  if dsPost.DataSet.State in [dsEdit,dsInsert] then begin
    dsPost.DataSet.Post;
  end;
end;

procedure TfrmSravnPrice.TabSheet2Exit(Sender: TObject);
begin
  if dsTovar.DataSet.State in [dsEdit,dsInsert] then begin
    dsTovar.DataSet.Post;
  end;
end;

procedure TfrmSravnPrice.mtePostAfterInsert(DataSet: TDataSet);
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

procedure TfrmSravnPrice.mteTovarAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('in_list').asInteger :=1;
end;

procedure TfrmSravnPrice.actFillFactExecute(Sender: TObject);
begin
try
  dmdEx.StartWaiting;
  PageControl1.ActivePage := tsAllPrices;
  mteFactTable.EmptyDataSet;
  //.EmptyTable;
  mteFactTable.close;
  mteFactTable.open;
  dsFactTable.DataSet.DisableControls;
  mteTovar.SortByFields('GRUPPA1,GRUPPA2,GRUPPA3,GRUPPA4');
  sFilter := FilterListCreate(dsTovar.DataSet,'id_tovar');
  //разные имена полей, переименовываем
  sFilter := AnsiReplaceStr (sFilter,'id_tovar','[id_analog]');
  dsPost.DataSet.First;
//  pbAllPrices.Min:= 0;
//  pbAllPrices.Max:=dsPost.DataSet.RecordCount;
//  pbAllPrices.Show;
  while not dsPost.DataSet.Eof do begin
    AddPriceToFactTable;
//    pbAllPrices.StepIt;
    dsPost.DataSet.Next;
  end; //while not eof post
//  pbAllPrices.Hide;
  dsFactTable.DataSet.EnableControls;
  dmdEx.StopWaiting;
except
  AssertInternal('F89D96FE-085D-4B4D-A643-D02C1A888196');
end;
end;

procedure TfrmSravnPrice.AddPriceToFactTable;
var
  frmRepPrice : TfrmRepPrice;
  sTemp : string;
begin
  frmRepPrice :=TfrmRepPrice.Create(Self);
  frmRepPrice.FormStyle :=fsNormal;
  //frmRepPrice.WindowState := wsMinimized;
  frmRepPrice.Hide;
  frmRepPrice.SetPost(dsPost.DataSet.FieldByName('id_post').asInteger);
  frmRepPrice.SetDate(dsPost.DataSet.FieldByName('dat').AsDateTime);
  //Валюта
  sTemp := setT.GetPluginResult('fmSettingsDataset');
  frmRepPrice.SetCurrency(sTemp);
  frmRepPrice.SetKurs(dsPost.DataSet.FieldByName('kurs').AsVariant);
  frmRepPrice.actRefresh.Execute;
  //обработка списка товаров
  frmRepPrice.cdsRep.Filter := sFilter;
  frmRepPrice.cdsRep.Filtered := true;
  frmRepPrice.dsRep.DataSet.First;
  while not frmRepPrice.dsRep.DataSet.Eof do begin
    dsFactTable.DataSet.Insert;
    dsFactTable.DataSet.FieldByName('id_post').asInteger :=
      frmRepPrice.dsRep.DataSet.FieldByName('id_post').asInteger;
    //дата берётся из списка поставщиков
    dsFactTable.DataSet.FieldByName('dat').AsDateTime :=
      dsPost.DataSet.FieldByName('dat').AsDateTime;
    dsFactTable.DataSet.FieldByName('id_analog').asInteger :=
      frmRepPrice.dsRep.DataSet.FieldByName('id_analog').asInteger;
    dsFactTable.DataSet.FieldByName('id_tovar').asInteger :=
      frmRepPrice.dsRep.DataSet.FieldByName('id_tovar').asInteger;
    dsFactTable.DataSet.FieldByName('cena').asFloat :=
      RRoundTo(frmRepPrice.dsRep.DataSet.FieldByName('cena').asFloat,-4);
    dsFactTable.DataSet.FieldByName('zakupka').asFloat :=
      RRoundTo(frmRepPrice.dsRep.DataSet.FieldByName('zakupka').asFloat,-4);
    dsFactTable.DataSet.FieldByName('cena_from').asFloat :=
      RRoundTo(frmRepPrice.dsRep.DataSet.FieldByName('cena_from').asFloat,-4);
    dsFactTable.DataSet.Post;
    frmRepPrice.dsRep.DataSet.Next;
  end;
  frmRepPrice.Close;
end;

procedure TfrmSravnPrice.actSravnPriceExecute(Sender: TObject);
var
  id_nakl : integer;
begin
  if dsFactTable.DataSet.Active then begin
    dmdEx.StartWaiting;
    if dsSravnPrice.DataSet.Active then begin
      psGrid.SaveProperties;
    end;
    UnProcessColumns;
    FillColumnName2;
    SravnPriceColumnCreate;
    dsFactTable.DataSet.DisableControls;
    dsSravnPrice.DataSet.DisableControls;
    ChooseBestPostBegin;
    FillSravnPrice3;
    if Assigned(FdtsNaklo) then begin
      if FdtsNaklo.active then begin
        id_nakl:= FdtsNaklo.FieldByName('id_nakl').asInteger;
        FillSpecOstNerazm(id_nakl);
        FillSpecOstRazm(id_nakl);
      end; // if FdtsNaklo.active
    end; //if Assigned(FdtsNaklo)
    //ChooseBestPost;
    ProcessColumns;
    psGrid.LoadProperties;
    dsSravnPrice.DataSet.EnableControls;
    dsFactTable.DataSet.EnableControls;
    dmdEx.StopWaiting;
  end else begin
    MessageDlg ('Рассчитайте цены',mtWarning,[mbOK],0);
  end;
end;

//Выбираем лучшего поставщика по строке
procedure  TfrmSravnPrice.ChooseBestPost;
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

procedure TfrmSravnPrice.ChooseBestPostBegin;
begin
  //dbgRep.Columns.Clear;
  Fid_column_selected:=0;
  //режим сравнения по поставщику или по лидеру
  if dsPost.DataSet.Locate('excluded','1',[]) then begin
    FbCompareSelectedToOthers := true;
    Fid_column_selected  := dsSravnPricePost.DataSet.Lookup('id_post;dat',
      vararrayof([
        dsPost.DataSet.FieldByName('id_post').asInteger,
        dsPost.DataSet.FieldByName('dat').asDateTime
      ]),
      'id_column'
    );
  end else begin
    FbCompareSelectedToOthers := false;
  end;
end;

//Выбираем лучшего поставщика по строке
procedure  TfrmSravnPrice.FillBestPostForPosit(sMinColumn : string;
  dMinPrice,dMinPreviousPrice,dZakupka,dCenaFrom:double;iTovar : integer);
var
  iMinColumn , id_post:integer;
  dat : TDate;
  vResult : variant;
begin
  //если был хоть один поставщик по товару
  if  dMinPrice<> MaxLongint then begin
    dsSravnPrice.DataSet.FieldByName('cena').asFloat :=dMinPrice;
    iMinColumn:=strtoint(AnsiReplaceText(sMinColumn,'f',''));
    vResult:= dsSravnPricePost.DataSet.Lookup('id_column',iMinColumn,'id_post;dat');
    id_post := varasType(vResult[0],varInteger);
    dat := varasType(vResult[1],varDate);
    dsSravnPrice.DataSet.FieldByName('id_post').asInteger := id_post;
    dsSravnPrice.DataSet.FieldByName('dat').asDateTime := dat;
    dsSravnPrice.DataSet.FieldByName('zakupka').asFloat := dZakupka;
    dsSravnPrice.DataSet.FieldByName('cena_from').asFloat := dCenaFrom;
    dsSravnPrice.DataSet.FieldByName('id_tovar').asInteger := iTovar;
  end; //if  dMinPrice<> MaxLongint

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
  end;//if ((dMinPreviousPrice<> MaxLongint) and (dMinPrice<> MaxLongint))
end;

//создаёт в результате кол-во колонок по количеству поставщиков
//даже если цен у них нет
//должна работать быстрее
procedure  TfrmSravnPrice.FillColumnName2;
begin
try
  dsPost.DataSet.DisableControls;
  mteSravnPricePost.EmptyTable;
  //cdsSravnPricePost.EmptyDataSet;
  dsSravnPricePost.DataSet.Close;
  dsSravnPricePost.DataSet.Open;
  //FiColumn :=  dsSravnPrice.DataSet.FieldCount-1;
  FiColumn :=  0;
  dsPost.DataSet.First;
  while not dsPost.DataSet.Eof do begin
    if dsPost.DataSet.FieldByName('in_list').asInteger=1 then begin
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
    dsPost.DataSet.Next;
  end; //while
  dsPost.DataSet.EnableControls;
except
  AssertInternal('114B088B-70D3-42C8-86A4-4F37001F40D1');
end;
end;

//создаёт в результате кол-во колонок по которым  есть хоть одна цена
procedure   TfrmSravnPrice.SravnPriceColumnCreate;
var
  T: TFloatField;
  i: integer;
begin
  if cdsSravnPrice.Active then begin
    cdsSravnPrice.Close;
  end;
  //dbgRep.Columns.Clear;
  for i:=cdsSravnPrice.fields.count-1 downto 0 do begin
    if AnsiStartsText('F',cdsSravnPrice.fields[i].FieldName) then begin
      cdsSravnPrice.fields[i].Free;
    end;
  end;

  cdsSravnPrice.FieldDefs.Clear;
  dsSravnPricePost.DataSet.First;
  while not dsSravnPricePost.DataSet.eof do begin
    T := TFloatField.Create(cdsSravnPrice);
    T.Precision := 15;
    T.FieldName := 'F'+inttostr(dsSravnPricePost.DataSet.FieldByName('id_column').asInteger);
    T.Name := cdsSravnPrice.Name + T.FieldName;
    T.Index := cdsSravnPrice.FieldCount;
    T.DisplayLabel := dsSravnPricePost.DataSet.FieldByName('column_name').asString;
    //T.DisplayWidth := Length (dsSravnPricePost.DataSet.FieldByName('column_name').asString);
    T.DisplayWidth := 12;
    T.DisplayFormat := '0.00';
    T.DataSet := cdsSravnPrice;
    dsSravnPricePost.DataSet.Next;
  end;
  cdsSravnPrice.CreateDataSet;
end;

{procedure TfrmSravnPrice.FillSravnPrice2;
var
  vFieldName : variant;
  sFieldName : string;
  iTovar : integer;
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
      dsFactTable.DataSet.Filter:='[id_analog]='+inttostr(iTovar);
      dsFactTable.DataSet.Filtered:=true;
      if dsFactTable.DataSet.RecordCount>0 then begin
        dsSravnPrice.DataSet.Append;
        dsSravnPrice.DataSet.FieldByName('id_analog').asInteger := iTovar;
        dsFactTable.DataSet.First;
        while not dsFactTable.DataSet.Eof do begin
          vFieldName := dsSravnPricePost.DataSet.Lookup('id_post;dat',
            vararrayof([dsFactTable.DataSet.FieldByName('id_post').asInteger,
              dsFactTable.DataSet.FieldByName('dat').asDateTime]),
            'id_column');
          sFieldName:= VarAsType(vFieldName,varString);
          //т.е у поставщика убрана галочка "Участвует в сравнении
          if sFieldName<>'' then begin
            sFieldName := 'F'+sFieldName;
            if dsSravnPrice.DataSet.FieldByName(sFieldName).isNull then begin
              dsSravnPrice.DataSet.FieldByName(sFieldName).AsFloat :=
                dsFactTable.DataSet.FieldByName('cena').asFloat;
            end else begin
              if dsFactTable.DataSet.FieldByName('cena').asFloat<
               dsSravnPrice.DataSet.FieldByName(sFieldName).AsFloat
              then begin
                dsSravnPrice.DataSet.FieldByName(sFieldName).AsFloat :=
                  dsFactTable.DataSet.FieldByName('cena').asFloat;
              end;
            end;
          end;//if   if vFieldName<>Null
          dsFactTable.DataSet.Next;
        end; // while not dsFactTable.DataSet.Eof
        dsSravnPrice.DataSet.Post;
        //dsFactTable.DataSet.Post;
      end; //if dsFactTable.DataSet.RecordCount>0
    end;  //if in_list
    dsTovar.DataSet.Next;
    ProgressBar1.StepIt;
  end; //while not dsTovar.DataSet.Eof
  ProgressBar1.Hide;
  dsFactTable.DataSet.Filter:='';
  dsFactTable.DataSet.Filtered:=false;

except
  AssertInternal('6DFED500-A289-4E36-9868-E3F0C7F91E6F');
end;
end;
}

procedure TfrmSravnPrice.FillSravnPrice3;
var
  vFieldName : variant;
  sFieldName : string;
  iTovar : integer;
  dMinPreviousPrice , dMinPrice,dPrice,dZakupka,dCenaFrom :double;
  sMinColumn : string;
begin
dZakupka :=0;
dCenaFrom :=0;
try
  dsTovar.DataSet.First;
  ProgressBar1.Min:= 0;
  ProgressBar1.Max:=dsTovar.DataSet.RecordCount;
  ProgressBar1.Show;
  //фильтруем таблицу фактов по одному товару
  while not dsTovar.DataSet.Eof do begin
    if dsTovar.DataSet.FieldByName('in_list').asInteger=1 then begin
      iTovar := dsTovar.DataSet.FieldByName('id_tovar').asInteger;


      dsFactTable.DataSet.Filter:='[id_analog]='+inttostr(iTovar);
      dsFactTable.DataSet.Filtered:=true;
      if dsFactTable.DataSet.RecordCount>0 then begin
        //min price init for tovar
        dMinPreviousPrice := MaxLongint;
        dMinPrice := MaxLongint;

        dsSravnPrice.DataSet.Append;
        dsSravnPrice.DataSet.FieldByName('id_analog').asInteger := iTovar;
        //Копирование количеств в сравнение
        dsSravnPrice.DataSet.FieldByName('kolotp').asFloat :=
          dsTovar.DataSet.FieldByName('kolotp').asFloat;
        dsFactTable.DataSet.First;
        while not dsFactTable.DataSet.Eof do begin
          vFieldName := dsSravnPricePost.DataSet.Lookup('id_post;dat',
            vararrayof([dsFactTable.DataSet.FieldByName('id_post').asInteger,
              dsFactTable.DataSet.FieldByName('dat').asDateTime]),
            'id_column');
          sFieldName:= VarAsType(vFieldName,varString);
          //т.е у поставщика убрана галочка "Участвует в сравнении
          if sFieldName<>'' then begin
            sFieldName := 'F'+sFieldName;
            if ((dsSravnPrice.DataSet.FieldByName(sFieldName).isNull)
              or (dsFactTable.DataSet.FieldByName('cena').asFloat<
              dsSravnPrice.DataSet.FieldByName(sFieldName).AsFloat))
            then begin
              dPrice := dsFactTable.DataSet.FieldByName('cena').asFloat;
              dsSravnPrice.DataSet.FieldByName(sFieldName).AsFloat := dPrice;
              //если режим сравнения по поставщику, то его цены не попадают в минимальные,
              //а минимальные без него сравниваюся с его ценами
              if ((dPrice<dMinPrice) and
                ((not FbCompareSelectedToOthers) or
                 (FbCompareSelectedToOthers
                  and (sFieldName<>'F'+inttostr(Fid_column_selected)))
                 ))
              then begin
                if (not FbCompareSelectedToOthers) then begin
                  dMinPreviousPrice := dMinPrice;
                end;
                dMinPrice:=dPrice;
                sMinColumn:= sFieldName;
                dZakupka := dsFactTable.DataSet.FieldByName('zakupka').asFloat;
                dCenaFrom:= dsFactTable.DataSet.FieldByName('cena_from').asFloat;
                iTovar := dsFactTable.DataSet.FieldByName('id_tovar').asInteger;
              end; //if ((dPrice<dMinPrice)
              //если минимум уже найден, а вторая цена ещё нет
              if (
                ((dPrice>dMinPrice) and (not FbCompareSelectedToOthers) and  (dPrice<dMinPreviousPrice)) or
                (FbCompareSelectedToOthers and (sFieldName='F'+inttostr(Fid_column_selected)))
              )
              then begin
                dMinPreviousPrice := dPrice;
              end; //if  dMinPreviousPrice
            end; //if not null
          end;//if   if vFieldName<>Null
          dsFactTable.DataSet.Next;          
        end; // while not dsFactTable.DataSet.Eof
        FillBestPostForPosit(sMinColumn,dMinPrice,dMinPreviousPrice,dZakupka,dCenaFrom,iTovar);
        dsSravnPrice.DataSet.Post;
        //dsFactTable.DataSet.Post;
      end; //if dsFactTable.DataSet.RecordCount>0
    end;  //if in_list
    dsTovar.DataSet.Next;
    ProgressBar1.StepIt;
  end; //while not dsTovar.DataSet.Eof
  ProgressBar1.Hide;
  dsFactTable.DataSet.Filter:='';
  dsFactTable.DataSet.Filtered:=false;

except
  AssertInternal('B43B33A9-A174-494F-BDFF-46405EABD399');
end;
end;

procedure TfrmSravnPrice.mteSravnPricePostBeforeInsert(DataSet: TDataSet);
begin
  inc(FiColumn);
end;

procedure TfrmSravnPrice.mteSravnPricePostAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('id_column').asInteger := FiColumn;
end;

procedure TfrmSravnPrice.dbgPostKeyUp(Sender: TObject; var Key: Word;
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

procedure TfrmSravnPrice.dbgTovarKeyUp(Sender: TObject; var Key: Word;
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

procedure TfrmSravnPrice.mtePostBeforePost(DataSet: TDataSet);
begin
  if DataSet.FieldByName('id_post').isNull then begin
    DatabaseError('Введите поставщика', nil);
    //DATABASEERROR
    //showmessage();
    //abort;
  end
end;

procedure TfrmSravnPrice.dbgPostExit(Sender: TObject);
begin
  if dsPost.DataSet.State in [dsEdit,dsInsert] then begin
    dsPost.DataSet.Post;
  end;
end;

procedure TfrmSravnPrice.dbgTovarExit(Sender: TObject);
begin
  if dsTovar.DataSet.State in [dsEdit,dsInsert] then begin
    dsTovar.DataSet.Post;
  end;
end;

procedure TfrmSravnPrice.actAddAllPostWithPriceExecute(Sender: TObject);
begin
{
  dsPostWithPrice.dataSet.First;
  while not dsPostWithPrice.dataSet.Eof do begin
    dsPost.DataSet.Insert;
    dsPost.DataSet.FieldByName('id_post').asInteger :=
      dsPostWithPrice.dataSet.FieldByName('id').asInteger;
    dsPost.DataSet.Post;
    dsPostWithPrice.dataSet.Next;
  end; }
end;


procedure TfrmSravnPrice.actAddTovarExecute(Sender: TObject);
var
  frmDetSelect : TfrmDetSelect;
//  TovarList: TStringList;
//  i : integer;
begin
try
  if not dsTovar.Dataset.active then begin
    dsTovar.Dataset.open;
  end;
  frmDetSelect := TfrmDetSelect.Create(Self);
  //frmDetSelect.ShowSprTovarSnab;
  frmDetSelect.ShowQuery(
    'select cast (0 as integer) as checked,  id as oid, name, gruppa1 '
    +'from tovar_all_vw t where t.delmarked=0 and t.tara=2 and t.id=t.id_analog '
    +' order by upper(t.gruppa1),t.gruppa2,t.gruppa3,t.gruppa4'
    ,'Справочник товаров'
    ,'Товар;Группа');

  if frmDetSelect.ShowModal=mrOk then begin
    //чтобы после вставки не открывалось окно редактирования
    frmDetSelect.InsertDetRows(dsTovar.DataSet,'id_tovar');
    ApplyOrCancel(dsTovar.DataSet);
  end;
  frmDetSelect.Free;
{
  TovarList := TStringList.Create;
  if frmDetSelect.GetQueryPositions(TovarList)=mrOk then begin
    //чтобы после вставки не открывалось окно редактирования
    dsTovar.DataSet.DisableControls;
    for i :=0 to TovarList.Count-1 do begin
      try
        dsTovar.DataSet.Append;
        dsTovar.DataSet.FieldByName('id_tovar').AsInteger := strtoint(TovarList.Strings[i]);
        dsTovar.DataSet.Post;
      except
        dsTovar.DataSet.Cancel;
      end;
    end;
    dsTovar.DataSet.EnableControls;
  end;
  frmDetSelect.Free; }
except
  AssertInternal('A0DCACF9-0D58-4813-B3E5-E7B89A6694DC');
end;
end;


procedure TfrmSravnPrice.actAddPostExecute(Sender: TObject);
var
  frmDetSelect : TfrmDetSelect;
//  TovarList: TStringList;
//  i : integer;
begin
  if not dsPost.Dataset.active then begin
    dsPost.Dataset.open;
  end;


  frmDetSelect := TfrmDetSelect.Create(Self);
  frmDetSelect.ShowQuery(
    'select cast (0 as integer) as checked,k.id as oid,k.name '+
    'from klient_all_vw k where k.delmarked=0 and bitand(k.tip,4)<>0 '+
    'and id_price is not null order by k.name'
    ,'Справочник поставщиков'
    ,'Поставщик');

  if frmDetSelect.ShowModal=mrOk then begin
    //чтобы после вставки не открывалось окно редактирования
    frmDetSelect.InsertDetRows(dsPost.DataSet,'id_post');
    ApplyOrCancel(dsPost.DataSet);
  end;
  frmDetSelect.Free;
{
  TovarList := TStringList.Create;
  if frmDetSelect.GetQueryPositions(TovarList)=mrOk then begin
    //чтобы после вставки не открывалось окно редактирования
    for i :=0 to TovarList.Count-1 do begin
      dsPost.DataSet.Insert;
      dsPost.DataSet.FieldByName('id_post').AsInteger := strtoint(TovarList.Strings[i]);
      dsPost.DataSet.Post;
    end;
  end;
  frmDetSelect.Free;}
end;

procedure TfrmSravnPrice.actChooseBestPostExecute(Sender: TObject);
begin
  ChooseBestPost;
end;

procedure TfrmSravnPrice.actDetail2Execute(Sender: TObject);
var
  SravnPriceCompare : TfrmSravnPriceCompare;
begin
  SravnPriceCompare := TfrmSravnPriceCompare.Create(self);
  if dsSravnPrice.DataSet.Active then begin
    if not (dsSravnPrice.DataSet.bof and dsSravnPrice.DataSet.eof) then begin
    SravnPriceCompare.ShowCompare(
      dsFactTable.DataSet,
      dsSravnPrice.DataSet.FieldByName('id_analog').asInteger);
    end; //if has records
  end;//if active
end;

function TfrmSravnPrice.SetInternalDatasetsForSave(dsNaklo, dsNaklot,
  dsNaklot2: TDataSet): boolean;
begin
  FInternalDatasetsWereSet:=true;
  Result :=true;
  FdtsNaklo := dsNaklo;
  FdtsNaklot := dsNaklot;
  FdtsNaklot2 := dsNaklot2;
end;

function TfrmSravnPrice.SetSettings: boolean;
begin
  Result :=true;
  if Assigned(FdtsNaklo) then begin
    SettingsDataset.SetKeyValue(FdtsNaklo.FieldByName('id_sklad').asInteger);
    SettingsDate.SetKeyValue(FdtsNaklo.FieldByName('dat').AsDateTime);
    FIdSravnPrice := FdtsNaklo.FieldBYName('id_nakl').asINteger;
  end;
end;

function TfrmSravnPrice.SetTovarPostSettings : boolean;
begin
  Result :=true;
  FdtsNaklot.Filtered :=false;
  FdtsNaklot.First;
  while not FdtsNaklot.eof do begin
    try
      dsTovar.DataSet.Append;
      dsTovar.DataSet.fieldByName('id_tovar').AsInteger :=
        FdtsNaklot.FieldByName('id_tovar').asInteger;
      dsTovar.DataSet.FieldByName('in_list').asInteger :=
        FdtsNaklot.FieldByName('in_list').asInteger;
      dsTovar.DataSet.FieldByName('kolotp').asFloat :=
        FdtsNaklot.FieldByName('kolotp').asFloat;
      dsTovar.DataSet.Post;
    except
      dsTovar.DataSet.Cancel;
    end;
    FdtsNaklot.Next;
  end;
  FdtsNaklot2.Filtered :=false;
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

procedure TfrmSravnPrice.actSaveExecute(Sender: TObject);
var
  sComment : string;
  iResult : integer;
  FOldFiltered : boolean;
begin
  if not FInternalDatasetsWereSet then begin
    exit;
    //некуда сохранять
  end;
  if not Assigned(FdtsNaklo) then begin
    MessageDlg('Ошибка. Нельзя сохранить сравнение прайсов при закрытой '+
      'родительской форме ''Список сравнений прайсов''',mtError,[mbOk],0);
    exit;
  end;  //assigned
  if not Assigned(FdtsNaklot) then begin
    MessageDlg('Ошибка в FdtsNaklot. Нельзя сохранить сравнение прайсов '+
      'при закрытой родительской форме ''Список сравнений прайсов''',mtError,
      [mbOk],0);
    exit;
  end;  //assigned
  if not Assigned(FdtsNaklot2) then begin
    MessageDlg('Ошибка в FdtsNaklot2. Нельзя сохранить сравнение прайсов '+
      'при закрытой родительской форме ''Список сравнений прайсов''',mtError,
      [mbOk],0);
    exit;
  end;  //assigned
  if (FdtsNaklo.Active) then begin
    if ((FdtsNaklo.FieldByName('posted').asInteger=0) and
      (FdtsNaklo.FieldByName('blocked').asInteger=0) and
      (FdtsNaklo.FieldByName('delmarked').asInteger=0) )
    then begin
      iResult := MessageDlg('Сохранить?',mtConfirmation ,[mbYes,mbNo,mbCancel],0);
      case iResult of
        mrYes : begin
          if FbCompareSelectedToOthers then begin
            MessageDlg('Ошибка. Нельзя сохранить сравнение прайсов '+
              'если выбран режим сравнения по заданному поставщику. '+
              'Уберите пометку в поле ''Исключён'' на вкладке ''Поставщики'' '+
              'и нажмите кнопку ''Cравнить цены''',
              mtError,
              [mbOk],0);
            abort;
          end;  //assigned
          if FdtsNaklo.State <>dsInsert then begin
            iResult := MessageDlg('Сохранить как новое сравнение прайсов?',mtConfirmation ,
              [mbYes,mbNo],0);
            //позиционирование на исходной записи перед сохранением
            if not FdtsNaklo.Locate('id_nakl', FIdSravnPrice,[]) then begin
              AssertInternal('CB725A32-FB07-4C8B-9189-DDD35DDE8BD9'+inttostr(FIdSravnPrice));
            end;
            case  iResult of
              mrNo : begin

                sComment :=InputBox('Введите комментарий','Комментарий',
                  FdtsNaklo.FieldByName('comment').asString);
                FdtsNaklo.Tag:=1;
                FdtsNaklo.Edit;
                FdtsNaklo.FieldByName('dat').asDateTime :=
                  strtodate(setT.GetPluginResult('fmSettingsDate'));
                FdtsNaklo.FieldByName('id_manager').asInteger := dmdEx.GetIdManager;
                FdtsNaklo.FieldByName('id_sklad').asString :=
                  setT.GetPluginResult('fmSettingsDataset');
                FdtsNaklo.FieldByName('comment').asString := sComment;
                FdtsNaklo.post;
                FdtsNaklo.Tag:=0;
              end;
              mrYes : begin
                sComment :=InputBox('Введите комментарий','Комментарий',
                  FdtsNaklo.FieldByName('comment').asString);
                //чтобы не сработала showdetail1
                FdtsNaklo.Tag:=1;
                FdtsNaklo.Insert;
                FdtsNaklo.FieldByName('dat').asDateTime :=
                  strtodate(setT.GetPluginResult('fmSettingsDate'));
                FdtsNaklo.FieldByName('id_manager').asInteger := dmdEx.GetIdManager;
                FdtsNaklo.FieldByName('id_sklad').asString :=
                  setT.GetPluginResult('fmSettingsDataset');
                FdtsNaklo.FieldByName('comment').asString := sComment;
                FdtsNaklo.post;
                FdtsNaklo.Tag:=0;
              end;
            end; //case iResult
          end else begin //if insert
            sComment :=InputBox('Введите комментарий','Комментарий','');
            FdtsNaklo.FieldByName('dat').asDateTime :=
              strtodate(setT.GetPluginResult('fmSettingsDate'));
            FdtsNaklo.FieldByName('id_manager').asInteger := dmdEx.GetIdManager;
            FdtsNaklo.FieldByName('id_sklad').asString :=
              setT.GetPluginResult('fmSettingsDataset');
            FdtsNaklo.FieldByName('comment').asString := sComment;
            FdtsNaklo.Post;
          end; //if insert
          dmdEx.startwaiting;

          dsTovar.DataSet.CheckBrowseMode;
          dsTovar.DataSet.Filtered:=false;
          FdtsNaklot.Filtered:=false;
          ApplyOrCancel(FdtsNaklot);
          FdtsNaklot.Refresh;
          CopyDatasetFields(dsTovar.DataSet,FdtsNaklot,
            'id_tovar','id_tovar',
            'in_list',
            'in_list',
            2);
          if dsSravnPrice.DataSet.Active then begin
            //сняли и включили фильтр
            FOldFiltered := dsSravnPrice.DataSet.Filtered;
            dsSravnPrice.DataSet.Filtered:=false;
            CopyDatasetFields(dsSravnPrice.DataSet,FdtsNaklot,
              'id_analog','id_tovar',
              'cena;id_post;id_post;zakupka;kolotp',
              'cena;id_post;id_post_best;cena_from;kolotp',
              1);
            if FOldFiltered then begin
              dsSravnPrice.DataSet.Filtered:=true;
            end;
          end;

          ApplyOrCancel(FdtsNaklot2);
          FdtsNaklot2.Refresh;
          FdtsNaklot2.Filtered := false;
          CopyDatasetFields(dsPost.DataSet,FdtsNaklot2,
            'id_post;dat','id_post;dat',
            'in_list;excluded;kurs',
            'in_list;id_pos;kurs',
            2);

          PostAndApplyOrCancel(FdtsNaklo);
          PostAndApplyOrCancel(FdtsNaklot);
          PostAndApplyOrCancel(FdtsNaklot2);

          dmdex.stopwaiting;
        end; //mbYes
        mrCancel: begin
          abort;
        end;
      end;
    end; //if not posted and not blocked and not delmarked
  end else begin
    MessageDlg('Ошибка. Нельзя сохранить сравнение прайсов '+
      'при закрытой таблице в форме ''Список сравнений прайсов''',
      mtError,[mbOk],0);
    abort;
  end; //if active
end;

procedure TfrmSravnPrice.mteTovarBeforePost(DataSet: TDataSet);
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

procedure TfrmSravnPrice.TabSheet1Show(Sender: TObject);
begin
  dbgPost.SetFocus;
end;

procedure TfrmSravnPrice.TabSheet2Show(Sender: TObject);
begin
  dbgTovar.SetFocus;
end;


procedure TfrmSravnPrice.tsSravnPriceShow(Sender: TObject);
begin
  dbgRep.SetFocus;
end;

procedure TfrmSravnPrice.tsAllPricesShow(Sender: TObject);
begin
  dbgRepFact.SetFocus;
end;

procedure TfrmSravnPrice.actShowPricePostWithTovarExecute(Sender: TObject);
var
  frmRepPrice : TfrmRepPrice;
  sTemp,sFilter2 : string;
begin
  sFilter2 := FilterListCreate(dsTovar.DataSet,'id_tovar');
  //разные имена полей, переименовываем
  sFilter2 := AnsiReplaceStr (sFilter2,'id_tovar','[id_analog]');
  frmRepPrice :=TfrmRepPrice.Create(Self);
  frmRepPrice.SetPost(dsPost.DataSet.FieldByName('id_post').asInteger);
  frmRepPrice.SetDate(dsPost.DataSet.FieldByName('dat').AsDateTime);
  frmRepPrice.SetKurs(dsPost.DataSet.FieldByName('kurs').AsVariant);  
  //Валюта
  sTemp := setT.GetPluginResult('fmSettingsDataset');
  frmRepPrice.SetCurrency(sTemp);
  frmRepPrice.actRefresh.Execute;
  //обработка списка товаров
  frmRepPrice.cdsRep.Filter := sFilter2;
  frmRepPrice.cdsRep.Filtered := true;
  frmRepPrice.dsRep.DataSet.First;
end;

procedure TfrmSravnPrice.actFillFactAndSravnPriceExecute(Sender: TObject);
begin
  actFillFact.Execute;
  actSravnPrice.Execute;
end;

procedure TfrmSravnPrice.mtePostEXCLUDEDChange(Sender: TField);
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


procedure TfrmSravnPrice.cbxManuallySelectedClick(Sender: TObject);
begin
  FbCompareManuallySelectedToOthers := cbxManuallySelected.Checked;
  if FbCompareManuallySelectedToOthers then begin
    //not readonly
    ColumnByName(dbgRep.Columns,'POST').ReadOnly:=false;
    //загрузка
  end else begin
    //readonly
    ColumnByName(dbgRep.Columns,'POST').ReadOnly:=true;
    //пересчёт лучшего поставщика
  end;
end;

procedure TfrmSravnPrice.ProcessColumns;
var
  i : integer; 
begin
  for i:=0 to dbgRep.Columns.Count-1 do begin
    dbgRep.Columns[i].ReadOnly := true;
  end;
  ColumnByName(dbgRep.Columns,'KOLOTP').ReadOnly:=false;
  ColumnByName(dbgRep.Columns,'SPEC_FREE').ReadOnly:=false;

  ColumnByName(dbgRep.Columns,'DAT').Footer.ValueType :=fvtCount;
end;

procedure TfrmSravnPrice.UnProcessColumns;
var
  i : integer; 
begin
  for i:=0 to dbgRep.Columns.Count-1 do begin
    dbgRep.Columns[i].ReadOnly := false;
  end;
end;

function TfrmSravnPrice.GetNewOrExistedSpec(bAutoCreate:boolean=false;mode:integer=0): integer;
var
  sFieldName: string;
  iSpec ,iResult, iNumberField, id_currency : integer;
begin
  Result :=0;
  iSpec :=0;
  iResult:=0;
  if not AnsiStartsStr('F', dbgRep.SelectedField.FieldName) then begin
    MessageDlg(
      'Не выбран поставщик. Выберите колонку с именем '+
      'поставщика и сделайте правый щелчок.',
      mtWarning,[mbOk],0);
    Exit;
  end;
  if not bAutoCreate then begin
    iResult:= MessageDlg(
      'Создать новую спецификацию?',
      mtConfirmation,
      [mbYes,mbNo,mbCancel],
      0);
  end;
  Result :=0;
  if iResult=mrCancel then begin
    exit;
  end;
  if iResult=mrNo then begin
    //выбрать или создать спецификацию
    iSpec :=ShowSpecList;
  end;
  if ((iResult=mrYes) or (bAutoCreate)) then begin
    //создать заголовок спецификации
    //Получатель-укк,валюта-валюта прайса поставщика
    //дата-сегодня
    //фирма только эта
    sFieldName := Copy(dbgRep.SelectedField.FieldName,2,
      Length(dbgRep.SelectedField.FieldName)-1);

    iNumberField := strtoint(sFieldName);
    if not dsSravnPricePost.DataSet.Locate('id_column',iNumberField,[]) then begin
      AssertInternal('845EFA2F-D82E-4E94-AC97-43CD82E0D330');
      exit;
    end;
    sdsSravnPriceMakeSpec.Params.ParamByName('id_post').asInteger:=
      dsSravnPricePost.DataSet.FieldByName('id_post').asInteger;
    sdsSravnPriceMakeSpec.Params.ParamByName('comment').asString :=
      'Сгенерировано из '+FdtsNaklo.FieldByName('id').asString;
    sdsSravnPriceMakeSpec.Params.ParamByName('mode').asInteger := mode;
    sdsSravnPriceMakeSpec.Params.ParamByName('parent_id_nakl').asInteger:=
      FIdSravnPrice;
    if mode=1 then begin
      if not FdtsNaklo.Locate('id_nakl', FIdSravnPrice,[]) then begin
        AssertInternal('9EF614CD-A7DA-4A19-BF3F-DD88F5821DAD '+inttostr(FIdSravnPrice));
      end;
      id_currency := FdtsNaklo.FieldByName('id_sklad').asInteger;
      sdsSravnPriceMakeSpec.Params.ParamByName('id_currency').asInteger := id_currency;
    end;
    dmdEx.ExecSQL(sdsSravnPriceMakeSpec);
    iSpec := sdsSravnPriceMakeSpec.Params.ParamByName('id_nakl').asInteger;
    //вернуть его номер
  end;
  Result := iSpec;
end;

//mode=0 - если данные о цене не найдены в таблице фактов, т.е. пустая ячейка
  //была, то не обрабатывать такую запись
//mode=1 - даже если нет данных о цене в таблице фактов, то обрабатывать
//строку всё равно
function TfrmSravnPrice.ProcessSelectedRecords(dbgRep :TDbGridEh;
  ProcessPositForSpec:TProcessPositForSpec;
  frmSpec:TfrmSpec;mode:integer=0):integer;
var
  FieldName,sBottom : string;
  i,iRes: integer;
begin
  Result :=0;
  FieldName := dbgRep.SelectedField.FieldName;
  if dbgRep.Selection.SelectionType=gstRecordBookmarks then begin
    for i:= 0  to dbgRep.Selection.Rows.Count-1 do begin
      dbgRep.DataSource.DataSet.GotoBookmark(pointer(dbgRep.SelectedRows.Items[i]));
      if (mode=1) or LocateRecordInFactTable(dbgRep,
        dsSravnPricePost.DataSet,
        dsFactTable.DataSet)
      then begin
        {
        if mode=1 then begin
          //посматриваем в таблицу фактов
        end;
        if mode=1 then begin
          //смотрим только в таблицу сравнения
          ProcessPositForSpec(dbgRep,
            frmSpec.dsNaklot.DataSet,
            dsSravnPricePost.DataSet,
            dsSravnPrice.DataSet,
            FdtsNaklo.FieldByName('id_nakl').asInteger);
        end;       }
        ProcessPositForSpec(dbgRep,
          frmSpec.dsNaklot.DataSet,
          dsSravnPricePost.DataSet,
          dsFactTable.DataSet,
          FdtsNaklo.FieldByName('id_nakl').asInteger);
      end;// if LocateRecordInFactTable(dbgRep
    end;
  end else begin //if dbgRep.Selection.SelectionType=gstRecordBookmarks
    //gstRectangle
    if dbgRep.Selection.SelectionType in [gstColumns,gstAll]  then begin
      dbgRep.DataSource.DataSet.Last;
      sBottom :=  dbgRep.DataSource.DataSet.Bookmark ;
      dbgRep.DataSource.DataSet.First;
    end else begin //dbgRep.Selection.SelectionType=gstColumns
      if dbgRep.Selection.SelectionType=gstNon then begin
        sBottom :=  dbgRep.DataSource.DataSet.Bookmark;
      end else begin //dbgRep.Selection.SelectionType=gstNon
        //gstRectangle
        dbgRep.DataSource.DataSet.GotoBookmark(pointer(dbgRep.Selection.Rect.TopRow));
        sBottom :=dbgRep.Selection.Rect.BottomRow;
      end; //dbgRep.Selection.SelectionType=gstNon
    end; //if dbgRep.Selection.SelectionType=gstColumns
    if sBottom='' then begin
      //если выделена одна строка, то конец сделать равным началу выделения, а не
      //пустым, как по умолчанию
      sBottom := dbgRep.Selection.Rect.TopRow;
    end;
    repeat
      if (mode=1) or LocateRecordInFactTable(dbgRep,
        dsSravnPricePost.DataSet,
        dsFactTable.DataSet)
      then begin
        ProcessPositForSpec(dbgRep,
          frmSpec.dsNaklot.DataSet,
          dsSravnPricePost.DataSet,
          dsFactTable.DataSet,
          FdtsNaklo.FieldByName('id_nakl').asInteger);
      end;
      iRes := dbgRep.DataSource.DataSet.CompareBookmarks(
        dbgRep.DataSource.DataSet.GetBookmark,pointer(sBottom));
      dbgRep.DataSource.DataSet.Next;
    until (iRes>=0);
  end; //if dbgRep.Selection.SelectionType=gstRecordBookmarks
  ApplyOrCancel(frmSpec.dsNaklot.DataSet);
end;

procedure TfrmSravnPrice.actMakeSpecBestExecute(Sender: TObject);
var
  iSpec : integer;
  frmSpec: TfrmSpec;
begin
  //сохранить сравнение
  actSave.Execute;
  iSpec := GetNewOrExistedSpec;
  if (iSpec=0) then begin
    //если пользователь не выбрал из списка
    exit;
  end;
  try
    frmSpec := SpecShow(iSpec) as TfrmSpec;
    ProcessSelectedRecords(dbgRep,ProcessPositForSpecBest,frmSpec);
    frmSpec.RecountNakl;
    ApplyOrCancel (frmSpec.dsNaklo.DataSet);
    frmSpec.WindowState := wsMaximized;
  except
    AssertInternal('0B98AD47-2467-44C8-A39C-B91C9A89F2B6');
  end;

end;



function TfrmSravnPrice.SpecShow(iSpec: integer):TForm;
var
  frmSpec: TfrmSpec;
begin
  frmSpec := TfrmSpec.Create(application);
  frmSpec.PropStorageEh1.Active:=false;
  //frmSpec.WindowState := wsMinimized;
  //self.SetFocus;
  frmSpec.qeNaklo.SetSQL('where','id_nakl='+ inttostr(iSpec),0);
  frmSpec.DefaultOpen;
  Result := frmSpec;
end;

function TfrmSravnPrice.ShowSpecList: integer;
var
  iSpec,iNumberField : integer;
  sIzg,sFieldName : string;
  dFrom,dTo,dDate : TDate;
begin
   { DONE :
Добавить ограничения на выбор расходных
(только для этого менеджера и допустим не старше 3 месяцев) }
  frmNaklrList := TfrmNaklrList.Create(self);
  frmNaklrList.ShowSpec;
  //менеджер только этот
  // dsNakloEdit.dataset.fieldbyname('id_manager').asInteger;
  dDate := Today;
  dFrom := IncMonth(dDate,-4);
  frmNaklrList.setT.DateFrom:=dFrom;
  dTo := IncMonth(dDate,1);
  frmNaklrList.setT.DateTo:=dTo;
   //фирма только эта
  sFieldName := Copy(dbgRep.SelectedField.FieldName,2,
    Length(dbgRep.SelectedField.FieldName)-1);
  iNumberField := strtoint(sFieldName);
  if not dsSravnPricePost.DataSet.Locate('id_column',iNumberField,[]) then begin
    AssertInternal('0EFEEC14-6639-4EB0-9D19-66E57090B0AB');
    Result :=0;
    exit;
  end;
  sIzg := dsSravnPricePost.DataSet.FieldByName('id_post').asString;
  frmNaklrList.qeNaklr.SetSql('where','id_izg='+sIzg,3);
  frmNaklrList.qeNaklr.SetSql('where','posted=0',4);
  frmNaklrList.ProcessSettings;
  frmNaklrList.DefaultOpen;

  iSpec := frmNaklrList.GetSchet;
  frmNaklrList.Free;
  Result := iSpec;
end;

function TfrmSravnPrice.LocateRecordInFactTable(dbgGrid: TDbGridEh;
  dtsSravnPricePost,dtsFactTable: TDataSet):boolean;
var
  sFieldName : string;
  iNumberField : integer;
  DataSetFrom : TDataSet;
begin
  Result := true;
  sFieldName := dbgGrid.SelectedField.FieldName;
  if  not AnsiStartsStr('F',sFieldName) then begin
    //не выбран поставщик
    MessageDlg('Выберите требуемого поставщика правым кликом'+
      ' по колонке с его ценами',mtInformation,[mbOK],0);
    Result := false;
    exit;
  end;
  sFieldName := Copy(sFieldName,2,Length(sFieldName)-1);
  iNumberField := strtoint(sFieldName);
  if not dtsSravnPricePost.Locate('id_column',iNumberField,[]) then begin
    AssertInternal('FBA3B879-6462-4BD3-871D-C4A0D79FAA03_'+inttostr(iNumberField));
    Result := false;
    exit;
  end;
  //узнать поставщика
  //взять лучший вход
  DataSetFrom:=dbgGrid.DataSource.DataSet;
  //взять вход и закупку поставщика
  if DataSetFrom.FieldByName('F'+sFieldName).isNull then begin
    Result := false;
    //не может поставлять эти позиции
    exit;
  end;
  if dtsFactTable.Filtered then begin
    dtsFactTable.Filtered:=false;
  end;
  //получить закупку и всё остальное для выбранной позиции
  if not dtsFactTable.Locate('id_post;dat;id_analog;cena',
    vararrayof([dtsSravnPricePost.FieldByName('id_post').asInteger,
      VarSQLTimeStampCreate(
        DateTimeToSQLTimeStamp(
          dsSravnPricePost.dataset.FieldByName('dat').AsDateTime
        )
      ),

      {dtsSravnPricePost.FieldByName('dat').AsDateTime, }
      DataSetFrom.FieldByName('id_analog').AsInteger,
      DataSetFrom.FieldByName('F'+sFieldName).AsVariant
      ]),[])
  then begin
    AssertInternal('7FD4589E-CE97-4F01-924E-D48CC6EEEDD3_'+
      DataSetFrom.FieldByName('id_analog').AsString);
    Result := false;
    exit;
  end;
end;

procedure ProcessPositForSpecBest(dbgGrid: TDbGridEh;
  DataSet,dtsSravnPricePost,dtsFactTable: TDataSet;iIdNakl: integer);
var
  DataSetFrom : TDataSet;
  //, ,
  //,dBestZakupka,
  dKolotp,dVxod,dBestVxod,dZakupka :double;
  vBestZakupka : variant;
begin
  DataSetFrom :=dbgGrid.DataSource.dataset;
  dVxod :=DataSetFrom.FieldByName(dbgGrid.SelectedField.FieldName).AsFloat;
  dBestVxod:=DataSetFrom.FieldByName('CENA').AsFloat;
  dZakupka:= dtsFactTable.FieldByName('zakupka').asFloat;
  dKolotp := DataSetFrom.FieldByName('spec_free').AsFloat;
  //рассчитать требуемую закупку
  if RRoundTo(dKolotp,-3)>0 then begin
    if dVxod<>0 then begin
      vBestZakupka := dBestVxod*dZakupka/dVxod;
    end else begin
      {По просьбе Андрея Величко можно создат спецификацию
      на пустого поставщика. В таком случае в виде цен ставиться
      просто вход. А валюта - исходная.}
      vBestZakupka := dBestVxod;
    end;
    DataSet.Tag := 1;
    DataSet.Append;
    DataSet.FieldByName('id_tovar').asInteger:=
      dtsFactTable.FieldByName('id_tovar').asInteger;
    DataSet.FieldByName('KOLOTP').AsFloat := dKolotp;
    DataSet.FieldByName('cena').AsVariant := vBestZakupka;
    DataSet.FieldByName('id_sebest').asInteger :=
      iIdNakl;
    DataSet.Post;
    DataSet.Tag := 0;
  end;//if RRoundTo(dKolotp,3)

end;

procedure ProcessPositForSpecVxod(dbgGrid: TDbGridEh;
  DataSet,dtsSravnPricePost,dtsFactTable: TDataSet;iIdNakl: integer);
var
  DataSetFrom : TDataSet;
  //dVxod, dBestVxod, dZakupka,dBestZakupka,
  dKolotp :double;
  vBestZakupka : variant;
begin
  DataSetFrom :=dbgGrid.DataSource.dataset;
  dKolotp := DataSetFrom.FieldByName('spec_free').AsFloat;
  //рассчитать требуемую закупку
  if RRoundTo(dKolotp,-3)>0 then begin
    vBestZakupka := DataSetFrom.FieldByName('CENA').AsFloat;
    DataSet.Tag := 1;
    DataSet.Append;
    DataSet.FieldByName('id_tovar').asInteger:=
      DataSetFrom.FieldByName('id_analog').asInteger;
    DataSet.FieldByName('KOLOTP').AsFloat := dKolotp;
    DataSet.FieldByName('cena').AsVariant := vBestZakupka;
    DataSet.FieldByName('id_sebest').asInteger :=
      iIdNakl;
    DataSet.Post;
    DataSet.Tag := 0;
  end;//if RRoundTo(dKolotp,3)

end;

procedure ProcessPositForSpecWhereLider (dbgGrid: TDbGridEh;
  DataSet,dtsSravnPricePost,dtsFactTable: TDataSet;iIdNakl: integer);
var
  sFieldName,sFieldName2 : string;
  dat : TDate;
  DataSetFrom : TDataSet;
  iPost,iNumberField : integer;
  dVxod, dBestVxod, dZakupka,dKolotp :double;
begin
  sFieldName :=dbgGrid.SelectedField.FieldName;
  sFieldName2 := Copy(sFieldName,2,Length(sFieldName)-1);
  iNumberField := strtoint(sFieldName2);
  if not dtsSravnPricePost.Locate('id_column',iNumberField,[]) then begin
    AssertInternal('9D8619CF-71A7-4011-AC4B-DE2F8C7E1897_'+inttostr(iNumberField));
    exit;
  end;
  iPost:=dtsSravnPricePost.FieldByName('id_post').asInteger;
  dat := dtsSravnPricePost.FieldByName('dat').asDateTime;
  if not AnsiStartsStr('F',sFieldName) then begin
    //не выбран поставщик
    MessageDlg('Выберите требуемого поставщика правым кликом'+
      ' по колонке с его ценами',mtInformation,[mbOK],0);
    exit;
  end;

  DataSetFrom :=dbgGrid.DataSource.dataset;
  dVxod :=DataSetFrom.FieldByName(sFieldName).AsFloat;
  dBestVxod:=DataSetFrom.FieldByName('CENA').AsFloat;
  dZakupka:= dtsFactTable.FieldByName('zakupka').asFloat;
  dKolotp := DataSetFrom.FieldByName('spec_free').AsFloat;
  //рассчитать требуемую закупку
  if ((iPost = DataSetFrom.FieldByName('id_post').AsInteger) and
    (Dat =  DataSetFrom.FieldByName('dat').AsDateTime))
  then begin
    if RroundTo(dVxod-dBestVxod,-4)<>0 then begin
      AssertInternal('F8B68C16-FD5D-43BD-A548-E00B0796AAA7_'+
        dtsFactTable.FieldByName('tovar').asString);
      abort;
    end else begin   //if RroundTo(dVxod-dBestVxod,-4)<>0
      if RRoundTo(dKolotp,-3)>0 then begin
        //нормальная ситуация. Всё сходится
        DataSet.Tag := 1;
        DataSet.Append;
        DataSet.FieldByName('id_tovar').asInteger:=
          dtsFactTable.FieldByName('id_tovar').asInteger;
        DataSet.FieldByName('kolotp').AsFloat := dKolotp;
        DataSet.FieldByName('cena').AsFloat := dZakupka;
        DataSet.FieldByName('id_sebest').asInteger :=
          iIdNakl;
        DataSet.Post;
        DataSet.Tag := 0;
      end;//if RRoundTo(dKolotp,3)
    end; //if RroundTo(dVxod-dBestVxod,-4)<>0
  end;

end;



procedure ProcessPositForSpec(dbgGrid: TDbGridEh;
  DataSet,dtsSravnPricePost,dtsFactTable: TDataSet;iIdNakl: integer);
var
  DataSetFrom : TDataSet;
  dZakupka, dKolotp :double;
begin
  DataSetFrom :=dbgGrid.DataSource.DataSet;
  dZakupka:= dtsFactTable.FieldByName('zakupka').asFloat;
  dKolotp := DataSetFrom.FieldByName('spec_free').AsFloat;
  //рассчитать требуемую закупку
  if RRoundTo(dKolotp,-3)>0 then begin
    DataSet.Tag := 1;
    DataSet.Append;
    DataSet.FieldByName('id_tovar').asInteger:=
      dtsFactTable.FieldByName('id_tovar').asInteger;
    DataSet.FieldByName('KOLOTP').AsFloat := dKolotp;
    DataSet.FieldByName('cena').AsFloat := dZakupka;
    DataSet.FieldByName('id_sebest').asInteger :=
      iIdNakl;
    DataSet.Post;
    DataSet.Tag := 0;
  end;
end;

procedure TfrmSravnPrice.actMakeSpecExecute(Sender: TObject);
var
  iSpec : integer;
  frmSpec: TfrmSpec;
begin
  //сохранить сравнение
  actSave.Execute;
  iSpec := GetNewOrExistedSpec;
  if (iSpec=0) then begin
    //если пользователь не выбрал из списка
    exit;
  end;
  try
    frmSpec := SpecShow(iSpec) as TfrmSpec;
    ProcessSelectedRecords(dbgRep,ProcessPositForSpec,frmSpec);
    frmSpec.RecountNakl;
    ApplyOrCancel (frmSpec.dsNaklo.DataSet);
    frmSpec.WindowState := wsMaximized;
  except
    AssertInternal('BEF51C2C-CC83-4873-8E83-CF915E3B3B70');
  end;

end;

procedure TfrmSravnPrice.actMakeSpecOnlyForBestPositExecute(
  Sender: TObject);
var
  iSpec : integer;
  frmSpec: TfrmSpec;
begin
  if not CheckIfFColumnsSelected(dbgRep) then begin
    exit;
  end;
  //сохранить сравнение
  actSave.Execute;
  //обработка если кликнули не на колонке с поставщиком,
    //а на цене
  iSpec := GetNewOrExistedSpec;
  if (iSpec=0) then begin
    //если пользователь не выбрал из списка
    exit;
  end;
  try
    frmSpec := SpecShow(iSpec) as TfrmSpec;
    ProcessSelectedRecords(dbgRep,ProcessPositForSpecWhereLider,frmSpec);
    frmSpec.RecountNakl;
    ApplyOrCancel (frmSpec.dsNaklo.DataSet);
    frmSpec.WindowState := wsMaximized;
  except
    AssertInternal('BEF51C2C-CC83-4873-8E83-CF915E3B3B70');
  end;

end;

function TfrmSravnPrice.CheckIfFColumnsSelected(dbgGrid: TDbGridEh) : boolean;
var
  sFieldName: string;
begin
  Result := true;
  sFieldName := dbgGrid.SelectedField.FieldName;
  if  not AnsiStartsStr('F',sFieldName) then begin
    //не выбран поставщик
    MessageDlg('Выберите требуемого поставщика правым кликом'+
      ' по колонке с его ценами',mtInformation,[mbOK],0);
    Result := false;
  end;
end;

procedure TfrmSravnPrice.actShowSpecExecute(Sender: TObject);
var
  frmSpec: TfrmSpec;
  sIdNakl :string;
begin
  frmSpec := TfrmSpec.Create(application);
  sIdNakl :=  inttostr(FidSravnPrice);
  frmSpec.qeNaklo.SetSQL('where',
    'delmarked=0 and ((id_nakl in (select id_nakl from spec_det_vw sd where '+
    'sd.id_sebest='+sIdNakl+
    ' group by sd.id_nakl)) or ('+
    'parent_id_nakl='+sIdNakl+'))'
    ,0);
  frmSpec.DefaultOpen;
end;

procedure TfrmSravnPrice.actMakeSpecAllAutoExecute(Sender: TObject);
var
  i,iSpec: integer;
  frmSpec: TfrmSpec;
  sNakl: string;
begin
  //сохранить сравнение
  actSave.Execute;
  for i:=0 to dsSravnPrice.DataSet.Fields.Count-1 do begin
    if AnsiStartsStr('F',dsSravnPrice.DataSet.Fields[i].FieldName) then begin
      dbgRep.SelectedField := dsSravnPrice.DataSet.Fields[i];
      iSpec := GetNewOrExistedSpec(true);
      frmSpec := nil;
      try
        frmSpec := SpecShow(iSpec) as TfrmSpec;
        ProcessSelectedRecords(dbgRep,ProcessPositForSpecWhereLider,frmSpec);
        if frmSpec.dsNaklot.DataSet.RecordCount > 0 then begin
          if sNakl<>'' then begin
            sNakl := sNakl+', ';
          end;
          sNakl := sNakl + inttostr(iSpec);
          frmSpec.RecountNakl;
          ApplyOrCancel (frmSpec.dsNaklo.DataSet);
        end else begin
          frmSpec.dsNaklo.DataSet.Delete;
        end;
      finally //try
        frmSpec.Free;
        {AssertInternal('82774494-F353-40D7-9CF5-EDF60E3AA74D');}
      end;//try
    end;//if AnsiStartsStr('F',dsSravnPrice.DataSet.Fields[i].FieldName)
  end;//for i:=0 to dsSravnPrice.DataSet.Fields.Count
  if (sNakl <>'') then begin
    sNakl:='('+sNakl+')';
    frmSpec := TfrmSpec.Create(application);
    frmSpec.qeNaklo.SetSQL('where',
      'id_nakl in '+sNakl,0);
    frmSpec.DefaultOpen;
  end;  //if (sNakl <>'')
end;

procedure TfrmSravnPrice.cdsSravnPriceCalcFields(DataSet: TDataSet);
begin
  if (DataSet.State = dsInternalCalc) and
    DataSet.FieldByName('spec_free').visible
  then begin
    DataSet.FieldByName('spec_free').AsFloat :=
      DataSet.FieldByName('kolotp').AsFloat-
      DataSet.FieldByName('spec_ost_razm').AsFloat{-
      DataSet.FieldByName('spec_ost_nerazm').AsFloat};
  end;
end;

procedure TfrmSravnPrice.FillSpecOstNerazm(id_nakl: integer);
begin
try
  cdsSpecOstNerazm.Close;
  cdsSpecOstNerazm.Params.ParamByName('id_nakl').AsInteger := id_nakl;
  cdsSpecOstNerazm.Open;
  MergeStrings(cdsSpecOstNerazm,cdsSravnPrice,'id_analog','id_analog','kolotp_nerazm','spec_ost_nerazm',false);
  cdsSpecOstNerazm.Close;
except
  AssertInternal('D1924CDA-3584-467D-A9A2-2FB1A6AC040A');
end;
end;

procedure TfrmSravnPrice.FillSpecOstRazm(id_nakl: integer);
begin
try
  cdsSpecOstRazm.Close;
  cdsSpecOstRazm.Params.ParamByName('id_nakl').AsInteger := id_nakl;
  cdsSpecOstRazm.Open;
  MergeStrings(cdsSpecOstRazm,cdsSravnPrice,'id_analog','id_analog','kolotp_razm','spec_ost_razm',false);
  cdsSpecOstRazm.Close;
except
  AssertInternal('8A6F0673-A625-4505-9609-7277A88F4294');
end;
end;

procedure TfrmSravnPrice.actMakeSpecBestVxodExecute(Sender: TObject);
var
  iSpec : integer;
  frmSpec: TfrmSpec;
begin
  //сохранить сравнение
  actSave.Execute;
  iSpec := GetNewOrExistedSpec(false,1);
  if (iSpec=0) then begin
    //если пользователь не выбрал из списка
    exit;
  end;
  try
    frmSpec := SpecShow(iSpec) as TfrmSpec;
    ProcessSelectedRecords(dbgRep,ProcessPositForSpecVxod,frmSpec,1);
    frmSpec.RecountNakl;
    ApplyOrCancel (frmSpec.dsNaklo.DataSet);
    frmSpec.WindowState := wsMaximized;
  except
    AssertInternal('40BD5F4F-2A61-4ADD-AA13-860441D85C2E');
  end;
end;

procedure TfrmSravnPrice.actShowPriceChangeExecute(Sender: TObject);
begin
try
  if dsPost.DataSet.eof and dsPost.DataSet.Bof then begin
    MessageDlg ('Выберите поставщика',mtWarning,[mbOK],0);
    exit;
  end;
  if dsPost.DataSet.FieldByName('id_post').IsNull then begin
    MessageDlg ('Не указан поставщик',mtWarning,[mbOK],0);
    exit;
  end;
  frmPriceChange := TfrmPriceChange.Create(Application);
  frmPriceChange.qeNaklo.SetSQL(
    'where',
    'delmarked=0 and id_sklad=(select k.id_price from klient_all_vw k where k.id='+
    dsPost.DataSet.FieldByName('id_post').asString+')',
    3);
  frmPriceChange.setT.IDManager:=0; // all
  frmPriceChange.setT.SetPeriod(6); //
  frmPriceChange.ProcessSettings;
  frmPriceChange.DefaultOpen;
except
  AssertInternal('C3166B08-0477-4FBB-84AF-2AF0E23BF36E');
end;
end;

procedure TfrmSravnPrice.actRefreshOnePostExecute(Sender: TObject);
var
  iPost : integer;
  dDate : TDate;
begin
try
  dmdEx.StartWaiting;
  //PageControl1.ActivePage := tsAllPrices;
  if dsFactTable.DataSet.RecordCount=0 then begin
    MessageDlg ('Обновление выполняется только после рассчёта цен',mtWarning,[mbOk],0);
    exit;
  end;
  iPost := dsPost.DataSet.FieldByName('id_post').asInteger;
  dDate := dsPost.DataSet.FieldByName('dat').asDateTime;
  with dsFactTable.DataSet do begin
    Filter:='[id_post]='+inttostr(iPost)+
      ' and [dat]='+quotedstr(datetostr(dDate));
    Filtered:=true;
    First;
    while not eof do begin
      Delete;
    end;//while not eof
    Filtered:=false;
  end;//with
  AddPriceToFactTable;
  actSravnPrice.Execute;
  dmdEx.StopWaiting;
except
  AssertInternal('45E83FB8-A269-4DBC-B045-9EC269009B01');
end;

end;

end.
