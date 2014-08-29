unit untNakloEdit;

interface

uses
  Windows, Messages, SysUtils, Variants,
  Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ActnList, DB,
  DBLookupEh, DBCtrlsEh, Mask,
  DBTables, ComCtrls,SqlTimSt,DBClient, Buttons,
  untEx,FMTBcd, Provider,
  SqlExpr, DBCtrls,
  untRound,
  SkladSpr, DBGridEh //TfrmSklad
  ;

type
  TfrmNakloEdit = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbeIDNAKL: TDBEditEh;
    dneKurs: TDBNumberEditEh;
    lcbIZG: TDBLookupComboboxEh;
    lcbZAK: TDBLookupComboboxEh;
    lcbMANAGER: TDBLookupComboboxEh;
    dsNakloEdit: TDataSource;
    ActionList1: TActionList;
    actCancel: TAction;
    actApply: TAction;
    Label6: TLabel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    actOk: TAction;
    dbnItogo: TDBNumberEditEh;
    Label8: TLabel;
    dbeComment: TDBEdit;
    Label7: TLabel;
    Label9: TLabel;
    lcbTipConst: TDBLookupComboboxEh;
    Label10: TLabel;
    dbeID: TDBEditEh;
    Label11: TLabel;
    lcbSklad: TDBLookupComboboxEh;
    lcbSkladTo: TDBLookupComboboxEh;
    lblSkladTo: TLabel;
    dteDat: TDBDateTimeEditEh;
    lblParentIdNakl: TLabel;
    cdsNakloTip: TClientDataSet;
    StringField3: TStringField;
    IntegerField2: TIntegerField;
    dspNakloTip: TDataSetProvider;
    sdsNakloTip: TSQLDataSet;
    dsNakloTip: TDataSource;
    lcdParentIdNakl2: TDBComboBoxEh;
    procedure actCancelExecute(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actOkExecute(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btnOkKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCancelKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOkKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lcbTipConstKeyValueChanged(Sender: TObject);
    procedure lcbTipConstCloseUp(Sender: TObject; Accept: Boolean);
    procedure lcbSkladToEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure lcdParentIdNaklButtonClick(Sender: TObject;
      var Handled: Boolean);
    procedure DBEditEh1EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure lcdParentIdNaklKeyPress(Sender: TObject; var Key: Char);
    procedure lcdParentIdNaklEditButtons1Click(Sender: TObject;
      var Handled: Boolean);
    procedure lcdParentIdNakl2Change(Sender: TObject);
    procedure lcdParentIdNakl2KeyPress(Sender: TObject; var Key: Char);
    procedure lcdParentIdNakl2EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure lcdParentIdNakl2ButtonDown(Sender: TObject;
      TopButton: Boolean; var AutoRepeat, Handled: Boolean);
    procedure dbeIDKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FParentIdOldValue : string;
    {Показываем окно выбора расходных накладных}
    procedure ShowNaklrList;
    procedure SelectNakl(out intTemp : integer; out strIdTemp:string;
      DataSet:TDataSet;ItemIndex:integer);
  public
    { Public declarations }
    procedure PrepareForRasxod;
    procedure PrepareForPrixod;
    procedure DisableSkladEdit(DisableSklad: boolean);
  end;

var
  frmNakloEdit: TfrmNakloEdit;

implementation

uses untNaklrList;

{$R *.dfm}





procedure TfrmNakloEdit.actCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmNakloEdit.actApplyExecute(Sender: TObject);
begin
  actApply.Checked := false;
	if dsNakloEdit.DataSet.FieldByName('tipconst').IsNull then begin
		showmessage ('Заполните поле ''Тип''');
		lcbTipConst.SetFocus;
		abort;
	end;
	if dsNakloEdit.DataSet.FieldByName('dat').IsNull then begin
		showmessage ('Заполните поле ''Дата''');
		dteDat.SetFocus;
		abort;
	end;
	if dsNakloEdit.DataSet.FieldByName('izg').IsNull then begin
		showmessage ('Заполните поле ''Поставщик''');
		lcbIZG.SetFocus;
		abort;
	end;
	if dsNakloEdit.DataSet.FieldByName('zak').IsNull then begin
		showmessage ('Заполните поле ''Получатель''');
		lcbZAK.SetFocus;
		abort;
	end;
	if dsNakloEdit.DataSet.FieldByName('manager').IsNull then begin
		showmessage ('Заполните поле ''Менеджер''');
		lcbMANAGER.SetFocus;
		abort;
	end;
	if dsNakloEdit.DataSet.FieldByName('kurs').IsNull then begin
		showmessage ('Заполните поле ''Курс''');
		dneKurs.SetFocus;
		abort;
	end;
	//oid хранения = 103
	if dsNakloEdit.DataSet.FieldByName('tip').asInteger = 103 then begin
		if dsNakloEdit.DataSet.FieldByName('id_sklad_to').IsNull  then begin
			showmessage ('Заполните поле ''Склад назначения''');
			lcbSkladTo.SetFocus;
			abort;
		end;
    if dsNakloEdit.DataSet.FieldByName('id_sklad_to').asInteger=
      dsNakloEdit.DataSet.FieldByName('id_sklad').asInteger then begin
			showmessage ('Склад назначения не должен совпадать с отпускным складом');
			lcbSkladTo.SetFocus;
			abort;
    end;
	end;

	if (dsNakloEdit.DataSet.state <> dsBrowse) then begin
		dsNakloEdit.DataSet.Post;
	end;  //to avoid double apply 

  	if (TClientDataSet(dsNakloEdit.DataSet).ApplyUpdates(0)<>0) then begin
		TClientDataSet(dsNakloEdit.DataSet).CancelUpdates;
		abort;
	end;
  actApply.Checked := true;
end;



procedure TfrmNakloEdit.FormShow(Sender: TObject);
begin
	lcbTipConst.Enabled := true;
	dteDat.Enabled := true;
	dbeComment.Enabled := true;
	//lcbSklad.Enabled := true;
	lcbSkladTo.Enabled := true;
  lcbIZG.SetFocus;

	if (dsNakloEdit.DataSet.State = dsEdit) and
	 ((dsNakloEdit.DataSet.FieldByName('posted').asInteger=1) or
	 (dsNakloEdit.DataSet.FieldByName('blocked').asInteger=1))
	then begin
		lcbTipConst.Enabled := false;
		dteDat.Enabled := false;
		dbeComment.Enabled := false;
		lcbSklad.Enabled := false;
		lcbSkladTo.Enabled := false;
	end;
  // если уже был отложен барабан, то скорее
  //всего сумма накладной >0. Следовательно уже
  //нельзя менять склад в шапке накладной.
  //защита не сработает если кабель по 0 цене,
  //но всё же лучше чем ничего
  {
  if (dsNakloEdit.DataSet.State = dsEdit) and
    (dsNakloEdit.DataSet.FieldByName('nds').asFloat>0) and
    (not (dsNakloEdit.DataSet.FieldByName('tip').asInteger in [1,2]))
  then begin
    lcbSklad.Enabled := false;
  end;
  if (dsNakloEdit.DataSet.State = dsEdit) and
    (dsNakloEdit.DataSet.FieldByName('tip').asInteger =2)
  then begin
    lcbSklad.Enabled := false;
  end;
  }

  lcdParentIdNakl2.Enabled := false;
  //отгрузка, приход, возврат - показываем поле "на основании расх"
  if ((dsNakloEdit.DataSet.FieldByName('tip').asInteger in [5,1]) or
  (dsNakloEdit.DataSet.FieldByName('tip').asInteger = -110))    then begin
    lcdParentIdNakl2.Enabled := true;
  end;
end;

procedure TfrmNakloEdit.actOkExecute(Sender: TObject);
begin
  actApply.Execute;
  if  actApply.Checked then begin
    ModalResult := mrOk;
  end;
end;

procedure TfrmNakloEdit.btnApplyClick(Sender: TObject);
begin
  actApply.Execute;
end;

procedure TfrmNakloEdit.btnOkKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Key := VK_OEM_CLEAR;
end;

procedure TfrmNakloEdit.btnCancelKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Key := VK_OEM_CLEAR;
end;

procedure TfrmNakloEdit.btnOkKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Key := VK_OEM_CLEAR;
end;

procedure TfrmNakloEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if dsNakloEdit.DataSet.State <> dsBrowse then begin
    dsNakloEdit.DataSet.Cancel;
    ModalResult := mrCancel;
  end;
end;

procedure TfrmNakloEdit.lcbTipConstKeyValueChanged(Sender: TObject);
begin
  lcdParentIdNakl2.Enabled := false;
  lcdParentIdNakl2.Visible := false;
  lblParentIdNakl.Visible := false;
  lcbSkladTo.Visible := false;
  lblSkladTo.Visible := false;

  //oid хранения = 103, излишек = 2
  if ((lcbTipConst.KeyValue = 103)) then begin
    lcbSkladTo.Visible := true;
    lblSkladTo.Visible := true;
  end;
  if  (lcbTipConst.KeyValue = 1 ) or (lcbTipConst.KeyValue = -110 )
  or (lcbTipConst.KeyValue = 5 ) then begin
    lcdParentIdNakl2.Enabled := true;
    lcdParentIdNakl2.Visible := true;
    lblParentIdNakl.Visible := true;
  end;
end;

procedure TfrmNakloEdit.lcbTipConstCloseUp(Sender: TObject;
  Accept: Boolean);
begin
//В будущем при выборе накладной по излишкам здесь дописать
//изменения в форме редактирования, типа изменения lookupdataset
end;

procedure TfrmNakloEdit.lcbSkladToEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var
  Sklad : TfrmSkladSpr;
begin
  Sklad := TfrmSkladSpr.Create (Application);
  Sklad.FormStyle := fsNormal;
  Sklad.Visible := false;
  Sklad.ShowModal;
end;

procedure TfrmNakloEdit.PrepareForRasxod;
begin
  lcbIZG.ListSource := dmdEx.dsVlad;
  lcbZAK.ListSource := dmdEx.dsClient;
  cdsNakloTip.Filter := '(id_field<>1) and (id_field <>2) and (id_field<>-110)';
  cdsNakloTip.Filtered := true;
  lblParentIdNakl.Caption := 'На основании расх. накл.';
  lcbTipConstKeyValueChanged(self);
  //lcdParentIdNakl.DataField :='parent_id';
end;

procedure TfrmNakloEdit.PrepareForPrixod;
begin
  lcbIZG.ListSource := dmdEx.dsPost;
  lcbZAK.ListSource := dmdEx.dsVlad;
  cdsNakloTip.Filter := '(id_field=1) or (id_field =2) or (id_field=-110)';
  cdsNakloTip.Filtered := true;
  lblParentIdNakl.Caption := 'На основании прих. накл.';
  lcbTipConstKeyValueChanged(self);
  //lcdParentIdNakl.DataField :='parent_id';
end;

procedure TfrmNakloEdit.lcdParentIdNaklButtonClick(Sender: TObject;
  var Handled: Boolean);
begin
  ShowNaklrList;
  Handled := true;
end;

procedure TfrmNakloEdit.ShowNaklrList;
var
  intTemp : integer;
  strIdTemp : string;
begin
   { DONE :
Добавить ограничения на выбор расходных
(только для этого менеджера и допустим не старше 3 месяцев) }
  actApply.Execute;
  dsNakloEdit.DataSet.Edit;
  SelectNakl(intTemp,strIdTemp,dsNakloEdit.Dataset,lcdParentIdNakl2.ItemIndex);
  if (intTemp <>0) then begin
    if (intTemp<> dsNakloEdit.Dataset.FieldByName('parent_id_nakl').asInteger) then begin
      dsNakloEdit.Dataset.FieldByName('parent_id_nakl').asInteger := intTemp;
      dsNakloEdit.Dataset.FieldByName('parent_id').asString := strIdTemp;
    end;
  end else begin
    if dsNakloEdit.DataSet.FieldByName('tip').asInteger =1  then begin
      dsNakloEdit.Dataset.FieldByName('parent_id').asString := FParentIdOldValue;
    end;
  end;
end;

procedure TfrmNakloEdit.DBEditEh1EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  ShowNaklrList;
  Handled := true;
end;



procedure TfrmNakloEdit.FormCreate(Sender: TObject);
begin
  dmdEx.openquery(cdsNaklotip);
end;

procedure TfrmNakloEdit.lcdParentIdNaklKeyPress(Sender: TObject;
  var Key: Char);
begin
{
  if Ord(key) <> 13 and dsNakloEdit.DataSet.FieldByName('tip').asInteger<>1 then begin
    ShowNaklrList;
  end;}
end;

procedure TfrmNakloEdit.lcdParentIdNaklEditButtons1Click(Sender: TObject;
  var Handled: Boolean);
begin
	if (dsNakloEdit.DataSet.State = dsEdit) and
	 ((dsNakloEdit.DataSet.FieldByName('posted').asInteger<>1) and
	 (dsNakloEdit.DataSet.FieldByName('blocked').asInteger<>1))
  then begin
    dsNakloEdit.DataSet.FieldByName('parent_id_nakl').Clear;
    dsNakloEdit.DataSet.FieldByName('parent_id_nakl').Clear;
    dsNakloEdit.DataSet.FieldByName('parent_id').Clear;
    Handled := true;
  end else begin
    MessageDlg('Поле ''на основании накладной'' запрещено менять'+
      ' у проведенных или заблокированных накладных',mtWarning,[mbok],0);
    Handled := true;
  end;
end;

procedure TfrmNakloEdit.lcdParentIdNakl2Change(Sender: TObject);
begin
  //ShowNaklrList;
end;


procedure TfrmNakloEdit.lcdParentIdNakl2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if ((Ord(key) <> 13) and (dsNakloEdit.DataSet.FieldByName('tip').asInteger<>1)) then begin
    ShowNaklrList;
  end;
end;

procedure TfrmNakloEdit.lcdParentIdNakl2EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
	if (dsNakloEdit.DataSet.State = dsEdit) and
	 ((dsNakloEdit.DataSet.FieldByName('posted').asInteger<>1) and
	 (dsNakloEdit.DataSet.FieldByName('blocked').asInteger<>1))
  then begin
    dsNakloEdit.DataSet.FieldByName('parent_id_nakl').Clear;
    dsNakloEdit.DataSet.FieldByName('parent_id').Clear;
    Handled := true;
  end else begin
    MessageDlg('Поле ''на основании накладной'' запрещено менять'+
      ' у проведенных или заблокированных накладных',mtWarning,[mbok],0);
    Handled := true;
  end;
end;

procedure TfrmNakloEdit.lcdParentIdNakl2ButtonDown(Sender: TObject;
  TopButton: Boolean; var AutoRepeat, Handled: Boolean);
begin
  FParentIdOldValue := dsNakloEdit.Dataset.FieldByName('parent_id').asString;
  ShowNaklrList;
  Handled := true;
end;

procedure TfrmNakloEdit.SelectNakl(out intTemp: integer;
  out strIdTemp: string;Dataset:TDataset;ItemIndex:integer);
begin
  frmNaklrList := TfrmNaklrList.Create(self);
  //если приходная накладная то выбирать родительскую
  if DataSet.FieldByName('tip').asInteger =1  then begin
    frmNaklrList.ShowNaklpbux;
    frmNaklrList.qeNaklr.SetSql('where','posted=1',5);
  end else begin  //if dsNakloEdit.DataSet.FieldByName('tip').asInteger =1
    //если отгрузка, то может быть привязана и к возврату поставщику
    if DataSet.FieldByName('tip').asInteger =5 then begin
      frmNaklrList.ShowNaklrAndVozvratPost;
    end;
    if DataSet.FieldByName('tip').asInteger = -110 then begin
      frmNaklrList.ShowVozvrat;
      frmNaklrList.qeNaklr.SetSql('where','posted=1',5);
    end
  end;
  //менеджер только этот для всех накладных кроме приходных
  //приходные бухгалтерские могут быть выписаны альбиной, а
  //складские катей.
  if dsNakloEdit.DataSet.FieldByName('tip').asInteger <> 1 then begin
    frmNaklrList.setT.IDManager:=
      dataset.fieldbyname('id_manager').asInteger;
  end;   //if dsNakloEdit.DataSet.FieldByName('tip').asInteger <> 1

  frmNaklrList.setT.DateFrom:=IncMonth(DataSet.FieldByName('dat').AsDateTime,-6);
  frmNaklrList.setT.DateTo:=IncMonth(DataSet.FieldByName('dat').asDateTime,4);
  frmNaklrList.qeNaklr.SetSql('where','id_izg='+
    dataset.fieldbyname('id_izg').asString,3);
  frmNaklrList.qeNaklr.SetSql('where','id_zak='+
    dataset.fieldbyname('id_zak').asString,4);
  //накладные с выданными откатами
  if dsNakloEdit.DataSet.FieldByName('tip').asInteger = 5 then begin
    frmNaklrList.qeNaklr.SetSql('where','((tip=3047 and trim(comment)='''') or (tip<>3047))',5);
  end;
  frmNaklrList.actSettings.Enabled:=false;
  frmNaklrList.ProcessSettings;
  frmNaklrList.DefaultOpen;

  frmNaklrList.Locate(Dataset.FieldByName('parent_id_nakl').asInteger);

  intTemp := frmNaklrList.GetSchet;
  strIdTemp := frmNaklrList.qeNaklr.Query.FieldByName('id').asString;
  frmNaklrList.Free;
end;

procedure TfrmNakloEdit.dbeIDKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmNakloEdit.DisableSkladEdit(DisableSklad: boolean);
begin
  lcbSklad.Enabled := true;
  if DisableSklad then begin
    lcbSklad.Enabled := false;
  end;
end;

end.

