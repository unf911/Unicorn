unit untSkladEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls,
  DB, ActnList, Buttons,
  DBClient, ExtCtrls, DBCtrlsEh, DBLookupEh, DBGridEh;

type
  TfrmSkladEdit = class(TForm)
    dbeName: TDBEdit;
    Label1: TLabel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    ActionList1: TActionList;
    actOk: TAction;
    actCancel: TAction;
    dsSkladEdit: TDataSource;
    dbcbDelmarked: TDBCheckBox;
    lcbMANAGER: TDBLookupComboboxEh;
    Label3: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    procedure actOkExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSkladEdit: TfrmSkladEdit;

implementation
  uses AtsAssert,untRound;
{$R *.dfm}

procedure TfrmSkladEdit.actOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSkladEdit.actCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSkladEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ModalResult=mrOk then begin
    PostAndApply(dsSkladEdit.DataSet);
  end else begin //if mrOk
    if (dsSkladEdit.DataSet.State <> dsBrowse) then begin
      dsSkladEdit.DataSet.Cancel;
    end;//if browse
  end; //if mrOk
end;

end.
