////////////////////////////////////////////////////////////////////////////////
//             ATSTest - ����������� ����������� ��������� ����������
//                             (c) ������� ��������
//    http://mazurkin.virtualave.net, mazurkin@mailru.com, mazurkin@chat.ru
// _____________________________________________________________________________
//                      ��������� ��������� ��������� ������
////////////////////////////////////////////////////////////////////////////////

unit ATSAssert;

interface

uses
  Windows, SysUtils, Forms,
  Graphics, //��� TBitmap
  Classes, //��� TStringList
  Jpeg;

////////////////////////////////////////////////////////////////////////////////
// ��������� ��������� ��������� ��������
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
// ��������� ��������� ��������
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
  // ��������� ���������
  ErrorMsg := Msg + #13#10#13#10;
  // ���� ��� ����������, �� ������� ��� ��� � �����
  if ExceptObject <> nil then begin
    ErrorMsg := ErrorMsg + Format('���������� ���� %s, ����� 0x%8.8x'#13#10#13#10,
      [ExceptObject.ClassName, DWord(ExceptAddr)]
    );
    sTree:= ExceptionClassTree(ExceptObject);
    //ExceptObject.Free;
  end;

  //by unf
  //  ErrorMsg := ErrorMsg + '���������� ��������� ����� ����������.';
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
  // ���������� ������
  MessageBox(0, PChar(ErrorMsg),
    '��������� ������', MB_OK+MB_ICONWARNING+MB_APPLMODAL+MB_SETFOREGROUND+MB_TOPMOST);
  // ���������� ���������� ��� �����
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

  // ���������� ������ � ���������� ��� - �� ������ ���� ������������ �� ����������
  // �������� ��� ������ � ���������.
//  AssignFile(DeadFile, DeadName);
//  ReWrite(DeadFile);
//  WriteLn(DeadFile, ErrorMsg);
//  CloseFile(DeadFile);

  // ���������� ��������� �������
  //ExitProcess(1);
end;

////////////////////////////////////////////////////////////////////////////////
// TExceptHandler
// _____________________________________________________________________________
// ���������� ���������� �������������� �������� ����������
////////////////////////////////////////////////////////////////////////////////
type
  TExceptHandler = class (TObject)
    procedure   OnException(Sender: TObject; E: Exception);
  end;

var
  ExceptHandler : TExceptHandler;

////////////////////////////////////////////////////////////////////////////////
// ��������� ����������
////////////////////////////////////////////////////////////////////////////////
procedure TExceptHandler.OnException(Sender: TObject; E: Exception);
begin
  HandleError(PChar(E.Message));
end;

////////////////////////////////////////////////////////////////////////////////
// ATSAssert
// _____________________________________________________________________________
// ��������� ��������� ��������� ��������
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// �������� ������������ �������
////////////////////////////////////////////////////////////////////////////////
procedure AssertMsg(Condition: Boolean; const Mark: string);
begin
  // ���� ������� �����������, �� ������� �����
  if Condition then Exit;
  // ������������ ��������� ������
  HandleError('��������� ������ '+Mark);
end;

////////////////////////////////////////////////////////////////////////////////
// �������� ������������ API-�������
////////////////////////////////////////////////////////////////////////////////
procedure AssertWin32(Condition: Boolean; const Mark: string);
var
  ErrorMsg : string;
begin
  // ���� ������� �����������, �� �������
  if Condition then Exit;
  // �������� ��������� �� ������
  ErrorMsg := SysErrorMessage(GetLastError);
  // ������������ ��������� ������
  HandleError('��������� ������ '+Mark+#13#13+ErrorMsg);
end;

////////////////////////////////////////////////////////////////////////////////
// ��������� ���������� ����������
////////////////////////////////////////////////////////////////////////////////
function AssertInternal(const Mark: string): TObject;
begin
  // ��������� ��� ���������������� ���������� � ������������ ��������� ������
  if ExceptObject is Exception then
    HandleError('������ '+Mark+#13#10#13#10+PChar(Exception(ExceptObject).Message))
  else
    HandleError('������ '+Mark);
  // ��������� ������� ������� �� ����������, ��� ����� ������ ��� ���������� �����������
  Result := nil
  //ExceptObject;
  //nil;
end;

////////////////////////////////////////////////////
//������ ������ � ����
////////////////////////////////////////////////////
procedure SendScreenImageToFile(FileName : string;
  format:integer=0;
  quality:TJPEGQualityRange=100);
var BMP: TBitmap;
    JPG: TJPEGImage;
begin
  try
//� � if FFullScreen then
//� � � begin
        BMP := TBitmap.Create;
        BMP.Width:= Screen.Width;
        BMP.Height:= Screen.Height;
        BitBlt(BMP.Canvas.Handle, 0, 0, BMP.Width, BMP.Height,
          GetDC(GetDesktopWindow), 0, 0, SRCCOPY);
//� � � end
//� � � else BMP := Screen.ActiveForm.GetFormImage;
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
//  ������ ��� ������ ������
////////////////////////////////////////
function ExceptionClassTree(E: TObject):string;
var
  ClassThree: String; {������ � ������� �������}
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
//��� ������������
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
//��� ����������
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
// �������������� �������� ����������� ����������� ����������
////////////////////////////////////////////////////////////////////////////////
initialization
  ExceptHandler := TExceptHandler.Create;
  Application.OnException := ExceptHandler.OnException;

end.
