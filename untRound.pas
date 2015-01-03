unit untRound;

interface

uses math,DBTables,QueryExtender,DBClient, ATSAssert,
  Windows,
  Controls ,//TDate
  DB,  //dataset
  Variants,
  dbgrideh, //ColumnByName uses module
  StdCtrls, //FillFieldNamesForFiltering, FilterChanged
           //uses TComboBox, TCheckBox
  Classes,  //TstringList
  Forms, //TForm
  MemTableEh

  ;

type
  TRoundToRange = -37..37;
  TFunctionDefaultOpen = function:boolean of object;
function  GetSkidkaPrice(qurTovar:TDataSet; qurNaklrt : TDataSet) : currency;
function SUMA2GRN (qurNaklr,qurNaklrt : TDataSet;iMode:integer=0) : currency;
//упорядочивание позиций. тара в конце
procedure Order2 (qeNaklrt : TQueryExtender);
// пересчёт суммы с ндс и без ндс
procedure CalculateSum(qurNaklr,qurNaklrt : TDataSet);
// переименование месяцев с учётом падежа
procedure MonthToStrInit;
// переименование месяцев на украинском языке с учётом падежа
procedure MonthToStrInitUa;
// применение изменений к нижней таблице
procedure qurNaklrtCommit2(dstNaklrt : TDataset);
//применение измененией к верхней таблице
procedure qurNaklrCommit2(qurNaklr, qurNaklrt : TDataSet);
//пересчёт строки с товаром после изменения цены, либо количества
//procedure AutoRecalc2(qurNaklr : TDataset; qurNaklrt : TDataSet; Price : currency );
procedure AutoRecalc3(qurNaklr : TDataSet; qurNaklrt : TDataset; Price : currency );
//округление банковское
function RoundUp(X: Extended;const ADigit: TRoundToRange): Extended;
//округление русское , математическое
function RRoundTo(const AValue: Double;
  const ADigit: TRoundToRange): Double;
//пометка на удаление текущей записи из склада
function DelmarkRecord (cdsFrom : TClientDataSet):integer;
//применить все изменения в clientdataset и откат при ошибках
function PostAndApplyOrCancel(cdsFrom : TDataSet):integer;
//post и применить все изменения в clientdataset
function PostAndApply (dtsFrom : TDataSet):integer;
//применить все изменения в dataset
function ApplyOrCancel(dtsFrom : TDataSet):boolean;

//Установка атрибута объекта
function SetObjAttr(dtsFrom : TDataSet;
	attribute_id: integer;
	value : variant):boolean;
//отмена редактирования и откат изменений
procedure CancelUpdates (dtsFrom : TDataSet);
//variant преобразовать в строку, если невозможно возвр пустая строка
function VarToStr(const vIn: variant;required:boolean=true): variant;
//variant преобразовать в целое, если невозможно возвр null или 0
function VarToInt(const vIn: variant;Required:boolean=false): variant;
////variant преобразовать в вещественное, если невозможно возвр null или 0
function VarToDbl(const vIn: variant;Required:boolean=true): variant;
//Пересчёт цен если цена с ндс является полем internalcalc
procedure FromCenaRecount (Source : integer;MDataSet,DDataSet : TDataSet;mode: integer=0;
  id_price: integer=1; id_currency:integer=0);
function GetPrice(cdsTemp:TClientDataSet; id_price: variant;id_tovar: integer;
  dat: TDate; WithNds: boolean;
  id_currency: integer; var price: double):boolean;
//Пересчёт суммы накладной
function SumRecount(MDataSet2,
  DDataSet2: TDataSet;iMode:integer=0):currency;
//По заданному имени поля среди всех колонок решётки ищет колонку с таким именем
function ColumnByName(Columns :TDBGridColumnsEh; ColumnName: string):TColumnEh;

//Группа процедур отвечающая за фильтр вверху справочника
//изначально использовалось в справочнике клиентов
//заполение списка полей из таблицы для фильтра вверху
procedure FillFieldNamesForFiltering(cbxFields :TComboBox;
  dbgClient:TDbGridEh);
//изменяет фильтр наложенный на таблицу при любом вводе пользователя
procedure FilterChanged(cbxFields: TComboBox;
  cbxContains: TCheckBox; edtFilter: TEdit; dbgClient: TDbGridEh);


function DelphiLoaded : boolean;
function InIDE: Boolean;

function FilterListCreate(dtsOne : TDataSet;sField: string):string;
//проверяет открыт ли набор данных и не пуст ли он, если запись есть - то
//результат true, иначе false
function CheckExistenceOfSelectedRecord(DataSet:TDataSet):boolean;
//сливает результаты отчёта и другого набора данных
procedure MergeStrings(dtsFrom,dtsTo:Tdataset;
  KeyFieldFrom,KeyFieldTo,FromField,ToField: string;OuterJoin:boolean=true);
  //Копирует указанные поля из полей источников в поля назначения
procedure CopyFieldValues(dtsFrom,dtsTo:Tdataset;
  FromField,ToField: string);
//выбирает первое до разделителя значение из строки. Например
//из 2;3;4 вернёт List=3;4.  Item=2.
function ItemFromList(var List, Item:string;Delimiter:string):boolean;
//mode=0 - обновить существующие записи
//mode=1 - добавить новые записи
//mode=2 - удалить/добавить записи
procedure CopyDatasetFields(dtsFrom,dtsTo:Tdataset;
 KeyFieldFrom,KeyFieldTo,FromField,ToField: string;Mode : integer=1);
//удалить строку из набора данных если все перечисленные поля =0 либо пусты
function DeleteRowIfEmpty(dtsFrom: TDataSet;FieldsToCheck:string):boolean;
procedure SetFilter(DataSet:TDataSet;sFilter:string);
function GetFilter(DataSet:TDataSet): string;
procedure CopyDatasetFieldsTo(dtsFrom,dtsTo:Tdataset;
  KeyFieldFrom,KeyFieldTo,FromField,ToField: string;Mode : integer=1);
procedure SetFieldValue(SelectedField: TField; dValue: Variant);
procedure ShowCopyForRoleOrUser(DBGridEh1:TDBGridEh;RolesList:string;userList:string);
procedure GetStringListFromSqlRecord(sSql:string;cdsTemp:TClientDataSet;var StringList:TStringList);
procedure CloseEditForm(Form:TForm;DataSet:TDataSet; var semaphore:boolean);
function DefaultOpenInputForm(qeNaklo:TQueryExtender):boolean;
procedure ShowCheckboxForColumn(Column: TColumnEh);


implementation

uses SysUtils,Dialogs,
  untEx, //dmdEx.cdsTemp
  DataDriverEh //TDataDriverEh
  ;

procedure qurNaklrCommit2(qurNaklr, qurNaklrt : TDataSet);
begin
  if (ApplyOrCancel(qurNaklr)) then begin
    ApplyOrCancel(qurNaklrt);
  end;
end;

procedure Order2 (qeNaklrt : TQueryExtender);
var
  intNpp : integer;
  qurNaklrt : TDataSet;
