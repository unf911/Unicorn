unit NaklPeremBuxDet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ActnList, DB, DBCtrlsEh, Mask, DBLookupEh,
  DBClient, //TClientDataSet
  ATSAssert, PropStorageEh, DBGridEh, PropFilerEh  //assertinternal
  ;

type
  TfrmNaklPeremBuxDet = class(TForm)
    dsNaklotEdit: TDataSource;
    ActionList1: TActionList;
    actCancel: TAction;
    actApply: TAction;
    actOk: TAction;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    lcbTovar: TDBLookupComboboxEh;
    Label2: TLabel;
    Label5: TLabel;
    dneKolotp: TDBNumberEditEh;
    procedure actOkExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actApplyExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lcdParentIdNaklKeyPress(Sender: TObject; var Key: Char);
    procedure lcdParentIdNaklDblClick(Sender: TObject);
    procedure lcdParentIdNaklEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    iPosted : integer;
    procedure ShowNaklrList;
  public
    { Public declarations }
    function ShowDetail(posted:integer=0): integer;
  end;

var
  frmNaklPeremBuxDet: TfrmNaklPeremBuxDet;

implementation

uses untEx, untNaklrList;

{$R *.dfm}

procedure TfrmNaklPeremBuxDet.actOkExecute(Sender: TObject);
begin
  actApply.Execute;
  if  actApply.Checked then begin
    ModalResult := mrOk;
  end;
end;

procedure TfrmNaklPeremBuxDet.actCancelExecute(Sender: TObject);
begin
  Close;
end;


procedure TfrmNaklPeremBuxDet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if dsNaklotEdit.DataSet.State <> dsBrowse then begin
    dsNaklotEdit.DataSet.Cancel;
    ModalResult := mrCancel;
  end;
end;

procedure TfrmNaklPeremBuxDet.actApplyExecute(Sender: TObject);
begin
  actApply.Checked := false;
	if dsNaklotEdit.DataSet.FieldByName('tovar').IsNull then begin
		showmessage ('Заполните поле ''Товар''');
		lcbTovar.SetFocus;
		abort;
	end;
	if (TClientDataSet(dsNaklotEdit.DataSet).ApplyUpdates(0)<>0) then begin
		TClientDataSet(dsNaklotEdit.DataSet).CancelUpdates;
		abort;
	end;
  actApply.Checked := true;
end;

function TfrmNaklPeremBuxDet.ShowDetail(posted:integer=0): integer;
begin
 Result := 0; 
try
	dmdEx.StartWaiting;
	//1 - накладная была проведена. Блокируем кнопки отрезки
	iPosted:=posted;

	dmdEx.StopWaiting;
	Result := self.ShowModal;
except
	AssertInternal('6F818759-D397-4FFD-B615-AC524CCCD24E');
end;
end;

procedure TfrmNaklPeremBuxDet.FormShow(Sender: TObject);
begin
  lcbTovar.SetFocus;
end;

procedure TfrmNaklPeremBuxDet.lcdParentIdNaklKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Ord(key) <> 13 then begin
    ShowNaklrList;
  end;
end;

procedure TfrmNaklPeremBuxDet.lcdParentIdNaklDblClick(Sender: TObject);
begin
  ShowNaklrList;
end;

procedure TfrmNaklPeremBuxDet.ShowNaklrList;
var
  intTemp : integer;
  strIdTemp : string;
  dFrom,dTo,dDate : TDate;
begin
   { DONE :
Добавить ограничения на выбор расходных
(только для этого менеджера и допустим не старше 3 месяцев) }
  actApply.Execute;
  dsNaklotEdit.DataSet.Edit;
  frmNaklrList := TfrmNaklrList.Create(self);
  frmNaklrList.ShowSravnPrice;
  //менеджер только этот
  frmNaklrList.setT.IDManager:= 0;
  dDate := TClientDataSet(dsNaklotEdit.DataSet).MasterSource.DataSet.FieldByName('dat').asDateTime;
  dFrom := IncMonth(dDate,-12);
  frmNaklrList.setT.DateFrom:=dFrom;
  dTo := IncMonth(dDate,12);
  frmNaklrList.setT.DateTo:=dTo;
   //фирма только эта
  frmNaklrList.ProcessSettings;
  frmNaklrList.DefaultOpen;

  if not frmNaklrList.Locate(
    dsNaklotEdit.Dataset.FieldByName('id_sebest').asInteger) then begin
//  ShowMessage('Указанная накладная не была найдена в списке.'+
//  ' Возможной причиной является период времени за который отбражаются накладные');
  end;
  intTemp := frmNaklrList.GetSchet;
  strIdTemp := frmNaklrList.qeNaklr.Query.FieldByName('id').asString;
  frmNaklrList.Free;
  if (intTemp <>0) then begin
    dsNaklotEdit.Dataset.FieldByName('id_sebest').asInteger := intTemp;
    dsNaklotEdit.Dataset.FieldByName('parent_id').asString := strIdTemp;
  end;
end;

procedure TfrmNaklPeremBuxDet.lcdParentIdNaklEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  ShowNaklrList;
  Handled := true;
end;

procedure TfrmNaklPeremBuxDet.FormCreate(Sender: TObject);
begin
  PropStorageEh1.Section := self.Name;
  PropStorageEh1.Active := true;
end;

end.
