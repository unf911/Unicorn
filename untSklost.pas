unit untSklost;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEx, FMTBcd, ActnList, Menus, Grids, DBGridEh, DB, DBClient,
  Provider, SqlExpr, StdCtrls, ExtCtrls, QueryExtender,
  untSklostDet,
  atsAssert,
  Buttons,
  untNakloSelect,
  Registry, ComCtrls, //TRegIniFile
	DateUtils, //startofthemonth
  untRound, // GetPrice
	Mask, DBCtrlsEh, DBLookupEh, PropStorageEh, UnfFilter, PropFilerEh,
     GridsEh,
	  
  PriceCalc, frxClass, frxDBSet ;

type
  TfrmSklost = class(TForm)
    sdsSklost: TSQLDataSet;
    sdsSklostt: TSQLDataSet;
    dspSklost: TDataSetProvider;
    dspSklostt: TDataSetProvider;
    cdsSklost: TClientDataSet;
    cdsSklostt: TClientDataSet;
    dsSklost: TDataSource;
    dsSklostt: TDataSource;
    dsSklostSrc: TDataSource;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    mnuRefresh: TMenuItem;
    ActionList1: TActionList;
    actRefresh: TAction;
    cdsSklostKOLOTP: TFMTBCDField;
    cdsSklostID_SKLAD: TIntegerField;
    cdsSklostID_OST: TIntegerField;
    cdsSklosttKOLOTP: TFMTBCDField;
    cdsSklosttKOLBUXT: TIntegerField;
    cdsSklosttNOMER_TARY: TStringField;
    cdsSklosttID_OSTT: TIntegerField;
    cdsSklosttKOLREZERV: TFMTBCDField;
    cdsSklosttKOLBREZERV: TIntegerField;
    cdsSklosttCOMMENT: TStringField;
    qeSklostt: TQueryExtender;
    cdsSklostKOLREZERV: TFMTBCDField;
    cdsSklosttID_TYPE: TIntegerField;
    actRecalcPosit: TAction;
    sdsSklostdetRecalcPc: TSQLDataSet;
    N2: TMenuItem;
    cdsSklostTOVAR: TStringField;
    cdsSklosttTARA: TStringField;
    sdsSklostID_OST: TIntegerField;
    sdsSklostID_SKLAD: TIntegerField;
    sdsSklostTOVAR: TStringField;
    sdsSklostKOLOTP: TFMTBCDField;
    sdsSklostKOLREZERV: TFMTBCDField;
    actDetail: TAction;
    actDetail1: TMenuItem;
    actSettings: TAction;
    cdsSklosttID_TARA: TIntegerField;
    cdsSklosttID_IZG: TIntegerField;
    cdsSklosttIZG: TStringField;
    cdsSklosttTIP2: TStringField;
    cdsSklosttKOLTOTAL: TFloatField;
    cdsSklostKOLTOTAL: TFloatField;
    sdsSklostt2: TSQLDataSet;
    dspSklostt2: TDataSetProvider;
    cdsSklostt2: TClientDataSet;
    StringField1: TStringField;
    FMTBCDField1: TFMTBCDField;
    IntegerField1: TIntegerField;
    StringField2: TStringField;
    IntegerField2: TIntegerField;
    FMTBCDField2: TFMTBCDField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    StringField3: TStringField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    StringField4: TStringField;
    StringField5: TStringField;
    FloatField1: TFloatField;
    dsSklostt2: TDataSource;
    qeSklost: TQueryExtender;
    cdsSklostSKLAD: TStringField;
    Panel1: TPanel;
    dbgSklost: TDBGridEh;
    lcbSklad: TDBLookupComboboxEh;
    edtTovar: TEdit;
    Panel2: TPanel;
    RadioGroup1: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    btnSettings: TBitBtn;
    Splitter1: TSplitter;
    Panel3: TPanel;
    dbgSklostt: TDBGridEh;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    PopSklost: TPopupMenu;
    actCopy: TAction;
    ufSklost: TUnfFilter;
    actPrint: TAction;
    N3: TMenuItem;
    N4: TMenuItem;
    frUserDataset1: TfrxUserDataset;
    cdsSklostt2KOLTOTAL2: TAggregateField;
    ufSklostt: TUnfFilter;
    actPriceCalc: TAction;
    sdsSklostTARA: TSmallintField;
    cdsSklostTARA: TSmallintField;
    N5: TMenuItem;
    sdsSklostID_TOVAR: TIntegerField;
    cdsSklostID_TOVAR: TIntegerField;
    sdsSklostt3: TSQLDataSet;
    dspSklostt3: TDataSetProvider;
    cdsSklostt3: TClientDataSet;
    StringField6: TStringField;
    FMTBCDField3: TFMTBCDField;
    IntegerField7: TIntegerField;
    StringField7: TStringField;
    IntegerField8: TIntegerField;
    FMTBCDField4: TFMTBCDField;
    IntegerField9: TIntegerField;
    IntegerField10: TIntegerField;
    StringField8: TStringField;
    IntegerField11: TIntegerField;
    IntegerField12: TIntegerField;
    StringField9: TStringField;
    StringField10: TStringField;
    FloatField2: TFloatField;
    dsSklostt3: TDataSource;
    cdsSklostt2KOLTARA2: TAggregateField;
    cdsSklostt2KOLTARA: TFloatField;
    frdSklostt: TfrxDBDataset;
    actPrintDet: TAction;
    actDesignDet: TAction;
    N6: TMenuItem;
    N7: TMenuItem;
    sdsSklostANALOG: TStringField;
    cdsSklostANALOG: TStringField;
    actShowSpecOst: TAction;
    sdsSklostID_ANALOG: TIntegerField;
    cdsSklostID_ANALOG: TIntegerField;
    N8: TMenuItem;
    N9: TMenuItem;
    frdSklost: TfrxDBDataset;
    cdsSklostt2DAT_POST: TSQLTimeStampField;
    cdsSklostt2KOLOTP_ISX: TFMTBCDField;
    frSklostDet: TfrxReport;
    frSklost: TfrxReport;
    dteToday: TDBDateTimeEditEh;
    procedure actRefreshExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure actRecalcPositExecute(Sender: TObject);
    procedure actDetailExecute(Sender: TObject);
    procedure actSettingsExecute(Sender: TObject);
    procedure edtTovarChange(Sender: TObject);
    procedure cdsSklosttCalcFields(DataSet: TDataSet);
    procedure cdsSklostCalcFields(DataSet: TDataSet);
    procedure cdsSklostAfterScroll(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure lcbSkladChange(Sender: TObject);
    procedure frSklostGetValue(const ParName: String;
      var ParValue: Variant);
    procedure actPrintExecute(Sender: TObject);
    procedure frUserDataset1First(Sender: TObject);
    procedure frUserDataset1Next(Sender: TObject);
    procedure frUserDataset1Prior(Sender: TObject);
    procedure frUserDataset1CheckEOF(Sender: TObject; var Eof: Boolean);
    procedure dbgSklosttDblClick(Sender: TObject);
    procedure actPriceCalcExecute(Sender: TObject);
    procedure dbgSklostDblClick(Sender: TObject);
    procedure cdsSklostt3CalcFields(DataSet: TDataSet);
    procedure dteToday2Change(Sender: TObject);
    procedure cdsSklostt2CalcFields(DataSet: TDataSet);
    procedure actPrintDetExecute(Sender: TObject);
    procedure actDesignDetExecute(Sender: TObject);
    procedure actShowSpecOstExecute(Sender: TObject);

  private
    { Private declarations }
//    frmNakloSelect : TfrmNakloSelect;
    //все позиции, не пустые, отчёт на дату
    iSkladTreeOid : integer; //идентификатор иерархии складов, был 108
    procedure ProcessMode;
    procedure ProcessColumns;
    //какой склад показывать
    procedure ProcessSklad;
  public
     procedure ShowDetail(mode_in: integer;
       id_sklad_in, id_tovar_in,dat_to: variant;id_analog_in:variant);
    { Public declarations }
  end;

var
  frmSklost: TfrmSklost;

implementation

uses

  SpecOstAll, //TfrmSpecOstAll
  DesignReport //ProcessReportDesigner
  ;

{$R *.dfm}

procedure TfrmSklost.actRefreshExecute(Sender: TObject);
begin
try
    dmdEx.StartWaiting;
    if (RadioGroup1.ItemIndex=0) then begin
      cdsSklostt.Close;
    end;
    if (RadioGroup1.ItemIndex=1) then begin
      cdsSklostt3.Close;
    end;
    if (RadioGroup1.ItemIndex=2) then begin
      cdsSklostt2.Close;
    end;
    ProcessMode;
    ProcessSklad;
    qeSklost.Refresh;
    //cdsSklost.Refresh;
    cdsSklostAfterScroll(cdsSklost);
    dmdEx.StopWaiting;
except
  AssertInternal('16979CB7-FAC3-4419-8DF9-7003DBD02045');
end;
end;

procedure TfrmSklost.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  cdsSklost.close;
  Action := caFree;
end;

procedure TfrmSklost.FormCreate(Sender: TObject);
var
  iSkladUkk : integer;
begin
//  dmdEx.StartWaiting;
  dmdEx.OpenQuery(dmdEx.cdsAllClient);
  dmdEx.OpenQuery(dmdEx.cdsSklads);
  dmdEx.OpenQuery(dmdEx.cdsSklottIdtype);
  dbgSklostt.SumList.Active := false;
  dbgSklostt.FooterRowCount:=0;
  iSkladTreeOid:=dmdEx.GetOidObjects('ТИП НАЗВАНИЯ СКЛАДОВ',-100);
  iSkladUkk:=dmdEx.GetOidObjects('Все склады УКК',iSkladTreeOid);
  RadioGroup1.ItemIndex := 0;
  qeSklost.DefSql := sdsSklost.CommandText;
	qeSklostt.DefSql := sdsSklostt.CommandText;
	//ProcessMode;
  //Склад Укк
  //lcbSklad.KeyValue:=0;
  lcbSklad.KeyValue := iSkladUkk;
  dteToday.Value :=  DateOf(EndOfTheMonth(IncMonth (date,-1)));
  ProcessReportDesigner(ActionList1,MainMenu1,frSklost);
  ProcessReportDesigner(ActionList1,MainMenu1,frSklostDet);
end;

procedure TfrmSklost.ProcessMode;
var
  sIdost : string;
begin
	dmdEx.StartWaiting;
	//  qeSklost.SavePosition;
  sIdOst:=qeSklost.Query.FieldByName('id_ost').asstring;
  cdsSklost.Close;
//---------------
  if RadioGroup1.ItemIndex=0 then begin
    { DONE : Нули в пустых позициях скрыть }
    qeSklost.SetSql('where','(s.kolotp<>0 or s.kolrezerv<>0)',1);
    qeSklost.Prepare;
  end;//stand
  if RadioGroup1.ItemIndex=1 then begin
    { DONE : Нули в пустых позициях скрыть }
    qeSklost.SetSql('where','',1);
    qeSklost.Prepare;
  end;//full
  if RadioGroup1.ItemIndex=2 then begin
    qeSklost.SetSql('where','',1);
    qeSklost.Prepare;
  end;
  ProcessColumns;
  qeSklost.Refresh;
  qeSklost.GetThisPosition(sIdOst);

	dmdEx.StopWaiting;
end;



procedure TfrmSklost.RadioGroup1Click(Sender: TObject);
begin
	ProcessMode;
end;

procedure TfrmSklost.actRecalcPositExecute(Sender: TObject);
begin
try
  sdsSklostdetRecalcPc.ParamByName('id_ostt').AsInteger :=
		cdsSklostt.FieldByName('id_ostt').AsInteger;
	dmdEx.ExecSQL(sdsSklostdetRecalcPc);
  actRefresh.Execute;
except
  AssertInternal('E53FABC4-13E4-4CFE-A8AE-0441B245D6E0');
end;
end;

procedure TfrmSklost.actDetailExecute(Sender: TObject);
var
  id_ostt : integer;
  frmSklostDet : TfrmSklostDet;
begin
id_ostt := 0;
try
  if RadioGroup1.ItemIndex=0 then begin
    id_ostt:= cdsSklostt.FieldBYName('id_ostt').asInteger;
  end;
  if RadioGroup1.ItemIndex=1 then begin
    id_ostt:= cdsSklostt3.FieldBYName('id_ostt').asInteger;
  end;
  if RadioGroup1.ItemIndex=2 then begin
    id_ostt := cdsSklostt2.FieldByName('id_ostt').asInteger;
  end;
  frmSklostDet := TfrmSklostDet.Create(Application);
  frmSklostDet.ShowDetail(id_ostt);
except
  AssertInternal ('5301AC84-0165-475E-B77C-5E53934A45B0');
end;
end;


procedure TfrmSklost.actSettingsExecute(Sender: TObject);
begin
//
end;

procedure TfrmSklost.edtTovarChange(Sender: TObject);
begin

  if (edtTovar.Text <>'') then begin
    cdsSklost.Locate (
      'analog',
      edtTovar.Text,[loCaseInsensitive, loPartialKey]);
  end;
end;

procedure TfrmSklost.cdsSklosttCalcFields(DataSet: TDataSet);
begin
try
  if DataSet.State = dsInternalCalc then begin
    DataSet.FieldByName('koltotal').AsFloat:=
       (DataSet.FieldByName('kolotp').AsFloat*
       DataSet.FieldByName('kolbuxt').AsInteger)
       +
       (DataSet.FieldByName('kolrezerv').AsFloat*
       DataSet.FieldByName('kolbrezerv').AsInteger);
  end;//if dsInternalCalc
except
  AssertInternal('CD9C2400-86D0-4077-9A75-564FCE9BBA42');
end;
end;

procedure TfrmSklost.cdsSklostCalcFields(DataSet: TDataSet);
begin
  dataset.fieldByName('koltotal').asFloat :=
    dataset.FieldByName('kolotp').asFloat+
    dataset.FieldByName('kolrezerv').asFloat;

end;

procedure TfrmSklost.cdsSklostAfterScroll(DataSet: TDataSet);
begin
 if (DataSet.ControlsDisabled = false) then begin
  if (RadioGroup1.ItemIndex=2)  then begin
    //выбран остаток на дату
    cdsSklostt2.Close;
    cdsSklostt2.Params.ParamByName('today').AsDate:=dteToday.Value;
    cdsSklostt2.Params.ParamByName('id_tovar').AsInteger :=
      cdsSklost.FieldByName('id_tovar').asInteger;
    cdsSklostt2.Params.ParamByName('id_sklad').AsInteger :=
      cdsSklost.FieldByName('id_sklad').asInteger;
    cdsSklostt2.Open;
  end;
  if (RadioGroup1.ItemIndex=0) then begin
    //выбран режим стандарт
    cdsSklostt.Close;
    cdsSklostt.Params.ParamByName('id_tovar').AsInteger :=
      cdsSklost.FieldByName('id_tovar').asInteger;
    cdsSklostt.Params.ParamByName('id_sklad').AsInteger :=
      cdsSklost.FieldByName('id_sklad').asInteger;
    cdsSklostt.Open;
  end;
  if (RadioGroup1.ItemIndex=1) then begin
    //выбран режим полный
    cdsSklostt3.Close;
    cdsSklostt3.Params.ParamByName('id_tovar').AsInteger :=
      cdsSklost.FieldByName('id_tovar').asInteger;
    cdsSklostt3.Params.ParamByName('id_sklad').AsInteger :=
      cdsSklost.FieldByName('id_sklad').asInteger;
    cdsSklostt3.Open;
  end;
 end;//controlsdisabled=false
end;



procedure TfrmSklost.FormActivate(Sender: TObject);
begin
  if (RadioGroup1.ItemIndex=0) then begin
    //Автообновление только в стандартном режиме
    dmdEx.StartWaiting;
//    qeSklost.Refresh;
    cdsSklost.Refresh;
    cdsSklostt.Refresh;
    dmdEx.StopWaiting;
  end;
end;

procedure TfrmSklost.ProcessSklad;
begin
  //oid все склады=104
  cdsSklost.Params.ParamByName('tree_oid').AsInteger := iSkladTreeOid;
  cdsSklost.Params.ParamByName('oid').asInteger := VarToInt(lcbSklad.KeyValue,true);
  qeSklost.Prepare;
end;

procedure TfrmSklost.lcbSkladChange(Sender: TObject);
begin
  ProcessSklad;
  qeSklost.Refresh;
end;

procedure TfrmSklost.frSklostGetValue(const ParName: String;
	var ParValue: Variant);
var
	strTemp : string;
begin
try
	if AnsiUpperCase(ParName) = 'TITLE' then begin
		//генерация заголовка
		strTemp :=self.Caption+'.';
		if RadioGroup1.ItemIndex=2 then begin //отчёт на дату
			strTemp := strTemp + ' На дату: '+ datetostr(dteToday.Value)+'.';
		end;
		strTemp := strTemp + ' Склад: '+
      vartostr(lcbSklad.Text)+
			//dmdEx.dsSklads.dataset.fieldbyname('name').asString+
      '.';
		if (cdsSklost.Filtered or dbgSklostt.DataSource.DataSet.Filtered) then begin
			//если отчёт отфильтрован
			strTemp := strTemp+ ' [Фильтр]';
		end;
		ParValue := strTemp;
	end;

	if AnsiUpperCase(ParName) = 'TOVAR' then begin
		ParValue := cdsSklost.FieldByName('tovar').asString;
	end;
  
	if AnsiUpperCase(ParName) = 'KOLTOTAL' then begin
		if RadioGroup1.ItemIndex<>2 then begin
			ParValue := cdsSklost.FieldByName('koltotal').asFloat;
		end else begin //если отчёт на дату
      if (cdsSklost.FieldByName('tara').asInteger=1) then begin
        //тара
        ParValue := cdsSklostt2.FieldByName('koltara2').AsVariant;
      end else begin
        //кабель
   			ParValue := cdsSklostt2.FieldByName('koltotal2').AsVariant;
      end;
		end; //radiogroup
	end;
except
	AssertInternal('618C6637-838D-49B0-8C55-61D586AAB2FF');
end;

end;

procedure TfrmSklost.actPrintExecute(Sender: TObject);
begin
try
	cdsSklostt.DisableControls;
	cdsSklostt2.DisableControls;
	dmdEx.GetReport('SkladOstatki.fr3',frSklost);
//	frSklost.PrepareReport;
	frSklost.ShowReport;
	cdsSklostt2.EnableControls;
	cdsSklostt.EnableControls;
except
  AssertInternal('0E5224CF-0F62-4A9B-9D1E-FD935E989CDC');
end;
end;

procedure TfrmSklost.frUserDataset1First(Sender: TObject);
var
	kol_zero : boolean;
begin
	cdsSklost.First;
	//first record shouldn't be empty
	kol_zero := false;
	if RadioGroup1.ItemIndex<>2 then begin
		if cdsSklost.FieldByName('koltotal').asFloat<=0 then begin
			kol_zero := true;
		end;
	end else begin //если отчёт на дату
		if (cdsSklostt2.FieldByName('koltotal2').asVariant<=0) and
      (cdsSklostt2.FieldByName('koltara2').asVariant<=0)
    then begin
			kol_zero := true;
		end;
	end; //radiogroup
	if kol_zero then begin
    if not frUserDataset1.Eof then begin
  		frUserDataset1.Next;
    end;
	end;
end;

procedure TfrmSklost.frUserDataset1Next(Sender: TObject);
var
	kol_zero :boolean; //shows that current position has zero kolotp
begin
	kol_zero := true; //first time the next operation is mandatory
	while (kol_zero) do begin
    if not cdsSklost.eof then begin
  		cdsSklost.Next;
    end else begin
      exit;
    end ;
		kol_zero := false;
		if RadioGroup1.ItemIndex<>2 then begin
			if cdsSklost.FieldByName('koltotal').asFloat<=0 then begin
				kol_zero := true;
			end;
		end else begin //если отчёт на дату
			if (cdsSklostt2.FieldByName('koltotal2').asVariant<=0) and
        (cdsSklostt2.FieldByName('koltara2').asVariant<=0)
      then begin
				kol_zero := true;
			end;
		end; //radiogroup
	end; //while
end;

procedure TfrmSklost.frUserDataset1Prior(Sender: TObject);
begin
  cdsSklost.Prior;
end;

procedure TfrmSklost.frUserDataset1CheckEOF(Sender: TObject;
  var Eof: Boolean);
begin
	Eof := false;
	if cdsSklost.Eof then begin
    Eof := true;
	end;
end;

procedure TfrmSklost.dbgSklosttDblClick(Sender: TObject);
begin
  actDetail.Execute;
end;

procedure TfrmSklost.actPriceCalcExecute(Sender: TObject);
var
  frmPriceCalc : TfrmPriceCalc;
  dPrice :double;
  id_currency : integer;
begin
  dPrice:=0;
  GetPrice(dmdEx.cdsTemp,1,
    dsSklost.DataSet.FieldByName('id_tovar').asinteger,Now,false,
    id_currency,dPrice);

  frmPriceCalc :=  TfrmPriceCalc.Create(Application);

  frmPriceCalc.ShowPriceCalc(
    cdsSklost.FieldByName('tara').AsInteger,
    dPrice);
  frmPriceCalc.ShowModal;
  frmPriceCalc.Free;
end;

procedure TfrmSklost.dbgSklostDblClick(Sender: TObject);
begin
  actPriceCalc.Execute;  
end;

procedure TfrmSklost.cdsSklostt3CalcFields(DataSet: TDataSet);
begin
try
  DataSet.FieldByName('koltotal').AsFloat:=
     (DataSet.FieldByName('kolotp').AsFloat*
     DataSet.FieldByName('kolbuxt').AsInteger)
     +
     (DataSet.FieldByName('kolrezerv').AsFloat*
     DataSet.FieldByName('kolbrezerv').AsInteger);
except
  AssertInternal('CD9C2400-86D0-4077-9A75-564FCE9BBA42');
end;
end;

procedure TfrmSklost.dteToday2Change(Sender: TObject);
begin
//  actRefresh.Execute;
end;

procedure TfrmSklost.cdsSklostt2CalcFields(DataSet: TDataSet);
begin
try
  if DataSet.State = dsInternalCalc then begin
    DataSet.FieldByName('koltotal').AsFloat:=
       (DataSet.FieldByName('kolotp').AsFloat*
       DataSet.FieldByName('kolbuxt').AsInteger)
       +
       (DataSet.FieldByName('kolrezerv').AsFloat*
       DataSet.FieldByName('kolbrezerv').AsInteger);
    if (DataSet.FieldByName('kolbuxt').AsInteger <> 1)
      or (DataSet.FieldByName('kolbrezerv').AsInteger <> 1)
    then begin
      DataSet.FieldByName('koltara').AsFloat:=
         (DataSet.FieldByName('kolbuxt').AsInteger
         +
         DataSet.FieldByName('kolbrezerv').AsInteger);
    end else begin
      //special case
      DataSet.FieldByName('koltara').AsFloat := 1;
    end
  end;//if dsInternalCalc
except
  AssertInternal('A839F208-2668-4AE4-9BD1-B6F450A6E3DC');
end;
end;

procedure TfrmSklost.ShowDetail(mode_in: integer; id_sklad_in, id_tovar_in,
  dat_to: variant;id_analog_in:variant);
var
  sTemp :string;
  vTemp : variant;
begin
  RadioGroup1.ItemIndex := mode_in;
  vTemp :=   VarAsType(id_sklad_in,varInteger);
  lcbSklad.KeyValue :=vTemp;
  if id_analog_in <> NULL then begin
    sTemp := 't2.id_analog='+inttostr(vartoint(id_analog_in));
    qeSklost.SetSQL('where',sTemp,3);
  end else begin
    qeSklost.SetSQL('where','',3);
  end;
  if id_tovar_in <> NULL then begin
    sTemp := 's.id_tovar='+inttostr(vartoint(id_tovar_in));
    qeSklost.SetSQL('where',sTemp,2);
  end else begin
    qeSklost.SetSQL('where','',2);
  end;
  if mode_in=2 then begin
    dteToday.Value := dat_to;
  end;
  actRefresh.Execute;
end;

procedure TfrmSklost.actPrintDetExecute(Sender: TObject);
begin
try
	cdsSklostt.DisableControls;
	cdsSklostt2.DisableControls;
  if RadioGroup1.ItemIndex=0 then begin
    frdSklostt.DataSource := dsSklostt;
  end;
  if RadioGroup1.ItemIndex=1 then begin
    frdSklostt.DataSource := dsSklostt3;
  end;
  if RadioGroup1.ItemIndex=2 then begin
    frdSklostt.DataSource :=dsSklostt2;
  end;
  //чтобы нижняя таблица не фильтровалась
  //frdSklostt.DataSource.DataSet.Filtered := false;
	dmdEx.GetReport('SkladOstatkiDet.fr3',frSklostDet);
	frSklostDet.ShowReport;
	cdsSklostt2.EnableControls;
	cdsSklostt.EnableControls;
except
  AssertInternal('C56B1A12-BA9A-44B6-A71A-B94EC99C9E6A');
end;
end;

procedure TfrmSklost.actDesignDetExecute(Sender: TObject);
begin
	dmdEx.GetReport('SkladOstatkiDet.fr3',frSklostDet);
  frSklostDet.DesignReport;
end;

procedure TfrmSklost.actShowSpecOstExecute(Sender: TObject);
var
  SpecOstAll :TfrmSpecOstAll;
  bQueryOpened : boolean;
begin
  SpecOstAll := TfrmSpecOstAll.Create(Application);
  SpecOstAll.actManagerMode.Execute;
  SpecOstAll.sett.GetPlugin('fmSettingsTovar').SetKeyValue(
    dsSklost.DataSet.fieldByName('id_analog').asInteger
  );
  bQueryOpened :=SpecOstAll.DefaultOpen;
  if not bQueryOpened then begin
    AssertInternal('1682D9DF-E11F-4865-84FE-F334A3FDC39E');
  end;
end;


procedure TfrmSklost.ProcessColumns;
begin
try
	if RadioGroup1.ItemIndex<>2 then begin
    dteToday.Visible := false;
    dbgSklost.Columns[2].Visible := true;
    dbgSklost.Columns[3].Visible := true;
    dbgSklost.Columns[4].Visible := true;
    dbgSklost.Columns[5].Visible := true;
    ColumnByName(dbgSklostt.Columns,'DAT_POST').Visible := false;
    ColumnByName(dbgSklostt.Columns,'KOLOTP_ISX').Visible := false;
    dbgSklostt.SumList.Active := false;
    dbgSklostt.FooterRowCount := 0;

    if RadioGroup1.ItemIndex=0 then begin
      dbgSklostt.DataSource := dsSklostt;
      cdsSklostt3.Close;
    end;
    if RadioGroup1.ItemIndex=1 then begin
      dbgSklostt.DataSource := dsSklostt3;
      cdsSklostt.Close;
    end;
    cdsSklostt2.Close;
    { DONE : Нули в пустых позициях скрыть }

    

	end else begin //if RadioGroup1.ItemIndex<>2
    dteToday.Visible := true;
    dbgSklost.Columns[3].Visible := false;
    dbgSklost.Columns[4].Visible := false;
    dbgSklost.Columns[5].Visible := false;
    //dbgSklostt.Columns.Add.FieldName:='DAT_POST';
    ColumnByName(dbgSklostt.Columns,'DAT_POST').Visible := true;
    ColumnByName(dbgSklostt.Columns,'KOLOTP_ISX').Visible := true;
    //dbgSklost.Columns[6].Visible := false;
    dbgSklostt.SumList.Active := false;
    dbgSklostt.DataSource := dsSklostt2;
    cdsSklostt.Close;

    { DONE : Нули в пустых позициях скрыть }
    //qeSklost.Refresh;
    dbgSklostt.SumList.Active := true;
    dbgSklostt.FooterRowCount:=1;
	end; //if RadioGroup1.ItemIndex<>2
except
  AssertInternal('CBA5579A-9344-45DD-9177-CB43AF2D3CC1');
end;//try
end;

end.
