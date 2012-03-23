unit RepDolgBuxPostDet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, DB, DBTables, Grids, DBGrids,
  StdCtrls, Mask, DBCtrls, ComCtrls,
  Buttons, QueryExtender,  FMTBcd, UnfFilter, Menus, DBClient,
  Provider, SqlExpr,  GridsEh, DBGridEh, frxClass,
  atsAssert,
  SkladAux, ExtCtrls, PropFilerEh, PropStorageEh;

type
  TfrmRepDolgBuxPostDet = class(TForm)
    ActionList1: TActionList;
    actClose: TAction;
    actRefresh: TAction;
    dtsNakl: TDataSource;
    dtsOpl: TDataSource;
    dsDolg: TDataSource;
    GroupBox1: TGroupBox;
    medDateFrom2: TDateTimePicker;
    medDateTo2: TDateTimePicker;
    LabelDatFrom: TLabel;
    LabelDatTo: TLabel;
    Label_1: TLabel;
    Label_2: TLabel;
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
    dbe_1: TEdit;
    dbe_2: TEdit;
    qeDolg: TQueryExtender;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    Label10: TLabel;
    DBEdit3: TDBEdit;
    BitBtn2: TBitBtn;
    actPreview: TAction;
    actDesigner: TAction;
    BitBtn3: TBitBtn;
    frUserDataset1: TfrxUserDataset;
    sdsDolgBux: TSQLDataSet;
    dspDolgBux: TDataSetProvider;
    cdsDolg: TClientDataSet;
    sdsNakl: TSQLDataSet;
    dspNakl: TDataSetProvider;
    cdsNakl: TClientDataSet;
    DBGridEh1: TDBGridEh;
    sdsOpl: TSQLDataSet;
    dspOpl: TDataSetProvider;
    cdsOpl: TClientDataSet;
    DBGridEh2: TDBGridEh;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    actDetail1: TAction;
    N1: TMenuItem;
    actDetail2: TAction;
    N2: TMenuItem;
    qeNakl: TQueryExtender;
    qeOpl: TQueryExtender;
    UnfFilter1: TUnfFilter;
    UnfFilter2: TUnfFilter;
    dbe_3: TEdit;
    Label_3: TLabel;
    Splitter1: TSplitter;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    fudActSvDolgi: TfrxUserDataSet;
    frActSvDolgi: TfrxReport;
    frActSv: TfrxReport;
    procedure actCloseExecute(Sender: TObject);
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
    procedure medDateFrom2Change(Sender: TObject);
    procedure medDateTo2Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fudActSvDolgiCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure fudActSvDolgiNext(Sender: TObject);
    procedure fudActSvDolgiPrior(Sender: TObject);
    procedure fudActSvDolgiFirst(Sender: TObject);
    procedure frActSvDolgiGetValue(const ParName: String;
      var ParValue: Variant);
  private
    { Private declarations }
    FiParamCount: integer;
    procedure ProcessColumns;
    procedure UpdateCaption;
    procedure CopyFromParamsToWhere(cdsDolg:TClientDataSet;qeNakl2:TQueryExtender;j:integer);
  public
    procedure DefSql(sSql: string);
    procedure SetSchetDates(iSchet : integer;dDateFrom: TDate;dDateTo:TDate);
    procedure SetParamForDetail(sParamName:string; iParamValue:integer;
       sParamCaption,sParamTextValue:string);
    procedure SetGroupForDetail(sGroupClause: string);
    function SetFieldProperty(DataSetName:string;FieldName:string):TField;
  end;

var
  frmRepDolgBuxPostDet: TfrmRepDolgBuxPostDet;

implementation

uses untEx
;

{$R *.dfm}

