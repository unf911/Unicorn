unit SkidkaSpr;

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
  SkidkaSprEdit, PropStorageEh, PropFilerEh, GridsEh;

type
  TfrmSkidkaSpr = class(TForm)
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
    cdsSkladSKIDKA_DEF: TFMTBCDField;
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
    frmSkladEdit : TfrmSkidkaSprEdit;
    procedure SkladEdit;
//    procedure  TovarApply;
  public
    { Public declarations }
    function ShowModalForInsert : integer;
  end;

var
  frmSkidkaSpr: TfrmSkidkaSpr;

implementation

{$R *.dfm}

procedure TfrmSkidkaSpr.btnDeleteClick(Sender: TObject);
begin
try
  if MessageDlg('”далить запись?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      DelmarkRecord(cdsSklad);
  end; //if
except
  AssertInternal('491A61E4-B1A9-4B62-97B3-FBE01CAA11FD');
end;

end;

procedure TfrmSkidkaSpr.btnInsertClick(Sender: TObject);
begin
try
  cdsSklad.Insert;
  SkladEdit;
except
  AssertInternal('C793A5C1-B1CE-47E6-A030-756E50DEDBA5');
end;
end;

procedure TfrmSkidkaSpr.SkladEdit;
begin
try
  frmSkladEdit.ShowModal;
except
  AssertInternal('919A2C3F-3235-45D3-94A9-FC3B68DFDED4');
end;
end;


procedure TfrmSkidkaSpr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dmdEx.cdsSkidka.Active then begin
    dmdEx.cdsSkidka.Refresh;
  end;
  Action := caFree;
end;

procedure TfrmSkidkaSpr.FormCreate(Sender: TObject);
begin
  cdsSklad.Open;
  frmSkladEdit := TfrmSkidkaSprEdit.Create (self);
  frmSkladEdit.dsSkladEdit.Dataset := cdsSklad;
end;

procedure TfrmSkidkaSpr.UnfDBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return :begin
      SkladEdit;
    end;
  end;
end;

procedure TfrmSkidkaSpr.btnEditClick(Sender: TObject);
begin
try
  cdsSklad.Edit;
  SkladEdit;
except
  assertInternal('1BCB1572-38DE-41FA-A8C9-6E693C51F1FF');
end;
end;

procedure TfrmSkidkaSpr.cdsSkladReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  showmessage (e.message);
  Action:= raCancel;
end;

procedure TfrmSkidkaSpr.actRefreshExecute(Sender: TObject);
begin
try
  cdsSklad.Refresh;
except
  AssertInternal('E2846380-49A7-4131-8B11-C3B963C22E71');
end;
end;

procedure TfrmSkidkaSpr.cdsSkladAfterInsert(DataSet: TDataSet);
begin
try
  cdsSklad.FieldByName('oid').asInteger :=
    dmdEx.GetGenValue('oid_gen');
  cdsSklad.FieldByName('delmarked').asInteger := 0;
  cdsSklad.FieldByName('skidka_def').asFloat := 0;
except
  AssertInternal('F8AF8DFE-C73E-40FE-9A7C-77C60B784BB5');
end;
end;

procedure TfrmSkidkaSpr.cdsSkladBeforePost(DataSet: TDataSet);
begin
  if cdsSklad.FieldByName('NAME').IsNull then begin
    showmessage('¬ведите название скидки');
    Abort;
  end;
end;

procedure TfrmSkidkaSpr.dbgClientDblClick(Sender: TObject);
begin
  SkladEdit;
end;

procedure TfrmSkidkaSpr.dbgClientKeyDown(Sender: TObject; var Key: Word;
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

function TfrmSkidkaSpr.ShowModalForInsert: integer;
begin
  self.FormStyle :=fsNormal;
  self.Visible := false;
  self.ShowModal;
//  self.ModalResult
  Result := cdsSklad.FieldByName('oid').asinteger;
end;

procedure TfrmSkidkaSpr.btnOkClick(Sender: TObject);
begin
  close;
end;

end.
