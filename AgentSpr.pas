unit AgentSpr;

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
  AgentSprEdit,
  PropStorageEh, PropFilerEh, GridsEh;

type
  TfrmAgentSpr = class(TForm)
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
    cdsSkladFULLNAME: TStringField;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    btnOk: TBitBtn;
    sdsSkladOID: TIntegerField;
    sdsSkladNAME: TStringField;
    sdsSkladFULLNAME: TStringField;
    sdsSkladDELMARKED: TSmallintField;
    sdsSkladISDEFAULT: TSmallintField;
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
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
    frmSkladEdit : TfrmAgentSprEdit;
    procedure SkladEdit;
//    procedure  TovarApply;
  public
    { Public declarations }
    function ShowModalForInsert : integer;
  end;

var
  frmAgentSpr: TfrmAgentSpr;

implementation

{$R *.dfm}

procedure TfrmAgentSpr.btnDeleteClick(Sender: TObject);
begin
try
  if MessageDlg('”далить запись?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      DelmarkRecord(cdsSklad);
  end; //if
except
  AssertInternal('E25D69A4-6278-43EA-A3BC-DC939B51C829');
end;

end;

procedure TfrmAgentSpr.btnInsertClick(Sender: TObject);
begin
try
  cdsSklad.Insert;
  SkladEdit;
except
  AssertInternal('C793A5C1-B1CE-47E6-A030-756E50DEDBA5');
end;
end;

procedure TfrmAgentSpr.SkladEdit;
begin
try
  frmSkladEdit.ShowModal;
except
  AssertInternal('919A2C3F-3235-45D3-94A9-FC3B68DFDED4');
end;
end;


procedure TfrmAgentSpr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dmdEx.cdsPrice.Active then begin
    dmdEx.cdsPrice.Refresh;
  end;
  Action := caFree;
end;

procedure TfrmAgentSpr.FormCreate(Sender: TObject);
begin
  cdsSklad.Open;
  frmSkladEdit := TfrmAgentSprEdit.Create (self);
  frmSkladEdit.dsSkladEdit.Dataset := cdsSklad;
end;

procedure TfrmAgentSpr.UnfDBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return :begin
      SkladEdit;
    end;
  end;
end;

procedure TfrmAgentSpr.btnEditClick(Sender: TObject);
begin
try
  cdsSklad.Edit;
  SkladEdit;
except
  assertInternal('1BCB1572-38DE-41FA-A8C9-6E693C51F1FF');
end;
end;

procedure TfrmAgentSpr.cdsSkladReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  showmessage (e.message);
  Action:= raCancel;
end;

procedure TfrmAgentSpr.actRefreshExecute(Sender: TObject);
begin
try
  cdsSklad.Refresh;
except
  AssertInternal('E2846380-49A7-4131-8B11-C3B963C22E71');
end;
end;

procedure TfrmAgentSpr.cdsSkladAfterInsert(DataSet: TDataSet);
begin
try
  cdsSklad.FieldByName('oid').asInteger :=
    dmdEx.GetGenValue('oid_gen');
  cdsSklad.FieldByName('delmarked').asInteger := 0;
except
  AssertInternal('A6A8E837-8C52-40A8-9984-F0EF4218BE6C');
end;
end;

procedure TfrmAgentSpr.cdsSkladBeforePost(DataSet: TDataSet);
begin
  if cdsSklad.FieldByName('NAME').IsNull then begin
    showmessage('¬ведите название вид доставки');
    Abort;
  end;
end;

procedure TfrmAgentSpr.dbgClientDblClick(Sender: TObject);
begin
  SkladEdit;
end;

procedure TfrmAgentSpr.dbgClientKeyDown(Sender: TObject; var Key: Word;
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

function TfrmAgentSpr.ShowModalForInsert: integer;
begin
  self.FormStyle :=fsNormal;
  self.Visible := false;
  self.ShowModal;
//  self.ModalResult
  Result := cdsSklad.FieldByName('oid').asinteger;
end;

procedure TfrmAgentSpr.btnOkClick(Sender: TObject);
begin
  close;
end;

end.
