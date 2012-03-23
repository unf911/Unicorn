unit RepNakloWeight;
{детализация остатков по складу}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, Grids, DBGridEh, DB, SqlExpr, DBClient, Provider,
  untEx, StdCtrls, Buttons, ActnList, Menus,
  untSklostDet, TovarSpr,
  Registry, UnfFilter, PropStorageEh, QueryExtender, PropFilerEh, GridsEh;

type
  TfrmNakloWeight = class(TForm)
    dspSklostdet: TDataSetProvider;
    cdsSklostdet: TClientDataSet;
    sdsSklostdet: TSQLDataSet;
    dsSklostdet: TDataSource;
    dbgAfterCutOstatok: TDBGridEh;
    btnOk: TBitBtn;
    ActionList1: TActionList;
    MainMenu1: TMainMenu;
    mnuAction: TMenuItem;
    cdsSklostdetID_NAKL: TIntegerField;
    cdsSklostdetID: TStringField;
    cdsSklostdetID_POS: TIntegerField;
    cdsSklostdetID_NAKLD: TIntegerField;
    cdsSklostdetID_TOVAR: TIntegerField;
    cdsSklostdetKOLOTP: TFloatField;
    cdsSklostdetWEIGHT: TFloatField;
    cdsSklostdetSUM_WEIGHT: TFloatField;
    cdsSklostdetCENA_GRN: TFloatField;
    cdsSklostdetSUM_GRN: TFloatField;
    cdsSklostdetSUM_GRN_NDS: TFloatField;
    cdsSklostdetNALOG_NDS: TFMTBCDField;
    cdsSklostdetTARA: TIntegerField;
    cdsSklostdetTIP: TIntegerField;
    cdsSklostdetDAT: TSQLTimeStampField;
    cdsSklostdetID_IZG: TIntegerField;
    cdsSklostdetID_ZAK: TIntegerField;
    cdsSklostdetID_MANAGER: TIntegerField;
    cdsSklostdetTOVAR: TStringField;
    rpsClientEdit: TRegPropStorageManEh;
    PropStorageEh1: TPropStorageEh;
    UnfFilter1: TUnfFilter;
    BitBtn1: TBitBtn;
    actRefresh: TAction;
    N1: TMenuItem;
    actTovarEdit: TAction;
    N2: TMenuItem;
    PopupMenu1: TPopupMenu;
    N3: TMenuItem;
    qeSklostdet: TQueryExtender;
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actTovarEditExecute(Sender: TObject);
    procedure dbgAfterCutOstatokDblClick(Sender: TObject);
    procedure dbgAfterCutOstatokKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actRefreshExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ShowDetail (id_nakl : integer):integer;
  end;

var
  frmNakloWeight: TfrmNakloWeight;

implementation
uses
  AtsAssert, untNaklo;

{$R *.dfm}

function TfrmNakloWeight.ShowDetail(id_nakl: integer): integer;
begin
  Result :=0;
  dmdEx.StartWaiting;
  cdsSklostdet.Close;
  cdsSklostdet.Params.ParamByName('id_nakl').asInteger:=id_nakl;
  cdsSklostdet.Open;
  dmdex.StopWaiting;
  //Result := self.ShowModal;
end;

procedure TfrmNakloWeight.btnOkClick(Sender: TObject);
begin
  //self.ModalResult := mrOk;
  self.close;
end;

procedure TfrmNakloWeight.FormCreate(Sender: TObject);
begin
  qeSklostdet.DefSql := sdsSklostdet.CommandText;
end;

procedure TfrmNakloWeight.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmNakloWeight.actTovarEditExecute(Sender: TObject);
var
  frmTovarSpr : TfrmTovarSpr;
begin
  if not (cdsSklostdet.Eof and cdsSklostdet.Bof) then begin
    frmTovarSpr := TfrmTovarSpr.Create(Application);
    frmTovarSpr.qeTovar.SetSQL('where','t.id='+ cdsSklostdet.FieldByName('id_tovar').asString,0);
    frmTovarSpr.qeTovar.Prepare;
    frmTovarSpr.DefaultOpen;
//    frmTovar.Show;
  end;
end;

procedure TfrmNakloWeight.dbgAfterCutOstatokDblClick(Sender: TObject);
begin
  actTovarEdit.Execute;
end;

procedure TfrmNakloWeight.dbgAfterCutOstatokKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case key of
    vk_return: begin
      actTovarEdit.execute;
    end;
  end;//case
end;

procedure TfrmNakloWeight.actRefreshExecute(Sender: TObject);
begin
  qeSklostdet.Refresh;  
end;

end.
