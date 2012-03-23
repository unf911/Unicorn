unit PlategyVxodEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DBGridEh, PropFilerEh, PropStorageEh, DBCtrlsEh,
  StdCtrls, Buttons, DBCtrls, Mask, DBLookupEh, ActnList, DB, DBClient,
  Provider, SqlExpr, PlategyEdit;

type
  TfrmPlategyVxodEdit = class(TfrmPlategyEdit)
    dbnParentIdNakl: TDBNumberEditEh;
    lcbParentIdNakl: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure lcbZakChange(Sender: TObject);override;
    procedure lcbIZGChange(Sender: TObject);override;
  protected
    function GetVozvratTip:integer;override;
    function GetAgentTip: integer;override;
    procedure ProcessSchet; override;
    procedure CheckFilledFields; override;
  private
    { Private declarations }

  public
    { Public declarations }
    procedure PrepareForPlategyVxod;

  end;

var
  frmPlategyVxodEdit: TfrmPlategyVxodEdit;

implementation

{$R *.dfm}

procedure TfrmPlategyVxodEdit.FormCreate(Sender: TObject);
begin
  PrepareForPlategyVxod;
end;

function TfrmPlategyVxodEdit.GetAgentTip: integer;
begin
  Result := dsNakloEdit.DataSet.FieldByName('XOZ_OPER').LookupDataSet.Lookup('name','ОПЛАТА ОТ АГЕНТА','oid');
end;

function TfrmPlategyVxodEdit.GetVozvratTip: integer;
begin
  Result := dsNakloEdit.DataSet.FieldByName('XOZ_OPER').LookupDataSet.Lookup('name','ВОЗВРАТ ОТ ПОСТАВЩИКА','oid');
end;

procedure TfrmPlategyVxodEdit.PrepareForPlategyVxod;
begin
  lcbCurrency.DataField := '';
  lcbCurrency.Hide;
  lblCurrency.Hide;
  lcbParentIdNakl.Parent := GroupBox2;
  lcbParentIdNakl.Left := lblCurrency.Left;
  lcbParentIdNakl.Top := lblCurrency.Top;

  dbnParentIdNakl.Parent := GroupBox2;
  dbnParentIdNakl.Left := lcbCurrency.Left;
  dbnParentIdNakl.Top := lcbCurrency.Top;
  dbnParentIdNakl.Width := lcbCurrency.Width;
  dbnParentIdNakl.TabOrder := lcbCurrency.TabOrder;
  PropStorageEh1.Active := false;
  PropStorageEh1.Section := 'TfrmPlategyVxodEdit';

  lblIzg.Caption := 'Фирма';
  lblZak.Caption := 'Клиент';
 // PropStorageEh1.LoadProperties;
 // PropStorageEh1.Active := true;
  dbnParentIdNakl.DataSource := dsNakloEdit;
end;

procedure TfrmPlategyVxodEdit.ProcessSchet;
begin
  cdsBank.Close;
  cdsBank.Params.ParamByName('id_klient').asInteger:=
    dsNakloEdit.DataSet.FieldByName('id_izg').asInteger;
  cdsBank.Open;
end;

procedure TfrmPlategyVxodEdit.lcbZakChange(Sender: TObject);
begin
//
end;

procedure TfrmPlategyVxodEdit.lcbIZGChange(Sender: TObject);
begin
  ProcessSchet;
end;

procedure TfrmPlategyVxodEdit.CheckFilledFields;
begin
	if dsNakloEdit.DataSet.FieldByName('id_izg').IsNull then begin
		showmessage ('Заполните поле ''Фирма''');
		lcbIZG.SetFocus;
		abort;
	end;
	if dsNakloEdit.DataSet.FieldByName('id_zak').IsNull then begin
		showmessage ('Заполните поле ''Клиент''');
		lcbZak.SetFocus;
		abort;
	end;
end;

end.
