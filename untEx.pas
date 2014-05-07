unit untEx;
{
 Всё для DbExpress
 Будет содержать всё для lookup полей
}
  {В среде разработки пароль при запуске не запрашивается
  Используется для ускорения многократных запусков проги}
 {$DEFINE NO_AUTH_IN_IDE}

interface

uses
  SysUtils, Classes,
  DBXpress, FMTBcd,
  DB, SqlExpr, DBClient, Provider,
  Controls,StdCtrls,
	Forms, xmldom, Xmlxform,
	ImgList, //screen
	Dialogs, //MessageDlg
  untRound, //CalculateSumNaklo uses RRoundTo
  DBGridEh,// TDBGridEh в ColumnSet
  PropFilerEh,
  Variants, //varasType
  PropStorageEh,
  ActnList, //TAction
  frxClass,
  IniFiles // TiniFile
  ;


type
  TClientDetail = record
    ipn : string;
    adrp : string;
    tel : string;
    svreg : string;
    fullname : string;
    lgoty : integer;
    okpo : string;
  end;

  TProcessProcedure = procedure(dbgNaklot: TDBGridEh;param:variant;Object1:Pointer=nil);

  TdmdEx = class(TDataModule)
    scUchet: TSQLConnection;
    sdsVlad: TSQLDataSet;
    sdsPost: TSQLDataSet;
    sdsManager: TSQLDataSet;
    dspVlad: TDataSetProvider;
    cdsVlad: TClientDataSet;
    dspPost: TDataSetProvider;
    cdsPost: TClientDataSet;
    dspManager: TDataSetProvider;
    cdsManager: TClientDataSet;
    sdsTovar: TSQLDataSet;
    dspTovar: TDataSetProvider;
    cdsTovar: TClientDataSet;
    sdsGen: TSQLDataSet;
    sdsTara: TSQLDataSet;
    dspTara: TDataSetProvider;
    cdsTara: TClientDataSet;
    sdsClient: TSQLDataSet;
    dspClient: TDataSetProvider;
    cdsClient: TClientDataSet;
    sdsNds: TSQLDataSet;
    cdsNds: TClientDataSet;
    dspNds: TDataSetProvider;
    dsTovar: TDataSource;
    dsTara: TDataSource;
    sdsTemp: TSQLDataSet;
    dspTemp: TDataSetProvider;
    cdsTemp: TClientDataSet;
    dsTemp: TDataSource;
    sdsSelManager: TSQLDataSet;
    dspSelManager: TDataSetProvider;
    cdsManagerSel: TClientDataSet;
    dsManagerSel: TDataSource;
    cdsManagerSelNAME: TStringField;
    cdsManagerSelID: TIntegerField;
    sdsGetIDManager2222: TSQLDataSet;
    dspAllClient: TDataSetProvider;
    cdsAllClient: TClientDataSet;
    cdsAllClientNAME: TStringField;
    cdsAllClientID: TIntegerField;
    cdsAllClientTIP: TIntegerField;
    sdsAllClient: TSQLDataSet;
    cdsAllClientDELMARKED: TSmallintField;
    sdsConst: TSQLDataSet;
    dspConst: TDataSetProvider;
    cdsConst: TClientDataSet;
    cdsConstTABLE_NAME: TStringField;
    cdsConstTABLE_FIELD: TStringField;
    cdsConstFIELD_VALUE: TStringField;
    cdsConstID_CONST: TIntegerField;
    cdsConstID_FIELD: TIntegerField;
    cdsNakloTip: TClientDataSet;
    StringField3: TStringField;
    IntegerField2: TIntegerField;
    sdsTovarAll: TSQLDataSet;
    dspTovarAll: TDataSetProvider;
    cdsTovarAll: TClientDataSet;
    dsTovarAll: TDataSource;
    cdsManagerID: TIntegerField;
    cdsManagerNAME: TStringField;
    cdsPostNAME: TStringField;
    cdsPostID: TIntegerField;
    cdsVladID: TIntegerField;
    cdsVladNAME: TStringField;
    cdsNaklodetTip: TClientDataSet;
    StringField1: TStringField;
    IntegerField1: TIntegerField;
    sdsSklads: TSQLDataSet;
    dspSklads: TDataSetProvider;
    cdsSklads: TClientDataSet;
    cdsSkladsOID: TIntegerField;
    cdsSkladsNAME: TStringField;
    dspNakloTip: TDataSetProvider;
    sdsNakloTip: TSQLDataSet;
    dsSklads: TDataSource;
    dsVlad: TDataSource;
    ImageList1: TImageList;
    dsClient: TDataSource;
    dsManager: TDataSource;
    sdsSklottIdtype: TSQLDataSet;
    dspSklottIdtype: TDataSetProvider;
    cdsSklottIdtype: TClientDataSet;
    StringField2: TStringField;
    IntegerField4: TIntegerField;
    sdsTovarAllND: TSQLDataSet;
    dspTovarAllND: TDataSetProvider;
    cdsTovarAllND: TClientDataSet;
    dsTovarAllND: TDataSource;
    sdsNaklodetTip: TSQLDataSet;
    dspNaklodetTip: TDataSetProvider;
    cdsAllClientFULLNAME: TStringField;
    cdsObjects: TClientDataSet;
    cdsObjectsoid: TSmallintField;
    cdsObjectsCLASSID: TIntegerField;
    cdsObjectsNAME: TStringField;
    sdsBank: TSQLDataSet;
    dspBank: TDataSetProvider;
    cdsBank: TClientDataSet;
    dsBank: TDataSource;
    sdsCurrency: TSQLDataSet;
    dspCurrency: TDataSetProvider;
    cdsCurrency: TClientDataSet;
    dsCurrency: TDataSource;
    sdsCurrencyOID: TIntegerField;
    sdsCurrencyNAME: TStringField;
    sdsCurrencyDELMARKED: TSmallintField;
    sdsCurrencyFULLNAME: TStringField;
    sdsBankID: TIntegerField;
    sdsBankBANK_NAME: TStringField;
    sdsBankRASCH: TFloatField;
    sdsBankMFO: TFloatField;
    sdsBankID_KLIENT: TIntegerField;
    cdsCurrencyOID: TIntegerField;
    cdsCurrencyNAME: TStringField;
    cdsCurrencyDELMARKED: TSmallintField;
    cdsCurrencyFULLNAME: TStringField;
    cdsBankID: TIntegerField;
    cdsBankBANK_NAME: TStringField;
    cdsBankRASCH: TFloatField;
    cdsBankMFO: TFloatField;
    cdsBankID_KLIENT: TIntegerField;
    cdsStatya: TClientDataSet;
    dspStatya: TDataSetProvider;
    sdsStatya: TSQLDataSet;
    cdsStatyaOID: TIntegerField;
    cdsStatyaDELMARKED: TSmallintField;
    cdsStatyaNAME: TStringField;
    cdsStatyaFULLNAME: TStringField;
    dsPost: TDataSource;
    sdsDolgnost: TSQLDataSet;
    dspDolgnost: TDataSetProvider;
    dsDolgnost: TDataSource;
    cdsDolgnost: TClientDataSet;
    IntegerField5: TIntegerField;
    StringField6: TStringField;
    sdsSfera: TSQLDataSet;
    dspSfera: TDataSetProvider;
    cdsSfera: TClientDataSet;
    IntegerField6: TIntegerField;
    StringField7: TStringField;
    dsSfera: TDataSource;
    sdsReason: TSQLDataSet;
    dspReason: TDataSetProvider;
    cdsReason: TClientDataSet;
    IntegerField7: TIntegerField;
    StringField9: TStringField;
    dsReason: TDataSource;
    sdsResult: TSQLDataSet;
    dspResult: TDataSetProvider;
    cdsResult: TClientDataSet;
    IntegerField8: TIntegerField;
    StringField10: TStringField;
    dsResult: TDataSource;
    sdsGetKurs: TSQLDataSet;
    sdsGetKursKURS_TO: TFloatField;
    sdsGetKursKURS_FROM: TFloatField;
    cdsStatyaIS_BUX: TIntegerField;
    cdsStatyaIS_FACT: TIntegerField;
    cdsStatyaIS_FOR_TOVAR: TIntegerField;
    cdsStatyaIS_FOR_TARA: TIntegerField;
    sdsPrice: TSQLDataSet;
    dspPrice: TDataSetProvider;
    cdsPrice: TClientDataSet;
    dsPrice: TDataSource;
    sdsSkidka: TSQLDataSet;
    dspSkidka: TDataSetProvider;
    cdsSkidka: TClientDataSet;
    dsSkidka: TDataSource;
    sdsUslPostavka: TSQLDataSet;
    dspUslPostavka: TDataSetProvider;
    cdsUslPostavka: TClientDataSet;
    dsUslPostavka: TDataSource;
    sdsVidDostavki: TSQLDataSet;
    dspVidDostavki: TDataSetProvider;
    cdsVidDostavki: TClientDataSet;
    dsVidDostavki: TDataSource;
    cdsVidDostavkiOID: TIntegerField;
    cdsVidDostavkiNAME: TStringField;
    cdsVidDostavkiFULLNAME: TStringField;
    cdsVidDostavkiDELMARKED: TSmallintField;
    cdsVidDostavkiISDEFAULT: TSmallintField;
    cdsSkladsISDEFAULT: TSmallintField;
    cdsVladISDEFAULT: TSmallintField;
    psInterParam: TPropStorageEh;
    rpsInterParam: TRegPropStorageManEh;
    cdsSkladsFULLNAME: TStringField;
    cdsManagerSelCHILD_LIST: TStringField;
    cdsManagerSelVISIBLE_AREA: TIntegerField;
    sdsBankID_CURRENCY: TIntegerField;
    sdsBankDELMARKED: TSmallintField;
    sdsBankFULLNAME: TStringField;
    cdsBankID_CURRENCY: TIntegerField;
    cdsBankDELMARKED: TSmallintField;
    cdsBankFULLNAME: TStringField;
    dsAllClient: TDataSource;
    sdsAgent: TSQLDataSet;
    dspAgent: TDataSetProvider;
    cdsAgent: TClientDataSet;
    IntegerField9: TIntegerField;
    StringField4: TStringField;
    StringField8: TStringField;
    SmallintField1: TSmallintField;
    SmallintField2: TSmallintField;
    dsAgent: TDataSource;
    sdsProject: TSQLDataSet;
    dspProject: TDataSetProvider;
    dsProject: TDataSource;
    cdsProject: TClientDataSet;
    StringField11: TStringField;
    StringField12: TStringField;
    SmallintField3: TSmallintField;
    cdsProjectID: TIntegerField;
    cdsProjectPOID: TIntegerField;
    sdsStatyaDR: TSQLDataSet;
    dspStatyaDR: TDataSetProvider;
    cdsStatyaDR: TClientDataSet;
    IntegerField10: TIntegerField;
    StringField13: TStringField;
    StringField14: TStringField;
    SmallintField4: TSmallintField;
    IntegerField11: TIntegerField;
    dsStatyaDR: TDataSource;
    sdsUndelete: TSQLDataSet;
    cdsManagerSIGNATURE: TStringField;
    sdsVygruzka: TSQLDataSet;
    sdsVygruzkaID_PEREVOZCHIK: TIntegerField;
    sdsVygruzkaFIO_VODITELYA: TStringField;
    sdsVygruzkaDAT_REYS: TSQLTimeStampField;
    sdsVygruzkaPUNKT_ZAGRUZKI: TStringField;
    sdsVygruzkaPUNKT_VYGRUZKI: TStringField;
    sdsVygruzkaNOMER_AVTO: TStringField;
    sdsVygruzkaNOMER_PRITSEPA: TStringField;
    sdsVygruzkaDELMARKED: TSmallintField;
    dsVygruzka: TDataSource;
    cdsVygruzka: TClientDataSet;
    cdsVygruzkaID_PEREVOZCHIK: TIntegerField;
    cdsVygruzkaNOMER_AVTO: TStringField;
    cdsVygruzkaDAT_REYS: TSQLTimeStampField;
    cdsVygruzkaFIO_VODITELYA: TStringField;
    cdsVygruzkaPEREVOZCHIK: TStringField;
    cdsVygruzkaPUNKT_ZAGRUZKI: TStringField;
    cdsVygruzkaPUNKT_VYGRUZKI: TStringField;
    cdsVygruzkaNOMER_PRITSEPA: TStringField;
    cdsVygruzkaDELMARKED: TSmallintField;
    dspVygruzka: TDataSetProvider;
    cdsManagerID_DOLGNOST: TIntegerField;
    cdsManagerDOLGNOST: TStringField;
    sdsVygruzkaPOKUPATEL_PLATIT: TSmallintField;
    sdsVygruzkaID_VYGRUZKA: TIntegerField;
    cdsVygruzkaPOKUPATEL_PLATIT: TSmallintField;
    cdsVygruzkaID_VYGRUZKA: TIntegerField;
    cdsPostID_PRICE: TIntegerField;
    sdsVygruzkaNOMER_PRAV: TStringField;
    sdsVygruzkaVID_PEREVOZOK: TStringField;
    cdsVygruzkaNOMER_PRAV: TStringField;
    cdsVygruzkaVID_PEREVOZOK: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
