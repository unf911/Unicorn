unit NaklpuEdit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NaklruEdit, DBGridEh, PropFilerEh, PropStorageEh, DB, ActnList,
  DBCtrlsEh, StdCtrls, Buttons, DBLookupEh, Mask,
  untNaklrList, DBCtrls  //TfrmNaklrList
  ;

type
  TfrmNaklpuEdit2 = class(TfrmNaklruEdit)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    function GetIdXozOper: integer; override;
    procedure SelectNaklStrategy(frmNaklrList : TfrmNaklrList); override;
  end;

var
  frmNaklpuEdit2: TfrmNaklpuEdit2;

implementation

uses untEx;

{$R *.dfm}

{ TfrmNaklpuEdit2 }

procedure TfrmNaklpuEdit2.SelectNaklStrategy(frmNaklrList: TfrmNaklrList);
begin
  frmNaklrList.ShowNaklpu;
end;

function TfrmNaklpuEdit2.GetIdXozOper: integer;
var
  iXozOperFact : integer;
begin
  iXozOperFact:=dmdEx.GetParamCached('������������� ��������',
    'select oid from GET_OID_OBJECTS_PC('+quotedstr('������������� ��������')+',-100)',
    'oid');
  Result :=dmdEx.GetParamCached('��������� �� ������ ���� �����',
    'select oid from GET_OID_OBJECTS_PC('
      +quotedstr('��������� �� ������ ���� �����')
      +','+inttostr(iXozOperFact)+')',
    'oid');
end;

procedure TfrmNaklpuEdit2.FormCreate(Sender: TObject);
begin
  inherited;
  lcbDogovor.Visible := false;
  lblDogovor.Visible := false;
end;

end.
