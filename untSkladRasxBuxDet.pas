unit untSkladRasxBuxDet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, QueryExtender, DBTables, Grids, DBGrids,
  StdCtrls, DBGridEh, FMTBcd, DBClient, Provider, SqlExpr,
  untEx, Buttons, ActnList, UnfFilter, atsAssert,
  //Naklr,
  GridsEh,
  PropFilerEh, PropStorageEh;

type
  TfrmSkladRasxBuxDet = class(TForm)
    qeDet: TQueryExtender;
    dsDet: TDataSource;
    DBGridEh1: TDBGridEh;
    sdsDet: TSQLDataSet;
    dspDet: TDataSetProvider;
    cdsDet: TClientDataSet;
    cdsDetDAT: TSQLTimeStampField;
    cdsDetIZG: TStringField;
    cdsDetZAK: TStringField;
    cdsDetMANAGER: TStringField;
    cdsDetID: TStringField;
    cdsDetID_IZG: TIntegerField;
    cdsDetID_ZAK: TIntegerField;
    cdsDetID_MANAGER: TIntegerField;
    ActionList1: TActionList;
    actExit: TAction;
    BitBtn1: TBitBtn;
    cdsDetKOLOTP2: TFMTBCDField;
    UnfFilter1: TUnfFilter;
    BitBtn2: TBitBtn;
    actDetail: TAction;
    cdsDetID_NAKL: TIntegerField;
    cdsDetTIP: TSmallintField;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    procedure FormCreate(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actDetailExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ShowSkladRasxBuxDet(qeSrc: TQueryExtender;iTovar : integer) :integer;
  end;

var
  frmSkladRasxBuxDet: TfrmSkladRasxBuxDet;

implementation


{$R *.dfm}

uses SkladAux; //OpenDocument

procedure TfrmSkladRasxBuxDet.FormCreate(Sender: TObject);
begin
  cdsDet.Close;
  qeDet.DefSql := sdsDet.CommandText;
end;

function TfrmSkladRasxBuxDet.ShowSkladRasxBuxDet(qeSrc: TQueryExtender;iTovar : integer): integer;
var
  sTemp: string;
  i : integer;
begin
  Result :=0;
  for i:=0 to qeSrc.CountSql('where')-1 do begin
    sTemp := qeSrc.GetSQL('where',i);
    qeDet.SetSQL('where',sTemp,i+1);
  end;
  qeDet.SetSQL('where','t.id_tovar='+inttostr(iTovar),0);
  //≈сли был указан один из режимов: неуехавшие или уехавшие, то
  //ќптимизируем выполнение детализации, дл€ этого переписываем запрос
  if qeDet.GetSQL('where',5+1)<>'' then begin
    qeDet.SetSQL('where','',5+1); //то условие недействительно
    sTemp := 'left join naklo om on om.tip=5 and om.parent_id_nakl=n.id_nakl';
    qeDet.SetSql('from',sTemp,0);
    sTemp := '(min(om.id_nakl) is not null or min(om.posted)<>0)';
    qeDet.SetSql('having',sTemp,1);
    sTemp := 'n.id,n.dat,n.id_nakl,n.id_izg,n.id_zak,n.id_manager,t.kolotp';
    qeDet.SetSql('group by',sTemp,1);
  end;
  if qeDet.GetSQL('where',6+1)<>'' then begin
    qeDet.SetSQL('where','',6+1); //то условие недействительно
    sTemp := 'left join naklo om on om.tip=5 and om.parent_id_nakl=n.id_nakl';
    qeDet.SetSql('from',sTemp,0);
    sTemp := '(min(om.id_nakl) is null or min(om.posted)=0)';
    qeDet.SetSql('having',sTemp,1);
    sTemp := 'n.id,n.dat,n.id_nakl,n.id_izg,n.id_zak,n.id_manager,t.kolotp';
    qeDet.SetSql('group by',sTemp,1);
  end;
  qeDet.Refresh;
  //Result := self.ShowModal;
end;

procedure TfrmSkladRasxBuxDet.actExitExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSkladRasxBuxDet.BitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOk;
  close;
end;

procedure TfrmSkladRasxBuxDet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TfrmSkladRasxBuxDet.DBGridEh1DblClick(Sender: TObject);
begin
  actDetail.Execute; 
end;

procedure TfrmSkladRasxBuxDet.DBGridEh1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return : begin
      actDetail.Execute;
    end;
  end;
end;

procedure TfrmSkladRasxBuxDet.actDetailExecute(Sender: TObject);
begin
try
  if dsDet.DataSet.Eof and dsDet.DataSet.Bof then begin
    exit;
  end;
  OpenDocument(self,
    dsDet.DataSet.FieldByName('id_nakl').AsInteger,
    dsDet.DataSet.FieldByName('tip').AsInteger,
    0);
except
  AssertInternal('F40CC8E0-DFEB-4079-A991-A550220A4CE7');
end;
end;

end.
