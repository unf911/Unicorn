unit RepClientLastContact;

interface

uses
  Windows, Messages, SysUtils,
  Variants, Classes,
  Graphics, Controls, Forms,
  Dialogs,
  FMTBcd, DBClient, Provider, SqlExpr, DBGridEh, PropFilerEh, Menus,
  PropStorageEh, UnfFilter, QueryExtender, DB,   
  ActnList, StdCtrls, Buttons, GridsEh, frxClass, frxDBSet, 
 DBTables, Grids,
  DBGrids,
  ComCtrls,
  untEx,
  DateUtils,
  ATSAssert,
  untSkladRasxDetEx,
  DBCtrls,
  untSettings,
  StrUtils, //AnsiStartsStr
  SettingsPlugin //TfmSettingsPlugin
  ;

type
  TfrmRepClientLastContact = class(TForm)
    dsRasx: TDataSource;
    ActionList1: TActionList;
    actRefresh: TAction;
    actDetail: TAction;
    MainMenu1: TMainMenu;
    mnuActions: TMenuItem;
    N1: TMenuItem;
    N3: TMenuItem;
    dbhRasx: TDBGridEh;
    sdsRasx: TSQLDataSet;
    dspRasx: TDataSetProvider;
    cdsRasx: TClientDataSet;
    qeRasx: TQueryExtender;
    N2: TMenuItem;
    UnfFilter1: TUnfFilter;
    actSettings: TAction;
    PropStorageEh1: TPropStorageEh;
    rpsSkladRasxDetEx: TRegPropStorageManEh;
    N4: TMenuItem;
    PopupMenu1: TPopupMenu;
    N5: TMenuItem;
    GroupBox1: TGroupBox;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn4: TBitBtn;
    cdsRasxDAT: TSQLTimeStampField;
    cdsRasxTIP: TIntegerField;
    cdsRasxID_NAKL: TIntegerField;
    cdsRasxID_KLIENT: TIntegerField;
    cdsRasxNAME: TStringField;
    cdsRasxID_MANAGER: TIntegerField;
    cdsRasxMANAGER: TStringField;
    actDebug: TAction;
    N6: TMenuItem;
    cdsRasxYUR_ADRES: TStringField;
    cdsRasxFIZ_ADRES: TStringField;
    cdsRasxTEL: TStringField;
    cdsRasxFAX: TStringField;
    cdsRasxKONTACT_LICO: TStringField;
    cdsRasxDIRECTOR: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure actDetailExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure actSettingsExecute(Sender: TObject);
    procedure dbhRasxDblClick(Sender: TObject);
    procedure dbhRasxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actDebugExecute(Sender: TObject);
  private
    { Private declarations }
    setT : TfrmSettings;
    SettingsManager : TfmSettingsPlugin;
    //готовимся к выбору склада
    procedure FillSettings;
    procedure ProcessSettings(ProcessOnlySecurityMeasures:boolean=false);
    //ставим условия в зависимости от выбора менеджера

    procedure UpdateCaption;
  public
    { Public declarations }
    function DefaultOpen:boolean;
    procedure DefaultStartup;

  end;

var
  frmRepClientLastContact: TfrmRepClientLastContact;

implementation

{$R *.dfm}
uses

  SkladAux, //OpenDocument
  untRound //ColumnByName

  ;

procedure TfrmRepClientLastContact.ProcessSettings(ProcessOnlySecurityMeasures:boolean=false);
begin
try
  dmdEx.SetIntegerParamValue(
    cdsRasx.Params.ParamByName('id_manager'),
    setT.GetPluginResult('fmSettingsManager'));
  if not ProcessOnlySecurityMeasures then begin
    UpdateCaption;
  end;
except
  AssertInternal('BE1D6170-4CE0-4DDA-8F28-0138104401F');
end;
end;

procedure TfrmRepClientLastContact.FormCreate(Sender: TObject);
begin
	dmdEx.startwaiting;
	//чтобы не было ошибки при processmanager
	dmdEx.cdsManager.Open;
	//просто для удобства
	cdsRasx.CommandText:=sdsRasx.CommandText;
	qeRasx.DefSql := sdsRasx.CommandText;
	//заполняем
  FillSettings;


  //ProcessReportDesigner(ActionList1,MainMenu1,frRasx);
  dmdEx.StopWaiting;
