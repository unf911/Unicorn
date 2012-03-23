unit SettingsTipGroup;

interface

uses 
  Windows, Messages, SysUtils, Classes,
  Graphics, Controls, Forms, Dialogs,
  untEx, StdCtrls, Mask, DBCtrlsEh, DBLookupEh,
  Variants, //null
  SettingsPlugin, //TfmSettingsPlugin
  atsAssert // AssertInternal
  ;

type
  TfmSettingsTipGroup = class(TfmSettingsPlugin)
    gbxVlad: TGroupBox;
    Label1: TLabel;
    cbxFirm: TComboBox;
  public
    { Public declarations }
    procedure Init; override;
    function Filled:boolean; override;
    function GetResult : string; override;
    function GetTextResult: string; override;
    procedure AddDetailTip (DetailTip : string;
      DetailPosition: integer = -1);override;
    procedure SetKeyValue(KeyValue: variant);override;
    procedure CancelInput;override;

  end;

implementation

{$R *.dfm}

{ TfmSettingsSklad }

procedure TfmSettingsTipGroup.AddDetailTip(DetailTip: string;
  DetailPosition: integer);
begin
  if DetailPosition =-1 then begin
    cbxFirm.Items.Add(DetailTip);
  end else begin
    cbxFirm.Items.Insert(DetailPosition,DetailTip);
  end;
end;

function TfmSettingsTipGroup.Filled: boolean;
begin
  Result := true;
  if (cbxFirm.ItemIndex = -1) then begin
    Result := false;
    FErrorMessage := 'Выберите тип группирования';
    cbxFirm.SetFocus;
  end;
  if Result then begin
    FOldKeyValue :=cbxFirm.ItemIndex;
  end;
end;


function TfmSettingsTipGroup.GetResult: string;
var
  sTemp : string;
begin
  sTemp := inttostr(cbxFirm.ItemIndex);
  Result := sTemp;
end;

function TfmSettingsTipGroup.GetTextResult: string;
var
  sTemp : string;
begin
  sTemp := cbxFirm.Items[cbxFirm.ItemIndex];
  Result := sTemp;
end;

procedure TfmSettingsTipGroup.Init;
begin
  cbxFirm.ItemIndex := -1;
end;

procedure TfmSettingsTipGroup.SetKeyValue(KeyValue: variant); 
begin
try
  cbxFirm.ItemIndex := KeyValue;
except
  AssertInternal('89FEB051-FE58-4ECF-8A82-22089A22F87D');
end;
end;

procedure TfmSettingsTipGroup.CancelInput;
begin
  cbxFirm.ItemIndex := FOldKeyValue;
end;


end.
