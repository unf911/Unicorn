unit DogovorEdit;

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
	atsAssert, PropStorageEh, PropFilerEh, DBCtrlsEh, DBGridEh, DBLookupEh
    ;

type
  TfrmDogovorEdit = class(TForm)
    ActionList1: TActionList;
    actOk: TAction;
    actCancel: TAction;
    dsEdit: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    Label2: TLabel;
    dbeID: TDBEdit;
    Label8: TLabel;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    dbcbDelmarked: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    dbePredmet: TDBEdit;
    Label1: TLabel;
    dbeAdres: TDBEdit;
    Label3: TLabel;
    lcbContact: TDBLookupComboboxEh;
    Label5: TLabel;
    Label4: TLabel;
    dbeTipDogovora: TDBEdit;
    procedure actOkExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure lcbContactEditButtons0Click(Sender: TObject;
      var Handled: Boolean);

  private
    { Private declarations }
    //TipChanged : boolean ;  //flag = true когда изменили тип клиента
    function qurClientApplyUpdates:boolean;
  public
    { Public declarations }
  end;

var
  frmDogovorEdit: TfrmDogovorEdit;

implementation

{$R *.dfm}

procedure TfrmDogovorEdit.actOkExecute(Sender: TObject);
begin
  if qurClientApplyUpdates then begin
    ModalResult := mrOk;
  end;
end;

procedure TfrmDogovorEdit.actCancelExecute(Sender: TObject);
begin
  dsEdit.DataSet.Cancel;
	CancelUpdates(dsEdit.DataSet);
  ModalResult := mrCancel;
end;

procedure TfrmDogovorEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  actCancel.Execute;
end;

function TfrmDogovorEdit.qurClientApplyUpdates: boolean;
begin
  dsEdit.DataSet.Post;
  if TClientDataSet(dsEdit.DataSet).ChangeCount>0 then begin
    TClientDataSet(dsEdit.DataSet).ApplyUpdates(0)
  end;
	Result := true;
end;

procedure TfrmDogovorEdit.FormShow(Sender: TObject);
begin
  dbeID.SetFocus;
end;

procedure TfrmDogovorEdit.lcbContactEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  lcbContact.KeyValue := Null;
  handled := true;
end;





end.
