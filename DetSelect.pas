unit DetSelect;
{
Выбор позиций из существующего документа для добавления в новый документ
Пример: Выбор позиций спецификации, которые надо добавить
 в приходную накладную
 }

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, QueryExtender, DB, DBClient, Provider, SqlExpr,
  UnfFilter, PropStorageEh, StdCtrls, Buttons, Grids, DBGridEh, ActnList,
  PropFilerEh, GridsEh;

type
  TfrmDetSelect = class(TForm)
    DBGridEh1: TDBGridEh;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    PropStorageEh1: TPropStorageEh;
    rpsClientEdit: TRegPropStorageManEh;
    UnfFilter1: TUnfFilter;
    sdsNaklo: TSQLDataSet;
    dspNaklo: TDataSetProvider;
    cdsNaklo: TClientDataSet;
    dsNaklo: TDataSource;
    qeNaklo: TQueryExtender;
    cdsNakloID_NAKLD: TIntegerField;
    cdsNakloCENA: TFMTBCDField;
    cdsNakloID_NAKL: TIntegerField;
    cdsNakloID_POS: TIntegerField;
    cdsNakloID_TOVAR: TIntegerField;
    cdsNakloKODCN: TSmallintField;
    cdsNakloKOLOTP: TFMTBCDField;
    cdsNakloSKIDKA: TFMTBCDField;
    cdsNakloTOVAR: TStringField;
    ActionList1: TActionList;
    actSettings: TAction;
    actOk: TAction;
    actCancel: TAction;
    cdsNakloCHECKED: TIntegerField;
    sdsDetCopy: TSQLDataSet;
    BitBtn1: TBitBtn;
    actSelectAll: TAction;
    BitBtn2: TBitBtn;
    aclDeselectAll: TAction;
    sdsSprTovar: TSQLDataSet;
    dspSprTovar: TDataSetProvider;
    cdsSprTovar: TClientDataSet;
    cdsSprTovarTOVAR: TIntegerField;
    cdsSprTovarNAME: TStringField;
    cdsSprTovarCHECKED: TIntegerField;
    qeSprTovar: TQueryExtender;
    edtFilter: TEdit;
    UnfFilter2: TUnfFilter;
    psGrid: TPropStorageEh;
    rpsGrid: TRegPropStorageManEh;
    actShowAllSelected: TAction;
    BitBtn3: TBitBtn;
    btnFilterOk: TBitBtn;
    sdsQuery: TSQLDataSet;
    dspQuery: TDataSetProvider;
    cdsQuery: TClientDataSet;
    qeQuery: TQueryExtender;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actOkExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actSelectAllExecute(Sender: TObject);
    procedure aclDeselectAllExecute(Sender: TObject);
    procedure edtFilterKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFilterOkClick(Sender: TObject);
    procedure actShowAllSelectedExecute(Sender: TObject);
    procedure edtFilterExit(Sender: TObject);
  private
    { Private declarations }
    FiMode : integer;
    sCaption : string;
    FiTip : integer; //naklot.tip новых позиций
    FiNaklTo : integer; //Куда добавлять позиции
    procedure ChoiceDone;
    procedure ProcessSettings;
    procedure AddDet;

  public
    { Public declarations }
    procedure ProcessFilter;
    procedure DefaultStartup;
    procedure DefaultOpen;
    function ShowDet (iNaklFrom:integer;
      iNaklTo:integer;
      iTip: integer):integer;  //Выбор позиций из спецификации
    function ShowDetPrix (iNaklFrom:integer):integer;
    function ShowSprTovar {(iNaklFrom:integer;
      iNaklTo:integer;  //Выбор позиций из приходной накладной
      iTip: integer)} :integer; //Выбор позиций из справочника товаров
    function ShowSprTovarSnab:integer; //Выбор позиций из справочника товаров
    //отсортированного по группам, с выводом группы на экран
    function ShowQuery (sSqlQuery ,sCaptionIn,
      sCaptionColumn: string):integer; //выбор позиций из любого списка
      //на вход -запрос, заголовок формы, заголовок колонки
    function GetSchet(): integer;
    //возвращает список выбранных позиций
    function GetPositions(var set_id_nakld: variant): integer;
    function GetTovarPositions(var TovarList: TStringList): integer;
    //function GetQueryPositions(out TovarList: TStringList): integer;
    function GetStringListFromStringDelimited(sFrom : string):TStringList;
    procedure InsertDetRows(DataSet:TDataSet;FieldName:string);
    function GetSelectedList:TStringList;
  end;

