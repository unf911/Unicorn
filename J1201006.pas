
{*************************************************************************}
{                                                                         }
{                            XML Data Binding                             }
{                                                                         }
{         Generated on: 15.12.2014 23:29:07                               }
{       Generated from: D:\data\work\UniSebest_git\Unicorn\J1201006.xsd   }
{   Settings stored in: D:\data\work\UniSebest_git\Unicorn\J1201006.xdb   }
{                                                                         }
{*************************************************************************}

unit J1201006;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLDeclarContent = interface;
  IXMLDHead = interface;
  IXMLLINKED_DOCS = interface;
  IXMLDOC = interface;
  IXMLDBody = interface;
  IXMLDateColumn = interface;
  IXMLDateColumnList = interface;
  IXMLStrColumn = interface;
  IXMLStrColumnList = interface;
  IXMLUKTZEDColumn = interface;
  IXMLUKTZEDColumnList = interface;
  IXMLDecimal6Column_R = interface;
  IXMLDecimal6Column_RList = interface;
  IXMLDecimal12Column_R = interface;
  IXMLDecimal12Column_RList = interface;
  IXMLDecimal2Column = interface;
  IXMLDecimal2ColumnList = interface;

{ IXMLDeclarContent }

  IXMLDeclarContent = interface(IXMLNode)
    ['{9E6591A1-482D-4009-BF6F-CE0954FC0955}']
    { Property Accessors }
    function Get_DECLARHEAD: IXMLDHead;
    function Get_DECLARBODY: IXMLDBody;
    { Methods & Properties }
    property DECLARHEAD: IXMLDHead read Get_DECLARHEAD;
    property DECLARBODY: IXMLDBody read Get_DECLARBODY;
  end;

{ IXMLDHead }

  IXMLDHead = interface(IXMLNode)
    ['{B8A2D9A7-4EF2-4B5A-92D1-80A77ACE15B8}']
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
    ['{992E4C24-FA7A-4C5C-A928-4BA7B3F15284}']
    { Property Accessors }
    function Get_DOC(Index: Integer): IXMLDOC;
    { Methods & Properties }
    function Add: IXMLDOC;
    function Insert(const Index: Integer): IXMLDOC;
    property DOC[Index: Integer]: IXMLDOC read Get_DOC; default;
  end;