begin
  intNpp := 1;
  qeNaklrt.SetSQL('order by','tara desc,npp',0);
  qeNaklrt.Refresh;
  qurNaklrt := qeNaklrt.Query;
  qurNaklrt.First;
  while (not qurNaklrt.Eof) do begin
    qurNaklrt.Edit;
    qurNaklrt.FieldByName('npp').AsInteger := intNpp;
    qurNaklrt.Post;
    qurNaklrt.Next;
    inc (intNpp);
	end;//while
  qeNaklrt.SetSQL('order by','npp',0);
  qeNaklrt.Refresh;
end;

procedure CalculateSum(qurNaklr,qurNaklrt : TDataSet);
var
  curSum : double;
  curPos : double;
begin
  curSum := 0;
  qurNaklrt.First;
  while (not qurNaklrt.Eof) do begin
    if  (qurNaklrt.FieldByName('tovar').AsString = '') then begin
      showmessage('Выберите товар');
      Abort;
    end;
		if qurNaklrt.FieldByName('tara').asinteger = 2 then begin
        if  (qurNaklrt.fieldbyname('kolotp').asfloat=0) then begin
          curPos:= rroundto(
            rroundto(
            qurNaklrt.fieldbyname('suma2').asfloat,-2
            )*qurNaklr.fieldbyname('kurs').asfloat,-2);
        end
        else begin //if kolotp
          //actAutoRecalc.Execute;
          AutoRecalc3 (qurNaklr,qurNaklrt,
            qurNaklrt.fieldByName('cena').asfloat
          );
          curPos := rroundto(
            rroundto(qurNaklrt.fieldbyname('cena').asfloat,-2)*
            qurNaklr.fieldbyname('kurs').asfloat,-2);
          curPos:=rroundto(
          curPos*
					qurNaklrt.fieldbyname('kolotp').asfloat ,-2);
        end;

    end
    else begin
        if  (qurNaklrt.fieldbyname('kolotp').asfloat=0) then begin
          curPos:= rroundto(
            qurNaklrt.fieldbyname('suma2').asfloat,-2
          );
        end //if  kolotp
        else begin
          //actAutoRecalc.Execute;
          AutoRecalc3 (qurnaklr,qurNaklrt,qurNaklrt.fieldByName('cena').asfloat);
          curPos:= rroundto (
            rroundto(qurNaklrt.fieldbyname('cena').asfloat,-2)*
            qurNaklrt.fieldbyname('kolotp').asfloat ,-2);
        end;
		end;
    curSum:=curSum+curPos;
    qurNaklrt.Next;
  end; //while
  curSum :=  rroundto (  curSum    ,-2);
  curPos := rroundto(curSum*
      (1+qurNaklr.FieldByName('nalog_nds').AsFloat),-2); //nds temp

  if (
    (rRoundto(qurNaklr.FieldByName('vsego').AsFloat-curSum,-2)<>0) or
    (rRoundto(qurNaklr.FieldByName('nds').AsFloat-curPos,-2)<>0)
    )
    then begin
    qurNaklr.Edit;
    qurNaklr.FieldByName('vsego').AsFloat := curSum;
    qurNaklr.FieldByName('nds').AsFloat := curPos;
    qurNaklr.Post;
	end;//vsego
  qurNaklrCommit2 (qurNaklr,qurNaklrt);
end;

{
procedure AutoRecalc2(qurNaklr : TDataSet; qurNaklrt : TDataset; Price : currency );
var
  curNds : currency;
  curSum : currency;
begin
  if qurNaklrt.state in [dsBrowse] then begin
    qurNaklrt.Edit;
  end;
  curSum  := //rroundto (
    Price*
    qurNaklrt.FieldByName('kolotp').AsFloat ; //по просьбе Тани
    //,-2);
	if (rroundto(qurNaklrt.FieldByName('suma2').AsFloat-curSum,-2)<>0) then begin
    qurNaklrt.FieldByName('suma2').AsFloat := curSum;
    curNds := rroundto(
      Price * (1+qurNaklr.FieldByName('nalog_nds').AsFloat),-2);
    qurNaklrt.FieldByName('nds').AsFloat := curNds;
    qurNaklrt.FieldByName('vsego').AsFloat := rroundto (
      curSum*(1+qurNaklr.FieldByName('nalog_nds').AsFloat),
      -2);
  end;
  if qurNaklr.State in [dsEdit] then begin
    qurNaklrt.Post;
  end;
  qurNaklrtCommit2(qurNaklrt);
end;
}

procedure AutoRecalc3(qurNaklr : TDataSet; qurNaklrt : TDataset; Price : currency );
var
	curNds : double;
  curSum : double;
begin
try
  if qurNaklrt.state in [dsBrowse] then begin
    qurNaklrt.Edit;
  end;
  curSum  := rroundto (
    Price*
    qurNaklrt.FieldByName('kolotp').AsFloat 
    ,-2);
  if (rroundto(qurNaklrt.FieldByName('suma2').AsFloat-curSum,-2)<>0) then begin
    qurNaklrt.FieldByName('suma2').AsFloat := curSum;
  end;
  curNds := rroundto(
    Price * (1+qurNaklr.FieldByName('nalog_nds').AsFloat),-2);
  if  rroundto(qurNaklrt.FieldByName('nds').AsFloat- curNds,-2)<>0 then begin
		qurNaklrt.FieldByName('nds').AsFloat := curNds;
  end;
  curSum := rroundto (
    curSum*(1+qurNaklr.FieldByName('nalog_nds').AsFloat),
    -2);
  if rroundto(qurNaklrt.FieldByName('vsego').AsFloat-curSum,-2)<>0 then begin
    qurNaklrt.FieldByName('vsego').AsFloat:=curSum;
  end;
//  qurNaklrt.CheckBrowseMode;
except
  AssertInternal('75E9D411-A757-4641-A8CD-FC5C8D3F61A7');
end;
end;


procedure MonthToStrInit;
begin
	LongMonthNames[1] := 'января';
  LongMonthNames[2] := 'февраля';
  LongMonthNames[3] := 'марта';
  LongMonthNames[4] := 'апреля';
  LongMonthNames[5] := 'мая';
  LongMonthNames[6] := 'июня';
  LongMonthNames[7] := 'июля';
  LongMonthNames[8] := 'августа';
  LongMonthNames[9] := 'сентября';
  LongMonthNames[10] := 'октября';
  LongMonthNames[11] := 'ноября';
  LongMonthNames[12] := 'декабря';

end;

procedure MonthToStrInitUa;
begin
	LongMonthNames[1] := 'січня';
  LongMonthNames[2] := 'лютого';
  LongMonthNames[3] := 'березня';
  LongMonthNames[4] := 'квітня';
  LongMonthNames[5] := 'травня';
  LongMonthNames[6] := 'червня';
  LongMonthNames[7] := 'липня';
  LongMonthNames[8] := 'серпня';
  LongMonthNames[9] := 'вересня';
  LongMonthNames[10] := 'жовтня';
  LongMonthNames[11] := 'листопада';
  LongMonthNames[12] := 'грудня';
end;

procedure qurNaklrtCommit2(dstNaklrt : TDataSet);
begin
	PostAndApplyOrCancel(dstNaklrt);
end;

function RRoundTo(const AValue: Double;
  const ADigit: TRoundToRange): Double;
