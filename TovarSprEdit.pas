unit TovarSprEdit;

interface

uses
  Windows, Messages, SysUtils, Variants,
  Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls,
  DB, ActnList, Buttons,
  DBClient, ExtCtrls, DBCtrlsEh,
  untEx, DBLookupEh, PropStorageEh, DBGridEh, PropFilerEh;

type
  TfrmTovarSprEdit = class(TForm)
    dbeName: TDBEdit;
    dbeEdizm: TDBEdit;
    Label1: TLabel;
    Label4: TLabel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    ActionList1: TActionList;
    actOk: TAction;
    actCancel: TAction;
    dsTovarEdit: TDataSource;
    dbrgTipTara: TDBRadioGroup;
    dbcbDelmarked: TDBCheckBox;
    Label8: TLabel;
    dblIdAnalog: TDBLookupComboboxEh;
    dbcSkladskaya: TDBCheckBoxEh;
    dbeWeight: TDBEdit;
    Label9: TLabel;
    dbeFullName: TDBEdit;
    Label10: TLabel;
    rpsTovarEdit: TRegPropStorageManEh;
    PropStorageEh1: TPropStorageEh;
    dbeGruppa1: TDBEdit;
    Label11: TLabel;
    dbnGruppa2: TDBNumberEditEh;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    dbnGruppa3: TDBNumberEditEh;
    dbnGruppa4: TDBNumberEditEh;
    dbeCopperPerKm: TDBNumberEditEh;
    Label15: TLabel;
    actShowMainAnalog: TAction;
    dsMainAnalog: TDataSource;
    Label16: TLabel;
    dbeKodVed: TDBEdit;
    dblEdiz: TDBLookupComboboxEh;
    Label17: TLabel;
    dsEdiz: TDataSource;
    DBCheckBox1: TDBCheckBox;
    Label2: TLabel;
    dbeKodUsl: TDBEdit;
    procedure actOkExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTovarSprEdit: TfrmTovarSprEdit;

implementation
  uses AtsAssert,untRound;
{$R *.dfm}

procedure TfrmTovarSprEdit.actOkExecute(Sender: TObject);
begin
  dsTovarEdit.DataSet.CheckBrowseMode;
  if PostAndApply(dsTovarEdit.DataSet)=0 then begin
//	if ( ApplyOrCancel(dsTovarEdit.DataSet)) then begin
    ModalResult := mrOk;
  end;
end;

procedure TfrmTovarSprEdit.actCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmTovarSprEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  TClientDataset(dsTovarEdit.DataSet).CancelUpdates;
  dsTovarEdit.DataSet.Cancel;
end;

end.
