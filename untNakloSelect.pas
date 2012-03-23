unit untNakloSelect;
{детализация остатков по складу}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, Grids, DBGridEh, DB, SqlExpr, DBClient, Provider,
  untEx, StdCtrls, Buttons, ActnList, QueryExtender,
  untSettings,untNakloEdit, GridsEh;

type
  TfrmNakloSelect = class(TForm)
    btnOk: TBitBtn;
    dbgNaklo: TDBGridEh;
    sdsNaklo: TSQLDataSet;
    sdsNakloID_NAKL: TIntegerField;
    sdsNakloNALOG_NDS: TFMTBCDField;
    sdsNakloID_SKLAD: TIntegerField;
    sdsNakloDAT: TSQLTimeStampField;
    sdsNakloPOSTED: TSmallintField;
    sdsNakloID_CURRENCY: TSmallintField;
    sdsNakloCOMMENT: TStringField;
    sdsNakloID_IZG: TIntegerField;
    sdsNakloID_ZAK: TIntegerField;
    sdsNakloID_MANAGER: TIntegerField;
    sdsNakloKURS: TFloatField;
    sdsNakloNDS: TFMTBCDField;
    sdsNakloTIP: TSmallintField;
    sdsNakloDELMARKED: TSmallintField;
    dsNakloSrc: TDataSource;
    dspNaklo: TDataSetProvider;
    cdsNaklo: TClientDataSet;
    cdsNakloID_NAKL: TIntegerField;
    cdsNakloID_IZG: TIntegerField;
    cdsNakloID_ZAK: TIntegerField;
    cdsNakloID_MANAGER: TIntegerField;
    cdsNakloID_CURRENCY: TSmallintField;
    cdsNakloNALOG_NDS: TFMTBCDField;
    cdsNakloNDS: TFMTBCDField;
    cdsNakloID_SKLAD: TIntegerField;
    cdsNakloPOSTED: TSmallintField;
    cdsNakloCOMMENT: TStringField;
    cdsNakloIZG: TStringField;
    cdsNakloZAK: TStringField;
    cdsNakloMANAGER: TStringField;
    cdsNakloDAT: TSQLTimeStampField;
    cdsNakloKURS: TFloatField;
    cdsNakloTIP: TSmallintField;
    cdsNakloDELMARKED: TSmallintField;
    dsNaklo: TDataSource;
    qeNaklr: TQueryExtender;
    ActionList2: TActionList;
    actGrid1ListShow: TAction;
    Button1: TButton;
    actInsert: TAction;
    btnSettings: TBitBtn;
    actSettings: TAction;
    actRefresh: TAction;
    cdsNakloTIPCONST: TStringField;
    sdsNakloID: TStringField;
    cdsNakloID: TStringField;
    procedure btnOkClick(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure cdsNakloAfterInsert(DataSet: TDataSet);
    procedure actInsertExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actSettingsExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
  private
    { Private declarations }
//    id : integer;
    frmNakloEdit : TfrmNakloEdit;
  public
    { Public declarations }
    setT : TfrmSettings;
    function ShowNaklo (id_nakl : integer):integer;
  end;

var
  frmNakloSelect: TfrmNakloSelect;

implementation

uses  untRound;

{$R *.dfm}

function TfrmNakloSelect.ShowNaklo(id_nakl: integer): integer;
begin
  cdsNaklo.Open;
  cdsNaklo.Locate('id_nakl',id_nakl,[]);
  if self.ShowModal=mrOk then begin
    Result := cdsNaklo.FieldByName('id_nakl').asInteger; //ok
  end else begin
    Result := 0 ;//cancel
  end;
end;

procedure TfrmNakloSelect.btnOkClick(Sender: TObject);
begin
  Self.ModalResult := mrOk;
end;

procedure TfrmNakloSelect.actExitExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmNakloSelect.cdsNakloAfterInsert(DataSet: TDataSet);
begin
  cdsNaklo.FieldByName('id_nakl').AsInteger:=
    dmdEx.GetGenValue('naklo_gen');
  cdsNaklo.FieldByName('dat').AsDateTime := Date; //default date. time=0
  cdsNaklo.FieldByName('nalog_nds').AsFloat := dmdEx.GetNds ( Date );
  cdsNaklo.FieldByName('kurs').asFloat := 1.0000;
  cdsNaklo.FieldByName('id_sklad').asInteger := 0;
  cdsNaklo.FieldByName('id_currency').asInteger := 0;
  cdsNaklo.FieldByName('nds').AsFloat := 0;
  cdsNaklo.FieldByName('posted').asInteger := 0;
  cdsNaklo.FieldByName('tip').asInteger := 5; //отгрузка
  cdsNaklo.FieldByName('delmarked').asInteger := 0;
  if (frmNakloEdit.Visible = false) then begin
    if frmNakloEdit.ShowModal=mrOk then begin
      PostAndApplyOrCancel(cdsNaklo);
//      cdsNaklo.RefreshRecord;
    end;
  end;
end;

procedure TfrmNakloSelect.actInsertExecute(Sender: TObject);
begin
  cdsNaklo.Insert;
end;

procedure TfrmNakloSelect.FormCreate(Sender: TObject);
begin
//  id := -1;
  setT := TfrmSettings.Create(self);
  setT.DateFrom := Date-14;
  setT.DateTo:= Date;
  setT.actAllManagerOn.Execute;
//  setT.IDManager := dmdEx.GetIdManager;
  actRefresh.Execute;
  frmNakloEdit := TfrmNakloEdit.Create(self);
  frmNakloEdit.dsNakloEdit.DataSet := cdsNaklo;
end;

procedure TfrmNakloSelect.actSettingsExecute(Sender: TObject);
begin
  actSettings.checked := setT.ProcessSettingsChange(actRefresh);
end;

procedure TfrmNakloSelect.actRefreshExecute(Sender: TObject);
begin

    self.Caption :='Отгрузки со склада: '
      +setT.Manager + ' c ' + datetostr (setT.DateFrom)
      + ' по '+ datetostr(setT.DateTo);
    if (setT.IDManager<>0) then begin
      qeNaklr.SetSQL('where',
        'id_manager='+ inttostr(setT.IDManager),0);
    end
    else begin
      qeNaklr.SetSQL('where',
        '',0);
    end;
    qeNaklr.SetSQL('where',
      'n.dat>='+ QuotedStr(datetostr(setT.DateFrom)),1);
    qeNaklr.SetSQL('where',
      'n.dat<='+ QuotedStr(datetostr(setT.DateTo))  ,2);
    cdsNaklo.Close;
    qeNaklr.Prepare;
    cdsNaklo.Open;
//    qeNaklr.Refresh;
    cdsNaklo.Last;

end;

end.
