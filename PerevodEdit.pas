unit PerevodEdit;

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
  TfrmPerevodEdit = class(TForm)
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
    Label1: TLabel;
    lcbIZG: TDBLookupComboboxEh;
    Label7: TLabel;
    lcbZak: TDBLookupComboboxEh;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    dneNds: TDBNumberEditEh;
    Label2: TLabel;
    lcbBankFrom: TDBLookupComboboxEh;
    sdsBank: TSQLDataSet;
    dspBank: TDataSetProvider;
    cdsBank: TClientDataSet;
    dsBank: TDataSource;
    lcbBankTo: TDBLookupComboboxEh;
    Label9: TLabel;
    dneKurs: TDBNumberEditEh;
    RadioGroup1: TRadioGroup;
    dneKursIndirect: TDBComboBoxEh;
    actKursChange: TAction;
    SQLDataSet1: TSQLDataSet;
    dspBankZak: TDataSetProvider;
    cdsBankTo: TClientDataSet;
    dsBankTo: TDataSource;
    dneNdsFrom: TDBNumberEditEh;
    cdsBankBANK_NAME: TStringField;
    cdsBankRASCH: TFloatField;
    cdsBankMFO: TFloatField;
    cdsBankID_KLIENT: TIntegerField;
    cdsBankID_CURRENCY: TIntegerField;
    cdsBankOID: TIntegerField;
    cdsBankDELMARKED: TSmallintField;
    cdsBankFULLNAME: TStringField;
    cdsBankToBANK_NAME: TStringField;
    cdsBankToRASCH: TFloatField;
    cdsBankToMFO: TFloatField;
    cdsBankToID_KLIENT: TIntegerField;
    cdsBankToID_CURRENCY: TIntegerField;
    cdsBankToOID: TIntegerField;
    cdsBankToDELMARKED: TSmallintField;
    cdsBankToFULLNAME: TStringField;
    dblCurrencyTo: TDBText;
    dblCurrency: TDBText;
    procedure actOkExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actApplyExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lcbZakChange(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure dneNdsFromChange(Sender: TObject);
    procedure DBLookupComboboxEh2KeyValueChanged(Sender: TObject);
    procedure lcbBankToKeyValueChanged(Sender: TObject);
    procedure dneKursChange(Sender: TObject);
    procedure dneNdsChange(Sender: TObject);
    procedure dneKursIndirectChange(Sender: TObject);
    procedure actKursChangeExecute(Sender: TObject);
    procedure dteDatChange(Sender: TObject);
    procedure lcbIZGChange(Sender: TObject);
    procedure lcbBankFromChange(Sender: TObject);
    procedure lcbBankToChange(Sender: TObject);
    procedure lcbBankFromKeyValueChanged(Sender: TObject);
    procedure dbeIDKeyPress(Sender: TObject; var Key: Char);
  private
    Semaphore : boolean;
    procedure ProcessSchetIzg;
    procedure ProcessSchetZak;
    procedure KursChange;
    procedure ChangeCurrencyFrom;
    procedure ChangeCurrencyTo;
  public
    { Public declarations }
  end;

var
  frmPerevodEdit: TfrmPerevodEdit;

implementation

uses untNaklrList;

{$R *.dfm}

procedure TfrmPerevodEdit.actOkExecute(Sender: TObject);
begin
  actApply.Execute;
  if  actApply.Checked then begin
    ModalResult := mrOk;
  end;
end;

procedure TfrmPerevodEdit.actCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmPerevodEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CloseEditForm(self,dsNakloEdit.DataSet,semaphore);
end;

procedure TfrmPerevodEdit.actApplyExecute(Sender: TObject);
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
	if dsNakloEdit.DataSet.FieldByName('id_schet_izg').IsNull then begin
		showmessage ('Заполните поле ''Счёт отправителя''');
		lcbBankFrom.SetFocus;
		abort;
	end;
	if dsNakloEdit.DataSet.FieldByName('id_schet_zak').IsNull then begin
		showmessage ('Заполните поле ''Счёт получателя''');
		lcbBankTo.SetFocus;
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

procedure TfrmPerevodEdit.FormShow(Sender: TObject);
begin
  //можно дальше редактировать
  Semaphore := false;
  lcbIzg.SetFocus;
  ProcessSchetIzg;
  ProcessSchetZak;
  RadioGroup1.ItemIndex:=1;
  RadioGroup1Click(self);
  //KursChange;
end;


procedure TfrmPerevodEdit.ProcessSchetIzg;
begin
  dsBank.DataSet.Close;
  cdsBank.Params.ParamByName('id_klient').Value:=
    lcbIZG.KeyValue;
//    dsNakloEdit.DataSet.FieldByName('id_izg').asInteger;
  dsBank.DataSet.Open;
end;

procedure TfrmPerevodEdit.ProcessSchetZak;
begin
  dsBankTo.DataSet.Close;
  cdsBankTo.Params.ParamByName('id_klient').Value:=
    lcbZAK.KeyValue;
    //dsNakloEdit.DataSet.FieldByName('id_zak').asInteger;
  dsBankTo.DataSet.Open;
end;

procedure TfrmPerevodEdit.lcbZakChange(Sender: TObject);
begin
  if self.visible then begin
    dsNakloEdit.DataSet.FieldByName('id_schet_zak').Clear;
    ProcessSchetZak;
  end;
end;

procedure TfrmPerevodEdit.RadioGroup1Click(Sender: TObject);
begin
  dneKurs.Visible:=true;
  dneKursIndirect.Visible:=true;
  if dsNakloEdit.DataSet.FieldByName('id_currency').asInteger=
    dsNakloEdit.DataSet.FieldByName('id_currency_to').asInteger
  then begin
   //  DBLookupComboboxEh2.KeyValue= DBLookupComboboxEh1.KeyValue then begin
    dneKurs.Visible:=false;
    dneKursIndirect.Visible:=false;
    RadioGroup1.ItemIndex:=1;
  end;
  case RadioGroup1.ItemIndex of
    0: begin
      dneNdsFrom.Enabled := false;
      dneKurs.Enabled := true;
      dneKursIndirect.Enabled:=true;
      dneNds.Enabled := true;
    end;
    1: begin
      dneNdsFrom.Enabled := true;
      dneNds.Enabled := false;
      dneKurs.Enabled := true;
      dneKursIndirect.Enabled:=true;
    end;
    2:begin
      dneNdsFrom.Enabled := true;
      dneNds.Enabled := true;
      dneKurs.Enabled := false;
      dneKursIndirect.Enabled:=false;
    end;
  end;
end;

procedure TfrmPerevodEdit.dneNdsFromChange(Sender: TObject);
begin
  if self.Visible  and not Semaphore then begin
    Semaphore := true;
    if RadioGroup1.ItemIndex=2 then begin
      //if vartoint(dneKursIndirect.Value,true)<>1 then begin
      if dneKursIndirect.Value<>'1' then begin
        if dneNdsFrom.Value<>0 then begin
          dneKurs.Value:=dneNds.Value/(dneNdsFrom.Value);
        end;
      end else begin
        if dneNds.Value<>0 then begin
          dneKurs.Value:=(dneNdsFrom.Value)/dneNds.Value;
        end;
      end;
    end;
    if RadioGroup1.ItemIndex=1 then begin
      if dneKursIndirect.Value<>'1' then begin
      //if vartoint(dneKursIndirect.Value,true)<>1 then begin
        dneNds.Value:=(dneNdsFrom.Value)*(dneKurs.Value);
      end else begin
        dneNds.Value:=(dneNdsFrom.Value)/(dneKurs.Value);
      end;
    end;
    Semaphore := false;
  end;  //if self.Visible  and not Semaphore
end;

//Изменился курс. Может из-из изменения исходных валют
//Может
procedure  TfrmPerevodEdit.KursChange;
begin
  if self.Visible and not semaphore then begin
    dneKurs.Visible:=true;
    dneKursIndirect.Visible :=true;
    if dsNakloEdit.DataSet.FieldByName('id_currency').asInteger=
      dsNakloEdit.DataSet.FieldByName('id_currency_to').asInteger
    then begin
    //if dblCurrency.DBLookupComboboxEh2.KeyValue= DBLookupComboboxEh1.KeyValue then begin
      dneKurs.Value:=1;
      dneKurs.Visible:=false;
      dneKursIndirect.Visible :=false;
      RadioGroup1.ItemIndex:=1;
      RadioGroup1Click(self);
      semaphore:=true;
      //if vartoint(dneKursIndirect.Value,true)<>1 then begin
      if dneKursIndirect.Value<>'1' then begin
        dneNds.Value:=(dneNdsFrom.Value)*(dneKurs.Value);
      end else begin
        dneNds.Value:=(dneNdsFrom.Value)/(dneKurs.Value);
      end;
      semaphore := false;
    end else begin
      actKursChange.Execute;
    end;
  end;
end;

procedure TfrmPerevodEdit.DBLookupComboboxEh2KeyValueChanged(
  Sender: TObject);
begin
  KursChange;
end;

procedure TfrmPerevodEdit.lcbBankToKeyValueChanged(
  Sender: TObject);
begin
  KursChange;
end;

procedure TfrmPerevodEdit.dneKursChange(Sender: TObject);
begin
  if self.Visible and not semaphore then begin
    semaphore:=true;
    if RadioGroup1.ItemIndex=1 then begin
      if dneKursIndirect.Value<>'1' then begin
      //if vartoint(dneKursIndirect.Value,true)<>1 then begin
        dneNds.Value:=(dneNdsFrom.Value)*(dneKurs.Value);
      end else begin
        if  dneKurs.Value<>0 then begin
          dneNds.Value:=(dneNdsFrom.Value)/(dneKurs.Value);
        end;
      end;
    end;
    if RadioGroup1.ItemIndex=0 then begin
      //if vartoint(dneKursIndirect.Value,true)<>1 then begin
      if dneKursIndirect.Value<>'1' then begin
        if dneKurs.Value<>0 then begin
          dneNdsFrom.Value:=dneNds.Value/dneKurs.Value;
        end;
      end else begin
        dneNdsFrom.Value:=dneNds.Value*dneKurs.Value;
      end;
    end;
    semaphore:=false;
  end;
end;

procedure TfrmPerevodEdit.dneNdsChange(Sender: TObject);
begin
  if self.Visible and not semaphore then begin
    semaphore := true;
    if RadioGroup1.ItemIndex=2 then begin
      //if vartoint(dneKursIndirect.Value,true)<>1 then begin
      if dneKursIndirect.Value<>'1' then begin
        if dneNdsFrom.Value<>0 then begin
          dneKurs.Value:=dneNds.Value/(dneNdsFrom.Value);
        end;
      end else begin
        dneKurs.Value:=dneNds.Value*(dneNdsFrom.Value);
      end; //if dneKursIndirect.Value<>1
    end;
    if RadioGroup1.ItemIndex=0 then begin
      //if vartoint(dneKursIndirect.Value,true)<>1 then begin
      if dneKursIndirect.Value<>'1' then begin
        if dneKurs.Value<>0 then begin
          dneNdsFrom.Value:=dneNds.Value/dneKurs.Value;
        end;
      end else begin
        dneNdsFrom.Value:=dneNds.Value*dneKurs.Value;
      end;
    end;
    semaphore := false;
  end;
end;

procedure TfrmPerevodEdit.dneKursIndirectChange(Sender: TObject);
begin
  if self.Visible and not semaphore then begin
    if RadioGroup1.ItemIndex=1 then begin
      semaphore:=true;
      //if vartoint(dneKursIndirect.Value,true)<>1 then begin
      if dneKursIndirect.Value<>'1' then begin
        dneNds.Value:=(dneNdsFrom.Value)*(dneKurs.Value);
      end else begin
        if dneKurs.Value<>0 then begin
          dneNds.Value:=(dneNdsFrom.Value)/(dneKurs.Value);
        end;
      end;
      semaphore := false;
    end;
    if RadioGroup1.ItemIndex=0 then begin
      semaphore := true;
      //if vartoint(dneKursIndirect.Value,true)<>1 then begin
      if dneKursIndirect.Value<>'1' then begin
        if dneKurs.Value<>0 then begin
          dneNdsFrom.Value:=dneNds.Value/dneKurs.Value;
        end;
      end else begin
        dneNdsFrom.Value:=dneNds.Value*dneKurs.Value;
      end;
      semaphore:=false;
    end;
  end;
end;

procedure TfrmPerevodEdit.actKursChangeExecute(Sender: TObject);
var
  dKurs : double;
  iKursIndirect: integer;
begin
  if dsNakloEdit.DataSet.FieldByName('id_currency').IsNull then begin
    exit;
  end;
  if dsNakloEdit.DataSet.FieldByName('id_currency_to').IsNull then begin
    exit;
  end;
  if dsNakloEdit.DataSet.FieldByName('dat').isNull then begin
    exit;
  end;
  dmdEx.GetKurs(
    dsNakloEdit.DataSet.FieldByName('id_currency').asInteger,
    dsNakloEdit.DataSet.FieldByName('id_currency_to').asInteger,
    dsNakloEdit.DataSet.FieldByName('dat').AsDateTime,
    dKurs,
    iKursIndirect);
  dneKurs.Value := dKurs;
  dneKursIndirect.Value := iKursIndirect;
  dneKurs.OnChange(self);
end;

procedure TfrmPerevodEdit.dteDatChange(Sender: TObject);
begin
  KursChange;
end;

procedure TfrmPerevodEdit.lcbIZGChange(Sender: TObject);
begin
  IF SElf.visible then begin
    dsNakloEdit.DataSet.FieldByName('id_schet_izg').Clear;
    ProcessSchetIzg;
  end;
end;

procedure TfrmPerevodEdit.lcbBankFromChange(Sender: TObject);
begin
  if self.visible then begin
    ChangeCurrencyFrom;
  end;
  
end;

procedure TfrmPerevodEdit.ChangeCurrencyFrom;
begin
  if  dsNakloEdit.DataSet.FieldByName('id_currency').asInteger<>
    dsBank.DataSet.FieldByName('id_currency').asInteger
  then begin
    dsNakloEdit.DataSet.FieldByName('id_currency').asInteger:=
      dsBank.DataSet.FieldByName('id_currency').asInteger;
  end;
end;

procedure TfrmPerevodEdit.lcbBankToChange(Sender: TObject);
begin
  if self.Visible then begin
    ChangeCurrencyTo;
  end;
end;

procedure TfrmPerevodEdit.ChangeCurrencyTo;
begin
  if dsNakloEdit.DataSet.FieldByName('id_currency_to').asInteger<>
    dsBankTo.DataSet.FieldByName('id_currency').asInteger
  then begin
    dsNakloEdit.DataSet.FieldByName('id_currency_to').asInteger:=
      dsBankTo.DataSet.FieldByName('id_currency').asInteger;
  end;
end;

procedure TfrmPerevodEdit.lcbBankFromKeyValueChanged(Sender: TObject);
begin
  KursChange;
end;

procedure TfrmPerevodEdit.dbeIDKeyPress(Sender: TObject; var Key: Char);
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

end.