var
  LFactor: Double;
  dblBig : Double;
  dblFrac : Double;
begin
   LFactor := IntPower(10, ADigit);
   dblBig :=AValue / LFactor;
   dblFrac := frac(dblBig);
   //num:=num*100;
   //buf := frac(num);
   if  (dblFrac >= 0.4999999) then begin
     dblBig:=dblBig+0.1;
	 end;
   dblBig:=round(dblBig);
   //num:=num/100;
   //rround:=num;
   result := dblBig * LFactor;
end;

function RoundUp(X: Extended;const ADigit: TRoundToRange): Extended;
var
  LFactor: Extended;
  extNum : Extended;
begin
  LFactor := IntPower(10, ADigit);
  extNum := X/ LFactor;
  extNum := Trunc(extNum) + Trunc (Frac(extNum) * 2);
  Result := extNum * LFactor;
end;

function SUMA2GRN (qurNaklr,qurNaklrt : TDataSet;iMode:integer=0 ) : currency;
var
  curKurs : currency;
begin
Result :=0;
try
    if (qurNaklrt.fieldByName('TARA').AsInteger=2) then begin
      curKurs := qurNaklr.fieldByName('KURS').asFloat;
    end else begin
      curKurs := 1;
    end;
    If (qurNaklrt.FieldByName('CENA').AsFloat>0) then begin
      if (iMode=0) then begin
      Result :=
        RRoundTo(
          RRoundTo(
            qurNaklrt.fieldByName('CENA').AsFloat*curKurs,-2
          ) * qurNaklrt.fieldbyname('KOLOTP').asfloat,
          -2
				);
      end;
      if (iMode=1) then begin
      Result :=
        RRoundTo(
          qurNaklrt.fieldByName('CENA').AsFloat*
          curKurs *
          qurNaklrt.fieldbyname('KOLOTP').asfloat,
          -2
				);
      end;
    end else begin //if
      if qurNaklrt.FindField('SUMA2')<>nil then begin
        Result :=RRoundTo(
          qurNaklrt.fieldbyname('SUMA2').asfloat*curKurs,
          -2
        );
      end else begin
        //нет такого поля в счетах
        Result :=0;
      end;//if <>nil
    end; //if
except
  AssertInternal('83A2A5DD-7865-41CA-99B3-598B640D5CD2');
end;
end; // suma2grn

//Прайс по умолчанию. Прайс Укк = 1. Используется в 99% использования прайсов
//Прайс = 0  - нет прайса
function GetPrice(cdsTemp:TClientDataSet; id_price: variant;id_tovar: integer;
  dat: TDate; WithNds: boolean;
  id_currency: integer; var price: double):boolean;
var
  id_price_str, id_currency_str : string;
begin
Result := false;
try
  //Поддержка даты прайса пока не реализована, и вне зависимости
  //от значения withnds прайс ПОКА будет возвращаться без НДС
  cdsTemp.Close;
  if id_price <> 0 then begin
    id_price_str := inttostr(id_price);
  end else begin
    id_price_str := 'null';
  end;
  if id_currency <> 0 then begin
    id_currency_str := inttostr(id_currency);
  end else begin
    id_currency_str := 'null';
  end;

  cdsTemp.CommandText :=
    'select round(cena,2) as cena from get_price_default_pc('
    + id_price_str + ','
    + inttostr(id_tovar)
    + ',' + id_currency_str + ','
    + quotedstr(datetostr(dat))
    +',0)';
  cdsTemp.Open;
  if (cdsTemp.bof and cdsTemp.eof) then begin
    //такого товара в прайсе не нашли
    cdsTemp.Close;
    Result := false;
    Exit;
  end;
    if cdsTemp.FieldByName('cena').isNull then begin
      Result := false;
    end else begin
      price := cdsTemp.FieldByName('cena').AsFloat;
      Result := true;
    end;
  cdsTemp.Close;
except
  AssertInternal('1EBC03D8-75AC-49CB-9FD1-8977E0E1B36C');
end;
end;

function  GetSkidkaPrice(qurTovar:TDataSet; qurNaklrt : TDataSet) : currency;
var
  curPrice : currency;
begin
  qurTovar.Close;
  if (qurTovar is TQuery) then begin
      TQuery(qurTovar).SQL.Text := 'select tovar,name,ediz,cena,cenavx,'+
					' kod1,kod2,kod3 ' +
          'from tovar t where t.name='+
        quotedstr(qurNaklrt.FIeldbyname('tovar').asString);
  end else begin //TQuery
    if (qurTovar is TClientDataSet) then begin
      TClientDataSet(qurTovar).CommandText :=
         'select cena,cenavx,'+
         ' kod1,kod2,kod3 ' +
         'from tovar t where t.tovar='+
         quotedstr(qurNaklrt.FIeldbyname('id_tovar').asString);
    end else begin //TClientDataSet
      AssertInternal ('{32294517-0703-4403-93EE-517573004B5D}');
    end; //TClientDataSet
  end;//TQuery
  qurTovar.Open;
  curPrice := 0;
        if (qurNaklrt.FieldByName('kodcn').asinteger=1) then begin
					curPrice:= qurTovar.Fieldbyname('cena').AsFloat;
        end;
        if (qurNaklrt.FieldByName('kodcn').asinteger=2) then begin
          curPrice:= qurTovar.Fieldbyname('kod1').AsFloat;
        end;
        if (qurNaklrt.FieldByName('kodcn').asinteger=3) then begin
          curPrice:= qurTovar.Fieldbyname('kod2').AsFloat;
        end;
        if (qurNaklrt.FieldByName('kodcn').asinteger=4) then begin
          curPrice:= qurTovar.Fieldbyname('kod3').AsFloat;
        end;
        if (qurNaklrt.FieldByName('kodcn').asinteger=5) then begin
          curPrice:= qurTovar.Fieldbyname('cenavx').AsFloat;
        end;
        curPrice := rroundto(rroundto(curPrice,-2)
          *(1-qurNaklrt.fieldbyname('skidka').asfloat/100),-2);
  qurTovar.Close;
				Result := curPrice;
end;

function DelmarkRecord (cdsFrom : TClientDataSet):integer;
begin
  Result :=0;
  try
    if cdsFrom.bof and cdsFrom.eof then begin
      showmessage('Запись не указана');
      exit;
    end;
    cdsFrom.Edit;
    cdsFrom.FieldByName('delmarked').asInteger := 1;
    cdsFrom.Post;
    cdsFrom.ApplyUpdates(0);
    cdsFrom.Refresh;
  except
    AssertInternal('A7F27523-9E63-4F3A-A303-52188EAC6809');
  end;
end;

{применить изменения и если были ошибки то откатить}
function ApplyOrCancel(dtsFrom : TDataSet):boolean;
var
  iErrors : integer;
  cdsFrom : TClientDataSet;
  qurFrom : TQuery;
