unit VozvratPostEdit;

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
  ClientSchet, DBCtrlsEh, DBLookupEh, FMTBcd, SqlExpr, Provider, DBGridEh,
  PropFilerEh //tfrmClientSchet
    ;

type
  TfrmVozvratPostEdit = class(TForm)
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    dbeIDNAKL: TDBEditEh;
    lcbMANAGER: TDBLookupComboboxEh;
    dbeComment: TDBEdit;
    dbeID: TDBEditEh;
    lcbSklad: TDBLookupComboboxEh;
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
    Label10: TLabel;
    lcbZak: TDBLookupComboboxEh;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    lcdParentIdNakl: TDBEditEh;
    Label12: TLabel;
    dbeNalogNds: TDBNumberEditEh;
    Label9: TLabel;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    Label6: TLabel;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    dneZatraty: TDBNumberEditEh;
    dneNds: TDBNumberEditEh;
    dneKurs: TDBNumberEditEh;
    dneKursIndirect: TDBComboBoxEh;
    actKursChange: TAction;
    Label2: TLabel;
    Label5: TLabel;
    Label11: TLabel;
    sdsKurs: TSQLDataSet;
    dspKurs: TDataSetProvider;
    cdsKurs: TClientDataSet;
    cdsKursDAT: TSQLTimeStampField;
    cdsKursUSD: TFloatField;
    cdsKursID_CURRENCY: TSmallintField;
    cdsKursID_CURRENCY_FROM: TIntegerField;
    cdsKursKURS_FROM: TFloatField;
    dsKurs: TDataSource;
    sdsKursDAT: TSQLTimeStampField;
    sdsKursKURS_FROM: TFloatField;
    sdsKursUSD: TFloatField;
    sdsKursID_CURRENCY: TIntegerField;
    sdsKursID_CURRENCY_FROM: TIntegerField;
    sdsKursKURS_INDIRECT: TIntegerField;
    cdsKursKURS_INDIRECT: TIntegerField;
    sdsKursID: TIntegerField;
    cdsKursID: TIntegerField;
    procedure actOkExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actApplyExecute(Sender: TObject);
    procedure lcdParentIdNaklEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure lcdParentIdNaklKeyPress(Sender: TObject; var Key: Char);
    procedure lcdParentIdNaklDblClick(Sender: TObject);
    procedure DBLookupComboboxEh1KeyValueChanged(Sender: TObject);
    procedure DBLookupComboboxEh2KeyValueChanged(Sender: TObject);
    procedure dneKursChange(Sender: TObject);
    procedure dneKursIndirectChange(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure actKursChangeExecute(Sender: TObject);
    procedure dteDatChange(Sender: TObject);
    procedure dspKursGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure cdsKursAfterInsert(DataSet: TDataSet);
    procedure cdsKursBeforePost(DataSet: TDataSet);
    procedure cdsKursKURS_INDIRECTChange(Sender: TField);
    procedure dbeIDKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
    Semaphore : boolean;
    //при изменении пользователем одной из валют
    procedure KursChange;
    procedure ShowNaklpList;
  public
    { Public declarations }
  end;

var
  frmVozvratPostEdit: TfrmVozvratPostEdit;

implementation

uses untNaklrList, untEx;

{$R *.dfm}

procedure TfrmVozvratPostEdit.actOkExecute(Sender: TObject);
begin
  actApply.Execute;
  if  actApply.Checked then begin
    ModalResult := mrOk;
  end;
end;

procedure TfrmVozvratPostEdit.actCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmVozvratPostEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CloseEditForm(self,dsNakloEdit.DataSet,semaphore);
end;


procedure TfrmVozvratPostEdit.actApplyExecute(Sender: TObject);
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
	if dsNakloEdit.DataSet.FieldByName('id_currency').IsNull then begin
		showmessage ('Заполните поле ''Валюта исходная''');
		DBLookupComboboxEh1.SetFocus;
		abort;
	end;
	if dsNakloEdit.DataSet.FieldByName('id_currency_to').IsNull then begin
		showmessage ('Заполните поле ''Валюта конечная''');
		DBLookupComboboxEh2.SetFocus;
		abort;
	end;
	if (dsNakloEdit.DataSet.state <> dsBrowse) then begin
		dsNakloEdit.DataSet.Post;
	end;  //to avoid double apply
  if dsKurs.DataSet.Active then begin
  	if (TClientDataSet(dsKurs.DataSet).ApplyUpdates(0)<>0) then begin
	  	TClientDataSet(dsKurs.DataSet).CancelUpdates;
		  {abort;}
      AssertInternal('1AF46D4E-C38C-4136-9F6E-0B7D29E37D06');
  	end;
  end;
	if (TClientDataSet(dsNakloEdit.DataSet).ApplyUpdates(0)<>0) then begin
		TClientDataSet(dsNakloEdit.DataSet).CancelUpdates;
		abort;
	end;
  actApply.Checked := true;
end;

procedure TfrmVozvratPostEdit.ShowNaklpList;
var
  intTemp : integer;
  strIdTemp : string;
  dFrom,dTo : TDate;
begin
   { DONE :
Добавить ограничения на выбор приходных
(только для этого менеджера и допустим не старше 12 месяцев) }
  actApply.Execute;
  dsNakloEdit.DataSet.Edit;
  frmNaklrList := TfrmNaklrList.Create(self);
  frmNaklrList.shownaklpbux;
  //менеджер только этот
  frmNaklrList.setT.IDManager:= 0;
   // dsNakloEdit.dataset.fieldbyname('id_manager').asInteger;
  dFrom := IncMonth(dsNakloEdit.DataSet.FieldByName('dat').AsDateTime,-12);
  frmNaklrList.setT.DateFrom:=dFrom;
  dTo := IncMonth(dsNakloEdit.DataSet.FieldByName('dat').asDateTime,12);
  frmNaklrList.setT.DateTo:=dTo;
   //фирма только эта
  frmNaklrList.qeNaklr.SetSql('where','id_izg='+
   dsNakloEdit.dataset.fieldbyname('id_zak').asString,3);
  frmNaklrList.qeNaklr.SetSql('where','id_zak='+
   dsNakloEdit.dataset.fieldbyname('id_izg').asString,4);
  frmNaklrList.qeNaklr.SetSql('where','posted=1',5);
  frmNaklrList.ProcessSettings;
  frmNaklrList.DefaultOpen;

  if not frmNaklrList.Locate(
   dsNakloEdit.Dataset.FieldByName('parent_id_nakl').asInteger) then begin
//  ShowMessage('Указанная накладная не была найдена в списке.'+
//  ' Возможной причиной является период времени за который отбражаются накладные');
  end;
  intTemp := frmNaklrList.GetSchet;
  strIdTemp := frmNaklrList.qeNaklr.Query.FieldByName('id').asString;
  frmNaklrList.Free;
  if (intTemp <>0) then begin
    dsNakloEdit.Dataset.FieldByName('parent_id_nakl').asInteger := intTemp;
    dsNakloEdit.Dataset.FieldByName('parent_id').asString := strIdTemp;
  end;
end;

procedure TfrmVozvratPostEdit.lcdParentIdNaklEditButtons0Click(
  Sender: TObject; var Handled: Boolean);
begin
  ShowNaklpList;
  Handled := true;
end;

procedure TfrmVozvratPostEdit.FormShow(Sender: TObject);
begin
  dbeId.SetFocus;
  //можно дальше редактировать
  Semaphore := false;
  //ShowKursGtd;
end;



procedure TfrmVozvratPostEdit.lcdParentIdNaklKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Ord(key) <> 13 then begin
    ShowNaklpList;
  end else begin
    dbeIDKeyPress(Sender, Key);
  end;
end;

procedure TfrmVozvratPostEdit.lcdParentIdNaklDblClick(Sender: TObject);
begin
  ShowNaklpList;
end;

procedure TfrmVozvratPostEdit.DBLookupComboboxEh1KeyValueChanged(
  Sender: TObject);
begin
  KursChange;
  //ShowKursGtd;
end;

procedure TfrmVozvratPostEdit.DBLookupComboboxEh2KeyValueChanged(
  Sender: TObject);
begin
  KursChange;
  //ShowKursGtd;
end;

procedure TfrmVozvratPostEdit.dneKursChange(Sender: TObject);
begin
{
  if self.Visible and not semaphore then begin
    semaphore:=true;
    if RadioGroup1.ItemIndex=1 then begin
      if vartoint(dneKursIndirect.Value,true)<>1 then begin
        dneNds.Value:=(dneZatraty.Value)*(dneKurs.Value);
      end else begin
        if  dneKurs.Value<>0 then begin
          dneNds.Value:=(dneZatraty.Value)/(dneKurs.Value);
        end;
      end;
    end;
    if RadioGroup1.ItemIndex=0 then begin
      if vartoint(dneKursIndirect.Value,true)<>1 then begin
        if dneKurs.Value<>0 then begin
          dneZatraty.Value:=dneNds.Value/dneKurs.Value;
        end;
      end else begin
        dneZatraty.Value:=dneNds.Value*dneKurs.Value;
      end;
    end;
    semaphore:=false;
  end;
  }
end;

procedure TfrmVozvratPostEdit.dneKursIndirectChange(Sender: TObject);
begin
{
  if self.Visible and not semaphore then begin
    if RadioGroup1.ItemIndex=1 then begin
      semaphore:=true;
      if vartoint(dneKursIndirect.Value,true)<>1 then begin
        dneNds.Value:=(dneZatraty.Value)*(dneKurs.Value);
      end else begin
        if dneKurs.Value<>0 then begin
          dneNds.Value:=(dneZatraty.Value)/(dneKurs.Value);
        end;
      end;
      semaphore := false;
    end;
    if RadioGroup1.ItemIndex=0 then begin
      semaphore := true;
      if vartoint(dneKursIndirect.Value,true)<>1 then begin
        if dneKurs.Value<>0 then begin
          dneZatraty.Value:=dneNds.Value/dneKurs.Value;
        end;
      end else begin
        dneZatraty.Value:=dneNds.Value*dneKurs.Value;
      end;
      semaphore:=false;
    end;
  end;
  }
end;

procedure TfrmVozvratPostEdit.RadioGroup1Click(Sender: TObject);
begin
{
  dneKurs.Visible:=true;
  dneKursIndirect.Visible:=true;
  if DBLookupComboboxEh2.KeyValue= DBLookupComboboxEh1.KeyValue then begin
    //dneKurs.Value:=1;
    dneKurs.Visible:=false;
    dneKursIndirect.Visible:=false;
    RadioGroup1.ItemIndex:=1;
  end;
  case RadioGroup1.ItemIndex of
    0: begin
      dneZatraty.Enabled := false;
      dneKurs.Enabled := true;
      dneKursIndirect.Enabled:=true;
      dneNds.Enabled := true;
    end;
    1: begin
      //dneZatraty.Enabled := true;
      dneNds.Enabled := false;
      dneKurs.Enabled := true;
      dneKursIndirect.Enabled:=true;
    end;
    2:begin
      dneZatraty.Enabled := true;
      dneNds.Enabled := true;
      dneKurs.Enabled := false;
      dneKursIndirect.Enabled:=false;
    end;
  end;}
end;

procedure  TfrmVozvratPostEdit.KursChange;
begin
 try
  if self.Visible and not semaphore then begin
    dneKurs.Visible:=true;
    dneKursIndirect.Visible :=true;
    if DBLookupComboboxEh2.KeyValue= DBLookupComboboxEh1.KeyValue then begin
      dneKurs.Value:=1;
      dneKurs.Visible:=false;
      dneKursIndirect.Visible :=false;
      semaphore:=true;
      if vartoint(dneKursIndirect.Value,true)<>1 then begin
        dneNds.Value:=(dneZatraty.Value)*(dneKurs.Value);
      end else begin
        dneNds.Value:=(dneZatraty.Value)/(dneKurs.Value);
      end;
      semaphore := false;
    end else begin
      actKursChange.Execute;
    end;
  end;
 except
   AssertInternal('65F2C813-69C2-4306-BB5C-7B93C056026F');
 end;
end;

procedure TfrmVozvratPostEdit.actKursChangeExecute(Sender: TObject);
var
  dKurs : double;
  iKursIndirect: integer;
begin
  if DBLookupComboboxEh1.Value=Null then begin
    exit;
  end;
  if DBLookupComboboxEh2.Value=Null then begin
    exit;
  end;
  if dsNakloEdit.DataSet.FieldByName('dat').isNull then begin
    exit;
  end;
  dmdEx.GetKurs(DBLookupComboboxEh1.Value,
    DBLookupComboboxEh2.Value,
    dsNakloEdit.DataSet.FieldByName('dat').AsDateTime,
    dKurs,
    iKursIndirect);
  dneKurs.Value := dKurs;
  dneKursIndirect.Value := iKursIndirect;
  dneKurs.OnChange(self);  
end;


procedure TfrmVozvratPostEdit.dteDatChange(Sender: TObject);
begin
  KursChange;
  //ShowKursGtd;
end;

procedure TfrmVozvratPostEdit.dspKursGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
  TableName:= 'KURS';
end;

procedure TfrmVozvratPostEdit.cdsKursAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('id').asInteger := dmdEx.GetGenValue('kurs_gen');
  DataSet.FieldByName('id_currency_from').asInteger :=
    cdsKurs.Params.ParamByName('id_currency_from1').asInteger;
  DataSet.FieldByName('id_currency').asInteger :=
    cdsKurs.Params.ParamByName('id_currency1').asInteger;
  DataSet.FieldByName('kurs_from').asFloat:=1;
  DataSet.FieldByName('dat').AsDateTime:=
    cdsKurs.Params.ParamByName('dat1').asDateTime;
end;

procedure TfrmVozvratPostEdit.cdsKursBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then begin
    if DataSet.FieldByName('kurs_indirect').asInteger=1 then begin
      DataSet.FieldByName('id_currency_from').asInteger :=
        cdsKurs.Params.ParamByName('id_currency1').asInteger;
      DataSet.FieldByName('id_currency').asInteger :=
        cdsKurs.Params.ParamByName('id_currency_from1').asInteger;
    end;
  end;
end;

procedure TfrmVozvratPostEdit.cdsKursKURS_INDIRECTChange(Sender: TField);
var
  iCurTemp : integer;
begin
  if cdsKurs.State=dsEdit then begin
    iCurTemp := cdsKurs.FieldByName('id_currency').asInteger;
    cdsKurs.FieldByName('id_currency').asInteger :=
      cdsKurs.FieldByName('id_currency_from').asInteger;
    cdsKurs.FieldByName('id_currency_from').asInteger :=iCurTemp;
  end;
end;


procedure TfrmVozvratPostEdit.dbeIDKeyPress(Sender: TObject; var Key: Char);
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
