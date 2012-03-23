unit untSklostDet;
{детализация остатков по складу}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, Grids, DBGridEh, DB, SqlExpr, DBClient, Provider,
  untEx, StdCtrls, Buttons, ActnList, Registry, Mask, DBCtrlsEh,
  PropStorageEh, PropFilerEh, GridsEh, ExtCtrls;

type
  TfrmSklostDet = class(TForm)
    dspSklostdet: TDataSetProvider;
    cdsSklostdet: TClientDataSet;
    sdsSklostdet: TSQLDataSet;
    dsSklostdet: TDataSource;
    dbgSklostdet: TDBGridEh;
    cdsSklostdetDAT: TSQLTimeStampField;
    cdsSklostdetKOLOTP: TFMTBCDField;
    cdsSklostdetKOLBUXT: TIntegerField;
    cdsSklostdetTIP: TSmallintField;
    cdsSklostdettip2: TStringField;
    ActionList1: TActionList;
    actExit: TAction;
    cdsSklostdetID_ZAK: TIntegerField;
    cdsSklostdetID_MANAGER: TIntegerField;
    cdsSklostdetID_TARA: TIntegerField;
    cdsSklostdetIZG: TStringField;
    cdsSklostdetZAK: TStringField;
    cdsSklostdetID_IZG: TIntegerField;
    cdsSklostdetMANAGER: TStringField;
    cdsSklostdetTARA: TStringField;
    sdsSklostt: TSQLDataSet;
    dsSklostt: TDataSource;
    sdsSklosttID_TARA: TIntegerField;
    sdsSklosttNOMER_TARY: TStringField;
    sdsSklosttID_TOVAR: TIntegerField;
    sdsSklosttID_SKLAD: TIntegerField;
    dspSklostt: TDataSetProvider;
    cdsSklostt: TClientDataSet;
    cdsSklosttID_TARA: TIntegerField;
    cdsSklosttNOMER_TARY: TStringField;
    cdsSklosttID_TOVAR: TIntegerField;
    cdsSklosttID_SKLAD: TIntegerField;
    cdsSklosttTOVAR: TStringField;
    cdsSklosttTARA: TStringField;
    cdsSklostdetOM_TIP: TSmallintField;
    cdsSklostdetOM_TIP2: TStringField;
    cdsSklostdetID: TStringField;
    actDetail: TAction;
    RegPropStorageManEh1: TRegPropStorageManEh;
    PropStorageEh1: TPropStorageEh;
    cdsSklostdetID_NAKL: TIntegerField;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtIdOstt: TEdit;
    dbeTovar: TDBEditEh;
    dbeTara: TDBEditEh;
    dbeNomerTary: TDBEditEh;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    btnOk: TBitBtn;
    procedure btnOkClick(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actDetailExecute(Sender: TObject);
    procedure dbgSklostdetDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ShowDetail (id_ostt : integer):integer;
    function ShowDetailModal (id_ostt: integer): integer;    
  end;

var
  frmSklostDet: TfrmSklostDet;

implementation

uses
  //untNaklp,untNaklo,
  skladaux //opendocument
;

{$R *.dfm}

function TfrmSklostDet.ShowDetail(id_ostt: integer): integer;
begin
  dmdEx.StartWaiting;
  cdsSklostdet.Close;
  cdsSklostdet.Params.ParamByName('id_ostt').asInteger:=id_ostt;
  cdsSklostdet.Open;
  cdsSklostt.Close;
  cdsSklostt.Params.ParamByName('id_ostt').asInteger:=id_ostt;
  cdsSklostt.Open;
  edtIdOstt.text := inttostr(id_ostt);
  dmdEx.StopWaiting;  
//  Result := self.ShowModal;
  Result := 0;
end;

procedure TfrmSklostDet.btnOkClick(Sender: TObject);
begin
  //Self.ModalResult := mrOk;
  self.Close;
end;
{
procedure TfrmSklostDet.cdsSklostdetCalcFields(DataSet: TDataSet);
var
  iTip : integer;
begin
  iTip := cdsSklostDet.FieldByName('tip').asInteger;
  cdsSklostDet.FieldByName('tip2').asString :=
    dmdEx.GetTipSkladPosit(iTip);
end;
}

procedure TfrmSklostDet.actExitExecute(Sender: TObject);
begin
  self.Close;
//  ModalResult := mrOk;
end;

procedure TfrmSklostDet.FormCreate(Sender: TObject);
begin
  dmdEx.StartWaiting;
  //end restore grid
  dmdEx.OpenQuery(dmdEx.cdsNaklodetTip);
  dmdEx.OpenQuery(dmdEx.cdsAllClient);
  dmdEx.OpenQuery(dmdEx.cdsTara);
  dmdEx.StopWaiting;
end;

procedure TfrmSklostDet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmdEx.CloseQuery(dmdEx.cdsNaklodetTip,false);
  dmdEx.CloseQuery(dmdEx.cdsAllClient,false);
  dmdEx.CloseQuery(dmdEx.cdsTara,false);
  Action := caFree;
end;

procedure TfrmSklostDet.actDetailExecute(Sender: TObject);
begin
  OpenDocument(
    self,
    cdsSklostdet.FieldByName('id_nakl').asInteger,
    cdsSklostdet.FieldByName('om_tip').asInteger,
    0);
  {
  if (cdsSklostdet.FieldByName('om_tip').asInteger in [5,6,103,30]) then begin
    //отгрузки со склада, не модальные

  end;
  if (cdsSklostdet.FieldByName('om_tip').asInteger in [1,2]) then begin
    //приходы на склад не модальные
    OpenDocument(
      self,
      cdsSklostdet.FieldByName('id_nakl').asInteger,
      cdsSklostdet.FieldByName('om_tip').asInteger,
      0);
  end;  }
end;



function TfrmSklostDet.ShowDetailModal(id_ostt: integer): integer;
begin
  FormStyle := fsNormal;
  Hide;
  ShowDetail(id_ostt);
  Result := self.ShowModal;
end;

procedure TfrmSklostDet.dbgSklostdetDblClick(Sender: TObject);
begin
  actDetail.Execute;
end;

end.
