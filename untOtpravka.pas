unit untOtpravka;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEx, FMTBcd, ActnList, Menus, Grids, DBGridEh, DB, DBClient,
  Provider, SqlExpr, StdCtrls, ExtCtrls, QueryExtender,
  untSklostDet,
  atsAssert,
  Buttons,
  untNakloSelect,
  Registry, ComCtrls, //TRegIniFile
  DateUtils, //startofthemonth
  Mask, DBCtrlsEh, DBLookupEh, PropStorageEh, UnfFilter, PropFilerEh,
   GridsEh,
  frxClass, frxDBSet,
  untOtpravkaEdit,  // TfrmOtpravkaEdit
  untOtpravkatEdit, //TfrmOtpravkatEdit
  untRound,
  untSettings, //TfrmSettings
  StrUtils, frxExportImage //AnsiStartsText

    ;

type
  TfrmOtpravka = class(TForm)
    sdsSklost: TSQLDataSet;
    sdsSklostt: TSQLDataSet;
    dspSklost: TDataSetProvider;
    dspSklostt: TDataSetProvider;
    cdsSklost: TClientDataSet;
    cdsSklostt: TClientDataSet;
    dsSklost: TDataSource;
    dsSklostt: TDataSource;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    mnuRefresh: TMenuItem;
    ActionList1: TActionList;
    actRefresh: TAction;
    qeSklostt: TQueryExtender;
    actRecalcPosit: TAction;
    actDetail: TAction;
    actSettings: TAction;
    qeSklost: TQueryExtender;
    Panel1: TPanel;
    dbgSklost: TDBGridEh;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    btnSettings: TBitBtn;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    PopSklost: TPopupMenu;
    actCopy: TAction;
    ufSklost: TUnfFilter;
    actPrint: TAction;
    N3: TMenuItem;
    N4: TMenuItem;
    actGrid1ListShow: TAction;
    cdsSklostID_NAKL: TIntegerField;
    cdsSklostID: TStringField;
    cdsSklostDAT: TSQLTimeStampField;
    cdsSklostCOMMENT: TStringField;
    cdsSklostDELMARKED: TSmallintField;
    cdsSklostID_SKLAD: TIntegerField;
    cdsSklostSKLAD: TStringField;
    sdsSklostID_NAKL: TIntegerField;
    sdsSklostID: TStringField;
    sdsSklostDAT: TSQLTimeStampField;
    sdsSklostCOMMENT: TStringField;
    sdsSklostDELMARKED: TSmallintField;
    sdsSklostID_SKLAD: TIntegerField;
    Splitter1: TSplitter;
    Panel3: TPanel;
    dbgGrid2: TDBGridEh;
    actGrid2ListShow: TAction;
    cdsSklosttID_NAKL: TIntegerField;
    cdsSklosttID_NAKLD: TIntegerField;
    cdsSklosttID_POS: TIntegerField;
    sdsDelmark: TSQLDataSet;
    dspReport: TDataSetProvider;
    cdsReport: TClientDataSet;
    sdsReport: TSQLDataSet;
    cdsReportID_ZAK: TIntegerField;
    cdsReportID_TOVAR: TIntegerField;
    cdsReportID_TARA: TIntegerField;
    cdsReportNOMER_TARY: TStringField;
    cdsReportKOLOTP: TFMTBCDField;
    cdsReportKOLBUXT: TIntegerField;
    cdsReportTIP: TIntegerField;
    cdsReportKOLOTP_ITOG: TFMTBCDField;
    cdsReportID_TARA_ITOG: TIntegerField;
    cdsReportNOMER_TARY_ITOG: TStringField;
    cdsReportTOVAR: TStringField;
    cdsReportEDIZ: TStringField;
    cdsReportTARA: TStringField;
    cdsReportTARA_ITOG: TStringField;
    frdsReport: TfrxDBDataset;
    cdsReportID_IZG_ITOG: TIntegerField;
    cdsReportIZG_ITOG: TStringField;
    cdsSklosttID_IZG: TIntegerField;
    cdsSklosttID_ZAK: TIntegerField;
    cdsSklosttID_MANAGER: TIntegerField;
    cdsSklosttIZG: TStringField;
    cdsSklosttZAK: TStringField;
    cdsSklosttMANAGER: TStringField;
    cdsSklosttDAT: TSQLTimeStampField;
    cdsSklosttID: TStringField;
    cdsSklosttBLOCKED: TSmallintField;
    sdsSklosttID_NAKL: TIntegerField;
    sdsSklosttID_NAKLD: TIntegerField;
    sdsSklosttID_POS: TIntegerField;
    sdsSklosttID: TStringField;
    sdsSklosttDAT: TSQLTimeStampField;
    sdsSklosttID_IZG: TIntegerField;
    sdsSklosttID_ZAK: TIntegerField;
    sdsSklosttID_MANAGER: TIntegerField;
    sdsSklosttBLOCKED: TSmallintField;
    BitBtn3: TBitBtn;
    N5: TMenuItem;
    N6: TMenuItem;
    N2: TMenuItem;
    actPrintAct: TAction;
    dbcClientSelect: TDBComboBoxEh;
    BitBtn4: TBitBtn;
    sdsReportAct: TSQLDataSet;
    dspReportAct: TDataSetProvider;
    cdsReportAct: TClientDataSet;
    cdsReportActID_ZAK: TIntegerField;
    cdsReportActID_TOVAR: TIntegerField;
    cdsReportActID_TARA: TIntegerField;
    cdsReportActNOMER_TARY: TStringField;
    cdsReportActKOLOTP: TFMTBCDField;
    cdsReportActKOLBUXT: TIntegerField;
    cdsReportActTIP: TIntegerField;
    cdsReportActKOLOTP_ITOG: TFMTBCDField;
    cdsReportActID_TARA_ITOG: TIntegerField;
    cdsReportActNOMER_TARY_ITOG: TStringField;
    cdsReportActID_IZG_ITOG: TIntegerField;
    frReportAct: TfrxReport;
    frdsReportAct: TfrxDBDataset;
    cdsReportActTOVAR: TStringField;
    cdsReportActEDIZ: TStringField;
    cdsReportActTARA: TStringField;
    cdsReportActTARA_ITOG: TStringField;
    cdsReportActIZG_ITOG: TStringField;
    BitBtn5: TBitBtn;
    actPost: TAction;
    sdsSklosttPOSTED: TSmallintField;
    cdsSklosttPOSTED: TSmallintField;
    sdsPost: TSQLDataSet;
    BitBtn6: TBitBtn;
    actUnPost: TAction;
    sdsUnpost: TSQLDataSet;
    popSklostt: TPopupMenu;
    N7: TMenuItem;
    actGrid2ListShow1: TMenuItem;
    cdsReportCOMMENT: TStringField;
    cdsReportActCOMMENT: TStringField;
    frdNaklo: TfrxDBDataset;
    frdNaklot: TfrxDBDataset;
    cdsReportPRIM: TStringField;
    cdsReportTIP2: TStringField;
    frReport: TfrxReport;
    cdsReportActPRIM: TStringField;
    cdsReportActTIP2: TStringField;
    cdsReportActZAK: TStringField;
    cdsReportZAK: TStringField;
    frxGIFExport1: TfrxGIFExport;
    sdsSklosttNDS: TFMTBCDField;
    cdsSklosttNDS: TFMTBCDField;
    ufSklostt: TUnfFilter;
    actDebug: TAction;
    N8: TMenuItem;
    procedure actRefreshExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure actSettingsExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure dspSklostBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure cdsSklostAfterInsert(DataSet: TDataSet);
    procedure actGrid1ListShowExecute(Sender: TObject);
    procedure dbgSklostKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgSklostDblClick(Sender: TObject);
    procedure dbgGrid2DblClick(Sender: TObject);
    procedure actGrid2ListShowExecute(Sender: TObject);
    procedure cdsSklosttAfterInsert(DataSet: TDataSet);
    procedure dbgGrid2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dspSklosttBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure actPrintActExecute(Sender: TObject);
    procedure dbcClientSelectDropDown(Sender: TObject);
    procedure cdsSklostBeforeScroll(DataSet: TDataSet);
    procedure actPostExecute(Sender: TObject);
    procedure actUnPostExecute(Sender: TObject);
    procedure actDetailExecute(Sender: TObject);
    procedure cdsSklosttReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsSklostReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure actDebugExecute(Sender: TObject);

  private
    { Private declarations }
    FIdNakl : integer;
    frmOtpravkaEdit : TfrmOtpravkaEdit;
    frmOtpravkatEdit : TfrmOtpravkatEdit;
    //все позиции, не пустые, отчёт на дату
    procedure ProcessSettings;
    procedure ShowGridEdit1;
    procedure ClearClientSelect;
  public
    { Public declarations }
    setT : TfrmSettings;
  end;

