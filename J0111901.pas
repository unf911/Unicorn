
{*************************************************************}
{                                                             }
{                      XML Data Binding                       }
{                                                             }
{         Generated on: 02.04.2012 22:51:36                   }
{       Generated from: D:\data\work\UniSebest\J0111901.xsd   }
{   Settings stored in: D:\data\work\UniSebest\J0111901.xdb   }
{                                                             }
{*************************************************************}

unit J0111901;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLDeclarContent = interface;
  IXMLDHead = interface;
  IXMLLINKED_DOCS = interface;
  IXMLDOC = interface;
  IXMLDBody = interface;
  IXMLStrColumn = interface;
  IXMLStrColumnList = interface;
  IXMLTinColumn = interface;
  IXMLTinColumnList = interface;
  IXMLDecimal2Column = interface;
  IXMLDecimal2ColumnList = interface;
  IXMLEDRPOUColumn = interface;
  IXMLEDRPOUColumnList = interface;

{ IXMLDeclarContent }

  IXMLDeclarContent = interface(IXMLNode)
    ['{4CEE228E-22DC-47CB-84BE-C3D983523779}']
    { Property Accessors }
    function Get_DECLARHEAD: IXMLDHead;
    function Get_DECLARBODY: IXMLDBody;
    { Methods & Properties }
    property DECLARHEAD: IXMLDHead read Get_DECLARHEAD;
    property DECLARBODY: IXMLDBody read Get_DECLARBODY;
  end;

{ IXMLDHead }

  IXMLDHead = interface(IXMLNode)
    ['{A22AA8A2-B62D-4759-8B54-B3621D2908E8}']
    { Property Accessors }
    function Get_TIN: WideString;
    function Get_C_DOC: WideString;
    function Get_C_DOC_SUB: WideString;
    function Get_C_DOC_VER: WideString;
    function Get_C_DOC_TYPE: LongWord;
    function Get_C_DOC_CNT: LongWord;
    function Get_C_REG: Integer;
    function Get_C_RAJ: Integer;
    function Get_PERIOD_MONTH: Integer;
    function Get_PERIOD_TYPE: Integer;
    function Get_PERIOD_YEAR: Integer;
    function Get_C_STI_ORIG: Integer;
    function Get_C_DOC_STAN: Integer;
    function Get_LINKED_DOCS: IXMLLINKED_DOCS;
    function Get_D_FILL: WideString;
    function Get_SOFTWARE: WideString;
    procedure Set_TIN(Value: WideString);
    procedure Set_C_DOC(Value: WideString);
    procedure Set_C_DOC_SUB(Value: WideString);
    procedure Set_C_DOC_VER(Value: WideString);
    procedure Set_C_DOC_TYPE(Value: LongWord);
    procedure Set_C_DOC_CNT(Value: LongWord);
    procedure Set_C_REG(Value: Integer);
    procedure Set_C_RAJ(Value: Integer);
    procedure Set_PERIOD_MONTH(Value: Integer);
    procedure Set_PERIOD_TYPE(Value: Integer);
    procedure Set_PERIOD_YEAR(Value: Integer);
    procedure Set_C_STI_ORIG(Value: Integer);
    procedure Set_C_DOC_STAN(Value: Integer);
    procedure Set_D_FILL(Value: WideString);
    procedure Set_SOFTWARE(Value: WideString);
    { Methods & Properties }
    property TIN: WideString read Get_TIN write Set_TIN;
    property C_DOC: WideString read Get_C_DOC write Set_C_DOC;
    property C_DOC_SUB: WideString read Get_C_DOC_SUB write Set_C_DOC_SUB;
    property C_DOC_VER: WideString read Get_C_DOC_VER write Set_C_DOC_VER;
    property C_DOC_TYPE: LongWord read Get_C_DOC_TYPE write Set_C_DOC_TYPE;
    property C_DOC_CNT: LongWord read Get_C_DOC_CNT write Set_C_DOC_CNT;
    property C_REG: Integer read Get_C_REG write Set_C_REG;
    property C_RAJ: Integer read Get_C_RAJ write Set_C_RAJ;
    property PERIOD_MONTH: Integer read Get_PERIOD_MONTH write Set_PERIOD_MONTH;
    property PERIOD_TYPE: Integer read Get_PERIOD_TYPE write Set_PERIOD_TYPE;
    property PERIOD_YEAR: Integer read Get_PERIOD_YEAR write Set_PERIOD_YEAR;
    property C_STI_ORIG: Integer read Get_C_STI_ORIG write Set_C_STI_ORIG;
    property C_DOC_STAN: Integer read Get_C_DOC_STAN write Set_C_DOC_STAN;
    property LINKED_DOCS: IXMLLINKED_DOCS read Get_LINKED_DOCS;
    property D_FILL: WideString read Get_D_FILL write Set_D_FILL;
    property SOFTWARE: WideString read Get_SOFTWARE write Set_SOFTWARE;
  end;

{ IXMLLINKED_DOCS }

  IXMLLINKED_DOCS = interface(IXMLNodeCollection)
    ['{4C9B860D-DA5E-4ACF-92EC-E658DBE53A76}']
    { Property Accessors }
    function Get_DOC(Index: Integer): IXMLDOC;
    { Methods & Properties }
    function Add: IXMLDOC;
    function Insert(const Index: Integer): IXMLDOC;
    property DOC[Index: Integer]: IXMLDOC read Get_DOC; default;
  end;

