unit Zakaz;

interface

uses
	Windows, Messages, SysUtils,
	Classes, Graphics,
	Controls, Forms,
	Dialogs,
	DB, DBTables, Grids, DBGrids,
	ActnList,
	StdCtrls,
	QueryExtender,
	DBCtrls,
	ExtCtrls,
	untSchetList,untRound, Curr2StrRU,
	Mask, DBCtrlsEh, DBGridEh,
	untEx, FMTBcd,
	DBClient,
	Provider,
	SqlExpr,
	Buttons,
	Menus ,
	ZakazEdit,
	StrUtils,
	RecError ,
	untSettings,
	untNaklodet ,
	ATSAssert, PropFilerEh, UnfFilter, PropStorageEh,  
   GridsEh, frxClass, frxDBSet,
	Registry,
  DetSelect, // TfrmDetSelect
  SettingsPlugin,
  ZakazDet;


type
	TfrmZakaz = class(TForm)
		ActionList1: TActionList;
		actSettings: TAction;
		actGrid1ListShow: TAction;
		actRefresh: TAction;
		actGrid2ListShow: TAction;
		actRecalc: TAction;
		actAutoRecalc: TAction;
		actCalculateSum: TAction;
		dbgNaklot: TDBGridEh;
		sdsNaklo: TSQLDataSet;
    dsNaklo: TDataSource;
    dspNaklo: TDataSetProvider;
    cdsNaklo: TClientDataSet;
		sdsPost: TSQLDataSet;
    sdsUnpost: TSQLDataSet;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
		qeNaklo: TQueryExtender;
    N2: TMenuItem;
    PopupMenu1: TPopupMenu;
    actShowDeleted: TAction;
    sdsDelmark: TSQLDataSet;
    actBlock: TAction;
    N7: TMenuItem;
		sdsNaklot: TSQLDataSet;
    dspNaklot: TDataSetProvider;
    cdsNaklot: TClientDataSet;
    dsNaklot: TDataSource;
		Splitter1: TSplitter;
		Panel2: TPanel;
    dbgNaklo: TDBGridEh;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    btnUnpost: TBitBtn;
    BitBtn5: TBitBtn;
		BitBtn7: TBitBtn;
		btnBlock: TBitBtn;
    qeNaklot: TQueryExtender;
		PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    UnfFilter1: TUnfFilter;
    UnfFilter2: TUnfFilter;
    PopupMenu2: TPopupMenu;
    actOrder: TAction;
    actUndeleteNakl: TAction;
    N8: TMenuItem;
    sdsNakloID_NAKL: TIntegerField;
    sdsNakloDAT: TSQLTimeStampField;
    sdsNakloID_ZAK: TIntegerField;
    sdsNakloID_MANAGER: TIntegerField;
    sdsNakloBLOCKED: TSmallintField;
    sdsNakloPOSTED: TSmallintField;
    sdsNakloID_MANAGER_SNAB: TIntegerField;
    sdsNakloDAT_OTVET: TSQLTimeStampField;
    sdsNakloCOMMENT: TStringField;
    sdsNakloDELMARKED: TSmallintField;
    cdsNakloID_NAKL: TIntegerField;
    cdsNakloDAT: TSQLTimeStampField;
    cdsNakloID_ZAK: TIntegerField;
    cdsNakloID_MANAGER: TIntegerField;
    cdsNakloBLOCKED: TSmallintField;
    cdsNakloPOSTED: TSmallintField;
    cdsNakloID_MANAGER_SNAB: TIntegerField;
    cdsNakloDAT_OTVET: TSQLTimeStampField;
    cdsNakloCOMMENT: TStringField;
    cdsNakloDELMARKED: TSmallintField;
    cdsNakloIZG: TStringField;
    cdsNakloZAK: TStringField;
    cdsNakloMANAGER: TStringField;
    sdsNaklotID_NAKL: TIntegerField;
    sdsNaklotID_NAKLD: TIntegerField;
    sdsNaklotID_TOVAR: TIntegerField;
    sdsNaklotKOLOTP: TFMTBCDField;
    sdsNaklotCENA: TFMTBCDField;
    sdsNaklotTOVAR_TEXT: TStringField;
    sdsNaklotID_TOVAR_SNAB: TIntegerField;
    sdsNaklotID_POST_SNAB: TIntegerField;
    sdsNaklotCENA_SNAB: TFMTBCDField;
    sdsNaklotSROK_SNAB: TSmallintField;
    sdsNaklotCOMMENT_SNAB: TStringField;
    cdsNaklotID_NAKL: TIntegerField;
    cdsNaklotID_NAKLD: TIntegerField;
    cdsNaklotID_TOVAR: TIntegerField;
    cdsNaklotKOLOTP: TFMTBCDField;
    cdsNaklotCENA: TFMTBCDField;
    cdsNaklotTOVAR_TEXT: TStringField;
    cdsNaklotID_TOVAR_SNAB: TIntegerField;
    cdsNaklotID_POST_SNAB: TIntegerField;
    cdsNaklotCENA_SNAB: TFMTBCDField;
    cdsNaklotSROK_SNAB: TSmallintField;
    cdsNaklotCOMMENT_SNAB: TStringField;
    cdsNaklotTOVAR: TStringField;
    cdsNaklotTOVAR_SNAB: TStringField;
    cdsNaklotPOST: TStringField;
    actPost: TAction;
    actUnpost: TAction;
    sdsNakloID: TStringField;
    cdsNakloID: TStringField;
    sdsNaklotSROK_SNAB_TEXT: TStringField;
    cdsNaklotSROK_SNAB_TEXT: TStringField;
    actSetColumnValue: TAction;
    N3: TMenuItem;
    actAddDet: TAction;
    N4: TMenuItem;
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
		procedure cdsNakloAfterInsert(DataSet: TDataSet);
    procedure cdsNaklotAfterInsert(DataSet: TDataSet);
		procedure cdsNaklotBeforeScroll(DataSet: TDataSet);
		procedure cdsNakloBeforeScroll(DataSet: TDataSet);
    procedure dbgNaklotDblClick(Sender: TObject);
    procedure dbgNakloDblClick(Sender: TObject);
    procedure actPreviewExecute(Sender: TObject);
    procedure dspNakloBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
		procedure actShowDeletedExecute(Sender: TObject);
    procedure cdsNakloReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
		procedure cdsNaklotReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
		procedure actBlockExecute(Sender: TObject);
    procedure actOrderExecute(Sender: TObject);
    procedure actUndeleteNaklExecute(Sender: TObject);
    procedure dbgNakloKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgNaklotKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actPostExecute(Sender: TObject);
    procedure actUnpostExecute(Sender: TObject);
    procedure actSetColumnValueExecute(Sender: TObject);
    procedure actAddDetExecute(Sender: TObject);

	private
		frmZakazEdit : TfrmZakazEdit;
		frmZakazDet : TfrmZakazDet;
    SettingsManager : TfmSettingsPlugin;
    SettingsTipDetail : TfmSettingsPlugin;
		procedure ShowDetail2;
    function ShowDetail1:integer;    
		procedure ProcessShowDeleted;
		procedure qurNaklrCommit;
		//procedure Order;
		procedure ProcessSettings;
    function GetBlockedValue :string;
    procedure UpdateCaption;
    procedure FillSettings;
    procedure FillTipDetail;
    procedure SetTovarSnab;

	public
		{ Public declarations }
		setT : TfrmSettings;
    procedure DefaultStartup;
    procedure DefaultOpen;

	end;