{ IXMLDOC }

  IXMLDOC = interface(IXMLNode)
    ['{408DBAEA-8C4C-44F3-81B5-C1B72882A5D9}']
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
    ['{28F3DC98-099B-4B29-8233-FDF389479A7A}']
    { Property Accessors }
    function Get_HORIG: Integer;
    function Get_HCOPY: Integer;
    function Get_HEL: Integer;
    function Get_HERPN: Integer;
    function Get_HORIG1: Integer;
    function Get_HTYPR: WideString;
    function Get_HFILL: WideString;
    function Get_HNUM: Int64;
    function Get_HNUM1: Int64;
    function Get_HNUM2: Int64;
    function Get_HNAMESEL: WideString;
    function Get_HNAMEBUY: WideString;
    function Get_HKSEL: WideString;
    function Get_HKBUY: WideString;
    function Get_HLOCSEL: WideString;
    function Get_HLOCBUY: WideString;
    function Get_HTELSEL: WideString;
    function Get_HTELBUY: WideString;
    function Get_H01G1S: WideString;
    function Get_H01G2D: WideString;
    function Get_H01G3S: WideString;
    function Get_H02G1S: WideString;
    function Get_RXXXXG2D: IXMLDateColumnList;
    function Get_RXXXXG3S: IXMLStrColumnList;
    function Get_RXXXXG4: IXMLUKTZEDColumnList;
    function Get_RXXXXG4S: IXMLStrColumnList;
    function Get_RXXXXG5: IXMLDecimal6Column_RList;
    function Get_RXXXXG6: IXMLDecimal12Column_RList;
    function Get_RXXXXG7: IXMLDecimal2ColumnList;
    function Get_RXXXXG109: IXMLDecimal2ColumnList;
    function Get_RXXXXG8: IXMLDecimal2ColumnList;
    function Get_RXXXXG9: IXMLDecimal2ColumnList;
    function Get_RXXXXG10: IXMLDecimal2ColumnList;
    function Get_R01G7: WideString;
    function Get_R01G109: WideString;
    function Get_R01G8: WideString;
    function Get_R01G9: WideString;
    function Get_R01G10: WideString;
    function Get_R01G11: WideString;
    function Get_R02G11: WideString;
    function Get_R03G7: WideString;
    function Get_R03G109: WideString;
    function Get_R03G11: WideString;
    function Get_R04G7: WideString;
    function Get_R04G109: WideString;
    function Get_R04G8: WideString;
    function Get_R04G9: WideString;
    function Get_R04G10: WideString;
    function Get_R04G11: WideString;
    function Get_H10G1S: WideString;
    function Get_R003G10S: WideString;
    procedure Set_HORIG(Value: Integer);
    procedure Set_HCOPY(Value: Integer);
    procedure Set_HEL(Value: Integer);
    procedure Set_HERPN(Value: Integer);
    procedure Set_HORIG1(Value: Integer);
    procedure Set_HTYPR(Value: WideString);
    procedure Set_HFILL(Value: WideString);
    procedure Set_HNUM(Value: Int64);
    procedure Set_HNUM1(Value: Int64);
    procedure Set_HNUM2(Value: Int64);
    procedure Set_HNAMESEL(Value: WideString);
    procedure Set_HNAMEBUY(Value: WideString);
    procedure Set_HKSEL(Value: WideString);
    procedure Set_HKBUY(Value: WideString);
    procedure Set_HLOCSEL(Value: WideString);
    procedure Set_HLOCBUY(Value: WideString);
    procedure Set_HTELSEL(Value: WideString);
    procedure Set_HTELBUY(Value: WideString);
    procedure Set_H01G1S(Value: WideString);
    procedure Set_H01G2D(Value: WideString);
    procedure Set_H01G3S(Value: WideString);
    procedure Set_H02G1S(Value: WideString);
    procedure Set_R01G7(Value: WideString);
    procedure Set_R01G109(Value: WideString);
    procedure Set_R01G8(Value: WideString);
    procedure Set_R01G9(Value: WideString);
    procedure Set_R01G10(Value: WideString);
    procedure Set_R01G11(Value: WideString);
    procedure Set_R02G11(Value: WideString);
    procedure Set_R03G7(Value: WideString);
    procedure Set_R03G109(Value: WideString);
    procedure Set_R03G11(Value: WideString);
    procedure Set_R04G7(Value: WideString);
    procedure Set_R04G109(Value: WideString);
    procedure Set_R04G8(Value: WideString);
    procedure Set_R04G9(Value: WideString);
    procedure Set_R04G10(Value: WideString);
    procedure Set_R04G11(Value: WideString);
    procedure Set_H10G1S(Value: WideString);
    procedure Set_R003G10S(Value: WideString);
    { Methods & Properties }
    property HORIG: Integer read Get_HORIG write Set_HORIG;
    property HCOPY: Integer read Get_HCOPY write Set_HCOPY;
    property HEL: Integer read Get_HEL write Set_HEL;
    property HERPN: Integer read Get_HERPN write Set_HERPN;
    property HORIG1: Integer read Get_HORIG1 write Set_HORIG1;
    property HTYPR: WideString read Get_HTYPR write Set_HTYPR;
    property HFILL: WideString read Get_HFILL write Set_HFILL;
    property HNUM: Int64 read Get_HNUM write Set_HNUM;
    property HNUM1: Int64 read Get_HNUM1 write Set_HNUM1;
    property HNUM2: Int64 read Get_HNUM2 write Set_HNUM2;
    property HNAMESEL: WideString read Get_HNAMESEL write Set_HNAMESEL;
    property HNAMEBUY: WideString read Get_HNAMEBUY write Set_HNAMEBUY;
    property HKSEL: WideString read Get_HKSEL write Set_HKSEL;
    property HKBUY: WideString read Get_HKBUY write Set_HKBUY;
    property HLOCSEL: WideString read Get_HLOCSEL write Set_HLOCSEL;
    property HLOCBUY: WideString read Get_HLOCBUY write Set_HLOCBUY;
    property HTELSEL: WideString read Get_HTELSEL write Set_HTELSEL;
    property HTELBUY: WideString read Get_HTELBUY write Set_HTELBUY;
    property H01G1S: WideString read Get_H01G1S write Set_H01G1S;
    property H01G2D: WideString read Get_H01G2D write Set_H01G2D;
    property H01G3S: WideString read Get_H01G3S write Set_H01G3S;
    property H02G1S: WideString read Get_H02G1S write Set_H02G1S;
    property RXXXXG2D: IXMLDateColumnList read Get_RXXXXG2D;
    property RXXXXG3S: IXMLStrColumnList read Get_RXXXXG3S;
    property RXXXXG4: IXMLUKTZEDColumnList read Get_RXXXXG4;
    property RXXXXG4S: IXMLStrColumnList read Get_RXXXXG4S;
    property RXXXXG5: IXMLDecimal6Column_RList read Get_RXXXXG5;
    property RXXXXG6: IXMLDecimal12Column_RList read Get_RXXXXG6;
    property RXXXXG7: IXMLDecimal2ColumnList read Get_RXXXXG7;
    property RXXXXG109: IXMLDecimal2ColumnList read Get_RXXXXG109;
    property RXXXXG8: IXMLDecimal2ColumnList read Get_RXXXXG8;
    property RXXXXG9: IXMLDecimal2ColumnList read Get_RXXXXG9;
    property RXXXXG10: IXMLDecimal2ColumnList read Get_RXXXXG10;
    property R01G7: WideString read Get_R01G7 write Set_R01G7;
    property R01G109: WideString read Get_R01G109 write Set_R01G109;
    property R01G8: WideString read Get_R01G8 write Set_R01G8;
    property R01G9: WideString read Get_R01G9 write Set_R01G9;
    property R01G10: WideString read Get_R01G10 write Set_R01G10;
    property R01G11: WideString read Get_R01G11 write Set_R01G11;
    property R02G11: WideString read Get_R02G11 write Set_R02G11;
    property R03G7: WideString read Get_R03G7 write Set_R03G7;
    property R03G109: WideString read Get_R03G109 write Set_R03G109;
    property R03G11: WideString read Get_R03G11 write Set_R03G11;
    property R04G7: WideString read Get_R04G7 write Set_R04G7;
    property R04G109: WideString read Get_R04G109 write Set_R04G109;
    property R04G8: WideString read Get_R04G8 write Set_R04G8;
    property R04G9: WideString read Get_R04G9 write Set_R04G9;
    property R04G10: WideString read Get_R04G10 write Set_R04G10;
    property R04G11: WideString read Get_R04G11 write Set_R04G11;
    property H10G1S: WideString read Get_H10G1S write Set_H10G1S;
    property R003G10S: WideString read Get_R003G10S write Set_R003G10S;
  end;