begin
 Result := false;
 if dtsFrom.Active then begin

  Result := true;
  if (dtsFrom is TClientDataSet) then begin
    cdsFrom := TClientDataSet(dtsFrom);
    if (cdsFrom.ChangeCount>0) then begin
      try
        iErrors:=cdsFrom.ApplyUpdates(0);
        if iErrors<>0 then begin
					Result := false;
          //cdsFrom.Cancel;
          cdsFrom.CancelUpdates;
          Exit;
        end;
      except
        on E: exception do begin
          showmessage(e.Message+'_');
          //cdsFrom.Cancel;
          cdsFrom.CancelUpdates;
          Result := false;//can't apply
          exit;
        end;//on
      end;//try
    end;//>0
  end; //cds

	if (dtsFrom is TQuery) then begin
    qurFrom := TQuery(dtsFrom);
    if qurFrom.UpdatesPending then begin
			try
				qurFrom.ApplyUpdates;
				qurFrom.CommitUpdates;
				Result := true;
			except
				on e:exception do begin
					//showmessage (e.Message);
					qurFrom.CancelUpdates;
          Result := false;//can't apply
        end;  //on
      end; //try
    end; //updatespending
  end; //tquery

 end;  //active
end; //proc

{применить изменения и если были ошибки то откатить}
function PostAndApplyOrCancel(cdsFrom : TDataSet):integer;
var
  iRes : integer;
begin
 iRes:=0;
 try
   iRes := PostAndApply(TClientDataset(cdsFrom));
 except
//  if (iRes<>0) then begin
    if (cdsFrom is  TClientDataset) then begin
      TClientDataset(cdsFrom).Cancel;
      TClientDataset(cdsFrom).CancelUpdates;
    end;  //cds
    if (cdsFrom is TQuery) then begin
      TQuery(cdsFrom).Cancel;
			TQuery(cdsFrom).CancelUpdates;
    end;
  end;//error on apply
  Result:=iRes;
//except
//  AssertInternal('{FB5A4B37-3FB9-4AD9-9D44-3221F8D73ED0}');
//end;
end;

{применить изменения}
function PostAndApply (dtsFrom : TDataSet):integer;
var
	qurFrom : TQuery;
	cdsFrom : TClientDataSet;
  mtFrom : TMemTableEh;
	iErrors : integer;
begin
	Result :=0;
	if dtsFrom.Active then begin
    try
		  dtsFrom.CheckBrowseMode;
    except
      Result := 1;//can't post
      exit;
    end;
		Result:=0; //without error - ok
		if (dtsFrom is TClientDataSet) then begin
			cdsFrom := TClientDataSet(dtsFrom);
			if (cdsFrom.ChangeCount>0) then begin
				try
					Result := 2;
					iErrors:=cdsFrom.ApplyUpdates(0);
					if iErrors<>0 then begin
//						abort;
						Exit;
					end;
					Result := 0;
				except
				 on E: exception do begin
						showmessage('!!!не желательно: '+e.Message);
						Result := 2;//can't apply
						exit;
				 end;//on
				end;//try
			end;//>0
		end; //cds
		if (dtsFrom is TQuery) then begin
			qurFrom := TQuery(dtsFrom);
			if qurFrom.UpdatesPending then begin
				try
					qurFrom.ApplyUpdates;
					qurFrom.CommitUpdates;
				except
					on e:exception do begin
//						showmessage (e.Message);
						Result := 2;//can't apply
					end;  //on
				end; //try
			end; //updatespending
		end; //tquery
		if (dtsFrom is TMemTableEh) then begin
      mtFrom := TMemTableEh(dtsFrom);
      mtFrom.ApplyUpdates(-1);
      PostAndApply(TDatasetDriverEh(mtFrom.DataDriver).ProviderDataSet);
		end; //if (dtsFrom is TMemTableEh)
	end;  //active
end;

///////////////////////////////////////////////////////////////
//преобразование variant в integer хранящийся в variant
//возвращает integer, если значение не может быть пустым,
//  то возващается
// нуль, если допустимое пустое значение, то возв null
///////////////////////////////////////////////////////////////
function VarToInt(const vIn: variant;Required:boolean=false): variant;
begin
try
  if VarIsNull(vIn) then begin
    if Required then begin
      Result := 0;
      exit;
    end else begin
      Result := Null;
      exit;
    end;
  end;

  try
    if VarIsNumeric (vIn) then begin
      Result := varasType(vIn,varInteger);
      exit;
    end;
    if VarIsStr(vIn) then begin
      Result := strtoint(VarToStr(vIn));
      exit;
    end;
  except
    on Exception do begin
    end;
  end;

  if Required then begin
    Result := 0;
  end else begin
    Result := Null;
  end;
except
	AssertInternal('14CF4D34-8462-4578-AA3D-A67F957B8C80');
end;
end;

function VarToDbl(const vIn: variant;Required:boolean=true): variant;
begin
try
  if VarIsFloat(vIn) then begin
		Result := varasType(vIn,varDouble);
    //esult :=vIn;
	end else begin
		if Required then begin
			Result := 0;
		end
		else begin
			Result := Null;
		end;
	end;
except
	AssertInternal('102631D4-95BF-4716-A39D-6E0358EA8465');
end;
end;

function VarToStr(const vIn: variant;required:boolean=true): variant;
begin
try
  if VarIsStr(vIn) then begin
//	if ((vartype(vIn) and varTypeMask and varString)<>0) then begin
//		Result:=vIn;
    Result := varasType(vIn,varString);
	end else begin
		if Required then begin
			Result:='';
		end else begin
			Result:=Null;
		end;
	end;
except
	AssertInternal('8FC419C5-E1AA-495A-AC43-1240C9B21720');
end;
end;

procedure CancelUpdates (dtsFrom : TDataSet);
var
	cdsFrom : TClientDataSet;
begin
	if dtsFrom.Active then begin
		if dtsFrom.State in [dsInsert,dsEdit] then begin
			dtsFrom.Cancel;
		end; //edit
		if dtsFrom is TClientDataSet then begin
			cdsFrom := TClientDataSet(dtsFrom);
			if cdsFrom.ChangeCount>0 then begin
				cdsFrom.CancelUpdates;
			end;
			Exit;
		end; //cds
		if dtsFrom is TQuery then begin
			showmessage ('function CancelUpdates не поддерживает TQuery');
			Exit;
		end; //tquery
		showmessage ('function CancelUpdates не поддерживает этот тип Dataset');
	end; //active
end;

function SetObjAttr(dtsFrom : TDataSet;
	attribute_id: integer;
	value : variant):boolean;
begin
	Result := false;
	if (value<>null) then begin
		if not dtsFrom.locate(
			'attribute_id',
			attribute_id,
			[]
			) then
		begin
			dtsFrom.Insert;
			dtsFrom.FieldByName('attribute_id').asInteger := attribute_id;
			dtsFrom.FieldByName('value1').asString := value;
			dtsFrom.Post;
			Result := true;
		end else begin //if
			if not dtsFrom.locate(
				'attribute_id;value1',
				vararrayof([attribute_id,value]),
				[loCaseInsensitive]
				) then
			begin
				dtsFrom.Edit;
				dtsFrom.FieldByName('value1').asString := value;
				dtsFrom.post;
				Result := true;
			END;
		end; //ATTR exitst
	end else begin //if null
		if dtsFrom.locate('attribute_id',attribute_id,[loCaseInsensitive]) then begin
			dtsFrom.Delete;
			Result := true;
		end else begin
			//хотели удалить то, чего не было
			Result := true;
		end; //if exists
	end; //if null
