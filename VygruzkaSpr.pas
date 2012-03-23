unit VygruzkaSpr;

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
  PropFilerEh, GridsEh, QueryExtender, Menus,
  untSettings, //TfrmSettings
  VygruzkaSprEdit //TfrmVygruzkaSprEdit

  ;

type
  TfrmVygruzkaSpr = class(TForm)
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
    dbgClient: TDBGridEh;
    BitBtn1: TBitBtn;
    UnfFilter1: TUnfFilter;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    actShowDeleted: TAction;
    qeKlient: TQueryExtender;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    sdsSkladID_REYS: TIntegerField;
    cdsSkladID_REYS: TIntegerField;
    cdsSkladPUNKT_VYGRUZKI: TStringField;
    N4: TMenuItem;
    sdsSkladDELMARKED: TSmallintField;
    cdsSkladDELMARKED: TSmallintField;
    actUndeleteNakl: TAction;
    N5: TMenuItem;
    sdsSkladID_VYGRUZKA: TIntegerField;
    sdsSkladPUNKT_VYGRUZKI: TStringField;
    cdsSkladID_VYGRUZKA: TIntegerField;
    sdsSkladIS_LAST: TSmallintField;
    cdsSkladIS_LAST: TSmallintField;
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
    procedure dbgClientDblClick(Sender: TObject);
    procedure dbgClientKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actShowDeletedExecute(Sender: TObject);
    procedure actUndeleteNaklExecute(Sender: TObject);
    procedure cdsSkladBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    frmVygruzkaSprEdit: TfrmVygruzkaSprEdit;
    FIDReys: integer;
    procedure SkladEdit;
    procedure ProcessShowDeleted;
  public
    { Public declarations }
    //function DefaultOpen:boolean;
    procedure ShowVygruzkaForReys(id_reys: integer);
  end;

var
  frmVygruzkaSpr: TfrmVygruzkaSpr;

implementation

uses untSkladEdit;

{$R *.dfm}

procedure TfrmVygruzkaSpr.btnDeleteClick(Sender: TObject);
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

procedure TfrmVygruzkaSpr.btnInsertClick(Sender: TObject);
begin
try
  cdsSklad.Insert;
  SkladEdit;
except
  AssertInternal('FE9AE570-4058-4B3D-83F8-415EC1A9584D');
end;
end;

procedure TfrmVygruzkaSpr.SkladEdit;
begin
try
  frmVygruzkaSprEdit.ShowModal;
except
  AssertInternal('06159DEB-0DDF-4031-80BC-44AC2DB0148B');
end;
end;

procedure TfrmVygruzkaSpr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmVygruzkaSpr.FormCreate(Sender: TObject);
begin
  qeKlient.DefSql := sdsSklad.CommandText;
  frmVygruzkaSprEdit := TfrmVygruzkaSprEdit.Create (self);
  frmVygruzkaSprEdit.dsSkladEdit.Dataset := cdsSklad;
end;



procedure TfrmVygruzkaSpr.UnfDBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return :begin
      SkladEdit;
    end;
  end;
end;


procedure TfrmVygruzkaSpr.btnEditClick(Sender: TObject);
begin
try
  cdsSklad.Edit;
  SkladEdit;
except
  assertInternal('8B7B0149-BD3C-427B-947B-1B64E92D28C0');
end;
end;

procedure TfrmVygruzkaSpr.cdsSkladReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  showmessage (e.message);
  Action:= raCancel;
end;

procedure TfrmVygruzkaSpr.actRefreshExecute(Sender: TObject);
begin
try
  qeKlient.Refresh;
except
  AssertInternal('E2846380-49A7-4131-8B11-C3B963C22E71');
end;
end;

procedure TfrmVygruzkaSpr.cdsSkladAfterInsert(DataSet: TDataSet);
begin
try
  DataSet.FieldByName('id_vygruzka').asInteger :=
    dmdEx.GetGenValue('naklo_gen');
  DataSet.FieldByName('delmarked').asInteger := 0;
  DataSet.FieldByName('id_reys').asInteger := FIDReys;
  DataSet.FieldByName('id_last').asInteger := 0;
except
  AssertInternal('08E14B4A-27E3-4A8C-ADBC-240326840448');
end;
end;

procedure TfrmVygruzkaSpr.dbgClientDblClick(Sender: TObject);
begin
  SkladEdit;
end;

procedure TfrmVygruzkaSpr.dbgClientKeyDown(Sender: TObject; var Key: Word;
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


procedure TfrmVygruzkaSpr.actShowDeletedExecute(Sender: TObject);
begin
  dmdEx.StartWaiting;
	actShowDeleted.Checked := not actShowDeleted.Checked;
  if actShowDeleted.Checked then begin
    actUndeleteNakl.Visible := true;
  end else begin
    actUndeleteNakl.Visible := false;
  end;
  ProcessShowDeleted;
  qeKlient.Refresh;
  dmdEx.StopWaiting;
end;

procedure TfrmVygruzkaSpr.ProcessShowDeleted;
begin
  if actShowDeleted.Checked then begin
		qeKlient.SetSQL ('where','delmarked=1',0);
  end
  else begin
    qeKlient.SetSQL ('where','delmarked=0',0);
  end;//checked
  qeKlient.prepare;
end;

procedure TfrmVygruzkaSpr.actUndeleteNaklExecute(Sender: TObject);
begin
  if actShowDeleted.Checked then begin
    dmdEx.UndeleteNaklo(TintegerField(dsSklad.DataSet.FieldByName('delmarked')),actRefresh);
  end;
end;

procedure TfrmVygruzkaSpr.cdsSkladBeforePost(DataSet: TDataSet);
begin
  if cdsSklad.FieldByName('PUNKT_VYGRUZKI').IsNull then begin
    showmessage('¬ведите пункт выгрузки');
    Abort;
  end;
end;

procedure TfrmVygruzkaSpr.ShowVygruzkaForReys(id_reys: integer);
begin
	dmdEx.startwaiting;
  FIdReys := id_reys;

  cdsSklad.Close;
  ProcessShowDeleted;
  cdsSklad.Params.ParamByName('id_reys').AsInteger := FIdReys;
  dmdEx.openQuery(cdsSklad);

  dmdEx.stopwaiting;
  self.ShowModal;
end;

end.
