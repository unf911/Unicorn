unit SettingsManager;

//недоделано

interface

uses 
  Windows, Messages, SysUtils, Classes,
  Graphics, Controls, Forms, Dialogs,
  untEx, StdCtrls, Mask, DBCtrlsEh, DBLookupEh,
  Variants, //null
  SettingsPlugin, //TfmSettingsPlugin
  atsAssert, DBGridEh, FMTBcd, DB, SqlExpr, Provider, DBClient // AssertInternal
  ;

type
  TfmSettingsManager = class(TfmSettingsPlugin)
    gbxVlad: TGroupBox;
    Label1: TLabel;
    dlcTovar: TDBLookupComboboxEh;
    dsItems: TDataSource;
    procedure dlcTovarEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
  private
    FResultType : integer;
    function VisibleArea: integer;
  public
    { Public declarations }
    procedure Init; override;
    function Filled:boolean; override;
    function GetResult : string; override;
    function GetTextResult: string; override;
    procedure CancelInput;  override;
    procedure SetKeyValue(KeyValue: variant);override;
    procedure SetResultType (ResultType : integer);override;
  end;

implementation

{$R *.dfm}

function TfmSettingsManager.Filled: boolean;
begin
  Result := true;
  {
  if (FResultType in [3]) then begin
    if dlcTovar.KeyValue=null then begin
      Result :=false;
    end;
  end;  }
  if Result then begin
    FOldKeyValue :=dlcTovar.KeyValue;
  end;
end;

procedure TfmSettingsManager.CancelInput;
begin
  dlcTovar.KeyValue := FOldKeyValue;
end;

function TfmSettingsManager.GetResult: string;
begin
  Result :='';
  if (FResultType in [0,1,3]) then begin
    Result := vartostr(dlcTovar.KeyValue);
  end;
  if (FResultType in [2])  then begin
    if dlcTovar.KeyValue = null then begin
      //пустое значение = все менеджеры из списка, а не все
      //менеджеры вообще
      dlcTovar.ListSource.DataSet.Locate('id',VisibleArea,[]);
    end;
    Result := '('+dlcTovar.ListSource.DataSet.FieldByName('child_list').asString+')';
  end;
end;


function TfmSettingsManager.GetTextResult: string;
var
  sTemp : string;
begin
  if dlcTovar.Text='' then begin
    sTemp := 'Все менеджеры';
  end else begin
    sTemp := dlcTovar.Text;
  end;
  Result := sTemp;
end;

procedure TfmSettingsManager.Init;
begin
try
  dlcTovar.ListSource.Dataset.Open;
except
  AssertInternal('FDAFA9FE-5EC7-493F-9C26-76BD89DCF0B1');
end;
end;

procedure TfmSettingsManager.SetKeyValue(KeyValue: variant);
begin
try
  dlcTovar.KeyValue := KeyValue;
except
  AssertInternal('FB4A3A43-0A0E-457E-8AFE-A12BE1EF6ED9');
end;
end;

procedure TfmSettingsManager.dlcTovarEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  dlcTovar.KeyValue := Null;
  Handled :=true;
end;

procedure TfmSettingsManager.SetResultType(ResultType: integer);
begin
  if not (ResultType in [0,1]) then begin
    FResultType := 1;
  end;
  FResultType := ResultType;
  case FResultType of
    0 : begin
      dlcTovar.EditButtons[0].Visible := false;
    end; //0
    1: begin
      dlcTovar.EditButtons[0].Visible := true;
    end; //1
    2: begin
      //пустое значение = все менеджеры из списка, а не все
      //менеджеры вообще
      dlcTovar.EditButtons[0].Visible := true;
    end;
    3: begin
      //только менеджеры из списка, и можно выбрать пустое значение
      dlcTovar.EditButtons[0].Visible := true;
    end;
  end; //case
end;

function TfmSettingsManager.VisibleArea: integer;
var
  vResult : variant;
begin
  vResult:= dlcTovar.ListSource.DataSet.Lookup(
    'id',
    dmdEx.GetIdManager,
    'visible_area'
  );
  if vResult=null then begin
    AssertInternal('3D363FF2-3706-4A63-B03A-73A2F3685B8C dmdEx.GetIdManager='+
      inttostr(dmdEx.GetIdManager));
  end;
  Result := vResult;
end;

end.
