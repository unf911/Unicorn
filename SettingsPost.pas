unit SettingsPost;

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
  SqlExpr, DBGridEh //null
  ;

type
  TfmSettingsPost = class(TfmSettingsPlugin)
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
    procedure CancelInput;override;
  end;

implementation

{$R *.dfm}

{ TfmSettingsTovar }

function TfmSettingsPost.Filled: boolean;
begin
  Result := true;
  if Result then begin
    FOldKeyValue :=dlcTovar.KeyValue;
  end;
end;

function TfmSettingsPost.GetResult: string;
var
  sTemp : string;
begin
  sTemp := vartostr(dlcTovar.KeyValue);
  Result := sTemp;
end;

function TfmSettingsPost.GetTextResult: string;
var
  sTemp : string;
begin
  if dlcTovar.Text='' then begin
    sTemp := 'Все поставщики';
  end else begin
    sTemp := dlcTovar.Text;
  end;
  Result := sTemp;
end;

procedure TfmSettingsPost.Init;
begin
  dmdEx.cdsPost.Open;
end;

procedure TfmSettingsPost.dlcTovarEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  dlcTovar.KeyValue := Null;
  Handled :=true;
end;

procedure TfmSettingsPost.SetKeyValue(KeyValue: variant);
begin
try
  dlcTovar.KeyValue := KeyValue;
except
  AssertInternal('734DA4EA-4AC2-4C44-9F60-C1E991A7DD63');
end;
end;

procedure TfmSettingsPost.CancelInput;
begin
  dlcTovar.keyvalue.ItemIndex := FOldKeyValue;
end;


end.
