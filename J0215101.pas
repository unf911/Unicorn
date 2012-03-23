
{***********************************************************************}
{                                                                       }
{                           XML Data Binding                            }
{                                                                       }
{         Generated on: 10.04.2008 16:37:16                             }
{       Generated from: D:\data\work\UniSebest\UniSebest\J0215101.xsd   }
{   Settings stored in: D:\data\work\UniSebest\UniSebest\J0215101.xdb   }
{                                                                       }
{***********************************************************************}

unit J0215101;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLDeclarContent = interface;
  IXMLDHead = interface;
  IXMLDBody = interface;
  IXMLIndTaxNumColumn = interface;
  IXMLIndTaxNumColumnList = interface;
  IXMLDecimal2Column = interface;
  IXMLDecimal2ColumnList = interface;
  IXMLMonthColumn = interface;
  IXMLMonthColumnList = interface;
  IXMLYearColumn = interface;
  IXMLYearColumnList = interface;

{ IXMLDeclarContent }

  IXMLDeclarContent = interface(IXMLNode)
    ['{7F48B6A7-29F3-44AB-BA52-438E0A83A9A1}']
    { Property Accessors }
    function Get_DECLARHEAD: IXMLDHead;
    function Get_DECLARBODY: IXMLDBody;
    { Methods & Properties }
    property DECLARHEAD: IXMLDHead read Get_DECLARHEAD;
    property DECLARBODY: IXMLDBody read Get_DECLARBODY;
  end;

{ IXMLDHead }

  IXMLDHead = interface(IXMLNode)
    ['{EA9C44FB-CD35-4BB6-A870-C09D9826B345}']
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
    function Get_C_DOC_STAN: Integer;
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
    property C_DOC_STAN: Integer read Get_C_DOC_STAN write Set_C_DOC_STAN;
    property D_FILL: WideString read Get_D_FILL write Set_D_FILL;
    property SOFTWARE: WideString read Get_SOFTWARE write Set_SOFTWARE;
  end;

