unit untOtpravkaEdit;

interface

uses
  Windows, Messages, SysUtils, Variants,
  Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ActnList, DB,
  DBLookupEh, DBCtrlsEh, Mask,
  DBTables, ComCtrls,SqlTimSt,DBClient, Buttons,
  untEx,FMTBcd, Provider,
  SqlExpr, DBCtrls,
  untRound, Grids, DBGridEh;

type
  TfrmOtpravkaEdit = class(TForm)
    dsNakloEdit: TDataSource;
    ActionList1: TActionList;
    actCancel: TAction;
    actApply: TAction;
    actOk: TAction;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    dbeIDNAKL: TDBEditEh;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    dbeComment: TDBEdit;
    dbeID: TDBEditEh;
    lcbSklad: TDBLookupComboboxEh;
    dteDat: TDBDateTimeEditEh;
    procedure actCancelExecute(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
    procedure actOkExecute(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btnOkKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCancelKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOkKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOtpravkaEdit: TfrmOtpravkaEdit;

implementation

{$R *.dfm}

procedure TfrmOtpravkaEdit.actCancelExecute(Sender: TObject);
begin
  dsNakloEdit.DataSet.Cancel;
  CancelUpdates(dsNakloEdit.DataSet);
  ModalResult := mrCancel;
end;

procedure TfrmOtpravkaEdit.actApplyExecute(Sender: TObject);
begin
	if dsNakloEdit.DataSet.FieldByName('dat').IsNull then begin
		showmessage ('Заполните поле ''Дата''');
		dteDat.SetFocus;
		abort;
	end;
	if (dsNakloEdit.DataSet.state <> dsBrowse) then begin
		dsNakloEdit.DataSet.Post;
	end;  //to avoid double apply
	if (TClientDataSet(dsNakloEdit.DataSet).ApplyUpdates(0)<>0) then begin
		TClientDataSet(dsNakloEdit.DataSet).CancelUpdates;
		//abort;
	end;
end;

procedure TfrmOtpravkaEdit.actOkExecute(Sender: TObject);
begin
  actApply.Execute;
  ModalResult := mrOk;
end;

procedure TfrmOtpravkaEdit.btnApplyClick(Sender: TObject);
begin
  actApply.Execute;
end;

procedure TfrmOtpravkaEdit.btnOkKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Key := VK_OEM_CLEAR;
end;

procedure TfrmOtpravkaEdit.btnCancelKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Key := VK_OEM_CLEAR;
end;

procedure TfrmOtpravkaEdit.btnOkKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Key := VK_OEM_CLEAR;
end;

procedure TfrmOtpravkaEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmdEx.cdsNakloTip.Filtered:=false;
end;

end.
