unit untSettings;
// frmSettings v1.04
//to do !!!
//1) hide all possible components except properties
//

interface
uses
	Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
	Dialogs, StdCtrls, Buttons, Mask, DBCtrls, ComCtrls,SqlTimSt, ActnList,
	PropStorageEh,DateUtils, DBCtrlsEh, DBLookupEh, ExtCtrls,
  SettingsPlugin, //TfmSettingsPlugin
  SettingsManager, // TfmSettingsManager
  SettingsSklad,
  SettingsPost,
  SettingsVlad,
  SettingsTovar,
  SettingsClient, //TfmSettingsClient
  SettingsTipGroup, //TfmSettingsTipGroup
  SettingsTipDetail,//TfmSettingsTipDetail
  SettingsNakloTip, //TfmTfmSettingsNakloTip
  SettingsDate, //TfmSettingsDate
  SettingsDataset,//TfmSettingsDataset'
  untRound, DBGridEh, PropFilerEh;
/////////////////////////////////////////////////////////////
type

	TfrmSettings = class(TForm)
		actOK: TAction;
		actCancel: TAction;
		actAllManagerOn: TAction;
		actFirstShow: TAction;

		stbStatusBar1: TStatusBar;
		ActionList1: TActionList;
		actAllManager: TAction;
		actDataOnly: TAction;
		PropStorageEh1: TPropStorageEh;
		rpsSettings: TRegPropStorageManEh;
    gbxPeriod: TGroupBox;
		lblDateTo: TLabel;
		lblDateFrom: TLabel;
		gbxManager: TGroupBox;
		cbxAllManag: TCheckBox;
		dlcSelManag: TDBLookupComboBox;
		lblManag: TLabel;
    pnlButtons: TPanel;
		btnOk: TBitBtn;
		btnCancel: TBitBtn;
		actManagerOff: TAction;
    cbxMonth: TComboBox;
    cbxYear: TComboBox;
    cbxRestDates: TComboBox;
    gbxVlad: TGroupBox;
    Label1: TLabel;
    dlcVlad: TDBLookupComboboxEh;
    actDataOff: TAction;
    medDateFrom: TDBDateTimeEditEh;
    medDateTo: TDBDateTimeEditEh;

		procedure FormCreate(Sender: TObject);
		procedure FormActivate(Sender: TObject);
		procedure FormHide(Sender: TObject);

		procedure btnOkClick(Sender: TObject);


		procedure dlcSelManagKeyUp(Sender: TObject; var Key: Word;
			Shift: TShiftState);
		procedure actAllManagerExecute(Sender: TObject);
		procedure actAllManagerOnExecute(Sender: TObject);
		procedure dlcSelManagClick(Sender: TObject);
		procedure actFirstShowExecute(Sender: TObject);
		procedure actCancelExecute(Sender: TObject);
		procedure actDataOnlyExecute(Sender: TObject);

		procedure actManagerOffExecute(Sender: TObject);
    procedure cbxMonthSelect(Sender: TObject);
    procedure cbxYearSelect(Sender: TObject);
    procedure cbxRestDatesSelect(Sender: TObject);
    procedure cbxMonthDropDown(Sender: TObject);
    procedure cbxYearDropDown(Sender: TObject);
    procedure medDateTo2Change(Sender: TObject);
    procedure medDateFrom2Change(Sender: TObject);
    procedure actDataOffExecute(Sender: TObject);
    procedure medDateFromChange(Sender: TObject);
    procedure medDateToChange(Sender: TObject);


	protected
		{ Private declarations }
		FManager      :string;
		FIDVlad       :integer;
		FIDManager    :integer;
		FDateFrom     :TDate;
		FDateTo       :TDate;
		FDateFromNew  :TDate;
		FDateToNew    :TDate;
		FFilled       :boolean;  //заполнена ли форма корректно
    SettingsManager2 : TfmSettingsPlugin;
		procedure SetIDManager(id:integer);
    function GetIDManager: integer;
    function  GetManager :string;

		//если true, то записываем во public var значения эл. управления
		function Fill (bFilled : boolean):boolean;
  private
    FPlugins : array of TfmSettingsPlugin;
    FiPluginsCount : integer;
    Semaphore : boolean;
    procedure FillYear;
    procedure ResetDates(ComponentName : string);
    procedure SetDateFrom(DateFrom :TDate);
    procedure SetDateTo(DateTo :TDate);


	public
		function ChangeSettings: integer;
		//В других формах вызывать, для установки периода времени по умолчанию
		function SetPeriod (iPeriod : integer):boolean;
    //add specific Already CREATED frame
    function AddPlugin(fm1 : TfmSettingsPlugin): integer;
    function RemovePlugin(fm1 : TfmSettingsPlugin): integer;
    //get where string
    function GetPluginResult (FmName : string): string;
    function GetPlugin(FmName:string):TfmSettingsPlugin;
    //get text label
    function GetPluginTextResult(FmName: string): string;
		procedure LoadProperties(Section:string; LoadOnlyDateFrom :boolean=false);
		procedure SaveProperties(Section:string);
    function CreatePlugin(PluginClassName:string):TfmSettingsPlugin;
    //Устарел в пользу ProcessSettingsChange2
    function ProcessSettingsChange(actRefresh:TAction):boolean; deprecated;
    function ProcessSettingsChange2(DefaultOpen: TFunctionDefaultOpen): boolean;
	published
		property IDManager  :integer read GetIDManager write SetIDManager;
		property Manager  :string read GetManager {write SetManager};
		property DateFrom :TDate read FDateFrom write SetDateFrom;
		property DateTo   :TDate read FDateTo write SetDateTo;
	end;
