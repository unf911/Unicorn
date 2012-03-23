unit SkladSpr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids,  
  untEx,
  SkladSprEdit,
  ATSAssert, FMTBcd,
  ActnList, DB, DBClient,
  Provider, SqlExpr, untRound,
  ExtCtrls, DBCtrls, DBGridEh, Buttons, UnfFilter, PropStorageEh,
  PropFilerEh, GridsEh, QueryExtender, Menus;

type
  TfrmSkladSpr = class(TForm)
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
    cdsSkladID_MANAGER: TIntegerField;
    cdsSkladMANAGER: TStringField;
    sdsSkladOID: TIntegerField;
    sdsSkladNAME: TStringField;
    sdsSkladDELMARKED: TSmallintField;
    sdsSkladID_MANAGER: TIntegerField;
    sdsSkladFULLNAME: TStringField;
    cdsSkladFULLNAME: TStringField;
    UnfFilter1: TUnfFilter;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    sdsSkladISDEFAULT: TSmallintField;
    cdsSkladISDEFAULT: TSmallintField;
    sdsSkladPOID: TIntegerField;
    cdsSkladPOID: TIntegerField;
    cdsSkladPARENT_SKLAD: TStringField;
    actShowDeleted: TAction;
    qeKlient: TQueryExtender;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
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
    procedure actShowDeletedExecute(Sender: TObject);
  private
    { Private declarations }
    frmSkladSprEdit: TfrmSkladSprEdit;    
    procedure SkladEdit;
    procedure ProcessShowDeleted;

  public
    { Public declarations }
  end;

var
  frmSkladSpr: TfrmSkladSpr;

implementation

uses untSkladEdit;

{$R *.dfm}

procedure TfrmSkladSpr.btnDeleteClick(Sender: TObject);
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

procedure TfrmSkladSpr.btnInsertClick(Sender: TObject);
begin
try
  cdsSklad.Insert;
  SkladEdit;
except
  AssertInternal('FE9AE570-4058-4B3D-83F8-415EC1A9584D');
end;
end;

procedure TfrmSkladSpr.SkladEdit;
begin
try
  frmSkladSprEdit.ShowModal;
except
  AssertInternal('06159DEB-0DDF-4031-80BC-44AC2DB0148B');
end;
end;


procedure TfrmSkladSpr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dmdEx.cdsSklads.Active then begin
    dmdEx.cdsSklads.Refresh;
  end;
  Action := caFree;
end;

procedure TfrmSkladSpr.FormCreate(Sender: TObject);
begin
  qeKlient.DefSql := sdsSklad.CommandText;
  ProcessShowDeleted;
  qeKlient.Refresh();
  //cdsSklad.Open;
  frmSkladSprEdit := TfrmSkladSprEdit.Create (self);
  frmSkladSprEdit.dsSkladEdit.Dataset := cdsSklad;
end;

procedure TfrmSkladSpr.UnfDBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return :begin
      SkladEdit;
    end;
  end;
end;


procedure TfrmSkladSpr.btnEditClick(Sender: TObject);
begin
try
  cdsSklad.Edit;
  SkladEdit;
except
  assertInternal('1BCB1572-38DE-41FA-A8C9-6E693C51F1FF');
end;
end;

procedure TfrmSkladSpr.cdsSkladReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  showmessage (e.message);
  Action:= raCancel;
end;

procedure TfrmSkladSpr.actRefreshExecute(Sender: TObject);
begin
try
  cdsSklad.Refresh;
except
  AssertInternal('E2846380-49A7-4131-8B11-C3B963C22E71');
end;
end;

procedure TfrmSkladSpr.cdsSkladAfterInsert(DataSet: TDataSet);
begin
try
  DataSet.FieldByName('oid').asInteger :=
    dmdEx.GetGenValue('oid_gen');
  DataSet.FieldByName('delmarked').asInteger := 0;
  DataSet.FieldByName('isdefault').asInteger := 0;
except
  AssertInternal('294D416F-A6E1-4B2E-8A52-59D36EEFAEF6');
end;
end;

procedure TfrmSkladSpr.cdsSkladBeforePost(DataSet: TDataSet);
begin
  if cdsSklad.FieldByName('NAME').IsNull then begin
    showmessage('¬ведите название склада');
    Abort;
  end;
  if cdsSklad.FieldByName('ID_MANAGER').IsNull then begin
    showmessage('¬ведите менеджера ответственного за склад');
    Abort;
  end;
end;

procedure TfrmSkladSpr.dbgClientDblClick(Sender: TObject);
begin
  SkladEdit;
end;

procedure TfrmSkladSpr.dbgClientKeyDown(Sender: TObject; var Key: Word;
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


procedure TfrmSkladSpr.actShowDeletedExecute(Sender: TObject);
begin
  dmdEx.StartWaiting;
	actShowDeleted.Checked := not actShowDeleted.Checked;
  ProcessShowDeleted;
  qeKlient.Refresh;
  dmdEx.StopWaiting;
end;

procedure TfrmSkladSpr.ProcessShowDeleted;
begin
  if actShowDeleted.Checked then begin
		qeKlient.SetSQL ('where','delmarked=1',0);
  end
  else begin
    qeKlient.SetSQL ('where','delmarked=0',0);
  end;//checked
  qeKlient.prepare;
end;

end.