procedure TfrmRepDolgBuxPostDet.actCloseExecute(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmRepDolgBuxPostDet.actRefreshExecute(Sender: TObject);
begin

  dmdEx.startwaiting;
  cdsDolg.Close;
  cdsNakl.Close;
  cdsOpl.Close;

  CopyFromParamsToWhere(cdsDolg,qeNakl,5);
  with cdsNakl.params do begin
    ParamByName('id_schet').asInteger :=
      cdsDolg.Params.ParamByName('id_schet').asInteger;
    ParamByName('dat_to').AsDate :=
      cdsDolg.params.ParamByName('dat_to').AsDate;
    ParamByName('dat_from').AsDate :=
      cdsDolg.params.ParamByName('dat_from').AsDate;
  end;
  cdsNakl.Open;

  CopyFromParamsToWhere(cdsDolg,qeOpl,5);
  with cdsOpl.params do begin
    ParamByName('id_schet').asInteger :=
      cdsDolg.Params.ParamByName('id_schet').asInteger;
    ParamByName('dat_to').AsDate :=
      cdsDolg.params.ParamByName('dat_to').AsDate;
    ParamByName('dat_from').AsDate :=
      cdsDolg.params.ParamByName('dat_from').AsDate;
  end;
  cdsOpl.Open;
  qeDolg.Refresh;
  //cdsDolg.Open;
  UpdateCaption;
  ProcessColumns;

  dmdEx.StopWaiting;

end;


procedure TfrmRepDolgBuxPostDet.actDesignerExecute(Sender: TObject);
begin
try
  frActSv.DesignReport;
except
  AssertInternal('D311635B-C7BA-4B95-A214-A07E00B38E70');
end;
end;

procedure TfrmRepDolgBuxPostDet.actPreviewExecute(Sender: TObject);
var
  iSchetTip, iSchet : integer;
  SchetName :string;
begin
try
  actRefresh.Execute;
  iSchetTip:= dmdEx.GetOidObjects('“»œ —◊≈“¿',-100);
  iSchet:=cdsDolg.Params.ParamByName('id_schet').asInteger;
  SchetName:=dmdEx.GetNameObjects(iSchet,iSchetTip);
  if ((SchetName='ƒŒÀ√» «¿ ¿–≈Õƒ”') or (SchetName='ƒŒÀ√» «¿  ¿¡≈À‹') or (SchetName='ƒŒÀ√» «¿ ‘»Õ”—À”√»')) then begin
    dmdEx.GetReport('ActSvDolgi.fr3',frActSvDolgi);
    frActSvDolgi.PrepareReport;
    frActSvDolgi.ShowReport; 
  end else begin
    dmdEx.GetReport('ActSv.fr3',frActSv);
    frActSv.PrepareReport;
    frActSv.ShowReport;
  end;
except
  AssertInternal('C4B9CE38-B97B-4532-8461-87F61D583C73');
end;
end;

procedure TfrmRepDolgBuxPostDet.frUserDataset1First(Sender: TObject);
begin
try
  dtsOpl.DataSet.First;
  dtsNakl.DataSet.First;
except
  AssertInternal('EAA3D720-BA6C-4FAA-BF16-EF296A1AEA2E');
end;
end;

procedure TfrmRepDolgBuxPostDet.frUserDataset1Next(Sender: TObject);
begin
try
  if not dtsNakl.DataSet.Eof then begin
    dtsNakl.DataSet.Next;
  end
  else begin
    dtsOpl.DataSet.Next;
  end;
except
  AssertInternal('FA1674BE-0207-499B-8309-787DD0987065');
end;
end;

procedure TfrmRepDolgBuxPostDet.frUserDataset1CheckEOF(Sender: TObject;
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

procedure TfrmRepDolgBuxPostDet.frUserDataset1Prior(Sender: TObject);
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

procedure TfrmRepDolgBuxPostDet.frActSvGetValue(const ParName: String;
  var ParValue: Variant);
begin
try
  if AnsiUpperCase(ParName)='SIZG' then begin
    ParValue := dsDolg.Dataset.FieldByName('IZGFULLNAME').asString;
//    dbeIzg.Text;
  end;
  if AnsiUpperCase(ParName)='SZAK' then begin
    ParValue := dsDolg.Dataset.FieldByName('ZAKFULLNAME').asString;
//    ParValue := dbeZak.Text;
  end;
  if AnsiUpperCase(ParName)='SDATETO' then begin
    ParValue := cdsDolg.Params.ParamByName('dat_to').AsDate
    //medDateTo.Date;
  end;
  if AnsiUpperCase(ParName)='SDATEFROM' then begin
    ParValue := cdsDolg.Params.ParamByName('dat_from').AsDate
    //medDateFrom.Date;
  end;
  if AnsiUpperCase(ParName)='DATDOC' then begin
    if not dtsNakl.DataSet.eof then begin
      ParValue := dtsNakl.DataSet.FieldByName('dat').AsDateTime;
    end else begin
      ParValue := dtsOpl.DataSet.FieldByName('dat').AsDateTime;
    end;
  end;
  if AnsiUpperCase(ParName)='OPER' then begin
    if not dtsNakl.DataSet.eof then begin
      ParValue := 'ŒÔÎ‡Ú‡';
    end else begin
      ParValue := 'Õ‡ÍÎ‡‰Ì‡ˇ';
    end;
  end;
  if AnsiUpperCase(ParName)='NOMER' then begin
    if dtsNakl.DataSet.eof then begin
      ParValue := dtsOpl.DataSet.FieldByName('id').asString;
    end else begin
      ParValue := dtsNakl.DataSet.FieldByName('id').asString;
    end;
  end;
  if AnsiUpperCase(ParName)='DEBET' then begin
    if not dtsNakl.DataSet.eof then begin
      ParValue := dtsNakl.DataSet.FieldByName('debet').asFloat;
    end;
  end;
  if AnsiUpperCase(ParName)='KREDIT' then begin
    if dtsNakl.DataSet.eof then begin
      ParValue := dtsOpl.DataSet.FieldByName('kredit').asFloat;
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

procedure TfrmRepDolgBuxPostDet.FormCreate(Sender: TObject);
begin
  dmdEx.OpenQuery(dmdEx.cdsAllClient);
  qeDolg.DefSql := sdsDolgBux.CommandText;
  qeNakl.DefSql := sdsNakl.CommandText;
  qeOpl.DefSql := sdsOpl.CommandText;
  FiParamCount :=0;
  SetGroupForDetail('sub1,sub2');
end;

procedure TfrmRepDolgBuxPostDet.FormDestroy(Sender: TObject);
begin
  dmdEx.CloseQuery(dmdEx.cdsAllClient,false);
end;

procedure TfrmRepDolgBuxPostDet.actDetail1Execute(Sender: TObject);
begin
  if dtsNakl.DataSet.Eof and dtsNakl.DataSet.Bof then begin
    exit;
  end;
  OpenDocument(nil,
    dtsNakl.DataSet.FieldByName('id_nakl').AsInteger,
    dtsNakl.DataSet.FieldByName('tip').asInteger,0);
end;

procedure TfrmRepDolgBuxPostDet.DBGridEh1DblClick(Sender: TObject);
begin
  actDetail1.Execute;
end;

procedure TfrmRepDolgBuxPostDet.DBGridEh2DblClick(Sender: TObject);
begin
  actDetail2.Execute;
end;

procedure TfrmRepDolgBuxPostDet.actDetail2Execute(Sender: TObject);
begin
  if dtsOpl.DataSet.Eof and dtsOpl.DataSet.Bof then begin
    exit;
  end;
  OpenDocument(nil,
    dtsOpl.DataSet.FieldByName('id_nakl').AsInteger,
    dtsOpl.DataSet.FieldByName('tip').asInteger,0);
end;


procedure TfrmRepDolgBuxPostDet.DefSql(sSql: string);
begin
  qeDolg.DefSql:=sSql;
  qeDolg.Prepare;
end;

procedure TfrmRepDolgBuxPostDet.ProcessColumns;
begin
  with  cdsNakl do begin
    FieldByName('id_nakl').Visible := false;
    FieldByName('tip').Visible := false;
    FieldByName('dat').DisplayLabel := 'ƒ‡Ú‡';
    FieldByName('dat').DisplayWidth := 8;
    TSqlTimeStampField(FieldByName('dat')).DisplayFormat := 'dd.mm.yy';
    FieldByName('id').DisplayLabel := 'π‰ÓÍ';
    FieldByName('id').DisplayWidth := 6;
    FieldByName('sub3_name').DisplayWidth := 8;
    FieldByName('sub3_name').DisplayLabel := 'ÃÂÌÂ‰ÊÂ';
    FieldByName('debet').DisplayWidth := 10;
    FieldByName('debet').DisplayLabel := '—ÛÏÏ‡';
    TNumericField(FieldByName('debet')).DisplayFormat := '0.00';
    FieldByName('tip_name').displayLabel := '“ËÔ';
    FieldByName('tip_name').DisplayWidth := 10;
   end;
  with  cdsOpl do begin
    FieldByName('id_nakl').Visible := false;
    FieldByName('tip').Visible := false;
    FieldByName('dat').DisplayLabel := 'ƒ‡Ú‡';
    FieldByName('dat').DisplayWidth := 8;
    TSqlTimeStampField(FieldByName('dat')).DisplayFormat := 'dd.mm.yy';
    FieldByName('id').DisplayLabel := 'π‰ÓÍ';
    FieldByName('id').DisplayWidth := 6;
    FieldByName('sub3_name').DisplayWidth := 8;
    FieldByName('sub3_name').DisplayLabel := 'ÃÂÌÂ‰ÊÂ';
    FieldByName('kredit').DisplayWidth := 10;
    FieldByName('kredit').DisplayLabel := '—ÛÏÏ‡';
    TNumericField(FieldByName('kredit')).DisplayFormat := '0.00';
    FieldByName('tip_name').displayLabel := '“ËÔ';
    FieldByName('tip_name').DisplayWidth := 10;
   end;
   with cdsDolg do begin
     TNumericField(FieldByName('debetbefore')).DisplayFormat := '0.00';
     TNumericField(FieldByName('kreditbefore')).DisplayFormat := '0.00';
     TNumericField(FieldByName('debet')).DisplayFormat := '0.00';
     TNumericField(FieldByName('kredit')).DisplayFormat := '0.00';
     TNumericField(FieldByName('debetafter')).DisplayFormat := '0.00';
     TNumericField(FieldByName('kreditafter')).DisplayFormat := '0.00';
   end;
end;

procedure TfrmRepDolgBuxPostDet.medDateFrom2Change(Sender: TObject);
begin
  cdsDolg.params.ParamByName('dat_from').AsDate := medDateFrom2.Date;
end;

procedure TfrmRepDolgBuxPostDet.medDateTo2Change(Sender: TObject);
begin
  cdsDolg.params.ParamByName('dat_to').AsDate := medDateTo2.Date;
end;

procedure TfrmRepDolgBuxPostDet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmRepDolgBuxPostDet.CopyFromParamsToWhere(cdsDolg: TClientDataSet;
  qeNakl2 :TQueryExtender; j: integer);
var
  i : integer;
begin
  for i:=1 to j do begin
    if not cdsDolg.Params.ParamByName('sub'+inttostr(i)+'_in').isNull then begin
      qeNakl2.SetSQL('where','pr.sub'+inttostr(i)+'='+
        cdsDolg.Params.ParamByName('sub'+inttostr(i)+'_in').asString,i);
    end;
  end;
  qeNakl2.Prepare;
end;

procedure TfrmRepDolgBuxPostDet.SetSchetDates(iSchet: integer; dDateFrom,
  dDateTo: TDate);
begin
  cdsDolg.Params.ParamByName('dat_from').AsDate :=
    dDateFrom;
  cdsDolg.Params.ParamByName('dat_to').AsDate :=
    dDateTo;
  cdsDolg.Params.ParamByName('id_schet').asInteger :=
    iSchet;
  medDateFrom2.Date := dDateFrom;
  medDateTo2.Date := dDateTo;
end;

procedure TfrmRepDolgBuxPostDet.SetParamForDetail(sParamName: string;
  iParamValue: integer; sParamCaption, sParamTextValue: string);
begin
try
  cdsDolg.Params.ParamByName(sParamName).asInteger := iParamValue;
  inc(FiParamCount);
  if FiParamCount>3 then exit;
  TControl(FindComponent('dbe_'+inttostr(FiParamCount))).Visible :=true;
  TEdit(FindComponent('dbe_'+inttostr(FiParamCount))).Text := sParamTextValue;
  TControl(FindComponent('label_'+inttostr(FiParamCount))).Visible :=true;
  TLabel(FindComponent('label_'+inttostr(FiParamCount))).Caption := sParamCaption;
except
  AssertInternal('070979A9-D9C3-4784-909F-9254F2667E1A');
end
end;

procedure TfrmRepDolgBuxPostDet.SetGroupForDetail(sGroupClause: string);
begin
  qeDolg.SetSQL('group by',sGroupClause,0);
end;

function TfrmRepDolgBuxPostDet.SetFieldProperty(DataSetName,
  FieldName: string): TField;
begin
{
  if not Assigned(FindComponent(DataSetName)) then begin
    Result :=nil;
  end;
  if not Assigned(TClientDataSet(FindComponent(DataSetName)).FindField(FieldName)) then begin
    Result :=nil;
  end; }
  Result :=TClientDataSet(FindComponent(DataSetName)).FieldByName(FieldName);
end;

procedure TfrmRepDolgBuxPostDet.UpdateCaption;
begin
  self.Caption := 'ƒÂÚ‡ÎËÁ‡ˆËˇ: c '+
    cdsDolg.params.ParamByName('dat_from').AsString +
    ' ÔÓ '+
    cdsDolg.params.ParamByName('dat_to').AsString;
end;


procedure TfrmRepDolgBuxPostDet.fudActSvDolgiCheckEOF(Sender: TObject;
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

procedure TfrmRepDolgBuxPostDet.fudActSvDolgiNext(Sender: TObject);
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

procedure TfrmRepDolgBuxPostDet.fudActSvDolgiPrior(Sender: TObject);
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

procedure TfrmRepDolgBuxPostDet.fudActSvDolgiFirst(Sender: TObject);
begin
try
  dtsOpl.DataSet.First;
  dtsNakl.DataSet.First;
except
  AssertInternal('EAA3D720-BA6C-4FAA-BF16-EF296A1AEA2E');
end;
end;

procedure TfrmRepDolgBuxPostDet.frActSvDolgiGetValue(const ParName: String;
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
    ParValue := cdsDolg.Params.ParamByName('dat_to').AsDate;
  end;
  if AnsiUpperCase(ParName)='SDATEFROM' then begin
    ParValue := cdsDolg.Params.ParamByName('dat_from').AsDate
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
      ParValue := 'ŒÔÎ‡Ú‡';
    end else begin
      ParValue := 'Õ‡ÍÎ‡‰Ì‡ˇ';
    end;
  end;
  if AnsiUpperCase(ParName)='NOMER' then begin
    if dtsOpl.DataSet.eof then begin
      ParValue := dtsNakl.DataSet.FieldByName('id').asString;
    end;
  end;
  if AnsiUpperCase(ParName)='DEBET' then begin
    if dtsOpl.DataSet.eof then begin
      ParValue := dtsNakl.DataSet.FieldByName('debet').asFloat;
    end;
  end;
  if AnsiUpperCase(ParName)='KREDIT' then begin
    if not dtsOpl.DataSet.eof then begin
      ParValue := dtsOpl.DataSet.FieldByName('kredit').asFloat;
    end;
  end;
{

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
}
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

end.
