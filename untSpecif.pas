unit untSpecif;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms,
  Dialogs, untEx, FMTBcd, DB, DBClient, Provider,
  SqlExpr, StdCtrls,
  DBCtrls, DBCtrlsEh, Mask, atsassert,
  ActnList, Buttons, untRound,
  ComCtrls, SqlTimSt,    frxClass, frxDBSet,
    Grids, DBGrids, Menus;

type
  TfrmSpecif = class(TForm)
    sdsSpecif: TSQLDataSet;
    dspSpecif: TDataSetProvider;
    cdsSpecif: TClientDataSet;
    dsSpecif: TDataSource;
    cdsSpecifID_NAKL: TIntegerField;
    cdsSpecifSPEC_NUM: TIntegerField;
    cdsSpecifDOG_NUM: TStringField;
    cdsSpecifDOG_DATE: TSQLTimeStampField;
    cdsSpecifIZG_DIRECTOR: TStringField;
    cdsSpecifIZG_OSNOV: TStringField;
    cdsSpecifZAK: TStringField;
    cdsSpecifZAK_DIRECTOR: TStringField;
    cdsSpecifZAK_OSNOV: TStringField;
    cdsSpecifSROK_POSTAVKI: TStringField;
    cdsSpecifOSOBYE_USLOVIYA: TStringField;
    dbnSpecNum: TDBNumberEditEh;
    dbeDogNum: TDBEdit;
    dbeIzgDirector: TDBEdit;
    dbeZak: TDBEdit;
    dbcIzgOsnov: TDBComboBox;
    dbeZakDirector: TDBEdit;
    dbmOsobyeUsloviya: TDBMemo;
    btnCancel: TBitBtn;
    btnApply: TBitBtn;
    ActionList1: TActionList;
    actApply: TAction;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    dbcZakOsnov: TDBComboBox;
    Label9: TLabel;
    Label10: TLabel;
    actPreview: TAction;
    frdNaklrt: TfrxDBDataset;
    frdNaklr: TfrxDBDataset;
    BitBtn2: TBitBtn;
    btnOk: TBitBtn;
    dteDat2: TDBDateTimeEditEh;
    dteSpecDate: TDBDateTimeEditEh;
    Label11: TLabel;
    cdsSpecifSPEC_DATE: TSQLTimeStampField;
    dbmSrokPostavki: TDBEditEh;
    sdsSpecifID_NAKL: TIntegerField;
    sdsSpecifSPEC_NUM: TIntegerField;
    sdsSpecifSPEC_DATE: TSQLTimeStampField;
    sdsSpecifDOG_NUM: TStringField;
    sdsSpecifDOG_DATE: TSQLTimeStampField;
    sdsSpecifIZG_DIRECTOR: TStringField;
    sdsSpecifIZG_OSNOV: TStringField;
    sdsSpecifZAK: TStringField;
    sdsSpecifZAK_DIRECTOR: TStringField;
    sdsSpecifZAK_OSNOV: TStringField;
    sdsSpecifSROK_POSTAVKI: TStringField;
    sdsSpecifOSOBYE_USLOVIYA: TStringField;
    dsNaklr: TDataSource;
    dsNaklrt: TDataSource;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N6: TMenuItem;
    BitBtn1: TBitBtn;
    frdSpecif: TfrxDBDataset;
    frSpecif: TfrxReport;
    procedure FormShow(Sender: TObject);
    procedure cdsSpecifAfterInsert(DataSet: TDataSet);
    procedure actApplyExecute(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure actPreviewExecute(Sender: TObject);
    procedure frSpecifGetValue(const ParName: String;
      var ParValue: Variant);
    procedure cdsSpecifReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    //dsNaklr, dsNaklrt : TDataSource;
    sZakDirector, sIzgDirector: string;
    procedure BeforeReport;
    procedure AfterReport;
  public
    { Public declarations }
    function ShowSpecif(id_nakl: integer;
      dsNaklr2:TDataSource;dsNaklrt2:TDataSource): integer;
  end;

var
  frmSpecif: TfrmSpecif;

implementation

{$R *.dfm}

uses
  DesignReport //ProcessReportDesigner
  ;

{ TfrmSpecif }

function TfrmSpecif.ShowSpecif(id_nakl: integer;
  dsNaklr2:TDataSource;dsNaklrt2:TDataSource): integer;
begin
	Result:=0;
try
  dsNaklr.DataSet := dsNaklr2.DataSet;
  dsNaklrt.DataSet := dsNaklrt2.DataSet;

  //frdNaklrt.DataSource := dsNaklrt;
  //frdNaklr.DataSource := dsNaklr;

  Result:=self.ShowModal;
except
  AssertInternal('E61364F0-5AC7-401A-AFD4-F927C41E435E');
end;
end;

procedure TfrmSpecif.FormShow(Sender: TObject);
var
  iNakl : integer;
begin
try
	dmdEx.StartWaiting;
	iNakl :=  dsNaklr.DataSet.fieldByName('id_nakl').asInteger;
	//возможно неверные позиции были из-за того, что пред спецификация
	//совершала ошибку, окно было закрыто, а набор данных там и оставался
	cdsSpecif.Close;
	cdsSpecif.Params.ParamByName('id_nakl').asInteger:= iNakl;
	cdsSpecif.Open;
	if (cdsSpecif.FieldByName('id_nakl').IsNull) then begin
		cdsSpecif.Insert;
	end else begin
		cdsSpecif.Edit;
	end;
	MonthToStrInit;
	dmdEx.StopWaiting;
except
  AssertInternal('54900023-8965-4A48-A528-04E4F7A22BD2');
end;
end;

procedure TfrmSpecif.cdsSpecifAfterInsert(DataSet: TDataSet);
var
//  strZak : string;
  varIzgDir,varZakDir, varZak : variant;
begin
try
  cdsSpecif.FieldByName('id_nakl').asInteger :=
    dsNaklr.DataSet.fieldbyname('id_nakl').asInteger;
	dmdEx.cdsAllClient.Open;

	varZak := dmdEx.cdsAllClient.Lookup(
		'id',
    dsNaklr.DataSet.FieldByName('id_zak').AsInteger,
    'fullname'
  );
  //get director names for izg and zak
	dmdEx.cdsTemp.Close;
	dmdEx.cdsTemp.CommandText := 'select k.id,k.fio from klient k '
    +'where k.id in ( '
		+inttostr(dsNaklr.DataSet.fieldbyname('id_izg').AsInteger)
    +' , '
		+inttostr(dsNaklr.DataSet.fieldbyname('id_zak').asInteger)
    +' )';
  dmdEx.cdsTemp.Open;
except
  AssertInternal('979014C1-C5C9-408E-8D13-231C5A203C6E');
end;
try
  //get director name for izg
  varIzgDir :=
    dmdEx.cdsTemp.Lookup(
    'id',
    dsNaklr.DataSet.fieldbyname('id_izg').AsInteger,
    'fio'
	);

	cdsSpecif.FieldByName('izg_director').AsString:=VarToStr(varIzgDir);

  //get director name for zak
	varZakDir:=
    dmdEx.cdsTemp.Lookup(
    'id',
    dsNaklr.DataSet.fieldbyname('id_zak').AsInteger,
		'fio'
  );

  cdsSpecif.FieldByName('zak_director').AsString:=VarToStr(varZakDir);
  dmdEx.cdsTemp.Close;
except
  AssertInternal('C95DB971-63F1-4360-AD20-B3B4878E9FBC');
end;
try
  cdsSpecif.FieldByName('zak').AsString:=VarToStr(varZak);
  cdsSpecif.FieldByName('srok_postavki').AsString:='';
  cdsSpecif.FieldByName('osobye_usloviya').AsString:='';
  cdsSpecif.FieldByName('spec_num').AsInteger := 1;
  cdsSpecif.FieldByName('spec_date').AsDateTime:=
    dsNaklr.DataSet.fieldbyname('dat').AsDateTime;

except
  AssertInternal('056D5D61-12C4-4886-B5F3-2426F778BEC1');
end;
end;

procedure TfrmSpecif.actApplyExecute(Sender: TObject);
begin
try
  actApply.Checked:=false;
  //multiple checks for user input
  if (cdsSpecif.FieldByName('spec_num').IsNull) then begin
    dbnSpecNum.SetFocus;
    showmessage ('Введите номер спецификации');
    Exit;
  end;
  if (cdsSpecif.FieldByName('dog_num').IsNull)then begin
    dbeDogNum.SetFocus;
    showmessage ('Введите номер договора');
    Exit;
  end;
  if (cdsSpecif.FieldByName('dog_date').IsNull) then begin
    dteDat2.SetFocus;
    showmessage ('Введите дату договора');
    Exit;
  end;
	if (cdsSpecif.FieldByName('izg_director').asString='') then begin
		dbeIzgDirector.SetFocus;
    showmessage ('Введите фамилию и инициалы лица со стороны продавца');
    Exit;
  end;
  if (cdsSpecif.FieldByName('izg_osnov').IsNull)then begin
    dbcIzgOsnov.SetFocus;
    showmessage ('Неизвестно основание действия продавца');
    Exit;
	end;
	if (cdsSpecif.FieldByName('zak').asString='') then begin
		dbeZak.SetFocus;
		showmessage ('Введите полное название фирмы покупателя');
		Exit;
	end;
	if (cdsSpecif.FieldByName('zak_director').asString='') then begin
    dbeZakDirector.SetFocus;
    showmessage ('Введите фамилию и инициалы лица со стороны покупателя');
    Exit;
  end;
  if (cdsSpecif.FieldByName('zak_osnov').IsNull)then begin
    dbcZakOsnov.SetFocus;
    showmessage ('Неизвестно основание действия покупателя');
    Exit;
	end;
	cdsSpecif.CheckBrowseMode;
	if (PostAndApply(cdsSpecif)=0) then begin
		actApply.Checked:=true;
	end;
except
	AssertInternal('1CF3F619-5650-4AC9-9E6B-B4476175B9A6');
end;
end;

procedure TfrmSpecif.btnOkClick(Sender: TObject);
begin
try
  actApply.Execute;
  if actApply.Checked then begin
    ModalResult := mrOk;
  end;
except
  AssertInternal('2780C5CA-7370-463D-A2D1-1E77E0A6F79A');
end;
end;

procedure TfrmSpecif.btnCancelClick(Sender: TObject);
begin
try
  CancelUpdates(cdsSpecif);
//  cdsSpecif.CancelUpdates;
  ModalResult := mrCancel;
except
  AssertInternal('118ED536-047C-4BA3-9C6D-F20CAB71E400');
end;
end;

procedure TfrmSpecif.BeforeReport;
begin
try
    dmdEx.sdsTemp.Fields.Clear;
    dmdEx.cdsTemp.Fields.Clear;
    dmdEx.cdsTemp.Close;
    dmdEx.cdsTemp.CommandText :=
      'select k.delmarked, k.id, k.fio, k.name, k.fullname from klient_all_vw k '
      +'where k.id in ( '
			+inttostr(dsNaklr.DataSet.fieldbyname('id_izg').asInteger)
			+' , '
			+inttostr(dsNaklr.DataSet.fieldbyname('id_zak').AsInteger)
			+' )';
    dmdEx.cdsTemp.Open;
except
	AssertInternal('E3039552-F269-46C5-B2CB-46D7DDD4E710');
end;
end;

procedure TfrmSpecif.AfterReport;
begin
  //dmdEx.cdsTemp.Close;
end;


procedure TfrmSpecif.actPreviewExecute(Sender: TObject);
begin
try
  actApply.Execute;
  if actApply.Checked then begin
    BeforeReport;
    dmdEx.GetReport('Specif.fr3',frSpecif);
    frSpecif.PrepareReport;
    frSpecif.ShowReport;
    AfterReport;
  end;
except
  AssertInternal('2D9A3D1E-630E-4DE2-BCBE-E0095F1E9D91');
end;
end;



procedure TfrmSpecif.frSpecifGetValue(const ParName: String;
  var ParValue: Variant);
var
  sTemp : string;
  varIzgDir,varZakDir : variant;
begin
try
  if AnsiUpperCase (ParName)='NALOG_NDS' then begin
    ParValue := dsNaklr.DataSet.FieldByName('NALOG_NDS').AsCurrency;
  end;
  if AnsiUpperCase (ParName)='NDS' then begin
    ParValue := dsNaklr.DataSet.FieldByName('NDS').AsCurrency;
  end;
  if AnsiUpperCase (ParName)='IZGNAME' then begin
    //имя заказчика
		varIzgDir:=
			dmdEx.cdsTemp.Lookup(
      'id',
      dsNaklr.DataSet.fieldbyname('id_izg').AsInteger,
      'fullname'
		 );
    ParValue := varIzgDir;
  end;
  if AnsiUpperCase (ParName)='ZAKNAME' then begin
    //имя заказчика
		varIzgDir:=
			dmdEx.cdsTemp.Lookup(
      'id',
      dsNaklr.DataSet.fieldbyname('id_zak').AsInteger,
      'fullname'
		 );
    ParValue := varIzgDir;
  end;
  if AnsiUpperCase (ParName)='SZAK' then begin
    //get director name for zak
		varZakDir:=
      dmdEx.cdsTemp.Lookup(
      'id',
      dsNaklr.DataSet.fieldbyname('id_zak').AsInteger,
      'fio'
     );
    sTemp :=varToStr(varZakDir);
    if (sTemp='') then begin
      sTemp:='                          ';
    end;
    //используется при печати
    sZakDirector:=cdsSpecif.FIeldByName('zak').AsString+chr(10)
      +'Директор'+chr(13)+chr(13)
      + sTemp
      +'   (_______________________)'+chr(10)+chr(13)+chr(10)+chr(13)
      +'                                М.П.';
    ParValue := sZakDirector;
  end;
  if AnsiUpperCase (ParName)='SIZG' then begin
    //get director name for zak
    varIzgDir:=
      dmdEx.cdsTemp.Lookup(
      'id',
      dsNaklr.DataSet.fieldbyname('id_izg').AsInteger,
      'fio'
     );
    sTemp :=varToStr(varIzgDir);
    if (sTemp='') then begin
      sTemp:='                           ';
    end; //dir name
    varIzgDir:=
      dmdEx.cdsTemp.Lookup(
      'id',
      dsNaklr.DataSet.fieldbyname('id_izg').AsInteger,
      'name'
     );//izg name

    //используется при печати
    sIzgDirector:=vartostr(varIzgDir)+chr(10)
      +'Директор'+chr(13)+chr(13)
      + sTemp
      +'   (_______________________)'+chr(10)+chr(13)+chr(10)+chr(13)
      +'                                М.П.';
    ParValue := sIzgDirector;
  end;
  if (AnsiUpperCase(ParName)='SUMA2GRN') then begin
    ParValue := Suma2Grn(dsNaklr.Dataset,dsNaklrt.Dataset);
  end;
  if (AnsiUpperCase(ParName)='VSEGO') then begin
    ParValue :=
      RRoundto(dsNaklr.Dataset.FieldByName('nds').asFloat/
      (1+dsNaklr.Dataset.FieldByName('nalog_nds').asFloat),-2);
  end;

except
	AssertInternal('86744313-C343-40E8-845A-9406F9A91D9C');
end;
end;

procedure TfrmSpecif.cdsSpecifReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
	var Action: TReconcileAction);
begin
	showmessage(e.message);
	Action := raCancel;
end;

procedure TfrmSpecif.FormCreate(Sender: TObject);
begin
  ProcessReportDesigner(ActionList1,MainMenu1,frSpecif);
end;

procedure TfrmSpecif.BitBtn1Click(Sender: TObject);
begin
  frSpecif.DesignReport;
end;

end.
