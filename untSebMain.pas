unit untSebMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, ToolWin, ComCtrls, Grids, DBGrids,
   ExtCtrls, Buttons,DB,
  Mask,Math,
  untEx,
  untRound,//rroundto
  SqlTimSt,//datetosqltimestamp
  DateUtils,//startofthemonth
  untRealPrice, //TfrmRealPrice
  untPrixDet, //TfrmPrixDet
  //custom units
  untSettings, untPosit, ActnList, QueryExtender, DBTables,
   FMTBcd, PropFilerEh, UnfFilter, PropStorageEh, DBClient,
  Provider, SqlExpr,   GridsEh, DBGridEh, frxClass,
  frxDBSet
  ;

type
  TfrmSebMain = class(TForm)
    ActionList1: TActionList;
    actSettings: TAction;
    actKurs: TAction;
    actSebest: TAction;
    dtsSource2: TDataSource;
    qeQuery2: TQueryExtender;
    dtsSource3: TDataSource;
    qeQuery3: TQueryExtender;
    dsPrice: TDataSource;
    qePrice: TQueryExtender;
    actPreview: TAction;
    actRefresh: TAction;
    frRepSebest: TfrxReport;
    frDBDataSet1: TfrxDBDataset;
    frDBDataSet2: TfrxDBDataset;
    frRepDoxod: TfrxReport;
    SQLDataSet1: TSQLDataSet;
    DataSetProvider1: TDataSetProvider;
    qurQuery1: TClientDataSet;
    qurQuery1ID: TStringField;
    qurQuery1DAT: TSQLTimeStampField;
    qurQuery1ID_NAKL: TIntegerField;
    qurQuery1ID_IZG: TIntegerField;
    qurQuery1ID_ZAK: TIntegerField;
    qurQuery1ID_MANAGER: TIntegerField;
    qurQuery1KURS2: TFloatField;
    qurQuery1NDS: TFloatField;
    qurQuery1TARA: TFloatField;
    qurQuery1NDS_FACT: TFloatField;
    qurQuery1OBOROT: TFloatField;
    qurQuery1NDS_SEBEST: TFloatField;
    qurQuery1NDS_SEBEST2: TFloatField;
    qurQuery1OPLACH: TFloatField;
    qurQuery1OPLACH_ZA_PERIOD: TFloatField;
    qurQuery1PERC_OPLACH: TFloatField;
    qurQuery1MAX_DOXOD: TFloatField;
    qurQuery1MAX_DOXOD_OPL: TFloatField;
    qurQuery1VYPL_DOXOD: TFloatField;
    qurQuery1DOXOD: TFloatField;
    qurQuery1RENT: TFloatField;
    qurQuery1IZG: TStringField;
    qurQuery1ZAK: TStringField;
    qurQuery1MANAGER: TStringField;
    DataSetProvider2: TDataSetProvider;
    SQLDataSet2: TSQLDataSet;
    qurQuery3: TClientDataSet;
    qurQuery3ID_POS: TIntegerField;
    qurQuery3ID_NAKLD: TIntegerField;
    qurQuery3ID_TOVAR: TIntegerField;
    qurQuery3TARA: TIntegerField;
    qurQuery3NALOG_NDS: TFMTBCDField;
    qurQuery3KURS: TFloatField;
    qurQuery3KURS2: TFloatField;
    qurQuery3SKIDKA: TFMTBCDField;
    qurQuery3CENA: TFMTBCDField;
    qurQuery3KOLOTP: TFloatField;
    qurQuery3CENA_SEBEST: TFMTBCDField;
    qurQuery3TOVAR: TStringField;
    qurQuery3SUM_GRN_NDS: TFloatField;
    qurQuery3SSUM_YE_NDS: TFloatField;
    qurQuery3NDS_SEBEST: TFloatField;
    qurQuery3CENA_GRN: TFMTBCDField;
    qurQuery3CENA_GRN_NDS: TFloatField;
    qurQuery3DOXOD: TFloatField;
    qurQuery3PERCENT: TFloatField;
    PropStorageEh1: TPropStorageEh;
    RegPropStorageManEh1: TRegPropStorageManEh;
    qurQuery3DAT: TSQLTimeStampField;
    UnfFilter1: TUnfFilter;
    UnfFilter2: TUnfFilter;
    sdsPremiyaVypl: TSQLDataSet;
    actPremiyaVypl: TAction;
    actRealPrice: TAction;
    SQLDataSet2ID_POS: TIntegerField;
    SQLDataSet2ID_NAKLD: TIntegerField;
    SQLDataSet2ID_TOVAR: TIntegerField;
    SQLDataSet2TARA: TIntegerField;
    SQLDataSet2NALOG_NDS: TFMTBCDField;
    SQLDataSet2KURS: TFloatField;
    SQLDataSet2KURS2: TFloatField;
    SQLDataSet2SKIDKA: TFMTBCDField;
    SQLDataSet2CENA: TFMTBCDField;
    SQLDataSet2KOLOTP: TFloatField;
    SQLDataSet2CENA_SEBEST: TFMTBCDField;
    SQLDataSet2CENA_GRN: TFMTBCDField;
    SQLDataSet2DAT: TSQLTimeStampField;
    SQLDataSet2CENA_GRN_NDS: TFloatField;
    SQLDataSet2SUM_GRN_NDS: TFloatField;
    SQLDataSet2SSUM_YE_NDS: TFloatField;
    SQLDataSet2NDS_SEBEST: TFloatField;
    SQLDataSet2DOXOD: TFloatField;
    SQLDataSet2PERCENT: TFloatField;
    Panel1: TPanel;
    btnSettings: TBitBtn;
    cbxPreview: TComboBox;
    btnPreview: TBitBtn;
    btnRefresh: TButton;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DBGridEh1: TDBGridEh;
    Splitter1: TSplitter;
    Panel2: TPanel;
    DBGridEh2: TDBGridEh;
    BitBtn1: TBitBtn;
    actPrixDet: TAction;

    procedure FormCreate(Sender: TObject);
    procedure actSettingsExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actKursExecute(Sender: TObject);

    procedure actSebestExecute(Sender: TObject);
    procedure actPreviewExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure frRepSebestGetValue(const ParName: String;
      var ParValue: Variant);
    procedure frRepDoxodGetValue(const ParName: String;
      var ParValue: Variant);
    procedure cbxPreviewChange(Sender: TObject);
    procedure qurQuery1AfterScroll(DataSet: TDataSet);
    procedure DBGridEh2DblClick(Sender: TObject);
    procedure DBGridEh2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actPremiyaVyplExecute(Sender: TObject);
    procedure actRealPriceExecute(Sender: TObject);
    procedure actPrixDetExecute(Sender: TObject);

  private
    { Private declarations }
    setT : TfrmSettings;

  public
    { Public declarations }
  end;

