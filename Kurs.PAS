unit Kurs;

interface

uses Windows, Classes, Graphics, Forms, Controls, StdCtrls,
  Grids, DBGrids,
  Buttons, Mask, DBCtrls,
	ComCtrls,SysUtils,Dialogs, DB, QueryExtender, DBTables,
	untEx, FMTBcd, SqlExpr, Provider, DBClient,
	untRound, //ApplyOrCancel
	SqlTimSt,  //DateTimeToSQLTimeStamp
  untSettings,
  DBGridEh, PropStorageEh, ActnList, UnfFilter,
  atsAssert, Menus, DBCtrlsEh, DBLookupEh, PropFilerEh, GridsEh
	;

type
  TfrmKurs = class(TForm)
    edtDate: TDateTimePicker;
    SpeedButton1: TSpeedButton;
    CheckBox1: TCheckBox;
    edtKurs: TEdit;
    dsKurs: TDataSource;
    sdsKurs: TSQLDataSet;
    dspKurs: TDataSetProvider;
    qurKurs: TClientDataSet;
    qeKurs: TQueryExtender;
    qurKursDAT: TSQLTimeStampField;
    qurKursUSD: TFloatField;
    DBGridEh1: TDBGridEh;
    rpsClientEdit: TRegPropStorageManEh;
    PropStorageEh1: TPropStorageEh;
    ActionList1: TActionList;
    actSettings: TAction;
    UnfFilter1: TUnfFilter;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    dblCurrencyFrom: TDBLookupComboboxEh;
    sdsCurrency: TSQLDataSet;
    dspCurrency: TDataSetProvider;
    cdsCurrency: TClientDataSet;
    dsCurrency: TDataSource;
    cdsCurrencyOID: TIntegerField;
    cdsCurrencyNAME: TStringField;
    cdsCurrencyFULLNAME: TStringField;
    dblCurrencyTo: TDBLookupComboboxEh;
    actRefresh: TAction;
    Label1: TLabel;
    Label2: TLabel;
    qurKursID_CURRENCY_FROM: TIntegerField;
    sdsKursDAT: TSQLTimeStampField;
    sdsKursUSD: TFloatField;
    sdsKursID_CURRENCY_FROM: TIntegerField;
    sdsKursKURS_FROM: TFloatField;
    qurKursKURS_FROM: TFloatField;
    sdsKursID_CURRENCY: TIntegerField;
    qurKursID_CURRENCY: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure edtDateChange(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure edtKursKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qurKursAfterInsert(DataSet: TDataSet);
    procedure qurKursBeforeScroll(DataSet: TDataSet);
    procedure qurKursReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure DBGridEh1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qurKursAfterDelete(DataSet: TDataSet);
    procedure actSettingsExecute(Sender: TObject);
    procedure dblCurrencyFromChange(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure dblCurrencyToChange(Sender: TObject);
  private
    { Private declarations }
    FSlaveMode : boolean;
    FCurSebest : currency;
    FFilterText : string;
    bSemaphore : boolean;
    procedure SetFilterText(const Value: string);
    procedure ProcessSettings;
    procedure ProcessCurrency;
  public

    { Public declarations }
    setT : TfrmSettings;
    property curSebest: currency read FCurSebest write FCurSebest ;
    property SlaveMode : boolean read FSlaveMode write FSlaveMode ;
    property FilterText : string read FFilterText write SetFilterText;
    function ShowForInput(strFilter, sRetField: string): string;
    procedure ApplyFilter;

    function DefaultOpen:boolean;
  end;

implementation

{$R *.dfm}

procedure TfrmKurs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
try
  dmdEx.CloseQuery(cdsCurrency,false);
  if dsKurs.DataSet.active then begin
  	dsKurs.DataSet.CheckBrowseMode;
	  ApplyOrCancel(dsKurs.DataSet);
  end;
	if not FSlaveMode and qurKurs.active then
		qurKurs.Close;
finally
	Action := caFree;
end;
end;

procedure TfrmKurs.FormCreate(Sender: TObject);
var
  FidCurrencyTip, FidCurrencyUSD : integer;
begin
	//qurKurs.Open;
  qeKurs.defsql := sdsKurs.CommandText;
  setT := TfrmSettings.Create(self);
  setT.actDataOnly.Execute;
  sett.SetPeriod(6);
  setT.DateTo := IncMonth(Now,1);
  dmdEx.OpenQuery(cdsCurrency);
  FidCurrencyTip := dmdEx.GetOidObjects('ТИП ВАЛЮТ',-100);
  FidCurrencyUSD := dmdEx.getOidObjects('USD',FidCurrencyTip);
  bSemaphore := false;
  dblCurrencyFrom.KeyValue :=  dmdEx.GetIdCurrencyUAH;
  dblCurrencyTo.KeyValue :=  FidCurrencyUSD;
  edtDate.Date := Date;
  bSemaphore := true;
end;

procedure TfrmKurs.edtKursKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //if FSlaveMode then begin
    if key=vk_return then begin
      SpeedButton1Click(self);
    end;
  //end;
end;

procedure TfrmKurs.SetFilterText(const Value: string);
begin
  FFilterText := Value;
  FSlaveMode := true;
  edtDate.Date := strtodate(FFilterText);
  CheckBox1.Checked := true;
  //ApplyFilter;
end;


procedure TfrmKurs.SpeedButton1Click(Sender: TObject);
begin
  try
    FcurSebest := StrToCurr(edtKurs.Text);
		if (not qurKurs.Locate('dat',
		 VarSQLTimeStampCreate(DateTimeToSQLTimeStamp(edtDate.Date)),[]))then begin
      qurKurs.insert;
      qurKurs.FieldByName('dat').AsDateTime := trunc(edtDate.Date);
			qurKurs.FieldByName('usd').AsCurrency:=FCurSebest;
			PostAndApply(dsKurs.DataSet)
		end else begin
			qurKurs.Edit;
			qurKurs.FieldByName('usd').AsCurrency:=FCurSebest;
			PostAndApply(dsKurs.dataset);
		end;
		if FSlaveMode then begin
			self.Close;
		end;
	except
		on EConvertError do begin
      self.edtKurs.SetFocus;
      Showmessage ('Введите курс');
    end;
  end;

end;


procedure TfrmKurs.edtDateChange(Sender: TObject);
var
  sOldFilter : string;
begin
  if CheckBox1.Checked then begin
    sOldFilter := 'dat =' + QuotedStr (DatetoStr ( edtDate.Date));
    qeKurs.SetFilter(sOldFilter,0);
    qeKurs.ApplyFilter;
  end;
end;

function TfrmKurs.ShowForInput(strFilter, sRetField: string): string;
begin
  qeKurs.SetSQL('where','dat='+quotedstr(strFilter),0);
  qeKurs.Prepare;
  qeKurs.Refresh;
  actSettings.Enabled := false;
  self.FormStyle := fsNormal;
  self.Hide;
  self.ShowModal;
  Result := currtostr(qurKurs.FieldByName(sRetField).asCurrency);
end;

procedure TfrmKurs.CheckBox1Click(Sender: TObject);
begin
  ApplyFilter;
end;


procedure TfrmKurs.ApplyFilter;
begin
  if CheckBox1.Checked then begin
    qeKurs.SetFilter('dat =' + QuotedStr (DatetoStr ( edtDate.Date)),0);
    qeKurs.ApplyFilter;
  end else begin
    qurKurs.Filtered := false;
  end;
end;

procedure TfrmKurs.qurKursAfterInsert(DataSet: TDataSet);
begin
//	DataSet.fieldByName('id').asInteger:=dmdex.getgenvalue('kurs_gen');
  DataSet.fieldByName('id_currency').asInteger:=dblCurrencyTo.KeyValue;
  DataSet.fieldByName('id_currency_from').asInteger:=dblCurrencyFrom.KeyValue;
  DataSet.fieldByName('kurs_from').AsFloat :=1;
end;

procedure TfrmKurs.qurKursBeforeScroll(DataSet: TDataSet);
begin
  ApplyOrCancel(DataSet);
end;

procedure TfrmKurs.qurKursReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  showmessage(e.message);
  Action := raAbort;
end;

procedure TfrmKurs.DBGridEh1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_f8 : begin
      qurKurs.Delete;
    end; //vk_f8
  end;//case
end;

procedure TfrmKurs.qurKursAfterDelete(DataSet: TDataSet);
begin
  ApplyOrCancel(DataSet);
end;

procedure TfrmKurs.actSettingsExecute(Sender: TObject);
begin
  actSettings.checked := setT.ProcessSettingsChange2(DefaultOpen);
end;

procedure TfrmKurs.ProcessSettings;
begin
  self.Caption :='Справочник курсов: '
    + ' c ' + datetostr (setT.DateFrom)
    + ' по '+ datetostr(setT.DateTo);
  qeKurs.SetSQL('where',
    'dat between'+ QuotedStr(datetostr(setT.DateFrom)) +
    ' and '+ QuotedStr(datetostr(setT.DateTo)),0);
  qeKurs.Prepare;
end;

function TfrmKurs.DefaultOpen:boolean;
begin
Result :=true;
try
  ProcessCurrency;
  ProcessSettings;
  actRefresh.Execute;
  dsKurs.DataSet.Last;
  if not qurKurs.Active then begin
    Result :=false;
  end;
except
  AssertInternal('509F58C9-2F6C-46B4-9511-36977C441F70');
end;
end;

procedure TfrmKurs.dblCurrencyFromChange(Sender: TObject);
begin
  if bSemaphore then begin
    DefaultOpen;
  end;
end;

procedure TfrmKurs.actRefreshExecute(Sender: TObject);
begin
  if bSemaphore then begin
    dmdEx.StartWaiting;
    qeKurs.Refresh;
    dmdEx.StopWaiting;
  end;
end;

procedure TfrmKurs.ProcessCurrency;
var
  sTemp : string;
begin
  sTemp := 'id_currency_from='+
    inttostr(vartoint(dblCurrencyFrom.KeyValue))+
    ' and id_currency='+ inttostr(vartoint(dblCurrencyTo.KeyValue));
  qeKurs.SetSQL('where',sTemp,1);
  qeKurs.Prepare;
end;

procedure TfrmKurs.dblCurrencyToChange(Sender: TObject);
begin
  if bSemaphore then begin
    DefaultOpen;
  end;
end;



end.
