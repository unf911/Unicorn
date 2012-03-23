unit Statya;

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
  StatyaEdit, GridsEh;

type
  TfrmStatya = class(TForm)
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
    cdsSkladIS_FACT: TIntegerField;
    cdsSkladID_BUX: TIntegerField;
    cdsSkladIS_FOR_TOVAR: TIntegerField;
    cdsSkladIS_FOR_TARA: TIntegerField;
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
    procedure cdsSkladFULLNAMEChange(Sender: TField);
  private
    { Private declarations }
    frmSkladEdit : TfrmStatyaEdit;
    procedure SkladEdit;
//    procedure  TovarApply;
  public
    { Public declarations }
    function ShowModalForInsert : integer;
  end;

var
  frmStatya: TfrmStatya;

implementation

{$R *.dfm}

procedure TfrmStatya.btnDeleteClick(Sender: TObject);
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

procedure TfrmStatya.btnInsertClick(Sender: TObject);
begin
try
  cdsSklad.Insert;
  SkladEdit;
except
  AssertInternal('FE9AE570-4058-4B3D-83F8-415EC1A9584D');
end;
end;

procedure TfrmStatya.SkladEdit;
begin
try
  frmSkladEdit.ShowModal;
except
  AssertInternal('06159DEB-0DDF-4031-80BC-44AC2DB0148B');
end;
end;


procedure TfrmStatya.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dmdEx.cdsStatya.Active then begin
    dmdEx.cdsStatya.Refresh;
  end;
  Action := caFree;
end;

procedure TfrmStatya.FormCreate(Sender: TObject);
begin
  cdsSklad.Open;
  frmSkladEdit := TfrmStatyaEdit.Create (self);
  frmSkladEdit.dsSkladEdit.Dataset := cdsSklad;
end;

procedure TfrmStatya.UnfDBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return :begin
      SkladEdit;
    end;
  end;
end;

procedure TfrmStatya.btnEditClick(Sender: TObject);
begin
try
  cdsSklad.Edit;
  SkladEdit;
except
  assertInternal('1BCB1572-38DE-41FA-A8C9-6E693C51F1FF');
end;
end;

procedure TfrmStatya.cdsSkladReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  showmessage (e.message);
  Action:= raCancel;
end;

procedure TfrmStatya.actRefreshExecute(Sender: TObject);
begin
try
  cdsSklad.Refresh;
except
  AssertInternal('E2846380-49A7-4131-8B11-C3B963C22E71');
end;
end;

procedure TfrmStatya.cdsSkladAfterInsert(DataSet: TDataSet);
begin
try
  Dataset.FieldByName('oid').asInteger :=
    dmdEx.GetGenValue('oid_gen');
  Dataset.FieldByName('delmarked').asInteger := 0;
  Dataset.FieldByName('is_fact').asInteger := 0;
  Dataset.FieldByName('is_bux').asInteger := 1;
  Dataset.FieldByName('is_for_tovar').asInteger := 1;
  Dataset.FieldByName('is_for_tara').asInteger := 1;
except
  AssertInternal('294D416F-A6E1-4B2E-8A52-59D36EEFAEF6');
end;
end;

procedure TfrmStatya.cdsSkladBeforePost(DataSet: TDataSet);
begin
  if cdsSklad.FieldByName('NAME').IsNull then begin
    showmessage('¬ведите название должности');
    Abort;
  end;
end;

procedure TfrmStatya.dbgClientDblClick(Sender: TObject);
begin
  SkladEdit;
end;

procedure TfrmStatya.dbgClientKeyDown(Sender: TObject; var Key: Word;
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

function TfrmStatya.ShowModalForInsert: integer;
begin
  self.FormStyle :=fsNormal;
  self.Visible := false;
  self.ShowModal;
  Result := cdsSklad.FieldByName('oid').asinteger;
end;

procedure TfrmStatya.cdsSkladFULLNAMEChange(Sender: TField);
begin
  cdsSklad.FieldByName('name').asString :=
  AnsiUpperCase(cdsSklad.FieldByName('fullname').asString);
end;

end.
