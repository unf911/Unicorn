unit DolgBuxDet;

interface

uses
  Windows, Messages, SysUtils, Variants,
  Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, DB, DBTables, Grids,
  DBGrids,
  StdCtrls, Mask, DBCtrls, ComCtrls,
  Buttons, QueryExtender,

  FMTBcd, Menus, DBClient, Provider,
  SqlExpr, frxClass, GridsEh, DBGridEh,
  atsAssert, ExtCtrls, PropFilerEh, PropStorageEh,
  UnfFilter, untRound;

type
  TfrmDolgBuxDet = class(TForm)
    ActionList1: TActionList;
    actClose: TAction;
    actRecalc: TAction;
    dtsNakl: TDataSource;
    dtsOpl: TDataSource;
    actRefresh: TAction;
    dsDolg: TDataSource;
    GroupBox1: TGroupBox;
    medDateFrom: TDateTimePicker;
    medDateTo: TDateTimePicker;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    GroupBox2: TGroupBox;
    dbeDolgAfter: TDBEdit;
    Label3: TLabel;
    Label1: TLabel;
    dbeDolgBefore: TDBEdit;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    BitBtn1: TBitBtn;
    dbeIZG: TEdit;
    dbeZAK: TEdit;
    qeDolg: TQueryExtender;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    Label10: TLabel;
    DBEdit3: TDBEdit;
    BitBtn2: TBitBtn;
    actPreview: TAction;
    actDesigner: TAction;
    BitBtn3: TBitBtn;
    frUserDataset1: TfrxUserDataSet;
    sdsDolgBux: TSQLDataSet;
    dspDolgBux: TDataSetProvider;
    cdsDolg: TClientDataSet;
    cdsDolgSUB1: TIntegerField;
    cdsDolgSUB2: TIntegerField;
    cdsDolgIZG: TStringField;
    cdsDolgZAK: TStringField;
    cdsDolgDEBETBEFORE: TFloatField;
    cdsDolgKREDITBEFORE: TFloatField;
    cdsDolgDEBET: TFloatField;
    cdsDolgKREDIT: TFloatField;
    cdsDolgDEBETAFTER: TFloatField;
    cdsDolgKREDITAFTER: TFloatField;
    SQLDataSet1: TSQLDataSet;
    DataSetProvider1: TDataSetProvider;
    cdsNakl: TClientDataSet;
    DBGridEh1: TDBGridEh;
    cdsNaklID_NAKL: TIntegerField;
    cdsNaklDAT: TSQLTimeStampField;
    cdsNaklID: TStringField;
    cdsNaklID_MANAGER: TIntegerField;
    cdsNaklNDS: TFloatField;
    cdsNaklTIP: TIntegerField;
    cdsNaklMANAGER: TStringField;
    SQLDataSet2: TSQLDataSet;
    DataSetProvider2: TDataSetProvider;
    cdsOpl: TClientDataSet;
    IntegerField1: TIntegerField;
    SQLTimeStampField1: TSQLTimeStampField;
    StringField1: TStringField;
    IntegerField2: TIntegerField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    IntegerField3: TIntegerField;
    DBGridEh2: TDBGridEh;
    cdsDolgIZGFULLNAME: TStringField;
    cdsDolgZAKFULLNAME: TStringField;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    actDetail1: TAction;
    N1: TMenuItem;
    actDetail2: TAction;
    N2: TMenuItem;
    Splitter1: TSplitter;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    UnfFilter1: TUnfFilter;
    UnfFilter2: TUnfFilter;
    frActSv: TfrxReport;
    procedure actCloseExecute(Sender: TObject);
    procedure actRecalcExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure actDesignerExecute(Sender: TObject);
    procedure actPreviewExecute(Sender: TObject);
    procedure frUserDataset1First(Sender: TObject);
    procedure frUserDataset1Next(Sender: TObject);
    procedure frUserDataset1CheckEOF(Sender: TObject; var Eof: Boolean);
    procedure frUserDataset1Prior(Sender: TObject);
    procedure frActSvGetValue(const ParName: String;
      var ParValue: Variant);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actDetail1Execute(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh2DblClick(Sender: TObject);
    procedure actDetail2Execute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDolgBuxDet: TfrmDolgBuxDet;

implementation

uses untEx,

  SkladAux;

{$R *.dfm}

procedure TfrmDolgBuxDet.actCloseExecute(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmDolgBuxDet.actRecalcExecute(Sender: TObject);
begin
  dmdEx.startwaiting;
  cdsDolg.Close;
  cdsDolg.Params.ParamByName('dat_from').AsDate := medDateFrom.Date;
  cdsDolg.params.ParamByName('dat_to').AsDate := medDateTo.Date;
  cdsDolg.Open;
  //qeDolg.Refresh;

  cdsOpl.Close;
  cdsOpl.Params.ParamByName('sub1_in').asInteger :=
    cdsDolg.Params.parambyname('sub1_in').asInteger;
  cdsOpl.Params.ParamByName('sub2_in').asInteger :=
    cdsDolg.Params.parambyName('sub2_in').asInteger;
  cdsOpl.Params.ParamByName('dat_from').asDate :=
    cdsDolg.Params.ParamByName('dat_from').AsDate;
  cdsOpl.Params.ParamByName('dat_to').asDate :=
    cdsDolg.Params.ParambyName('dat_to').asDate;
  cdsOpl.Open;

  cdsNakl.Close;
  cdsNakl.Params.ParamByName('sub1_in').asInteger :=
    cdsDolg.Params.parambyname('sub1_in').asInteger;
  cdsNakl.Params.ParamByName('sub2_in').asInteger :=
    cdsDolg.Params.parambyName('sub2_in').asInteger;
  cdsNakl.Params.ParamByName('dat_from').asDate :=
    cdsDolg.Params.ParamByName('dat_from').AsDate;
  cdsNakl.Params.ParamByName('dat_to').asDate :=
    cdsDolg.Params.ParambyName('dat_to').asDate;
  cdsNakl.Open;
  dmdEx.StopWaiting;
end;

procedure TfrmDolgBuxDet.actRefreshExecute(Sender: TObject);
begin
  actRecalc.Execute;
end;



procedure TfrmDolgBuxDet.actDesignerExecute(Sender: TObject);
begin
try
  frActSv.DesignReport;
except
  AssertInternal('D311635B-C7BA-4B95-A214-A07E00B38E70');
end;
end;

procedure TfrmDolgBuxDet.actPreviewExecute(Sender: TObject);
begin
try
  actRefresh.Execute;
  dmdEx.GetReport('ActSv.fr3',frActSv);
  frActSv.PrepareReport;
  frActSv.ShowReport;
except
  AssertInternal('C4B9CE38-B97B-4532-8461-87F61D583C73');
end;
end;

procedure TfrmDolgBuxDet.frUserDataset1First(Sender: TObject);
begin
try
  dtsOpl.DataSet.First;
  dtsNakl.DataSet.First;
except
  AssertInternal('EAA3D720-BA6C-4FAA-BF16-EF296A1AEA2E');
end;
end;

procedure TfrmDolgBuxDet.frUserDataset1Next(Sender: TObject);
begin
try
  if not dtsOpl.DataSet.Eof then begin
    dtsOpl.DataSet.Next;
  end
  else begin
    dtsNakl.DataSet.Next;
  end;
except
  AssertInternal('FA1674BE-0207-499B-8309-787DD0987065');
end;
end;

procedure TfrmDolgBuxDet.frUserDataset1CheckEOF(Sender: TObject;
  var Eof: Boolean);
begin
try
  eof := false;
  if dtsOpl.DataSet.Eof and dtsNakl.DataSet.Eof then begin
    eof := true;
  end;
except
  AssertInternal('B5FDD0B7-C220-4922-A296-8CD51516D842');
end;
end;

procedure TfrmDolgBuxDet.frUserDataset1Prior(Sender: TObject);
begin
try
  if not dtsNakl.DataSet.bof then begin
    dtsNakl.DataSet.Prior;
  end
  else begin
    dtsOpl.DataSet.prior;
  end;
except
  AssertInternal('A30BB6A4-8FD7-48B9-A2B7-7606132E578C');
end;
end;

procedure TfrmDolgBuxDet.frActSvGetValue(const ParName: String;
  var ParValue: Variant);
begin
try
  if AnsiUpperCase(ParName)='SIZG' then begin
    ParValue := dsDolg.Dataset.FieldByName('IZGFULLNAME').asString;
  end;
  if AnsiUpperCase(ParName)='SZAK' then begin
    ParValue := dsDolg.Dataset.FieldByName('ZAKFULLNAME').asString;
  end;
  if AnsiUpperCase(ParName)='SDATETO' then begin
    ParValue := medDateTo.Date;
  end;
  if AnsiUpperCase(ParName)='SDATEFROM' then begin
    ParValue := medDateFrom.Date;
  end;
  if AnsiUpperCase(ParName)='DATDOC' then begin
    if not dtsOpl.DataSet.eof then begin
      ParValue := dtsOpl.DataSet.FieldByName('dat').AsDateTime;
    end else begin
      ParValue := dtsNakl.DataSet.FieldByName('dat').AsDateTime;
    end;
  end;
  if AnsiUpperCase(ParName)='OPER' then begin
    if not dtsOpl.DataSet.eof then begin
      ParValue := 'Оплата';
    end else begin
      ParValue := 'Накладная';
    end;
  end;
  if AnsiUpperCase(ParName)='NOMER' then begin
    if dtsOpl.DataSet.eof then begin
      ParValue := dtsNakl.DataSet.FieldByName('id').asString;
    end;
  end;
  if AnsiUpperCase(ParName)='DEBET' then begin
    if dtsOpl.DataSet.eof then begin
      ParValue := dtsNakl.DataSet.FieldByName('nds').asFloat;
    end;
  end;
  if AnsiUpperCase(ParName)='KREDIT' then begin
    if not dtsOpl.DataSet.eof then begin
      ParValue := dtsOpl.DataSet.FieldByName('nds').asFloat;
    end;
  end;

  if AnsiUpperCase(ParName)='DEBETBEGIN' then begin
    ParValue := dsDolg.DataSet.FieldByName('debetbefore').asFloat;
  end;
  if AnsiUpperCase(ParName)='KREDITBEGIN' then begin
    ParValue := dsDolg.DataSet.FieldByName('kreditbefore').asFloat;
  end;
  if AnsiUpperCase(ParName)='DEBETSUM' then begin
    ParValue := dsDolg.DataSet.FieldByName('debet').asFloat;
  end;
  if AnsiUpperCase(ParName)='KREDITSUM' then begin
    ParValue := dsDolg.DataSet.FieldByName('kredit').asFloat;
  end;
  if AnsiUpperCase(ParName)='DEBETEND' then begin
    ParValue := dsDolg.DataSet.FieldByName('debetafter').asFloat;
  end;
  if AnsiUpperCase(ParName)='KREDITEND' then begin
    ParValue := dsDolg.DataSet.FieldByName('kreditafter').asFloat;
  end;

except
  AssertInternal ('2F2B84D4-12DE-4420-9289-A22DF356F769');
end;
end;

procedure TfrmDolgBuxDet.FormCreate(Sender: TObject);
begin
  dmdEx.OpenQuery(dmdEx.cdsAllClient);
  ShowCopyForRoleOrUser(DBGridEh1,'POWER_USER;BUXG','SYSDBA');
  ShowCopyForRoleOrUser(DBGridEh2,'POWER_USER;BUXG','SYSDBA');
end;

procedure TfrmDolgBuxDet.FormDestroy(Sender: TObject);
begin
  dmdEx.CloseQuery(dmdEx.cdsAllClient,false);
end;

procedure TfrmDolgBuxDet.actDetail1Execute(Sender: TObject);
begin
  if dtsNakl.DataSet.Eof and dtsNakl.DataSet.Bof then begin
    exit;
  end;
  OpenDocument(self,
    dtsNakl.DataSet.fieldByname('id_nakl').AsInteger,
    dtsNakl.DataSet.FieldByName('tip').asInteger,0);
end;

procedure TfrmDolgBuxDet.DBGridEh1DblClick(Sender: TObject);
begin
  actDetail1.Execute;
end;

procedure TfrmDolgBuxDet.DBGridEh2DblClick(Sender: TObject);
begin
  actDetail2.Execute;
end;

procedure TfrmDolgBuxDet.actDetail2Execute(Sender: TObject);
begin
  if dtsOpl.DataSet.Eof and dtsOpl.DataSet.Bof then begin
    exit;
  end;
  OpenDocument(self,
    dtsOpl.DataSet.fieldByname('id_nakl').AsInteger,
    dtsOpl.DataSet.FieldByName('tip').asInteger,0);
end;

procedure TfrmDolgBuxDet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
