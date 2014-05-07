unit ReysSprEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls,
  DB, ActnList, Buttons,
  DBClient, ExtCtrls, DBCtrlsEh, DBLookupEh, DBGridEh,
  untSkladEdit, PropFilerEh, PropStorageEh;

type
  TfrmReysSprEdit = class(TForm)
    dbeNomerAvto: TDBEdit;
    Label1: TLabel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    ActionList1: TActionList;
    actOk: TAction;
    actCancel: TAction;
    dsSkladEdit: TDataSource;
    lcbPEREVOZCHIK: TDBLookupComboboxEh;
    Label3: TLabel;
    Label2: TLabel;
    dbeFIOVoditelya: TDBEdit;
    Label4: TLabel;
    rpsTovarEdit: TRegPropStorageManEh;
    PropStorageEh1: TPropStorageEh;
    Label5: TLabel;
    dbeNomerPritsepa: TDBEdit;
    dbePunktZagruzki: TDBEdit;
    dteDat: TDBDateTimeEditEh;
    Label6: TLabel;
    BitBtn1: TBitBtn;
    actVygruzka: TAction;
    dbcPokupatelPlatit: TDBCheckBoxEh;
    Label7: TLabel;
    dneCena: TDBNumberEditEh;
    Label8: TLabel;
    dbeComment: TDBEdit;
    dbeNomerPrav: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    dbeVidPerevozok: TDBEdit;
    procedure actOkExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actVygruzkaExecute(Sender: TObject);
  private
    function SaveChanges: boolean;
  public
    { Public declarations }
  end;

var
  frmReysSprEdit: TfrmReysSprEdit;

implementation
  uses AtsAssert,untRound, VygruzkaSpr;
{$R *.dfm}

procedure TfrmReysSprEdit.actOkExecute(Sender: TObject);
begin
  dsSkladEdit.DataSet.CheckBrowseMode;
	if ( ApplyOrCancel(dsSkladEdit.DataSet)) then begin
    ModalResult := mrOk;
  end;
end;

procedure TfrmReysSprEdit.actCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmReysSprEdit.FormClose(Sender: TObject;
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

procedure TfrmReysSprEdit.actVygruzkaExecute(Sender: TObject);
var
  VygruzkaSpr :TfrmVygruzkaSpr;
begin
  if not SaveChanges then exit;
  VygruzkaSpr := TfrmVygruzkaSpr.Create(Application);
  VygruzkaSpr.ShowVygruzkaForReys(dsSkladEdit.DataSet.FieldByName('id_reys').asInteger);
end;

function TfrmReysSprEdit.SaveChanges: boolean;
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
