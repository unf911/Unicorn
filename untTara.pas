unit untTara;

interface

uses
  Windows, Messages, SysUtils,
  Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh,
  ATSAssert,
  untEx, FMTBcd, DB, StdCtrls,
  Buttons, DBClient, Provider, SqlExpr, ActnList,
  untSklostDet, UnfFilter, GridsEh, PropFilerEh, PropStorageEh  //детализация барабана
  ;

type
  TfrmTara = class(TForm)
    DBGridEh1: TDBGridEh;
    sdsTara: TSQLDataSet;
    dspTara: TDataSetProvider;
    cdsTara: TClientDataSet;
    dsTara: TDataSource;
    cdsTaraNOMER_TARY: TStringField;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cdsTaraTARA: TStringField;
    cdsTaraID_TARA: TIntegerField;
    cdsTaraID_OSTT: TIntegerField;
    ActionList1: TActionList;
    actDetail: TAction;
    BitBtn3: TBitBtn;
    UnfFilter1: TUnfFilter;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    procedure FormCreate(Sender: TObject);
    procedure actDetailExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    //показ формы для выбора тары. если =mrOk тогда выбрана тара
    function ShowTara(id_sklad:integer;var id_ostt:integer):integer;
    //дописываем нужный барабан в датасет
//    function FillTara (cdsNaklodet: TClientDataSet;id_sklad : integer;var id_ostt :integer):integer;
  end;

var
  frmTara: TfrmTara;

implementation

{$R *.dfm}
{
function TfrmTara.FillTara(cdsNaklodet: TClientDataSet;id_sklad :integer;var id_ostt :integer): integer;
var
  id_ostt2 : integer;
begin
try
  Result := ShowTara(id_sklad,id_ostt2);
  id_ostt := id_ostt2;
  if ((cdsNaklodet.Active) and (Result=mrOk)) then begin
    cdsNaklodet.Insert;
    cdsNaklodet.FieldByName('id_tara').asInteger :=
      cdsTara.FieldBYname('id_tara').asInteger;
    cdsNaklodet.FieldByName('nomer_tary').AsString:=
      cdsTara.FieldByName('nomer_tary').AsString;
    cdsNaklodet.FieldByName('kolbuxt').AsInteger := 0;
    cdsNaklodet.FieldByName('kolotp').AsFloat := 0;
    cdsNaklodet.FieldByName('tip').AsInteger := 4; //намотка
  end;
except
  AssertInternal ('86E245F7-09DD-45AE-A17D-C11430709266');
end;
end;
}
procedure TfrmTara.FormCreate(Sender: TObject);
begin
  //cdsTara.Open;
end;

function TfrmTara.ShowTara(id_sklad :integer;var id_ostt: integer): integer;
var
  iRes : integer;
begin
  Result :=0;
try
  cdsTara.Params.ParamByName('id_sklad').asInteger := id_sklad;
  cdsTara.Open;
  iRes :=self.ShowModal;
  if (iRes=mrOk) then begin
    id_ostt:= cdsTara.FieldByName('id_ostt').AsInteger;
  end;
  if (iRes =mrCancel) then begin
    id_ostt:=0; //cancel
  end;
  Result := iRes;
except
  AssertInternal ('DFCD83B0-A880-4D69-BACA-2FA245E46E56');
end;
end;

procedure TfrmTara.actDetailExecute(Sender: TObject);
var
  frmSklostDet : TfrmSklostDet;
begin
try
  frmSklostDet := TfrmSklostDet.Create(self);

  frmSklostDet.ShowDetailModal(
    cdsTara.FieldBYName('id_ostt').asInteger);
  frmSklostdet.free;
except
  AssertInternal ('8643AB99-969C-4B9E-B673-303FF2E7CF9F');
end;
end;

end.
