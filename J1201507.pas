
{*************************************************************************}
{                                                                         }
{                            XML Data Binding                             }
{                                                                         }
{         Generated on: 05.03.2014 22:40:45                               }
{       Generated from: D:\data\work\UniSebest_git\Unicorn\J1201507.xsd   }
{   Settings stored in: D:\data\work\UniSebest_git\Unicorn\J1201507.xdb   }
{                                                                         }
{*************************************************************************}

unit J1201507;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLDeclarContent = interface;
  IXMLDHead = interface;
  IXMLLINKED_DOCS = interface;
  IXMLDOC = interface;
  IXMLDBody = interface;
  IXMLIntColumn = interface;
  IXMLIntColumnList = interface;
  IXMLDateColumn = interface;
  IXMLDateColumnList = interface;
  IXMLStrColumn = interface;
  IXMLStrColumnList = interface;
  IXMLDGKodTypeDoc6_1Column = interface;
  IXMLDGKodTypeDoc6_1ColumnList = interface;
  IXMLDGKodausesOperation6Column = interface;
  IXMLDGKodausesOperation6ColumnList = interface;
  IXMLDGKodRectification6Column = interface;
  IXMLDGKodRectification6ColumnList = interface;
  IXMLHIPNColumn0 = interface;
  IXMLHIPNColumn0List = interface;
  IXMLDecimal2Column = interface;
  IXMLDecimal2ColumnList = interface;
  IXMLDGKodDocROVPD6_2Column = interface;
  IXMLDGKodDocROVPD6_2ColumnList = interface;
  IXMLDGKodAssignment6Column = interface;
  IXMLDGKodAssignment6ColumnList = interface;

{ IXMLDeclarContent }

  IXMLDeclarContent = interface(IXMLNode)
    ['{15A56CA2-AA71-49B2-8EE3-359A148D4C91}']
    { Property Accessors }
    function Get_DECLARHEAD: IXMLDHead;
    function Get_DECLARBODY: IXMLDBody;
    { Methods & Properties }
    property DECLARHEAD: IXMLDHead read Get_DECLARHEAD;
    property DECLARBODY: IXMLDBody read Get_DECLARBODY;
  end;

{ IXMLDHead }

  IXMLDHead = interface(IXMLNode)
    ['{D81C864B-3E35-48F8-86DD-4DE6B3921BA9}']
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
    ['{5D62AE75-A8F5-4ABE-8708-5E7A241B9132}']
    { Property Accessors }
    function Get_DOC(Index: Integer): IXMLDOC;
    { Methods & Properties }
    function Add: IXMLDOC;
    function Insert(const Index: Integer): IXMLDOC;
    property DOC[Index: Integer]: IXMLDOC read Get_DOC; default;
  end;

