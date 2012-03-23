unit ReysSpr;

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
  ReysSprEdit //TfrmReysSprEdit
  ;

type
  TfrmReysSpr = class(TForm)
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
    sdsSkladID_PEREVOZCHIK: TIntegerField;
    sdsSkladFIO_VODITELYA: TStringField;
    sdsSkladDAT_REYS: TSQLTimeStampField;
    sdsSkladPUNKT_ZAGRUZKI: TStringField;
    sdsSkladNOMER_AVTO: TStringField;
    cdsSkladID_REYS: TIntegerField;
    cdsSkladID_PEREVOZCHIK: TIntegerField;
    cdsSkladFIO_VODITELYA: TStringField;
    cdsSkladDAT_REYS: TSQLTimeStampField;
    cdsSkladPUNKT_ZAGRUZKI: TStringField;
    cdsSkladNOMER_AVTO: TStringField;
    cdsSkladPEREVOZCHIK: TStringField;
    sdsSkladNOMER_PRITSEPA: TStringField;
    cdsSkladNOMER_PRITSEPA: TStringField;
    actSettings: TAction;
    N4: TMenuItem;
    sdsSkladDELMARKED: TSmallintField;
    cdsSkladDELMARKED: TSmallintField;
    actUndeleteNakl: TAction;
    N5: TMenuItem;
    sdsSkladPOKUPATEL_PLATIT: TSmallintField;
    sdsSkladCENA_REYSA: TFMTBCDField;
    cdsSkladPOKUPATEL_PLATIT: TSmallintField;
    cdsSkladCENA_REYSA: TFMTBCDField;
    sdsSkladCOMMENT: TStringField;
    cdsSkladCOMMENT: TStringField;
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
    procedure actSettingsExecute(Sender: TObject);
    procedure actUndeleteNaklExecute(Sender: TObject);
    procedure cdsSkladBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    frmReysSprEdit: TfrmReysSprEdit;    
    procedure SkladEdit;
    procedure ProcessShowDeleted;
    procedure ProcessSettings;
    procedure ProcessReys(id_reys: integer);
  public
    { Public declarations }
    setT : TfrmSettings;
    function DefaultOpen:boolean;
    procedure DefaultStartup;
    procedure ShowReys(id_reys: integer);
  end;

var
  frmReysSpr: TfrmReysSpr;

implementation

uses untSkladEdit;

{$R *.dfm}

procedure TfrmReysSpr.btnDeleteClick(Sender: TObject);
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

procedure TfrmReysSpr.btnInsertClick(Sender: TObject);
begin
try
  cdsSklad.Insert;
  SkladEdit;
except
  AssertInternal('FE9AE570-4058-4B3D-83F8-415EC1A9584D');
end;
end;

procedure TfrmReysSpr.SkladEdit;
begin
try
  frmReysSprEdit.ShowModal;
except
  AssertInternal('06159DEB-0DDF-4031-80BC-44AC2DB0148B');
end;
end;

function TfrmReysSpr.DefaultOpen:boolean;
begin
Result :=true;
try
  ProcessShowDeleted;
  ProcessSettings;
  actRefresh.Execute;
  if not cdsSklad.Active then begin
    Result :=false;
  end;
except
  AssertInternal('76ED5B1A-A491-4FB5-AE64-D80C51731F87');
end;
end;

procedure TfrmReysSpr.ProcessSettings;
begin
  self.Caption :='—правочник рейсов: '
    + ' c ' + datetostr (setT.DateFrom)
    + ' по '+ datetostr(setT.DateTo);
  qeKlient.SetSQL('where',
    'dat_reys between'+ QuotedStr(datetostr(setT.DateFrom)) +
    ' and '+ QuotedStr(datetostr(setT.DateTo)),1);
  qeKlient.Prepare;
end;

procedure TfrmReysSpr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmdEx.CloseQuery(dmdex.cdsVygruzka,false);
  if dmdEx.cdsVygruzka.Active then begin
    dmdEx.cdsVygruzka.Refresh;
  end;
  Action := caFree;
