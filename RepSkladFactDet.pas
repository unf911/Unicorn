unit RepSkladFactDet;
{детализация остатков по себестоимости}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, Grids, DBGridEh, DB, SqlExpr, DBClient, Provider,
  untEx, StdCtrls, Buttons, ActnList, Registry, Mask, DBCtrlsEh,
  PropStorageEh, UnfFilter, PropFilerEh, GridsEh,
  untRound, //ColumnByName
  Menus, QueryExtender;

type
  TfrmRepSkladFactDet = class(TForm)
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
    qeDet: TQueryExtender;
    actShowSebestSumColumns: TAction;
    cdsSklostdetATTR1: TIntegerField;
    cdsSklostdetTIPCONST: TStringField;
    cdsSklostdetSUB3: TIntegerField;
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
    procedure actShowSebestSumColumnsExecute(Sender: TObject);
  private
    { Private declarations }
    function ShowDetailCommon(id_schet: integer;
      dat_from :TDate;
      dat_to : TDate;
      sub1_in ,
      sub2_in,
      sub3_in, sub4_in, sub5_in,
      sub6_in, sub7_in,  sub8_in,
      sub9_in, sub10_in  :variant):integer;
    procedure ProcessColumnsForDvigDenSredstv;
  public
    { Public declarations }
    function ShowDetail(id_schet: integer;
      dat_from :TDate;
      dat_to : TDate;
      sub1_in ,
      sub2_in,
      sub3_in, sub4_in, sub5_in,
      sub6_in, sub7_in,  sub8_in,
      sub9_in, sub10_in  :variant):integer;
    function ShowDetailForDvigDenSredstv(id_schet: integer;
      dat_from :TDate;
      dat_to : TDate;
      sub1_in ,
      sub2_in,
      sub3_in, sub4_in, sub5_in,
      sub6_in, sub7_in,  sub8_in,
      sub9_in, sub10_in  :variant):integer;
    function ShowDetailModal (id_ostt: integer): integer;
    procedure ProcessColumns;
  end;
  procedure ProcessPositRecount (dbgNaklot: TDBGridEh;param:variant;Object1:Pointer=nil );

var
  frmRepSkladFactDet: TfrmRepSkladFactDet;

implementation

uses //untNaklp, untNaklo
  SkladAUx //opendocument
;

{$R *.dfm}

function TfrmRepSkladFactDet.ShowDetailCommon(id_schet: integer;
  dat_from :TDate;
  dat_to : TDate;
  sub1_in ,
  sub2_in,
  sub3_in, sub4_in, sub5_in,
  sub6_in, sub7_in,  sub8_in,
  sub9_in, sub10_in  :variant):integer;
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
  cdsSklostdet.Open;
  dmdEx.StopWaiting;
  Result := 0;
end;

function TfrmRepSkladFactDet.ShowDetailForDvigDenSredstv(id_schet: integer;
  dat_from, dat_to: TDate; sub1_in, sub2_in, sub3_in, sub4_in, sub5_in,
  sub6_in, sub7_in, sub8_in, sub9_in, sub10_in: variant): integer;
begin
  Result:=ShowDetailCommon(id_schet,dat_from,dat_to,
    sub1_in,sub2_in,
    sub3_in, sub4_in, sub5_in,
    sub6_in, sub7_in,  sub8_in,
    sub9_in, sub10_in);
  ProcessColumnsForDvigDenSredstv;
  self.Caption := 'Детализация статьи: с ' +
    datetostr (dat_from) +
    ' до ' + datetostr(dat_to)+
    ' Статья: ' +
    vartostr(dmdEx.cdsStatyaDR.Lookup('id',sub2_in,'fullname'))+
    '.';
  ShowCopyForRoleOrUser(dbgSklostdet,'POWER_USER;BUXG','SYSDBA');    
end;

function TfrmRepSkladFactDet.ShowDetail(id_schet: integer;
  dat_from :TDate;
  dat_to : TDate;
  sub1_in ,
  sub2_in,
  sub3_in, sub4_in, sub5_in,
  sub6_in, sub7_in,  sub8_in,
  sub9_in, sub10_in  :variant):integer;
begin
  Result:=ShowDetailCommon(id_schet,dat_from,dat_to,
    sub1_in,sub2_in,
    sub3_in, sub4_in, sub5_in,
    sub6_in, sub7_in,  sub8_in,
    sub9_in, sub10_in);
  self.Caption := 'Детализация себестоимости: с ' +
    datetostr (dat_from) +
    ' до ' + datetostr(dat_to)+
    ' Товар: ' +
    varastype(dmdEx.cdsTovarAll.Lookup('id',sub1_in,'name'),varString)+
    '.';
end;