//процедура фильтрует только те записи, которые начинаются
//с первого слова в строке фильтра и содержат остальные
//слова строки фильтра
procedure FilterWithSpacesChanged(UserFilterString:string;
  FieldName :string;
  FilteringDataSet : TDataSet);

var
  frmDetSelect: TfrmDetSelect;

implementation

uses untEx, untRound, atsAssert  // ColumnByName
;

{$R *.dfm}

procedure TfrmDetSelect.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ((FiMode=3) and (cdsSprTovar.Active)) then begin //if ShowSprTovar then
    psGrid.SaveProperties;
  end;
  //Action := caFree;
end;

function TfrmDetSelect.ShowDet (iNaklFrom:integer;
  iNaklTo:integer;
  iTip: integer):integer;
begin
  Result:=0;
  dmdEx.startwaiting;
  dspNaklo.DataSet:=sdsNaklo;
  qeNaklo.DefSql :=sdsNaklo.CommandText;
  qeNaklo.Prepare;
  cdsNaklo.Params.ParamByName('id_nakl').asInteger := iNaklFrom;
  sCaption := 'Выбор позиций';
  FiTip := iTip; //Тип который будет привоен naklot.tip
  FiNaklTo := iNaklTo;
  FiMode := 1;
  dmdEx.stopwaiting;
end;

function TfrmDetSelect.ShowDetPrix (iNaklFrom:integer):integer;
begin
  Result :=0;
  dmdEx.startwaiting;
  dspNaklo.DataSet:=sdsNaklo;
  qeNaklo.DefSql :=sdsNaklo.CommandText;
  qeNaklo.Prepare;
  cdsNaklo.Params.ParamByName('id_nakl').asInteger := iNaklFrom;
  sCaption := 'Выбор позиций из приходной накладной';
  FiMode := 2;
  dmdEx.stopwaiting;
end;

function TfrmDetSelect.ShowSprTovar :integer;
begin
  Result := ShowQuery(
    'select cast (0 as integer) as checked,  id as oid, name, gruppa1 '
    +'from tovar_all_vw t where t.delmarked=0 and t.tara=2'
    +' order by upper(t.gruppa1),t.gruppa2,t.gruppa3,t.gruppa4'
    ,'Справочник товаров'
    ,'Товар;Группа');
end;

function TfrmDetSelect.ShowSprTovarSnab: integer;
begin
  Result := ShowQuery(
    'select cast (0 as integer) as checked,  id as oid, name, gruppa1 '
    +'from tovar_all_vw t where t.delmarked=0 and t.tara=2'
    +' order by upper(t.gruppa1),t.gruppa2,t.gruppa3,t.gruppa4'
    ,'Справочник товаров'
    ,'Товар;Группа');
end;


procedure TfrmDetSelect.DefaultOpen;
begin
  dmdEx.startwaiting;
  case FiMode of
    1,2 : begin
      qeNaklo.Refresh;
    end; //позиции документов
    3: begin
      qeSprTovar.Refresh;
      qeSprTovar.Query.First;
    end; //справочник товаров
    4 : begin
      qeQuery.Refresh;
    end;
  end;//case
  ShowCheckboxForColumn(ColumnByName(dbGridEh1.Columns,'CHECKED'));
  dmdEx.stopwaiting;
end;

procedure TfrmDetSelect.DefaultStartup;
begin
  ProcessSettings;
  DefaultOpen;
end;

