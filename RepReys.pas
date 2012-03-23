unit RepReys;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RepDolgBuxPost, SettingsPlugin, untEx, untSettings, FMTBcd, DB,
  SqlExpr, ActnList, Menus, DbGridEh, DBClient, Provider,
  atsAssert //AssertInternal
  ;

type
  TFormReportClass = class of TfrmRepDolgBuxPost;

  TfrmRepReys = class(TfrmRepDolgBuxPost)
    ActionList2: TActionList;
    sdsDolgBux2: TSQLDataSet;
    dspDolgBux2: TDataSetProvider;
    cdsDolgBux2: TClientDataSet;
    cdsDolgBux2DAT_REYS: TSQLTimeStampField;
    cdsDolgBux2NOMER_AVTO: TStringField;
    cdsDolgBux2PEREVOZCHIK: TStringField;
    cdsDolgBux2PUNKT_ZAGRUZKI: TStringField;
    cdsDolgBux2PUNKT_VYGRUZKI: TStringField;
    cdsDolgBux2CENA_REYSA: TFloatField;
    cdsDolgBux2SUM_NAKLR: TFloatField;
    cdsDolgBux2PERCENT: TFloatField;
    cdsDolgBux2FIO_VODITELYA: TStringField;
    cdsDolgBux2NOMER_PRITSEPA: TStringField;
    cdsDolgBux2POKUPATEL_PLATIT: TSmallintField;
    cdsDolgBux2DELMARKED: TSmallintField;
    cdsDolgBux2ID_REYS: TIntegerField;
    actDetailReys: TAction;
    cdsDolgBux2COMMENT: TStringField;

    procedure FormCreate(Sender: TObject);
    procedure actDetailReysExecute(Sender: TObject);

  private
    { Private declarations }
    procedure SetDatasets;
    procedure TestDetail;
  protected
    procedure FillSettings;
    procedure Refresh; override;

    procedure ProcessSettings;override;
    procedure ShowDetail;override;
    procedure UpdateCaption;
    procedure Debug;override;
    procedure ProcessColumns(DataSet:TDataSet);
  public
    procedure  DefaultStartup; override;
    function Defaultopen: boolean;
    procedure Test;

  {  function Defaultopen:boolean;}

    { Public declarations }
  end;

var
  frmRepReys: TfrmRepReys;

implementation

uses 
  SkladAux, //OpenDocument
  DateUtils, // Today, StartOfTheMonth
  untRound, //InIde
  ReysSpr, //TfrmReysSpr
  Naklr2, //TfrmNaklr2
  RepReysDet //TfrmRepReysDet
;

{$R *.dfm}

procedure TfrmRepReys.FormCreate(Sender: TObject);
begin
  SetDatasets;
  FillSettings;
end;

procedure TfrmRepReys.FillSettings;
begin
  setT := TfrmSettings.Create(self);
  setT.actManagerOff.Execute;
  FillCopy(DBGridEh1);
  PropStorageEh1.section := 'TfrmRepReys';

  AddMenuItem(DbGridEh1.PopupMenu, actDetail);
  AddMenuItem(DbGridEh1.PopupMenu, actDetailReys);
  AddMenuItem(DbGridEh1.PopupMenu, actDebug);

  AddMenuItemToMenuItem(mnuAction, actDetail);
  AddMenuItemToMenuItem(mnuAction, actDetailReys);

end;

procedure TfrmRepReys.Refresh;
begin
  dmdEx.startWaiting;
  if dsDolgBux.DataSet.active then begin
    if not actDebug.Checked then begin
      PropStorageEh1.SaveProperties;
    end;
  end;
  if cdsDolgBux2.active then begin
    cdsDolgBux2.cancelupdates;
  end;
  qeDolgBux.Refresh;
  ProcessColumns(cdsDolgBux2);
  PropStorageEh1.LoadProperties;   
  dmdEx.stopWaiting;
end;

procedure TfrmRepReys.ShowDetail;
begin
  frmRepReysDet := TfrmRepReysDet.Create(self);
  frmRepReysDet.ShowRepReysDet(dsDolgBux.DataSet.FieldByName('id_reys').AsInteger);
end;

procedure TfrmRepReys.DefaultStartup;
begin
  setT.SetPeriod(2);
end;  

procedure TfrmRepReys.UpdateCaption;
begin
  self.Caption := 'Отчёт транспортный: c ' +
    datetostr (setT.DateFrom) +
    ' до ' + datetostr(setT.dateTo);
end;

procedure TfrmRepReys.Debug;
begin
  actDebug.Checked := not actDebug.Checked;
  if actDebug.Checked then begin
    MakeFieldVisible(dsDolgBux.DataSet, 'id_reys', true);
    MakeFieldLast(dsDolgBux.DataSet,'id_reys');
    MakeFieldVisible(dsDolgBux.DataSet, 'delmarked', true);
    MakeFieldLast(dsDolgBux.DataSet,'delmarked');
  end else begin
    MakeFieldVisible(dsDolgBux.DataSet, 'id_reys', false);
    MakeFieldVisible(dsDolgBux.DataSet, 'delmarked', false);
  end;
end;

procedure TfrmRepReys.SetDatasets;
begin
  qeDolgBux.Query := cdsDolgBux2;
  qeDolgBux.DefSql := sdsDolgBux2.CommandText;
  qeDolgBux.KeyField := 'id_reys';
  dsDolgBux.DataSet := cdsDolgBux2;
end;

procedure TfrmRepReys.ProcessSettings;
begin
  TClientDataSet(qeDolgBux.Query).Params.ParamByName('dat_to').AsDate := setT.DateTo;
  TClientDataSet(qeDolgBux.Query).params.ParamByName('dat_from').AsDate := setT.DateFrom;

  UpdateCaption;
end;


function TfrmRepReys.Defaultopen: boolean;
begin
  ProcessSettings;
  Refresh;
  ProcessColumns(cdsDolgBux2);
  Result :=true;
end;



procedure TfrmRepReys.ProcessColumns(DataSet: TDataSet);
begin
  ColumnByName(DBGridEh1.Columns,'CENA_REYSA').Footer.ValueType:=fvtSum;
  ColumnByName(DBGridEh1.Columns,'SUM_NAKLR').Footer.ValueType:=fvtSum;

  ColumnByName(DBGridEh1.Columns,'POKUPATEL_PLATIT').KeyList.Clear;
  ColumnByName(DBGridEh1.Columns,'POKUPATEL_PLATIT').KeyList.Add('1');
  ColumnByName(DBGridEh1.Columns,'POKUPATEL_PLATIT').KeyList.Add('0');
  ColumnByName(DBGridEh1.Columns,'POKUPATEL_PLATIT').CheckBoxes := true;
end;

procedure TfrmRepReys.actDetailReysExecute(Sender: TObject);
var
  frmReysSpr : TfrmReysSpr;
begin
  frmReysSpr := TfrmReysSpr.Create(self);
  frmReysSpr.ShowReys(dsDolgBux.DataSet.FieldByName('id_reys').AsInteger);
end;

procedure TfrmRepReys.Test;
begin
try
  DefaultStartup;
  DefaultOpen;
  TestDetail;
except
  AssertInternal('594412F2-D8E3-4AB6-B0D0-38B24362B6CA');
end;
end;


procedure TfrmRepReys.TestDetail;
begin
  frmRepReysDet := TfrmRepReysDet.Create(self);
  frmRepReysDet.Test;
end;

end.