var
  frmSebMain: TfrmSebMain;

implementation

uses untPrice, Kurs;

{$R *.dfm}



procedure TfrmSebMain.FormCreate(Sender: TObject);
begin
  setT :=TfrmSettings.Create(self);
  setT.actAllManagerOn.Execute;

end;

//////////////////////////////////////////////////////
procedure TfrmSebMain.actSettingsExecute(Sender: TObject);
begin
  if (setT.ChangeSettings=mrOk) then begin
    actSettings.Checked := true;
    self.Caption :='Ввод себестоимости: '
      +setT.Manager + ' c ' + datetostr (setT.DateFrom)
      + ' по '+ datetostr(setT.DateTo);

    if (setT.IDManager<>0) then begin
      qurQuery1.Params.ParamByName('sub3_in').asInteger := setT.IDManager;
     // qeQuery2.SetSQL('where',
//        'auther='+ QuotedStr(setT.Manager),0);
    end
    else begin
      qurQuery1.Params.ParamByName('sub3_in').Clear;
//      qeQuery2.SetSQL('where',
//        '',0);
    end;
    qurQuery1.Params.ParamByName('dat_from').asDate := setT.DateFrom;
    qurQuery1.Params.ParamByName('dat_to').asDate := setT.DateTo;
    {qeQuery2.SetSQL('where',
      't.opl_data>='+ QuotedStr(datetostr(setT.DateFrom)),1);
    qeQuery2.SetSQL('where',
      't.opl_data<='+ QuotedStr(datetostr(setT.DateTo))  ,2);
      }
    actRefresh.Execute;