////////////////////////////////////////////////////////////////
var
  frmSettings: TfrmSettings;

implementation

uses //untEx,
 AtsAssert //AssertInternal
;

{$R *.dfm}
/////////////////////////////////////////////////////////////
function TfrmSettings.ChangeSettings: integer;
begin
  Result := self.ShowModal;
end;
//////
///////////////////////////////////////////////////////
procedure TfrmSettings.btnOkClick(Sender: TObject);
var
  i:integer;
begin
	FFilled:=true;
	stbStatusBar1.SimpleText :='';
  if (actDataOff.Checked=false) then begin
    try
      //stbStatusBar1.SimpleText :='';
      FDateFromNew:=medDateFrom.Value{.Date};
    except
      on EVariantTypeCastError do begin
        stbStatusBar1.SimpleText :=
          'Введите дату начала периода';
        medDateFrom.SetFocus;
        FFilled:=false;
      end;
    end; //try
    try
      FDateToNew:=medDateTo.Value{.Date};
    except
      on EVariantTypeCastError do begin
        stbStatusBar1.SimpleText :=
          'Введите дату конца периода';
        medDateTo.SetFocus;
        FFilled:=false;
      end;
    end; //try
    if (FDateToNew<FDateFromNew) then begin
      stbStatusBar1.SimpleText := 'Конец периода раньше начала периода';
      medDateTo.SetFocus;
      FFilled :=false;
    end;//if (FDateToNew<FDateFromNew)
  end; //if actDataOff.Checked=false
  if FFilled then begin
    for i:=0 to FiPluginsCount-1 do begin
      if not FPlugins[i].Filled then begin
        stbStatusBar1.SimpleText :=FPlugins[i].GetLastErrorMessage;
        FFilled := false;
        break;
      end; //if
    end;//for
  end;//if

	if Fill(FFilled) then begin
		ModalResult:=mrOk;
	end;
end;
/////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////
procedure TfrmSettings.FormCreate(Sender: TObject);
var
  SQLDate     :TSQLTimeStamp;
  datBegMonth :TDateTime;
begin
  FiPluginsCount := 0;
  //dmdEx.cdsSelManager.Open;
  medDateTo.Value{.Date}:=date;
  SQLDate := DateTimeToSQLTimeStamp(date);
  SQLDate.Day:=1;
  datBegMonth := SQLTimeStampToDateTime(SQLDate);
  medDateFrom.Value{.Date} := datBegMonth;
  //инициализация начальными значения
  DateFrom := medDateFrom.Value{Date};
  DateTo :=  medDateTo.Value{.Date};
  FillYear;
	{actVladOn.Checked := false;}
  //new id_manager processing
  self.Height := self.Height - gbxManager.Height;
  SettingsManager2 := CreatePlugin('TfmSettingsManager');
  SettingsManager2.Name := 'fmSettingsManager2';
  self.AddPlugin(SettingsManager2);
  semaphore := false;
