unit SettingsVlad;

interface

uses 
  Windows, Messages, SysUtils, Classes,
  Graphics, Controls, Forms, Dialogs,
  untEx, StdCtrls, Mask, DBCtrlsEh, DBLookupEh,DB,
  Variants, //null
  SettingsPlugin, //TfmSettingsPlugin
  atsAssert // AssertInternal
  ;

type
  TfmSettingsVlad = class(TfmSettingsPlugin)
    gbxVlad: TGroupBox;
    Label1: TLabel;
    cbxFirm: TDBComboBoxEh;
    procedure FillComboBox(cbxBox: TCustomDBComboBoxEh; strSql: string);
    procedure cbxFirmEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
  public
    { Public declarations }
    procedure Init; override;
    function Filled:boolean; override;
    function GetResult : string; override;
    function GetTextResult: string; override;
    procedure SetResultType(ResultType: integer); override;
    procedure SetKeyValue(KeyValue: variant);override;
    procedure CancelInput; override;
  private
    FResultType : integer;
  end;

implementation

{$R *.dfm}

function TfmSettingsVlad.Filled: boolean;
begin
  Result := true;
  if (FResultType in [0,1]) then begin
    if (cbxFirm.ItemIndex = -1) then begin
      Result := false;
      FErrorMessage := '�������� �����';
    end;
  end;
  //if FResultType=3, �� ��������� �� ����
  if Result then begin
    FOldKeyValue :=cbxFirm.ItemIndex;
  end;
end;

procedure TfmSettingsVlad.SetKeyValue(KeyValue: variant);
var
  sName : string;
  iItemIndex : integer;
begin
try
  if KeyValue=Null then begin
    if FResultType=0 then begin
      //������ ������� "���"
      cbxFirm.ItemIndex:=0;
    end else begin
      cbxFirm.ItemIndex:=-1;
    end;
  end else begin
    sName := vartostr(
      dmdEx.cdsVlad.Lookup(
        'id', KeyValue, 'name'
      )
    );
    iItemIndex:=cbxFirm.Items.IndexOf(sName);
    cbxFirm.ItemIndex := iItemIndex;
  end;
except
  AssertInternal('7A70BFEC-3398-40AC-8708-EB5641DEF584');
end;
end;

function TfmSettingsVlad.GetResult: string;
var
  sTemp : string;
  iIdIzg : integer;
begin
  sTemp := '';
  if FResultType=0 then begin
   try
    case cbxFirm.ItemIndex of
      0 : begin
        //������� ��� �����
        sTemp :='';
      end;
      1 : begin
        //�������� ������ �������� ��� ���
        if not dmdEx.cdsVlad.Locate('isdefault',1,[]) then begin
          raise Exception.Create('�� ������� ����� �� ��������� � ����������� ����');
        end;
        //if not dmdEx.cdsVlad.Locate('name','����������',[loPartialKey]) then begin
        //  raise Exception.Create('�� ������� ������ �������� ��� ��� � ������ ����');
        //end;
        //������������� ��� ����� ����� ���
        sTemp := ' <> '+dmdEx.cdsVlad.FieldByName('id').asString;
      end;
      else begin
        //����������� ������ - ������� ���� �� ����
        iIdIzg := dmdEx.cdsVlad.Lookup(
          'name',
          cbxFirm.Items[cbxFirm.ItemIndex],
          'id');
        sTemp := ' = '+inttostr(iIdIzg);
      end;
    end; //case
   except
     AssertInternal('91CBC6E3-2222-4B5D-9E22-585522378E5B');
   end;
   Result := sTemp;
  end;//if FresultType=0
  if (FResultType =1) then begin
    iIdIzg := dmdEx.cdsVlad.Lookup(
      'name',
      cbxFirm.Items[cbxFirm.ItemIndex],
      'id');
    Result := inttostr(iIdIzg);
  end;  //if FresultType=1
  if (FResultType =2) then begin
    if cbxFirm.ItemIndex<>-1 then begin
      iIdIzg := dmdEx.cdsVlad.Lookup(
        'name',
        cbxFirm.Items[cbxFirm.ItemIndex],
        'id');
      Result := inttostr(iIdIzg);
    end else begin
      Result:='';
    end;
  end;  //if FresultType=1

end;

function TfmSettingsVlad.GetTextResult: string;
var
  sTemp : string;
begin
  sTemp := cbxFirm.Items[cbxFirm.ItemIndex];
  Result := sTemp;
end;

procedure TfmSettingsVlad.Init;
begin
try
  dmdEx.OpenQuery(dmdEx.cdsVlad);
  if FResultType=0 then begin
    cbxFirm.Items.Add ('���');
    FillComboBox (cbxFirm,
      dmdEx.sdsVlad.CommandText);
  //�� ������� ����������� ��������� ��� ����� ����� ���
    cbxFirm.Items.Insert(1,'��� ����� ���');
    cbxFirm.EditButtons[0].Visible := false;
    cbxFirm.ItemIndex := 0;
  end;
  if FResultType in  [1,2] then begin
    FillComboBox (cbxFirm,
      dmdEx.sdsVlad.CommandText);
    cbxFirm.EditButtons[0].Visible := true;
    cbxFirm.ItemIndex := -1;
  end;

except
  AssertInternal('FDAFA9FE-5EC7-493F-9C26-76BD89DCF0B1');
end;
end;

procedure TfmSettingsVlad.FillComboBox(cbxBox: TCustomDBComboBoxEh; strSql: string);
begin
  dmdEx.cdsTemp.Close;
  dmdEx.cdsTemp.CommandText := strSql;
  dmdEx.cdsTemp.Open;
  while (not dmdEx.cdsTemp.eof) do begin
    cbxBox.Items.Add(dmdEx.cdsTemp.Fields[0].asString);
    dmdEx.cdsTemp.Next;
  end;
  cbxBox.ItemIndex :=0;
  dmdEx.cdsTemp.Close;
end;

procedure TfmSettingsVlad.SetResultType(ResultType: integer);
begin
  //�� ��������� ������� ����� � �������
  //��������� ������������ � ���� '=1264'
  if not (ResultType in [0,1,2]) then begin
    FResultType := 0;
  end;
  //��� ������ =1 ������������ �����=�����
  //��� ������ =2 ������������ �����=����� � ������ ������ 
  //���� ��� �����
  FResultType := ResultType;
  case FResultType of
    0 : begin
      cbxFirm.EditButtons[0].Visible := false;
    end; //0
    1: begin
      cbxFirm.EditButtons[0].Visible := false;
    end; //1
    2: begin
      cbxFirm.EditButtons[0].Visible := true;
    end
  end; //case
end;

procedure TfmSettingsVlad.cbxFirmEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  if FResultType=0 then begin
    //��� �����
    cbxFirm.ItemIndex:=0;
    Handled :=true;
  end;
  if FResultType=1 then begin
    cbxFirm.Text := '';
    cbxFirm.ItemIndex := -1;
    Handled :=true;
  end;
  if FResultType=2 then begin
    cbxFirm.Text := '';
    cbxFirm.ItemIndex := -1;
    Handled :=true;
  end;
end;

procedure TfmSettingsVlad.CancelInput;
begin
  cbxFirm.ItemIndex := FOldKeyValue;
end;

end.
