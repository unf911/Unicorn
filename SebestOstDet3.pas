unit SebestOstDet3;
{детализация остатков по себестоимости}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, Grids, DBGridEh, DB, SqlExpr, DBClient, Provider,
  untEx, StdCtrls, Buttons, ActnList, Registry, Mask, DBCtrlsEh,
  PropStorageEh, UnfFilter, Menus, ExtCtrls, PropFilerEh, GridsEh,
  QueryExtender;

type
  TfrmSebestOstDet3 = class(TForm)
    dspSklostdet: TDataSetProvider;
    cdsSklostdet: TClientDataSet;
    sdsSklostdet: TSQLDataSet;
    dsSklostdet: TDataSource;
    dbgSklostdet: TDBGridEh;
    btnOk: TBitBtn;
    ActionList1: TActionList;
    actExit: TAction;
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
    cdsSklostdetTIP: TIntegerField;
    actRefresh: TAction;
    BitBtn2: TBitBtn;
    UnfFilter1: TUnfFilter;
    Panel1: TPanel;
    edtSklad: TEdit;
    Label5: TLabel;
    edtTovar: TEdit;
    Label6: TLabel;
    lblPartiya: TLabel;
    lblid: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    dbeID: TDBEditEh;
    edtPartiya: TEdit;
    edtCurrency: TEdit;
    edtDate: TEdit;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    mnuRefresh: TMenuItem;
    N2: TMenuItem;
    actDebug: TAction;
    N3: TMenuItem;
    actGotoRasx: TAction;
    cdsSklostdetTIP_NAME: TStringField;
    N4: TMenuItem;
    cdsSklostdetID_SKLAD: TIntegerField;
    actPartiyaRecount: TAction;
    sdsNaklp_Sebest4_Recount: TSQLDataSet;
    N5: TMenuItem;
    actPositionRecount: TAction;
    N6: TMenuItem;
    cdsSklostdetID_SKLAD_TO: TIntegerField;
    qeSklostdet: TQueryExtender;
    procedure actExitExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actDetailExecute(Sender: TObject);
    procedure dbgSklostdetDblClick(Sender: TObject);
    procedure dbgSklostdetKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actRefreshExecute(Sender: TObject);
    procedure actDebugExecute(Sender: TObject);
    procedure actGotoRasxExecute(Sender: TObject);
    procedure actPartiyaRecountExecute(Sender: TObject);
    procedure actPositionRecountExecute(Sender: TObject);
  private
    { Private declarations }
    procedure UpdateCaption;
  public
    { Public declarations }
    function ShowDetail(mode: integer; id_sklad_in ,
      id_tovar_in, id_currency_to, dat_to,
      id_partiya_in, id_nakld_in:variant):integer;
    function ShowDetailModal (id_ostt: integer): integer;    
  end;

var
  frmSebestOstDet3: TfrmSebestOstDet3;

implementation

uses
//untNaklp,untNaklo,
skladaux, //opendocument
untRound;

{$R *.dfm}

