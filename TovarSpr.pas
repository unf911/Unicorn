unit TovarSpr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids,
  untEx,
  TovarSprEdit,
  ATSAssert, FMTBcd,
  ActnList, DB, DBClient,
  Provider, SqlExpr, untRound, ExtCtrls, DBCtrls, DBGridEh, UnfFilter,
  QueryExtender, Menus, PropStorageEh, PropFilerEh, GridsEh, Buttons;

type
  TfrmTovarSpr = class(TForm)
    sdsTovar: TSQLDataSet;
    dspTovar: TDataSetProvider;
    cdsTovar: TClientDataSet;
    dsTovar: TDataSource;
    ActionList1: TActionList;
    actRefresh: TAction;
    cdsTovarTOVAR: TIntegerField;
    cdsTovarNAME: TStringField;
    cdsTovarEDIZ_OLD: TStringField;
    cdsTovarTARA: TSmallintField;
    cdsTovarDELMARKED: TSmallintField;
    Panel1: TPanel;
    btnDelete: TButton;
    btnEdit: TButton;
    btnInsert: TButton;
    sdsTovarTOVAR: TIntegerField;
    sdsTovarNAME: TStringField;
    sdsTovarTARA: TSmallintField;
    sdsTovarDELMARKED: TSmallintField;
    sdsTovarID_ANALOG: TIntegerField;
    cdsTovarID_ANALOG: TIntegerField;
    sdsTovarSKLADSKAYA: TSmallintField;
    cdsTovarSKLADSKAYA: TSmallintField;
    DBGridEh1: TDBGridEh;
    UnfFilter1: TUnfFilter;
    sdsTovarWEIGHT: TFloatField;
    cdsTovarWEIGHT: TFloatField;
    qeTovar: TQueryExtender;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    sdsTovarNOTHING: TIntegerField;
    sdsTovarFULLNAME: TStringField;
    cdsTovarNOTHING: TIntegerField;
    cdsTovarFULLNAME: TStringField;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    edtFilter: TEdit;
    cbxContains: TCheckBox;
    cbxFields: TComboBox;
    sdsTovarGRUPPA1: TStringField;
    sdsTovarGRUPPA2: TFloatField;
    sdsTovarGRUPPA3: TFloatField;
    sdsTovarGRUPPA4: TFloatField;
    cdsTovarGRUPPA1: TStringField;
    cdsTovarGRUPPA2: TFloatField;
    cdsTovarGRUPPA3: TFloatField;
    cdsTovarGRUPPA4: TFloatField;
    sdsTovarCOPPERPERKM: TFloatField;
    cdsTovarCOPPERPERKM: TFloatField;
    BitBtn1: TBitBtn;
    cdsMainAnalog: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    SQLDataSet1: TSQLDataSet;
    sdsTovarKODVED: TFMTBCDField;
    cdsTovarKODVED: TFMTBCDField;
    sdsTovarID_EDIZ: TIntegerField;
    cdsTovarID_EDIZ: TIntegerField;
    cdsTovarEDIZ: TStringField;
    sdsTovarEDIZ_OLD: TStringField;
    sdsTovarIMPORT: TSmallintField;
    cdsTovarIMPORT: TSmallintField;
    sdsTovarKODUSL: TStringField;
    cdsTovarKODUSL: TStringField;
    procedure btnDeleteClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure cdsTovarReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure actRefreshExecute(Sender: TObject);
    procedure cdsTovarAfterInsert(DataSet: TDataSet);
    procedure cdsTovarBeforePost(DataSet: TDataSet);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cdsTovarNAMEChange(Sender: TField);
    procedure edtFilterKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbxContainsKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure TovarEdit;
//    procedure  TovarApply;
  public
    { Public declarations }
    procedure DefaultOpen;    
  end;

var
  frmTovarSpr: TfrmTovarSpr;

implementation

{$R *.dfm}

