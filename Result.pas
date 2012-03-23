unit Result;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids,  
  untEx,
  untSkladEdit,
  ATSAssert, FMTBcd,
  ActnList, DB, DBClient,
  Provider, SqlExpr, untRound,
  ExtCtrls, DBCtrls, DBGridEh,
  Buttons, UnfFilter,
  ResultEdit, PropStorageEh;

type
  TfrmResult = class(TForm)
    sdsSklad: TSQLDataSet;
    dspSklad: TDataSetProvider;
    cdsSklad: TClientDataSet;
    dsSklad: TDataSource;
    ActionList1: TActionList;
    actRefresh: TAction;
    Panel1: TPanel;
    btnDelete: TButton;
    btnEdit: TButton;
    btnInsert: TButton;
    cdsSkladOID: TIntegerField;
    cdsSkladNAME: TStringField;
    cdsSkladDELMARKED: TSmallintField;
    dbgClient: TDBGridEh;
    BitBtn1: TBitBtn;
    UnfFilter1: TUnfFilter;
    cdsSkladCLASSID: TIntegerField;
    PropStorageEh1: TPropStorageEh;
    rpsTovarEdit: TRegPropStorageManEh;
    procedure btnDeleteClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure UnfDBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnEditClick(Sender: TObject);
    procedure cdsSkladReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure actRefreshExecute(Sender: TObject);
    procedure cdsSkladAfterInsert(DataSet: TDataSet);
    procedure cdsSkladBeforePost(DataSet: TDataSet);
    procedure dbgClientDblClick(Sender: TObject);
    procedure dbgClientKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    frmSkladEdit : TfrmResultEdit;
    procedure SkladEdit;
//    procedure  TovarApply;
  public
    { Public declarations }
    function ShowModalForInsert : integer;
  end;

var
  frmResult: TfrmResult;

implementation

{$R *.dfm}

procedure TfrmResult.btnDeleteClick(Sender: TObject);
begin
try
  if MessageDlg('”‰‡ÎËÚ¸ Á‡ÔËÒ¸?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      DelmarkRecord(cdsSklad);
  end; //if
except
  AssertInternal('E25D69A4-6278-43EA-A3BC-DC939B51C829');
end;

end;

procedure TfrmResult.btnInsertClick(Sender: TObject);
begin
try
  cdsSklad.Insert;
  SkladEdit;
except
  AssertInternal('FE9AE570-4058-4B3D-83F8-415EC1A9584D');
end;
end;

procedure TfrmResult.SkladEdit;
begin
try
  frmSkladEdit.ShowModal;
except
  AssertInternal('06159DEB-0DDF-4031-80BC-44AC2DB0148B');
end;
end;


procedure TfrmResult.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dmdEx.cdsResult.Active then begin
    dmdEx.cdsResult.Refresh;
  end;
  Action := caFree;
end;

procedure TfrmResult.FormCreate(Sender: TObject);
begin
  cdsSklad.Open;
  frmSkladEdit := TfrmResultEdit.Create (self);
  frmSkladEdit.dsSkladEdit.Dataset := cdsSklad;
end;

procedure TfrmResult.UnfDBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return :begin
      SkladEdit;
    end;
  end;
end;

procedure TfrmResult.btnEditClick(Sender: TObject);
begin
try
  cdsSklad.Edit;
  SkladEdit;
except
  assertInternal('1BCB1572-38DE-41FA-A8C9-6E693C51F1FF');
end;
end;

procedure TfrmResult.cdsSkladReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  showmessage (e.message);
  Action:= raCancel;
end;

procedure TfrmResult.actRefreshExecute(Sender: TObject);
begin
try
  cdsSklad.Refresh;
except
  AssertInternal('E2846380-49A7-4131-8B11-C3B963C22E71');
end;
end;

procedure TfrmResult.cdsSkladAfterInsert(DataSet: TDataSet);
begin
try
  cdsSklad.FieldByName('oid').asInteger :=
    dmdEx.GetGenValue('oid_gen');
  cdsSklad.FieldByName('delmarked').asInteger := 0;
  cdsSklad.FieldByName('classid').asInteger :=
    dmdEx.GetOidObjects('—œ–¿¬Œ◊Õ»  –≈«”À‹“¿“Œ¬  ŒÕ“¿ “Œ¬',-100)
except
  AssertInternal('294D416F-A6E1-4B2E-8A52-59D36EEFAEF6');
end;
end;

procedure TfrmResult.cdsSkladBeforePost(DataSet: TDataSet);
begin
  if cdsSklad.FieldByName('NAME').IsNull then begin
    showmessage('¬‚Â‰ËÚÂ ÂÁÛÎ¸Ú‡Ú ÍÓÌÚ‡ÍÚ‡');
    Abort;
  end;
end;

procedure TfrmResult.dbgClientDblClick(Sender: TObject);
begin
  SkladEdit;
end;

procedure TfrmResult.dbgClientKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return :begin
      btnEdit.Click;
    end;
    vk_insert : begin
      btnInsert.Click;
    end;
    vk_f8 : begin
      btnDelete.Click;
    end;
  end;//case
end;

function TfrmResult.ShowModalForInsert: integer;
begin
  self.FormStyle :=fsNormal;
  self.Visible := false;
  self.ShowModal;
//  self.ModalResult
  Result := cdsSklad.FieldByName('oid').asinteger;
end;

end.