var
  frmOtpravka: TfrmOtpravka;

implementation

uses
  SkladAux, //opendocument
  DesignReport //ProcessReportDesigner
;

{$R *.dfm}

procedure TfrmOtpravka.actRefreshExecute(Sender: TObject);
begin
try
  dmdEx.StartWaiting;
  ProcessSettings;
  qeSklost.Refresh;
  //cdsSklost.Last;
  //qeSklost.Refresh;
  dmdEx.StopWaiting;
except
  AssertInternal('16979CB7-FAC3-4419-8DF9-7003DBD02045');
end;
end;

procedure TfrmOtpravka.FormClose(Sender: TObject; var Action: TCloseAction);
var
//  save grid
  reg1 :TRegIniFile;
begin
  reg1 := TRegIniFile.Create('Software\Eurosystems\Uchet');
  dbgGrid2.SaveColumnsLayout(reg1);
  dbgSklost.SaveColumnsLayout(reg1);
  reg1.Free;
  //end save grid
  //apply before close, on error select (abort, continue)
  cdsSklostt.close;
  cdsSklost.close;
  setT.Free;
  Action := caFree;
end;

procedure TfrmOtpravka.FormCreate(Sender: TObject);
var
  reg1 :TRegIniFile;
  col1 :TColumnEhRestoreParams;
