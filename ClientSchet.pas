unit ClientSchet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DB, DBClient, Provider, SqlExpr, ExtCtrls, Grids,
  DBGridEh, ActnList, StdCtrls, Buttons, UnfFilter, PropStorageEh,
  Registry, //TRegIniFile
  untRound, //ApplyOrCancel
  atsAssert, //AssertInternal
  ClientSchetEdit, PropFilerEh, GridsEh,
  Spravochnik;
  

type
  TfrmClientSchet = class(TfrmSpravochnik)
    sdsSchet: TSQLDataSet;
    dspSchet: TDataSetProvider;
    cdsSchet: TClientDataSet;
    cdsSchetID: TIntegerField;
    cdsSchetBANK_NAME: TStringField;
    cdsSchetRASCH: TFloatField;
    cdsSchetMFO: TFloatField;
    cdsSchetID_KLIENT: TIntegerField;
    sdsSchetID: TIntegerField;
    sdsSchetBANK_NAME: TStringField;
    sdsSchetRASCH: TFloatField;
    sdsSchetMFO: TFloatField;
    sdsSchetID_KLIENT: TIntegerField;
    sdsSchetDELMARKED: TSmallintField;
    cdsSchetDELMARKED: TSmallintField;
    sdsSchetID_CURRENCY: TIntegerField;
    cdsSchetID_CURRENCY: TIntegerField;
    cdsSchetCURRENCY: TStringField;
    sdsSchetFULLNAME: TStringField;
    cdsSchetFULLNAME: TStringField;
    sdsSchetIS_NAL: TSmallintField;
    cdsSchetIS_NAL: TSmallintField;
    sdsSchetID_MANAGER: TIntegerField;
    cdsSchetID_MANAGER: TIntegerField;
    cdsSchetMANAGER: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure cdsSchetAfterInsert(DataSet: TDataSet);

  private
    { Private declarations }
    FIdKlient : integer;
  public
    { Public declarations }
    procedure ShowSchet(id_klient: integer);
    function SchetEdit:integer; override;
  end;

var
  frmClientSchet: TfrmClientSchet;

implementation

uses untEx;

{$R *.dfm}

procedure TfrmClientSchet.ShowSchet(id_klient: integer);
begin
	dmdEx.startwaiting;
  FIdKlient := id_klient;
  cdsSchet.Close;
  cdsSchet.Params.ParamByName('id_klient').AsInteger := FIdKlient;
  dmdEx.openQuery(cdsSchet);
  dmdEx.stopwaiting;
  self.ShowModal;   
end;

procedure TfrmClientSchet.FormCreate(Sender: TObject);
begin
  dsSprav.Dataset := cdsSchet;
  inherited;
end;

procedure TfrmClientSchet.cdsSchetAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('oid').asInteger := dmdEx.GetGenValue('oid_gen');
  DataSet.FieldByName('delmarked').asInteger := 0;
  DataSet.FieldByName('is_nal').asInteger := 0;
  DataSet.FieldByName('id_klient').asInteger := FIdKlient;
  dmdEx.OpenQuery(dmdEx.cdsAllClient);
  DataSet.FieldByName('fullname').asString :=
    dmdEx.cdsAllClient.Lookup('id',FIdKlient,'name')+' Ñ÷¸ò';
  dmdEx.CloseQuery(dmdEx.cdsAllClient,false);
  DataSet.FieldByName('id_currency').asInteger := dmdEx.GetIdCurrencyUAH;
end;

function TfrmClientSchet.SchetEdit:integer;
begin
  frmClientSchetEdit := TfrmClientSchetEdit.Create(self);
  frmClientSchetEdit.dtsEdit.DataSet := dsSprav.Dataset;
  Result := frmClientSchetEdit.ShowModal;
  frmClientSchetEdit.Free;
end;


end.