end;

procedure SelfRecount (Source : integer;MDataSet,DDataSet : TDataSet;mode: integer=0);
begin
  //Пересчёт себя под воздействием изменений
  if Source=6 then begin
    DDataSet.FieldByName('skidka').Clear;
  end;
  if Source=2  then begin
    if Assigned(DDataSet.FindField('cenands')) then begin
      case mode of
        0: DDataSet.FieldByName('cenands').asFloat :=
          RRoundTo((
            DDataSet.FieldByName('cena').asFloat*
            (MDataSet.FieldByName('nalog_nds').asFloat+1)),-2);
        1: DDataSet.FieldByName('cenands').asFloat :=
          DDataSet.FieldByName('cena').asFloat*
          (MDataSet.FieldByName('nalog_nds').asFloat+1);
      end;//case mode
    end;
    DDataSet.FieldByName('skidka').Clear;
  end;
  if Source=3 then begin
    if Assigned(DDataSet.FindField('suma')) then begin
      DDataSet.FieldByName('suma').asFloat :=
        RRoundto(
          DDataSet.FieldByName('cena').asFloat*
          DDataSet.FieldByName('kolotp').asFloat,-2);
    end;
    DDataSet.FieldByName('skidka').Clear;
  end;
  if Source=4 then begin
    if Assigned(DDataSet.FindField('sumands')) then begin
      DDataSet.FieldByName('sumands').asFloat := RRoundto (
        RRoundto(
          DDataSet.FieldByName('cena').asFloat*
          DDataSet.FieldByName('kolotp').asFloat,-2)
          * (1+MDataSet.FieldByName('nalog_nds').asFloat),
        -2);
    end;
    DDataSet.FieldByName('skidka').Clear;
  end;
  if Source=5 then begin
    if DDataSet.FieldByName('skidka').AsFloat=0 then begin
      DDataSet.FieldByName('skidka').Clear;
    end;
  end;
end;

procedure RestRecount (Source : integer;MDataSet,DDataSet : TDataSet;mode: integer=0);
begin
  //Пересчёт всех полей кроме себя под воздействием изменений
  if ((Source<>2) and Assigned(DDataSet.FindField('cenands'))) then begin
    case mode of
      0: DDataSet.FieldByName('cenands').asFloat :=
        RRoundTo((DDataSet.FieldByName('cena').asFloat*
        (MDataSet.FieldByName('nalog_nds').asFloat+1)),-2);
      1: DDataSet.FieldByName('cenands').asFloat :=
        DDataSet.FieldByName('cena').asFloat*
        (MDataSet.FieldByName('nalog_nds').asFloat+1);
    end;//case mode
  end;
  if ((Source<>3) and Assigned(DDataSet.FindField('suma'))) then begin
    DDataSet.FieldByName('suma').AsFloat :=RRoundto(
      DDataSet.FieldByName('cena').asFloat*
      DDataSet.FieldByName('kolotp').asFloat,-2);
  end;
  if ((Source<>4) and Assigned(DDataSet.FindField('sumands'))) then begin
    DDataSet.FieldByName('sumands').asFloat := RRoundto (
      RRoundto(DDataSet.FieldByName('cena').asFloat*
        DDataSet.FieldByName('kolotp').asFloat,-2)
        * (1+MDataSet.FieldByName('nalog_nds').asFloat),
      -2);;
  end;
end;

//Source=6- цена, 1- колво, 5-скидка
//mode=0 - цена округляется до 2 знаков
//mode=1 - цена не округляется до 2 знаков
//mode=2  пока не сделано- колво не округл до 3 знаков, цена округл до 2
//id_price=0 - нет прайса, 1 - прайс укк, Остальные прайсы на 0 и 1.
procedure FromCenaRecount (Source : integer;MDataSet,DDataSet : TDataSet;
  mode: integer=0; id_price: integer=1; id_currency :integer=0);
var
  dPrice : double;
begin
  if DDataSet.State=dsBrowse then begin DDataSet.Edit end;
  case Source of
    2: begin
      case mode of
        0: DDataSet.FieldByName('cena').asFloat :=
          RRoundTo(DDataSet.FieldByName('cenands').asFloat
          /
          (1+ MDataSet.FieldByName('nalog_nds').asFloat),-2);
        1: DDataSet.FieldByName('cena').asFloat :=
          DDataSet.FieldByName('cenands').asFloat
          /
          (1+ MDataSet.FieldByName('nalog_nds').asFloat);
      end;//case mode
    end; //2

    3: begin
      if DDataSet.FieldByName('kolotp').asFloat <>0 then begin
        case mode of
          0: DDataSet.FieldByName('cena').asFloat :=
            RRoundTo(DDataSet.FieldByName('suma').asFloat
            /
            DDataSet.FieldByName('kolotp').asFloat,-2);
          1: DDataSet.FieldByName('cena').asFloat :=
            DDataSet.FieldByName('suma').asFloat
            /
            DDataSet.FieldByName('kolotp').asFloat;
        end;//case mode
      end else begin
        DDataSet.FieldByName('cena').asFloat := 0;
      end;
    end; //3

    4: begin
      if DDataSet.FieldByName('kolotp').asFloat <>0 then begin
        case mode of
          0: DDataSet.FieldByName('cena').asFloat :=
            RRoundTo(RRoundTo(
              DDataSet.FieldByName('sumands').asFloat
              /
              (1+MDataSet.FieldByName('nalog_nds').asFloat),
              -2)
              /
              DDataSet.FieldByName('kolotp').asFloat,-2);
          1: DDataSet.FieldByName('cena').asFloat :=
            RRoundTo(DDataSet.FieldByName('sumands').asFloat
            /
            (1+MDataSet.FieldByName('nalog_nds').asFloat),-2)
            /
            DDataSet.FieldByName('kolotp').asFloat;
        end; //case mode
      end else begin
        DDataSet.FieldByName('cena').asFloat := 0;
      end;
    end; //4

    5 : begin

      if GetPrice(
        dmdEx.cdsTemp,
        id_price,
        DDataSet.FieldByName('id_tovar').asinteger,
        MDataSet.FieldByName('dat').AsDateTime,
        false,
        id_currency,dPrice) then begin
        //такой товар был найден в прайсе
        DDataSet.FieldByName('cena').asFloat:= rroundto(dPrice,-2);
      end else begin
        DDataSet.FieldByName('cena').asFloat:=0;
      end;

      case mode of
        0: DDataSet.FieldByName('cena').asFloat :=
           rroundto(rroundto(DDataSet.FieldByName('cena').asFloat,-2)
           *(1-DDataSet.FieldByName('skidka').AsFloat/100),-2);
        1: DDataSet.FieldByName('cena').asFloat :=
           DDataSet.FieldByName('cena').asFloat
           *(1-DDataSet.FieldByName('skidka').AsFloat/100);
      end;//case mode
    end; //5
    6: begin
      case mode of
        0: DDataSet.FieldByName('cena').asFloat :=
          rroundto(DDataSet.FieldByName('cena').asFloat,-2);
        1: //DDataSet.FieldByName('cena').asFloat := DDataSet.FieldByName('cena').asFloat;
      end;//case mode
    end;//6
  end;//case

  RestRecount(source,MDataSet,DDataSet,mode);
  SelfRecount(source,MDataSet,DDataSet,mode);