{ IXMLDOC }

  IXMLDOC = interface(IXMLNode)
    ['{5403F52A-B6A0-43AA-B803-2CCF96478D25}']
    { Property Accessors }
    function Get_NUM: LongWord;
    function Get_TYPE_: LongWord;
    function Get_C_DOC: WideString;
    function Get_C_DOC_SUB: WideString;
    function Get_C_DOC_VER: WideString;
    function Get_C_DOC_TYPE: LongWord;
    function Get_C_DOC_CNT: LongWord;
    function Get_C_DOC_STAN: Integer;
    function Get_FILENAME: WideString;
    procedure Set_NUM(Value: LongWord);
    procedure Set_TYPE_(Value: LongWord);
    procedure Set_C_DOC(Value: WideString);
    procedure Set_C_DOC_SUB(Value: WideString);
    procedure Set_C_DOC_VER(Value: WideString);
    procedure Set_C_DOC_TYPE(Value: LongWord);
    procedure Set_C_DOC_CNT(Value: LongWord);
    procedure Set_C_DOC_STAN(Value: Integer);
    procedure Set_FILENAME(Value: WideString);
    { Methods & Properties }
    property NUM: LongWord read Get_NUM write Set_NUM;
    property TYPE_: LongWord read Get_TYPE_ write Set_TYPE_;
    property C_DOC: WideString read Get_C_DOC write Set_C_DOC;
    property C_DOC_SUB: WideString read Get_C_DOC_SUB write Set_C_DOC_SUB;
    property C_DOC_VER: WideString read Get_C_DOC_VER write Set_C_DOC_VER;
    property C_DOC_TYPE: LongWord read Get_C_DOC_TYPE write Set_C_DOC_TYPE;
    property C_DOC_CNT: LongWord read Get_C_DOC_CNT write Set_C_DOC_CNT;
    property C_DOC_STAN: Integer read Get_C_DOC_STAN write Set_C_DOC_STAN;
    property FILENAME: WideString read Get_FILENAME write Set_FILENAME;
  end;

{ IXMLDBody }

  IXMLDBody = interface(IXMLNode)
    ['{C544D0B8-130F-4B1A-90CC-1A383E438ED8}']
    { Property Accessors }
    function Get_HZ: Integer;
    function Get_HZN: Integer;
    function Get_HZU: Integer;
    function Get_HZK: Integer;
    function Get_HTIN: WideString;
    function Get_HZY: Integer;
    function Get_H1KV: Integer;
    function Get_HHY: Integer;
    function Get_H3KV: Integer;
    function Get_HY: Integer;
    function Get_T11RXXXXG2S: IXMLStrColumnList;
    function Get_T11RXXXXG3: IXMLTinColumnList;
    function Get_T11RXXXXG4: IXMLDecimal2ColumnList;
    function Get_R011G4: WideString;
    function Get_T12RXXXXG2S: IXMLStrColumnList;
    function Get_T12RXXXXG3: IXMLEDRPOUColumnList;
    function Get_T12RXXXXG4: IXMLDecimal2ColumnList;
    function Get_R012G4: WideString;
    function Get_R001G4: WideString;
    function Get_T21RXXXXG2S: IXMLStrColumnList;
    function Get_T21RXXXXG3: IXMLTinColumnList;
    function Get_T21RXXXXG4: IXMLDecimal2ColumnList;
    function Get_R021G4: WideString;
    function Get_T22RXXXXG2S: IXMLStrColumnList;
    function Get_T22RXXXXG3: IXMLEDRPOUColumnList;
    function Get_T22RXXXXG4: IXMLDecimal2ColumnList;
    function Get_R022G4: WideString;
    function Get_R002G4: WideString;
    function Get_HBOS: WideString;
    function Get_HBUH: WideString;
    procedure Set_HZ(Value: Integer);
    procedure Set_HZN(Value: Integer);
    procedure Set_HZU(Value: Integer);
    procedure Set_HZK(Value: Integer);
    procedure Set_HTIN(Value: WideString);
    procedure Set_HZY(Value: Integer);
    procedure Set_H1KV(Value: Integer);
    procedure Set_HHY(Value: Integer);
    procedure Set_H3KV(Value: Integer);
    procedure Set_HY(Value: Integer);
    procedure Set_R011G4(Value: WideString);
    procedure Set_R012G4(Value: WideString);
    procedure Set_R001G4(Value: WideString);
    procedure Set_R021G4(Value: WideString);
    procedure Set_R022G4(Value: WideString);
    procedure Set_R002G4(Value: WideString);
    procedure Set_HBOS(Value: WideString);
    procedure Set_HBUH(Value: WideString);
    { Methods & Properties }
    property HZ: Integer read Get_HZ write Set_HZ;
    property HZN: Integer read Get_HZN write Set_HZN;
    property HZU: Integer read Get_HZU write Set_HZU;
    property HZK: Integer read Get_HZK write Set_HZK;
    property HTIN: WideString read Get_HTIN write Set_HTIN;
    property HZY: Integer read Get_HZY write Set_HZY;
    property H1KV: Integer read Get_H1KV write Set_H1KV;
    property HHY: Integer read Get_HHY write Set_HHY;
    property H3KV: Integer read Get_H3KV write Set_H3KV;
    property HY: Integer read Get_HY write Set_HY;
    property T11RXXXXG2S: IXMLStrColumnList read Get_T11RXXXXG2S;
    property T11RXXXXG3: IXMLTinColumnList read Get_T11RXXXXG3;
    property T11RXXXXG4: IXMLDecimal2ColumnList read Get_T11RXXXXG4;
    property R011G4: WideString read Get_R011G4 write Set_R011G4;
    property T12RXXXXG2S: IXMLStrColumnList read Get_T12RXXXXG2S;
    property T12RXXXXG3: IXMLEDRPOUColumnList read Get_T12RXXXXG3;
    property T12RXXXXG4: IXMLDecimal2ColumnList read Get_T12RXXXXG4;
    property R012G4: WideString read Get_R012G4 write Set_R012G4;
    property R001G4: WideString read Get_R001G4 write Set_R001G4;
    property T21RXXXXG2S: IXMLStrColumnList read Get_T21RXXXXG2S;
    property T21RXXXXG3: IXMLTinColumnList read Get_T21RXXXXG3;
    property T21RXXXXG4: IXMLDecimal2ColumnList read Get_T21RXXXXG4;
    property R021G4: WideString read Get_R021G4 write Set_R021G4;
    property T22RXXXXG2S: IXMLStrColumnList read Get_T22RXXXXG2S;
    property T22RXXXXG3: IXMLEDRPOUColumnList read Get_T22RXXXXG3;
    property T22RXXXXG4: IXMLDecimal2ColumnList read Get_T22RXXXXG4;
    property R022G4: WideString read Get_R022G4 write Set_R022G4;
    property R002G4: WideString read Get_R002G4 write Set_R002G4;
    property HBOS: WideString read Get_HBOS write Set_HBOS;
    property HBUH: WideString read Get_HBUH write Set_HBUH;
  end;

