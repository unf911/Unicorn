unit ManagerSpr;

interface

uses
  Windows, Messages, SysUtils,
  Variants, Classes, Graphics,
  Controls, Forms,
  ManagerSprEdit,
  AtsAssert,
  Dialogs, untEx, FMTBcd, DB, DBClient, Provider, StdCtrls, Buttons,
  SqlExpr, Grids, DBGridEh, ActnList, PropStorageEh, PropFilerEh, GridsEh,
  ExtCtrls, UnfFilter, MemTableDataEh, DataDriverEh, MemTableEh;

type
  TfrmManagerSpr = class(TForm)
    DBGridEh1: TDBGridEh;
    sdsManager: TSQLDataSet;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    dspManager: TDataSetProvider;
    cdsSklad: TClientDataSet;
    dsManager: TDataSource;
    btnApply: TBitBtn;
    cdsSkladNAME: TStringField;
    ActionList1: TActionList;
    actApply: TAction;
    cdsSkladDELMARKED: TSmallintField;
    rpsClientEdit: TRegPropStorageManEh;
    PropStorageEh1: TPropStorageEh;
    cdsSkladID: TIntegerField;
    cdsSkladFULLNAME: TStringField;
    actRefresh: TAction;
    Panel1: TPanel;
    btnDelete: TButton;
    btnEdit: TButton;
    btnInsert: TButton;
    BitBtn2: TBitBtn;
    sdsManagerNAME: TStringField;
    sdsManagerID: TIntegerField;
    sdsManagerDELMARKED: TSmallintField;
    sdsManagerFULLNAME: TStringField;
    UnfFilter1: TUnfFilter;
    sdsManagerSIGNATURE: TStringField;
    cdsSkladSIGNATURE: TStringField;
    MemTableEh1: TMemTableEh;
    MemTableEh1ExpCount: TAggregateField;
    DataSetDriverEh1: TDataSetDriverEh;
    sdsManagerPOID: TIntegerField;
    sdsManagerVISIBLE_AREA: TIntegerField;
    cdsSkladPOID: TIntegerField;
    cdsSkladVISIBLE_AREA: TIntegerField;
    MemTableEh1ID: TIntegerField;
    MemTableEh1NAME: TStringField;
    MemTableEh1FULLNAME: TStringField;
    MemTableEh1DELMARKED: TSmallintField;
    MemTableEh1SIGNATURE: TStringField;
    MemTableEh1POID: TIntegerField;
    MemTableEh1VISIBLE_AREA: TIntegerField;
    MemTableEh1POID_NAME: TStringField;
    MemTableEh1VISIBLE_AREA_NAME: TStringField;
    sdsManagerID_DOLGNOST: TIntegerField;
    cdsSkladID_DOLGNOST: TIntegerField;
    cdsSkladDOLGNOST: TStringField;
    MemTableEh1ID_DOLGNOST: TIntegerField;
    MemTableEh1DOLGNOST: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actApplyExecute(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnInsertClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure MemTableEh1AfterInsert(DataSet: TDataSet);
    procedure MemTableEh1BeforeInsert(DataSet: TDataSet);
  private
    { Private declarations }
    FPoid: integer;
    frmSkladEdit : TfrmManagerSprEdit;
  public
    { Public declarations }

    procedure SkladEdit;
  end;

var
  frmManagerSpr: TfrmManagerSpr;



implementation

uses untRound;

{$R *.dfm}

procedure TfrmManagerSpr.FormCreate(Sender: TObject);
begin
  dmdEx.OpenQuery(dmdEx.cdsManager);
  MemTableEh1.Open;
  frmSkladEdit := TfrmManagerSprEdit.Create (self);
  frmSkladEdit.dsSkladEdit.Dataset := MemTableEh1;
end;

procedure TfrmManagerSpr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dmdEx.cdsManager.Active then begin
    dmdEx.cdsManager.Refresh;
  end;
  Action := caFree;
end;

procedure TfrmManagerSpr.actApplyExecute(Sender: TObject);
begin
  if cdsSklad.ChangeCount>0 then begin
    cdsSklad.ApplyUpdates(0);
    if dmdEx.cdsManager.Active then begin
      dmdEx.cdsManager.Refresh;
    end;
  end;//if
end;

procedure TfrmManagerSpr.btnCancelClick(Sender: TObject);
begin
  cdsSklad.CancelUpdates;
  self.Close;
end;

procedure TfrmManagerSpr.btnOkClick(Sender: TObject);
begin
  actApply.Execute;
  self.Close;
end;

procedure TfrmManagerSpr.SkladEdit;
begin
try
  frmSkladEdit.ShowModal;
except
  AssertInternal('0DD040CC-BA00-4EB2-AB0D-2B334B9641F8');
end;
end;

procedure TfrmManagerSpr.actRefreshExecute(Sender: TObject);
begin
  try
    cdsSklad.Refresh;
    MemTableEh1.Close;
    MemTableEh1.Open;
  except
    AssertInternal('37BA2E92-2AD8-4302-BCB7-74242BB58732');
  end;
end;


procedure TfrmManagerSpr.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmManagerSpr.btnInsertClick(Sender: TObject);
begin
  MemTableEh1.Append;
  SkladEdit;
end;

procedure TfrmManagerSpr.btnEditClick(Sender: TObject);
begin
  MemTableEh1.Edit;
  SkladEdit;
end;

procedure TfrmManagerSpr.btnDeleteClick(Sender: TObject);
begin
  if MessageDlg('Удалить менеджера?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    MemTableEh1.Edit;
    MemTableEh1.FieldByName('delmarked').asInteger := 1;
    MemTableEh1.Post;
    PostAndApply(MemTableEh1);
  end; //if
end;

procedure TfrmManagerSpr.DBGridEh1DblClick(Sender: TObject);
begin
  SkladEdit;
end;

procedure TfrmManagerSpr.MemTableEh1AfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('id').asInteger :=
    dmdEx.GetGenValue('oid_gen');
  DataSet.FieldByName('delmarked').asInteger := 0;
  DataSet.FieldByName('poid').asInteger := FPoid;
end;


procedure TfrmManagerSpr.MemTableEh1BeforeInsert(DataSet: TDataSet);
begin
  FPoid := DataSet.FieldByName('id').asInteger;
end;

end.