begin
  //restore grid
  reg1 := TRegIniFile.Create('Software\Eurosystems\Uchet');
  col1 := [crpColWidthsEh];
  dbgGrid2.RestoreColumnsLayout(reg1,col1);
  dbgSklost.RestoreColumnsLayout(reg1,col1);
  reg1.Free;
  //end restore grid
  dmdEx.StartWaiting;
  dmdEx.OpenQuery(dmdEx.cdsAllClient);
  dmdEx.OpenQuery(dmdEx.cdsSklads);
  dmdEx.OpenQuery(dmdEx.cdsTovar);
  dmdEx.OpenQuery(dmdEx.cdsTara);
  FIdNakl := -1;

  qeSklost.DefSql := sdsSklost.CommandText;
  setT := TfrmSettings.Create(self);
  //setT.IDManager:=0; // all
  setT.actManagerOff.Execute;
  setT.SetPeriod(2); //ровно месяц
  ProcessSettings;
  qeSklost.Prepare;
  cdsSklost.Open;
  cdsSklost.Last;
  cdsSklostt.Open;

  frmOtpravkaEdit := TfrmOtpravkaEdit.Create(self);
  frmOtpravkaEdit.dsNakloEdit.dataset := cdsSklost;
  frmOtpravkatEdit := TfrmOtpravkatEdit.Create(self);
  frmOtpravkatEdit.dsNakloEdit.dataset := cdsSklostt;
  ProcessReportDesigner(ActionList1,MainMenu1,frReport);
  ProcessReportDesigner(ActionList1,MainMenu1,frReportAct);
//  cdsSklost.Open;
//  cdsSklostt.Open;



  dmdEx.StopWaiting;
