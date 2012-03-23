unit RepReysDet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, QueryExtender, DBTables, Grids, DBGrids,
  StdCtrls, DBGridEh, FMTBcd, DBClient, Provider, SqlExpr,
  untEx, Buttons, ActnList, UnfFilter, atsAssert,
  GridsEh,
  PropFilerEh, PropStorageEh;

type
  TfrmRepReysDet = class(TForm)
    qeDet: TQueryExtender;
    dsReysDet: TDataSource;
    DBGridEh1: TDBGridEh;
    ActionList1: TActionList;
    actExit: TAction;
    BitBtn1: TBitBtn;
    UnfFilter1: TUnfFilter;
    BitBtn2: TBitBtn;
    actDetail: TAction;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    sdsReysDet: TSQLDataSet;
    dspReysDet: TDataSetProvider;
    cdsReysDet: TClientDataSet;
    SQLTimeStampField1: TSQLTimeStampField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    SmallintField1: TSmallintField;
    cdsReysDetNDS: TFMTBCDField;
    cdsReysDetTIP_NAME: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actDetailExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ShowRepReysDet(id_reys: integer):integer;
    procedure Test;
  end;

var
  frmRepReysDet: TfrmRepReysDet;

implementation


{$R *.dfm}

uses SkladAux; //OpenDocument

procedure TfrmRepReysDet.FormCreate(Sender: TObject);
begin
  cdsReysDet.Close;
  qeDet.DefSql := sdsReysDet.CommandText;
end;

function TfrmRepReysDet.ShowRepReysDet(id_reys: integer): integer;
begin
  cdsReysDet.Params.ParamByName('tip_naklr').AsInteger :=
    dmdEx.GetParamCached('–¿—’ŒƒÕ€≈ Õ¿ À¿ƒÕ€≈',
     'select oid from GET_OID_OBJECTS_PC('
       +quotedstr('–¿—’ŒƒÕ€≈ Õ¿ À¿ƒÕ€≈')
       +',-100)',
     'oid');
  cdsReysDet.Params.ParamByName('tip_perem').AsInteger :=
    dmdEx.GetParamCached('¡”’√¿À“≈–— Œ≈ œ≈–≈Ã≈Ÿ≈Õ»≈',
      'select oid from GET_OID_OBJECTS_PC('
        +quotedstr('¡”’√¿À“≈–— Œ≈ œ≈–≈Ã≈Ÿ≈Õ»≈')
        +',-100)',
      'oid');
  cdsReysDet.Params.ParamByName('tip_naklp').AsInteger :=
    dmdEx.GetParamCached('œ–»’ŒƒÕ€≈ Õ¿ À¿ƒÕ€≈',
      'select oid from GET_OID_OBJECTS_PC('
        +quotedstr('œ–»’ŒƒÕ€≈ Õ¿ À¿ƒÕ€≈')
        +',-100)',
      'oid');
  cdsReysDet.Params.ParamByName('tip_naklp_tara').AsInteger :=
    dmdEx.GetParamCached('œ–»’Œƒ “¿–€',
      'select oid from GET_OID_OBJECTS_PC('
        +quotedstr('œ–»’Œƒ “¿–€')
        +',-100)',
      'oid');
  cdsReysDet.Params.ParamByName('id_reys').asInteger := id_reys;
  cdsReysDet.Open;
  self.Caption := 'ƒÂÚ‡ÎËÁ‡ˆËˇ ÂÈÒ‡';
  result := 0;
end;


procedure TfrmRepReysDet.actExitExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmRepReysDet.BitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOk;
  close;
end;

procedure TfrmRepReysDet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TfrmRepReysDet.DBGridEh1DblClick(Sender: TObject);
begin
  actDetail.Execute; 
end;

procedure TfrmRepReysDet.DBGridEh1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return : begin
      actDetail.Execute;
    end;
  end;
end;

procedure TfrmRepReysDet.actDetailExecute(Sender: TObject);
begin
try
  if dsReysDet.DataSet.Eof and dsReysDet.DataSet.Bof then begin
    exit;
  end;
  OpenDocument(self,
    dsReysDet.DataSet.FieldByName('id_nakl').AsInteger,
    dsReysDet.DataSet.FieldByName('tip').AsInteger,
    0);
except
  AssertInternal('410FBB30-DB3F-420A-8866-AA5A65356683');
end;
end;



procedure TfrmRepReysDet.Test;
begin
  ShowRepReysDet(1);
  self.ModalResult := mrOk;
end;

end.