//    procedure scUchetBeforeConnect(Sender: TObject);
  private
    { Private declarations }
    Params : TStringList;
    Save_Cursor : TCursor;
    TaraArray : Array of Integer;
    procedure LoadDbPath;
    function FillScUchetParams(IniFile :TIniFile; sSection, sKey, sParamName:string):string;

    procedure ApplyChangesIfNeeded(DataSet:TDataSet);
    procedure FillTaraArray;
  public

    SqlNds : string;

    { Public declarations }
    //получить следующее значение генератора
    function GetGenValue(GenName: string): integer;
    //узнать ндс на указанную дату
    function GetNds(dtNow: TDate): Currency;
    //узнать номер позиции "бухта" в справочнике товаров
    function GetBuxtNumber: integer;
    //заполнить комбо строками из запроса
    procedure FillComboBox(cbxBox: TComboBox; strSql: string);
    //номер клиента с названием излишек
    function GetIzlishekNumber : integer;
    //номер менеджера  с фамилией Шматков
    function GetShmatkovNumber : integer;

    function GetBoss: string;
    function GetBux: string;

    //включаем курсор-часики
    procedure StartWaiting;
    //включаем нормальный курсор
    procedure StopWaiting;
    //обновить открытые справочники
		procedure RefreshReferenceTables;
		//заполение справочника из списка констант
		procedure FillCdsFromCdsConst(cdsDest :TClientDataSet; filter:string);
		//выполнение хранимой процедуры с обработкой ошибок
		//возможно в будущем измерять время выполнения процедуры
		procedure ExecSQL(sdsProcedure: TSqlDataSet;bErrorHandling:boolean=true);

   	//открытие запроса с обработкой ошибок
		//возможно в будущем измерять время выполнения процедуры
    procedure OpenQuery(cdsQuery: TDataSet;bErrorHandling:boolean=false);
    procedure CloseQuery(cdsQuery :TDataSet; bReallyClose:boolean=true);
		//путь к директории с отчётами
		function GetReportPath : string;
		//загружает отчёт в fastreport
		//возможно будет загружать из бд.
		procedure GetReport (ReportName: string; frReport: TfrxReport);
    //возвращает текущую дату ( в будущем эту дату можно будет
    //   ставить на любое время)
    function GetTodayDate: TDateTime;
    //возвращает значение идентификатора по имени параметра
    function GetIdByName(Name: string):string;
    function GetIdManager : integer; //для текущего пользователя возвращает
      //его менеджера по умолчанию
    function GetIdCurrencyUAH : integer; //  uah oid=3036
    function HasManagerParentKiev : integer; //является ли менеджер работающим в киевском филиале 
    function GetParamCached(sParamName :string;sSql:string;sSqlResultFieldName:string):integer;
    function GetParamCachedString(sParamName, sSql,sSqlResultFieldName: string): string;

//    function GetNameById(Id: string):string;
    function GetOidObjects(Name :string; ClassId :integer):integer;
    function GetNameObjects(Oid: integer; ClassId: integer): string;
    function GetPredefinedObjects(Name: string; ClassId: integer): integer;
    //function GetIdByNameType(Name: string;TypeName:string):string;
    function IsTara(id_tovar : integer):boolean;
    procedure CalculateSumNaklo(qurNaklr,qurNaklrt : TDataSet; mode : integer=0);
    //Возвращает цену для заданных условий, т.е. прайса, товара, даты,
    // и  необходимости цены с НДС
    function AfterConnect: integer;
    function ReconnectWithRole(UserName, Password:string): boolean;
    function Connect: boolean;
    //Процедура узнаёт курс конвертации валюты списания в валюту
    //зачисления на данную дату. iKursIndirect=1 флаг того
    //что для получения конечной суммы, начальную сумму надо делить
    //на курс, а не умножать, как в случае iKursIndirect=0.
    //Пример. Из гривен в доллары. КУРС=5.3. Гривны надо разделить
    //на 5.3 чтобы получить сумму в долларах
    procedure GetKurs (id_currency,id_currency_to :integer;dat:Tdate;
      var dKurs :double;var iKursIndirect: integer);
    //Заполнить значением выделнную колонку таблицы
    procedure ColumnSet(dbgNaklot : TDBGridEh);

    //Прибавить значение к значению в колонке таблицы
    procedure ColumnInc(dbgNaklot : TDBGridEh);
    //Умножить на значение
    procedure ColumnMult(dbgNaklot : TDBGridEh);
    //колонку увеличить на колонку MultFieldName * значение пользователя
    //при изменении курса меди на LME
    procedure ColumnMultOnLmeChange(dbgNaklot: TDBGridEh;MultFieldName:string;sCaption:string;SecondMult:double);
    procedure ColumnSelectAndProcess(dbgNaklot: TDBGridEh;param:variant;
      ProcessProcedure : TProcessProcedure;
      Object1:Pointer=nil);

    //Можно ли менять колонку
    function ColumnCheckIsOk(dbgNaklot: TDBGridEh): boolean;
    function DbGridEhDeletePositions(dbgNaklot: TDBGridEh): boolean;
    function GetDefaultVlad: integer;
    function GetRole :string;
    function GetUser : string;
    function GetWhereInList(DataSet :TDataSet;FieldName:string):string;
    procedure SetIntegerParamValue(Param:TParam;Value:string);
    function UndeleteNaklo(Field: TIntegerField;  actRefresh: TAction; KeyFieldName: String='id_nakl'): boolean;  //замена UndeleteNakl
    function PostNakl(Field:TIntegerField;sdsPost:TSqlDataSet;
      FieldIdNakl:TIntegerField;bAskConfirmationQuestion:boolean=true;
      bCanPostTwice:boolean=false):boolean;
    function ShowDetail1(DataSet:TDataSet;frmEdit:TForm;actRecountNakl:TAction=nil):integer;
    function Defaultopen(DataSet:TDataSet;actRefresh:TAction;bGotoLast:boolean=true):boolean;
    function UnPostNakl(Field:TIntegerField; sdsUnPost:TSqlDataSet;
      FieldIdNakl:TIntegerField;bAskConfirmationQuestion:boolean=true):boolean;
    //procedure ProcessReportDesigner(ActionList1:TActionList;MainMenu1:TMainMenu;frNaklr:TfrxReport);
    
    //Ввод пользователем числа с плавающей точкой с проверкой корректности ввода
    function ColumnNumberInput (Caption, Prompt : string; var dValue:double) : boolean;
    procedure DelmarkNaklo(id_nakl:integer);
    //Проверяет, что тара возвратная, т.е. не пустое место и возможно будет продана
    function isTaraNothing(idTara:integer): boolean;
    //достаёт инн для клиента
    function GetClientDetail(id_client:integer) :TClientDetail;
  end;
  procedure ProcessSetColumnValue (dbgNaklot: TDBGridEh;param:variant;Object1:Pointer=nil);
  procedure ProcessIncColumnValue (dbgNaklot: TDBGridEh;param:variant;Object1:Pointer=nil);