procedure TfrmDetSelect.ProcessSettings;
begin
  self.Caption := sCaption;
end;

function TfrmDetSelect.GetSchet(): integer;
begin
  self.Hide;
  Result := self.ShowModal;
end;

function TfrmDetSelect.GetPositions(var set_id_nakld: variant): integer;
var
  i: integer;
begin
  self.Hide;
  Result := self.ShowModal;
  i:=0;
  cdsNaklo.First;
  while not cdsNaklo.Eof do begin
    if cdsNaklo.FieldByName('checked').asInteger = 1 then begin
      inc(i);
    end;//if
    cdsNaklo.Next;
  end;//while
  set_id_nakld := VarArrayCreate([0,i-1],varInteger);
  cdsNaklo.First;
  i:=0;
  while not cdsNaklo.Eof do begin
    if cdsNaklo.FieldByName('checked').asInteger = 1 then begin
      inc(i);
      set_id_nakld[i-1]:= cdsNaklo.FieldByName('id_nakld').asInteger;
    end;//if
    cdsNaklo.Next;
  end;//while

end;

function TfrmDetSelect.GetTovarPositions(var TovarList: TStringList): integer;
begin
  self.Hide;
  Result := self.ShowModal;
  dsNaklo.DataSet.First;
  while not dsNaklo.DataSet.Eof do begin
    if dsNaklo.DataSet.FieldByName('checked').asInteger = 1 then begin
      TovarList.Add(dsNaklo.DataSet.FieldByName('oid').asString);
    end;//if
    dsNaklo.DataSet.Next;
  end;//while
end;


procedure TfrmDetSelect.actOkExecute(Sender: TObject);
begin
  if FiMode =1 then begin
    //только если была вызвана позиции спецификации
    AddDet;
  end;
  ChoiceDone;
end;

procedure TfrmDetSelect.ChoiceDone;
begin
  ModalResult := mrOK;
end;

procedure TfrmDetSelect.actCancelExecute(Sender: TObject);
begin
  ModalResult :=mrCancel;
end;

procedure TfrmDetSelect.AddDet;
begin
  cdsNaklo.First;
  while not cdsNaklo.Eof do begin
    if cdsNaklo.FieldByName('checked').asInteger = 1 then begin
      with sdsDetCopy do begin
        Params.ParamByName('id_nakl_to').asInteger :=
          FiNaklTo;
        Params.ParamByName('id_nakld_from').asInteger :=
          cdsNaklo.FieldByName('id_nakld').asInteger;
        Params.ParamByName('mode').asInteger := 1;
        Params.ParamByName('tip_to').asInteger := FiTip;
      end;//with
      dmdEx.ExecSQL(sdsDetCopy);
    end;//if checked
    cdsNaklo.Next;
  end;
end;

procedure TfrmDetSelect.actSelectAllExecute(Sender: TObject);
begin
  //qeNaklo.SavePosition;
  with dsNaklo.Dataset do begin
    First;
    while not eof do begin
      Edit;
      FieldByName('checked').asInteger:=1;
      Next;
    end;//while
  end;//with
  //qeNaklo.GetPosition;
end;

procedure TfrmDetSelect.aclDeselectAllExecute(Sender: TObject);
begin
  //qeNaklo.SavePosition;
  with dsNaklo.DataSet do begin
    First;
    while not eof do begin
      if  FieldByName('checked').asInteger<>0 then begin
        Edit;
        FieldByName('checked').asInteger:=0;
        Post;
      end;
      //если наложен фильтр выбранное, то после снятия галочки запись исчезает
      //активной становиться следующая, и если в этот момент Next, то перепрыгиваем
      //через одну запись
      if FieldByName('checked').asInteger=0 then begin
        Next;
      end;
    end;//while
  end;//with
  //qeNaklo.GetPosition;
end;



procedure TfrmDetSelect.edtFilterKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    vk_return : begin
      ProcessFilter;
    end;//vk_return
  end;
end;

