unit untNaklodet;

interface

uses
  Windows, Messages, SysUtils,
  Variants,
  Classes, Graphics, Controls, Forms,
  Dialogs, untEx, FMTBcd, DB, SqlExpr,
  DBClient, Provider, Grids, DBGridEh,
  DBCtrlsEh, StdCtrls,
  Mask, DBLookupEh, Buttons,
  ActnList,RecError,
  untOtrez,
  ATSAssert,
  untTara,
  untRound,
  untSklostDet, Menus,
	Registry, QueryExtender, PropStorageEh,
	UnfFilter, //TUnfFilter
  untNaklodetChangeBuxt,  //TfrmChangeBuxt
  SkladAux,  //minustara,plustara
  ExtCtrls, PropFilerEh, GridsEh
	;

type
  TfrmNaklodet = class(TForm)
    sdsSklostdet: TSQLDataSet;
    dspSklostdet: TDataSetProvider;
    cdsSklostdet: TClientDataSet;
    dbgSklostt: TDBGridEh;
    dsSklostdet: TDataSource;
    btnWhole: TBitBtn;
    btnCutPart: TBitBtn;
    dlcTovar: TDBLookupComboboxEh;
    dbgNaklodet: TDBGridEh;
    ActionList1: TActionList;
    dsNaklotEdit: TDataSource;
    actWhole: TAction;
    actCutPart: TAction;
    sdsNaklodet: TSQLDataSet;
    dspNaklodet: TDataSetProvider;
    cdsNaklodet: TClientDataSet;
    cdsNaklodetID_DET: TIntegerField;
    cdsNaklodetNOMER_TARY: TStringField;
    cdsNaklodetID_TARA: TIntegerField;
    cdsNaklodetKOLOTP: TFMTBCDField;
    cdsNaklodetCOMMENT: TStringField;
    cdsNaklodetKOLBUXT: TIntegerField;
    cdsNaklodetTARA: TStringField;
    cdsNaklodetkolsum: TFloatField;
    cdsNaklodetID_NAKLD: TIntegerField;
    dsNaklodet: TDataSource;
    btnOk: TBitBtn;
    actApply: TAction;
    actCancel: TAction;
    cdsSklostdetCOMMENT: TStringField;
    cdsSklostdetID_OSTT: TIntegerField;
    cdsSklostdetID_TARA: TIntegerField;
    cdsSklostdetKOLBREZERV: TIntegerField;
    cdsSklostdetKOLBUXT: TIntegerField;
    cdsSklostdetKOLOTP: TFMTBCDField;
    cdsSklostdetKOLREZERV: TFMTBCDField;
    cdsSklostdetNOMER_TARY: TStringField;
    cdsSklostdetTARA: TStringField;
    Label1: TLabel;
    dbnKolotp: TDBNumberEditEh;
    Label3: TLabel;
    dsSklostodetSrc: TDataSource;
    btnReturn: TBitBtn;
    actReturn: TAction;
    cdsNaklodetID_OSTT: TIntegerField;
    cdsNaklodetTIP: TSmallintField;
    actReCount: TAction;
    btnNamotka: TBitBtn;
    actNamotka: TAction;
    sdsProcess: TSQLDataSet;
    sdsRecalc: TSQLDataSet;
    sdsNaklodetInsertPc: TSQLDataSet;
    actDetail: TAction;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    actDetail1: TMenuItem;
    cdsSklostdetID_TYPE: TIntegerField;
    cdsSklostdetID_IZG: TIntegerField;
    cdsSklostdetIZG: TStringField;
    cdsSklostdetTIP2: TStringField;
    qeSklostdet: TQueryExtender;
    qeNaklodet: TQueryExtender;
    PropStorageEh1: TPropStorageEh;
    rpsNaklodet: TRegPropStorageManEh;
    sdsNaklodetCOMMENT: TStringField;
    sdsNaklodetID_DET: TIntegerField;
    sdsNaklodetID_NAKLD: TIntegerField;
    sdsNaklodetID_TARA: TIntegerField;
    sdsNaklodetKOLBUXT: TIntegerField;
    sdsNaklodetKOLOTP: TFMTBCDField;
    sdsNaklodetNOMER_TARY: TStringField;
    sdsNaklodetID_OSTT: TIntegerField;
    sdsNaklodetTIP: TSmallintField;
    sdsSklostdetCOMMENT: TStringField;
    sdsSklostdetID_OSTT: TIntegerField;
    sdsSklostdetID_TARA: TIntegerField;
    sdsSklostdetKOLBREZERV: TIntegerField;
    sdsSklostdetKOLBUXT: TIntegerField;
    sdsSklostdetKOLOTP: TFMTBCDField;
    sdsSklostdetKOLREZERV: TFMTBCDField;
    sdsSklostdetNOMER_TARY: TStringField;
    sdsSklostdetID_TYPE: TIntegerField;
    sdsSklostdetID_IZG: TIntegerField;
    UnfFilter1: TUnfFilter;
    PopupNaklodet: TPopupMenu;
    mnuChangeBuxt: TMenuItem;
    actChangeBuxt: TAction;
    UnfFilter2: TUnfFilter;
    sdsExchange: TSQLDataSet;
    popSklostt: TPopupMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    rgCena: TRadioGroup;
    dbnCena: TDBNumberEditEh;
    dbnCenaNds: TDBNumberEditEh;
    dbnSkidka: TDBNumberEditEh;
    BitBtn2: TBitBtn;
    dsNakloEdit: TDataSource;
    procedure actWholeExecute(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
		procedure FormCreate(Sender: TObject);
		procedure BitBtn4Click(Sender: TObject);
		procedure dlcTovarCloseUp(Sender: TObject; Accept: Boolean);
		procedure FormClose(Sender: TObject; var Action: TCloseAction);
		procedure actCancelExecute(Sender: TObject);
		procedure btnOkClick(Sender: TObject);
		procedure actCutPartExecute(Sender: TObject);
		procedure actReturnExecute(Sender: TObject);
		procedure cdsNaklodetReconcileError(DataSet: TCustomClientDataSet;
			E: EReconcileError; UpdateKind: TUpdateKind;
			var Action: TReconcileAction);
		procedure actReCountExecute(Sender: TObject);
		procedure FormShow(Sender: TObject);
		procedure actNamotkaExecute(Sender: TObject);
		procedure actDetailExecute(Sender: TObject);
		procedure cdsSklostdetAfterScroll(DataSet: TDataSet);
    procedure cdsSklostdetCalcFields(DataSet: TDataSet);
    procedure PopupNaklodetPopup(Sender: TObject);
    procedure actChangeBuxtExecute(Sender: TObject);
    procedure dbnCenaEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure dbnCenaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbnCenaNdsEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure dbnCenaNdsKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rgCenaClick(Sender: TObject);
    procedure dbnSkidkaEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure dbnSkidkaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dlcTovarChange(Sender: TObject);
    procedure dbnSkidkaExit(Sender: TObject);
    procedure dbnCenaExit(Sender: TObject);
    procedure dbnCenaNdsExit(Sender: TObject);
    procedure dbgNaklodetDblClick(Sender: TObject);
    procedure dlcTovarKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    iPosted : integer;
    //вставка записи в детализацию склада
    procedure BeforeOtrez;
		procedure AfterOtrez; //обновление двух решеток
		procedure Otrez; //вызов процедуры отрезания с обработкой ошибок
		procedure Whole(id_ostt:integer) ; //откладывает кабель целиком. на вход номер позиции
    procedure FromCenaRecount (Source : integer);
	public
    { Public declarations }
    function ShowDetail(id_sklad:integer;posted:integer=0): integer;
  end;

var
  frmNaklodet: TfrmNaklodet;

implementation

{$R *.dfm}

{ TfrmNaklodet }

function TfrmNaklodet.ShowDetail(id_sklad:integer;posted:integer=0): integer;
begin
 Result := 0;
try
	dmdEx.StartWaiting;
	cdsSklostdet.Close;
//  cdsSklostdet.Params.ParamByName('id_tovar').AsInteger:=id_tovar;
	cdsSklostdet.Params.ParamByName('id_sklad').AsInteger:=id_sklad;
	//1 - накладная была проведена. Блокируем кнопки отрезки
	iPosted:=posted;
 // cdsSklostdet.Open;
 // cdsIns.Open;
	cdsNaklodet.Params.ParamByName('id_nakld').asInteger:=
		dsNaklotEdit.DataSet.fieldbyname('id_nakld').asInteger;
	cdsNaklodet.Open;
  //set flag. OnChange event won't fire.
  dlcTovar.Tag :=1;
	dlcTovar.KeyValue := dsNaklotEdit.DataSet.FieldByName('id_tovar').asInteger;
  dlcTovar.Tag :=0;
	dmdEx.StopWaiting;
	Result := self.ShowModal;
except
	AssertInternal('21078C95-693C-4BFA-948B-7C6738DCE400');
end;
end;


//откладывает кабель целиком. на вход номер позиции
procedure TfrmNaklodet.Whole(id_ostt:integer) ;
begin
	if iPosted <> 0 then begin
		MessageDlg ('Нельзя менять кабель в проведённой отгрузке',mtWarning,[mbOk],0);
    exit;
  end;
	BeforeOtrez;
	try
		if (PostAndApply (TClientDataSet(dsNaklotEdit.DataSet))<>0) then begin
			exit;
		end;
		sdsNaklodetInsertPc.ParamByName('what').AsInteger := 7;
		sdsNaklodetInsertPc.ParamByName('id_ostt').AsInteger :=
			id_ostt;
		sdsNaklodetInsertPc.ParamByName('id_nakld').AsInteger :=
			dsNaklotEdit.DataSet.FieldByName('id_nakld').AsInteger;
		Otrez;
//    PlusTara (cdsNaklodet,dsNaklotEdit.DataSet);
	  AfterOtrez;
	except
	  on E:EDatabaseError do begin
			MessageDlg (e.message,mtWarning,[mbOK],0);
		end;
//		AssertInternal('FE031052-04C7-4ED3-8DC5-18BFF8B9176D');
  end;
end;

procedure TfrmNaklodet.actWholeExecute(Sender: TObject);
var
  i : integer;
  j : array of integer;
begin
  if dbgSklostt.SelectedRows.Count>1 then begin //много строк
    SetLength(j,dbgSklostt.SelectedRows.Count);
    with dbgSklostt.DataSource.DataSet do begin
      for i:=0 to dbgSklostt.SelectedRows.Count-1 do begin
        GotoBookmark(pointer(dbgSklostt.SelectedRows.Items[i]));
        j[i] := cdsSklostdet.FieldByName('id_ostt').AsInteger;
      end; //for
    end; //with
    for i:=0 to Length(j)-1 do begin
      Whole(j[i]);
    end;
  end else begin //одна строка
    Whole(cdsSklostdet.FieldByName('id_ostt').AsInteger);
  end;
end;

procedure TfrmNaklodet.actApplyExecute(Sender: TObject);
begin
try
  if dsNaklotEdit.DataSet.FieldByName('tovar').IsNull then begin
    showmessage ('Заполните поле ''Товар''');
    dlcTovar.SetFocus;
    exit;
  end;
  //запоминаем товар, даже если ничего не отрезали
  if iPosted = 0 then begin
    BeforeOtrez;
	end;
	PostAndApply(TClientDataSet(dsNaklotEdit.DataSet));
	PostAndApply(dsNaklodet.DataSet);
  ModalResult := mrOk;
except
  AssertInternal('34EE73B5-3A3E-40BA-B2E2-1A781E3931DF');
end;
end;

procedure TfrmNaklodet.FormCreate(Sender: TObject);
begin
  dmdEx.OpenQuery(dmdEx.cdsTovar);
  dmdEx.OpenQuery(dmdEx.cdsPost);
  dmdEx.OpenQuery(dmdEx.cdsSklottIdtype);
  { TODO : Добавить авт пересчёт кол-ва товара, если это тара, то не нужен пересчёт при открытии }
end;

procedure TfrmNaklodet.BitBtn4Click(Sender: TObject);
begin
  actCancel.Execute;
end;

procedure TfrmNaklodet.dlcTovarCloseUp(Sender: TObject; Accept: Boolean);
//var
//  intKey : integer;
begin
{
	dmdEx.startwaiting;
  cdsSklostdet.Close;
  dsNaklotEdit.DataSet.FieldByName('tovar').AsVariant:=dlcTovar.KeyValue;
  if dlcTovar.KeyValue = Null then begin
    intKey := 0;
  end else begin
    intKey :=Integer(dlcTovar.KeyValue);
  end;
	cdsSklostdet.Params.ParamByName('id_tovar').AsInteger:= intKey;
  cdsSklostdet.Open;
  dmdEx.stopwaiting;
}
end;

procedure TfrmNaklodet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  actCancel.Execute;
  cdsSklostdet.Filtered := false;
  cdsNaklodet.Filtered := false;
  cdsSklostdet.Close;
	cdsNaklodet.Close;
end;

procedure TfrmNaklodet.actCancelExecute(Sender: TObject);
begin
try
  PropStorageEh1.SaveProperties;
  dsNaklotEdit.DataSet.Cancel;
  //при обрыве связи, чтобы закрывалось без проблем
  CancelUpdates(cdsNaklodet);
  CancelUpdates(cdsSklostdet);
  ModalResult := mrCancel;
except
  AssertInternal('91AC3ADF-5B67-4B81-B4DB-22356469113D');
end;
end;

procedure TfrmNaklodet.btnOkClick(Sender: TObject);
begin
try
  actApply.Execute;
except
  AssertInternal('8EA9C0CC-8CBA-49BA-9E79-5DA6FD96F603');
end;
end;

procedure TfrmNaklodet.actCutPartExecute(Sender: TObject);
var
  frmOtrez : TfrmOtrez;
  intBuxt : integer;
  dblKolotp : double;
begin
  if iPosted <> 0 then begin
    MessageDlg('Нельзя менять кабель в проведённой отгрузке',mtWarning,[mbOK],0);
    exit;
  end;
  if dbgSklostt.SelectedRows.Count>1 then begin
    MessageDlg('Нельзя отрезать кабель от нескольких позиций сразу',mtWarning,[mbOK],0);
    exit;
  end;
	try
	BeforeOtrez;
	if (PostAndApply (TClientDataSet(dsNaklotEdit.DataSet))<>0) then begin
		exit;
	end;
	frmOtrez := TfrmOtrez.Create(self);
//  if (cdsSklostdet.FieldByName ('kolbuxt').asInteger=1) then begin
		dblKolotp :=cdsSklostdet.FieldByName ('kolotp').asFloat;
		intBuxt := cdsSklostdet.FieldByName ('kolbuxt').asInteger ;
		if (frmOtrez.ShowOtrez(dblKolotp, intBuxt,dblKolotp)=mrOk) then begin

			//showmessage (floattostr(dblKolotp)+' '+inttostr(intBuxt));
			sdsNaklodetInsertPc.ParamByName('what').AsInteger := 2;
			sdsNaklodetInsertPc.ParamByName('id_ostt').AsInteger :=
				cdsSklostdet.FieldByName('id_ostt').AsInteger;
			sdsNaklodetInsertPc.ParamByName('id_nakld').AsInteger :=
				dsNaklotEdit.DataSet.FieldByName('id_nakld').AsInteger;
			sdsNaklodetInsertPc.ParamByName('kolbuxt').AsInteger :=
				intBuxt;
			sdsNaklodetInsertPc.ParamByName('kolotp').AsFloat :=
				dblKolotp;
      Otrez;
			AfterOtrez;
		end ;
//  end;
	frmOtrez.Free;
	except
    on E:EDatabaseError do begin
      MessageDlg (e.message,mtWarning,[mbOK],0);
  	end;
//    AssertInternal('C4E8CD5C-225F-471A-BBE6-2378B6C691F9');
  end;
end;


procedure TfrmNaklodet.actReturnExecute(Sender: TObject);
begin
try
  if cdsNaklodet.RecordCount>0 then begin
    cdsNaklodet.Delete;
  end else begin
    showmessage('Нет позиций для удаления');
	end;
except
  AssertInternal('4578026C-DA9A-4C6F-9B99-1A1B6437A171');
end;
  PostAndApplyOrCancel(cdsNaklodet);
  AfterOtrez;
end;

procedure TfrmNaklodet.cdsNaklodetReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
	showmessage(e.message);
	Action := raCancel;
end;


procedure TfrmNaklodet.actReCountExecute(Sender: TObject);
var
  curSum : currency;
 // BookMark : TBookMark;
begin
try
  cdsNaklodet.DisableControls;
  //BookMark := cdsNaklodet.GetBookmark;
  qeNaklodet.SavePosition;
  cdsNaklodet.First;
  curSum :=0;
  while (not cdsNaklodet.eof) do begin
		curSum := curSum + (cdsNaklodet.FieldByName('kolotp').asFloat*
    cdsNaklodet.FieldByName('kolbuxt').asInteger);
    cdsNaklodet.Next;
  end;
  //if cdsNaklodet.BookmarkValid(BookMark) then begin
  //  cdsNaklodet.GotoBookmark(BookMark);
  //end;
  cdsNaklodet.EnableControls;
  qeNaklodet.GetPosition;    
  if (dsNaklotEdit.DataSet.state = dsBrowse) then begin
    dsNaklotEdit.DataSet.Edit;
  end;
  dsNaklotEdit.DataSet.FieldByName('kolotp').asFloat := curSum;
  dsNaklotEdit.DataSet.Post;

except
	AssertInternal('3318C8DE-0A87-4D9B-BD13-57C102CB8DCD');
end;
end;

procedure TfrmNaklodet.FormShow(Sender: TObject);
var
  intKey : integer;
begin
  dlcTovar.Enabled := true;
  if (dsNaklotEdit.Dataset.State = dsInsert) then begin
    dlcTovar.SetFocus;
  end;
  if (dsNaklotEdit.Dataset.State = dsEdit) then begin
    dlcTovar.Enabled := false;
  end;
  cdsSklostdet.Close;
  if dlcTovar.KeyValue = Null then begin
    intKey := 0;
  end else begin
    intKey :=Integer(dlcTovar.KeyValue);
  end;
  cdsSklostdet.Params.ParamByName('id_tovar').AsInteger:= intKey;
  cdsSklostdet.Open;

  FromCenaRecount(1);

  //recount prices
  //FromCenaRecount(1);
end;

procedure TfrmNaklodet.actNamotkaExecute(Sender: TObject);
var
	frmOtrez : TfrmOtrez;
	frmTara : TfrmTara;
	intBuxt : integer;
	dblKolotp : double;
	id_ostt : integer;
  id_sklad : integer;
begin
try
  if dbgSklostt.SelectedRows.Count>1 then begin
    MessageDlg('Нельзя отрезать кабель от нескольких позиций сразу',mtWarning,[mbOK],0);
    exit;
  end;
  if iPosted <> 0 then begin
    MessageDlg ('Нельзя менять кабель в проведённой отгрузке',mtWarning,[mbOK],0);
    exit;
  end;
  BeforeOtrez;
  if (PostAndApply (TClientDataSet(dsNaklotEdit.DataSet))<>0) then begin
    exit;
  end;
  if (cdsSklostdet.FieldByName ('kolbuxt').asInteger<>1) then begin
    MessageDlg ('Нельзя намотать больше одной бухты',mtWarning,[mbOK],0);
    exit;
  end;

    dblKolotp :=cdsSklostdet.FieldByName ('kolotp').asFloat;
    intBuxt := cdsSklostdet.FieldByName ('kolbuxt').asInteger ;
    frmTara := TfrmTara.Create(self);
    frmOtrez := TfrmOtrez.Create(self);
    id_sklad := TClientDataSet(dsNaklotEdit.DataSet).MasterSource.DataSet.FieldByName('id_sklad').asInteger;

		if ((frmTara.ShowTara(id_sklad,id_ostt)=mrOk) and (id_ostt<>0)) then begin
      if (frmOtrez.ShowOtrez(dblKolotp, intBuxt,dblKolotp)=mrOk)
      {and (cdsNaklodet.State =dsInsert )} then begin

        sdsNaklodetInsertPc.ParamByName('what').AsInteger := 9;
        sdsNaklodetInsertPc.ParamByName('id_ostt').AsInteger :=
          cdsSklostdet.FieldByName('id_ostt').AsInteger;
        sdsNaklodetInsertPc.ParamByName('id_nakld').AsInteger :=
          dsNaklotEdit.DataSet.FieldByName('id_nakld').AsInteger;
        sdsNaklodetInsertPc.ParamByName('kolbuxt').AsInteger :=
          intBuxt;
        sdsNaklodetInsertPc.ParamByName('kolotp').AsFloat :=
          dblKolotp;
        sdsNaklodetInsertPc.ParamByName('id_ostt_tara').AsInteger :=
          id_ostt;
        Otrez;
        AfterOtrez;
//        PlusTara(cdsNaklodet,dsNaklotEdit.DataSet);
      end //if otrez
      else begin
        //при выборе колва нажали отмену
        cdsNaklodet.CancelUpdates;
      end;
    end;
    frmOtrez.Free;
    frmTara.Free;
except
  on E:EDatabaseError do begin
    MessageDlg (e.message,mtWarning,[mbOK],0);
	end;
  //AssertInternal('23E4AC29-A0C7-4C85-8774-8D2F75F72793');
end;
end;

procedure TfrmNaklodet.actDetailExecute(Sender: TObject);
var
  frmSklostDet : TfrmSklostDet;
begin
try
  if dbgSklostt.Focused then begin
    if (not cdsSklostdet.FieldBYName('id_ostt').isNull) then begin
      frmSklostDet := TfrmSklostDet.Create(self);
      frmSklostDet.ShowDetailModal(
        cdsSklostdet.FieldBYName('id_ostt').asInteger);
      frmSklostDet.free;
    end;
  end else begin//if sklostt
  //if dbgNaklodet.Focused then begin
    if (not cdsNaklodet.FieldBYName('id_ostt').isNull) then begin
      frmSklostDet := TfrmSklostDet.Create(self);
      frmSklostDet.ShowDetailModal(
        cdsNaklodet.FieldBYName('id_ostt').asInteger);
      frmSklostDet.free;
    end;//not null
  end; //if Naklodet
except
  AssertInternal ('5301AC84-0165-475E-B77C-5E53934A45B0');
end;
end;


procedure TfrmNaklodet.cdsSklostdetAfterScroll(DataSet: TDataSet);
begin
  dbgSklostt.Hint :=
    cdsSklostdet.FieldByName('comment').AsString;
end;

procedure TfrmNaklodet.Otrez;
begin
	dmdEx.ExecSQL(sdsNaklodetInsertPc,false);
end;

procedure TfrmNaklodet.AfterOtrez;
var
  sIdOstt : string;
begin
		try
      sIdOstt:=qeSklostdet.Query.FieldByName('id_ostt').asstring;
      qeNaklodet.Refresh;
    except
			AssertInternal('57C91A27-01FD-4AC9-91D6-2721876C4441');
    end;
    try
      dbgSklostt.SelectedRows.Clear;
      qeSklostdet.Refresh;
//      qeNaklodet.GetThisPosition(sIdOstt);
//      qeSklostdet.query.GotoBookmark(pointer(dbgSklostt.SelectedRows.Items[0]));
    except
			AssertInternal('71574438-7665-4577-85B0-15D60DB28022');
		end;
		actReCount.Execute;
end;

procedure TfrmNaklodet.BeforeOtrez;
begin
  if (dsNaklotEdit.DataSet.State = dsInsert) then begin
      dsNaklotEdit.DataSet.FieldByName('id_tovar').asInteger:=
        dlcTovar.KeyValue;
      dsNaklotEdit.DataSet.Post;
      FromCenaRecount(5);
  end;
end;

procedure TfrmNaklodet.cdsSklostdetCalcFields(DataSet: TDataSet);
//var
//  iTip : integer;
begin
//  iTip := DataSet.FieldByName('id_type').asInteger;
//  Dataset.FieldByName('tip2').AsString :=
//    dmdEx.GetTipSkladTara (iTip);
end;

procedure TfrmNaklodet.PopupNaklodetPopup(Sender: TObject);
var
	DataSet: TDataSet;
begin
try
	mnuChangeBuxt.Visible := false;
  if Assigned(PopupNaklodet.PopupComponent) then begin
  	DataSet := (PopupNaklodet.PopupComponent as TDbGridEh).DataSource.DataSet;
	  if (dmdEx.isTaraNothing(DataSet.FieldByName('id_tara').AsInteger) and
	    (DataSet.FieldByName('kolbuxt').AsInteger = 1))	then
    begin
		  mnuChangeBuxt.Visible := true;
  	end;
  end;
except
	AssertInternal('6592813E-244E-4BFB-8B5B-5444B727E42C');
end;
end;

procedure TfrmNaklodet.actChangeBuxtExecute(Sender: TObject);
var
	frmChangeBuxt: TfrmChangeBuxt;
	id_ostt : integer;
begin
try
	frmChangeBuxt := TfrmChangeBuxt.Create(self);
	with frmChangeBuxt do begin
	  cdsTara.Close;
		cdsTara.Params.ParamByName('id_sklad').AsInteger :=
			cdsSklostdet.Params.ParamByName('id_sklad').AsInteger;
		cdsTara.Params.ParamByName('id_tovar').AsInteger :=
			cdsSklostdet.Params.ParamByName('id_tovar').AsInteger;
		cdsTara.Params.ParamByName('kolotp').asFloat :=
			dsNaklodet.DataSet.fieldbyname('kolotp').asFloat;
		cdsTara.Open;
		if cdsTara.RecordCount < 1 then begin
			showmessage ('Бухт этого товара с такой длиной на складе не обнаружено');
			cdsTara.Close;
			frmChangeBuxt.Free;
			exit;
		end;
		if (frmChangeBuxt.ShowTara(id_ostt)=mrOk) then begin
			sdsExchange.Params.ParamByName('id_ostt1').AsInteger:=
				cdsNaklodet.FieldByName('id_ostt').AsInteger;
			sdsExchange.Params.ParamByName('id_ostt2').AsInteger:=
				id_ostt;
			dmdEx.ExecSQL(sdsExchange);
		end;
	end;
	frmChangeBuxt.Free;
	AfterOtrez;
except
	AssertInternal('B2F6571F-96F0-4CBF-B5CF-C732D2D35011');
end;
end;

procedure TfrmNaklodet.dbnCenaEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  if dbnCena.Enabled and self.Visible then begin
    FromCenaRecount(6);
  end;
end;

procedure TfrmNaklodet.dbnCenaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  bTemp : boolean;
begin
  if key=vk_return then begin
    dbnCenaEditButtons0Click(sender,bTemp);
  end;
end;

procedure TfrmNaklodet.dbnCenaNdsEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var
  dNds : double;
  dCenaNds : double;
begin
  if dbnCenaNds.Enabled  then begin
    dNds := TClientDataSet(dsNaklotEdit.DataSet).MasterSource.DataSet.FieldByName('nalog_nds').asFloat;
    if dbnCenaNds.Value <> null then begin
      dCenaNds := dbnCenaNds.Value;
    end else begin
      dCenaNds := 0;
    end;
    dbnCena.Value :=  RRoundTo(dCenaNds/(1+ dNds),-2);
    FromCenaRecount(2);
    Handled := true;
  end;
end;

procedure TfrmNaklodet.dbnCenaNdsKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  bTemp : boolean;
begin
  if key=vk_return then begin
    dbnCenaNdsEditButtons0Click(sender,bTemp);
  end;
end;

{6-цена, 1 -колво, 5 -скидка}

procedure TfrmNaklodet.FromCenaRecount (Source : integer);
var
  dNds : double;
  dCena : double;
  curPrice : double;
begin

  dNds := TClientDataSet(dsNaklotEdit.DataSet).MasterSource.DataSet.FieldByName('nalog_nds').asFloat;
  if dbnCena.Value <> null then begin
    dCena := dbnCena.Value;
  end else begin
    dCena := 0;
  end;

  if Source=5 then begin
    if GetPrice(dmdEx.cdsTemp,1,
     dsNaklotedit.DataSet.FieldByName('id_tovar').asinteger,
     dsNakloedit.DataSet.FieldByName('dat').asDateTime,false,
     0,curPrice) then begin
    //такой товар был найден в прайсе
      dCena:= rroundto(curPrice,-2)*
        (1-VarToDbl(dbnSkidka.Value)/100);
    end;
  end;
  if Source<>2 then begin
    dbnCenaNds.Value := RRoundTo((dCena*(dNds+1)),-2);
  end;
  if Source<>6 then begin
    dbnCena.Value := RRoundTo(dCena,-2);
  end;
  if not (Source in [5,1]) then begin
    dbnSkidka.Value := Null;
  end;
  if Source=2 then begin
    dbnCenaNds.Value := RRoundTo((dCena*(dNds+1)),-2);
  end;

end;

procedure TfrmNaklodet.rgCenaClick(Sender: TObject);
begin
  dbnSkidka.Enabled := false;
  dbnCena.Enabled := false;
  dbnCenaNds.Enabled := false;
  case rgCena.ItemIndex of
    1: begin
      dbnCena.Enabled := true;
      dbnCena.SetFocus;
      dbnCena.SelectAll;
    end;
    2 : begin
      dbnCenaNds.Enabled := true;
      dbnCenaNds.SetFocus;
      dbnCenaNds.SelectAll;
    end;
    0: begin
      dbnSkidka.Enabled := true;
      dbnSkidka.SetFocus;
      dbnSkidka.SelectAll;
    end ;
  end;
end;

procedure TfrmNaklodet.dbnSkidkaEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  if dbnSkidka.Enabled and self.Visible then begin
    FromCenaRecount(5);
  end;
end;

procedure TfrmNaklodet.dbnSkidkaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  bTemp : boolean;
begin
  if key=vk_return then begin
    dbnSkidkaEditButtons0Click(sender,bTemp);
  end;
end;

procedure TfrmNaklodet.dlcTovarChange(Sender: TObject);
var
  intKey : integer;
begin
  if dlcTovar.Tag=1 then begin
    //semafore was set in ShowDetail
    exit;
  end;
  if (dsNaklotEdit.DataSet.State <> dsInsert) then begin
    dlcTovar.Tag:=1;
  	dlcTovar.KeyValue := dsNaklotEdit.DataSet.FieldByName('id_tovar').asInteger;
    dlcTovar.Tag:=0;    
    showmessage ('Запрешено менять название кабеля. Создайте новую позицию.');
    Exit;
    //abort;
  end;
	dmdEx.startwaiting;
  cdsSklostdet.Close;
  dsNaklotEdit.DataSet.FieldByName('tovar').AsVariant:=dlcTovar.Text;
  if dlcTovar.KeyValue = Null then begin
    intKey := 0;
  end else begin
    intKey :=Integer(dlcTovar.KeyValue);
  end;
	cdsSklostdet.Params.ParamByName('id_tovar').AsInteger:= intKey;
  cdsSklostdet.Open;
  dmdEx.stopwaiting;
end;

procedure TfrmNaklodet.dbnSkidkaExit(Sender: TObject);
var
  bTemp :boolean;
begin
  dbnSkidkaEditButtons0Click(sender,bTemp);
end;

procedure TfrmNaklodet.dbnCenaExit(Sender: TObject);
var
  bTemp : boolean;
begin
  dbnCenaEditButtons0Click(sender,bTemp);
end;

procedure TfrmNaklodet.dbnCenaNdsExit(Sender: TObject);
var
  bTemp : boolean;
begin
  dbnCenaNdsEditButtons0Click(sender,bTemp);
end;

procedure TfrmNaklodet.dbgNaklodetDblClick(Sender: TObject);
begin
  actDetail.Execute;
end;

procedure TfrmNaklodet.dlcTovarKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then Begin
    If HiWord(GetKeyState(VK_SHIFT)) <> 0 then begin
       SelectNext(Sender as TWinControl,False,True);
    end else begin
       SelectNext(Sender as TWinControl,True,True) ;
       Key := #0
    end;
  end;
end;


end.