{ IXMLDOC }

  IXMLDOC = interface(IXMLNode)
    ['{B0513367-AD58-427A-94A5-5E835A08F17B}']
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
    ['{4186A522-9A66-4E2C-9ABC-B1A3108363E2}']
    { Property Accessors }
    function Get_HZ: Integer;
    function Get_HZN: Integer;
    function Get_HNP: Int64;
    function Get_HZY: Integer;
    function Get_HZM: Integer;
    function Get_HKV: Integer;
    function Get_HNAME: WideString;
    function Get_HNPDV: WideString;
    function Get_HNSPDV: Int64;
    function Get_T1RXXXXG1: IXMLIntColumnList;
    function Get_T1RXXXXG2D: IXMLDateColumnList;
    function Get_T1RXXXXG3S: IXMLStrColumnList;
    function Get_T1RXXXXG41S: IXMLDGKodTypeDoc6_1ColumnList;
    function Get_T1RXXXXG42S: IXMLDGKodausesOperation6ColumnList;
    function Get_T1RXXXXG43S: IXMLDGKodRectification6ColumnList;
    function Get_T1RXXXXG5S: IXMLStrColumnList;
    function Get_T1RXXXXG6: IXMLHIPNColumn0List;
    function Get_T1RXXXXG7: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG8: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG9: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG10: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG11: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG12: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG13: IXMLDecimal2ColumnList;
    function Get_R011G7: WideString;
    function Get_R011G8: WideString;
    function Get_R011G9: WideString;
    function Get_R011G10: WideString;
    function Get_R011G11: WideString;
    function Get_R011G12: WideString;
    function Get_R011G13: WideString;
    function Get_R012G7: WideString;
    function Get_R012G8: WideString;
    function Get_R012G9: WideString;
    function Get_R012G10: WideString;
    function Get_R012G11: WideString;
    function Get_R012G12: WideString;
    function Get_R012G13: WideString;
    function Get_T2RXXXXG1: IXMLIntColumnList;
    function Get_T2RXXXXG2D: IXMLDateColumnList;
    function Get_T2RXXXXG3D: IXMLDateColumnList;
    function Get_T2RXXXXG4S: IXMLStrColumnList;
    function Get_T2RXXXXG51S: IXMLDGKodDocROVPD6_2ColumnList;
    function Get_T2RXXXXG52S: IXMLDGKodAssignment6ColumnList;
    function Get_T2RXXXXG53S: IXMLDGKodRectification6ColumnList;
    function Get_T2RXXXXG6S: IXMLStrColumnList;
    function Get_T2RXXXXG7: IXMLHIPNColumn0List;
    function Get_T2RXXXXG8: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG9: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG10: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG11: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG12: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG13: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG14: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG15: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG16: IXMLDecimal2ColumnList;
    function Get_R021G8: WideString;
    function Get_R021G9: WideString;
    function Get_R021G10: WideString;
    function Get_R021G11: WideString;
    function Get_R021G12: WideString;
    function Get_R021G13: WideString;
    function Get_R021G14: WideString;
    function Get_R021G15: WideString;
    function Get_R021G16: WideString;
    function Get_R022G8: WideString;
    function Get_R022G9: WideString;
    function Get_R022G10: WideString;
    function Get_R022G11: WideString;
    function Get_R022G12: WideString;
    function Get_R022G13: WideString;
    function Get_R022G14: WideString;
    function Get_R022G15: WideString;
    function Get_R022G16: WideString;
    function Get_HFILL: WideString;
    function Get_HBOS: WideString;
    function Get_HKBOS: WideString;
    function Get_HBUH: WideString;
    function Get_HKBUH: WideString;
    procedure Set_HZ(Value: Integer);
    procedure Set_HZN(Value: Integer);
    procedure Set_HNP(Value: Int64);
    procedure Set_HZY(Value: Integer);
    procedure Set_HZM(Value: Integer);
    procedure Set_HKV(Value: Integer);
    procedure Set_HNAME(Value: WideString);
    procedure Set_HNPDV(Value: WideString);
    procedure Set_HNSPDV(Value: Int64);
    procedure Set_R011G7(Value: WideString);
    procedure Set_R011G8(Value: WideString);
    procedure Set_R011G9(Value: WideString);
    procedure Set_R011G10(Value: WideString);
    procedure Set_R011G11(Value: WideString);
    procedure Set_R011G12(Value: WideString);
    procedure Set_R011G13(Value: WideString);
    procedure Set_R012G7(Value: WideString);
    procedure Set_R012G8(Value: WideString);
    procedure Set_R012G9(Value: WideString);
    procedure Set_R012G10(Value: WideString);
    procedure Set_R012G11(Value: WideString);
    procedure Set_R012G12(Value: WideString);
    procedure Set_R012G13(Value: WideString);
    procedure Set_R021G8(Value: WideString);
    procedure Set_R021G9(Value: WideString);
    procedure Set_R021G10(Value: WideString);
    procedure Set_R021G11(Value: WideString);
    procedure Set_R021G12(Value: WideString);
    procedure Set_R021G13(Value: WideString);
    procedure Set_R021G14(Value: WideString);
    procedure Set_R021G15(Value: WideString);
    procedure Set_R021G16(Value: WideString);
    procedure Set_R022G8(Value: WideString);
    procedure Set_R022G9(Value: WideString);
    procedure Set_R022G10(Value: WideString);
    procedure Set_R022G11(Value: WideString);
    procedure Set_R022G12(Value: WideString);
    procedure Set_R022G13(Value: WideString);
    procedure Set_R022G14(Value: WideString);
    procedure Set_R022G15(Value: WideString);
    procedure Set_R022G16(Value: WideString);
    procedure Set_HFILL(Value: WideString);
    procedure Set_HBOS(Value: WideString);
    procedure Set_HKBOS(Value: WideString);
    procedure Set_HBUH(Value: WideString);
    procedure Set_HKBUH(Value: WideString);
    { Methods & Properties }
    property HZ: Integer read Get_HZ write Set_HZ;
    property HZN: Integer read Get_HZN write Set_HZN;
    property HNP: Int64 read Get_HNP write Set_HNP;
    property HZY: Integer read Get_HZY write Set_HZY;
    property HZM: Integer read Get_HZM write Set_HZM;
    property HKV: Integer read Get_HKV write Set_HKV;
    property HNAME: WideString read Get_HNAME write Set_HNAME;
    property HNPDV: WideString read Get_HNPDV write Set_HNPDV;
    property HNSPDV: Int64 read Get_HNSPDV write Set_HNSPDV;
    property T1RXXXXG1: IXMLIntColumnList read Get_T1RXXXXG1;
    property T1RXXXXG2D: IXMLDateColumnList read Get_T1RXXXXG2D;
    property T1RXXXXG3S: IXMLStrColumnList read Get_T1RXXXXG3S;
    property T1RXXXXG41S: IXMLDGKodTypeDoc6_1ColumnList read Get_T1RXXXXG41S;
    property T1RXXXXG42S: IXMLDGKodausesOperation6ColumnList read Get_T1RXXXXG42S;
    property T1RXXXXG43S: IXMLDGKodRectification6ColumnList read Get_T1RXXXXG43S;
    property T1RXXXXG5S: IXMLStrColumnList read Get_T1RXXXXG5S;
    property T1RXXXXG6: IXMLHIPNColumn0List read Get_T1RXXXXG6;
    property T1RXXXXG7: IXMLDecimal2ColumnList read Get_T1RXXXXG7;
    property T1RXXXXG8: IXMLDecimal2ColumnList read Get_T1RXXXXG8;
    property T1RXXXXG9: IXMLDecimal2ColumnList read Get_T1RXXXXG9;
    property T1RXXXXG10: IXMLDecimal2ColumnList read Get_T1RXXXXG10;
    property T1RXXXXG11: IXMLDecimal2ColumnList read Get_T1RXXXXG11;
    property T1RXXXXG12: IXMLDecimal2ColumnList read Get_T1RXXXXG12;
    property T1RXXXXG13: IXMLDecimal2ColumnList read Get_T1RXXXXG13;
    property R011G7: WideString read Get_R011G7 write Set_R011G7;
    property R011G8: WideString read Get_R011G8 write Set_R011G8;
    property R011G9: WideString read Get_R011G9 write Set_R011G9;
    property R011G10: WideString read Get_R011G10 write Set_R011G10;
    property R011G11: WideString read Get_R011G11 write Set_R011G11;
    property R011G12: WideString read Get_R011G12 write Set_R011G12;
    property R011G13: WideString read Get_R011G13 write Set_R011G13;
    property R012G7: WideString read Get_R012G7 write Set_R012G7;
    property R012G8: WideString read Get_R012G8 write Set_R012G8;
    property R012G9: WideString read Get_R012G9 write Set_R012G9;
    property R012G10: WideString read Get_R012G10 write Set_R012G10;
    property R012G11: WideString read Get_R012G11 write Set_R012G11;
    property R012G12: WideString read Get_R012G12 write Set_R012G12;
    property R012G13: WideString read Get_R012G13 write Set_R012G13;
    property T2RXXXXG1: IXMLIntColumnList read Get_T2RXXXXG1;
    property T2RXXXXG2D: IXMLDateColumnList read Get_T2RXXXXG2D;
    property T2RXXXXG3D: IXMLDateColumnList read Get_T2RXXXXG3D;
    property T2RXXXXG4S: IXMLStrColumnList read Get_T2RXXXXG4S;
    property T2RXXXXG51S: IXMLDGKodDocROVPD6_2ColumnList read Get_T2RXXXXG51S;
    property T2RXXXXG52S: IXMLDGKodAssignment6ColumnList read Get_T2RXXXXG52S;
    property T2RXXXXG53S: IXMLDGKodRectification6ColumnList read Get_T2RXXXXG53S;
    property T2RXXXXG6S: IXMLStrColumnList read Get_T2RXXXXG6S;
    property T2RXXXXG7: IXMLHIPNColumn0List read Get_T2RXXXXG7;
    property T2RXXXXG8: IXMLDecimal2ColumnList read Get_T2RXXXXG8;
    property T2RXXXXG9: IXMLDecimal2ColumnList read Get_T2RXXXXG9;
    property T2RXXXXG10: IXMLDecimal2ColumnList read Get_T2RXXXXG10;
    property T2RXXXXG11: IXMLDecimal2ColumnList read Get_T2RXXXXG11;
    property T2RXXXXG12: IXMLDecimal2ColumnList read Get_T2RXXXXG12;
    property T2RXXXXG13: IXMLDecimal2ColumnList read Get_T2RXXXXG13;
    property T2RXXXXG14: IXMLDecimal2ColumnList read Get_T2RXXXXG14;
    property T2RXXXXG15: IXMLDecimal2ColumnList read Get_T2RXXXXG15;
    property T2RXXXXG16: IXMLDecimal2ColumnList read Get_T2RXXXXG16;
    property R021G8: WideString read Get_R021G8 write Set_R021G8;
    property R021G9: WideString read Get_R021G9 write Set_R021G9;
    property R021G10: WideString read Get_R021G10 write Set_R021G10;
    property R021G11: WideString read Get_R021G11 write Set_R021G11;
    property R021G12: WideString read Get_R021G12 write Set_R021G12;
    property R021G13: WideString read Get_R021G13 write Set_R021G13;
    property R021G14: WideString read Get_R021G14 write Set_R021G14;
    property R021G15: WideString read Get_R021G15 write Set_R021G15;
    property R021G16: WideString read Get_R021G16 write Set_R021G16;
    property R022G8: WideString read Get_R022G8 write Set_R022G8;
    property R022G9: WideString read Get_R022G9 write Set_R022G9;
    property R022G10: WideString read Get_R022G10 write Set_R022G10;
    property R022G11: WideString read Get_R022G11 write Set_R022G11;
    property R022G12: WideString read Get_R022G12 write Set_R022G12;
    property R022G13: WideString read Get_R022G13 write Set_R022G13;
    property R022G14: WideString read Get_R022G14 write Set_R022G14;
    property R022G15: WideString read Get_R022G15 write Set_R022G15;
    property R022G16: WideString read Get_R022G16 write Set_R022G16;
    property HFILL: WideString read Get_HFILL write Set_HFILL;
    property HBOS: WideString read Get_HBOS write Set_HBOS;
    property HKBOS: WideString read Get_HKBOS write Set_HKBOS;
    property HBUH: WideString read Get_HBUH write Set_HBUH;
    property HKBUH: WideString read Get_HKBUH write Set_HKBUH;
  end;

