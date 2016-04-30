unit ClientSpr;

interface

uses
  Windows, Messages, SysUtils, Variants,
  Classes, Graphics, Controls, Forms,
  Dialogs,
  DB, DBTables,
  Grids, DBGridEh,

  StdCtrls,Registry,
  untEx, FMTBcd, SqlExpr,
  DBClient, Provider, ClientSprEdit,
  Buttons, ActnList,
  ATSAssert, Menus,
  UnfFilter, PropStorageEh, PropFilerEh, GridsEh, ExtCtrls, QueryExtender;

type
  TfrmClientSpr = class(TForm)
    dbgClient: TDBGridEh;
    cbxFields: TComboBox;
    edtFilter: TEdit;
    sdsKlient: TSQLDataSet;
    dspKlient: TDataSetProvider;
    dsKlient: TDataSource;
    cdsKlient: TClientDataSet;
    cdsKlientNAME: TStringField;
    cdsKlientIPN: TStringField;
    cdsKlientSVREG: TStringField;
    cdsKlientOKPO: TStringField;
    cdsKlientINDEXI: TFloatField;
    cdsKlientOBLAST: TStringField;
    cdsKlientTEL: TStringField;
    cdsKlientFAX: TStringField;
    cdsKlientFORIN: TStringField;
    cdsKlientLICO: TStringField;
    cdsKlientFIO: TStringField;
    cdsKlientOTV: TStringField;
    cdsKlientGOROD: TStringField;
    cdsKlientSTAN: TStringField;
    cdsKlientID: TIntegerField;
    cdsKlientTIP: TIntegerField;
    cdsKlientDELMARKED: TSmallintField;
    ActionList1: TActionList;
    actApply: TAction;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    actRefresh: TAction;
    N2: TMenuItem;
    cdsKlientFULLNAME: TStringField;
    UnfFilter1: TUnfFilter;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    cbxContains: TCheckBox;
    actRefreshReferenceTables: TAction;
    cdsKlientMANAGER: TStringField;
    cdsKlientID_MANAGER: TIntegerField;
    cdsKlientDAT_OSNOV: TSQLTimeStampField;
    cdsKlientOFFICESKLAD: TStringField;
    cdsKlientSOTRUDNIKOV_OT: TIntegerField;
    cdsKlientSOTRUDNIKOV_DO: TStringField;
    cdsKlientFILIALY: TStringField;
    cdsKlientID_ANALOG: TIntegerField;
    cdsKlientKTOZAKUPAET: TStringField;
    cdsKlientKAKOYKABELNUGEN: TStringField;
    cdsKlientOBJEMZAGOD: TStringField;
    cdsKlientOBJEMZA6MESYATSEV: TStringField;
    cdsKlientKTOMOGETPORUCHITSYA: TStringField;
    cdsKlientVASHIPARTNERY: TStringField;
    cdsKlientVASHIKONKURENTY: TStringField;
    cdsKlientFINANSOVOEPOLOGENIE: TStringField;
    cdsKlientDELOVAYAREPUTACIYA: TStringField;
    cdsKlientRASPOLAGAETLIKONKURENT: TStringField;
    cdsKlientID_SFERADEYATELNOSTI: TIntegerField;
    cdsKlientSFERA: TStringField;
    cdsKlientANALOG: TStringField;
    cdsKlientID_RESULT: TIntegerField;
    cdsKlientDAT_CONTACT: TSQLTimeStampField;
    cdsKlientRESULT: TStringField;
    cdsKlientMODIFIED: TSQLTimeStampField;
    sdsKlientNAME: TStringField;
    sdsKlientIPN: TStringField;
    sdsKlientSVREG: TStringField;
    sdsKlientOKPO: TStringField;
    sdsKlientINDEXI: TFloatField;
    sdsKlientOBLAST: TStringField;
    sdsKlientTEL: TStringField;
    sdsKlientFAX: TStringField;
    sdsKlientFORIN: TStringField;
    sdsKlientLICO: TStringField;
    sdsKlientFIO: TStringField;
    sdsKlientOTV: TStringField;
    sdsKlientGOROD: TStringField;
    sdsKlientSTAN: TStringField;
    sdsKlientID: TIntegerField;
    sdsKlientTIP: TIntegerField;
    sdsKlientDELMARKED: TSmallintField;
    sdsKlientFULLNAME: TStringField;
    sdsKlientDAT_OSNOV: TSQLTimeStampField;
    sdsKlientOFFICESKLAD: TStringField;
    sdsKlientSOTRUDNIKOV_OT: TIntegerField;
    sdsKlientSOTRUDNIKOV_DO: TStringField;
    sdsKlientFILIALY: TStringField;
    sdsKlientID_ANALOG: TIntegerField;
    sdsKlientKTOZAKUPAET: TStringField;
    sdsKlientKAKOYKABELNUGEN: TStringField;
    sdsKlientOBJEMZAGOD: TStringField;
    sdsKlientOBJEMZA6MESYATSEV: TStringField;
    sdsKlientKTOMOGETPORUCHITSYA: TStringField;
    sdsKlientVASHIPARTNERY: TStringField;
    sdsKlientVASHIKONKURENTY: TStringField;
    sdsKlientFINANSOVOEPOLOGENIE: TStringField;
    sdsKlientDELOVAYAREPUTACIYA: TStringField;
    sdsKlientRASPOLAGAETLIKONKURENT: TStringField;
    sdsKlientID_SFERADEYATELNOSTI: TIntegerField;
    sdsKlientID_MANAGER: TIntegerField;
    sdsKlientID_RESULT: TIntegerField;
    sdsKlientDAT_CONTACT: TSQLTimeStampField;
    sdsKlientOBLAST2: TStringField;
    sdsKlientMODIFIED: TSQLTimeStampField;
    sdsKlientID_PRICE: TIntegerField;
    sdsKlientID_SKIDKA: TIntegerField;
    cdsKlientID_PRICE: TIntegerField;
    cdsKlientID_SKIDKA: TIntegerField;
    sdsKlientID_USL_POSTAVKA: TIntegerField;
    cdsKlientID_USL_POSTAVKA: TIntegerField;
    Panel1: TPanel;
    btnInsert: TButton;
    btnEdit: TButton;
    btnDelete: TButton;
    BitBtn1: TBitBtn;
    btnOk: TBitBtn;
    sdsKlientADRP: TStringField;
    sdsKlientADRES: TStringField;
    cdsKlientADRES: TStringField;
    cdsKlientADRP: TStringField;
    sdsKlientISDEFAULT: TSmallintField;
    sdsKlientCREATED: TSQLTimeStampField;
    cdsKlientOBLAST2: TStringField;
    cdsKlientISDEFAULT: TSmallintField;
    cdsKlientCREATED: TSQLTimeStampField;
    actShowDeleted: TAction;
    N3: TMenuItem;
    qeKlient: TQueryExtender;
    sdsKlientLGOTY: TIntegerField;
    cdsKlientLGOTY: TIntegerField;
    sdsKlientPLAT_ED_NALOGA: TSmallintField;
    sdsKlientIS_FIZLICO: TSmallintField;
    cdsKlientPLAT_ED_NALOGA: TSmallintField;
    cdsKlientIS_FIZLICO: TSmallintField;
    sdsKlientNOMER_FILIALA: TSmallintField;
    cdsKlientNOMER_FILIALA: TSmallintField;
    procedure dbgClientDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnInsertClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure cdsKlientAfterInsert(DataSet: TDataSet);
    procedure btnCancelClick(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure cdsKlientReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsKlientBeforePost(DataSet: TDataSet);
    procedure cdsKlientAttrAfterInsert(DataSet: TDataSet);
    procedure cdsKlientAttrReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsKlientNAMEChange(Sender: TField);
    procedure dbgClientKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDeactivate(Sender: TObject);
    procedure actRefreshReferenceTablesExecute(Sender: TObject);
    procedure cbxContainsClick(Sender: TObject);
    procedure edtFilterKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actShowDeletedExecute(Sender: TObject);
  private
    { Private declarations }
    frmClientEdit : TfrmClientEdit;
    procedure ProcessShowDeleted;
    procedure ClientEdit;
  public
    { Public declarations }
  end;

var
  frmClientSpr: TfrmClientSpr;

implementation

{$R *.dfm}

uses
  untRound;

procedure TfrmClientSpr.dbgClientDblClick(Sender: TObject);
begin
  ClientEdit;
end;

//процедура открывает окно редактирования формы
procedure TfrmClientSpr.ClientEdit;
begin
  dmdEx.StartWaiting;
  frmClientEdit.ShowModal;
  dmdEx.StopWaiting;
end;

procedure TfrmClientSpr.FormCreate(Sender: TObject);
begin
  qeKlient.DefSql := sdsKlient.CommandText;
  ProcessShowDeleted;

	dmdEx.startwaiting;
  dmdex.OpenQuery(dmdEx.cdsManager);
	qeKlient.Refresh();
	frmClientEdit := TfrmClientEdit.Create (self);
	frmClientEdit.dsKlientEdit.Dataset := cdsKlient;
	//заполение списка полей для поисковой формы вверху
  FillFieldNamesForFiltering(cbxFields, dbgClient);
  dsKlient.DataSet.First;
  dmdEx.stopWaiting;
end;

procedure TfrmClientSpr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  actRefreshReferenceTables.Execute;
  Action := caFree;
end;

procedure TfrmClientSpr.btnInsertClick(Sender: TObject);
begin
  cdsKlient.Insert;
  ClientEdit;
end;

procedure TfrmClientSpr.btnDeleteClick(Sender: TObject);
begin
try
  if MessageDlg('Удалить запись?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      DelmarkRecord(cdsKlient);
  end; //if
except
  AssertInternal('AC37A8C7-9226-4B7D-A91B-C8825B3421DB');
end;
end;

procedure TfrmClientSpr.btnEditClick(Sender: TObject);
begin
  cdsKlient.Edit;
  ClientEdit;
end;

procedure TfrmClientSpr.cdsKlientAfterInsert(DataSet: TDataSet);
begin
  cdsKlient.FieldByName('id').asInteger :=
    dmdEx.GetGenValue('oid_gen');
  cdsKlient.FieldByName('tip').asInteger := 2;
  cdsKlient.FieldByName('delmarked').asInteger := 0;
  cdsKlient.FieldByName('lgoty').asInteger := 0;
  if dmdEx.GetIdManager<>0 then
    cdsKlient.FieldByName('id_manager').asInteger := dmdEx.GetIdManager;
  DataSet.FieldByName('modified').AsDateTime := Now;
end;

procedure TfrmClientSpr.btnCancelClick(Sender: TObject);
begin
  cdsKlient.CancelUpdates;
  self.Close;
end;

procedure TfrmClientSpr.actApplyExecute(Sender: TObject);
begin
  if cdsKlient.ChangeCount>0 then begin
    cdsKlient.ApplyUpdates(0);
    if dmdEx.cdsVlad.Active then begin
      dmdEx.cdsVlad.Refresh;
    end;
    if dmdEx.cdsPost.Active then begin
      dmdEx.cdsPost.Refresh;
    end;
    if dmdEx.cdsClient.Active then begin
      dmdEx.cdsClient.Refresh;
    end;
  end;//if
end;

procedure TfrmClientSpr.btnOkClick(Sender: TObject);
begin
  actApply.Execute;
  close;
end;

procedure TfrmClientSpr.actRefreshExecute(Sender: TObject);
begin
try
  dmdEx.StartWaiting;
  cdsKlient.Refresh;
  dmdEx.stopwaiting;
except
  AssertInternal('{E4CB9174-BA30-4AEE-890E-ED65C08B9678}');
end;
end;

procedure TfrmClientSpr.cdsKlientReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
	Action :=raAbort;
  if (Pos('UNIQUE',e.message)<>0) then begin
    showmessage ('Такой клиент уже существует. Измените название клиента. '+
      'Или отмените редактирование и найдите существующего клиента');
    exit;
  end;
	showmessage (e.message);

end;

procedure TfrmClientSpr.cdsKlientBeforePost(DataSet: TDataSet);
begin
  if cdsKlient.FieldByName('name').IsNull then begin
    showmessage('Введите название клиента');
    abort;
  end;
end;

procedure TfrmClientSpr.cdsKlientAttrAfterInsert(DataSet: TDataSet);
begin
	with dataset do begin
		FieldByName('oid').asInteger:=
			dsKlient.DataSet.FieldByName('id').asInteger;
		FieldByName('attribute_id').asInteger:=1;
	end;
end;

procedure TfrmClientSpr.cdsKlientAttrReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  showmessage(e.message);
	Action :=raAbort;
end;

procedure TfrmClientSpr.cdsKlientNAMEChange(Sender: TField);
begin
  {
  if ((cdsKlient.FieldByName('Name').OldValue=
    cdsKlient.FieldByName('FullName').OldValue) or
    ((cdsKlient.state=dsInsert) and (cdsKlient.FieldByName('Fullname').asString='')))
  then begin
  }
  if ((cdsKlient.state=dsInsert) and (cdsKlient.FieldByName('Fullname').asString=''))
  then begin
    cdsKlient.FieldByName('FullName').asString :=
      cdsKlient.FieldByName('Name').asString;
  end;
end;

procedure TfrmClientSpr.dbgClientKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    vk_return: begin
      btnEdit.Click;
    end ; //vk_return
    vk_insert : begin
      btnInsert.Click;
    end;
    vk_f8 : begin
      btnDelete.Click;
    end;
  end; //case
end;

procedure TfrmClientSpr.FormDeactivate(Sender: TObject);
begin
  actRefreshReferenceTables.Execute;
end;

procedure TfrmClientSpr.actRefreshReferenceTablesExecute(Sender: TObject);
begin
  dmdEx.StartWaiting;
  if dmdEx.cdsVlad.Active then begin
    dmdEx.cdsVlad.Refresh;
  end;
  if dmdEx.cdsPost.Active then begin
    dmdEx.cdsPost.Refresh;
  end;
  if dmdEx.cdsClient.Active then begin
    dmdEx.cdsClient.Refresh;
  end;
  if dmdEx.cdsAllClient.Active then begin
    dmdEx.cdsAllClient.Refresh;
  end;
  if dmdEx.cdsBank.Active then begin
    dmdEx.cdsBank.Refresh;
  end;
  dmdEx.StopWaiting;
end;

procedure TfrmClientSpr.cbxContainsClick(Sender: TObject);
begin
  //Пользователь изменил  галочку "содержит"
  FilterChanged(cbxFields,cbxContains,edtFilter,dbgClient);
end;

procedure TfrmClientSpr.edtFilterKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then begin
    //изменилась строка для фильтра
    FilterChanged(cbxFields,cbxContains,edtFilter,dbgClient);
  end;
end;

procedure TfrmClientSpr.actShowDeletedExecute(Sender: TObject);
begin
  dmdEx.StartWaiting;
	actShowDeleted.Checked := not actShowDeleted.Checked;
  ProcessShowDeleted;
  qeKlient.Refresh;
//  cdsNaklo.Close;
//  cdsNaklo.Open;
  dmdEx.StopWaiting;
end;

procedure TfrmClientSpr.ProcessShowDeleted;
begin
  if actShowDeleted.Checked then begin
		qeKlient.SetSQL ('where','delmarked=1',0);
  end
  else begin
    qeKlient.SetSQL ('where','delmarked=0',0);
  end;//checked
  qeKlient.prepare;
end;

end.