{ IXMLDBody }

  IXMLDBody = interface(IXMLNode)
    ['{BC232255-934F-493A-9891-201DE157CCE2}']
    { Property Accessors }
    function Get_HZ: Integer;
    function Get_HZN: Integer;
    function Get_HZU: Integer;
    function Get_HZY: Integer;
    function Get_HZKV: Integer;
    function Get_HZM: Integer;
    function Get_HZYP: Integer;
    function Get_HZKVP: Integer;
    function Get_HZMP: Integer;
    function Get_HNAME: WideString;
    function Get_HTINJ: WideString;
    function Get_HTINF: WideString;
    function Get_HTINSD: WideString;
    function Get_HTINNR: WideString;
    function Get_HDDGVSD: WideString;
    function Get_HNDGVSD: WideString;
    function Get_HNPDV: WideString;
    function Get_HNSPDV: WideString;
    function Get_T1RXXXXG2: IXMLIndTaxNumColumnList;
    function Get_T1RXXXXG3: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG4: IXMLDecimal2ColumnList;
    function Get_R01G3: WideString;
    function Get_R01G4: WideString;
    function Get_R02G3: WideString;
    function Get_R02G4: WideString;
    function Get_R03G3: WideString;
    function Get_R03G4: WideString;
    function Get_R04G3: WideString;
    function Get_R04G4: WideString;
    function Get_T2RXXXXG2: IXMLIndTaxNumColumnList;
    function Get_T2RXXXXG3A: IXMLMonthColumnList;
    function Get_T2RXXXXG3B: IXMLYearColumnList;
    function Get_T2RXXXXG4: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG5: IXMLDecimal2ColumnList;
    function Get_R05G4: WideString;
    function Get_R05G5: WideString;
    function Get_R06G4: WideString;
    function Get_R06G5: WideString;
    function Get_R07G4: WideString;
    function Get_R07G5: WideString;
    function Get_T3RXXXXG2: IXMLIndTaxNumColumnList;
    function Get_T3RXXXXG3A: IXMLMonthColumnList;
    function Get_T3RXXXXG3B: IXMLYearColumnList;
    function Get_T3RXXXXG4: IXMLDecimal2ColumnList;
    function Get_T3RXXXXG5: IXMLDecimal2ColumnList;
    function Get_R08G4: WideString;
    function Get_R08G5: WideString;
    function Get_HFILL: WideString;
    function Get_HBOS: WideString;
    function Get_HBUH: WideString;
    function Get_HFO: WideString;
    procedure Set_HZ(Value: Integer);
    procedure Set_HZN(Value: Integer);
    procedure Set_HZU(Value: Integer);
    procedure Set_HZY(Value: Integer);
    procedure Set_HZKV(Value: Integer);
    procedure Set_HZM(Value: Integer);
    procedure Set_HZYP(Value: Integer);
    procedure Set_HZKVP(Value: Integer);
    procedure Set_HZMP(Value: Integer);
    procedure Set_HNAME(Value: WideString);
    procedure Set_HTINJ(Value: WideString);
    procedure Set_HTINF(Value: WideString);
    procedure Set_HTINSD(Value: WideString);
    procedure Set_HTINNR(Value: WideString);
    procedure Set_HDDGVSD(Value: WideString);
    procedure Set_HNDGVSD(Value: WideString);
    procedure Set_HNPDV(Value: WideString);
    procedure Set_HNSPDV(Value: WideString);
    procedure Set_R01G3(Value: WideString);
    procedure Set_R01G4(Value: WideString);
    procedure Set_R02G3(Value: WideString);
    procedure Set_R02G4(Value: WideString);
    procedure Set_R03G3(Value: WideString);
    procedure Set_R03G4(Value: WideString);
    procedure Set_R04G3(Value: WideString);
    procedure Set_R04G4(Value: WideString);
    procedure Set_R05G4(Value: WideString);
    procedure Set_R05G5(Value: WideString);
    procedure Set_R06G4(Value: WideString);
    procedure Set_R06G5(Value: WideString);
    procedure Set_R07G4(Value: WideString);
    procedure Set_R07G5(Value: WideString);
    procedure Set_R08G4(Value: WideString);
    procedure Set_R08G5(Value: WideString);
    procedure Set_HFILL(Value: WideString);
    procedure Set_HBOS(Value: WideString);
    procedure Set_HBUH(Value: WideString);
    procedure Set_HFO(Value: WideString);
    { Methods & Properties }
    property HZ: Integer read Get_HZ write Set_HZ;
    property HZN: Integer read Get_HZN write Set_HZN;
    property HZU: Integer read Get_HZU write Set_HZU;
    property HZY: Integer read Get_HZY write Set_HZY;
    property HZKV: Integer read Get_HZKV write Set_HZKV;
    property HZM: Integer read Get_HZM write Set_HZM;
    property HZYP: Integer read Get_HZYP write Set_HZYP;
    property HZKVP: Integer read Get_HZKVP write Set_HZKVP;
    property HZMP: Integer read Get_HZMP write Set_HZMP;
    property HNAME: WideString read Get_HNAME write Set_HNAME;
    property HTINJ: WideString read Get_HTINJ write Set_HTINJ;
    property HTINF: WideString read Get_HTINF write Set_HTINF;
    property HTINSD: WideString read Get_HTINSD write Set_HTINSD;
    property HTINNR: WideString read Get_HTINNR write Set_HTINNR;
    property HDDGVSD: WideString read Get_HDDGVSD write Set_HDDGVSD;
    property HNDGVSD: WideString read Get_HNDGVSD write Set_HNDGVSD;
    property HNPDV: WideString read Get_HNPDV write Set_HNPDV;
    property HNSPDV: WideString read Get_HNSPDV write Set_HNSPDV;
    property T1RXXXXG2: IXMLIndTaxNumColumnList read Get_T1RXXXXG2;
    property T1RXXXXG3: IXMLDecimal2ColumnList read Get_T1RXXXXG3;
    property T1RXXXXG4: IXMLDecimal2ColumnList read Get_T1RXXXXG4;
    property R01G3: WideString read Get_R01G3 write Set_R01G3;
    property R01G4: WideString read Get_R01G4 write Set_R01G4;
    property R02G3: WideString read Get_R02G3 write Set_R02G3;
    property R02G4: WideString read Get_R02G4 write Set_R02G4;
    property R03G3: WideString read Get_R03G3 write Set_R03G3;
    property R03G4: WideString read Get_R03G4 write Set_R03G4;
    property R04G3: WideString read Get_R04G3 write Set_R04G3;
    property R04G4: WideString read Get_R04G4 write Set_R04G4;
    property T2RXXXXG2: IXMLIndTaxNumColumnList read Get_T2RXXXXG2;
    property T2RXXXXG3A: IXMLMonthColumnList read Get_T2RXXXXG3A;
    property T2RXXXXG3B: IXMLYearColumnList read Get_T2RXXXXG3B;
    property T2RXXXXG4: IXMLDecimal2ColumnList read Get_T2RXXXXG4;
    property T2RXXXXG5: IXMLDecimal2ColumnList read Get_T2RXXXXG5;
    property R05G4: WideString read Get_R05G4 write Set_R05G4;
    property R05G5: WideString read Get_R05G5 write Set_R05G5;
    property R06G4: WideString read Get_R06G4 write Set_R06G4;
    property R06G5: WideString read Get_R06G5 write Set_R06G5;
    property R07G4: WideString read Get_R07G4 write Set_R07G4;
    property R07G5: WideString read Get_R07G5 write Set_R07G5;
    property T3RXXXXG2: IXMLIndTaxNumColumnList read Get_T3RXXXXG2;
    property T3RXXXXG3A: IXMLMonthColumnList read Get_T3RXXXXG3A;
    property T3RXXXXG3B: IXMLYearColumnList read Get_T3RXXXXG3B;
    property T3RXXXXG4: IXMLDecimal2ColumnList read Get_T3RXXXXG4;
    property T3RXXXXG5: IXMLDecimal2ColumnList read Get_T3RXXXXG5;
    property R08G4: WideString read Get_R08G4 write Set_R08G4;
    property R08G5: WideString read Get_R08G5 write Set_R08G5;
    property HFILL: WideString read Get_HFILL write Set_HFILL;
    property HBOS: WideString read Get_HBOS write Set_HBOS;
    property HBUH: WideString read Get_HBUH write Set_HBUH;
    property HFO: WideString read Get_HFO write Set_HFO;
  end;

