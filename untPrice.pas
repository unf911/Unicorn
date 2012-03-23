unit untPrice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids,
  StdCtrls,DB, Mask,
  DBCtrls, Buttons, QueryExtender,  ActnList,
  Clipbrd,
  untEx, FMTBcd, DBClient, Provider, SqlExpr, untRound, UnfFilter, DBGridEh,
  PropStorageEh, Menus, PropFilerEh, GridsEh
  ;

type
  TfrmPrice = class(TForm)

    Label1: TLabel;
    edtFilter: TEdit;
    dsSebest: TDataSource;
    dsPrice: TDataSource;
    qePrice: TQueryExtender;
    ActionList1: TActionList;
    actApply: TAction;
    SpeedButton1: TSpeedButton;
    sdsPrice: TSQLDataSet;
    dspPrice: TDataSetProvider;
    qurPrice: TClientDataSet;
    sdsSebest: TSQLDataSet;
    dspSebest: TDataSetProvider;
    qurSebest: TClientDataSet;
    qurPriceNAME: TStringField;
    qurSebestDAT: TSQLTimeStampField;
    qurSebestSEBEST: TFMTBCDField;
    sdsPriceNAME: TStringField;
    qurSebestID_SKLAD: TIntegerField;
    qurSebestID_TOVAR: TIntegerField;
    sdsPriceID: TIntegerField;
    qurPriceID: TIntegerField;
    DBGridEh1: TDBGridEh;
    UnfFilter1: TUnfFilter;
    DBGridEh2: TDBGridEh;
    rpsClientEdit: TRegPropStorageManEh;
    PropStorageEh1: TPropStorageEh;
    actPaste: TAction;

    procedure edtFilterChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DBEdit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    function ShowForInput (strFilter : string;sRetField :string):string;

    procedure qurSebestBeforeScroll(DataSet: TDataSet);
    procedure qurPriceBeforeScroll(DataSet: TDataSet);
    procedure qurSebestBeforePost(DataSet: TDataSet);
    procedure qurSebestAfterInsert(DataSet: TDataSet);
    procedure DBGridEh2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qurSebestAfterDelete(DataSet: TDataSet);
    procedure qurSebestReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure actPasteExecute(Sender: TObject);
    procedure qurSebestSEBESTSetText(Sender: TField; const Text: String);
    procedure actApplyExecute(Sender: TObject);
  private
    { Private declarations }
    FSlaveMode : boolean;
    FCurSebest : currency;
    FFilterText : string;
    procedure SetFilterText(const Value: string);
  public
    { Public declarations }
    property curSebest: currency read FCurSebest write FCurSebest ;
    property SlaveMode : boolean read FSlaveMode write FSlaveMode ;
    property FilterText : string read FFilterText write SetFilterText;
  end;

var
  frmPrice: TfrmPrice;

implementation

{$R *.dfm}

procedure TfrmPrice.edtFilterChange(Sender: TObject);
var
  sOldFilter : string;
begin
 if not FSlaveMode then begin
  if (edtFilter.Text <> '') then begin
    sOldFilter := 'name =' + QuotedStr ( edtFilter.Text+'*');
  end else begin
    sOldFilter := '';
  end;  //if <> ''
  qePrice.SetFilter(sOldFilter,0);
  qePrice.ApplyFilter;
 end;
end;

procedure TfrmPrice.FormClose(Sender: TObject; var Action: TCloseAction);
begin
try
  actApply.Execute;
  if not FSlaveMode then begin
    qurPrice.Close;
    qurSebest.Close;
  end;
  //dmdEx.execsql(sdsUpdateTmpsebest);
finally //try
  Action := caFree;
end;//try
end;

procedure TfrmPrice.FormCreate(Sender: TObject);
begin
  qurPrice.Open;
  qurSebest.Open;
  qurPrice.FilterOptions := [foCaseInsensitive];
  qurPrice.Filtered := false;
end;

procedure TfrmPrice.DBEdit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //if FSlaveMode then begin
    if key=vk_return then begin
      SpeedButton1Click(self);
    end;
  //end;
end;

procedure TfrmPrice.SetFilterText(const Value: string);
begin
  FFilterText := Value;
  FSlaveMode := true;
  edtFilter.Text := FFilterText;
  edtFilter.ReadOnly := true;
  qePrice.SetFilter('name =' + QuotedStr ( edtFilter.Text),0);
  qePrice.ApplyFilter;
end;


procedure TfrmPrice.SpeedButton1Click(Sender: TObject);
begin
  qurSebest.CheckBrowseMode;
  actApply.Execute;
  if FSlaveMode then
  begin
    self.Close;
  end;
end;

function TfrmPrice.ShowForInput(strFilter, sRetField: string): string;
begin
  FilterText := strFilter ;
  self.FormStyle := fsNormal;
  self.Hide;
  self.ShowModal;
  try
    Result := qurSebest.FieldByName(sRetField).AsString;
  except
    Assert (false,'Ключевое поле не найдено: '+ sRetField);
  end;
end;

procedure TfrmPrice.qurSebestBeforeScroll(DataSet: TDataSet);
begin
  applyorcancel(dataset);
end;

procedure TfrmPrice.qurPriceBeforeScroll(DataSet: TDataSet);
begin
  ApplyOrCancel(qurSebest);
end;

procedure TfrmPrice.qurSebestBeforePost(DataSet: TDataSet);
begin
  if (qurSebest.FieldByName('dat').IsNull) or
    (qurSebest.FieldByName('sebest').IsNull) then begin
     showmessage ('Незаполнены необходимые поля: дата, себестоимость');
     Abort;
  end; //if
end;

procedure TfrmPrice.qurSebestAfterInsert(DataSet: TDataSet);
begin
  qurSebest.FieldByName('id_tovar').AsInteger :=
    qurPrice.FieldByName('id').AsInteger;
  qurSebest.FieldByName('id_sklad').AsInteger := 0 ;    
end;


procedure TfrmPrice.DBGridEh2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_f8: begin
      if not( qurSebest.eof and qurSebest.bof) then begin
        qurSebest.Delete;
      end;//if
    end; //f8
  end;//case
end;

procedure TfrmPrice.qurSebestAfterDelete(DataSet: TDataSet);
begin
  ApplyOrCancel(Dataset);
end;

procedure TfrmPrice.qurSebestReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  showmessage(e.Message);
  Action := raAbort;

end;

procedure TfrmPrice.actPasteExecute(Sender: TObject);
//var
  //i : integer;
  //strTemp: string;
begin
  Clipboard.HasFormat(CF_TEXT);
  showmessage(Clipboard.AsText);
end;

procedure TfrmPrice.qurSebestSEBESTSetText(Sender: TField;
  const Text: String);
begin
  if  Pos(#13#10,Text)<>0 then begin
    Sender.AsFloat := RRoundTo(StrToFloat(Copy( Text,1,Length(Text)-2 )),-2);
  end else begin
    Sender.AsFloat := RRoundTo(StrToFloat(Text),-2);
  end;
end;

procedure TfrmPrice.actApplyExecute(Sender: TObject);
begin
  ApplyOrCancel(qurSebest);
end;

end.
