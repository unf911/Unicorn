unit CurrencyEdit;

interface

uses
  Windows, Messages, SysUtils, Variants,
  Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls,
  DB, ActnList, Buttons,
  DBClient, ExtCtrls, DBCtrlsEh,
  untEx, DBLookupEh;

type
  TfrmCurrencyEdit = class(TForm)
    dbeName: TDBEdit;
    Label1: TLabel;
    BtnOk: TBitBtn;
    btnCancel: TBitBtn;
    dbcbDelmarked: TDBCheckBox;
    dbeFullName: TDBEdit;
    Label9: TLabel;
    dsTovarEdit: TDataSource;
    ActionList1: TActionList;
    actOk: TAction;
    actCancel: TAction;
    procedure actOkExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCurrencyEdit: TfrmCurrencyEdit;

implementation
  uses AtsAssert,untRound;
{$R *.dfm}

procedure TfrmCurrencyEdit.actOkExecute(Sender: TObject);
begin
  //dsTovarEdit.DataSet.CheckBrowseMode;
	//if ( ApplyOrCancel(dsTovarEdit.DataSet)) then begin
  ModalResult := mrOk;
  //end;
end;

procedure TfrmCurrencyEdit.actCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmCurrencyEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ModalResult=mrOk then begin
    PostAndApply(dsTovarEdit.DataSet);
  end else begin //if mrOk
    if dsTovarEdit.DataSet.State <> dsBrowse then begin
      dsTovarEdit.DataSet.Cancel;
    end;//if browse
  end; //if mrOk
end;

end.