end;
/////////////////////////////////////////////////////////////


procedure TfrmSettings.FormActivate(Sender: TObject);
begin
  semaphore :=false;
end;


procedure TfrmSettings.dlcSelManagKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN : begin
      btnOk.SetFocus;
      actOk.Execute;
    end;
    VK_ESCAPE	 :begin
      actCancel.Execute;
    end;
  end; //case
end;

procedure TfrmSettings.actAllManagerExecute(Sender: TObject);
begin
  SettingsManager2.SetKeyValue(null);
end;

procedure TfrmSettings.actAllManagerOnExecute(Sender: TObject);
begin
  SettingsManager2.SetResultType(1);
end;

procedure TfrmSettings.dlcSelManagClick(Sender: TObject);
begin
  FManager:=dlcSelManag.text;
end;

procedure TfrmSettings.actFirstShowExecute(Sender: TObject);
begin
  btnCancel.Enabled := false;
end;

procedure TfrmSettings.FormHide(Sender: TObject);
begin
  //reset after the first show
  btnCancel.Enabled := true;
end;

procedure TfrmSettings.actCancelExecute(Sender: TObject);
begin
	if not actManagerOff.Checked then begin
	  if not cbxAllManag.Checked then begin
      dlcSelManag.KeyValue := FIdManager;
    end;
  end;
  if (actDataOff.Checked=false) then begin
    {Если только открыли настройки и сразу нажали
    отмену, то старых значений ещё не было и
    следовательно их нельзя восстановить}
    if FDateFromNew<>0 then begin
      medDateFrom.Value{.Date}:=FDateFromNew;
    end;
    if FDateToNew<>0 then begin
      medDateTo.Value{.Date}:=FDateToNew;
    end;
  end;
  //Вернуть ранее выбранные значения для всех настоек
  //они были сохранены при последнем удачном нажатии ok
  {
  for i:=0 to FiPluginsCount-1 do begin
    FPlugins[i].CancelInput;
  end;//for
  }
  ModalResult := mrCancel;
end;

procedure TfrmSettings.actDataOnlyExecute(Sender: TObject);
begin
	actManagerOff.Execute
end;

procedure TfrmSettings.SetIDManager(id:integer);
begin
	if (id=0) then begin
		SettingsManager2.SetKeyValue(null);
		FManager := 'Все';
	end else begin
		FIDManager:=id;
    SettingsManager2.SetKeyValue(id);
		FManager:=GetPluginResult('fmSettingsManager2');
	end;
end;

procedure TfrmSettings.LoadProperties(Section: string;
  LoadOnlyDateFrom :boolean=false);
begin
  PropStorageEh1.Section:=Section;
  PropStorageEh1.LoadProperties;
  DateFrom := medDateFrom.Value;
  if not LoadOnlyDateFrom then begin
    DateTo :=  medDateTo.Value;
  end;
end;

procedure TfrmSettings.SaveProperties(Section: string);
begin
  PropStorageEh1.Section:=Section;
	PropStorageEh1.SaveProperties;
end;

function TfrmSettings.AddPlugin(fm1 : TfmSettingsPlugin): integer;
begin
  fm1.Parent := self;
  height := height +  fm1.Height;
  fm1.Top := height;
  fm1.Align := alTop;
  fm1.Init;
  inc(FiPluginsCount) ;
  SetLength(FPlugins,FiPluginsCount);
  FPlugins[FiPluginsCount-1]:=fm1;
  Result := 0;
end;

function TfrmSettings.SetPeriod (iPeriod : integer):boolean;
var
  SQLDate     :TSQLTimeStamp;
begin
//  Result := true; //ok
  //Календарный месяц
  if iPeriod =1 then begin
    medDateTo.Value := date;
    SQLDate := DateTimeToSQLTimeStamp(medDateTo.Value);
    SQLDate.Day:=1;
    medDateFrom.Value := SQLTimeStampToDateTime(SQLDate);
  end;
  //Месяц, т.е. с 15.07 по 15.08
  if iPeriod=2 then begin
    medDateTo.Value := date;
    medDateFrom.Value:=IncMonth(medDateTo.Value{.Date},-1);
	end;
  //месяц, т.е. с 15.07 по 15.08
  if iPeriod=3 then begin
