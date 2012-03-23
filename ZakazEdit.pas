
unit ZakazEdit;

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
  ClientSchet, //tfrmClientSchet
  DBCtrlsEh, DBLookupEh,
  DBGridEh, PropFilerEh 
    ;

type
  TfrmZakazEdit = class(TForm)
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label8: TLabel;
    Label13: TLabel;
    dbeIDNAKL: TDBEditEh;
    dbeComment: TDBEdit;
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
    Label3: TLabel;
    lcbMANAGER: TDBLookupComboboxEh;
    Label2: TLabel;
    lcbManagerSnab: TDBLookupComboboxEh;
    rpsClientEdit: TRegPropStorageManEh;
    PropStorageEh1: TPropStorageEh;
    procedure actOkExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actApplyExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBLookupComboboxEh1EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure lcbIZGKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
    //TipChanged : boolean ;  //flag = true когда изменили тип клиента

  public
    { Public declarations }
  end;

var
  frmZakazEdit: TfrmZakazEdit;

implementation

{$R *.dfm}

procedure TfrmZakazEdit.actOkExecute(Sender: TObject);
begin
  actApply.Execute;
  if  actApply.Checked then begin
    ModalResult := mrOk;
  end;
end;

procedure TfrmZakazEdit.actCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmZakazEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if dsNakloEdit.DataSet.State <> dsBrowse then begin
    dsNakloEdit.DataSet.Cancel;
    ModalResult := mrCancel;
  end;
end;



procedure TfrmZakazEdit.actApplyExecute(Sender: TObject);
begin
  actApply.Checked := false;
	if dsNakloEdit.DataSet.FieldByName('dat').IsNull then begin
		showmessage ('Заполните поле ''Дата''');
		dteDat.SetFocus;
		abort;
	end;
	if dsNakloEdit.DataSet.FieldByName('zak').IsNull then begin
		showmessage ('Заполните поле ''Получатель''');
		lcbIZG.SetFocus;
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

procedure TfrmZakazEdit.FormCreate(Sender: TObject);
begin
  PropStorageEh1.Section := self.ClassName;
  PropStorageEh1.LoadProperties;
  PropStorageEh1.Active := true;
end;

procedure TfrmZakazEdit.DBLookupComboboxEh1EditButtons0Click(
  Sender: TObject; var Handled: Boolean);
begin
  lcbManagerSnab.KeyValue := null;
  Handled := true;
end;

procedure TfrmZakazEdit.FormShow(Sender: TObject);
begin
  self.ActiveControl := lcbIzg;
end;

procedure TfrmZakazEdit.lcbIZGKeyPress(Sender: TObject; var Key: Char);
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
