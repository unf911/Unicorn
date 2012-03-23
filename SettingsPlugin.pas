unit SettingsPlugin;

interface

uses
  Forms
  ;

type
  TfmSettingsPlugin = class(TFrame)
  protected
    { Private declarations }
    FErrorMessage : string;
    FOldKeyValue : variant;
    FResultType : integer;
  public
    { Public declarations }
    procedure Init; virtual; abstract;
    function Filled:boolean; virtual; abstract;
    function GetLastErrorMessage: string;
    function GetResult : string; virtual; abstract;
    function GetTextResult: string; virtual; abstract;
    procedure SetKeyValue (KeyValue: variant);virtual;abstract;
    procedure CancelInput; virtual; abstract;
    procedure SetResultType (ResultType : integer);virtual;
    procedure SetLabelValue(LabelCaption: string);virtual;
    procedure AddDetailTip (DetailTip : string; DetailPosition: integer = -1);virtual;
  end;


implementation

procedure TfmSettingsPlugin.AddDetailTip(DetailTip: string;
  DetailPosition: integer);
begin
  //empty for SettingsTipDetail
end;

function TfmSettingsPlugin.GetLastErrorMessage: string;
begin
  Result := FErrorMessage;
end;

procedure TfmSettingsPlugin.SetLabelValue(LabelCaption: string);
begin

end;

procedure TfmSettingsPlugin.SetResultType(ResultType: integer);
begin
  FResultType:=ResultType;
end;

end.
