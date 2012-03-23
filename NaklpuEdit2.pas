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
  iXozOperFact:=dmdEx.GetParamCached('’Œ«ﬂ…—“¬≈ÕÕ€≈ Œœ≈–¿÷»»',
    'select oid from GET_OID_OBJECTS_PC('+quotedstr('’Œ«ﬂ…—“¬≈ÕÕ€≈ Œœ≈–¿÷»»')+',-100)',
    'oid');
  Result :=dmdEx.GetParamCached('œ–»’ŒƒÕ¿ﬂ Õ¿ ”—À”√» ‘¿ “ ◊¿—“‹',
    'select oid from GET_OID_OBJECTS_PC('
      +quotedstr('œ–»’ŒƒÕ¿ﬂ Õ¿ ”—À”√» ‘¿ “ ◊¿—“‹')
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
