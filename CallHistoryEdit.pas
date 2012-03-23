unit CallHistoryEdit;

interface

uses
  Windows, Messages, SysUtils, Variants,
  Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls,
  DB, ActnList, Buttons,
  DBClient, ExtCtrls, DBCtrlsEh,
  untEx, DBLookupEh, PropStorageEh,
  FMTBcd, Provider, SqlExpr,
  AutoPnl,
  Reason, //TfrmReason
  Result, DBGridEh, PropFilerEh //TfrmResult
  ;

type
  TfrmCallHistoryEdit = class(TForm)
    ActionList1: TActionList;
    actOk: TAction;
    actCancel: TAction;
    dsEdit: TDataSource;
    rpsTovarEdit: TRegPropStorageManEh;
    PropStorageEh1: TPropStorageEh;
    SQLDataSet1: TSQLDataSet;
    cdsContacts: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    AutoPanel1: TAutoPanel;
    Label1: TLabel;
    lcbSkladTo: TDBLookupComboboxEh;
    Label5: TLabel;
    Label4: TLabel;
    dteDat: TDBDateTimeEditEh;
    Label12: TLabel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    lcbReason: TDBLookupComboboxEh;
    Label10: TLabel;
    lcbResult: TDBLookupComboboxEh;
    DBEditEh1: TDBEditEh;
    procedure actOkExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lcbSkladToEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure lcbSkladToEditButtons1Click(Sender: TObject;
      var Handled: Boolean);
    procedure cdsContactsAfterInsert(DataSet: TDataSet);
    procedure cdsContactsBeforePost(DataSet: TDataSet);
    procedure lcbReasonEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure lcbReasonEditButtons1Click(Sender: TObject;
      var Handled: Boolean);
    procedure lcbResultEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure lcbResultEditButtons1Click(Sender: TObject;
      var Handled: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    frmResult : TfrmResult;
    frmReason : TfrmReason;
  public
    { Public declarations }
  end;

var
  frmCallHistoryEdit: TfrmCallHistoryEdit;

implementation
  uses AtsAssert,untRound;
{$R *.dfm}

procedure TfrmCallHistoryEdit.actOkExecute(Sender: TObject);
begin
  dsEdit.DataSet.CheckBrowseMode;
	if ( ApplyOrCancel(dsEdit.DataSet)) then begin
    ModalResult := mrOk;
  end;
end;

procedure TfrmCallHistoryEdit.actCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmCallHistoryEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dsEdit.DataSet.Cancel;
end;

procedure TfrmCallHistoryEdit.lcbSkladToEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  lcbSkladTo.KeyValue := Null;
  handled := true;
end;

procedure TfrmCallHistoryEdit.lcbSkladToEditButtons1Click(Sender: TObject;
  var Handled: Boolean);
//var
//  iOid : integer;
begin
{
  frmDolgnost := TfrmDolgnost.Create(self);
  iOid := frmDolgnost.ShowModalForInsert;
  lcbSkladTo.KeyValue := iOid;
  Handled := true;  }
end;

procedure TfrmCallHistoryEdit.cdsContactsAfterInsert(DataSet: TDataSet);
//var
//  iIdKlient : integer;
begin
//  DataSet.FieldByName('id_klient').asInteger :=
//    iIdKlient;
  DataSet.FieldByName('delmarked').asInteger :=0;
  DataSet.FieldByName('oid').asInteger := dmdEx.GetGenValue('oid_gen');
  DataSet.FieldByName('PERSONBYDEF').asInteger :=0;
end;

procedure TfrmCallHistoryEdit.cdsContactsBeforePost(DataSet: TDataSet);
begin
  if DataSet.FieldByName('id_dolgnost').isNull then begin
    ShowMessage('¬ведите должность');
    abort;
  end;
end;



procedure TfrmCallHistoryEdit.lcbReasonEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  lcbReason.KeyValue := Null;
  handled := true;
end;

procedure TfrmCallHistoryEdit.lcbReasonEditButtons1Click(Sender: TObject;
  var Handled: Boolean);
var
  iOid : integer;
begin
  frmReason := TfrmReason.Create(self);
  iOid := frmReason.ShowModalForInsert;
  lcbReason.KeyValue := iOid;
  Handled := true;
end;

procedure TfrmCallHistoryEdit.lcbResultEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  lcbResult.KeyValue := Null;
  handled := true;
end;

procedure TfrmCallHistoryEdit.lcbResultEditButtons1Click(Sender: TObject;
  var Handled: Boolean);
var
  iOid : integer;
begin
  frmResult := TfrmResult.Create(self);
  iOid := frmResult.ShowModalForInsert;
  lcbReason.KeyValue := iOid;
  Handled := true;
end;

procedure TfrmCallHistoryEdit.FormShow(Sender: TObject);
begin
  dteDat.SetFocus;
end;

end.
