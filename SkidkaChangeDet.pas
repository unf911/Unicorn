unit SkidkaChangeDet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ActnList, DB, DBCtrlsEh, Mask, DBLookupEh,
  DBClient, //TClientDataSet
  ATSAssert, PropStorageEh, DBGridEh, PropFilerEh  //assertinternal
  ;

type
  TfrmSkidkaChangeDet = class(TForm)
    dsNaklotEdit: TDataSource;
    ActionList1: TActionList;
    actCancel: TAction;
    actApply: TAction;
    actOk: TAction;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    lcbTovar: TDBLookupComboboxEh;
    Label2: TLabel;
    dneSkidka: TDBNumberEditEh;
    Label1: TLabel;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    Label12: TLabel;
    lcbSkidka: TDBLookupComboboxEh;
    procedure actOkExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actApplyExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lcbPriceEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
  private
    { Private declarations }
    iPosted : integer;
  public
    { Public declarations }
    function ShowDetail(posted:integer=0): integer;
  end;

var
  frmSkidkaChangeDet: TfrmSkidkaChangeDet;

implementation

uses untEx,
  SkidkaSpr  //TfrmSkidkaSpr
;

{$R *.dfm}

procedure TfrmSkidkaChangeDet.actOkExecute(Sender: TObject);
begin
  actApply.Execute;
  if  actApply.Checked then begin
    ModalResult := mrOk;
  end;
end;

procedure TfrmSkidkaChangeDet.actCancelExecute(Sender: TObject);
begin
  Close;
end;


procedure TfrmSkidkaChangeDet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if dsNaklotEdit.DataSet.State <> dsBrowse then begin
    dsNaklotEdit.DataSet.Cancel;
    ModalResult := mrCancel;
  end;
end;

procedure TfrmSkidkaChangeDet.actApplyExecute(Sender: TObject);
begin
  actApply.Checked := false;
	if dsNaklotEdit.DataSet.FieldByName('skidka_spr').IsNull then begin
		showmessage ('Заполните поле ''Скидка''');
		lcbSkidka.SetFocus;
		abort;
	end;
	if dsNaklotEdit.DataSet.FieldByName('tovar').IsNull then begin
		showmessage ('Заполните поле ''Товар''');
		lcbTovar.SetFocus;
		abort;
	end;
	if dsNaklotEdit.DataSet.FieldByName('skidka').IsNull  then begin
		showmessage ('Заполните поле ''% скидки''');
		dneSkidka.SetFocus;
		abort;
	end;
 	if (TClientDataSet(dsNaklotEdit.DataSet).ApplyUpdates(0)<>0) then begin
		TClientDataSet(dsNaklotEdit.DataSet).CancelUpdates;
		abort;
	end;
  actApply.Checked := true;
end;

function TfrmSkidkaChangeDet.ShowDetail(posted:integer=0): integer;
begin
 Result := 0; 
try
	dmdEx.StartWaiting;
	//1 - накладная была проведена. Блокируем кнопки отрезки
	iPosted:=posted;

	dmdEx.StopWaiting;
	Result := self.ShowModal;
except
	AssertInternal('28468321-6356-4EBC-B0DC-69B8852F07F3');
end;
end;

procedure TfrmSkidkaChangeDet.FormShow(Sender: TObject);
begin
  lcbSkidka.SetFocus;
end;

procedure TfrmSkidkaChangeDet.lcbPriceEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var
  iOid : integer;
  frmSkidkaSpr : TfrmSkidkaSpr;
begin
  frmSkidkaSpr := TfrmSkidkaSpr.Create(self);
  iOid := frmSkidkaSpr.ShowModalForInsert;
  lcbSkidka.KeyValue := iOid;
  Handled := true;
end;

end.
