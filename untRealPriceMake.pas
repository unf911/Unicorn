unit untRealPriceMake;

interface

uses
  Windows, Messages, SysUtils,
  Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables,
  ActnList, StdCtrls, Buttons,
  Grids, DBGrids,
  DBCtrls,
  untUnfDbLookupListbox,untListBoxPosit,
  math,untEx, FMTBcd, DBClient, Provider, SqlExpr,
  untRound, PropStorageEh,
  atsAssert, //AssertInternal
  untNaklo, //TfrmNaklo
  untNaklrList, // TfrmNaklrList
  //Naklr, //TfrmNaklr
  DBGridEh, ExtCtrls, Menus, Mask, UnfFilter, PropFilerEh, GridsEh
  ;

type
  TfrmRealPriceMake = class(TForm)
    ActionList1: TActionList;
    actOk: TAction;
    actCancel: TAction;
    dsPaper: TDataSource;
    dsReal: TDataSource;
    actCopy: TAction;
    actNew: TAction;
    actMove: TAction;
    dsNew: TDataSource;
    actReturn: TAction;
    actApply: TAction;
    dsNakloEdit: TDataSource;
    actTovarSelect: TAction;
    actCheckButtons: TAction;
    SQLDataSet1: TSQLDataSet;
    SQLDataSet2: TSQLDataSet;
    DataSetProvider1: TDataSetProvider;
    DataSetProvider2: TDataSetProvider;
    cdsPaper: TClientDataSet;
    cdsReal: TClientDataSet;
    cdsPaperID_POS: TIntegerField;
    cdsPaperID_TOVAR: TIntegerField;
    cdsPaperCENA: TFMTBCDField;
    cdsPaperKOLOTP: TFMTBCDField;
    cdsPaperID_NAKLD: TIntegerField;
    cdsPaperID_NAKL: TIntegerField;
    cdsPaperTOVAR: TStringField;
    cdsRealID_POS: TIntegerField;
    cdsRealID_TOVAR: TIntegerField;
    cdsRealCENA: TFMTBCDField;
    cdsRealKOLOTP: TFMTBCDField;
    cdsRealID_NAKLD: TIntegerField;
    cdsRealID_NAKL: TIntegerField;
    cdsRealTOVAR: TStringField;
    SQLDataSet3: TSQLDataSet;
    DataSetProvider3: TDataSetProvider;
    cdsNew: TClientDataSet;
    cdsNewID: TStringField;
    cdsNewDAT: TSQLTimeStampField;
    cdsNewID_IZG: TIntegerField;
    cdsNewID_ZAK: TIntegerField;
    cdsNewID_MANAGER: TIntegerField;
    cdsNewIZG: TStringField;
    cdsNewZAK: TStringField;
    cdsNewMANAGER: TStringField;
    PropStorageEh1: TPropStorageEh;
    RegPropStorageManEh1: TRegPropStorageManEh;
    cdsPaperSKIDKA: TFMTBCDField;
    cdsPaperKODCN: TSmallintField;
    cdsPaperKURS: TFloatField;
    cdsRealKURS: TFloatField;
    cdsRealSKIDKA: TFMTBCDField;
    cdsRealKODCN: TSmallintField;
    Panel1: TPanel;
    btnCopy: TBitBtn;
    DBGridEh1: TDBGridEh;
    Splitter1: TSplitter;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBGridEh2: TDBGridEh;
    Splitter2: TSplitter;
    Panel3: TPanel;
    Label3: TLabel;
    DBGridEh3: TDBGridEh;
    BitBtn1: TBitBtn;
    SQLDataSet2ID_POS: TIntegerField;
    SQLDataSet2ID_TOVAR: TIntegerField;
    SQLDataSet2CENA: TFMTBCDField;
    SQLDataSet2KOLOTP: TFMTBCDField;
    SQLDataSet2ID_NAKLD: TIntegerField;
    SQLDataSet2ID_NAKL: TIntegerField;
    SQLDataSet2SKIDKA: TFMTBCDField;
    SQLDataSet2KODCN: TSmallintField;
    SQLDataSet2KURS: TFloatField;
    SQLDataSet1ID_POS: TIntegerField;
    SQLDataSet1ID_TOVAR: TIntegerField;
    SQLDataSet1CENA: TFMTBCDField;
    SQLDataSet1KOLOTP: TFMTBCDField;
    SQLDataSet1ID_NAKLD: TIntegerField;
    SQLDataSet1ID_NAKL: TIntegerField;
    SQLDataSet1SKIDKA: TFMTBCDField;
    SQLDataSet1KODCN: TSmallintField;
    SQLDataSet1KURS: TFloatField;
    cdsNewID_NAKL: TIntegerField;
    cdsNewPOSTED: TSmallintField;
    cdsNewBLOCKED: TSmallintField;
    PopupMenu3: TPopupMenu;
    actNakloOpen: TAction;
    N1: TMenuItem;
    SdsNakloIdParent: TSQLDataSet;
    actAddNaklo: TAction;
    N2: TMenuItem;
    sdsNaklrRecount: TSQLDataSet;
    sdsNakloRecount: TSQLDataSet;
    BitBtn2: TBitBtn;
    actRefresh: TAction;
    SQLDataSet2ID: TStringField;
    cdsRealID: TStringField;
    btnCancel: TBitBtn;
    SQLDataSet2TARA: TSmallintField;
    cdsRealTARA: TSmallintField;
    SQLDataSet1TARA: TSmallintField;
    cdsPaperTARA: TSmallintField;
    CheckBox1: TCheckBox;
    PopupMenu1: TPopupMenu;
    SQLDataSet1NALOG_NDS: TFMTBCDField;
    cdsPaperNALOG_NDS: TFMTBCDField;
    actNaklrOpen: TAction;
    SQLDataSet1TIP: TSmallintField;
    cdsPaperTIP: TSmallintField;
    N3: TMenuItem;
    UnfFilter1: TUnfFilter;
    UnfFilter2: TUnfFilter;
    UnfFilter3: TUnfFilter;
    cdsNewNDS: TFMTBCDField;
    CheckBox2: TCheckBox;
    actDiffKolotp: TAction;
    procedure actOkExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actRemoveExecute(Sender: TObject);
    procedure actCopyExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ulbTovarDblClick(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
    procedure qurNewAfterInsert(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn6Click(Sender: TObject);
    procedure actNakloOpenExecute(Sender: TObject);
    procedure DBGridEh3DblClick(Sender: TObject);
    procedure actAddNakloExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure cdsPaperSKIDKAChange(Sender: TField);
    procedure cdsRealSKIDKAChange(Sender: TField);
    procedure cdsRealCENAChange(Sender: TField);
    procedure cdsPaperCENAChange(Sender: TField);
    procedure cdsRealReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsPaperReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsNewReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure actMoveExecute(Sender: TObject);
    procedure actNaklrOpenExecute(Sender: TObject);
    procedure DBGridEh3KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actDiffKolotpExecute(Sender: TObject);



  private
    { Private declarations }
    FNakl : integer;
    Offset : integer;
    Semaphore1 : boolean;
    Semaphore2 : boolean;
//    Rect2 :TRect;
    procedure CopyPricePossible(dsFrom,dsTo : TDataSet);
    procedure DiffShow(dtsOne ,dtsTwo: TDataSet;varFieldArray: variant);
    function MakeFilterDiff(dtsOne ,dtsTwo: TDataSet;varFieldArray: variant):string;

  public
    { Public declarations }
    function ShowNakl ( Nakl : integer): integer;
  end;

var
  frmRealPriceMake: TfrmRealPriceMake;

implementation

uses SkladAux //opendocument
;

{$R *.dfm}


{ TForm1 }

function TfrmRealPriceMake.ShowNakl(Nakl: integer): integer;
begin
  Semaphore1 := false;
  Semaphore2 := false;
  self.Caption := self.Caption + ': от ' +
    dsNakloEdit.DataSet.FieldByName('dat').asString + ' №' +
    dsNakloEdit.DataSet.FieldByName('id').asString + ' '+
    dsNakloEdit.DataSet.FieldByName('zak').asString + ' Сумма:'+
    Format('%6.2f', [dsNakloEdit.DataSet.FieldByName('nds').asFloat]);
  Result := 0;
  FNakl := Nakl;
  dsPaper.Dataset.Close;
  dsReal.DataSet.Close;
  dsNew.DataSet.Close;
  cdsPaper.Params.ParamByName('id_nakl').AsInteger:= FNakl;
  cdsReal.Params.ParamByName('id_nakl').AsInteger := FNakl;
  cdsNew.Params.ParamByName('id_nakl').AsInteger := FNakl;
  dsPaper.DataSet.Open;
  dsReal.Dataset.Open;
  dsNew.DataSet.Open;
{  if (self.ShowModal=mrOk) then begin
    actApply.Execute;
    Result := 1;// ok
  end
  else begin
    CancelUpdates(dsPaper.DataSet);
    CancelUpdates(dsReal.DataSet);
    CancelUpdates(dsNew.Dataset);
    Result := 0;//cancel
  end ;//OK
}
end;

procedure TfrmRealPriceMake.actOkExecute(Sender: TObject);
begin
//  self.ModalResult := mrOk;
  actApply.Execute;
  self.close;
end;

procedure TfrmRealPriceMake.actCancelExecute(Sender: TObject);
begin
  CancelUpdates(cdsPaper);
  CancelUpdates(cdsReal);
  CancelUpdates(cdsNew);
  self.close;
end;

procedure TfrmRealPriceMake.actRemoveExecute(Sender: TObject);
begin
//  qurReal.delete;
//  qurReal.pos
end;

procedure TfrmRealPriceMake.CopyPricePossible(dsFrom,dsTo : TDataSet);
var
  dKurs : Double;
  dCena : Double;
  vSkidka,vKodCN : Variant;
  iTovar : integer;
begin
try
  dsFrom.DisableControls;
  dsTo.DisableControls;
  dsFrom.First;
  while not dsFrom.eof do begin
    iTovar := dsFrom.FieldByName('id_tovar').asInteger;
    dCena := dsFrom.FieldByName('cena').asFloat;
    vSkidka := dsFrom.FieldByName('skidka').asVariant;
    vKodCN := dsFrom.FieldByName('kodcn').asVariant;
    dKurs := dsFrom.FieldByName('kurs').asFloat;
    dsFrom.Next;
    dsTo.First ;
    while not dsTo.Eof do begin
      if (dsTo.FieldByName('id_tovar').asInteger=iTovar) then begin
        if (dsTo.State = dsBrowse) then begin
          dsTo.edit;
        end;
        dsTo.FieldByName('cena').asFloat := dCena;
        dsTo.FieldByName('skidka').asVariant := vSkidka;
        dsTo.FieldByName('kodcn').asVariant := vKodCn;
        dsTo.FieldByName('kurs').asFloat := dKurs ;
      end; // if (dsTo.FieldByName('id_tovar').asInteger=iTovar)
      dsTo.Next;
    end; //while not dsTo.Eof
  end;  //while not dsFrom.eof
  dsFrom.First;
  dsTo.First;
  dsFrom.EnableControls;
  dsTo.EnableControls;
except
  AssertInternal('58C8A93A-3D5A-4C7C-AC11-9A89050E5C8D');
end;
end;

procedure TfrmRealPriceMake.actCopyExecute(Sender: TObject);
begin
  dmdex.startwaiting;
  Semaphore2 := true;
  CopyPricePossible (cdsPaper,cdsReal);
  Semaphore2 := false;
  dmdEx.stopwaiting;
//  actApply.Execute;
//  sdsNakloRecount.Params.ParamByName('id_nakl').asInteger:=
//    dsNakloEdit.DataSet.FieldBYName('id_nakl').asInteger;
//  dmdEx.ExecSQL(sdsNakloRecount);
end;


procedure TfrmRealPriceMake.FormCreate(Sender: TObject);
begin
  OffSet :=0;
  dmdEx.OpenQuery(dmdEx.cdsAllClient);
  dmdEx.OpenQuery(dmdex.cdsManager);
end;

procedure TfrmRealPriceMake.ulbTovarDblClick(Sender: TObject);
begin
  actTovarSelect.Execute;
end;

procedure TfrmRealPriceMake.actApplyExecute(Sender: TObject);
begin
  PostAndApply(dsPaper.DataSet);
  PostAndApply(dsReal.DataSet);
  sdsNakloRecount.Params.ParamByName('id_nakl').asInteger:=
    dsNakloEdit.DataSet.FieldBYName('id_nakl').asInteger;
  dmdEx.ExecSQL(sdsNakloRecount,false);
  sdsNaklrRecount.Params.ParamByName('id_nakl').asInteger:=
    dsNakloEdit.DataSet.FieldBYName('id_nakl').asInteger;
  dmdEx.ExecSQL(sdsNaklrRecount,false);
end;



procedure TfrmRealPriceMake.qurNewAfterInsert(DataSet: TDataSet);
begin
  actNew.Execute;
end;


//////////////////////////////////////////////

procedure TfrmRealPriceMake.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmRealPriceMake.BitBtn6Click(Sender: TObject);
begin
  self.Parent := TWinControl(self.owner);
end;

procedure TfrmRealPriceMake.actNakloOpenExecute(Sender: TObject);
var
//  frmNaklo : TfrmNaklo;
  iTip : integer;
begin
  if (cdsNew.Eof and cdsNew.Bof) then begin
    exit;
  end;
  iTip := dmdEx.GetOidObjects('ТИП НАКЛАДНЫХ ДЛЯ СКЛАДА',-100);
  iTip := dmdEx.GetOidObjects('Отгрузка',iTip);
  OpenDocument(
    self,
    cdsNew.FieldByName('id_nakl').asInteger,
    iTip,
    0);
end;

procedure TfrmRealPriceMake.DBGridEh3DblClick(Sender: TObject);
begin
  actNakloOpen.Execute;
end;

procedure TfrmRealPriceMake.actAddNakloExecute(Sender: TObject);
var
  frmNaklrList : TfrmNaklrList;
  intTemp :integer;
  dFrom, dTo : TDate;
begin
  frmNaklrList := TfrmNaklrList.Create(self);
  frmNaklrList.ShowNaklo;
  //менеджер только этот
  frmNaklrList.qeNaklr.SetSQL('where','id_manager='+
   dsNakloEdit.dataset.fieldbyname('id_manager').asString,
   0);
  dFrom := IncMonth(dsNakloEdit.DataSet.FieldByName('dat').AsDateTime,-6);
  dTo := IncMonth(dsNakloEdit.DataSet.FieldByName('dat').asDateTime,4);
  frmNaklrList.qeNaklr.SetSQL('where',
   'dat>='+ QuotedStr(datetostr(dFrom)),1);
  frmNaklrList.qeNaklr.SetSQL('where',
   'dat<='+ QuotedStr(datetostr(dTo))  ,2);
   //фирма только эта
  frmNaklrList.qeNaklr.SetSql('where','id_izg='+
   dsNakloEdit.dataset.fieldbyname('id_izg').asString,3);
  frmNaklrList.qeNaklr.SetSql('where','id_zak='+
   dsNakloEdit.dataset.fieldbyname('id_zak').asString,4);
  frmNaklrList.qeNaklr.Prepare; //дата 3 месяца и prepare

  frmNaklrList.actSettings.Enabled:=false;
  frmNaklrList.DefaultOpen;
  intTemp := frmNaklrList.GetSchet;
  frmNaklrList.Free;
  if intTemp <>0 then begin
    SdsNakloIdParent.Params.ParamByName('id_nakl').AsInteger :=
      intTemp;
    sdsNakloIdParent.Params.ParamByName('parent_id_nakl').asInteger :=
      dsNakloEdit.DataSet.FieldByName('id_nakl').asInteger;
    dmdex.ExecSQL(sdsNakloIdParent);
    cdsNew.Close;
    cdsNew.Open;
    cdsReal.Refresh;
  end;
end;

procedure TfrmRealPriceMake.actRefreshExecute(Sender: TObject);
begin
  actApply.Execute;
  cdsReal.Refresh;
  cdsPaper.Refresh;
  cdsNew.Refresh;
end;

procedure TfrmRealPriceMake.cdsPaperSKIDKAChange(Sender: TField);
var
  dPrice : double;
  dSkidka : double;
  id_currency : integer;
begin
  if not Semaphore1 then begin
    Semaphore1 := true;
    if GetPrice(dmdEx.cdsTemp,1,
     cdsPaper.FieldByName('id_tovar').asinteger,Now,false,
     id_currency,dPrice) then begin
      dSkidka :=  cdsPaper.FieldByName('skidka').asFloat;
      //такой товар был найден в прайсе
      cdsPaper.FieldByName('cena').AsFloat:=
        rroundto(rroundto(dPrice,-2)
           *(1-dSkidka/100),-2);
    end else begin
      cdsPaper.FieldByName('cena').AsFloat:=0;
    end;
    Semaphore1 := false;
  end;
end;

procedure TfrmRealPriceMake.cdsRealSKIDKAChange(Sender: TField);
var
  id_currency : integer;
  dSkidka : double;
  dPrice : double;
begin
  if not Semaphore2 then begin
    Semaphore2 := true;
    if GetPrice(dmdEx.cdsTemp,1,
     cdsReal.FieldByName('id_tovar').asinteger,Now,false,
     id_currency,dPrice) then begin
      dSkidka :=  cdsReal.FieldByName('skidka').asFloat;
      //такой товар был найден в прайсе
      cdsReal.FieldByName('cena').AsFloat:=
        rroundto(rroundto(dPrice,-2)
           *(1-dSkidka/100),-2);
    end else begin
      cdsReal.FieldByName('cena').AsFloat:=0;
    end;
    Semaphore2 := false;
  end;
end;

procedure TfrmRealPriceMake.cdsRealCENAChange(Sender: TField);
begin
  if not semaphore2 then begin
    semaphore2 := true;
      cdsReal.FieldByName('skidka').Clear;
    semaphore2 := false;
  end;
end;

procedure TfrmRealPriceMake.cdsPaperCENAChange(Sender: TField);
begin
  if not semaphore1 then begin
    semaphore1 := true;
      cdsPaper.FieldByName('skidka').Clear;
    semaphore1 := false;
  end;
end;

procedure TfrmRealPriceMake.cdsRealReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  showmessage(e.message);
  Action := raAbort;
end;

procedure TfrmRealPriceMake.cdsPaperReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  showmessage(e.message);
  Action := raAbort;
end;

procedure TfrmRealPriceMake.cdsNewReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  showmessage(e.message);
  Action := raAbort;
end;

procedure TfrmRealPriceMake.actMoveExecute(Sender: TObject);
begin
  actMove.Checked := not actMove.Checked;
  if actMove.Checked then begin
    DiffShow (cdsPaper,cdsReal,VarArrayOf(['id_tovar','kolotp','cena']));
  end else begin
    cdsPaper.Filtered := false;
    cdsReal.Filtered := false;
  end;
end;

procedure TfrmRealPriceMake.DiffShow(dtsOne ,dtsTwo: TDataSet;varFieldArray: variant);
var
  sFilterOne : string;
  sFilterTwo : string;
begin
  sFilterTwo :=MakeFilterDiff(dtsOne,dtsTwo,varFieldArray);
  sFilterOne :=MakeFilterDiff(dtsTwo,dtsOne,varFieldArray);
  dtsTwo.Filter:= sFilterTwo;
  dtsTwo.Filtered := true;
  dtsOne.Filter:= sFilterOne;
  dtsOne.Filtered := true;
end;


function TfrmRealPriceMake.MakeFilterDiff(dtsOne ,dtsTwo: TDataSet;varFieldArray: variant):string;
var
  i : integer;
  strTemp, strTemp3,strTemp4 : string;
  KeyList : string;
  KeyFields : string;
  ResultLookup,ValuesToFind,KeyListVariant : variant;
begin
  dtsOne.First;
  dtsTwo.First;
{  strTemp2 :='';}
  {Найти название ключевого поля}
  KeyListVariant := VarArrayCreate([0,0], varVariant);

  for i:=0 to dtsTwo.FieldCount-1 do begin
    if pfInKey in dtsTwo.Fields[i].ProviderFlags then begin
      KeyList := KeyList+';'+dtsTwo.Fields[i].FieldName;
      VarArrayRedim( KeyListVariant,VarArrayHighBound(KeyListVariant,1)+1);
      KeyListVariant[VarArrayHighBound(KeyListVariant,1)-1]:=
        dtsTwo.Fields[i].FieldName;
    end;
  end;
  VarArrayRedim( KeyListVariant,VarArrayHighBound(KeyListVariant,1)-1);
  if KeyList ='' then begin
    exception.Create ('процедура TfrmRealPriceMake.MakeFilterDiff не нашла ключевых полей');
  end else begin
    KeyList:=copy(keylist,2,length(keylist)-1);
  end;
  {Поля в которых будем искать}
  for i:= VarArrayLowBound(varFieldArray,1) to
     VarArrayHighBound(varFieldArray,1) do begin
    KeyFields := KeyFields+varFieldArray[i]+';';
  end;
  KeyFields:=copy(KeyFields,1,length(KeyFields)-1);

  while not dtsOne.Eof do begin
    strTemp :='';
    ValuesToFind := VarArrayCreate([VarArrayLowBound(varFieldArray,1),
     VarArrayHighBound(varFieldArray,1)], varVariant);
    for i:= VarArrayLowBound(varFieldArray,1) to
     VarArrayHighBound(varFieldArray,1) do begin
      {Значения которые будем искать}
      ValuesToFind[i]:= dtsOne.FieldByName(varFieldArray[i]).asVariant;
    end;
    ResultLookup := dtsTwo.Lookup(KeyFields,ValuesToFind,KeyList);
    if ResultLookup<>Null then begin
      strTemp3 := '';
      if VarArrayDimCount(ResultLookup)>0 then begin
        {Если ключевых полей было несколько}
        for i:=VarArrayLowBound(ResultLookup,1) to
          VarArrayHighBound(ResultLookup,1) do begin
          strTemp3 :=strTemp3+KeyListVariant[i]+'='+ResultLookup[i] +' and';
        end;
      end else begin
        {Только одно ключевое поле}
        strTemp3 :=strTemp3+
          VarAsType(KeyListVariant[0],varString)+'='+
          VarAsType(ResultLookup,varString) +' and';
      end;
      strTemp3:=Copy(strTemp3,1,Length(strTemp3)-4);
      if strTemp3<>'' then begin
        strTemp4 := strTemp4 + '(' +strTemp3+') or ';
      end;
    end;
    dtsOne.Next;
  end;
  if strTemp4 <>'' then begin
    strTemp4 := Copy(strTemp4,1,Length(strTemp4)-3);
    strTemp4 :='not ( '+strTemp4+' ) ';
  end;
  Result := strTemp4;
end;

procedure TfrmRealPriceMake.actNaklrOpenExecute(Sender: TObject);
//var
  //iTip : integer;
  //frmNaklr : TfrmNaklr;
  //iTipNaklr : integer;
begin
  if dsPaper.DataSet.Eof and dsPaper.DataSet.Bof then begin
     exit;
  end;
  OpenDocument(self,
    dspaper.DataSet.FieldByName('id_nakl').asInteger,
    dmdEx.GetOidObjects('РАСХОДНЫЕ НАКЛАДНЫЕ',-100),
    0);
end;

procedure TfrmRealPriceMake.DBGridEh3KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return : begin
      actNakloOpen.Execute;
    end;
  end;
end;

procedure TfrmRealPriceMake.actDiffKolotpExecute(Sender: TObject);
begin
  actDiffKolotp.Checked := not actDiffKolotp.Checked;
  if actDiffKolotp.Checked then begin
    DiffShow (cdsPaper,cdsReal,VarArrayOf(['id_tovar','kolotp']));
  end else begin
    cdsPaper.Filtered := false;
    cdsReal.Filtered := false;
  end;
end;

end.
