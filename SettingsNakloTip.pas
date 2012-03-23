unit SettingsNakloTip;

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
  TfmSettingsNakloTip = class(TfmSettingsPlugin)
    gbxVlad: TGroupBox;
    Label1: TLabel;
    cbxFirm: TComboBox;
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

function TfmSettingsNakloTip.Filled: boolean;
begin
  Result := true;
  if (cbxFirm.ItemIndex = -1) then begin
    Result := false;
    FErrorMessage := 'Выберите тип отчёта';
    cbxFirm.SetFocus;
  end;
  if Result then begin
    FOldKeyValue :=cbxFirm.ItemIndex;
  end;
end;

procedure TfmSettingsNakloTip.CancelInput;
begin
  cbxFirm.ItemIndex := FOldKeyValue;
end;


function TfmSettingsNakloTip.GetResult: string;
var
  sTemp : string;
begin
  sTemp := '';
 try
  case cbxFirm.ItemIndex of
    0 : begin
      //выбрали приходы
      sTemp :=' in (1)';
    end;
    1 : begin
      sTemp :=' in (5)';
    end;
    2 : begin
      sTemp := ' in (2)';
    end;
    3 : begin
      sTemp := ' in (30)';
    end;
    4: begin
      sTemp := ' in (103)'
    end;
    5: begin
      sTemp := ' in (5,30,103)'
    end;
    6: begin
      sTemp := '6'
    end;
    7: begin
      sTemp := '7'
    end;
  end; //case
 except
   AssertInternal('E2F6DEE0-1298-49B3-877F-C55E96A4B5DD');
 end;
  Result := sTemp;
end;

function TfmSettingsNakloTip.GetTextResult: string;
var
  sTemp : string;
begin
  sTemp := cbxFirm.Items[cbxFirm.ItemIndex];
  Result := sTemp;
end;

procedure TfmSettingsNakloTip.Init;
begin
  cbxFirm.ItemIndex := -1;
end;

procedure TfmSettingsNakloTip.SetKeyValue(KeyValue: variant);
begin
  cbxFirm.ItemIndex:=KeyValue;
end;

end.
