////////////////////////////////////////////////////////////////////////////////
//             ATSTest - иллюстрация комплексной обработки исключений
//                             (c) Николай Мазуркин
//    http://mazurkin.virtualave.net, mazurkin@mailru.com, mazurkin@chat.ru
// _____________________________________________________________________________
//                      Процедуры обработки фатальных ошибок
////////////////////////////////////////////////////////////////////////////////

unit ATSAssert;

interface

uses
  Windows, SysUtils, Forms,
  Graphics, //для TBitmap
  Classes, //для TStringList
  Jpeg;

////////////////////////////////////////////////////////////////////////////////
// Процедуры обработки фатальных ситуаций
////////////////////////////////////////////////////////////////////////////////
procedure AssertMsg(Condition: Boolean; const Mark: string);
procedure AssertWin32(Condition: Boolean; const Mark: string);
function  AssertInternal(const Mark: string): TObject;
procedure SendScreenImageToFile(FileName : string;
  format:integer=0;
  quality:TJPEGQualityRange=100);
function ExceptionClassTree(E: TObject):string;
function CollectComputerName: string;
function CollectUserName: string;

implementation


////////////////////////////////////////////////////////////////////////////////
// Обработка ошибочной ситуации
////////////////////////////////////////////////////////////////////////////////
procedure HandleError(const Msg: string);
var
//  DeadFile : TextFile;
  DeadName : string;
  ErrorMsg : string;
  //bmp: TBitmap;
  sTree : string;
  ScreenActiveFormName : string;
  sl: TStringList;
begin
  // Формируем сообщение
  ErrorMsg := Msg + #13#10#13#10;
  // Если это исключение, то добавим его тип и адрес
  if ExceptObject <> nil then begin
    ErrorMsg := ErrorMsg + Format('Исключение типа %s, адрес 0x%8.8x'#13#10#13#10,
      [ExceptObject.ClassName, DWord(ExceptAddr)]
    );
    sTree:= ExceptionClassTree(ExceptObject);
    //ExceptObject.Free;
  end;

  //by unf
  //  ErrorMsg := ErrorMsg + 'Выполнение программы будет прекращено.';
    if (screen.activeForm <> nil) then begin
       ScreenActiveFormName := Screen.ActiveForm.Name;
    end else begin
       ScreenActiveFormName := 'NoForm';
    end;
    DeadName := ExtractFilePath(Application.ExeName)+
        ExtractFilename(Application.ExeName)+'_' +
        ScreenActiveFormName +
        FormatDateTime('_ddmmyyyy_hhnnss',now) +
        '_debug';
    SendScreenImageToFile(DeadName,1,30);
  // Показываем диалог
  MessageBox(0, PChar(ErrorMsg),
    'Фатальная ошибка', MB_OK+MB_ICONWARNING+MB_APPLMODAL+MB_SETFOREGROUND+MB_TOPMOST);
  // Генерируем уникальное имя файла
    //SetLength(DeadName, MAX_PATH+10);
    //GetTempFileName(PChar(ExtractFilePath(ParamStr(0))), 'err', 0, @DeadName[1]);

  sl := tstringlist.Create;
  sl.add('--- This report is created by automated reporting system.');
  sl.add('Computer name is: ['+CollectComputerName+']');
  sl.add('User name is: ['+CollectUserName+']');
  sl.add('Error class tree: ['+sTree+']');
  sl.Add(ErrorMsg);
  sl.add('--- End of report ---------------------------------------');
  sl.SaveToFile(DeadName+'.txt');
  FreeAndNil(sl);

  // Записываем ошибку в посмертный лог - на случай если пользователь не догадается
  // записать код ошибки и сообщение.
//  AssignFile(DeadFile, DeadName);
//  ReWrite(DeadFile);
//  WriteLn(DeadFile, ErrorMsg);
//  CloseFile(DeadFile);

  // Немедленно закрываем процесс
  //ExitProcess(1);
end;

////////////////////////////////////////////////////////////////////////////////
// TExceptHandler
// _____________________________________________________________________________
// Глобальный обработчик необработанных локально исключений
////////////////////////////////////////////////////////////////////////////////
type
  TExceptHandler = class (TObject)
    procedure   OnException(Sender: TObject; E: Exception);
  end;

var
  ExceptHandler : TExceptHandler;

////////////////////////////////////////////////////////////////////////////////
// Обработка исключений
////////////////////////////////////////////////////////////////////////////////
procedure TExceptHandler.OnException(Sender: TObject; E: Exception);
begin
  HandleError(PChar(E.Message));
