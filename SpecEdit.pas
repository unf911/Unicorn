unit SpecEdit;

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
  ClientSchet, DBCtrlsEh, DBLookupEh,
  untEx,
  DBGridEh, PropFilerEh //tfrmClientSchet
    ;

type
  TfrmSpecEdit = class(TForm)
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    dbeIDNAKL: TDBEditEh;
    lcbMANAGER: TDBLookupComboboxEh;
    dbeComment: TDBEdit;
    dbeID: TDBEditEh;
    lcbSklad: TDBLookupComboboxEh;
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
    dneKurs: TDBNumberEditEh;
    Label2: TLabel;
    Label7: TLabel;
    dbeNalogNds: TDBNumberEditEh;
    Label10: TLabel;
    lcbZak: TDBLookupComboboxEh;
    Label5: TLabel;
    lcbCurrency: TDBLookupComboboxEh;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    Label12: TLabel;
    lcdParentIdNakl: TDBEditEh;
    procedure actOkExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actApplyExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lcdParentIdNaklDblClick(Sender: TObject);
    procedure lcdParentIdNaklKeyPress(Sender: TObject; var Key: Char);
    procedure lcdParentIdNaklEditButtons0Click(Sender: TObject;
      var Handled: Boolean);

  private
    { Private declarations }
    //TipChanged : boolean ;  //flag = true когда изменили тип клиента
    procedure ShowNaklrList;
  public
    { Public declarations }
  end;

var
  frmSpecEdit: TfrmSpecEdit;

implementation

uses untNaklrList;

{$R *.dfm}

procedure TfrmSpecEdit.actOkExecute(Sender: TObject);
begin
  actApply.Execute;
  if  actApply.Checked then begin
    ModalResult := mrOk;
  end;
end;

procedure TfrmSpecEdit.actCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmSpecEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if dsNakloEdit.DataSet.State <> dsBrowse then begin
    dsNakloEdit.DataSet.Cancel;
    ModalResult := mrCancel;
  end;
end;



procedure TfrmSpecEdit.actApplyExecute(Sender: TObject);
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
	if dsNakloEdit.DataSet.FieldByName('id_currency').IsNull then begin
		showmessage ('Заполните поле ''Валюта''');
		lcbCurrency.SetFocus;
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

procedure TfrmSpecEdit.FormShow(Sender: TObject);
begin
  dbeId.SetFocus;
end;

procedure TfrmSpecEdit.lcdParentIdNaklDblClick(Sender: TObject);
begin
  ShowNaklrList;
end;

procedure TfrmSpecEdit.lcdParentIdNaklKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Ord(key) <> 13 then begin
    ShowNaklrList;
  end;  
end;

procedure TfrmSpecEdit.lcdParentIdNaklEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  ShowNaklrList;
  Handled := true;
end;

procedure  TfrmSpecEdit.ShowNaklrList;
var
  intTemp : integer;
  strIdTemp : string;
  dFrom,dTo : TDate;
begin
   { DONE :
Добавить ограничения на выбор расходных
(только для этого менеджера и допустим не старше 3 месяцев) }
  actApply.Execute;
  dsNakloEdit.DataSet.Edit;
  frmNaklrList := TfrmNaklrList.Create(self);
  frmNaklrList.ShowSravnPrice;
  //менеджер только этот
  frmNaklrList.setT.IDManager:= 0;
   // dsNakloEdit.dataset.fieldbyname('id_manager').asInteger;
  dFrom := IncMonth(dsNakloEdit.DataSet.FieldByName('dat').AsDateTime,-12);
  frmNaklrList.setT.DateFrom:=dFrom;
  dTo := IncMonth(dsNakloEdit.DataSet.FieldByName('dat').asDateTime,12);
  frmNaklrList.setT.DateTo:=dTo;
  frmNaklrList.ProcessSettings;
  frmNaklrList.DefaultOpen;

  if not frmNaklrList.Locate(
   dsNakloEdit.Dataset.FieldByName('parent_id_nakl').asInteger) then begin
//  ShowMessage('Указанная накладная не была найдена в списке.'+
//  ' Возможной причиной является период времени за который отбражаются накладные');
  end;
  intTemp := frmNaklrList.GetSchet;
  strIdTemp := frmNaklrList.qeNaklr.Query.FieldByName('id').asString;
  frmNaklrList.Free;
  if (intTemp <>0) then begin
    dsNakloEdit.Dataset.FieldByName('parent_id_nakl').asInteger := intTemp;
    dsNakloEdit.Dataset.FieldByName('parent_id').asString := strIdTemp;

  end;
end;

end.