end;


procedure TfrmRepClientLastContact.UpdateCaption;
begin
  self.Caption := 'Отчёт по данным о клиентах.'+
    ' Менеджер: '+
    setT.GetPluginTextResult('fmSettingsManager')+'.';
end;

procedure TfrmRepClientLastContact.actRefreshExecute(Sender: TObject);
begin
try
	dmdEx.StartWaiting;
	qeRasx.Refresh;
	dmdEx.StopWaiting;
except
  AssertInternal('F3A22332-430F-45DC-ACD2-6104CD6D5D46');
end;
end;

procedure TfrmRepClientLastContact.actDetailExecute(Sender: TObject);
begin
  if dsRasx.DataSet.Eof and dsRasx.DataSet.Bof then begin
     exit;
  end;
  OpenDocument(self,
    dsRasx.DataSet.FieldByName('id_nakl').asInteger,
    0,
    0);
end;

procedure TfrmRepClientLastContact.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;



procedure TfrmRepClientLastContact.FillSettings;
begin
  setT := TfrmSettings.Create(self);
  setT.actManagerOff.execute;
  setT.actDataOff.execute;
  SettingsManager := setT.CreatePlugin('TfmSettingsManager');
  //integer or null  from list
  SettingsManager.SetResultType(3);
  setT.AddPlugin(SettingsManager);
end;

procedure TfrmRepClientLastContact.FormDestroy(Sender: TObject);
begin
  setT.Free;
end;

procedure TfrmRepClientLastContact.actSettingsExecute(Sender: TObject);
begin
  actSettings.Checked := false;
  if setT.ChangeSettings=mrOk then begin
    actSettings.Checked :=true;
    ProcessSettings;
    Defaultopen;
  end;

 // actSettings.checked := setT.ProcessSettingsChange(actRefresh);
end;

procedure TfrmRepClientLastContact.dbhRasxDblClick(Sender: TObject);
begin
  actDetail.Execute;
end;

procedure TfrmRepClientLastContact.dbhRasxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return : begin
      actDetail.Execute;
    end;
  end;//case
end;

function TfrmRepClientLastContact.DefaultOpen:boolean;
begin
	actRefresh.Execute;
  Result :=true;
  if not cdsRasx.active then begin
    Result :=false;
  end;
end;

procedure TfrmRepClientLastContact.DefaultStartup;
begin
  SettingsManager.SetKeyValue(dmdEx.GetIdManager);
end;



procedure TfrmRepClientLastContact.actDebugExecute(Sender: TObject);
begin
  actDebug.Checked := not actDebug.Checked;
  if actDebug.Checked then begin
    {
    cdsRasx.FieldByName('ID_NAKL').Visible := true;
    cdsRasx.FieldByName('TIP').Visible := true;
    cdsRasx.FieldByName('ID_KLIENT').Visible := true;
    cdsRasx.FieldByName('ID_MANAGER').Visible := true;
   }
    ColumnByName(dbhRasx.Columns,'ID_NAKL').Visible := true;
    ColumnByName(dbhRasx.Columns,'TIP').Visible := true;
    ColumnByName(dbhRasx.Columns,'ID_KLIENT').Visible := true;
    ColumnByName(dbhRasx.Columns,'ID_MANAGER').Visible := true;

  end else begin //if actDebug checked
  {
    cdsRasx.FieldByName('ID_NAKL').Visible := false;
    cdsRasx.FieldByName('TIP').Visible := false;
    cdsRasx.FieldByName('ID_KLIENT').Visible := false;
    cdsRasx.FieldByName('ID_MANAGER').Visible := false;
    }
    ColumnByName(dbhRasx.Columns,'ID_NAKL').Visible := false;
    ColumnByName(dbhRasx.Columns,'TIP').Visible := false;
    ColumnByName(dbhRasx.Columns,'ID_KLIENT').Visible := false;
    ColumnByName(dbhRasx.Columns,'ID_MANAGER').Visible := false;

  end;  //if actDebug checked
end;

end.

