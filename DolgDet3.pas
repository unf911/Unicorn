unit DolgDet3;

interface

uses
  Windows, Messages, SysUtils, Variants,
  Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, DB, DBTables, Grids,
  StdCtrls, Mask, DBCtrls, ComCtrls,
  Buttons, QueryExtender, FMTBcd, SqlExpr,
  untEx, DBClient, Provider, DBGridEh, Menus,
  atsAssert, GridsEh
  ;

type
  TfrmDolgDet3 = class(TForm)
    ActionList1: TActionList;
    actClose: TAction;
    dsNakl: TDataSource;
    dsOpl: TDataSource;
    actRefresh: TAction;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    BitBtn1: TBitBtn;
    dbeIZG: TEdit;
    dbeZAK: TEdit;
    dbeMANAG: TEdit;
    sdsNakl: TSQLDataSet;
    sdsOpl: TSQLDataSet;
    DataSetProvider1: TDataSetProvider;
    DataSetProvider2: TDataSetProvider;
    qurNakl: TClientDataSet;
    qurOpl: TClientDataSet;
    qurOplOSTATOK: TFloatField;
    qurNaklID: TStringField;
    DBGridEh1: TDBGridEh;
    qurNaklDAT2: TSQLTimeStampField;
    qurNaklMAX2: TSQLTimeStampField;
    qurNaklOSTATOK: TFloatField;
    qurOplDAT: TSQLTimeStampField;
    qurOplIDI: TStringField;
    DBGridEh2: TDBGridEh;
    qurNaklTIP: TIntegerField;
    qurOplTIP: TIntegerField;
    PopupMenu1: TPopupMenu;
    actDetail: TAction;
    N1: TMenuItem;
    actDetail2: TAction;
    qurNaklID_NAKL: TIntegerField;
    qurOplID_NAKL: TIntegerField;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    cbxAllDoc: TCheckBox;
    qeNakl: TQueryExtender;
    qeOpl: TQueryExtender;
    qurNaklNDS: TFMTBCDField;
    sdsOplDAT: TSQLTimeStampField;
    sdsOplIDI: TStringField;
    sdsOplOSTATOK: TFloatField;
    sdsOplID_NAKL: TIntegerField;
    sdsOplTIP: TIntegerField;
    sdsOplOPL: TFloatField;
    qurOplOPL: TFloatField;
    procedure actCloseExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure DBGridEh2DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actDetailExecute(Sender: TObject);
    procedure actDetail2Execute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    iId_izg, iId_zak,iId_manager : integer;
    dDateTo : TDate;
    procedure UpdateCaption;
    procedure ProcessNakl;
    procedure ProcessOpl;
    procedure ProcessLabel;
  public
    { Public declarations }
    procedure ShowDetail(
      dat_to : TDate;
      sub1_in ,
      sub2_in,
      sub3_in  :integer);
  end;

var
  frmDolgDet3: TfrmDolgDet3;

implementation

uses SkladAux //opendocument
;

{$R *.dfm}