{ IXMLDateColumn }

  IXMLDateColumn = interface(IXMLNode)
    ['{3E09D114-6E6A-4CAE-BE7A-A5397AEE2C88}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLDateColumnList }

  IXMLDateColumnList = interface(IXMLNodeCollection)
    ['{10E36F74-E0AB-4A42-9510-86898FB4C67A}']
    { Methods & Properties }
    function Add: IXMLDateColumn;
    function Insert(const Index: Integer): IXMLDateColumn;
    function Get_Item(Index: Integer): IXMLDateColumn;
    property Items[Index: Integer]: IXMLDateColumn read Get_Item; default;
  end;

{ IXMLStrColumn }

  IXMLStrColumn = interface(IXMLNode)
    ['{770D09CB-6618-4756-9456-E75F5BD2BD7C}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLStrColumnList }

  IXMLStrColumnList = interface(IXMLNodeCollection)
    ['{B785E355-FA37-44D6-A391-245838A4C76C}']
    { Methods & Properties }
    function Add: IXMLStrColumn;
    function Insert(const Index: Integer): IXMLStrColumn;
    function Get_Item(Index: Integer): IXMLStrColumn;
    property Items[Index: Integer]: IXMLStrColumn read Get_Item; default;
  end;

{ IXMLUKTZEDColumn }

  IXMLUKTZEDColumn = interface(IXMLNode)
    ['{08342E0A-5EED-446F-AB3C-DAD17A47FF0F}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLUKTZEDColumnList }

  IXMLUKTZEDColumnList = interface(IXMLNodeCollection)
    ['{CF094B38-48C8-4D36-8A47-F30F01ACFF62}']
    { Methods & Properties }
    function Add: IXMLUKTZEDColumn;
    function Insert(const Index: Integer): IXMLUKTZEDColumn;
    function Get_Item(Index: Integer): IXMLUKTZEDColumn;
    property Items[Index: Integer]: IXMLUKTZEDColumn read Get_Item; default;
  end;

{ IXMLDecimal6Column_R }

  IXMLDecimal6Column_R = interface(IXMLNode)
    ['{479B17E9-9645-41EE-AEC1-B1A2D3D831E9}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLDecimal6Column_RList }

  IXMLDecimal6Column_RList = interface(IXMLNodeCollection)
    ['{31ED34B8-5CA0-4A0F-8ABC-0A5385788BB1}']
    { Methods & Properties }
    function Add: IXMLDecimal6Column_R;
    function Insert(const Index: Integer): IXMLDecimal6Column_R;
    function Get_Item(Index: Integer): IXMLDecimal6Column_R;
    property Items[Index: Integer]: IXMLDecimal6Column_R read Get_Item; default;
  end;

{ IXMLDecimal12Column_R }

  IXMLDecimal12Column_R = interface(IXMLNode)
    ['{B9063C14-1204-45A1-B852-093CB778321D}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLDecimal12Column_RList }

  IXMLDecimal12Column_RList = interface(IXMLNodeCollection)
    ['{231A35F9-B94E-4021-ADE3-18710B5E4307}']
    { Methods & Properties }
    function Add: IXMLDecimal12Column_R;
    function Insert(const Index: Integer): IXMLDecimal12Column_R;
    function Get_Item(Index: Integer): IXMLDecimal12Column_R;
    property Items[Index: Integer]: IXMLDecimal12Column_R read Get_Item; default;
  end;

{ IXMLDecimal2Column }

  IXMLDecimal2Column = interface(IXMLNode)
    ['{F4FFE5DA-D928-4AA8-A639-0CA981F83FE7}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLDecimal2ColumnList }

  IXMLDecimal2ColumnList = interface(IXMLNodeCollection)
    ['{E49B4786-5AA3-4130-8CCC-7252F97BADCC}']
    { Methods & Properties }
    function Add: IXMLDecimal2Column;
    function Insert(const Index: Integer): IXMLDecimal2Column;
    function Get_Item(Index: Integer): IXMLDecimal2Column;
    property Items[Index: Integer]: IXMLDecimal2Column read Get_Item; default;
  end;

{ Forward Decls }

  TXMLDeclarContent = class;
  TXMLDHead = class;
  TXMLLINKED_DOCS = class;
  TXMLDOC = class;
  TXMLDBody = class;
  TXMLDateColumn = class;
  TXMLDateColumnList = class;
  TXMLStrColumn = class;
  TXMLStrColumnList = class;
  TXMLUKTZEDColumn = class;
  TXMLUKTZEDColumnList = class;
  TXMLDecimal6Column_R = class;
  TXMLDecimal6Column_RList = class;
  TXMLDecimal12Column_R = class;
  TXMLDecimal12Column_RList = class;
  TXMLDecimal2Column = class;
  TXMLDecimal2ColumnList = class;

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
    FRXXXXG2D: IXMLDateColumnList;
    FRXXXXG3S: IXMLStrColumnList;
    FRXXXXG4: IXMLUKTZEDColumnList;
    FRXXXXG4S: IXMLStrColumnList;
    FRXXXXG5: IXMLDecimal6Column_RList;
    FRXXXXG6: IXMLDecimal12Column_RList;
    FRXXXXG7: IXMLDecimal2ColumnList;
    FRXXXXG109: IXMLDecimal2ColumnList;
    FRXXXXG8: IXMLDecimal2ColumnList;
    FRXXXXG9: IXMLDecimal2ColumnList;
    FRXXXXG10: IXMLDecimal2ColumnList;
  protected
    { IXMLDBody }
    function Get_HORIG: Integer;
    function Get_HCOPY: Integer;
    function Get_HEL: Integer;
    function Get_HERPN: Integer;
    function Get_HORIG1: Integer;
    function Get_HTYPR: WideString;
    function Get_HFILL: WideString;
    function Get_HNUM: Int64;
    function Get_HNUM1: Int64;
    function Get_HNUM2: Int64;
    function Get_HNAMESEL: WideString;
    function Get_HNAMEBUY: WideString;
    function Get_HKSEL: WideString;
    function Get_HKBUY: WideString;
    function Get_HLOCSEL: WideString;
    function Get_HLOCBUY: WideString;
    function Get_HTELSEL: WideString;
    function Get_HTELBUY: WideString;
    function Get_H01G1S: WideString;
    function Get_H01G2D: WideString;
    function Get_H01G3S: WideString;
    function Get_H02G1S: WideString;
    function Get_RXXXXG2D: IXMLDateColumnList;
    function Get_RXXXXG3S: IXMLStrColumnList;
    function Get_RXXXXG4: IXMLUKTZEDColumnList;
    function Get_RXXXXG4S: IXMLStrColumnList;
    function Get_RXXXXG5: IXMLDecimal6Column_RList;
    function Get_RXXXXG6: IXMLDecimal12Column_RList;
    function Get_RXXXXG7: IXMLDecimal2ColumnList;
    function Get_RXXXXG109: IXMLDecimal2ColumnList;
    function Get_RXXXXG8: IXMLDecimal2ColumnList;
    function Get_RXXXXG9: IXMLDecimal2ColumnList;
    function Get_RXXXXG10: IXMLDecimal2ColumnList;
    function Get_R01G7: WideString;
    function Get_R01G109: WideString;
    function Get_R01G8: WideString;
    function Get_R01G9: WideString;
    function Get_R01G10: WideString;
    function Get_R01G11: WideString;
    function Get_R02G11: WideString;
    function Get_R03G7: WideString;
    function Get_R03G109: WideString;
    function Get_R03G11: WideString;
    function Get_R04G7: WideString;
    function Get_R04G109: WideString;
    function Get_R04G8: WideString;
    function Get_R04G9: WideString;
    function Get_R04G10: WideString;
    function Get_R04G11: WideString;
    function Get_H10G1S: WideString;
    function Get_R003G10S: WideString;
    procedure Set_HORIG(Value: Integer);
    procedure Set_HCOPY(Value: Integer);
    procedure Set_HEL(Value: Integer);
    procedure Set_HERPN(Value: Integer);
    procedure Set_HORIG1(Value: Integer);
    procedure Set_HTYPR(Value: WideString);
    procedure Set_HFILL(Value: WideString);
    procedure Set_HNUM(Value: Int64);
    procedure Set_HNUM1(Value: Int64);
    procedure Set_HNUM2(Value: Int64);
    procedure Set_HNAMESEL(Value: WideString);
    procedure Set_HNAMEBUY(Value: WideString);
    procedure Set_HKSEL(Value: WideString);
    procedure Set_HKBUY(Value: WideString);
    procedure Set_HLOCSEL(Value: WideString);
    procedure Set_HLOCBUY(Value: WideString);
    procedure Set_HTELSEL(Value: WideString);
    procedure Set_HTELBUY(Value: WideString);
    procedure Set_H01G1S(Value: WideString);
    procedure Set_H01G2D(Value: WideString);
    procedure Set_H01G3S(Value: WideString);
    procedure Set_H02G1S(Value: WideString);
    procedure Set_R01G7(Value: WideString);
    procedure Set_R01G109(Value: WideString);
    procedure Set_R01G8(Value: WideString);
    procedure Set_R01G9(Value: WideString);
    procedure Set_R01G10(Value: WideString);
    procedure Set_R01G11(Value: WideString);
    procedure Set_R02G11(Value: WideString);
    procedure Set_R03G7(Value: WideString);
    procedure Set_R03G109(Value: WideString);
    procedure Set_R03G11(Value: WideString);
    procedure Set_R04G7(Value: WideString);
    procedure Set_R04G109(Value: WideString);
    procedure Set_R04G8(Value: WideString);
    procedure Set_R04G9(Value: WideString);
    procedure Set_R04G10(Value: WideString);
    procedure Set_R04G11(Value: WideString);
    procedure Set_H10G1S(Value: WideString);
    procedure Set_R003G10S(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDateColumn }

  TXMLDateColumn = class(TXMLNode, IXMLDateColumn)
  protected
    { IXMLDateColumn }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
  end;

{ TXMLDateColumnList }

  TXMLDateColumnList = class(TXMLNodeCollection, IXMLDateColumnList)
  protected
    { IXMLDateColumnList }
    function Add: IXMLDateColumn;
    function Insert(const Index: Integer): IXMLDateColumn;
    function Get_Item(Index: Integer): IXMLDateColumn;
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
  RegisterChildNode('RXXXXG2D', TXMLDateColumn);
  RegisterChildNode('RXXXXG3S', TXMLStrColumn);
  RegisterChildNode('RXXXXG4', TXMLUKTZEDColumn);
  RegisterChildNode('RXXXXG4S', TXMLStrColumn);
  RegisterChildNode('RXXXXG5', TXMLDecimal6Column_R);
  RegisterChildNode('RXXXXG6', TXMLDecimal12Column_R);
  RegisterChildNode('RXXXXG7', TXMLDecimal2Column);
  RegisterChildNode('RXXXXG109', TXMLDecimal2Column);
  RegisterChildNode('RXXXXG8', TXMLDecimal2Column);
  RegisterChildNode('RXXXXG9', TXMLDecimal2Column);
  RegisterChildNode('RXXXXG10', TXMLDecimal2Column);
  FRXXXXG2D := CreateCollection(TXMLDateColumnList, IXMLDateColumn, 'RXXXXG2D') as IXMLDateColumnList;
  FRXXXXG3S := CreateCollection(TXMLStrColumnList, IXMLStrColumn, 'RXXXXG3S') as IXMLStrColumnList;
  FRXXXXG4 := CreateCollection(TXMLUKTZEDColumnList, IXMLUKTZEDColumn, 'RXXXXG4') as IXMLUKTZEDColumnList;
  FRXXXXG4S := CreateCollection(TXMLStrColumnList, IXMLStrColumn, 'RXXXXG4S') as IXMLStrColumnList;
  FRXXXXG5 := CreateCollection(TXMLDecimal6Column_RList, IXMLDecimal6Column_R, 'RXXXXG5') as IXMLDecimal6Column_RList;
  FRXXXXG6 := CreateCollection(TXMLDecimal12Column_RList, IXMLDecimal12Column_R, 'RXXXXG6') as IXMLDecimal12Column_RList;
  FRXXXXG7 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'RXXXXG7') as IXMLDecimal2ColumnList;
  FRXXXXG109 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'RXXXXG109') as IXMLDecimal2ColumnList;
  FRXXXXG8 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'RXXXXG8') as IXMLDecimal2ColumnList;
  FRXXXXG9 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'RXXXXG9') as IXMLDecimal2ColumnList;
  FRXXXXG10 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'RXXXXG10') as IXMLDecimal2ColumnList;
  inherited;
end;

function TXMLDBody.Get_HORIG: Integer;
begin
  Result := ChildNodes['HORIG'].NodeValue;
end;

procedure TXMLDBody.Set_HORIG(Value: Integer);
begin
  ChildNodes['HORIG'].NodeValue := Value;
end;

function TXMLDBody.Get_HCOPY: Integer;
begin
  Result := ChildNodes['HCOPY'].NodeValue;
end;

procedure TXMLDBody.Set_HCOPY(Value: Integer);
begin
  ChildNodes['HCOPY'].NodeValue := Value;
end;

function TXMLDBody.Get_HEL: Integer;
begin
  Result := ChildNodes['HEL'].NodeValue;
end;

procedure TXMLDBody.Set_HEL(Value: Integer);
begin
  ChildNodes['HEL'].NodeValue := Value;
end;

function TXMLDBody.Get_HERPN: Integer;
begin
  Result := ChildNodes['HERPN'].NodeValue;
end;

procedure TXMLDBody.Set_HERPN(Value: Integer);
begin
  ChildNodes['HERPN'].NodeValue := Value;
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

function TXMLDBody.Get_HNUM2: Int64;
begin
  Result := ChildNodes['HNUM2'].NodeValue;
end;

procedure TXMLDBody.Set_HNUM2(Value: Int64);
begin
  ChildNodes['HNUM2'].NodeValue := Value;
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

function TXMLDBody.Get_HKBUY: WideString;
begin
  Result := ChildNodes['HKBUY'].Text;
end;

procedure TXMLDBody.Set_HKBUY(Value: WideString);
begin
  ChildNodes['HKBUY'].NodeValue := Value;
end;

function TXMLDBody.Get_HLOCSEL: WideString;
begin
  Result := ChildNodes['HLOCSEL'].Text;
end;

procedure TXMLDBody.Set_HLOCSEL(Value: WideString);
begin
  ChildNodes['HLOCSEL'].NodeValue := Value;
end;

function TXMLDBody.Get_HLOCBUY: WideString;
begin
  Result := ChildNodes['HLOCBUY'].Text;
end;

procedure TXMLDBody.Set_HLOCBUY(Value: WideString);
begin
  ChildNodes['HLOCBUY'].NodeValue := Value;
end;

function TXMLDBody.Get_HTELSEL: WideString;
begin
  Result := ChildNodes['HTELSEL'].Text;
end;

procedure TXMLDBody.Set_HTELSEL(Value: WideString);
begin
  ChildNodes['HTELSEL'].NodeValue := Value;
end;

function TXMLDBody.Get_HTELBUY: WideString;
begin
  Result := ChildNodes['HTELBUY'].Text;
end;

procedure TXMLDBody.Set_HTELBUY(Value: WideString);
begin
  ChildNodes['HTELBUY'].NodeValue := Value;
end;

function TXMLDBody.Get_H01G1S: WideString;
begin
  Result := ChildNodes['H01G1S'].Text;
end;

procedure TXMLDBody.Set_H01G1S(Value: WideString);
begin
  ChildNodes['H01G1S'].NodeValue := Value;
end;

function TXMLDBody.Get_H01G2D: WideString;
begin
  Result := ChildNodes['H01G2D'].Text;
end;

procedure TXMLDBody.Set_H01G2D(Value: WideString);
begin
  ChildNodes['H01G2D'].NodeValue := Value;
end;

function TXMLDBody.Get_H01G3S: WideString;
begin
  Result := ChildNodes['H01G3S'].Text;
end;

procedure TXMLDBody.Set_H01G3S(Value: WideString);
begin
  ChildNodes['H01G3S'].NodeValue := Value;
end;

function TXMLDBody.Get_H02G1S: WideString;
begin
  Result := ChildNodes['H02G1S'].Text;
end;

procedure TXMLDBody.Set_H02G1S(Value: WideString);
begin
  ChildNodes['H02G1S'].NodeValue := Value;
end;

function TXMLDBody.Get_RXXXXG2D: IXMLDateColumnList;
begin
  Result := FRXXXXG2D;
end;

function TXMLDBody.Get_RXXXXG3S: IXMLStrColumnList;
begin
  Result := FRXXXXG3S;
end;

function TXMLDBody.Get_RXXXXG4: IXMLUKTZEDColumnList;
begin
  Result := FRXXXXG4;
end;

function TXMLDBody.Get_RXXXXG4S: IXMLStrColumnList;
begin
  Result := FRXXXXG4S;
end;

function TXMLDBody.Get_RXXXXG5: IXMLDecimal6Column_RList;
begin
  Result := FRXXXXG5;
end;

function TXMLDBody.Get_RXXXXG6: IXMLDecimal12Column_RList;
begin
  Result := FRXXXXG6;
end;

function TXMLDBody.Get_RXXXXG7: IXMLDecimal2ColumnList;
begin
  Result := FRXXXXG7;
end;

function TXMLDBody.Get_RXXXXG109: IXMLDecimal2ColumnList;
begin
  Result := FRXXXXG109;
end;

function TXMLDBody.Get_RXXXXG8: IXMLDecimal2ColumnList;
begin
  Result := FRXXXXG8;
end;

function TXMLDBody.Get_RXXXXG9: IXMLDecimal2ColumnList;
begin
  Result := FRXXXXG9;
end;

function TXMLDBody.Get_RXXXXG10: IXMLDecimal2ColumnList;
begin
  Result := FRXXXXG10;
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

function TXMLDBody.Get_R01G8: WideString;
begin
  Result := ChildNodes['R01G8'].Text;
end;

procedure TXMLDBody.Set_R01G8(Value: WideString);
begin
  ChildNodes['R01G8'].NodeValue := Value;
end;

function TXMLDBody.Get_R01G9: WideString;
begin
  Result := ChildNodes['R01G9'].Text;
end;

procedure TXMLDBody.Set_R01G9(Value: WideString);
begin
  ChildNodes['R01G9'].NodeValue := Value;
end;

function TXMLDBody.Get_R01G10: WideString;
begin
  Result := ChildNodes['R01G10'].Text;
end;

procedure TXMLDBody.Set_R01G10(Value: WideString);
begin
  ChildNodes['R01G10'].NodeValue := Value;
end;

function TXMLDBody.Get_R01G11: WideString;
begin
  Result := ChildNodes['R01G11'].Text;
end;

procedure TXMLDBody.Set_R01G11(Value: WideString);
begin
  ChildNodes['R01G11'].NodeValue := Value;
end;

function TXMLDBody.Get_R02G11: WideString;
begin
  Result := ChildNodes['R02G11'].Text;
end;

procedure TXMLDBody.Set_R02G11(Value: WideString);
begin
  ChildNodes['R02G11'].NodeValue := Value;
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

function TXMLDBody.Get_R03G11: WideString;
begin
  Result := ChildNodes['R03G11'].Text;
end;

procedure TXMLDBody.Set_R03G11(Value: WideString);
begin
  ChildNodes['R03G11'].NodeValue := Value;
end;

function TXMLDBody.Get_R04G7: WideString;
begin
  Result := ChildNodes['R04G7'].Text;
end;

procedure TXMLDBody.Set_R04G7(Value: WideString);
begin
  ChildNodes['R04G7'].NodeValue := Value;
end;

function TXMLDBody.Get_R04G109: WideString;
begin
  Result := ChildNodes['R04G109'].Text;
end;

procedure TXMLDBody.Set_R04G109(Value: WideString);
begin
  ChildNodes['R04G109'].NodeValue := Value;
end;

function TXMLDBody.Get_R04G8: WideString;
begin
  Result := ChildNodes['R04G8'].Text;
end;

procedure TXMLDBody.Set_R04G8(Value: WideString);
begin
  ChildNodes['R04G8'].NodeValue := Value;
end;

function TXMLDBody.Get_R04G9: WideString;
begin
  Result := ChildNodes['R04G9'].Text;
end;

procedure TXMLDBody.Set_R04G9(Value: WideString);
begin
  ChildNodes['R04G9'].NodeValue := Value;
end;

function TXMLDBody.Get_R04G10: WideString;
begin
  Result := ChildNodes['R04G10'].Text;
end;

procedure TXMLDBody.Set_R04G10(Value: WideString);
begin
  ChildNodes['R04G10'].NodeValue := Value;
end;

function TXMLDBody.Get_R04G11: WideString;
begin
  Result := ChildNodes['R04G11'].Text;
end;

procedure TXMLDBody.Set_R04G11(Value: WideString);
begin
  ChildNodes['R04G11'].NodeValue := Value;
end;

function TXMLDBody.Get_H10G1S: WideString;
begin
  Result := ChildNodes['H10G1S'].Text;
end;

procedure TXMLDBody.Set_H10G1S(Value: WideString);
begin
  ChildNodes['H10G1S'].NodeValue := Value;
end;

function TXMLDBody.Get_R003G10S: WideString;
begin
  Result := ChildNodes['R003G10S'].Text;
end;

procedure TXMLDBody.Set_R003G10S(Value: WideString);
begin
  ChildNodes['R003G10S'].NodeValue := Value;
end;

{ TXMLDateColumn }

function TXMLDateColumn.Get_ROWNUM: Integer;
begin
  Result := AttributeNodes['ROWNUM'].NodeValue;
end;

procedure TXMLDateColumn.Set_ROWNUM(Value: Integer);
begin
  SetAttribute('ROWNUM', Value);
end;

{ TXMLDateColumnList }

function TXMLDateColumnList.Add: IXMLDateColumn;
begin
  Result := AddItem(-1) as IXMLDateColumn;
end;

function TXMLDateColumnList.Insert(const Index: Integer): IXMLDateColumn;
begin
  Result := AddItem(Index) as IXMLDateColumn;
end;
function TXMLDateColumnList.Get_Item(Index: Integer): IXMLDateColumn;
begin
  Result := List[Index] as IXMLDateColumn;
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

end. 