end;

procedure TfrmOtpravka.ProcessSettings;
begin
    self.Caption :='Отправки со склада. '
      + 'Период: c ' + datetostr (setT.DateFrom)
      + ' по '+ datetostr(setT.DateTo)+'.';
    qeSklost.SetSQL('where',
      'om.dat>='+ QuotedStr(datetostr(setT.DateFrom)),0);
    qeSklost.SetSQL('where',
      'om.dat<='+ QuotedStr(datetostr(setT.DateTo))  ,1);
    qeSklost.Prepare;
end;

procedure TfrmOtpravka.actSettingsExecute(Sender: TObject);
begin
  actSettings.checked := setT.ProcessSettingsChange(actRefresh);
end;

procedure TfrmOtpravka.actPrintExecute(Sender: TObject);
begin
try
  dmdEx.startWaiting;
  sdsReport.close;
  cdsReport.Close;
  cdsReport.Params.ParamByName('id_nakl').AsInteger :=
    dsSklost.DataSet.FieldByName('id_nakl').asInteger;
  dmdEx.OpenQuery(cdsReport);
  dmdex.stopwaiting;
  dmdEx.GetReport('Otpravka.fr3',frReport);
	frReport.ShowReport;
except
  AssertInternal('0E5224CF-0F62-4A9B-9D1E-FD935E989CDC');
end;
end;

procedure TfrmOtpravka.dspSklostBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
begin
  if (UpdateKind = ukInsert) and (SourceDS = sdsSklost) and
     (DeltaDS.FieldByName('id_nakl').NewValue < 0) then
  begin
    DeltaDS.FieldByName('id_nakl').NewValue := dmdEx.GetGenValue('naklo_gen');
  end;

  if (ukDelete=UpdateKind) and (SourceDS=sdsSklost) then begin
    Applied:=false;
    sdsDelmark.ParamByName('oid').AsInteger:=
      DeltaDS.fieldByName('id_nakl').asInteger;
		dmdEx.ExecSQL(sdsDelmark);
    Applied:=true;
  end;
end;

procedure TfrmOtpravka.cdsSklostAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('id_nakl').AsInteger := FIdNakl;
  dec(FIdNakl);
  DataSet.FieldByName('delmarked').AsInteger:=0;
  //склад Укк по умолчанию
  DataSet.FieldByName('id_sklad').asInteger :=0 ;
  DataSet.FieldByName('dat').AsDateTime := Today ;
  ShowGridEdit1;
  //actGrid1ListShow.Execute;
end;

procedure TfrmOtpravka.actGrid1ListShowExecute(Sender: TObject);
begin
try
  if (cdsSklost.FieldByName('ID_NAKL').AsInteger <= 0) then  begin
    cdsSklost.Insert;
  end
  else begin
    cdsSklost.Edit;
    ShowGridEdit1;
  end;
except
  AssertInternal('37F23957-407E-4C6C-B265-F13349D15E89');
end;
end;

procedure TfrmOtpravka.ShowGridEdit1;
begin
  if frmOtpravkaEdit.visible then begin
    frmOtpravkaEdit.Close;
    Exception.Create('Form was already visible');
  end;
  frmOtpravkaEdit.Showmodal;
end;