//    Result :=false; //не реализовано
  end;

  //C начала квартала
  if iPeriod =4 then begin
    medDateTo.Value{.Date} := date;
    medDateFrom.Value{.Date}:=RecodeMonth(
      StartOfTheMonth(medDateTo.Value{.Date}),
      ((MonthOf(medDateTo.Value{.Date})-1) div 3)*3+1
    );
  end;

  //Три месяца
  if iPeriod =5 then begin
		medDateTo.Value{.Date} := date;
    medDateFrom.Value{.Date}:=IncMonth(medDateTo.Value{.Date},-3);
  end;

  //Полгода
  if iPeriod =6 then begin
    medDateTo.Value{.Date} := date;
    medDateFrom.Value{.Date}:=IncMonth(medDateTo.Value{.Date},-6);
  end;
  //Предыдущий месяц
  if iPeriod =7 then begin
    medDateFrom.Value{.Date} := StartOfTheMonth(IncMonth(Date,-1));
    medDateTo.Value{.Date} := EndOfTheMonth(IncMonth(Date,-1));
  end;
  if Fill(true) then begin
    Result := true;
  end else begin
    Result := false;
  end;
end;

function TfrmSettings.Fill(bFilled: boolean): boolean;
begin
  Result := false;
  if (bFilled = true) then begin
    FDateFrom:=medDateFrom.Value{.Date};
		FDateTo:=medDateTo.Value{.Date};
    Result := true;
  end;
end;

procedure TfrmSettings.actManagerOffExecute(Sender: TObject);
begin
	actManagerOff.Checked := true;
  RemovePlugin(SettingsManager2);
end;

procedure TfrmSettings.cbxMonthSelect(Sender: TObject);
var
  dDateFrom,dDateTo : TDate;
begin

  ResetDates(cbxMonth.Name);
  semaphore :=true;
  if ((cbxMonth.ItemIndex>=0) and (cbxMonth.ItemIndex<=11)) then begin
    dDateFrom:= EncodeDate(
      yearof(medDateTo.Value{.Date}),
      cbxMonth.ItemIndex+1,
      1);
    dDateTo :=EndOfTheMonth(dDateFrom);
    medDateFrom.Value{.Date} := dDateFrom;
    medDateTo.Value{.Date} := dDateTo;
  end;
  semaphore:=false;
end;

procedure TfrmSettings.ResetDates(ComponentName : string);
begin
  if not Semaphore then begin
    if AnsiUpperCase(ComponentName) <>
     AnsiUpperCase('cbxMonth') then begin
      cbxMonth.ItemIndex := -1;
      cbxMonth.Text := '<Месяц>';
    end;
    if AnsiUpperCase(ComponentName) <>
     AnsiUpperCase('cbxYear') then begin
      cbxYear.ItemIndex := -1;
      cbxYear.Text := '<Год>';
    end;
    if AnsiUpperCase(ComponentName) <>
     AnsiUpperCase('cbxRestDates') then begin
      cbxRestDates.ItemIndex := -1;
      cbxRestDates.Text := '<Спец>';
    end;  //'cbxRestDates')
  end; //if not Semaphore
end;

procedure TfrmSettings.FillYear;
var
  i : integer;
begin
  for i:=yearof(now)-5 to yearof(now)+5 do begin
    cbxYear.Items.Add(inttostr(i));
  end;
end;

procedure TfrmSettings.cbxYearSelect(Sender: TObject);
var
  dDateFrom,dDateTo : TDate;
begin
  ResetDates('cbxYear');
  semaphore:=true;
  if (cbxYear.ItemIndex>-1) then begin
    dDateFrom:= EncodeDate(
      strtoint(cbxYear.Text),
      1,
      1);
    dDateTo:= EndOfAMonth(
      strtoint(cbxYear.Text),
      12);
    medDateFrom.Value{.Date} := dDateFrom;
    medDateTo.Value{.Date} := dDateTo;
  end;
  semaphore :=false;
end;

procedure TfrmSettings.cbxRestDatesSelect(Sender: TObject);
var
  dDateFrom , dDateTo : TDate;
