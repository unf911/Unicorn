unit SpecDet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ActnList, DB, DBCtrlsEh, Mask, DBLookupEh,
  DBClient, //TClientDataSet
  ATSAssert, PropStorageEh, DBGridEh, PropFilerEh  //assertinternal
  ;

type
  TfrmSpecDet = class(TForm)
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
    Label3: TLabel;
    dneSkidka: TDBNumberEditEh;
    dneCena: TDBNumberEditEh;
    Label1: TLabel;
    Label4: TLabel;
    dneCenaNds: TDBNumberEditEh;
    dneSuma: TDBNumberEditEh;
    Label6: TLabel;
    Label7: TLabel;
    dneSumaNds: TDBNumberEditEh;
    DBCheckBoxEh1: TDBCheckBoxEh;
    lcdParentIdNakl: TDBEditEh;
    Label12: TLabel;
    procedure actOkExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actApplyExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lcdParentIdNaklKeyPress(Sender: TObject; var Key: Char);
    procedure lcdParentIdNaklDblClick(Sender: TObject);
    procedure lcdParentIdNaklEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure lcbTovarKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    iPosted : integer;
    procedure ShowNaklrList;
  public
    { Public declarations }
    function ShowDetail(posted:integer=0): integer;
  end;

var
  frmSpecDet: TfrmSpecDet;

implementation

uses untEx, untNaklrList;

{$R *.dfm}

procedure TfrmSpecDet.actOkExecute(Sender: TObject);
begin
  actApply.Execute;
  if  actApply.Checked then begin
    ModalResult := mrOk;
  end;
end;

procedure TfrmSpecDet.actCancelExecute(Sender: TObject);
begin
  Close;
end;


procedure TfrmSpecDet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if dsNaklotEdit.DataSet.State <> dsBrowse then begin
    dsNaklotEdit.DataSet.Cancel;
    ModalResult := mrCancel;
  end;
end;

procedure TfrmSpecDet.actApplyExecute(Sender: TObject);
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

function TfrmSpecDet.ShowDetail(posted:integer=0): integer;
begin
 Result := 0; 
try
	dmdEx.StartWaiting;
	//1 - накладная была проведена. Блокируем кнопки отрезки
	iPosted:=posted;

	dmdEx.StopWaiting;
	Result := self.ShowModal;
except
	AssertInternal('23B3C461-E69D-45D2-9DFC-2963090EA6BC');
end;
end;

procedure TfrmSpecDet.FormShow(Sender: TObject);
begin
  lcbTovar.SetFocus;
end;

procedure TfrmSpecDet.lcdParentIdNaklKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Ord(key) <> 13 then begin
    ShowNaklrList;
  end;
end;

procedure TfrmSpecDet.lcdParentIdNaklDblClick(Sender: TObject);
begin
  ShowNaklrList;
end;

procedure TfrmSpecDet.ShowNaklrList;
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

procedure TfrmSpecDet.lcdParentIdNaklEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  ShowNaklrList;
  Handled := true;
end;

procedure TfrmSpecDet.lcbTovarKeyPress(Sender: TObject; var Key: Char);
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