end;

////////////////////////////////////////////////////////////////////////////////
// ATSAssert
// _____________________________________________________________________________
// Процедуры обработки фатальных ситуаций
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Проверка выполнимости условия
////////////////////////////////////////////////////////////////////////////////
procedure AssertMsg(Condition: Boolean; const Mark: string);
begin
  // Если условие выполняется, то выходим сразу
  if Condition then Exit;
  // Обрабатываем возникшую ошибку
  HandleError('Фатальная ошибка '+Mark);
end;

////////////////////////////////////////////////////////////////////////////////
// Проверка выполнимости API-функции
////////////////////////////////////////////////////////////////////////////////
procedure AssertWin32(Condition: Boolean; const Mark: string);
var
  ErrorMsg : string;
begin
  // Если условие выполняется, то выходим
  if Condition then Exit;
  // Получаем сообщение об ошибке
  ErrorMsg := SysErrorMessage(GetLastError);
  // Обрабатываем возникшую ошибку
  HandleError('Фатальная ошибка '+Mark+#13#13+ErrorMsg);
end;

////////////////////////////////////////////////////////////////////////////////
// Генерация фатального исключения
////////////////////////////////////////////////////////////////////////////////
function AssertInternal(const Mark: string): TObject;
begin
  // Проверяем тип сгенерированного исключения и обрабатываем возникшую ошибку
  if ExceptObject is Exception then
    HandleError('Ошибка '+Mark+#13#10#13#10+PChar(Exception(ExceptObject).Message))
  else
    HandleError('Ошибка '+Mark);
  // Следующая строчка никогда не выполнится, она нужна только для успокоения компилятора
  Result := nil
  //ExceptObject;
  //nil;
end;

////////////////////////////////////////////////////
//Запись экрана в файл
////////////////////////////////////////////////////
procedure SendScreenImageToFile(FileName : string;
  format:integer=0;
  quality:TJPEGQualityRange=100);
var BMP: TBitmap;
    JPG: TJPEGImage;
begin
  try
//    if FFullScreen then
//      begin
        BMP := TBitmap.Create;
        BMP.Width:= Screen.Width;
        BMP.Height:= Screen.Height;
        BitBlt(BMP.Canvas.Handle, 0, 0, BMP.Width, BMP.Height,
          GetDC(GetDesktopWindow), 0, 0, SRCCOPY);
//      end
//      else BMP := Screen.ActiveForm.GetFormImage;
    if format=1 then begin
      JPG := TJPEGImage.Create;
      JPG.CompressionQuality := quality;
      JPG.Assign(bmp);
      JPG.SaveToFile(FileName + '.jpg');
      FreeAndNil(jpg);
    end
    else BMP.SaveToFile(FileName + '.bmp');
  finally
    FreeAndNil(BMP);
  end;
end;

///////////////////////////////////////////
//  дерево для класса ошибки
////////////////////////////////////////
function ExceptionClassTree(E: TObject):string;
var
  ClassThree: String; {строка с деревом классов}
  ClassRef : TClass;
begin
  ClassThree := E.ClassName;
  ClassRef := E.ClassType;
  while ClassRef.ClassParent <> nil do
  begin
    ClassRef := ClassRef.ClassParent;
    ClassThree := ClassRef.ClassName + ' => ' + ClassThree;
  end;
  Result :=ClassThree;
end;

///////////////////////////////
//Имя пользователя
/////////////////////////////
function CollectUserName: string;
var
  uname: pchar;
  unsiz: cardinal;
begin
  uname := StrAlloc(255);
  unsiz := 254;
  GetUserName(uname,unsiz);
  if (unsiz > 0) then
    Result := string(uname) else
    Result := 'n/a';
  StrDispose(uname);
end;

///////////////////////////////
//Имя компьютера
/////////////////////////////
function CollectComputerName: string;
var
  cname: pchar;
  cnsiz: cardinal;
begin
  cname := StrAlloc(MAX_COMPUTERNAME_LENGTH + 1);
  cnsiz := MAX_COMPUTERNAME_LENGTH + 1;
  GetComputerName(cname,cnsiz);
  if (cnsiz > 0) then
    Result := string(cname) else
    Result := 'n/a';
  StrDispose(cname);
end;

////////////////////////////////////////////////////////////////////////////////
// Автоматическое создание глобального обработчика исключений
////////////////////////////////////////////////////////////////////////////////
initialization
  ExceptHandler := TExceptHandler.Create;
  Application.OnException := ExceptHandler.OnException;

end.
