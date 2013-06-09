unit NaklrEdit;

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
  TfrmNaklrEdit = class(TForm)
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    dbeIDNAKL: TDBEditEh;
    lcbMANAGER: TDBLookupComboboxEh;
    dbeLico: TDBEdit;
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
    lcbZak: TDBLookupComboboxEh;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    dneNds: TDBNumberEditEh;
    dneKurs: TDBNumberEditEh;
    actKursChange: TAction;
    Label2: TLabel;
    Label5: TLabel;
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
    Label6: TLabel;
    dbeDov: TDBEdit;
    dbeFr: TDBEdit;
    Label9: TLabel;
    dbeDDo: TDBDateTimeEditEh;
    Label10: TLabel;
    DBCheckBoxEh1: TDBCheckBoxEh;
    dbeVidDostavki: TDBLookupComboboxEh;
    Label11: TLabel;
    Label12: TLabel;
    dbeXozOper: TDBLookupComboboxEh;
    Label14: TLabel;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    procedure actOkExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actApplyExecute(Sender: TObject);
    procedure lcdParentIdNaklEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure lcdParentIdNaklKeyPress(Sender: TObject; var Key: Char);
    procedure dspKursGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure cdsKursAfterInsert(DataSet: TDataSet);
    procedure cdsKursBeforePost(DataSet: TDataSet);
    procedure cdsKursKURS_INDIRECTChange(Sender: TField);
    procedure dbeIDNAKLKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
    Semaphore : boolean;
    //при изменении пользователем одной из валют
    procedure ShowNaklrList;

  public
    { Public declarations }
  end;

var
  frmNaklrEdit: TfrmNaklrEdit;

implementation

uses untNaklrList, untEx;

{$R *.dfm}

procedure TfrmNaklrEdit.actOkExecute(Sender: TObject);
begin
  actApply.Execute;
  if  actApply.Checked then begin
    ModalResult := mrOk;
  end;
end;

procedure TfrmNaklrEdit.actCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmNaklrEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CloseEditForm(self,dsNakloEdit.DataSet,semaphore);
end; 


procedure TfrmNaklrEdit.actApplyExecute(Sender: TObject);
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

procedure TfrmNaklrEdit.ShowNaklrList;
var
  intTemp : integer;
  strIdTemp : string;
  dFrom,dTo : TDate;
begin
   { DONE :
Добавить ограничения на выбор расходных
(только для этого менеджера и допустим не старше 3 месяцев) }
  actApply.Execute;
  dsNakloEdit.DataSet.Edit;
  frmNaklrList := TfrmNaklrList.Create(self);
  frmNaklrList.ShowSpec;
  //менеджер только этот
  frmNaklrList.setT.IDManager:= 0;
   // dsNakloEdit.dataset.fieldbyname('id_manager').asInteger;
  dFrom := IncMonth(dsNakloEdit.DataSet.FieldByName('dat').AsDateTime,-12);
  frmNaklrList.setT.DateFrom:=dFrom;
  dTo := IncMonth(dsNakloEdit.DataSet.FieldByName('dat').asDateTime,12);
  frmNaklrList.setT.DateTo:=dTo;
   //фирма только эта
  frmNaklrList.qeNaklr.SetSql('where','id_izg='+
   dsNakloEdit.dataset.fieldbyname('id_izg').asString,3);
{  frmNaklrList.qeNaklr.SetSql('where','id_zak='+
   dsNakloEdit.dataset.fieldbyname('id_zak').asString,4);  }
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

procedure TfrmNaklrEdit.lcdParentIdNaklEditButtons0Click(
  Sender: TObject; var Handled: Boolean);
begin
  ShowNaklrList;
  Handled := true;
end;

procedure TfrmNaklrEdit.FormShow(Sender: TObject);
begin
  dbeId.SetFocus;
  //можно дальше редактировать
  Semaphore := false;
end;



procedure TfrmNaklrEdit.lcdParentIdNaklKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Ord(key) <> 13 then begin
    ShowNaklrList;
  end;
end;

procedure TfrmNaklrEdit.dspKursGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
  TableName:= 'KURS';
end;

procedure TfrmNaklrEdit.cdsKursAfterInsert(DataSet: TDataSet);
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

procedure TfrmNaklrEdit.cdsKursBeforePost(DataSet: TDataSet);
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

procedure TfrmNaklrEdit.cdsKursKURS_INDIRECTChange(Sender: TField);
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


procedure TfrmNaklrEdit.dbeIDNAKLKeyPress(Sender: TObject;
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

end.
