unit NaklruEdit;

interface

uses
  Windows, Messages, SysUtils,
  Variants, Classes,
  Graphics, Controls, Forms,
  Dialogs,
  ActnList, StdCtrls, Mask,
  DBCtrls, ExtCtrls, DB ,
	DBClient, Buttons,
	untRound,
	atsAssert, PropStorageEh,
  ClientSchet, DBCtrlsEh, DBLookupEh, FMTBcd, SqlExpr, Provider, DBGridEh,
  PropFilerEh, //tfrmClientSchet
  untNaklrList  //TfrmNaklrList
    ;

type
  TfrmNaklruEdit = class(TForm)
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    dbeIDNAKL: TDBEditEh;
    lcbMANAGER: TDBLookupComboboxEh;
    dbeID: TDBEditEh;
    lcbStatyaR: TDBLookupComboboxEh;
    dteDat: TDBDateTimeEditEh;
    ActionList1: TActionList;
    actCancel: TAction;
    actApply: TAction;
    actOk: TAction;
    dsNakloEdit: TDataSource;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Label1: TLabel;
    lcbIZG: TDBLookupComboboxEh;
    Label7: TLabel;
    lcbZak: TDBLookupComboboxEh;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    dneNds: TDBNumberEditEh;
    dneKurs: TDBNumberEditEh;
    actKursChange: TAction;
    Label2: TLabel;
    Label5: TLabel;
    lcbProject: TDBLookupComboboxEh;
    Label6: TLabel;
    lbcXozOper: TDBLookupComboboxEh;
    Label9: TLabel;
    lcdParentIdNakl: TDBComboBoxEh;
    lblParentIdNakl: TLabel;
    Label10: TLabel;
    lcbCurrency: TDBLookupComboboxEh;
    Label13: TLabel;
    dbeComment: TDBEdit;
    lblDogovor: TLabel;
    lcbDogovor: TDBLookupComboboxEh;
    dbcbIncludeNds: TDBCheckBox;
    procedure actOkExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actApplyExecute(Sender: TObject);
    procedure lcdParentIdNaklEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure lcdParentIdNaklKeyPress(Sender: TObject; var Key: Char);
    procedure dbeIDNAKLKeyPress(Sender: TObject; var Key: Char);
    procedure lcdParentIdNaklButtonDown(Sender: TObject;
      TopButton: Boolean; var AutoRepeat, Handled: Boolean);
    procedure lcdParentIdNakl2EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure lbcXozOperKeyValueChanged(Sender: TObject);
    procedure lcbDogovorEditButtons0Click(Sender: TObject;
      var Handled: Boolean);

  private
    { Private declarations }
    Semaphore : boolean;
    FParentIdOldValue : string;
    FiXozOperFact : integer;
    //при изменении пользователем одной из валют
    procedure ShowNaklrList;
    procedure SelectNakl(out intTemp: integer;
      out strIdTemp: string;Dataset:TDataset;ItemIndex:integer);
  protected
    function GetIdXozOper:integer;virtual;
    procedure SelectNaklStrategy(frmNaklrList : TfrmNaklrList);virtual;

  public
    { Public declarations }
  end;

var
  frmNaklruEdit: TfrmNaklruEdit;

implementation

uses  untEx;

{$R *.dfm}

procedure TfrmNaklruEdit.actOkExecute(Sender: TObject);
begin
  actApply.Execute;
  if  actApply.Checked then begin
    ModalResult := mrOk;
  end;
end;

procedure TfrmNaklruEdit.actCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmNaklruEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CloseEditForm(self,dsNakloEdit.DataSet,semaphore);
end; 


procedure TfrmNaklruEdit.actApplyExecute(Sender: TObject);
begin
  actApply.Checked := false;
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
		lcbZak.SetFocus;
		abort;
	end;
	if dsNakloEdit.DataSet.FieldByName('manager').IsNull then begin
		showmessage ('Заполните поле ''Менеджер''');
		lcbMANAGER.SetFocus;
		abort;
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

procedure TfrmNaklruEdit.lcdParentIdNaklEditButtons0Click(
  Sender: TObject; var Handled: Boolean);
begin
  ShowNaklrList;
  Handled := true;
end;

procedure TfrmNaklruEdit.FormShow(Sender: TObject);
begin
  dbeId.SetFocus;
  //чтобы при прокрутке списка не вызывалась, а при открытии формы ред выполнялось
  lbcXozOperKeyValueChanged(self);
  //можно дальше редактировать
  Semaphore := false;
end;



procedure TfrmNaklruEdit.lcdParentIdNaklKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Ord(key) <> 13 then begin
    ShowNaklrList;
  end;
end;

procedure TfrmNaklruEdit.dbeIDNAKLKeyPress(Sender: TObject;
  var Key: Char);
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

procedure TfrmNaklruEdit.lcdParentIdNaklButtonDown(Sender: TObject;
  TopButton: Boolean; var AutoRepeat, Handled: Boolean);
