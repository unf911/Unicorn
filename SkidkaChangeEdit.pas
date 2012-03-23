unit SkidkaChangeEdit;

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
  PropFilerEh //tfrmClientSchet
    ;

type
  TfrmSkidkaChangeEdit = class(TForm)
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    dbeIDNAKL: TDBEditEh;
    lcbMANAGER: TDBLookupComboboxEh;
    dbeComment: TDBEdit;
    dbeID: TDBEditEh;
    dteDat: TDBDateTimeEditEh;
    ActionList1: TActionList;
    actCancel: TAction;
    actApply: TAction;
    actOk: TAction;
    dsNakloEdit: TDataSource;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    lcbSkidka: TDBLookupComboboxEh;
    Label1: TLabel;
    procedure actOkExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actApplyExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBLookupComboboxEh1EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure lcbPriceEditButtons1Click(Sender: TObject;
      var Handled: Boolean);

  private
    { Private declarations }
    //Semaphore : boolean;
  public
    { Public declarations }
  end;

var
  frmSkidkaChangeEdit: TfrmSkidkaChangeEdit;

implementation

uses  untEx,
  SkidkaSpr //TfrmSkidkaSpr
;


{$R *.dfm}

procedure TfrmSkidkaChangeEdit.actOkExecute(Sender: TObject);
begin
  actApply.Execute;
  if  actApply.Checked then begin
    ModalResult := mrOk;
  end;
end;

procedure TfrmSkidkaChangeEdit.actCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmSkidkaChangeEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if dsNakloEdit.DataSet.State <> dsBrowse then begin
    dsNakloEdit.DataSet.Cancel;
    ModalResult := mrCancel;
  end;
end; 


procedure TfrmSkidkaChangeEdit.actApplyExecute(Sender: TObject);
begin
  actApply.Checked := false;
	if dsNakloEdit.DataSet.FieldByName('dat').IsNull then begin
		showmessage ('Заполните поле ''Дата''');
		dteDat.SetFocus;
		abort;
	end;
	if dsNakloEdit.DataSet.FieldByName('manager').IsNull then begin
		showmessage ('Заполните поле ''Менеджер''');
		lcbMANAGER.SetFocus;
		abort;
	end;
	if dsNakloEdit.DataSet.FieldByName('skidka').IsNull then begin
		showmessage ('Заполните поле ''Скидка по умолчанию''');
		lcbSkidka.SetFocus;
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

procedure TfrmSkidkaChangeEdit.FormShow(Sender: TObject);
begin
  dbeId.SetFocus;
  lcbSkidka.Update;
end;


procedure TfrmSkidkaChangeEdit.DBLookupComboboxEh1EditButtons0Click(
  Sender: TObject; var Handled: Boolean);
begin
  lcbSkidka.KeyValue := null;
  Handled := true;
end;

procedure TfrmSkidkaChangeEdit.lcbPriceEditButtons1Click(Sender: TObject;
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
