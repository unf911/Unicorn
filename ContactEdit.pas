unit ContactEdit;

interface

uses
  Windows, Messages, SysUtils, Variants,
  Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls,
  DB, ActnList, Buttons,
  DBClient, ExtCtrls, DBCtrlsEh,
  untEx, DBLookupEh, PropStorageEh,
  FMTBcd, Provider, SqlExpr,
  AutoPnl,
  DolgnostSpr, DBGridEh, PropFilerEh //TfrmDolgnost
  ;

type
  TfrmContactEdit = class(TForm)
    ActionList1: TActionList;
    actOk: TAction;
    actCancel: TAction;
    dsEdit: TDataSource;
    rpsTovarEdit: TRegPropStorageManEh;
    PropStorageEh1: TPropStorageEh;
    SQLDataSet1: TSQLDataSet;
    cdsContacts: TClientDataSet;
    cdsContactsOID: TIntegerField;
    cdsContactsNAME: TStringField;
    cdsContactsFULLNAME: TStringField;
    cdsContactsDELMARKED: TSmallintField;
    cdsContactsLASTNAME: TStringField;
    cdsContactsFIRSTNAME: TStringField;
    cdsContactsMIDDLENAME: TStringField;
    cdsContactsID_DOLGNOST: TIntegerField;
    cdsContactsBIRTHDAY: TSQLTimeStampField;
    cdsContactsBIRTHPLACE: TStringField;
    cdsContactsID_MARRIAGE: TIntegerField;
    cdsContactsHOBBY: TStringField;
    cdsContactsWORKPHONE: TStringField;
    cdsContactsCELLPHONE: TStringField;
    cdsContactsADDPHONE: TStringField;
    cdsContactsEMAIL: TStringField;
    cdsContactsPERSONBYDEF: TSmallintField;
    cdsContactsID_KLIENT: TIntegerField;
    DataSetProvider1: TDataSetProvider;
    cdsContactsCHILDREN: TStringField;
    AutoPanel1: TAutoPanel;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    dbeName: TDBEdit;
    dbeFullName: TDBEdit;
    DBEdit1: TDBEdit;
    dbrgTipTara: TDBRadioGroup;
    lcbSkladTo: TDBLookupComboboxEh;
    Label5: TLabel;
    Label4: TLabel;
    dteDat: TDBDateTimeEditEh;
    Label2: TLabel;
    dbeKod2: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    dbeWeight: TDBEdit;
    Label9: TLabel;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    Label12: TLabel;
    DBEdit6: TDBEdit;
    dbcbDelmarked: TDBCheckBox;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    cdsContactsSEX: TSmallintField;
    procedure actOkExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lcbSkladToEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure lcbSkladToEditButtons1Click(Sender: TObject;
      var Handled: Boolean);
    procedure cdsContactsAfterInsert(DataSet: TDataSet);
    procedure cdsContactsBeforePost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContactEdit: TfrmContactEdit;

implementation
  uses AtsAssert, untRound;
{$R *.dfm}

procedure TfrmContactEdit.actOkExecute(Sender: TObject);
begin
  dsEdit.DataSet.CheckBrowseMode;
	if ( ApplyOrCancel(dsEdit.DataSet)) then begin
    ModalResult := mrOk;
  end;
end;

procedure TfrmContactEdit.actCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmContactEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dsEdit.DataSet.Cancel;
end;

procedure TfrmContactEdit.lcbSkladToEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  lcbSkladTo.KeyValue := Null;
  handled := true;
end;

procedure TfrmContactEdit.lcbSkladToEditButtons1Click(Sender: TObject;
  var Handled: Boolean);
var
  iOid : integer;
  frmDolgnostSpr : TfrmDolgnostSpr;
begin
  frmDolgnostSpr := TfrmDolgnostSpr.Create(self);
  iOid := frmDolgnostSpr.ShowModalForInsert;
  lcbSkladTo.KeyValue := iOid;
  Handled := true;
end;

procedure TfrmContactEdit.cdsContactsAfterInsert(DataSet: TDataSet);
//var
//  iIdKlient : integer;
begin
//  DataSet.FieldByName('id_klient').asInteger :=
//    iIdKlient;
  DataSet.FieldByName('delmarked').asInteger :=0;
  DataSet.FieldByName('oid').asInteger := dmdEx.GetGenValue('oid_gen');
  DataSet.FieldByName('PERSONBYDEF').asInteger :=0;
end;

procedure TfrmContactEdit.cdsContactsBeforePost(DataSet: TDataSet);
begin
//19/03/08 По просьбе Тани Щерблюк должность не является обязательной
//для заполнения
{
  if DataSet.FieldByName('id_dolgnost').isNull then begin
    ShowMessage('Введите должность');
    abort;
  end;
}
end;

procedure TfrmContactEdit.FormShow(Sender: TObject);
begin
  dbeName.SetFocus;
end;

end.