procedure TfrmDetSelect.ProcessFilter;
begin
  if FiMode in [2,3,4] then begin
    FilterWithSpacesChanged(edtFilter.Text,'name',dsNaklo.DataSet);
  end;
end;

function GetWords(UserFilterString: string): TStringList;
var
  Words :TStringList;
  SpacePosition :integer;
  CurrentWord :string;
begin
  Words := TStringList.Create;

  //изменилась строка для фильтра
  while Length(UserFilterString)>0 do begin
    SpacePosition:=Pos(' ',UserFilterString);
    if SpacePosition<>1 then begin

      //если пробела в строке нет вообще
      if spacePosition=0 then begin
        CurrentWord := UserFilterString;
        UserFilterString:='';
      end else begin
        //если пробел есть в строке, то это слово ещё не последнее
        //или в конце строки остались пробелы, они уничтожатся на
        //следующих итерациях
        CurrentWord := Copy(UserFilterString,1, SpacePosition-1);
        UserFilterString := Copy(UserFilterString,SpacePosition+1,Length(UserFilterString)-(SpacePosition+1)+1);
      end; //if spacePosition=0

      Words.Add(CurrentWord);

    end else begin //if  SpacePosition=1
      //chop the first space
      UserFilterString := Copy(UserFilterString,2,Length(UserFilterString)-1);
    end;  //if  SpacePosition=1
  end; //while
  result := Words;
end;

function GetFilter (FieldName :string; Words :TstringList; FirstWordContains:boolean) :string;
var
  FinalFilter : string;
  i :integer;
begin
  //если пользователь нажал ввод ведя хотя бы одно слово
  if Words.Count>=1 then begin
    if not FirstWordContains then begin
      FinalFilter := '['+FieldName+']'+ '=''' + Words.Strings[0] + '*'''
    end else begin
      FinalFilter := '['+FieldName+']'+ ' LIKE ''%' + Words.Strings[0] + '%''';
    end;
    //если есть второе слово для фильтрации
    if Words.Count>1 then begin
      for i:=1 to Words.Count-1 do begin
        FinalFilter := FinalFilter+' and ['+FieldName+']'+ ' LIKE ''%' + Words.Strings[i] + '%''';
      end;
    end;
  end else begin //if Words.Count>=1
    FinalFilter:='';
  end;  //if Words.Count>=1
  result := FinalFilter;
end;

//Группа процедур отвечающая за фильтр с пробелами вверху справочника
procedure FilterWithSpacesChanged(UserFilterString:string;
  FieldName :string;
  FilteringDataSet : TDataSet);
var
  FirstWordContains : boolean;
  Words : TStringList;
begin
  Words := nil;
try

  FilteringDataSet.FilterOptions := [foCaseInsensitive];
  FirstWordContains := false;

  if  (Pos(' ',UserFilterString)=1) then begin
    //значит первое слово тоже ищется во всей строке товара, а не в начале
    //как идёт по умолчанию
    FirstWordContains:=true;
  end;

  Words := GetWords(UserFilterString);
 
  //окончательное присвоение фильтра набору данных
  FilteringDataSet.Filter := GetFilter(FieldName, Words, FirstWordContains);
  if FilteringDataSet.Filter = '' then begin
    //проверяем. Если не было фильтра, то не снимаем фильтр, чтобы выделенная позиция в таблице не менялась
    if FilteringDataSet.Filtered then begin
      FilteringDataSet.Filtered :=false;
    end
  end else begin  //if FinalFilter=''
    FilteringDataSet.Filtered :=true;
  end; //if FinalFilter=''
finally
  Words.Free;
end;

end;




procedure TfrmDetSelect.btnFilterOkClick(Sender: TObject);
begin
  ProcessFilter;
end;

procedure TfrmDetSelect.actShowAllSelectedExecute(Sender: TObject);
begin
  dmdEx.StartWaiting;
  dsNaklo.DataSet.Filtered :=false;
  dsNaklo.DataSet.Filter := '[checked]=1';
  edtFilter.Text := '';
  dsNaklo.DataSet.Filtered := true;
  dmdEx.stopWaiting;
