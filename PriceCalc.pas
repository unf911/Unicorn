unit PriceCalc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ActnList, Mask, DBCtrlsEh, FMTBcd, DB,
  SqlExpr,untEx, PropStorageEh,
  untRound, PropFilerEh;

type
  TfrmPriceCalc = class(TForm)
    dbePrice: TDBNumberEditEh;
    dbeKurs: TDBNumberEditEh;
    dbeSkidka: TDBNumberEditEh;
    dbeCena: TDBNumberEditEh;
    dbeCenaNds: TDBNumberEditEh;
    ActionList1: TActionList;
    actCancel: TAction;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    sdsGetKurs: TSQLDataSet;
    sdsGetKursKURS: TFloatField;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    PropStorageEh2: TPropStorageEh;
    rpsForm: TRegPropStorageManEh;
    dbePriceNds: TDBNumberEditEh;
    Label6: TLabel;
    procedure dbePriceChange(Sender: TObject);
    procedure dbeKursChange(Sender: TObject);
    procedure dbeSkidkaChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FdNds : double;
    FiTara : integer;
    Semaphore : boolean;
    procedure RecountResult; //Пересчитать цены результата
  public
    { Public declarations }
    { TODO : Выбор прайса : дата прайса, включает ли НДС, валюта прайса }
    {iTara - tovar.tara=тара ли товар, если да то все в гривнах}
    {cCena - tovar.cena=прайсовая цена в долларах}
    procedure ShowPriceCalc(iTara : integer; cCena : currency);
  end;

var
  frmPriceCalc: TfrmPriceCalc;

implementation

{$R *.dfm}
uses
  AtsAssert;

procedure TfrmPriceCalc.dbePriceChange(Sender: TObject);
begin
  if not Semaphore then begin
    Semaphore := true;
    RecountResult;
    Semaphore := false;
  end;
end;

procedure TfrmPriceCalc.RecountResult;
var
  dCena, dCenaNds : double;
begin
  dbePriceNds.Value := RRoundto (
    rroundto(VarToDbl(dbePrice.Value),-2) * (1+FdNds),
    -2
  );
  dCena := rroundto(rroundto(VarToDbl(dbePrice.Value),-2)
           *(1-varToDbl(dbeSkidka.Value)/100),-2);
  if FiTara<>1 then begin
    dCena := RRoundTo(dCena * vartodbl(dbeKurs.Value),-2);
  end;
  dCenaNds := RRoundto (dCena * (1+FdNds), -2);
  dbeCena.value :=dCena;
  dbeCenaNds.value := dCenaNds;
end;

procedure TfrmPriceCalc.dbeKursChange(Sender: TObject);
begin
  if not Semaphore then begin
    Semaphore := true;
    RecountResult;
    Semaphore := false;
  end;
end;

procedure TfrmPriceCalc.dbeSkidkaChange(Sender: TObject);
begin
  if not Semaphore then begin
    Semaphore := true;
    RecountResult;
    Semaphore := false;
  end;
end;

procedure TfrmPriceCalc.ShowPriceCalc(iTara: integer; cCena: currency);
begin
  dbeKurs.Enabled := true; 
  FiTara := iTara;
  Semaphore := false ;//def value
  if not Semaphore then begin
    //ничего лишнего не пересчитывается
    Semaphore := true;

    //курс по умолчанию всегда
    dbeKurs.Value := 1;
    if iTara=1 then begin
      dbeKurs.Enabled := false;
    end else begin
      {
      try
        iCurrency := dmdEx.GetOidObjects('ТИП ВАЛЮТ',-100);
        iCurrency := dmdEx.getOidObjects('USD',iCurrency);

        sdsGetKurs.Close;
        sdsGetKurs.params.ParamByName('dat').AsDate := Date;
        sdsGetKurs.params.ParamByName('id_currency').AsInteger :=iCurrency;
        sdsGetKurs.Open;
        if not sdsGetKurs.FieldByName('kurs').IsNull then begin
          dKurs := sdsGetKurs.FieldByName('kurs').asFloat;
          dbeKurs.Value := dKurs;
        end; //if kurs not null
      finally
        sdsGetKurs.Close;
      end
     }
    end; //if tara =1
    dbePrice.Value := cCena;
    FdNds := dmdEx.GetNds ( Date );
    //load skidka
    try
      PropStorageEh1.LoadProperties;
    except
      AssertInternal('A12C12E9-112F-48FC-A714-597FB032D514');
    end;
    RecountResult;
    Semaphore := false;
  end;
  //self.ShowModal;
end;

procedure TfrmPriceCalc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //save skidka
  PropStorageEh1.SaveProperties;
end;

procedure TfrmPriceCalc.BitBtn1Click(Sender: TObject);
begin
  modalResult := mrOk;
end;

procedure TfrmPriceCalc.FormShow(Sender: TObject);
begin
  dbeSkidka.SetFocus;
end;

end.
