unit PrixSklad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, Grids, DBGridEh, DB, DBClient, Provider, SqlExpr,
  ActnList, StdCtrls, Buttons,
  untEx,
  DateUtils,
  UnfFilter, //StartOfTheMonth
  AtsAssert, //AssertInternal
  untSettings, GridsEh, ComCtrls, PropFilerEh, PropStorageEh,
  MemTableDataEh, MemTableEh, Menus //TfrmSettings

  ;

type
  TfrmPrixSklad = class(TForm)
    ActionList1: TActionList;
    sdsSkladRasx: TSQLDataSet;
    dspSkladRasx: TDataSetProvider;
    cdsSkladRasx: TClientDataSet;
    cdsReport: TClientDataSet;
    actRefresh: TAction;
    dsReport: TDataSource;
    cdsSkladRasxTOVAR: TStringField;
    cdsSkladRasxKOLOTP: TFMTBCDField;
    sdsSkladskaya: TSQLDataSet;
    dspSkladskaya: TDataSetProvider;
    cdsSkladskaya: TClientDataSet;
    cdsSkladskayaTOVAR: TStringField;
    cdsSkladskayaSKLADSKAYA: TSmallintField;
    UnfFilter1: TUnfFilter;
    sdsNaklr: TSQLDataSet;
    dspNaklr: TDataSetProvider;
    cdsNaklr: TClientDataSet;
    StringField1: TStringField;
    actSettings: TAction;
    sdsSklost: TSQLDataSet;
    dspSklost: TDataSetProvider;
    cdsSklost: TClientDataSet;
    StringField2: TStringField;
    cdsSklostKOLOTP: TFMTBCDField;
    cdsNaklrKOLOTP: TFMTBCDField;
    cdsSklostKOLOTP_REZERV: TFMTBCDField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    dbgRep: TDBGridEh;
    cdsSkladskayaGRUPPA1: TStringField;
    cdsSkladskayaGRUPPA2: TFloatField;
    cdsSkladskayaGRUPPA3: TFloatField;
    cdsSkladskayaGRUPPA4: TFloatField;
    ProgressBar1: TProgressBar;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    sdsSpecOst: TSQLDataSet;
    dspSpecOst: TDataSetProvider;
    cdsSpecOst: TClientDataSet;
    dsSpecOst: TDataSource;
    cdsSpecOstKOLOTP_AFTER: TFloatField;
    cdsSpecOstTOVAR: TStringField;
    BitBtn3: TBitBtn;
    actDetail: TAction;
    actAverageCount: TAction;
    dbgTovar: TDBGridEh;
    mteTovar: TMemTableEh;
    mteTovarTOVAR: TStringField;
    mteTovarID_TOVAR: TIntegerField;
    mteTovarGRUPPA1: TStringField;
    mteTovarGRUPPA2: TFloatField;
    mteTovarGRUPPA3: TFloatField;
    mteTovarGRUPPA4: TFloatField;
    dsTovar: TDataSource;
    actAddTovar: TAction;
    ppmTovar: TPopupMenu;
    actAddDet1: TMenuItem;
    cdsSkladskayaID_ANALOG: TIntegerField;
    cdsSkladRasxID_ANALOG: TIntegerField;
    cdsNaklrID_ANALOG: TIntegerField;
    cdsSklostID_ANALOG: TIntegerField;
    cdsSpecOstID_ANALOG: TIntegerField;
    cdsReportTOVAR: TStringField;
    cdsReportID_ANALOG: TIntegerField;
    cdsReportSKLADSKAYA: TIntegerField;
    cdsReportTOTAL_SALE: TFloatField;
    cdsReportAVERAGE_SALE: TFloatField;
    cdsReportAVG2OTKL_SALE: TFloatField;
    cdsReportRAZBROS_SALE: TFloatField;
    cdsReportKOEF_SALE: TFloatField;
    cdsReportOSTATOK: TFloatField;
    cdsReportOSTATOK_REZERV: TFloatField;
    cdsReportSPEC_OST: TFloatField;
    cdsReportPROGNOZ: TFloatField;
    cdsReportZAKUPKA: TFloatField;
    cdsReportMONTHS_SALE: TIntegerField;
    ppmReport: TPopupMenu;
    N1: TMenuItem;
    MainMenu1: TMainMenu;
    mnuActions: TMenuItem;
    N3: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    actDebug: TAction;
    N6: TMenuItem;
    dsSkladskaya: TDataSource;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    actSetColumnValue: TAction;
    actIncColumnValue: TAction;
    actMultColumnValue: TAction;
    actSave: TAction;
    mteTovarKOEF_SALE: TFloatField;
    mteTovarZAKUPKA: TFloatField;
    sdsSpecOstNerazm: TSQLDataSet;
    dspSpecOstNerazm: TDataSetProvider;
    cdsSpecOstNerazm: TClientDataSet;
    dsSpecNerazm: TDataSource;
    cdsSpecOstNerazmID_ANALOG: TIntegerField;
    cdsSpecOstNerazmKOLOTP_NERAZM: TFMTBCDField;
    cdsSpecOstNerazmTOVAR: TStringField;
    cdsReportSPEC_OST_NERAZM: TFloatField;
    sdsSpecOstRazm: TSQLDataSet;
    dspSpecOstRazm: TDataSetProvider;
    cdsSpecOstRazm: TClientDataSet;
    StringField3: TStringField;
    IntegerField1: TIntegerField;
    dsSpecOstRazm: TDataSource;
    cdsSpecOstRazmKOLOTP_RAZM: TFMTBCDField;
    cdsReportSPEC_OST_RAZM: TFloatField;
    cdsReportSPEC_FREE: TFloatField;
    N10: TMenuItem;
    cdsReportOSTATOK_FILIAL: TFloatField;
    cdsReportAVERAGE_SALE_WITH_ZEROS: TFloatField;
    cdsReportOSTATOK_FILIAL_SIMF: TFloatField;
    cdsReportOSTATOK_FILIAL_REZERV: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actSettingsExecute(Sender: TObject);
    procedure actDetailExecute(Sender: TObject);
    procedure actAverageCountExecute(Sender: TObject);
    procedure actAddTovarExecute(Sender: TObject);
    procedure mteTovarBeforePost(DataSet: TDataSet);
    procedure dbgTovarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FieldKoefChange(Sender: TField);
    procedure dbgTovarDblClick(Sender: TObject);
    procedure actDebugExecute(Sender: TObject);
    procedure dbgRepDblClick(Sender: TObject);
    procedure actSetColumnValueExecute(Sender: TObject);
    procedure actIncColumnValueExecute(Sender: TObject);
    procedure actMultColumnValueExecute(Sender: TObject);
    procedure ppmReportPopup(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure cdsReportCalcFields(DataSet: TDataSet);

  private
    { Private declarations }
    //FDateFrom : TDate;
    //FDateTo : TDate;
    FiMonths  : integer;
    FIdSravnPrice : integer;//номер сравнения прайсов из которого
      //загрузились обороты
    FdtsNaklo , FdtsNaklot :TDataSet;
    FiSkladOsn,  FiSkladFilial, FiSkladFilialSimf : integer;
    //FiSchetSpec : integer;
    FsFilter : string; //фильтр по товарам. налагается на
    //отчёт по оборотам на стадии формирования
    procedure FillMonths(dDate: TDate;iMonths : integer);
    procedure MakeEmptyDataSet(iMonths : integer);
    procedure ProcessColumns;
    procedure ProcessCaption;
    procedure UnProcessColumns;
    //заполнить остатки на спецификациях
    procedure FillSpecOst(DateTo :TDate);
    procedure FillSpecOstNerazm(id_nakl : integer);
    procedure FillSpecOstRazm(id_nakl: integer);
    procedure FillSklost(DateTo :TDate);
    procedure FillSkladskaya;
    procedure FillSklostFilial(FiSkladFilial:integer;
      sTovarList:string;
      DateTo:TDate;
      FieldName:string;
      FieldNameRezerv:string='');
     //после заполнения всего удаляет пустые строчки из отчёта
    //procedure PurgeEmptyStrings;
    procedure ProcessAverage(iMonths:integer);
    procedure ProcessTovar;
    function SqlFilterListCreate(dtsOne : TDataSet;sField: string):string;
  public
    { Public declarations }
    setT : TfrmSettings;
    procedure DefaultStartup;
    function SetInternalDatasetsForSave(dsNaklo,dsNaklot : TDataSet):boolean;
    function SetSettings: boolean;
    function SetTovarSettings : boolean;
    function DefaultOpen:boolean;
  end;

var
  frmPrixSklad: TfrmPrixSklad;


implementation

{$R *.dfm}
uses untRound, //FilterChanged
untSkladRasxDetEx, //TfrmSkladRasxDetEx
StrUtils, //AnsiReplaceStr
DetSelect, // TfrmDetSelect
SpecOstAll // TfrmSpecOstAll

, untSklost;



procedure TfrmPrixSklad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  actSave.Execute;
  Action := caFree;
end;

procedure TfrmPrixSklad.actRefreshExecute(Sender: TObject);
var
  dDate : Tdate;
  id_nakl :integer;
begin
  dmdEx.StartWaiting;
  ProcessCaption;
  UnprocessColumns;
  cdsReport.DisableControls;
  //dDate := FDateTo;
  dDate :=setT.DateTo;
  //iMonths :=(yearof(FDateTo)-yearof(FDateFrom))*12
  // +(monthof(FDateTo)-monthof(FDateFrom));
  FiMonths :=(yearof(setT.DateTo)-yearof(setT.DateFrom))*12
   +(monthof(setT.DateTo)-monthof(setT.DateFrom));
  ProgressBar1.Max:= FiMonths+10;
  ProgressBar1.Min:=0;
  ProgressBar1.Step :=1;
  ProgressBar1.Show;
  ProcessTovar;
  MakeEmptyDataSet(FiMonths);
  FillSkladskaya;
  ProgressBar1.StepIt;
  FillMonths(dDate,FiMonths);
  FillSklost(setT.DateTo);
  ProgressBar1.StepIt;
  FillSpecOst(setT.DateTo);
  ProgressBar1.StepIt;
  if Assigned(FdtsNaklo) then begin
    if FdtsNaklo.active then begin
      id_nakl:= FdtsNaklo.FieldByName('id_nakl').asInteger;
      FillSpecOstNerazm(id_nakl);
      ProgressBar1.StepIt;
      FillSpecOstRazm(id_nakl);
      ProgressBar1.StepIt;
    end; // if FdtsNaklo.active
  end; //if Assigned(FdtsNaklo)
  //PurgeEmptyStrings;
  ProcessAverage(FiMonths);
  ProgressBar1.Hide;
  cdsReport.EnableControls;
  ProcessColumns;
  dmdEx.StopWaiting;
end;

//создаёт нужное кол-во полей для отчёта
procedure TfrmPrixSklad.MakeEmptyDataSet(iMonths : integer);
var
  i : integer;
  //dDateFrom : TDate;
  T : TFloatField;
begin
try

  if cdsReport.Active then begin
    cdsReport.Close;
  end;
  for i:=cdsReport.fields.count-1 downto 0 do begin
    if AnsiStartsText('F',cdsReport.fields[i].FieldName) then begin
      cdsReport.fields[i].Free;
    end;
  end;
  cdsReport.FieldDefs.Clear;

  {with cdsReport.FieldDefs.AddFieldDef do begin
    DataType := ftString;
    Size := 50;
    Name := 'TOVAR';
  end;}
  for i:=0 to iMonths do begin
     {with cdsReport.FieldDefs.AddFieldDef do begin
      DataType :=ftFloat	;
      //ftBcd;
      Name := 'F'+inttostr(i);
      DisplayName := 'F'+inttostr(i);
      //Precision := 15;
    end;   }
    T := TFloatField.Create(cdsReport);
    T.Precision := 15;
    T.FieldName := 'F'+inttostr(i);
    T.Name := cdsReport.Name + T.FieldName;
    //T.DisplayLabel := dsSravnPricePost.DataSet.FieldByName('column_name').asString;
    T.DisplayWidth := 6;
    T.DisplayFormat := '0.0000';
    T.DataSet := cdsReport;
    T.Index := 3+i;
    //dDateFrom:=IncMonth(dDateFrom);
  end;
  {
  with cdsReport.FieldDefs.AddFieldDef do begin
    DataType := ftInteger;
    Name := 'ID_ANALOG';
    DisplayName := 'ID_ANALOG';
  end;
  with cdsReport.FieldDefs.AddFieldDef do begin
    DataType := ftInteger;
    Name := 'SKLADSKAYA';
    DisplayName := 'SKLADSKAYA';
  end;
  with cdsReport.FieldDefs.AddFieldDef do begin
    DataType := ftInteger;
    Name := 'MONTHS_SALE';
    DisplayName := 'MONTHS_SALE';
  end;
  with cdsReport.FieldDefs.AddFieldDef do begin
    DataType := ftFloat	;//ftBCD;
    Name := 'TOTAL_SALE';
    DisplayName := 'TOTAL_SALE';
  end;
  with cdsReport.FieldDefs.AddFieldDef do begin
    DataType := ftFloat	;//ftBCD;
    Name := 'AVERAGE_SALE';
    DisplayName := 'AVERAGE_SALE';
  end;
  with cdsReport.FieldDefs.AddFieldDef do begin
    DataType := ftFloat	;//ftBCD;
    Name := 'AVG2OTKL_SALE';
    DisplayName := 'AVG2OTKL_SALE';
  end;
  with cdsReport.FieldDefs.AddFieldDef do begin
    DataType := ftFloat	;//ftBCD;
    Name := 'RAZBROS_SALE';
    DisplayName := 'RAZBROS_SALE';
  end;
  with cdsReport.FieldDefs.AddFieldDef do begin
    DataType := ftFloat	;//ftBCD;
    Name := 'KOEF_SALE';
    DisplayName := 'KOEF_SALE';
  end;
  with cdsReport.FieldDefs.AddFieldDef do begin
    DataType := ftBCD;
    Name := 'OSTATOK';
    DisplayName := 'OSTATOK';
  end;
  with cdsReport.FieldDefs.AddFieldDef do begin
    DataType := ftBCD;
    Name := 'OSTATOK_REZERV';
    DisplayName := 'OSTATOK_REZERV';
  end;
  with cdsReport.FieldDefs.AddFieldDef do begin
    DataType := ftBCD;
    Name := 'SPEC_OST';
    DisplayName := 'SPEC_OST';
  end;
  with cdsReport.FieldDefs.AddFieldDef do begin
    DataType := ftBCD;
    Name := 'PROGNOZ';
    DisplayName := 'PROGNOZ';
  end;
  with cdsReport.FieldDefs.AddFieldDef do begin
    DataType := ftBCD;
    Name := 'ZAKUPKA';
    DisplayName := 'ZAKUPKA';
  end;
  }
  cdsReport.CreateDataSet;
  cdsReport.FieldByName('KOEF_SALE').OnChange:=FieldKoefChange;
  //cdsReport.FieldByName('PROGNOZ').FieldKind := fkInternalCalc;
except
  AssertInternal('6C635B46-B07C-4158-A5BF-0FE9935F8611');
end;
end;

//заполняет отчёт данными
procedure TfrmPrixSklad.FillMonths(dDate: TDate;iMonths : integer);
var
  dDateFrom,dDateTo: Tdate;
  i : integer;
begin
try
  dDateFrom := IncMonth(StartOfTheMonth(dDate),-iMonths);
  for i:=0 to iMonths do begin
    dDateTo := IncMonth(dDateFrom);
    if dDateTo > dDate then begin
      dDateTo := dDate;
    end;
    cdsReport.FieldByName('F'+inttostr(i)).DisplayLabel
     := copy(LongMonthNames[MonthOf(dDateFrom)],1,3)
     +copy(inttostr(YearOf(dDateFrom)),3,2);
    TNumericField(cdsReport.FieldByName('F'+inttostr(i))).DisplayFormat:='0.000';
//    showmessage(inttostr(TFMTBCDField(cdsReport.FieldByName('F'+inttostr(i))).Precision));
    cdsReport.FieldByName('F'+inttostr(i)).DisplayWidth:=5;

    if dDateFrom >StrToDate('01.08.2003') then begin
      cdsSkladRasx.Close;
      cdsSkladRasx.Params.ParamByName('datefrom').AsDate := dDateFrom;
      cdsSkladRasx.Params.ParamByName('dateto').AsDate := dDateTo;
      cdsSkladRasx.Filtered:=false;
      dmdEx.OpenQuery(cdsSkladRasx);
      cdsSkladRasx.Filter:=FsFilter;
      cdsSkladRasx.Filtered:=true;
      MergeStrings(cdsSkladRasx,cdsReport,'tovar','tovar','kolotp','F'+inttostr(i));
    end else begin
      //из фактической части накладных
      cdsNaklr.Close;
      cdsNaklr.Params.ParamByName('datefrom').AsDate := dDateFrom;
      cdsNaklr.Params.ParamByName('dateto').asDate := dDateTo;
      cdsNaklr.Filtered:=false;
      dmdEx.OpenQuery(cdsNaklr);
      cdsNaklr.Filter:=FsFilter;
      cdsNaklr.Filtered:=true;
      MergeStrings(cdsNaklr,cdsReport,'tovar','tovar','kolotp','F'+inttostr(i));
    end;
    ProgressBar1.StepIt;
    dDateFrom := IncMonth(dDateFrom);
  end;
except
  AssertInternal('7E5AD991-66EA-4880-A349-BAC21D06B862');
end;
end;

{
procedure TfrmPrixSklad.PurgeEmptyStrings;
var
  i : integer;
  dtsDataSet : TDataSet;
  bStringNotEmpty : boolean;
begin
  dtsDataSet :=dsReport.DataSet;
  dtsDataSet.First;
  while not dtsDataSet.eof do begin
    bStringNotEmpty := false;
    for i:=1 to dtsDataSet.Fields.count-1 do begin
      if (dtsDataSet.Fields[i] is TNumericField) then begin
        if (not dtsDataSet.Fields[i].IsNull) then begin
          if dtsDataSet.Fields[i].Value<>0 then begin
            bStringNotEmpty := true;
          end;
        end;
      end; //if (dtsDataSet.Fields[i] is TNumericField)
    end; //  for i:=1 to dtsDataSet.Fields.count-1
    if not bStringNotEmpty then begin
      dtsDataSet.Delete;
    end else begin
      dtsDataSet.Next;
    end;
  end;//while not dtsDataSet.eof
end;
}
procedure TfrmPrixSklad.ProcessColumns;
var
  i :integer;
begin
try
  for i:= 0 to dbgRep.Columns.Count-1 do begin
    dbgRep.Columns[i].ReadOnly := true;
  end;

  ColumnByName(dbgRep.Columns,'TOVAR').Footer.ValueType :=fvtCount;
  ColumnByName(dbgRep.Columns,'ZAKUPKA').Color:=clCream;
  ColumnByName(dbgRep.Columns,'ZAKUPKA').ReadOnly:=false;
  ColumnByName(dbgRep.Columns,'KOEF_SALE').ReadOnly:=false;
  ColumnByName(dbgRep.Columns,'PROGNOZ').ReadOnly:=false;
  ColumnByName(dbgRep.Columns,'SPEC_FREE').ReadOnly:=false;

except
  AssertInternal('6A3AD293-33AD-407A-B261-4FC8A9F0131E');
end;
end;

procedure TfrmPrixSklad.FormCreate(Sender: TObject);
begin
  cdsSkladRasx.CommandText:= sdsSkladRasx.CommandText;
  setT := TfrmSettings.Create(self);
  setT.actManagerOff.Execute;
	//заполение списка полей для поисковой формы вверху
  dmdEx.OpenQuery(dmdEx.cdsTovarAll);
  if not mteTovar.Active then begin
    mteTovar.CreateDataSet;
  end;
  PageControl1.ActivePageIndex:=0;
//  setT.ChangeSettings
end;

procedure TfrmPrixSklad.DefaultStartup;
begin
  actSettings.Execute;
  if not actSettings.Checked then begin
    self.Close;
  end;
end;

function TfrmPrixSklad.DefaultOpen:boolean;
begin
  actRefresh.execute;
  Result := true;
  //ProcessSettings;
  //sult:=DefaultOpenInputForm(qeNaklo);
end;

procedure TfrmPrixSklad.actSettingsExecute(Sender: TObject);
begin
//  actSettings.checked := setT.ProcessSettingsChange(actRefresh);
  actSettings.checked := setT.ProcessSettingsChange2(DefaultOpen);
end;

procedure TfrmPrixSklad.FillSpecOst(DateTo :TDate);
begin
try
  cdsSpecOst.Close;
  //cdsSpecOst.Params.ParamByName('id_schet_spec').asInteger := FiSchetSpec;
  //cdsSpecOst.Params.ParamByName('dat_from').asDate := setT.DateFrom;
  cdsSpecOst.Params.ParamByName('dat_to').AsDate := DateTo;
  cdsSpecOst.Filtered := false;
  cdsSpecOst.Open;
  cdsSpecOst.Filter:=FsFilter;
  cdsSpecOst.Filtered:=true;
  MergeStrings(cdsSpecOst,cdsReport,'tovar','tovar','kolotp_after','spec_ost',false);
except
  AssertInternal('00046073-3E2B-46E7-A326-127502DDB922');
end;
end;

procedure TfrmPrixSklad.FillSklost(DateTo :TDate);
var
  sTovarList : string;
  iTipSklad : integer;
begin
try
  //cdsSklost.Close;
  iTipSklad :=dmdEx.GetOidObjects('ТИП НАЗВАНИЯ СКЛАДОВ',-100);
  FiSkladOsn :=dmdEx.GetPredefinedObjects('ВСЕ СКЛАДЫ ГОЛОВНОЙ КОМПАНИИ',iTipSklad);
  FiSkladFilial:= dmdEx.GetOidObjects('Все склады киевского филиала',iTipSklad);
  FiSkladFilialSimf:= dmdEx.GetOidObjects('Все склады симферопольского филиала',iTipSklad);
  //cdsSklost.Params.ParamByName('dateto').asDate := DateTo;
  sTovarList :=SqlFilterListCreate(dsTovar.DataSet,'id_tovar');
  //cdsSklost.Params.ParamByName('id_tovars_in').asString := sTovarList;
  //cdsSklost.Params.ParamByName('id_sklad_in').AsInteger :=FiSkladOsn;
  //cdsSklost.Filtered := false;
  //dmdEx.OpenQuery(cdsSklost);
  //ProgressBar1.StepIt;
  //MergeStrings(cdsSklost,cdsReport,'tovar','tovar','kolotp','ostatok');
  //ProgressBar1.StepIt;
  //MergeStrings(cdsSklost,cdsReport,'tovar','tovar','kolotp_rezerv','ostatok_REZERV');

  FillSklostFilial(FiSkladOsn,sTovarList,DateTo,'ostatok','ostatok_REZERV');
  FillSklostFilial(FiSkladFilial,sTovarList,DateTo,'ostatok_filial','ostatok_filial_rezerv');
  FillSklostFilial(FiSkladFilialSimf,sTovarList,DateTo,'ostatok_filial_simf');



except
  AssertInternal('1AFDB5E2-D249-42AF-A324-392C60D0F3D0');
end;
end;

procedure TfrmPrixSklad.FillSklostFilial(FiSkladFilial:integer;
  sTovarList:string;
  DateTo:TDate;
  FieldName:string;
  FieldNameRezerv:string='');
begin
  cdsSklost.Close;
  cdsSklost.Params.ParamByName('id_sklad_in').AsInteger :=FiSkladFilial;
  cdsSklost.Params.ParamByName('id_tovars_in').asString := sTovarList;
  cdsSklost.Params.ParamByName('dateto').asDate := DateTo;
  cdsSklost.Filtered := false;
  dmdEx.OpenQuery(cdsSklost);
  MergeStrings(cdsSklost,cdsReport,'tovar','tovar','kolotp',FieldName);
  ProgressBar1.StepIt;
  if (FieldNameRezerv<>'') then begin
    MergeStrings(cdsSklost,cdsReport,'tovar','tovar','kolotp_rezerv',FieldNameRezerv);
    ProgressBar1.StepIt;
  end;
end;

procedure TfrmPrixSklad.FillSkladskaya;
begin
try
  cdsSkladskaya.Close;
  cdsSkladskaya.Filtered := false;
  dmdEx.OpenQuery(cdsSkladskaya);
  cdsSkladskaya.Filter:=FsFilter;
  cdsSkladskaya.Filtered:=true;
  //MergeStrings(cdsSkladskaya,cdsReport,'tovar','tovar','skladskaya','skladskaya');
  //MergeStrings(cdsSkladskaya,cdsReport,'tovar','tovar','id_analog','id_analog');
  MergeStrings(cdsSkladskaya,cdsReport,'tovar','tovar','skladskaya;id_analog','skladskaya;id_analog');
  MergeStrings(mteTovar,cdsReport,'id_tovar','id_analog','koef_sale','koef_sale');
  MergeStrings(mteTovar,cdsReport,'id_tovar','id_analog','zakupka','zakupka');  
  //ProgressBar1.StepIt;
except
  AssertInternal('93B6ED8A-6E8F-4C18-9B11-E0C37BE44474');
end;
end;

procedure TfrmPrixSklad.actDetailExecute(Sender: TObject);
var
  SkladRasxDetEx :TfrmSkladRasxDetEx;
  frmSpecOstAll : TfrmSpecOstAll;
  sTemp : string;
  iMonthNumber : integer;
  DateFrom ,DateTo : TDate;
begin
  if not Assigned(dbgRep.SelectedField) then begin
    exit;
  end;
  if (dbgRep.SelectedField.FieldName='SPEC_OST')  then begin
    frmSpecOstAll := TfrmSpecOstAll.Create(Application);
    frmSpecOstAll.setT.DateTo := setT.DateTo;
    frmSpecOstAll.setT.DateFrom := setT.DateFrom;
    frmSpecOstAll.qeRasx.SetSQL('where','o.id_analog='+cdsReport.fieldByName('id_analog').asString,0);
    frmSpecOstAll.actRefresh.Execute;
    //ShowSpecOstAll(id_analog,dat_to);
  end;
  if AnsiStartsText ('F',dbgRep.SelectedField.FieldName) then begin
    SkladRasxDetEx :=TfrmSkladRasxDetEx.Create(Application);
    SkladRasxDetEx.qeDet.SetSQL('where','t2.id_analog='+cdsReport.fieldByName('id_analog').asString,0);
    sTemp:=AnsiReplaceStr(dbgRep.SelectedField.FieldName,'F','');
    iMonthNumber:=strtoint(sTemp);
    DateFrom := IncMonth(sett.DateFrom,iMonthNumber);
    DateTo := DateOf(EndOfTheMonth(DateFrom));

    SkladRasxDetEx.qeDet.SetSQL('where','om.dat>='+quotedstr(datetostr(DateFrom)),1);
    SkladRasxDetEx.qeDet.SetSQL('where','om.dat<='+quotedstr(datetostr(DateTo)),2);
    SkladRasxDetEx.qeDet.SetSQL('where','om.tip=5',3);
    SkladRasxDetEx.qeDet.Refresh;
    //SkladRasxDetEx.Show;
  end;
  if (AnsiUpperCase(dbgRep.SelectedField.FieldName)=
    AnsiUpperCase('OSTATOK')) or
    (AnsiUpperCase(dbgRep.SelectedField.FieldName)=
    AnsiUpperCase('OSTATOK_REZERV'))
  then begin
    frmSklost := TfrmSklost.Create(Application);
    frmSklost.ShowDetail(2,
      FiSkladOsn,
      null,
      setT.DateTo,
      dsReport.DataSet.FieldByName('id_analog').asInteger,
    );
  end;
  if (AnsiUpperCase(dbgRep.SelectedField.FieldName)=
    AnsiUpperCase('OSTATOK_FILIAL')) or
    (AnsiUpperCase(dbgRep.SelectedField.FieldName)=
    AnsiUpperCase('OSTATOK_FILIAL_REZERV'))
  then begin
    frmSklost := TfrmSklost.Create(Application);
    frmSklost.ShowDetail(2,
      FiSkladFilial,
      null,
      setT.DateTo,
      dsReport.DataSet.FieldByName('id_analog').asInteger,
    );
  end;
  if (AnsiUpperCase(dbgRep.SelectedField.FieldName)=
    AnsiUpperCase('OSTATOK_FILIAL_SIMF'))
  then begin
    frmSklost := TfrmSklost.Create(Application);
    frmSklost.ShowDetail(2,
      FiSkladFilialSimf,
      null,
      setT.DateTo,
      dsReport.DataSet.FieldByName('id_analog').asInteger,
    );
  end;
end;

procedure TfrmPrixSklad.ProcessAverage(iMonths:integer);
var
  DataSet: TDataSet;
  i,iMonthsSale : integer;
  dTotalSale,dAverageSaleWithZeros, dAverageSale,
  dSale,dDisp3,dDisp4:double;
  //dDisp1,dDisp2,dAvg2Otkl2
  dAvg2Otkl1:double;
begin
try
  DataSet := dsReport.DataSet;
  DataSet.First;
  while not DataSet.eof do begin
    dDisp3 := 0;
    dDisp4 :=0;
    iMonthsSale :=0;
    dTotalSale :=0;
    for i:=0 to iMonths do begin
      if cdsReport.FieldByName('F'+inttostr(i)).isNull then begin
        dSale:=0;
      end else begin
        dSale := cdsReport.FieldByName('F'+inttostr(i)).AsFloat;
      end;
      if dSale>0 then begin
        inc(iMonthsSale);
        dTotalSale:=dTotalSale+dSale;
        dDisp3:=dDisp3+ sqr(dSale);
      end;
    end;//for
    if iMonthsSale<>0 then begin
      dAverageSale:=dTotalSale/iMonthsSale;
    end else begin
      dAverageSale:=0;
    end;
    if iMonths<>0 then begin
      dAverageSaleWithZeros:=dTotalSale/(iMonths+1);
      dDisp4 :=
        abs(
          dDisp3*(iMonths+1)- sqr(dTotalSale)
        )/sqr(iMonths+1);
    end else begin
      dAverageSaleWithZeros :=0;
    end;
    //dDisp4 := abs((dDisp3-(sqr(dAverageSale)*iMonthsSale))/iMonthsSale); 
    dAvg2Otkl1 := RRoundTo(sqrt(dDisp4),-5); //dAvg2Otkl2
    if iMonthsSale>0 then begin
      DataSet.Edit;
      DataSet.FieldByName('MONTHS_SALE').asInteger :=iMonthsSale;
      if dTotalSale<>0 then begin
        DataSet.FieldByName('TOTAL_SALE').asFloat :=dTotalSale;
      end;
      if dAverageSale<>0 then begin
        DataSet.FieldByName('AVERAGE_SALE').asFloat :=dAverageSale;
      end;
      if dAverageSaleWithZeros<>0 then begin
        DataSet.FieldByName('AVERAGE_SALE_WITH_ZEROS').asFloat :=dAverageSaleWithZeros;
        DataSet.FieldByName('AVG2OTKL_SALE').asFloat := dAvg2Otkl1;
        DataSet.FieldByName('RAZBROS_SALE').asFloat := dAvg2Otkl1/dAverageSaleWithZeros;
      end;
      DataSet.FieldByName('Prognoz').asFloat :=
        DataSet.FieldByName('ostatok').asFloat+
        DataSet.FieldByName('spec_ost').asFloat-
        (DataSet.FieldByName('average_sale').asFloat*
        DataSet.FieldByName('koef_sale').asFloat);
      //DataSet.Post;
    end;
    DataSet.Next;
  end; //while  not eof
except
  AssertInternal('9F8C5A7A-5A60-4606-8C11-96DEFA2E2AED');
end;
end;

procedure TfrmPrixSklad.actAverageCountExecute(Sender: TObject);
//var
  //iMonths : integer;
begin
  //iMonths :=
  // (yearof(FDateTo)-yearof(FDateFrom))*12
  // +(monthof(FDateTo)-monthof(FDateFrom));
  ProcessAverage(FiMonths);
end;

procedure TfrmPrixSklad.actAddTovarExecute(Sender: TObject);
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

  frmDetSelect := TfrmDetSelect.Create(Self);
  frmDetSelect.ShowSprTovarSnab;
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
  frmDetSelect.Free;  }
