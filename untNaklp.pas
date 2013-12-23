unit untNaklp;

interface

uses
  Windows, Messages, SysUtils,
  Variants, Classes, Graphics,
  Controls, Forms,
  Dialogs,
  DB, DBTables, Grids, DBGrids,
  ActnList,
  StdCtrls,
  untSettings,
  QueryExtender, DBCtrls,
  untUnfDbLookupListbox,
  untListBoxPosit, ExtCtrls, FMTBcd,
  PropFilerEh, Menus, PropStorageEh,
  UnfFilter, DBClient, Provider,
  SqlExpr, Buttons, GridsEh, DBGridEh,
    
  untSchetList,untRound, Curr2StrRU,
  Mask, DBCtrlsEh,
  untNakloEdit, untNaklptEdit,
  untEx,


  ATSAssert,Registry,
  StrUtils,
  SettingsPlugin, //TfmSettingsPlugin
  RepNakloDepend , //TfrmRepNakloDepend
  NaklpBux
  ;

type
  TfrmNaklp = class(TForm)
    ActionList1: TActionList;
    actSettings: TAction;
    actGrid1ListShow: TAction;
    actPostIf: TAction;
    actRefresh: TAction;
    actGrid2ListShow: TAction;
    Panel1: TPanel;
    rdgCable: TRadioGroup;
    actPostIf2: TAction;
    RadioGroup2: TRadioGroup;
    rdbCol1: TRadioButton;
    rdbCol3: TRadioButton;
    rdbCol2: TRadioButton;
    rdbCol4: TRadioButton;
    Button3: TButton;
    actRecalc: TAction;
    rdbCol0: TRadioButton;
    actAutoRecalc: TAction;
    actPreview: TAction;
    actPrint: TAction;
    actCalculateSum: TAction;
    dbgNaklpt: TDBGridEh;
    sdsNaklp: TSQLDataSet;
    dsNaklp: TDataSource;
    dspNaklp: TDataSetProvider;
    cdsNaklp: TClientDataSet;
    sdsNaklpt: TSQLDataSet;
    dspNaklpt: TDataSetProvider;
    cdsNaklpt: TClientDataSet;
    dsNaklpt: TDataSource;
    cdsNaklpID_NAKL: TIntegerField;
    cdsNaklpDAT: TSQLTimeStampField;
    cdsNaklpID_IZG: TIntegerField;
    cdsNaklpID_ZAK: TIntegerField;
    cdsNaklpID_MANAGER: TIntegerField;
    cdsNaklpVSEGO: TFMTBCDField;
    cdsNaklpNALOG_NDS: TFMTBCDField;
    cdsNaklpID_SKLAD: TIntegerField;
    cdsNaklpZAK: TStringField;
    cdsNaklpIZG: TStringField;
    cdsNaklpMANAGER: TStringField;
    cdsNaklptID_NAKL: TIntegerField;
    cdsNaklptID_TOVAR: TIntegerField;
    cdsNaklptCENA: TFMTBCDField;
    cdsNaklptKOLOTP: TFMTBCDField;
    cdsNaklptID_NAKLD: TIntegerField;
    cdsNaklptTOVAR: TStringField;
    cdsNaklpPOSTED: TSmallintField;
    sdsPost: TSQLDataSet;
    sdsUnpost: TSQLDataSet;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    cdsNaklptID_POS: TIntegerField;
    N2: TMenuItem;
    cdsNaklpID: TStringField;
    cdsNaklpKURS: TFloatField;
    sdsNaklpID_NAKL: TIntegerField;
    sdsNaklpDAT: TSQLTimeStampField;
    sdsNaklpID: TStringField;
    sdsNaklpID_IZG: TIntegerField;
    sdsNaklpID_ZAK: TIntegerField;
    sdsNaklpID_MANAGER: TIntegerField;
    sdsNaklpID_CURRENCY: TSmallintField;
    sdsNaklpNALOG_NDS: TFMTBCDField;
    sdsNaklpNDS: TFMTBCDField;
    sdsNaklpID_SKLAD: TIntegerField;
    sdsNaklpPOSTED: TSmallintField;
    sdsNaklpCOMMENT: TStringField;
    sdsNaklpKURS: TFloatField;
    sdsNaklpTIP: TSmallintField;
    sdsNaklpDELMARKED: TSmallintField;
    cdsNaklpID_CURRENCY: TSmallintField;
    cdsNaklpCOMMENT: TStringField;
    cdsNaklpTIP: TSmallintField;
    cdsNaklpDELMARKED: TSmallintField;
    qeNaklo: TQueryExtender;
    sdsDelmark: TSQLDataSet;
    sdsNaklptID_NAKL: TIntegerField;
    sdsNaklptID_TOVAR: TIntegerField;
    sdsNaklptCENA: TFMTBCDField;
    sdsNaklptKOLOTP: TFMTBCDField;
    sdsNaklptID_NAKLD: TIntegerField;
    sdsNaklptID_POS: TIntegerField;
    cdsNaklpSKLAD: TStringField;
    qeNaklot: TQueryExtender;
    UnfFilter1: TUnfFilter;
    sdsNaklpBLOCKED: TSmallintField;
    sdsNaklpID_SKLAD_TO: TIntegerField;
    sdsNaklpZATRATY: TFMTBCDField;
    cdsNaklpBLOCKED: TSmallintField;
    cdsNaklpID_SKLAD_TO: TIntegerField;
    cdsNaklpZATRATY: TFMTBCDField;
    cdsNaklpSKLAD_TO: TStringField;
    cdsNaklpTIPCONST: TStringField;
    Panel3: TPanel;
    dbgNaklp: TDBGridEh;
    Panel2: TPanel;
    BitBtn7: TBitBtn;
    BitBtn5: TBitBtn;
    btnUnpost: TBitBtn;
    btnPost: TBitBtn;
    Splitter1: TSplitter;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    sdsNaklpPARENT_ID_NAKL: TIntegerField;
    cdsNaklpPARENT_ID_NAKL: TIntegerField;
    sdsNaklpPARENT_ID: TStringField;
    cdsNaklpPARENT_ID: TStringField;
    PopupMenu1: TPopupMenu;
    actNaklpFilltovarNaklpbux: TAction;
    sdsNaklpFilltovarNaklpbux: TSQLDataSet;
    N3: TMenuItem;
    sdsMakeNaklpbux: TSQLDataSet;
    actMakeNaklpbux: TAction;
    N4: TMenuItem;
    N5: TMenuItem;
    actNakloList: TAction;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    actSebestRecount: TAction;
    N21: TMenuItem;
    sdsSebestRecount: TSQLDataSet;
    actShowRepNakloDepend: TAction;
    N11: TMenuItem;
    N12: TMenuItem;
    actPost: TAction;
    sdsGenerateTara: TSQLDataSet;
    actGenerateTara: TAction;
    N13: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actSettingsExecute(Sender: TObject);
    procedure actGrid1ListShowExecute(Sender: TObject);
    procedure dbgNaklrDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actGrid2ListShowExecute(Sender: TObject);
    procedure actRecalcExecute(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure actCalculateSumExecute(Sender: TObject);
    procedure cdsNaklpAfterInsert(DataSet: TDataSet);
    procedure cdsNaklptAfterInsert(DataSet: TDataSet);
    procedure cdsNaklptBeforeInsert(DataSet: TDataSet);
    procedure btnInsertClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnUnpostClick(Sender: TObject);
    procedure dbgNaklptDblClick(Sender: TObject);
    procedure dbgNaklpDblClick(Sender: TObject);
    procedure dspNaklpBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure cdsNaklpReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsNaklptReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsNaklpBeforeScroll(DataSet: TDataSet);
    procedure cdsNaklptBeforeScroll(DataSet: TDataSet);
    procedure cdsNaklptBeforeEdit(DataSet: TDataSet);
    procedure cdsNaklptBeforeDelete(DataSet: TDataSet);
    procedure cdsNaklptAfterDelete(DataSet: TDataSet);
    procedure cdsNaklptBeforePost(DataSet: TDataSet);
    procedure dbgNaklptKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgNaklpKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actNaklpFilltovarNaklpbuxExecute(Sender: TObject);
    procedure actMakeNaklpbuxExecute(Sender: TObject);
    procedure actNakloListExecute(Sender: TObject);
    procedure actSebestRecountExecute(Sender: TObject);
    procedure actShowRepNakloDependExecute(Sender: TObject);
    procedure actPostExecute(Sender: TObject);
    procedure actGenerateTaraExecute(Sender: TObject);

  private
    intNpp : integer; //номер позиции по порядку
    frmNaklpEdit : TfrmNakloEdit;
    frmNaklptEdit : TfrmNaklptEdit;
    SettingsVlad : TfmSettingsPlugin;
    SettingsPost : TfmSettingsPlugin;
    //Post;
    SettingsSklad : TfmSettingsPlugin;
    procedure Order;
    procedure ProcessSettings;
    procedure ShowDetail2;
    procedure ShowDetail1;
    procedure RecountNakl;
    procedure FillVlad;
    procedure FillManager;
    procedure FillPost;
    procedure ProcessVlad;
    procedure ProcessPost;
    procedure FillSklad;
    procedure ProcessSklad;


  public
    { Public declarations }
    setT : TfrmSettings;
    procedure DefaultStartup;
    function DefaultOpen:boolean;    
  end;
var
  frmNaklp: TfrmNaklp;
  
implementation

uses SkladAux //DefaultOpenInputForm

;

{$R *.dfm}


procedure TfrmNaklp.FillVlad;
begin
  SettingsVlad := setT.CreatePlugin('TfmSettingsVlad');
  SettingsVlad.SetResultType(2);
  setT.AddPlugin(SettingsVlad);
end;

procedure TfrmNaklp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  setT.SaveProperties('TfrmSettings_Naklp');
  Action := caFree;
end;

procedure TfrmNaklp.actGrid1ListShowExecute(Sender: TObject);
begin
  if (cdsNaklp.FieldByName('ID_NAKL').AsInteger = 0) then
  begin
    cdsNaklp.Insert;
  end
  else begin
    cdsNaklp.Edit;
    ShowDetail1;
  end;
end;

procedure TfrmNaklp.dbgNaklrDblClick(Sender: TObject);
begin
  actGrid1ListShow.Execute;
end;

procedure TfrmNaklp.FormCreate(Sender: TObject);
begin
try
  dmdEx.startwaiting;
  dmdEx.OpenQuery(dmdEx.cdsPost);
  dmdEx.OpenQuery(dmdEx.cdsVlad);
  dmdEx.OpenQuery(dmdEx.cdsTovar);
  dmdEx.OpenQuery(dmdEx.cdsSklads);
	qeNaklo.DefSql := sdsNaklp.CommandText;

  setT := TfrmSettings.Create(self);
  setT.actAllManagerOn.Execute;
  frmNaklpEdit := TfrmNakloEdit.Create(self);
  frmNaklpEdit.caption := 'Редактирование прихода';
  frmNaklpEdit.dsNakloEdit.DataSet := cdsNaklp;

  frmNaklptEdit := TfrmNaklptEdit.Create(self);
  frmNaklptEdit.dsNaklptEdit.Dataset := cdsNaklpt;
  frmNaklptEdit.Top := 100;
  frmNaklptEdit.Left := 40;
  FillManager;
  FillPost;
  FillVlad;
  FillSklad;
  dmdEx.stopwaiting;
except
  AssertInternal('22D2B51F-D9EA-479B-9968-354FCD82B111');
end;
end;

procedure TfrmNaklp.actRefreshExecute(Sender: TObject);
begin
  dmdEx.StartWaiting;
  if cdsNaklp.Active then cdsNaklp.CheckBrowseMode;
	qeNaklo.Refresh;
  dmdEx.StopWaiting;
end;

procedure TfrmNaklp.FormDestroy(Sender: TObject);
begin
  dmdEx.CloseQuery(dmdEx.cdsPost,false);
  dmdEx.CloseQuery(dmdEx.cdsVlad,false);
  dmdEx.CloseQuery(dmdEx.cdsTovar,false);
  dmdEx.CloseQuery(dmdEx.cdsSklads,false);
//  setT.Free;
  frmNaklpEdit.Free;
	frmNaklptEdit.Free;
end;

procedure TfrmNaklp.actGrid2ListShowExecute(Sender: TObject);
begin
try
  if (cdsNaklpt.FieldByName('ID_NAKLD').AsInteger = 0) then begin
    cdsNaklpt.Insert;
  end
	else begin
    cdsNaklpt.Edit;
		ShowDetail2;
  end;
//frmNaklptEdit.ShowModal;
except
  AssertInternal('{FF1AACF3-63AE-4AF0-92A7-71510B11DD20}');
end;
end;

//////////////////////////////////////////////
//  Процедура упорядочивания
///
procedure TfrmNaklp.Order;
begin
// Order2( qeNaklpt);
end;

procedure TfrmNaklp.actRecalcExecute(Sender: TObject);
begin
  Order;
  actCalculateSum.Execute;
end;

procedure TfrmNaklp.FormDeactivate(Sender: TObject);
begin
  PostAndApplyOrCancel(cdsNaklp);
end;

procedure TfrmNaklp.actCalculateSumExecute(Sender: TObject);
begin
//  CalculateSum(qurNaklp,qurNaklpt );
end;

procedure TfrmNaklp.cdsNaklpAfterInsert(DataSet: TDataSet);
var
  intGen : integer;
begin
 with DataSet do begin
  intGen := dmdEx.GetGenValue('naklo_gen');
  FieldByName('id').AsString:=    inttostr(intGen);
  FieldByName('id_nakl').AsInteger:=    intGen;  //assign
  FieldByName('dat').AsDateTime := Date; //default date. time=0
{
  if (AnsiUpperCase(setT.Manager)<>'ВСЕ') then begin //default manager
    qurNaklp.FieldByName('manager').asString := setT.Manager //get manager from settings
  end; //manager
  }
  FieldByName('nalog_nds').AsFloat := dmdEx.GetNds ( Date );
  FieldByName('kurs').asFloat := 1.0000;
  FieldByName('nds').asFloat := 0;
  FieldByName('tip').asInteger := 1;  //приход
 end;
 ShowDetail1; 
end;

procedure TfrmNaklp.cdsNaklptAfterInsert(DataSet: TDataSet);
var
  intGen : integer;
begin
  dmdEx.startwaiting;
  intGen := dmdEx.GetGenValue('naklot_gen');
  cdsNaklpt.FieldByName('id_nakld').AsInteger := intGen;
  cdsNaklpt.FieldByName('id_nakl').AsInteger :=
    cdsNaklp.FieldByName('id_nakl').AsInteger;
  cdsNaklpt.FieldByName('id_pos').asInteger := intNpp;
  cdsNaklpt.FieldByName('kolotp').asFloat := 0;
  dmdEx.stopwaiting;
  ShowDetail2;
end;

procedure TfrmNaklp.cdsNaklptBeforeInsert(DataSet: TDataSet);
begin
	if PostAndApply(cdsNaklp)<>0 then begin
		abort;
	end;
	//ищем номер последней позиции
  cdsNaklpt.Last;
  try
    intNpp:=cdsNaklpt.fieldbyname('id_pos').asInteger;
  except
    intNpp:=0;
  end;
  inc(intNpp);
end;

procedure TfrmNaklp.btnInsertClick(Sender: TObject);
begin
  cdsNaklp.Insert;
end;

procedure TfrmNaklp.btnUpdateClick(Sender: TObject);
begin
  actGrid1ListShow.Execute;
end;

procedure TfrmNaklp.btnUnpostClick(Sender: TObject);
begin
  if (MessageDlg('Вы хотите вернуть приходную накладную?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
    try
      dmdEx.StartWaiting;
      sdsUNPost.Params[0].AsInteger :=
        cdsNaklp.fieldbyname('id_nakl').AsInteger;
      dmdEx.ExecSQL(sdsUNPost,false);

      cdsNaklp.edit;
      cdsNaklp.FieldByName('posted').AsInteger := 0;
      cdsNaklp.Post;
      cdsNaklp.ApplyUpdates(0);
      dmdEx.StopWaiting;
    except
      on E:EDatabaseError do begin
        dmdEx.StopWaiting;
        if AnsiStartsText('no permission', e.message) then begin
          MessageDlg ('Вы не имеете права проводить накладные',mtWarning,[mbOK],0);
				end
        else begin
          showmessage (e.message);
        end; //if
      end; //on
    end;  //try
  end;
end;

procedure TfrmNaklp.dbgNaklptDblClick(Sender: TObject);
begin
  actGrid2ListShow.Execute;
end;

procedure TfrmNaklp.dbgNaklpDblClick(Sender: TObject);
begin
  actGrid1ListShow.Execute; 
end;

procedure TfrmNaklp.actSettingsExecute(Sender: TObject);
begin
  actSettings.checked := setT.ProcessSettingsChange2(DefaultOpen);
end;

procedure TfrmNaklp.DefaultStartup;
begin
try
  setT.IDManager:=0; // all
  setT.LoadProperties('TfrmSettings_Naklp');
  ProcessSettings;
  DefaultOpen;
except
  AssertInternal('A80B2A64-3C6F-4B52-9CD7-2D40DE2AC2BA');
end;
end;

function TfrmNaklp.DefaultOpen:boolean;
begin
	dmdEx.startWaiting;
  ProcessSettings;
  Result:=DefaultOpenInputForm(qeNaklo);
	dmdEx.StopWaiting;
end;

procedure TfrmNaklp.ProcessSettings;
begin
    self.Caption :='Приходные накладные. '
      +'Менеджер: '+setT.Manager + '. Период: c ' + datetostr (setT.DateFrom)
      + ' по '+ datetostr(setT.DateTo)+'.';
    if (setT.IDManager<>0) then begin
      qeNaklo.SetSQL('where',
        'om.id_manager='+ inttostr(setT.IDManager),0);
    end
    else begin
      qeNaklo.SetSQL('where',
        '',0);
    end;
    qeNaklo.SetSQL('where',
      'om.dat>='+ QuotedStr(datetostr(setT.DateFrom)),1);
    qeNaklo.SetSQL('where',
      'om.dat<='+ QuotedStr(datetostr(setT.DateTo))  ,2);

    ProcessVlad;
    ProcessPost;
    ProcessSklad;
    qeNaklo.Prepare;
end;

procedure TfrmNaklp.dspNaklpBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
begin
  if (ukDelete=UpdateKind) and (SourceDS.name='sdsNaklp') then begin
    Applied:=false;
    sdsDelmark.ParamByName('id_nakl').AsInteger:=
			DeltaDS.fieldByName('id_nakl').asInteger;
		dmdEx.execsql(sdsDelmark);
    Applied:=true;
  end;
end;

procedure TfrmNaklp.cdsNaklpReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
	showmessage(e.message);
//	Action := raCancel;
	Action := raAbort;
end;

procedure TfrmNaklp.cdsNaklptReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  showmessage(e.message);
	Action := raAbort;
//  Action := raSkip;
end;


procedure TfrmNaklp.cdsNaklpBeforeScroll(DataSet: TDataSet);
begin
  ApplyOrCancel(cdsNaklp);
end;

procedure TfrmNaklp.cdsNaklptBeforeScroll(DataSet: TDataSet);
begin
	//ApplyOrCancel(cdsNaklp);
	ApplyOrCancel(cdsNaklpt);
end;

procedure TfrmNaklp.cdsNaklptBeforeEdit(DataSet: TDataSet);
begin
	if PostAndApply(cdsNaklp)<>0 then begin
    abort;
	end;
end;

procedure TfrmNaklp.cdsNaklptBeforeDelete(DataSet: TDataSet);
begin
	if PostAndApply(cdsNaklp)<>0 then begin
    abort;
	end;
end;

procedure TfrmNaklp.cdsNaklptAfterDelete(DataSet: TDataSet);
begin
  ApplyOrCancel(cdsNaklpt);
end;

procedure TfrmNaklp.ShowDetail2;
begin
 //if not prohibited to user edit
 if dsNaklpt.DataSet.Tag<>1 then begin
  if dsNaklp.DataSet.FieldByName('tip').asInteger=1 then begin
    frmNaklptEdit.PrepareForPrixod;
  end;
  if dsNaklp.DataSet.FieldByName('tip').asInteger=2 then begin
    frmNaklptEdit.PrepareForIzlishek;
  end;
  frmNaklptEdit.ShowModal;
  RecountNakl;
 end;//tag<>1
end;

procedure TfrmNaklp.ShowDetail1;
begin
  frmNaklpEdit.PrepareForPrixod;
  frmNaklpEdit.DisableSkladEdit(
      (dsNaklp.DataSet.State = dsEdit) and
      (dsNaklp.DataSet.FieldByName('tip').asInteger =2)
    );
  frmNaklpEdit.ShowModal;
  RecountNakl;
end;

procedure TfrmNaklp.cdsNaklptBeforePost(DataSet: TDataSet);
begin
  if DataSet.FieldByName('id_tovar').isNull then begin
    showmessage('Выберите товар');
    abort;
  end;
end;

procedure TfrmNaklp.RecountNakl;
begin
  dmdEx.CalculateSumNaklo(cdsNaklp,cdsNaklpt,1);
end;

procedure TfrmNaklp.dbgNaklptKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
try
  case key of
    vk_return : begin
      actGrid2ListShow.Execute;
    end; //vk_return
    vk_f8: begin
      if (MessageDlg('Вы хотите удалить позицию?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
        if not (cdsNaklpt.bof and cdsNaklpt.eof) then begin
          cdsNaklpt.Delete;
        end;
        PostAndApply(cdsNaklpt);
      end;
    end;
  end; //case
except
  AssertInternal('9E945C46-5D91-4E32-B787-7F9754B4F8CF');
end
end;

procedure TfrmNaklp.dbgNaklpKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return :begin
      actGrid1ListShow.Execute;
    end; //vk_return
    vk_f8: begin
      if (MessageDlg('Вы хотите удалить накладную?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
        if (cdsNaklp.FieldByName('posted').asInteger=1) then begin
          showmessage('Нельзя удалить проведенную накладную');
        end
        else begin //ok to delete
          if not (cdsNaklp.bof and cdsNaklp.eof) then begin
            cdsNaklp.Delete;
          end;
          PostAndApply(cdsNaklp);
        end;   //if posted
      end; //if messagedlg
    end;//vk_f8
  end;//case
end;

procedure TfrmNaklp.actNaklpFilltovarNaklpbuxExecute(Sender: TObject);
begin
  dmdex.StartWaiting;
  sdsNaklpFilltovarNaklpbux.Params.ParamByName('id_nakl').asInteger :=
    dsNaklp.DataSet.FieldByName('id_nakl').asInteger;
  dmdEx.ExecSQL(sdsNaklpFilltovarNaklpbux);
  dmdEx.StopWaiting;
end;

procedure TfrmNaklp.actMakeNaklpbuxExecute(Sender: TObject);
begin
  if  cdsNaklp.Eof and cdsNaklp.Bof then begin
    exit;
  end;
  sdsMakeNaklpbux.Params.ParamByName('id_nakl_in').asInteger :=
    cdsNaklp.FieldByName('id_nakl').asInteger;
  dmdEx.ExecSQL(sdsMakeNaklpbux,true);
end;

procedure TfrmNaklp.actNakloListExecute(Sender: TObject);
begin
  if dsNaklp.DataSet.Eof and dsNaklp.DataSet.Bof then begin
     exit;
  end;
  if ((dsNaklp.DataSet.FieldByName('TIP').AsInteger<>1) and
     (dsNaklp.DataSet.FieldByName('TIP').AsInteger<>-110))
   then begin
    MessageDlg('Тип накладной должен быть ''Приход''',mtWarning,[mbOk],0);
    exit;
  end;
  if dsNaklp.DataSet.FieldByName('parent_id_nakl').IsNull then begin
    MessageDlg('Незаполено поле ''№прих накл''',mtWarning,[mbOk],0);
    exit;
  end;
  OpenDocument(self,
    dsNaklp.DataSet.FieldByName('parent_id_nakl').asInteger,
    0,
    0);
end;



procedure TfrmNaklp.actSebestRecountExecute(Sender: TObject);
var
  iSchet : integer;
begin
  dmdEx.startwaiting;
  sdsSebestRecount.Params.ParamByName('id_nakl').asInteger :=
    cdsNaklp.FieldByName('id_nakl').asInteger;
	//заполняем
  iSchet:=dmdex.GetOidObjects('ТИП СЧЕТА',-100);
  iSchet:=dmdex.GetOidObjects('СЕБЕСТОИМОСТЬ СКЛАД',iSchet);
  sdsSebestRecount.Params.ParamByName('id_schet').asInteger := iSchet;
  dmdEx.ExecSQL(sdsSebestRecount,false);
  dmdEx.stopwaiting;
end;



procedure TfrmNaklp.ProcessVlad;
var
  strUkk : string;
begin
try
  strUkk := setT.GetPluginResult('fmSettingsVlad');
  if (strUkk<>'') then begin
    qeNaklo.SetSql('where','id_zak='+strUkk,3);
  end else begin
    qeNaklo.SetSql('where','',3);
  end;
except
  AssertInternal('6FC43EE5-850B-4FE2-B0BE-8A716FC62E77');
end;
end;

procedure TfrmNaklp.FillManager;
begin
  setT.IDManager :=0;
  //setT.IDManager:=dmdex.GetIdManager;
end;

procedure TfrmNaklp.FillPost;
begin
  SettingsPost := setT.CreatePlugin('TfmSettingsPost');
  //TfmSettingsPost.Create(setT);
  setT.AddPlugin(SettingsPost);
end;

procedure TfrmNaklp.ProcessPost;
var
  strUkk : string;
begin
try
  strUkk := setT.GetPluginResult('fmSettingsPost');
  if (strUkk<>'') then begin
    qeNaklo.SetSql('where','id_izg='+strUkk,4);
  end else begin
    qeNaklo.SetSql('where','',4);
  end;
except
  AssertInternal('24DD8EDA-F819-403F-BF8C-24B69450B818');
end;
end;

procedure TfrmNaklp.FillSklad;
begin
  SettingsSklad := setT.CreatePlugin('TfmSettingsSklad');
  SettingsSklad.SetResultType(1);
  setT.addplugin(SettingsSklad);
end;

procedure TfrmNaklp.ProcessSklad;
var
  sTemp : string;
begin
  sTemp := setT.GetPluginResult('fmSettingsSklad');
  if (sTemp<>'') then begin
    qeNaklo.SetSql('where','id_sklad='+sTemp,5);
  end else begin
    qeNaklo.SetSql('where','',5);
  end;
end;

procedure TfrmNaklp.actShowRepNakloDependExecute(Sender: TObject);
var
  INakloDependImp : INakloDepend;
begin
  INakloDependImp := TfrmRepNakloDepend.Create(self);
  INakloDependImp._addRef;
  INakloDependImp.ShowDetail(dsNaklp.DataSet.FieldByName('id_nakl').asInteger);
end;

procedure TfrmNaklp.actPostExecute(Sender: TObject);
begin
  dmdEx.PostNakl(
    TIntegerField(cdsNaklp.FieldByName('posted')),
    sdsPost,
    TIntegerField(cdsNaklp.FieldByName('id_nakl')),
    not actPost.Checked,
    true);
end;

procedure TfrmNaklp.actGenerateTaraExecute(Sender: TObject);
begin
  sdsGenerateTara.params.ParamByName('id_nakl').AsInteger :=
    dsNaklp.DataSet.FieldByName('id_nakl').asInteger;
  dmdEx.ExecSQL(sdsGenerateTara);
  actRefresh.Execute;
end;

end.