var
  dmdEx: TdmdEx;

implementation

uses AtsAssert,Registry, Windows,
//untDM,
DBLogDlg, //loginDialog
StrUtils //AnsiStartString

 ;

{$R *.dfm}

///////////////////////////////////////////////////
//при наборе пароля автоматически получить с сервера роль.
//Если она одна
function TdmdEx.AfterConnect :integer;
var
  strPass : string;
  username: string;
begin
  Result := 0;
  scUchet.LoginPrompt := false;
  if (LoginDialog(
      //scUchet.Params.Values['Database']
      '', username,strPass))
  then begin
    scUchet.Close;  //for reconnect
    scUchet.Params.Values['Password']:= strPass;
    scUchet.Params.Values['USER_NAME']:= username;
  end else begin
    result:=1; //cancel
    exit;
  end;

  try
    scUchet.Connected := true;
    if (ReconnectWithRole (username,strPass)) then begin
      result := 0;
    end;
  except
    on E: Exception do begin
      if AnsiContainsStr(e.message,'Your user name and password are not defined') then begin
        showmessage('Неправильный пароль или ошибка подключения');
        result := 2;
      end else begin
//      if AnsiStartsStr('Unknown user name or password', e.message) then begin
        showmessage('Не удалось подключиться к серверу.'+
          chr(10)+chr(13)+'Обратитесь к администратору.'+
          chr(10)+chr(13)+e.Message);
        result := 5; //hardware fail
//      end;
      end;
    end;
  end;
end;

// Узнаём в базе роли данного пользователя
//если одна роль, то отсоединяемся и присоединяемся уже с ролью
function TdmdEx.ReconnectWithRole(UserName, Password:string): boolean;
var
  strRole : string;
begin
  cdsTemp.Close;
  cdsTemp.CommandText := 'select a.RDB$RELATION_NAME as role_name from RDB$USER_PRIVILEGES a, RDB$ROLES b '+
      'where a.RDB$RELATION_NAME = b.RDB$ROLE_NAME  and a.RDB$USER=USER group by a.RDB$RELATION_NAME ';
//      +
//      'having count(*)=1';
  cdsTemp.Open;
  if cdsTemp.RecordCount>1 then begin
    //У пользователя sysdba есть несколько ролей
    //в таком случае он входит как пользователь без роли
    strRole:='';
    //и ошибка не выдаётся
    //AssertInternal('AB754548-14E9-46CD-A232-C5037834D45B several roles');
  end else begin
    strRole:=cdsTemp.Fields[0].AsString;
  end;
  if (strRole<>'') then begin
    scUchet.Connected := false;
    scUchet.Params.Values['USER_NAME']:=UserName;
    scUchet.Params.Values['Password']:= Password;
    scUchet.Params.Values['RoleName']:= strRole;
    try
      scUchet.Connected := true;
    except
      on e:EDatabaseError do begin
        showmessage (e.message);
        //showmessage('Неправильный пароль или ошибка подключения');
        //can't reconnect with the same password
        AssertInternal('5C3EB11A-E9AE-4BE2-8B6F-B0E624A9899');
        Result := false; //error
        exit;
      end; //exception
    end; //try
 end else begin
   //no role 
	 //AssertInternal('AB754548-14E9-46CD-A232-C5037834D45B several roles');
 end;
 Result:=true;
end;


//При входе в программу показ окна ввода пароля
//после трёх неудачных попыткок ввода логина и пароля
//возвращает false
function TdmdEx.Connect: boolean;
var
  intAC : integer;
  count : integer;
begin
  LoadDbPath;
  {$IFDEF NO_AUTH_IN_IDE}
  if not InIDE then begin
  {$ENDIF}
    count := 0;
    repeat
      inc (count);
      intAC:= AfterConnect;
    until
      //password ok or cancel or three wrong passwords
      (intAC=0) or (intAc=1) or (count>=3);
    if (intAC =1) or (count>=3) then begin
      Result := false;
    end
    else begin
      Result := true;
    end;
  {$IFDEF NO_AUTH_IN_IDE}
  end else begin
    Result := true;
    try
    scUchet.open;
    except
      on e:exception do begin
        Showmessage(e.message);
        Result := false;
      end;
    end;

  end;
  {$ENDIF}
end;



//начальная инициализация
procedure TdmdEx.DataModuleCreate(Sender: TObject);
begin
  scUchet.Connected:=false;
  Params := TStringList.Create;
	{кусок sql возвращающие значение nds}
	SqlNds := 'Round((1+n.nalog_nds)*Round(sum (Round(dif(bitand(a.tip,1)-1,0,'
		+'Round(dif(a.tara-1,Round(Round(a.cena,2)*n.kurs,2),Round(a.cena,2))*a.kolotp,2'
		+')),2)),2),2) as nds';

	cdsNds.Close;
	cdsVlad.Close;
	cdsPost.Close;
	cdsManager.Close;
	cdsTovar.Close;
  cdsTovarAll.Close;
	cdsTara.Close;
	cdsClient.Close;
	scUchet.Close;

	scUchet.CloseDataSets;
	scUchet.Connected:=false;
	//по умолчанию путь к dbexpress.ini читается из current_user
	//но невозможно каждому пользователю прописывать нужные ключи в реестре
	//поэтому читаем один ключ из local_machine
 {
	Registry:=TRegistry.Create;
	Registry.RootKey:=HKEY_LOCAL_MACHINE;
	//if
	//sPath := 'SOFTWARE\Borland\DBExpress';
 try
	if Registry.OpenKey(sPath,false) then begin
	//then begin
		dbexp_ini_path:=Registry.ReadString('Connection Registry File');
		Registry.CloseKey;
	end else begin
		raise ERegistryException.Create('В реестре не найден путь к файлу настроек'+
			chr(10)+chr(13)+sPath);
	end;
 finally

	 Registry.Free;
 end;
 }

	//scUchet.LoadParamsFromIniFile(dbexp_ini_path);
  if not InIDE then begin
  	scUchet.Params.Values['Password']:= '';
	  scUchet.Params.Values['User_Name']:= '';
  	scUchet.Params.Values['RoleName']:='';
  end;

end;

//открытие источников для lookup полей
function TdmdEx.GetGenValue(GenName: string): integer;
begin
  sdsGen.CommandText := 'select gen_id('+GenName
    +',1) as gen from rdb$database';
  sdsGen.Open;
  Result :=  sdsGen.FieldByName('gen').asInteger;
  sdsGen.Close;
end;

//возвращаем номер записи из таблицы tovar содержащую название 'Бухта'
function TdmdEx.GetBuxtNumber: integer;
begin
  Result := 6828;
end;

procedure TdmdEx.FillTaraArray;
var
  i: integer;
begin
  if Length(TaraArray)=0 then begin
    //fillArray;
    cdsTemp.Close;
    cdsTemp.CommandText := 'select id_tara from get_buxtnumber_pc';
    cdsTemp.Open;
    cdsTemp.First;
    SetLength(TaraArray, cdsTemp.RecordCount);
    for i:=0 to cdsTemp.RecordCount-1 do begin
      TaraArray[i] := cdsTemp.Fields[0].AsInteger;
      cdsTemp.Next;
    end;
    cdsTemp.Close;
  end;
end;

//возвращаем номер записи из таблицы tovar содержащую название 'Бухта'
function TdmdEx.isTaraNothing(idTara:integer): boolean;
var
  i: integer;
begin
  FillTaraArray;
  for i:=0 to Length(TaraArray)-1 do
  begin
    if TaraArray[i]=idTara then begin
      Result := true;
      exit;
    end;
  end;
  Result := false;
end;

function TdmdEx.GetTodayDate: TDateTime;
begin
  Result := Date;
end;

function TdmdEx.GetNds(dtNow: TDate): Currency;
var
  curNds : currency;
  dtFrom: TDate;
begin
  //Result := 0.2;
  cdsNds.Open;
  cdsNds.Last;
  curNds :=0.2;
  dtFrom := 0;
	while (not cdsNds.bof) do begin
    try
      curNds:= strtocurr(cdsNds.FieldByName('p_value').AsString);
      dtFrom := strtodate (cdsNds.FieldByName('p_type').AsString);
    except
      on E: exception do begin
      end;
    end;
    if (dtFrom<=dtNow) then begin
      Result := curNds;
      Exit;
    end
		else begin
      cdsNds.Prior;
    end;
  end; //while
  Result := 0.2; //default

end;