except
  AssertInternal('4766BD68-0D5F-4D29-873F-19060795C26E');
end;
end;

procedure TfrmPrixSklad.ProcessTovar;
begin
try
  mteTovar.SortByFields('GRUPPA1,GRUPPA2,GRUPPA3,GRUPPA4');
  FsFilter := FilterListCreate(dsTovar.DataSet,'id_tovar');
  FsFilter := AnsiReplaceStr (FsFilter,'id_tovar','[id_analog]');
except
  AssertInternal('E258E1A2-7282-4FC5-AE07-62B6CAB6B75C');
end
end;

function TfrmPrixSklad.SqlFilterListCreate(dtsOne : TDataSet;sField: string):string;
var
  sTemp : string;
begin
  dtsOne.First;
  sTemp := dtsOne.FieldByName(sField).asString;
  dtsOne.Next;
  while not dtsOne.eof do begin
    sTemp := sTemp+';'+dtsOne.FieldByName(sField).asString;
    dtsOne.Next;
  end;
  Result := sTemp;
end;

procedure TfrmPrixSklad.mteTovarBeforePost(DataSet: TDataSet);
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

procedure TfrmPrixSklad.dbgTovarKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i : integer;
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

procedure TfrmPrixSklad.FieldKoefChange(Sender: TField);
var
  DataSet : TDataSet;
