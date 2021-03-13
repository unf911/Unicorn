
{*************************************************}
{                                                 }
{                XML Data Binding                 }
{                                                 }
{         Generated on: 13.03.2021 10:10:08       }
{       Generated from: Z:\Unicorn\J1201011.xsd   }
{   Settings stored in: Z:\Unicorn\J1201011.xdb   }
{                                                 }
{*************************************************}

unit J1201011;

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
  IXMLUKTZEDColumn = interface;
  IXMLUKTZEDColumnList = interface;
  IXMLChkColumn = interface;
  IXMLChkColumnList = interface;
  IXMLDKPPColumn = interface;
  IXMLDKPPColumnList = interface;
  IXMLDGI4lzColumn = interface;
  IXMLDGI4lzColumnList = interface;
  IXMLDecimal12Column_R = interface;
  IXMLDecimal12Column_RList = interface;
  IXMLDGI3nomColumn = interface;
  IXMLDGI3nomColumnList = interface;
  IXMLCodPilgColumn = interface;
  IXMLCodPilgColumnList = interface;
  IXMLDecimal2Column_P = interface;
  IXMLDecimal2Column_PList = interface;
  IXMLDecimal6Column_R = interface;
  IXMLDecimal6Column_RList = interface;

{ IXMLDeclarContent }

  IXMLDeclarContent = interface(IXMLNode)
    ['{E7027AF8-1008-40B7-99F6-F50AEBC583B3}']
    { Property Accessors }
    function Get_DECLARHEAD: IXMLDHead;
    function Get_DECLARBODY: IXMLDBody;
    { Methods & Properties }
    property DECLARHEAD: IXMLDHead read Get_DECLARHEAD;
    property DECLARBODY: IXMLDBody read Get_DECLARBODY;
  end;

{ IXMLDHead }

  IXMLDHead = interface(IXMLNode)
    ['{853C6A4E-27A3-46BC-9487-7CF80428BC56}']
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
    ['{DE8623F1-ECF4-4001-80DD-AFE5F939FA4B}']
    { Property Accessors }
    function Get_DOC(Index: Integer): IXMLDOC;
    { Methods & Properties }
    function Add: IXMLDOC;
    function Insert(const Index: Integer): IXMLDOC;
    property DOC[Index: Integer]: IXMLDOC read Get_DOC; default;
  end;

{ IXMLDOC }

  IXMLDOC = interface(IXMLNode)
    ['{DEF155F8-046A-49DE-B8B7-12F16255772B}']
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
    ['{0BDD8B5B-F689-4F94-8BE3-3439DA09AAC4}']
    { Property Accessors }
    function Get_R01G1: Int64;
    function Get_R03G10S: WideString;
    function Get_HORIG1: Integer;
    function Get_HTYPR: WideString;
    function Get_HFILL: WideString;
    function Get_HNUM: Int64;
    function Get_HNUM1: Int64;
    function Get_HNAMESEL: WideString;
    function Get_HNAMEBUY: WideString;
    function Get_HKSEL: WideString;
    function Get_HNUM2: Int64;
    function Get_HTINSEL: WideString;
    function Get_HKS: Int64;
    function Get_HKBUY: WideString;
    function Get_HFBUY: Int64;
    function Get_HTINBUY: WideString;
    function Get_HKB: Int64;
    function Get_R04G11: WideString;
    function Get_R03G11: WideString;
    function Get_R03G7: WideString;
    function Get_R03G109: WideString;
    function Get_R01G7: WideString;
    function Get_R01G109: WideString;
    function Get_R01G9: WideString;
    function Get_R01G8: WideString;
    function Get_R01G10: WideString;
    function Get_R02G11: WideString;
    function Get_RXXXXG3S: IXMLStrColumnList;
    function Get_RXXXXG4: IXMLUKTZEDColumnList;
    function Get_RXXXXG32: IXMLChkColumnList;
    function Get_RXXXXG33: IXMLDKPPColumnList;
    function Get_RXXXXG4S: IXMLStrColumnList;
    function Get_RXXXXG105_2S: IXMLDGI4lzColumnList;
    function Get_RXXXXG5: IXMLDecimal12Column_RList;
    function Get_RXXXXG6: IXMLDecimal12Column_RList;
    function Get_RXXXXG008: IXMLDGI3nomColumnList;
    function Get_RXXXXG009: IXMLCodPilgColumnList;
    function Get_RXXXXG010: IXMLDecimal2Column_PList;
    function Get_RXXXXG11_10: IXMLDecimal6Column_RList;
    function Get_RXXXXG011: IXMLDGI3nomColumnList;
    function Get_HBOS: WideString;
    function Get_HKBOS: WideString;
    function Get_R003G10S: WideString;
    procedure Set_R01G1(Value: Int64);
    procedure Set_R03G10S(Value: WideString);
    procedure Set_HORIG1(Value: Integer);
    procedure Set_HTYPR(Value: WideString);
    procedure Set_HFILL(Value: WideString);
    procedure Set_HNUM(Value: Int64);
    procedure Set_HNUM1(Value: Int64);
    procedure Set_HNAMESEL(Value: WideString);
    procedure Set_HNAMEBUY(Value: WideString);
    procedure Set_HKSEL(Value: WideString);
    procedure Set_HNUM2(Value: Int64);
    procedure Set_HTINSEL(Value: WideString);
    procedure Set_HKS(Value: Int64);
    procedure Set_HKBUY(Value: WideString);
    procedure Set_HFBUY(Value: Int64);
    procedure Set_HTINBUY(Value: WideString);
    procedure Set_HKB(Value: Int64);
    procedure Set_R04G11(Value: WideString);
    procedure Set_R03G11(Value: WideString);
    procedure Set_R03G7(Value: WideString);
    procedure Set_R03G109(Value: WideString);
    procedure Set_R01G7(Value: WideString);
    procedure Set_R01G109(Value: WideString);
    procedure Set_R01G9(Value: WideString);
    procedure Set_R01G8(Value: WideString);
    procedure Set_R01G10(Value: WideString);
    procedure Set_R02G11(Value: WideString);
    procedure Set_HBOS(Value: WideString);
    procedure Set_HKBOS(Value: WideString);
    procedure Set_R003G10S(Value: WideString);
    { Methods & Properties }
    property R01G1: Int64 read Get_R01G1 write Set_R01G1;
    property R03G10S: WideString read Get_R03G10S write Set_R03G10S;
    property HORIG1: Integer read Get_HORIG1 write Set_HORIG1;
    property HTYPR: WideString read Get_HTYPR write Set_HTYPR;
    property HFILL: WideString read Get_HFILL write Set_HFILL;
    property HNUM: Int64 read Get_HNUM write Set_HNUM;
    property HNUM1: Int64 read Get_HNUM1 write Set_HNUM1;
    property HNAMESEL: WideString read Get_HNAMESEL write Set_HNAMESEL;
    property HNAMEBUY: WideString read Get_HNAMEBUY write Set_HNAMEBUY;
    property HKSEL: WideString read Get_HKSEL write Set_HKSEL;
    property HNUM2: Int64 read Get_HNUM2 write Set_HNUM2;
    property HTINSEL: WideString read Get_HTINSEL write Set_HTINSEL;
    property HKS: Int64 read Get_HKS write Set_HKS;
    property HKBUY: WideString read Get_HKBUY write Set_HKBUY;
    property HFBUY: Int64 read Get_HFBUY write Set_HFBUY;
    property HTINBUY: WideString read Get_HTINBUY write Set_HTINBUY;
    property HKB: Int64 read Get_HKB write Set_HKB;
    property R04G11: WideString read Get_R04G11 write Set_R04G11;
    property R03G11: WideString read Get_R03G11 write Set_R03G11;
    property R03G7: WideString read Get_R03G7 write Set_R03G7;
    property R03G109: WideString read Get_R03G109 write Set_R03G109;
    property R01G7: WideString read Get_R01G7 write Set_R01G7;
    property R01G109: WideString read Get_R01G109 write Set_R01G109;
    property R01G9: WideString read Get_R01G9 write Set_R01G9;
    property R01G8: WideString read Get_R01G8 write Set_R01G8;
    property R01G10: WideString read Get_R01G10 write Set_R01G10;
    property R02G11: WideString read Get_R02G11 write Set_R02G11;
    property RXXXXG3S: IXMLStrColumnList read Get_RXXXXG3S;
    property RXXXXG4: IXMLUKTZEDColumnList read Get_RXXXXG4;
    property RXXXXG32: IXMLChkColumnList read Get_RXXXXG32;
    property RXXXXG33: IXMLDKPPColumnList read Get_RXXXXG33;
    property RXXXXG4S: IXMLStrColumnList read Get_RXXXXG4S;
    property RXXXXG105_2S: IXMLDGI4lzColumnList read Get_RXXXXG105_2S;
    property RXXXXG5: IXMLDecimal12Column_RList read Get_RXXXXG5;
    property RXXXXG6: IXMLDecimal12Column_RList read Get_RXXXXG6;
    property RXXXXG008: IXMLDGI3nomColumnList read Get_RXXXXG008;
    property RXXXXG009: IXMLCodPilgColumnList read Get_RXXXXG009;
    property RXXXXG010: IXMLDecimal2Column_PList read Get_RXXXXG010;
    property RXXXXG11_10: IXMLDecimal6Column_RList read Get_RXXXXG11_10;
    property RXXXXG011: IXMLDGI3nomColumnList read Get_RXXXXG011;
    property HBOS: WideString read Get_HBOS write Set_HBOS;
    property HKBOS: WideString read Get_HKBOS write Set_HKBOS;
    property R003G10S: WideString read Get_R003G10S write Set_R003G10S;
  end;