procedure TfrmRepSkladFactDet.actExitExecute(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmRepSkladFactDet.FormCreate(Sender: TObject);
begin
  dmdEx.StartWaiting;
  dmdEx.OpenQuery(dmdEx.cdsAllClient);
  dmdEx.OpenQuery(dmdEx.cdsManager);
  dmdEx.OpenQuery(dmdEx.cdsTovarAll);
  dmdEx.StopWaiting;
end;

procedure TfrmRepSkladFactDet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmdEx.CloseQuery(dmdEx.cdsAllClient,false);
  dmdEx.CloseQuery(dmdEx.cdsManager,false);
  dmdEx.CloseQuery(dmdEx.cdsTovarAll,false);  
  Action := caFree;
end;

procedure TfrmRepSkladFactDet.actDetailExecute(Sender: TObject);
begin
  OpenDocument(
    self,
    cdsSklostdet.FieldByName('id_nakl').asInteger,
    cdsSklostdet.FieldByName('tip').asInteger,
    cdsSklostdet.FieldByName('attr1').asInteger);
end;

function TfrmRepSkladFactDet.ShowDetailModal(id_ostt: integer): integer;
begin
  Result :=mrOk;
end;

procedure TfrmRepSkladFactDet.dbgSklostdetDblClick(Sender: TObject);
begin
  actDetail.Execute;
end;

procedure TfrmRepSkladFactDet.dbgSklostdetKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case key of 
    vk_return : begin
      actDetail.Execute;
    end;
  end;//case
end; 

procedure TfrmRepSkladFactDet.actRefreshExecute(Sender: TObject);
begin
  qeDet.Refresh;
end;

procedure TfrmRepSkladFactDet.actSebestBuxRecountExecute(Sender: TObject);
begin
  if cdsSklostdet.eof and cdsSklostdet.bof then begin
    MessageDlg('Не указана позиция для пересчёта',mtWarning,[mbOk],0);
    exit;
  end;
  if dsSklostdet.DataSet.FieldByName('sub3').IsNull then begin
    MessageDlg('Не указана позиция для пересчёта',mtWarning,[mbOk],0);
    exit;
  end;
  dmdEx.StartWaiting;
  dmdEx.ColumnSelectAndProcess(dbgSklostdet,Null,ProcessPositRecount,sdsSebestRecount);
  actRefresh.Execute;
  dmdex.StopWaiting;
end;

procedure ProcessPositRecount (dbgNaklot: TDBGridEh;param:variant;Object1:Pointer=nil );
var
  DataSet : TClientDataSet;
  sdsSebestRecount : TSQLDataSet;
begin
  sdsSebestRecount := TSQLDataSet(Object1);
  DataSet := TClientDataSet(dbgNaklot.DataSource.DataSet);
  sdsSebestRecount.ParamByName('id_nakl').asInteger:=
    DataSet.FieldByName('attr1').asInteger;
  sdsSebestRecount.ParamByName('id_sklad').asInteger:=
    DataSet.Params.ParamValues['sub2_in'];
  sdsSebestRecount.ParamByName('ID_PARTIYA_IN').asInteger:=
    DataSet.FieldByName('sub3').asInteger;
  sdsSebestRecount.ParamByName('tip').AsInteger :=
    DataSet.FieldByName('tip').asInteger;
  sdsSebestRecount.ParamByName('mode').AsInteger := 6;
  dmdEx.ExecSQL(sdsSebestRecount);
end;

procedure TfrmRepSkladFactDet.cdsSklostdetCalcFields(DataSet: TDataSet);
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

procedure TfrmRepSkladFactDet.actDebugExecute(Sender: TObject);
begin
  actDebug.Checked := not actDebug.Checked;
  if actDebug.Checked then begin
    //показать колонки с номерами складов и товаров
    ColumnByName(dbgSklostdet.Columns,'ID_NAKL').visible := true;
    ColumnByName(dbgSklostdet.Columns,'TIP').visible := true;
    ColumnByName(dbgSklostdet.Columns,'ATTR1').visible := true;
  end else begin //if actDebug checked
    ColumnByName(dbgSklostdet.Columns,'ID_NAKL').visible := false;
    ColumnByName(dbgSklostdet.Columns,'TIP').visible := false;
    ColumnByName(dbgSklostdet.Columns,'ATTR1').visible := false;
  end;  //if actDebug checked
end;

procedure TfrmRepSkladFactDet.actShowSebestSumColumnsExecute(Sender: TObject);
begin
  actShowSebestSumColumns.Checked:= not actShowSebestSumColumns.Checked;
  ProcessColumns;
end;

procedure TfrmRepSkladFactDet.ProcessColumns;
begin
  if actShowSebestSumColumns.Checked then begin
    ColumnByName(dbgSklostdet.Columns,'CENA').visible := true;
    ColumnByName(dbgSklostdet.Columns,'KREDIT').visible := true;
    ColumnByName(dbgSklostdet.Columns,'DEBET').visible := true;
  end else begin
    ColumnByName(dbgSklostdet.Columns,'CENA').visible := false;
    ColumnByName(dbgSklostdet.Columns,'DEBET').visible := false;
    ColumnByName(dbgSklostdet.Columns,'KREDIT').visible := false;
  end;
end;

procedure TfrmRepSkladFactDet.ProcessColumnsForDvigDenSredstv;
begin
  ColumnByName(dbgSklostdet.Columns,'CENA').visible := false;
  ColumnByName(dbgSklostdet.Columns,'DEBET_KOLOTP').visible := false;
  ColumnByName(dbgSklostdet.Columns,'KREDIT_KOLOTP').visible := false;
  dmdEx.OpenQuery(dmdEx.cdsStatyaDR);
end;



end.