begin
  DataSet := Sender.DataSet;
  //if dataset.state=dsBrowse then begin
  //  DataSet.Edit;
  //end;
  DataSet.FieldByName('Prognoz').asFloat :=
  DataSet.FieldByName('ostatok').asFloat+
  DataSet.FieldByName('spec_ost').asFloat-
  DataSet.FieldByName('average_sale').asFloat*
  VarToDbl (Sender.NewValue)
;
  //DataSet.checkbrowsemode;
end;

procedure TfrmPrixSklad.dbgTovarDblClick(Sender: TObject);
begin
  actDetail.Execute;
end;

procedure TfrmPrixSklad.actDebugExecute(Sender: TObject);
begin
  actDebug.Checked := not actDebug.Checked;
  if actDebug.Checked then begin
    cdsReport.FieldByName('id_analog').Visible := true;
    cdsReport.FieldByName('AVG2OTKL_SALE').Visible := true;
    cdsReport.FieldByName('AVERAGE_SALE_WITH_ZEROS').Visible := true;
    cdsReport.FieldByName('RAZBROS_SALE').Visible := true;
  end else begin
    cdsReport.FieldByName('id_analog').Visible := false;
    cdsReport.FieldByName('AVG2OTKL_SALE').Visible := false;
    cdsReport.FieldByName('AVERAGE_SALE_WITH_ZEROS').Visible := false;
    cdsReport.FieldByName('RAZBROS_SALE').Visible := false;
  end;
