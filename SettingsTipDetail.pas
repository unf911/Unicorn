unit SettingsTipDetail;

interface

uses 
  Windows, Messages, SysUtils, Classes,
  Graphics, Controls, Forms, Dialogs,
  untEx, StdCtrls, Mask, DBCtrlsEh, DBLookupEh,
  Variants, //null
  untRound, //vartoint
  SettingsPlugin, //TfmSettingsPlugin
  atsAssert // AssertInternal
  ;

type
  TfmSettingsTipDetail = class(TfmSettingsPlugin)
    gbxVlad: TGroupBox;
    Label1: TLabel;
    cbxFirm: TDBComboBoxEh;
    procedure DBComboBoxEh1EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
  protected
    FOldKeyValue :integer;
    FResultType : integer;
  public

    { Public declarations }
    procedure Init; override;
    function Filled:boolean; override;
    function GetResult : string; override;
    function GetTextResult: string; override;
    procedure CancelInput; override;
    procedure AddDetailTip (DetailTip : string; DetailPosition: integer = -1);override;
    procedure SetKeyValue(KeyValue: variant);override;
    //изменяет надпись рядом с полем выбора
    //используется для  того чтобы вместо
    //"Тип отчёта" написать другой текст
    procedure SetLabelValue(LabelCaption: string);override;
    procedure SetResultType(ResultType: integer);override;

  end;

implementation

{$R *.dfm}

{ TfmSettingsSklad }

procedure TfmSettingsTipDetail.AddDetailTip(DetailTip: string;
  DetailPosition: integer);
begin
  if DetailPosition =-1 then begin
    cbxFirm.Items.Add(DetailTip);
  end else begin
    cbxFirm.Items.Insert(DetailPosition,DetailTip);
  end;
end;

function TfmSettingsTipDetail.Filled: boolean;
begin
  Result := true;
  if FResultType=0 then begin
    if (cbxFirm.ItemIndex = -1) then begin
      Result := false;
      FErrorMessage := 'Выберите тип отчёта';
      cbxFirm.SetFocus;
    end;
  end;
  if FResultType=1 then begin
    Result := true; //в первом режиме можно оставлять
    //пустое значение склада, т.е. выбрать все склады
  end;
  if Result then begin
    FOldKeyValue :=cbxFirm.ItemIndex;
  end;
end;


function TfmSettingsTipDetail.GetResult: string;
var
  sTemp : string;
begin
  sTemp := inttostr(cbxFirm.ItemIndex);
  Result := sTemp;
end;

function TfmSettingsTipDetail.GetTextResult: string;
var
  sTemp : string;
begin
  sTemp := cbxFirm.Items[cbxFirm.ItemIndex];
  Result := sTemp;
end;

procedure TfmSettingsTipDetail.Init;
begin
  cbxFirm.ItemIndex := -1;
end;

procedure TfmSettingsTipDetail.SetKeyValue(KeyValue: variant);
begin
try
  cbxFirm.ItemIndex := VartoInt(keyvalue,true);
except
  AssertInternal('89FEB051-FE58-4ECF-8A82-22089A22F87D');
end;
end;

procedure TfmSettingsTipDetail.SetLabelValue(LabelCaption: string);
begin
  Label1.Caption :=LabelCaption;
end;

procedure TfmSettingsTipDetail.DBComboBoxEh1EditButtons0Click(
  Sender: TObject; var Handled: Boolean);
begin
  cbxFirm.ItemIndex := -1;
  Handled := true;
end;

procedure TfmSettingsTipDetail.SetResultType(ResultType: integer);
begin
  //по умолчанию нулевой режим в котором
  //результат возвращается в виде 'in (1)'
  if not (ResultType in [0,1]) then begin
    FResultType := 0;
  end;
  FResultType := ResultType;
  case FResultType of
    0 : begin
      cbxFirm.EditButtons[0].Visible := false;
    end; //0
    1: begin
      cbxFirm.EditButtons[0].Visible := true;
    end; //1
  end; //case
end;

procedure TfmSettingsTipDetail.CancelInput;
begin
  cbxFirm.ItemIndex := FOldKeyValue;
end;

end.
