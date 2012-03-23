unit SettingsSklad;

interface

uses 
  Windows, Messages, SysUtils, Classes,
  Graphics, Controls, Forms, Dialogs,
  untEx, StdCtrls, Mask, DBCtrlsEh, DBLookupEh,
  Variants, FMTBcd, DBClient, Provider,
  AtsAssert,
  DB, SqlExpr, DBGridEh,
  SettingsPlugin //null
  ;

type
  TfmSettingsSklad = class(TfmSettingsPlugin)
    gbxVlad: TGroupBox;
    Label1: TLabel;
    dlcSklad: TDBLookupComboboxEh;
    SQLDataSet1: TSQLDataSet;
    DataSetProvider1: TDataSetProvider;
    cdsSkladTree: TClientDataSet;
    procedure dlcSkladEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
  private
    FResultType : integer;
  public
    { Public declarations }
    procedure Init; override;
    function Filled:boolean; override;
    function GetResult : string; override;
    function GetTextResult: string; override;
    procedure SetResultType (ResultType : integer);override;
    procedure SetKeyValue (KeyValue: variant); override;
    procedure CancelInput; override;
    procedure SetLabelValue(LabelCaption: string);override;
  end;

implementation

{$R *.dfm}

{ TfmSettingsSklad }

function TfmSettingsSklad.Filled: boolean;
begin
  Result := true;
  if FResultType=0 then begin
    if (dlcSklad.KeyValue = null) then begin
      Result := false;
      FErrorMessage := '¬ыберите склад';
    end;
  end;
  if FResultType=1 then begin
    Result := true; //в первом режиме можно оставл€ть
    //пустое значение склада, т.е. выбрать все склады
  end;
  if Result then begin
    FOldKeyValue :=dlcSklad.KeyValue;
  end;
end;

procedure TfmSettingsSklad.CancelInput;
begin
  dlcSklad.KeyValue := FOldKeyValue;
end;

function TfmSettingsSklad.GetResult: string;
var
  sTemp : string;
begin
  if FResultType in [0,2] then begin
    sTemp :='';
    if FResultType=2 then begin
      if dlcSklad.KeyValue=Null then begin
        exit;
      end;
    end;
    //все склады
    cdsSkladTree.close;
    cdsSkladTree.Params.ParamByName('oid').asInteger := dlcSklad.KeyValue;
    cdsSkladTree.Open;
    sTemp := dmdEx.GetWhereInList(cdsSkladTree,'oid');
    sTemp := ' in '+sTemp;

  end;
  if FResultType=1 then begin
    sTemp :=vartostr(dlcSklad.KeyValue);
  end; //if FResultType=1
  Result := sTemp;
end;

function TfmSettingsSklad.GetTextResult: string;
var
  sTemp : string;
begin
  sTemp := dlcSklad.Text;
  Result := sTemp;
end;

procedure TfmSettingsSklad.Init;
begin
  dmdEx.cdsSklads.Open;
end;

procedure TfmSettingsSklad.SetResultType(ResultType: integer);
begin
  //по умолчанию нулевой режим в котором
  //результат возвращаетс€ в виде 'in (1)'
  //mode=2 - в виде списка или null. ƒл€ отчЄта расходу со склада
  if not (ResultType in [0,1]) then begin
    FResultType := 0;
  end;
  FResultType := ResultType;
  case FResultType of
    0 : begin
      dlcSklad.EditButtons[0].Visible := false;
    end; //0
    1: begin
      dlcSklad.EditButtons[0].Visible := true;
    end; //1
    2: begin
      dlcSklad.EditButtons[0].Visible := true;
    end;
  end; //case
end;

procedure TfmSettingsSklad.SetKeyValue(KeyValue: variant);
begin
try
  dlcSklad.KeyValue := KeyValue;
except
  AssertInternal('E4FB31F1-BD5D-445B-B795-D3ACC68AA1C4');
end;
end;



procedure TfmSettingsSklad.dlcSkladEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  dlcSklad.KeyValue := Null;
  Handled := true;
end;

procedure TfmSettingsSklad.SetLabelValue(LabelCaption: string);
begin
  Label1.Caption :=LabelCaption;
end;

end.