end;

procedure TfrmPrixSklad.dbgRepDblClick(Sender: TObject);
begin
  actDetail.Execute;
end;

function TfrmPrixSklad.SetInternalDatasetsForSave(dsNaklo,
  dsNaklot: TDataSet): boolean;
begin
  FdtsNaklo := dsNaklo;
  FdtsNaklot := dsNaklot;
  FIdSravnPrice := FdtsNaklo.FieldByName('id_nakl').asInteger;
  Result:=true;
end;

function TfrmPrixSklad.SetSettings: boolean;
begin
  {if Assigned(FdtsNaklo) then begin
    SettingsDataset.SetKeyValue(FdtsNaklo.FieldByName('id_sklad').asInteger);
    SettingsDate.SetKeyValue(FdtsNaklo.FieldByName('dat').AsDateTime);
  end;}

  Result :=true;
end;

function TfrmPrixSklad.SetTovarSettings : boolean;
begin
  Result := true;
  dmdEx.startWaiting;
  dsTovar.DataSet.DisableControls;
  FdtsNaklot.Filtered :=false;
  FdtsNaklot.First;
  while not FdtsNaklot.eof do begin
    try
      dsTovar.DataSet.Append;
      dsTovar.DataSet.fieldByName('id_tovar').AsInteger :=
        FdtsNaklot.FieldByName('id_tovar').asInteger;
      dsTovar.DataSet.fieldByName('koef_sale').AsVariant :=
        FdtsNaklot.FieldByName('koef').AsVariant;
      dsTovar.DataSet.fieldByName('zakupka').AsFloat :=
        FdtsNaklot.FieldByName('kolotp').asFloat;
      dsTovar.DataSet.Post;
    except
      dsTovar.DataSet.Cancel;
    end;
    FdtsNaklot.Next;
  end;
  dsTovar.DataSet.EnableControls;
  dmdEx.StopWaiting;