procedure TdmdEx.FillComboBox(cbxBox: TComboBox; strSql: string);
begin
  cdsTemp.Close;
  cdsTemp.CommandText := strSql;
  cdsTemp.Open;
  while (not cdsTemp.eof) do begin
    cbxBox.Items.Add(cdsTemp.Fields[0].asString);
    cdsTemp.Next;
  end;
  cbxBox.ItemIndex :=0;
  cdsTemp.Close;
end;

function TdmdEx.GetIzlishekNumber: integer;
begin
  Result := 1479;
end;

function TdmdEx.GetShmatkovNumber: integer;
begin
  Result := 18;
end;

function TdmdEx.GetBoss: string;
begin
  Result := 'Стратiєвський Д.М.';
end;

function TdmdEx.GetBux: string;
begin
  Result := 'Борисова М.Д.';
end;


{возвращает словесное описание позиции на складе из naklot.tip
используется в детализации остатков по складу и
возможно в отчёте по остаткам после накладной}
{
function TdmdEx.GetTipSkladPosit (iTip :integer):string;
begin
try
  case iTip of
    0: begin
      Result := 'Ошибочный тип';
    end;
    1: begin
      Result := 'Приход';
    end;
		2: begin
      Result := 'Отложена целиком';
    end;
    3: begin
      Result := 'Отложен кусок';
    end;
    4: begin
      Result := 'Отложена намотка';
    end;
    5: begin
      Result := 'Излишек';
    end;
    8: begin
      Result := 'Отгрузка целиком';
    end;
    9: begin
      Result := 'Отгрузка куска';
    end;
		10: begin
      Result := 'Отгрузка намотки';
    end;
    else begin
      Result := 'Неизвестный тип';
    end;
  end;
except
  AssertInternal('699D8D3A-C980-4965-9DF1-5DA369056A53');
end;
end;
}

procedure Tdmdex.StartWaiting;
begin
  Save_Cursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;    { Show hourglass cursor }
end;

procedure TdmdEx.StopWaiting;
begin
  //Screen.Cursor :=Save_Cursor;
  Screen.Cursor := crDefault;
end;

function TdmdEx.GetIdByName(Name: string):string;
begin
  if params.IndexOfName(Name)=-1 then begin
    cdsTemp.Close;
    cdsTemp.CommandText :=
      'select oid from objects o where o.name='+quotedstr(Name);
    try
      cdsTemp.Open;
      if cdsTemp.RecordCount>=2 then begin
        exception.Create('Функция TdmdEx.GetIdByName('+Name+
          ') вернула БОЛЕЕ ОДНОГО значения для идентификатора' );
      end;
      if cdsTemp.RecordCount<1 then begin
        exception.Create('Функция TdmdEx.GetIdByName('+Name+
          ') не вернула НИ ОДНОГО значения для идентификатора' );
      end;
      params.Add(Name+'='+cdsTemp.fieldByName('oid').asString);
    finally
      cdsTemp.Close;
    end;//try finally
  end;

  Result:='';
  if params.IndexOfName(Name)=-1 then begin
    exception.Create('Функция TdmdEx.GetIdByName('+Name+
        ') не найдено значения для идентификатора' );
  end else begin
    Result := params.values[Name];
  end;
end;

function TdmdEx.HasManagerParentKiev : integer;
//является ли менеджер работающим в киевском филиале
begin
  Result := GetParamCached(
    'has_parent_from_kiev',
    'select has_parent from HAS_MANAGER_PARENT_KIEV_PC(null)',
    'has_parent');
end;


function TdmdEx.GetIdManager : integer;
begin
  Result :=GetParamCached(
    'id_manager_def',
    'select id_manager from get_id_manager_pc',
    'id_manager');
end;

function TdmdEx.GetIdCurrencyUAH : integer;
var
  iCurrencyTip : integer;
begin
  iCurrencyTip:=dmdEx.GetParamCached('ТИП ВАЛЮТ',
    'select oid from GET_OID_OBJECTS_PC('+quotedstr('ТИП ВАЛЮТ')+',-100)',
    'oid');
  Result :=dmdEx.GetParamCached('UAH',
    'select oid from GET_OID_OBJECTS_PC('+quotedstr('UAH')+','+inttostr(iCurrencyTip)+')',
    'oid');
end;

procedure TdmdEx.RefreshReferenceTables;
var
  i,iCompCount : integer;
  sName : string;
begin
try
  dmdEx.StartWaiting;
  iCompCount := dmdEx.ComponentCount;
  for i:=0 to iCompCount-1 do begin
		if (dmdEx.Components[i] is TClientDataSet) then begin
      if TClientDataSet(dmdEx.Components[i]).Active then begin
        if (dmdEx.Components[i].Tag<>-1) then begin
          //for debugging
          sName := dmdEx.Components[i].Name;
          TClientDataSet(dmdEx.Components[i]).DisableControls;
          TClientDataSet(dmdEx.Components[i]).Close;
          //может поможет против зависания при обновлении
          TClientDataSet(dmdEx.Components[i]).Filtered := false;
          TClientDataSet(dmdEx.Components[i]).Filter := '';
          TClientDataSet(dmdEx.Components[i]).Open;
          TClientDataSet(dmdEx.Components[i]).EnableControls         
        end;
			end;
		end;//TClientDataSet
	end;
	dmdEx.StopWaiting;
except
  AssertInternal('0338E644C-D302-4897-A1D4-CCC4F1519A4B'+sName);
end;
end;

procedure TdmdEx.ExecSQL(sdsProcedure: TSqlDataSet;bErrorHandling:boolean=true);
begin
	if bErrorHandling then begin
		try
			sdsProcedure.ExecSQL(False);
		except
			on E:EDatabaseError do begin
				MessageDlg (e.message,mtWarning,[mbOK],0);
			end;
		end; //try
	end else begin //no error handling
      sdsProcedure.ExecSQL(False);
	end;
end;

procedure TdmdEx.OpenQuery(cdsQuery: TDataSet;bErrorHandling:boolean=false);
begin
	if bErrorHandling then begin
		try
			cdsQuery.open;
		except
			on E:EDatabaseError do begin
				MessageDlg (e.message,mtWarning,[mbOK],0);
			end;
		end; //try
	end else begin //no error handling
    cdsQuery.Open;
	end;
  //if query is not special - increase
  if  cdsQuery.Tag>=0 then begin
    cdsQuery.Tag := cdsQuery.Tag+1;
  end;
end;

procedure TdmdEx.FillCdsFromCdsConst(cdsDest :TClientDataSet; filter:string);
begin
try
  cdsConst.Filter := filter;
  cdsConst.Filtered := true;
  cdsDest.Close;
  cdsDest.CreateDataSet;
  cdsConst.First;
  while not cdsConst.Eof do begin
    cdsDest.Insert;
		cdsDest.FieldByName('Field_value').asString :=
      cdsConst.FieldByName('Field_value').asString;
    cdsDest.FieldByName('id_field').asInteger :=
      cdsConst.FieldByName('id_field').asInteger;
    cdsDest.Post;
    cdsConst.Next;
  end;
	cdsConst.Filtered := false;
  cdsDest.Open;
except
	AssertInternal('{18D83AA7-4F14-47B9-9783-49766947B753}');
end;
end;



function TdmdEx.GetReportPath : string;
var
  sTemp : string;
begin
  sTemp := ExtractFilePath(Application.ExeName);
  //хотел чтобы чистовые отчёты хранились в той же папке, что и исходники
  if not inIDE then begin
    sTemp := sTemp+'..\reports\';
  end;
  Result := sTemp;
end;

procedure TdmdEx.GetReport (ReportName: string; frReport: TfrxReport);
var
	strPath : string;
begin
try
	strPath := dmdEx.GetReportPath;
	frReport.LoadFromFile(strPath+ReportName);
except
	AssertInternal('4968BDA1-1026-4965-8862-6DBAEE9572D6');
end;
end;

function TdmdEx.IsTara(id_tovar: integer): boolean;
begin
  OpenQuery(cdsTara);
  Result := false;
  if cdsTara.Locate('id',id_tovar,[]) then begin
    Result := true;
  end;
end;

//Расчитывает сумму всей накладной при
//изменении цены, кол-ва, курса, ндс
//mode=0 - режим округления ]]цена[*курс[
//используется для отгрузок со склада, приходах на склад
//mode=1 - используется для приходных бух накл,
//спецификаций, заказов
procedure TdmdEx.CalculateSumNaklo(qurNaklr,qurNaklrt : TDataSet; mode : integer=0);
var
  SavePlace: TBookmark;
  curSum,curTemp,curTemp2,curSum2 : currency;
  dKurs : double;
begin
  curTemp := 0;
  curTemp2 := 0;
  dKurs := 0;