procedure TfrmTovarSpr.btnDeleteClick(Sender: TObject);
begin
try
  if MessageDlg('Удалить запись?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      DelmarkRecord(cdsTovar);
  end; //if
except
  AssertInternal('E25D69A4-6278-43EA-A3BC-DC939B51C829');
end;

end;

procedure TfrmTovarSpr.btnInsertClick(Sender: TObject);
begin
try
  cdsTovar.Insert;
  TovarEdit;
except
  AssertInternal('4FFD7437-51DC-4570-B069-8EBD4C009837');
end;
end;

procedure TfrmTovarSpr.TovarEdit;
begin
try
  dmdEx.CloseQuery(cdsMainAnalog);
  cdsMainAnalog.Params.ParamByName('id_tovar').asInteger:=
    cdsTovar.FieldbyName('id').asInteger;
  dmdEx.OpenQuery(cdsMainAnalog);
  frmTovarSprEdit.ShowModal;
except
  AssertInternal('06159DEB-0DDF-4031-80BC-44AC2DB0148B');
end;
end;


procedure TfrmTovarSpr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmdEx.CloseQuery(dmdex.cdsTovar,false);
  dmdEx.CloseQuery(cdsMainAnalog,false);
  if dmdEx.cdsTovar.Active then begin
    dmdEx.cdsTovar.Refresh;
  end;
  if dmdEx.cdsTara.Active then begin
    dmdEx.cdsTara.Refresh;
  end;
  if dmdEx.cdsTovarAll.Active then begin
    dmdEx.cdsTovarAll.Refresh;
  end;
  if dmdEx.cdsTovarAllND.Active then begin
    dmdEx.cdsTovarAllND.Refresh;
  end;
  Action := caFree;
end;

procedure TfrmTovarSpr.FormCreate(Sender: TObject);
begin
  dmdEx.startWaiting;
  qeTovar.DefSql := sdsTovar.CommandText;
  dmdEx.OpenQuery(cdsTovar);
  dmdEx.OpenQuery(dmdex.cdsTovar);
  //dmdEx.OpenQuery(cdsMainAnalog);
  frmTovarSprEdit := TfrmTovarSprEdit.Create (self);
  frmTovarSprEdit.dsTovarEdit.Dataset := cdsTovar;
  frmTovarSprEdit.dsMainAnalog.Dataset := cdsMainAnalog;


	//заполение списка полей для поисковой формы вверху
  FillFieldNamesForFiltering(cbxFields, DBGridEh1);
  dmdEx.stopWaiting;
end;

procedure TfrmTovarSpr.btnEditClick(Sender: TObject);
begin
try
  TovarEdit;
except
  assertInternal('1BCB1571-38DE-41FA-A8C9-6E693C51F1FF');
end;
end;

procedure TfrmTovarSpr.cdsTovarReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
	showmessage (e.message);
	Action := raSkip;
end;

procedure TfrmTovarSpr.actRefreshExecute(Sender: TObject);
begin
try
  dmdex.StartWaiting;
  cdsTovar.Refresh;
  dmdex.StopWaiting;  
except
  AssertInternal('E2846389-49A7-4131-8B11-C3B963C22E71');
end;
end;

procedure TfrmTovarSpr.cdsTovarAfterInsert(DataSet: TDataSet);
begin
try
  cdsTovar.FieldByName('id').asInteger :=
    dmdEx.GetGenValue('oid_gen');
  cdsTovar.FieldByName('tara').asInteger:=2;
  cdsTovar.FieldByName('delmarked').asInteger := 0;
  cdsTovar.FieldByName('id_analog').asInteger :=
    cdsTovar.FieldByName('id').asInteger ;
except
  AssertInternal('194D416F-A6E1-4B2E-8A52-59D36EEFAEF6');
end;
end;

procedure TfrmTovarSpr.cdsTovarBeforePost(DataSet: TDataSet);
begin
  if cdsTovar.FieldByName('NAME').IsNull then begin
    showmessage('Введите название товара');
    Abort;
  end;
end;

procedure TfrmTovarSpr.DefaultOpen;
begin
try
  dmdEx.StartWaiting;
  qeTovar.Refresh;
  dmdEx.StopWaiting;
except
  AssertInternal('2DE7863B-198A-4487-A5E1-C9983E385921');
end;
end;

procedure TfrmTovarSpr.DBGridEh1DblClick(Sender: TObject);
begin
try
  TovarEdit;
except
  assertInternal('469936C8-C003-4477-BBA8-27379E13DC37');
end;
end;


procedure TfrmTovarSpr.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return :begin
      btnEdit.Click;
    end;
    vk_insert : begin
      btnInsert.Click;
    end;
    vk_f8 : begin
      btnDelete.Click;
    end;
  end;
end;

procedure TfrmTovarSpr.cdsTovarNAMEChange(Sender: TField);
begin
  if ((cdsTovar.FieldByName('Name').OldValue=
    cdsTovar.FieldByName('FullName').OldValue) or
    ((cdsTovar.State=dsInsert) and (cdsTovar.FieldByName('FullName').asString='')))
  then begin
    cdsTovar.FieldByName('FullName').asString :=
      cdsTovar.FieldByName('Name').asString
  end;
end;

procedure TfrmTovarSpr.edtFilterKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_return then begin
    //изменилась строка для фильтра
    FilterChanged(cbxFields,cbxContains,edtFilter,DBGridEh1);
  end;
end;

procedure TfrmTovarSpr.cbxContainsKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //Пользователь изменил  галочку "содержит"
  FilterChanged(cbxFields,cbxContains,edtFilter,DBGridEh1);
end;

end.
