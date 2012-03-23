unit UslPostavkaSpr;

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
  UslPostavkaSprEdit, PropStorageEh, PropFilerEh, GridsEh;

type
  TfrmUslPostavkaSpr = class(TForm)
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
    frmSkladEdit : TfrmUslPostavkaSprEdit;
    procedure SkladEdit;
//    procedure  TovarApply;
  public
    { Public declarations }
    function ShowModalForInsert : integer;
  end;

var
  frmUslPostavkaSpr: TfrmUslPostavkaSpr;

implementation

{$R *.dfm}

procedure TfrmUslPostavkaSpr.btnDeleteClick(Sender: TObject);
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

procedure TfrmUslPostavkaSpr.btnInsertClick(Sender: TObject);
begin
try
  cdsSklad.Insert;
  SkladEdit;
except
  AssertInternal('C793A5C1-B1CE-47E6-A030-756E50DEDBA5');
end;
end;

procedure TfrmUslPostavkaSpr.SkladEdit;
begin
try
  frmSkladEdit.ShowModal;
except
  AssertInternal('919A2C3F-3235-45D3-94A9-FC3B68DFDED4');
end;
end;


procedure TfrmUslPostavkaSpr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dmdEx.cdsUslPostavka.Active then begin
    dmdEx.cdsUslPostavka.Refresh;
  end;
  Action := caFree;
end;

procedure TfrmUslPostavkaSpr.FormCreate(Sender: TObject);
begin
  cdsSklad.Open;
  frmSkladEdit := TfrmUslPostavkaSprEdit.Create (self);
  frmSkladEdit.dsSkladEdit.Dataset := cdsSklad;
end;

procedure TfrmUslPostavkaSpr.UnfDBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return :begin
      SkladEdit;
    end;
  end;
end;

procedure TfrmUslPostavkaSpr.btnEditClick(Sender: TObject);
begin
try
  cdsSklad.Edit;
  SkladEdit;
except
  assertInternal('1BCB1572-38DE-41FA-A8C9-6E693C51F1FF');
end;
end;

procedure TfrmUslPostavkaSpr.cdsSkladReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  showmessage (e.message);
  Action:= raCancel;
end;

procedure TfrmUslPostavkaSpr.actRefreshExecute(Sender: TObject);
begin
try
  cdsSklad.Refresh;
except
  AssertInternal('E2846380-49A7-4131-8B11-C3B963C22E71');
end;
end;

procedure TfrmUslPostavkaSpr.cdsSkladAfterInsert(DataSet: TDataSet);
begin
try
  cdsSklad.FieldByName('oid').asInteger :=
    dmdEx.GetGenValue('oid_gen');
  cdsSklad.FieldByName('delmarked').asInteger := 0;
except
  AssertInternal('294D416F-A6E1-4B2E-8A52-59D36EEFAEF6');
end;
end;

procedure TfrmUslPostavkaSpr.cdsSkladBeforePost(DataSet: TDataSet);
begin
  if cdsSklad.FieldByName('NAME').IsNull then begin
    showmessage('¬ведите название условий поставки');
    Abort;
  end;
end;

procedure TfrmUslPostavkaSpr.dbgClientDblClick(Sender: TObject);
begin
  SkladEdit;
end;

procedure TfrmUslPostavkaSpr.dbgClientKeyDown(Sender: TObject; var Key: Word;
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

function TfrmUslPostavkaSpr.ShowModalForInsert: integer;
begin
  self.FormStyle :=fsNormal;
  self.Visible := false;
  self.ShowModal;
//  self.ModalResult
  Result := cdsSklad.FieldByName('oid').asinteger;
end;

procedure TfrmUslPostavkaSpr.btnOkClick(Sender: TObject);
begin
  close;
end;

end.
