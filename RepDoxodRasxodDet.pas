unit RepDoxodRasxodDet;
{детализаци€ остатков по себестоимости}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, Grids, DBGridEh, DB, SqlExpr, DBClient, Provider,
  untEx, StdCtrls, Buttons, ActnList, Registry, Mask, DBCtrlsEh,
  PropStorageEh, UnfFilter, PropFilerEh, GridsEh,
  untRound, //ColumnByName
  Menus, QueryExtender;

type
  TfrmRepDoxodRasxodDet = class(TForm)
    dspSklostdet: TDataSetProvider;
    cdsSklostdet: TClientDataSet;
    sdsSklostdet: TSQLDataSet;
    dsSklostdet: TDataSource;
    dbgSklostdet: TDBGridEh;
    btnOk: TBitBtn;
    ActionList1: TActionList;
    actDetail: TAction;
    RegPropStorageManEh1: TRegPropStorageManEh;
    PropStorageEh1: TPropStorageEh;
    actRefresh: TAction;
    UnfFilter1: TUnfFilter;
    GroupBox1: TGroupBox;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    mnuRefresh: TMenuItem;
    PopupMenu1: TPopupMenu;
    N4: TMenuItem;
    actDebug: TAction;
    N6: TMenuItem;
    qeDet: TQueryExtender;
    cdsSklostdetDAT: TSQLTimeStampField;
    cdsSklostdetID_NAKL: TIntegerField;
    cdsSklostdetID: TStringField;
    cdsSklostdetIZG: TStringField;
    cdsSklostdetZAK: TStringField;
    cdsSklostdetMANAGER: TStringField;
    cdsSklostdetDEBET: TFloatField;
    cdsSklostdetKREDIT: TFloatField;
    cdsSklostdetID_IZG: TIntegerField;
    cdsSklostdetID_ZAK: TIntegerField;
    cdsSklostdetID_MANAGER: TIntegerField;
    cdsSklostdetTIP: TSmallintField;
    cdsSklostdetCENA: TFloatField;
    cdsSklostdetTIPCONST: TStringField;
    cdsSklostdetKURS: TFloatField;
    cdsSklostdetKURS_INDIRECT: TIntegerField;
    cdsSklostdetSUM_FINAL: TFloatField;
    actExit: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actDetailExecute(Sender: TObject);
    procedure dbgSklostdetDblClick(Sender: TObject);
    procedure dbgSklostdetKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actRefreshExecute(Sender: TObject);
    procedure actDebugExecute(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
  private
    { Private declarations }
    function ShowDetailCommon(
        dat_from, dat_to: TDate;
        id_currency_to, sub1_in, sub2_in, sub3_in, sub4_in: variant):integer;
  public
    { Public declarations }
    function ShowDetail(
        dat_from, dat_to: TDate;
        id_currency_to, sub1_in, sub2_in, sub3_in, sub4_in: variant): integer;
  end;
var
  frmRepDoxodRasxodDet: TfrmRepDoxodRasxodDet;

implementation

uses //untNaklp, untNaklo
  SkladAUx //opendocument
;

{$R *.dfm}

function TfrmRepDoxodRasxodDet.ShowDetailCommon(
  dat_from: TDate;
  dat_to: TDate;
  id_currency_to,
  sub1_in,
  sub2_in,
  sub3_in,
  sub4_in: variant):integer;
begin
  dmdEx.StartWaiting;
  cdsSklostdet.Close;
  cdsSklostdet.Params.ParamValues['dat_to']:=dat_to;
  cdsSklostdet.Params.ParamValues['dat_from']:=dat_from;
  cdsSklostdet.Params.ParamValues['id_currency_to']:=id_currency_to;
  cdsSklostdet.Params.ParamValues['sub1_in']:=sub1_in;
  cdsSklostdet.Params.ParamValues['sub2_in']:=sub2_in;
  cdsSklostdet.Params.ParamValues['sub3_in']:=sub3_in;
  cdsSklostdet.Params.ParamValues['sub4_in']:=sub4_in;
  cdsSklostdet.Open;
  dmdEx.StopWaiting;
  Result := 0;
end;

function TfrmRepDoxodRasxodDet.ShowDetail(
  dat_from, dat_to: TDate; id_currency_to, sub1_in, sub2_in, sub3_in, sub4_in: variant): integer;
begin
  Result:=ShowDetailCommon(dat_from,dat_to,
    id_currency_to,
    sub1_in,sub2_in,
    sub3_in, sub4_in);
  dmdEx.OpenQuery(dmdEx.cdsStatyaDR);
  self.Caption := 'ƒетализаци€ статьи: с ' +
    datetostr (dat_from) +
    ' до ' + datetostr(dat_to)+
    ' —тать€: ' +
    vartostr(dmdEx.cdsStatyaDR.Lookup('id',sub2_in,'fullname'))+
    '.';
end;

procedure TfrmRepDoxodRasxodDet.FormCreate(Sender: TObject);
begin
  dmdEx.StartWaiting;
  dmdEx.OpenQuery(dmdEx.cdsAllClient);
  dmdEx.OpenQuery(dmdEx.cdsManager);
  dmdEx.OpenQuery(dmdEx.cdsTovarAll);
  dmdEx.StopWaiting;
end;

procedure TfrmRepDoxodRasxodDet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmdEx.CloseQuery(dmdEx.cdsAllClient,false);
  dmdEx.CloseQuery(dmdEx.cdsManager,false);
  dmdEx.CloseQuery(dmdEx.cdsTovarAll,false);  
  Action := caFree;
end;

procedure TfrmRepDoxodRasxodDet.actDetailExecute(Sender: TObject);
begin
  OpenDocument(
    self,
    cdsSklostdet.FieldByName('id_nakl').asInteger,
    cdsSklostdet.FieldByName('tip').asInteger,
    0);
end;

procedure TfrmRepDoxodRasxodDet.dbgSklostdetDblClick(Sender: TObject);
begin
  actDetail.Execute;
end;

procedure TfrmRepDoxodRasxodDet.dbgSklostdetKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case key of 
    vk_return : begin
      actDetail.Execute;
    end;
  end;//case
end; 

procedure TfrmRepDoxodRasxodDet.actRefreshExecute(Sender: TObject);
begin
  qeDet.Refresh;
end;

procedure TfrmRepDoxodRasxodDet.actDebugExecute(Sender: TObject);
begin
  actDebug.Checked := not actDebug.Checked;
  if actDebug.Checked then begin
    //показать колонки с номерами складов и товаров
    ColumnByName(dbgSklostdet.Columns,'ID_NAKL').visible := true;
    ColumnByName(dbgSklostdet.Columns,'TIP').visible := true;
  end else begin //if actDebug checked
    ColumnByName(dbgSklostdet.Columns,'ID_NAKL').visible := false;
    ColumnByName(dbgSklostdet.Columns,'TIP').visible := false;
  end;  //if actDebug checked
end;


procedure TfrmRepDoxodRasxodDet.actExitExecute(Sender: TObject);
begin
  self.Close;
end;

end.
