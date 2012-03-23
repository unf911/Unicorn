unit NaklpbuxZatraty;
{
Редактирование списка затрат
 }

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, QueryExtender, DB, DBClient, Provider, SqlExpr,
  UnfFilter, PropStorageEh, StdCtrls, Buttons, Grids, DBGridEh, ActnList,
  untRound, atsAssert, NaklpbuxZatratyEdit, PropFilerEh, GridsEh;

type
  TfrmNaklpbuxZatraty = class(TForm)
    DBGridEh1: TDBGridEh;
    btnOk: TBitBtn;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    UnfFilter1: TUnfFilter;
    sdsNaklo: TSQLDataSet;
    dspNaklo: TDataSetProvider;
    cdsNaklo: TClientDataSet;
    dsNaklo: TDataSource;
    qeNaklo: TQueryExtender;
    ActionList1: TActionList;
    actSettings: TAction;
    actOk: TAction;
    actCancel: TAction;
    sdsConst: TSQLDataSet;
    cdsNakloID_NAKL: TIntegerField;
    cdsNakloDAT: TSQLTimeStampField;
    cdsNakloID_ZAK: TIntegerField;
    cdsNakloID_IZG: TIntegerField;
    cdsNakloNDS: TFMTBCDField;
    cdsNakloCOMMENT: TStringField;
    cdsNakloID_MANAGER: TIntegerField;
    cdsNakloID: TStringField;
    cdsNakloPOSTED: TSmallintField;
    cdsNakloID_SKLAD: TIntegerField;
    cdsNakloID_CURRENCY: TSmallintField;
    cdsNakloID_SKLAD_TO: TIntegerField;
    cdsNakloKURS: TFloatField;
    cdsNakloZATRATY: TFMTBCDField;
    cdsNakloIZG: TStringField;
    cdsNakloZAK: TStringField;
    cdsNakloMANAGER: TStringField;
    cdsNakloSKLAD: TStringField;
    cdsNakloCURRENCY: TStringField;
    cdsNakloSTATYA: TStringField;
    actGrid1ListShow: TAction;
    cdsNakloPARENT_ID_NAKL: TIntegerField;
    sdsDelmark: TSQLDataSet;
    sdsNakloID_NAKL: TIntegerField;
    sdsNakloDAT: TSQLTimeStampField;
    sdsNakloID_ZAK: TIntegerField;
    sdsNakloID_IZG: TIntegerField;
    sdsNakloNDS: TFMTBCDField;
    sdsNakloCOMMENT: TStringField;
    sdsNakloID_MANAGER: TIntegerField;
    sdsNakloID: TStringField;
    sdsNakloPOSTED: TSmallintField;
    sdsNakloID_SKLAD: TIntegerField;
    sdsNakloID_CURRENCY: TSmallintField;
    sdsNakloID_SKLAD_TO: TIntegerField;
    sdsNakloKURS: TFloatField;
    sdsNakloZATRATY: TFMTBCDField;
    sdsNakloPARENT_ID_NAKL: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actOkExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure cdsNakloAfterInsert(DataSet: TDataSet);
    procedure actGrid1ListShowExecute(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure cdsNakloZATRATYChange(Sender: TField);
    procedure cdsNakloBeforeScroll(DataSet: TDataSet);
    procedure dspNakloBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure cdsNakloReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsNakloNDSChange(Sender: TField);
  private
    { Private declarations }
    FiNakl : integer ;
//    FiNpp : integer;
    sCaption : string;
    FiTip : integer; //naklot.tip новых позиций
 //   FiNaklTo : integer; //Куда добавлять позиции
    FdsNaklo : TDataSource;
    FiIzg : integer;
    FiCurrency : integer;
    FiStZart : integer;
    frmDet : TfrmNaklpBuxZatratyEdit;  //Окно редактирования
    Semaphore : boolean; 
    procedure ChoiceDone;
    procedure ProcessSettings;
    procedure ShowDetail2;
    procedure NdsRecount;// пересчёт суммы затрат после изменения процента от суммы
    procedure ZatratyParentRecount;  // пересчёт суммы затрат всей  накладной
  public
    { Public declarations }
    procedure DefaultStartup;
    procedure DefaultOpen;
    procedure ShowDet (iNakl:integer;
      iTip: integer;
      dsNaklo : TDataSource);
    function GetSchet(): integer;
  end;

var
  frmNaklpbuxZatraty: TfrmNaklpbuxZatraty;

implementation

uses untEx;

{$R *.dfm}

procedure TfrmNaklpbuxZatraty.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmdEx.CloseQuery(dmdEx.cdsStatya,false);
  //Action := caFree;
end;

procedure TfrmNaklpbuxZatraty.ShowDet (iNakl:integer;
  iTip: integer; dsNaklo : TDataSource);
begin
  dmdEx.startwaiting;
  dspNaklo.DataSet:=sdsNaklo;
  qeNaklo.DefSql :=sdsNaklo.CommandText;
  qeNaklo.Prepare;
  sCaption := 'Список затрат на приходную накладную';
  FiTip := iTip; //Тип который будет привоен naklot.tip
  FiNakl := iNakl;
  FdsNaklo := dsNaklo;
  //Result := Self.ShowModal;
  dmdEx.OpenQuery(sdsConst);
  while not sdsConst.Eof do begin
    if sdsConst.FieldByName('table_field').asString = 'ID_IZG' then begin
      try
        FiIzg :=  sdsConst.FieldByName('def_value').asInteger;
      except
        AssertInternal('1EC25D5E-D0BB-49B1-89AB-3A10DD89B704');
      end;
    end;
    if sdsConst.FieldByName('table_field').asString = 'ID_CURRENCY' then begin
      try
        FiCurrency :=  sdsConst.FieldByName('def_value').asInteger;
      except
        AssertInternal('1EC25D5E-D0BB-49B1-89AB-3A10DD89B704');
      end;
    end;
    if sdsConst.FieldByName('table_field').asString = 'ID_SKLAD_TO' then begin
      try
        FiStZart :=  sdsConst.FieldByName('def_value').asInteger;
      except
        AssertInternal('323E6F1B-E1D4-4DD3-8411-3589236E817B');
      end;
    end;
    sdsConst.Next;
  end;
  dmdEx.CloseQuery(sdsConst,true);

  dmdEx.stopwaiting;
end;

procedure TfrmNaklpbuxZatraty.DefaultOpen;
begin
  dmdEx.startwaiting;
  qeNaklo.Refresh;
  dmdEx.stopwaiting;
end;

procedure TfrmNaklpbuxZatraty.DefaultStartup;
begin
  ProcessSettings;
  DefaultOpen;
end;

procedure TfrmNaklpbuxZatraty.ProcessSettings;
begin
  cdsNaklo.Params.ParamByName('id_nakl').asInteger := FiNakl;
  self.Caption := sCaption;
end;

function TfrmNaklpbuxZatraty.GetSchet(): integer;
begin
  self.Hide;
  Result := self.ShowModal;
{  if (self.ShowModal =mrOk) then begin
    Result := mrOk;
  end
  else begin
    Result := 0;
  end;   }
end;

procedure TfrmNaklpbuxZatraty.actOkExecute(Sender: TObject);
begin
  ChoiceDone;
end;

procedure TfrmNaklpbuxZatraty.ChoiceDone;
begin
  ZatratyParentRecount;
  ModalResult := mrOK;
end;

procedure TfrmNaklpbuxZatraty.actCancelExecute(Sender: TObject);
begin
  ModalResult :=mrCancel;
end;
              
procedure TfrmNaklpbuxZatraty.cdsNakloAfterInsert(DataSet: TDataSet);
var
  intGen : integer;
begin
  if FiNakl=0 then begin
    messagedlg('Не выбрана накладная',mtWarning,[mbOK],0);
    abort;
  end;
  dmdEx.StartWaiting;
  intGen := dmdEx.GetGenValue('naklo_gen');
  DataSet.FieldByName('id_nakl').AsInteger := intGen;
  DataSet.FieldByName('id').AsString := inttostr(intGen);
  DataSet.FieldByName('parent_id_nakl').AsInteger :=
    FiNakl;
  DataSet.FieldByName('id_izg').AsInteger :=
    FiIzg;
  DataSet.FieldByName('id_zak').AsInteger :=
    FdsNaklo.DataSet.FieldByName('id_zak').asInteger;
  DataSet.FieldByName('id_manager').AsInteger :=
    FdsNaklo.DataSet.FieldByName('id_manager').asInteger;
  DataSet.FieldByName('id_sklad').AsInteger :=
    FdsNaklo.DataSet.FieldByName('id_sklad').asInteger;
  DataSet.FieldByName('dat').AsDateTime :=
    FdsNaklo.DataSet.FieldByName('dat').AsDateTime;
  DataSet.FieldByName('id_currency').AsInteger := FiCurrency;
  DataSet.FieldByName('id_sklad_to').AsInteger := FiStZart;
  DataSet.FieldByName('posted').AsInteger := 0;
  DataSet.FieldByName('kurs').AsFloat := 1;
  DataSet.FieldByName('nds').AsFloat := 0;
  dmdEx.StopWaiting;
	ShowDetail2;
end;

procedure TfrmNaklpbuxZatraty.ShowDetail2;
begin
  dmdEx.startWaiting;
  if (frmDet.Visible = false) then begin
    frmDet.ShowModal;
  end;
//  RecountNakl;
  dmdEx.stopWaiting;
end;

procedure TfrmNaklpbuxZatraty.actGrid1ListShowExecute(Sender: TObject);
begin
  if (cdsNaklo.FieldByName('ID_NAKL').AsInteger = 0) then  begin
    cdsNaklo.Insert;
  end
  else begin
    if (frmDet.Visible = false) then begin
      cdsNaklo.Edit;
      ShowDetail2;
    end;
  end;
end;

procedure TfrmNaklpbuxZatraty.DBGridEh1DblClick(Sender: TObject);
begin
  actGrid1ListShow.Execute;
end;

procedure TfrmNaklpbuxZatraty.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
try
  case key of
		vk_return :begin
      actGrid1ListShow.Execute;
		end; //vk_return
    vk_f8: begin
      if (MessageDlg('Вы хотите удалить ВЕСЬ документ?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
        if (cdsNaklo.FieldByName('posted').asInteger=1) then begin
          showmessage('Нельзя удалить проведенный документ');
        end
        else begin //ok to delete
          if not (cdsNaklo.bof and cdsNaklo.eof) then begin
            cdsNaklo.Delete;
          end;
          PostAndApply(cdsNaklo);
        end; //if posted
      end;//if messagedlg
    end; //if vk_f8
    vk_insert : begin
      cdsNaklo.Append;
    end;  //case vk_insert    
  end;//case
except
  AssertInternal('5156BD0F-1CA6-435D-A6FB-95E229300329');
end;
end;

procedure TfrmNaklpbuxZatraty.FormCreate(Sender: TObject);
begin
  frmDet := TfrmNaklpBuxZatratyEdit.Create(self);
  frmDet.dsNakloEdit.DataSet := cdsNaklo;
  dmdEx.OpenQuery(dmdEx.cdsStatya);
end;

procedure TfrmNaklpbuxZatraty.cdsNakloZATRATYChange(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    NdsRecount;
    Semaphore := false;
  end
end;

procedure TfrmNaklpbuxZatraty.NdsRecount;
begin
  if cdsNaklo.State = dsBrowse then begin
    cdsNaklo.Edit;
  end;
  if not cdsNaklo.FieldByName('zatraty').IsNull then begin
    cdsNaklo.FieldByName('nds').asFloat :=
      RRoundTo(FdsNaklo.DataSet.FieldByName('nds').AsFloat *
      cdsNaklo.FieldByName('zatraty').asFloat/
      100,
      -2);
  end;
end;

procedure TfrmNaklpbuxZatraty.ZatratyParentRecount;
var
  dSum : double;
  vIsFact :variant;
begin
  dSum := 0;
  cdsNaklo.First;
  while not cdsNaklo.Eof do begin
    vIsFact:=dmdEx.cdsStatya.Lookup (
      'oid',
      cdsNaklo.FieldByName('id_sklad_to').asInteger,
  		'is_fact');
    if vIsFact=1 then begin
      dSum := dSum + cdsNaklo.FieldByName('nds').asFloat;
    end;
    cdsNaklo.Next;
  end;
  if RRoundTo(FdsNaklo.DataSet.FieldByName('nds').asFloat,-2)<>0 then begin
    dSum :=  RRoundTo(dSum*100/FdsNaklo.DataSet.FieldByName('nds').asFloat,-2);
  end;
  if rroundto(FdsNaklo.DataSet.FieldByName('zatraty').asFloat-dSum,-2)<>0 then begin
    if  FdsNaklo.DataSet.FieldByName('posted').asInteger<>1 then begin
      if  FdsNaklo.DataSet.State = dsBrowse then begin
        FdsNaklo.DataSet.Edit;
      end;
      FdsNaklo.DataSet.FieldByName('zatraty').asFloat := RRoundto(dSum,-2);
    end else begin //posted<>1
      MessageDlg ('Процент затрат не совпадает с записанным в проведённой приходной накладной. Требуется перепровести приходную накладную',mtWarning,[mbOK],0);
    end; //if posted<>1
  end;
end;

procedure TfrmNaklpbuxZatraty.cdsNakloBeforeScroll(DataSet: TDataSet);
begin
try
  ApplyOrCancel (Dataset);
except
  AssertInternal('B895DD43-ADBF-4520-A0EE-F978EA83ADAF');
end;
end;

procedure TfrmNaklpbuxZatraty.dspNakloBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
begin
  if (ukDelete=UpdateKind) and (SourceDS.name='sdsNaklo') then begin
    Applied:=false;
    sdsDelmark.ParamByName('oid').AsInteger:=
      DeltaDS.fieldByName('id_nakl').asInteger;
		dmdEx.ExecSQL(sdsDelmark);
    Applied:=true;
  end;
end;

procedure TfrmNaklpbuxZatraty.cdsNakloReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  showmessage(e.message);
end;

procedure TfrmNaklpbuxZatraty.cdsNakloNDSChange(Sender: TField);
begin
  if not Semaphore then begin
    Semaphore := true;
    cdsNaklo.FieldByName('zatraty').Clear;
    Semaphore := false;
  end
end;

end.
