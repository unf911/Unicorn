unit SravnPriceCompare;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PropFilerEh, MemTableDataEh, Db, MemTableEh, PropStorageEh,
  StdCtrls, Buttons, UnfFilter, GridsEh, DBGridEh, untEx;

type
  TfrmSravnPriceCompare = class(TForm)
    dbgSravnPriceCompare: TDBGridEh;
    UnfFilter1: TUnfFilter;
    BitBtn1: TBitBtn;
    dsSravnPriceCompare: TDataSource;
    PropStorageEh1: TPropStorageEh;
    RegPropStorageManEh1: TRegPropStorageManEh;
    mteSravnPriceCompare: TMemTableEh;
    mteSravnPriceCompareDAT: TDateField;
    mteSravnPriceComparePOST: TStringField;
    mteSravnPriceCompareANALOG: TStringField;
    mteSravnPriceCompareTOVAR: TStringField;
    mteSravnPriceCompareCENA: TFloatField;
    mteSravnPriceCompareID_ANALOG: TIntegerField;
    mteSravnPriceCompareID_POST: TIntegerField;
    mteSravnPriceCompareID_TOVAR: TIntegerField;
    mteSravnPriceComparePROCENTTOBEST: TFloatField;
    mteSravnPriceComparePROCENTTOPREVIOUS: TFloatField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ShowCompare( DataSet: TDataSet;id_tovar : integer);
  end;

var
  frmSravnPriceCompare: TfrmSravnPriceCompare;

implementation

{$R *.dfm}

{ TfrmSravnPriceCompare }

procedure TfrmSravnPriceCompare.ShowCompare(DataSet: TDataSet;id_tovar : integer);
var
  dPriceBest, dPricePrevious : double;
begin
  if mteSravnPriceCompare.Active then begin
    mteSravnPriceCompare.EmptyTable;
  end else begin
    mteSravnPriceCompare.CreateDataSet;
  end;
  //dsSravnPriceCompare.DataSet.Close;
  dsSravnPriceCompare.DataSet.open;
  DataSet.Filtered := false;
  DataSet.Filter := '[id_analog]='+inttostr(id_tovar);
  DataSet.Filtered := true;
  //запись в таблицу в памяти
  DataSet.First;
  while not DataSet.eof do begin
    dsSravnPriceCompare.DataSet.Insert;
    dsSravnPriceCompare.DataSet.FieldByName('id_tovar').asInteger :=
      DataSet.FieldByName('id_tovar').AsInteger;
    dsSravnPriceCompare.DataSet.FieldByName('id_analog').asInteger :=
      DataSet.FieldByName('id_analog').AsInteger;
    dsSravnPriceCompare.DataSet.FieldByName('id_post').asInteger :=
      DataSet.FieldByName('id_post').AsInteger;
    dsSravnPriceCompare.DataSet.FieldByName('dat').AsDateTime :=
      DataSet.FieldByName('dat').AsDateTime;
    dsSravnPriceCompare.DataSet.FieldByName('cena').AsFloat :=
      DataSet.FieldByName('cena').AsFloat;
    dsSravnPriceCompare.DataSet.Post;
    DataSet.Next;
  end;
  mteSravnPriceCompare.SortByFields('cena');
  //сравнение цен между собой
  dsSravnPriceCompare.DataSet.First;
  dPriceBest :=dsSravnPriceCompare.DataSet.FieldByName('cena').asFloat;
  dPricePrevious := dsSravnPriceCompare.DataSet.FieldByName('cena').asFloat;
  dsSravnPriceCompare.DataSet.Next;
  while not dsSravnPriceCompare.DataSet.Eof do begin
    dsSravnPriceCompare.DataSet.Edit;
    if dPriceBest<>0 then begin
      dsSravnPriceCompare.DataSet.FieldByName('PROCENTTOBEST').asFloat :=
        (1-dPriceBest/dsSravnPriceCompare.DataSet.FieldByName('cena').asFloat)*100;
    end else begin
      dsSravnPriceCompare.DataSet.FieldByName('PROCENTTOBEST').clear;
    end;
    if dPricePrevious<>0 then begin
      dsSravnPriceCompare.DataSet.FieldByName('PROCENTTOPREVIOUS').asFloat :=
        (1-dPricePrevious/dsSravnPriceCompare.DataSet.FieldByName('cena').asFloat)*100;
    end else begin
      dsSravnPriceCompare.DataSet.FieldByName('PROCENTTOPREVIOUS').clear;
    end;
    dsSravnPriceCompare.DataSet.Post;
    dPricePrevious := dsSravnPriceCompare.DataSet.FieldByName('cena').asFloat;
    dsSravnPriceCompare.DataSet.Next;
  end;
  showmodal;
  DataSet.Filtered := false;
end;

procedure TfrmSravnPriceCompare.FormCreate(Sender: TObject);
begin
  dmdEx.OpenQuery(dmdEx.cdsPost);
  dmdEx.OpenQuery(dmdEx.cdsTovar);
end;

end.
