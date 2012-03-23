unit SettingsTovar;

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
  SettingsPlugin, 
  SqlExpr, DBGridEh //null
  ;

type
  TfmSettingsTovar = class(TfmSettingsPlugin)
    gbxVlad: TGroupBox;
    Label1: TLabel;
    dlcTovar: TDBLookupComboboxEh;
    procedure dlcTovarEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
  public
    { Public declarations }
    procedure Init; override;
    function Filled:boolean; override;
    function GetResult : string; override;
    function GetTextResult: string; override;
    procedure SetKeyValue(KeyValue: variant);override;
    procedure SetLabelValue(LabelCaption: string);override;
    procedure CancelInput; override;
  end;

implementation

{$R *.dfm}

{ TfmSettingsTovar }

function TfmSettingsTovar.Filled: boolean;
begin
  Result := true;
  if Result then begin
    FOldKeyValue :=dlcTovar.KeyValue;
  end;
end;

procedure TfmSettingsTovar.CancelInput;
begin
  dlcTovar.KeyValue := FOldKeyValue;
end;


function TfmSettingsTovar.GetResult: string;
var
  sTemp : string;
begin
  sTemp := vartostr(dlcTovar.KeyValue);
  Result := sTemp;
end;

function TfmSettingsTovar.GetTextResult: string;
var
  sTemp : string;
begin
  if dlcTovar.Text='' then begin
    sTemp := 'Все товары';
  end else begin
    sTemp := dlcTovar.Text;
  end;
  Result := sTemp;
end;

procedure TfmSettingsTovar.Init;
begin
  dmdEx.cdsTovarAllND.Open;
end;

procedure TfmSettingsTovar.dlcTovarEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  dlcTovar.KeyValue := Null;
  Handled :=true;
end;

procedure TfmSettingsTovar.SetKeyValue(KeyValue: variant);
begin
try
  dlcTovar.KeyValue := KeyValue;
except
  AssertInternal('2105E3D5-E61C-413B-ABA3-609BD56B61C2');
end;
end;

procedure TfmSettingsTovar.SetLabelValue(LabelCaption: string);
begin
  Label1.Caption :=LabelCaption;
end;

end.