end;

//sSqlQuery должна возвращать 3 колонки. oid-integer,name-string,checked - integer
function TfrmDetSelect.ShowQuery (sSqlQuery ,sCaptionIn, sCaptionColumn: string):integer;
var
  sStrings : TStringList;
  i : integer;
begin
  Result :=0;
  dmdEx.startwaiting;
  sCaption := sCaptionIn;
  FiMode := 4;
  edtFilter.Visible := true;
  btnFilterOk.Visible := true;
  actShowAllSelected.Visible :=true;
  qeQuery.defsql := sSqlQuery;
  dsNaklo.DataSet := cdsQuery; //в таблице будет позакан справочник
  //товаров, а не позиции накладной из набора данных cdsNaklo
  //qeSprTovar.DefSql :=sdsSprTovar.CommandText;
  //qeSprTovar.Prepare;
  //чтобы не вызывать уже на стороне клиента функции
  DefaultStartUp;
  cdsQuery.FieldByName('checked').DisplayLabel := 'Выбрана';
  cdsQuery.FieldByName('oid').DisplayLabel := '№';
  cdsQuery.FieldByName('name').DisplayLabel := sCaptionColumn;
  sStrings := GetStringListFromStringDelimited(sCaptionColumn);
  cdsQuery.FieldByName('name').DisplayLabel := sStrings.Strings[0];
  for i:= cdsQuery.FieldByName('name').Index to cdsQuery.Fields.Count-1 do begin
    if sStrings.Count>i-cdsQuery.FieldByName('name').FieldNo then begin
      cdsQuery.Fields[i].DisplayLabel := sStrings.Strings[i-cdsQuery.FieldByName('name').Index];
    end;
    ColumnByName(DBGridEh1.Columns,cdsQuery.Fields[i].FieldName).Width := 80;
  end;
  psGrid.LoadProperties;
  self.ActiveControl := edtFilter;
  //edtFilter.SetFocus;
  dmdEx.stopwaiting;
end;

function TfrmDetSelect.GetStringListFromStringDelimited(sFrom : string):TStringList;
var
  sStrings : TStringList;
  sDelimiter,sTo : string;
  iPos : integer;
begin
  sStrings := TStringList.Create();
  sDelimiter := ';';
  repeat
    iPos := Pos(sDelimiter,sFrom);
    if iPos=0 then begin
      sTo := sFrom;
    end else begin
      sTo := Copy(sFrom,1,iPos-1);
      sFrom := Copy(sFrom,iPos+1,Length(sFrom)-iPos);
    end;
    sStrings.Add(sTo);
  until (iPos=0);
  Result := sStrings;
end;

procedure TfrmDetSelect.edtFilterExit(Sender: TObject);
begin
  ProcessFilter;
end;

procedure TfrmDetSelect.InsertDetRows(DataSet: TDataSet; FieldName: string);
var
  i : integer;
  TovarList: TStringList;
begin
  DataSet.Tag :=1;
  TovarList := GetSelectedList;
  for i :=0 to TovarList.Count-1 do begin
    DataSet.Append;
    DataSet.FieldByName(FieldName).AsInteger := strtoint(TovarList.Strings[i]);
    DataSet.Post;
  end;
  //чтобы после вставки опять открывалось окно редактирования
  DataSet.Tag :=0;
end;

function TfrmDetSelect.GetSelectedList: TStringList;
var
  TovarList : TStringList;
begin
  TovarList := TStringList.Create;
  dsNaklo.DataSet.First;
  while not dsNaklo.DataSet.Eof do begin
    if dsNaklo.DataSet.FieldByName('checked').asInteger = 1 then begin
      TovarList.Add(dsNaklo.DataSet.FieldByName('oid').asString);
    end;//if
    dsNaklo.DataSet.Next;
  end;//while
  Result :=TovarList;
end;

end.
