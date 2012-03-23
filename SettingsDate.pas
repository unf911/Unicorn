unit SettingsDate;

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
  TfmSettingsDate = class(TfmSettingsPlugin)
    gbxVlad: TGroupBox;
    CheckBox1: TCheckBox;
    dteDateTo: TDBDateTimeEditEh;
    lblDate: TLabel;
    procedure CheckBox1Click(Sender: TObject);
  public
    { Public declarations }
    procedure Init; override;
    function Filled:boolean; override;
    function GetResult : string; override;
    function GetTextResult: string; override;
    procedure SetKeyValue(KeyValue: variant);override;
    procedure SetResultType(ResultType: integer);override;
    procedure CancelInput; override;
    //изменяет надпись рядом с полем выбора
    //используется для  того чтобы вместо
    //"Тип отчёта" написать другой текст
    procedure SetLabelValue(LabelCaption: string);override;
  private
    FResultType : integer;
  end;

implementation

{$R *.dfm}

{ TfmSettingsSklad }


function TfmSettingsDate.Filled: boolean;
begin
  Result := true;
  if FResultType =0 then begin
    if (dteDateTo.Value=null and checkBox1.Checked) and
     (vartype(dteDateTo.Value) and varTypeMask = varDate) then begin
      //если значение null при выборе отчёта на дату и
      //результат является датой, то введите дату
      Result := false;
      FErrorMessage := 'Выберите дату';
      dteDateTo.SetFocus;
    end;
  end;
  if FResultType=1 then begin
    if dteDateTo.Value=null and
     (vartype(dteDateTo.Value) and varTypeMask = varDate) then begin
      //если значение null и
      //результат является датой, то введите дату
      Result := false;
      FErrorMessage := 'Выберите дату';
      dteDateTo.SetFocus;
    end;
  end;
  if result then begin
    FOldKeyValue:=dteDateTo.Value;
  end;
end;


function TfmSettingsDate.GetResult: string;
var
  sTemp : string;
begin
  if CheckBox1.Checked then begin
    sTemp := vartostr(dteDateTo.Value);
  end else begin
    sTemp := '';
  end;
  Result := sTemp;
end;

function TfmSettingsDate.GetTextResult: string;
var
  sTemp : string;
begin
  if CheckBox1.Checked then begin
    sTemp := vartostr(dteDateTo.Value);
  end else begin
    sTemp := '';
  end;
  Result := sTemp;
end;

procedure TfmSettingsDate.Init;
begin
  CheckBox1.Checked:=false;
  CheckBox1Click(self);
  dteDateTo.Value := Date;
end;

procedure TfmSettingsDate.SetKeyValue(KeyValue: variant);
begin
try
  if KeyValue<>Null then begin
    CheckBox1.Checked:=true;
    if (vartype(KeyValue) and varTypeMask = varDate) then begin
      dteDateTo.Value := KeyValue;
    end else begin
      //указали на входе не дату, тогда отобразить сегодняшнюю дату
      dteDateTo.value := Date;
    end;
  end else begin
    CheckBox1.Checked:=false;
  end;
except
  AssertInternal('89FEB051-FE58-4ECF-8A82-22089A22F87D');
end;
end;

procedure TfmSettingsDate.SetLabelValue(LabelCaption: string);
begin
  CheckBox1.Caption :=LabelCaption;
end;

procedure TfmSettingsDate.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then begin
    dteDateTo.Enabled:=true;
  end else begin
    dteDateTo.Enabled :=false;
  end;
end;

procedure TfmSettingsDate.SetResultType(ResultType: integer);
begin
  //по умолчанию нулевой режим в котором
  //вводить дату необязательно. Можно оставить галочку непомеченной
  if not (ResultType in [0,1]) then begin
    FResultType := 0;
  end;
  //при режиме =1 возвращается дата всегда, а не null
  FResultType := ResultType;
  case FResultType of
    0 : begin
      CheckBox1.Checked:=false;
      CheckBox1.Enabled := true;
      CheckBox1.Visible := true;
    end; //0
    1: begin
      CheckBox1.Checked:=true;
      CheckBox1.Enabled := false;
      CheckBox1.Visible := false;

    end; //1
  end; //case
end;

procedure TfmSettingsDate.CancelInput;
begin
  dteDateTo.Value := FOldKeyValue;
end;

end.
