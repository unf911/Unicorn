unit untDolgDet;
{ TODO : untDolgDet - убрать из употребления и удалить }
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, DB, DBTables, Grids, DBGrids,
  StdCtrls, Mask, DBCtrls, ComCtrls,
  Buttons, QueryExtender, GridsEh, DBGridEh;

type
  TfrmDolgDet = class(TForm)
    ActionList1: TActionList;
    actClose: TAction;
    actRecalc: TAction;
    qurNakl: TQuery;
    qurOpl: TQuery;
    dtsNakl: TDataSource;
    dtsOpl: TDataSource;
    qurNaklDAT: TDateTimeField;
    qurNaklID: TStringField;
    qurNaklNDS: TFloatField;
    actRefresh: TAction;
    qurOplPRED: TStringField;
    qurOplIDI: TIntegerField;
    qurOplDAT: TDateTimeField;
    qurOplSUM_ALL: TFloatField;
    qurOplSUM_MY: TFloatField;
    GroupBox1: TGroupBox;
    medDateFrom: TDateTimePicker;
    medDateTo: TDateTimePicker;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    GroupBox2: TGroupBox;
    dbeDolgAfter: TDBEdit;
    Label3: TLabel;
    UnfDBGrid1: TDBGridEh;
    Label1: TLabel;
    dbeDolgBefore: TDBEdit;
    GroupBox3: TGroupBox;
    UnfDBGrid2: TDBGridEh;
    BitBtn1: TBitBtn;
    dbeIZG: TEdit;
    dbeZAK: TEdit;
    dbeMANAG: TEdit;
    qurItogo: TQuery;
    dsItogo: TDataSource;
    qurItogoIZG: TStringField;
    qurItogoZAK: TStringField;
    qurItogoMANAGER: TStringField;
    qurItogoDOLGBEFORE: TFloatField;
    qurItogoPREDBEFORE: TFloatField;
    qurItogoOTG: TFloatField;
    qurItogoOPL: TFloatField;
    qurItogoDOLGAFTER: TFloatField;
    qurItogoPREDAFTER: TFloatField;
    qeItogo: TQueryExtender;
    DBEdit1: TDBEdit;
    Label10: TLabel;
    DBEdit3: TDBEdit;
    Label11: TLabel;
    GroupBox4: TGroupBox;
    Label14: TLabel;
    UnfDBGrid3: TDBGridEh;
    DBEdit7: TDBEdit;
    qurPred: TQuery;
    dsPred: TDataSource;
    qurPredPRED: TStringField;
    qurPredIDI: TIntegerField;
    qurPredDAT: TDateTimeField;
    qurPredSUM_ALL: TFloatField;
    qurPredSUM_MY: TFloatField;
    DBEdit6: TDBEdit;
    Label13: TLabel;
    Label12: TLabel;
    DBEdit5: TDBEdit;
    qurItogoPRED: TFloatField;
    procedure actCloseExecute(Sender: TObject);
    procedure actRecalcExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDolgDet: TfrmDolgDet;

implementation

{$R *.dfm}

procedure TfrmDolgDet.actCloseExecute(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmDolgDet.actRecalcExecute(Sender: TObject);
begin
  qurNakl.Close;
  qurOpl.Close;
  qurPred.Close;
  qurItogo.Close;

  qurNakl.ParamByName('izg').AsString := dbeIZG.Text;
  qurNakl.ParamByName('zak').asString := dbeZAK.Text;
  qurNakl.ParamByName('manager').AsString := dbeManag.Text;
  qurNakl.ParamByName('datefrom').AsDate := medDateFrom.Date;
  qurNakl.ParamByName('dateto').AsDate := medDateTo.Date;

  qurOpl.ParamByName('izg').AsString := dbeIZG.Text;
  qurOpl.ParamByName('zak').asString := dbeZAK.Text;
  qurOpl.ParamByName('manager').AsString := dbeManag.Text;
  qurOpl.ParamByName('datefrom').AsDate := medDateFrom.Date;
  qurOpl.ParamByName('dateto').AsDate := medDateTo.Date;

  qurPred.ParamByName('izg').AsString := dbeIZG.Text;
  qurPred.ParamByName('zak').asString := dbeZAK.Text;
  qurPred.ParamByName('manager').AsString := dbeManag.Text;
  qurPred.ParamByName('datefrom').AsDate := medDateFrom.Date;
  qurPred.ParamByName('dateto').AsDate := medDateTo.Date;

  qurItogo.ParamByName('dateto').asDate := medDateTo.Date;
  qurItogo.ParamByName('datefrom').AsDate := medDateFrom.Date;
  qeItogo.SetSQL('where','m.manager='+ QuotedStr (dbeManag.Text),0);
  qeItogo.SetSQL('where','m.izg='+ QuotedStr (dbeIZG.Text),1);
  qeItogo.SetSQL('where','m.zak='+ QuotedStr (dbeZAK.Text),2);

  qeItogo.Refresh;
  qurPred.Open;
  qurNakl.Open;
  qurOpl.Open;
end;

procedure TfrmDolgDet.actRefreshExecute(Sender: TObject);
begin
  actRecalc.Execute;
end;

end.