var
	frmZakaz: TfrmZakaz;

implementation

{$R *.dfm}

uses

DateUtils //incDay

;

procedure TfrmZakaz.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	Action := caFree;
end;

procedure TfrmZakaz.actSettingsExecute(Sender: TObject);
begin
  actSettings.checked := setT.ProcessSettingsChange(actRefresh);
end;

procedure TfrmZakaz.actGrid1ListShowExecute(Sender: TObject);
begin
  if (cdsNaklo.FieldByName('ID_NAKL').AsInteger = 0) then  begin
    cdsNaklo.Insert;
  end
  else begin
    if (frmZakazEdit.Visible = false) then begin
      cdsNaklo.Edit;
      ShowDetail1;
    end;
  end;
end;

procedure TfrmZakaz.dbgNaklrDblClick(Sender: TObject);
begin
  actGrid1ListShow.Execute;
end;

procedure TfrmZakaz.DefaultStartup;
begin
try
  ProcessSettings;
  DefaultOpen;
except
  AssertInternal('12366E07-BE6D-4B8C-8A47-C5C766324AD8');
end;
end;

procedure TfrmZakaz.DefaultOpen;
begin
try
	dmdEx.startWaiting;
  qeNaklo.Refresh;
	dmdEx.StopWaiting;
except
  AssertInternal('3BDED84A-6A00-4EE8-A011-54FC5F56CE2E');
