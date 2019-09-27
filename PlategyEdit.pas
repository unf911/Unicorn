unit PlategyEdit;

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
  untEx,
	atsAssert,
  PropStorageEh,
  ClientSchet, DBCtrlsEh, DBLookupEh,
  FMTBcd, Provider, SqlExpr, DBGridEh,
  PropFilerEh //tfrmClientSchet
    ;

type
  TfrmPlategyEdit = class(TForm)
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    lcbMANAGER: TDBLookupComboboxEh;
    dbeComment: TDBEdit;
    dbeID: TDBEditEh;
    dteDat: TDBDateTimeEditEh;
    ActionList1: TActionList;
    actCancel: TAction;
    actApply: TAction;
    actOk: TAction;
    dsNakloEdit: TDataSource;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    lblIzg: TLabel;
    lcbIZG: TDBLookupComboboxEh;
    lblZak: TLabel;
    lcbZak: TDBLookupComboboxEh;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    Label2: TLabel;
    lcbBankFrom: TDBLookupComboboxEh;
    sdsBank: TSQLDataSet;
    dspBank: TDataSetProvider;
    cdsBank: TClientDataSet;
    dsBank: TDataSource;
    Label6: TLabel;
    lcbCurrency: TDBLookupComboboxEh;
    lblCurrency: TLabel;
    actKursChange: TAction;
    cdsBankBANK_NAME: TStringField;
    cdsBankRASCH: TStringField;
    cdsBankMFO: TFloatField;
    cdsBankID_KLIENT: TIntegerField;
    cdsBankID_CURRENCY: TIntegerField;
    cdsBankOID: TIntegerField;
    cdsBankDELMARKED: TSmallintField;
    cdsBankFULLNAME: TStringField;
    dneNds: TDBNumberEditEh;
    Label11: TLabel;
    lcbXozOper: TDBLookupComboboxEh;
    lblAgent: TLabel;
    lcbAgent: TDBLookupComboboxEh;
    dneZatraty: TDBNumberEditEh;
    lblZatraty: TLabel;
    dneNdsFrom: TDBNumberEditEh;
    lblNdsFrom: TLabel;
    procedure actOkExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actApplyExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure lcbBankFromEnter(Sender: TObject);
    procedure lcbBankFromChange(Sender: TObject);
    procedure dbeIDKeyPress(Sender: TObject; var Key: Char);
    procedure lcbXozOperChange(Sender: TObject);
    procedure dneNdsFromChange(Sender: TObject);
    procedure dneZatratyChange(Sender: TObject);
    procedure dneNdsChange(Sender: TObject);
    procedure lcbIZGChange(Sender: TObject);virtual;
    procedure lcbZakChange(Sender: TObject);virtual;
    procedure lcbAgentEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
  protected
    function GetVozvratTip:integer; virtual;
    function GetVozvratTipUsl: integer; virtual;
    function GetAgentTip: integer;  virtual;
    procedure ProcessSchet; virtual;
    procedure CheckFilledFields; virtual;
  private
    Semaphore : boolean;
    procedure ProcessXozOper;
    procedure ChangeCurrency;


  public
    { Public declarations }
  end;

var
  frmPlategyEdit: TfrmPlategyEdit;

implementation

uses untNaklrList;

{$R *.dfm}

procedure TfrmPlategyEdit.actOkExecute(Sender: TObject);
begin
  actApply.Execute;
  if  actApply.Checked then begin
    ModalResult := mrOk;
  end;
end;

procedure TfrmPlategyEdit.actCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmPlategyEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CloseEditForm(self,dsNakloEdit.DataSet,semaphore);
end;

procedure TfrmPlategyEdit.actApplyExecute(Sender: TObject);
var
  iAgent : integer;
begin
  actApply.Checked := false;
	if dsNakloEdit.DataSet.FieldByName('dat').IsNull then begin
		showmessage ('Заполните поле ''Дата''');
		dteDat.SetFocus;
		abort;
	end;
  CheckFilledFields;
	if dsNakloEdit.DataSet.FieldByName('id_currency').IsNull then begin
		showmessage ('Заполните поле ''Валюта''');
		lcbCurrency.SetFocus;
		abort;
	end;
	if dsNakloEdit.DataSet.FieldByName('id_manager').IsNull then begin
		showmessage ('Заполните поле ''Менеджер''');
		lcbMANAGER.SetFocus;
		abort;
	end;
	if dsNakloEdit.DataSet.FieldByName('nds').IsNull then begin
		showmessage ('Заполните поле ''Сумма''');
		dneNds.SetFocus;
		abort;
	end;
  iAgent :=GetAgentTip;
  //dsNakloEdit.DataSet.FieldByName('XOZ_OPER').LookupDataSet.Lookup('name','ОПЛАТА АГЕНТУ','oid');
  if lcbXozOper.KeyValue = iAgent then begin
    if dsNakloEdit.DataSet.FieldByName('id_currency_to').IsNull then begin
      showmessage ('Заполните поле ''Агент''');
      lcbAgent.SetFocus;
      abort;
    end;
  end;
	if (dsNakloEdit.DataSet.state <> dsBrowse) then begin
		dsNakloEdit.DataSet.Post;
	end;  //to avoid double apply

	if (TClientDataSet(dsNakloEdit.DataSet).ApplyUpdates(0)<>0) then begin
		TClientDataSet(dsNakloEdit.DataSet).CancelUpdates;
		abort;
	end;
  actApply.Checked := true;
