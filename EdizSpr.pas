unit EdizSpr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DBClient, Provider, DB, SqlExpr, Spravochnik,
  untRound, //ShowCheckboxForColumn
  EdizSprEdit //TfrmEdizSprEdit
  ;

type
  TfrmEdizSpr = class(TfrmSpravochnik)
    sdsEdiz: TSQLDataSet;
    dspEdiz: TDataSetProvider;
    cdsEdiz: TClientDataSet;
    sdsEdizOID: TIntegerField;
    sdsEdizNAME: TStringField;
    sdsEdizKOD: TIntegerField;
    sdsEdizFULLNAME: TStringField;
    sdsEdizDELMARKED: TSmallintField;
    cdsEdizOID: TIntegerField;
    cdsEdizNAME: TStringField;
    cdsEdizKOD: TIntegerField;
    cdsEdizFULLNAME: TStringField;
    cdsEdizDELMARKED: TSmallintField;
    procedure FormCreate(Sender: TObject);
    procedure cdsEdizAfterInsert(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure ShowSpr;
    function SchetEdit:integer; override;
  end;

var
  frmEdizSpr: TfrmEdizSpr;

implementation

uses untEx;

{$R *.dfm}




procedure TfrmEdizSpr.FormCreate(Sender: TObject);
begin
  dsSprav.Dataset := cdsEdiz;
  inherited;
end;

procedure TfrmEdizSpr.cdsEdizAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('oid').asInteger := dmdEx.GetGenValue('oid_gen');
  DataSet.FieldByName('delmarked').asInteger := 0;  
end;

procedure TfrmEdizSpr.ShowSpr;
begin
	dmdEx.startwaiting;
  cdsEdiz.Close;
  dmdEx.openQuery(cdsEdiz);
  ShowCheckboxForColumn(ColumnByName(dbgSchet.Columns, 'DELMARKED'));
  dmdEx.stopwaiting;
  self.show;   
end;

function TfrmEdizSpr.SchetEdit:integer;
begin
  frmEdizSprEdit := TfrmEdizSprEdit.Create(self);
  frmEdizSprEdit.dtsEdit.DataSet := dsSprav.Dataset;
  Result := frmEdizSprEdit.ShowModal;
  frmEdizSprEdit.Free;
end;

end.