end;
end;

procedure TfrmZakaz.FormCreate(Sender: TObject);
begin
try
  dmdEx.StartWaiting;
  PropStorageEh1.Section := self.ClassName;
  PropStorageEh1.LoadProperties;
  PropStorageEh1.Active := true;

  dmdEx.OpenQuery(dmdEx.cdsClient);
  dmdEx.OpenQuery(dmdEx.cdsManager);
  dmdEx.OpenQuery(dmdEx.cdsTovar);
  qeNaklo.DefSql := sdsNaklo.CommandText;
  FillSettings;

  frmZakazEdit := TfrmZakazEdit.Create(self);
  frmZakazEdit.dsNakloEdit.DataSet := cdsNaklo;

  frmZakazDet := TfrmZakazdet.Create(self);
	frmZakazDet.dsNaklotEdit.dataset :=  cdsNaklot;
except
  AssertInternal('D75A53E7-865D-4F25-B935-98BB0543D659');
end;
end;

procedure TfrmZakaz.qurNaklrCommit;
begin
  PostAndApplyOrCancel(cdsNaklo);
end;

procedure TfrmZakaz.actRefreshExecute(Sender: TObject);
begin
try
  dmdEx.StartWaiting;
	qurNaklrCommit;
  ProcessSettings;
  defaultopen;
	//qeNaklo.Refresh;
  dmdEx.StopWaiting;
except
  AssertInternal('FDA31B8B-F0AE-4CA0-87FF-9F81D08B92C0');
end;
end;

procedure TfrmZakaz.FormDestroy(Sender: TObject);
begin
try
  dmdEx.CloseQuery(dmdEx.cdsClient,false);
  dmdEx.CloseQuery(dmdEx.cdsManager,false);
  dmdEx.CloseQuery(dmdEx.cdsTovar,false);
	frmZakazEdit.Free;
  frmZakazDet.Free;
except
  AssertInternal('6F6CE56C-B6D2-4461-B6A9-F4E0FC192E09');
end;
end;

procedure TfrmZakaz.actGrid2ListShowExecute(Sender: TObject);
begin
  if (cdsNaklot.FieldByName('ID_NAKLD').AsInteger = 0) then begin
    cdsNaklot.Insert;
  end else begin
		ShowDetail2;
  end;
end;


procedure TfrmZakaz.actRecalcExecute(Sender: TObject);
begin
	//Order;
	//actCalculateSum.Execute;
end;

procedure TfrmZakaz.FormDeactivate(Sender: TObject);
begin
	qurNaklrCommit;
end;


procedure TfrmZakaz.actCalculateSumExecute(Sender: TObject);
begin
//  CalculateSum(qurNaklp,qurNaklpt );
end;


procedure TfrmZakaz.cdsNakloAfterInsert(DataSet: TDataSet);
var
  intGen,iManager : integer;
begin
  dmdEx.StartWaiting;
  intGen := dmdEx.GetGenValue('naklo_gen');
  DataSet.FieldByName('id_nakl').AsInteger:= intGen;  //assign
  DataSet.FieldByName('id').AsInteger:= dmdEx.GetGenValue('zakaz_gen');
  DataSet.FieldByName('dat').AsDateTime := Now; //default date. time=0
	DataSet.FieldByName('posted').asInteger := 0;
  DataSet.FieldByName('delmarked').asInteger := 0;
  DataSet.FieldByName('blocked').asInteger := 0;
  iManager := dmdEx.GetIdManager;
  if iManager<>0 then begin
    DataSet.FieldByName('id_manager').asInteger := iManager;
  end;
  dmdEx.StopWaiting;
  ShowDetail1;
