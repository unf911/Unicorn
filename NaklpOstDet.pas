unit NaklpOstDet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms,
  Dialogs, DBCtrls, untUnfDbLookupListbox,
  Grids, DBGrids,
  DB, DBTables,
  StdCtrls, QueryExtender,  //database
  untRound, //roundto
  untSettings, Buttons, ActnList,untRealPriceMake, Menus, FMTBcd, DBClient,
  Provider, SqlExpr, //frmSettings
  SettingsPost, //TfmSettingsPost
  untEx, UnfFilter, DBGridEh, PropStorageEh, PropFilerEh, GridsEh

  ;

type
  TfrmNaklpOstDet = class(TForm)
    dsNaklr: TDataSource;
    ActionList1: TActionList;
    actSettings: TAction;
    qeNaklr: TQueryExtender;
    actRefresh: TAction;
    MainMenu1: TMainMenu;
    mnuActions: TMenuItem;
    sdsNaklr: TSQLDataSet;
    dspNaklr: TDataSetProvider;
    cdsNaklr: TClientDataSet;
    UnfFilter1: TUnfFilter;
    N2: TMenuItem;
    PropStorageEh1: TPropStorageEh;
    RegPropStorageManEh1: TRegPropStorageManEh;
    dbgNaklr: TDBGridEh;
    PopupMenu1: TPopupMenu;
    cdsNaklrSUB1: TIntegerField;
    cdsNaklrSUB2: TIntegerField;
    cdsNaklrSUB3: TIntegerField;
    cdsNaklrSUB4: TIntegerField;
    cdsNaklrDEBETAFTER: TFloatField;
    cdsNaklrKREDITAFTER: TFloatField;
    cdsNaklrDIFF: TFloatField;
    cdsNaklrDEBET_KOLOTP: TFloatField;
    cdsNaklrKREDIT_KOLOTP: TFloatField;
    cdsNaklrDEBET_KOLOTP_AFTER: TFloatField;
    cdsNaklrDEBET_CENA: TFloatField;
    cdsNaklrKREDIT_CENA: TFloatField;
    cdsNaklrSUB5: TIntegerField;
    cdsNaklrTOVAR: TStringField;
    cdsNaklrDELTA_CENA: TFMTBCDField;
    cbxMode: TComboBox;
    Label1: TLabel;
    actDetail: TAction;
    BitBtn3: TBitBtn;
    N1: TMenuItem;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    //пересчёт суммы факт при нажатии "пересчитать"
    procedure actRefreshExecute(Sender: TObject);
    procedure cdsNaklrBeforeScroll(DataSet: TDataSet);
    procedure cdsNaklrCalcFields(DataSet: TDataSet);
    procedure cbxModeChange(Sender: TObject);
    procedure actDetailExecute(Sender: TObject);
    procedure dbgNaklrDblClick(Sender: TObject);
  private
    { Private declarations }
    FiSchetNedopost : integer;
    procedure ProcessMode;
  public
    { Public declarations }
    procedure Defaultopen;
    procedure ShowDetail (dat_from,dat_to : TDate;
      id_nakl :integer; nakl_info : string);
    procedure SetMode (iMode :integer);
  end;

var
  frmNaklpOstDet: TfrmNaklpOstDet;

implementation

uses AtsAssert, Naklpbux,untNaklp,
  SkladAux //OpenDocument
  ;

{$R *.dfm}

procedure TfrmNaklpOstDet.FormCreate(Sender: TObject);
begin
  dmdEx.OpenQuery(dmdex.cdsTovarAll);
  qeNaklr.DefSql := sdsNaklr.CommandText;
  FiSchetNedopost:=dmdex.GetOidObjects('ТИП СЧЕТА',-100);
  FiSchetNedopost:=dmdex.GetOidObjects('НЕСОБЛЮДЕНИЕ ПРИХОДОВ',FiSchetNedopost);  
end;

procedure TfrmNaklpOstDet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmdEx.CloseQuery(dmdex.cdsTovarAll,false);
    dmdEx.CloseQuery(dmdEx.cdsAllClient,false);
  dmdEx.CloseQuery(dmdEx.cdsManager,false);
  Action := caFree;
end;

