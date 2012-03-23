unit DolgnostSpr;

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
  DolgnostSprEdit, GridsEh;

type
  TfrmDolgnostSpr = class(TForm)
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
    cdsSkladID: TIntegerField;
    cdsSkladNAME: TStringField;
    cdsSkladDELMARKED: TSmallintField;
    dbgClient: TDBGridEh;
    BitBtn1: TBitBtn;
    UnfFilter1: TUnfFilter;
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
    frmSkladEdit : TfrmDolgnostSprEdit;
    procedure SkladEdit;
//    procedure  TovarApply;
  public
    { Public declarations }
    function ShowModalForInsert : integer;
  end;

var
  frmDolgnostSpr: TfrmDolgnostSpr;

implementation

{$R *.dfm}

procedure TfrmDolgnostSpr.btnDeleteClick(Sender: TObject);
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

procedure TfrmDolgnostSpr.btnInsertClick(Sender: TObject);
begin
try
  cdsSklad.Insert;
  SkladEdit;
except
  AssertInternal('FE9AE570-4058-4B3D-83F8-415EC1A9584D');
end;
end;

procedure TfrmDolgnostSpr.SkladEdit;
begin
try
  frmSkladEdit.ShowModal;
except
  AssertInternal('06159DEB-0DDF-4031-80BC-44AC2DB0148B');
end;
end;


procedure TfrmDolgnostSpr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dmdEx.cdsDolgnost.Active then begin
    dmdEx.cdsDolgnost.Refresh;
  end;
  Action := caFree;
end;

procedure TfrmDolgnostSpr.FormCreate(Sender: TObject);
begin
  cdsSklad.Open;
  frmSkladEdit := TfrmDolgnostSprEdit.Create (self);
  frmSkladEdit.dsSkladEdit.Dataset := cdsSklad;
end;

procedure TfrmDolgnostSpr.UnfDBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return :begin
      SkladEdit;
    end;
  end;
end;

procedure TfrmDolgnostSpr.btnEditClick(Sender: TObject);
begin
try
  cdsSklad.Edit;
  SkladEdit;
except
  assertInternal('1BCB1572-38DE-41FA-A8C9-6E693C51F1FF');
end;
end;

procedure TfrmDolgnostSpr.cdsSkladReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  showmessage (e.message);
  Action:= raCancel;
end;

procedure TfrmDolgnostSpr.actRefreshExecute(Sender: TObject);
begin
try
  cdsSklad.Refresh;
except
  AssertInternal('E2846380-49A7-4131-8B11-C3B963C22E71');
end;
end;

procedure TfrmDolgnostSpr.cdsSkladAfterInsert(DataSet: TDataSet);
begin
try
  cdsSklad.FieldByName('id').asInteger :=
    dmdEx.GetGenValue('oid_gen');
  cdsSklad.FieldByName('delmarked').asInteger := 0;
except
  AssertInternal('294D416F-A6E1-4B2E-8A52-59D36EEFAEF6');
end;
end;

procedure TfrmDolgnostSpr.cdsSkladBeforePost(DataSet: TDataSet);
begin
  if cdsSklad.FieldByName('NAME').IsNull then begin
    showmessage('¬ведите название должности');
    Abort;
  end;
end;

procedure TfrmDolgnostSpr.dbgClientDblClick(Sender: TObject);
begin
  SkladEdit;
end;

procedure TfrmDolgnostSpr.dbgClientKeyDown(Sender: TObject; var Key: Word;
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

function TfrmDolgnostSpr.ShowModalForInsert: integer;
begin
  self.FormStyle :=fsNormal;
  self.Visible := false;
  self.ShowModal;
  Result := cdsSklad.FieldByName('id').asinteger;
end;

end.