begin
  FParentIdOldValue := dsNakloEdit.Dataset.FieldByName('parent_id').asString;
//  if dsNakloEdit.DataSet.FieldByName('tip').asInteger<>1 then begin
  ShowNaklrList;
  Handled := true;
//  end;
end;

procedure TfrmNaklruEdit.lcdParentIdNakl2EditButtons0Click(Sender: TObject;
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
    MessageDlg('Поле ''на основании'' запрещено менять'+
      ' у проведенных или заблокированных накладных',mtWarning,[mbok],0);
    Handled := true;
  end;
end;

procedure TfrmNaklruEdit.ShowNaklrList;
var
  intTemp : integer;
  strIdTemp : string;
begin
  actApply.Execute;
  dsNakloEdit.DataSet.Edit;
  SelectNakl(intTemp,strIdTemp,dsNakloEdit.Dataset,lcdParentIdNakl.ItemIndex);
  if (intTemp <>0) then begin
    if (intTemp<> dsNakloEdit.Dataset.FieldByName('parent_id_nakl').asInteger) then begin
      dsNakloEdit.Dataset.FieldByName('parent_id_nakl').asInteger := intTemp;
      dsNakloEdit.Dataset.FieldByName('parent_id').asString := strIdTemp;
    end;
  end;
end;

procedure TfrmNaklruEdit.SelectNaklStrategy(frmNaklrList : TfrmNaklrList);
begin
  frmNaklrList.ShowNaklru;
end;

procedure TfrmNaklruEdit.SelectNakl(out intTemp: integer;
  out strIdTemp: string;Dataset:TDataset;ItemIndex:integer);
var
  frmNaklrList : TfrmNaklrList;
begin
  frmNaklrList := TfrmNaklrList.Create(self);
  //если приходная накладная то выбирать родительскую
  SelectNaklStrategy(frmNaklrList);
//  frmNaklrList.ShowNaklru;
  frmNaklrList.qeNaklr.SetSql('where','posted=1',5);
  //менеджер только этот для всех накладных
  frmNaklrList.setT.IDManager:=
    dataset.fieldbyname('id_manager').asInteger;

  frmNaklrList.setT.DateFrom:=IncMonth(DataSet.FieldByName('dat').AsDateTime,-6);
  frmNaklrList.setT.DateTo:=IncMonth(DataSet.FieldByName('dat').asDateTime,4);
  frmNaklrList.qeNaklr.SetSql('where','id_izg='+
    dataset.fieldbyname('id_izg').asString,3);
  frmNaklrList.qeNaklr.SetSql('where','id_zak='+
    dataset.fieldbyname('id_zak').asString,4);
  frmNaklrList.actSettings.Enabled:=false;
  frmNaklrList.ProcessSettings;
  frmNaklrList.DefaultOpen;
  frmNaklrList.Locate(Dataset.FieldByName('parent_id_nakl').asInteger);
  intTemp := frmNaklrList.GetSchet;
  strIdTemp := frmNaklrList.qeNaklr.Query.FieldByName('id').asString;
  frmNaklrList.Free;
end;
function TfrmNaklruEdit.GetIdXozOper: integer;
var
  iXozOperFact : integer;
begin
  iXozOperFact:=dmdEx.GetParamCached('ХОЗЯЙСТВЕННЫЕ ОПЕРАЦИИ',
    'select oid from GET_OID_OBJECTS_PC('+quotedstr('ХОЗЯЙСТВЕННЫЕ ОПЕРАЦИИ')+',-100)',
    'oid');
  Result :=dmdEx.GetParamCached('РАСХОДНАЯ НА УСЛУГИ ФАКТ ЧАСТЬ',
    'select oid from GET_OID_OBJECTS_PC('
      +quotedstr('РАСХОДНАЯ НА УСЛУГИ ФАКТ ЧАСТЬ')
      +','+inttostr(iXozOperFact)+')',
    'oid');
end;

procedure TfrmNaklruEdit.FormCreate(Sender: TObject);
begin
  FiXozOperFact := GetIdXozOper;

//  FiXozOperFact := dmdEx.GetOidObjects('ХОЗЯЙСТВЕННЫЕ ОПЕРАЦИИ',-100);
//  FiXozOperFact := dmdEx.GetOidObjects('РАСХОДНАЯ НА УСЛУГИ ФАКТ ЧАСТЬ',FiXozOperFact);
end;


procedure TfrmNaklruEdit.lbcXozOperKeyValueChanged(Sender: TObject);
begin
  if self.visible then begin
    if lbcXozOper.KeyValue <> FiXozOperFact then begin
      lblParentIdNakl.Visible := false;
      lcdParentIdNakl.Visible := false;
    end else begin
      lblParentIdNakl.Visible := true;
      lcdParentIdNakl.Visible := true;
    end;
  end;
end;

procedure TfrmNaklruEdit.lcbDogovorEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  lcbDogovor.KeyValue := null;
  Handled := true;
end;

end.
