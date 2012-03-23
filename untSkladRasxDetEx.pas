unit untSkladRasxDetEx;
//детализация для отчёта по расходу со склада

interface

uses
  Windows, Messages, SysUtils, Variants,
  Classes, Graphics, Controls, Forms,
  Dialogs, DB,
  QueryExtender, DBTables,
  Grids, DBGrids,
  StdCtrls, DBGridEh, FMTBcd,
  DBClient, Provider, SqlExpr,
  untEx,
  ATSAssert, Buttons, ActnList,
  //untNaklo, //TfrmNaklo
  //untNaklp,
  PropStorageEh, UnfFilter, PropFilerEh, GridsEh //TfrmNaklp
  ;

type
  TfrmSkladRasxDetEx = class(TForm)
    dsDet: TDataSource;
    DBGridEh1: TDBGridEh;
    sdsDet: TSQLDataSet;
    dspDet: TDataSetProvider;
    cdsDet: TClientDataSet;
    cdsDetID: TIntegerField;
    cdsDetDAT: TSQLTimeStampField;
    cdsDetIZG: TStringField;
    cdsDetZAK: TStringField;
    cdsDetMANAGER: TStringField;
    cdsDetKOLOTP: TFMTBCDField;
    btnOk: TBitBtn;
    ActionList1: TActionList;
    actExit: TAction;
    qeDet: TQueryExtender;
    actDetail: TAction;
    cdsDetTIP: TSmallintField;
    cdsDetID_NAKL: TIntegerField;
    PropStorageEh1: TPropStorageEh;
    rpsSkladRasxDetEx: TRegPropStorageManEh;
    cdsDetCOMMENT: TStringField;
    cdsDetCENA_GRN_NDS: TFloatField;
    cdsDetSUM_GRN_NDS: TFloatField;
    UnfFilter1: TUnfFilter;
    cdsDetTIP_NAME: TStringField;
    cdsDetSKLAD: TStringField;
    GroupBox1: TGroupBox;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    actRefresh: TAction;
    cdsDetWEIGHT_PER_KM: TFloatField;
    cdsDetWEIGHT: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure actDetailExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actRefreshExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ShowSkladRasxDet(qeSrc: TQueryExtender;iTovar : integer);    
  end;

var
  frmSkladRasxDetEx: TfrmSkladRasxDetEx;

implementation

uses SkladAux //Opendocument
;

{$R *.dfm}

procedure TfrmSkladRasxDetEx.FormCreate(Sender: TObject);
begin
  cdsDet.Close;
  qeDet.DefSql := sdsDet.CommandText;
end;

procedure TfrmSkladRasxDetEx.btnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSkladRasxDetEx.ShowSkladRasxDet(qeSrc: TQueryExtender;iTovar : integer);
var
  strTemp: string;
  i : integer;
begin
try
  for i:=0 to qeSrc.CountSql('where')-1 do begin
    strTemp := qeSrc.GetSQL('where',i);
    qeDet.SetSQL('where',strTemp,i+1);
  end;
  qeDet.SetSQL('where','ot.id_tovar='+inttostr(iTovar),0);
  qeDet.Refresh;
except
  AssertInternal('A62EAEA2-C1DC-44E2-8683-D6A6A40A80E6');
end;
end;


procedure TfrmSkladRasxDetEx.actExitExecute(Sender: TObject);
begin
  self.Close;
//  modalresult := mrOk;
end;

procedure TfrmSkladRasxDetEx.actDetailExecute(Sender: TObject);
//var
//  frmNaklo : TfrmNaklo;
//  frmNaklp : TfrmNaklp;
begin
  OpenDocument(
    self,
    cdsDet.FieldByName('id_nakl').asInteger,
    cdsDet.FieldByName('tip').asInteger,
    0);
end;

procedure TfrmSkladRasxDetEx.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmSkladRasxDetEx.DBGridEh1DblClick(Sender: TObject);
begin
  actDetail.execute;
end;

procedure TfrmSkladRasxDetEx.DBGridEh1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return : begin
      actDetail.Execute;
    end;
  end;
end;

procedure TfrmSkladRasxDetEx.actRefreshExecute(Sender: TObject);
begin
  qeDet.Refresh;
end;

end.