end;

procedure TfrmPrixSklad.actSetColumnValueExecute(Sender: TObject);
begin
  dmdEx.ColumnSet(dbgRep);
end;

procedure TfrmPrixSklad.actIncColumnValueExecute(Sender: TObject);
begin
  dmdEx.ColumnInc(dbgRep);
end;

procedure TfrmPrixSklad.actMultColumnValueExecute(Sender: TObject);
begin
  dmdEx.ColumnMult(dbgRep);
end;

procedure TfrmPrixSklad.ppmReportPopup(Sender: TObject);
begin
  //чтобы пункт контекстного меню "Заполнить значением" был виден только для
  //перечисленных колонок
  //Rebuild :=true;
  if not Assigned(dbgRep.SelectedField) then begin
    exit;
  end;
  if not ((AnsiUpperCase(dbgRep.SelectedField.FieldName) = AnsiUpperCase('KOEF_SALE'))
    or (AnsiUpperCase(dbgRep.SelectedField.FieldName) = AnsiUpperCase('ZAKUPKA'))) then begin
    actSetColumnValue.Visible:=false;
    actIncColumnValue.Visible:=false;
    actMultColumnValue.Visible:=false;
  end else begin
    actSetColumnValue.Visible:=true;
    actIncColumnValue.Visible:=true;
    actMultColumnValue.Visible:=true;
    //exit;
  end;
