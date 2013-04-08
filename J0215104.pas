
{*************************************************************}
{                                                             }
{                      XML Data Binding                       }
{                                                             }
{         Generated on: 01.04.2013 16:41:35                   }
{       Generated from: D:\data\work\UniSebest\J0215104.xsd   }
{   Settings stored in: D:\data\work\UniSebest\J0215104.xdb   }
{                                                             }
{*************************************************************}

unit J0215104;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLDeclarContent = interface;
  IXMLDHead = interface;
  IXMLLINKED_DOCS = interface;
  IXMLDOC = interface;
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
    ['{7C61132D-D306-4E4B-8D57-F2E6C10B6FA8}']
    { Property Accessors }
    function Get_DECLARHEAD: IXMLDHead;
    function Get_DECLARBODY: IXMLDBody;
    { Methods & Properties }
    property DECLARHEAD: IXMLDHead read Get_DECLARHEAD;
    property DECLARBODY: IXMLDBody read Get_DECLARBODY;
  end;

{ IXMLDHead }

  IXMLDHead = interface(IXMLNode)
    ['{18E114B5-3648-4016-B1DE-7FB97416252C}']
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
    ['{7E30D15E-E205-41F8-AAF3-1DA0173A3693}']
    { Property Accessors }
    function Get_DOC(Index: Integer): IXMLDOC;
    { Methods & Properties }
    function Add: IXMLDOC;
    function Insert(const Index: Integer): IXMLDOC;
    property DOC[Index: Integer]: IXMLDOC read Get_DOC; default;
  end;

