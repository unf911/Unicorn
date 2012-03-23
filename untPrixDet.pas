unit untPrixDet;

interface

uses
  Windows, Messages, SysUtils,
  Variants, Classes, Graphics,
  Controls, Forms,
  Dialogs,

  DB, DBTables, Grids, DBGrids,
  ActnList, StdCtrls,
  Mask, DBCtrls,untEx, FMTBcd, DBClient, Provider, SqlExpr, DBGridEh,
  GridsEh, Menus,
  SkladAux, QueryExtender //OpenDocument
  ;

type
  TfrmPrixDet = class(TForm)
    dsDetNakl: TDataSource;
    ActionList1: TActionList;
    actShowDet: TAction;
    dsDetOpl: TDataSource;
    dsOplaty: TDataSource;
    dsNaklr: TDataSource;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    dbeOplIdi: TDBEdit;
    dbeOplDat: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    dbeOplOpl: TDBEdit;
    dbeOplPotr: TDBEdit;
    Label4: TLabel;
    Button1: TButton;
    actGotoNakl: TAction;
    actGotoOpl: TAction;
    GroupBox2: TGroupBox;
    dbeNaklNakl: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    dbeNaklDat: TDBEdit;
    dbeNaklNds: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    dbeNaklOplach: TDBEdit;
    Button2: TButton;
    actClose: TAction;
    sdsDetOpl: TSQLDataSet;
    sdsDetNakl: TSQLDataSet;
    SQLDataSet3: TSQLDataSet;
    SQLDataSet4: TSQLDataSet;
    DataSetProvider1: TDataSetProvider;
    DataSetProvider2: TDataSetProvider;
    DataSetProvider3: TDataSetProvider;
    DataSetProvider4: TDataSetProvider;
    qurDetOpl: TClientDataSet;
    qurDetOplNAKL: TIntegerField;
    qurDetOplAUTHER: TStringField;
    qurDetOplID: TStringField;
    qurDetOplID_MANAGER: TIntegerField;
    qurDetOplDAT: TSQLTimeStampField;
    qurDetNakl: TClientDataSet;
    qurDetNaklIDI: TStringField;
    qurOplaty: TClientDataSet;
    qurOplatyIDI: TStringField;
    qurOplatyDAT: TSQLTimeStampField;
    qurOplatyOPL: TFMTBCDField;
    qurOplatyPOTRACHENO: TFMTBCDField;
    qurNaklr: TClientDataSet;
    qurDetNaklDAT: TSQLTimeStampField;
    qurDetNaklOPL: TFMTBCDField;
    qurDetOplNDS: TFMTBCDField;
    qurDetOplTRANSH: TFMTBCDField;
    qurDetNaklTRANSH: TFMTBCDField;
    qurNaklrID: TStringField;
    qurNaklrNAKL: TIntegerField;
    qurNaklrDAT: TSQLTimeStampField;
    qurNaklrNDS: TFMTBCDField;
    qurNaklrOPLACHENO: TFMTBCDField;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    qurDetNaklID_NAKL: TIntegerField;
    PopupMenu1: TPopupMenu;
    actShowNakl1: TMenuItem;
    actShowNakl2: TAction;
    qeDetNakl: TQueryExtender;
    qeDetOpl: TQueryExtender;
    procedure actGotoNaklExecute(Sender: TObject);
    procedure actGotoOplExecute(Sender: TObject);
    procedure udgDetOplDblClick(Sender: TObject);
    procedure udgDetNaklDblClick(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure actShowDetExecute(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh2DblClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure ShowDet(opl_id: integer; nakl_id :integer);
    procedure Test;
    procedure SetSql(sql : string);
  end;

var
  frmPrixDet: TfrmPrixDet;

implementation

{$R *.dfm}
//вызывается платежами при f9 для показа детализации
procedure TfrmPrixDet.ShowDet(opl_id: integer; nakl_id :integer);
begin


  qurDetNakl.Close;
  qurDetOpl.Close;
  qurOplaty.Close;
  qurNaklr.Close;

  qeDetNakl.Prepare;
  qeDetOpl.Prepare;
  qurDetNakl.FetchParams;
  qurDetOpl.FetchParams;

  qurDetNakl.Params.ParamByName('nakl_id').AsInteger := nakl_id;
  qurDetOpl.Params.ParamByName('opl_id').AsInteger := opl_id;
  qurOplaty.Params.ParamByName('opl_id').AsInteger:= opl_id ;
  qurNaklr.Params.ParamByName('nakl_id').AsInteger := nakl_id;
  qurDetNakl.Open;
  qurDetOpl.Open;
  qurOplaty.Open;
  qurNaklr.Open;
  //self.ShowModal;
end;


procedure TfrmPrixDet.actGotoNaklExecute(Sender: TObject);
begin
  qurNaklr.Close;
  qurDetNakl.Close;
  qurNaklr.Params.ParamByName('nakl_id').AsInteger :=
    qurDetOpl.fieldbyname('nakl').AsInteger;
  qurDetNakl.Params.ParamByName('nakl_id').AsInteger :=
    qurDetOpl.fieldbyname('nakl').AsInteger;
  qurDetNakl.Open;
  qurNaklr.Open;
end;

procedure TfrmPrixDet.actGotoOplExecute(Sender: TObject);
begin
  qurDetOpl.Close;
  qurOplaty.Close;
  qurDetOpl.Params.ParamByName('opl_id').AsInteger :=
    qurDetNakl.fieldbyname('id_nakl').AsInteger;
  qurOplaty.Params.ParamByName('opl_id').AsInteger:=
    qurDetNakl.fieldbyname('id_nakl').AsInteger;
  qurDetOpl.Open;
  qurOplaty.Open;

end;

procedure TfrmPrixDet.udgDetOplDblClick(Sender: TObject);
begin
  actGotoNakl.Execute;
end;

procedure TfrmPrixDet.udgDetNaklDblClick(Sender: TObject);
begin
  actGotoOpl.Execute;
end;

procedure TfrmPrixDet.actCloseExecute(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmPrixDet.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //закрываем справочники
  dmdEx.CloseQuery(dmdEx.cdsManager,false);
  //при закрытии уничтожать, а не сворачивать
  Action := caFree;
end;

procedure TfrmPrixDet.FormCreate(Sender: TObject);
begin
  //открываем справочники
  dmdex.openquery(dmdEx.cdsManager);
end;

procedure TfrmPrixDet.actShowDetExecute(Sender: TObject);
begin
  if DBGridEh2.Focused then begin
    if dsDetNakl.DataSet.Eof and dsDetNakl.DataSet.Bof then begin
       exit;
    end;
    OpenDocument(self,
      dsDetNakl.DataSet.FieldByName('id_nakl').asInteger,
      0,
      0);
  end else begin
    if dsDetOpl.DataSet.Eof and dsDetOpl.DataSet.Bof then begin
       exit;
    end;
    OpenDocument(self,
      dsDetOpl.DataSet.FieldByName('nakl').asInteger,
      0,
      0);
  end;
end;

procedure TfrmPrixDet.DBGridEh1DblClick(Sender: TObject);
begin
  actShowDet.Execute;
end;

procedure TfrmPrixDet.DBGridEh2DblClick(Sender: TObject);
begin
  actShowDet.Execute;
end;

procedure TfrmPrixDet.Test;
begin
  SetSql('t.tip<>1');
  ShowDet(0,709406);
end;

procedure TfrmPrixDet.SetSql(sql: string);
begin
  qeDetNakl.SetSQL('where',sql,0);
  qeDetOpl.SetSQL('where',sql,0);
end;

end.
