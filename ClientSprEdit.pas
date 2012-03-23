unit ClientSprEdit;

interface

uses
  Windows, Messages, SysUtils,
  Variants, Classes,
  Graphics, Controls, Forms,
  Dialogs,
  ActnList, StdCtrls, Mask,
  DBCtrls, ExtCtrls, DB ,
	DBClient, Buttons,
	untRound,
	atsAssert, PropStorageEh,
  ClientSchet, 
  ComCtrls,
  AutoPnl,
  untEx, FMTBcd,
  Provider, SqlExpr, Grids, DBGridEh,
  ContactEdit, DBLookupEh, DBCtrlsEh,
  Sfera, //TfrmSfera
  CallHistoryEdit, PropFilerEh, GridsEh, QueryExtender

    ;

type
  TfrmClientEdit = class(TForm)
    ActionList1: TActionList;
    actOk: TAction;
    actCancel: TAction;
    dsKlientEdit: TDataSource;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    actSchet: TAction;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    AutoPanel1: TAutoPanel;
    Panel2: TPanel;
    Label12: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label21: TLabel;
    DBEdit12: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit21: TDBEdit;
    dbcbDelmarked: TDBCheckBox;
    GroupBox1: TGroupBox;
    cbxPost: TCheckBox;
    cbxFirm: TCheckBox;
    cbxClient: TCheckBox;
    Panel1: TPanel;
    Label13: TLabel;
    Label4: TLabel;
    Label22: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit13: TDBEdit;
    DBMemo1: TDBMemo;
    BitBtn3: TBitBtn;
    Panel3: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label3: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    dbeOid: TDBEdit;
    DBGridEh1: TDBGridEh;
    SQLDataSet1: TSQLDataSet;
    DataSetProvider1: TDataSetProvider;
    cdsContacts: TClientDataSet;
    dsContacts: TDataSource;
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
    btnInsert: TButton;
    btnEdit: TButton;
    btnDelete: TButton;
    cdsContactsCHILDREN: TStringField;
    cdsContactsDOLGNOST: TStringField;
    cdsContactsSEX: TSmallintField;
    SQLDataSet1OID: TIntegerField;
    SQLDataSet1NAME: TStringField;
    SQLDataSet1FULLNAME: TStringField;
    SQLDataSet1DELMARKED: TSmallintField;
    SQLDataSet1LASTNAME: TStringField;
    SQLDataSet1FIRSTNAME: TStringField;
    SQLDataSet1MIDDLENAME: TStringField;
    SQLDataSet1BIRTHDAY: TSQLTimeStampField;
    SQLDataSet1BIRTHPLACE: TStringField;
    SQLDataSet1ID_MARRIAGE: TIntegerField;
    SQLDataSet1CHILDREN: TStringField;
    SQLDataSet1HOBBY: TStringField;
    SQLDataSet1WORKPHONE: TStringField;
    SQLDataSet1CELLPHONE: TStringField;
    SQLDataSet1ADDPHONE: TStringField;
    SQLDataSet1EMAIL: TStringField;
    SQLDataSet1PERSONBYDEF: TSmallintField;
    SQLDataSet1ID_KLIENT: TIntegerField;
    SQLDataSet1SEX: TSmallintField;
    TabSheet3: TTabSheet;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    Label14: TLabel;
    dteDat: TDBDateTimeEditEh;
    Label23: TLabel;
    Label24: TLabel;
    DBEdit6: TDBEdit;
    DBNumberEditEh1: TDBNumberEditEh;
    DBNumberEditEh2: TDBNumberEditEh;
    Label25: TLabel;
    Label26: TLabel;
    DBEdit14: TDBEdit;
    Label27: TLabel;
    lcbAnalog: TDBLookupComboboxEh;
    Label28: TLabel;
    lcbSfera: TDBLookupComboboxEh;
    Label16: TLabel;
    TabSheet4: TTabSheet;
    Label29: TLabel;
    DBEdit16: TDBEdit;
    DBEdit23: TDBEdit;
    Label30: TLabel;
    Label31: TLabel;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    Label32: TLabel;
    Label33: TLabel;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    Label34: TLabel;
    Label35: TLabel;
    DBEdit28: TDBEdit;
    Label36: TLabel;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    Label37: TLabel;
    Label38: TLabel;
    DBEdit31: TDBEdit;
    sdsKlient: TSQLDataSet;
    dspKlient: TDataSetProvider;
    cdsKlient: TClientDataSet;
    dsKlient: TDataSource;
    cdsKlientID: TIntegerField;
    cdsKlientNAME: TStringField;
    cdsKlientRSCH: TStringField;
    cdsKlientCODB: TStringField;
    cdsKlientNAMEB: TStringField;
    cdsKlientOKPO: TStringField;
    cdsKlientINDEXI: TFloatField;
    cdsKlientOBLAST: TStringField;
    cdsKlientTEL: TStringField;
    cdsKlientFAX: TStringField;
    cdsKlientFORIN: TStringField;
    cdsKlientIPN: TStringField;
    cdsKlientSVREG: TStringField;
    cdsKlientLICO: TStringField;
    cdsKlientFIO: TStringField;
    cdsKlientOTV: TStringField;
    cdsKlientADRES: TStringField;
    cdsKlientGOROD: TStringField;
    cdsKlientSTAN: TStringField;
    cdsKlientADRP: TStringField;
    cdsKlientDELMARKED: TSmallintField;
    cdsKlientTIP: TIntegerField;
    cdsKlientFULLNAME: TStringField;
    cdsKlientMODIFIED: TSQLTimeStampField;
    cdsKlientDAT_OSNOV: TSQLTimeStampField;
    cdsKlientOFFICESKLAD: TStringField;
    cdsKlientSOTRUDNIKOV_OT: TIntegerField;
    cdsKlientSOTRUDNIKOV_DO: TStringField;
    cdsKlientFILIALY: TStringField;
    cdsKlientID_ANALOG: TIntegerField;
    cdsKlientKTOZAKUPAET: TStringField;
    cdsKlientKAKOYKABELNUGEN: TStringField;
    cdsKlientOBJEMZAGOD: TStringField;
    cdsKlientOBJEMZA6MESYATSEV: TStringField;
    cdsKlientKTOMOGETPORUCHITSYA: TStringField;
    cdsKlientVASHIPARTNERY: TStringField;
    cdsKlientVASHIKONKURENTY: TStringField;
    cdsKlientFINANSOVOEPOLOGENIE: TStringField;
    cdsKlientDELOVAYAREPUTACIYA: TStringField;
    cdsKlientRASPOLAGAETLIKONKURENT: TStringField;
    cdsKlientID_SFERADEYATELNOSTI: TIntegerField;
    cdsKlientSFERA: TStringField;
    cdsKlientANALOG: TStringField;
    TabSheet5: TTabSheet;
    DBGridEh2: TDBGridEh;
    btnInsertCall: TButton;
    btnEditCall: TButton;
    btnDeleteCall: TButton;
    sdsCallHistory: TSQLDataSet;
    dspCallHistory: TDataSetProvider;
    cdsCallHistory: TClientDataSet;
    dsCallHistory: TDataSource;
    cdsCallHistoryID_KLIENT: TIntegerField;
    cdsCallHistoryID_CONTACT: TIntegerField;
    cdsCallHistoryDAT: TSQLTimeStampField;
    cdsCallHistoryID_REASON: TIntegerField;
    cdsCallHistoryID_RESULT: TIntegerField;
    cdsCallHistoryCOMMENT: TStringField;
    cdsCallHistoryCONTACT: TStringField;
    cdsCallHistoryREASON: TStringField;
    cdsCallHistoryRESULT: TStringField;
    sdsCallHistoryID_KLIENT: TIntegerField;
    sdsCallHistoryID_CONTACT: TIntegerField;
    sdsCallHistoryDAT: TSQLTimeStampField;
    sdsCallHistoryID_REASON: TIntegerField;
    sdsCallHistoryID_RESULT: TIntegerField;
    sdsCallHistoryCOMMENT: TStringField;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    cdsKlientID_MANAGER: TIntegerField;
    cdsKlientID_RESULT: TIntegerField;
    cdsKlientDAT_CONTACT: TSQLTimeStampField;
    cdsKlientRESULT: TStringField;
    cdsKlientMANAGER: TStringField;
    TabSheet6: TTabSheet;
    lcbPrice: TDBLookupComboboxEh;
    Label39: TLabel;
    Label40: TLabel;
    lcbSkidka: TDBLookupComboboxEh;
    Label41: TLabel;
    lcbUslPostavka: TDBLookupComboboxEh;
    BitBtn1: TBitBtn;
    actDogovor: TAction;
    SQLDataSet1ID_DOLGNOST: TIntegerField;
    SQLDataSet1ID_MANAGER: TIntegerField;
    cdsContactsID_MANAGER: TIntegerField;
    cdsContactsMANAGER: TStringField;
    sdsCallHistoryID_MANAGER: TIntegerField;
    cdsCallHistoryMANAGER: TStringField;
    cdsCallHistoryID_MANAGER: TIntegerField;
    qeContacts: TQueryExtender;
    DBRadioGroup1: TDBRadioGroup;
    GroupBox2: TGroupBox;
    DBCheckBoxEh1: TDBCheckBoxEh;
    DBCheckBoxEh2: TDBCheckBoxEh;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    procedure actOkExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure actSchetExecute(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure cdsContactsBeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure lcbSferaEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure lcbAnalogEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure lcbSferaEditButtons1Click(Sender: TObject;
      var Handled: Boolean);
    procedure TabSheet5Show(Sender: TObject);
    procedure cdsCallHistoryBeforePost(DataSet: TDataSet);
    procedure btnInsertCallClick(Sender: TObject);
    procedure cdsCallHistoryAfterInsert(DataSet: TDataSet);
    procedure cdsContactsAfterInsert(DataSet: TDataSet);
    procedure btnEditCallClick(Sender: TObject);
    procedure btnDeleteCallClick(Sender: TObject);
    procedure DBGridEh2DblClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cdsKlientAfterInsert(DataSet: TDataSet);
    procedure lcbPriceEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure lcbPriceEditButtons1Click(Sender: TObject;
      var Handled: Boolean);
    procedure TabSheet6Show(Sender: TObject);
    procedure lcbSkidkaEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure lcbSkidkaEditButtons1Click(Sender: TObject;
      var Handled: Boolean);
    procedure lcbUslPostavkaEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure lcbUslPostavkaEditButtons1Click(Sender: TObject;
      var Handled: Boolean);
    procedure actDogovorExecute(Sender: TObject);
    procedure cdsContactsBeforeEdit(DataSet: TDataSet);
    procedure cdsContactsBeforeInsert(DataSet: TDataSet);
    procedure cdsContactsBeforeDelete(DataSet: TDataSet);
    procedure cdsCallHistoryBeforeInsert(DataSet: TDataSet);
    procedure cdsCallHistoryBeforeEdit(DataSet: TDataSet);
    procedure cdsCallHistoryBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
    frmEdit : TfrmContactEdit;
    frmSfera : TfrmSfera;
    frmCallHistory : TfrmCallHistoryEdit;
    procedure ContactsEdit;
    procedure CallHistoryEdit;
    //TipChanged : boolean ;  //flag = true когда изменили тип клиента
    function SaveChanges:boolean;
    function GetNewClientTip: integer;
    procedure FillClientTip;
  public
    { Public declarations }
  end;

var
  frmClientEdit: TfrmClientEdit;

implementation

uses
  Dogovor, // TfrmDogovor
  PriceSpr , //TfrmPriceSpr
  SkidkaSpr, //TfrmSkidkaSpr
  UslPostavkaSpr //TfrmUslPostavkaSpr
  , NNakl;
{$R *.dfm}

procedure TfrmClientEdit.actOkExecute(Sender: TObject);
begin
  if SaveChanges then begin
    ModalResult := mrOk;
  end;
end;

procedure TfrmClientEdit.actCancelExecute(Sender: TObject);
begin
	CancelUpdates(dsKlientEdit.DataSet);
  ModalResult := mrCancel;
end;

procedure TfrmClientEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmdEx.CloseQuery(dmdEx.cdsDolgnost,false);
  dmdEx.CloseQuery(dmdEx.cdsResult,false);
  dmdEx.CloseQuery(dmdEx.cdsReason,false);
  dmdEx.CloseQuery(dmdEx.cdsPrice,false);
  dmdEx.CloseQuery(dmdEx.cdsSkidka,false);
  dmdEx.CloseQuery(dmdEx.cdsUslPostavka,false);
  cdsContacts.Close;
  cdsCallHistory.Close;
//  dmdM.qurClient.Cancel;
  actCancel.Execute;
end;

//определяем новый тип фирмы 1- наша,2-клиент, 3- поставщик
function TfrmClientEdit.GetNewClientTip: integer;
var
	iTip : integer;
begin
	iTip :=0;
	if cbxPost.Checked then begin
		iTip := iTip or 4;
	end;
	if cbxFirm.Checked then begin
		iTip := iTip or 1;
	end;
	if cbxClient.Checked then begin
		iTip := iTip or 2;
	end;
  Result := iTip;
end;

function TfrmClientEdit.SaveChanges: boolean;
begin
	Result := false;
try
  if GetNewClientTip <> dsKlientEdit.Dataset.fieldByName('tip').asInteger then begin
		if dsKlientEdit.DataSet.State = dsBrowse then begin
			dsKlientEdit.DataSet.Edit;
		end;
		dsKlientEdit.Dataset.fieldByName('tip').asInteger := GetNewClientTip;
	end;
  Result := true;
	if PostAndApply(dsKlientEdit.DataSet)<>0 then begin
    Result:=false;
    exit;
  end; //if PostAndApply(dsKlientEdit.DataSet)
except
  AssertInternal('EA30250A-AC7E-4D19-865F-7B8DA729B46F');
end
end;

//Заполнение флажков для клиентов, фирм, поставщиков
procedure TfrmClientEdit.FillClientTip;
begin
	cbxPost.Checked:=
		((dsKlientEdit.DataSet.FieldByName('tip').asInteger and 4)<>0);
	cbxFirm.Checked:=
		((dsKlientEdit.DataSet.FieldByName('tip').asInteger and 1)<>0);
	cbxClient.Checked:=
		((dsKlientEdit.DataSet.FieldByName('tip').asInteger and 2)<>0);
end;

procedure TfrmClientEdit.FormShow(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet1;
  FillClientTip;
end;

procedure TfrmClientEdit.actSchetExecute(Sender: TObject);
var
  ClientSchet :TfrmClientSchet;
begin
  if not SaveChanges then exit;
  ClientSchet := TfrmClientSchet.Create(Application);
  ClientSchet.ShowSchet(dsKlientEdit.DataSet.FieldByName('id').asInteger);
end;



procedure TfrmClientEdit.TabSheet2Show(Sender: TObject);
begin
//  if not cdsContacts.Active then begin
  dmdEx.OpenQuery(dmdEx.cdsDolgnost);
  cdsContacts.Close;
  cdsContacts.Params.ParamByName('id_klient').asInteger :=
    dsKlientEdit.DataSet.FieldByName('id').asInteger;
  cdsContacts.Open;
//  end;
end;

procedure TfrmClientEdit.btnDeleteClick(Sender: TObject);
begin
try
  if MessageDlg('Удалить запись?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      DelmarkRecord(cdsContacts);
  end; //if
except
  AssertInternal('AC37A8C7-9226-4B7D-A91B-C8825B3421DB');
end;
end;

procedure TfrmClientEdit.btnEditClick(Sender: TObject);
begin
  cdsContacts.Edit;
  ContactsEdit;
end;

procedure TfrmClientEdit.btnInsertClick(Sender: TObject);
begin
  cdsContacts.Insert;
  ContactsEdit;
end;

//процедура открывает окно редактирования формы
procedure TfrmClientEdit.ContactsEdit;
begin 
  if frmEdit.ShowModal=mrOk then begin
    qeContacts.Refresh();
  end
end;

procedure TfrmClientEdit.cdsContactsBeforePost(DataSet: TDataSet);
begin
  if DataSet.FieldByName('firstname').isNull then begin
    ShowMessage('Введите имя');
    abort;
  end;
end;

procedure TfrmClientEdit.FormCreate(Sender: TObject);
begin
  dmdEx.OpenQuery(dmdEx.cdsManager);
	frmEdit := TfrmContactEdit.Create (self);
	frmEdit.dsEdit.Dataset := cdsContacts;
  frmCallHistory := TfrmCallHistoryEdit.Create(self);
  frmCallHistory.dsEdit.DataSet := cdsCallHistory;
end;

procedure TfrmClientEdit.DBGridEh1DblClick(Sender: TObject);
begin
  cdsContacts.Edit;
  ContactsEdit;
end;

procedure TfrmClientEdit.lcbSferaEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  lcbSfera.Value := Null;
  Handled := true;
end;

procedure TfrmClientEdit.lcbAnalogEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  lcbAnalog.Value := Null;
  Handled := true;
end;

procedure TfrmClientEdit.lcbSferaEditButtons1Click(Sender: TObject;
  var Handled: Boolean);
var
  iOid : integer;
begin
  frmSfera := TfrmSfera.Create(self);
  iOid := frmSfera.ShowModalForInsert;
  lcbSfera.KeyValue := iOid;
  Handled := true;
end;

procedure TfrmClientEdit.TabSheet5Show(Sender: TObject);
begin
  if not dmdEx.cdsResult.Active then dmdEx.OpenQuery(dmdEx.cdsResult);
  if not dmdEx.cdsReason.Active then dmdEx.OpenQuery(dmdEx.cdsReason);
  if not dmdEx.cdsDolgnost.Active then dmdEx.OpenQuery(dmdEx.cdsDolgnost);

  cdsContacts.Close;
  cdsContacts.Params.ParamByName('id_klient').asInteger :=
    dsKlientEdit.DataSet.FieldByName('id').asInteger;
  dmdEx.OpenQuery(cdsContacts);

  cdsCallHistory.Close;
  cdsCallHistory.Params.ParamByName('id_klient').asInteger :=
    dsKlientEdit.DataSet.FieldByname('id').asinteger;
  dmdEx.OpenQuery(cdsCallHistory);
end;

procedure TfrmClientEdit.cdsCallHistoryBeforePost(DataSet: TDataSet);
begin
  if DataSet.FieldByName('id_contact').isNull then begin
    ShowMessage('Введите контакт');
    abort;
  end;
  if DataSet.FieldByName('id_reason').isNull then begin
    ShowMessage('Введите причину разговора');
    abort;
  end;
  if DataSet.FieldByName('id_result').isNull then begin
    ShowMessage('Введите результат разговора');
    abort;
  end;
end;

procedure TfrmClientEdit.btnInsertCallClick(Sender: TObject);
begin
  cdsCallHistory.Insert;
  CallHistoryEdit;
end;

procedure TfrmClientEdit.CallHistoryEdit;
begin
  frmCallHistory.ShowModal;
end;

procedure TfrmClientEdit.cdsCallHistoryAfterInsert(DataSet: TDataSet);
var
  ResultLookup : variant;
begin
  DataSet.FieldByName('id_klient').asInteger :=
    dsKlientEdit.DataSet.FieldByName('id').asInteger;
  DataSet.FieldByName('dat').AsDateTime := Now;
  ResultLookup := dsContacts.DataSet.Lookup('personbydef',1,'oid');
  if ResultLookup<> Null then begin
    DataSet.FieldByName('id_contact').asInteger := ResultLookup;
  end;
end;

procedure TfrmClientEdit.cdsContactsAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('id_klient').asInteger :=
    dsKlientEdit.DataSet.FieldByName('id').asInteger;
  DataSet.FieldByName('delmarked').asInteger :=0;
  DataSet.FieldByName('oid').asInteger := dmdEx.GetGenValue('oid_gen');
  DataSet.FieldByName('PERSONBYDEF').asInteger :=0;
  DataSet.FieldByName('CHILDREN').asString :='';
end;

procedure TfrmClientEdit.btnEditCallClick(Sender: TObject);
begin
  cdsCallHistory.Edit;
  CallHistoryEdit;
end;

procedure TfrmClientEdit.btnDeleteCallClick(Sender: TObject);
begin
try
  if MessageDlg('Удалить запись?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      dsCallHistory.DataSet.Delete;
      ApplyOrCancel(dsCallHistory.DataSet);
      //DelmarkRecord(cdsCallHistory);
  end; //if
except
  AssertInternal('D6283F6B-7877-4A01-9528-9E4AA34D8BE2');
end;
end;

procedure TfrmClientEdit.DBGridEh2DblClick(Sender: TObject);
begin
  CallHistoryEdit;
end;

procedure TfrmClientEdit.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return :begin
      btnEdit.Click;
    end;
    vk_insert : begin
      btnInsert.Click;
    end;
    vk_f8 : begin
      btnDelete.Click;
    end;
  end;//case
end;

procedure TfrmClientEdit.DBGridEh2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return :begin
      btnEditCall.Click;
    end;
    vk_insert : begin
      btnInsertCall.Click;
    end;
    vk_f8 : begin
      btnDeleteCall.Click;
    end;
  end;//case
end;

procedure TfrmClientEdit.cdsKlientAfterInsert(DataSet: TDataSet);
begin
  cdsKlient.FieldByName('id').asInteger :=
    dsKlientEdit.DataSet.FieldByName('id').asInteger;
end;

procedure TfrmClientEdit.lcbPriceEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  lcbPrice.KeyValue := null;
  Handled := true;
end;

procedure TfrmClientEdit.lcbPriceEditButtons1Click(Sender: TObject;
  var Handled: Boolean);
var
  iOid : integer;
  frmPriceSpr : TfrmPriceSpr;
begin
  frmPriceSpr := TfrmPriceSpr.Create(self);
  iOid := frmPriceSpr.ShowModalForInsert;
  lcbPrice.KeyValue := iOid;
  Handled := true;
end;

procedure TfrmClientEdit.TabSheet6Show(Sender: TObject);
begin
  dmdEx.OpenQuery(dmdEx.cdsPrice);
  dmdEx.OpenQuery(dmdEx.cdsSkidka);
  dmdEx.OpenQuery(dmdEx.cdsUslPostavka);
end;

procedure TfrmClientEdit.lcbSkidkaEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  lcbSkidka.KeyValue := null;
  Handled := true;
end;

procedure TfrmClientEdit.lcbSkidkaEditButtons1Click(Sender: TObject;
  var Handled: Boolean);
var
  iOid : integer;
  frmSkidkaSpr : TfrmSkidkaSpr;
begin
  frmSkidkaSpr := TfrmSkidkaSpr.Create(self);
  iOid := frmSkidkaSpr.ShowModalForInsert;
  lcbSkidka.KeyValue := iOid;
  Handled := true;
end;

procedure TfrmClientEdit.lcbUslPostavkaEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  lcbUslPostavka.KeyValue := null;
  Handled := true;
end;

procedure TfrmClientEdit.lcbUslPostavkaEditButtons1Click(Sender: TObject;
  var Handled: Boolean);
var
  iOid : integer;
  frmUslPostavkaSpr : TfrmUslPostavkaSpr;
begin
  frmUslPostavkaSpr := TfrmUslPostavkaSpr.Create(self);
  iOid := frmUslPostavkaSpr.ShowModalForInsert;
  lcbUslPostavka.KeyValue := iOid;
  Handled := true;
end;

procedure TfrmClientEdit.actDogovorExecute(Sender: TObject);
var
  Dogovor :TfrmDogovor;
begin
  if not SaveChanges then exit;
  Dogovor := TfrmDogovor.Create(Application);
  Dogovor.ShowSchet(dsKlientEdit.DataSet.FieldByName('id').asInteger);
end;

procedure TfrmClientEdit.cdsContactsBeforeEdit(DataSet: TDataSet);
begin
  if not SaveChanges then abort;
end;

procedure TfrmClientEdit.cdsContactsBeforeInsert(DataSet: TDataSet);
begin
  if not SaveChanges then abort;
end;

procedure TfrmClientEdit.cdsContactsBeforeDelete(DataSet: TDataSet);
begin
  if not SaveChanges then abort;
end;

procedure TfrmClientEdit.cdsCallHistoryBeforeInsert(DataSet: TDataSet);
begin
  if not SaveChanges then abort;
end;

procedure TfrmClientEdit.cdsCallHistoryBeforeEdit(DataSet: TDataSet);
begin
  if not SaveChanges then abort;
end;

procedure TfrmClientEdit.cdsCallHistoryBeforeDelete(DataSet: TDataSet);
begin
  if not SaveChanges then abort;
end;

end.