{ IXMLDOC }

  IXMLDOC = interface(IXMLNode)
    ['{065D4AD7-3675-4BD5-B14E-890B179E82DC}']
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
    ['{0B04D821-FF06-474B-BAD2-2884486BC254}']
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
    function Get_HTIN: WideString;
    function Get_HTINSD: WideString;
    function Get_HTINUM: Int64;
    function Get_HTINNR: WideString;
    function Get_HTININ: WideString;
    function Get_HDDGVSD: WideString;
    function Get_HNDGVSD: WideString;
    function Get_HDDGVUM: WideString;
    function Get_HNDGVUM: WideString;
    function Get_HDDGVIN: WideString;
    function Get_HNDGVIN: WideString;
    function Get_HNPDV: WideString;
    function Get_HNSPDV: Int64;
    function Get_T1RXXXXG2: IXMLIndTaxNumColumnList;
    function Get_T1RXXXXG3: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG4: IXMLDecimal2ColumnList;
    function Get_R001G3: WideString;
    function Get_R001G4: WideString;
    function Get_R010G3: WideString;
    function Get_R010G4: WideString;
    function Get_R011G3: WideString;
    function Get_R011G4: WideString;
    function Get_T2RXXXXG2: IXMLIndTaxNumColumnList;
    function Get_T2RXXXXG3A: IXMLMonthColumnList;
    function Get_T2RXXXXG3B: IXMLYearColumnList;
    function Get_T2RXXXXG4: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG5: IXMLDecimal2ColumnList;
    function Get_R020G4: WideString;
    function Get_R020G5: WideString;
    function Get_R021G4: WideString;
    function Get_R021G5: WideString;
    function Get_T3RXXXXG2: IXMLIndTaxNumColumnList;
    function Get_T3RXXXXG3A: IXMLMonthColumnList;
    function Get_T3RXXXXG3B: IXMLYearColumnList;
    function Get_T3RXXXXG4: IXMLDecimal2ColumnList;
    function Get_T3RXXXXG5: IXMLDecimal2ColumnList;
    function Get_R030G4: WideString;
    function Get_R030G5: WideString;
    function Get_HFILL: WideString;
    function Get_HBOS: WideString;
    function Get_HBUH: WideString;
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
    procedure Set_HTIN(Value: WideString);
    procedure Set_HTINSD(Value: WideString);
    procedure Set_HTINUM(Value: Int64);
    procedure Set_HTINNR(Value: WideString);
    procedure Set_HTININ(Value: WideString);
    procedure Set_HDDGVSD(Value: WideString);
    procedure Set_HNDGVSD(Value: WideString);
    procedure Set_HDDGVUM(Value: WideString);
    procedure Set_HNDGVUM(Value: WideString);
    procedure Set_HDDGVIN(Value: WideString);
    procedure Set_HNDGVIN(Value: WideString);
    procedure Set_HNPDV(Value: WideString);
    procedure Set_HNSPDV(Value: Int64);
    procedure Set_R001G3(Value: WideString);
    procedure Set_R001G4(Value: WideString);
    procedure Set_R010G3(Value: WideString);
    procedure Set_R010G4(Value: WideString);
    procedure Set_R011G3(Value: WideString);
    procedure Set_R011G4(Value: WideString);
    procedure Set_R020G4(Value: WideString);
    procedure Set_R020G5(Value: WideString);
    procedure Set_R021G4(Value: WideString);
    procedure Set_R021G5(Value: WideString);
    procedure Set_R030G4(Value: WideString);
    procedure Set_R030G5(Value: WideString);
    procedure Set_HFILL(Value: WideString);
    procedure Set_HBOS(Value: WideString);
    procedure Set_HBUH(Value: WideString);
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
    property HTIN: WideString read Get_HTIN write Set_HTIN;
    property HTINSD: WideString read Get_HTINSD write Set_HTINSD;
    property HTINUM: Int64 read Get_HTINUM write Set_HTINUM;
    property HTINNR: WideString read Get_HTINNR write Set_HTINNR;
    property HTININ: WideString read Get_HTININ write Set_HTININ;
    property HDDGVSD: WideString read Get_HDDGVSD write Set_HDDGVSD;
    property HNDGVSD: WideString read Get_HNDGVSD write Set_HNDGVSD;
    property HDDGVUM: WideString read Get_HDDGVUM write Set_HDDGVUM;
    property HNDGVUM: WideString read Get_HNDGVUM write Set_HNDGVUM;
    property HDDGVIN: WideString read Get_HDDGVIN write Set_HDDGVIN;
    property HNDGVIN: WideString read Get_HNDGVIN write Set_HNDGVIN;
    property HNPDV: WideString read Get_HNPDV write Set_HNPDV;
    property HNSPDV: Int64 read Get_HNSPDV write Set_HNSPDV;
    property T1RXXXXG2: IXMLIndTaxNumColumnList read Get_T1RXXXXG2;
    property T1RXXXXG3: IXMLDecimal2ColumnList read Get_T1RXXXXG3;
    property T1RXXXXG4: IXMLDecimal2ColumnList read Get_T1RXXXXG4;
    property R001G3: WideString read Get_R001G3 write Set_R001G3;
    property R001G4: WideString read Get_R001G4 write Set_R001G4;
    property R010G3: WideString read Get_R010G3 write Set_R010G3;
    property R010G4: WideString read Get_R010G4 write Set_R010G4;
    property R011G3: WideString read Get_R011G3 write Set_R011G3;
    property R011G4: WideString read Get_R011G4 write Set_R011G4;
    property T2RXXXXG2: IXMLIndTaxNumColumnList read Get_T2RXXXXG2;
    property T2RXXXXG3A: IXMLMonthColumnList read Get_T2RXXXXG3A;
    property T2RXXXXG3B: IXMLYearColumnList read Get_T2RXXXXG3B;
    property T2RXXXXG4: IXMLDecimal2ColumnList read Get_T2RXXXXG4;
    property T2RXXXXG5: IXMLDecimal2ColumnList read Get_T2RXXXXG5;
    property R020G4: WideString read Get_R020G4 write Set_R020G4;
    property R020G5: WideString read Get_R020G5 write Set_R020G5;
    property R021G4: WideString read Get_R021G4 write Set_R021G4;
    property R021G5: WideString read Get_R021G5 write Set_R021G5;
    property T3RXXXXG2: IXMLIndTaxNumColumnList read Get_T3RXXXXG2;
    property T3RXXXXG3A: IXMLMonthColumnList read Get_T3RXXXXG3A;
    property T3RXXXXG3B: IXMLYearColumnList read Get_T3RXXXXG3B;
    property T3RXXXXG4: IXMLDecimal2ColumnList read Get_T3RXXXXG4;
    property T3RXXXXG5: IXMLDecimal2ColumnList read Get_T3RXXXXG5;
    property R030G4: WideString read Get_R030G4 write Set_R030G4;
    property R030G5: WideString read Get_R030G5 write Set_R030G5;
    property HFILL: WideString read Get_HFILL write Set_HFILL;
    property HBOS: WideString read Get_HBOS write Set_HBOS;
    property HBUH: WideString read Get_HBUH write Set_HBUH;
  end;

