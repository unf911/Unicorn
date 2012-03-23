unit untNaklptEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ActnList, DB, DBLookupEh, DBCtrlsEh, Mask,
  DBTables, Grids, DBGridEh, ExtCtrls, DBCtrls, untEx, FMTBcd,
  DBClient, Provider, SqlExpr, Buttons,
  DBSumLst, ATSAssert, untRound, untOtrez, ComCtrls, //Spin,
  SkladAux, GridsEh, Menus  //minustara,plustara
  ;

type
  TfrmNaklptEdit = class(TForm)
    GroupBox1: TGroupBox;
    lblTovar: TLabel;
    Label4: TLabel;
    dbeIDNAKL: TDBEditEh;
    dsNaklptEdit: TDataSource;
    ActionList1: TActionList;
    actOk: TAction;
    Label6: TLabel;
    dbeIdPos: TDBEditEh;
    dsNaklpdet: TDataSource;
    dlcTovar: TDBLookupComboboxEh;
    sdsNaklpdet: TSQLDataSet;
    dspNaklpdet: TDataSetProvider;
    cdsNaklpdet: TClientDataSet;
    btnOk: TBitBtn;
    actApply: TAction;
    cdsNaklpdetID_DET: TIntegerField;
    cdsNaklpdetNOMER_TARY: TStringField;
    cdsNaklpdetID_TARA: TIntegerField;
    cdsNaklpdetKOLOTP: TFMTBCDField;
    cdsNaklpdetCOMMENT: TStringField;
    cdsNaklpdetKOLBUXT: TIntegerField;
    cdsNaklpdetTARA: TStringField;
    dbnKolotp: TDBNumberEditEh;
    actKolotpCount: TAction;
    cdsNaklpdetkolsum: TFloatField;
    DBSumList1: TDBSumList;
    Label2: TLabel;
    Label3: TLabel;
    cdsNaklpdetID_NAKLD: TIntegerField;
    cdsNaklpdetTIP: TSmallintField;
    lblTara: TLabel;
    dlcTara: TDBLookupComboboxEh;
    actCancel2: TAction;
    btnCancel: TBitBtn;
    sdsNaklpdetID_DET: TIntegerField;
    sdsNaklpdetNOMER_TARY: TStringField;
    sdsNaklpdetID_TARA: TIntegerField;
    sdsNaklpdetKOLOTP: TFMTBCDField;
    sdsNaklpdetCOMMENT: TStringField;
    sdsNaklpdetKOLBUXT: TIntegerField;
    sdsNaklpdetID_NAKLD: TIntegerField;
    sdsNaklpdetTIP: TSmallintField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    dbgNaklpdet: TDBGridEh;
    DBGridEh1: TDBGridEh;
    btnAdd: TBitBtn;
    btnRemove: TBitBtn;
    DBGridEh2: TDBGridEh;
    sdsTara: TSQLDataSet;
    sdsTaraID_OSTT: TIntegerField;
    sdsTaraID_TARA: TIntegerField;
    sdsTaraNOMER_TARY: TStringField;
    sdsTaraKOLOTP: TFMTBCDField;
    dspTara: TDataSetProvider;
    cdsTara: TClientDataSet;
    cdsTaraID_OSTT: TIntegerField;
    cdsTaraID_TARA: TIntegerField;
    cdsTaraNOMER_TARY: TStringField;
    cdsTaraKOLOTP: TFMTBCDField;
    cdsTaraTARA: TStringField;
    dsTara: TDataSource;
    actFilterTara: TAction;
    sdsNaklpdetID_OSTT: TIntegerField;
    cdsNaklpdetID_OSTT: TIntegerField;
    sdsTaraCOMMENT: TStringField;
    cdsTaraCOMMENT: TStringField;
    actDublicate: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    sdsTaraKOLBUXT: TIntegerField;
    cdsTaraKOLBUXT: TIntegerField;
    procedure actOkExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
    procedure cdsNaklpdetAfterInsert(DataSet: TDataSet);
    procedure actKolotpCountExecute(Sender: TObject);
    procedure cdsNaklpdetCalcFields(DataSet: TDataSet);
    procedure cdsNaklpdetBeforePost(DataSet: TDataSet);
    procedure dbgNaklpdetColEnter(Sender: TObject);
    procedure rgTipTovaraClick(Sender: TObject);
    procedure actCancel2Execute(Sender: TObject);
    procedure cdsNaklpdetBeforeScroll(DataSet: TDataSet);
    procedure cdsNaklpdetBeforeInsert(DataSet: TDataSet);
    procedure DBSumList1SumListChanged(Sender: TObject);
    procedure cdsNaklpdetBeforeEdit(DataSet: TDataSet);
    procedure cdsNaklpdetBeforeDelete(DataSet: TDataSet);
    procedure cdsNaklpdetAfterDelete(DataSet: TDataSet);
    procedure cdsNaklpdetReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure dbgNaklpdetKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure actFilterTaraExecute(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure cdsNaklpdetAfterPost(DataSet: TDataSet);
    procedure dbgNaklpdetExit(Sender: TObject);
    procedure actDublicateExecute(Sender: TObject);
    procedure dlcTovarChange(Sender: TObject);


  private
    { Private declarations }
    //подготовка формы к редактированию тары или кабеля. не исп
    FCanChangeKolotp : boolean;
    procedure PrepareCommon;
  public
    { Public declarations }
    FTip : integer;
    procedure PrepareForIzlishek;
    procedure PrepareForPrixod;
  end;

var
  frmNaklptEdit: TfrmNaklptEdit;

implementation

{$R *.dfm}

procedure TfrmNaklptEdit.actOkExecute(Sender: TObject);
begin
  actApply.Execute;
  if (actApply.Checked) then begin
    ModalResult := mrOk;
  end;
end;

procedure TfrmNaklptEdit.FormCreate(Sender: TObject);
begin
try
  dmdEx.OpenQuery(dmdEx.cdsTovar);
  dmdEx.OpenQuery(dmdEx.cdsTara);
except
  AssertInternal('A98AD5A3-3899-4A4F-864A-E733551E7346');
end;
end;

procedure TfrmNaklptEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmdEx.CloseQuery(dmdEx.cdsTovar,false);
  dmdEx.CloseQuery(dmdEx.cdsTara,false);
end;

procedure TfrmNaklptEdit.FormShow(Sender: TObject);
begin
try
  dmdEx.startwaiting;
  if cdsNaklpdet.Active then cdsNaklpdet.CheckBrowseMode;
  cdsNaklpdet.close;
  cdsNaklpdet.Params.ParamByName('id_nakld').AsInteger :=
    dsNaklptEdit.DataSet.fieldbyname('id_nakld').AsInteger;
  cdsNaklpdet.open;
  //init
  dlcTovar.Enabled := true;
  dlcTovar.SetFocus;
  PageControl1.Enabled := true;
  //forbid changing tovar
  if (dsNaklptEdit.Dataset.State = dsEdit) then begin
    dlcTovar.Enabled := false;
  end;
  if (dlcTovar.Text = '') then begin
    PageControl1.Enabled := false;
  end;
 
  //recount and rewrite kolotp if needed
  if not dmdEx.IsTara(dsNaklptEdit.DataSet.FieldByName('id_tovar').asInteger) then begin
    FCanChangeKolotp := false;
    DBSumList1.Activate (true);
    FCanChangeKolotp := true;
    DBSumList1SumListChanged(self);
  end;
  dmdEx.stopwaiting;
except
  AssertInternal('90819C95-5A52-4609-B153-400AD810765E');
end;
end;

procedure TfrmNaklptEdit.FormHide(Sender: TObject);
begin
  DBSumList1.Deactivate(false);
  cdsNaklpdet.Close;
end;

procedure TfrmNaklptEdit.actApplyExecute(Sender: TObject);
begin
  actApply.Checked := false;
	if dsNaklptEdit.DataSet.FieldByName('tovar').IsNull then begin
		showmessage ('Заполните поле ''Товар''');
		dlcTovar.SetFocus;
		actApply.Checked := false;
		exit;
	end;
	if PostAndApply(dsNaklptEdit.DataSet)=0 then begin
    //recount sum of nakl
  	if PostAndApply(cdsNaklpdet)=0 then begin
  		actApply.Checked := true;
		end;
	end;
end;

procedure TfrmNaklptEdit.cdsNaklpdetAfterInsert(DataSet: TDataSet);
var
  intGen : integer;
  begin
  intGen := dmdEx.GetGenValue('NAKLoDET_GEN') ;
  cdsNaklpdet.FieldByName('id_det').AsInteger := intGen;
  cdsNaklpdet.FieldByName('id_nakld').AsInteger :=
    dsNaklptEdit.DataSet.FieldByName('id_nakld').AsInteger;
  cdsNaklpdet.FieldByName('kolotp').AsFloat :=0;
  cdsNaklpdet.FieldByName('kolbuxt').AsFloat :=1;
  cdsNaklpdet.FieldByName('tip').AsInteger := FTip;
end;

procedure TfrmNaklptEdit.actKolotpCountExecute(Sender: TObject);
var
  curPos , curSum : currency;
begin
  cdsNaklpdet.First;
  curSum := 0 ;
  while (not cdsNaklpdet.eof) do begin
//  cdsNaklp
    curPos := cdsNaklpdet.FieldByName('kolotp').asFloat*
      cdsNaklpdet.FieldByName('kolbuxt').asinteger;
    curSum := curSum + curPos;
    cdsNaklpdet.Next;
  end;
  if dsNaklptEdit.DataSet.state = dsBrowse then begin
    dsNaklptEdit.DataSet.edit;
  end; //if
  dsNaklptEdit.DataSet.FieldByName('kolotp').asFloat := curSum;
end;

procedure TfrmNaklptEdit.cdsNaklpdetCalcFields(DataSet: TDataSet);
begin
  cdsNaklpdet.FieldByName('kolsum').asCurrency :=
    cdsNaklpdet.FieldByName('kolotp').asFloat*
    cdsNaklpdet.FieldByName('kolbuxt').asinteger;
end;


procedure TfrmNaklptEdit.cdsNaklpdetBeforePost(DataSet: TDataSet);
begin
  if ( cdsNaklpdet.FieldByName('id_tara').IsNull) then begin
    showmessage ('Выберите тип тары');
    dbgNaklpdet.SelectedField := cdsNaklpdet.FieldByName('tara');
    abort;
  end;
end;



procedure TfrmNaklptEdit.dbgNaklpdetColEnter(Sender: TObject);
begin
  if (dbgNaklpdet.SelectedField.FieldName = 'COMMENT') then begin
    dbgNaklpdet.Hint := dbgNaklpdet.SelectedField.AsString;
    dbgNaklpdet.ShowHint := true;
  end else begin
    dbgNaklpdet.ShowHint := false;
  end;
end;

procedure TfrmNaklptEdit.rgTipTovaraClick(Sender: TObject);
begin
try
    dbgNaklpdet.Enabled := true;
    dbnKolotp.Enabled := false;
    dbnKolotp.Increment := 0.001;
    dlcTara.Hide;

    lblTovar.Show;
    dlcTovar.Show;
except
  AssertInternal('60174E1D-ABE3-4C0E-8741-7061EBB8FBC1');
end;
end;


procedure TfrmNaklptEdit.actCancel2Execute(Sender: TObject);
begin
		CancelUpdates(dsNaklpdet.Dataset);
		CancelUpdates(dsNaklptEdit.DataSet);
		ModalResult := mrCancel;
end;

procedure TfrmNaklptEdit.cdsNaklpdetBeforeScroll(DataSet: TDataSet);
begin
	ApplyOrCancel(DataSet);
end;


procedure TfrmNaklptEdit.cdsNaklpdetBeforeInsert(DataSet: TDataSet);
begin
	if PostAndApply(dsNaklptEdit.Dataset)<>0 then begin
    abort;
	end;
end;

procedure TfrmNaklptEdit.DBSumList1SumListChanged(Sender: TObject);
begin
try
  if ((dsNaklptEdit.dataset.fieldbyname('kolotp').asFloat <>
      DBSumList1.SumCollection.Items[0].SumValue) and FCanChangeKolotp)
  then begin
		if (dsNaklptEdit.dataset.state = dsBrowse) then begin
			dsNaklptEdit.dataset.edit;
		end;
		dsNaklptEdit.dataset.fieldbyname('kolotp').asFloat :=
			DBSumList1.SumCollection.Items[0].SumValue;
	end;
except
	AssertInternal('{8BA532D4-FD95-4B99-9626-C4F22656F77E}');
end;
end;

procedure TfrmNaklptEdit.cdsNaklpdetBeforeEdit(DataSet: TDataSet);
begin
	if PostAndApply(dsNaklptEdit.Dataset)<>0 then begin
		abort;
	end;
 { DONE : minus tara add }
  MinusTara(DataSet,dsNaklptEdit.DataSet);
end;

procedure TfrmNaklptEdit.cdsNaklpdetBeforeDelete(DataSet: TDataSet);
begin
	if PostAndApply(dsNaklptEdit.Dataset)<>0 then begin
		abort;
	end;
end;

procedure TfrmNaklptEdit.cdsNaklpdetAfterDelete(DataSet: TDataSet);
begin
	ApplyOrCancel(DataSet);
  MinusTara(DataSet,dsNaklptEdit.DataSet);
end;

procedure TfrmNaklptEdit.cdsNaklpdetReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
	showmessage(e.Message);
	Action := raAbort;
end;

procedure TfrmNaklptEdit.dbgNaklpdetKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_f8 : begin
      if not (cdsNaklpdet.bof and cdsNaklpdet.eof) then begin
        if (MessageDlg('Вы хотите удалить запись?',
          mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
          cdsNaklpdet.Delete;
        end;
      end;  //ok
    end;  //f8
  end;
end;



procedure TfrmNaklptEdit.btnRemoveClick(Sender: TObject);
begin
  cdsNaklpdet.Delete;
end;

procedure TfrmNaklptEdit.btnAddClick(Sender: TObject);
var
  iRes :integer;
  frmOtrez : TfrmOtrez;
  dLength : double;
  iBuxt : integer;
begin
try
  if  cdsTara.FieldByName('kolbuxt').asInteger>1 then begin
    Showmessage('Запрещено наматывать излишек если бухт>1');
    exit;
  end;
  frmOtrez := TfrmOtrez.Create(self);
  dLength := 0;
  iBuxt := 1;
  iRes := frmOtrez.ShowOtrez(dLength,iBuxt,1.6E308);
  if (iRes =  mrOk) then begin
    cdsNaklpdet.Insert;
    if (dmdEx.isTaraNothing(cdsTara.FieldByName('id_tara').AsInteger)) then begin
      cdsNaklpdet.FieldByName('id_tara').asInteger :=
        cdsTara.FieldByName('id_tara').AsInteger;
    end else begin
      cdsNaklpdet.FieldByName('id_tara').asInteger :=
        //Если поставить барабан, то после проведения на складе появится новый барабан
        //Если поставить по умолчанию не бухту, а мешок, то неясно для каких товаров
        //излишек появляется в мешке. Поэтому возвращаемся к тому, с чего начали.
        //При излишке по умолчанию ставиться бухта
        dmdEx.GetBuxtNumber;
    end;
    cdsNaklpdet.FieldByName('nomer_tary').AsString :=
      cdsTara.FieldByName('nomer_tary').asString;
    cdsNaklpdet.FieldByName('comment').AsString :=
      cdsTara.FieldByName('comment').asString;
    cdsNaklpdet.FieldByName('id_ostt').asInteger :=
      cdsTara.FieldByName('id_ostt').asInteger;
    cdsNaklpdet.FieldByName('kolotp').AsFloat:= dLength;
    cdsNaklpdet.Post;
  end;
  frmOtrez.Free;
  dlcTovar.Enabled:=false;
except
  AssertInternal('1F218DE1-319D-49B9-AE58-D1CAB4764407');
end;
end;

procedure TfrmNaklptEdit.TabSheet2Show(Sender: TObject);
begin
  actFilterTara.Execute;
  FTip := 5;
end;


procedure TfrmNaklptEdit.actFilterTaraExecute(Sender: TObject);
var
  iTovar,iSklad : integer;
begin
try
  if (VarType(dlcTovar.KeyValue) and varTypeMask = varInteger) then begin
    iTovar := integer(dlcTovar.KeyValue);
    iSklad := TClientDataSet(dsNaklptEdit.DataSet).MasterSource.DataSet.FieldByName('id_sklad').asInteger;
    cdsTara.Close;
    cdsTara.Params.ParamByName('id_tovar').asInteger := iTovar;
    cdsTara.Params.ParamByName('id_sklad').asInteger := iSklad;
    cdsTara.Open;
  end;
except
  AssertInternal ('42A61C04-0817-45C7-ADE9-5907732A3B2E');
end;
end;

procedure TfrmNaklptEdit.PrepareForIzlishek;
begin
  PrepareCommon;
  TabSheet2.TabVisible := true;
  FTip := 5;
end;

procedure TfrmNaklptEdit.PrepareForPrixod;
begin
  FTip := 1;
  PrepareCommon;
end;



procedure TfrmNaklptEdit.PrepareCommon;
begin
  TabSheet2.TabVisible := false;
end;

procedure TfrmNaklptEdit.TabSheet1Show(Sender: TObject);
begin
  FTip := 1;
end;

procedure TfrmNaklptEdit.cdsNaklpdetAfterPost(DataSet: TDataSet);
begin
  PlusTara(DataSet,dsNaklptEdit.DataSet);
end;

procedure TfrmNaklptEdit.dbgNaklpdetExit(Sender: TObject);
begin
  ApplyOrCancel(dbgNaklpdet.DataSource.dataset);  
end;

procedure TfrmNaklptEdit.actDublicateExecute(Sender: TObject);
//begin
  //сколько раз
 // dmdEx.ColumnNumberInput

var
  dValue : double;
  sStrings: TStringList;
  sFieldList,sFieldName, sFieldListFrom, sFieldListTo :string;
  dataSet : TDataSet;
  i : integer;
begin
  if not dmdex.ColumnNumberInput(
    'Введите количество дубликатов',
    'Количество',
    dValue)
  then begin
    exit;
  end;
  DataSet := dsNaklpdet.DataSet;
  //запомнить запись
  sFieldList := 'ID_TARA;NOMER_TARY;KOLOTP;KOLBUXT;COMMENT';
  sFieldListFrom := sFieldList;
  sFieldListTo := sFieldList;
  sStrings:= TStringList.Create;
  //ItemFromList
  while ItemFromList(sFieldListFrom,sFieldName,';') do begin
    sStrings.Add(sFieldName+'='+DataSet.FIELDByName(sFieldName).AsString);
  end;
  //цикл записи
  for i:=0 to Round(dValue)-1 do begin
    DataSet.Insert;
    while ItemFromList(sFieldListTo,sFieldName,';') do begin
      DataSet.FieldByName(sFieldName).AsString := sStrings.Values[sFieldName];
      //sStrings.Add(sFieldName+'='+DataSet.FIELDByName(sFieldName).AsString);
    end;
    DataSet.Post;
    sFieldListTo :=sFieldList;
  end; //for i:=0 to int(dValue) do begin

end;

procedure TfrmNaklptEdit.dlcTovarChange(Sender: TObject);
begin
  if (PageControl1.ActivePageIndex=TabSheet2.PageIndex) then begin
    actFilterTara.Execute;
  end;
  //after user insert and select tovar allow to select detail
  if ((dlcTovar.Text <> '') and (not PageControl1.Enabled)) then begin
    PageControl1.Enabled := true;
  end;
end;

end.
