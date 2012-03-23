unit SpecOst;

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
  SettingsVlad, //fmSettingsVlad
  untRound
  ;

type
  TfrmSpecOst = class(TForm)
    dsRasx: TDataSource;
    ActionList1: TActionList;
    actRefresh: TAction;
    actItogo: TAction;
    actPreview: TAction;
    actWithoutTara: TAction;
    MainMenu1: TMainMenu;
    mnuActions: TMenuItem;
    N1: TMenuItem;
    N3: TMenuItem;
    frRasx: TfrxReport;
    frdRasx: TfrxDBDataset;
    dbhRasx: TDBGridEh;
    sdsRasx: TSQLDataSet;
    dspRasx: TDataSetProvider;
    cdsRasx: TClientDataSet;
    qeRasx: TQueryExtender;
    BitBtn2: TBitBtn;
    N2: TMenuItem;
    UnfFilter1: TUnfFilter;
    PropStorageEh1: TPropStorageEh;
    rpsSkladRasxDetEx: TRegPropStorageManEh;
    N4: TMenuItem;
    PopupMenu1: TPopupMenu;
    N5: TMenuItem;
    cdsRasxSUB5_NAME: TStringField;
    cdsRasxSUB4: TIntegerField;
    cdsRasxSUB5: TIntegerField;
    cdsRasxSUB6: TIntegerField;
    cdsRasxDEBETBEFORE: TFloatField;
    cdsRasxKREDITBEFORE: TFloatField;
    cdsRasxDEBET: TFloatField;
    cdsRasxKREDIT: TFloatField;
    cdsRasxDEBETAFTER: TFloatField;
    cdsRasxDEBET_KOLOTP: TFloatField;
    cdsRasxKREDIT_KOLOTP: TFloatField;
    cdsRasxDEBET_KOLOTP_AFTER: TFloatField;
    cdsRasxDEBET_CENA: TFloatField;
    cdsRasxKREDIT_CENA: TFloatField;
    actClose: TAction;
    Label1: TLabel;
    cbxMode: TComboBox;
    cdsRasxDELTA_CENA: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure frRasxGetValue(const ParName: String; var ParValue: Variant);
    procedure Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure cbxModeChange(Sender: TObject);
  private
    { Private declarations }
    dDate_from,dDate_to : TDate;
    sFilterOnlyPrixodPosition : string;
    FiSchetSpec : integer;
    //заполнение и выбор текущей даты - месяца
    procedure FillDate;
    //готовимся к выбору склада
    //procedure FillSklad;
    //ставим условия в зависимости от выбора даты
    procedure ProcessDate;
    //ставим условия в зависимости от выбора фирмы
    //генерация заголовка формы
    procedure UpdateCaption;
    //Фильтрация по несовпадающим позициям
    procedure ProcessMode;
  public
    setT : TfrmSettings;
    procedure SetFilterOnlyPrixodPosition (sFilter: TStringList);      
    { Public declarations }
  end;

var
  frmSpecOst: TfrmSpecOst;

implementation

{$R *.dfm}

procedure TfrmSpecOst.FormCreate(Sender: TObject);
begin
	dmdEx.startwaiting;
	//чтобы не было ошибки при processmanager
	//dmdEx.cdsManager.Open;
	//просто для удобства
	cdsRasx.CommandText:=sdsRasx.CommandText;
	qeRasx.DefSql := sdsRasx.CommandText;
	//заполняем
  FiSchetSpec:=dmdex.GetOidObjects('ТИП СЧЕТА',-100);
  FiSchetSpec:=dmdex.GetOidObjects('НЕСОБЛЮДЕНИЕ СПЕЦИФИКАЦИЙ',FiSchetSpec);
  setT := TfrmSettings.Create(self);
//  FillSklad;

	FillDate;
//  cdsRasx.Open;
end;


//заполнение и выбор текущей даты - месяца
procedure TfrmSpecOst.FillDate;
begin
try
  setT.SetPeriod(7);
except
  AssertInternal('75F53FE3-BE6B-4BB7-8A37-B1AD19B85C55');