{ IXMLStrColumn }

  IXMLStrColumn = interface(IXMLNode)
    ['{5D0FEB30-938A-494D-BEA9-49301369AD31}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLStrColumnList }

  IXMLStrColumnList = interface(IXMLNodeCollection)
    ['{65174801-1CCA-47FF-9B05-7887184CB9A3}']
    { Methods & Properties }
    function Add: IXMLStrColumn;
    function Insert(const Index: Integer): IXMLStrColumn;
    function Get_Item(Index: Integer): IXMLStrColumn;
    property Items[Index: Integer]: IXMLStrColumn read Get_Item; default;
  end;

{ IXMLUKTZEDColumn }

  IXMLUKTZEDColumn = interface(IXMLNode)
    ['{AF8963C5-7A99-43B0-8254-152713E1667D}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLUKTZEDColumnList }

  IXMLUKTZEDColumnList = interface(IXMLNodeCollection)
    ['{3E489988-B12E-4BD7-8750-A618430B63F7}']
    { Methods & Properties }
    function Add: IXMLUKTZEDColumn;
    function Insert(const Index: Integer): IXMLUKTZEDColumn;
    function Get_Item(Index: Integer): IXMLUKTZEDColumn;
    property Items[Index: Integer]: IXMLUKTZEDColumn read Get_Item; default;
  end;

{ IXMLChkColumn }

  IXMLChkColumn = interface(IXMLNode)
    ['{7B630F61-D698-4DDA-9C39-1E697700B8A1}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLChkColumnList }

  IXMLChkColumnList = interface(IXMLNodeCollection)
    ['{0D347B73-989F-4408-9808-DF4DF01F1BC4}']
    { Methods & Properties }
    function Add: IXMLChkColumn;
    function Insert(const Index: Integer): IXMLChkColumn;
    function Get_Item(Index: Integer): IXMLChkColumn;
    property Items[Index: Integer]: IXMLChkColumn read Get_Item; default;
  end;

{ IXMLDKPPColumn }

  IXMLDKPPColumn = interface(IXMLNode)
    ['{852A21C2-3696-42F5-8FD8-50A4164861CD}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLDKPPColumnList }

  IXMLDKPPColumnList = interface(IXMLNodeCollection)
    ['{C14C82D8-888E-4F85-B020-0D512BB0FC23}']
    { Methods & Properties }
    function Add: IXMLDKPPColumn;
    function Insert(const Index: Integer): IXMLDKPPColumn;
    function Get_Item(Index: Integer): IXMLDKPPColumn;
    property Items[Index: Integer]: IXMLDKPPColumn read Get_Item; default;
  end;

{ IXMLDGI4lzColumn }

  IXMLDGI4lzColumn = interface(IXMLNode)
    ['{576AC0C9-6426-469E-B6B8-67657E1B4888}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLDGI4lzColumnList }

  IXMLDGI4lzColumnList = interface(IXMLNodeCollection)
    ['{DA43DB5E-5F12-4EFF-B5D8-995C6BE68D5C}']
    { Methods & Properties }
    function Add: IXMLDGI4lzColumn;
    function Insert(const Index: Integer): IXMLDGI4lzColumn;
    function Get_Item(Index: Integer): IXMLDGI4lzColumn;
    property Items[Index: Integer]: IXMLDGI4lzColumn read Get_Item; default;
  end;

{ IXMLDecimal12Column_R }

  IXMLDecimal12Column_R = interface(IXMLNode)
    ['{3D18D79F-CE2E-49B5-BE2C-7C1A43839C72}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLDecimal12Column_RList }

  IXMLDecimal12Column_RList = interface(IXMLNodeCollection)
    ['{0AF5C92C-793F-4F0A-B310-AA7E5CD874E0}']
    { Methods & Properties }
    function Add: IXMLDecimal12Column_R;
    function Insert(const Index: Integer): IXMLDecimal12Column_R;
    function Get_Item(Index: Integer): IXMLDecimal12Column_R;
    property Items[Index: Integer]: IXMLDecimal12Column_R read Get_Item; default;
  end;

{ IXMLDGI3nomColumn }

  IXMLDGI3nomColumn = interface(IXMLNode)
    ['{E5009C57-AE17-4C45-809A-D68740C1B812}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLDGI3nomColumnList }

  IXMLDGI3nomColumnList = interface(IXMLNodeCollection)
    ['{973266E5-FF30-41C3-B686-D8DC01F7BA18}']
    { Methods & Properties }
    function Add: IXMLDGI3nomColumn;
    function Insert(const Index: Integer): IXMLDGI3nomColumn;
    function Get_Item(Index: Integer): IXMLDGI3nomColumn;
    property Items[Index: Integer]: IXMLDGI3nomColumn read Get_Item; default;
  end;

{ IXMLCodPilgColumn }

  IXMLCodPilgColumn = interface(IXMLNode)
    ['{107AE862-23DB-423C-996F-4CD4A811A28B}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLCodPilgColumnList }

  IXMLCodPilgColumnList = interface(IXMLNodeCollection)
    ['{06DF15B1-2C33-4557-9FB2-8855E3A1EDF9}']
    { Methods & Properties }
    function Add: IXMLCodPilgColumn;
    function Insert(const Index: Integer): IXMLCodPilgColumn;
    function Get_Item(Index: Integer): IXMLCodPilgColumn;
    property Items[Index: Integer]: IXMLCodPilgColumn read Get_Item; default;
  end;

{ IXMLDecimal2Column_P }

  IXMLDecimal2Column_P = interface(IXMLNode)
    ['{4A0B5ACB-1FDE-4FDA-989E-2C0D6395B7E6}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLDecimal2Column_PList }

  IXMLDecimal2Column_PList = interface(IXMLNodeCollection)
    ['{8BC66AEA-10BA-448F-A470-1AC9B2F352CC}']
    { Methods & Properties }
    function Add: IXMLDecimal2Column_P;
    function Insert(const Index: Integer): IXMLDecimal2Column_P;
    function Get_Item(Index: Integer): IXMLDecimal2Column_P;
    property Items[Index: Integer]: IXMLDecimal2Column_P read Get_Item; default;
  end;

{ IXMLDecimal6Column_R }

  IXMLDecimal6Column_R = interface(IXMLNode)
    ['{B2978BE1-62E1-4E26-9CDD-B56B88CB2779}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLDecimal6Column_RList }

  IXMLDecimal6Column_RList = interface(IXMLNodeCollection)
    ['{F7012238-4B06-42A0-9C33-86568B1D6CEF}']
    { Methods & Properties }
    function Add: IXMLDecimal6Column_R;
    function Insert(const Index: Integer): IXMLDecimal6Column_R;
    function Get_Item(Index: Integer): IXMLDecimal6Column_R;
    property Items[Index: Integer]: IXMLDecimal6Column_R read Get_Item; default;
  end;

{ Forward Decls }

  TXMLDeclarContent = class;
  TXMLDHead = class;
  TXMLLINKED_DOCS = class;
  TXMLDOC = class;
  TXMLDBody = class;
  TXMLStrColumn = class;
  TXMLStrColumnList = class;
  TXMLUKTZEDColumn = class;
  TXMLUKTZEDColumnList = class;
  TXMLChkColumn = class;
  TXMLChkColumnList = class;
  TXMLDKPPColumn = class;
  TXMLDKPPColumnList = class;
  TXMLDGI4lzColumn = class;
  TXMLDGI4lzColumnList = class;
  TXMLDecimal12Column_R = class;
  TXMLDecimal12Column_RList = class;
  TXMLDGI3nomColumn = class;
  TXMLDGI3nomColumnList = class;
  TXMLCodPilgColumn = class;
  TXMLCodPilgColumnList = class;
  TXMLDecimal2Column_P = class;
  TXMLDecimal2Column_PList = class;
  TXMLDecimal6Column_R = class;
  TXMLDecimal6Column_RList = class;

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
    FRXXXXG3S: IXMLStrColumnList;
    FRXXXXG4: IXMLUKTZEDColumnList;
    FRXXXXG32: IXMLChkColumnList;
    FRXXXXG33: IXMLDKPPColumnList;
    FRXXXXG4S: IXMLStrColumnList;
    FRXXXXG105_2S: IXMLDGI4lzColumnList;
    FRXXXXG5: IXMLDecimal12Column_RList;
    FRXXXXG6: IXMLDecimal12Column_RList;
    FRXXXXG008: IXMLDGI3nomColumnList;
    FRXXXXG009: IXMLCodPilgColumnList;
    FRXXXXG010: IXMLDecimal2Column_PList;
    FRXXXXG11_10: IXMLDecimal6Column_RList;
    FRXXXXG011: IXMLDGI3nomColumnList;
  protected
    { IXMLDBody }
    function Get_R01G1: Int64;
    function Get_R03G10S: WideString;
    function Get_HORIG1: Integer;
    function Get_HTYPR: WideString;
    function Get_HFILL: WideString;
    function Get_HNUM: Int64;
    function Get_HNUM1: Int64;
    function Get_HNAMESEL: WideString;
    function Get_HNAMEBUY: WideString;
    function Get_HKSEL: WideString;
    function Get_HNUM2: Int64;
    function Get_HTINSEL: WideString;
    function Get_HKS: Int64;
    function Get_HKBUY: WideString;
    function Get_HFBUY: Int64;
    function Get_HTINBUY: WideString;
    function Get_HKB: Int64;
    function Get_R04G11: WideString;
    function Get_R03G11: WideString;
    function Get_R03G7: WideString;
    function Get_R03G109: WideString;
    function Get_R01G7: WideString;
    function Get_R01G109: WideString;
    function Get_R01G9: WideString;
    function Get_R01G8: WideString;
    function Get_R01G10: WideString;
    function Get_R02G11: WideString;
    function Get_RXXXXG3S: IXMLStrColumnList;
    function Get_RXXXXG4: IXMLUKTZEDColumnList;
    function Get_RXXXXG32: IXMLChkColumnList;
    function Get_RXXXXG33: IXMLDKPPColumnList;
    function Get_RXXXXG4S: IXMLStrColumnList;
    function Get_RXXXXG105_2S: IXMLDGI4lzColumnList;
    function Get_RXXXXG5: IXMLDecimal12Column_RList;
    function Get_RXXXXG6: IXMLDecimal12Column_RList;
    function Get_RXXXXG008: IXMLDGI3nomColumnList;
    function Get_RXXXXG009: IXMLCodPilgColumnList;
    function Get_RXXXXG010: IXMLDecimal2Column_PList;
    function Get_RXXXXG11_10: IXMLDecimal6Column_RList;
    function Get_RXXXXG011: IXMLDGI3nomColumnList;
    function Get_HBOS: WideString;
    function Get_HKBOS: WideString;
    function Get_R003G10S: WideString;
    procedure Set_R01G1(Value: Int64);
    procedure Set_R03G10S(Value: WideString);
    procedure Set_HORIG1(Value: Integer);
    procedure Set_HTYPR(Value: WideString);
    procedure Set_HFILL(Value: WideString);
    procedure Set_HNUM(Value: Int64);
    procedure Set_HNUM1(Value: Int64);
    procedure Set_HNAMESEL(Value: WideString);
    procedure Set_HNAMEBUY(Value: WideString);
    procedure Set_HKSEL(Value: WideString);
    procedure Set_HNUM2(Value: Int64);
    procedure Set_HTINSEL(Value: WideString);
    procedure Set_HKS(Value: Int64);
    procedure Set_HKBUY(Value: WideString);
    procedure Set_HFBUY(Value: Int64);
    procedure Set_HTINBUY(Value: WideString);
    procedure Set_HKB(Value: Int64);
    procedure Set_R04G11(Value: WideString);
    procedure Set_R03G11(Value: WideString);
    procedure Set_R03G7(Value: WideString);
    procedure Set_R03G109(Value: WideString);
    procedure Set_R01G7(Value: WideString);
    procedure Set_R01G109(Value: WideString);
    procedure Set_R01G9(Value: WideString);
    procedure Set_R01G8(Value: WideString);
    procedure Set_R01G10(Value: WideString);
    procedure Set_R02G11(Value: WideString);
    procedure Set_HBOS(Value: WideString);
    procedure Set_HKBOS(Value: WideString);
    procedure Set_R003G10S(Value: WideString);
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

{ TXMLUKTZEDColumn }

  TXMLUKTZEDColumn = class(TXMLNode, IXMLUKTZEDColumn)
  protected
    { IXMLUKTZEDColumn }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
  end;

{ TXMLUKTZEDColumnList }

  TXMLUKTZEDColumnList = class(TXMLNodeCollection, IXMLUKTZEDColumnList)
  protected
    { IXMLUKTZEDColumnList }
    function Add: IXMLUKTZEDColumn;
    function Insert(const Index: Integer): IXMLUKTZEDColumn;
    function Get_Item(Index: Integer): IXMLUKTZEDColumn;
  end;

{ TXMLChkColumn }

  TXMLChkColumn = class(TXMLNode, IXMLChkColumn)
  protected
    { IXMLChkColumn }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
  end;

{ TXMLChkColumnList }

  TXMLChkColumnList = class(TXMLNodeCollection, IXMLChkColumnList)
  protected
    { IXMLChkColumnList }
    function Add: IXMLChkColumn;
    function Insert(const Index: Integer): IXMLChkColumn;
    function Get_Item(Index: Integer): IXMLChkColumn;
  end;

{ TXMLDKPPColumn }

  TXMLDKPPColumn = class(TXMLNode, IXMLDKPPColumn)
  protected
    { IXMLDKPPColumn }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
  end;

{ TXMLDKPPColumnList }

  TXMLDKPPColumnList = class(TXMLNodeCollection, IXMLDKPPColumnList)
  protected
    { IXMLDKPPColumnList }
    function Add: IXMLDKPPColumn;
    function Insert(const Index: Integer): IXMLDKPPColumn;
    function Get_Item(Index: Integer): IXMLDKPPColumn;
  end;

{ TXMLDGI4lzColumn }

  TXMLDGI4lzColumn = class(TXMLNode, IXMLDGI4lzColumn)
  protected
    { IXMLDGI4lzColumn }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
  end;

{ TXMLDGI4lzColumnList }

  TXMLDGI4lzColumnList = class(TXMLNodeCollection, IXMLDGI4lzColumnList)
  protected
    { IXMLDGI4lzColumnList }
    function Add: IXMLDGI4lzColumn;
    function Insert(const Index: Integer): IXMLDGI4lzColumn;
    function Get_Item(Index: Integer): IXMLDGI4lzColumn;
  end;

{ TXMLDecimal12Column_R }

  TXMLDecimal12Column_R = class(TXMLNode, IXMLDecimal12Column_R)
  protected
    { IXMLDecimal12Column_R }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
  end;

{ TXMLDecimal12Column_RList }

  TXMLDecimal12Column_RList = class(TXMLNodeCollection, IXMLDecimal12Column_RList)
  protected
    { IXMLDecimal12Column_RList }
    function Add: IXMLDecimal12Column_R;
    function Insert(const Index: Integer): IXMLDecimal12Column_R;
    function Get_Item(Index: Integer): IXMLDecimal12Column_R;
  end;

{ TXMLDGI3nomColumn }

  TXMLDGI3nomColumn = class(TXMLNode, IXMLDGI3nomColumn)
  protected
    { IXMLDGI3nomColumn }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
  end;

{ TXMLDGI3nomColumnList }

  TXMLDGI3nomColumnList = class(TXMLNodeCollection, IXMLDGI3nomColumnList)
  protected
    { IXMLDGI3nomColumnList }
    function Add: IXMLDGI3nomColumn;
    function Insert(const Index: Integer): IXMLDGI3nomColumn;
    function Get_Item(Index: Integer): IXMLDGI3nomColumn;
  end;

{ TXMLCodPilgColumn }

  TXMLCodPilgColumn = class(TXMLNode, IXMLCodPilgColumn)
  protected
    { IXMLCodPilgColumn }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
  end;

{ TXMLCodPilgColumnList }

  TXMLCodPilgColumnList = class(TXMLNodeCollection, IXMLCodPilgColumnList)
  protected
    { IXMLCodPilgColumnList }
    function Add: IXMLCodPilgColumn;
    function Insert(const Index: Integer): IXMLCodPilgColumn;
    function Get_Item(Index: Integer): IXMLCodPilgColumn;
  end;

{ TXMLDecimal2Column_P }

  TXMLDecimal2Column_P = class(TXMLNode, IXMLDecimal2Column_P)
  protected
    { IXMLDecimal2Column_P }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
  end;

{ TXMLDecimal2Column_PList }

  TXMLDecimal2Column_PList = class(TXMLNodeCollection, IXMLDecimal2Column_PList)
  protected
    { IXMLDecimal2Column_PList }
    function Add: IXMLDecimal2Column_P;
    function Insert(const Index: Integer): IXMLDecimal2Column_P;
    function Get_Item(Index: Integer): IXMLDecimal2Column_P;
  end;

{ TXMLDecimal6Column_R }

  TXMLDecimal6Column_R = class(TXMLNode, IXMLDecimal6Column_R)
  protected
    { IXMLDecimal6Column_R }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
  end;

{ TXMLDecimal6Column_RList }

  TXMLDecimal6Column_RList = class(TXMLNodeCollection, IXMLDecimal6Column_RList)
  protected
    { IXMLDecimal6Column_RList }
    function Add: IXMLDecimal6Column_R;
    function Insert(const Index: Integer): IXMLDecimal6Column_R;
    function Get_Item(Index: Integer): IXMLDecimal6Column_R;
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
  RegisterChildNode('RXXXXG3S', TXMLStrColumn);
  RegisterChildNode('RXXXXG4', TXMLUKTZEDColumn);
  RegisterChildNode('RXXXXG32', TXMLChkColumn);
  RegisterChildNode('RXXXXG33', TXMLDKPPColumn);
  RegisterChildNode('RXXXXG4S', TXMLStrColumn);
  RegisterChildNode('RXXXXG105_2S', TXMLDGI4lzColumn);
  RegisterChildNode('RXXXXG5', TXMLDecimal12Column_R);
  RegisterChildNode('RXXXXG6', TXMLDecimal12Column_R);
  RegisterChildNode('RXXXXG008', TXMLDGI3nomColumn);
  RegisterChildNode('RXXXXG009', TXMLCodPilgColumn);
  RegisterChildNode('RXXXXG010', TXMLDecimal2Column_P);
  RegisterChildNode('RXXXXG11_10', TXMLDecimal6Column_R);
  RegisterChildNode('RXXXXG011', TXMLDGI3nomColumn);
  FRXXXXG3S := CreateCollection(TXMLStrColumnList, IXMLStrColumn, 'RXXXXG3S') as IXMLStrColumnList;
  FRXXXXG4 := CreateCollection(TXMLUKTZEDColumnList, IXMLUKTZEDColumn, 'RXXXXG4') as IXMLUKTZEDColumnList;
  FRXXXXG32 := CreateCollection(TXMLChkColumnList, IXMLChkColumn, 'RXXXXG32') as IXMLChkColumnList;
  FRXXXXG33 := CreateCollection(TXMLDKPPColumnList, IXMLDKPPColumn, 'RXXXXG33') as IXMLDKPPColumnList;
  FRXXXXG4S := CreateCollection(TXMLStrColumnList, IXMLStrColumn, 'RXXXXG4S') as IXMLStrColumnList;
  FRXXXXG105_2S := CreateCollection(TXMLDGI4lzColumnList, IXMLDGI4lzColumn, 'RXXXXG105_2S') as IXMLDGI4lzColumnList;
  FRXXXXG5 := CreateCollection(TXMLDecimal12Column_RList, IXMLDecimal12Column_R, 'RXXXXG5') as IXMLDecimal12Column_RList;
  FRXXXXG6 := CreateCollection(TXMLDecimal12Column_RList, IXMLDecimal12Column_R, 'RXXXXG6') as IXMLDecimal12Column_RList;
  FRXXXXG008 := CreateCollection(TXMLDGI3nomColumnList, IXMLDGI3nomColumn, 'RXXXXG008') as IXMLDGI3nomColumnList;
  FRXXXXG009 := CreateCollection(TXMLCodPilgColumnList, IXMLCodPilgColumn, 'RXXXXG009') as IXMLCodPilgColumnList;
  FRXXXXG010 := CreateCollection(TXMLDecimal2Column_PList, IXMLDecimal2Column_P, 'RXXXXG010') as IXMLDecimal2Column_PList;
  FRXXXXG11_10 := CreateCollection(TXMLDecimal6Column_RList, IXMLDecimal6Column_R, 'RXXXXG11_10') as IXMLDecimal6Column_RList;
  FRXXXXG011 := CreateCollection(TXMLDGI3nomColumnList, IXMLDGI3nomColumn, 'RXXXXG011') as IXMLDGI3nomColumnList;
  inherited;
end;

function TXMLDBody.Get_R01G1: Int64;
begin
  Result := ChildNodes['R01G1'].NodeValue;
end;

procedure TXMLDBody.Set_R01G1(Value: Int64);
begin
  ChildNodes['R01G1'].NodeValue := Value;
end;

function TXMLDBody.Get_R03G10S: WideString;
begin
  Result := ChildNodes['R03G10S'].Text;
end;

procedure TXMLDBody.Set_R03G10S(Value: WideString);
begin
  ChildNodes['R03G10S'].NodeValue := Value;
end;

function TXMLDBody.Get_HORIG1: Integer;
begin
  Result := ChildNodes['HORIG1'].NodeValue;
end;

procedure TXMLDBody.Set_HORIG1(Value: Integer);
begin
  ChildNodes['HORIG1'].NodeValue := Value;
end;

function TXMLDBody.Get_HTYPR: WideString;
begin
  Result := ChildNodes['HTYPR'].Text;
end;

procedure TXMLDBody.Set_HTYPR(Value: WideString);
begin
  ChildNodes['HTYPR'].NodeValue := Value;
end;

function TXMLDBody.Get_HFILL: WideString;
begin
  Result := ChildNodes['HFILL'].Text;
end;

procedure TXMLDBody.Set_HFILL(Value: WideString);
begin
  ChildNodes['HFILL'].NodeValue := Value;
end;

function TXMLDBody.Get_HNUM: Int64;
begin
  Result := ChildNodes['HNUM'].NodeValue;
end;

procedure TXMLDBody.Set_HNUM(Value: Int64);
begin
  ChildNodes['HNUM'].NodeValue := Value;
end;

function TXMLDBody.Get_HNUM1: Int64;
begin
  Result := ChildNodes['HNUM1'].NodeValue;
end;

procedure TXMLDBody.Set_HNUM1(Value: Int64);
begin
  ChildNodes['HNUM1'].NodeValue := Value;
end;

function TXMLDBody.Get_HNAMESEL: WideString;
begin
  Result := ChildNodes['HNAMESEL'].Text;
end;

procedure TXMLDBody.Set_HNAMESEL(Value: WideString);
begin
  ChildNodes['HNAMESEL'].NodeValue := Value;
end;

function TXMLDBody.Get_HNAMEBUY: WideString;
begin
  Result := ChildNodes['HNAMEBUY'].Text;
end;

procedure TXMLDBody.Set_HNAMEBUY(Value: WideString);
begin
  ChildNodes['HNAMEBUY'].NodeValue := Value;
end;

function TXMLDBody.Get_HKSEL: WideString;
begin
  Result := ChildNodes['HKSEL'].Text;
end;

procedure TXMLDBody.Set_HKSEL(Value: WideString);
begin
  ChildNodes['HKSEL'].NodeValue := Value;
end;

function TXMLDBody.Get_HNUM2: Int64;
begin
  Result := ChildNodes['HNUM2'].NodeValue;
end;

procedure TXMLDBody.Set_HNUM2(Value: Int64);
begin
  ChildNodes['HNUM2'].NodeValue := Value;
end;

function TXMLDBody.Get_HTINSEL: WideString;
begin
  Result := ChildNodes['HTINSEL'].Text;
end;

procedure TXMLDBody.Set_HTINSEL(Value: WideString);
begin
  ChildNodes['HTINSEL'].NodeValue := Value;
end;

function TXMLDBody.Get_HKS: Int64;
begin
  Result := ChildNodes['HKS'].NodeValue;
end;

procedure TXMLDBody.Set_HKS(Value: Int64);
begin
  ChildNodes['HKS'].NodeValue := Value;
end;

function TXMLDBody.Get_HKBUY: WideString;
begin
  Result := ChildNodes['HKBUY'].Text;
end;

procedure TXMLDBody.Set_HKBUY(Value: WideString);
begin
  ChildNodes['HKBUY'].NodeValue := Value;
end;

function TXMLDBody.Get_HFBUY: Int64;
begin
  Result := ChildNodes['HFBUY'].NodeValue;
end;

procedure TXMLDBody.Set_HFBUY(Value: Int64);
begin
  ChildNodes['HFBUY'].NodeValue := Value;
end;

function TXMLDBody.Get_HTINBUY: WideString;
begin
  Result := ChildNodes['HTINBUY'].Text;
end;

procedure TXMLDBody.Set_HTINBUY(Value: WideString);
begin
  ChildNodes['HTINBUY'].NodeValue := Value;
end;

function TXMLDBody.Get_HKB: Int64;
begin
  Result := ChildNodes['HKB'].NodeValue;
end;

procedure TXMLDBody.Set_HKB(Value: Int64);
begin
  ChildNodes['HKB'].NodeValue := Value;
end;

function TXMLDBody.Get_R04G11: WideString;
begin
  Result := ChildNodes['R04G11'].Text;
end;

procedure TXMLDBody.Set_R04G11(Value: WideString);
begin
  ChildNodes['R04G11'].NodeValue := Value;
end;

function TXMLDBody.Get_R03G11: WideString;
begin
  Result := ChildNodes['R03G11'].Text;
end;

procedure TXMLDBody.Set_R03G11(Value: WideString);
begin
  ChildNodes['R03G11'].NodeValue := Value;
end;

function TXMLDBody.Get_R03G7: WideString;
begin
  Result := ChildNodes['R03G7'].Text;
end;

procedure TXMLDBody.Set_R03G7(Value: WideString);
begin
  ChildNodes['R03G7'].NodeValue := Value;
end;

function TXMLDBody.Get_R03G109: WideString;
begin
  Result := ChildNodes['R03G109'].Text;
end;

procedure TXMLDBody.Set_R03G109(Value: WideString);
begin
  ChildNodes['R03G109'].NodeValue := Value;
end;

function TXMLDBody.Get_R01G7: WideString;
begin
  Result := ChildNodes['R01G7'].Text;
end;

procedure TXMLDBody.Set_R01G7(Value: WideString);
begin
  ChildNodes['R01G7'].NodeValue := Value;
end;

function TXMLDBody.Get_R01G109: WideString;
begin
  Result := ChildNodes['R01G109'].Text;
end;

procedure TXMLDBody.Set_R01G109(Value: WideString);
begin
  ChildNodes['R01G109'].NodeValue := Value;
end;

function TXMLDBody.Get_R01G9: WideString;
begin
  Result := ChildNodes['R01G9'].Text;
end;

procedure TXMLDBody.Set_R01G9(Value: WideString);
begin
  ChildNodes['R01G9'].NodeValue := Value;
end;

function TXMLDBody.Get_R01G8: WideString;
begin
  Result := ChildNodes['R01G8'].Text;
end;

procedure TXMLDBody.Set_R01G8(Value: WideString);
begin
  ChildNodes['R01G8'].NodeValue := Value;
end;

function TXMLDBody.Get_R01G10: WideString;
begin
  Result := ChildNodes['R01G10'].Text;
end;

procedure TXMLDBody.Set_R01G10(Value: WideString);
begin
  ChildNodes['R01G10'].NodeValue := Value;
end;

function TXMLDBody.Get_R02G11: WideString;
begin
  Result := ChildNodes['R02G11'].Text;
end;

procedure TXMLDBody.Set_R02G11(Value: WideString);
begin
  ChildNodes['R02G11'].NodeValue := Value;
end;

function TXMLDBody.Get_RXXXXG3S: IXMLStrColumnList;
begin
  Result := FRXXXXG3S;
end;

function TXMLDBody.Get_RXXXXG4: IXMLUKTZEDColumnList;
begin
  Result := FRXXXXG4;
end;

function TXMLDBody.Get_RXXXXG32: IXMLChkColumnList;
begin
  Result := FRXXXXG32;
end;

function TXMLDBody.Get_RXXXXG33: IXMLDKPPColumnList;
begin
  Result := FRXXXXG33;
end;

function TXMLDBody.Get_RXXXXG4S: IXMLStrColumnList;
begin
  Result := FRXXXXG4S;
end;

function TXMLDBody.Get_RXXXXG105_2S: IXMLDGI4lzColumnList;
begin
  Result := FRXXXXG105_2S;
end;

function TXMLDBody.Get_RXXXXG5: IXMLDecimal12Column_RList;
begin
  Result := FRXXXXG5;
end;

function TXMLDBody.Get_RXXXXG6: IXMLDecimal12Column_RList;
begin
  Result := FRXXXXG6;
end;

function TXMLDBody.Get_RXXXXG008: IXMLDGI3nomColumnList;
begin
  Result := FRXXXXG008;
end;

function TXMLDBody.Get_RXXXXG009: IXMLCodPilgColumnList;
begin
  Result := FRXXXXG009;
end;

function TXMLDBody.Get_RXXXXG010: IXMLDecimal2Column_PList;
begin
  Result := FRXXXXG010;
end;

function TXMLDBody.Get_RXXXXG11_10: IXMLDecimal6Column_RList;
begin
  Result := FRXXXXG11_10;
end;

function TXMLDBody.Get_RXXXXG011: IXMLDGI3nomColumnList;
begin
  Result := FRXXXXG011;
end;

function TXMLDBody.Get_HBOS: WideString;
begin
  Result := ChildNodes['HBOS'].Text;
end;

procedure TXMLDBody.Set_HBOS(Value: WideString);
begin
  ChildNodes['HBOS'].NodeValue := Value;
end;

function TXMLDBody.Get_HKBOS: WideString;
begin
  Result := ChildNodes['HKBOS'].Text;
end;

procedure TXMLDBody.Set_HKBOS(Value: WideString);
begin
  ChildNodes['HKBOS'].NodeValue := Value;
end;

function TXMLDBody.Get_R003G10S: WideString;
begin
  Result := ChildNodes['R003G10S'].Text;
end;

procedure TXMLDBody.Set_R003G10S(Value: WideString);
begin
  ChildNodes['R003G10S'].NodeValue := Value;
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

{ TXMLUKTZEDColumn }

function TXMLUKTZEDColumn.Get_ROWNUM: Integer;
begin
  Result := AttributeNodes['ROWNUM'].NodeValue;
end;

procedure TXMLUKTZEDColumn.Set_ROWNUM(Value: Integer);
begin
  SetAttribute('ROWNUM', Value);
end;

{ TXMLUKTZEDColumnList }

function TXMLUKTZEDColumnList.Add: IXMLUKTZEDColumn;
begin
  Result := AddItem(-1) as IXMLUKTZEDColumn;
end;

function TXMLUKTZEDColumnList.Insert(const Index: Integer): IXMLUKTZEDColumn;
begin
  Result := AddItem(Index) as IXMLUKTZEDColumn;
end;
function TXMLUKTZEDColumnList.Get_Item(Index: Integer): IXMLUKTZEDColumn;
begin
  Result := List[Index] as IXMLUKTZEDColumn;
end;

{ TXMLChkColumn }

function TXMLChkColumn.Get_ROWNUM: Integer;
begin
  Result := AttributeNodes['ROWNUM'].NodeValue;
end;

procedure TXMLChkColumn.Set_ROWNUM(Value: Integer);
begin
  SetAttribute('ROWNUM', Value);
end;

{ TXMLChkColumnList }

function TXMLChkColumnList.Add: IXMLChkColumn;
begin
  Result := AddItem(-1) as IXMLChkColumn;
end;

function TXMLChkColumnList.Insert(const Index: Integer): IXMLChkColumn;
begin
  Result := AddItem(Index) as IXMLChkColumn;
end;
function TXMLChkColumnList.Get_Item(Index: Integer): IXMLChkColumn;
begin
  Result := List[Index] as IXMLChkColumn;
end;

{ TXMLDKPPColumn }

function TXMLDKPPColumn.Get_ROWNUM: Integer;
begin
  Result := AttributeNodes['ROWNUM'].NodeValue;
end;

procedure TXMLDKPPColumn.Set_ROWNUM(Value: Integer);
begin
  SetAttribute('ROWNUM', Value);
end;

{ TXMLDKPPColumnList }

function TXMLDKPPColumnList.Add: IXMLDKPPColumn;
begin
  Result := AddItem(-1) as IXMLDKPPColumn;
end;

function TXMLDKPPColumnList.Insert(const Index: Integer): IXMLDKPPColumn;
begin
  Result := AddItem(Index) as IXMLDKPPColumn;
end;
function TXMLDKPPColumnList.Get_Item(Index: Integer): IXMLDKPPColumn;
begin
  Result := List[Index] as IXMLDKPPColumn;
end;

{ TXMLDGI4lzColumn }

function TXMLDGI4lzColumn.Get_ROWNUM: Integer;
begin
  Result := AttributeNodes['ROWNUM'].NodeValue;
end;

procedure TXMLDGI4lzColumn.Set_ROWNUM(Value: Integer);
begin
  SetAttribute('ROWNUM', Value);
end;

{ TXMLDGI4lzColumnList }

function TXMLDGI4lzColumnList.Add: IXMLDGI4lzColumn;
begin
  Result := AddItem(-1) as IXMLDGI4lzColumn;
end;

function TXMLDGI4lzColumnList.Insert(const Index: Integer): IXMLDGI4lzColumn;
begin
  Result := AddItem(Index) as IXMLDGI4lzColumn;
end;
function TXMLDGI4lzColumnList.Get_Item(Index: Integer): IXMLDGI4lzColumn;
begin
  Result := List[Index] as IXMLDGI4lzColumn;
end;

{ TXMLDecimal12Column_R }

function TXMLDecimal12Column_R.Get_ROWNUM: Integer;
begin
  Result := AttributeNodes['ROWNUM'].NodeValue;
end;

procedure TXMLDecimal12Column_R.Set_ROWNUM(Value: Integer);
begin
  SetAttribute('ROWNUM', Value);
end;

{ TXMLDecimal12Column_RList }

function TXMLDecimal12Column_RList.Add: IXMLDecimal12Column_R;
begin
  Result := AddItem(-1) as IXMLDecimal12Column_R;
end;

function TXMLDecimal12Column_RList.Insert(const Index: Integer): IXMLDecimal12Column_R;
begin
  Result := AddItem(Index) as IXMLDecimal12Column_R;
end;
function TXMLDecimal12Column_RList.Get_Item(Index: Integer): IXMLDecimal12Column_R;
begin
  Result := List[Index] as IXMLDecimal12Column_R;
end;

{ TXMLDGI3nomColumn }

function TXMLDGI3nomColumn.Get_ROWNUM: Integer;
begin
  Result := AttributeNodes['ROWNUM'].NodeValue;
end;

procedure TXMLDGI3nomColumn.Set_ROWNUM(Value: Integer);
begin
  SetAttribute('ROWNUM', Value);
end;

{ TXMLDGI3nomColumnList }

function TXMLDGI3nomColumnList.Add: IXMLDGI3nomColumn;
begin
  Result := AddItem(-1) as IXMLDGI3nomColumn;
end;

function TXMLDGI3nomColumnList.Insert(const Index: Integer): IXMLDGI3nomColumn;
begin
  Result := AddItem(Index) as IXMLDGI3nomColumn;
end;
function TXMLDGI3nomColumnList.Get_Item(Index: Integer): IXMLDGI3nomColumn;
begin
  Result := List[Index] as IXMLDGI3nomColumn;
end;

{ TXMLCodPilgColumn }

function TXMLCodPilgColumn.Get_ROWNUM: Integer;
begin
  Result := AttributeNodes['ROWNUM'].NodeValue;
end;

procedure TXMLCodPilgColumn.Set_ROWNUM(Value: Integer);
begin
  SetAttribute('ROWNUM', Value);
end;

{ TXMLCodPilgColumnList }

function TXMLCodPilgColumnList.Add: IXMLCodPilgColumn;
begin
  Result := AddItem(-1) as IXMLCodPilgColumn;
end;

function TXMLCodPilgColumnList.Insert(const Index: Integer): IXMLCodPilgColumn;
begin
  Result := AddItem(Index) as IXMLCodPilgColumn;
end;
function TXMLCodPilgColumnList.Get_Item(Index: Integer): IXMLCodPilgColumn;
begin
  Result := List[Index] as IXMLCodPilgColumn;
end;

{ TXMLDecimal2Column_P }

function TXMLDecimal2Column_P.Get_ROWNUM: Integer;
begin
  Result := AttributeNodes['ROWNUM'].NodeValue;
end;

procedure TXMLDecimal2Column_P.Set_ROWNUM(Value: Integer);
begin
  SetAttribute('ROWNUM', Value);
end;

{ TXMLDecimal2Column_PList }

function TXMLDecimal2Column_PList.Add: IXMLDecimal2Column_P;
begin
  Result := AddItem(-1) as IXMLDecimal2Column_P;
end;

function TXMLDecimal2Column_PList.Insert(const Index: Integer): IXMLDecimal2Column_P;
begin
  Result := AddItem(Index) as IXMLDecimal2Column_P;
end;
function TXMLDecimal2Column_PList.Get_Item(Index: Integer): IXMLDecimal2Column_P;
begin
  Result := List[Index] as IXMLDecimal2Column_P;
end;

{ TXMLDecimal6Column_R }

function TXMLDecimal6Column_R.Get_ROWNUM: Integer;
begin
  Result := AttributeNodes['ROWNUM'].NodeValue;
end;

procedure TXMLDecimal6Column_R.Set_ROWNUM(Value: Integer);
begin
  SetAttribute('ROWNUM', Value);
end;

{ TXMLDecimal6Column_RList }

function TXMLDecimal6Column_RList.Add: IXMLDecimal6Column_R;
begin
  Result := AddItem(-1) as IXMLDecimal6Column_R;
end;

function TXMLDecimal6Column_RList.Insert(const Index: Integer): IXMLDecimal6Column_R;
begin
  Result := AddItem(Index) as IXMLDecimal6Column_R;
end;
function TXMLDecimal6Column_RList.Get_Item(Index: Integer): IXMLDecimal6Column_R;
begin
  Result := List[Index] as IXMLDecimal6Column_R;
end;

end. 