end;


//mode=1 используется в счетах. Цена не округляется до 2 знаков.
//домножается на колво и только потом округляется
//mode=0 стандарт. цена * курс округляется до 2 знаков
function SumRecount(MDataSet2,
  DDataSet2: TDataSet;iMode:integer=0):currency;
var
  SavePlace : TBookmark;
  curSum , curPos, curSumNds: Currency;
  iTara : integer;
begin
  SavePlace := DDataSet2.GetBookmark;
  DDataSet2.First;
  curSum :=0;
  curPos :=0;
  while not DDataSet2.eof do begin
    iTara := DDataSet2.FieldByName('tara').asInteger;
    if (iTara = 1) then begin
      curPos := RRoundTo (DDataSet2.FieldByName('cena').asFloat*
      DDataSet2.FieldByName('kolotp').asFloat,
      -2);
    end else begin
      //if cable
      if (iMode=1) then begin
        curPos := RRoundTo (
          DDataSet2.FieldByName('cena').AsCurrency*
          MDataSet2.FieldByName('Kurs').AsCurrency*
          DDataSet2.FieldByName('kolotp').asFloat,
        -2);
      end;
      if (iMode=0) then begin
        curPos := RRoundTo (
          RRoundTo(DDataSet2.FieldByName('cena').AsCurrency*
            MDataSet2.FieldByName('Kurs').AsCurrency,-2)
          *
          DDataSet2.FieldByName('kolotp').asFloat,
        -2);
      end;
    end; //if tara
    curSum := curSum + curPos;
    DDataSet2.Next;
  end;//while

  curSumNds := RRoundTo(curSum * (1+MDataSet2.FieldByName('nalog_nds').asFloat),-2);
  if curSumNds<>MDataSet2.FieldByName('nds').AsFloat then begin
    if MDataSet2.State = dsBrowse then begin
      MDataSet2.Edit;
    end;
    TClientDataSet(MDataSet2).FieldByName('nds').AsFloat := curSumNds;
  end; //if new <> old.nds
  if (MDataSet2.FindField('vsego')<>nil) then begin
    if curSum<>MDataSet2.FieldByName('vsego').AsFloat then begin
      if MDataSet2.State = dsBrowse then begin
        MDataSet2.Edit;
      end;
      TClientDataSet(MDataSet2).FieldByName('vsego').AsFloat := curSum;
    end; //if new <> old.vsego
  end; //if vsego exists
  if Assigned (SavePlace) then begin
    if DDataSet2.BookmarkValid(SavePlace) then begin
      DDataSet2.GotoBookmark(SavePlace);
    end;
  end;
  Result := curSum;
end;

function ColumnByName(Columns :TDBGridColumnsEh; ColumnName: string):TColumnEh;
var
  i: integer;
begin
  //По умолчанию такая колонка не найдена
  Result := nil;
  for i:=0 to Columns.Count-1 do begin
    if Columns[i].FieldName=ColumnName then begin
      Result := Columns[i];
      exit;
    end;
  end;
end;

procedure ShowCheckboxForColumn(Column: TColumnEh);
begin
  Column.KeyList.Clear;
  Column.KeyList.Add('1');
  Column.KeyList.Add('0');
  Column.CheckBoxes := true;
end;

//Группа процедур отвечающая за фильтр вверху справочника
procedure FilterChanged(cbxFields: TComboBox;
  cbxContains: TCheckBox; edtFilter: TEdit; dbgClient: TDbGridEh);
var
  qurLocal :TDataSet;
  strFieldName : string;
  strFilter : string;
begin
  try
    qurLocal := dbgClient.DataSource.DataSet;
    if (edtFilter.Text<>'') then begin
      try
        strFieldName:=dbgClient.Columns.Items[cbxFields.ItemIndex].FieldName;
        if cbxContains.Checked then begin
          strFilter:= strFieldName+' LIKE ''%' + edtFilter.Text + '%''';
        end else begin
          strFilter:= strFieldName+'=''' + edtFilter.Text + '*''';
        end;
        qurLocal.Filter := strFilter;
        qurLocal.Filtered :=true;
      except
        showmessage ('Неправильный фильтр' + strFilter);
      end;
    end else begin
      qurLocal.Filtered :=false;
    end;
  except
    showmessage ('wrong type of dataset');  //impossible to get out of dataset type:)
  end;
end;


procedure  FillFieldNamesForFiltering(cbxFields :TComboBox; dbgClient:TDbGridEh);
var
  i : integer;
begin
	cbxFields.Items.Clear;
	for i:=0 to dbgClient.Columns.Count-1 do begin
		cbxFields.Items.Add(dbgClient.Columns.Items[i].Title.Caption);
	end;
	cbxFields.itemindex:=0;