{ IXMLIndTaxNumColumn }

  IXMLIndTaxNumColumn = interface(IXMLNode)
    ['{03F4039A-5F04-4336-94BF-ED44F6F606FE}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLIndTaxNumColumnList }

  IXMLIndTaxNumColumnList = interface(IXMLNodeCollection)
    ['{2B2C57A3-648B-4A40-A818-37F9A3773D10}']
    { Methods & Properties }
    function Add: IXMLIndTaxNumColumn;
    function Insert(const Index: Integer): IXMLIndTaxNumColumn;
    function Get_Item(Index: Integer): IXMLIndTaxNumColumn;
    property Items[Index: Integer]: IXMLIndTaxNumColumn read Get_Item; default;
  end;

{ IXMLDecimal2Column }

  IXMLDecimal2Column = interface(IXMLNode)
    ['{AE902B19-6F8C-4126-B6B0-24437CB39E28}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLDecimal2ColumnList }

  IXMLDecimal2ColumnList = interface(IXMLNodeCollection)
    ['{5F9083D5-2909-4A45-94C3-F1285723B9C2}']
    { Methods & Properties }
    function Add: IXMLDecimal2Column;
    function Insert(const Index: Integer): IXMLDecimal2Column;
    function Get_Item(Index: Integer): IXMLDecimal2Column;
    property Items[Index: Integer]: IXMLDecimal2Column read Get_Item; default;
  end;

{ IXMLMonthColumn }

  IXMLMonthColumn = interface(IXMLNode)
    ['{2AA20A3C-EB76-468C-B0CB-E1C664DFA790}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLMonthColumnList }

  IXMLMonthColumnList = interface(IXMLNodeCollection)
    ['{FBC982E1-6E80-467F-A30D-789F422719D9}']
    { Methods & Properties }
    function Add: IXMLMonthColumn;
    function Insert(const Index: Integer): IXMLMonthColumn;
    function Get_Item(Index: Integer): IXMLMonthColumn;
    property Items[Index: Integer]: IXMLMonthColumn read Get_Item; default;
  end;

{ IXMLYearColumn }

  IXMLYearColumn = interface(IXMLNode)
    ['{27CEB462-6EB7-44D6-97FA-0886A04585D2}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLYearColumnList }

  IXMLYearColumnList = interface(IXMLNodeCollection)
    ['{0B20C5A6-82F4-4CDD-BD9F-AD01BF7774AD}']
    { Methods & Properties }
    function Add: IXMLYearColumn;
    function Insert(const Index: Integer): IXMLYearColumn;
    function Get_Item(Index: Integer): IXMLYearColumn;
    property Items[Index: Integer]: IXMLYearColumn read Get_Item; default;
  end;

{ Forward Decls }

  TXMLDeclarContent = class;
  TXMLDHead = class;
  TXMLLINKED_DOCS = class;
  TXMLDOC = class;
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
    function Get_HTIN: WideString;
    function Get_HTINSD: WideString;
    function Get_HTINUM: Int64;
    function Get_HTINNR: WideString;
    function Get_HTININ: WideString;
    function Get_HDDGVSD: WideString;
    function Get_HNDGVSD: WideString;
    function Get_HDDGVUM: WideString;
    function Get_HNDGVUM: WideString;
    function Get_HDDGVIN: WideString;
    function Get_HNDGVIN: WideString;
    function Get_HNPDV: WideString;
    function Get_HNSPDV: Int64;
    function Get_T1RXXXXG2: IXMLIndTaxNumColumnList;
    function Get_T1RXXXXG3: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG4: IXMLDecimal2ColumnList;
    function Get_R001G3: WideString;
    function Get_R001G4: WideString;
    function Get_R010G3: WideString;
    function Get_R010G4: WideString;
    function Get_R011G3: WideString;
    function Get_R011G4: WideString;
    function Get_T2RXXXXG2: IXMLIndTaxNumColumnList;
    function Get_T2RXXXXG3A: IXMLMonthColumnList;
    function Get_T2RXXXXG3B: IXMLYearColumnList;
    function Get_T2RXXXXG4: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG5: IXMLDecimal2ColumnList;
    function Get_R020G4: WideString;
    function Get_R020G5: WideString;
    function Get_R021G4: WideString;
    function Get_R021G5: WideString;
    function Get_T3RXXXXG2: IXMLIndTaxNumColumnList;
    function Get_T3RXXXXG3A: IXMLMonthColumnList;
    function Get_T3RXXXXG3B: IXMLYearColumnList;
    function Get_T3RXXXXG4: IXMLDecimal2ColumnList;
    function Get_T3RXXXXG5: IXMLDecimal2ColumnList;
    function Get_R030G4: WideString;
    function Get_R030G5: WideString;
    function Get_HFILL: WideString;
    function Get_HBOS: WideString;
    function Get_HBUH: WideString;
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
    procedure Set_HTIN(Value: WideString);
    procedure Set_HTINSD(Value: WideString);
    procedure Set_HTINUM(Value: Int64);
    procedure Set_HTINNR(Value: WideString);
    procedure Set_HTININ(Value: WideString);
    procedure Set_HDDGVSD(Value: WideString);
    procedure Set_HNDGVSD(Value: WideString);
    procedure Set_HDDGVUM(Value: WideString);
    procedure Set_HNDGVUM(Value: WideString);
    procedure Set_HDDGVIN(Value: WideString);
    procedure Set_HNDGVIN(Value: WideString);
    procedure Set_HNPDV(Value: WideString);
    procedure Set_HNSPDV(Value: Int64);
    procedure Set_R001G3(Value: WideString);
    procedure Set_R001G4(Value: WideString);
    procedure Set_R010G3(Value: WideString);
    procedure Set_R010G4(Value: WideString);
    procedure Set_R011G3(Value: WideString);
    procedure Set_R011G4(Value: WideString);
    procedure Set_R020G4(Value: WideString);
    procedure Set_R020G5(Value: WideString);
    procedure Set_R021G4(Value: WideString);
    procedure Set_R021G5(Value: WideString);
    procedure Set_R030G4(Value: WideString);
    procedure Set_R030G5(Value: WideString);
    procedure Set_HFILL(Value: WideString);
    procedure Set_HBOS(Value: WideString);
    procedure Set_HBUH(Value: WideString);
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

function TXMLDBody.Get_HTIN: WideString;
begin
  Result := ChildNodes['HTIN'].Text;
end;

procedure TXMLDBody.Set_HTIN(Value: WideString);
begin
  ChildNodes['HTIN'].NodeValue := Value;
end;

function TXMLDBody.Get_HTINSD: WideString;
begin
  Result := ChildNodes['HTINSD'].Text;
end;

procedure TXMLDBody.Set_HTINSD(Value: WideString);
begin
  ChildNodes['HTINSD'].NodeValue := Value;
end;

function TXMLDBody.Get_HTINUM: Int64;
begin
  Result := ChildNodes['HTINUM'].NodeValue;
end;

procedure TXMLDBody.Set_HTINUM(Value: Int64);
begin
  ChildNodes['HTINUM'].NodeValue := Value;
end;

function TXMLDBody.Get_HTINNR: WideString;
begin
  Result := ChildNodes['HTINNR'].Text;
end;

procedure TXMLDBody.Set_HTINNR(Value: WideString);
begin
  ChildNodes['HTINNR'].NodeValue := Value;
end;

function TXMLDBody.Get_HTININ: WideString;
begin
  Result := ChildNodes['HTININ'].Text;
end;

procedure TXMLDBody.Set_HTININ(Value: WideString);
begin
  ChildNodes['HTININ'].NodeValue := Value;
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

function TXMLDBody.Get_HDDGVUM: WideString;
begin
  Result := ChildNodes['HDDGVUM'].Text;
end;

procedure TXMLDBody.Set_HDDGVUM(Value: WideString);
begin
  ChildNodes['HDDGVUM'].NodeValue := Value;
end;

function TXMLDBody.Get_HNDGVUM: WideString;
begin
  Result := ChildNodes['HNDGVUM'].Text;
end;

procedure TXMLDBody.Set_HNDGVUM(Value: WideString);
begin
  ChildNodes['HNDGVUM'].NodeValue := Value;
end;

function TXMLDBody.Get_HDDGVIN: WideString;
begin
  Result := ChildNodes['HDDGVIN'].Text;
end;

procedure TXMLDBody.Set_HDDGVIN(Value: WideString);
begin
  ChildNodes['HDDGVIN'].NodeValue := Value;
end;

function TXMLDBody.Get_HNDGVIN: WideString;
begin
  Result := ChildNodes['HNDGVIN'].Text;
end;

procedure TXMLDBody.Set_HNDGVIN(Value: WideString);
begin
  ChildNodes['HNDGVIN'].NodeValue := Value;
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

function TXMLDBody.Get_R001G3: WideString;
begin
  Result := ChildNodes['R001G3'].Text;
end;

procedure TXMLDBody.Set_R001G3(Value: WideString);
begin
  ChildNodes['R001G3'].NodeValue := Value;
end;

function TXMLDBody.Get_R001G4: WideString;
begin
  Result := ChildNodes['R001G4'].Text;
end;

procedure TXMLDBody.Set_R001G4(Value: WideString);
begin
  ChildNodes['R001G4'].NodeValue := Value;
end;

function TXMLDBody.Get_R010G3: WideString;
begin
  Result := ChildNodes['R010G3'].Text;
end;

procedure TXMLDBody.Set_R010G3(Value: WideString);
begin
  ChildNodes['R010G3'].NodeValue := Value;
end;

function TXMLDBody.Get_R010G4: WideString;
begin
  Result := ChildNodes['R010G4'].Text;
end;

procedure TXMLDBody.Set_R010G4(Value: WideString);
begin
  ChildNodes['R010G4'].NodeValue := Value;
end;

function TXMLDBody.Get_R011G3: WideString;
begin
  Result := ChildNodes['R011G3'].Text;
end;

procedure TXMLDBody.Set_R011G3(Value: WideString);
begin
  ChildNodes['R011G3'].NodeValue := Value;
end;

function TXMLDBody.Get_R011G4: WideString;
begin
  Result := ChildNodes['R011G4'].Text;
end;

procedure TXMLDBody.Set_R011G4(Value: WideString);
begin
  ChildNodes['R011G4'].NodeValue := Value;
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

function TXMLDBody.Get_R020G4: WideString;
begin
  Result := ChildNodes['R020G4'].Text;
end;

procedure TXMLDBody.Set_R020G4(Value: WideString);
begin
  ChildNodes['R020G4'].NodeValue := Value;
end;

function TXMLDBody.Get_R020G5: WideString;
begin
  Result := ChildNodes['R020G5'].Text;
end;

procedure TXMLDBody.Set_R020G5(Value: WideString);
begin
  ChildNodes['R020G5'].NodeValue := Value;
end;

function TXMLDBody.Get_R021G4: WideString;
begin
  Result := ChildNodes['R021G4'].Text;
end;

procedure TXMLDBody.Set_R021G4(Value: WideString);
begin
  ChildNodes['R021G4'].NodeValue := Value;
end;

function TXMLDBody.Get_R021G5: WideString;
begin
  Result := ChildNodes['R021G5'].Text;
end;

procedure TXMLDBody.Set_R021G5(Value: WideString);
begin
  ChildNodes['R021G5'].NodeValue := Value;
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

function TXMLDBody.Get_R030G4: WideString;
begin
  Result := ChildNodes['R030G4'].Text;
end;

procedure TXMLDBody.Set_R030G4(Value: WideString);
begin
  ChildNodes['R030G4'].NodeValue := Value;
end;

function TXMLDBody.Get_R030G5: WideString;
begin
  Result := ChildNodes['R030G5'].Text;
end;

procedure TXMLDBody.Set_R030G5(Value: WideString);
begin
  ChildNodes['R030G5'].NodeValue := Value;
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