end;

procedure TfrmPlategyEdit.FormShow(Sender: TObject);
begin
  //можно дальше редактировать
  Semaphore := false;
  dbeId.SetFocus;
  ProcessSchet;
  ProcessXozOper;
end;


procedure TfrmPlategyEdit.ProcessSchet;
begin
  cdsBank.Close;
  cdsBank.Params.ParamByName('id_klient').asInteger:=
    dsNakloEdit.DataSet.FieldByName('id_zak').asInteger;
  cdsBank.Open;
end;

procedure TfrmPlategyEdit.lcbZakChange(Sender: TObject);
begin
  ProcessSchet;
end;

procedure TfrmPlategyEdit.lcbBankFromEnter(Sender: TObject);
begin
  ProcessSchet;
end;

procedure TfrmPlategyEdit.lcbBankFromChange(Sender: TObject);
begin
  if self.Visible then begin
    ChangeCurrency;
  end;
end;

procedure TfrmPlategyEdit.ChangeCurrency;
begin
  if dsNakloEdit.DataSet.FieldByName('id_currency').asInteger<>
    dsBank.DataSet.FieldByName('id_currency').asInteger
  then begin
    dsNakloEdit.DataSet.FieldByName('id_currency').asInteger:=
      dsBank.DataSet.FieldByName('id_currency').asInteger;
  end;
end;

procedure TfrmPlategyEdit.dbeIDKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then Begin
    If HiWord(GetKeyState(VK_SHIFT)) <> 0 then begin
       SelectNext(Sender as TWinControl,False,True);
    end else begin
       SelectNext(Sender as TWinControl,True,True) ;
       Key := #0
    end;
  end;
end;

procedure TfrmPlategyEdit.lcbXozOperChange(Sender: TObject);
begin
  if self.Visible then begin
    ProcessXozOper;
  end;
end;



procedure TfrmPlategyEdit.ProcessXozOper;
begin
  if ((lcbXozOper.KeyValue=GetVozvratTip) or
    (lcbXozOper.KeyValue=GetVozvratTipUsl)) then
  begin
    lcbIZG.ListSource := dmdEx.dsClient;
  end else begin
    lcbIZG.ListSource := dmdEx.dsPost;
  end;
  if lcbXozOper.KeyValue =GetAgentTip then begin
    lcbAgent.Show;
    lblAgent.Show;
    lblZatraty.Show;
    dneZatraty.Show;
    lblNdsFrom.Show;
    dneNdsFrom.Show;
  end else begin
    lblAgent.Hide;  
    lcbAgent.Hide;
    lblZatraty.Hide;
    dneZatraty.Hide;
    lblNdsFrom.Hide;
    dneNdsFrom.Hide;
  end
end;

procedure TfrmPlategyEdit.dneNdsFromChange(Sender: TObject);
begin
  if self.Visible  and not Semaphore then begin
    Semaphore := true;
    if dneNds.value<>0 then begin
      dneZatraty.Value :=dneNdsFrom.Value/dneNds.value*100;
    end else begin
      dneZatraty.Value :=0
    end;
    Semaphore := false;
  end;  //if self.Visible  and not Semaphore
end;

procedure TfrmPlategyEdit.dneZatratyChange(Sender: TObject);
begin
  if self.Visible  and not Semaphore then begin
    Semaphore := true;
    dneNdsFrom.Value := dneZatraty.Value/100*dneNds.value;
    Semaphore := false;
  end;  //if self.Visible  and not Semaphore
end;

procedure TfrmPlategyEdit.dneNdsChange(Sender: TObject);
begin
  if self.Visible  and not Semaphore then begin
    Semaphore := true;
    dneNdsFrom.Value := dneZatraty.Value/100*dneNds.value;
    Semaphore := false;
  end;  //if self.Visible  and not Semaphore
end;

function TfrmPlategyEdit.GetVozvratTip: integer;
begin
  Result := dsNakloEdit.DataSet.FieldByName('XOZ_OPER').LookupDataSet.Lookup('name','ВОЗВРАТ ПОКУПАТЕЛЮ','oid');
end;

function TfrmPlategyEdit.GetVozvratTipUsl: integer;
begin
  Result := dsNakloEdit.DataSet.FieldByName('XOZ_OPER').LookupDataSet.Lookup('name','ВОЗВРАТ ПОКУПАТЕЛЮ УСЛУГ','oid');
end;

function TfrmPlategyEdit.GetAgentTip: integer;
begin
  Result := dsNakloEdit.DataSet.FieldByName('XOZ_OPER').LookupDataSet.Lookup('name','ОПЛАТА АГЕНТУ','oid');
end;

procedure TfrmPlategyEdit.lcbIZGChange(Sender: TObject);
begin
  //
end;

procedure TfrmPlategyEdit.CheckFilledFields;
begin
	if dsNakloEdit.DataSet.FieldByName('id_izg').IsNull then begin
		showmessage ('Заполните поле ''Поставщик''');
		lcbIZG.SetFocus;
		abort;
	end;
	if dsNakloEdit.DataSet.FieldByName('id_zak').IsNull then begin
		showmessage ('Заполните поле ''Получатель''');
		lcbZak.SetFocus;
		abort;
	end;
end;

procedure TfrmPlategyEdit.lcbAgentEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  //поле агент очищаем
  dsNakloEdit.DataSet.FieldByName('id_currency_to').Clear;
  Handled := true;
end;

end.
