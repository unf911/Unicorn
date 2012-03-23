unit untNaklrList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms,
  Dialogs, DB, DBTables, Grids, DBGrids,
  StdCtrls, FMTBcd, QueryExtender, DBClient, Provider, SqlExpr, ActnList,
  untEx,untSettings,atsAssert, Buttons, PropStorageEh, Menus, PropFilerEh,
  GridsEh, DBGridEh, UnfFilter;

type
  TfrmNaklrList = class(TForm)
    dsSchet: TDataSource;
    Button2: TButton;
    ActionList1: TActionList;
    actSettings: TAction;
    sdsNaklr: TSQLDataSet;
    dspNaklr: TDataSetProvider;
    cdsNaklr: TClientDataSet;
    qeNaklr: TQueryExtender;
    cdsNaklrNAKL: TIntegerField;
    cdsNaklrDAT: TSQLTimeStampField;
    cdsNaklrID_IZG: TIntegerField;
    cdsNaklrID_ZAK: TIntegerField;
    cdsNaklrID_MANAGER: TIntegerField;
    cdsNaklrNDS: TFMTBCDField;
    cdsNaklrIZG: TStringField;
    cdsNaklrZAK: TStringField;
    cdsNaklrMANAGER: TStringField;
    cdsNaklrID: TStringField;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    actOk: TAction;
    actCancel: TAction;
    PropStorageEh1: TPropStorageEh;
    RegPropStorageManEh1: TRegPropStorageManEh;
    sdsNaklo: TSQLDataSet;
    sdsSchet: TSQLDataSet;
    edtIzg: TEdit;
    cdsClient: TClientDataSet;
    MainMenu1: TMainMenu;
    mnuActions: TMenuItem;
    N5: TMenuItem;
    sdsSpec: TSQLDataSet;
    sdsNaklpBux: TSQLDataSet;
    sdsSravnPrice: TSQLDataSet;
    sdsNakloID: TStringField;
    sdsNakloID_MANAGER: TIntegerField;
    sdsNakloDAT: TSQLTimeStampField;
    sdsNakloCOMMENT: TStringField;
    sdsNakloID_SKLAD: TIntegerField;
    dspSravnPrice: TDataSetProvider;
    cdsSravnPrice: TClientDataSet;
    cdsSravnPriceID_MANAGER: TIntegerField;
    cdsSravnPriceCOMMENT: TStringField;
    cdsSravnPriceMANAGER: TStringField;
    cdsSravnPriceDAT: TSQLTimeStampField;
    cdsSravnPriceID: TStringField;
    cdsSravnPriceID_SKLAD: TIntegerField;
    cdsSravnPriceCURRENCY: TStringField;
    DBGridEh1: TDBGridEh;
    UnfFilter1: TUnfFilter;
    sdsSravnPriceNAKL: TIntegerField;
    cdsSravnPriceNAKL: TIntegerField;
    actRefresh: TAction;
    sdsVozvrat: TSQLDataSet;
    sdsNaklru: TSQLDataSet;
    sdsNaklpu: TSQLDataSet;
    sdsNaklrAndVozvratPost: TSQLDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure UnfDBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure UnfDBGrid1DblClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actSettingsExecute(Sender: TObject);
    procedure actOkExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure edtIzgKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
  private
    { Private declarations }
    intNakl : integer;
    sCaption : string;
    procedure ChoiceDone;
  public
    { Public declarations }
    setT : TfrmSettings;
    function GetSchet :integer;
    function Locate (id_nakl : integer): boolean;
    procedure ProcessSettings;
    procedure DefaultStartup; //окрывает накладные за 3 месяца
    procedure ShowNaklo; //Показывает список складских накладных
    procedure ShowSchet; //Показывает список счетов
    procedure ShowSpec;  //Показывает список спецификаций
    procedure ShowNaklpbux;// Показывает список приходных бух накладных
    procedure ShowVozvrat;
    procedure ShowNaklru;
    procedure ShowNaklpu;
    procedure ShowSravnPrice;
    procedure ShowNaklrAndVozvratPost;
    procedure Refresh;
    function Defaultopen: boolean;
    

  end;