//mode=1 - отчёт по партии
//mode=2 - отчёт по позиции
function TfrmSebestOstDet3.ShowDetail(mode: integer; id_sklad_in ,
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
  UpdateCaption;
  
  ColumnByName(dbgSklostdet.Columns,'KOLOTP').Footer.ValueType :=fvtSum;


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
  edtPartiya.Text := cdsSklostdet.Params.ParamByName('id_partiya_in').asString;
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

procedure TfrmSebestOstDet3.actExitExecute(Sender: TObject);
begin
  self.Close;
  //ModalResult := mrOk;
end;

procedure TfrmSebestOstDet3.FormCreate(Sender: TObject);
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

procedure TfrmSebestOstDet3.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmdEx.CloseQuery(dmdEx.cdsNaklodetTip,false);
  dmdEx.CloseQuery(dmdEx.cdsAllClient,false);
  dmdEx.CloseQuery(dmdEx.cdsTara,false);
  dmdEx.CloseQuery(dmdEx.cdsSklads,false);
  dmdEx.CloseQuery(dmdEx.cdsTovarAllND,false);  
  Action := caFree;
end;

procedure TfrmSebestOstDet3.actDetailExecute(Sender: TObject);
var
//  frmNaklo : TfrmNaklo;
//  frmNaklp : TfrmNaklp;
  frmSebestOstDet : TfrmSebestOstDet3;
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
    frmSebestOstDet := TfrmSebestOstDet3.Create(Application);
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



function TfrmSebestOstDet3.ShowDetailModal(id_ostt: integer): integer;
begin
  Result :=0;
{
  FormStyle := fsNormal;
  Hide;
  ShowDetail(id_ostt);
  Result := self.ShowModal;
}  
end;

procedure TfrmSebestOstDet3.dbgSklostdetDblClick(Sender: TObject);
begin
  actDetail.Execute;
end;

procedure TfrmSebestOstDet3.dbgSklostdetKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case key of 
    vk_return : begin
      actDetail.Execute;
    end;
  end;//case
end; 

procedure TfrmSebestOstDet3.actRefreshExecute(Sender: TObject);
begin
  //cdsSklostdet.Refresh;
  qeSklostdet.Refresh;
end;

procedure TfrmSebestOstDet3.actDebugExecute(Sender: TObject);
begin
  actDebug.Checked := not actDebug.Checked;
  if actDebug.Checked then begin
    //последние две колонки содержат номера фирм и клиентов
    //информация для отладки
    cdsSklostDet.FieldByName('id_nakl').Visible :=true;
    cdsSklostDet.FieldByName('id_nakld').Visible :=true;
  end else begin //if actDebug.Checked
    cdsSklostDet.FieldByName('id_nakl').Visible :=false;
    cdsSklostDet.FieldByName('id_nakld').Visible :=false;
  end; //if actDebug.Checked
end;

procedure TfrmSebestOstDet3.UpdateCaption;
begin
  if  cdsSklostdet.Params.ParamByName('mode').asInteger=2 then begin
    self.Caption := 'Детализация себестоимости: отчёт по позиции';
    actPartiyaRecount.Visible:=false;
  end;
  if  cdsSklostdet.Params.ParamByName('mode').asInteger=1 then begin
    self.Caption := 'Детализация себестоимости: отчёт по партии';
    actPartiyaRecount.Visible:=true;
  end;
end;

procedure TfrmSebestOstDet3.actGotoRasxExecute(Sender: TObject);
var
  frmSebestOstDet : TfrmSebestOstDet3;
  varCurrency :variant;
  varDate : variant;
begin
  if cdsSklostdet.FieldByName('tip').asInteger<>103 then begin
    MessageDlg('Переход возможен только для накладных хранения',mtWarning,[mbok],0);
    exit;
  end;
  if cdsSklostdet.Params.ParamByName('mode').asInteger<>1 then begin
    MessageDlg('Переход возможен только для отчёта по партии',mtWarning,[mbok],0);
    exit;
  end;
  frmSebestOstDet := TfrmSebestOstDet3.Create(Application);
  varCurrency := Null;
  varDate := Null;
  {Отчёт по этой позиции накладной на хранение, только
   со стороны склада отгрузки}
  if cdsSklostdet.Params.ParamByName('id_sklad_in').asInteger<>
    cdsSklostdet.FieldByName('id_sklad').AsInteger
  then begin
    frmSebestOstDet.ShowDetail(
      2,
      cdsSklostdet.FieldByName('id_sklad').AsInteger,
      cdsSklostdet.Params.ParamByName('id_tovar_in').asInteger,
      varCurrency,
      varDate,
      Null,
      cdsSklostdet.fieldbyname('id_nakld').asInteger
    );
  end else begin
    frmSebestOstDet.ShowDetail(
      2,
      cdsSklostdet.FieldByName('id_sklad_to').AsInteger,
      cdsSklostdet.Params.ParamByName('id_tovar_in').asInteger,
      varCurrency,
      varDate,
      Null,
      cdsSklostdet.fieldbyname('id_nakld').asInteger
    );
  end;
end;

procedure TfrmSebestOstDet3.actPartiyaRecountExecute(Sender: TObject);
begin
  if not cdsSklostdet.FieldByName('tip').asInteger in [1,2,103] then begin
    MessageDlg('Песчёт возможен для приходов, излишков и хранения',mtWarning,[mbok],0);
    exit;
  end;
  dmdEx.StartWaiting;
  sdsNaklp_Sebest4_Recount.Params.ParamByName('mode').asInteger:=4;
  sdsNaklp_Sebest4_Recount.Params.ParamByName('id_nakl').asInteger:=
    cdsSklostdet.FieldByName('id_nakld').asInteger;
  sdsNaklp_Sebest4_Recount.Params.ParamByName('id_partiya_in').asInteger:=
    cdsSklostdet.FieldByName('id_partiya').asInteger;
  sdsNaklp_Sebest4_Recount.Params.ParamByName('id_sklad').asInteger:=
    cdsSklostdet.Params.ParamByName('id_sklad_in').asInteger;
  sdsNaklp_Sebest4_Recount.Params.ParamByName('tip').asInteger:=
    cdsSklostdet.FieldByName('tip').asInteger;
  dmdEx.ExecSQL(sdsNaklp_Sebest4_Recount);
  actRefresh.Execute;
  dmdEx.stopwaiting;
end;

procedure TfrmSebestOstDet3.actPositionRecountExecute(Sender: TObject);
begin
{  if not cdsSklostdet.FieldByName('tip').asInteger in [1,2,103] then begin
    MessageDlg('Песчёт возможен для приходов, излишков и хранения',mtWarning,[mbok],0);
    exit;
  end;}
  dmdEx.StartWaiting;
  sdsNaklp_Sebest4_Recount.Params.ParamByName('mode').asInteger:=6;
  sdsNaklp_Sebest4_Recount.Params.ParamByName('id_nakl').asInteger:=
    cdsSklostdet.FieldByName('id_nakld').asInteger;
  sdsNaklp_Sebest4_Recount.Params.ParamByName('id_partiya_in').asInteger:=
    cdsSklostdet.FieldByName('id_partiya').asInteger;
  sdsNaklp_Sebest4_Recount.Params.ParamByName('id_sklad').asInteger:=
    cdsSklostdet.Params.ParamByName('id_sklad_in').asInteger;
  sdsNaklp_Sebest4_Recount.Params.ParamByName('tip').asInteger:=
    cdsSklostdet.FieldByName('tip').asInteger;
  dmdEx.ExecSQL(sdsNaklp_Sebest4_Recount);
  actRefresh.Execute;
  dmdEx.stopwaiting;
end;

end.