try
  qurNaklrt.DisableControls;
  SavePlace := qurNaklrt.GetBookmark;
  qurNaklrt.First;
  curSum := 0;
  curSum2 := 0;
  if mode=2 then begin
    if qurNaklr.FieldByName('kurs_indirect').asInteger<>1 then begin
      dKurs := qurNaklr.FieldByName('kurs').asFloat;
    end else begin
      dKurs := 1/ qurNaklr.FieldByName('kurs').asFloat;
    end;
  end;
  while not qurNaklrt.Eof do begin
    if dmdEx.IsTara(qurNaklrt.FieldByName('id_tovar').asInteger) then begin
      case mode of
        0: curTemp := RRoundTo(qurNaklrt.FieldByName('cena').AsCurrency,-2);
        1: curTemp := qurNaklrt.FieldByName('cena').AsCurrency;
        2: begin
          curTemp := qurNaklrt.FieldByName('cena').AsCurrency;
          //типа цена тары в валюте прайса, хотя она забита
          //в валюте накладной. Нужно для вычисления суммы
          //накладной в валюте прайса
          curTemp2 := qurNaklrt.FieldByName('cena').AsCurrency/
              qurNaklr.FieldByName('kurs').asFloat;
        end;
      end;
    end else begin
      case mode of
        0: curTemp := RRoundTo (
          RRoundTo(qurNaklrt.FieldByName('cena').AsCurrency,-2)*
          qurNaklr.FieldByName('kurs').asCurrency,
          -2);
        1: curTemp := qurNaklrt.FieldByName('cena').AsCurrency*
          qurNaklr.FieldByName('kurs').asFloat;
        2: begin
          curTemp := qurNaklrt.FieldByName('cena').AsCurrency*
              dKurs;
          curTemp2 := qurNaklrt.FieldByName('cena').AsCurrency;
        end;
      end;
    end;
    curTemp := RRoundTo(curTemp * qurNaklrt.FieldByName('kolotp').asFloat,-2);
    curSum := curSum + curTemp;
    if  mode=2 then begin
      curTemp2 := RRoundTo(curTemp2 * qurNaklrt.FieldByName('kolotp').asCurrency,-2);
      curSum2 := curSum2 + curTemp2;
    end;
    qurNaklrt.Next;
  end;
  if Assigned(SavePlace) then begin
    if qurNaklrt.BookmarkValid(SavePlace)  then begin
      qurNaklrt.GotoBookmark(SavePlace);
    end;
  end; //if assigned
  curSum := RRoundTo(curSum * (1+qurNaklr.FieldByName('nalog_nds').AsFloat),-2);
  if mode=2 then begin
    curSum2 := RRoundTo(curSum2 * (1+qurNaklr.FieldByName('nalog_nds').AsFloat),-2);
    if qurNaklr.FieldByName('nds_from').asFloat<>curSum2 then begin
      if qurNaklr.State = dsBrowse then begin
        qurNaklr.Edit;
      end;
      TClientDataSet(qurNaklr).FieldByName('nds_from').AsCurrency := curSum2;
      qurNaklr.CheckBrowseMode;
    end;
  end;//if mode=2
  if qurNaklr.FieldByName('nds').asFloat<>curSum then begin
    if qurNaklr.State = dsBrowse then begin
      qurNaklr.Edit;
    end;
    TClientDataSet(qurNaklr).FieldByName('nds').AsCurrency := curSum;
    qurNaklr.CheckBrowseMode;
    ApplyOrCancel(qurNaklr);
  end;
  qurNaklrt.EnableControls;
except
  AssertInternal('CFB463C3-7003-4792-B3B9-247400C3FF89');
end;
end;


procedure TdmdEx.CloseQuery(cdsQuery: TDataSet; bReallyClose:boolean=true);
begin
  //can't decrease below 0 (close already closed query)
  if cdsQuery.Tag > 0 then begin
    cdsQuery.Tag := cdsQuery.Tag-1;
  end;
  if (bReallyClose and (cdsQuery.Tag=0)) then begin
      cdsQuery.Close;
  end;
end;

function TdmdEx.GetOidObjects(Name: string; ClassId: integer): integer;
begin
  cdsTemp.Close;
  cdsTemp.CommandText :=
    'select oid from GET_OID_OBJECTS_PC('+quotedstr(Name)+','+inttostr(classid)+')';
  try
    cdsTemp.Open;
    if cdsTemp.RecordCount>=2 then begin
      exception.Create('Функция TdmdEx.GetOidObjects('+Name+
        ') вернула БОЛЕЕ ОДНОГО значения для идентификатора' );
    end;
    if cdsTemp.RecordCount<1 then begin
      exception.Create('Функция TdmdEx.GetOidObjects('+Name+
        ') не вернула НИ ОДНОГО значения для идентификатора' );
    end;
    Result :=  cdsTemp.FieldByName('oid').asInteger;
  finally
    cdsTemp.Close;
  end;//try finally
end;


function TdmdEx.GetNameObjects(Oid: integer; ClassId: integer): string;
begin
  cdsTemp.Close;
  cdsTemp.CommandText :=
    'select name from GET_NAME_OBJECTS_PC('+inttostr(Oid)+','+inttostr(classid)+')';
  try
    cdsTemp.Open;
    if cdsTemp.RecordCount>=2 then begin
      exception.Create('Функция TdmdEx.GetNameObjects('+Name+
        ') вернула БОЛЕЕ ОДНОГО имени для идентификатора' );
    end;
    if cdsTemp.RecordCount<1 then begin
      exception.Create('Функция TdmdEx.GetNameObjects('+Name+
        ') не вернула НИ ОДНОГО имени для идентификатора' );
    end;
    Result :=  cdsTemp.FieldByName('name').asString;
  finally
    cdsTemp.Close;
  end;//try finally
end;

function TdmdEx.GetPredefinedObjects(Name: string; ClassId: integer): integer;
begin
  cdsTemp.Close;
  cdsTemp.CommandText :=
    'select oid from GET_OID_PREDEFINED_PC('+quotedstr(Name)+','+inttostr(classid)+')';
  try
    cdsTemp.Open;
    if cdsTemp.RecordCount>=2 then begin
      exception.Create('Функция TdmdEx.GetPredefinedObjects('+Name+
        ') вернула БОЛЕЕ ОДНОГО значения для идентификатора' );
    end;
    if cdsTemp.RecordCount<1 then begin
      exception.Create('Функция TdmdEx.GetPredefinedObjects('+Name+
        ') не вернула НИ ОДНОГО значения для идентификатора' );
    end;
    Result :=  cdsTemp.FieldByName('oid').asInteger;
  finally
    cdsTemp.Close;
  end;//try finally
end;

procedure TdmdEx.GetKurs(id_currency, id_currency_to: integer; dat: Tdate;
  var dKurs: double; var iKursIndirect: integer);
var
  dKursFrom,dKursTo : double;
begin
  dKursFrom := 0;
  dKursTo := 0;
  try
    sdsGetKurs.Close;
    sdsGetKurs.params.ParamByName('dat').AsDate :=
      Dat;
    sdsGetKurs.params.ParamByName('id_currency').AsInteger :=
      id_currency;
    sdsGetKurs.params.ParamByName('id_currency_to').AsInteger :=
      id_currency_to;
    sdsGetKurs.Open;
    if not sdsGetKurs.FieldByName('kurs_from').IsNull then begin
      dKursFrom := sdsGetKurs.FieldByName('kurs_from').asFloat;
      //dsNaklo.DataSet.FieldByName('kurs').asFloat := dKurs;
    end; //if kurs not null
    if not sdsGetKurs.FieldByName('kurs_to').IsNull then begin
      dKursTo := sdsGetKurs.FieldByName('kurs_to').asFloat;
      //dsNaklo.DataSet.FieldByName('kurs').asFloat := dKurs;
    end; //if kurs not null
    if dKursFrom=1 then begin
      iKursIndirect:=1;
      if dKursFrom<>0 then begin
        dKurs:=dKursTo/dKursFrom;
      end;
    end;
    if dKursTo=1 then begin
      iKursIndirect:=0;
      dKurs:=dKursFrom/dKursTo;
    end;
  finally //try
    sdsGetKurs.Close;
  end; //try
end;

procedure TdmdEx.ColumnSet(dbgNaklot : TDBGridEh);
var
  dValue : double;
begin
  if not ColumnCheckIsOk(dbgNaklot) then begin
    exit;
  end;
  if not ColumnNumberInput(
    'Введите новое значение поля',
    dbgNaklot.SelectedField.DisplayName,
    dValue)
  then begin
    exit;
  end;
  //для ускрения прокрутки
  dbgNaklot.DataSource.DataSet.Tag :=1;
  ColumnSelectAndProcess(dbgNaklot,dValue,ProcessSetColumnValue);
  //включаем автозапись при прокрутке
  dbgNaklot.DataSource.DataSet.Tag :=0;
  ApplyChangesIfNeeded(dbgNaklot.DataSource.DataSet);
end;

//Можно ли менять колонку
function TdmdEx.ColumnCheckIsOk(dbgNaklot: TDBGridEh): boolean;
begin
  Result:=true;
  if not ( dbgNaklot.SelectedField is TNumericField
    and not dbgNaklot.SelectedField.ReadOnly
    and not dbgNaklot.ReadOnly )
  then begin
    if dbgNaklot.ReadOnly then begin
      MessageDlg('Таблица только для чтения',mtWarning,[mbOk],0);
    end;
    if dbgNaklot.SelectedField.ReadOnly then begin
      MessageDlg('Колонка только для чтения',mtWarning,[mbOk],0);
    end;
    if not (dbgNaklot.SelectedField is TNumericField) then begin
      MessageDlg('Колонка не содержит чисел',mtWarning,[mbOk],0);
    end;
    Result:=false;
    //exit;
  end;
end;

function TdmdEx.ColumnNumberInput (Caption, Prompt : string; var dValue:double) : boolean;
var
  InputString: string;
  bWasNumber : boolean;
begin
  Result := true;
  InputString :='0';
  bWasNumber := false;
  repeat
    if not InputQuery(Caption, Prompt,  InputString) then begin
      Result := false;
      exit; //cancel
    end;
    try
      if DecimalSeparator='.' then begin
        InputString:=AnsiReplaceStr(InputString,',','.');
      end;
      if DecimalSeparator=',' then begin
        InputString:=AnsiReplaceStr(InputString,'.',',');
      end;
      dValue := StrToFloat(InputString);
      bWasNumber := true;
    except
      on E:EConvertError do begin
        bWasNumber := false;
      end
    end;
  until bWasNumber;