{ IXMLStrColumn }

  IXMLStrColumn = interface(IXMLNode)
    ['{7992A84C-A951-42A2-A056-930AF2F610F7}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLStrColumnList }

  IXMLStrColumnList = interface(IXMLNodeCollection)
    ['{AF7D1130-08A4-4793-A967-AB52864EEFA1}']
    { Methods & Properties }
    function Add: IXMLStrColumn;
    function Insert(const Index: Integer): IXMLStrColumn;
    function Get_Item(Index: Integer): IXMLStrColumn;
    property Items[Index: Integer]: IXMLStrColumn read Get_Item; default;
  end;

{ IXMLTinColumn }

  IXMLTinColumn = interface(IXMLNode)
    ['{CC1DA1E7-4B53-4AA4-A1E6-1C9EE6420C0A}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLTinColumnList }

  IXMLTinColumnList = interface(IXMLNodeCollection)
    ['{ADB12219-27DC-4348-AAF1-174787AE1249}']
    { Methods & Properties }
    function Add: IXMLTinColumn;
    function Insert(const Index: Integer): IXMLTinColumn;
    function Get_Item(Index: Integer): IXMLTinColumn;
    property Items[Index: Integer]: IXMLTinColumn read Get_Item; default;
  end;

{ IXMLDecimal2Column }

  IXMLDecimal2Column = interface(IXMLNode)
    ['{4E1A8E3A-C513-43F6-B6B0-80ECFD5DFC49}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLDecimal2ColumnList }

  IXMLDecimal2ColumnList = interface(IXMLNodeCollection)
    ['{484B1A2E-E545-415D-91C4-E1650AAAD0CC}']
    { Methods & Properties }
    function Add: IXMLDecimal2Column;
    function Insert(const Index: Integer): IXMLDecimal2Column;
    function Get_Item(Index: Integer): IXMLDecimal2Column;
    property Items[Index: Integer]: IXMLDecimal2Column read Get_Item; default;
  end;

{ IXMLEDRPOUColumn }

  IXMLEDRPOUColumn = interface(IXMLNode)
    ['{E8069A91-CAF7-4175-971D-FAD204F85FFF}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLEDRPOUColumnList }

  IXMLEDRPOUColumnList = interface(IXMLNodeCollection)
    ['{8CCFC4BE-1722-4A19-B35F-5B70AE0442ED}']
    { Methods & Properties }
    function Add: IXMLEDRPOUColumn;
    function Insert(const Index: Integer): IXMLEDRPOUColumn;
    function Get_Item(Index: Integer): IXMLEDRPOUColumn;
    property Items[Index: Integer]: IXMLEDRPOUColumn read Get_Item; default;
  end;

{ Forward Decls }

  TXMLDeclarContent = class;
  TXMLDHead = class;
  TXMLLINKED_DOCS = class;
  TXMLDOC = class;
  TXMLDBody = class;
  TXMLStrColumn = class;
  TXMLStrColumnList = class;
  TXMLTinColumn = class;
  TXMLTinColumnList = class;
  TXMLDecimal2Column = class;
  TXMLDecimal2ColumnList = class;
  TXMLEDRPOUColumn = class;
  TXMLEDRPOUColumnList = class;

{ TXMLDeclarContent }

  TXMLDeclarContent = class(TXMLNode, IXMLDeclarContent)
  protected
    { IXMLDeclarContent }
    function Get_DECLARHEAD: IXMLDHead;
    function Get_DECLARBODY: IXMLDBody;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDHead }

  TXMLDHead = class(TXMLNode, IXMLDHead)
  protected
    { IXMLDHead }
    function Get_TIN: WideString;
    function Get_C_DOC: WideString;
    function Get_C_DOC_SUB: WideString;
    function Get_C_DOC_VER: WideString;
    function Get_C_DOC_TYPE: LongWord;
    function Get_C_DOC_CNT: LongWord;
    function Get_C_REG: Integer;
    function Get_C_RAJ: Integer;
    function Get_PERIOD_MONTH: Integer;
    function Get_PERIOD_TYPE: Integer;
    function Get_PERIOD_YEAR: Integer;
    function Get_C_STI_ORIG: Integer;
    function Get_C_DOC_STAN: Integer;
    function Get_LINKED_DOCS: IXMLLINKED_DOCS;
    function Get_D_FILL: WideString;
    function Get_SOFTWARE: WideString;
    procedure Set_TIN(Value: WideString);
    procedure Set_C_DOC(Value: WideString);
    procedure Set_C_DOC_SUB(Value: WideString);
    procedure Set_C_DOC_VER(Value: WideString);
    procedure Set_C_DOC_TYPE(Value: LongWord);
    procedure Set_C_DOC_CNT(Value: LongWord);
    procedure Set_C_REG(Value: Integer);
    procedure Set_C_RAJ(Value: Integer);
    procedure Set_PERIOD_MONTH(Value: Integer);
    procedure Set_PERIOD_TYPE(Value: Integer);
    procedure Set_PERIOD_YEAR(Value: Integer);
    procedure Set_C_STI_ORIG(Value: Integer);
    procedure Set_C_DOC_STAN(Value: Integer);
    procedure Set_D_FILL(Value: WideString);
    procedure Set_SOFTWARE(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLLINKED_DOCS }

  TXMLLINKED_DOCS = class(TXMLNodeCollection, IXMLLINKED_DOCS)
  protected
    { IXMLLINKED_DOCS }
    function Get_DOC(Index: Integer): IXMLDOC;
    function Add: IXMLDOC;
    function Insert(const Index: Integer): IXMLDOC;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDOC }

  TXMLDOC = class(TXMLNode, IXMLDOC)
  protected
    { IXMLDOC }
    function Get_NUM: LongWord;
    function Get_TYPE_: LongWord;
    function Get_C_DOC: WideString;
    function Get_C_DOC_SUB: WideString;
    function Get_C_DOC_VER: WideString;
    function Get_C_DOC_TYPE: LongWord;
    function Get_C_DOC_CNT: LongWord;
    function Get_C_DOC_STAN: Integer;
    function Get_FILENAME: WideString;
    procedure Set_NUM(Value: LongWord);
    procedure Set_TYPE_(Value: LongWord);
    procedure Set_C_DOC(Value: WideString);
    procedure Set_C_DOC_SUB(Value: WideString);
    procedure Set_C_DOC_VER(Value: WideString);
    procedure Set_C_DOC_TYPE(Value: LongWord);
    procedure Set_C_DOC_CNT(Value: LongWord);
    procedure Set_C_DOC_STAN(Value: Integer);
    procedure Set_FILENAME(Value: WideString);
  end;

{ TXMLDBody }

  TXMLDBody = class(TXMLNode, IXMLDBody)
  private
    FT11RXXXXG2S: IXMLStrColumnList;
    FT11RXXXXG3: IXMLTinColumnList;
    FT11RXXXXG4: IXMLDecimal2ColumnList;
    FT12RXXXXG2S: IXMLStrColumnList;
    FT12RXXXXG3: IXMLEDRPOUColumnList;
    FT12RXXXXG4: IXMLDecimal2ColumnList;
    FT21RXXXXG2S: IXMLStrColumnList;
    FT21RXXXXG3: IXMLTinColumnList;
    FT21RXXXXG4: IXMLDecimal2ColumnList;
    FT22RXXXXG2S: IXMLStrColumnList;
    FT22RXXXXG3: IXMLEDRPOUColumnList;
    FT22RXXXXG4: IXMLDecimal2ColumnList;
  protected
    { IXMLDBody }
    function Get_HZ: Integer;
    function Get_HZN: Integer;
    function Get_HZU: Integer;
    function Get_HZK: Integer;
    function Get_HTIN: WideString;
    function Get_HZY: Integer;
    function Get_H1KV: Integer;
    function Get_HHY: Integer;
    function Get_H3KV: Integer;
    function Get_HY: Integer;
    function Get_T11RXXXXG2S: IXMLStrColumnList;
    function Get_T11RXXXXG3: IXMLTinColumnList;
    function Get_T11RXXXXG4: IXMLDecimal2ColumnList;
    function Get_R011G4: WideString;
    function Get_T12RXXXXG2S: IXMLStrColumnList;
    function Get_T12RXXXXG3: IXMLEDRPOUColumnList;
    function Get_T12RXXXXG4: IXMLDecimal2ColumnList;
    function Get_R012G4: WideString;
    function Get_R001G4: WideString;
    function Get_T21RXXXXG2S: IXMLStrColumnList;
    function Get_T21RXXXXG3: IXMLTinColumnList;
    function Get_T21RXXXXG4: IXMLDecimal2ColumnList;
    function Get_R021G4: WideString;
    function Get_T22RXXXXG2S: IXMLStrColumnList;
    function Get_T22RXXXXG3: IXMLEDRPOUColumnList;
    function Get_T22RXXXXG4: IXMLDecimal2ColumnList;
    function Get_R022G4: WideString;
    function Get_R002G4: WideString;
    function Get_HBOS: WideString;
    function Get_HBUH: WideString;
    procedure Set_HZ(Value: Integer);
    procedure Set_HZN(Value: Integer);
    procedure Set_HZU(Value: Integer);
    procedure Set_HZK(Value: Integer);
    procedure Set_HTIN(Value: WideString);
    procedure Set_HZY(Value: Integer);
    procedure Set_H1KV(Value: Integer);
    procedure Set_HHY(Value: Integer);
    procedure Set_H3KV(Value: Integer);
    procedure Set_HY(Value: Integer);
    procedure Set_R011G4(Value: WideString);
    procedure Set_R012G4(Value: WideString);
    procedure Set_R001G4(Value: WideString);
    procedure Set_R021G4(Value: WideString);
    procedure Set_R022G4(Value: WideString);
    procedure Set_R002G4(Value: WideString);
    procedure Set_HBOS(Value: WideString);
    procedure Set_HBUH(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLStrColumn }

  TXMLStrColumn = class(TXMLNode, IXMLStrColumn)
  protected
    { IXMLStrColumn }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
  end;

{ TXMLStrColumnList }

  TXMLStrColumnList = class(TXMLNodeCollection, IXMLStrColumnList)
  protected
    { IXMLStrColumnList }
    function Add: IXMLStrColumn;
    function Insert(const Index: Integer): IXMLStrColumn;
    function Get_Item(Index: Integer): IXMLStrColumn;
  end;

{ TXMLTinColumn }

  TXMLTinColumn = class(TXMLNode, IXMLTinColumn)
  protected
    { IXMLTinColumn }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
  end;

{ TXMLTinColumnList }

  TXMLTinColumnList = class(TXMLNodeCollection, IXMLTinColumnList)
  protected
    { IXMLTinColumnList }
    function Add: IXMLTinColumn;
    function Insert(const Index: Integer): IXMLTinColumn;
    function Get_Item(Index: Integer): IXMLTinColumn;
  end;

{ TXMLDecimal2Column }

  TXMLDecimal2Column = class(TXMLNode, IXMLDecimal2Column)
  protected
    { IXMLDecimal2Column }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
  end;

{ TXMLDecimal2ColumnList }

  TXMLDecimal2ColumnList = class(TXMLNodeCollection, IXMLDecimal2ColumnList)
  protected
    { IXMLDecimal2ColumnList }
    function Add: IXMLDecimal2Column;
    function Insert(const Index: Integer): IXMLDecimal2Column;
    function Get_Item(Index: Integer): IXMLDecimal2Column;
  end;

{ TXMLEDRPOUColumn }

  TXMLEDRPOUColumn = class(TXMLNode, IXMLEDRPOUColumn)
  protected
    { IXMLEDRPOUColumn }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
  end;

{ TXMLEDRPOUColumnList }

  TXMLEDRPOUColumnList = class(TXMLNodeCollection, IXMLEDRPOUColumnList)
  protected
    { IXMLEDRPOUColumnList }
    function Add: IXMLEDRPOUColumn;
    function Insert(const Index: Integer): IXMLEDRPOUColumn;
    function Get_Item(Index: Integer): IXMLEDRPOUColumn;
  end;

{ Global Functions }

function GetDECLAR(Doc: IXMLDocument): IXMLDeclarContent;
function LoadDECLAR(const FileName: WideString): IXMLDeclarContent;
function NewDECLAR: IXMLDeclarContent;

const
  TargetNamespace = '';

implementation

{ Global Functions }

function GetDECLAR(Doc: IXMLDocument): IXMLDeclarContent;
begin
  Result := Doc.GetDocBinding('DECLAR', TXMLDeclarContent, TargetNamespace) as IXMLDeclarContent;
end;

function LoadDECLAR(const FileName: WideString): IXMLDeclarContent;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('DECLAR', TXMLDeclarContent, TargetNamespace) as IXMLDeclarContent;
end;

function NewDECLAR: IXMLDeclarContent;
begin
  Result := NewXMLDocument.GetDocBinding('DECLAR', TXMLDeclarContent, TargetNamespace) as IXMLDeclarContent;
end;

{ TXMLDeclarContent }

procedure TXMLDeclarContent.AfterConstruction;
begin
  RegisterChildNode('DECLARHEAD', TXMLDHead);
  RegisterChildNode('DECLARBODY', TXMLDBody);
  inherited;
end;

function TXMLDeclarContent.Get_DECLARHEAD: IXMLDHead;
begin
  Result := ChildNodes['DECLARHEAD'] as IXMLDHead;
end;

function TXMLDeclarContent.Get_DECLARBODY: IXMLDBody;
begin
  Result := ChildNodes['DECLARBODY'] as IXMLDBody;
end;

{ TXMLDHead }

procedure TXMLDHead.AfterConstruction;
begin
  RegisterChildNode('LINKED_DOCS', TXMLLINKED_DOCS);
  inherited;
end;

function TXMLDHead.Get_TIN: WideString;
begin
  Result := ChildNodes['TIN'].Text;
end;

procedure TXMLDHead.Set_TIN(Value: WideString);
begin
  ChildNodes['TIN'].NodeValue := Value;
end;

function TXMLDHead.Get_C_DOC: WideString;
begin
  Result := ChildNodes['C_DOC'].Text;
end;

procedure TXMLDHead.Set_C_DOC(Value: WideString);
begin
  ChildNodes['C_DOC'].NodeValue := Value;
end;

function TXMLDHead.Get_C_DOC_SUB: WideString;
begin
  Result := ChildNodes['C_DOC_SUB'].Text;
end;

procedure TXMLDHead.Set_C_DOC_SUB(Value: WideString);
begin
  ChildNodes['C_DOC_SUB'].NodeValue := Value;
end;

function TXMLDHead.Get_C_DOC_VER: WideString;
begin
  Result := ChildNodes['C_DOC_VER'].Text;
end;

procedure TXMLDHead.Set_C_DOC_VER(Value: WideString);
begin
  ChildNodes['C_DOC_VER'].NodeValue := Value;
end;

function TXMLDHead.Get_C_DOC_TYPE: LongWord;
begin
  Result := ChildNodes['C_DOC_TYPE'].NodeValue;
end;

procedure TXMLDHead.Set_C_DOC_TYPE(Value: LongWord);
begin
  ChildNodes['C_DOC_TYPE'].NodeValue := Value;
end;

function TXMLDHead.Get_C_DOC_CNT: LongWord;
begin
  Result := ChildNodes['C_DOC_CNT'].NodeValue;
end;

procedure TXMLDHead.Set_C_DOC_CNT(Value: LongWord);
begin
  ChildNodes['C_DOC_CNT'].NodeValue := Value;
end;

function TXMLDHead.Get_C_REG: Integer;
begin
  Result := ChildNodes['C_REG'].NodeValue;
end;

procedure TXMLDHead.Set_C_REG(Value: Integer);
begin
  ChildNodes['C_REG'].NodeValue := Value;
end;

function TXMLDHead.Get_C_RAJ: Integer;
begin
  Result := ChildNodes['C_RAJ'].NodeValue;
end;

procedure TXMLDHead.Set_C_RAJ(Value: Integer);
begin
  ChildNodes['C_RAJ'].NodeValue := Value;
end;

function TXMLDHead.Get_PERIOD_MONTH: Integer;
begin
  Result := ChildNodes['PERIOD_MONTH'].NodeValue;
end;

procedure TXMLDHead.Set_PERIOD_MONTH(Value: Integer);
begin
  ChildNodes['PERIOD_MONTH'].NodeValue := Value;
end;

function TXMLDHead.Get_PERIOD_TYPE: Integer;
begin
  Result := ChildNodes['PERIOD_TYPE'].NodeValue;
end;

procedure TXMLDHead.Set_PERIOD_TYPE(Value: Integer);
begin
  ChildNodes['PERIOD_TYPE'].NodeValue := Value;
end;

function TXMLDHead.Get_PERIOD_YEAR: Integer;
begin
  Result := ChildNodes['PERIOD_YEAR'].NodeValue;
end;

procedure TXMLDHead.Set_PERIOD_YEAR(Value: Integer);
begin
  ChildNodes['PERIOD_YEAR'].NodeValue := Value;
end;

function TXMLDHead.Get_C_STI_ORIG: Integer;
begin
  Result := ChildNodes['C_STI_ORIG'].NodeValue;
end;

procedure TXMLDHead.Set_C_STI_ORIG(Value: Integer);
begin
  ChildNodes['C_STI_ORIG'].NodeValue := Value;
end;

function TXMLDHead.Get_C_DOC_STAN: Integer;
begin
  Result := ChildNodes['C_DOC_STAN'].NodeValue;
end;

procedure TXMLDHead.Set_C_DOC_STAN(Value: Integer);
begin
  ChildNodes['C_DOC_STAN'].NodeValue := Value;
end;

function TXMLDHead.Get_LINKED_DOCS: IXMLLINKED_DOCS;
begin
  Result := ChildNodes['LINKED_DOCS'] as IXMLLINKED_DOCS;
end;

function TXMLDHead.Get_D_FILL: WideString;
begin
  Result := ChildNodes['D_FILL'].Text;
end;

procedure TXMLDHead.Set_D_FILL(Value: WideString);
begin
  ChildNodes['D_FILL'].NodeValue := Value;
end;

function TXMLDHead.Get_SOFTWARE: WideString;
begin
  Result := ChildNodes['SOFTWARE'].Text;
end;

procedure TXMLDHead.Set_SOFTWARE(Value: WideString);
begin
  ChildNodes['SOFTWARE'].NodeValue := Value;
end;

{ TXMLLINKED_DOCS }

procedure TXMLLINKED_DOCS.AfterConstruction;
begin
  RegisterChildNode('DOC', TXMLDOC);
  ItemTag := 'DOC';
  ItemInterface := IXMLDOC;
  inherited;
end;

function TXMLLINKED_DOCS.Get_DOC(Index: Integer): IXMLDOC;
begin
  Result := List[Index] as IXMLDOC;
end;

function TXMLLINKED_DOCS.Add: IXMLDOC;
begin
  Result := AddItem(-1) as IXMLDOC;
end;

function TXMLLINKED_DOCS.Insert(const Index: Integer): IXMLDOC;
begin
  Result := AddItem(Index) as IXMLDOC;
end;

{ TXMLDOC }

function TXMLDOC.Get_NUM: LongWord;
begin
  Result := AttributeNodes['NUM'].NodeValue;
end;

procedure TXMLDOC.Set_NUM(Value: LongWord);
begin
  SetAttribute('NUM', Value);
end;

function TXMLDOC.Get_TYPE_: LongWord;
begin
  Result := AttributeNodes['TYPE'].NodeValue;
end;

procedure TXMLDOC.Set_TYPE_(Value: LongWord);
begin
  SetAttribute('TYPE', Value);
end;

function TXMLDOC.Get_C_DOC: WideString;
begin
  Result := ChildNodes['C_DOC'].Text;
end;

procedure TXMLDOC.Set_C_DOC(Value: WideString);
begin
  ChildNodes['C_DOC'].NodeValue := Value;
end;

function TXMLDOC.Get_C_DOC_SUB: WideString;
begin
  Result := ChildNodes['C_DOC_SUB'].Text;
end;

procedure TXMLDOC.Set_C_DOC_SUB(Value: WideString);
begin
  ChildNodes['C_DOC_SUB'].NodeValue := Value;
end;

function TXMLDOC.Get_C_DOC_VER: WideString;
begin
  Result := ChildNodes['C_DOC_VER'].Text;
end;

procedure TXMLDOC.Set_C_DOC_VER(Value: WideString);
begin
  ChildNodes['C_DOC_VER'].NodeValue := Value;
end;

function TXMLDOC.Get_C_DOC_TYPE: LongWord;
begin
  Result := ChildNodes['C_DOC_TYPE'].NodeValue;
end;

procedure TXMLDOC.Set_C_DOC_TYPE(Value: LongWord);
begin
  ChildNodes['C_DOC_TYPE'].NodeValue := Value;
end;

function TXMLDOC.Get_C_DOC_CNT: LongWord;
begin
  Result := ChildNodes['C_DOC_CNT'].NodeValue;
end;

procedure TXMLDOC.Set_C_DOC_CNT(Value: LongWord);
begin
  ChildNodes['C_DOC_CNT'].NodeValue := Value;
end;

function TXMLDOC.Get_C_DOC_STAN: Integer;
begin
  Result := ChildNodes['C_DOC_STAN'].NodeValue;
end;

procedure TXMLDOC.Set_C_DOC_STAN(Value: Integer);
begin
  ChildNodes['C_DOC_STAN'].NodeValue := Value;
end;

function TXMLDOC.Get_FILENAME: WideString;
begin
  Result := ChildNodes['FILENAME'].Text;
end;

procedure TXMLDOC.Set_FILENAME(Value: WideString);
begin
  ChildNodes['FILENAME'].NodeValue := Value;
end;

{ TXMLDBody }

procedure TXMLDBody.AfterConstruction;
begin
  RegisterChildNode('T11RXXXXG2S', TXMLStrColumn);
  RegisterChildNode('T11RXXXXG3', TXMLTinColumn);
  RegisterChildNode('T11RXXXXG4', TXMLDecimal2Column);
  RegisterChildNode('T12RXXXXG2S', TXMLStrColumn);
  RegisterChildNode('T12RXXXXG3', TXMLEDRPOUColumn);
  RegisterChildNode('T12RXXXXG4', TXMLDecimal2Column);
  RegisterChildNode('T21RXXXXG2S', TXMLStrColumn);
  RegisterChildNode('T21RXXXXG3', TXMLTinColumn);
  RegisterChildNode('T21RXXXXG4', TXMLDecimal2Column);
  RegisterChildNode('T22RXXXXG2S', TXMLStrColumn);
  RegisterChildNode('T22RXXXXG3', TXMLEDRPOUColumn);
  RegisterChildNode('T22RXXXXG4', TXMLDecimal2Column);
  FT11RXXXXG2S := CreateCollection(TXMLStrColumnList, IXMLStrColumn, 'T11RXXXXG2S') as IXMLStrColumnList;
  FT11RXXXXG3 := CreateCollection(TXMLTinColumnList, IXMLTinColumn, 'T11RXXXXG3') as IXMLTinColumnList;
  FT11RXXXXG4 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T11RXXXXG4') as IXMLDecimal2ColumnList;
  FT12RXXXXG2S := CreateCollection(TXMLStrColumnList, IXMLStrColumn, 'T12RXXXXG2S') as IXMLStrColumnList;
  FT12RXXXXG3 := CreateCollection(TXMLEDRPOUColumnList, IXMLEDRPOUColumn, 'T12RXXXXG3') as IXMLEDRPOUColumnList;
  FT12RXXXXG4 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T12RXXXXG4') as IXMLDecimal2ColumnList;
  FT21RXXXXG2S := CreateCollection(TXMLStrColumnList, IXMLStrColumn, 'T21RXXXXG2S') as IXMLStrColumnList;
  FT21RXXXXG3 := CreateCollection(TXMLTinColumnList, IXMLTinColumn, 'T21RXXXXG3') as IXMLTinColumnList;
  FT21RXXXXG4 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T21RXXXXG4') as IXMLDecimal2ColumnList;
  FT22RXXXXG2S := CreateCollection(TXMLStrColumnList, IXMLStrColumn, 'T22RXXXXG2S') as IXMLStrColumnList;
  FT22RXXXXG3 := CreateCollection(TXMLEDRPOUColumnList, IXMLEDRPOUColumn, 'T22RXXXXG3') as IXMLEDRPOUColumnList;
  FT22RXXXXG4 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T22RXXXXG4') as IXMLDecimal2ColumnList;
  inherited;
end;

function TXMLDBody.Get_HZ: Integer;
begin
  Result := ChildNodes['HZ'].NodeValue;
end;

procedure TXMLDBody.Set_HZ(Value: Integer);
begin
  ChildNodes['HZ'].NodeValue := Value;
end;

function TXMLDBody.Get_HZN: Integer;
begin
  Result := ChildNodes['HZN'].NodeValue;
end;

procedure TXMLDBody.Set_HZN(Value: Integer);
begin
  ChildNodes['HZN'].NodeValue := Value;
end;

function TXMLDBody.Get_HZU: Integer;
begin
  Result := ChildNodes['HZU'].NodeValue;
end;

procedure TXMLDBody.Set_HZU(Value: Integer);
begin
  ChildNodes['HZU'].NodeValue := Value;
end;

function TXMLDBody.Get_HZK: Integer;
begin
  Result := ChildNodes['HZK'].NodeValue;
end;

procedure TXMLDBody.Set_HZK(Value: Integer);
begin
  ChildNodes['HZK'].NodeValue := Value;
end;

function TXMLDBody.Get_HTIN: WideString;
begin
  Result := ChildNodes['HTIN'].Text;
end;

procedure TXMLDBody.Set_HTIN(Value: WideString);
begin
  ChildNodes['HTIN'].NodeValue := Value;
end;

function TXMLDBody.Get_HZY: Integer;
begin
  Result := ChildNodes['HZY'].NodeValue;
end;

procedure TXMLDBody.Set_HZY(Value: Integer);
begin
  ChildNodes['HZY'].NodeValue := Value;
end;

function TXMLDBody.Get_H1KV: Integer;
begin
  Result := ChildNodes['H1KV'].NodeValue;
end;

procedure TXMLDBody.Set_H1KV(Value: Integer);
begin
  ChildNodes['H1KV'].NodeValue := Value;
end;

function TXMLDBody.Get_HHY: Integer;
begin
  Result := ChildNodes['HHY'].NodeValue;
end;

procedure TXMLDBody.Set_HHY(Value: Integer);
begin
  ChildNodes['HHY'].NodeValue := Value;
end;

function TXMLDBody.Get_H3KV: Integer;
begin
  Result := ChildNodes['H3KV'].NodeValue;
end;

procedure TXMLDBody.Set_H3KV(Value: Integer);
begin
  ChildNodes['H3KV'].NodeValue := Value;
end;

function TXMLDBody.Get_HY: Integer;
begin
  Result := ChildNodes['HY'].NodeValue;
end;

procedure TXMLDBody.Set_HY(Value: Integer);
begin
  ChildNodes['HY'].NodeValue := Value;
end;

function TXMLDBody.Get_T11RXXXXG2S: IXMLStrColumnList;
begin
  Result := FT11RXXXXG2S;
end;

function TXMLDBody.Get_T11RXXXXG3: IXMLTinColumnList;
begin
  Result := FT11RXXXXG3;
end;

function TXMLDBody.Get_T11RXXXXG4: IXMLDecimal2ColumnList;
begin
  Result := FT11RXXXXG4;
end;

function TXMLDBody.Get_R011G4: WideString;
begin
  Result := ChildNodes['R011G4'].Text;
end;

procedure TXMLDBody.Set_R011G4(Value: WideString);
begin
  ChildNodes['R011G4'].NodeValue := Value;
end;

function TXMLDBody.Get_T12RXXXXG2S: IXMLStrColumnList;
begin
  Result := FT12RXXXXG2S;
end;

function TXMLDBody.Get_T12RXXXXG3: IXMLEDRPOUColumnList;
begin
  Result := FT12RXXXXG3;
end;

function TXMLDBody.Get_T12RXXXXG4: IXMLDecimal2ColumnList;
begin
  Result := FT12RXXXXG4;
end;

function TXMLDBody.Get_R012G4: WideString;
begin
  Result := ChildNodes['R012G4'].Text;
end;

procedure TXMLDBody.Set_R012G4(Value: WideString);
begin
  ChildNodes['R012G4'].NodeValue := Value;
end;

function TXMLDBody.Get_R001G4: WideString;
begin
  Result := ChildNodes['R001G4'].Text;
end;

procedure TXMLDBody.Set_R001G4(Value: WideString);
begin
  ChildNodes['R001G4'].NodeValue := Value;
end;

function TXMLDBody.Get_T21RXXXXG2S: IXMLStrColumnList;
begin
  Result := FT21RXXXXG2S;
end;

function TXMLDBody.Get_T21RXXXXG3: IXMLTinColumnList;
begin
  Result := FT21RXXXXG3;
end;

function TXMLDBody.Get_T21RXXXXG4: IXMLDecimal2ColumnList;
begin
  Result := FT21RXXXXG4;
end;

function TXMLDBody.Get_R021G4: WideString;
begin
  Result := ChildNodes['R021G4'].Text;
end;

procedure TXMLDBody.Set_R021G4(Value: WideString);
begin
  ChildNodes['R021G4'].NodeValue := Value;
end;

function TXMLDBody.Get_T22RXXXXG2S: IXMLStrColumnList;
begin
  Result := FT22RXXXXG2S;
end;

function TXMLDBody.Get_T22RXXXXG3: IXMLEDRPOUColumnList;
begin
  Result := FT22RXXXXG3;
end;

function TXMLDBody.Get_T22RXXXXG4: IXMLDecimal2ColumnList;
begin
  Result := FT22RXXXXG4;
end;

function TXMLDBody.Get_R022G4: WideString;
begin
  Result := ChildNodes['R022G4'].Text;
end;

procedure TXMLDBody.Set_R022G4(Value: WideString);
begin
  ChildNodes['R022G4'].NodeValue := Value;
end;

function TXMLDBody.Get_R002G4: WideString;
begin
  Result := ChildNodes['R002G4'].Text;
end;

procedure TXMLDBody.Set_R002G4(Value: WideString);
begin
  ChildNodes['R002G4'].NodeValue := Value;
end;

function TXMLDBody.Get_HBOS: WideString;
begin
  Result := ChildNodes['HBOS'].Text;
end;

procedure TXMLDBody.Set_HBOS(Value: WideString);
begin
  ChildNodes['HBOS'].NodeValue := Value;
end;

function TXMLDBody.Get_HBUH: WideString;
begin
  Result := ChildNodes['HBUH'].Text;
end;

procedure TXMLDBody.Set_HBUH(Value: WideString);
begin
  ChildNodes['HBUH'].NodeValue := Value;
end;

{ TXMLStrColumn }

function TXMLStrColumn.Get_ROWNUM: Integer;
begin
  Result := AttributeNodes['ROWNUM'].NodeValue;
end;

procedure TXMLStrColumn.Set_ROWNUM(Value: Integer);
begin
  SetAttribute('ROWNUM', Value);
end;

{ TXMLStrColumnList }

function TXMLStrColumnList.Add: IXMLStrColumn;
begin
  Result := AddItem(-1) as IXMLStrColumn;
end;

function TXMLStrColumnList.Insert(const Index: Integer): IXMLStrColumn;
begin
  Result := AddItem(Index) as IXMLStrColumn;
end;
function TXMLStrColumnList.Get_Item(Index: Integer): IXMLStrColumn;
begin
  Result := List[Index] as IXMLStrColumn;
end;

{ TXMLTinColumn }

function TXMLTinColumn.Get_ROWNUM: Integer;
begin
  Result := AttributeNodes['ROWNUM'].NodeValue;
end;

procedure TXMLTinColumn.Set_ROWNUM(Value: Integer);
begin
  SetAttribute('ROWNUM', Value);
end;

{ TXMLTinColumnList }

function TXMLTinColumnList.Add: IXMLTinColumn;
begin
  Result := AddItem(-1) as IXMLTinColumn;
end;

function TXMLTinColumnList.Insert(const Index: Integer): IXMLTinColumn;
begin
  Result := AddItem(Index) as IXMLTinColumn;
end;
function TXMLTinColumnList.Get_Item(Index: Integer): IXMLTinColumn;
begin
  Result := List[Index] as IXMLTinColumn;
end;

{ TXMLDecimal2Column }

function TXMLDecimal2Column.Get_ROWNUM: Integer;
begin
  Result := AttributeNodes['ROWNUM'].NodeValue;
end;

procedure TXMLDecimal2Column.Set_ROWNUM(Value: Integer);
begin
  SetAttribute('ROWNUM', Value);
end;

{ TXMLDecimal2ColumnList }

function TXMLDecimal2ColumnList.Add: IXMLDecimal2Column;
begin
  Result := AddItem(-1) as IXMLDecimal2Column;
end;

function TXMLDecimal2ColumnList.Insert(const Index: Integer): IXMLDecimal2Column;
begin
  Result := AddItem(Index) as IXMLDecimal2Column;
end;
function TXMLDecimal2ColumnList.Get_Item(Index: Integer): IXMLDecimal2Column;
begin
  Result := List[Index] as IXMLDecimal2Column;
end;

{ TXMLEDRPOUColumn }

function TXMLEDRPOUColumn.Get_ROWNUM: Integer;
begin
  Result := AttributeNodes['ROWNUM'].NodeValue;
end;

procedure TXMLEDRPOUColumn.Set_ROWNUM(Value: Integer);
begin
  SetAttribute('ROWNUM', Value);
end;

{ TXMLEDRPOUColumnList }

function TXMLEDRPOUColumnList.Add: IXMLEDRPOUColumn;
begin
  Result := AddItem(-1) as IXMLEDRPOUColumn;
end;

function TXMLEDRPOUColumnList.Insert(const Index: Integer): IXMLEDRPOUColumn;
begin
  Result := AddItem(Index) as IXMLEDRPOUColumn;
end;
function TXMLEDRPOUColumnList.Get_Item(Index: Integer): IXMLEDRPOUColumn;
begin
  Result := List[Index] as IXMLEDRPOUColumn;
end;

end. 