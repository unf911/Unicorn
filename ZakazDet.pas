unit ZakazDet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ActnList, DB, DBCtrlsEh, Mask, DBLookupEh,
  DBClient, //TClientDataSet
  ATSAssert, //assertinternal
  DBGridEh, DBCtrls, PropFilerEh, PropStorageEh  
  ;

type
  TfrmZakazDet = class(TForm)
    dsNaklotEdit: TDataSource;
    ActionList1: TActionList;
    actCancel: TAction;
    actApply: TAction;
    actOk: TAction;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    lcbTovar: TDBLookupComboboxEh;
    Label2: TLabel;
    dneKolotp: TDBNumberEditEh;
    Label5: TLabel;
    Label1: TLabel;
    dbeTovarText: TDBEdit;
    dneCena: TDBNumberEditEh;
    Label3: TLabel;
    dblTovarSnab: TDBLookupComboboxEh;
    Label4: TLabel;
    Label6: TLabel;
    dblPostSnab: TDBLookupComboboxEh;
    Label7: TLabel;
    Label8: TLabel;
    dbeComment: TDBEdit;
    dbnCenaSnab: TDBNumberEditEh;
    Label9: TLabel;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    dbeSrokSnab: TDBEdit;
    procedure actOkExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actApplyExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lcbTovarKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    //iPosted : integer;
    procedure processVisible(blocked , posted : integer);
  public
    { Public declarations }
    function ShowDetail(blocked:integer=0;posted:integer=0): integer;
  end;

var
  frmZakazDet: TfrmZakazDet;

implementation

uses untEx;

{$R *.dfm}

procedure TfrmZakazDet.actOkExecute(Sender: TObject);
begin
  actApply.Execute;
  if  actApply.Checked then begin
    ModalResult := mrOk;
  end;
end;

procedure TfrmZakazDet.actCancelExecute(Sender: TObject);
begin
  Close;
end;


procedure TfrmZakazDet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if dsNaklotEdit.DataSet.State <> dsBrowse then begin
    dsNaklotEdit.DataSet.Cancel;
    ModalResult := mrCancel;
  end;
end;

procedure TfrmZakazDet.actApplyExecute(Sender: TObject);
begin
  actApply.Checked := false;
  if dsNaklotEdit.DataSet.FieldByName('tovar').IsNull and
    dsNaklotEdit.DataSet.FieldByName('tovar_text').IsNull
  then begin
		showmessage ('Заполните поле ''Товар'' или ''Товар текстом''');
		lcbTovar.SetFocus;
		abort;
	end;
	if (TClientDataSet(dsNaklotEdit.DataSet).ApplyUpdates(0)<>0) then begin
		TClientDataSet(dsNaklotEdit.DataSet).CancelUpdates;
		abort;
	end;
  actApply.Checked := true;
end;

function TfrmZakazDet.ShowDetail(blocked:integer=0;posted:integer=0): integer;
begin
 Result := 0;
try
	dmdEx.StartWaiting;
	//1 - накладная была проведена. Блокируем кнопки отрезки
	//iPosted:=posted;
  ProcessVisible(blocked,posted);
	dmdEx.StopWaiting;
	Result := self.ShowModal;
except
	AssertInternal('A3629616-AC0A-4001-B997-BCBEA12ADFD2');
end;
end;



procedure TfrmZakazDet.FormCreate(Sender: TObject);
begin
  PropStorageEh1.Section := self.ClassName;
  PropStorageEh1.LoadProperties;
  PropStorageEh1.Active := true;
end;

procedure TfrmZakazDet.processVisible(blocked, posted: integer);
begin
  lcbTovar.Enabled := true;
  dneKolotp.Enabled := true;
  dbeTovarText.Enabled := true;
  dneCena.Enabled := true;
  dblTovarSnab.Enabled := true;
  dblPostSnab.Enabled := true;
  dbeSrokSnab.Enabled := true;
  dbeComment.Enabled := true;
  if blocked=1 then begin
    lcbTovar.Enabled := false;
    dneKolotp.Enabled := false;
    dbeTovarText.Enabled := false;
    dneCena.Enabled := false;
  end;
  if posted=1 then begin
    dblTovarSnab.Enabled := false;
    dblPostSnab.Enabled := false;
    dbeSrokSnab.Enabled := false;
    dbeComment.Enabled := false;
  end;
end;

procedure TfrmZakazDet.FormShow(Sender: TObject);
begin
  if lcbTovar.Visible and lcbTovar.Enabled then begin
    lcbTovar.SetFocus;
  end;
end;



procedure TfrmZakazDet.lcbTovarKeyPress(Sender: TObject; var Key: Char);
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
