unit UslPostavkaChangeDet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ActnList, DB, DBCtrlsEh, Mask, DBLookupEh,
  DBClient, //TClientDataSet
  ATSAssert, PropStorageEh, DBGridEh, PropFilerEh  //assertinternal
  ;

type
  TfrmUslPostavkaChangeDet = class(TForm)
    dsNaklotEdit: TDataSource;
    ActionList1: TActionList;
    actCancel: TAction;
    actApply: TAction;
    actOk: TAction;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    lcbTovar: TDBLookupComboboxEh;
    Label2: TLabel;
    dneTransport: TDBNumberEditEh;
    Label1: TLabel;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    Label12: TLabel;
    lcbSkidka: TDBLookupComboboxEh;
    dneTara: TDBNumberEditEh;
    dneValuta: TDBNumberEditEh;
    dneTamognya: TDBNumberEditEh;
    dneProcentPredopl: TDBNumberEditEh;
    dneOtsrochka: TDBNumberEditEh;
    DBNumberEditEh6: TDBNumberEditEh;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
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
  frmUslPostavkaChangeDet: TfrmUslPostavkaChangeDet;

implementation

uses untEx,
  UslPostavkaSpr  //TfrmUslPostavkaSpr
;

{$R *.dfm}

procedure TfrmUslPostavkaChangeDet.actOkExecute(Sender: TObject);
begin
  actApply.Execute;
  if  actApply.Checked then begin
    ModalResult := mrOk;
  end;
end;

procedure TfrmUslPostavkaChangeDet.actCancelExecute(Sender: TObject);
begin
  Close;
end;


procedure TfrmUslPostavkaChangeDet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if dsNaklotEdit.DataSet.State <> dsBrowse then begin
    dsNaklotEdit.DataSet.Cancel;
    ModalResult := mrCancel;
  end;
end;

procedure TfrmUslPostavkaChangeDet.actApplyExecute(Sender: TObject);
begin
  actApply.Checked := false;
	if dsNaklotEdit.DataSet.FieldByName('usl_postavka').IsNull then begin
		showmessage ('Заполните поле ''Условия поставки''');
		lcbSkidka.SetFocus;
		abort;
	end;
	if dsNaklotEdit.DataSet.FieldByName('tovar').IsNull then begin
		showmessage ('Заполните поле ''Товар''');
		lcbTovar.SetFocus;
		abort;
	end;
  {
	if dsNaklotEdit.DataSet.FieldByName('skidka').IsNull  then begin
		showmessage ('Заполните поле ''% скидки''');
		dneSkidka.SetFocus;
		abort;
	end;
  }
 	if (TClientDataSet(dsNaklotEdit.DataSet).ApplyUpdates(0)<>0) then begin
		TClientDataSet(dsNaklotEdit.DataSet).CancelUpdates;
		abort;
	end;
  actApply.Checked := true;
end;

function TfrmUslPostavkaChangeDet.ShowDetail(posted:integer=0): integer;
begin
 Result := 0; 
try
	dmdEx.StartWaiting;
	//1 - накладная была проведена. Блокируем кнопки отрезки
	iPosted:=posted;

	dmdEx.StopWaiting;
	Result := self.ShowModal;
except
	AssertInternal('CDDDBB5C-82D3-4A79-A0C7-2E262C24BDD8');
end;
end;

procedure TfrmUslPostavkaChangeDet.FormShow(Sender: TObject);
begin
  lcbSkidka.SetFocus;
end;

procedure TfrmUslPostavkaChangeDet.lcbPriceEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var
  iOid : integer;
  frmSpr : TfrmUslPostavkaSpr;
begin
  frmSpr := TfrmUslPostavkaSpr.Create(self);
  iOid := frmSpr.ShowModalForInsert;
  lcbSkidka.KeyValue := iOid;
  Handled := true;
end;

end.