procedure TfrmOtpravka.dbgSklostKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
		vk_return :begin
      actGrid1ListShow.Execute;
		end;
    vk_f8 : begin
      if (MessageDlg('Вы хотите удалить отправку?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
//      cdsNaklot.CheckBrowseMode;
        if not (cdsSklost.bof and cdsSklost.eof) then begin
          cdsSklost.Delete;
          ApplyOrCancel(cdsSklost);
        end;
      end;//ok
    end; //f8
  end;//case
end;


procedure TfrmOtpravka.dbgSklostDblClick(Sender: TObject);
begin
  actGrid1ListShow.Execute;
end;

procedure TfrmOtpravka.dbgGrid2DblClick(Sender: TObject);
begin
  actGrid2ListShow.Execute;
end;

procedure TfrmOtpravka.actGrid2ListShowExecute(Sender: TObject);
begin
try
  if frmOtpravkatEdit.visible then begin
    frmOtpravkatEdit.Close;
  end;
  frmOtpravkatEdit.showdetail(
    cdsSklost.FieldByName('id_sklad').AsInteger,
    cdsSklost.FieldByName('id_nakl').AsInteger
   );
except
	AssertInternal('CFC2D87F-4730-4AF5-B958-B9EB597C0F97');
end;
end;

procedure TfrmOtpravka.cdsSklosttAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('id_nakld').AsInteger := FIdNakl;
  dec(FIdNakl);
end;

procedure TfrmOtpravka.dbgGrid2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
		vk_return :begin
      actGrid2ListShow.Execute;
		end;
    vk_f8 : begin
      if (MessageDlg('Вы хотите удалить позицию из отправки?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
//      cdsNaklot.CheckBrowseMode;
        if not (cdsSklostt.bof and cdsSklostt.eof) then begin
          cdsSklostt.Delete;
        end;
        PostAndApply(cdsSklostt);
      end;//ok
    end; //f8
  end;//case
end;

procedure TfrmOtpravka.dspSklosttBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
begin
  if (UpdateKind = ukInsert) and (SourceDS = sdsSklostt) and
     (DeltaDS.FieldByName('id_nakld').NewValue < 0) then
  begin
    DeltaDS.FieldByName('id_nakld').NewValue := dmdEx.GetGenValue('naklot_gen');
  end;
end;

procedure TfrmOtpravka.actPrintActExecute(Sender: TObject);
begin
try
  if (dbcClientSelect.ItemIndex>-1) then begin
    dmdEx.StartWaiting;
    sdsReportAct.Close;
    cdsReportAct.Close;
    cdsReportAct.Params.ParamByName('id_nakl').AsInteger :=
      dsSklost.DataSet.FieldByName('id_nakl').asInteger;
    cdsReportAct.Params.ParamByName('id_zak2').AsString :=
      dbcClientSelect.KeyItems.Strings[dbcClientSelect.ItemIndex];
    dmdEx.OpenQuery(cdsReportAct);
    dmdEx.StopWaiting;
    dmdEx.GetReport('OtpravkaAct.fr3',frReportAct);
	  frReportAct.ShowReport;
  end else begin
    MessageDlg('Выберите клиента из списка',mtError,[mbOK],0);
  end;
except
  AssertInternal('2172F83B-0086-4311-98ED-FB35BEAFFCEB');
end;

end;



procedure TfrmOtpravka.dbcClientSelectDropDown(Sender: TObject);
begin
  ClearClientSelect;
  cdsSklostt.DisableControls;
  cdsSklostt.First;
  while (not cdsSklostt.Eof) do begin
    if dbcClientSelect.KeyItems.IndexOf(
     cdsSklostt.FieldByName('id_zak').asString) = -1 then begin
      //добавляем уникальную запись
      dbcClientSelect.Items.Add(cdsSklostt.FieldByName('zak').asString);
      dbcClientSelect.KeyItems.Add(cdsSklostt.FieldByName('id_zak').asString);
    end; //if unique
    cdsSklostt.Next;
  end;//while
  cdsSklostt.EnableControls;
end;

procedure TfrmOtpravka.cdsSklostBeforeScroll(DataSet: TDataSet);
begin
  ClearClientSelect;
end;

procedure TfrmOtpravka.ClearClientSelect;
begin
  dbcClientSelect.Items.Clear;
  dbcClientSelect.KeyItems.Clear;
  dbcClientSelect.Text := '<Выберите клиента>';
end;

procedure TfrmOtpravka.actPostExecute(Sender: TObject);
var
  bAborted : boolean;
begin
  if (MessageDlg('Вы хотите провести отправку со склада?',
		mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then begin
    Exit;
  end;
  cdsSklostt.First;
  bAborted := false;
  while not (cdsSklostt.Eof or bAborted) do begin
  {
    dmdEx.PostNakl(
      TIntegerField(cdsNaklo.FieldByName('posted')),
      sdsPost,
      TIntegerField(cdsSklostt.fieldbyname('id_pos'))
      false);  }

    if cdsSklostt.FieldByName('posted').asInteger = 0 then begin
		  try
			  sdsPost.Params[0].AsInteger :=
				  cdsSklostt.fieldbyname('id_pos').AsInteger;
  			dmdEx.ExecSQL(sdsPost,false);
      except
        on E:EDatabaseError do begin
          bAborted := true;
          if AnsiStartsText('no permission', e.message) then begin
            MessageDlg ('Вы не имеете права проводить накладные',mtWarning,[mbOK],0);
  				end
          else begin
           showmessage (e.message);
          end; //if
        end; //on
      end;  //try
      if bAborted then begin
        if MessageDlg('Несмотря на ошибки продолжить проводить отправку',
         mtConfirmation,mbOKCancel,0)=mrOk then begin
          bAborted:=false;
        end;
      end;//if aborted
    end; //if not posted
    cdsSklostt.Next;
  end; //while
  cdsSklostt.Refresh;
end;

procedure TfrmOtpravka.actUnPostExecute(Sender: TObject);
var
  bAborted : boolean;
begin
  if (MessageDlg('Вы хотите вернуть отгрузку на склад?',
		mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then begin
    Exit;
  end;
  cdsSklostt.First;
  bAborted := false;
  while not (cdsSklostt.Eof or bAborted) do begin
    if cdsSklostt.FieldByName('posted').asInteger = 1 then begin
		  try
			  sdsUnPost.Params[0].AsInteger :=
				  cdsSklostt.fieldbyname('id_pos').AsInteger;
  			dmdEx.ExecSQL(sdsUnPost,false);
      except
        on E:EDatabaseError do begin
          bAborted := true;
          if AnsiStartsText('no permission', e.message) then begin
            MessageDlg ('Вы не имеете права проводить накладные',mtWarning,[mbOK],0);
  				end
          else begin
           showmessage (e.message);
          end; //if
        end; //on
      end;  //try
      if bAborted then begin
        if MessageDlg('Несмотря на ошибки продолжить проводить отправку',mtConfirmation,mbOKCancel,0)=mrOk then begin
          bAborted:=false;
        end;
      end;//if aborted
    end; //if not posted
    cdsSklostt.next;
  end; //while
  cdsSklostt.Refresh;
end;

procedure TfrmOtpravka.actDetailExecute(Sender: TObject);
var
  iTip : integer;
//  frmNaklo : TfrmNaklo;
begin
  iTip := dmdEx.GetOidObjects('ТИП НАКЛАДНЫХ ДЛЯ СКЛАДА',-100);
  iTip := dmdEx.GetOidObjects('Отгрузка',iTip);
  OpenDocument(self,cdsSklostt.FieldByName('id_pos').asInteger,iTip,0);
  {
  frmNaklo := TfrmNaklo.Create(Application);
  frmNaklo.qeNaklo.SetSQL('where','n.id_nakl='+ cdsSklostt.FieldByName('id_pos').asString,0);
  frmNaklo.qeNaklo.Prepare;
  frmNaklo.DefaultOpen;
  }
end;

procedure TfrmOtpravka.cdsSklosttReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  MessageDlg(e.message,mtError,[mbOk],0);
end;

procedure TfrmOtpravka.cdsSklostReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  MessageDlg(e.message,mtError,[mbOk],0);
end;

procedure TfrmOtpravka.actDebugExecute(Sender: TObject);
begin
  actDebug.Checked := not actDebug.Checked;
  if actDebug.Checked then begin
    ColumnByName(dbgSklost.Columns,'ID_NAKL').Visible := true;
  end else begin //if actDebug checked
    ColumnByName(dbgSklost.Columns,'ID_NAKL').Visible := false;
  end;  //if actDebug checked
end;

end.
