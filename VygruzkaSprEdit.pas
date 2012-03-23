unit VygruzkaSprEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls,
  DB, ActnList, Buttons,
  DBClient, ExtCtrls, DBCtrlsEh, DBLookupEh, DBGridEh,
  untSkladEdit, PropFilerEh, PropStorageEh;

type
  TfrmVygruzkaSprEdit = class(TForm)
    dbePunktVygruzki: TDBEdit;
    Label1: TLabel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    ActionList1: TActionList;
    actOk: TAction;
    actCancel: TAction;
    dsSkladEdit: TDataSource;
    rpsTovarEdit: TRegPropStorageManEh;
    PropStorageEh1: TPropStorageEh;
    dbcPokupatelPlatit: TDBCheckBoxEh;
    procedure actOkExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    function SaveChanges: boolean;
  public
    { Public declarations }
  end;

var
  frmVygruzkaSprEdit: TfrmVygruzkaSprEdit;

implementation
  uses AtsAssert,untRound;
{$R *.dfm}

procedure TfrmVygruzkaSprEdit.actOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmVygruzkaSprEdit.actCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmVygruzkaSprEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ModalResult=mrOk then begin
    SaveChanges;
  end else begin //if mrOk
    if (dsSkladEdit.DataSet.State <> dsBrowse) then begin
      dsSkladEdit.DataSet.Cancel;
    end;//if browse
  end; //if mrOk
end;

function TfrmVygruzkaSprEdit.SaveChanges: boolean;
begin
	Result := false;
try
  Result := true;
  dsSkladEdit.DataSet.CheckBrowseMode;
	if PostAndApply(dsSkladEdit.DataSet)<>0 then begin
    Result:=false;
    exit;
  end; //if PostAndApply(dsSkladEdit.DataSet)
except
  AssertInternal('5CBA1402-44D9-4D34-AA64-7BE8B7148043');
end
end;

end.
