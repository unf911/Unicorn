unit untSchetList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids,  
  StdCtrls,untEx, FMTBcd, DBClient, Provider, SqlExpr, Buttons,
  PropStorageEh, PropFilerEh, GridsEh, DBGridEh;

type
  TfrmSchetList = class(TForm)
    dsSchet: TDataSource;
    edtIzg: TEdit;
    SQLDataSet1: TSQLDataSet;
    DataSetProvider1: TDataSetProvider;
    qurSchet: TClientDataSet;
    qurSchetSCHET: TIntegerField;
    qurSchetIZG: TStringField;
    qurSchetZAK: TStringField;
    qurSchetDAT2: TSQLTimeStampField;
    qurSchetNDS2: TFMTBCDField;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    qurSchetAUTHER: TStringField;
    UnfDBGrid1: TDbGridEh;
    PropStorageEh1: TPropStorageEh;
    RegPropStorageManEh1: TRegPropStorageManEh;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure UnfDBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtIzgKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure UnfDBGrid1DblClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    intSchet : integer;
    procedure ChoiceDone;
  public
    { Public declarations }

    function GetSchet :integer;

  end;

var
  frmSchetList: TfrmSchetList;

implementation

{$R *.dfm}


procedure TfrmSchetList.FormCreate(Sender: TObject);
begin
  qurSchet.Open;
end;

procedure TfrmSchetList.FormDestroy(Sender: TObject);
begin
  qurSchet.Close;
end;

function TfrmSchetList.GetSchet: integer;
begin
  if (self.ShowModal =mrOk) then begin
    Result := intSchet;
  end
  else begin
    Result := 0;
  end;
end;

procedure TfrmSchetList.UnfDBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return : begin
      ChoiceDone;
    end; //vk_return
    vk_escape : begin
      ModalResult :=mrCancel;
    end;
  end;//case
end;

procedure TfrmSchetList.edtIzgKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (edtIzg.Text<>'') then begin
    qurSchet.Filter:= 'zak=''' + edtIzg.Text + '*''';
    qurSchet.Filtered := true;
  end
  else begin
    qurSchet.Filtered := false;
  end; //if
end;


procedure TfrmSchetList.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return : begin
      ChoiceDone;
    end; //vk_return
    vk_escape : begin
      ModalResult :=mrCancel;
    end;
  end;//case
end;

procedure TfrmSchetList.ChoiceDone;
begin
  intSchet := qurSchet.fieldbyname('schet').asInteger;
  ModalResult := mrOK;
end;

procedure TfrmSchetList.Button1Click(Sender: TObject);
begin
  ChoiceDone;
end;

procedure TfrmSchetList.UnfDBGrid1DblClick(Sender: TObject);
begin
  ChoiceDone;
end;

procedure TfrmSchetList.btnOkClick(Sender: TObject);
begin
  ChoiceDone;
end;

procedure TfrmSchetList.btnCancelClick(Sender: TObject);
begin
  modalresult := mrCancel;
end;

end.
