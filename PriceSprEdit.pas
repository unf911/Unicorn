unit PriceSprEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls,
  DB, ActnList, Buttons,
  DBClient, ExtCtrls, DBCtrlsEh, DBLookupEh, DBGridEh;

type
  TfrmPriceSprEdit = class(TForm)
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
    dbeComment: TDBEdit;
    dbcbIncludeNds: TDBCheckBox;
    procedure actOkExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPriceSprEdit: TfrmPriceSprEdit;

implementation
  uses AtsAssert,untRound;
{$R *.dfm}

procedure TfrmPriceSprEdit.actOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmPriceSprEdit.actCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmPriceSprEdit.FormClose(Sender: TObject;
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
