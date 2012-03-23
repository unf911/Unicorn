unit NNaklpEdit;

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
  TfrmNnaklpEdit = class(TForm)
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label15: TLabel;
    dbeIDNAKL: TDBEditEh;
    lcbMANAGER: TDBLookupComboboxEh;
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
    Label10: TLabel;
    lcbZak: TDBLookupComboboxEh;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    dneNalogNds: TDBNumberEditEh;
    dneNds: TDBNumberEditEh;
    actKursChange: TAction;
    Label5: TLabel;
    Label2: TLabel;
    dteDatVypiski: TDBDateTimeEditEh;
    Label6: TLabel;
    lcbTipName: TDBLookupComboboxEh;
    Label9: TLabel;
    dneVsego: TDBNumberEditEh;
    Label11: TLabel;
    dneVsegoNds: TDBNumberEditEh;
    sdsKlientAttr: TSQLDataSet;
    procedure actOkExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actApplyExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dneVsegoChange(Sender: TObject);
    procedure dneVsegoNdsChange(Sender: TObject);
    procedure dneNalogNdsChange(Sender: TObject);
    procedure lcbIZGChange(Sender: TObject);

  private
    { Private declarations }
    Semaphore : boolean;
  public
    { Public declarations }
  end;

var
  frmNnaklpEdit: TfrmNnaklpEdit;

implementation

uses untNaklrList, untEx;

{$R *.dfm}

procedure TfrmNnaklpEdit.actOkExecute(Sender: TObject);
begin
  actApply.Execute;
  if  actApply.Checked then begin
    ModalResult := mrOk;
  end;
end;

procedure TfrmNnaklpEdit.actCancelExecute(Sender: TObject);
begin
  semaphore := true;
  Close;
end;

procedure TfrmNnaklpEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if dsNakloEdit.DataSet.State <> dsBrowse then begin
    dsNakloEdit.DataSet.Cancel;
    ModalResult := mrCancel;
  end;
end; 


procedure TfrmNnaklpEdit.actApplyExecute(Sender: TObject);
begin
  actApply.Checked := false;
	if dsNakloEdit.DataSet.FieldByName('dat').IsNull then begin
		showmessage ('Заполните поле ''Дата получения''');
		dteDat.SetFocus;
		abort;
	end;
	if dsNakloEdit.DataSet.FieldByName('dat_vypiski').IsNull then begin
		showmessage ('Заполните поле ''Дата выписки''');
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
	if (TClientDataSet(dsNakloEdit.DataSet).ApplyUpdates(0)<>0) then begin
		TClientDataSet(dsNakloEdit.DataSet).CancelUpdates;
		abort;
	end;
  actApply.Checked := true;
end;

procedure TfrmNnaklpEdit.FormShow(Sender: TObject);
begin
  dbeId.SetFocus;
  Semaphore := false;
  //можно дальше редактировать
end;

procedure TfrmNnaklpEdit.dneVsegoChange(Sender: TObject);
begin
  if self.Visible  and not semaphore then begin
    semaphore := true;
    dneVsegoNds.Value := dneVsego.Value*dneNalogNds.Value;
    dneNds.Value  := dneVsego.Value + dneVsegoNds.Value;
    semaphore:=false;
  end;
end;

procedure TfrmNnaklpEdit.dneVsegoNdsChange(Sender: TObject);
begin
  if self.Visible  and not semaphore then begin
    semaphore := true;
    dneNds.Value  := dneVsego.Value + dneVsegoNds.Value;
    semaphore:=false;
  end;
end;

procedure TfrmNnaklpEdit.dneNalogNdsChange(Sender: TObject);
begin
  if self.Visible  and not semaphore then begin
    semaphore := true;
    dneVsegoNds.Value := dneVsego.Value*dneNalogNds.Value;
    dneNds.Value  := dneVsego.Value + dneVsegoNds.Value;
    semaphore:=false;
  end;
end;

procedure TfrmNnaklpEdit.lcbIZGChange(Sender: TObject);
begin
  if self.Visible   then begin
    sdsKlientAttr.Close;
    sdsKlientAttr.Params.ParamByName('oid').asInteger:=
      VarToInt(lcbIZG.Value,true);
    sdsKlientAttr.Open;
    if  sdsKlientAttr.FieldByName('value1').asString =
      'Неплательщик НДС'  then begin
      dsNakloEdit.DataSet.FieldByName('nalog_nds').asFloat :=0;
    end;
    sdsKlientAttr.Close;
  end;
end;

end.