//    qeQuery2.Refresh;
  end
  else begin
    actSettings.Checked := false;
  end; //if change settings
end;



procedure TfrmSebMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //qeItogo.Query.Close;
  qeQuery2.Query.Close;
  qeQuery3.Query.Close;
  Action := caFree;
end;


{
procedure TfrmSebMain.btnRefreshClick(Sender: TObject);
begin
  sp_tmp_naklr.ExecProc;
  sp_tmp_sebest.ExecProc;
  qeQuery2.Refresh;
end;  }


procedure TfrmSebMain.actKursExecute(Sender: TObject);
var
  frmKurs : TfrmKurs ;
  curKurs : currency;
begin
  frmKurs := TfrmKurs.Create (Self);
  try
    curKurs := strtocurr (
    frmKurs.ShowForInput(
      qurQuery3.fieldbyname('dat').AsString,'usd'));
    DBGridEh2.DataSource.DataSet.Edit;
    DBGridEh2.SelectedField.AsCurrency := curKurs;
    DBGridEh2.DataSource.DataSet.Post;
  except
  end;
end;


procedure TfrmSebMain.actSebestExecute(Sender: TObject);
var
  curTemp : currency;
  frmPrice : TfrmPrice ;
begin
  frmPrice := TfrmPrice.Create (Self);
  try
     //!!!!!!!!!!!!!!!!!!!!!!!1111
    curTemp := strtocurr (
      frmPrice.ShowForInput(
        qurQuery3.fieldbyname('tovar').AsString,
        'sebest'));
    if (qurQuery3.State = dsBrowse ) then begin
      qurQuery3.Edit;
    end;
    qurQuery3.FieldByName('cena_sebest').AsCurrency := curTemp;
    qurQuery3.Post;
  except
  end;
end;



procedure TfrmSebMain.actPreviewExecute(Sender: TObject);
begin
  if (cbxPreview.ItemIndex=0) then begin
    qurQuery3.Filter:='((percent<=0) or (percent>80))';
    qurQuery3.Filtered:=True;
    frRepSebest.ShowReport;
    qurQuery3.Filtered :=false;
  end;
  if (cbxPreview.ItemIndex=1) then begin
    frRepSebest.ShowReport;
  end;
  if (cbxPreview.ItemIndex=2) then begin
    frRepDoxod.ShowReport;
  end;
end;

procedure TfrmSebMain.actRefreshExecute(Sender: TObject);
begin
  dmdEx.startwaiting;
  CancelUpdates(qurQuery3); 
  qeQuery2.Refresh;
  dmdEx.stopwaiting;
end;

procedure TfrmSebMain.frRepSebestGetValue(const ParName: String;
  var ParValue: Variant);
var
  strTemp : string;
begin
  if AnsiUpperCase(ParName) = 'REPORTTITLE' then begin

    if  qurQuery1.Filtered or qurQuery3.Filtered then begin
       strTemp :=' (фильтр)';
    end
    else begin
      strTemp := '';
    end;

    ParValue := 'Отчёт по себестоимости: '
      +setT.Manager + ' c ' + datetostr (setT.DateFrom)
      + ' по '+ datetostr(setT.DateTo) + strTemp;

  end;
end;

procedure TfrmSebMain.frRepDoxodGetValue(const ParName: String;
  var ParValue: Variant);