end;


procedure TfrmZakaz.cdsNaklotAfterInsert(DataSet: TDataSet);
var
  intGen : integer;
begin
  if dsNaklo.DataSet.eof and dsNaklo.DataSet.Bof then begin
    MessageDlg('Создайте новый заказ',mtWarning,[mbok],0);
    abort;
  end;
  dmdEx.StartWaiting;
  intGen := dmdEx.GetGenValue('naklot_gen');
  DataSet.FieldByName('id_nakld').AsInteger := intGen;
  DataSet.FieldByName('id_nakl').AsInteger :=
    cdsNaklo.FieldByName('id_nakl').AsInteger;
  DataSet.FieldByName('id_tovar_snab').asInteger := 0;
  DataSet.FieldByName('id_tovar').asInteger := 0;
  dmdEx.StopWaiting;
	ShowDetail2;
end;

procedure TfrmZakaz.cdsNaklotBeforeScroll(DataSet: TDataSet);
begin
try
  ApplyOrCancel (Dataset);
except
  AssertInternal('5D22C051-79E5-4B0B-9517-8E5B2754C1F8');
end;
end;

procedure TfrmZakaz.cdsNakloBeforeScroll(DataSet: TDataSet);
begin
try
  ApplyOrCancel (Dataset);
//  if cdsNaklo.ChangeCount >0 then begin
//    cdsNaklo.ApplyUpdates(0);
//  end;
except
  AssertInternal('BB8DE88F-3FA9-4C61-8D1B-82500D64440D');
end;
end;


procedure TfrmZakaz.dbgNaklotDblClick(Sender: TObject);
begin
  actGrid2ListShow.Execute;
end;

procedure TfrmZakaz.dbgNakloDblClick(Sender: TObject);
begin
  actGrid1ListShow.Execute;
end;


procedure TfrmZakaz.actPreviewExecute(Sender: TObject);
begin
{
try
	cdsRepNaklo.Close;
	cdsRepNaklo.Params.ParamByName('id_nakl').AsInteger :=
		cdsNaklo.fieldByName('id_nakl').AsInteger;
	cdsRepNaklo.Open;
  frRepNaklo.ShowReport;
except
  on E: Exception do begin
    showmessage (e.message);
  end;
end;
}
end;


procedure TfrmZakaz.dspNakloBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
begin
  if (ukDelete=UpdateKind) and (SourceDS.name='sdsNaklo') then begin
    Applied:=false;
    sdsDelmark.ParamByName('oid').AsInteger:=
      DeltaDS.fieldByName('id_nakl').asInteger;
    //sdsDelmark.ParamByName('oid').AsInteger:=
    //  DeltaDS.fieldByName('tip').asInteger;
		dmdEx.ExecSQL(sdsDelmark);
    Applied:=true;
  end;
end;

procedure TfrmZakaz.actShowDeletedExecute(Sender: TObject);
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

//отображение удалённых накладных для отладки
procedure TfrmZakaz.ProcessShowDeleted;
begin
  if actShowDeleted.Checked then begin
		qeNaklo.SetSQL ('where','om.delmarked=1',3);
  end
  else begin
    qeNaklo.SetSQL ('where','om.delmarked=0',3);
  end;//checked
  qeNaklo.prepare;
end;

{показываем окно нижней детализации
разные окна для отгрузки, для порезки}
procedure TfrmZakaz.ShowDetail2;
begin
 if dsNaklot.DataSet.Tag<>1 then begin
   if (frmZakazDet.Visible = false) then begin
     frmZakazDet.ShowDetail(
       cdsNaklo.fieldbyname('blocked').asInteger,
       cdsNaklo.fieldbyname('posted').asInteger);
   end;
 end;//tag<>1
end;

procedure TfrmZakaz.cdsNakloReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  showmessage(e.message);
  Action := raCancel;
