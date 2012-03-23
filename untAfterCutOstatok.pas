unit untAfterCutOstatok;
{детализация остатков по складу}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, Grids, DBGridEh, DB, SqlExpr, DBClient, Provider,
  untEx, StdCtrls, Buttons, ActnList, Menus,
  untSklostDet,
  Registry, GridsEh;

type
  TfrmAfterCutOstatok = class(TForm)
    dspSklostdet: TDataSetProvider;
    cdsSklostdet: TClientDataSet;
    sdsSklostdet: TSQLDataSet;
    dsSklostdet: TDataSource;
    dbgAfterCutOstatok: TDBGridEh;
    btnOk: TBitBtn;
    cdsSklostdetTOVAR: TStringField;
    cdsSklostdetTARA: TStringField;
    cdsSklostdetNOMER_TARY: TStringField;
    cdsSklostdetKOLOTP: TFMTBCDField;
    cdsSklostdetKOLBUXT: TIntegerField;
    cdsSklostdetTIP: TIntegerField;
    cdsSklostdetKOLOTP_ITOG: TFMTBCDField;
    cdsSklostdetKOLBUXT_ITOG: TIntegerField;
    ActionList1: TActionList;
    actDetail: TAction;
    cdsSklostdetID_OSTT: TIntegerField;
    BitBtn2: TBitBtn;
    MainMenu1: TMainMenu;
    mnuAction: TMenuItem;
    N1: TMenuItem;
    cdsSklostdetTIP2: TStringField;
    procedure btnOkClick(Sender: TObject);
//    procedure cdsSklostdetCalcFields(DataSet: TDataSet);
    procedure actDetailExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    function ShowDetail (id_nakl : integer):integer;
  end;

var
  frmAfterCutOstatok: TfrmAfterCutOstatok;

implementation
uses
  AtsAssert;

{$R *.dfm}

function TfrmAfterCutOstatok.ShowDetail(id_nakl: integer): integer;
begin
  dmdEx.StartWaiting;
  cdsSklostdet.Close;
  cdsSklostdet.Params.ParamByName('id_nakl').asInteger:=id_nakl;
  cdsSklostdet.Open;
  dmdEx.StopWaiting;
  Result := self.ShowModal;
end;

procedure TfrmAfterCutOstatok.btnOkClick(Sender: TObject);
begin
  Self.ModalResult := mrOk;
end;
{
procedure TfrmAfterCutOstatok.cdsSklostdetCalcFields(DataSet: TDataSet);
var
  iTip : integer;
begin
try
//  iTip := cdsSklostDet.FieldByName('tip').asInteger;
//  cdsSklostDet.FieldByName('tip2').asString :=
//    dmdEx.GetTipSkladPosit(iTip);
except
  AssertInternal('7025CA4C-4E74-4C1C-80FE-EC79DD34F278');
end;
end;
}

procedure TfrmAfterCutOstatok.actDetailExecute(Sender: TObject);
var
  frmSklostDet : TfrmSklostDet;
begin
try
  frmSklostDet := TfrmSklostDet.Create(self);
  frmSklostDet.ShowDetailModal(
    cdsSklostdet.FieldBYName('id_ostt').asInteger);
  frmSklostdet.free;
except
  AssertInternal ('{9E44E19E-8304-4AE2-B362-4B47E910B476}');
end;
end;

procedure TfrmAfterCutOstatok.FormCreate(Sender: TObject);
var
  reg1 :TRegIniFile;
  col1 :TColumnEhRestoreParams;
begin
  //restore grid
  reg1 := TRegIniFile.Create('Software\Eurosystems\Uchet');
  col1 := [crpColWidthsEh];
  dbgAfterCutOstatok.RestoreColumnsLayout(reg1,col1);
  reg1.Free;
  //end restore grid
end;

procedure TfrmAfterCutOstatok.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
//  save grid
  reg1 :TRegIniFile;
begin
  reg1 := TRegIniFile.Create('Software\Eurosystems\Uchet');
  dbgAfterCutOstatok.SaveColumnsLayout(reg1);
  reg1.Free;
  //end save grid
end;

end.
