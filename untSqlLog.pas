unit untSqlLog;
{
просмотр всех запросов отсылаемых программой к базе данных
}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
	Dialogs, Provider,  StdCtrls, DB, DBClient, DBLocal,
  untEx,
  //DBLocalS,
  Buttons, SqlExpr;

type
  TfrmSqlLog = class(TForm)
    memLog: TMemo;
    SQLMonitor1: TSQLMonitor;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SQLMonitor1LogTrace(Sender: TObject; CBInfo: pSQLTRACEDesc);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSqlLog: TfrmSqlLog;
   f1: TSQLTraceFlags;

implementation

{$R *.dfm}

procedure TfrmSqlLog.FormCreate(Sender: TObject);
begin
//
//  f1 := [traceQPREPARE, traceQEXECUTE,
//  traceERROR, traceSTMT, traceCONNECT, traceTRANSACT, traceBLOB,
//  traceMISC, traceVENDOR, traceDATAIN, traceDATAOUT];

  f1 := [ traceQEXECUTE];
  
  SQLMonitor1.SQLConnection := dmdEx.scUchet;
	SQLMonitor1.Active := true;
  memLog.Lines.Clear;
	memLog.Lines.Add('Начало протоколирования всех запросов');
end;

procedure TfrmSqlLog.BitBtn2Click(Sender: TObject);
begin
  memLog.Lines.Clear;
end;

procedure TfrmSqlLog.BitBtn1Click(Sender: TObject);
begin
  self.close;
end;

procedure TfrmSqlLog.SQLMonitor1LogTrace(Sender: TObject;
  CBInfo: pSQLTRACEDesc);
begin
//  showmessage(inttostr(pSQLTRACEDesc.eTraceCat));
  memLog.Lines.AddStrings( SQLMonitor1.TraceList);
  SQLMonitor1.TraceList.Clear;
  memLog.Lines.Add('-------------------------------------------')
end;

procedure TfrmSqlLog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SQLMonitor1.Active := false;
  //SQLMonitor1.SQLConnection := nil;
  Action := caFree;
end;

end.