end;

procedure TdmdEx.ColumnInc(dbgNaklot: TDBGridEh);
var
  dValue : double;
begin
  if not ColumnCheckIsOk(dbgNaklot) then begin
    exit;
  end;
  if not ColumnNumberInput(
    'Введите значение увеличения для поля',
    dbgNaklot.SelectedField.DisplayName,
    dValue)
  then begin
    exit;
  end;
  //для ускрения прокрутки
  dbgNaklot.DataSource.DataSet.Tag :=1;
  ColumnSelectAndProcess(dbgNaklot,dValue,ProcessIncColumnValue);
{
  FieldName := dbgNaklot.SelectedField.FieldName;
  if dbgNaklot.Selection.SelectionType=gstRecordBookmarks then begin
    for i:=dbgNaklot.Selection.Rows.Count-1 downto 0 do begin
      dbgNaklot.DataSource.DataSet.GotoBookmark(pointer(dbgNaklot.SelectedRows.Items[i]));
      dbgNaklot.DataSource.DataSet.Edit;
      if  dbgNaklot.SelectedField is TIntegerField then begin
        dbgNaklot.DataSource.DataSet.FieldByName(FieldName).asInteger :=
          dbgNaklot.DataSource.DataSet.FieldByName(FieldName).asInteger+
          Round(dValue);
      end else begin
        dbgNaklot.DataSource.DataSet.FieldByName(FieldName).asFloat :=
          dbgNaklot.DataSource.DataSet.FieldByName(FieldName).asFloat+
          dValue;
      end;
      dbgNaklot.DataSource.DataSet.Post;
    end;
  end else begin //if dbgNaklot.Selection.SelectionType=gstRecordBookmarks
    //gstRectangle
    if dbgNaklot.Selection.SelectionType in [gstColumns,gstAll] then begin
      dbgNaklot.DataSource.DataSet.Last;
      sBottom :=  dbgNaklot.DataSource.DataSet.Bookmark ;
      dbgNaklot.DataSource.DataSet.First;
    end else begin //dbgNaklot.Selection.SelectionType=gstColumns
      if dbgNaklot.Selection.SelectionType=gstNon then begin
        sBottom :=  dbgNaklot.DataSource.DataSet.Bookmark;
      end else begin //dbgNaklot.Selection.SelectionType=gstNon
        //gstRectangle
        dbgNaklot.DataSource.DataSet.GotoBookmark(pointer(dbgNaklot.Selection.Rect.TopRow));
        sBottom :=dbgNaklot.Selection.Rect.BottomRow;
      end; //dbgNaklot.Selection.SelectionType=gstNon
    end; //if dbgNaklot.Selection.SelectionType=gstColumns
    if sBottom='' then begin
      //если выделена одна строка, то конец сделать равным началу выделения, а не
      //пустым, как по умолчанию
      sBottom := dbgNaklot.Selection.Rect.TopRow;
    end;
    repeat
      dbgNaklot.DataSource.DataSet.Edit;
      if  dbgNaklot.SelectedField is TIntegerField then begin
        dbgNaklot.DataSource.DataSet.FieldByName(FieldName).asInteger :=
          dbgNaklot.DataSource.DataSet.FieldByName(FieldName).asInteger+
          Round(dValue);
      end else begin
        dbgNaklot.DataSource.DataSet.FieldByName(FieldName).asFloat :=
          dbgNaklot.DataSource.DataSet.FieldByName(FieldName).asFloat+
          dValue;
      end;
      dbgNaklot.DataSource.DataSet.Post;
      iRes := dbgNaklot.DataSource.DataSet.CompareBookmarks(dbgNaklot.DataSource.DataSet.GetBookmark,pointer(sBottom));
      dbgNaklot.DataSource.DataSet.Next;
    until (iRes>=0);
  end; //if dbgNaklot.Selection.SelectionType=gstRecordBookmarks
  }
  //включаем автозапись при прокрутке
  dbgNaklot.DataSource.DataSet.Tag :=0;
  ApplyChangesIfNeeded(dbgNaklot.DataSource.DataSet);
end;

procedure TdmdEx.ColumnMult(dbgNaklot: TDBGridEh);
var
  FieldName, sBottom: string;
  dValue : double;
  i, iRes : integer;
begin
  if not ColumnCheckIsOk(dbgNaklot) then begin
    exit;
  end;
  if not ColumnNumberInput(
    'Введите множитель для поля',
    dbgNaklot.SelectedField.DisplayName,
    dValue)
  then begin
    exit;
  end;

  //для ускрения прокрутки
  dbgNaklot.DataSource.DataSet.Tag :=1;
  FieldName := dbgNaklot.SelectedField.FieldName;
  if dbgNaklot.Selection.SelectionType=gstRecordBookmarks then begin
    for i:=dbgNaklot.Selection.Rows.Count-1 downto 0 do begin
      dbgNaklot.DataSource.DataSet.GotoBookmark(pointer(dbgNaklot.SelectedRows.Items[i]));
      dbgNaklot.DataSource.DataSet.Edit;
      if  dbgNaklot.SelectedField is TIntegerField then begin
        dbgNaklot.DataSource.DataSet.FieldByName(FieldName).asInteger :=
          dbgNaklot.DataSource.DataSet.FieldByName(FieldName).asInteger*
          Round(dValue);
      end else begin
        dbgNaklot.DataSource.DataSet.FieldByName(FieldName).asFloat :=
          dbgNaklot.DataSource.DataSet.FieldByName(FieldName).asFloat*
          dValue;
      end;
      dbgNaklot.DataSource.DataSet.Post;
    end;
  end else begin //if dbgNaklot.Selection.SelectionType=gstRecordBookmarks
    //gstRectangle
    if dbgNaklot.Selection.SelectionType in [gstColumns,gstAll] then begin
      dbgNaklot.DataSource.DataSet.Last;
      sBottom :=  dbgNaklot.DataSource.DataSet.Bookmark ;
      dbgNaklot.DataSource.DataSet.First;
    end else begin //dbgNaklot.Selection.SelectionType=gstColumns
      if dbgNaklot.Selection.SelectionType=gstNon then begin
        sBottom :=  dbgNaklot.DataSource.DataSet.Bookmark;
      end else begin //dbgNaklot.Selection.SelectionType=gstNon
        //gstRectangle
        dbgNaklot.DataSource.DataSet.GotoBookmark(pointer(dbgNaklot.Selection.Rect.TopRow));
        sBottom :=dbgNaklot.Selection.Rect.BottomRow;
      end; //dbgNaklot.Selection.SelectionType=gstNon
    end; //if dbgNaklot.Selection.SelectionType=gstColumns
    if sBottom='' then begin
      //если выделена одна строка, то конец сделать равным началу выделения, а не
      //пустым, как по умолчанию
      sBottom := dbgNaklot.Selection.Rect.TopRow;
    end;
    repeat
      dbgNaklot.DataSource.DataSet.Edit;
      if  dbgNaklot.SelectedField is TIntegerField then begin
        dbgNaklot.DataSource.DataSet.FieldByName(FieldName).asInteger :=
          dbgNaklot.DataSource.DataSet.FieldByName(FieldName).asInteger*
          Round(dValue);
      end else begin
        dbgNaklot.DataSource.DataSet.FieldByName(FieldName).asFloat :=
          dbgNaklot.DataSource.DataSet.FieldByName(FieldName).asFloat*
          dValue;
      end;
      dbgNaklot.DataSource.DataSet.Post;
      iRes := dbgNaklot.DataSource.DataSet.CompareBookmarks(dbgNaklot.DataSource.DataSet.GetBookmark,pointer(sBottom));
      dbgNaklot.DataSource.DataSet.Next;
    until (iRes>=0);
  end; //if dbgNaklot.Selection.SelectionType=gstRecordBookmarks
  //включаем автозапись при прокрутке
  dbgNaklot.DataSource.DataSet.Tag :=0;
  ApplyChangesIfNeeded(dbgNaklot.DataSource.DataSet);
end;

procedure TdmdEx.ColumnMultOnLmeChange(dbgNaklot: TDBGridEh;MultFieldName:string;sCaption:string;SecondMult:double);
var
  FieldName, sBottom: string;
  dValue : double;
  i, iRes : integer;
