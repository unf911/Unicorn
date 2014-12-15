
{*************************************************************************}
{                                                                         }
{                            XML Data Binding                             }
{                                                                         }
{         Generated on: 15.12.2014 23:43:13                               }
{       Generated from: D:\data\work\UniSebest_git\Unicorn\J1201508.xsd   }
{   Settings stored in: D:\data\work\UniSebest_git\Unicorn\J1201508.xdb   }
{                                                                         }
{*************************************************************************}

unit J1201508;

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
  IXMLDGKodControlledOperationTB08Column = interface;
  IXMLDGKodControlledOperationTB08ColumnList = interface;
  IXMLDGKodAssignment6Column = interface;
  IXMLDGKodAssignment6ColumnList = interface;

{ IXMLDeclarContent }

  IXMLDeclarContent = interface(IXMLNode)
    ['{C6FAF0A2-720B-4336-862A-E9BC1E3DD092}']
    { Property Accessors }
    function Get_DECLARHEAD: IXMLDHead;
    function Get_DECLARBODY: IXMLDBody;
    { Methods & Properties }
    property DECLARHEAD: IXMLDHead read Get_DECLARHEAD;
    property DECLARBODY: IXMLDBody read Get_DECLARBODY;
  end;

{ IXMLDHead }

  IXMLDHead = interface(IXMLNode)
    ['{654D1F48-FF1F-4823-AD01-54A5DDBC2630}']
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
    ['{A69E684C-9605-401B-B7B8-2E8BBD330364}']
    { Property Accessors }
    function Get_DOC(Index: Integer): IXMLDOC;
    { Methods & Properties }
    function Add: IXMLDOC;
    function Insert(const Index: Integer): IXMLDOC;
    property DOC[Index: Integer]: IXMLDOC read Get_DOC; default;
  end;