begin
  dDateFrom := 0;
  dDateTo := 0;
  ResetDates('cbxRestDates');
  semaphore:=true;
  if (cbxRestDates.ItemIndex>-1) then begin
    if (AnsiUpperCase(cbxRestDates.Text)=
     AnsiUpperCase('Пред месяц')) then begin
      dDateFrom:= StartOfTheMonth(IncMonth(now,-1));
      dDateTo := EndOfTheMonth(IncMonth(now,-1));
    end;
    if (AnsiUpperCase(cbxRestDates.Text)=
     AnsiUpperCase('Этот месяц')) then begin
      dDateFrom:= StartOfTheMonth(now);
      dDateTo := EndOfTheMonth(now);
    end;
    if (AnsiUpperCase(cbxRestDates.Text)=
     AnsiUpperCase('3 месяца')) then begin
      dDateFrom:= StartOfTheMonth(IncMonth(now,-3));
      dDateTo := EndOfTheMonth(now);
    end;
    if (AnsiUpperCase(cbxRestDates.Text)
     =AnsiUpperCase('6 месяцев')) then begin
      dDateFrom:= StartOfTheMonth(IncMonth(now,-6));
      dDateTo := EndOfTheMonth(now);
    end;
    if (AnsiUpperCase(cbxRestDates.Text)
     =AnsiUpperCase('13 месяцев')) then begin
      dDateFrom:= StartOfTheMonth(IncMonth(now,-13));
      dDateTo := EndOfTheMonth(now);
    end;
    medDateFrom.Value := dDateFrom;
    medDateTo.Value := dDateTo;
  end;
  semaphore:=false;
end;


function TfrmSettings.GetPluginResult(FmName: string): string;
var
  i : integer;
  bPluginWasFound : boolean;
begin
  Result := '';
  bPluginWasFound := false;
  for i:=0 to FiPluginsCount-1 do begin
    if AnsiUpperCase(FPlugins[i].Name)=AnsiUpperCase(FmName) then begin
      Result := FPlugins[i].GetResult;
      bPluginWasFound := true;
    end;
  end;
  if not bPluginWasFound then begin
    AssertInternal('02050A15-FA88-4948-B264-AFB6A8FA35D8' +
     '. Плагин с именем '+ FmName + ' не найден'
    );
  end
end;

function TfrmSettings.GetPluginTextResult(FmName: string): string;
var
  i : integer;
begin
  Result := '';
  for i:=0 to FiPluginsCount-1 do begin
    if AnsiUpperCase(FPlugins[i].Name)=AnsiUpperCase(FmName) then begin
      Result := FPlugins[i].GetTextResult
    end;
  end;
end;

procedure TfrmSettings.cbxMonthDropDown(Sender: TObject);
var
 Year, Month, Day : word;
begin
  DecodeDate(Now, Year, Month, Day);
  cbxMonth.ItemIndex:=month-1;
end;

procedure TfrmSettings.cbxYearDropDown(Sender: TObject);
var
 Year, Month, Day : word;
begin
  DecodeDate(Now, Year, Month, Day);
  cbxYear.ItemIndex:=5;
end;

procedure TfrmSettings.medDateTo2Change(Sender: TObject);
begin
  ResetDates('medDateTo');
end;

procedure TfrmSettings.medDateFrom2Change(Sender: TObject);
begin
  ResetDates('medDateFrom');
end;

procedure TfrmSettings.actDataOffExecute(Sender: TObject);
begin
  gbxPeriod.Visible := false;
  actDataOff.Checked := true;
  self.Height := self.Height - gbxPeriod.Height;
  
end;

procedure TfrmSettings.SetDateFrom(DateFrom: TDate);
begin
  medDateFrom.Value{.Date} := DateFrom;
  FDateFrom := DateFrom;
end;

procedure TfrmSettings.SetDateTo(DateTo: TDate);
begin
  medDateTo.Value{.Date} := DateTo;
  FDateTo := DateTo; 
end;

procedure TfrmSettings.medDateFromChange(Sender: TObject);
begin
  ResetDates('medDateFrom');
end;

procedure TfrmSettings.medDateToChange(Sender: TObject);
begin
  ResetDates('medDateTo');
end;