end;
end;


procedure TfrmSpecOst.ProcessDate;
begin
try
  //запись дат для последующей детализации
  dDate_from :=  setT.DateFrom;
  dDate_to := setT.DateTo;
  qeRasx.Query.close;
  TClientDataSet(qeRasx.Query).Params.ParamByName('dat_from').AsDate:=dDate_from;
  TClientDataSet(qeRasx.Query).Params.ParamByName('dat_to').AsDate:=dDate_to;
  TClientDataSet(qeRasx.Query).Params.ParamByName('id_schet_spec').asInteger:=FiSchetSpec;
except
  AssertInternal('220EA05F-690C-4703-845E-5B27991F6D03');
end;

end;


procedure TfrmSpecOst.UpdateCaption;

begin
try
  self.Caption := 'Отчёт по остаткам на спецификациях';
except
  AssertInternal('8F0E4FA4-191E-45DF-A61D-E8D599FFE7A2');
end;
end;

procedure TfrmSpecOst.actRefreshExecute(Sender: TObject);
begin
try
	dmdEx.StartWaiting;
	UpdateCaption;
	ProcessDate;
	qeRasx.Refresh;
	dmdEx.StopWaiting;
except
  AssertInternal('7557D238-1F1F-4C75-843A-0B7E0F5CFADA');
end;
end;

procedure TfrmSpecOst.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmSpecOst.frRasxGetValue(const ParName: String;
  var ParValue: Variant);
var
  strTemp : string;
begin
try
	if AnsiUpperCase(ParName) = 'TITLE' then begin
    //генерация заголовка
    strTemp :=self.Caption;
    if (cdsRasx.Filtered = true) then begin
      //если отчёт отфильтрован
      strTemp := strTemp+ ' [Фильтр]';
    end;
    ParValue := strTemp;
  end;
	{
	if AnsiUpperCase(ParName)='TOTALSUM' then begin
		ParValue :=  curSum;
	end;
	}
except
	AssertInternal('A309C04A-3394-44C3-87C7-3B795D6A250F');
end;
end;

procedure TfrmSpecOst.Button1Click(Sender: TObject);
begin
  if setT.ChangeSettings=mrOk then begin
    showmessage(setT.GetPluginResult('fmSettingsSklad'));
  end;
end;

procedure TfrmSpecOst.FormDestroy(Sender: TObject);
begin
  setT.Free;
end;

procedure TfrmSpecOst.actCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmSpecOst.cbxModeChange(Sender: TObject);
begin
  ProcessMode;
end;

procedure TfrmSpecOst.ProcessMode;
begin
  with cdsRasx do begin
    case cbxMode.ItemIndex of
      0: begin
        Filtered := false;
      end;
      1: begin
        Filter := '([DEBET_KOLOTP_AFTER]<>0 or [DELTA_CENA]<>0)';
        Filtered := true;
      end;
      2: begin
        Filter := '[DELTA_CENA]<>0 and [DEBET_KOLOTP]>0 and [KREDIT_KOLOTP]>0';
        Filtered := true;
      end;
      3: begin
        Filter := '[DEBET_KOLOTP_AFTER]<>0';
        Filtered := true;
      end;
      4 : begin
        Filter := '[SUB5] in ('+sFilterOnlyPrixodPosition+')';
        Filtered := true;
      end;
    end;//case ItemIndex
  end;//with
end;

procedure TfrmSpecOst.SetFilterOnlyPrixodPosition(sFilter : TStringList);
var
  sTemp : string;
  i: integer;
begin
  //add list item for user selection
  for i:= 0 to sFilter.Count - 1 do begin
    sTemp := sTemp + sFilter.Strings[i]+', ';
  end;
  sTemp :=copy(sTemp,0,Length(sTemp)-2);
  sFilterOnlyPrixodPosition := sTemp;
  cbxMode.Items.Add('Только позиции из приходной накладной');
  //переключаем режим отчёта
  cbxMode.ItemIndex := 4;
  ProcessMode;
end;

end.

