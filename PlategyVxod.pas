unit PlategyVxod;
   { TODO : Фильтр должен показывать только существующие фирмы }
interface

uses
  Windows, Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms,
  Dialogs, DBCtrls, ToolWin, ComCtrls, Grids,
  DBGrids,
  ExtCtrls, Buttons,DB,
  Mask, FMTBcd, DBClient, Provider, SqlExpr, Menus, QueryExtender,
  ActnList, untUnfDbLookupListbox, StdCtrls, untEx,untRound,
  //custom units
  untSettings, untUnfListBox, //Transh,
  untListBoxPosit,
  ActnMan, ActnCtrls ,
  untPrixDet ,
  SettingsPlugin, //TfmSettingsPlugin
  atsAssert,
  StrUtils, //AnsiStartsText
  SkladAux, //OpenDocument
  GridsEh, DBGridEh, UnfFilter, PropFilerEh, PropStorageEh
;

type

  TfrmPlategyVxod = class(TForm)
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    actFullTransh: TAction;
    actPartTransh: TAction;
    actClearNakl: TAction;
    actClearOpl: TAction;
    dtsSource1: TDataSource;
    dtsSource2: TDataSource;
    qeQuery2: TQueryExtender;
    ulbListBox1: TUnfDbLookupListbox;
    pnlPanel2: TPanel;
    Edit1: TEdit;
    btnPreview: TBitBtn;
    btnPrint: TBitBtn;
    Button1: TButton;
    btnSettings: TBitBtn;
    cbxAllOpl: TCheckBox;
    cbxAllNakl: TCheckBox;
    udgGrid1: TDBGridEh;
    udgGrid2: TDBGridEh;
    actStart: TAction;
    actGrid1ListShow: TAction;
    actClearOplaty: TAction;
    actPostIf: TAction;
    actRefresh: TAction;
    actShowDet: TAction;
    BitBtn1: TBitBtn;
    cbxNerazn: TCheckBox;
    actNerazn: TAction;
    actAllOpl: TAction;
    actAllNakl: TAction;
    actSettings: TAction;
    actItogo: TAction;
    Panel1: TPanel;
    btnRefresh: TButton;
    btnTime: TButton;
    Button2: TButton;
    actApply: TAction;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    actFinance: TAction;
    sdsPlat: TSQLDataSet;
    dspPlat: TDataSetProvider;
    cdsNaklo: TClientDataSet;
    qurQuery2: TClientDataSet;
    dspNaklr: TDataSetProvider;
    sdsNaklr: TSQLDataSet;
    cdsNakloIDI: TIntegerField;
    cdsNakloDAT: TSQLTimeStampField;
    cdsNakloZAK: TStringField;
    cdsNakloIZG: TStringField;
    cdsNakloPRIM: TStringField;
    cdsNakloID_MANAGER: TIntegerField;
    stpTransh: TSQLDataSet;
    qeQuery1: TQueryExtender;
    cdsNakloMANAGER: TStringField;
    qurQuery2ID: TStringField;
    qurQuery2DAT: TSQLTimeStampField;
    qurQuery2AUTHER: TStringField;
    qurQuery2NDS: TFMTBCDField;
    qurQuery2OPLACHENO: TFloatField;
    qurQuery2OSTATOK: TFloatField;
    qurQuery2OPL_DATA: TSQLTimeStampField;
    sdsFinTransh: TSQLDataSet;
    sdsPlatDAT: TSQLTimeStampField;
    sdsPlatOSTATOK: TFloatField;
    sdsPlatID_MANAGER: TIntegerField;
    sdsNaklrID: TStringField;
    sdsNaklrDAT: TSQLTimeStampField;
    sdsNaklrNDS: TFMTBCDField;
    sdsNaklrOPLACHENO: TFloatField;
    sdsNaklrOSTATOK: TFloatField;
    sdsNaklrOPL_DATA: TSQLTimeStampField;
    stpClearTransh: TSQLDataSet;
    sdsPlatID_ZAK: TIntegerField;
    sdsPlatID_IZG: TIntegerField;
    cdsNakloID_ZAK: TIntegerField;
    cdsNakloID_IZG: TIntegerField;
    cdsNakloOSTATOK: TFloatField;
    cdsNakloOPL: TFMTBCDField;
    sdsNaklrID_IZG: TIntegerField;
    sdsNaklrID_ZAK: TIntegerField;
    sdsNaklrPOSTED: TSmallintField;
    sdsNaklrID_MANAGER: TIntegerField;
    qurQuery2ID_IZG: TIntegerField;
    qurQuery2ID_ZAK: TIntegerField;
    qurQuery2POSTED: TSmallintField;
    qurQuery2ID_MANAGER: TIntegerField;
    sdsPlatID: TStringField;
    cdsNakloID: TStringField;
    actRefreshRecord: TAction;
    N3: TMenuItem;
    sdsPlatPOSTED: TSmallintField;
    cdsNakloPOSTED: TSmallintField;
    sdsPlatID_NAKL: TIntegerField;
    sdsPlatNDS: TFMTBCDField;
    sdsPlatCOMMENT: TStringField;
    sdsDelmark: TSQLDataSet;
    UnfFilter1: TUnfFilter;
    UnfFilter2: TUnfFilter;
    actShowNaklr: TAction;
    PopupMenu2: TPopupMenu;
    N4: TMenuItem;
    sdsPlatID_SKLAD: TIntegerField;
    cdsNakloID_SKLAD: TIntegerField;
    cdsNakloBANK_FROM: TStringField;
    sdsTemp: TSQLDataSet;
    dspTemp: TDataSetProvider;
    cdsTemp: TClientDataSet;
    dsTemp: TDataSource;
    sdsPlatPARENT_ID_NAKL: TIntegerField;
    cdsNakloPARENT_ID_NAKL: TIntegerField;
    actDebug: TAction;
    N5: TMenuItem;
    sdsXozoper: TSQLDataSet;
    dspXozOper: TDataSetProvider;
    cdsXozOper: TClientDataSet;
    cdsXozOperOID: TIntegerField;
    cdsXozOperNAME: TStringField;
    cdsXozOperFULLNAME: TStringField;
    dsXozOper: TDataSource;
    sdsPlatID_SKLAD_TO: TIntegerField;
    cdsNakloID_SKLAD_TO: TIntegerField;
    cdsNakloXOZ_OPER: TStringField;
    cdsNakloAGENT: TStringField;
    sdsPlatID_CURRENCY_TO: TIntegerField;
    cdsNakloID_CURRENCY_TO: TIntegerField;
    rpsClientEdit: TRegPropStorageManEh;
    PropStorageEh1: TPropStorageEh;
    sdsNaklrID_NAKL: TIntegerField;
    qurQuery2ID_NAKL: TIntegerField;
    cdsNakloZATRATY: TFMTBCDField;
    cdsNakloNDS_FROM: TFMTBCDField;
    sdsPlatNDS_FROM: TFMTBCDField;
    sdsPlatZATRATY: TFMTBCDField;
    sdsPlatID_CURRENCY: TSmallintField;
    cdsNakloID_CURRENCY: TSmallintField;
    cdsNakloCURRENCY: TStringField;
    PopupMenu1: TPopupMenu;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    actFinanceArenda: TAction;
    sdsFinTranshArenda: TSQLDataSet;
    N12: TMenuItem;
    N13: TMenuItem;
    sdsPlatPOTRACHENO: TFloatField;
    cdsNakloPOTRACHENO: TFloatField;
    actFinanceFinusl: TAction;
    sdsFinTranshFinusl: TSQLDataSet;
    N14: TMenuItem;
    procedure actFullTranshExecute(Sender: TObject);
    procedure udgGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ulbListBox1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actClearNaklExecute(Sender: TObject);
    procedure actPartTranshExecute(Sender: TObject);
    procedure actClearOplExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure cdsNakloAfterInsert(DataSet: TDataSet);
    procedure cdsNakloBeforePost(DataSet: TDataSet);
    procedure cdsNakloBeforeScroll(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure ulbListBox1Exit(Sender: TObject);
    procedure ulbListBox1DblClick(Sender: TObject);
    procedure actGrid1ListShowExecute(Sender: TObject);
    procedure udgGrid1DblClick(Sender: TObject);
    procedure actClearOplatyExecute(Sender: TObject);
    procedure udgGrid1ColEnter(Sender: TObject);
    procedure actPostIfExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure actShowDetExecute(Sender: TObject);
    procedure actSettingsExecute(Sender: TObject);
    procedure actItogoExecute(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
    procedure actFinanceExecute(Sender: TObject);
    procedure cdsNakloReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure qurQuery2ReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure qurQuery1AfterDelete(DataSet: TDataSet);
    procedure actRefreshRecordExecute(Sender: TObject);
    procedure cdsNakloAfterScroll(DataSet: TDataSet);
    procedure dspPlatGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspPlatBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure actShowNaklrExecute(Sender: TObject);
    procedure actDebugExecute(Sender: TObject);
    procedure cdsNakloNDS_FROMChange(Sender: TField);
    procedure cdsNakloZATRATYChange(Sender: TField);
    procedure cdsNakloOPLChange(Sender: TField);
    procedure udgGrid2DblClick(Sender: TObject);
    procedure actFinanceArendaExecute(Sender: TObject);
    procedure actFinanceFinuslExecute(Sender: TObject);
  private
    Semaphore : boolean;
    setT : TfrmSettings;
    Rect1 :TRect;
    FiTipRasx : Integer;
    FiTipRasxUsl : integer;
    FiXozOperUsl : integer;
    FiXozOperFinUsl : integer;
    FiTipRasxFinUsl : integer;
    
    SettingsVlad : TfmSettingsPlugin;
    SettingsClient : TfmSettingsPlugin;
    SettingsManager : TfmSettingsPlugin;
    SettingsTipDetail1 : TfmSettingsPlugin;
    SettingsTipDetail2 : TfmSettingsPlugin;
    procedure ProcessNaklr;
    procedure ProcessPrix;
    Procedure ProcessSettings(ProcessOnlySecurityMeasures:boolean=false);
    procedure ShowForBuxgAndPoweruser;
    procedure FillSettings;
    procedure TestInsert;
    procedure FillOidObjects;
    function GetTipForMakeTransh: integer;
    procedure CreateFinNakl(sdsFinTranshUsl :TSqlDataSet);
  public
    { Public declarations }
    function DefaultOpen:boolean;
    procedure Test;
    procedure DefaultStartup;
  end;

var
  frmPlategyVxod: TfrmPlategyVxod;

implementation


{$R *.dfm}

procedure TfrmPlategyVxod.actFullTranshExecute(Sender: TObject);
begin
  stpTransh.ParamByName('type1').AsInteger := 1;
  stpTransh.ParamByName('type2').AsInteger := GetTipForMakeTransh;
  
  stpTransh.ParamByName('what_id').AsInteger := 1;
  stpTransh.ParamByName('id1').AsInteger :=
    cdsNaklo.fieldbyname('id_nakl').AsInteger;
  stpTransh.ParamByName('id2').AsInteger :=
    qurQuery2.fieldbyname('id_nakl').AsInteger;

  if (cdsNaklo.State <> dsBrowse) then begin
    cdsNaklo.Post;
  end;
  actApply.Execute;

//  stpTransh.Prepare;
  dmdex.ExecSQL(stpTransh);
  if (stpTransh.ParamByName('result').asCurrency >0) then begin
    StatusBar1.SimpleText := 'Переведена с платежа №'+
      cdsNaklo.fieldbyname('id_nakl').AsString + ' на накладную №'+
      qurQuery2.fieldbyname('id').AsString + ' сумма: ' +
      format('%8.2f',[stpTransh.ParamByName('result').asFloat]);
  end;
  qeQuery1.Refresh;
end;

procedure TfrmPlategyVxod.udgGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_f8: begin
      if (MessageDlg('Вы хотите удалить запись?',mtConfirmation ,
      [mbCancel, mbOk   ],0) = mrOk) then begin
        actClearOplaty.Execute;
        cdsNaklo.Delete;
      end;
    end;
    vk_return:  begin
      actGrid1ListShow.Execute;
    end;
    vk_insert: begin
      cdsNaklo.Append;
    end;
  end; //case
end;

procedure TfrmPlategyVxod.ulbListBox1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
     13 : begin
       LookupBoxExitOkEh (ulbListBox1 , udgGrid1, Rect1);
       actPostIf.Execute;
     end;
     27 : begin
       ulbListBox1.Hide;
     end;
   end; //case
end;

procedure TfrmPlategyVxod.actClearNaklExecute(Sender: TObject);
begin

  stpClearTransh.ParamByName('type1').AsInteger := 2;
  stpClearTransh.ParamByName('id1').AsInteger :=
    qurQuery2.fieldbyname('id_nakl').AsInteger;
//  stpClearTransh.ParamByName('what_id').AsInteger :=5;

  if (cdsNaklo.State <> dsBrowse) then begin
    cdsNaklo.Post;
  end;
  actApply.Execute;
  try
    dmdEx.ExecSQL(stpClearTransh);
  except
    on E:EDatabaseError do begin
      if AnsiStartsText('no permission', e.message) then begin
        MessageDlg ('Только бухгалтерия имеет право сбрасывать накладные',mtWarning,[mbOK],0);
      end
      else begin
        showmessage (e.message);
      end; //if
    end;
  end;
  qeQuery1.Refresh;
  qeQuery2.Refresh;
  if (stpTransh.ParamByName('result').AsInteger>=1) then begin
    StatusBar1.SimpleText := 'Накладная была успешно сброшена';
  end
  else begin
    StatusBar1.SimpleText := 'Накладная не была сброшена !!!';
  end;
end;

procedure TfrmPlategyVxod.actPartTranshExecute(Sender: TObject);
begin
 try
  actApply.Execute;
  stpTransh.ParamByName('type1').AsInteger := 1;
  stpTransh.ParamByName('type2').AsInteger := GetTipForMakeTransh;

  //stpTransh.ParamByName('type2').AsInteger := 2;
  stpTransh.ParamByName('what_id').AsInteger := 2;
  stpTransh.ParamByName('suma').AsCurrency := strtocurr(Edit1.text);
  stpTransh.ParamByName('id1').AsInteger :=
    cdsNaklo.fieldbyname('id_nakl').AsInteger;
  stpTransh.ParamByName('id2').AsInteger :=
    qurQuery2.fieldbyname('id_nakl').AsInteger;
  if (stpTransh.ParamByName('suma').AsCurrency>0) then begin
    //post changes
    if (cdsNaklo.State <> dsBrowse) then begin
      cdsNaklo.Post;
    end;
    actApply.Execute;

    dmdex.ExecSQL(stpTransh);
    qeQuery1.Refresh;
  end; //if >0
  //showmessage(stpTransh.ParamByName('result').AsString);
  if (stpTransh.ParamByName('result').AsCurrency<>
    stpTransh.ParamByName('suma').AsCurrency) then begin
    StatusBar1.SimpleText := 'Не можем перевести такую сумму';
    showmessage ( 'Не можем перевести такую сумму');
    Edit1.Text := stpTransh.ParamByName('result').AsString;
    Edit1.SetFocus;
    exit;
  end
  else begin
    StatusBar1.SimpleText := 'Переведена с платежа №'+
      cdsNaklo.fieldbyname('id_nakl').AsString + ' на накладную №'+
      qurQuery2.fieldbyname('id').AsString + ' сумма: ' +
      format('%8.2f',[stpTransh.ParamByName('result').asFloat]);
    Edit1.Text := '0';
  end;  //if
 except
  on EConvertError do begin
    showmessage ('Введите сумму оплаты');
    Edit1.Text :='0';
    edit1.SetFocus;
    exit;
  end; //on econvert
 end; //try
end;

procedure TfrmPlategyVxod.actClearOplExecute(Sender: TObject);
begin
  if (cdsNaklo.State <> dsBrowse) then begin
    cdsNaklo.Post;
  end;
  actApply.Execute;
  actClearOplaty.Execute;
  qeQuery1.Refresh;
  if (stpTransh.ParamByName('result').asInteger>=1) then begin
    StatusBar1.simpletext := 'Платёж был успешно сброшен';
  end
  else begin
    StatusBar1.SimpleText := 'Платёж не был сброшен !!!';
  end;
end;

procedure TfrmPlategyVxod.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //если остались неприменённые изменения
  actApply.Execute;
  if not actApply.Checked then begin
    if (MessageDlg('Вы закрыть несмотря на ошибки',mtConfirmation ,
      [mbOk, mbCancel ],0) = mrOk) then begin

    end;  
  end;
  Action := caFree;
  {
  ApplyOrCancel(qurQuery1);
  if ((qurQuery1.UpdatesPending = true)
    or (qurQuery2.UpdatesPending = true)) then begin
    if (MessageDlg('Вы хотите сохранить изменения',mtConfirmation ,
    [mbOk, mbCancel ],0) = mrOk) then begin

    end;//dlg
  end;//pending
  }
//  Action := caFree;
end;


procedure TfrmPlategyVxod.FormCreate(Sender: TObject);
begin
  dmdEx.OpenQuery(dmdEx.dsVlad.DataSet);
  dmdEx.OpenQuery(dmdEx.dsClient.DataSet);
  dmdEx.OpenQuery(dmdEx.dsManager.DataSet);
  dmdEx.OpenQuery(dmdEx.dsBank.DataSet);
  dmdEx.OpenQuery(dmdEx.dsPost.DataSet);
  dmdEx.OpenQuery(dmdEx.dsAllClient.DataSet);
  qeQuery1.DefSql:=sdsPlat.CommandText;
  qeQuery2.DefSql:=sdsNaklr.CommandText;
  setT := TfrmSettings.create (self);
  FillSettings;
  ProcessSettings(true);

//  frmEdit := TfrmPlategyVxodEdit.Create(self);
//  frmEdit.dsNakloEdit.DataSet := cdsNaklo;
end;
{
procedure TfrmPrixMain.DefaultOpen;
begin
  dmdEx.startWaiting;
//  qeQuery2.refresh;
  qeQuery1.Refresh;
  qeQuery2.Refresh(false);
  dmdEx.stopWaiting;
end;
}

function TfrmPlategyVxod.DefaultOpen:boolean;
begin
  ProcessSettings;
  Result:=DefaultOpenInputForm(qeQuery1);
  qeQuery2.Refresh(false);
  qurQuery2.First;
end;

procedure TfrmPlategyVxod.cdsNakloAfterInsert(DataSet: TDataSet);
begin
  udgGrid1.SelectedIndex:=0;
  Dataset.FieldByName('id_nakl').AsInteger :=
    dmdEx.GetGenValue('naklo_gen');
  Dataset.FieldByName('dat').AsDateTime := setT.DateTo;
  Dataset.FieldByName('id').AsInteger :=
    dmdEx.GetGenValue('oplaty_gen');
  DataSet.FieldByName('nds').asFloat := 0;
  DataSet.FieldByName('posted').asInteger := 0;
  DataSet.FieldByName('id_sklad_to').asInteger :=
    dsXozOper.Dataset.Lookup('name','ОПЛАТА ПОКУПАТЕЛЕМ ТОВАРОВ','oid');
  //ShowDetail1;
end;

procedure TfrmPlategyVxod.cdsNakloBeforePost(DataSet: TDataSet);
begin
  if  (DataSet.FieldByName('dat').AsString='') then begin
    showmessage ('Введите дату');
    udgGrid1.SelectedField := DataSet.FieldByName('dat');
    abort;
  end;
  if ((DataSet.FieldByName('dat').AsDateTime<setT.DateFrom) or
    (DataSet.FieldByName('dat').AsDateTime>setT.DateTo)) and
    actSettings.Checked
  then begin
    showmessage ('Введите дату c '+datetostr(setT.dateFrom)+
      ' до '+ datetostr(setT.dateTo));
    udgGrid1.SelectedField := DataSet.FieldByName('dat');
    abort;
  end;
  if  (DataSet.FieldByName('izg').AsString='') then begin
    showmessage ('Введите фирму');
    udgGrid1.SelectedField := DataSet.FieldByName('izg');
    abort;
  end;
  if  (DataSet.FieldByName('bank_from').asString='') then begin
    showmessage ('Введите счёт');
    udgGrid1.SelectedField := DataSet.FieldByName('zak');
    abort;
  end;
  if  (DataSet.FieldByName('zak').asString='') then begin
    showmessage ('Введите клиента');
    udgGrid1.SelectedField := DataSet.FieldByName('zak');
    abort;
  end;
  if  (DataSet.FieldByName('manager2').AsString='') then begin
    showmessage ('Введите менеджера');
    udgGrid1.SelectedField := DataSet.FieldByName('manager2');
    abort;
  end;
  if DataSet.FieldByName('ID_SKLAD_TO').asInteger =
    DataSet.FieldByName('XOZ_OPER').LookupDataSet.Lookup('name','ОПЛАТА ОТ АГЕНТА','oid')
  then begin
    if DataSet.FieldByName('id_currency_to').IsNull then begin
      showmessage ('Введите агента');
      udgGrid1.SelectedField := DataSet.FieldByName('currency_to');
      abort;
    end;
  end;

  DataSet.FieldByName('NDS').AsFloat :=
    RRoundTo(DataSet.FieldByName('NDS').AsFloat,-2);
{
  if (qurQuery1.FieldByName('id_manager').asString='') then begin
    showmessage ('Введите менеджера в поле ''Чья предоплата''');
    udgGrid1.SelectedField := qurQuery1.FieldByName('id_manager');
    abort;
  end;
}
end;

procedure TfrmPlategyVxod.cdsNakloBeforeScroll(DataSet: TDataSet);
begin
  ApplyOrCancel(DataSet);
  qeQuery2.SavePosition;
end;

procedure TfrmPlategyVxod.FormDestroy(Sender: TObject);
begin
  dmdEx.CloseQuery(dmdEx.cdsVlad,false);
  dmdEx.CloseQuery(dmdEx.cdsClient,false);
  dmdEx.CloseQuery(dmdEx.cdsManager,false);
  dmdEx.CloseQuery(dmdEx.cdsBank,false);
  dmdEx.CloseQuery(dmdEx.dsPost.DataSet,false);
  dmdEx.CloseQuery(dmdEx.dsAllClient.DataSet,false);
  setT.Free;
end;


procedure TfrmPlategyVxod.ulbListBox1Exit(Sender: TObject);
begin
  LookupBoxExitCancel (ulbListBox1, udgGrid1, Rect1);
end;

procedure TfrmPlategyVxod.ulbListBox1DblClick(Sender: TObject);
begin
  LookupBoxExitOkEh (ulbListBox1 , udgGrid1, Rect1);
  actPostIf.Execute;
end;

procedure TfrmPlategyVxod.actGrid1ListShowExecute(Sender: TObject);
begin

  if (udgGrid1.SelectedField.FieldName ='IZG') then begin
    Rect1:=LookupBoxEnterEh (ulbListBox1, udgGrid1, dmdEx.dsVlad, 70);
  end; 
  if  (udgGrid1.SelectedField.FieldName ='ZAK') then begin
    if cdsNaklo.FieldByName('id_sklad_to').asInteger =
      dsXozOper.Dataset.Lookup('name','ВОЗВРАТ ОТ ПОСТАВЩИКА','oid')
    then begin
      //для возврата поставщики
      Rect1:= LookupBoxEnterEh (ulbListBox1, udgGrid1, dmdEx.dsPost, 70);
    end else begin
      //по умолчанию клиенты
      Rect1:= LookupBoxEnterEh (ulbListBox1, udgGrid1, dmdEx.dsClient, 70);
    end;
  end;
  if (udgGrid1.SelectedField.FieldName = 'MANAGER2') then begin
    Rect1:= LookupBoxEnterEh (ulbListBox1, udgGrid1, dmdEx.dsManager,70);
  end;
  if (udgGrid1.SelectedField.FieldName ='BANK_FROM') then begin
    if cdsNaklo.FieldByName('izg').IsNull then begin
      showmessage ('Введите отправителя');
    end else  begin
      SetDatasetCommandText(
        dsTemp.DataSet,
        'select b.fullname,b.oid from bank_vw b '+
        ' where b.delmarked=0 and b.id_klient='+
        cdsNaklo.FieldByName('id_izg').asString+
        ' order by b.fullname');
      Rect1:= LookupBoxEnterEh (ulbListBox1, udgGrid1, dsTemp, 70);
    end;
  end; //izg
  if (udgGrid1.SelectedField.FieldName = 'XOZ_OPER') then begin
    Rect1:= LookupBoxEnterEh (ulbListBox1, udgGrid1, dsXozOper,70);
  end;
  if (udgGrid1.SelectedField.FieldName = 'AGENT') then begin
    Rect1:= LookupBoxEnterEh (ulbListBox1, udgGrid1, dmdEx.dsAgent,70);
  end;
{
  if (cdsNaklo.FieldByName('ID_NAKL').AsInteger = 0) then  begin
    cdsNaklo.Insert;
  end
  else begin
    if (frmEdit.Visible = false) then begin
      cdsNaklo.Edit;
      //ShowDetail1;
    end;
  end;
}
end;

procedure TfrmPlategyVxod.udgGrid1DblClick(Sender: TObject);
begin
  actGrid1ListShow.Execute;
end;

procedure TfrmPlategyVxod.actClearOplatyExecute(Sender: TObject);
begin
  stpClearTransh.ParamByName('type1').AsInteger := 1;
  stpClearTransh.ParamByName('id1').AsInteger :=
    cdsNaklo.fieldbyname('id_nakl').AsInteger;
//  stpClearTransh.ParamByName('what_id').AsInteger :=4;
  try
    dmdEx.ExecSQL(stpClearTransh,false);
  except
    on E:EDatabaseError do begin
      if AnsiStartsText('no permission', e.message) then begin
        MessageDlg ('Только бухгалтерия имеет право сбрасывать платежи',mtWarning,[mbOK],0);
      end
      else begin
        showmessage (e.message);
      end; //if
    end;
  end;
end;

procedure TfrmPlategyVxod.udgGrid1ColEnter(Sender: TObject);
begin
  {if udgGrid1.SelectedField.FieldName = 'NDS' then begin
    if udgGrid1.DataSource.DataSet.State <> dsBrowse then begin
      udgGrid1.DataSource.DataSet.Post;
    end;
  end;}
end;

procedure TfrmPlategyVxod.actPostIfExecute(Sender: TObject);
var
  strSql : string;
begin
  if (udgGrid1.SelectedField.FieldName='IZG') then begin
    strSql := ' where b.id_klient='+cdsNaklo.FieldByName('id_izg').asString;
    strSql := 'select b.bank_name,b.oid from bank_vw b '+
      strSql+
      ' order by b.bank_name';
    cdsTemp.Close;
    cdsTemp.CommandText := strSql;
    cdsTemp.Open;
    if (cdsTemp.RecordCount=1) then begin
      cdsNaklo.FieldByName('id_sklad').asInteger:=
        cdsTemp.FieldByName('oid').asInteger;
    end else begin
      cdsNaklo.FieldByName('id_sklad').clear;
    end;
    cdsTemp.Close;
    //exit;
  end;
  if  (cdsNaklo.FieldByName('dat').AsString='') then begin
    exit;
  end;
  if  (cdsNaklo.FieldByName('izg').AsString='') then begin
    exit;
  end;
  if  (cdsNaklo.FieldByName('bank_from').isNull) then begin
    exit;
  end;
  if  (cdsNaklo.FieldByName('zak').asString='') then begin
    exit;
  end;

  if cdsNaklo.State <> dsBrowse then begin

    cdsNakloAfterScroll (cdsNaklo);
  end;
end;

procedure TfrmPlategyVxod.actRefreshExecute(Sender: TObject);
begin
  dmdex.startWaiting;
  //ProcessSettings;
  //DefaultOpen;
  qeQuery1.Refresh;
  qeQuery2.Refresh;
  qeQuery2.Query.First;
  dmdEx.stopWaiting;
end;

procedure TfrmPlategyVxod.actShowDetExecute(Sender: TObject);
var
  frmPrixDet : TfrmPrixDet;
begin
  frmPrixDet := TfrmPrixDet.Create (Self);
  frmPrixDet.SetSql('t.tip<>1');
  frmPrixDet.ShowDet(
    cdsNaklo.FieldByName('id_nakl').AsInteger,
    qurQuery2.FieldByName('id_nakl').AsInteger
  );
end;

procedure TfrmPlategyVxod.actSettingsExecute(Sender: TObject); 
begin
  actApply.Execute;
  actSettings.checked := setT.ProcessSettingsChange2(DefaultOpen);
  //actSettings.checked := setT.ProcessSettingsChange(actRefresh);
end;

procedure TfrmPlategyVxod.actItogoExecute(Sender: TObject);
var
  curSum : currency;
begin
  qeQuery1.SavePosition;
  cdsNaklo.DisableControls;
  qurQuery2.DisableControls;
  cdsNaklo.First;
  curSum := 0;
  while not cdsNaklo.Eof do begin
    curSum := curSum + cdsNaklo.FieldByName('nds').asCurrency;
    cdsNaklo.Next;
  end;
  qurQuery2.EnableControls;
  cdsNaklo.EnableControls;
  qeQuery1.GetPosition;
  ShowMessage ('Сумма платежей : '+ Format ('%8.2f',[curSum]));

end;

//////////////////////////////////////////////////////////
//appling changes
procedure TfrmPlategyVxod.actApplyExecute(Sender: TObject);
begin
  actApply.Checked := false;
  if PostAndApply(cdsNaklo)=0 then begin
    if PostAndApply(qurQuery2)=0 then begin
      actApply.Checked := true;
    end;
  end;
end;

procedure TfrmPlategyVxod.cdsNakloReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  showmessage(e.Message);
  Action := raAbort;
end;

procedure TfrmPlategyVxod.qurQuery2ReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  showmessage(e.Message);
  Action := raAbort;
end;

procedure TfrmPlategyVxod.qurQuery1AfterDelete(DataSet: TDataSet);
begin
  ApplyOrCancel(DataSet);
end;

procedure TfrmPlategyVxod.actRefreshRecordExecute(Sender: TObject);
begin
  cdsNaklo.refreshrecord;
end;

procedure TfrmPlategyVxod.cdsNakloAfterScroll(DataSet: TDataSet);
begin
  qurQuery2.Close;
  qurQuery2.Params.ParamByName('id_izg').AsInteger :=
    DataSet.FieldByName('id_izg').AsInteger;
  qurQuery2.Params.ParamByName('id_zak').asInteger :=
    DataSet.FieldByName('id_zak').asinteger;

  if (cdsNaklo.FieldByName('id_sklad_to').asInteger=FiXozOperFinUsl) then begin
    qurQuery2.Params.ParamByName('tip_rasx').asInteger := FiTipRasxFinUsl;
    qeQuery2.SetSQL('where','n.id_sklad_to<>-52',0);      ///РАСХОДНАЯ НА УСЛУГИ ФАКТ ЧАСТЬ
  end else begin
  if (cdsNaklo.FieldByName('id_sklad_to').asInteger=FiXozOperUsl) then begin
    qurQuery2.Params.ParamByName('tip_rasx').asInteger := FiTipRasxUsl;
    qeQuery2.SetSQL('where','n.id_sklad_to<>-52',0);      ///РАСХОДНАЯ НА УСЛУГИ ФАКТ ЧАСТЬ
  end else begin
    qeQuery2.SetSQL('where','',0);
    qurQuery2.Params.ParamByName('tip_rasx').asInteger := FiTipRasx;
  end;
  end;
  qeQuery2.Prepare;  
  qurQuery2.Open;
  qeQuery2.GetPosition(False);
  //Если ранее была ошибка ввода и исключение прервало установку флага в 0,
  //то после перехода на соседнюю запись детализация опять должна открываться
//  cdsNaklo.Tag :=0;
end;

procedure TfrmPlategyVxod.dspPlatGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
  TableName:='OPLATY_VW';
end;


procedure TfrmPlategyVxod.dspPlatBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
begin
  if (ukDelete=UpdateKind) and (SourceDS.name='sdsPlat') then begin
    Applied:=false;
    sdsDelmark.ParamByName('id_nakl').AsInteger:=
      DeltaDS.fieldByName('id_nakl').asInteger;
    dmdEx.ExecSQL(sdsDelmark);
    Applied:=true;
  end;
end;

procedure TfrmPlategyVxod.ProcessPrix;
var
  strUkk : string;
  sTemp : string;
begin
  strUkk := setT.GetPluginResult('fmSettingsTipDetail1');
  if (strUkk='0') then begin
    sTemp :='';
  end;
  if (strUkk='1') then begin
    //Неуехавшие
    sTemp := 'Round(nds-z((select sum(t.transh) from oplnakl t  where t.id_from=om.id_nakl)),2)<>0';
  end;
  qeQuery1.SetSql('where',sTemp,6);
end;

procedure TfrmPlategyVxod.ProcessNaklr;
var
  strUkk,sTemp : string;
  iMode: integer;
begin
  strUkk := setT.GetPluginResult('fmSettingsTipDetail2');
  iMode := strtoint(strUkk);
  case iMode of  
    0: begin
      sTemp :='';
    end;
    1: begin
      sTemp :='Round(n.nds-z(sum(t.transh)),2)<>0';
    end;
  end;//case
  qeQuery2.SetSql('having',sTemp,0);
end;



procedure TfrmPlategyVxod.ProcessSettings(ProcessOnlySecurityMeasures:boolean=false);
begin
  ProcessSettingsVladClientManager(qeQuery1,setT,ProcessOnlySecurityMeasures);
  ProcessPrix;
  ProcessNaklr;
  if not ProcessOnlySecurityMeasures then begin
    self.Caption := UpdateCaptionVladClientManager('Платежи:',setT);
  end;
end;

procedure TfrmPlategyVxod.actShowNaklrExecute(Sender: TObject);
begin
  if dtsSource2.DataSet.Eof and dtsSource2.DataSet.Bof then begin
     exit;
  end;
  OpenDocument(self,
    dtsSource2.DataSet.FieldByName('id_nakl').asInteger,
    0,
    0);
end;

procedure TfrmPlategyVxod.actDebugExecute(Sender: TObject);
begin
  actDebug.Checked := not actDebug.Checked;
  if actDebug.Checked then begin
    columnByName(udgGrid1.Columns,'ID_NAKL').Visible :=true;
  end else begin //if actDebug.Checked
    columnByName(udgGrid1.Columns,'ID_NAKL').Visible :=false;
  end; //if actDebug.Checked
end;

procedure TfrmPlategyVxod.ShowForBuxgAndPoweruser;
begin
  if ((dmdEx.getrole='POWER_USER')
    or (dmdEx.GetUser='SYSDBA'))
  then begin
    ColumnByName(udgGrid1.Columns,'AGENT').Visible := true;
    ColumnByName(udgGrid1.Columns,'XOZ_OPER').Visible := true;
    ColumnByName(udgGrid1.Columns,'NDS_FROM').Visible := true;
    ColumnByName(udgGrid1.Columns,'ZATRATY').Visible := true;
  end else begin
    if ((dmdEx.getrole='POWER_USER') or (dmdEx.getrole='BUXG')
      or (dmdEx.GetUser='SYSDBA'))
    then begin
      ColumnByName(udgGrid1.Columns,'XOZ_OPER').Visible := true;
      ColumnByName(udgGrid1.Columns,'AGENT').Visible := true;
      ColumnByName(udgGrid1.Columns,'ZATRATY').Visible := true;
      ColumnByName(udgGrid1.Columns,'NDS_FROM').Visible := true;
    end else begin
      ColumnByName(udgGrid1.Columns,'AGENT').Visible := false;
      ColumnByName(udgGrid1.Columns,'ZATRATY').Visible := false;
      ColumnByName(udgGrid1.Columns,'XOZ_OPER').Visible := false;
      ColumnByName(udgGrid1.Columns,'NDS_FROM').Visible := false;
    end;
  end;
end;

procedure TfrmPlategyVxod.FillSettings;
begin
  setT.actDataOnly.Execute;
  SettingsVlad := setT.CreatePlugin('TfmSettingsVlad');
  SettingsVlad.SetResultType(2);
  setT.AddPlugin(SettingsVlad);
  SettingsClient := setT.CreatePlugin('TfmSettingsClient');
  setT.AddPlugin(SettingsClient);

  SettingsManager := setT.CreatePlugin('TfmSettingsManager');
  setT.AddPlugin(settingsManager);
  //менеджеры из зоны видимости
  SettingsManager.SetResultType(2);

  SettingsTipDetail1 := setT.CreatePlugin('TfmSettingsTipDetail');
  SettingsTipDetail1.Name := 'fmSettingsTipDetail1';
  SettingsTipDetail1.SetLabelValue('Тип платежей');
  setT.addplugin(SettingsTipDetail1);
  SettingsTipDetail1.AddDetailTip('Все платежи');
  SettingsTipDetail1.AddDetailTip('Непотраченные платежи');
  SettingsTipDetail1.SetKeyValue(0);

  SettingsTipDetail2 := setT.CreatePlugin('TfmSettingsTipDetail');
  SettingsTipDetail2.Name := 'fmSettingsTipDetail2';
  SettingsTipDetail2.SetLabelValue('Тип накладных');
  setT.addplugin(SettingsTipDetail2);
  SettingsTipDetail2.AddDetailTip('Все накладные');
  SettingsTipDetail2.AddDetailTip('Неоплаченные накладные');
  SettingsTipDetail2.SetKeyValue(0);

  ShowForBuxgAndPoweruser;
  FillOidObjects;
end;

procedure TfrmPlategyVxod.FillOidObjects;
var
  iXozOper : integer;
begin
  FiTipRasx := dmdEx.GetOidObjects('РАСХОДНЫЕ НАКЛАДНЫЕ',-100);
  FiTipRasxUsl := dmdEx.GetOidObjects('РАСХОДНЫЕ НАКЛАДНЫЕ НА УСЛУГИ',-100);
  FiTipRasxFinUsl := dmdEx.GetOidObjects('РАСХОДНЫЕ НАКЛАДНЫЕ НА ФИНУСЛУГИ',-100);

  iXozOper := dmdEx.GetOidObjects('ХОЗЯЙСТВЕННЫЕ ОПЕРАЦИИ',-100);
  FiXozOperUsl := dmdEx.GetOidObjects('ОПЛАТА ПОКУПАТЕЛЕМ УСЛУГ', iXozOper);
  FiXozOperFinUsl := dmdEx.GetOidObjects('ОПЛАТА ПОКУПАТЕЛЕМ ФИНУСЛУГ', iXozOper);
end;


procedure TfrmPlategyVxod.cdsNakloNDS_FROMChange(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    if Sender.DataSet.FieldByName('nds').AsFloat<>0 then begin
      Sender.DataSet.FieldByName('zatraty').Value :=
        Sender.newvalue/Sender.DataSet.FieldByName('nds').AsFloat*100;
    end else begin
      Sender.DataSet.FieldByName('zatraty').Value :=0
    end;
    Semaphore := false;
  end;  //if not Semaphore
end;

procedure TfrmPlategyVxod.cdsNakloZATRATYChange(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    Sender.DataSet.FieldByName('nds_from').Value :=
      Sender.newvalue/100*Sender.DataSet.FieldByName('nds').AsFloat;
    Semaphore := false;
  end;
end;



procedure TfrmPlategyVxod.cdsNakloOPLChange(Sender: TField);
begin
  if not Semaphore then begin
    //при незаполненной комиссии считать сумму комиссии не надо
    if Sender.DataSet.FieldByName('zatraty').AsFloat<>0 then begin
      Semaphore := true;
      Sender.DataSet.FieldByName('nds_from').Value :=
        Sender.DataSet.FieldByName('zatraty').AsFloat/100*Sender.newvalue;
      Semaphore := false;
    end 
  end;
end;

procedure TfrmPlategyVxod.Test;
begin
  TestInsert;
end;


procedure TfrmPlategyVxod.TestInsert;
begin
  try
    DefaultStartup;
    if not DefaultOpen then begin
      AssertInternal('A9142085-4063-4823-9354-7281AFAD5A3D');
    end;
    with cdsNaklo do begin
      Tag:=1;
      Insert;
      FieldByName('id_izg').asInteger :=
        dmdEx.cdsClient.Lookup('name','нал','id');
      FieldByName('id_sklad').asInteger :=
        dmdEx.cdsBank.Lookup('fullname','нал счёт','oid');
      FieldByName('id_zak').asInteger :=
        dmdEx.cdsClient.Lookup('name','нал','id');
      FieldByName('id_manager').AsInteger :=
        dmdEx.cdsManager.Lookup('name','Тест','id');
      Post;
      Tag:=0;
      ApplyUpdates(0);
    end;
    cdsNaklo.Delete;
    PostAndApply(cdsNaklo);
  finally
    cdsNaklo.Tag :=0;
  end;
end;

procedure TfrmPlategyVxod.DefaultStartup;
begin
try
  setT.IDManager:=0; // all
  setT.SetPeriod(2);
except
  AssertInternal('4F8E7019-83BC-4C25-924E-9740CBFBE160');
end;
end;

procedure TfrmPlategyVxod.udgGrid2DblClick(Sender: TObject);
begin
  actShowNaklr.Execute;
end;

function TfrmPlategyVxod.GetTipForMakeTransh: integer;
begin
  if (cdsNaklo.FieldByName('id_sklad_to').asInteger=FiXozOperFinUsl) then begin
    result := 4;
  end else begin
    if (cdsNaklo.FieldByName('id_sklad_to').asInteger=FiXozOperUsl) then begin
      result := 3;
    end else begin
      result := 2;
    end;
  end;
end;

procedure TfrmPlategyVxod.actFinanceFinuslExecute(Sender: TObject);
begin
  CreateFinNakl(sdsFinTranshFinusl);
end;

procedure TfrmPlategyVxod.actFinanceArendaExecute(Sender: TObject);
begin
  CreateFinNakl(sdsFinTranshArenda);
end;

procedure TfrmPlategyVxod.actFinanceExecute(Sender: TObject);
begin
  CreateFinNakl(sdsFinTransh);
end;

//создаёт документ под остаток оплаты. Используется для
//быстрого получения расходных накладных
procedure TfrmPlategyVxod.CreateFinNakl(sdsFinTranshUsl :TSqlDataSet);
begin
  qeQuery1.Refresh;
  if (cdsNaklo.FieldByName('ostatok').AsCurrency<>0) then begin
    sdsFinTranshUsl.ParamByName('id').AsInteger :=
      cdsNaklo.FieldbyName('id_nakl').AsInteger;
    dmdEx.execsql(sdsFinTranshFinusl);
    OpenDocument(self,sdsFinTranshFinusl.ParamByName('id_nakl').AsInteger,0,0);
    qeQuery1.Refresh;
    qeQuery2.Refresh;
  end else begin  //if
    showmessage ('Остаток платежа = 0, нечем оплачивать.');
  end; //if
end;

end.
