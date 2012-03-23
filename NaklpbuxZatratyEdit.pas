unit NaklpBuxZatratyEdit;

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
  ClientSchet, DBCtrlsEh,
  DBLookupEh,//tfrmClientSchet
  Statya, DBGridEh, PropFilerEh //TfrmStatya
    ;

type
  TfrmNaklpBuxZatratyEdit = class(TForm)
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
    Label10: TLabel;
    lcbZak: TDBLookupComboboxEh;
    Label5: TLabel;
    lcbCurrency: TDBLookupComboboxEh;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    dbeNalogNds: TDBNumberEditEh;
    Label6: TLabel;
    dbeZatraty: TDBNumberEditEh;
    Label9: TLabel;
    lcbStatya: TDBLookupComboboxEh;
    procedure actOkExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actApplyExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lcbStatyaEditButtons1Click(Sender: TObject;
      var Handled: Boolean);
    procedure lcbStatyaEditButtons0Click(Sender: TObject;
      var Handled: Boolean);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNaklpBuxZatratyEdit: TfrmNaklpBuxZatratyEdit;

implementation

uses untNaklrList;

{$R *.dfm}

procedure TfrmNaklpBuxZatratyEdit.actOkExecute(Sender: TObject);
begin
  actApply.Execute;
  if  actApply.Checked then begin
    ModalResult := mrOk;
  end;
end;

procedure TfrmNaklpBuxZatratyEdit.actCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmNaklpBuxZatratyEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if dsNakloEdit.DataSet.State <> dsBrowse then begin
    dsNakloEdit.DataSet.Cancel;
    ModalResult := mrCancel;
  end;
end; 


procedure TfrmNaklpBuxZatratyEdit.actApplyExecute(Sender: TObject);
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

procedure TfrmNaklpBuxZatratyEdit.FormShow(Sender: TObject);
begin
//
end;


procedure TfrmNaklpBuxZatratyEdit.lcbStatyaEditButtons1Click(
  Sender: TObject; var Handled: Boolean);
var
  iOid : integer;
begin
  frmStatya := TfrmStatya.Create(self);
  iOid := frmStatya.ShowModalForInsert;
  lcbStatya.KeyValue := iOid;
  Handled := true;
end;

procedure TfrmNaklpBuxZatratyEdit.lcbStatyaEditButtons0Click(
  Sender: TObject; var Handled: Boolean);
begin
  lcbStatya.KeyValue  := Null;
  handled := true;
end;

end.
