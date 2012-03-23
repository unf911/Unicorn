unit Dogovor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DB, DBClient, Provider, SqlExpr, ExtCtrls, Grids,
  DBGridEh, ActnList, StdCtrls, Buttons, UnfFilter, PropStorageEh,
  Registry, //TRegIniFile
  untRound, //ApplyOrCancel
  atsAssert, //AssertInternal
   PropFilerEh, GridsEh;
  

type
  TfrmDogovor = class(TForm)
    BitBtn1: TBitBtn;
    ActionList1: TActionList;
    actOk: TAction;
    actCancel: TAction;
    dbgSchet: TDBGridEh;
    Panel1: TPanel;
    Button2: TButton;
    Button3: TButton;
    Button1: TButton;
    sdsSchet: TSQLDataSet;
    dspSchet: TDataSetProvider;
    cdsSchet: TClientDataSet;
    DataSource1: TDataSource;
    UnfFilter1: TUnfFilter;
    actDelete: TAction;
    actInsert: TAction;
    actEdit: TAction;
    rpsClientEdit: TRegPropStorageManEh;
    PropStorageEh1: TPropStorageEh;
    sdsSchetID_DOGOVOR: TIntegerField;
    sdsSchetID_KLIENT: TIntegerField;
    sdsSchetDAT: TSQLTimeStampField;
    sdsSchetID: TStringField;
    sdsSchetIS_DEFAULT: TIntegerField;
    sdsSchetDELMARKED: TSmallintField;
    cdsSchetID_DOGOVOR: TIntegerField;
    cdsSchetID_KLIENT: TIntegerField;
    cdsSchetDAT: TSQLTimeStampField;
    cdsSchetID: TStringField;
    cdsSchetIS_DEFAULT: TIntegerField;
    cdsSchetDELMARKED: TSmallintField;
    BitBtn2: TBitBtn;
    actRefresh: TAction;
    sdsSchetPREDMET: TStringField;
    sdsSchetADRES: TStringField;
    sdsSchetID_CONTACT: TIntegerField;
    cdsSchetPREDMET: TStringField;
    cdsSchetADRES: TStringField;
    cdsSchetID_CONTACT: TIntegerField;
    cdsSchetCONTACT: TStringField;
    SQLDataSet1: TSQLDataSet;
    SQLDataSet1OID: TIntegerField;
    SQLDataSet1NAME: TStringField;
    SQLDataSet1FULLNAME: TStringField;
    SQLDataSet1DELMARKED: TSmallintField;
    SQLDataSet1LASTNAME: TStringField;
    SQLDataSet1FIRSTNAME: TStringField;
    SQLDataSet1MIDDLENAME: TStringField;
    SQLDataSet1BIRTHDAY: TSQLTimeStampField;
    SQLDataSet1BIRTHPLACE: TStringField;
    SQLDataSet1ID_MARRIAGE: TIntegerField;
    SQLDataSet1CHILDREN: TStringField;
    SQLDataSet1HOBBY: TStringField;
    SQLDataSet1WORKPHONE: TStringField;
    SQLDataSet1CELLPHONE: TStringField;
    SQLDataSet1ADDPHONE: TStringField;
    SQLDataSet1EMAIL: TStringField;
    SQLDataSet1PERSONBYDEF: TSmallintField;
    SQLDataSet1ID_KLIENT: TIntegerField;
    SQLDataSet1SEX: TSmallintField;
    SQLDataSet1ID_DOLGNOST: TIntegerField;
    SQLDataSet1ID_MANAGER: TIntegerField;
    DataSetProvider1: TDataSetProvider;
    cdsContacts: TClientDataSet;
    cdsContactsOID: TIntegerField;
    cdsContactsNAME: TStringField;
    cdsContactsFULLNAME: TStringField;
    cdsContactsDELMARKED: TSmallintField;
    cdsContactsLASTNAME: TStringField;
    cdsContactsFIRSTNAME: TStringField;
    cdsContactsMIDDLENAME: TStringField;
    cdsContactsID_DOLGNOST: TIntegerField;
    cdsContactsBIRTHDAY: TSQLTimeStampField;
    cdsContactsBIRTHPLACE: TStringField;
    cdsContactsID_MARRIAGE: TIntegerField;
    cdsContactsHOBBY: TStringField;
    cdsContactsWORKPHONE: TStringField;
    cdsContactsCELLPHONE: TStringField;
    cdsContactsADDPHONE: TStringField;
    cdsContactsEMAIL: TStringField;
    cdsContactsPERSONBYDEF: TSmallintField;
    cdsContactsID_KLIENT: TIntegerField;
    cdsContactsCHILDREN: TStringField;
    cdsContactsDOLGNOST: TStringField;
    cdsContactsSEX: TSmallintField;
    cdsContactsID_MANAGER: TIntegerField;
    cdsContactsMANAGER: TStringField;
    dsContacts: TDataSource;
    sdsSchetTIP_DOGOVORA: TStringField;
    cdsSchetTIP_DOGOVORA: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actOkExecute(Sender: TObject);
    procedure cdsSchetAfterInsert(DataSet: TDataSet);
    procedure dbgSchetDblClick(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure dspSchetGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure cdsSchetBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    FIdKlient : integer;
    FId : integer;
    function SchetEdit: integer;
    procedure OpenContactsSpr(id_klient : integer);
  public
    { Public declarations }
    procedure ShowSchet(id_klient: integer);
  end;

var
  frmDogovor: TfrmDogovor;

implementation

uses
  DogovorEdit,
  untEx
;

{$R *.dfm}

procedure TfrmDogovor.ShowSchet(id_klient: integer);
begin
	dmdEx.startwaiting;
  FIdKlient := id_klient;
  
  cdsSchet.Close;
  cdsSchet.Params.ParamByName('id_klient').AsInteger := FIdKlient;
  dmdEx.openQuery(cdsSchet);

  OpenContactsSpr(FIdKlient);
  dmdEx.stopwaiting;
  self.ShowModal;
end;

procedure TfrmDogovor.FormCreate(Sender: TObject);
var
  //restore grid
  reg1 :TRegIniFile;
  col1 :TColumnEhRestoreParams;
begin
	reg1 := TRegIniFile.Create('Software\Eurosystems\Uchet');
	col1 := [crpColIndexEh]+[crpColWidthsEh]+[crpSortMarkerEh];
	dbgSchet.RestoreColumnsLayout(reg1,col1);
	reg1.Free;
	//end restore grid
  FId := -1;


end;

procedure TfrmDogovor.OpenContactsSpr(id_klient : integer);
begin
  cdsContacts.Close;
  cdsContacts.Params.ParamByName('id_klient').asInteger := id_klient;
  dmdEx.OpenQuery(cdsContacts);
end;

procedure TfrmDogovor.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
//  save grid
  reg1 :TRegIniFile;
begin
  reg1 := TRegIniFile.Create('Software\Eurosystems\Uchet');
  dbgSchet.SaveColumnsLayout(reg1);
  reg1.Free;
  //end save grid
  Action := caFree;
end;

procedure TfrmDogovor.actInsertExecute(Sender: TObject);
begin
  cdsSchet.Insert;
end;

procedure TfrmDogovor.actEditExecute(Sender: TObject);
begin
  cdsSchet.Edit;
  SchetEdit;
end;

procedure TfrmDogovor.actDeleteExecute(Sender: TObject);
begin
try
  if MessageDlg('Удалить запись?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      cdsSchet.Edit;
      cdsSchet.FieldByName('delmarked').asInteger :=1;
      cdsSchet.Post;
      ApplyOrCancel(cdsSchet);
      cdsSchet.Refresh;
  end; //if
except
  AssertInternal('5FAECB8A-032D-44E2-8C42-4ADD2B6F567E');
end;
end;

procedure TfrmDogovor.actOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmDogovor.cdsSchetAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('id_dogovor').asInteger := dmdEx.GetGenValue('naklo_gen');
  DataSet.FieldByName('is_default').asInteger := 1;
  DataSet.FieldByName('delmarked').asInteger := 0;
  DataSet.FieldByName('dat').asDateTime := Date;
  if not  DataSet.FieldByName('id_klient').Visible then begin
    DataSet.FieldByName('id_klient').asInteger := FIdKlient;
  end;
  SchetEdit;
end;

function TfrmDogovor.SchetEdit:integer;
var
  frmEdit : TfrmDogovorEdit;
begin
  frmEdit := TfrmDogovorEdit.Create(self);
  frmEdit.dsEdit.DataSet := cdsSchet;
  Result := frmEdit.ShowModal;
  frmEdit.Free;
end;



procedure TfrmDogovor.dbgSchetDblClick(Sender: TObject);
begin
  actEdit.Execute;
end;

procedure TfrmDogovor.actRefreshExecute(Sender: TObject);
begin
  cdsSchet.Close;
  cdsSchet.Open;
end;

procedure TfrmDogovor.dspSchetGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
  TableName := 'DOGOVOR_VW';
end;

procedure TfrmDogovor.cdsSchetBeforePost(DataSet: TDataSet);
begin
  if not (DataSet.State = dsBrowse) then begin
    //для избегания исключения при УДАЛЕНИИ договора
    if DataSet.FieldByName('id_contact').IsNull then begin
      ShowMessage ('Заполните контакт');
      abort;
    end;
  end;
end;

end.
