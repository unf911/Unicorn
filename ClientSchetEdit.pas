unit ClientSchetEdit;

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
	atsAssert, PropStorageEh, PropFilerEh, DBGridEh, DBCtrlsEh, DBLookupEh
    ;

type
  TfrmClientSchetEdit = class(TForm)
    ActionList1: TActionList;
    actOk: TAction;
    actCancel: TAction;
    dtsEdit: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    Label2: TLabel;
    dbeRS: TDBEdit;
    dbeMfo: TDBEdit;
    Label3: TLabel;
    Label8: TLabel;
    dbeBank: TDBEdit;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    Label1: TLabel;
    dlcCurrency: TDBLookupComboboxEh;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    cbxFirm: TCheckBox;
    Label5: TLabel;
    dlcManager: TDBLookupComboboxEh;
    procedure actOkExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure DBLookupComboboxEh1EditButtons0Click(Sender: TObject;
      var Handled: Boolean);

  private
    { Private declarations }
    //TipChanged : boolean ;  //flag = true когда изменили тип клиента
    function qurClientApplyUpdates:boolean;
  public
    { Public declarations }
  end;

var
  frmClientSchetEdit: TfrmClientSchetEdit;

implementation

{$R *.dfm}

procedure TfrmClientSchetEdit.actOkExecute(Sender: TObject);
begin
  if qurClientApplyUpdates then begin
    ModalResult := mrOk;
  end;
end;

procedure TfrmClientSchetEdit.actCancelExecute(Sender: TObject);
begin
  dtsEdit.DataSet.Cancel;
	CancelUpdates(dtsEdit.DataSet);
  ModalResult := mrCancel;
end;

procedure TfrmClientSchetEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  dmdM.qurClient.Cancel;
  actCancel.Execute;
  Action := caFree;
end;

function TfrmClientSchetEdit.qurClientApplyUpdates: boolean;
begin
//	Result := false;
//	if PostAndApply(dsEdit.DataSet)=0 then begin
  dtsEdit.DataSet.Post;
  if TClientDataSet(dtsEdit.DataSet).ChangeCount>0 then begin
    TClientDataSet(dtsEdit.DataSet).ApplyUpdates(0)
  end;
	Result := true;
//	end;
end;

procedure TfrmClientSchetEdit.FormShow(Sender: TObject);
begin
  {Нельзя менять валюту у существующего счёта, но можно
  создать новый счёт}
  dlcCurrency.Enabled:=true;
  if dtsEdit.Dataset.State=dsEdit then begin
    dlcCurrency.Enabled:=false;
  end;
end;

procedure TfrmClientSchetEdit.DBLookupComboboxEh1EditButtons0Click(
  Sender: TObject; var Handled: Boolean);
begin
  dlcManager.KeyValue := null;
  Handled := true;
end;

end.
