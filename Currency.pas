unit Currency;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids,
  untEx,
  CurrencyEdit,
  ATSAssert, FMTBcd,
  ActnList, DB, DBClient,
  Provider, SqlExpr, untRound, ExtCtrls, DBCtrls, DBGridEh, UnfFilter,
  QueryExtender, Buttons, PropStorageEh, PropFilerEh, GridsEh;

type
  TfrmCurrency = class(TForm)
    sdsTovar: TSQLDataSet;
    dspTovar: TDataSetProvider;
    cdsTovar: TClientDataSet;
    dsTovar: TDataSource;
    ActionList1: TActionList;
    actRefresh: TAction;
    cdsTovarNAME: TStringField;
    cdsTovarDELMARKED: TSmallintField;
    Panel1: TPanel;
    btnDelete: TButton;
    btnEdit: TButton;
    btnInsert: TButton;
    DBGridEh1: TDBGridEh;
    UnfFilter1: TUnfFilter;
    qeTovar: TQueryExtender;
    sdsTovarOID: TIntegerField;
    sdsTovarNAME: TStringField;
    sdsTovarFULLNAME: TStringField;
    sdsTovarDELMARKED: TSmallintField;
    cdsTovarOID: TIntegerField;
    cdsTovarFULLNAME: TStringField;
    btnOk: TBitBtn;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    procedure btnDeleteClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure cdsTovarReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure actRefreshExecute(Sender: TObject);
    procedure cdsTovarAfterInsert(DataSet: TDataSet);
    procedure cdsTovarBeforePost(DataSet: TDataSet);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
    procedure TovarEdit;
//    procedure  TovarApply;
  public
    { Public declarations }
    procedure DefaultOpen;    
  end;

var
  frmCurrency: TfrmCurrency;

implementation

{$R *.dfm}

procedure TfrmCurrency.btnDeleteClick(Sender: TObject);
begin
try
  if MessageDlg('”далить запись?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      DelmarkRecord(cdsTovar);
  end; //if
except
  AssertInternal('FC812502-BBEE-45D7-8676-0D1177F4ACAE');
end;

end;

procedure TfrmCurrency.btnInsertClick(Sender: TObject);
begin
try
  cdsTovar.Insert;
  TovarEdit;
except
  AssertInternal('AF3756D5-BCE2-4F99-AFF9-0F12730AA3F0');
end;
end;

procedure TfrmCurrency.TovarEdit;
begin
try
  frmCurrencyEdit.ShowModal;
except
  AssertInternal('171872ED-ED51-4A80-B998-1E59B941A3E3');
end;
end;


procedure TfrmCurrency.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmCurrency.FormCreate(Sender: TObject);
begin
  qeTovar.DefSql := sdsTovar.CommandText;
//  dmdEx.OpenQuery(dmdEx.cdsTovar);
  dmdEx.OpenQuery(cdsTovar);
  frmCurrencyEdit := TfrmCurrencyEdit.Create (self);
  frmCurrencyEdit.dsTovarEdit.Dataset := cdsTovar;
end;

procedure TfrmCurrency.btnEditClick(Sender: TObject);
begin
try
  TovarEdit;
except
  assertInternal('1BCB1571-38DE-41FA-A8C9-6E693C51F1FF');
end;
end;

procedure TfrmCurrency.cdsTovarReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
	showmessage (e.message);
	Action := raCancel;
end;

procedure TfrmCurrency.actRefreshExecute(Sender: TObject);
begin
try
  cdsTovar.Refresh;
except
  AssertInternal('E2846389-49A7-4131-8B11-C3B963C22E71');
end;
end;

procedure TfrmCurrency.cdsTovarAfterInsert(DataSet: TDataSet);
begin
try
  cdsTovar.FieldByName('oid').asInteger :=
    dmdEx.GetGenValue('oid_gen');
  cdsTovar.FieldByName('delmarked').asInteger := 0;
except
  AssertInternal('194D416F-A6E1-4B2E-8A52-59D36EEFAEF6');
end;
end;

procedure TfrmCurrency.cdsTovarBeforePost(DataSet: TDataSet);
begin
  if cdsTovar.FieldByName('NAME').IsNull then begin
    showmessage('¬ведите название валюты');
    Abort;
  end;
end;

procedure TfrmCurrency.DefaultOpen;
begin
try
  dmdEx.StartWaiting;
  qeTovar.Refresh;
  dmdEx.StopWaiting;
except
  AssertInternal('2DE7863B-198A-4487-A5E1-C9983E385921');
end;
end;

procedure TfrmCurrency.DBGridEh1DblClick(Sender: TObject);
begin
try
  TovarEdit;
except
  assertInternal('469936C8-C003-4477-BBA8-27379E13DC37');
end;
end;

procedure TfrmCurrency.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return :begin
      TovarEdit;
    end;
    vk_insert : begin
      btnInsert.Click;
    end;
    vk_f8 : begin
      btnDelete.Click;
    end;
  end; //case
end;

procedure TfrmCurrency.btnOkClick(Sender: TObject);
begin
  close;
end;

end.
