unit Naklpu2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Naklru, FMTBcd, PropFilerEh, UnfFilter, frxDesgn, Menus,
  frxClass, frxDBSet, PropStorageEh, DB, DBClient, Provider, SqlExpr,
  Curr2StrRU, QueryExtender, ActnList, DBCtrls, untUnfDbLookupListbox,
  Buttons, StdCtrls, ExtCtrls, GridsEh, DBGridEh,
  AtsAssert,
  SkladAux,  //ProcessSettingsVladClientManager
  untRound, //ApplyOrCancel
  NaklpuEdit2 //TfrmNaklpuEdit2

  ;

type
  TfrmNaklpu2 = class(TfrmNaklru)
    procedure dspNakloGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure ProcessSettings(ProcessOnlySecurityMeasures:boolean=false);override;
    function GetIdAllStatya: integer;override;
    procedure CreateEditForm;override;
    function GetIdXozOperBezKom: integer;override;
    function CreateNewInputForm: TfrmNaklru; override;
  public
    { Public declarations } 
    procedure Test;override;

  end;

var
  frmNaklpu2: TfrmNaklpu2;

implementation

uses untEx;



{$R *.dfm}
procedure TfrmNaklpu2.ProcessSettings(ProcessOnlySecurityMeasures:boolean=false);
begin
try
  ProcessSettingsVladClientManager(qeNaklo,setT,ProcessOnlySecurityMeasures);
  ProcessShowDeleted;
  if not ProcessOnlySecurityMeasures then begin
    self.Caption := UpdateCaptionVladClientManager('��������� �� ������:',setT);
  end;
except
  AssertInternal('5CE18C1E-A0A0-41E3-85DB-2AFC8794FC92');
end;
end;

procedure TfrmNaklpu2.Test;
begin
  DefaultStartup;
  DefaultOpen;
end;

function TfrmNaklpu2.GetIdAllStatya: integer;
var
  iTipProject : integer;
begin
  iTipProject:=dmdEx.GetParamCached('��� ������ ������� � ��������',
    'select oid from GET_OID_OBJECTS_PC('+quotedstr('��� ������ ������� � ��������')+',-100)',
    'oid');
  Result :=dmdEx.GetParamCached('��� ������ ��������',
    'select oid from GET_OID_PREDEFINED_PC('
      +quotedstr('��� ������ ��������')
      +','+inttostr(iTipProject)+')',
    'oid');
end;

procedure TfrmNaklpu2.CreateEditForm;
begin
  frmEdit := TfrmNaklpuEdit2.Create(self);
end;

function TfrmNaklpu2.GetIdXozOperBezKom: integer;
var
  iXozOperFact : integer;
begin
  iXozOperFact:=dmdEx.GetParamCached('������������� ��������',
    'select oid from GET_OID_OBJECTS_PC('+quotedstr('������������� ��������')+',-100)',
    'oid');
  Result :=dmdEx.GetParamCached('��������� �� ������ ��� ��������',
    'select oid from GET_OID_OBJECTS_PC('
      +quotedstr('��������� �� ������ ��� ��������')
      +','+inttostr(iXozOperFact)+')',
    'oid');
end;
procedure TfrmNaklpu2.dspNakloGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
  TableName:='NAKLPU_VW';
end;

function TfrmNaklpu2.CreateNewInputForm: TfrmNaklru;
begin
  Result := TfrmNaklpu2.Create(self);  
end;

procedure TfrmNaklpu2.FormCreate(Sender: TObject);
begin
  inherited;
  dmdEx.OpenQuery (dmdEx.cdsPost);
  actPreview.Visible := false;
end;



end.