{ IXMLIndTaxNumColumn }

  IXMLIndTaxNumColumn = interface(IXMLNode)
    ['{023B9E9E-F264-45C7-A9D4-43A5BE0C1AAA}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLIndTaxNumColumnList }

  IXMLIndTaxNumColumnList = interface(IXMLNodeCollection)
    ['{CC35055F-855A-4502-9275-1C173312C481}']
    { Methods & Properties }
    function Add: IXMLIndTaxNumColumn;
    function Insert(const Index: Integer): IXMLIndTaxNumColumn;
    function Get_Item(Index: Integer): IXMLIndTaxNumColumn;
    property Items[Index: Integer]: IXMLIndTaxNumColumn read Get_Item; default;
  end;

{ IXMLDecimal2Column }

  IXMLDecimal2Column = interface(IXMLNode)
    ['{92096A86-6B19-46D5-8F74-6AE9873A2E5C}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLDecimal2ColumnList }

  IXMLDecimal2ColumnList = interface(IXMLNodeCollection)
    ['{20C4EAC6-9D70-4B30-A0A2-E58CB7EE6B98}']
    { Methods & Properties }
    function Add: IXMLDecimal2Column;
    function Insert(const Index: Integer): IXMLDecimal2Column;
    function Get_Item(Index: Integer): IXMLDecimal2Column;
    property Items[Index: Integer]: IXMLDecimal2Column read Get_Item; default;
  end;

{ IXMLMonthColumn }

  IXMLMonthColumn = interface(IXMLNode)
    ['{6F580F6D-B314-4D6A-BA50-1F67E2F50807}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLMonthColumnList }

  IXMLMonthColumnList = interface(IXMLNodeCollection)
    ['{F3DBFD33-675A-47A6-A089-F974C0BEB881}']
    { Methods & Properties }
    function Add: IXMLMonthColumn;
    function Insert(const Index: Integer): IXMLMonthColumn;
    function Get_Item(Index: Integer): IXMLMonthColumn;
    property Items[Index: Integer]: IXMLMonthColumn read Get_Item; default;
  end;

{ IXMLYearColumn }

  IXMLYearColumn = interface(IXMLNode)
    ['{6A904440-7B60-42AF-B8FD-0F4C805900A1}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLYearColumnList }

  IXMLYearColumnList = interface(IXMLNodeCollection)
    ['{D5E4E537-9654-4CB7-AFAA-3E9FE733EA2C}']
    { Methods & Properties }
    function Add: IXMLYearColumn;
    function Insert(const Index: Integer): IXMLYearColumn;
    function Get_Item(Index: Integer): IXMLYearColumn;
    property Items[Index: Integer]: IXMLYearColumn read Get_Item; default;
  end;

{ Forward Decls }

  TXMLDeclarContent = class;
  TXMLDHead = class;
  TXMLDBody = class;
  TXMLIndTaxNumColumn = class;
  TXMLIndTaxNumColumnList = class;
  TXMLDecimal2Column = class;
  TXMLDecimal2ColumnList = class;
  TXMLMonthColumn = class;
  TXMLMonthColumnList = class;
  TXMLYearColumn = class;
  TXMLYearColumnList = class;

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
    function Get_C_DOC_STAN: Integer;
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
    procedure Set_C_DOC_STAN(Value: Integer);
    procedure Set_D_FILL(Value: WideString);
    procedure Set_SOFTWARE(Value: WideString);
  end;

{ TXMLDBody }

  TXMLDBody = class(TXMLNode, IXMLDBody)
  private
    FT1RXXXXG2: IXMLIndTaxNumColumnList;
    FT1RXXXXG3: IXMLDecimal2ColumnList;
    FT1RXXXXG4: IXMLDecimal2ColumnList;
    FT2RXXXXG2: IXMLIndTaxNumColumnList;
    FT2RXXXXG3A: IXMLMonthColumnList;
    FT2RXXXXG3B: IXMLYearColumnList;
    FT2RXXXXG4: IXMLDecimal2ColumnList;
    FT2RXXXXG5: IXMLDecimal2ColumnList;
    FT3RXXXXG2: IXMLIndTaxNumColumnList;
    FT3RXXXXG3A: IXMLMonthColumnList;
    FT3RXXXXG3B: IXMLYearColumnList;
    FT3RXXXXG4: IXMLDecimal2ColumnList;
    FT3RXXXXG5: IXMLDecimal2ColumnList;
  protected
    { IXMLDBody }
    function Get_HZ: Integer;
    function Get_HZN: Integer;
    function Get_HZU: Integer;
    function Get_HZY: Integer;
    function Get_HZKV: Integer;
    function Get_HZM: Integer;
    function Get_HZYP: Integer;
    function Get_HZKVP: Integer;
    function Get_HZMP: Integer;
    function Get_HNAME: WideString;
    function Get_HTINJ: WideString;
    function Get_HTINF: WideString;
    function Get_HTINSD: WideString;
    function Get_HTINNR: WideString;
    function Get_HDDGVSD: WideString;
    function Get_HNDGVSD: WideString;
    function Get_HNPDV: WideString;
    function Get_HNSPDV: WideString;
    function Get_T1RXXXXG2: IXMLIndTaxNumColumnList;
    function Get_T1RXXXXG3: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG4: IXMLDecimal2ColumnList;
    function Get_R01G3: WideString;
    function Get_R01G4: WideString;
    function Get_R02G3: WideString;
    function Get_R02G4: WideString;
    function Get_R03G3: WideString;
    function Get_R03G4: WideString;
    function Get_R04G3: WideString;
    function Get_R04G4: WideString;
    function Get_T2RXXXXG2: IXMLIndTaxNumColumnList;
    function Get_T2RXXXXG3A: IXMLMonthColumnList;
    function Get_T2RXXXXG3B: IXMLYearColumnList;
    function Get_T2RXXXXG4: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG5: IXMLDecimal2ColumnList;
    function Get_R05G4: WideString;
    function Get_R05G5: WideString;
    function Get_R06G4: WideString;
    function Get_R06G5: WideString;
    function Get_R07G4: WideString;
    function Get_R07G5: WideString;
    function Get_T3RXXXXG2: IXMLIndTaxNumColumnList;
    function Get_T3RXXXXG3A: IXMLMonthColumnList;
    function Get_T3RXXXXG3B: IXMLYearColumnList;
    function Get_T3RXXXXG4: IXMLDecimal2ColumnList;
    function Get_T3RXXXXG5: IXMLDecimal2ColumnList;
    function Get_R08G4: WideString;
    function Get_R08G5: WideString;
    function Get_HFILL: WideString;
    function Get_HBOS: WideString;
    function Get_HBUH: WideString;
    function Get_HFO: WideString;
    procedure Set_HZ(Value: Integer);
    procedure Set_HZN(Value: Integer);
    procedure Set_HZU(Value: Integer);
    procedure Set_HZY(Value: Integer);
    procedure Set_HZKV(Value: Integer);
    procedure Set_HZM(Value: Integer);
    procedure Set_HZYP(Value: Integer);
    procedure Set_HZKVP(Value: Integer);
    procedure Set_HZMP(Value: Integer);
    procedure Set_HNAME(Value: WideString);
    procedure Set_HTINJ(Value: WideString);
    procedure Set_HTINF(Value: WideString);
    procedure Set_HTINSD(Value: WideString);
    procedure Set_HTINNR(Value: WideString);
    procedure Set_HDDGVSD(Value: WideString);
    procedure Set_HNDGVSD(Value: WideString);
    procedure Set_HNPDV(Value: WideString);
    procedure Set_HNSPDV(Value: WideString);
    procedure Set_R01G3(Value: WideString);
    procedure Set_R01G4(Value: WideString);
    procedure Set_R02G3(Value: WideString);
    procedure Set_R02G4(Value: WideString);
    procedure Set_R03G3(Value: WideString);
    procedure Set_R03G4(Value: WideString);
    procedure Set_R04G3(Value: WideString);
    procedure Set_R04G4(Value: WideString);
    procedure Set_R05G4(Value: WideString);
    procedure Set_R05G5(Value: WideString);
    procedure Set_R06G4(Value: WideString);
    procedure Set_R06G5(Value: WideString);
    procedure Set_R07G4(Value: WideString);
    procedure Set_R07G5(Value: WideString);
    procedure Set_R08G4(Value: WideString);
    procedure Set_R08G5(Value: WideString);
    procedure Set_HFILL(Value: WideString);
    procedure Set_HBOS(Value: WideString);
    procedure Set_HBUH(Value: WideString);
    procedure Set_HFO(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLIndTaxNumColumn }

  TXMLIndTaxNumColumn = class(TXMLNode, IXMLIndTaxNumColumn)
  protected
    { IXMLIndTaxNumColumn }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
  end;

{ TXMLIndTaxNumColumnList }

  TXMLIndTaxNumColumnList = class(TXMLNodeCollection, IXMLIndTaxNumColumnList)
  protected
    { IXMLIndTaxNumColumnList }
    function Add: IXMLIndTaxNumColumn;
    function Insert(const Index: Integer): IXMLIndTaxNumColumn;
    function Get_Item(Index: Integer): IXMLIndTaxNumColumn;
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

{ TXMLMonthColumn }

  TXMLMonthColumn = class(TXMLNode, IXMLMonthColumn)
  protected
    { IXMLMonthColumn }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
  end;

{ TXMLMonthColumnList }

  TXMLMonthColumnList = class(TXMLNodeCollection, IXMLMonthColumnList)
  protected
    { IXMLMonthColumnList }
    function Add: IXMLMonthColumn;
    function Insert(const Index: Integer): IXMLMonthColumn;
    function Get_Item(Index: Integer): IXMLMonthColumn;
  end;

{ TXMLYearColumn }

  TXMLYearColumn = class(TXMLNode, IXMLYearColumn)
  protected
    { IXMLYearColumn }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
  end;

{ TXMLYearColumnList }

  TXMLYearColumnList = class(TXMLNodeCollection, IXMLYearColumnList)
  protected
    { IXMLYearColumnList }
    function Add: IXMLYearColumn;
    function Insert(const Index: Integer): IXMLYearColumn;
    function Get_Item(Index: Integer): IXMLYearColumn;
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

function TXMLDHead.Get_C_DOC_STAN: Integer;
begin
  Result := ChildNodes['C_DOC_STAN'].NodeValue;
end;

procedure TXMLDHead.Set_C_DOC_STAN(Value: Integer);
begin
  ChildNodes['C_DOC_STAN'].NodeValue := Value;
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

{ TXMLDBody }

procedure TXMLDBody.AfterConstruction;
begin
  RegisterChildNode('T1RXXXXG2', TXMLIndTaxNumColumn);
  RegisterChildNode('T1RXXXXG3', TXMLDecimal2Column);
  RegisterChildNode('T1RXXXXG4', TXMLDecimal2Column);
  RegisterChildNode('T2RXXXXG2', TXMLIndTaxNumColumn);
  RegisterChildNode('T2RXXXXG3A', TXMLMonthColumn);
  RegisterChildNode('T2RXXXXG3B', TXMLYearColumn);
  RegisterChildNode('T2RXXXXG4', TXMLDecimal2Column);
  RegisterChildNode('T2RXXXXG5', TXMLDecimal2Column);
  RegisterChildNode('T3RXXXXG2', TXMLIndTaxNumColumn);
  RegisterChildNode('T3RXXXXG3A', TXMLMonthColumn);
  RegisterChildNode('T3RXXXXG3B', TXMLYearColumn);
  RegisterChildNode('T3RXXXXG4', TXMLDecimal2Column);
  RegisterChildNode('T3RXXXXG5', TXMLDecimal2Column);
  FT1RXXXXG2 := CreateCollection(TXMLIndTaxNumColumnList, IXMLIndTaxNumColumn, 'T1RXXXXG2') as IXMLIndTaxNumColumnList;
  FT1RXXXXG3 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T1RXXXXG3') as IXMLDecimal2ColumnList;
  FT1RXXXXG4 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T1RXXXXG4') as IXMLDecimal2ColumnList;
  FT2RXXXXG2 := CreateCollection(TXMLIndTaxNumColumnList, IXMLIndTaxNumColumn, 'T2RXXXXG2') as IXMLIndTaxNumColumnList;
  FT2RXXXXG3A := CreateCollection(TXMLMonthColumnList, IXMLMonthColumn, 'T2RXXXXG3A') as IXMLMonthColumnList;
  FT2RXXXXG3B := CreateCollection(TXMLYearColumnList, IXMLYearColumn, 'T2RXXXXG3B') as IXMLYearColumnList;
  FT2RXXXXG4 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T2RXXXXG4') as IXMLDecimal2ColumnList;
  FT2RXXXXG5 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T2RXXXXG5') as IXMLDecimal2ColumnList;
  FT3RXXXXG2 := CreateCollection(TXMLIndTaxNumColumnList, IXMLIndTaxNumColumn, 'T3RXXXXG2') as IXMLIndTaxNumColumnList;
  FT3RXXXXG3A := CreateCollection(TXMLMonthColumnList, IXMLMonthColumn, 'T3RXXXXG3A') as IXMLMonthColumnList;
  FT3RXXXXG3B := CreateCollection(TXMLYearColumnList, IXMLYearColumn, 'T3RXXXXG3B') as IXMLYearColumnList;
  FT3RXXXXG4 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T3RXXXXG4') as IXMLDecimal2ColumnList;
  FT3RXXXXG5 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T3RXXXXG5') as IXMLDecimal2ColumnList;
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

function TXMLDBody.Get_HZY: Integer;
begin
  Result := ChildNodes['HZY'].NodeValue;
end;

procedure TXMLDBody.Set_HZY(Value: Integer);
begin
  ChildNodes['HZY'].NodeValue := Value;
end;

function TXMLDBody.Get_HZKV: Integer;
begin
  Result := ChildNodes['HZKV'].NodeValue;
end;

procedure TXMLDBody.Set_HZKV(Value: Integer);
begin
  ChildNodes['HZKV'].NodeValue := Value;
end;

function TXMLDBody.Get_HZM: Integer;
begin
  Result := ChildNodes['HZM'].NodeValue;
end;

procedure TXMLDBody.Set_HZM(Value: Integer);
begin
  ChildNodes['HZM'].NodeValue := Value;
end;

function TXMLDBody.Get_HZYP: Integer;
begin
  Result := ChildNodes['HZYP'].NodeValue;
end;

procedure TXMLDBody.Set_HZYP(Value: Integer);
begin
  ChildNodes['HZYP'].NodeValue := Value;
end;

function TXMLDBody.Get_HZKVP: Integer;
begin
  Result := ChildNodes['HZKVP'].NodeValue;
end;

procedure TXMLDBody.Set_HZKVP(Value: Integer);
begin
  ChildNodes['HZKVP'].NodeValue := Value;
end;

function TXMLDBody.Get_HZMP: Integer;
begin
  Result := ChildNodes['HZMP'].NodeValue;
end;

procedure TXMLDBody.Set_HZMP(Value: Integer);
begin
  ChildNodes['HZMP'].NodeValue := Value;
end;

function TXMLDBody.Get_HNAME: WideString;
begin
  Result := ChildNodes['HNAME'].Text;
end;

procedure TXMLDBody.Set_HNAME(Value: WideString);
begin
  ChildNodes['HNAME'].NodeValue := Value;
end;

function TXMLDBody.Get_HTINJ: WideString;
begin
  Result := ChildNodes['HTINJ'].Text;
end;

procedure TXMLDBody.Set_HTINJ(Value: WideString);
begin
  ChildNodes['HTINJ'].NodeValue := Value;
end;

function TXMLDBody.Get_HTINF: WideString;
begin
  Result := ChildNodes['HTINF'].Text;
end;

procedure TXMLDBody.Set_HTINF(Value: WideString);
begin
  ChildNodes['HTINF'].NodeValue := Value;
end;

function TXMLDBody.Get_HTINSD: WideString;
begin
  Result := ChildNodes['HTINSD'].Text;
end;

procedure TXMLDBody.Set_HTINSD(Value: WideString);
begin
  ChildNodes['HTINSD'].NodeValue := Value;
end;

function TXMLDBody.Get_HTINNR: WideString;
begin
  Result := ChildNodes['HTINNR'].Text;
end;

procedure TXMLDBody.Set_HTINNR(Value: WideString);
begin
  ChildNodes['HTINNR'].NodeValue := Value;
end;

function TXMLDBody.Get_HDDGVSD: WideString;
begin
  Result := ChildNodes['HDDGVSD'].Text;
end;

procedure TXMLDBody.Set_HDDGVSD(Value: WideString);
begin
  ChildNodes['HDDGVSD'].NodeValue := Value;
end;

function TXMLDBody.Get_HNDGVSD: WideString;
begin
  Result := ChildNodes['HNDGVSD'].Text;
end;

procedure TXMLDBody.Set_HNDGVSD(Value: WideString);
begin
  ChildNodes['HNDGVSD'].NodeValue := Value;
end;

function TXMLDBody.Get_HNPDV: WideString;
begin
  Result := ChildNodes['HNPDV'].Text;
end;

procedure TXMLDBody.Set_HNPDV(Value: WideString);
begin
  ChildNodes['HNPDV'].NodeValue := Value;
end;

function TXMLDBody.Get_HNSPDV: WideString;
begin
  Result := ChildNodes['HNSPDV'].Text;
end;

procedure TXMLDBody.Set_HNSPDV(Value: WideString);
begin
  ChildNodes['HNSPDV'].NodeValue := Value;
end;

function TXMLDBody.Get_T1RXXXXG2: IXMLIndTaxNumColumnList;
begin
  Result := FT1RXXXXG2;
end;

function TXMLDBody.Get_T1RXXXXG3: IXMLDecimal2ColumnList;
begin
  Result := FT1RXXXXG3;
end;

function TXMLDBody.Get_T1RXXXXG4: IXMLDecimal2ColumnList;
begin
  Result := FT1RXXXXG4;
end;

function TXMLDBody.Get_R01G3: WideString;
begin
  Result := ChildNodes['R01G3'].Text;
end;

procedure TXMLDBody.Set_R01G3(Value: WideString);
begin
  ChildNodes['R01G3'].NodeValue := Value;
end;

function TXMLDBody.Get_R01G4: WideString;
begin
  Result := ChildNodes['R01G4'].Text;
end;

procedure TXMLDBody.Set_R01G4(Value: WideString);
begin
  ChildNodes['R01G4'].NodeValue := Value;
end;

function TXMLDBody.Get_R02G3: WideString;
begin
  Result := ChildNodes['R02G3'].Text;
end;

procedure TXMLDBody.Set_R02G3(Value: WideString);
begin
  ChildNodes['R02G3'].NodeValue := Value;
end;

function TXMLDBody.Get_R02G4: WideString;
begin
  Result := ChildNodes['R02G4'].Text;
end;

procedure TXMLDBody.Set_R02G4(Value: WideString);
begin
  ChildNodes['R02G4'].NodeValue := Value;
end;

function TXMLDBody.Get_R03G3: WideString;
begin
  Result := ChildNodes['R03G3'].Text;
end;

procedure TXMLDBody.Set_R03G3(Value: WideString);
begin
  ChildNodes['R03G3'].NodeValue := Value;
end;

function TXMLDBody.Get_R03G4: WideString;
begin
  Result := ChildNodes['R03G4'].Text;
end;

procedure TXMLDBody.Set_R03G4(Value: WideString);
begin
  ChildNodes['R03G4'].NodeValue := Value;
end;

function TXMLDBody.Get_R04G3: WideString;
begin
  Result := ChildNodes['R04G3'].Text;
end;

procedure TXMLDBody.Set_R04G3(Value: WideString);
begin
  ChildNodes['R04G3'].NodeValue := Value;
end;

function TXMLDBody.Get_R04G4: WideString;
begin
  Result := ChildNodes['R04G4'].Text;
end;

procedure TXMLDBody.Set_R04G4(Value: WideString);
begin
  ChildNodes['R04G4'].NodeValue := Value;
end;

function TXMLDBody.Get_T2RXXXXG2: IXMLIndTaxNumColumnList;
begin
  Result := FT2RXXXXG2;
end;

function TXMLDBody.Get_T2RXXXXG3A: IXMLMonthColumnList;
begin
  Result := FT2RXXXXG3A;
end;

function TXMLDBody.Get_T2RXXXXG3B: IXMLYearColumnList;
begin
  Result := FT2RXXXXG3B;
end;

function TXMLDBody.Get_T2RXXXXG4: IXMLDecimal2ColumnList;
begin
  Result := FT2RXXXXG4;
end;

function TXMLDBody.Get_T2RXXXXG5: IXMLDecimal2ColumnList;
begin
  Result := FT2RXXXXG5;
end;

function TXMLDBody.Get_R05G4: WideString;
begin
  Result := ChildNodes['R05G4'].Text;
end;

procedure TXMLDBody.Set_R05G4(Value: WideString);
begin
  ChildNodes['R05G4'].NodeValue := Value;
end;

function TXMLDBody.Get_R05G5: WideString;
begin
  Result := ChildNodes['R05G5'].Text;
end;

procedure TXMLDBody.Set_R05G5(Value: WideString);
begin
  ChildNodes['R05G5'].NodeValue := Value;
end;

function TXMLDBody.Get_R06G4: WideString;
begin
  Result := ChildNodes['R06G4'].Text;
end;

procedure TXMLDBody.Set_R06G4(Value: WideString);
begin
  ChildNodes['R06G4'].NodeValue := Value;
end;

function TXMLDBody.Get_R06G5: WideString;
begin
  Result := ChildNodes['R06G5'].Text;
end;

procedure TXMLDBody.Set_R06G5(Value: WideString);
begin
  ChildNodes['R06G5'].NodeValue := Value;
end;

function TXMLDBody.Get_R07G4: WideString;
begin
  Result := ChildNodes['R07G4'].Text;
end;

procedure TXMLDBody.Set_R07G4(Value: WideString);
begin
  ChildNodes['R07G4'].NodeValue := Value;
end;

function TXMLDBody.Get_R07G5: WideString;
begin
  Result := ChildNodes['R07G5'].Text;
end;

procedure TXMLDBody.Set_R07G5(Value: WideString);
begin
  ChildNodes['R07G5'].NodeValue := Value;
end;

function TXMLDBody.Get_T3RXXXXG2: IXMLIndTaxNumColumnList;
begin
  Result := FT3RXXXXG2;
end;

function TXMLDBody.Get_T3RXXXXG3A: IXMLMonthColumnList;
begin
  Result := FT3RXXXXG3A;
end;

function TXMLDBody.Get_T3RXXXXG3B: IXMLYearColumnList;
begin
  Result := FT3RXXXXG3B;
end;

function TXMLDBody.Get_T3RXXXXG4: IXMLDecimal2ColumnList;
begin
  Result := FT3RXXXXG4;
end;

function TXMLDBody.Get_T3RXXXXG5: IXMLDecimal2ColumnList;
begin
  Result := FT3RXXXXG5;
end;

function TXMLDBody.Get_R08G4: WideString;
begin
  Result := ChildNodes['R08G4'].Text;
end;

procedure TXMLDBody.Set_R08G4(Value: WideString);
begin
  ChildNodes['R08G4'].NodeValue := Value;
end;

function TXMLDBody.Get_R08G5: WideString;
begin
  Result := ChildNodes['R08G5'].Text;
end;

procedure TXMLDBody.Set_R08G5(Value: WideString);
begin
  ChildNodes['R08G5'].NodeValue := Value;
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

function TXMLDBody.Get_HBUH: WideString;
begin
  Result := ChildNodes['HBUH'].Text;
end;

procedure TXMLDBody.Set_HBUH(Value: WideString);
begin
  ChildNodes['HBUH'].NodeValue := Value;
end;

function TXMLDBody.Get_HFO: WideString;
begin
  Result := ChildNodes['HFO'].Text;
end;

procedure TXMLDBody.Set_HFO(Value: WideString);
begin
  ChildNodes['HFO'].NodeValue := Value;
end;

{ TXMLIndTaxNumColumn }

function TXMLIndTaxNumColumn.Get_ROWNUM: Integer;
begin
  Result := AttributeNodes['ROWNUM'].NodeValue;
end;

procedure TXMLIndTaxNumColumn.Set_ROWNUM(Value: Integer);
begin
  SetAttribute('ROWNUM', Value);
end;

{ TXMLIndTaxNumColumnList }

function TXMLIndTaxNumColumnList.Add: IXMLIndTaxNumColumn;
begin
  Result := AddItem(-1) as IXMLIndTaxNumColumn;
end;

function TXMLIndTaxNumColumnList.Insert(const Index: Integer): IXMLIndTaxNumColumn;
begin
  Result := AddItem(Index) as IXMLIndTaxNumColumn;
end;
function TXMLIndTaxNumColumnList.Get_Item(Index: Integer): IXMLIndTaxNumColumn;
begin
  Result := List[Index] as IXMLIndTaxNumColumn;
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

{ TXMLMonthColumn }

function TXMLMonthColumn.Get_ROWNUM: Integer;
begin
  Result := AttributeNodes['ROWNUM'].NodeValue;
end;

procedure TXMLMonthColumn.Set_ROWNUM(Value: Integer);
begin
  SetAttribute('ROWNUM', Value);
end;

{ TXMLMonthColumnList }

function TXMLMonthColumnList.Add: IXMLMonthColumn;
begin
  Result := AddItem(-1) as IXMLMonthColumn;
end;

function TXMLMonthColumnList.Insert(const Index: Integer): IXMLMonthColumn;
begin
  Result := AddItem(Index) as IXMLMonthColumn;
end;
function TXMLMonthColumnList.Get_Item(Index: Integer): IXMLMonthColumn;
begin
  Result := List[Index] as IXMLMonthColumn;
end;

{ TXMLYearColumn }

function TXMLYearColumn.Get_ROWNUM: Integer;
begin
  Result := AttributeNodes['ROWNUM'].NodeValue;
end;

procedure TXMLYearColumn.Set_ROWNUM(Value: Integer);
begin
  SetAttribute('ROWNUM', Value);
end;

{ TXMLYearColumnList }

function TXMLYearColumnList.Add: IXMLYearColumn;
begin
  Result := AddItem(-1) as IXMLYearColumn;
end;

function TXMLYearColumnList.Insert(const Index: Integer): IXMLYearColumn;
begin
  Result := AddItem(Index) as IXMLYearColumn;
end;
function TXMLYearColumnList.Get_Item(Index: Integer): IXMLYearColumn;
begin
  Result := List[Index] as IXMLYearColumn;
end;

end. 