begin
  if not ColumnCheckIsOk(dbgNaklot) then begin
    exit;
  end;
  if not ColumnNumberInput(
    sCaption,
    dbgNaklot.SelectedField.DisplayName,
    dValue)
  then begin
    exit;
  end;

  //для ускрения прокрутки
  dbgNaklot.DataSource.DataSet.Tag :=1;
  FieldName := dbgNaklot.SelectedField.FieldName;
  if dbgNaklot.Selection.SelectionType=gstRecordBookmarks then begin
    for i:=dbgNaklot.Selection.Rows.Count-1 downto 0 do begin
      dbgNaklot.DataSource.DataSet.GotoBookmark(pointer(dbgNaklot.SelectedRows.Items[i]));
      dbgNaklot.DataSource.DataSet.Edit;
      if  dbgNaklot.SelectedField is TIntegerField then begin
        dbgNaklot.DataSource.DataSet.FieldByName(FieldName).asInteger :=
          dbgNaklot.DataSource.DataSet.FieldByName(FieldName).asInteger+
          Round(dbgNaklot.DataSource.DataSet.FieldByName(MultFieldName).asFloat*
          SecondMult* dValue);
      end else begin
        dbgNaklot.DataSource.DataSet.FieldByName(FieldName).asFloat :=
          dbgNaklot.DataSource.DataSet.FieldByName(FieldName).asFloat+
          dbgNaklot.DataSource.DataSet.FieldByName(MultFieldName).asFloat*
          SecondMult*dValue;
      end;
      dbgNaklot.DataSource.DataSet.Post;
    end;
  end else begin //if dbgNaklot.Selection.SelectionType=gstRecordBookmarks
    if dbgNaklot.Selection.SelectionType in [gstColumns,gstAll] then begin
      dbgNaklot.DataSource.DataSet.Last;
      sBottom :=  dbgNaklot.DataSource.DataSet.Bookmark ;
      dbgNaklot.DataSource.DataSet.First;
    end else begin //dbgNaklot.Selection.SelectionType=gstColumns
      if dbgNaklot.Selection.SelectionType=gstNon then begin
        sBottom :=  dbgNaklot.DataSource.DataSet.Bookmark;
      end else begin //dbgNaklot.Selection.SelectionType=gstNon                 
        //gstRectangle
        dbgNaklot.DataSource.DataSet.GotoBookmark(pointer(dbgNaklot.Selection.Rect.TopRow));
        sBottom :=dbgNaklot.Selection.Rect.BottomRow;
      end; //dbgNaklot.Selection.SelectionType=gstNon
    end; //if dbgNaklot.Selection.SelectionType=gstColumns
    if sBottom='' then begin
      //если выделена одна строка, то конец сделать равным началу выделения, а не
      //пустым, как по умолчанию
      sBottom := dbgNaklot.Selection.Rect.TopRow;
    end;
    repeat
      dbgNaklot.DataSource.DataSet.Edit;
      if  dbgNaklot.SelectedField is TIntegerField then begin
        dbgNaklot.DataSource.DataSet.FieldByName(FieldName).asInteger :=
          dbgNaklot.DataSource.DataSet.FieldByName(FieldName).asInteger+
          Round(dbgNaklot.DataSource.DataSet.FieldByName(MultFieldName).asFloat*
          SecondMult*dValue);
      end else begin
        dbgNaklot.DataSource.DataSet.FieldByName(FieldName).asFloat :=
          dbgNaklot.DataSource.DataSet.FieldByName(FieldName).asFloat+
          dbgNaklot.DataSource.DataSet.FieldByName(MultFieldName).asFloat*
          SecondMult*dValue;
      end;
      dbgNaklot.DataSource.DataSet.Post;
      iRes := dbgNaklot.DataSource.DataSet.CompareBookmarks(dbgNaklot.DataSource.DataSet.GetBookmark,pointer(sBottom));
      dbgNaklot.DataSource.DataSet.Next;
    until (iRes>=0);
  end; //if dbgNaklot.Selection.SelectionType=gstRecordBookmarks
  //включаем автозапись при прокрутке
  dbgNaklot.DataSource.DataSet.Tag :=0;
  ApplyChangesIfNeeded(dbgNaklot.DataSource.DataSet);
end;

function TdmdEx.DbGridEhDeletePositions(dbgNaklot: TDBGridEh): boolean;
var
  i: integer;