end;
//Конец группы процедур отвечающих за фильтр вверху справочника


 function DelphiLoaded : boolean;
{----------------------------------------------------------------}
{ Checks whether Delphi is loaded.  Gives correct result whether }
{ or not Delphi is minimized and whether or not Delphi has a     }
{ project open.  Also gives correct result whether the calling   }
{ application is launched free-standing or from within the IDE.  }
{ From ideas in a posting to the Delphi-Talk List by Wade Tatman }
{ (wtatman@onramp.net).       Mike O'Hanlon, The Pascal Factory. }
{----------------------------------------------------------------}

   function WindowExists(ClassName, WindowName: string): boolean;
   {------------------------------------------------------}
   { Checks for the existence of the specified Window,    }
   { conveniently using Pascal strings instead of PChars. }
   {------------------------------------------------------}
    var
     PClassName, PWindowName: PChar;
     AClassName, AWindowName: array[0..63] of char;
   begin
    if ClassName = ''
     then PClassName := nil
     else PClassName := StrPCopy(@AClassName[0], ClassName);
    if WindowName = ''
     then PWindowName := nil
     else PWindowName := StrPCopy(@AWindowName[0], WindowName);
    if FindWindow(PClassName, PWindowName) <> 0
     then WindowExists := true
     else WindowExists := false;
   end;  {WindowExists}

 begin {DelphiLoaded}
  DelphiLoaded := false;
  if WindowExists('TPropertyInspector', 'Object Inspector') then
    if WindowExists('TMenuBuilder',     'Menu Designer') then
      if WindowExists('TApplication',   'Delphi')    then
        if WindowExists('TAlignPalette','Align') then
          if WindowExists('TAppBuilder','')  then
            DelphiLoaded := true;
 end; {DelphiLoaded}

function InIDE: Boolean;
begin
{$WARNINGS OFF}
  Result:=false;
  if DebugHook<>0 then
    Result:=true;;
{$WARNINGS ON}
end;

{-------------------------------------------------------------------------
возвращает стороку содержащую фильтр по указанному полю. Значения фильтра
берутся из набора данных.
e.g.  sFilter := FilterListCreate(dsTovar.DataSet,'id_tovar');
      sFilter := AnsiReplaceStr (sFilter,'id_tovar','[id_analog]');
--------------------------------------------------------------------------}
function FilterListCreate(dtsOne : TDataSet;sField: string):string;
var
  strTemp,strTemp3,strTemp4,sResult : string;
begin
try
  Result :='';
  dtsOne.First;
  while not dtsOne.Eof do begin
    strTemp :='';
    sResult:= dtsOne.FieldByName(sField).asVariant;
    strTemp3 :=sField+'='+sResult ;
    if strTemp3<>'' then begin
      strTemp4 := strTemp4 + '(' +strTemp3+') or ';
    end;
    dtsOne.Next;
  end;
  //обрезание последнего or
  if strTemp4 <>'' then begin
    strTemp4 := Copy(strTemp4,1,Length(strTemp4)-3);
    Result := '('+strTemp4+')';
  end;
except
  AssertInternal('752BC7CA-6445-40D5-BBCA-AFB60409D18E+ '+sField+' '+dtsOne.Name);
end;
end;

function CheckExistenceOfSelectedRecord(DataSet:TDataSet):boolean;
begin
  Result :=true;
  if not DataSet.Active then begin
    messagedlg('Выберите документ',mtWarning,[mbOK],0);
    Result :=false;
  end;
  if DataSet.Eof and DataSet.Eof then begin
    messagedlg('Не выбран документ',mtWarning,[mbOK],0);
    Result :=false;
  end;
end;

//сливает результаты отчёта и другого набора данных
procedure MergeStrings(dtsFrom,dtsTo:Tdataset;
 KeyFieldFrom,KeyFieldTo,FromField,ToField: string;OuterJoin:boolean=true);
begin
  dtsTo.First;
  dtsFrom.First;
  while not dtsFrom.Eof do begin
    if dtsTo.Locate(KeyFieldTo,Trim(dtsFrom.FieldByName(KeyFieldFrom).AsString),[]) then begin
      if dtsTo.State = dsBrowse then begin
        dtsTo.Edit;
      end;
      CopyFieldValues(dtsFrom,dtsTo,FromField,ToField);
    end else begin //if found
      if OuterJoin then begin
        dtsTo.Append;
        dtsTo.FieldByName(KeyFieldTo).AsString :=
          dtsFrom.FieldByName(KeyFieldFrom).asString;
        CopyFieldValues(dtsFrom,dtsTo,FromField,ToField);
      end;
    end; //if found
    dtsTo.CheckBrowseMode;
    dtsFrom.Next;
  end; //while not eof
end;

//mode=0 - обновить существующие записи
//mode=1 - добавить новые записи
//mode=2 - удалить/добавить записи
//mode=3 - добавить все записи без проверки на существование
//  т.е. копирование в новый набор данных
//mode=4 - обновить существующие записи, только в отличии от 0 режима
// сделать так, чтобы если строк в наборе данных назначения больше,
//то пробежится по всем строкам и заполнить их из источника
//первоначально используется для сравнения спецификаций
procedure CopyDatasetFields(dtsFrom,dtsTo:Tdataset;
 KeyFieldFrom,KeyFieldTo,FromField,ToField: string;Mode : integer=1);
var
  sFromKeyFieldValue,sKeyFieldFrom,sKeyFieldTo : string;
  KeyListVariant : variant;
  iKeyFieldsCount : integer;
  {dtsWhile,dtsLocate : TDataSet;}
begin
try
  dtsTo.First;
  {dtsWhile := dtsFrom;
  dstLocate:=dtsTo;
  if Mode=4 then begin
    dtsWhile := dtsTo;
    dtsLocate := dtsFrom;
  end;  }
  //dtsWhile.First;
  dtsFrom.First;
  while not dtsFrom.Eof do begin
  //while not dtsWhile.Eof do begin
    KeyListVariant := VarArrayCreate([0,0], varVariant);
    sKeyFieldFrom := KeyFieldFrom;
    while ItemFromList(sKeyFieldFrom,sFromKeyFieldValue,';') do begin
      VarArrayRedim( KeyListVariant,VarArrayHighBound(KeyListVariant,1)+1);
      KeyListVariant[VarArrayHighBound(KeyListVariant,1)-1]:=
        dtsFrom.FieldByName(sFromKeyFieldValue).AsVariant;
    end;
    if (Mode=3) or (not dtsTo.Locate(KeyFieldTo,KeyListVariant,[]))  then begin
      //запись не найдена либо поиска и не требовалось
      if (Mode in [1,2,3]) then begin
        dtsTo.Append;
        CopyFieldValues(dtsFrom,dtsTo,KeyFieldFrom,KeyFieldTo);
        CopyFieldValues(dtsFrom,dtsTo,FromField,ToField);
      end;
    end else begin //if found
      if dtsTo.State = dsBrowse then begin
        dtsTo.Edit;
      end;
      CopyFieldValues(dtsFrom,dtsTo,FromField,ToField);
    end; //if found
    dtsTo.CheckBrowseMode;
    dtsFrom.Next;
  end; //while not eof
  if mode=2 then begin
    dtsTo.First;
    while not dtsTo.Eof do begin
      iKeyFieldsCount :=0;
      KeyListVariant := VarArrayCreate([0,0], varVariant);
      sKeyFieldTo := KeyFieldTo;
      while ItemFromList(sKeyFieldTo,sFromKeyFieldValue,';') do begin
        VarArrayRedim( KeyListVariant,VarArrayHighBound(KeyListVariant,1)+1);
        KeyListVariant[VarArrayHighBound(KeyListVariant,1)-1]:=
          dtsTo.FieldByName(sFromKeyFieldValue).AsVariant;
        inc(iKeyFieldsCount);
      end;
      if iKeyFieldsCount>1 then begin
        if not dtsFrom.Locate(
          KeyFieldFrom,
          KeyListVariant,
          [])
        then begin
          dtsTo.Delete;
        end else begin
          dtsTo.Next;
        end;
      end else begin //if iKeyFieldsCount>1
        if not dtsFrom.Locate(
          KeyFieldFrom,
          dtsTo.FieldByName(KeyFieldTo).AsVariant,
          [])
        then begin
          dtsTo.Delete;
        end else begin
          dtsTo.Next;
        end; //while not dtsTo.Eof
      end; //if iKeyFieldsCount>1
    end;
  end;   //if mode=2
except
  AssertInternal('B860DE1E-2E85-4524-83BE-F1C87B57C7CD');
end;
end;

//mode=4 - обновить существующие записи, только в отличии от 0 режима
// сделать так, чтобы если строк в наборе данных назначения больше,
//то пробежится по всем строкам и заполнить их из источника
//первоначально используется для сравнения спецификаций
procedure CopyDatasetFieldsTo(dtsFrom,dtsTo:Tdataset;
  KeyFieldFrom,KeyFieldTo,FromField,ToField: string;Mode : integer=1);
var
  sKeyFieldItem,sKeyFieldList : string;
  KeyListVariant : variant;
begin
try
  dtsTo.First;
  while not dtsTo.Eof do begin
    KeyListVariant := VarArrayCreate([0,0], varVariant);
    sKeyFieldList := KeyFieldTo;
    while ItemFromList(sKeyFieldList,sKeyFieldItem,';') do begin
      VarArrayRedim( KeyListVariant,VarArrayHighBound(KeyListVariant,1)+1);
      KeyListVariant[VarArrayHighBound(KeyListVariant,1)-1]:=
        dtsTo.FieldByName(sKeyFieldItem).AsVariant;
    end;
    if dtsFrom.Locate(KeyFieldFrom,KeyListVariant,[])  then begin
      //запись не найдена либо поиска и не требовалось
      if dtsTo.State = dsBrowse then begin
        dtsTo.Edit;
      end;
      CopyFieldValues(dtsFrom,dtsTo,FromField,ToField);
    end; //if found
    dtsTo.CheckBrowseMode;
    dtsTo.Next;
  end; //while not eof
except
  AssertInternal('32AA37B6-B60E-49D1-A351-4DD8CB63EE2C');
end;
end;

//Копирует указанные поля из полей источников в поля назначения
procedure CopyFieldValues(dtsFrom,dtsTo:Tdataset;
  FromField,ToField: string);
var
  sToFieldValue,sFromFieldValue :string;
begin
try
  while ItemFromList(FromField,sFromFieldValue,';') do begin
    if not ItemFromList(ToField,sToFieldValue,';') then begin
      MessageDlg(
        'Ошибка в TfrmPrixSklad.CopyFieldValues '+FromField +' '+ToField,
        mtError,[mbOk],0);
    end;
    if (dtsFrom.FieldByName(sFromFieldValue) is TNumericField) then begin
      if (not dtsFrom.FieldByName(sFromFieldValue).IsNull) then begin
        //если новое значение  пустое, то его не записываем
        dtsTo.FieldByName(sToFieldValue).asFloat :=
          dtsFrom.FieldByName(sFromFieldValue).AsFloat;
      end;  //if (not dtsFrom.FieldByName(sFromFieldValue).IsNull)
    end else begin //if (dtsFrom.FieldByName(sFromFieldValue) is TNumericField)
      dtsTo.FieldByName(sToFieldValue).asVariant :=
        dtsFrom.FieldByName(sFromFieldValue).AsVariant;
    end; //if (dtsFrom.FieldByName(sFromFieldValue) is TNumericField)
  end;  //while ItemFromList(FromField,sFromFieldValue,';')
except
  AssertInternal('7E96FFA9-3D78-4A4D-B730-E6EAE9C35881 '
  +sToFieldValue+ ' '+dtsTo.Name);
end;
end;

//выбирает первое до разделителя значение из строки. Например
//из 2;3;4 вернёт List=3;4.  Item=2.
function ItemFromList(var List, Item:string;Delimiter:string):boolean;
var
  iPos : integer;
begin
  if Length(List)=0 then begin
    Result:=false;
    Item :='';
    exit;
  end;
  //while iPos<>0 do begin
  iPos:=Pos(Delimiter,List);
  if iPos<>0 then begin
    Item := Copy(List,1,iPos-1);
    List := Copy(List,iPos+1,Length(List)-iPos);
    Result:=true;
  end else begin
    Item := List;
    List := '';
    Result:=true;
  end;
  //end;
end;

//удалить строку из набора данных если все перечисленные поля =0 либо пусты
function DeleteRowIfEmpty(dtsFrom: TDataSet;FieldsToCheck:string):boolean;
var
  sFromFieldValue : string;
  bRowNotEmtpy : boolean;
begin
  bRowNotEmtpy := false;
  while ItemFromList(FieldsToCheck,sFromFieldValue,';') do begin
    if (not dtsFrom.FieldByName(sFromFieldValue).IsNull) then begin
      if (dtsFrom.FieldByName(sFromFieldValue) is TNumericField) then begin
        if dtsFrom.FieldByName(sFromFieldValue).AsFloat<>0 then begin
          bRowNotEmtpy := true;
        end;
      end else begin
        //если не число, то остустсвие null уже признак, что строка не пустая
        bRowNotEmtpy := true;
      end;
    end;
  end;
  if not bRowNotEmtpy then begin
    dtsFrom.Delete;
  end;
  Result := not bRowNotEmtpy;
end;

procedure SetFilter(DataSet:TDataSet;sFilter:string);
begin
try
  if sFilter<>'' then begin
    DataSet.Filter := sFilter;
    DataSet.Filtered := true;
  end else begin
    DataSet.Filtered := false;
  end;
except
  AssertInternal('5F5B67CB-D939-41A6-9514-B8B521365937'+sFilter);
end;
end;

function GetFilter(DataSet:TDataSet): string;
var
  sFilter: string;
begin
try
  if DataSet.Filtered then begin
    sFilter := DataSet.Filter;
  end else begin
    sFilter := '';
  end;
  Result := sFilter;
except
  AssertInternal('44394D96-806E-4A8B-BA7E-8B9B7D980652'+sFilter);
end;
end;

procedure SetFieldValue(SelectedField: TField; dValue: Variant);
begin
  if SelectedField is TIntegerField then begin
    SelectedField.AsInteger := Round(VarAsType(dValue,varInteger));
  end else begin
    SelectedField.AsFloat := VarAsType(dValue,varDouble);
  end;
end;

procedure ShowCopyForRoleOrUser(DBGridEh1:TDBGridEh;RolesList:string;userList:string);
var
  sRole,sUser : string;
begin
  DBGridEh1.EditActions:=[];
  while (ItemFromList(RolesList,sRole,';')) do begin
    if dmdEx.getrole=sRole then begin
      DBGridEh1.EditActions:=[geaCopyEh,geaSelectAllEh];
      DBGridEh1.Options := DBGridEh1.Options+[dgMultiSelect];
    end;
  end;
  while (ItemFromList(userList,sUser,';')) do begin
    if dmdEx.GetUser=sUser then begin
      DBGridEh1.EditActions:=[geaCopyEh,geaSelectAllEh];
      DBGridEh1.Options := DBGridEh1.Options+[dgMultiSelect];
    end;
  end;
end;

//возвращает набор строк вида поле=значение. Первоначально для узнавания ИНН у фирмы
procedure GetStringListFromSqlRecord(sSql:string;cdsTemp:TClientDataSet;var StringList:TStringList);
var
  sTemp : string;
  i: integer;
begin
try
  cdsTemp.Close;
  cdsTemp.CommandText := sSql;
  cdsTemp.Open;
  for i:=0 to cdsTemp.Fields.Count-1 do begin
    sTemp := cdsTemp.Fields[i].FieldName+'=';
    sTemp := sTemp + cdsTemp.Fields[i].asString;
    StringList.Add(sTemp);
  end;
finally
  cdsTemp.Close;
end;
end;

procedure CloseEditForm(Form:TForm;DataSet:TDataSet; var semaphore:boolean);
begin
  if DataSet.State <> dsBrowse then begin
    semaphore:=true;
    try
      DataSet.Cancel;
    except
    end;
    semaphore:=false;
    Form.ModalResult := mrCancel;
  end;
end;

function DefaultOpenInputForm(qeNaklo:TQueryExtender):boolean;
begin
  Result :=true;
	dmdEx.startWaiting;
  qeNaklo.Refresh;
  if not qeNaklo.Query.Active then begin
    Result :=false;
  end;
	dmdEx.StopWaiting;
end;

end.
