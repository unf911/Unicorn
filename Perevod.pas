unit Perevod;
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
  PerevodEdit, //TfrmPerevodEdit
  atsAssert, //AssertInternal
  StrUtils, DBGridEh,
  SkladAux,
  PropStorageEh,
  UnfFilter, PropFilerEh, GridsEh //AnsiStartsText
;

type

  TfrmPerevod = class(TForm)
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    dsNaklo: TDataSource;
    actGrid1ListShow: TAction;
    actRefresh: TAction;
    actSettings: TAction;
    actApply: TAction;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    sdsPlat: TSQLDataSet;
    dspPlat: TDataSetProvider;
    cdsNaklo: TClientDataSet;
    cdsNakloIDI: TIntegerField;
    cdsNakloDAT: TSQLTimeStampField;
    cdsNakloZAK: TStringField;
    cdsNakloIZG: TStringField;
    cdsNakloPRIM: TStringField;
    cdsNakloID_MANAGER: TIntegerField;
    qeNaklo: TQueryExtender;
    cdsNakloMANAGER: TStringField;
    sdsPlatDAT: TSQLTimeStampField;
    sdsPlatID_MANAGER: TIntegerField;
    sdsPlatID_ZAK: TIntegerField;
    sdsPlatID_IZG: TIntegerField;
    cdsNakloID_ZAK: TIntegerField;
    cdsNakloID_IZG: TIntegerField;
    cdsNakloOPL: TFMTBCDField;
    sdsPlatID: TStringField;
    cdsNakloID: TStringField;
    sdsPlatPOSTED: TSmallintField;
    cdsNakloPOSTED: TSmallintField;
    sdsPlatID_NAKL: TIntegerField;
    sdsPlatNDS: TFMTBCDField;
    sdsPlatCOMMENT: TStringField;
    sdsDelmark: TSQLDataSet;
    dbgNaklo: TDBGridEh;
    Panel4: TPanel;
    BitBtn2: TBitBtn;
    btnUnpost: TBitBtn;
    BitBtn7: TBitBtn;
    actPost: TAction;
    actUnpost: TAction;
    sdsPost: TSQLDataSet;
    sdsUnpost: TSQLDataSet;
    actShowDeleted: TAction;
    actUndeleteNakl: TAction;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N3: TMenuItem;
    cdsNakloBANK_FROM: TStringField;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    UnfFilter1: TUnfFilter;
    sdsPlatPARENT_ID_NAKL: TIntegerField;
    sdsPlatZATRATY: TFMTBCDField;
    sdsPlatKURS: TFloatField;
    cdsNakloPARENT_ID_NAKL: TIntegerField;
    cdsNakloZATRATY: TFMTBCDField;
    cdsNakloKURS: TFloatField;
    sdsPlatID_CURRENCY: TSmallintField;
    cdsNakloID_CURRENCY: TSmallintField;
    cdsNakloCURRENCY: TStringField;
    cdsNakloCURRENCY_TO: TStringField;
    sdsPlatID_CURRENCY_TO: TIntegerField;
    sdsPlatKURS_INDIRECT: TSmallintField;
    sdsPlatNDS_FROM: TFMTBCDField;
    cdsNakloID_CURRENCY_TO: TIntegerField;
    cdsNakloKURS_INDIRECT: TSmallintField;
    cdsNakloNDS_FROM: TFMTBCDField;
    BitBtn6: TBitBtn;
    sdsPlatBLOCKED: TSmallintField;
    sdsPlatDELMARKED: TSmallintField;
    sdsPlatID_SCHET_IZG: TIntegerField;
    sdsPlatID_SCHET_ZAK: TIntegerField;
    cdsNakloBLOCKED: TSmallintField;
    cdsNakloDELMARKED: TSmallintField;
    cdsNakloID_SCHET_IZG: TIntegerField;
    cdsNakloID_SCHET_ZAK: TIntegerField;
    cdsNakloBANK_TO: TStringField;
    actDebug: TAction;
    N2: TMenuItem;
    actMakePerevodFromPerevod: TAction;
    N7: TMenuItem;
    PopupMenu1: TPopupMenu;
    N8: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
		procedure cdsNakloAfterInsert(DataSet: TDataSet);
    procedure cdsNakloBeforeScroll(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure udgGrid1DblClick(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure actDetailExecute(Sender: TObject);
    procedure actSettingsExecute(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
    procedure cdsNakloReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure dspPlatBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dbgNakloDblClick(Sender: TObject);
    procedure actPostExecute(Sender: TObject);
    procedure actUnpostExecute(Sender: TObject);
    procedure actUndeleteNaklExecute(Sender: TObject);
    procedure actShowDeletedExecute(Sender: TObject);
    procedure dbgNakloKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actDebugExecute(Sender: TObject);
    procedure actGrid1ListShowExecute(Sender: TObject);
    procedure actMakePerevodFromPerevodExecute(Sender: TObject);
  private
    setT : TfrmSettings;
    SettingsVlad : TfmSettingsPlugin;
    SettingsPost : TfmSettingsPlugin;
    frmEdit : TfrmPerevodEdit;
    function ShowDetail1:integer;
    procedure ProcessShowDeleted;
    procedure ProcessFirm;
    procedure ProcessPost;
    procedure ProcessSettings(ProcessOnlySecurityMeasures:boolean=false);
    procedure TestInsert;
  public
    { Public declarations }
    procedure DefaultStartup;
    function Defaultopen:boolean;
    procedure Test;
  end;

var
	frmPerevod: TfrmPerevod;

implementation

uses DateUtils //Today
;


{$R *.dfm}


procedure TfrmPerevod.FormClose(Sender: TObject;
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
	{
	ApplyOrCancel(qurQuery1);
	if ((qurQuery1.UpdatesPending = true)
		or (qurQuery2.UpdatesPending = true)) then begin
		if (MessageDlg('Вы хотите сохранить изменения',mtConfirmation ,
		[mbOk, mbCancel	],0) = mrOk) then begin

		end;//dlg
	end;//pending
	}
//	Action := caFree;
end;


procedure TfrmPerevod.FormCreate(Sender: TObject);
begin
	dmdEx.OpenQuery(dmdEx.cdsVlad);
	dmdEx.OpenQuery(dmdEx.cdsClient);
	dmdEx.OpenQuery(dmdEx.cdsManager);

	qeNaklo.DefSql:=sdsPlat.CommandText;

	setT := TfrmSettings.create (self);
  SettingsPost := setT.CreatePlugin('TfmSettingsPost');
  setT.AddPlugin(SettingsPost);
  SettingsVlad := setT.CreatePlugin('TfmSettingsVlad');
  setT.AddPlugin(SettingsVlad);
  SettingsVlad.SetResultType(2);
  SettingsVlad.SetKeyValue(0);
  ProcessSettings(true);
  frmEdit := TfrmPerevodEdit.Create(self);
  frmEdit.dsNakloEdit.DataSet := cdsNaklo;
end;


function TfrmPerevod.Defaultopen:boolean;
begin
  ProcessSettings;
  Result:=DefaultOpenInputForm(qeNaklo);
  //Result :=dmdEx.Defaultopen(qeNaklo.Query,actRefresh);
end;

procedure TfrmPerevod.cdsNakloAfterInsert(DataSet: TDataSet);
begin
	Dataset.FieldByName('id_nakl').AsInteger :=
		dmdEx.GetGenValue('naklo_gen');
	Dataset.FieldByName('id').AsInteger :=
		dmdEx.GetGenValue('oplaty_gen');
  DataSet.FieldByName('posted').asInteger := 0;
  DataSet.FieldByName('nds').asFloat := 0;
  DataSet.FieldByName('nds_from').AsFloat := 0;
  DataSet.FieldByName('kurs').asFloat := 1;
  DataSet.FieldByName('kurs_indirect').asInteger := 0;
  DataSet.FieldByName('dat').asDateTime := Today;
  DataSet.FieldByName('id_manager').asInteger := dmdEx.GetIdManager;
  ShowDetail1;
end;

procedure TfrmPerevod.cdsNakloBeforeScroll(DataSet: TDataSet);
begin
	ApplyOrCancel(DataSet);
end;

procedure TfrmPerevod.FormDestroy(Sender: TObject);
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

procedure TfrmPerevod.actGrid1ListShowExecute(Sender: TObject);
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



function TfrmPerevod.ShowDetail1:integer;
begin
  Result :=0;
  if (dsNaklo.DataSet.FieldByName('ID_NAKL').AsInteger = 0) then  begin
    dsNaklo.DataSet.Insert;
  end else begin
    Result := dmdEx.ShowDetail1(dsNaklo.DataSet,frmEdit);
  end;
end;

procedure TfrmPerevod.udgGrid1DblClick(Sender: TObject);
begin
	actGrid1ListShow.Execute;
end;


procedure TfrmPerevod.actRefreshExecute(Sender: TObject);
begin
  dmdEx.startwaiting;
  qeNaklo.Refresh;
  dmdEx.stopwaiting;
end;

procedure TfrmPerevod.ProcessSettings(ProcessOnlySecurityMeasures:boolean=false);
begin
  ProcessFirm;
  ProcessPost;
  ProcessShowDeleted;
try
    self.Caption :='Переводы: '
      +'Менеджер: '+setT.Manager + '. Период: c ' + datetostr (setT.DateFrom)
      + ' по '+ datetostr(setT.DateTo)+'.';
    if (setT.IDManager<>0) then begin
      qeNaklo.SetSQL('where',
				'id_manager='+ inttostr(setT.IDManager),0);
    end
    else begin
      qeNaklo.SetSQL('where',
        '',0);
    end;
    if not ProcessOnlySecurityMeasures then begin
      qeNaklo.SetSQL('where',
        'dat>='+ QuotedStr(datetostr(setT.DateFrom)),1);
      qeNaklo.SetSQL('where',
        'dat<='+ QuotedStr(datetostr(setT.DateTo))  ,2);
    end;
    qeNaklo.Prepare;
except
  AssertInternal('6B2C34A6-5709-43FA-B0C3-BC86D7E00FE7');
end;

end;

procedure TfrmPerevod.actDetailExecute(Sender: TObject);
var
  frmPrixDet : TfrmPrixDet;
begin
	frmPrixDet := TfrmPrixDet.Create (Self);
	frmPrixDet.ShowDet(
    cdsNaklo.FieldByName('id_nakl').AsInteger,
		0
  );
end;




procedure TfrmPerevod.actSettingsExecute(Sender: TObject);
begin
{
  actApply.Execute;
  actSettings.Checked := false;
  if setT.ChangeSettings=mrOk then begin
    actSettings.Checked :=true;
    ProcessSettings;
    Defaultopen;
//    actRefresh.Execute;
  end;
}
  actSettings.checked := setT.ProcessSettingsChange2(DefaultOpen);
end;


//ставим условия в зависимости от выбора фирмы
procedure TfrmPerevod.ProcessFirm;
var
  strUkk : string;
//  strSklad : string;
//  id_UKK : integer;
begin
  strUkk := setT.GetPluginResult('fmSettingsVlad');
  if (strUkk<>'') then begin
    qeNaklo.SetSql('where','o.id_zak='+strUkk,5);
  end else begin
    qeNaklo.SetSql('where','',5);
  end;
end;

procedure TfrmPerevod.ProcessPost;
var
  sTemp : string;
begin
    sTemp := setT.GetPluginResult('fmSettingsPost');
    if sTemp<>'' then begin
      qeNaklo.SetSQL('where',
        'o.id_izg='+sTemp, 4);
    end else begin
      qeNaklo.SetSQL('where','', 4);
    end;
    qeNaklo.Prepare;
end;

//////////////////////////////////////////////////////////
//appling changes
procedure TfrmPerevod.actApplyExecute(Sender: TObject);
begin
	actApply.Checked := false;
	if PostAndApply(cdsNaklo)=0 then begin
			actApply.Checked := true;
	end;
end;


procedure TfrmPerevod.cdsNakloReconcileError(
	DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
	showmessage(e.Message);
	Action := raAbort;
end;

procedure TfrmPerevod.dspPlatBeforeUpdateRecord(Sender: TObject;
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

procedure TfrmPerevod.dbgNakloDblClick(Sender: TObject);
begin
  actGrid1ListShow.Execute;
end;

procedure TfrmPerevod.actPostExecute(Sender: TObject);
begin
  dmdEx.PostNakl(
    TIntegerField(cdsNaklo.FieldByName('posted')),
    sdsPost,
    TIntegerField(cdsNaklo.FieldByName('id_nakl')),
    not actPost.Checked);
end;

procedure TfrmPerevod.actUnpostExecute(Sender: TObject);
begin
  dmdEx.UnPostNakl(
    TIntegerField(cdsNaklo.FieldByName('posted')),
    sdsUnPost,
    TIntegerField(cdsNaklo.FieldByName('id_nakl')),
    not actUnpost.Checked);
end;


procedure TfrmPerevod.ProcessShowDeleted;
begin
  if actShowDeleted.Checked then begin
		qeNaklo.SetSQL ('where','delmarked=1',3);
  end
  else begin
    qeNaklo.SetSQL ('where','delmarked=0',3);
  end;//checked
  qeNaklo.prepare;
end;

procedure TfrmPerevod.DefaultStartup;
begin
try
  setT.IDManager:=0; // all
  setT.SetPeriod(2);
except
  AssertInternal('3732FE67-BE35-4B68-8856-01BA9060A04E');
end;
end;

procedure TfrmPerevod.actShowDeletedExecute(Sender: TObject);
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

procedure TfrmPerevod.actUndeleteNaklExecute(Sender: TObject);
begin
  if actShowDeleted.Checked then begin
    dmdEx.UndeleteNaklo(TintegerField(dsNaklo.DataSet.FieldByName('delmarked')),actRefresh);
  end;
end;

procedure TfrmPerevod.dbgNakloKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_f8: begin
      if (MessageDlg('Вы хотите удалить документ?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
        if (cdsNaklo.FieldByName('posted').asInteger=1) then begin
          showmessage('Нельзя удалить проведенный документ');
        end
        else begin //ok to delete
          if not (cdsNaklo.bof and cdsNaklo.eof) then begin
            cdsNaklo.Delete;
          end;
          PostAndApply(cdsNaklo);
        end; //if posted
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

procedure TfrmPerevod.actDebugExecute(Sender: TObject);
begin
  actDebug.Checked := not actDebug.Checked;
  if actDebug.Checked then begin
    columnByName(dbgNaklo.Columns,'ID_NAKL').Visible :=true;
  end else begin //if actDebug.Checked
    columnByName(dbgNaklo.Columns,'ID_NAKL').Visible :=false;
  end; //if actDebug.Checked
end;

procedure TfrmPerevod.Test;
begin
  TestInsert;
//  TestInsert2;
end;

procedure TfrmPerevod.TestInsert;
begin
  DefaultStartup;
  if not DefaultOpen then begin
    AssertInternal('0DDD44B8-1A25-42D7-A648-D32BE1301F38');
  end;
  with cdsNaklo do begin
    Tag:=1;
    Insert;
    FieldByName('id_izg').asInteger :=
      dmdEx.cdsClient.Lookup('name','Украинская кабельная компания ООО','id');
    FieldByName('id_zak').asInteger :=
      dmdEx.cdsClient.Lookup('name','Украинская кабельная компания ООО','id');
    FieldByName('id_schet_izg').asInteger :=
      dmdEx.cdsBank.Lookup('bank_name','бартер','oid');
    FieldByName('id_schet_zak').asInteger :=
      dmdEx.cdsBank.Lookup('bank_name','бартер','oid');
    FieldByName('id_manager').AsInteger :=
      dmdEx.cdsManager.Lookup('name','Тест','id');
    FieldByName('id_currency').AsInteger := dmdEx.GetIdCurrencyUAH;
    FieldByName('id_currency_to').AsInteger := dmdEx.GetIdCurrencyUAH;
    FieldByName('nds').AsCurrency := 3000000;
    Post;
    Tag:=0;
    ApplyUpdates(0);
  end;
  actPost.Checked := true;
  actPost.execute;

  actUnPost.Checked := true;
  actUnpost.Execute;
  cdsNaklo.Delete;
  PostAndApply(cdsNaklo);
end;

procedure TfrmPerevod.actMakePerevodFromPerevodExecute(Sender: TObject);
var
  slHead: TStringList;
begin
slHead := nil;

try
  try
    with dsNaklo.DataSet do begin
    if (Eof and Bof) then begin
      Showmessage('Не выбран документ');
      exit;
    end;
    dmdEx.StartWaiting;
    DisableControls;
    slHead := TStringList.Create;
    slHead.Add('id_izg='+FieldByName('id_izg').asString);
    slHead.Add('id_schet_izg='+FieldByName('id_schet_izg').asString);
    slHead.Add('id_currency='+FieldByName('id_currency').asString);
    slHead.Add('id_zak='+FieldByName('id_zak').asString);
    slHead.Add('id_schet_zak='+FieldByName('id_schet_zak').asString);
    slHead.Add('id_currency_to='+FieldByName('id_currency_to').asString);
    slHead.Add('id_manager='+FieldByName('id_manager').asString);
//    slHead.Add('dat='+FieldByName('dat').asString);
    slHead.Add('kurs_indirect='+FieldByName('kurs_indirect').asString);
    slHead.Add('kurs='+FieldByName('kurs').asString);
    slHead.Add('nds_from='+FieldByName('nds_from').asString);
    slHead.Add('nds='+FieldByName('nds').asString);

    Tag := 1;
    Insert;
    FieldByName('id_izg').asInteger := strtoint(slHead.Values['id_izg']);
    FieldByName('id_schet_izg').asInteger := strtoint(slHead.Values['id_schet_izg']);
    FieldByName('id_currency').asInteger := strtoint(slHead.Values['id_currency']);
    FieldByName('id_zak').asInteger := strtoint(slHead.Values['id_zak']);
    FieldByName('id_schet_zak').asInteger := strtoint(slHead.Values['id_schet_zak']);
    FieldByName('id_currency_to').asInteger := strtoint(slHead.Values['id_currency_to']);
    FieldByName('id_manager').asInteger := strtoint(slHead.Values['id_manager']);
//    FieldByName('dat').asDateTime := strtodate(slHead.Values['dat']);
    FieldByName('kurs_indirect').AsInteger := strtoint(slHead.Values['kurs_indirect']);
    FieldByName('kurs').AsFloat := strtofloat(slHead.Values['kurs']);
    FieldByName('nds_from').AsFloat := strtofloat(slHead.Values['nds_from']);
    FieldByName('nds').AsFloat := strtofloat(slHead.Values['nds']);
    Post;
    Tag := 0;
    EnableControls;

    end;
  except
    AssertInternal('12E341DE-ADEE-4ED2-896F-BED639B52D61');
  end;
finally
  slHead.Free;
  dmdEx.StopWaiting;
end;

end;

end.