begin
  if AnsiUpperCase(ParName) = 'REPORTTITLE' then begin
    ParValue := 'Отчёт по доходам: '
      +setT.Manager + ' c ' + datetostr (setT.DateFrom)
      + ' по '+ datetostr(setT.DateTo);
  end;

end;


procedure TfrmSebMain.cbxPreviewChange(Sender: TObject);
begin
  if (cbxPreview.ItemIndex=0) then begin
    qurQuery3.Filter:='((percent<=0) or (percent>80))';
    qurQuery3.Filtered:=True;
  end;
  if (cbxPreview.ItemIndex=1) then begin
    qurQuery3.Filtered :=false;
  end;
  if (cbxPreview.ItemIndex=2) then begin
    qurQuery3.Filtered :=false;
  end;
end;

procedure TfrmSebMain.qurQuery1AfterScroll(DataSet: TDataSet);
begin
  if not DataSet.ControlsDisabled then begin
    qurQuery3.Close;
    qurQuery3.Params.ParamByName('id_nakl').AsInteger :=
      DataSet.FieldByName('id_nakl').AsInteger;
    qurQuery3.Open;
  end;//if
end;

procedure TfrmSebMain.DBGridEh2DblClick(Sender: TObject);
begin
  if (DBGridEh2.SelectedField.FieldName = 'CENA_SEBEST') then begin
    actSebest.Execute;
  end;
  if (DBGridEh2.SelectedField.FieldName = 'KURS2') then begin
    actKurs.Execute;
  end;
end;

procedure TfrmSebMain.DBGridEh2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN : begin
      if (DBGridEh2.SelectedField.FieldName = 'CENA_SEBEST') then begin
        actSebest.Execute;
      end ; //if
      if (DBGridEh1.SelectedField.FieldName = 'KURS') then begin
        actKurs.Execute;
      end; //if
    end; //vk_return
  end; //case
end;

procedure TfrmSebMain.actPremiyaVyplExecute(Sender: TObject);
begin
  if MessageDlg('Вы уверены что хотите выплатить прибыль по всем накладным из '
    +'данного отчёта',mtConfirmation, mbOKCancel,0)=mrOk then begin
     try
      qurQuery3.Close;
      qurQuery1.first;
      while not qurQuery1.eof do begin
        if (RRoundTo (qurQuery1.fieldByName('doxod').asFloat,-2) > 0) then begin
          sdsPremiyaVypl.Params.parambyName('id_nakl').asInteger :=
            qurQuery1.FieldByName('id_nakl').AsInteger;

          sdsPremiyaVypl.Params.parambyName('dat').AsSQLTimeStamp:=
            DateTimeToSQLTimeStamp(
            StartOfTheMonth(
             IncMonth(qurQuery1.Params.parambyname('dat_to').AsDateTime,1)
            ));

          sdsPremiyaVypl.Params.parambyName('premiya').AsCurrency :=
            qurQuery1.FieldByName('doxod').AsCurrency;

          dmdEx.ExecSQL(sdsPremiyaVypl,false);
        end;//if premiya>0
        qurQuery1.next;
      end; //while
     finally
       begin
         qurQuery1.Open;
         qurQuery3.Open;
       end;
     end;//try finally
  end; //if ok
end;

procedure TfrmSebMain.actRealPriceExecute(Sender: TObject);
begin
  frmRealPrice := TfrmRealPrice.Create(Application);
  frmRealPrice.qeNaklr.SetSQL('where','om.id_nakl='+
    qurQuery1.FieldByName('id_nakl').AsString,0);
  frmRealPrice.Defaultopen;
end;

procedure TfrmSebMain.actPrixDetExecute(Sender: TObject);
var
  frmPrixDet : TfrmPrixDet;
begin
	frmPrixDet := TfrmPrixDet.Create (Application);
	frmPrixDet.ShowDet(
    0,
		dtsSource2.DataSet.FieldByName('id_nakl').AsInteger
  );
end;

end.