procedure TfrmDolgDet3.actCloseExecute(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmDolgDet3.actRefreshExecute(Sender: TObject);
begin
  dmdEx.startwaiting;
  ProcessLabel;
  ProcessNakl;
  ProcessOpl;
  UpdateCaption;
  dmdEx.StopWaiting;
end;

procedure TfrmDolgDet3.DBGridEh2DblClick(Sender: TObject);
begin
 { DONE : При дабл-клике открывается оплата, либо расходная накладная }
  actDetail2.Execute;
end;

procedure TfrmDolgDet3.FormCreate(Sender: TObject);
begin
  dmdEx.OpenQuery(dmdex.cdsAllClient);
  dmdEx.OpenQuery(dmdex.cdsManager);
  qeNakl.DefSql:=sdsNakl.CommandText;
  qeOpl.DefSql:=sdsOpl.CommandText;
end;

procedure TfrmDolgDet3.actDetailExecute(Sender: TObject);
var
  iTip : integer;
  iTipNaklr : integer;
begin
try
  if dsNakl.DataSet.Eof and dsNakl.DataSet.Bof then begin
    exit;
  end;
  //тип документа который будет открыт
  iTip := dsNakl.DataSet.FieldByName('tip').asInteger;
  iTipNaklr := dmdEx.GetOidObjects('РАСХОДНЫЕ НАКЛАДНЫЕ',-100);
  if (iTip=iTipNaklr) then begin //Расходные накладные
    OpenDocument(self,dsNakl.DataSet.FieldByName('id_nakl').asInteger,iTipNaklr,0);
  end; //Расходные накладные
except
  AssertInternal('93B8FC6A-DBA9-4715-B2C0-47EAB8E47D2C');
end;
end;

procedure TfrmDolgDet3.actDetail2Execute(Sender: TObject);
begin
try
  if dsOpl.DataSet.Eof and dsOpl.DataSet.Bof then begin
    exit;
  end; 
  OpenDocument(self,
    dsOpl.DataSet.FieldByName('id_nakl').asInteger,
    0,
    0);
except
  AssertInternal('9B05CA17-55F8-43EA-860C-A44669E9EAAC');
end;
end;


procedure TfrmDolgDet3.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;


procedure TfrmDolgDet3.DBGridEh1DblClick(Sender: TObject);
begin
  actDetail.Execute;
end;

procedure TfrmDolgDet3.DBGridEh1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    vk_Return: begin
      actDetail.Execute;
    end; //vk_Return
  end;//case
end;

procedure TfrmDolgDet3.DBGridEh2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    vk_Return: begin
      actDetail2.Execute;
    end; //vk_Return
  end;//case
end;

procedure TfrmDolgDet3.ShowDetail(
  dat_to : TDate;
  sub1_in ,
  sub2_in,
  sub3_in  :integer);
begin
  dmdEx.StartWaiting;
  iId_izg := sub1_in;
  iId_zak := sub2_in;
  iId_manager := sub3_in;
  dDateTo :=  dat_to;
  actRefresh.Execute;
end;


procedure TfrmDolgDet3.UpdateCaption;
begin
  self.Caption := 'Детализация долгов на ' +
    datetostr (dDateTo) +
    '. Поставщик: ' +
    varastype(dmdEx.cdsAllClient.Lookup('id',iId_izg,'name'),varString)+
    '. Получатель: ' +
    varastype(dmdEx.cdsAllClient.Lookup('id',iId_zak,'name'),varString)+
    '. Менеджер: ' +
    varastype(dmdEx.cdsManager.Lookup('id',iId_manager,'name'),varString)+
    '.';
end;

procedure TfrmDolgDet3.ProcessNakl;
begin
  qurNakl.Close;
  qurNakl.params.ParamByName('id_izg').AsInteger := iId_izg;
  qurNakl.params.ParamByName('id_zak').asInteger := iId_zak;
  qurNakl.Params.ParamByName('id_manager').AsInteger := iId_manager;
  qurNakl.params.ParamByName('dat_to').AsDate := dDateTo;
  if not cbxAllDoc.Checked then begin
    qeNakl.SetSql('where','r.debetafter>0',0);
  end else begin
    qeNakl.SetSql('where','',0);
  end;
  qeNakl.Refresh;
end;

procedure TfrmDolgDet3.ProcessOpl;
begin
  qurOpl.Close;
  qurOpl.Params.ParamByName('id_izg').AsInteger := iId_izg;
  qurOpl.Params.ParamByName('id_zak').asInteger := iId_zak;
  qurOpl.Params.ParamByName('id_manager').AsInteger := iId_manager;
  qurOpl.params.ParamByName('dat_to').AsDate := dDateTo;
  if not cbxAllDoc.Checked then begin
    qeOpl.SetSQL('where','(r.kreditafter-r.debetafter)<>0',0)
  end else begin
    qeOpl.SetSQL('where','',0);
  end;
  qeOpl.Refresh;
end;

procedure TfrmDolgDet3.ProcessLabel;
var
  varName : variant;
begin
  varName:=dmdex.cdsAllClient.Lookup('id',iId_izg,'name');
  if (varName<> null) then dbeIzg.Text:=varName else dbeIzg.Text:='';
  varName:=dmdex.cdsAllClient.Lookup('id',iId_zak,'name');
  if (varName<> null) then dbeZAK.Text:=varName else dbeZak.Text:='';
  varName:=dmdex.cdsManager.Lookup('id',iId_manager,'name');
  if (varName<> null) then dbeManag.Text:=varName else dbeManag.Text:='';
end;

end.