end;

procedure TfrmZakaz.ProcessSettings;
begin
try
  qeNaklo.ProcessPlugin(
    'om.id_manager',
    setT.GetPluginResult('fmSettingsManager'),
    0,
    'in');
  qeNaklo.ProcessPlugin('om.dat',QuotedStr(datetostr(setT.DateFrom)),1,'>=');
  qeNaklo.ProcessPlugin('om.dat',QuotedStr(datetostr(incday(setT.DateTo))),2,'<=');
  ProcessShowDeleted;
  qeNaklo.ProcessPlugin('om.blocked',GetBlockedValue,4,'=');
  qeNaklo.Prepare;
  UpdateCaption;

except
  AssertInternal('2BA49AAA-28EB-45CE-B4B2-F14DC2EC2FDC');
end;
end;

procedure TfrmZakaz.cdsNaklotReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  showmessage (e.Message);
  Action := raCancel;
end;

procedure TfrmZakaz.actBlockExecute(Sender: TObject);
begin
  if (cdsNaklo.FieldByName('blocked').asInteger=0) then begin
    if (MessageDlg('Вы хотите поставить заказ на обработку?',
			 mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
        SetTovarSnab;
        cdsNaklo.Edit;
        cdsNaklo.FieldByName('id_manager').asInteger := dmdEx.GetIdManager;
        cdsNaklo.FieldByName('dat').AsDateTime := Now;
        cdsNaklo.FieldByName('blocked').asInteger:=1;
        cdsNaklo.Post;
        PostAndApplyOrCancel(cdsNaklo);
    end;
  end;
end;


function TfrmZakaz.ShowDetail1:integer;
begin
  Result := dmdEx.ShowDetail1(dsNaklo.DataSet,frmZakazEdit);
  {
  Result :=0;
  if dsNaklo.DataSet.Tag <> 1 then begin
    if (frmZakazEdit.Visible = false) then begin
      //frmZakazEdit.PrepareForRasxod;
      Result := frmZakazEdit.ShowModal;
      //RecountNakl;
    end;
  end;
  }
end;

procedure TfrmZakaz.actOrderExecute(Sender: TObject);
begin
 { TODO : Упорядочить по таре }
end;

procedure TfrmZakaz.actUndeleteNaklExecute(Sender: TObject);
begin
  if actShowDeleted.Checked then begin
    dmdEx.UndeleteNakl(TintegerField(dsNaklo.DataSet.FieldByName('delmarked')),actRefresh);
  end;
end;


procedure TfrmZakaz.dbgNakloKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
try
  case key of
		vk_return :begin
      actGrid1ListShow.Execute;
		end; //vk_return
    vk_f8: begin
      if (MessageDlg('Вы хотите удалить накладную?',
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
    vk_insert : begin
      cdsNaklo.Append;
    end;  //case vk_insert
  end;//case
except
  AssertInternal('5156BD0F-1CA6-435D-A6FB-95E229300329');
end;
end;

procedure TfrmZakaz.dbgNaklotKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
		vk_return : begin
      actGrid2ListShow.Execute;
    end; //vk_return
    vk_f8 : begin
      if (MessageDlg('Вы хотите удалить позицию?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
        if not (cdsNaklot.bof and cdsNaklot.eof) then begin
          cdsNaklot.Delete;
        end;
        PostAndApply(cdsNaklot);
      end;//if messagedlg
    end; //vk_f8
    vk_insert : begin
      cdsNaklot.Append;
    end;  //case vk_insert
	end; //case
end;

procedure TfrmZakaz.UpdateCaption;
var
  Caption: string;
begin
  Caption:='Заказы.'+
    ' Период: c ' + datetostr (setT.DateFrom)+
    ' по '+ datetostr(setT.DateTo)+'. ';
  if setT.GetPluginResult('fmSettingsManager')<>'' then begin
    Caption := Caption + 'Менеджер: '+setT.GetPluginTextResult('fmSettingsManager')+'. ';
  end;
  self.Caption :=caption;
end;

procedure TfrmZakaz.FillSettings;
begin
  //Инициализация настроек
  setT := TfrmSettings.Create(self);
  setT.actManagerOff.execute;
  SettingsManager := setT.CreatePlugin('TfmSettingsManager');
  SettingsManager.SetResultType(2);
  //менеджеры из зоны видимости
  setT.addPlugin(SettingsManager);
  SettingsManager.SetKeyValue(dmdEx.GetIdManager);
  setT.SetPeriod(2);
  FillTipDetail;
end;

procedure TfrmZakaz.actPostExecute(Sender: TObject);
begin
  dmdEx.PostNakl(
    TIntegerField(cdsNaklo.FieldByName('posted')),
    sdsPost,
    TIntegerField(cdsNaklo.FieldByName('id_nakl')),
    not actPost.Checked);
end;

procedure TfrmZakaz.actUnpostExecute(Sender: TObject);
begin
try
 if (cdsNaklo.FieldByName('posted').asInteger = 1) then begin
  if (MessageDlg('Вы хотите сделать заказ необработанным?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
    try
      sdsUNPost.Params[0].AsInteger :=
				cdsNaklo.fieldbyname('id_nakl').AsInteger;
			dmdEx.ExecSQL(sdsUNPost,false);
			cdsNaklo.edit;
			cdsNaklo.FieldByName('posted').AsInteger := 0;
      cdsNaklo.Post;
      cdsNaklo.ApplyUpdates(0);
    except
      on E:EDatabaseError do begin
        if AnsiStartsText('no permission', e.message) then begin
          MessageDlg ('Вы не имеете права проводить накладные',mtWarning,[mbOK],0);
        end
        else begin
          showmessage (e.message);
        end; //if
      end;
		end; //try
  end; //if
 end else begin //if posted
   MessageDlg ('Нельзя возвратить не проведенную накладную',mtWarning,[mbOK],0);
 end; //if posted
except
  AssertInternal('F0483FCD-AF63-423C-9A1A-D39945970276');
end;

end;



procedure TfrmZakaz.FillTipDetail;
begin
  SettingsTipDetail := setT.CreatePlugin('TfmSettingsTipDetail');
  SettingsTipDetail.SetLabelValue('Заказы');
  //SettingsTipDetail.AddDetailTip('Не к обработке'); 
  SettingsTipDetail.AddDetailTip('К обработке');
  SettingsTipDetail.SetResultType(1);
  setT.AddPlugin(SettingsTipDetail);
end;

function TfrmZakaz.GetBlockedValue :string;
begin
  if setT.GetPluginResult('fmSettingsTipDetail')='-1' then begin
    Result:=''
  end;
  if setT.GetPluginResult('fmSettingsTipDetail')='0' then begin
    Result:='1';
  end;
end;

procedure TfrmZakaz.actSetColumnValueExecute(Sender: TObject);
begin
  dbgNaklot.ReadOnly:=false;
  dmdEx.ColumnSet(dbgNaklot);
  dbgNaklot.ReadOnly:=true;
end;

procedure TfrmZakaz.actAddDetExecute(Sender: TObject);
var
  frmDetSelect : TfrmDetSelect;
  //TovarList: TStringList;
begin
  if dsNaklot.DataSet.Eof and dsNaklot.DataSet.Bof then begin
    MessageDlg('Не выбран документ',mtWarning,[mbOk],0);
    exit;
  end;
  frmDetSelect := TfrmDetSelect.Create(Self);
  frmDetSelect.ShowSprTovarSnab;
  if frmDetSelect.ShowModal=mrOk then begin
    //чтобы после вставки не открывалось окно редактирования
    frmDetSelect.InsertDetRows(dsNaklot.DataSet,'id_tovar');
    ApplyOrCancel(dsNaklot.DataSet);
  end;
  frmDetSelect.Free;
end;



procedure TfrmZakaz.SetTovarSnab;
begin
  with cdsNaklot do begin
    tag:=1;
    try
      First;
      while not eof do begin
        Edit;
        FieldByName('id_tovar_snab').asInteger:=
          FieldByName('id_tovar').AsInteger;
        Post;
        Next;
      end;
    finally
      Tag:=0;
    end;
  end;
end;

end.

