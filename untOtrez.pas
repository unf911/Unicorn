unit untOtrez;

interface

uses
  Windows, Messages,
  SysUtils,
  Variants, Classes,
  Graphics, Controls,
  Forms,
  Dialogs, StdCtrls,
  Mask, DBCtrlsEh,
  Buttons, math,
  ATSAssert, ExtCtrls, PropFilerEh, PropStorageEh;

type
  TfrmOtrez = class(TForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    dbnBuxt: TDBNumberEditEh;
    Label2: TLabel;
    dbnKolotp: TDBNumberEditEh;
    Label1: TLabel;
    rbKolotp: TRadioButton;
    rbBuxt: TRadioButton;
    PropStorageEh1: TPropStorageEh;
    rpsNaklodet: TRegPropStorageManEh;
    procedure btnOkClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCancelClick(Sender: TObject);
    procedure rbKolotpClick(Sender: TObject);
    procedure rbBuxtClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ShowOtrez (var dblKolotp :double;var intBuxt:integer; dMaxValue: double):integer;
  end;

var
  frmOtrez: TfrmOtrez;

implementation

{$R *.dfm}



function TfrmOtrez.ShowOtrez(var dblKolotp: double; var intBuxt: integer;dMaxValue: double):integer;
var
  intRes :integer;
begin
  Result :=0;
try
  dbnKolotp.Value := dblKolotp;
  dbnKolotp.MaxValue := dMaxValue;
  dbnBuxt.Value :=  intBuxt;
  dbnBuxt.MaxValue := intBuxt;
	rbKolotp.Checked:=true;
	dbnBuxt.Enabled := false;
	if dbnBuxt.Value=1 then begin
		rbBuxt.Enabled := false;
	end;
	dbnKolotp.SelectAll;
	intRes := self.ShowModal;
	if (intRes=mrOk) then begin
    if not VarIsNull(dbnKolotp.Value) then begin
      dblKolotp := dbnKolotp.Value;
    end else begin
       dblKolotp := 0;
    end;
    if not VarIsNull (dbnBuxt.Value) then begin
      intBuxt := dbnBuxt.Value;
    end else begin
      intBuxt := 0;
    end;
	end;
	Result := intRes;
except
	AssertInternal('DBC75A40-FB7A-4159-8FE2-C7AD1A5A5B40');
end;
end;

procedure TfrmOtrez.btnOkClick(Sender: TObject);
begin
  if ((dbnBuxt.Value > 1) and
    (RoundTo(dbnKolotp.Value-dbnKolotp.MaxValue,-3)<>0)) then begin
    showmessage ('Если бухт больше одной, то их не режут. ');
    dbnKolotp.Value := dbnKolotp.MaxValue;
    dbnKolotp.setfocus;
    abort;
  end
  else begin
    ModalResult := mrOk;
  end;
end;

procedure TfrmOtrez.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
try
  case key of
    vk_return: begin
      btnOk.Click;
    end;
    vk_escape:  begin
      btnCancel.Click;
    end;
  end;
except
  AssertInternal('74C7B239-833F-4153-B872-A58626024915');
end;
end;

procedure TfrmOtrez.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmOtrez.rbKolotpClick(Sender: TObject);
begin
  rbBuxt.Checked := false;
  dbnBuxt.Enabled := false;
  dbnKolotp.Enabled := true;
  dbnKolotp.SetFocus;
end;

procedure TfrmOtrez.rbBuxtClick(Sender: TObject);
begin
  rbKolotp.Checked := false;
  dbnKolotp.Enabled := false;
  dbnBuxt.Enabled := true;
  dbnBuxt.SetFocus;
end;


end.