var
  frmNaklrList: TfrmNaklrList;

implementation

{$R *.dfm}


procedure TfrmNaklrList.FormCreate(Sender: TObject);
begin
  setT := TfrmSettings.Create(self);
  setT.SetPeriod(5);//три месяца
  setT.actAllManagerOn.Execute;
  qeNaklr.DefSql:=sdsNaklr.CommandText;
  
  dmdex.openQuery(dmdEx.cdsManager);
  dmdEx.OpenQuery(dmdEx.cdsAllClient);

  cdsClient.Close;
  cdsClient.CloneCursor(dmdEx.cdsAllClient,True);
end;

procedure TfrmNaklrList.FormDestroy(Sender: TObject);
begin
  dmdEx.CloseQuery(dmdEx.cdsManager,false);
  dmdEx.CloseQuery(dmdEx.cdsAllClient,false);
  dsSchet.DataSet.Close;
end;

function TfrmNaklrList.GetSchet: integer;
begin
  if (self.ShowModal =mrOk) then begin
    Result := intNakl;
  end
  else begin
    Result := 0;
  end;
end;

procedure TfrmNaklrList.UnfDBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return : begin
      ChoiceDone;
    end; //vk_return
  end;//case
end;

procedure TfrmNaklrList.ChoiceDone;
begin
  intNakl := dsSchet.DataSet.fieldbyname('nakl').asInteger;
  ModalResult := mrOK;
end;

procedure TfrmNaklrList.UnfDBGrid1DblClick(Sender: TObject);
begin
  ChoiceDone;
end;

procedure TfrmNaklrList.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	case key of
    vk_return : begin
			actOk.Execute;
		end; //vk_return
		vk_escape : begin
			actCancel.Execute;
		end;
  end;//case
end;

procedure TfrmNaklrList.actSettingsExecute(Sender: TObject);
begin
//  actSettings.checked := setT.ProcessSettingsChange(actRefresh);
  actSettings.checked := setT.ProcessSettingsChange2(DefaultOpen);
end;

procedure TfrmNaklrList.ProcessSettings;
begin
    self.Caption := sCaption + ': '
      +setT.Manager + ' c ' + datetostr (setT.DateFrom)
      + ' по '+ datetostr(setT.DateTo);
    if (setT.IDManager<>0) then begin
      qeNaklr.SetSQL('where',
        'id_manager = '+ inttostr(setT.IDManager),0);
    end
    else begin
      qeNaklr.SetSQL('where',
        '',0);
    end;
    qeNaklr.SetSQL('where',
      'dat>='+ QuotedStr(datetostr(setT.DateFrom)),1);
    qeNaklr.SetSQL('where',
      'dat<='+ QuotedStr(datetostr(setT.DateTo))  ,2);
    qeNaklr.Prepare;
end;


procedure TfrmNaklrList.actOkExecute(Sender: TObject);
begin
  ChoiceDone;
end;
      
procedure TfrmNaklrList.actCancelExecute(Sender: TObject);
begin
  ModalResult :=mrCancel;
end;

function TfrmNaklrList.Locate(id_nakl: integer): boolean;
begin
  Result := dsSchet.Dataset.Locate('nakl',id_nakl,[]);
end;

procedure TfrmNaklrList.DefaultStartup;
begin
  ProcessSettings;
  DefaultOpen;
end;

procedure TfrmNaklrList.ShowNaklo;
begin
  dmdEx.startwaiting;
  dspNaklr.DataSet:=sdsNaklo;
  qeNaklr.DefSql :=sdsNaklo.CommandText;
  sCaption := 'Выбор отгрузки со склада';
  dmdEx.stopwaiting;
end;

procedure TfrmNaklrList.ShowNaklrAndVozvratPost;
begin
  dmdEx.startwaiting;
  dspNaklr.DataSet:=sdsNaklrAndVozvratPost;
  qeNaklr.DefSql :=sdsNaklrAndVozvratPost.CommandText;
  sCaption := 'Выбор расходной накладной или возврата поставщику';
  dmdEx.stopwaiting;
