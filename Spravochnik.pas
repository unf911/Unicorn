unit Spravochnik;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DB, DBClient, Provider, SqlExpr, ExtCtrls, Grids,
  DBGridEh, ActnList, StdCtrls, Buttons, UnfFilter, PropStorageEh,
  Registry, //TRegIniFile
  untRound, //ApplyOrCancel
  atsAssert, //AssertInternal
  ClientSchetEdit, PropFilerEh, GridsEh;
  

type
  TfrmSpravochnik = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ActionList1: TActionList;
    actOk: TAction;
    actCancel: TAction;
    dbgSchet: TDBGridEh;
    Panel1: TPanel;
    Button2: TButton;
    Button3: TButton;
    Button1: TButton;
    dsSprav: TDataSource;
    UnfFilter1: TUnfFilter;
    actDelete: TAction;
    actInsert: TAction;
    actEdit: TAction;
    rpsClientEdit: TRegPropStorageManEh;
    PropStorageEh1: TPropStorageEh;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actOkExecute(Sender: TObject);
    procedure dbgSchetDblClick(Sender: TObject);
  private
    { Private declarations }
    FId : integer;
  public
    { Public declarations }
    function SchetEdit: integer; virtual;abstract;
  end;

var
  frmSpravochnik: TfrmSpravochnik;

implementation

uses untEx;

{$R *.dfm}


procedure TfrmSpravochnik.FormCreate(Sender: TObject);
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

procedure TfrmSpravochnik.FormClose(Sender: TObject;
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

procedure TfrmSpravochnik.actInsertExecute(Sender: TObject);
begin
  dsSprav.Dataset.Insert;
  SchetEdit;
end;

procedure TfrmSpravochnik.actEditExecute(Sender: TObject);
begin
  if dsSprav.Dataset.eof and dsSprav.Dataset.bof then begin
    exit;
  end;
  dsSprav.Dataset.Edit;
  SchetEdit;
end;

procedure TfrmSpravochnik.actDeleteExecute(Sender: TObject);
begin
  if dsSprav.Dataset.eof and dsSprav.Dataset.bof then begin
    exit;
  end;
try
  if MessageDlg('Удалить запись?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      dsSprav.Dataset.Edit;
      dsSprav.Dataset.FieldByName('delmarked').asInteger :=1;
      dsSprav.Dataset.Post;
      ApplyOrCancel(dsSprav.Dataset);
      dsSprav.Dataset.Refresh;
  end; //if
except
  AssertInternal('5FAECB8A-032D-44E2-8C42-4ADD2B6F567E');
end;
end;

procedure TfrmSpravochnik.actOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSpravochnik.dbgSchetDblClick(Sender: TObject);
begin
  actEdit.Execute;
end;


end.