function TfrmSettings.RemovePlugin(fm1: TfmSettingsPlugin): integer;
var
  i : integer;
  j: integer;
begin
  height := height -  fm1.Height;
  fm1.Visible:=false;
  for i:= 0 to   FiPluginsCount-1 do begin
    if FPlugins[i]= fm1 then begin
      for j:=i to FiPluginsCount-2 do begin
        FPlugins[j]:=FPlugins[j+1];
      end;
    end;
  end;
  dec (FiPluginsCount);
  SetLength(FPlugins,FiPluginsCount);
  Result := 0;
end;

function TfrmSettings.GetIDManager: integer;
var
  sTemp : string;
begin
Result :=0;
try
  sTemp := GetPluginResult('fmSettingsManager2');
  if sTemp<>'' then begin
    Result := strtoint(sTemp);
  end;
except
  AssertINternal('8436E30A-DF09-4E77-A153-DD452ECEE602');
end
end;

function TfrmSettings.GetManager: string;
begin
  Result := GetPluginTextResult('fmSettingsManager2');
end;

function TfrmSettings.CreatePlugin(
  PluginClassName: string): TfmSettingsPlugin;
begin
  Result := nil;
  if AnsiUpperCase(PluginClassName)=AnsiUppercase('TfmSettingsManager') then begin
    Result := TfmSettingsManager.Create(self);
  end;
  if AnsiUpperCase(PluginClassName)=AnsiUppercase('TfmSettingsPost') then begin
    Result := TfmSettingsPost.Create(self);
  end;
  if AnsiUpperCase(PluginClassName)=AnsiUppercase('TfmSettingsTovar') then begin
    Result := TfmSettingsTovar.Create(self);
  end;
  if AnsiUpperCase(PluginClassName)=AnsiUppercase('TfmSettingsTipDetail') then begin
    Result := TfmSettingsTipDetail.Create(self);
  end;
  if AnsiUpperCase(PluginClassName)=AnsiUppercase('TfmSettingsNakloTip') then begin
    Result := TfmSettingsNakloTip.Create(self);
  end;
  if AnsiUpperCase(PluginClassName)=AnsiUppercase('TfmSettingsSklad') then begin
    Result := TfmSettingsSklad.Create(self);
  end;
  if AnsiUpperCase(PluginClassName)=AnsiUppercase('TfmSettingsVlad') then begin
    Result := TfmSettingsVlad.Create(self);
  end;
  if AnsiUpperCase(PluginClassName)=AnsiUppercase('TfmSettingsTipGroup') then begin
    Result := TfmSettingsTipGroup.Create(self);
  end;
  if AnsiUpperCase(PluginClassName)=AnsiUppercase('TfmSettingsClient') then begin
    Result := TfmSettingsClient.Create(self);
  end;
  if AnsiUpperCase(PluginClassName)=AnsiUppercase('TfmSettingsDate') then begin
    Result := TfmSettingsDate.Create(self);
  end;
  if Result=nil then begin
    raise Exception.Create(
      'Ошибка. Процедура TfrmSettings.CreatePlugin.  Плагин:'+
      PluginClassName+ ' не найден');
  end;
end;

function TfrmSettings.GetPlugin(FmName: string): TfmSettingsPlugin;
var
  i : integer;
  bPluginWasFound : boolean;
begin
  Result := nil;
  bPluginWasFound := false;
  for i:=0 to FiPluginsCount-1 do begin
    if AnsiUpperCase(FPlugins[i].Name)=AnsiUpperCase(FmName) then begin
      Result := FPlugins[i];
      bPluginWasFound := true;
    end;
  end;
  if not bPluginWasFound then begin
    exception.create('Плагин с именем '+ FmName + ' не найден');
  end
end;

//Устарел в пользу ProcessSettingsChange2
function TfrmSettings.ProcessSettingsChange(actRefresh: TAction): boolean;
begin
  Result := false;
  if self.ChangeSettings=mrOk then begin
    Result :=true;
    actRefresh.Execute;
  end;
end;


function TfrmSettings.ProcessSettingsChange2(DefaultOpen: TFunctionDefaultOpen): boolean;
begin
  Result := false;
  if self.ChangeSettings=mrOk then begin
    Result := DefaultOpen;
    //Result :=true;
  end;
end;

end.
