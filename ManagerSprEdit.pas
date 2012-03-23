unit ManagerSprEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls,
  DB, ActnList, Buttons,
  DBClient, ExtCtrls, DBCtrlsEh, DBLookupEh, DBGridEh;

type
  TfrmManagerSprEdit = class(TForm)
    dbeName: TDBEdit;
    Label1: TLabel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    ActionList1: TActionList;
    actOk: TAction;
    actCancel: TAction;
    dsSkladEdit: TDataSource;
    dbcbDelmarked: TDBCheckBox;
    Label2: TLabel;
    dbeComment: TDBEdit;
    Label3: TLabel;
    dbeSignature: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    lcbPoidName: TDBLookupComboboxEh;
    lcbVisibleAreaName: TDBLookupComboboxEh;
    lcbDolgnost: TDBLookupComboboxEh;
    Label6: TLabel;
    procedure actOkExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lcbDolgnostEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure lcbDolgnostEditButtons1Click(Sender: TObject;
      var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManagerSprEdit: TfrmManagerSprEdit;

implementation
  uses AtsAssert,untRound, DolgnostSpr;
{$R *.dfm}

procedure TfrmManagerSprEdit.actOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmManagerSprEdit.actCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmManagerSprEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ModalResult = mrOk then begin
    PostAndApply(dsSkladEdit.DataSet);
  end else begin //if mrOk
    if (dsSkladEdit.DataSet.State <> dsBrowse) then begin
      dsSkladEdit.DataSet.Cancel;
    end;//if browse
  end; //if mrOk
end;

procedure TfrmManagerSprEdit.lcbDolgnostEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  TDBLookupComboboxEh(Sender).KeyValue := Null;
  handled := true;
end;

procedure TfrmManagerSprEdit.lcbDolgnostEditButtons1Click(Sender: TObject;
  var Handled: Boolean);
var
  iOid : integer;
  frmDolgnostSpr : TfrmDolgnostSpr;
begin
  frmDolgnostSpr := TfrmDolgnostSpr.Create(self);
  iOid := frmDolgnostSpr.ShowModalForInsert;
  TDBLookupComboboxEh(Sender).KeyValue := iOid;
  Handled := true;
end;

end.
