unit SettingsClient;

interface

uses 
  Windows, Messages, SysUtils, Classes,
  Graphics, Controls, Forms, Dialogs,
  untEx, StdCtrls, Mask, DBCtrlsEh, DBLookupEh,DB,
  Variants, //null
  SettingsPlugin,
  atsAssert, DBGridEh // AssertInternal
  ;

type
  TfmSettingsClient = class(TfmSettingsPlugin)
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
    procedure CancelInput; override;
    procedure SetKeyValue(KeyValue: variant);override;
  end;

implementation

{$R *.dfm}

{ TfmSettingsSklad }

function TfmSettingsClient.Filled: boolean;
begin
  Result := true;
  if Result then begin
    FOldKeyValue :=dlcTovar.KeyValue;
  end;
end;

procedure TfmSettingsClient.CancelInput;
begin
  dlcTovar.KeyValue := FOldKeyValue;
end;

function TfmSettingsClient.GetResult: string;
var
  sTemp : string;
begin
  sTemp := vartostr(dlcTovar.KeyValue);
  Result := sTemp;
end;

function TfmSettingsClient.GetTextResult: string;
var
  sTemp : string;
begin
  if dlcTovar.Text='' then begin
    sTemp := 'Все клиенты';
  end else begin
    sTemp := dlcTovar.Text;
  end;
  Result := sTemp;
end;

procedure TfmSettingsClient.Init;
begin
try
  dmdEx.cdsClient.Open;
except
  AssertInternal('FDAFA9FE-5EC7-493F-9C26-76BD89DCF0B1');
end;
end;

procedure TfmSettingsClient.dlcTovarEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  dlcTovar.KeyValue := Null;
  Handled :=true;
end;

procedure TfmSettingsClient.SetKeyValue(KeyValue: variant);
begin
try
  dlcTovar.KeyValue := KeyValue;
except
  AssertInternal('734DA4EA-4AC2-4C44-9F60-C1E991A7DD63');
end;
end;

end.
