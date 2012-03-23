unit NNaklp;
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
  SettingsPlugin,//TfmSettingPlugin
  NNaklpEdit, //TfrmNNaklpEdit
  atsAssert, //AssertInternal
  StrUtils, DBGridEh,
  PropStorageEh, UnfFilter, PropFilerEh, GridsEh //AnsiStartsText
;

type

  TfrmNNaklp = class(TForm)
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    dsNaklo: TDataSource;
    qeNaklot: TQueryExtender;
    actGrid1ListShow: TAction;
    actRefresh: TAction;
    actSettings: TAction;
    actApply: TAction;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    qeNaklo: TQueryExtender;
    dbgNaklo: TDBGridEh;
    actShowDeleted: TAction;
    actUndeleteNakl: TAction;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N3: TMenuItem;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    UnfFilter1: TUnfFilter;
    Button1: TButton;
    Button2: TButton;
    cdsNaklo: TClientDataSet;
    cdsNakloID: TStringField;
    cdsNakloIDI: TIntegerField;
    cdsNakloDAT: TSQLTimeStampField;
    cdsNakloIZG: TStringField;
    cdsNakloZAK: TStringField;
    cdsNakloID_MANAGER: TIntegerField;
    cdsNakloMANAGER: TStringField;
    cdsNakloID_IZG: TIntegerField;
    cdsNakloOPL: TFMTBCDField;
    cdsNakloID_ZAK: TIntegerField;
    sdsNaklo: TSQLDataSet;
    dspNaklo: TDataSetProvider;
    sdsNakloID_NAKL: TIntegerField;
    sdsNakloID: TStringField;
    sdsNakloNDS: TFMTBCDField;
    sdsNakloDAT: TSQLTimeStampField;
    sdsNakloID_IZG: TIntegerField;
    sdsNakloID_ZAK: TIntegerField;
    sdsNakloID_MANAGER: TIntegerField;
    sdsNakloNALOG_NDS: TFMTBCDField;
    sdsNakloDELMARKED: TSmallintField;
    cdsNakloNALOG_NDS: TFMTBCDField;
    cdsNakloDELMARKED: TSmallintField;
    cdsNakloDAT_POLUCH: TSQLTimeStampField;
    sdsTipNNakl: TSQLDataSet;
    dspTipNNakl: TDataSetProvider;
    cdsTipNNakl: TClientDataSet;
    dsTipNNakl: TDataSource;
    actDebug: TAction;
    sdsDelmark: TSQLDataSet;
    sdsNakloDAT_VYPISKI: TSQLTimeStampField;
    sdsNakloVSEGO: TFMTBCDField;
    sdsNakloVSEGONDS: TFMTBCDField;
    sdsNakloTIP: TSmallintField;
    cdsNakloVSEGO: TFMTBCDField;
    cdsNakloVSEGONDS: TFMTBCDField;
    cdsNakloTIP: TSmallintField;
    cdsNakloTIPNAME: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
		procedure cdsNakloAfterInsert(DataSet: TDataSet);
    procedure cdsNakloBeforeScroll(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure actGrid1ListShowExecute(Sender: TObject);
    procedure udgGrid1DblClick(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);

    procedure actSettingsExecute(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
    procedure cdsNakloReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure qurQuery2ReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure dbgNakloDblClick(Sender: TObject);
    procedure actUndeleteNaklExecute(Sender: TObject);
    procedure actShowDeletedExecute(Sender: TObject);
    procedure dbgNakloKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    procedure actDebugExecute(Sender: TObject);
    procedure dspNakloBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);

  private
    setT : TfrmSettings;
    SettingsVlad : TfmSettingsPlugin;
    SettingsPost : TfmSettingsPlugin;
    frmEdit : TfrmNNaklpEdit;
    procedure ShowDetail1;
    procedure ProcessSettings;
    procedure ProcessShowDeleted;
    procedure ProcessFirm;
    procedure ProcessPost;
    procedure ProcessDate;
    procedure UpdateCaption;
  public
    { Public declarations }
    procedure DefaultStartup;
    procedure DefaultOpen;
  end;

var
	frmNNaklp: TfrmNNaklp;

implementation




{$R *.dfm}



procedure TfrmNNaklp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	//если остались неприменённые изменения
	actApply.Execute;
	if not actApply.Checked then begin
		if (MessageDlg('Вы закрыть несмотря на ошибки',mtConfirmation ,
			[mbOk, mbCancel	],0) = mrOk) then begin

		end;
	end;
	Action := caFree;
end;


procedure TfrmNNaklp.FormCreate(Sender: TObject);
begin
	dmdEx.OpenQuery(dmdEx.cdsVlad);
	dmdEx.OpenQuery(dmdEx.cdsClient);
	dmdEx.OpenQuery(dmdEx.cdsManager);
  dmdEx.OpenQuery(cdsTipNNakl);
	qeNaklo.DefSql:=sdsNaklo.CommandText;

	setT := TfrmSettings.create (self);
  setT.actManagerOff.Execute;
  SettingsPost := setT.CreatePlugin('TfmSettingsPost');
  setT.AddPlugin(SettingsPost);
  SettingsVlad := setT.CreatePlugin('TfmSettingsVlad');
  setT.AddPlugin(SettingsVlad);
  SettingsVlad.SetResultType(2);
  SettingsVlad.SetKeyValue(0);
 
  frmEdit := TfrmNNaklpEdit.Create(self);
  frmEdit.dsNakloEdit.DataSet := cdsNaklo;
end;

procedure TfrmNNaklp.DefaultOpen;
begin
	dmdEx.startWaiting;
  qeNaklo.Refresh;
	dmdEx.stopWaiting;
end;

procedure TfrmNNaklp.cdsNakloAfterInsert(DataSet: TDataSet);
begin
	Dataset.FieldByName('id_nakl').AsInteger :=
		dmdEx.GetGenValue('naklo_gen');
  DataSet.FieldByName('nalog_nds').AsFloat :=
    dmdEx.GetNds ( Date );    
  DataSet.FieldByName('nds').asFloat := 0;
  DataSet.FieldByName('delmarked').asInteger := 0;
  ShowDetail1;
end;

procedure TfrmNNaklp.cdsNakloBeforeScroll(DataSet: TDataSet);
begin
	ApplyOrCancel(DataSet);
end;

procedure TfrmNNaklp.FormDestroy(Sender: TObject);
begin
try
  dmdEx.CloseQuery(dmdEx.cdsVlad,false);
  dmdEx.CloseQuery(dmdEx.cdsClient,false);
  dmdEx.CloseQuery(dmdEx.cdsManager,false);
	frmEdit.Free;
  setT.Free;
except
  AssertInternal('56C666AE-A116-45CB-A6FB-6F112B71BB4C');
end;
end;

//обрабатывает выбор пользователем даты и прописывает заголовок

procedure TfrmNNaklp.actGrid1ListShowExecute(Sender: TObject);
begin
  if (cdsNaklo.FieldByName('ID_NAKL').AsInteger = 0) then  begin
    cdsNaklo.Insert;
  end
  else begin
    if (frmEdit.Visible = false) then begin
      cdsNaklo.Edit;
      ShowDetail1;
    end;
  end;
end;

procedure TfrmNNaklp.ShowDetail1;
begin
  dmdEx.startWaiting;
  if (frmEdit.Visible = false) then begin
    frmEdit.ShowModal;
  end;
  dmdEx.stopWaiting;
end;

procedure TfrmNNaklp.udgGrid1DblClick(Sender: TObject);
begin
	actGrid1ListShow.Execute;
end;


procedure TfrmNNaklp.actRefreshExecute(Sender: TObject);
begin
  dmdEx.startwaiting;
  ProcessSettings;
  qeNaklo.Refresh;
  dmdEx.stopwaiting;
end;


procedure TfrmNNaklp.actSettingsExecute(Sender: TObject);
begin
  actApply.Execute;
  actSettings.checked := setT.ProcessSettingsChange(actRefresh);
end;

procedure TfrmNNaklp.ProcessSettings;
begin
  ProcessFirm;
  ProcessPost;
  ProcessDate;
  ProcessShowDeleted;
  UpdateCaption;
end;

//ставим условия в зависимости от выбора фирмы
procedure TfrmNNaklp.ProcessFirm;
var
  strUkk : string;
begin
  strUkk := setT.GetPluginResult('fmSettingsVlad');
  if (strUkk<>'') then begin
    qeNaklo.SetSql('where','id_zak='+strUkk,3);
  end else begin
    qeNaklo.SetSql('where','',3);
  end;
end;

procedure TfrmNNaklp.ProcessPost;
var
  sTemp : string;
begin
  sTemp := setT.GetPluginResult('fmSettingsPost');
  if sTemp<>'' then begin
    qeNaklo.SetSQL('where',
      'id_izg='+sTemp, 4);
  end else begin
    qeNaklo.SetSQL('where','', 4);
  end;
end;

//////////////////////////////////////////////////////////
//appling changes
procedure TfrmNNaklp.actApplyExecute(Sender: TObject);
begin
	actApply.Checked := false;
	if PostAndApply(cdsNaklo)=0 then begin
		actApply.Checked := true;
	end;
end;


procedure TfrmNNaklp.cdsNakloReconcileError(
	DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
	showmessage(e.Message);
	Action := raAbort;
end;

procedure TfrmNNaklp.qurQuery2ReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
	showmessage(e.Message);
	Action := raAbort;
end;

procedure TfrmNNaklp.dbgNakloDblClick(Sender: TObject);
begin
  actGrid1ListShow.Execute;
end;

procedure TfrmNNaklp.ProcessShowDeleted;
begin
  if actShowDeleted.Checked then begin
		qeNaklo.SetSQL ('where','delmarked=1',3);
  end
  else begin
    qeNaklo.SetSQL ('where','delmarked=0',3);
  end;//checked
  qeNaklo.prepare;
end;

procedure TfrmNNaklp.DefaultStartup;
begin
try
  setT.IDManager:=0; // all
  setT.SetPeriod(2);
  ProcessFirm;
  ProcessPost;
  ProcessShowDeleted;
  ProcessSettings;
  DefaultOpen;
except
  AssertInternal('3732FE67-BE35-4B68-8856-01BA9060A04E');
end;
end;

procedure TfrmNNaklp.actShowDeletedExecute(Sender: TObject);
begin
  dmdEx.StartWaiting;
	actShowDeleted.Checked := not actShowDeleted.Checked;
  if actShowDeleted.Checked then begin
    actUndeleteNakl.Visible := true;
  end else begin
    actUndeleteNakl.Visible := false;
  end;
  ProcessShowDeleted;
  cdsNaklo.Close;
  cdsNaklo.Open;
  dmdEx.StopWaiting;
end;

procedure TfrmNNaklp.actUndeleteNaklExecute(Sender: TObject);
begin
  if actShowDeleted.Checked then begin
    dmdEx.UndeleteNakl(TintegerField(dsNaklo.DataSet.FieldByName('delmarked')),actRefresh);
  end;
end;

procedure TfrmNNaklp.dbgNakloKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_f8: begin
      if (MessageDlg('Вы хотите удалить документ?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
        if not (cdsNaklo.bof and cdsNaklo.eof) then begin
          cdsNaklo.Delete;
        end;
        PostAndApply(cdsNaklo);
      end;//if messagedlg
    end; //if vk_f8
    vk_return:  begin
      actGrid1ListShow.Execute;
    end;
    vk_insert: begin
      cdsNaklo.Append;
    end;
  end; //case
end;

procedure TfrmNNaklp.actDebugExecute(Sender: TObject);
begin
  actDebug.Checked := not actDebug.Checked;
  if actDebug.Checked then begin
    //последние две колонки содержат номера фирм и клиентов
    //информация для отладки
    cdsNaklo.FieldByName('id_nakl').Visible :=true;
  end else begin //if actDebug.Checked
    cdsNaklo.FieldByName('id_nakl').Visible :=false;
  end; //if actDebug.Checked
end;

procedure TfrmNNaklp.ProcessDate;
begin
  qeNaklo.SetSQL('where',
    'dat>='+ QuotedStr(datetostr(setT.DateFrom)),1);
  qeNaklo.SetSQL('where',
    'dat<='+ QuotedStr(datetostr(setT.DateTo))  ,2);
end;

procedure TfrmNNaklp.UpdateCaption;
var
  sTemp : string;
begin
  sTemp :='Полученные налоговые: '
    {+'Менеджер: '+setT.Manager+'. '}
    + 'Период: c ' + datetostr (setT.DateFrom)
    + ' по '+ datetostr(setT.DateTo)+'. ';
  if setT.GetPluginResult('fmSettingsPost')<>'' then begin
    sTemp := sTemp+
      'Поставщик: '+ setT.GetPluginTextResult('fmSettingsPost')+'. ';
  end;
  if setT.GetPluginResult('fmSettingsVlad')<>'' then begin
    sTemp := sTemp +
      'Фирма: '+ setT.GetPluginTextResult('fmSettingsVlad')
  end;
  self.Caption := sTemp;
end;

procedure TfrmNNaklp.dspNakloBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
begin
  if (ukDelete=UpdateKind) and (SourceDS.name='sdsNaklo') then begin
    Applied:=false;
    sdsDelmark.ParamByName('id_nakl').AsInteger:=
      DeltaDS.fieldByName('id_nakl').asInteger;
		dmdEx.ExecSQL(sdsDelmark);
    Applied:=true;
  end;
end;

end.
