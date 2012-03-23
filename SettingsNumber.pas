unit SettingsNumber;

//обязательна ссылка
// uses SettingsSklad //TfmSettingsSklad
//иначе плагин работать не будет

interface

uses
  Windows, Messages, SysUtils, Classes,
  Graphics, Controls, Forms, Dialogs,
  untEx, StdCtrls, Mask, DBCtrlsEh, DBLookupEh,
  Variants, FMTBcd, DBClient,
  Provider, DB,
  AtsAssert,
  SettingsPlugin, //TfmSettingsPlugin
  SqlExpr //null
  ;

type
  TfmSettingsNumber = class(TfmSettingsPlugin)
    gbxVlad: TGroupBox;
    Label1: TLabel;
    dbnNumber: TDBNumberEditEh;
    procedure dbnNumberEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
  public
    { Public declarations }
    procedure Init; override;
    function Filled:boolean; override;
    function GetResult : string; override;
    function GetTextResult: string; override;
    procedure SetKeyValue(KeyValue: variant); override;
    procedure SetResultType(ResultType: integer); override;
    procedure SetLabelValue(LabelCaption, GroupBoxCaption,ErrorNotFilled: string);reintroduce;
    procedure CancelInput; override;
  private
     FErrorNotFilled : string;
     FResultType : integer;
  end;

implementation

{$R *.dfm}

{ TfmSettingsTovar }

function TfmSettingsNumber.Filled: boolean;
begin
  Result := true;
  if (FResultType =0) then begin
    if (dbnNumber.Value = NULL) then begin
      Result := false;
      FErrorMessage := FErrorNotFilled;
    end;
  end;
  if Result then begin
    FOldKeyValue :=dbnNumber.Value;
  end;
  //if FResultType=2, то проверять не надо
end;

function TfmSettingsNumber.GetResult: string;
var
  sTemp : string;
begin
  sTemp := vartostr(dbnNumber.Value);
  Result := sTemp;
end;

function TfmSettingsNumber.GetTextResult: string;
var
  sTemp : string;
begin
  case FResultType of
    0: begin
      if dbnNumber.Value=Null then begin
        sTemp := 'Все номера';
      end else begin
        sTemp := dbnNumber.Text;
      end;
    end;
    1,2: begin
      if dbnNumber.Value=Null then begin
        sTemp := '';
      end else begin
        sTemp := dbnNumber.Text;
      end;
    end;
  end;//case
  Result := sTemp;
end;

procedure TfmSettingsNumber.Init;
begin
  SetResultType(1);
  //dmdEx.cdsTovarAllND.Open;
end;

procedure TfmSettingsNumber.SetKeyValue(KeyValue: variant);
begin
try
  dbnNumber.Value := KeyValue;
except
  AssertInternal('4B015F05-0D6D-4A70-98B0-22038D905D9E');
end;
end;

procedure TfmSettingsNumber.dbnNumberEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  dbnNumber.Value := Null;
  Handled := true;
end;

procedure TfmSettingsNumber.SetLabelValue(LabelCaption, GroupBoxCaption,
  ErrorNotFilled: string);
begin
  Label1.Caption :=LabelCaption;
  gbxVlad.Caption :=GroupBoxCaption;
  FErrorNotFilled := ErrorNotFilled;
end;


procedure TfmSettingsNumber.SetResultType(ResultType: integer);
begin
  //по умолчанию нулевой режим в котором
  //результат возвращается в виде '=1264'
  if not (ResultType in [0,1]) then begin
    FResultType := 1;
  end;
  //при режиме =0 возвращается число=фирме
  //при режиме =1 возвращается число=фирме или пустая строка
  //если все фирмы
  FResultType := ResultType;
  case FResultType of
    0 : begin
      dbnNumber.EditButtons[0].Visible := false;
    end; //0
    1: begin
      dbnNumber.EditButtons[0].Visible := true;
    end; //1
    2: begin
      dbnNumber.DecimalPlaces := 8;
      dbnNumber.EditButtons[0].Visible := true;
    end; //1
  end; //case
end;

procedure TfmSettingsNumber.CancelInput;
begin
  dbnNumber.Value := FOldKeyValue;
end;

end.
