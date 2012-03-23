unit ProjectSpr;

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
  ProjectSprEdit, PropStorageEh,
  PropFilerEh, GridsEh, Menus, MemTableDataEh, DataDriverEh, MemTableEh;

type
  TfrmProjectSpr = class(TForm)
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
    cdsSkladNAME: TStringField;
    cdsSkladDELMARKED: TSmallintField;
    dbgClient: TDBGridEh;
    BitBtn1: TBitBtn;
    UnfFilter1: TUnfFilter;
    cdsSkladFULLNAME: TStringField;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    btnOk: TBitBtn;
    sdsSkladID: TIntegerField;
    sdsSkladNAME: TStringField;
    sdsSkladFULLNAME: TStringField;
    sdsSkladDELMARKED: TSmallintField;
    sdsSkladPOID: TIntegerField;
    cdsSkladID: TIntegerField;
    cdsSkladPOID: TIntegerField;
    cdsSkladPOID_NAME: TStringField;
    actDebug: TAction;
    MainMenu1: TMainMenu;
    mnuActions: TMenuItem;
    N1: TMenuItem;
    N15: TMenuItem;
    MemTableEh1: TMemTableEh;
    MemTableEh1ExpCount: TAggregateField;
    DataSetDriverEh1: TDataSetDriverEh;
    MemTableEh1ID: TIntegerField;
    MemTableEh1NAME: TStringField;
    MemTableEh1FULLNAME: TStringField;
    MemTableEh1DELMARKED: TSmallintField;
    MemTableEh1POID: TIntegerField;
    MemTableEh1POID_NAME: TStringField;
    Action1: TAction;
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
    procedure cdsSkladBeforePost(DataSet: TDataSet);
    procedure dbgClientDblClick(Sender: TObject);
    procedure dbgClientKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOkClick(Sender: TObject);
    procedure actDebugExecute(Sender: TObject);
    procedure MemTableEh1AfterInsert(DataSet: TDataSet);
    procedure MemTableEh1BeforeInsert(DataSet: TDataSet);
  private
    { Private declarations }
    frmSkladEdit : TfrmProjectSprEdit;
    FPoid :integer;
    procedure SkladEdit;
//    procedure  TovarApply;
  public
    { Public declarations }
    function ShowModalForInsert : integer;
  end;

var
  frmProjectSpr: TfrmProjectSpr;

implementation

{$R *.dfm}

procedure TfrmProjectSpr.btnDeleteClick(Sender: TObject);
begin
try
  if MessageDlg('������� ������?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      MemTableEh1.Edit;
      MemTableEh1.FieldByName('delmarked').asInteger:=1;
      MemTableEh1.Post;
      MemTableEh1.ApplyUpdates(0);
      if cdsSklad.ChangeCount>0 then begin
        cdsSklad.ApplyUpdates(-1);
      end;
      //DelmarkRecord(cdsSklad);
  end; //if
except
  AssertInternal('491A61E4-B1A9-4B62-97B3-FBE01CAA11FD');
end;

end;

procedure TfrmProjectSpr.btnInsertClick(Sender: TObject);
begin
try
  MemTableEh1.Append;
  SkladEdit;
except
  AssertInternal('C793A5C1-B1CE-47E6-A030-756E50DEDBA5');
end;
end;

procedure TfrmProjectSpr.SkladEdit;
begin
try
  frmSkladEdit.ShowModal;
  if cdsSklad.ChangeCount>0 then begin
    cdsSklad.ApplyUpdates(-1);
  end;
except
  AssertInternal('919A2C3F-3235-45D3-94A9-FC3B68DFDED4');
end;
end;


procedure TfrmProjectSpr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if cdsSklad.ChangeCount>0 then begin
    cdsSklad.ApplyUpdates(-1);
  end;
  dmdEx.CloseQuery(dmdEx.cdsProject,false);
  if dmdEx.cdsProject.Active then begin
    dmdEx.cdsProject.Refresh;
  end;
  Action := caFree;
end;

procedure TfrmProjectSpr.FormCreate(Sender: TObject);
begin
  dmdEx.OpenQuery(dmdEx.cdsProject);
  cdsSklad.Open;

  MemTableEh1.TreeList.Active := True;
  MemTableEh1.TreeList.KeyFieldName := 'ID';
  MemTableEh1.TreeList.RefParentFieldName := 'POID';
  MemTableEh1.TreeList.DefaultNodeExpanded := True;
  MemTableEh1.Open;

  frmSkladEdit := TfrmProjectSprEdit.Create (self);
  frmSkladEdit.dsSkladEdit.Dataset := MemTableEh1;
end;

procedure TfrmProjectSpr.UnfDBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return :begin
      SkladEdit;
    end;
  end;
end;

procedure TfrmProjectSpr.btnEditClick(Sender: TObject);
begin
try
  cdsSklad.Edit;
  SkladEdit;
except
  assertInternal('1BCB1572-38DE-41FA-A8C9-6E693C51F1FF');
end;
end;

procedure TfrmProjectSpr.cdsSkladReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  showmessage (e.message);
  Action:= raCancel;
end;

procedure TfrmProjectSpr.actRefreshExecute(Sender: TObject);
begin
try
  //cdsSklad.Refresh;
  MemTableEh1.Refresh;
except
  AssertInternal('E2846380-49A7-4131-8B11-C3B963C22E71');
end;
end;

procedure TfrmProjectSpr.cdsSkladBeforePost(DataSet: TDataSet);
begin
  if DataSet.FieldByName('NAME').IsNull then begin
    showmessage('������� �������� �������');
    Abort;
  end;
  if DataSet.FieldByName('POID_NAME').IsNull then begin
    showmessage('������� �������� ��������');
    Abort;
  end;
end;

procedure TfrmProjectSpr.dbgClientDblClick(Sender: TObject);
begin
  SkladEdit;
end;

procedure TfrmProjectSpr.dbgClientKeyDown(Sender: TObject; var Key: Word;
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

function TfrmProjectSpr.ShowModalForInsert: integer;
begin
  self.FormStyle :=fsNormal;
  self.Visible := false;
  self.ShowModal;
//  self.ModalResult
  Result := cdsSklad.FieldByName('oid').asinteger;
end;

procedure TfrmProjectSpr.btnOkClick(Sender: TObject);
begin
  close;
end;

procedure TfrmProjectSpr.actDebugExecute(Sender: TObject);
begin
  actDebug.Checked := not actDebug.Checked;
  if actDebug.Checked then begin
    ColumnByName(dbgClient.Columns,'ID').Visible := true;
    ColumnByName(dbgClient.Columns,'POID').Visible := true;
  end else begin //if actDebug checked
    ColumnByName(dbgClient.Columns,'ID').Visible := false;
    ColumnByName(dbgClient.Columns,'POID').Visible := false;
  end;  //if actDebug checked
end;

procedure TfrmProjectSpr.MemTableEh1AfterInsert(DataSet: TDataSet);
begin
try
  DataSet.FieldByName('id').asInteger :=
    dmdEx.GetGenValue('oid_gen');
  DataSet.FieldByName('delmarked').asInteger := 0;
  DataSet.FieldByName('poid').asInteger := FPoid;
except
  AssertInternal('F8AF8DFE-C73E-40FE-9A7C-77C60B784BB5');
end;
end;

procedure TfrmProjectSpr.MemTableEh1BeforeInsert(DataSet: TDataSet);
begin
  FPoid := DataSet.FieldByName('id').asInteger;
end;

end.
