unit PriceChangeDet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ActnList, DB, DBCtrlsEh, Mask, DBLookupEh,
  DBClient, //TClientDataSet
  ATSAssert, PropStorageEh, DBGridEh, PropFilerEh  //assertinternal
  ;

type
  TfrmPriceChangeDet = class(TForm)
    dsNaklotEdit: TDataSource;
    ActionList1: TActionList;
    actCancel: TAction;
    actApply: TAction;
    actOk: TAction;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    lcbTovar: TDBLookupComboboxEh;
    Label2: TLabel;
    dneCena: TDBNumberEditEh;
    Label1: TLabel;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    Label12: TLabel;
    lcbPrice: TDBLookupComboboxEh;
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
  frmPriceChangeDet: TfrmPriceChangeDet;

implementation

uses untEx,
  PriceSpr  //TfrmPriceSpr
;

{$R *.dfm}

procedure TfrmPriceChangeDet.actOkExecute(Sender: TObject);
begin
  actApply.Execute;
  if  actApply.Checked then begin
    ModalResult := mrOk;
  end;
end;

procedure TfrmPriceChangeDet.actCancelExecute(Sender: TObject);
begin
  Close;
end;


procedure TfrmPriceChangeDet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if dsNaklotEdit.DataSet.State <> dsBrowse then begin
    dsNaklotEdit.DataSet.Cancel;
    ModalResult := mrCancel;
  end;
end;

procedure TfrmPriceChangeDet.actApplyExecute(Sender: TObject);
begin
  actApply.Checked := false;
	if dsNaklotEdit.DataSet.FieldByName('price').IsNull then begin
		showmessage ('Заполните поле ''Прайс''');
		lcbPrice.SetFocus;
		abort;
	end;
	if dsNaklotEdit.DataSet.FieldByName('tovar').IsNull then begin
		showmessage ('Заполните поле ''Товар''');
		lcbTovar.SetFocus;
		abort;
	end;
	if dsNaklotEdit.DataSet.FieldByName('cena').asFloat<0 then begin
		showmessage ('Цена не может быть отрацательной');
		dneCena.SetFocus;
		abort;
	end;
	if (TClientDataSet(dsNaklotEdit.DataSet).ApplyUpdates(0)<>0) then begin
		TClientDataSet(dsNaklotEdit.DataSet).CancelUpdates;
		abort;
	end;
  actApply.Checked := true;
end;

function TfrmPriceChangeDet.ShowDetail(posted:integer=0): integer;
begin
 Result := 0; 
try
	dmdEx.StartWaiting;
	//1 - накладная была проведена. Блокируем кнопки отрезки
	iPosted:=posted;

	dmdEx.StopWaiting;
	Result := self.ShowModal;
except
	AssertInternal('984477C3-843A-4CF6-B073-D485AE267234');
end;
end;

procedure TfrmPriceChangeDet.FormShow(Sender: TObject);
begin
  lcbPrice.SetFocus;
end;

procedure TfrmPriceChangeDet.lcbPriceEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var
  iOid : integer;
  frmPrice : TfrmPriceSpr;
begin
  frmPrice := TfrmPriceSpr.Create(self);
  iOid := frmPrice.ShowModalForInsert;
  lcbPrice.KeyValue := iOid;
  Handled := true;
end;

end.
