unit VozvratDet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ActnList, DB, DBCtrlsEh, Mask, DBLookupEh,
  DBClient, //TClientDataSet
  ATSAssert, PropStorageEh, DBGridEh, PropFilerEh, DBCtrls  //assertinternal
  ;

type
  TfrmVozvratDet = class(TForm)
    dsNaklotEdit: TDataSource;
    ActionList1: TActionList;
    actCancel: TAction;
    actApply: TAction;
    actOk: TAction;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    lcbTovar: TDBLookupComboboxEh;
    Label2: TLabel;
    Label5: TLabel;
    dneCena: TDBNumberEditEh;
    Label1: TLabel;
    dneSkidka: TDBNumberEditEh;
    Label3: TLabel;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    dneCenaNds: TDBNumberEditEh;
    Label4: TLabel;
    dneSuma: TDBNumberEditEh;
    Label6: TLabel;
    Label7: TLabel;
    dneSumaNds: TDBNumberEditEh;
    dbeKolotp: TDBEdit;
    procedure actOkExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actApplyExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lcdParentIdNaklDblClick(Sender: TObject);
    procedure lcdParentIdNaklKeyPress(Sender: TObject; var Key: Char);
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
  frmVozvratDet: TfrmVozvratDet;

implementation

uses untEx,
  untNaklrList
;

{$R *.dfm}

procedure TfrmVozvratDet.actOkExecute(Sender: TObject);
begin
  actApply.Execute;
  if  actApply.Checked then begin
    ModalResult := mrOk;
  end;
end;

procedure TfrmVozvratDet.actCancelExecute(Sender: TObject);
begin
  Close;
end;


procedure TfrmVozvratDet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if dsNaklotEdit.DataSet.State <> dsBrowse then begin
    dsNaklotEdit.DataSet.Cancel;
    ModalResult := mrCancel;
  end;
end;

procedure TfrmVozvratDet.actApplyExecute(Sender: TObject);
begin
  actApply.Checked := false;
	if dsNaklotEdit.DataSet.FieldByName('tovar').IsNull then begin
		showmessage ('Заполните поле ''Товар''');
		lcbTovar.SetFocus;
		abort;
	end;
	if (TClientDataSet(dsNaklotEdit.DataSet).ApplyUpdates(0)<>0) then begin
		TClientDataSet(dsNaklotEdit.DataSet).CancelUpdates;
    dsNaklotEdit.DataSet.Tag :=0;
		abort;
	end;
  actApply.Checked := true;
end;

function TfrmVozvratDet.ShowDetail(posted:integer=0): integer;
begin
 Result := 0; 
try
	dmdEx.StartWaiting;
	//1 - накладная была проведена. Блокируем кнопки отрезки
	iPosted:=posted;

	dmdEx.StopWaiting;
	Result := self.ShowModal;
except
	AssertInternal('FA5937EA-E5D2-4C65-999E-314926DCA1A2');
end;
end;

procedure TfrmVozvratDet.FormShow(Sender: TObject);
begin
  lcbTovar.SetFocus;
end;

procedure TfrmVozvratDet.lcdParentIdNaklDblClick(Sender: TObject);
begin
  ShowNaklrList;
end;

procedure TfrmVozvratDet.lcdParentIdNaklKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Ord(key) <> 13 then begin
    ShowNaklrList;
  end;
end;

procedure TfrmVozvratDet.ShowNaklrList;
var
  intTemp : integer;
  strIdTemp,sIzg,sZak : string;
  dFrom,dTo,dDate : TDate;
begin
   { DONE :
Добавить ограничения на выбор расходных
(только для этого менеджера и допустим не старше 3 месяцев) }
  actApply.Execute;
  dsNaklotEdit.DataSet.Edit;
  frmNaklrList := TfrmNaklrList.Create(self);
  frmNaklrList.ShowSpec;
  //менеджер только этот
  frmNaklrList.setT.IDManager:= 0;
   // dsNakloEdit.dataset.fieldbyname('id_manager').asInteger;
  dDate := TClientDataSet(dsNaklotEdit.DataSet).MasterSource.DataSet.FieldByName('dat').asDateTime;
  dFrom := IncMonth(dDate,-12);
  frmNaklrList.setT.DateFrom:=dFrom;
  dTo := IncMonth(dDate,12);
  frmNaklrList.setT.DateTo:=dTo;
   //фирма только эта
  sIzg := TClientDataSet(dsNaklotEdit.DataSet).MasterSource.DataSet.fieldbyname('id_izg').asString;
  frmNaklrList.qeNaklr.SetSql('where','id_izg='+sIzg,3);
  sZak := TClientDataSet(dsNaklotEdit.DataSet).MasterSource.DataSet.fieldbyname('id_zak').asString;
  frmNaklrList.qeNaklr.SetSql('where','id_zak='+sZak,4);
  frmNaklrList.qeNaklr.SetSql('where','posted=1',5);
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


procedure TfrmVozvratDet.lcdParentIdNaklEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  ShowNaklrList;
  Handled := true;
end;

procedure TfrmVozvratDet.lcbTovarKeyPress(Sender: TObject; var Key: Char);
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
