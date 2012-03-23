unit RepSkladBuxDet;
{детализация остатков по себестоимости}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, Grids, DBGridEh, DB, SqlExpr, DBClient, Provider,
  untEx, StdCtrls, Buttons, ActnList, Registry, Mask, DBCtrlsEh,
  PropStorageEh, UnfFilter, PropFilerEh, GridsEh,

  untRound, //ColumnByName
  Menus;

type
  TfrmRepSkladBuxDet = class(TForm)
    dspSklostdet: TDataSetProvider;
    cdsSklostdet: TClientDataSet;
    sdsSklostdet: TSQLDataSet;
    dsSklostdet: TDataSource;
    dbgSklostdet: TDBGridEh;
    btnOk: TBitBtn;
    ActionList1: TActionList;
    actExit: TAction;
    actDetail: TAction;
    RegPropStorageManEh1: TRegPropStorageManEh;
    PropStorageEh1: TPropStorageEh;
    actRefresh: TAction;
    UnfFilter1: TUnfFilter;
    cdsSklostdetDAT: TSQLTimeStampField;
    cdsSklostdetID_NAKL: TIntegerField;
    cdsSklostdetDEBET: TFloatField;
    cdsSklostdetKREDIT: TFloatField;
    cdsSklostdetDEBET_KOLOTP: TFloatField;
    cdsSklostdetKREDIT_KOLOTP: TFloatField;
    cdsSklostdetID_IZG: TIntegerField;
    cdsSklostdetID_ZAK: TIntegerField;
    cdsSklostdetID_MANAGER: TIntegerField;
    cdsSklostdetNDS: TFMTBCDField;
    cdsSklostdetID: TStringField;
    cdsSklostdetIZG: TStringField;
    cdsSklostdetZAK: TStringField;
    cdsSklostdetMANAGER: TStringField;
    cdsSklostdetTIP: TSmallintField;
    GroupBox1: TGroupBox;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    mnuRefresh: TMenuItem;
    N2: TMenuItem;
    actSebestBuxRecount: TAction;
    PopupMenu1: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    sdsSebestRecount: TSQLDataSet;
    cdsSklostdetCENA: TFloatField;
    actDebug: TAction;
    N6: TMenuItem;
    cdsSklostdetID_NAKLD: TIntegerField;
    cdsSklostdetTIP_NAME: TStringField;
    procedure actExitExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actDetailExecute(Sender: TObject);
    procedure dbgSklostdetDblClick(Sender: TObject);
    procedure dbgSklostdetKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actRefreshExecute(Sender: TObject);
    procedure actSebestBuxRecountExecute(Sender: TObject);
    procedure cdsSklostdetCalcFields(DataSet: TDataSet);
    procedure actDebugExecute(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    function ShowDetail(id_schet: integer;
      dat_from :TDate;
      dat_to : TDate;
      sub1_in ,
      sub2_in,
      sub3_in, sub4_in, sub5_in,
      sub6_in, sub7_in,  sub8_in,
      sub9_in, sub10_in,
      id_nakl,
      attr1,
      attr2:variant):integer;
  end;

var
  frmRepSkladBuxDet: TfrmRepSkladBuxDet;

implementation

uses NaklpBux, //Naklr,
  SqlTimSt,//datetosqltimestamp
  SkladAux ;

{$R *.dfm}

function TfrmRepSkladBuxDet.ShowDetail(id_schet: integer;
  dat_from :TDate;
  dat_to : TDate;
  sub1_in ,
  sub2_in,
  sub3_in, sub4_in, sub5_in,
  sub6_in, sub7_in,  sub8_in,
  sub9_in, sub10_in ,
  id_nakl,
  attr1,
  attr2:variant):integer;
begin
  dmdEx.StartWaiting;
  cdsSklostdet.Close;
  cdsSklostdet.Params.ParamByName('id_schet').asInteger := id_schet;
  cdsSklostdet.Params.ParamValues['dat_to']:=dat_to;
  cdsSklostdet.Params.ParamValues['dat_from']:=dat_from;
  cdsSklostdet.Params.ParamValues['sub1_in']:=sub1_in;
  cdsSklostdet.Params.ParamValues['sub2_in']:=sub2_in;
  cdsSklostdet.Params.ParamValues['sub3_in']:=sub3_in;
  cdsSklostdet.Params.ParamValues['sub4_in']:=sub4_in;
  cdsSklostdet.Params.ParamValues['sub5_in']:=sub5_in;
  cdsSklostdet.Open;
  self.Caption := 'Детализация себестоимости (бух): с ' +
    datetostr (dat_from) +
    ' до ' + datetostr(dat_to)+
    ' Товар: ' +
    varastype(dmdEx.cdsTovarAll.Lookup('id',sub1_in,'name'),varString)+
    '.';
  dmdEx.StopWaiting;
  Result := 0;
end;

procedure TfrmRepSkladBuxDet.actExitExecute(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmRepSkladBuxDet.FormCreate(Sender: TObject);
begin
  dmdEx.StartWaiting;
  dmdEx.OpenQuery(dmdEx.cdsAllClient);
  dmdEx.OpenQuery(dmdEx.cdsManager);
  dmdEx.OpenQuery(dmdEx.cdsTovarAll);
  dmdEx.StopWaiting;
end;

procedure TfrmRepSkladBuxDet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmdEx.CloseQuery(dmdEx.cdsAllClient,false);
  dmdEx.CloseQuery(dmdEx.cdsManager,false);
  dmdEx.CloseQuery(dmdEx.cdsTovarAll,false);  
  Action := caFree;
end;

procedure TfrmRepSkladBuxDet.actDetailExecute(Sender: TObject);
{var

  frmNaklpbux : TfrmNaklpBux;
  frmNaklr : TfrmNaklr;
  varCurrency : variant;
  varDate : variant;
  FiNaklpBux : integer;
  FiNaklr : integer;
  FiNaklPerem : integer;  }
begin
  OpenDocument(self,
    cdsSklostdet.FieldByName('id_nakl').asInteger,
    cdsSklostdet.FieldByName('tip').asInteger,
    cdsSklostdet.FieldByName('id_nakld').asInteger);
end;

procedure TfrmRepSkladBuxDet.dbgSklostdetDblClick(Sender: TObject);
begin
  actDetail.Execute;
end;

procedure TfrmRepSkladBuxDet.dbgSklostdetKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case key of 
    vk_return : begin
      actDetail.Execute;
    end;
  end;//case
end; 

procedure TfrmRepSkladBuxDet.actRefreshExecute(Sender: TObject);
begin
  cdsSklostdet.Refresh;
end;

procedure TfrmRepSkladBuxDet.actSebestBuxRecountExecute(Sender: TObject);
begin
  //Перепроводка расходной только по счёту "себестоимость бух"
  if cdsSklostdet.eof and cdsSklostdet.bof then begin
    MessageDlg('Нет накладной для изменения',mtWarning,[mbOk],0);
    exit;
  end;
  dmdEx.StartWaiting;
  sdsSebestRecount.ParamByName('id_nakl_in').asInteger:=
    cdsSklostdet.FieldByName('id_nakl').asInteger;
  sdsSebestRecount.ParamByName('id_nakld_in').asInteger:=
    cdsSklostdet.FieldByName('id_nakld').asInteger;
  sdsSebestRecount.ParamByName('mode_in').asInteger := 4;
  sdsSebestRecount.ParamByName('id_schet_in').asInteger  :=
    cdsSklostDet.Params.ParamValues['id_schet'];
  sdsSebestRecount.ParamByName('id_sklad_in').asInteger  :=
    cdsSklostdet.Params.ParamValues['sub2_in'];
  sdsSebestRecount.ParamByName('tip_in').asInteger  :=
    cdsSklostdet.FieldByName('tip').asInteger;
  sdsSebestRecount.ParamByName('dat_from_in').AsSQLTimeStamp:=
     DateTimeToSQLTimeStamp(
            cdsSklostdet.Params.ParamValues['dat_from']);

  dmdEx.ExecSQL(sdsSebestRecount);
  actRefresh.Execute;
  dmdex.StopWaiting;
end;

procedure TfrmRepSkladBuxDet.cdsSklostdetCalcFields(DataSet: TDataSet);
begin
  //если был остаток, то считается цена остатка, иначе считается цена прихода
  if DataSet.State = dsInternalCalc then begin
    if DataSet.FieldByName('kredit_kolotp').AsFloat=0 then begin
      if DataSet.FieldByName('debet_kolotp').AsFloat=0 then begin
        DataSet.FieldByName('cena').Clear;
      end else begin
        DataSet.FieldByName('cena').AsFloat :=
        DataSet.FieldByName('debet').AsFloat
        /DataSet.FieldByName('debet_kolotp').AsFloat;
      end   //if DataSet.FieldByName('debet_kolotp').AsFloat=0
    end else begin  //  if DataSet.FieldByName('kolotp_before').AsFloat=0
      DataSet.FieldByName('cena').AsFloat :=
        DataSet.FieldByName('kredit').AsFloat
        /DataSet.FieldByName('kredit_kolotp').AsFloat;
    end;  //  if DataSet.FieldByName('kolotp_before').AsFloat=0
  end; //if DataSet.State = dsInternalCalc
end;

procedure TfrmRepSkladBuxDet.actDebugExecute(Sender: TObject);
begin
  actDebug.Checked := not actDebug.Checked;
  if actDebug.Checked then begin
    //показать колонки с номерами складов и товаров
    ColumnByName(dbgSklostdet.Columns,'ID_NAKL').visible := true;
    ColumnByName(dbgSklostdet.Columns,'ID_NAKLD').visible := true;
    ColumnByName(dbgSklostdet.Columns,'TIP').visible := true;
  end else begin //if actDebug checked
    ColumnByName(dbgSklostdet.Columns,'ID_NAKL').visible := false;
    ColumnByName(dbgSklostdet.Columns,'ID_NAKLD').visible := false;
    ColumnByName(dbgSklostdet.Columns,'TIP').visible := false;
  end;  //if actDebug checked
end;

end.
