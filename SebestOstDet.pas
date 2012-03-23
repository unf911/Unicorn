unit SebestOstDet;
{детализация остатков по себестоимости}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, Grids, DBGridEh, DB, SqlExpr, DBClient, Provider,
  untEx, StdCtrls, Buttons, ActnList, Registry, Mask, DBCtrlsEh,
  PropStorageEh, UnfFilter, PropFilerEh, GridsEh;

type
  TfrmSebestOstDet = class(TForm)
    dspSklostdet: TDataSetProvider;
    cdsSklostdet: TClientDataSet;
    sdsSklostdet: TSQLDataSet;
    dsSklostdet: TDataSource;
    dbgSklostdet: TDBGridEh;
    btnOk: TBitBtn;
    ActionList1: TActionList;
    actExit: TAction;
    sdsSklostt2: TSQLDataSet;
    dsSklostt2: TDataSource;
    sdsSklostt2ID_TARA: TIntegerField;
    sdsSklostt2NOMER_TARY: TStringField;
    sdsSklostt2ID_TOVAR: TIntegerField;
    sdsSklostt2ID_SKLAD: TIntegerField;
    dspSklostt: TDataSetProvider;
    cdsSklostt23: TClientDataSet;
    cdsSklostt23ID_TARA: TIntegerField;
    cdsSklostt23NOMER_TARY: TStringField;
    cdsSklostt23ID_TOVAR: TIntegerField;
    cdsSklostt23ID_SKLAD: TIntegerField;
    cdsSklostt23TOVAR: TStringField;
    cdsSklostt23TARA: TStringField;
    lblPartiya: TLabel;
    dbeID: TDBEditEh;
    lblid: TLabel;
    BitBtn1: TBitBtn;
    actDetail: TAction;
    RegPropStorageManEh1: TRegPropStorageManEh;
    PropStorageEh1: TPropStorageEh;
    cdsSklostdetID_PARTIYA: TIntegerField;
    cdsSklostdetID: TStringField;
    cdsSklostdetDAT: TSQLTimeStampField;
    cdsSklostdetKOLOTP: TFloatField;
    cdsSklostdetSEBEST: TFloatField;
    cdsSklostdetCENA: TFloatField;
    cdsSklostdetKURS: TFloatField;
    cdsSklostdetNALOG_NDS: TFloatField;
    cdsSklostdetZATRATY: TFloatField;
    cdsSklostdetID_NAKL: TIntegerField;
    cdsSklostdetID_NAKLD: TIntegerField;
    cdsSklostdetID_UCHET_POLITICS: TIntegerField;
    edtSklad: TEdit;
    Label5: TLabel;
    edtTovar: TEdit;
    Label6: TLabel;
    edtPartiya: TEdit;
    edtCurrency: TEdit;
    Label2: TLabel;
    edtDate: TEdit;
    Label4: TLabel;
    cdsSklostdetTIP: TIntegerField;
    actRefresh: TAction;
    BitBtn2: TBitBtn;
    UnfFilter1: TUnfFilter;
    procedure actExitExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actDetailExecute(Sender: TObject);
    procedure dbgSklostdetDblClick(Sender: TObject);
    procedure dbgSklostdetKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actRefreshExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ShowDetail(mode: integer; id_sklad_in ,
      id_tovar_in, id_currency_to, dat_to,
      id_partiya_in, id_nakld_in:variant):integer;

  end;

var
  frmSebestOstDet: TfrmSebestOstDet;

implementation

uses
skladaux //opendocument
;
//untNaklp,untNaklo;

{$R *.dfm}

function TfrmSebestOstDet.ShowDetail(mode: integer; id_sklad_in ,
  id_tovar_in,
  id_currency_to, dat_to,
  id_partiya_in, id_nakld_in:variant):integer;
var
  varSklad : variant;
  varTovarAllND : variant;
