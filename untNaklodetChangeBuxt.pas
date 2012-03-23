unit untNaklodetChangeBuxt;
//используется в untNaklodet
//при детализации отгрузки. правый клик на отложенной бухте.
//можно поменять её на аналогичную

interface

uses
  Windows, Messages, SysUtils,
  Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh,
  ATSAssert,
  untEx, FMTBcd, DB, StdCtrls,
  Buttons, DBClient, Provider, SqlExpr, ActnList,
  untSklostDet, QueryExtender, PropStorageEh,
  UnfFilter, //детализация барабана
  Menus

  ;

type
  TfrmChangeBuxt = class(TForm)
    DBGridEh1: TDBGridEh;
    sdsTara: TSQLDataSet;
    dspTara: TDataSetProvider;
    cdsTara: TClientDataSet;
    dsTara: TDataSource;
    cdsTaraNOMER_TARY: TStringField;
    btnOk: TBitBtn;
    BitBtn2: TBitBtn;
    cdsTaraID_TARA: TIntegerField;
    cdsTaraID_OSTT: TIntegerField;
    ActionList1: TActionList;
    actDetail: TAction;
    BitBtn3: TBitBtn;
    qeTara: TQueryExtender;
    cdsTaraKOLOTP: TFMTBCDField;
    cdsTaraKOLBUXT: TIntegerField;
    cdsTaraCOMMENT: TStringField;
    cdsTaraKOLREZERV: TFMTBCDField;
    cdsTaraKOLBREZERV: TIntegerField;
    cdsTaraID_TYPE: TIntegerField;
    cdsTaraID_IZG: TIntegerField;
    PropStorageEh1: TPropStorageEh;
		RegPropStorageManEh1: TRegPropStorageManEh;
		cdsTaraIZG: TStringField;
    PopupNaklodet: TPopupMenu;
    mnuChangeBuxt: TMenuItem;
    actChangeBuxt: TAction;
    sdsExchange: TSQLDataSet;
    procedure FormCreate(Sender: TObject);
    procedure actDetailExecute(Sender: TObject);
    procedure actChangeBuxtExecute(Sender: TObject);
    procedure PopupNaklodetPopup(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
	private
    { Private declarations }
  public
    { Public declarations }
    //показ формы для выбора тары. если =mrOk тогда выбрана тара
    function ShowTara(var id_ostt:integer):integer;
    //дописываем нужный барабан в датасет
//    function FillTara (cdsNaklodet: TClientDataSet;var id_ostt :integer):integer;
  end;

var
  frmChangeBuxt: TfrmChangeBuxt;

implementation

{$R *.dfm}
{
function TfrmChangeBuxt.FillTara(cdsNaklodet: TClientDataSet;var id_ostt :integer): integer;
var
  id_ostt2 : integer;
begin
  Result := ShowTara(id_ostt2);
try
  id_ostt := id_ostt2;
  if ((cdsNaklodet.Active) and (Result=mrOk)) then begin
    cdsNaklodet.Insert;
    cdsNaklodet.FieldByName('id_tara').asInteger :=
      cdsTara.FieldBYname('id_tara').asInteger;
    cdsNaklodet.FieldByName('nomer_tary').AsString:=
      cdsTara.FieldByName('nomer_tary').AsString;
    cdsNaklodet.FieldByName('kolbuxt').AsInteger := 0;
    cdsNaklodet.FieldByName('kolotp').AsFloat := 0;
    cdsNaklodet.FieldByName('tip').AsInteger := 4; //намотка
  end;
except
  AssertInternal ('86E245F7-09DD-45AE-A17D-C11430709266');
end;
end;
}
procedure TfrmChangeBuxt.FormCreate(Sender: TObject);
begin
	cdsTara.CommandText:=sdsTara.CommandText;
//	qeTara.DefSql :=
//	qeTara.Refresh;
//	cdsTara.Open;
end;

function TfrmChangeBuxt.ShowTara(var id_ostt: integer): integer;
var
  iRes : integer;
begin
  iRes :=self.ShowModal;
try
  if (iRes=mrOk) then begin
    id_ostt:= cdsTara.FieldByName('id_ostt').AsInteger;
  end;
  if (iRes =mrCancel) then begin
    id_ostt:=0; //cancel
  end;
except
  AssertInternal ('DFCD83B0-A880-4D69-BACA-2FA245E46E56');
end;
  Result := iRes;
end;

procedure TfrmChangeBuxt.actDetailExecute(Sender: TObject);
var
  frmSklostDet : TfrmSklostDet;
begin
try
  frmSklostDet := TfrmSklostDet.Create(self);
  frmSklostDet.ShowDetailModal(
		cdsTara.FieldBYName('id_ostt').asInteger);
	frmSklostdet.free;
except
  AssertInternal ('{8643AB99-969C-4B9E-B673-303FF2E7CF9F}');
end;
end;

procedure TfrmChangeBuxt.actChangeBuxtExecute(Sender: TObject);
var
	frmChangeBuxt: TfrmChangeBuxt;
	id_ostt : integer;
begin
try
	frmChangeBuxt := TfrmChangeBuxt.Create(self);
	frmChangeBuxt.cdsTara.Close;
	frmChangeBuxt.cdsTara.Params.ParamByName('id_sklad').AsInteger :=
			self.cdsTara.Params.ParamByName('id_sklad').AsInteger;
	frmChangeBuxt.cdsTara.Params.ParamByName('id_tovar').AsInteger :=
			self.cdsTara.Params.ParamByName('id_tovar').AsInteger;
	frmChangeBuxt.cdsTara.Params.ParamByName('kolotp').asFloat :=
			self.cdsTara.Params.ParamByName('kolotp').asFloat;
	frmChangeBuxt.cdsTara.Open;
	if frmChangeBuxt.cdsTara.RecordCount < 1 then begin
		showmessage ('Бухт этого товара с такой длиной на складе не обнаружено');
		frmChangeBuxt.cdsTara.Close;
		frmChangeBuxt.Free;
		exit;
	end;
	if (frmChangeBuxt.ShowTara(id_ostt)=mrOk) then begin
		sdsExchange.Params.ParamByName('id_ostt1').AsInteger:=
			self.cdsTara.FieldByName('id_ostt').AsInteger;
		sdsExchange.Params.ParamByName('id_ostt2').AsInteger:=
			id_ostt;
		dmdEx.ExecSQL(sdsExchange);
		cdsTara.Refresh;
	end; //if
  frmChangeBuxt.Free;
except
	AssertInternal('42168842-CEF6-4335-B785-BE042A376732');
end;
end;

procedure TfrmChangeBuxt.PopupNaklodetPopup(Sender: TObject);
begin
	actChangeBuxt.Visible := false;
	if cdsTara.FieldByName('kolrezerv').AsFloat > 0 then begin
		actChangeBuxt.Visible := true;
	end;
end;

procedure TfrmChangeBuxt.btnOkClick(Sender: TObject);
begin
	if cdsTara.FieldByName('kolotp').AsFloat >0  then begin
		ModalResult := mrOk;
	end else begin
		MessageDlg ('Нельзя заменить бухту на ОТЛОЖЕННУЮ. '+
			'Сначала смените её на свободную. (Правый клик->Сменить бухты)',
			mtWarning,[mbOK],0);
	end;
end;

end.