begin
  Result := false;
  if (MessageDlg('Вы хотите удалить позицию?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
    if not (dbgNaklot.DataSource.DataSet.bof and dbgNaklot.DataSource.DataSet.eof) then begin
      dmdEx.StartWaiting;
      dbgNaklot.DataSource.DataSet.DisableControls;
      if dbgNaklot.Selection.SelectionType=gstRecordBookmarks then begin
        dbgNaklot.DataSource.DataSet.Tag :=1;
        for i:=dbgNaklot.Selection.Rows.Count-1 downto 0 do begin
          dbgNaklot.DataSource.DataSet.GotoBookmark(pointer(dbgNaklot.SelectedRows.Items[i]));
          dbgNaklot.DataSource.DataSet.Delete;
        end;
        dbgNaklot.Selection.Clear;
        dbgNaklot.DataSource.DataSet.Tag :=0;
        ApplyOrCancel (dbgNaklot.DataSource.DataSet);
      end else begin
        if dbgNaklot.Selection.SelectionType=gstAll then begin
          dbgNaklot.DataSource.DataSet.Tag :=1;
          dbgNaklot.DataSource.DataSet.Last;
          while not dbgNaklot.DataSource.DataSet.bof do begin
            dbgNaklot.DataSource.DataSet.Delete;
          end;
          dbgNaklot.Selection.Clear;
          dbgNaklot.DataSource.DataSet.Tag :=0;
          ApplyOrCancel (dbgNaklot.DataSource.DataSet);
        end else begin
          dbgNaklot.DataSource.DataSet.Delete;
        end;
      end; //if dbgNaklot.Selection.SelectionType=gstRecordBookmarks
      dbgNaklot.DataSource.DataSet.EnableControls;
      dmdEx.StopWaiting;
    end;
    //PostAndApply(cdsNaklot);
    Result := true;
  end ;//if messagedlg
end;

procedure TdmdEx.ColumnSelectAndProcess(dbgNaklot: TDBGridEh;
  param:variant;
  ProcessProcedure : TProcessProcedure;
  Object1:Pointer=nil);
var
  FieldName, sBottom: string;
  i, iRes : integer;
begin
  FieldName := dbgNaklot.SelectedField.FieldName;
  if dbgNaklot.Selection.SelectionType=gstRecordBookmarks then begin
    //for i:=dbgNaklot.Selection.Rows.Count-1 downto 0 do begin
    //изменил для копирования счёта в исходном порядке для Юли 25/12/08
    for i:= 0 to dbgNaklot.Selection.Rows.Count-1 do begin
      dbgNaklot.DataSource.DataSet.GotoBookmark(pointer(dbgNaklot.SelectedRows.Items[i]));
      ProcessProcedure(dbgNaklot,param,object1);
    end;
  end else begin //if dbgNaklot.Selection.SelectionType=gstRecordBookmarks
    //gstRectangle
    if dbgNaklot.Selection.SelectionType in [gstColumns,gstAll] then begin
      dbgNaklot.DataSource.DataSet.Last;
      sBottom :=  dbgNaklot.DataSource.DataSet.Bookmark ;
      dbgNaklot.DataSource.DataSet.First;
    end else begin //dbgNaklot.Selection.SelectionType=gstColumns
      if dbgNaklot.Selection.SelectionType=gstNon then begin
        sBottom :=  dbgNaklot.DataSource.DataSet.Bookmark;
      end else begin //dbgNaklot.Selection.SelectionType=gstNon
        //gstRectangle
        dbgNaklot.DataSource.DataSet.GotoBookmark(pointer(dbgNaklot.Selection.Rect.TopRow));
        sBottom :=dbgNaklot.Selection.Rect.BottomRow;
      end; //dbgNaklot.Selection.SelectionType=gstNon
    end; //if dbgNaklot.Selection.SelectionType=gstColumns
    if sBottom='' then begin
      //если выделена одна строка, то конец сделать равным началу выделения, а не
      //пустым, как по умолчанию
      sBottom := dbgNaklot.Selection.Rect.TopRow;
    end;
    repeat
      ProcessProcedure(dbgNaklot,param,object1);
      iRes := dbgNaklot.DataSource.DataSet.CompareBookmarks(dbgNaklot.DataSource.DataSet.GetBookmark,pointer(sBottom));
      dbgNaklot.DataSource.DataSet.Next;
    until (iRes>=0);
  end; //if dbgNaklot.Selection.SelectionType=gstRecordBookmarks
end;

function TdmdEx.GetDefaultVlad: integer;
begin
  if not cdsVlad.Active then begin
    OpenQuery(cdsVlad);
  end;
  //выбираем точное название для Укк
  if not cdsVlad.Locate('isdefault',1,[]) then begin
    raise Exception.Create('Не найдена фирма по умолчанию в справочнике фирм');
  end;
  //устанавливаем все фирмы кроме Укк
  Result := cdsVlad.FieldByName('id').asInteger;
end;

function TdmdEx.getrole: string;
begin
  result :=Trim(AnsiUpperCase(scUchet.Params.Values['RoleName']));
end;

function TdmdEx.GetWhereInList(DataSet: TDataSet;
  FieldName: string): string;
var
  sTemp :string;
begin
  DataSet.First;
  while not DataSet.Eof do begin
    sTemp := sTemp + DataSet.FieldByName(FieldName).asString+', ';
    DataSet.Next;
  end;
  sTemp:=copy(sTemp,1,Length(sTemp)-2);
  if Length(sTemp)>0 then begin
    sTemp := '  ( '+sTemp+ ' )';
  end;
  Result := sTemp;
end;

procedure TdmdEx.SetIntegerParamValue(Param: TParam; Value: string);
begin
  if (Value<>'') then begin
    Param.AsInteger:= strtoint(Value);
  end else begin
    Param.clear;
  end;
end;

procedure TdmdEx.ApplyChangesIfNeeded(DataSet: TDataSet);
begin
  if DataSet is TClientDataSet then  begin
    if TClientDataSet(DataSet).ProviderName='' then begin
      exit;
    end;
  end;
  ApplyOrCancel(DataSet);
end;

procedure ProcessSetColumnValue (dbgNaklot: TDBGridEh;param:variant;Object1:Pointer=nil);
begin
  dbgNaklot.DataSource.DataSet.Edit;
  SetFieldValue(dbgNaklot.SelectedField, param);
  dbgNaklot.DataSource.DataSet.Post;
end;

procedure ProcessIncColumnValue (dbgNaklot: TDBGridEh;param:variant;Object1:Pointer=nil);
begin
  dbgNaklot.DataSource.DataSet.Edit;
  SetFieldValue(dbgNaklot.SelectedField, dbgNaklot.SelectedField.Value+param);
  dbgNaklot.DataSource.DataSet.Post;
end;

function TdmdEx.UndeleteNaklo(Field: TIntegerField;
  actRefresh: TAction; KeyFieldName: String='id_nakl'): boolean;
begin
  Result := false;
  if Field.DataSet.Eof and Field.DataSet.Bof then begin
    exit;
  end;
  if (Field.AsInteger<>0) then begin
    dmdEx.sdsUndelete.Params.ParamByName('id_nakl').AsInteger :=
      Field.DataSet.fieldbyname(KeyFieldName).asInteger;
    dmdEx.ExecSQL(dmdEx.sdsUndelete, false);
    actRefresh.Execute;
    Result := true;
  end;
end;

function TdmdEx.PostNakl(Field: TIntegerField;sdsPost: TSqlDataSet;
  FieldIdNakl:TIntegerField;bAskConfirmationQuestion:boolean=true;
  bCanPostTwice:boolean=false): boolean;
begin
  Result:=false;
try
  if FieldIdNakl.AsInteger=0 then exit; //не выбран документ
  if ((Field.asInteger = 0) or (bCanPostTwice)) then begin
    if ((not bAskConfirmationQuestion) or
      (MessageDlg('Вы хотите провести документ?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes))
    then begin
      try
        dmdEx.StartWaiting;
        If Assigned(sdsPost.Params.FindParam('id_schet')) then begin
          sdsPost.Params.ParamByName('id_schet').Clear;
        end;
        sdsPost.Params.ParamByName('id_nakl').AsInteger :=
          FieldIdNakl.AsInteger;
        dmdEx.ExecSQL(sdsPost,false);
        Field.DataSet.edit;
        Field.AsInteger := 1;
        Field.DataSet.checkBrowseMode;
        ApplyOrCancel(Field.DataSet);
        Result :=true;
        dmdEx.StopWaiting;
        //cdsNaklo.ApplyUpdates(0);
      except
        on E:EDatabaseError do begin
          dmdEx.StopWaiting;
          if AnsiStartsText('no permission', e.message) and
            AnsiContainsText('_post_pc',e.message) then begin
            MessageDlg ('Вы не имеете права проводить документ',mtWarning,[mbOK],0);
            exit;
          end;
          if AnsiContainsText(e.Message,'Нельзя провести') then begin
            MessageDlg (e.Message,mtWarning,[mbOK],0);
            exit;
          end;
          showmessage (e.message);
          //AssertInternal ('4268E7DE-9567-4868-BF0D-875EDDF1E528 ' + e.message);
         end; //on
      end;  //try
    end; //if ok
  end else begin  //if posted
    MessageDlg ('Нельзя провести уже проведенный документ',mtWarning,[mbOK],0);
  end; //if posted
except
  AssertInternal('6296D856-8E2A-4798-93E1-95FED29C5033');
end; //try assert
end;

//если не служебный режим, то показать форму редактирования.
//после закрытия пересчитать документ
function TdmdEx.ShowDetail1(DataSet: TDataSet; frmEdit: TForm;
  actRecountNakl:TAction=nil): integer;
begin
  Result :=0;
  if DataSet.Tag <> 1 then begin
    if (frmEdit.Visible = false) then begin
      Result := frmEdit.ShowModal;
      if Result <>mrCancel then begin
        if Assigned(actRecountNakl) then begin
          actRecountNakl.Execute;
        end;
        Dataset.CheckBrowseMode;
      end;
      //RecountNakl;
    end;
  end;
end;

function TdmdEx.Defaultopen(DataSet: TDataSet; actRefresh: TAction;
  bGotoLast: boolean): boolean;
begin
	actRefresh.Execute;
  if  bGotoLast then begin
    DataSet.Last;
  end;
  Result :=false;
  if DataSet.Active then begin
    Result :=true;
  end;
end;

function TdmdEx.UnPostNakl(Field:TIntegerField; sdsUnPost:TSqlDataSet;
  FieldIdNakl:TIntegerField;bAskConfirmationQuestion:boolean=true):boolean;
begin
  Result:=false;
try
  if FieldIdNakl.AsInteger=0 then exit; //не выбран документ
  if Field.asInteger = 1 then begin
    if ((not bAskConfirmationQuestion) or
      (MessageDlg('Вы хотите вернуть документ?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes))
    then begin
      try
        dmdEx.StartWaiting;
        sdsUnPost.Params.ParamByName('id_nakl').AsInteger :=
          FieldIdNakl.AsInteger;
        dmdEx.ExecSQL(sdsUnPost,false);
        Field.DataSet.edit;
        Field.AsInteger := 0;
        Field.DataSet.checkBrowseMode;
        ApplyOrCancel(Field.DataSet);
        Result :=true;
        dmdEx.StopWaiting;
        //cdsNaklo.ApplyUpdates(0);
      except
        on E:EDatabaseError do begin
          dmdEx.StopWaiting;
          if AnsiStartsText('no permission', e.message) and
            AnsiContainsText('_unpost_pc',e.message) then begin
            MessageDlg ('Вы не имеете права возвращать документ',mtWarning,[mbOK],0);
            exit;
          end;
          if AnsiContainsText(e.Message,'Нельзя провести') then begin
            MessageDlg (e.Message,mtWarning,[mbOK],0);
            exit;
          end;
          //showmessage (e.message);
          AssertInternal ('2CAC15A9-AF7C-4C63-BBD0-7AE34CD5EED0');
         end; //on
      end;  //try
    end; //if ok
  end else begin  //if posted
    MessageDlg ('Нельзя вернуть не проведенный документ',mtWarning,[mbOK],0);
  end; //if posted
except
  AssertInternal('7D5C4700-233B-49B9-8CFA-1B3EA8F56FBB');
end; //try assert

end;

function TdmdEx.GetUser: string;
begin
  result :=Trim(AnsiUpperCase(scUchet.Params.Values['User_Name']));
end;

procedure TdmdEx.DataModuleDestroy(Sender: TObject);
begin
  Params.Free;
end;

function TdmdEx.GetParamCached(sParamName, sSql,
  sSqlResultFieldName: string): integer;
var
  sResult : string;
begin
  if params.IndexOfName(sParamName)=-1 then begin
    cdsTemp.Close;
    cdsTemp.CommandText := sSql;
    cdsTemp.Open;
    params.Add(sParamName+'='+cdsTemp.fieldByName(sSqlResultFieldName).asString);
  end;
  sResult := params.values[sParamName];
  if sResult = ''  then begin
    Result := 0;
  end else begin
    Result :=strtoint(sResult);
  end;
end;

function TdmdEx.GetParamCachedString(sParamName, sSql,
  sSqlResultFieldName: string): string;
begin
  if params.IndexOfName(sParamName)=-1 then begin
    cdsTemp.Close;
    cdsTemp.CommandText := sSql;
    cdsTemp.Open;
    params.Add(sParamName+'='+cdsTemp.fieldByName(sSqlResultFieldName).asString);
  end;
  Result := params.values[sParamName];
end;

function TdmdEx.FillScUchetParams(IniFile :TIniFile; sSection, sKey, sParamName:string):string;
var
  sDbPath : string;
  sDefaultValue : string;
begin
  sDefaultValue := scUchet.Params.Values[sParamName];
  sDbPath := IniFile.ReadString(sSection,sKey, sDefaultValue);
  scUchet.params.Values[sParamName] := sDbPath;
  result := sDbPath;
end;

procedure TdmdEx.LoadDbPath;
var
  IniFile : TIniFile;
begin
  IniFile :=TIniFile.Create(dmdEx.GetReportPath+'uchet.ini') ;
  try
    IniFile.WriteString(
      'DB','DBPath',
      FillScUchetParams(IniFile, 'DB','DBPath','Database'));
    IniFile.UpdateFile;
    FillScUchetParams(IniFile, 'DB','User_Name','User_Name');
    FillScUchetParams(IniFile, 'DB','Password','Password');
  finally
    IniFile.Free;
  end;
end;





procedure TdmdEx.DelmarkNaklo(id_nakl: integer);
begin
  cdsTemp.Close;
  cdsTemp.CommandText :=
    'update naklo om set om.delmarked=1 where om.id_nakl='
      +inttostr(id_nakl);
  cdsTemp.Execute;
  cdsTemp.Close;
end;

function TdmdEx.GetClientDetail(id_client:integer) :TClientDetail;
var
  strSql :string;
  cd1 : TClientDetail;
begin
  strSql := 'select k.fullname,k.tel, k.ipn, k.svreg,k.adrp, '+
  'lgoty, okpo '+
  'from klient_all_vw k '+
    'where k.id='+ inttostr(id_client);
  dmdEx.cdsTemp.Close;
  dmdEx.cdsTemp.CommandText := strSql;
  dmdEx.cdsTemp.Open;
  cd1.ipn := dmdEx.cdsTemp.FieldByName('ipn').AsString;
  cd1.tel := dmdEx.cdsTemp.FieldByName('tel').AsString;
  cd1.adrp := dmdEx.cdsTemp.FieldByName('adrp').AsString;
  cd1.svreg := dmdEx.cdsTemp.FieldByName('svreg').AsString;
  cd1.fullname := dmdEx.cdsTemp.FieldByName('fullname').AsString;
  cd1.lgoty := dmdEx.cdsTemp.FieldByName('lgoty').AsInteger;
  cd1.okpo := dmdEx.cdsTemp.FieldByName('okpo').AsString;
  dmdEx.cdsTemp.Close;
  Result := cd1;
end;

end.