end;

procedure TfrmPrixSklad.actSaveExecute(Sender: TObject);
var
  sComment : string;
begin
  if Assigned(FdtsNaklo) then begin
    if (FdtsNaklo.Active) then begin
      if ((FdtsNaklo.FieldByName('posted').asInteger=0) and
        (FdtsNaklo.FieldByName('blocked').asInteger=0) and
        (FdtsNaklo.FieldByName('delmarked').asInteger=0) )
      then begin
        if MessageDlg('Сохранить?',mtConfirmation ,[mbYes,mbNo],0)=mrYes then begin
          if not FdtsNaklo.Locate('id_nakl', FIdSravnPrice,[]) then begin
            AssertInternal('CB725A32-FB07-4C8B-9189-DDD35DDE8BD9'+inttostr(FIdSravnPrice));
          end;
          try
          sComment :=InputBox('Введите комментарий','Комментарий',
            FdtsNaklo.FieldByName('comment').asString);
          //чтобы не сработала showdetail1


          FdtsNaklo.Tag:=1;
          if FdtsNaklo.State=dsBrowse then begin
            FdtsNaklo.Edit;
          end;
          FdtsNaklo.FieldByName('comment').asString := sComment;
          FdtsNaklo.CheckBrowseMode;
          FdtsNaklo.Tag:=0;
          except
            AssertINternal('ED7C454A-C5B5-42C7-96E2-65AAD77C1FB2');
          end;
          try
          dmdEx.startwaiting;
          FdtsNaklot.Filtered := false;
          CopyDatasetFields(dsReport.dataset,FdtsNaklot,
            'id_analog','id_tovar',
            'zakupka;prognoz;koef_sale',
            'kolotp;kolotp_prognoz;koef',
            1);
          {
          MergeStrings(dsReport.dataset,FdtsNaklot,'id_analog','id_tovar','zakupka','kolotp');
          MergeStrings(dsReport.dataset,FdtsNaklot,'id_analog','id_tovar','prognoz','kolotp_prognoz');
          MergeStrings(dsReport.dataset,FdtsNaklot,'id_analog','id_tovar','koef_sale','koef'); }
          except
            AssertINternal('A4FB26EB-264D-46EF-8031-98BA09145A2C');
          end;
          try
          PostAndApplyOrCancel(FdtsNaklo);
          PostAndApplyOrCancel(FdtsNaklot);
          dmdex.stopwaiting;
          except
            AssertInternal('C045B870-45E3-4892-A541-DD0C5E775450');
          end;
        end;//if save
      end; //if not posted and not blocked and not delmarked
    end; //if active
  end;  //assigned