end;

procedure TfrmReysSpr.FormCreate(Sender: TObject);
begin
  qeKlient.DefSql := sdsSklad.CommandText;

  frmReysSprEdit := TfrmReysSprEdit.Create (self);
  frmReysSprEdit.dsSkladEdit.Dataset := cdsSklad;

  setT := TfrmSettings.Create(self);
end;

procedure TfrmReysSpr.DefaultStartup;
begin
  setT.actDataOnly.Execute;
  sett.SetPeriod(6);
  setT.DateTo := IncMonth(Now,1);
end;

procedure TfrmReysSpr.UnfDBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return :begin
      SkladEdit;
    end;
  end;
end;


procedure TfrmReysSpr.btnEditClick(Sender: TObject);
begin
try
  cdsSklad.Edit;
  SkladEdit;
except
  assertInternal('1BCB1572-38DE-41FA-A8C9-6E693C51F1FF');
end;
end;

procedure TfrmReysSpr.cdsSkladReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  showmessage (e.message);
  Action:= raCancel;
end;

procedure TfrmReysSpr.actRefreshExecute(Sender: TObject);
begin
try
  qeKlient.Refresh;
except
  AssertInternal('E2846380-49A7-4131-8B11-C3B963C22E71');
end;
end;

procedure TfrmReysSpr.cdsSkladAfterInsert(DataSet: TDataSet);
begin
try
  DataSet.FieldByName('id_reys').asInteger :=
    dmdEx.GetGenValue('naklo_gen');
  DataSet.FieldByName('dat_reys').AsDateTime := Date; //default date. time=0
  DataSet.FieldByName('pokupatel_platit').AsInteger := 0;
  DataSet.FieldByName('cena_reysa').AsFloat := 0;
  DataSet.FieldByName('delmarked').asInteger := 0;
except
  AssertInternal('294D416F-A6E1-4B2E-8A52-59D36EEFAEF6');
end;
end;

procedure TfrmReysSpr.dbgClientDblClick(Sender: TObject);
begin
  SkladEdit;
end;

procedure TfrmReysSpr.dbgClientKeyDown(Sender: TObject; var Key: Word;
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


procedure TfrmReysSpr.actShowDeletedExecute(Sender: TObject);
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

procedure TfrmReysSpr.ProcessShowDeleted;
begin
  if actShowDeleted.Checked then begin
		qeKlient.SetSQL ('where','delmarked=1',0);
  end
  else begin
    qeKlient.SetSQL ('where','delmarked=0',0);
  end;//checked
  qeKlient.prepare;
end;

procedure TfrmReysSpr.actSettingsExecute(Sender: TObject);
begin
  actSettings.checked := setT.ProcessSettingsChange2(DefaultOpen);
end;

procedure TfrmReysSpr.actUndeleteNaklExecute(Sender: TObject);
begin
  if actShowDeleted.Checked then begin
    dmdEx.UndeleteNaklo(TintegerField(dsSklad.DataSet.FieldByName('delmarked')), actRefresh, 'ID_REYS');
  end;
end;

procedure TfrmReysSpr.cdsSkladBeforePost(DataSet: TDataSet);
begin
  if cdsSklad.FieldByName('NOMER_AVTO').IsNull then begin
    showmessage('¬ведите номер авто');
    Abort;
  end;
end;

procedure TfrmReysSpr.ShowReys(id_reys: integer);
begin
  try
    ProcessReys(id_reys);
    actRefresh.Execute;
  except
    AssertInternal('72AD1640-BA84-44C0-980F-E9247F185310');
  end;
end;


procedure TfrmReysSpr.ProcessReys(id_reys: integer);
begin
  qeKlient.SetSQL('where',
    'id_reys='+ inttostr(id_reys),1);
  qeKlient.Prepare;
end;

end.