procedure TfrmNaklpOstDet.actRefreshExecute(Sender: TObject);
begin
  dmdEx.StartWaiting;
  Defaultopen;
  dmdEx.stopwaiting;
end;

procedure TfrmNaklpOstDet.cdsNaklrBeforeScroll(DataSet: TDataSet);
begin
  ApplyOrCancel(DataSet);
end;


procedure TfrmNaklpOstDet.Defaultopen;
begin
  dmdex.startWaiting;
  qeNaklr.Refresh;
  qeNaklr.Query.Last;
  dmdEx.StopWaiting;
end;

procedure TfrmNaklpOstDet.ShowDetail(dat_from,dat_to : TDate;
  id_nakl: integer;nakl_info:string);
begin
  cdsNaklr.Close;
  cdsNaklr.Params.ParamByName('id_schet_nedopost').asInteger:= FiSchetNedopost;
  cdsNaklr.Params.ParamByName('dat_from').asDate := dat_from;
  cdsNaklr.Params.ParamByName('dat_to').asDate := dat_to;  
  cdsNaklr.Params.ParamByName('sub4_in').asInteger := id_nakl;
  self.Caption := self.Caption + ' ' + nakl_info;
  actRefresh.Execute;
  ProcessMode;
end;

procedure TfrmNaklpOstDet.cdsNaklrCalcFields(DataSet: TDataSet);
begin
  try
    if (DataSet.State=dsInternalCalc) then begin
      DataSet.FieldByName('Delta_cena').AsFloat :=
        RRoundTo(RRoundTo(DataSet.FieldByName('debet_cena').AsFloat,-2) -
        RRoundTo(DataSet.FieldByName('kredit_cena').AsFloat,-2),-2);
    end;
  except
  end;
end;

procedure TfrmNaklpOstDet.cbxModeChange(Sender: TObject);
begin
  ProcessMode;
end;

procedure TfrmNaklpOstDet.ProcessMode;
begin
  case cbxMode.ItemIndex of
    0: begin
      cdsNaklr.Filtered := false;
    end;
    1: begin
      cdsNaklr.Filter := '[DEBET_KOLOTP_AFTER]<>0 or [DIFF]<>0';
      cdsNaklr.Filtered := true;
    end;
    2: begin
      cdsNaklr.Filter := '[DIFF]<>0';
      cdsNaklr.Filtered := true;
    end;
    3: begin
      cdsNaklr.Filter := '[DEBET_KOLOTP_AFTER]<>0';
      cdsNaklr.Filtered := true;
    end;
  end;//case ItemIndex
end;

procedure TfrmNaklpOstDet.SetMode(iMode: integer);
begin
  cbxMode.ItemIndex := iMode;
end;

procedure TfrmNaklpOstDet.actDetailExecute(Sender: TObject);
var
  iTip : integer;
begin
  if dsNaklr.DataSet.Eof and dsNaklr.DataSet.Bof then begin
     exit;
  end;
  if dsNaklr.DataSet.FieldByName('sub4').IsNull then begin
    MessageDlg('Неизвестен номер приходной накладной',mtWarning,[mbOk],0);
    exit;
  end;
  if ((dbgNaklr.SelectedField.FieldName='DEBET_KOLOTP')
   or (dbgNaklr.SelectedField.FieldName='DEBET_CENA')
   or (dbgNaklr.SelectedField.FieldName='DEBET'))
  then begin
    OpenDocument(self,
      dsNaklr.DataSet.FieldByName('sub4').asInteger,
      0,
      0);
  end;
  if ((dbgNaklr.SelectedField.FieldName='KREDIT_KOLOTP')
   or (dbgNaklr.SelectedField.FieldName='KREDIT_CENA')
   or (dbgNaklr.SelectedField.FieldName='KREDIT'))
  then begin
    iTip := dmdEx.GetOidObjects('ТИП НАКЛАДНЫХ ДЛЯ СКЛАДА',-100);
    iTip := dmdEx.GetOidObjects('Приход',iTip);
    OpenDocument(self,
      dsNaklr.DataSet.FieldByName('sub4').asInteger,
      iTip,
      0,
      true);
  end;
end;

procedure TfrmNaklpOstDet.dbgNaklrDblClick(Sender: TObject);
begin
  actDetail.Execute;
end;

end.