{ IXMLDOC }

  IXMLDOC = interface(IXMLNode)
    ['{2C72F307-F542-4F38-866F-5883AEC089F3}']
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
    ['{9B8A08E5-8B19-4240-BABB-A33BF91EE586}']
    { Property Accessors }
    function Get_HZ: Integer;
    function Get_HZN: Integer;
    function Get_HNP: Int64;
    function Get_HZY: Integer;
    function Get_HZM: Integer;
    function Get_HKV: Integer;
    function Get_HNAME: WideString;
    function Get_HNPDV: WideString;
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
    function Get_T1RXXXXG110: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG111: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG10: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG113: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG114: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG12: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG13: IXMLDecimal2ColumnList;
    function Get_R011G7: WideString;
    function Get_R011G8: WideString;
    function Get_R011G9: WideString;
    function Get_R011G110: WideString;
    function Get_R011G111: WideString;
    function Get_R011G10: WideString;
    function Get_R011G113: WideString;
    function Get_R011G114: WideString;
    function Get_R011G12: WideString;
    function Get_R011G13: WideString;
    function Get_R012G7: WideString;
    function Get_R012G8: WideString;
    function Get_R012G9: WideString;
    function Get_R012G110: WideString;
    function Get_R012G111: WideString;
    function Get_R012G10: WideString;
    function Get_R012G113: WideString;
    function Get_R012G114: WideString;
    function Get_R012G12: WideString;
    function Get_R012G13: WideString;
    function Get_T2RXXXXG1: IXMLIntColumnList;
    function Get_T2RXXXXG2D: IXMLDateColumnList;
    function Get_T2RXXXXG3D: IXMLDateColumnList;
    function Get_T2RXXXXG4S: IXMLStrColumnList;
    function Get_T2RXXXXG51S: IXMLDGKodDocROVPD6_2ColumnList;
    function Get_T2RXXXXG54S: IXMLDGKodControlledOperationTB08ColumnList;
    function Get_T2RXXXXG52S: IXMLDGKodAssignment6ColumnList;
    function Get_T2RXXXXG53S: IXMLDGKodRectification6ColumnList;
    function Get_T2RXXXXG6S: IXMLStrColumnList;
    function Get_T2RXXXXG7: IXMLHIPNColumn0List;
    function Get_T2RXXXXG8: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG109: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG110: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG111: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG112: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG113: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG9: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG10: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG11: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG12: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG13: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG14: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG15: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG16: IXMLDecimal2ColumnList;
    function Get_R021G8: WideString;
    function Get_R021G110: WideString;
    function Get_R021G111: WideString;
    function Get_R021G112: WideString;
    function Get_R021G113: WideString;
    function Get_R021G9: WideString;
    function Get_R021G10: WideString;
    function Get_R021G11: WideString;
    function Get_R021G12: WideString;
    function Get_R021G13: WideString;
    function Get_R021G14: WideString;
    function Get_R021G15: WideString;
    function Get_R021G16: WideString;
    function Get_R022G8: WideString;
    function Get_R022G110: WideString;
    function Get_R022G111: WideString;
    function Get_R022G112: WideString;
    function Get_R022G113: WideString;
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
    procedure Set_R011G7(Value: WideString);
    procedure Set_R011G8(Value: WideString);
    procedure Set_R011G9(Value: WideString);
    procedure Set_R011G110(Value: WideString);
    procedure Set_R011G111(Value: WideString);
    procedure Set_R011G10(Value: WideString);
    procedure Set_R011G113(Value: WideString);
    procedure Set_R011G114(Value: WideString);
    procedure Set_R011G12(Value: WideString);
    procedure Set_R011G13(Value: WideString);
    procedure Set_R012G7(Value: WideString);
    procedure Set_R012G8(Value: WideString);
    procedure Set_R012G9(Value: WideString);
    procedure Set_R012G110(Value: WideString);
    procedure Set_R012G111(Value: WideString);
    procedure Set_R012G10(Value: WideString);
    procedure Set_R012G113(Value: WideString);
    procedure Set_R012G114(Value: WideString);
    procedure Set_R012G12(Value: WideString);
    procedure Set_R012G13(Value: WideString);
    procedure Set_R021G8(Value: WideString);
    procedure Set_R021G110(Value: WideString);
    procedure Set_R021G111(Value: WideString);
    procedure Set_R021G112(Value: WideString);
    procedure Set_R021G113(Value: WideString);
    procedure Set_R021G9(Value: WideString);
    procedure Set_R021G10(Value: WideString);
    procedure Set_R021G11(Value: WideString);
    procedure Set_R021G12(Value: WideString);
    procedure Set_R021G13(Value: WideString);
    procedure Set_R021G14(Value: WideString);
    procedure Set_R021G15(Value: WideString);
    procedure Set_R021G16(Value: WideString);
    procedure Set_R022G8(Value: WideString);
    procedure Set_R022G110(Value: WideString);
    procedure Set_R022G111(Value: WideString);
    procedure Set_R022G112(Value: WideString);
    procedure Set_R022G113(Value: WideString);
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
    property T1RXXXXG110: IXMLDecimal2ColumnList read Get_T1RXXXXG110;
    property T1RXXXXG111: IXMLDecimal2ColumnList read Get_T1RXXXXG111;
    property T1RXXXXG10: IXMLDecimal2ColumnList read Get_T1RXXXXG10;
    property T1RXXXXG113: IXMLDecimal2ColumnList read Get_T1RXXXXG113;
    property T1RXXXXG114: IXMLDecimal2ColumnList read Get_T1RXXXXG114;
    property T1RXXXXG12: IXMLDecimal2ColumnList read Get_T1RXXXXG12;
    property T1RXXXXG13: IXMLDecimal2ColumnList read Get_T1RXXXXG13;
    property R011G7: WideString read Get_R011G7 write Set_R011G7;
    property R011G8: WideString read Get_R011G8 write Set_R011G8;
    property R011G9: WideString read Get_R011G9 write Set_R011G9;
    property R011G110: WideString read Get_R011G110 write Set_R011G110;
    property R011G111: WideString read Get_R011G111 write Set_R011G111;
    property R011G10: WideString read Get_R011G10 write Set_R011G10;
    property R011G113: WideString read Get_R011G113 write Set_R011G113;
    property R011G114: WideString read Get_R011G114 write Set_R011G114;
    property R011G12: WideString read Get_R011G12 write Set_R011G12;
    property R011G13: WideString read Get_R011G13 write Set_R011G13;
    property R012G7: WideString read Get_R012G7 write Set_R012G7;
    property R012G8: WideString read Get_R012G8 write Set_R012G8;
    property R012G9: WideString read Get_R012G9 write Set_R012G9;
    property R012G110: WideString read Get_R012G110 write Set_R012G110;
    property R012G111: WideString read Get_R012G111 write Set_R012G111;
    property R012G10: WideString read Get_R012G10 write Set_R012G10;
    property R012G113: WideString read Get_R012G113 write Set_R012G113;
    property R012G114: WideString read Get_R012G114 write Set_R012G114;
    property R012G12: WideString read Get_R012G12 write Set_R012G12;
    property R012G13: WideString read Get_R012G13 write Set_R012G13;
    property T2RXXXXG1: IXMLIntColumnList read Get_T2RXXXXG1;
    property T2RXXXXG2D: IXMLDateColumnList read Get_T2RXXXXG2D;
    property T2RXXXXG3D: IXMLDateColumnList read Get_T2RXXXXG3D;
    property T2RXXXXG4S: IXMLStrColumnList read Get_T2RXXXXG4S;
    property T2RXXXXG51S: IXMLDGKodDocROVPD6_2ColumnList read Get_T2RXXXXG51S;
    property T2RXXXXG54S: IXMLDGKodControlledOperationTB08ColumnList read Get_T2RXXXXG54S;
    property T2RXXXXG52S: IXMLDGKodAssignment6ColumnList read Get_T2RXXXXG52S;
    property T2RXXXXG53S: IXMLDGKodRectification6ColumnList read Get_T2RXXXXG53S;
    property T2RXXXXG6S: IXMLStrColumnList read Get_T2RXXXXG6S;
    property T2RXXXXG7: IXMLHIPNColumn0List read Get_T2RXXXXG7;
    property T2RXXXXG8: IXMLDecimal2ColumnList read Get_T2RXXXXG8;
    property T2RXXXXG109: IXMLDecimal2ColumnList read Get_T2RXXXXG109;
    property T2RXXXXG110: IXMLDecimal2ColumnList read Get_T2RXXXXG110;
    property T2RXXXXG111: IXMLDecimal2ColumnList read Get_T2RXXXXG111;
    property T2RXXXXG112: IXMLDecimal2ColumnList read Get_T2RXXXXG112;
    property T2RXXXXG113: IXMLDecimal2ColumnList read Get_T2RXXXXG113;
    property T2RXXXXG9: IXMLDecimal2ColumnList read Get_T2RXXXXG9;
    property T2RXXXXG10: IXMLDecimal2ColumnList read Get_T2RXXXXG10;
    property T2RXXXXG11: IXMLDecimal2ColumnList read Get_T2RXXXXG11;
    property T2RXXXXG12: IXMLDecimal2ColumnList read Get_T2RXXXXG12;
    property T2RXXXXG13: IXMLDecimal2ColumnList read Get_T2RXXXXG13;
    property T2RXXXXG14: IXMLDecimal2ColumnList read Get_T2RXXXXG14;
    property T2RXXXXG15: IXMLDecimal2ColumnList read Get_T2RXXXXG15;
    property T2RXXXXG16: IXMLDecimal2ColumnList read Get_T2RXXXXG16;
    property R021G8: WideString read Get_R021G8 write Set_R021G8;
    property R021G110: WideString read Get_R021G110 write Set_R021G110;
    property R021G111: WideString read Get_R021G111 write Set_R021G111;
    property R021G112: WideString read Get_R021G112 write Set_R021G112;
    property R021G113: WideString read Get_R021G113 write Set_R021G113;
    property R021G9: WideString read Get_R021G9 write Set_R021G9;
    property R021G10: WideString read Get_R021G10 write Set_R021G10;
    property R021G11: WideString read Get_R021G11 write Set_R021G11;
    property R021G12: WideString read Get_R021G12 write Set_R021G12;
    property R021G13: WideString read Get_R021G13 write Set_R021G13;
    property R021G14: WideString read Get_R021G14 write Set_R021G14;
    property R021G15: WideString read Get_R021G15 write Set_R021G15;
    property R021G16: WideString read Get_R021G16 write Set_R021G16;
    property R022G8: WideString read Get_R022G8 write Set_R022G8;
    property R022G110: WideString read Get_R022G110 write Set_R022G110;
    property R022G111: WideString read Get_R022G111 write Set_R022G111;
    property R022G112: WideString read Get_R022G112 write Set_R022G112;
    property R022G113: WideString read Get_R022G113 write Set_R022G113;
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
    ['{CABAD8B0-0990-40B8-9B3A-6A2C57C0CB29}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLIntColumnList }

  IXMLIntColumnList = interface(IXMLNodeCollection)
    ['{4AFF234E-3030-40DB-B0F1-CCF0C8A34909}']
    { Methods & Properties }
    function Add: IXMLIntColumn;
    function Insert(const Index: Integer): IXMLIntColumn;
    function Get_Item(Index: Integer): IXMLIntColumn;
    property Items[Index: Integer]: IXMLIntColumn read Get_Item; default;
  end;

{ IXMLDateColumn }

  IXMLDateColumn = interface(IXMLNode)
    ['{5E67F7B4-465C-46F7-8DCB-6F2DCD5372F0}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLDateColumnList }

  IXMLDateColumnList = interface(IXMLNodeCollection)
    ['{57BAF9C1-01B2-44F5-BF89-1A173B92034A}']
    { Methods & Properties }
    function Add: IXMLDateColumn;
    function Insert(const Index: Integer): IXMLDateColumn;
    function Get_Item(Index: Integer): IXMLDateColumn;
    property Items[Index: Integer]: IXMLDateColumn read Get_Item; default;
  end;

{ IXMLStrColumn }

  IXMLStrColumn = interface(IXMLNode)
    ['{ED7C6DB7-C385-4B7D-BCF1-03592AADDC86}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLStrColumnList }

  IXMLStrColumnList = interface(IXMLNodeCollection)
    ['{10BD57FE-30C1-4443-B4BD-9B93CB5E1F05}']
    { Methods & Properties }
    function Add: IXMLStrColumn;
    function Insert(const Index: Integer): IXMLStrColumn;
    function Get_Item(Index: Integer): IXMLStrColumn;
    property Items[Index: Integer]: IXMLStrColumn read Get_Item; default;
  end;

{ IXMLDGKodTypeDoc6_1Column }

  IXMLDGKodTypeDoc6_1Column = interface(IXMLNode)
    ['{55DFE33B-5DFB-40E2-B308-7D5B8EFF59B4}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLDGKodTypeDoc6_1ColumnList }

  IXMLDGKodTypeDoc6_1ColumnList = interface(IXMLNodeCollection)
    ['{93D9D1CB-4ABB-4A06-ADE4-E92AFDAB5BB9}']
    { Methods & Properties }
    function Add: IXMLDGKodTypeDoc6_1Column;
    function Insert(const Index: Integer): IXMLDGKodTypeDoc6_1Column;
    function Get_Item(Index: Integer): IXMLDGKodTypeDoc6_1Column;
    property Items[Index: Integer]: IXMLDGKodTypeDoc6_1Column read Get_Item; default;
  end;

{ IXMLDGKodausesOperation6Column }

  IXMLDGKodausesOperation6Column = interface(IXMLNode)
    ['{9F89B646-1DC4-494B-8809-818B2FBF1F51}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLDGKodausesOperation6ColumnList }

  IXMLDGKodausesOperation6ColumnList = interface(IXMLNodeCollection)
    ['{2413A8C8-CE24-496A-976F-298ED892712B}']
    { Methods & Properties }
    function Add: IXMLDGKodausesOperation6Column;
    function Insert(const Index: Integer): IXMLDGKodausesOperation6Column;
    function Get_Item(Index: Integer): IXMLDGKodausesOperation6Column;
    property Items[Index: Integer]: IXMLDGKodausesOperation6Column read Get_Item; default;
  end;

{ IXMLDGKodRectification6Column }

  IXMLDGKodRectification6Column = interface(IXMLNode)
    ['{A7D0F0F7-76BD-4CBE-A901-436DCFBF5FEA}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLDGKodRectification6ColumnList }

  IXMLDGKodRectification6ColumnList = interface(IXMLNodeCollection)
    ['{912B6E36-E261-4E0F-B9D8-6CC568BA79DD}']
    { Methods & Properties }
    function Add: IXMLDGKodRectification6Column;
    function Insert(const Index: Integer): IXMLDGKodRectification6Column;
    function Get_Item(Index: Integer): IXMLDGKodRectification6Column;
    property Items[Index: Integer]: IXMLDGKodRectification6Column read Get_Item; default;
  end;

{ IXMLHIPNColumn0 }

  IXMLHIPNColumn0 = interface(IXMLNode)
    ['{4EDC00E3-1109-465E-AD70-B0D115C4E2B7}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLHIPNColumn0List }

  IXMLHIPNColumn0List = interface(IXMLNodeCollection)
    ['{07D3F4AE-2A6B-4261-B55A-0220B90C0282}']
    { Methods & Properties }
    function Add: IXMLHIPNColumn0;
    function Insert(const Index: Integer): IXMLHIPNColumn0;
    function Get_Item(Index: Integer): IXMLHIPNColumn0;
    property Items[Index: Integer]: IXMLHIPNColumn0 read Get_Item; default;
  end;

{ IXMLDecimal2Column }

  IXMLDecimal2Column = interface(IXMLNode)
    ['{DABF90F6-3977-42C0-A01D-63B80E31EFB7}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLDecimal2ColumnList }

  IXMLDecimal2ColumnList = interface(IXMLNodeCollection)
    ['{6E580884-A60C-45F2-B9E2-C8DBC841F799}']
    { Methods & Properties }
    function Add: IXMLDecimal2Column;
    function Insert(const Index: Integer): IXMLDecimal2Column;
    function Get_Item(Index: Integer): IXMLDecimal2Column;
    property Items[Index: Integer]: IXMLDecimal2Column read Get_Item; default;
  end;

{ IXMLDGKodDocROVPD6_2Column }

  IXMLDGKodDocROVPD6_2Column = interface(IXMLNode)
    ['{57A884BD-B39F-4275-849A-AC5BC527F47A}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLDGKodDocROVPD6_2ColumnList }

  IXMLDGKodDocROVPD6_2ColumnList = interface(IXMLNodeCollection)
    ['{58D5E6F4-8E3E-46CA-B478-FD70207368FF}']
    { Methods & Properties }
    function Add: IXMLDGKodDocROVPD6_2Column;
    function Insert(const Index: Integer): IXMLDGKodDocROVPD6_2Column;
    function Get_Item(Index: Integer): IXMLDGKodDocROVPD6_2Column;
    property Items[Index: Integer]: IXMLDGKodDocROVPD6_2Column read Get_Item; default;
  end;

{ IXMLDGKodControlledOperationTB08Column }

  IXMLDGKodControlledOperationTB08Column = interface(IXMLNode)
    ['{DC6525D7-6FF2-4535-BD79-5F16D93DF1A4}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLDGKodControlledOperationTB08ColumnList }

  IXMLDGKodControlledOperationTB08ColumnList = interface(IXMLNodeCollection)
    ['{D86E42D3-CCF1-4802-A6F1-A78ABEBD1E05}']
    { Methods & Properties }
    function Add: IXMLDGKodControlledOperationTB08Column;
    function Insert(const Index: Integer): IXMLDGKodControlledOperationTB08Column;
    function Get_Item(Index: Integer): IXMLDGKodControlledOperationTB08Column;
    property Items[Index: Integer]: IXMLDGKodControlledOperationTB08Column read Get_Item; default;
  end;

{ IXMLDGKodAssignment6Column }

  IXMLDGKodAssignment6Column = interface(IXMLNode)
    ['{9BE7B08C-3CB1-48A5-A5D3-18669E6657AA}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLDGKodAssignment6ColumnList }

  IXMLDGKodAssignment6ColumnList = interface(IXMLNodeCollection)
    ['{8554A442-0C84-4788-89BD-654A95C44B23}']
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
  TXMLDGKodControlledOperationTB08Column = class;
  TXMLDGKodControlledOperationTB08ColumnList = class;
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
    FT1RXXXXG110: IXMLDecimal2ColumnList;
    FT1RXXXXG111: IXMLDecimal2ColumnList;
    FT1RXXXXG10: IXMLDecimal2ColumnList;
    FT1RXXXXG113: IXMLDecimal2ColumnList;
    FT1RXXXXG114: IXMLDecimal2ColumnList;
    FT1RXXXXG12: IXMLDecimal2ColumnList;
    FT1RXXXXG13: IXMLDecimal2ColumnList;
    FT2RXXXXG1: IXMLIntColumnList;
    FT2RXXXXG2D: IXMLDateColumnList;
    FT2RXXXXG3D: IXMLDateColumnList;
    FT2RXXXXG4S: IXMLStrColumnList;
    FT2RXXXXG51S: IXMLDGKodDocROVPD6_2ColumnList;
    FT2RXXXXG54S: IXMLDGKodControlledOperationTB08ColumnList;
    FT2RXXXXG52S: IXMLDGKodAssignment6ColumnList;
    FT2RXXXXG53S: IXMLDGKodRectification6ColumnList;
    FT2RXXXXG6S: IXMLStrColumnList;
    FT2RXXXXG7: IXMLHIPNColumn0List;
    FT2RXXXXG8: IXMLDecimal2ColumnList;
    FT2RXXXXG109: IXMLDecimal2ColumnList;
    FT2RXXXXG110: IXMLDecimal2ColumnList;
    FT2RXXXXG111: IXMLDecimal2ColumnList;
    FT2RXXXXG112: IXMLDecimal2ColumnList;
    FT2RXXXXG113: IXMLDecimal2ColumnList;
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
    function Get_T1RXXXXG110: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG111: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG10: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG113: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG114: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG12: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG13: IXMLDecimal2ColumnList;
    function Get_R011G7: WideString;
    function Get_R011G8: WideString;
    function Get_R011G9: WideString;
    function Get_R011G110: WideString;
    function Get_R011G111: WideString;
    function Get_R011G10: WideString;
    function Get_R011G113: WideString;
    function Get_R011G114: WideString;
    function Get_R011G12: WideString;
    function Get_R011G13: WideString;
    function Get_R012G7: WideString;
    function Get_R012G8: WideString;
    function Get_R012G9: WideString;
    function Get_R012G110: WideString;
    function Get_R012G111: WideString;
    function Get_R012G10: WideString;
    function Get_R012G113: WideString;
    function Get_R012G114: WideString;
    function Get_R012G12: WideString;
    function Get_R012G13: WideString;
    function Get_T2RXXXXG1: IXMLIntColumnList;
    function Get_T2RXXXXG2D: IXMLDateColumnList;
    function Get_T2RXXXXG3D: IXMLDateColumnList;
    function Get_T2RXXXXG4S: IXMLStrColumnList;
    function Get_T2RXXXXG51S: IXMLDGKodDocROVPD6_2ColumnList;
    function Get_T2RXXXXG54S: IXMLDGKodControlledOperationTB08ColumnList;
    function Get_T2RXXXXG52S: IXMLDGKodAssignment6ColumnList;
    function Get_T2RXXXXG53S: IXMLDGKodRectification6ColumnList;
    function Get_T2RXXXXG6S: IXMLStrColumnList;
    function Get_T2RXXXXG7: IXMLHIPNColumn0List;
    function Get_T2RXXXXG8: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG109: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG110: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG111: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG112: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG113: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG9: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG10: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG11: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG12: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG13: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG14: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG15: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG16: IXMLDecimal2ColumnList;
    function Get_R021G8: WideString;
    function Get_R021G110: WideString;
    function Get_R021G111: WideString;
    function Get_R021G112: WideString;
    function Get_R021G113: WideString;
    function Get_R021G9: WideString;
    function Get_R021G10: WideString;
    function Get_R021G11: WideString;
    function Get_R021G12: WideString;
    function Get_R021G13: WideString;
    function Get_R021G14: WideString;
    function Get_R021G15: WideString;
    function Get_R021G16: WideString;
    function Get_R022G8: WideString;
    function Get_R022G110: WideString;
    function Get_R022G111: WideString;
    function Get_R022G112: WideString;
    function Get_R022G113: WideString;
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
    procedure Set_R011G7(Value: WideString);
    procedure Set_R011G8(Value: WideString);
    procedure Set_R011G9(Value: WideString);
    procedure Set_R011G110(Value: WideString);
    procedure Set_R011G111(Value: WideString);
    procedure Set_R011G10(Value: WideString);
    procedure Set_R011G113(Value: WideString);
    procedure Set_R011G114(Value: WideString);
    procedure Set_R011G12(Value: WideString);
    procedure Set_R011G13(Value: WideString);
    procedure Set_R012G7(Value: WideString);
    procedure Set_R012G8(Value: WideString);
    procedure Set_R012G9(Value: WideString);
    procedure Set_R012G110(Value: WideString);
    procedure Set_R012G111(Value: WideString);
    procedure Set_R012G10(Value: WideString);
    procedure Set_R012G113(Value: WideString);
    procedure Set_R012G114(Value: WideString);
    procedure Set_R012G12(Value: WideString);
    procedure Set_R012G13(Value: WideString);
    procedure Set_R021G8(Value: WideString);
    procedure Set_R021G110(Value: WideString);
    procedure Set_R021G111(Value: WideString);
    procedure Set_R021G112(Value: WideString);
    procedure Set_R021G113(Value: WideString);
    procedure Set_R021G9(Value: WideString);
    procedure Set_R021G10(Value: WideString);
    procedure Set_R021G11(Value: WideString);
    procedure Set_R021G12(Value: WideString);
    procedure Set_R021G13(Value: WideString);
    procedure Set_R021G14(Value: WideString);
    procedure Set_R021G15(Value: WideString);
    procedure Set_R021G16(Value: WideString);
    procedure Set_R022G8(Value: WideString);
    procedure Set_R022G110(Value: WideString);
    procedure Set_R022G111(Value: WideString);
    procedure Set_R022G112(Value: WideString);
    procedure Set_R022G113(Value: WideString);
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

{ TXMLDGKodControlledOperationTB08Column }

  TXMLDGKodControlledOperationTB08Column = class(TXMLNode, IXMLDGKodControlledOperationTB08Column)
  protected
    { IXMLDGKodControlledOperationTB08Column }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
  end;

{ TXMLDGKodControlledOperationTB08ColumnList }

  TXMLDGKodControlledOperationTB08ColumnList = class(TXMLNodeCollection, IXMLDGKodControlledOperationTB08ColumnList)
  protected
    { IXMLDGKodControlledOperationTB08ColumnList }
    function Add: IXMLDGKodControlledOperationTB08Column;
    function Insert(const Index: Integer): IXMLDGKodControlledOperationTB08Column;
    function Get_Item(Index: Integer): IXMLDGKodControlledOperationTB08Column;
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
  RegisterChildNode('T1RXXXXG110', TXMLDecimal2Column);
  RegisterChildNode('T1RXXXXG111', TXMLDecimal2Column);
  RegisterChildNode('T1RXXXXG10', TXMLDecimal2Column);
  RegisterChildNode('T1RXXXXG113', TXMLDecimal2Column);
  RegisterChildNode('T1RXXXXG114', TXMLDecimal2Column);
  RegisterChildNode('T1RXXXXG12', TXMLDecimal2Column);
  RegisterChildNode('T1RXXXXG13', TXMLDecimal2Column);
  RegisterChildNode('T2RXXXXG1', TXMLIntColumn);
  RegisterChildNode('T2RXXXXG2D', TXMLDateColumn);
  RegisterChildNode('T2RXXXXG3D', TXMLDateColumn);
  RegisterChildNode('T2RXXXXG4S', TXMLStrColumn);
  RegisterChildNode('T2RXXXXG51S', TXMLDGKodDocROVPD6_2Column);
  RegisterChildNode('T2RXXXXG54S', TXMLDGKodControlledOperationTB08Column);
  RegisterChildNode('T2RXXXXG52S', TXMLDGKodAssignment6Column);
  RegisterChildNode('T2RXXXXG53S', TXMLDGKodRectification6Column);
  RegisterChildNode('T2RXXXXG6S', TXMLStrColumn);
  RegisterChildNode('T2RXXXXG7', TXMLHIPNColumn0);
  RegisterChildNode('T2RXXXXG8', TXMLDecimal2Column);
  RegisterChildNode('T2RXXXXG109', TXMLDecimal2Column);
  RegisterChildNode('T2RXXXXG110', TXMLDecimal2Column);
  RegisterChildNode('T2RXXXXG111', TXMLDecimal2Column);
  RegisterChildNode('T2RXXXXG112', TXMLDecimal2Column);
  RegisterChildNode('T2RXXXXG113', TXMLDecimal2Column);
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
  FT1RXXXXG110 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T1RXXXXG110') as IXMLDecimal2ColumnList;
  FT1RXXXXG111 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T1RXXXXG111') as IXMLDecimal2ColumnList;
  FT1RXXXXG10 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T1RXXXXG10') as IXMLDecimal2ColumnList;
  FT1RXXXXG113 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T1RXXXXG113') as IXMLDecimal2ColumnList;
  FT1RXXXXG114 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T1RXXXXG114') as IXMLDecimal2ColumnList;
  FT1RXXXXG12 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T1RXXXXG12') as IXMLDecimal2ColumnList;
  FT1RXXXXG13 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T1RXXXXG13') as IXMLDecimal2ColumnList;
  FT2RXXXXG1 := CreateCollection(TXMLIntColumnList, IXMLIntColumn, 'T2RXXXXG1') as IXMLIntColumnList;
  FT2RXXXXG2D := CreateCollection(TXMLDateColumnList, IXMLDateColumn, 'T2RXXXXG2D') as IXMLDateColumnList;
  FT2RXXXXG3D := CreateCollection(TXMLDateColumnList, IXMLDateColumn, 'T2RXXXXG3D') as IXMLDateColumnList;
  FT2RXXXXG4S := CreateCollection(TXMLStrColumnList, IXMLStrColumn, 'T2RXXXXG4S') as IXMLStrColumnList;
  FT2RXXXXG51S := CreateCollection(TXMLDGKodDocROVPD6_2ColumnList, IXMLDGKodDocROVPD6_2Column, 'T2RXXXXG51S') as IXMLDGKodDocROVPD6_2ColumnList;
  FT2RXXXXG54S := CreateCollection(TXMLDGKodControlledOperationTB08ColumnList, IXMLDGKodControlledOperationTB08Column, 'T2RXXXXG54S') as IXMLDGKodControlledOperationTB08ColumnList;
  FT2RXXXXG52S := CreateCollection(TXMLDGKodAssignment6ColumnList, IXMLDGKodAssignment6Column, 'T2RXXXXG52S') as IXMLDGKodAssignment6ColumnList;
  FT2RXXXXG53S := CreateCollection(TXMLDGKodRectification6ColumnList, IXMLDGKodRectification6Column, 'T2RXXXXG53S') as IXMLDGKodRectification6ColumnList;
  FT2RXXXXG6S := CreateCollection(TXMLStrColumnList, IXMLStrColumn, 'T2RXXXXG6S') as IXMLStrColumnList;
  FT2RXXXXG7 := CreateCollection(TXMLHIPNColumn0List, IXMLHIPNColumn0, 'T2RXXXXG7') as IXMLHIPNColumn0List;
  FT2RXXXXG8 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T2RXXXXG8') as IXMLDecimal2ColumnList;
  FT2RXXXXG109 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T2RXXXXG109') as IXMLDecimal2ColumnList;
  FT2RXXXXG110 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T2RXXXXG110') as IXMLDecimal2ColumnList;
  FT2RXXXXG111 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T2RXXXXG111') as IXMLDecimal2ColumnList;
  FT2RXXXXG112 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T2RXXXXG112') as IXMLDecimal2ColumnList;
  FT2RXXXXG113 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T2RXXXXG113') as IXMLDecimal2ColumnList;
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

function TXMLDBody.Get_T1RXXXXG110: IXMLDecimal2ColumnList;
begin
  Result := FT1RXXXXG110;
end;

function TXMLDBody.Get_T1RXXXXG111: IXMLDecimal2ColumnList;
begin
  Result := FT1RXXXXG111;
end;

function TXMLDBody.Get_T1RXXXXG10: IXMLDecimal2ColumnList;
begin
  Result := FT1RXXXXG10;
end;

function TXMLDBody.Get_T1RXXXXG113: IXMLDecimal2ColumnList;
begin
  Result := FT1RXXXXG113;
end;

function TXMLDBody.Get_T1RXXXXG114: IXMLDecimal2ColumnList;
begin
  Result := FT1RXXXXG114;
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

function TXMLDBody.Get_R011G110: WideString;
begin
  Result := ChildNodes['R011G110'].Text;
end;

procedure TXMLDBody.Set_R011G110(Value: WideString);
begin
  ChildNodes['R011G110'].NodeValue := Value;
end;

function TXMLDBody.Get_R011G111: WideString;
begin
  Result := ChildNodes['R011G111'].Text;
end;

procedure TXMLDBody.Set_R011G111(Value: WideString);
begin
  ChildNodes['R011G111'].NodeValue := Value;
end;

function TXMLDBody.Get_R011G10: WideString;
begin
  Result := ChildNodes['R011G10'].Text;
end;

procedure TXMLDBody.Set_R011G10(Value: WideString);
begin
  ChildNodes['R011G10'].NodeValue := Value;
end;

function TXMLDBody.Get_R011G113: WideString;
begin
  Result := ChildNodes['R011G113'].Text;
end;

procedure TXMLDBody.Set_R011G113(Value: WideString);
begin
  ChildNodes['R011G113'].NodeValue := Value;
end;

function TXMLDBody.Get_R011G114: WideString;
begin
  Result := ChildNodes['R011G114'].Text;
end;

procedure TXMLDBody.Set_R011G114(Value: WideString);
begin
  ChildNodes['R011G114'].NodeValue := Value;
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

function TXMLDBody.Get_R012G110: WideString;
begin
  Result := ChildNodes['R012G110'].Text;
end;

procedure TXMLDBody.Set_R012G110(Value: WideString);
begin
  ChildNodes['R012G110'].NodeValue := Value;
end;

function TXMLDBody.Get_R012G111: WideString;
begin
  Result := ChildNodes['R012G111'].Text;
end;

procedure TXMLDBody.Set_R012G111(Value: WideString);
begin
  ChildNodes['R012G111'].NodeValue := Value;
end;

function TXMLDBody.Get_R012G10: WideString;
begin
  Result := ChildNodes['R012G10'].Text;
end;

procedure TXMLDBody.Set_R012G10(Value: WideString);
begin
  ChildNodes['R012G10'].NodeValue := Value;
end;

function TXMLDBody.Get_R012G113: WideString;
begin
  Result := ChildNodes['R012G113'].Text;
end;

procedure TXMLDBody.Set_R012G113(Value: WideString);
begin
  ChildNodes['R012G113'].NodeValue := Value;
end;

function TXMLDBody.Get_R012G114: WideString;
begin
  Result := ChildNodes['R012G114'].Text;
end;

procedure TXMLDBody.Set_R012G114(Value: WideString);
begin
  ChildNodes['R012G114'].NodeValue := Value;
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

function TXMLDBody.Get_T2RXXXXG54S: IXMLDGKodControlledOperationTB08ColumnList;
begin
  Result := FT2RXXXXG54S;
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

function TXMLDBody.Get_T2RXXXXG109: IXMLDecimal2ColumnList;
begin
  Result := FT2RXXXXG109;
end;

function TXMLDBody.Get_T2RXXXXG110: IXMLDecimal2ColumnList;
begin
  Result := FT2RXXXXG110;
end;

function TXMLDBody.Get_T2RXXXXG111: IXMLDecimal2ColumnList;
begin
  Result := FT2RXXXXG111;
end;

function TXMLDBody.Get_T2RXXXXG112: IXMLDecimal2ColumnList;
begin
  Result := FT2RXXXXG112;
end;

function TXMLDBody.Get_T2RXXXXG113: IXMLDecimal2ColumnList;
begin
  Result := FT2RXXXXG113;
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

function TXMLDBody.Get_R021G110: WideString;
begin
  Result := ChildNodes['R021G110'].Text;
end;

procedure TXMLDBody.Set_R021G110(Value: WideString);
begin
  ChildNodes['R021G110'].NodeValue := Value;
end;

function TXMLDBody.Get_R021G111: WideString;
begin
  Result := ChildNodes['R021G111'].Text;
end;

procedure TXMLDBody.Set_R021G111(Value: WideString);
begin
  ChildNodes['R021G111'].NodeValue := Value;
end;

function TXMLDBody.Get_R021G112: WideString;
begin
  Result := ChildNodes['R021G112'].Text;
end;

procedure TXMLDBody.Set_R021G112(Value: WideString);
begin
  ChildNodes['R021G112'].NodeValue := Value;
end;

function TXMLDBody.Get_R021G113: WideString;
begin
  Result := ChildNodes['R021G113'].Text;
end;

procedure TXMLDBody.Set_R021G113(Value: WideString);
begin
  ChildNodes['R021G113'].NodeValue := Value;
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

function TXMLDBody.Get_R022G110: WideString;
begin
  Result := ChildNodes['R022G110'].Text;
end;

procedure TXMLDBody.Set_R022G110(Value: WideString);
begin
  ChildNodes['R022G110'].NodeValue := Value;
end;

function TXMLDBody.Get_R022G111: WideString;
begin
  Result := ChildNodes['R022G111'].Text;
end;

procedure TXMLDBody.Set_R022G111(Value: WideString);
begin
  ChildNodes['R022G111'].NodeValue := Value;
end;

function TXMLDBody.Get_R022G112: WideString;
begin
  Result := ChildNodes['R022G112'].Text;
end;

procedure TXMLDBody.Set_R022G112(Value: WideString);
begin
  ChildNodes['R022G112'].NodeValue := Value;
end;

function TXMLDBody.Get_R022G113: WideString;
begin
  Result := ChildNodes['R022G113'].Text;
end;

procedure TXMLDBody.Set_R022G113(Value: WideString);
begin
  ChildNodes['R022G113'].NodeValue := Value;
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

{ TXMLDGKodControlledOperationTB08Column }

function TXMLDGKodControlledOperationTB08Column.Get_ROWNUM: Integer;
begin
  Result := AttributeNodes['ROWNUM'].NodeValue;
end;

procedure TXMLDGKodControlledOperationTB08Column.Set_ROWNUM(Value: Integer);
begin
  SetAttribute('ROWNUM', Value);
end;

{ TXMLDGKodControlledOperationTB08ColumnList }

function TXMLDGKodControlledOperationTB08ColumnList.Add: IXMLDGKodControlledOperationTB08Column;
begin
  Result := AddItem(-1) as IXMLDGKodControlledOperationTB08Column;
end;

function TXMLDGKodControlledOperationTB08ColumnList.Insert(const Index: Integer): IXMLDGKodControlledOperationTB08Column;
begin
  Result := AddItem(Index) as IXMLDGKodControlledOperationTB08Column;
end;
function TXMLDGKodControlledOperationTB08ColumnList.Get_Item(Index: Integer): IXMLDGKodControlledOperationTB08Column;
begin
  Result := List[Index] as IXMLDGKodControlledOperationTB08Column;
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