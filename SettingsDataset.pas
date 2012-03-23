unit SettingsDataset;
//плагин настроек позволяет отображать любой набор
//данных, в отличие от SettingsSklad.
//при этом клиент должен следить за открытием
//набора данных до его использования в данном плагине
//и за закрытием после использования


interface

uses 
  Windows, Messages, SysUtils, Classes,
  Graphics, Controls, Forms, Dialogs,
  untEx, StdCtrls, Mask, DBCtrlsEh, DBLookupEh,DB,
  Variants, //null
  SettingsPlugin, //TfmSettingsPlugin
  atsAssert, DBGridEh // AssertInternal
  ;

type
  TfmSettingsDataset = class(TfmSettingsPlugin)
    gbxVlad: TGroupBox;
    Label1: TLabel;
    dlcSklad: TDBLookupComboboxEh;
    procedure dlcSkladEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
  public
    { Public declarations }
    procedure Init; override;
    function Filled:boolean; override;
    function GetResult : string; override;
    function GetTextResult: string; override;
    procedure CancelInput; override;
    procedure SetResultType(ResultType: integer);override;
    procedure SetKeyValue(KeyValue: variant);override;
    procedure SetListSource(
      ListSource: TDataSource;
      ListField , KeyField :string);
    procedure SetLabelValue(
      LabelCaption : string;
      GroupBoxCaption:string='';
      ErrorNotFilled:string='');reintroduce;
  private
    FResultType : integer;
    FErrorNotFilled : string;
  end;

implementation

{$R *.dfm}

{ TfmSettingsDataSet }

function TfmSettingsDataset.Filled: boolean;
begin
  Result := true;
  if (FResultType in [0,1]) then begin
    if (dlcSklad.KeyValue = NULL) then begin
      Result := false;
      FErrorMessage := FErrorNotFilled;
    end;
  end;
  if Result then begin
    FOldKeyValue :=dlcSklad.KeyValue;
  end;
  //if FResultType=2, то проверять не надо
end;

procedure TfmSettingsDataset.SetKeyValue(KeyValue: variant);
begin
try
  dlcSklad.KeyValue := KeyValue;
except
  AssertInternal('1D5C4F99-A218-4314-A61C-00B3DB6739B0');
end;
end;

function TfmSettingsDataset.GetResult: string;
var
  sTemp : string;
begin
  //результат в виде "= идентификатор"
  if FResultType=0 then begin
    sTemp :=' = '+ vartostr(dlcSklad.KeyValue);
  end;//if FresultType=0
  //в остальных случаях просто строка, пустая если null
  if (FResultType =1) then begin
    sTemp :=vartostr(dlcSklad.KeyValue);
  end;  //if FresultType=1
  if (FResultType =2) then begin
    sTemp :=vartostr(dlcSklad.KeyValue);
  end;  //if FresultType=1
  Result := sTemp;
end;

function TfmSettingsDataset.GetTextResult: string;
var
  sTemp : string;
begin
  sTemp := dlcSklad.Text;
  Result := sTemp;
end;

procedure TfmSettingsDataset.Init;
begin
//try
//  dmdEx.OpenQuery(dlcSklad.ListSource.DataSet,true);
//except
//  AssertInternal('FDAFA9FE-5EC7-493F-9C26-76BD89DCF0B1');
//end;
end;

procedure TfmSettingsDataset.SetResultType(ResultType: integer);
begin
  //по умолчанию нулевой режим в котором
  //результат возвращается в виде '=1264'
  if not (ResultType in [0,1,2]) then begin
    FResultType := 0;
  end;
  //при режиме =1 возвращается число=фирме
  //при режиме =2 возвращается число=фирме или пустая строка
  //если все фирмы
  FResultType := ResultType;
  case FResultType of
    0 : begin
      dlcSklad.EditButtons[0].Visible := false;
    end; //0
    1: begin
      dlcSklad.EditButtons[0].Visible := false;
    end; //1
    2: begin
      dlcSklad.EditButtons[0].Visible := true;
    end
  end; //case
end;

procedure TfmSettingsDataset.SetListSource(ListSource: TDataSource;
  ListField, KeyField: string);
begin
  dlcSklad.ListSource := nil;
  dlcSklad.ListField :='';
  dlcSklad.KeyField := '';
  dlcSklad.ListSource := ListSource;
  dlcSklad.ListField := ListField;
  dlcSklad.KeyField := KeyField;
  dmdEx.OpenQuery(ListSource.DataSet,true);
end;

procedure TfmSettingsDataset.dlcSkladEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  dlcSklad.KeyValue := Null;
  Handled := true;
end;

procedure TfmSettingsDataset.SetLabelValue(LabelCaption, GroupBoxCaption,
  ErrorNotFilled: string);
begin
  Label1.Caption :=LabelCaption;
  gbxVlad.Caption :=GroupBoxCaption;
  FErrorNotFilled := ErrorNotFilled;
end;

procedure TfmSettingsDataset.CancelInput;
begin
  dlcSklad.KeyValue := FOldKeyValue;
end;

end.
