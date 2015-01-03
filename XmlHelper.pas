unit XmlHelper;



interface

uses
  XMLIntf,  //IXMLNodeCollection
  DB //TField

;

type
  TFormatNode = function (XMLNode : IXMLNode;Field:TField):string;

  procedure WriteNode(Node: IXMLNodeCollection;
    sNodeName: string; FormatNode :TFormatNode; Field:TField);

  function FormatNodeDateTime (XMLNode : IXMLNode;Field:TField):string;
  function FormatNodeString (XMLNode : IXMLNode;Field:TField):string;
  function FormatNodeStringIPN (XMLNode : IXMLNode;Field:TField):string;
  function FormatNodeFloat (XMLNode : IXMLNode;Field:TField):string;
  function FormatNodeFloatZero (XMLNode : IXMLNode;Field:TField):string;
  function FormatInteger (XMLNode : IXMLNode;Field:TField):string;
  function FormatInteger4Digits (XMLNode : IXMLNode;Field:TField):string;
  function  CheckIPN(DataSet :TDataSet;
    FieldName:String ='f6_ipn';
    FieldNameForFullName:String='f5_zak';
    FieldNameForID:String='F3_ID'):boolean;
  function FormatNodeFloat3Digits (XMLNode : IXMLNode;Field:TField):string;    
implementation

uses
  SysUtils, //FormatDateTime
  Windows, //GetThreadLocale
  Dialogs //showmessage
;

procedure WriteNode(Node: IXMLNodeCollection;
  sNodeName: string; FormatNode :TFormatNode; Field:TField);
var
  XMLNode : IXMLNode;
begin
  Field.DataSet.First;
  while not Field.DataSet.eof do begin
    XMLNode := Node.AddChild(sNodeName);
    XMLNode.Attributes['ROWNUM'] := Field.DataSet.FieldByName('F1_NPP').AsInteger;
    FormatNode(XMLNode,Field);
    Field.DataSet.Next;
  end;//while not eof
end;

function FormatNodeDateTime (XMLNode : IXMLNode;Field:TField):string;
begin
  Result := FormatDateTime('ddmmyyyy', Field.AsDateTime);
  XMLNode.NodeValue := Result;
end;

function FormatInteger (XMLNode : IXMLNode;Field:TField):string;
begin
  XMLNode.NodeValue := inttostr(Field.AsInteger);
end;

function AddLeadingZeroes(const aNumber, Length : integer) : string;
 begin
    result := SysUtils.Format('%.*d', [Length, aNumber]) ;
 end;

function FormatInteger4Digits (XMLNode : IXMLNode;Field:TField):string;
begin
  XMLNode.NodeValue := AddLeadingZeroes(Field.AsInteger, 4);
end;

function FormatNodeString (XMLNode : IXMLNode;Field:TField):string;
begin
  Result := Field.asString;
  XMLNode.NodeValue := Result;
end;

function FormatNodeStringIPN (XMLNode : IXMLNode;Field:TField):string;
begin
  Result := Field.asString;
  if Result='0' then begin
    XMLNode.Attributes['xsi:nil']:='true';
  end else begin
    XMLNode.NodeValue := Result;
  end;
end;

function FormatNodeFloat3Digits (XMLNode : IXMLNode;Field:TField):string;
var
  FormatSettings : TFormatSettings;
begin
  //чтобы цифры сохранялись в xml с точкой, а не запятой
  GetLocaleFormatSettings(GetThreadLocale, FormatSettings);
  FormatSettings.DecimalSeparator:='.';
  Result :=FormatFloat('0.000', Field.asFloat, FormatSettings);
  XMLNode.NodeValue := Result;
end;

function FormatNodeFloat (XMLNode : IXMLNode;Field:TField):string;
var
  FormatSettings : TFormatSettings;
begin
  //чтобы цифры сохранялись в xml с точкой, а не запятой
  GetLocaleFormatSettings(GetThreadLocale,FormatSettings);
  FormatSettings.DecimalSeparator:='.';
  Result :=FormatFloat('0.00',Field.asFloat,FormatSettings);
  XMLNode.NodeValue := Result;
end;

function FormatNodeFloatZero (XMLNode : IXMLNode;Field:TField):string;
var
  FormatSettings : TFormatSettings;
begin
  //чтобы цифры сохранялись в xml с точкой, а не запятой
  GetLocaleFormatSettings(GetThreadLocale,FormatSettings);
  FormatSettings.DecimalSeparator:='.';
  Result :=FormatFloat('0.00',0,FormatSettings);
  XMLNode.NodeValue := Result;
end;

function CheckIPN(DataSet :TDataSet;
  FieldName:String ='f6_ipn';
  FieldNameForFullName:String='f5_zak';
  FieldNameForID:String='F3_ID'):boolean;
begin
  Result := true;
  dataset.first;
  while not dataset.eof do begin
    if ((Length(dataset.FieldByName(FieldName).asString)<4) and
      (dataset.FieldByName(FieldName).asString<>'0'))
    then begin
      showmessage ('В накладной №'+dataset.FieldByName(FieldNameForID).asstring +
        ' от ' + dataset.FieldByName('F2_dat').asstring+ ' для фирмы ' +
        dataset.FieldByName(FieldNameForFullName).asstring +
        ' не указан ИНН в справочнике клиентов');
      Result := false;
      exit;
    end;
    dataset.next;
  end;
end;

end.