begin
  dmdEx.StartWaiting;
  cdsSklostdet.Close;
  cdsSklostdet.Params.ParamValues['dat_to']:=dat_to;
  cdsSklostdet.Params.ParamValues['id_currency_to']:=id_currency_to;
  cdsSklostdet.Params.ParamByName('mode').asInteger := mode;
  cdsSklostdet.Params.ParamByName('id_sklad_in').asInteger := id_sklad_in;
  cdsSklostdet.Params.ParamByName('id_tovar_in').asInteger := id_tovar_in;
  cdsSklostdet.Params.ParamValues['id_partiya_in'] := id_partiya_in;
  cdsSklostdet.Params.ParamValues['id_nakld_in'] := id_nakld_in;
  cdsSklostdet.Open;

	varSklad := dmdEx.cdsSklads.Lookup(
		'oid',
    id_sklad_in,
    'name'
  );
  edtSklad.Text := vartostr(varSklad);

	varTovarAllND := dmdEx.cdsTovarAllNd.Lookup(
		'id',
    id_tovar_in,
    'name'
  );
  edtTovar.Text := vartostr(varTovarAllNd);
  edtPartiya.Text := vartostr(id_partiya_in);
  if mode=1 then begin
    lblid.Visible:=false;
    dbeID.Visible:=false;
    lblPartiya.Visible := true;
    edtPartiya.Visible := true;
  end;
  if (mode in [2,3]) then begin
    lblid.Visible:=true;
    dbeID.Visible:=true;
    lblPartiya.Visible := false;
    edtPartiya.Visible := false;
  end;

  dmdEx.StopWaiting;
  Result := 0;
end;

procedure TfrmSebestOstDet.actExitExecute(Sender: TObject);
begin
  self.Close;
  //ModalResult := mrOk;
end;

procedure TfrmSebestOstDet.FormCreate(Sender: TObject);
begin
  dmdEx.StartWaiting;
  //end restore grid
  dmdEx.OpenQuery(dmdEx.cdsNaklodetTip);
  dmdEx.OpenQuery(dmdEx.cdsAllClient);
  dmdEx.OpenQuery(dmdEx.cdsTara);
  dmdEx.OpenQuery(dmdEx.cdsSklads);
  dmdEx.OpenQuery(dmdEx.cdsTovarAllND);
  dmdEx.StopWaiting;
end;

procedure TfrmSebestOstDet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmdEx.CloseQuery(dmdEx.cdsNaklodetTip,false);
  dmdEx.CloseQuery(dmdEx.cdsAllClient,false);
  dmdEx.CloseQuery(dmdEx.cdsTara,false);
  dmdEx.CloseQuery(dmdEx.cdsSklads,false);
  dmdEx.CloseQuery(dmdEx.cdsTovarAllND,false);  
  Action := caFree;
end;

procedure TfrmSebestOstDet.actDetailExecute(Sender: TObject);
var
//  frmNaklo : TfrmNaklo;
//  frmNaklp : TfrmNaklp;
  frmSebestOstDet : TfrmSebestOstDet;
  varCurrency : variant;
  varDate : variant;
begin
  if cdsSklostdet.Params.ParamByName('mode').asInteger=1 then begin
  //если отчёт по одной партии, то детализация - это
  //открыть конкретную накладную
    OpenDocument(
    self,
    cdsSklostdet.FieldByName('id_nakl').asInteger,
    cdsSklostdet.FieldByName('tip').asInteger,
    0);
  end;
  if (cdsSklostdet.Params.ParamByName('mode').asInteger in [2,3]) then begin
    //если отчёт по позиции одной накладной, то показать из чего
    //получилась каждая партия упоминаемая в позиции
    frmSebestOstDet := TfrmSebestOstDet.Create(Application);
    varCurrency := Null;
    varDate := Null;
    frmSebestOstDet.ShowDetail(
      1,
      cdsSklostdet.Params.ParamByName('id_sklad_in').asInteger,
      cdsSklostdet.Params.ParamByName('id_tovar_in').asInteger,
      varCurrency,
      varDate,
      cdsSklostdet.FieldByName('id_partiya').AsInteger,
      Null
    );
  end;//('mode').asInteger=2
end;

procedure TfrmSebestOstDet.dbgSklostdetDblClick(Sender: TObject);
begin
  actDetail.Execute;
end;

procedure TfrmSebestOstDet.dbgSklostdetKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case key of 
    vk_return : begin
      actDetail.Execute;
    end;
  end;//case
end; 

procedure TfrmSebestOstDet.actRefreshExecute(Sender: TObject);
begin
  cdsSklostdet.Refresh;
end;

end.