{ IXMLIntColumn }

  IXMLIntColumn = interface(IXMLNode)
    ['{6E573E06-E6BA-4F01-8243-91A2C9425E05}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLIntColumnList }

  IXMLIntColumnList = interface(IXMLNodeCollection)
    ['{BA7331EF-8A5B-4403-924F-8536D4DA2AD2}']
    { Methods & Properties }
    function Add: IXMLIntColumn;
    function Insert(const Index: Integer): IXMLIntColumn;
    function Get_Item(Index: Integer): IXMLIntColumn;
    property Items[Index: Integer]: IXMLIntColumn read Get_Item; default;
  end;

{ IXMLDateColumn }

  IXMLDateColumn = interface(IXMLNode)
    ['{A2FAA152-0076-4B1E-8DC5-FDDA74E77848}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLDateColumnList }

  IXMLDateColumnList = interface(IXMLNodeCollection)
    ['{8952538C-B28F-42F4-B414-6613100A4E21}']
    { Methods & Properties }
    function Add: IXMLDateColumn;
    function Insert(const Index: Integer): IXMLDateColumn;
    function Get_Item(Index: Integer): IXMLDateColumn;
    property Items[Index: Integer]: IXMLDateColumn read Get_Item; default;
  end;

{ IXMLStrColumn }

  IXMLStrColumn = interface(IXMLNode)
    ['{462DE955-9801-474E-B033-8146BDC59DEA}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLStrColumnList }

  IXMLStrColumnList = interface(IXMLNodeCollection)
    ['{BFF50D5F-E53C-44E2-A846-52E93EC06581}']
    { Methods & Properties }
    function Add: IXMLStrColumn;
    function Insert(const Index: Integer): IXMLStrColumn;
    function Get_Item(Index: Integer): IXMLStrColumn;
    property Items[Index: Integer]: IXMLStrColumn read Get_Item; default;
  end;

{ IXMLDGKodTypeDoc6_1Column }

  IXMLDGKodTypeDoc6_1Column = interface(IXMLNode)
    ['{CD707330-4F09-4EE6-AA55-4D06B60EE009}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLDGKodTypeDoc6_1ColumnList }

  IXMLDGKodTypeDoc6_1ColumnList = interface(IXMLNodeCollection)
    ['{C0C29C5C-08C8-4267-87EF-EA62777E3EF4}']
    { Methods & Properties }
    function Add: IXMLDGKodTypeDoc6_1Column;
    function Insert(const Index: Integer): IXMLDGKodTypeDoc6_1Column;
    function Get_Item(Index: Integer): IXMLDGKodTypeDoc6_1Column;
    property Items[Index: Integer]: IXMLDGKodTypeDoc6_1Column read Get_Item; default;
  end;

{ IXMLDGKodausesOperation6Column }

  IXMLDGKodausesOperation6Column = interface(IXMLNode)
    ['{84A1E964-0B59-46FD-844E-82D20BC1BB80}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLDGKodausesOperation6ColumnList }

  IXMLDGKodausesOperation6ColumnList = interface(IXMLNodeCollection)
    ['{E45F981F-FEE4-42D0-B5A9-2708602187FD}']
    { Methods & Properties }
    function Add: IXMLDGKodausesOperation6Column;
    function Insert(const Index: Integer): IXMLDGKodausesOperation6Column;
    function Get_Item(Index: Integer): IXMLDGKodausesOperation6Column;
    property Items[Index: Integer]: IXMLDGKodausesOperation6Column read Get_Item; default;
  end;

{ IXMLDGKodRectification6Column }

  IXMLDGKodRectification6Column = interface(IXMLNode)
    ['{0A049477-0D2B-4C71-8D62-C6B8EED06FD1}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLDGKodRectification6ColumnList }

  IXMLDGKodRectification6ColumnList = interface(IXMLNodeCollection)
    ['{7741AD4E-35D4-466F-810D-1984CC2927B4}']
    { Methods & Properties }
    function Add: IXMLDGKodRectification6Column;
    function Insert(const Index: Integer): IXMLDGKodRectification6Column;
    function Get_Item(Index: Integer): IXMLDGKodRectification6Column;
    property Items[Index: Integer]: IXMLDGKodRectification6Column read Get_Item; default;
  end;

{ IXMLHIPNColumn0 }

  IXMLHIPNColumn0 = interface(IXMLNode)
    ['{611F9970-4A4E-4D92-9028-C64873109709}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLHIPNColumn0List }

  IXMLHIPNColumn0List = interface(IXMLNodeCollection)
    ['{D74DD805-E7A8-4825-9594-91C974A3F986}']
    { Methods & Properties }
    function Add: IXMLHIPNColumn0;
    function Insert(const Index: Integer): IXMLHIPNColumn0;
    function Get_Item(Index: Integer): IXMLHIPNColumn0;
    property Items[Index: Integer]: IXMLHIPNColumn0 read Get_Item; default;
  end;

{ IXMLDecimal2Column }

  IXMLDecimal2Column = interface(IXMLNode)
    ['{56A1747F-4EB1-4C36-8BA8-47E610A1B3A1}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLDecimal2ColumnList }

  IXMLDecimal2ColumnList = interface(IXMLNodeCollection)
    ['{DA444FB4-E201-47FC-ABAC-33A4CDB1D43F}']
    { Methods & Properties }
    function Add: IXMLDecimal2Column;
    function Insert(const Index: Integer): IXMLDecimal2Column;
    function Get_Item(Index: Integer): IXMLDecimal2Column;
    property Items[Index: Integer]: IXMLDecimal2Column read Get_Item; default;
  end;

{ IXMLDGKodDocROVPD6_2Column }

  IXMLDGKodDocROVPD6_2Column = interface(IXMLNode)
    ['{4B20D1A6-620F-4B64-B3A4-7E49067E4408}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLDGKodDocROVPD6_2ColumnList }

  IXMLDGKodDocROVPD6_2ColumnList = interface(IXMLNodeCollection)
    ['{4581814C-E86D-4C58-A185-0A39CB4D9F62}']
    { Methods & Properties }
    function Add: IXMLDGKodDocROVPD6_2Column;
    function Insert(const Index: Integer): IXMLDGKodDocROVPD6_2Column;
    function Get_Item(Index: Integer): IXMLDGKodDocROVPD6_2Column;
    property Items[Index: Integer]: IXMLDGKodDocROVPD6_2Column read Get_Item; default;
  end;

{ IXMLDGKodAssignment6Column }

  IXMLDGKodAssignment6Column = interface(IXMLNode)
    ['{C1B2A001-C518-4D35-98A7-CACBC80AEFD1}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLDGKodAssignment6ColumnList }

  IXMLDGKodAssignment6ColumnList = interface(IXMLNodeCollection)
    ['{B1C8A82C-8241-41B6-98DB-FCD4FCAF661E}']
    { Methods & Properties }
    function Add: IXMLDGKodAssignment6Column;
    function Insert(const Index: Integer): IXMLDGKodAssignment6Column;
    function Get_Item(Index: Integer): IXMLDGKodAssignment6Column;
    property Items[Index: Integer]: IXMLDGKodAssignment6Column read Get_Item; default;
  end;

{ Forward Decls }

  TXMLDeclarContent = class;
  TXMLDHead = class;
  TXMLLINKED_DOCS = class;
  TXMLDOC = class;
  TXMLDBody = class;
  TXMLIntColumn = class;
  TXMLIntColumnList = class;
  TXMLDateColumn = class;
  TXMLDateColumnList = class;
  TXMLStrColumn = class;
  TXMLStrColumnList = class;
  TXMLDGKodTypeDoc6_1Column = class;
  TXMLDGKodTypeDoc6_1ColumnList = class;
  TXMLDGKodausesOperation6Column = class;
  TXMLDGKodausesOperation6ColumnList = class;
  TXMLDGKodRectification6Column = class;
  TXMLDGKodRectification6ColumnList = class;
  TXMLHIPNColumn0 = class;
  TXMLHIPNColumn0List = class;
  TXMLDecimal2Column = class;
  TXMLDecimal2ColumnList = class;
  TXMLDGKodDocROVPD6_2Column = class;
  TXMLDGKodDocROVPD6_2ColumnList = class;
  TXMLDGKodAssignment6Column = class;
  TXMLDGKodAssignment6ColumnList = class;

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
    FT1RXXXXG1: IXMLIntColumnList;
    FT1RXXXXG2D: IXMLDateColumnList;
    FT1RXXXXG3S: IXMLStrColumnList;
    FT1RXXXXG41S: IXMLDGKodTypeDoc6_1ColumnList;
    FT1RXXXXG42S: IXMLDGKodausesOperation6ColumnList;
    FT1RXXXXG43S: IXMLDGKodRectification6ColumnList;
    FT1RXXXXG5S: IXMLStrColumnList;
    FT1RXXXXG6: IXMLHIPNColumn0List;
    FT1RXXXXG7: IXMLDecimal2ColumnList;
    FT1RXXXXG8: IXMLDecimal2ColumnList;
    FT1RXXXXG9: IXMLDecimal2ColumnList;
    FT1RXXXXG10: IXMLDecimal2ColumnList;
    FT1RXXXXG11: IXMLDecimal2ColumnList;
    FT1RXXXXG12: IXMLDecimal2ColumnList;
    FT1RXXXXG13: IXMLDecimal2ColumnList;
    FT2RXXXXG1: IXMLIntColumnList;
    FT2RXXXXG2D: IXMLDateColumnList;
    FT2RXXXXG3D: IXMLDateColumnList;
    FT2RXXXXG4S: IXMLStrColumnList;
    FT2RXXXXG51S: IXMLDGKodDocROVPD6_2ColumnList;
    FT2RXXXXG52S: IXMLDGKodAssignment6ColumnList;
    FT2RXXXXG53S: IXMLDGKodRectification6ColumnList;
    FT2RXXXXG6S: IXMLStrColumnList;
    FT2RXXXXG7: IXMLHIPNColumn0List;
    FT2RXXXXG8: IXMLDecimal2ColumnList;
    FT2RXXXXG9: IXMLDecimal2ColumnList;
    FT2RXXXXG10: IXMLDecimal2ColumnList;
    FT2RXXXXG11: IXMLDecimal2ColumnList;
    FT2RXXXXG12: IXMLDecimal2ColumnList;
    FT2RXXXXG13: IXMLDecimal2ColumnList;
    FT2RXXXXG14: IXMLDecimal2ColumnList;
    FT2RXXXXG15: IXMLDecimal2ColumnList;
    FT2RXXXXG16: IXMLDecimal2ColumnList;
  protected
    { IXMLDBody }
    function Get_HZ: Integer;
    function Get_HZN: Integer;
    function Get_HNP: Int64;
    function Get_HZY: Integer;
    function Get_HZM: Integer;
    function Get_HKV: Integer;
    function Get_HNAME: WideString;
    function Get_HNPDV: WideString;
    function Get_HNSPDV: Int64;
    function Get_T1RXXXXG1: IXMLIntColumnList;
    function Get_T1RXXXXG2D: IXMLDateColumnList;
    function Get_T1RXXXXG3S: IXMLStrColumnList;
    function Get_T1RXXXXG41S: IXMLDGKodTypeDoc6_1ColumnList;
    function Get_T1RXXXXG42S: IXMLDGKodausesOperation6ColumnList;
    function Get_T1RXXXXG43S: IXMLDGKodRectification6ColumnList;
    function Get_T1RXXXXG5S: IXMLStrColumnList;
    function Get_T1RXXXXG6: IXMLHIPNColumn0List;
    function Get_T1RXXXXG7: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG8: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG9: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG10: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG11: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG12: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG13: IXMLDecimal2ColumnList;
    function Get_R011G7: WideString;
    function Get_R011G8: WideString;
    function Get_R011G9: WideString;
    function Get_R011G10: WideString;
    function Get_R011G11: WideString;
    function Get_R011G12: WideString;
    function Get_R011G13: WideString;
    function Get_R012G7: WideString;
    function Get_R012G8: WideString;
    function Get_R012G9: WideString;
    function Get_R012G10: WideString;
    function Get_R012G11: WideString;
    function Get_R012G12: WideString;
    function Get_R012G13: WideString;
    function Get_T2RXXXXG1: IXMLIntColumnList;
    function Get_T2RXXXXG2D: IXMLDateColumnList;
    function Get_T2RXXXXG3D: IXMLDateColumnList;
    function Get_T2RXXXXG4S: IXMLStrColumnList;
    function Get_T2RXXXXG51S: IXMLDGKodDocROVPD6_2ColumnList;
    function Get_T2RXXXXG52S: IXMLDGKodAssignment6ColumnList;
    function Get_T2RXXXXG53S: IXMLDGKodRectification6ColumnList;
    function Get_T2RXXXXG6S: IXMLStrColumnList;
    function Get_T2RXXXXG7: IXMLHIPNColumn0List;
    function Get_T2RXXXXG8: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG9: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG10: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG11: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG12: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG13: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG14: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG15: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG16: IXMLDecimal2ColumnList;
    function Get_R021G8: WideString;
    function Get_R021G9: WideString;
    function Get_R021G10: WideString;
    function Get_R021G11: WideString;
    function Get_R021G12: WideString;
    function Get_R021G13: WideString;
    function Get_R021G14: WideString;
    function Get_R021G15: WideString;
    function Get_R021G16: WideString;
    function Get_R022G8: WideString;
    function Get_R022G9: WideString;
    function Get_R022G10: WideString;
    function Get_R022G11: WideString;
    function Get_R022G12: WideString;
    function Get_R022G13: WideString;
    function Get_R022G14: WideString;
    function Get_R022G15: WideString;
    function Get_R022G16: WideString;
    function Get_HFILL: WideString;
    function Get_HBOS: WideString;
    function Get_HKBOS: WideString;
    function Get_HBUH: WideString;
    function Get_HKBUH: WideString;
    procedure Set_HZ(Value: Integer);
    procedure Set_HZN(Value: Integer);
    procedure Set_HNP(Value: Int64);
    procedure Set_HZY(Value: Integer);
    procedure Set_HZM(Value: Integer);
    procedure Set_HKV(Value: Integer);
    procedure Set_HNAME(Value: WideString);
    procedure Set_HNPDV(Value: WideString);
    procedure Set_HNSPDV(Value: Int64);
    procedure Set_R011G7(Value: WideString);
    procedure Set_R011G8(Value: WideString);
    procedure Set_R011G9(Value: WideString);
    procedure Set_R011G10(Value: WideString);
    procedure Set_R011G11(Value: WideString);
    procedure Set_R011G12(Value: WideString);
    procedure Set_R011G13(Value: WideString);
    procedure Set_R012G7(Value: WideString);
    procedure Set_R012G8(Value: WideString);
    procedure Set_R012G9(Value: WideString);
    procedure Set_R012G10(Value: WideString);
    procedure Set_R012G11(Value: WideString);
    procedure Set_R012G12(Value: WideString);
    procedure Set_R012G13(Value: WideString);
    procedure Set_R021G8(Value: WideString);
    procedure Set_R021G9(Value: WideString);
    procedure Set_R021G10(Value: WideString);
    procedure Set_R021G11(Value: WideString);
    procedure Set_R021G12(Value: WideString);
    procedure Set_R021G13(Value: WideString);
    procedure Set_R021G14(Value: WideString);
    procedure Set_R021G15(Value: WideString);
    procedure Set_R021G16(Value: WideString);
    procedure Set_R022G8(Value: WideString);
    procedure Set_R022G9(Value: WideString);
    procedure Set_R022G10(Value: WideString);
    procedure Set_R022G11(Value: WideString);
    procedure Set_R022G12(Value: WideString);
    procedure Set_R022G13(Value: WideString);
    procedure Set_R022G14(Value: WideString);
    procedure Set_R022G15(Value: WideString);
    procedure Set_R022G16(Value: WideString);
    procedure Set_HFILL(Value: WideString);
    procedure Set_HBOS(Value: WideString);
    procedure Set_HKBOS(Value: WideString);
    procedure Set_HBUH(Value: WideString);
    procedure Set_HKBUH(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLIntColumn }

  TXMLIntColumn = class(TXMLNode, IXMLIntColumn)
  protected
    { IXMLIntColumn }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
  end;

{ TXMLIntColumnList }

  TXMLIntColumnList = class(TXMLNodeCollection, IXMLIntColumnList)
  protected
    { IXMLIntColumnList }
    function Add: IXMLIntColumn;
    function Insert(const Index: Integer): IXMLIntColumn;
    function Get_Item(Index: Integer): IXMLIntColumn;
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

{ TXMLDGKodTypeDoc6_1Column }

  TXMLDGKodTypeDoc6_1Column = class(TXMLNode, IXMLDGKodTypeDoc6_1Column)
  protected
    { IXMLDGKodTypeDoc6_1Column }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
  end;

{ TXMLDGKodTypeDoc6_1ColumnList }

  TXMLDGKodTypeDoc6_1ColumnList = class(TXMLNodeCollection, IXMLDGKodTypeDoc6_1ColumnList)
  protected
    { IXMLDGKodTypeDoc6_1ColumnList }
    function Add: IXMLDGKodTypeDoc6_1Column;
    function Insert(const Index: Integer): IXMLDGKodTypeDoc6_1Column;
    function Get_Item(Index: Integer): IXMLDGKodTypeDoc6_1Column;
  end;

{ TXMLDGKodausesOperation6Column }

  TXMLDGKodausesOperation6Column = class(TXMLNode, IXMLDGKodausesOperation6Column)
  protected
    { IXMLDGKodausesOperation6Column }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
  end;

{ TXMLDGKodausesOperation6ColumnList }

  TXMLDGKodausesOperation6ColumnList = class(TXMLNodeCollection, IXMLDGKodausesOperation6ColumnList)
  protected
    { IXMLDGKodausesOperation6ColumnList }
    function Add: IXMLDGKodausesOperation6Column;
    function Insert(const Index: Integer): IXMLDGKodausesOperation6Column;
    function Get_Item(Index: Integer): IXMLDGKodausesOperation6Column;
  end;

{ TXMLDGKodRectification6Column }

  TXMLDGKodRectification6Column = class(TXMLNode, IXMLDGKodRectification6Column)
  protected
    { IXMLDGKodRectification6Column }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
  end;

{ TXMLDGKodRectification6ColumnList }

  TXMLDGKodRectification6ColumnList = class(TXMLNodeCollection, IXMLDGKodRectification6ColumnList)
  protected
    { IXMLDGKodRectification6ColumnList }
    function Add: IXMLDGKodRectification6Column;
    function Insert(const Index: Integer): IXMLDGKodRectification6Column;
    function Get_Item(Index: Integer): IXMLDGKodRectification6Column;
  end;

{ TXMLHIPNColumn0 }

  TXMLHIPNColumn0 = class(TXMLNode, IXMLHIPNColumn0)
  protected
    { IXMLHIPNColumn0 }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
  end;

{ TXMLHIPNColumn0List }

  TXMLHIPNColumn0List = class(TXMLNodeCollection, IXMLHIPNColumn0List)
  protected
    { IXMLHIPNColumn0List }
    function Add: IXMLHIPNColumn0;
    function Insert(const Index: Integer): IXMLHIPNColumn0;
    function Get_Item(Index: Integer): IXMLHIPNColumn0;
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

{ TXMLDGKodDocROVPD6_2Column }

  TXMLDGKodDocROVPD6_2Column = class(TXMLNode, IXMLDGKodDocROVPD6_2Column)
  protected
    { IXMLDGKodDocROVPD6_2Column }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
  end;

{ TXMLDGKodDocROVPD6_2ColumnList }

  TXMLDGKodDocROVPD6_2ColumnList = class(TXMLNodeCollection, IXMLDGKodDocROVPD6_2ColumnList)
  protected
    { IXMLDGKodDocROVPD6_2ColumnList }
    function Add: IXMLDGKodDocROVPD6_2Column;
    function Insert(const Index: Integer): IXMLDGKodDocROVPD6_2Column;
    function Get_Item(Index: Integer): IXMLDGKodDocROVPD6_2Column;
  end;

{ TXMLDGKodAssignment6Column }

  TXMLDGKodAssignment6Column = class(TXMLNode, IXMLDGKodAssignment6Column)
  protected
    { IXMLDGKodAssignment6Column }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
  end;

{ TXMLDGKodAssignment6ColumnList }

  TXMLDGKodAssignment6ColumnList = class(TXMLNodeCollection, IXMLDGKodAssignment6ColumnList)
  protected
    { IXMLDGKodAssignment6ColumnList }
    function Add: IXMLDGKodAssignment6Column;
    function Insert(const Index: Integer): IXMLDGKodAssignment6Column;
    function Get_Item(Index: Integer): IXMLDGKodAssignment6Column;
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
  RegisterChildNode('T1RXXXXG1', TXMLIntColumn);
  RegisterChildNode('T1RXXXXG2D', TXMLDateColumn);
  RegisterChildNode('T1RXXXXG3S', TXMLStrColumn);
  RegisterChildNode('T1RXXXXG41S', TXMLDGKodTypeDoc6_1Column);
  RegisterChildNode('T1RXXXXG42S', TXMLDGKodausesOperation6Column);
  RegisterChildNode('T1RXXXXG43S', TXMLDGKodRectification6Column);
  RegisterChildNode('T1RXXXXG5S', TXMLStrColumn);
  RegisterChildNode('T1RXXXXG6', TXMLHIPNColumn0);
  RegisterChildNode('T1RXXXXG7', TXMLDecimal2Column);
  RegisterChildNode('T1RXXXXG8', TXMLDecimal2Column);
  RegisterChildNode('T1RXXXXG9', TXMLDecimal2Column);
  RegisterChildNode('T1RXXXXG10', TXMLDecimal2Column);
  RegisterChildNode('T1RXXXXG11', TXMLDecimal2Column);
  RegisterChildNode('T1RXXXXG12', TXMLDecimal2Column);
  RegisterChildNode('T1RXXXXG13', TXMLDecimal2Column);
  RegisterChildNode('T2RXXXXG1', TXMLIntColumn);
  RegisterChildNode('T2RXXXXG2D', TXMLDateColumn);
  RegisterChildNode('T2RXXXXG3D', TXMLDateColumn);
  RegisterChildNode('T2RXXXXG4S', TXMLStrColumn);
  RegisterChildNode('T2RXXXXG51S', TXMLDGKodDocROVPD6_2Column);
  RegisterChildNode('T2RXXXXG52S', TXMLDGKodAssignment6Column);
  RegisterChildNode('T2RXXXXG53S', TXMLDGKodRectification6Column);
  RegisterChildNode('T2RXXXXG6S', TXMLStrColumn);
  RegisterChildNode('T2RXXXXG7', TXMLHIPNColumn0);
  RegisterChildNode('T2RXXXXG8', TXMLDecimal2Column);
  RegisterChildNode('T2RXXXXG9', TXMLDecimal2Column);
  RegisterChildNode('T2RXXXXG10', TXMLDecimal2Column);
  RegisterChildNode('T2RXXXXG11', TXMLDecimal2Column);
  RegisterChildNode('T2RXXXXG12', TXMLDecimal2Column);
  RegisterChildNode('T2RXXXXG13', TXMLDecimal2Column);
  RegisterChildNode('T2RXXXXG14', TXMLDecimal2Column);
  RegisterChildNode('T2RXXXXG15', TXMLDecimal2Column);
  RegisterChildNode('T2RXXXXG16', TXMLDecimal2Column);
  FT1RXXXXG1 := CreateCollection(TXMLIntColumnList, IXMLIntColumn, 'T1RXXXXG1') as IXMLIntColumnList;
  FT1RXXXXG2D := CreateCollection(TXMLDateColumnList, IXMLDateColumn, 'T1RXXXXG2D') as IXMLDateColumnList;
  FT1RXXXXG3S := CreateCollection(TXMLStrColumnList, IXMLStrColumn, 'T1RXXXXG3S') as IXMLStrColumnList;
  FT1RXXXXG41S := CreateCollection(TXMLDGKodTypeDoc6_1ColumnList, IXMLDGKodTypeDoc6_1Column, 'T1RXXXXG41S') as IXMLDGKodTypeDoc6_1ColumnList;
  FT1RXXXXG42S := CreateCollection(TXMLDGKodausesOperation6ColumnList, IXMLDGKodausesOperation6Column, 'T1RXXXXG42S') as IXMLDGKodausesOperation6ColumnList;
  FT1RXXXXG43S := CreateCollection(TXMLDGKodRectification6ColumnList, IXMLDGKodRectification6Column, 'T1RXXXXG43S') as IXMLDGKodRectification6ColumnList;
  FT1RXXXXG5S := CreateCollection(TXMLStrColumnList, IXMLStrColumn, 'T1RXXXXG5S') as IXMLStrColumnList;
  FT1RXXXXG6 := CreateCollection(TXMLHIPNColumn0List, IXMLHIPNColumn0, 'T1RXXXXG6') as IXMLHIPNColumn0List;
  FT1RXXXXG7 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T1RXXXXG7') as IXMLDecimal2ColumnList;
  FT1RXXXXG8 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T1RXXXXG8') as IXMLDecimal2ColumnList;
  FT1RXXXXG9 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T1RXXXXG9') as IXMLDecimal2ColumnList;
  FT1RXXXXG10 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T1RXXXXG10') as IXMLDecimal2ColumnList;
  FT1RXXXXG11 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T1RXXXXG11') as IXMLDecimal2ColumnList;
  FT1RXXXXG12 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T1RXXXXG12') as IXMLDecimal2ColumnList;
  FT1RXXXXG13 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T1RXXXXG13') as IXMLDecimal2ColumnList;
  FT2RXXXXG1 := CreateCollection(TXMLIntColumnList, IXMLIntColumn, 'T2RXXXXG1') as IXMLIntColumnList;
  FT2RXXXXG2D := CreateCollection(TXMLDateColumnList, IXMLDateColumn, 'T2RXXXXG2D') as IXMLDateColumnList;
  FT2RXXXXG3D := CreateCollection(TXMLDateColumnList, IXMLDateColumn, 'T2RXXXXG3D') as IXMLDateColumnList;
  FT2RXXXXG4S := CreateCollection(TXMLStrColumnList, IXMLStrColumn, 'T2RXXXXG4S') as IXMLStrColumnList;
  FT2RXXXXG51S := CreateCollection(TXMLDGKodDocROVPD6_2ColumnList, IXMLDGKodDocROVPD6_2Column, 'T2RXXXXG51S') as IXMLDGKodDocROVPD6_2ColumnList;
  FT2RXXXXG52S := CreateCollection(TXMLDGKodAssignment6ColumnList, IXMLDGKodAssignment6Column, 'T2RXXXXG52S') as IXMLDGKodAssignment6ColumnList;
  FT2RXXXXG53S := CreateCollection(TXMLDGKodRectification6ColumnList, IXMLDGKodRectification6Column, 'T2RXXXXG53S') as IXMLDGKodRectification6ColumnList;
  FT2RXXXXG6S := CreateCollection(TXMLStrColumnList, IXMLStrColumn, 'T2RXXXXG6S') as IXMLStrColumnList;
  FT2RXXXXG7 := CreateCollection(TXMLHIPNColumn0List, IXMLHIPNColumn0, 'T2RXXXXG7') as IXMLHIPNColumn0List;
  FT2RXXXXG8 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T2RXXXXG8') as IXMLDecimal2ColumnList;
  FT2RXXXXG9 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T2RXXXXG9') as IXMLDecimal2ColumnList;
  FT2RXXXXG10 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T2RXXXXG10') as IXMLDecimal2ColumnList;
  FT2RXXXXG11 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T2RXXXXG11') as IXMLDecimal2ColumnList;
  FT2RXXXXG12 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T2RXXXXG12') as IXMLDecimal2ColumnList;
  FT2RXXXXG13 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T2RXXXXG13') as IXMLDecimal2ColumnList;
  FT2RXXXXG14 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T2RXXXXG14') as IXMLDecimal2ColumnList;
  FT2RXXXXG15 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T2RXXXXG15') as IXMLDecimal2ColumnList;
  FT2RXXXXG16 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T2RXXXXG16') as IXMLDecimal2ColumnList;
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

function TXMLDBody.Get_HNP: Int64;
begin
  Result := ChildNodes['HNP'].NodeValue;
end;

procedure TXMLDBody.Set_HNP(Value: Int64);
begin
  ChildNodes['HNP'].NodeValue := Value;
end;

function TXMLDBody.Get_HZY: Integer;
begin
  Result := ChildNodes['HZY'].NodeValue;
end;

procedure TXMLDBody.Set_HZY(Value: Integer);
begin
  ChildNodes['HZY'].NodeValue := Value;
end;

function TXMLDBody.Get_HZM: Integer;
begin
  Result := ChildNodes['HZM'].NodeValue;
end;

procedure TXMLDBody.Set_HZM(Value: Integer);
begin
  ChildNodes['HZM'].NodeValue := Value;
end;

function TXMLDBody.Get_HKV: Integer;
begin
  Result := ChildNodes['HKV'].NodeValue;
end;

procedure TXMLDBody.Set_HKV(Value: Integer);
begin
  ChildNodes['HKV'].NodeValue := Value;
end;

function TXMLDBody.Get_HNAME: WideString;
begin
  Result := ChildNodes['HNAME'].Text;
end;

procedure TXMLDBody.Set_HNAME(Value: WideString);
begin
  ChildNodes['HNAME'].NodeValue := Value;
end;

function TXMLDBody.Get_HNPDV: WideString;
begin
  Result := ChildNodes['HNPDV'].Text;
end;

procedure TXMLDBody.Set_HNPDV(Value: WideString);
begin
  ChildNodes['HNPDV'].NodeValue := Value;
end;

function TXMLDBody.Get_HNSPDV: Int64;
begin
  Result := ChildNodes['HNSPDV'].NodeValue;
end;

procedure TXMLDBody.Set_HNSPDV(Value: Int64);
begin
  ChildNodes['HNSPDV'].NodeValue := Value;
end;

function TXMLDBody.Get_T1RXXXXG1: IXMLIntColumnList;
begin
  Result := FT1RXXXXG1;
end;

function TXMLDBody.Get_T1RXXXXG2D: IXMLDateColumnList;
begin
  Result := FT1RXXXXG2D;
end;

function TXMLDBody.Get_T1RXXXXG3S: IXMLStrColumnList;
begin
  Result := FT1RXXXXG3S;
end;

function TXMLDBody.Get_T1RXXXXG41S: IXMLDGKodTypeDoc6_1ColumnList;
begin
  Result := FT1RXXXXG41S;
end;

function TXMLDBody.Get_T1RXXXXG42S: IXMLDGKodausesOperation6ColumnList;
begin
  Result := FT1RXXXXG42S;
end;

function TXMLDBody.Get_T1RXXXXG43S: IXMLDGKodRectification6ColumnList;
begin
  Result := FT1RXXXXG43S;
end;

function TXMLDBody.Get_T1RXXXXG5S: IXMLStrColumnList;
begin
  Result := FT1RXXXXG5S;
end;

function TXMLDBody.Get_T1RXXXXG6: IXMLHIPNColumn0List;
begin
  Result := FT1RXXXXG6;
end;

function TXMLDBody.Get_T1RXXXXG7: IXMLDecimal2ColumnList;
begin
  Result := FT1RXXXXG7;
end;

function TXMLDBody.Get_T1RXXXXG8: IXMLDecimal2ColumnList;
begin
  Result := FT1RXXXXG8;
end;

function TXMLDBody.Get_T1RXXXXG9: IXMLDecimal2ColumnList;
begin
  Result := FT1RXXXXG9;
end;

function TXMLDBody.Get_T1RXXXXG10: IXMLDecimal2ColumnList;
begin
  Result := FT1RXXXXG10;
end;

function TXMLDBody.Get_T1RXXXXG11: IXMLDecimal2ColumnList;
begin
  Result := FT1RXXXXG11;
end;

function TXMLDBody.Get_T1RXXXXG12: IXMLDecimal2ColumnList;
begin
  Result := FT1RXXXXG12;
end;

function TXMLDBody.Get_T1RXXXXG13: IXMLDecimal2ColumnList;
begin
  Result := FT1RXXXXG13;
end;

function TXMLDBody.Get_R011G7: WideString;
begin
  Result := ChildNodes['R011G7'].Text;
end;

procedure TXMLDBody.Set_R011G7(Value: WideString);
begin
  ChildNodes['R011G7'].NodeValue := Value;
end;

function TXMLDBody.Get_R011G8: WideString;
begin
  Result := ChildNodes['R011G8'].Text;
end;

procedure TXMLDBody.Set_R011G8(Value: WideString);
begin
  ChildNodes['R011G8'].NodeValue := Value;
end;

function TXMLDBody.Get_R011G9: WideString;
begin
  Result := ChildNodes['R011G9'].Text;
end;

procedure TXMLDBody.Set_R011G9(Value: WideString);
begin
  ChildNodes['R011G9'].NodeValue := Value;
end;

function TXMLDBody.Get_R011G10: WideString;
begin
  Result := ChildNodes['R011G10'].Text;
end;

procedure TXMLDBody.Set_R011G10(Value: WideString);
begin
  ChildNodes['R011G10'].NodeValue := Value;
end;

function TXMLDBody.Get_R011G11: WideString;
begin
  Result := ChildNodes['R011G11'].Text;
end;

procedure TXMLDBody.Set_R011G11(Value: WideString);
begin
  ChildNodes['R011G11'].NodeValue := Value;
end;

function TXMLDBody.Get_R011G12: WideString;
begin
  Result := ChildNodes['R011G12'].Text;
end;

procedure TXMLDBody.Set_R011G12(Value: WideString);
begin
  ChildNodes['R011G12'].NodeValue := Value;
end;

function TXMLDBody.Get_R011G13: WideString;
begin
  Result := ChildNodes['R011G13'].Text;
end;

procedure TXMLDBody.Set_R011G13(Value: WideString);
begin
  ChildNodes['R011G13'].NodeValue := Value;
end;

function TXMLDBody.Get_R012G7: WideString;
begin
  Result := ChildNodes['R012G7'].Text;
end;

procedure TXMLDBody.Set_R012G7(Value: WideString);
begin
  ChildNodes['R012G7'].NodeValue := Value;
end;

function TXMLDBody.Get_R012G8: WideString;
begin
  Result := ChildNodes['R012G8'].Text;
end;

procedure TXMLDBody.Set_R012G8(Value: WideString);
begin
  ChildNodes['R012G8'].NodeValue := Value;
end;

function TXMLDBody.Get_R012G9: WideString;
begin
  Result := ChildNodes['R012G9'].Text;
end;

procedure TXMLDBody.Set_R012G9(Value: WideString);
begin
  ChildNodes['R012G9'].NodeValue := Value;
end;

function TXMLDBody.Get_R012G10: WideString;
begin
  Result := ChildNodes['R012G10'].Text;
end;

procedure TXMLDBody.Set_R012G10(Value: WideString);
begin
  ChildNodes['R012G10'].NodeValue := Value;
end;

function TXMLDBody.Get_R012G11: WideString;
begin
  Result := ChildNodes['R012G11'].Text;
end;

procedure TXMLDBody.Set_R012G11(Value: WideString);
begin
  ChildNodes['R012G11'].NodeValue := Value;
end;

function TXMLDBody.Get_R012G12: WideString;
begin
  Result := ChildNodes['R012G12'].Text;
end;

procedure TXMLDBody.Set_R012G12(Value: WideString);
begin
  ChildNodes['R012G12'].NodeValue := Value;
end;

function TXMLDBody.Get_R012G13: WideString;
begin
  Result := ChildNodes['R012G13'].Text;
end;

procedure TXMLDBody.Set_R012G13(Value: WideString);
begin
  ChildNodes['R012G13'].NodeValue := Value;
end;

function TXMLDBody.Get_T2RXXXXG1: IXMLIntColumnList;
begin
  Result := FT2RXXXXG1;
end;

function TXMLDBody.Get_T2RXXXXG2D: IXMLDateColumnList;
begin
  Result := FT2RXXXXG2D;
end;

function TXMLDBody.Get_T2RXXXXG3D: IXMLDateColumnList;
begin
  Result := FT2RXXXXG3D;
end;

function TXMLDBody.Get_T2RXXXXG4S: IXMLStrColumnList;
begin
  Result := FT2RXXXXG4S;
end;

function TXMLDBody.Get_T2RXXXXG51S: IXMLDGKodDocROVPD6_2ColumnList;
begin
  Result := FT2RXXXXG51S;
end;

function TXMLDBody.Get_T2RXXXXG52S: IXMLDGKodAssignment6ColumnList;
begin
  Result := FT2RXXXXG52S;
end;

function TXMLDBody.Get_T2RXXXXG53S: IXMLDGKodRectification6ColumnList;
begin
  Result := FT2RXXXXG53S;
end;

function TXMLDBody.Get_T2RXXXXG6S: IXMLStrColumnList;
begin
  Result := FT2RXXXXG6S;
end;

function TXMLDBody.Get_T2RXXXXG7: IXMLHIPNColumn0List;
begin
  Result := FT2RXXXXG7;
end;

function TXMLDBody.Get_T2RXXXXG8: IXMLDecimal2ColumnList;
begin
  Result := FT2RXXXXG8;
end;

function TXMLDBody.Get_T2RXXXXG9: IXMLDecimal2ColumnList;
begin
  Result := FT2RXXXXG9;
end;

function TXMLDBody.Get_T2RXXXXG10: IXMLDecimal2ColumnList;
begin
  Result := FT2RXXXXG10;
end;

function TXMLDBody.Get_T2RXXXXG11: IXMLDecimal2ColumnList;
begin
  Result := FT2RXXXXG11;
end;

function TXMLDBody.Get_T2RXXXXG12: IXMLDecimal2ColumnList;
begin
  Result := FT2RXXXXG12;
end;

function TXMLDBody.Get_T2RXXXXG13: IXMLDecimal2ColumnList;
begin
  Result := FT2RXXXXG13;
end;

function TXMLDBody.Get_T2RXXXXG14: IXMLDecimal2ColumnList;
begin
  Result := FT2RXXXXG14;
end;

function TXMLDBody.Get_T2RXXXXG15: IXMLDecimal2ColumnList;
begin
  Result := FT2RXXXXG15;
end;

function TXMLDBody.Get_T2RXXXXG16: IXMLDecimal2ColumnList;
begin
  Result := FT2RXXXXG16;
end;

function TXMLDBody.Get_R021G8: WideString;
begin
  Result := ChildNodes['R021G8'].Text;
end;

procedure TXMLDBody.Set_R021G8(Value: WideString);
begin
  ChildNodes['R021G8'].NodeValue := Value;
end;

function TXMLDBody.Get_R021G9: WideString;
begin
  Result := ChildNodes['R021G9'].Text;
end;

procedure TXMLDBody.Set_R021G9(Value: WideString);
begin
  ChildNodes['R021G9'].NodeValue := Value;
end;

function TXMLDBody.Get_R021G10: WideString;
begin
  Result := ChildNodes['R021G10'].Text;
end;

procedure TXMLDBody.Set_R021G10(Value: WideString);
begin
  ChildNodes['R021G10'].NodeValue := Value;
end;

function TXMLDBody.Get_R021G11: WideString;
begin
  Result := ChildNodes['R021G11'].Text;
end;

procedure TXMLDBody.Set_R021G11(Value: WideString);
begin
  ChildNodes['R021G11'].NodeValue := Value;
end;

function TXMLDBody.Get_R021G12: WideString;
begin
  Result := ChildNodes['R021G12'].Text;
end;

procedure TXMLDBody.Set_R021G12(Value: WideString);
begin
  ChildNodes['R021G12'].NodeValue := Value;
end;

function TXMLDBody.Get_R021G13: WideString;
begin
  Result := ChildNodes['R021G13'].Text;
end;

procedure TXMLDBody.Set_R021G13(Value: WideString);
begin
  ChildNodes['R021G13'].NodeValue := Value;
end;

function TXMLDBody.Get_R021G14: WideString;
begin
  Result := ChildNodes['R021G14'].Text;
end;

procedure TXMLDBody.Set_R021G14(Value: WideString);
begin
  ChildNodes['R021G14'].NodeValue := Value;
end;

function TXMLDBody.Get_R021G15: WideString;
begin
  Result := ChildNodes['R021G15'].Text;
end;

procedure TXMLDBody.Set_R021G15(Value: WideString);
begin
  ChildNodes['R021G15'].NodeValue := Value;
end;

function TXMLDBody.Get_R021G16: WideString;
begin
  Result := ChildNodes['R021G16'].Text;
end;

procedure TXMLDBody.Set_R021G16(Value: WideString);
begin
  ChildNodes['R021G16'].NodeValue := Value;
end;

function TXMLDBody.Get_R022G8: WideString;
begin
  Result := ChildNodes['R022G8'].Text;
end;

procedure TXMLDBody.Set_R022G8(Value: WideString);
begin
  ChildNodes['R022G8'].NodeValue := Value;
end;

function TXMLDBody.Get_R022G9: WideString;
begin
  Result := ChildNodes['R022G9'].Text;
end;

procedure TXMLDBody.Set_R022G9(Value: WideString);
begin
  ChildNodes['R022G9'].NodeValue := Value;
end;

function TXMLDBody.Get_R022G10: WideString;
begin
  Result := ChildNodes['R022G10'].Text;
end;

procedure TXMLDBody.Set_R022G10(Value: WideString);
begin
  ChildNodes['R022G10'].NodeValue := Value;
end;

function TXMLDBody.Get_R022G11: WideString;
begin
  Result := ChildNodes['R022G11'].Text;
end;

procedure TXMLDBody.Set_R022G11(Value: WideString);
begin
  ChildNodes['R022G11'].NodeValue := Value;
end;

function TXMLDBody.Get_R022G12: WideString;
begin
  Result := ChildNodes['R022G12'].Text;
end;

procedure TXMLDBody.Set_R022G12(Value: WideString);
begin
  ChildNodes['R022G12'].NodeValue := Value;
end;

function TXMLDBody.Get_R022G13: WideString;
begin
  Result := ChildNodes['R022G13'].Text;
end;

procedure TXMLDBody.Set_R022G13(Value: WideString);
begin
  ChildNodes['R022G13'].NodeValue := Value;
end;

function TXMLDBody.Get_R022G14: WideString;
begin
  Result := ChildNodes['R022G14'].Text;
end;

procedure TXMLDBody.Set_R022G14(Value: WideString);
begin
  ChildNodes['R022G14'].NodeValue := Value;
end;

function TXMLDBody.Get_R022G15: WideString;
begin
  Result := ChildNodes['R022G15'].Text;
end;

procedure TXMLDBody.Set_R022G15(Value: WideString);
begin
  ChildNodes['R022G15'].NodeValue := Value;
end;

function TXMLDBody.Get_R022G16: WideString;
begin
  Result := ChildNodes['R022G16'].Text;
end;

procedure TXMLDBody.Set_R022G16(Value: WideString);
begin
  ChildNodes['R022G16'].NodeValue := Value;
end;

function TXMLDBody.Get_HFILL: WideString;
begin
  Result := ChildNodes['HFILL'].Text;
end;

procedure TXMLDBody.Set_HFILL(Value: WideString);
begin
  ChildNodes['HFILL'].NodeValue := Value;
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

function TXMLDBody.Get_HBUH: WideString;
begin
  Result := ChildNodes['HBUH'].Text;
end;

procedure TXMLDBody.Set_HBUH(Value: WideString);
begin
  ChildNodes['HBUH'].NodeValue := Value;
end;

function TXMLDBody.Get_HKBUH: WideString;
begin
  Result := ChildNodes['HKBUH'].Text;
end;

procedure TXMLDBody.Set_HKBUH(Value: WideString);
begin
  ChildNodes['HKBUH'].NodeValue := Value;
end;

{ TXMLIntColumn }

function TXMLIntColumn.Get_ROWNUM: Integer;
begin
  Result := AttributeNodes['ROWNUM'].NodeValue;
end;

procedure TXMLIntColumn.Set_ROWNUM(Value: Integer);
begin
  SetAttribute('ROWNUM', Value);
end;

{ TXMLIntColumnList }

function TXMLIntColumnList.Add: IXMLIntColumn;
begin
  Result := AddItem(-1) as IXMLIntColumn;
end;

function TXMLIntColumnList.Insert(const Index: Integer): IXMLIntColumn;
begin
  Result := AddItem(Index) as IXMLIntColumn;
end;
function TXMLIntColumnList.Get_Item(Index: Integer): IXMLIntColumn;
begin
  Result := List[Index] as IXMLIntColumn;
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

{ TXMLDGKodTypeDoc6_1Column }

function TXMLDGKodTypeDoc6_1Column.Get_ROWNUM: Integer;
begin
  Result := AttributeNodes['ROWNUM'].NodeValue;
end;

procedure TXMLDGKodTypeDoc6_1Column.Set_ROWNUM(Value: Integer);
begin
  SetAttribute('ROWNUM', Value);
end;

{ TXMLDGKodTypeDoc6_1ColumnList }

function TXMLDGKodTypeDoc6_1ColumnList.Add: IXMLDGKodTypeDoc6_1Column;
begin
  Result := AddItem(-1) as IXMLDGKodTypeDoc6_1Column;
end;

function TXMLDGKodTypeDoc6_1ColumnList.Insert(const Index: Integer): IXMLDGKodTypeDoc6_1Column;
begin
  Result := AddItem(Index) as IXMLDGKodTypeDoc6_1Column;
end;
function TXMLDGKodTypeDoc6_1ColumnList.Get_Item(Index: Integer): IXMLDGKodTypeDoc6_1Column;
begin
  Result := List[Index] as IXMLDGKodTypeDoc6_1Column;
end;

{ TXMLDGKodausesOperation6Column }

function TXMLDGKodausesOperation6Column.Get_ROWNUM: Integer;
begin
  Result := AttributeNodes['ROWNUM'].NodeValue;
end;

procedure TXMLDGKodausesOperation6Column.Set_ROWNUM(Value: Integer);
begin
  SetAttribute('ROWNUM', Value);
end;

{ TXMLDGKodausesOperation6ColumnList }

function TXMLDGKodausesOperation6ColumnList.Add: IXMLDGKodausesOperation6Column;
begin
  Result := AddItem(-1) as IXMLDGKodausesOperation6Column;
end;

function TXMLDGKodausesOperation6ColumnList.Insert(const Index: Integer): IXMLDGKodausesOperation6Column;
begin
  Result := AddItem(Index) as IXMLDGKodausesOperation6Column;
end;
function TXMLDGKodausesOperation6ColumnList.Get_Item(Index: Integer): IXMLDGKodausesOperation6Column;
begin
  Result := List[Index] as IXMLDGKodausesOperation6Column;
end;

{ TXMLDGKodRectification6Column }

function TXMLDGKodRectification6Column.Get_ROWNUM: Integer;
begin
  Result := AttributeNodes['ROWNUM'].NodeValue;
end;

procedure TXMLDGKodRectification6Column.Set_ROWNUM(Value: Integer);
begin
  SetAttribute('ROWNUM', Value);
end;

{ TXMLDGKodRectification6ColumnList }

function TXMLDGKodRectification6ColumnList.Add: IXMLDGKodRectification6Column;
begin
  Result := AddItem(-1) as IXMLDGKodRectification6Column;
end;

function TXMLDGKodRectification6ColumnList.Insert(const Index: Integer): IXMLDGKodRectification6Column;
begin
  Result := AddItem(Index) as IXMLDGKodRectification6Column;
end;
function TXMLDGKodRectification6ColumnList.Get_Item(Index: Integer): IXMLDGKodRectification6Column;
begin
  Result := List[Index] as IXMLDGKodRectification6Column;
end;

{ TXMLHIPNColumn0 }

function TXMLHIPNColumn0.Get_ROWNUM: Integer;
begin
  Result := AttributeNodes['ROWNUM'].NodeValue;
end;

procedure TXMLHIPNColumn0.Set_ROWNUM(Value: Integer);
begin
  SetAttribute('ROWNUM', Value);
end;

{ TXMLHIPNColumn0List }

function TXMLHIPNColumn0List.Add: IXMLHIPNColumn0;
begin
  Result := AddItem(-1) as IXMLHIPNColumn0;
end;

function TXMLHIPNColumn0List.Insert(const Index: Integer): IXMLHIPNColumn0;
begin
  Result := AddItem(Index) as IXMLHIPNColumn0;
end;
function TXMLHIPNColumn0List.Get_Item(Index: Integer): IXMLHIPNColumn0;
begin
  Result := List[Index] as IXMLHIPNColumn0;
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

{ TXMLDGKodDocROVPD6_2Column }

function TXMLDGKodDocROVPD6_2Column.Get_ROWNUM: Integer;
begin
  Result := AttributeNodes['ROWNUM'].NodeValue;
end;

procedure TXMLDGKodDocROVPD6_2Column.Set_ROWNUM(Value: Integer);
begin
  SetAttribute('ROWNUM', Value);
end;

{ TXMLDGKodDocROVPD6_2ColumnList }

function TXMLDGKodDocROVPD6_2ColumnList.Add: IXMLDGKodDocROVPD6_2Column;
begin
  Result := AddItem(-1) as IXMLDGKodDocROVPD6_2Column;
end;

function TXMLDGKodDocROVPD6_2ColumnList.Insert(const Index: Integer): IXMLDGKodDocROVPD6_2Column;
begin
  Result := AddItem(Index) as IXMLDGKodDocROVPD6_2Column;
end;
function TXMLDGKodDocROVPD6_2ColumnList.Get_Item(Index: Integer): IXMLDGKodDocROVPD6_2Column;
begin
  Result := List[Index] as IXMLDGKodDocROVPD6_2Column;
end;

{ TXMLDGKodAssignment6Column }

function TXMLDGKodAssignment6Column.Get_ROWNUM: Integer;
begin
  Result := AttributeNodes['ROWNUM'].NodeValue;
end;

procedure TXMLDGKodAssignment6Column.Set_ROWNUM(Value: Integer);
begin
  SetAttribute('ROWNUM', Value);
end;

{ TXMLDGKodAssignment6ColumnList }

function TXMLDGKodAssignment6ColumnList.Add: IXMLDGKodAssignment6Column;
begin
  Result := AddItem(-1) as IXMLDGKodAssignment6Column;
end;

function TXMLDGKodAssignment6ColumnList.Insert(const Index: Integer): IXMLDGKodAssignment6Column;
begin
  Result := AddItem(Index) as IXMLDGKodAssignment6Column;
end;
function TXMLDGKodAssignment6ColumnList.Get_Item(Index: Integer): IXMLDGKodAssignment6Column;
begin
  Result := List[Index] as IXMLDGKodAssignment6Column;
end;

end. 