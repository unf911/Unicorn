unit SkladSprEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls,
  DB, ActnList, Buttons,
  DBClient, ExtCtrls, DBCtrlsEh, DBLookupEh, DBGridEh,
  untSkladEdit, PropFilerEh, PropStorageEh, MemTableEh;

type
  TfrmSkladSprEdit = class(TForm)
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
    Label4: TLabel;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    rpsTovarEdit: TRegPropStorageManEh;
    PropStorageEh1: TPropStorageEh;
    procedure actOkExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSkladSprEdit: TfrmSkladSprEdit;

implementation
  uses AtsAssert,untRound;
{$R *.dfm}

procedure TfrmSkladSprEdit.actOkExecute(Sender: TObject);
begin
  dsSkladEdit.DataSet.CheckBrowseMode;
  if PostAndApply(dsSkladEdit.DataSet)=0 then begin
    ModalResult := mrOk;
  end;

  //ModalResult := mrOk;
end;

procedure TfrmSkladSprEdit.actCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSkladSprEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  TMemTableEh(dsSkladEdit.DataSet).CancelUpdates;
  dsSkladEdit.DataSet.Cancel;
{
  if ModalResult=mrOk then begin
    PostAndApply(dsSkladEdit.DataSet);
  end else begin //if mrOk
    if (dsSkladEdit.DataSet.State <> dsBrowse) then begin
      dsSkladEdit.DataSet.Cancel;
    end;//if browse
  end; //if mrOk
}  
end;

end.
