unit RepDolgBux;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,untDM, QueryExtender, DB, DBTables,   
  Grids, DBGrids, ActnList, StdCtrls, Buttons,
  untSettings,untDolgBuxDet, DBGridEh,
  untEx, FMTBcd, DBClient, Provider, SqlExpr, Menus, GridsEh, frxClass,
  frxDBSet;

type
  TfrmRepDolgBux = class(TForm)
    frdDolgBux: TfrxDBDataset;
    qurDolgBux: TQuery;
    dsDolgBux: TDataSource;
    qeDolgBux: TQueryExtender;
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    ActionList1: TActionList;
    actPreview: TAction;
    actPrint: TAction;
    actCall: TAction;
    actSettings: TAction;
    actShowDet: TAction;
    actRefresh: TAction;
    qurDolgBuxIZG: TStringField;
    qurDolgBuxZAK: TStringField;
    qurDolgBuxDOLGBEFORE: TFloatField;
    qurDolgBuxPREDBEFORE: TFloatField;
    qurDolgBuxOTG: TFloatField;
    qurDolgBuxOPL: TFloatField;
    qurDolgBuxDOLGAFTER: TFloatField;
    qurDolgBuxPREDAFTER: TFloatField;
    cbxNotNull: TCheckBox;
    actNotNull: TAction;
    qurDolgBuxNum: TStringField;
    actRecalc: TAction;
    DBGridEh1: TDBGridEh;
    sdsDolgBux: TSQLDataSet;
    dspDolgBux: TDataSetProvider;
    cdsDolgBux: TClientDataSet;
    cdsDolgBuxSUB1: TIntegerField;
    cdsDolgBuxSUB2: TIntegerField;
    cdsDolgBuxIZG: TStringField;
    cdsDolgBuxZAK: TStringField;
    cdsDolgBuxDEBETBEFORE: TFloatField;
    cdsDolgBuxKREDITBEFORE: TFloatField;
    cdsDolgBuxDEBET: TFloatField;
    cdsDolgBuxKREDIT: TFloatField;
    cdsDolgBuxDEBETAFTER: TFloatField;
    cdsDolgBuxKREDITAFTER: TFloatField;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    mnuRefresh: TMenuItem;
    N2: TMenuItem;
    N6: TMenuItem;
    N5: TMenuItem;
    procedure actSettingsExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actPrintExecute(Sender: TObject);
    procedure actPreviewExecute(Sender: TObject);
    procedure frDolgBuxGetValue(const ParName: String;
      var ParValue: Variant);
    procedure actNotNullExecute(Sender: TObject);
    procedure actShowDetExecute(Sender: TObject);
//    procedure actRecalcExecute(Sender: TObject);
    procedure frDolgBuxBeginDoc;
    procedure frDolgBuxEndDoc;
//    procedure actSumRecalcExecute(Sender: TObject);

  private
    { Private declarations }
    setT : TfrmSettings;
    curDolg ,curPred : currency;
  public
    { Public declarations }
  end;

var
  frmRepDolgBux: TfrmRepDolgBux;

implementation

{$R *.dfm}

procedure TfrmRepDolgBux.actSettingsExecute(Sender: TObject);
begin
  if (setT.ChangeSettings = mrOk) then begin
//    qurDolgBux.Close;
    actSettings.Checked := true;
    qurDolgBux.Close;
    qurDolgBux.ParamByName('dateto').AsDate := setT.DateTo;
    qurDolgBux.ParamByName('datefrom').AsDate := setT.DateFrom;
    qurDolgBux.Open;
    self.Caption := 'Долги (бухгалтерия): с ' +
      datetostr (setT.DateFrom) +
      ' до ' + datetostr(setT.dateTo);
//    qeDolgBux.Refresh;
  end
  else begin
    actSettings.Checked := false;
  end;
end;

procedure TfrmRepDolgBux.FormCreate(Sender: TObject);
begin
  qeDolgBux.DefSql := sdsDolgBux.CommandText;
  qurDolgBux.Close;
  //stpDolgList.ExecProc;
  setT := TfrmSettings.Create(self);
  setT.actDataOnly.Execute;
  cbxNotNull.Checked := true;
end;

procedure TfrmRepDolgBux.actRefreshExecute(Sender: TObject);
begin
  //stpDolgList.ExecProc;
  qeDolgBux.Refresh;
end;

procedure TfrmRepDolgBux.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmRepDolgBux.actPrintExecute(Sender: TObject);
begin
//  frDolgBux.PrepareReport;
//  frDolgBux.PrintPreparedReport('',1,false,frAll);
end;

procedure TfrmRepDolgBux.actPreviewExecute(Sender: TObject);
begin
//  frDolgBux.PrepareReport;
//  frDolgBux.ShowReport;
end;

procedure TfrmRepDolgBux.frDolgBuxGetValue(const ParName: String;
  var ParValue: Variant);
begin
  if AnsiUpperCase (ParName) = 'DATEFROM' then begin
    ParValue := datetostr (setT.DateFrom);
  end;
  if AnsiUpperCase (ParName) = 'DATETO' then begin
    ParValue := datetostr (setT.DateTo);
  end;
  if AnsiUpperCase (ParName) = 'TOTALDOLG' then begin
    ParValue := Format ('%8.2f',[curDolg]);
  end;
  if AnsiUpperCase (ParName) = 'TOTALPRED' then begin
    ParValue := Format ('%8.2f',[curPred]);
  end;
end;

procedure TfrmRepDolgBux.actNotNullExecute(Sender: TObject);
begin
  if (cbxNotNull.Checked) then begin
    qeDolgBux.SetFilter( '(dolgafter<>0 or predafter<>0 '+
      'or dolgbefore<>0 or predbefore<>0 or otg<>0 or opl<>0)' ,0);
      qeDolgBux.ApplyFilter;
  end
  else begin
    qeDolgBux.SetFilter('',0);
    qeDolgBux.ApplyFilter;
  end;
end;



procedure TfrmRepDolgBux.actShowDetExecute(Sender: TObject);
var
  frmDolgBuxDet : TfrmDolgBuxDet;
begin
  frmDolgBuxDet :=TfrmDolgBuxDet.Create (self);
  with frmDolgBuxDet do begin
    medDateFrom.Date := setT.DateFrom;
    medDateTo.Date := setT.DateTo;

    dbeIzg.Text := qurDolgBux.FieldByName('izg').AsString;
    dbeZak.Text := qurDolgBux.FieldByName('zak').AsString;
    actRecalc.Execute;
  end;
  frmDolgBuxDet.ShowModal;
  frmDolgBuxDet.Free;
end;
{
procedure TfrmRepDolgBux.actRecalcExecute(Sender: TObject);
begin
  curDolg :=0;
  curPred :=0;
  qurDolgBux.First;
  while not qurDolgBux.eof do begin
    curDolg:=curDolg+qurDolgBux.fieldbyname ('dolgafter').AsCurrency;
    curPred:=curPred+qurDolgBux.FieldByName ('predafter').AsCurrency;
    qurDolgBux.Next;
  end;
end;
}

procedure TfrmRepDolgBux.frDolgBuxBeginDoc;
begin
//  udgDolgBux.Hide;
//  actRecalc.Execute;
end;

procedure TfrmRepDolgBux.frDolgBuxEndDoc;
begin
//  udgDolgBux.Show;
end;



end.
