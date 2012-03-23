unit RepNakloDepend;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, Grids, DBGridEh, DB, SqlExpr, DBClient, Provider,
  untEx, StdCtrls, Buttons, ActnList, Menus,
  Registry, GridsEh, PropFilerEh, PropStorageEh, UnfFilter;

type

  INakloDepend = interface(IInterface)
    ['{F5C41371-FBE8-4E14-A3CB-CD6A1C92951C}']
    function ShowDetail(iNakl: Integer): integer;
  end;

  TfrmRepNakloDepend = class(TForm, INakloDepend)
    dspSklostdet: TDataSetProvider;
    cdsRep: TClientDataSet;
    sdsSklostdet: TSQLDataSet;
    dsSklostdet: TDataSource;
    dbgRep: TDBGridEh;
    ActionList1: TActionList;
    actDetail: TAction;
    MainMenu1: TMainMenu;
    mnuAction: TMenuItem;
    N1: TMenuItem;
    actRefresh: TAction;
    cdsRepIZG: TStringField;
    cdsRepZAK: TStringField;
    cdsRepMANAGER: TStringField;
    cdsRepTIP_NAME: TStringField;
    cdsRepTOVAR: TStringField;
    cdsRepTARA: TStringField;
    cdsRepID_DET: TIntegerField;
    cdsRepID_NAKLD: TIntegerField;
    cdsRepID_TARA: TIntegerField;
    cdsRepNOMER_TARY: TStringField;
    cdsRepKOLOTP: TFloatField;
    cdsRepKOLBUXT: TIntegerField;
    cdsRepCOMMENT: TStringField;
    cdsRepID_TOVAR: TIntegerField;
    cdsRepID_POS: TIntegerField;
    cdsRepID: TStringField;
    cdsRepDAT: TSQLTimeStampField;
    cdsRepID_NAKL: TIntegerField;
    cdsRepID_IZG: TIntegerField;
    cdsRepID_ZAK: TIntegerField;
    cdsRepID_MANAGER: TIntegerField;
    cdsRepTIP: TIntegerField;
    cdsRepID_SKLAD: TIntegerField;
    cdsRepID_SKLAD_TO: TIntegerField;
    cdsRepPOSTED: TIntegerField;
    cdsRepNDS: TFMTBCDField;
    actDebug: TAction;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    N2: TMenuItem;
    UnfFilter1: TUnfFilter;
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    PopupMenu1: TPopupMenu;
    N3: TMenuItem;
    procedure actDetailExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure actDebugExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgRepDblClick(Sender: TObject);
  private
    { Private declarations }
    iRefCount : integer;
  public
    { Public declarations }
    function ShowDetail (id_nakl : integer):integer;
    function _AddRef: integer;stdcall;
    function _Release :integer;stdcall;
    procedure DefaultStartup;
    function DefaultOpen: boolean;
    //interface
  end;

var
  frmRepNakloDepend: TfrmRepNakloDepend;

implementation
uses
  AtsAssert,
  untRound,  //ColumnByName
  SkladAux //OpenDocument
  ;

{$R *.dfm}

function TfrmRepNakloDepend.ShowDetail(id_nakl: integer): integer;
begin
  cdsRep.Close;
  cdsRep.Params.ParamByName('id_nakl').asInteger:=id_nakl;
  actRefresh.Execute;
  Result := cdsRep.RecordCount;
end;

procedure TfrmRepNakloDepend.actDetailExecute(Sender: TObject);
begin
  OpenDocument(
    self,
    cdsRep.FieldByName('id_nakl').asInteger,
    cdsRep.FieldByName('tip').asInteger,
    cdsRep.FieldByName('id_nakld').asInteger);
end;

procedure TfrmRepNakloDepend.actRefreshExecute(Sender: TObject);
begin
  dmdEx.StartWaiting;
  cdsRep.Close;
  cdsRep.Open;
  dmdEx.StopWaiting;
end;

procedure TfrmRepNakloDepend.actDebugExecute(Sender: TObject);
begin
  actDebug.Checked := not actDebug.Checked;
  if actDebug.Checked then begin
    ColumnByName(dbgRep.Columns,'ID_NAKL').Visible :=true;
    ColumnByName(dbgRep.Columns,'ID_NAKLD').Visible :=true;
    ColumnByName(dbgRep.Columns,'ID_DET').Visible :=true;
    ColumnByName(dbgRep.Columns,'ID_TOVAR').Visible :=true;
    ColumnByName(dbgRep.Columns,'ID_TARA').Visible :=true;
  end else begin
    ColumnByName(dbgRep.Columns,'ID_NAKL').Visible :=false;
    ColumnByName(dbgRep.Columns,'ID_NAKLD').Visible :=false;
    ColumnByName(dbgRep.Columns,'ID_DET').Visible :=false;
    ColumnByName(dbgRep.Columns,'ID_TOVAR').Visible :=false;
    ColumnByName(dbgRep.Columns,'ID_TARA').Visible :=false;
  end;
end;

procedure TfrmRepNakloDepend.DefaultStartup;
begin
  ShowDetail(314845);
end;

function TfrmRepNakloDepend.DefaultOpen: boolean;
begin
	actRefresh.Execute;
  Result :=true;
  if not cdsRep.Active then begin
    Result :=false;
  end;
end;

procedure TfrmRepNakloDepend.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmRepNakloDepend.dbgRepDblClick(Sender: TObject);
begin
  actDetail.execute;
end;

function TfrmRepNakloDepend._AddRef: integer;
begin
  inc(iRefCount);
  Result := iRefCount;
end;

function TfrmRepNakloDepend._Release: integer;
begin
  dec(iRefCount);
  Result := iRefCount;
  if iRefCount<=0 then begin
    self.Close;
  end;
end;

end.