end;

procedure TfrmPrixSklad.FillSpecOstNerazm(id_nakl: integer);
begin
try
  cdsSpecOstNerazm.Close;
  cdsSpecOstNerazm.Params.ParamByName('id_nakl').AsInteger := id_nakl;
  cdsSpecOstNerazm.Filtered := false;
  cdsSpecOstNerazm.Open;
  cdsSpecOstNerazm.Filter:=FsFilter;
  cdsSpecOstNerazm.Filtered:=true;
  MergeStrings(cdsSpecOstNerazm,cdsReport,'tovar','tovar','kolotp_nerazm','spec_ost_nerazm',false);
  cdsSpecOstNerazm.Close;
except
  AssertInternal('7C5F22E9-D927-49BC-B0F4-EE40B657EC2E');
end;
end;

procedure TfrmPrixSklad.FillSpecOstRazm(id_nakl: integer);
begin
try
  cdsSpecOstRazm.Close;
  cdsSpecOstRazm.Params.ParamByName('id_nakl').AsInteger := id_nakl;
  cdsSpecOstRazm.Filtered := false;
  cdsSpecOstRazm.Open;
  cdsSpecOstRazm.Filter:=FsFilter;
  cdsSpecOstRazm.Filtered:=true;
  MergeStrings(cdsSpecOstRazm,cdsReport,'tovar','tovar','kolotp_razm','spec_ost_razm',false);
  cdsSpecOstRazm.Close;
except
  AssertInternal('86C164AC-BBEA-499D-AD17-CAF33FAD4CA7');
end;
end;

procedure TfrmPrixSklad.cdsReportCalcFields(DataSet: TDataSet);
begin
  if DataSet.State = dsInternalCalc then begin
    DataSet.FieldByName('spec_free').AsFloat :=
      DataSet.FieldByName('zakupka').AsFloat-
      DataSet.FieldByName('spec_ost_razm').AsFloat-
      DataSet.FieldByName('spec_ost_nerazm').AsFloat;
  end;
end;

procedure TfrmPrixSklad.UnProcessColumns;
var
  i :integer;
begin
  for i:= 0 to dbgRep.Columns.Count-1 do begin
    dbgRep.Columns[i].ReadOnly := false;
  end;
end;

procedure TfrmPrixSklad.ProcessCaption;
begin
  self.Caption := 'Расчёт оборотов склада. С '+ datetostr(setT.DateFrom)+
    ' по '+ datetostr(setT.DateTo);
end;

end.
