unit EdizSprEdit;

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
  TfrmEdizSprEdit = class(TForm)
    ActionList1: TActionList;
    actOk: TAction;
    actCancel: TAction;
    dtsEdit: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    Label2: TLabel;
    dbeKod: TDBEdit;
    dbeFullname: TDBEdit;
    Label3: TLabel;
    Label8: TLabel;
    dbeName: TDBEdit;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    dbeOid: TDBEdit;
    Label4: TLabel;
    dbcbDelmarked: TDBCheckBox;
    procedure actOkExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    //TipChanged : boolean ;  //flag = true когда изменили тип клиента
    function qurClientApplyUpdates:boolean;
  public
    { Public declarations }
  end;

var
  frmEdizSprEdit: TfrmEdizSprEdit;

implementation

{$R *.dfm}

procedure TfrmEdizSprEdit.actOkExecute(Sender: TObject);
begin
  if qurClientApplyUpdates then begin
    ModalResult := mrOk;
  end;
end;

procedure TfrmEdizSprEdit.actCancelExecute(Sender: TObject);
begin
  dtsEdit.DataSet.Cancel;
	CancelUpdates(dtsEdit.DataSet);
  ModalResult := mrCancel;
end;

procedure TfrmEdizSprEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  dmdM.qurClient.Cancel;
  actCancel.Execute;
  Action := caFree;
end;

function TfrmEdizSprEdit.qurClientApplyUpdates: boolean;
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

end.
