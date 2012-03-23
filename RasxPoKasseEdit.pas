unit RasxPoKasseEdit;

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
  ClientSchet, DBCtrlsEh, DBLookupEh, FMTBcd, Provider, SqlExpr, DBGridEh,
  PropFilerEh //tfrmClientSchet
    ;

type
  TfrmRasxPoKasseEdit = class(TForm)
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    dbeIDNAKL: TDBEditEh;
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
    Label1: TLabel;
    lcbIZG: TDBLookupComboboxEh;
    Label7: TLabel;
    lcbZak: TDBLookupComboboxEh;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    dneNds: TDBNumberEditEh;
    actKursChange: TAction;
    Label2: TLabel;
    Label5: TLabel;
    lcbVlad: TDBLookupComboboxEh;
    sdsBank: TSQLDataSet;
    dspBank: TDataSetProvider;
    cdsBank: TClientDataSet;
    cdsBankBANK_NAME: TStringField;
    cdsBankRASCH: TFloatField;
    cdsBankMFO: TFloatField;
    cdsBankID_KLIENT: TIntegerField;
    cdsBankID_CURRENCY: TIntegerField;
    cdsBankOID: TIntegerField;
    cdsBankDELMARKED: TSmallintField;
    cdsBankFULLNAME: TStringField;
    dsBank: TDataSource;
    lcbBankFrom: TDBLookupComboboxEh;
    Label6: TLabel;
    dneNdsFrom: TDBNumberEditEh;
    Label9: TLabel;
    dneZatraty: TDBNumberEditEh;
    Label10: TLabel;
    lbcXozOper: TDBLookupComboboxEh;
    Label11: TLabel;
    procedure actOkExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actApplyExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbeIDKeyPress(Sender: TObject; var Key: Char);
    procedure lcbVladChange(Sender: TObject);
    procedure lcbBankFromEnter(Sender: TObject);
    procedure dneNdsFromChange(Sender: TObject);
    procedure dneZatratyChange(Sender: TObject);
    procedure dneNdsChange(Sender: TObject);
  private
    Semaphore : boolean;
    procedure ProcessSchet;
  public
    { Public declarations }
  end;

var
  frmRasxPoKasseEdit: TfrmRasxPoKasseEdit;

implementation

uses untNaklrList;

{$R *.dfm}

procedure TfrmRasxPoKasseEdit.actOkExecute(Sender: TObject);
begin
  actApply.Execute;
  if  actApply.Checked then begin
    ModalResult := mrOk;
  end;
end;

procedure TfrmRasxPoKasseEdit.actCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmRasxPoKasseEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CloseEditForm(self,dsNakloEdit.DataSet,semaphore);
end;



procedure TfrmRasxPoKasseEdit.actApplyExecute(Sender: TObject);
begin
  actApply.Checked := false;
	if dsNakloEdit.DataSet.FieldByName('dat').IsNull then begin
		showmessage ('Заполните поле ''Дата''');
		dteDat.SetFocus;
		abort;
	end;
	if dsNakloEdit.DataSet.FieldByName('izg').IsNull then begin
		showmessage ('Заполните поле ''Поставщик''');
		lcbIZG.SetFocus;
		abort;
	end;
	if dsNakloEdit.DataSet.FieldByName('zak').IsNull then begin
		showmessage ('Заполните поле ''Получатель''');
		lcbZak.SetFocus;
		abort;
	end;
	if dsNakloEdit.DataSet.FieldByName('manager').IsNull then begin
		showmessage ('Заполните поле ''Менеджер''');
		lcbMANAGER.SetFocus;
		abort;
	end;
	if dsNakloEdit.DataSet.FieldByName('nds').IsNull then begin
		showmessage ('Заполните поле ''Сумма''');
		dneNds.SetFocus;
		abort;
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

procedure TfrmRasxPoKasseEdit.FormShow(Sender: TObject);
begin
  //можно дальше редактировать
  Semaphore := false;
  dbeId.SetFocus;
  //KursChange;
end;


procedure TfrmRasxPoKasseEdit.dbeIDKeyPress(Sender: TObject;
  var Key: Char);
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

procedure TfrmRasxPoKasseEdit.ProcessSchet;
begin
  if self.visible then begin
    cdsBank.Close;
    cdsBank.Params.ParamByName('id_klient').asInteger:=
      dsNakloEdit.DataSet.FieldByName('id_vlad_schet').asInteger;
    cdsBank.Open;
  end;
end;

procedure TfrmRasxPoKasseEdit.lcbVladChange(Sender: TObject);
begin
  ProcessSchet;
end;

procedure TfrmRasxPoKasseEdit.lcbBankFromEnter(Sender: TObject);
begin
  ProcessSchet;
end;

procedure TfrmRasxPoKasseEdit.dneNdsFromChange(Sender: TObject);
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

procedure TfrmRasxPoKasseEdit.dneZatratyChange(Sender: TObject);
begin
  if self.Visible  and not Semaphore then begin
    Semaphore := true;
    dneNdsFrom.Value := dneZatraty.Value/100*dneNds.value;
    Semaphore := false;
  end;  //if self.Visible  and not Semaphore
end;

procedure TfrmRasxPoKasseEdit.dneNdsChange(Sender: TObject);
begin
  if self.Visible  and not Semaphore then begin
    Semaphore := true;
    dneNdsFrom.Value := dneZatraty.Value/100*dneNds.value;
    Semaphore := false;
  end;  //if self.Visible  and not Semaphore
end;

end.