end;

procedure TfrmNaklrList.ShowSchet;
begin
  dmdEx.startwaiting;
  dspNaklr.DataSet:=sdsSchet;
  qeNaklr.DefSql :=sdsSchet.CommandText;
  sCaption := 'Выбор счёта';
  dmdEx.stopwaiting;
end;

procedure TfrmNaklrList.ShowSpec;
begin
  dmdEx.startwaiting;
  dspNaklr.DataSet:=sdsSpec;
  qeNaklr.DefSql :=sdsSpec.CommandText;
  sCaption := 'Выбор спецификации';
  dmdEx.stopwaiting;
end;

procedure TfrmNaklrList.ShowSravnPrice;
begin
  dmdEx.startwaiting;
  //dspNaklr.DataSet:=sdsSpec;
  qeNaklr.query := cdsSravnPrice;
  qeNaklr.DefSql :=sdsSravnPrice.CommandText;
  //qeNaklr.keyfield :='nakl';
  dsSchet.DataSet := cdsSravnPrice;
  sCaption := 'Выбор сравнения прайсов';
  dmdEx.stopwaiting;
end;

procedure TfrmNaklrList.edtIzgKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  strTemp : string;
begin
  if (edtIzg.Text<>'') then begin
    cdsClient.Filter:= 'name=''' + edtIzg.Text + '*''';
    cdsClient.Filtered := true;
    cdsClient.First;
    while not cdsClient.Eof do begin
      strTemp := strTemp+ cdsClient.FieldByName('id').asString + ', ';
      cdsClient.Next;
    end;
    strTemp := Copy(strTemp,1,Length(strTemp)-2);
    if strTemp <> '' then begin
      strTemp := 'id_zak in ( '+strTemp+' )';
    end else begin
      strTemp := 'id_zak in ( 0 )';
    end;
    dsSchet.DataSet.Filter := strTemp;
    dsSchet.DataSet.Filtered := true;

  end
  else begin
    cdsClient.Filtered := false;
    cdsNaklr.Filtered := false;
  end; //if
end;



procedure TfrmNaklrList.FormShow(Sender: TObject);
begin
  if dspNaklr.DataSet=sdsSpec then begin
    {ShowSpec was called, т.е. показываем спецификации}
    DBGridEh1.SetFocus;
  end;
end;

procedure TfrmNaklrList.ShowNaklpbux;
begin
  dmdEx.startwaiting;
  dspNaklr.DataSet:=sdsNaklpBux;
  qeNaklr.DefSql :=sdsNaklpbux.CommandText;
  sCaption := 'Выбор приходной бухгалтерской накладной';
  dmdEx.stopwaiting;
end;

procedure TfrmNaklrList.actRefreshExecute(Sender: TObject);
begin
  Refresh;
end;

function TfrmNaklrList.Defaultopen: boolean;
begin
  ProcessSettings;
  Refresh;
  Result :=true;
end;

procedure TfrmNaklrList.ShowVozvrat;
begin
  dmdEx.startwaiting;
  dspNaklr.DataSet:=sdsVozvrat;
  qeNaklr.DefSql :=sdsVozvrat.CommandText;
  sCaption := 'Выбор возвратной накладной';
  dmdEx.stopwaiting;
end;

procedure TfrmNaklrList.ShowNaklru;
begin
  dmdEx.startwaiting;
  dspNaklr.DataSet:=sdsNaklru;
  qeNaklr.DefSql :=sdsNaklru.CommandText;
  sCaption := 'Выбор расходной накладной по аренде';
  dmdEx.stopwaiting;
end;

procedure TfrmNaklrList.ShowNaklpu;
begin
  dmdEx.startwaiting;
  dspNaklr.DataSet:=sdsNaklpu;
  qeNaklr.DefSql :=sdsNaklpu.CommandText;
  sCaption := 'Выбор приходной накладной на услуги';
  dmdEx.stopwaiting;
end;

procedure TfrmNaklrList.Refresh;
begin
  dmdEx.StartWaiting;
  qeNaklr.Refresh(false);
  dmdEx.StopWaiting;
end;

end.
