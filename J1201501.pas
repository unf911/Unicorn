
{***********************************************************************}
{                                                                       }
{                           XML Data Binding                            }
{                                                                       }
{         Generated on: 05.09.2007 10:28:01                             }
{       Generated from: D:\data\work\UniSebest\UniSebest\J1201501.xsd   }
{   Settings stored in: D:\data\work\UniSebest\UniSebest\J1201501.xdb   }
{                                                                       }
{***********************************************************************}

unit J1201501;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLDeclarContent = interface;
  IXMLDHead = interface;
  IXMLDBody = interface;
  IXMLDateColumn = interface;
  IXMLDateColumnList = interface;
  IXMLStrColumn = interface;
  IXMLStrColumnList = interface;
  IXMLIndTaxNumColumn = interface;
  IXMLIndTaxNumColumnList = interface;
  IXMLDecimal2Column = interface;
  IXMLDecimal2ColumnList = interface;

{ IXMLDeclarContent }

  IXMLDeclarContent = interface(IXMLNode)
    ['{E3A9ACEB-B802-411E-BB53-6FAFEAB8AE8A}']
    { Property Accessors }
    function Get_DECLARHEAD: IXMLDHead;
    function Get_DECLARBODY: IXMLDBody;
    { Methods & Properties }
    property DECLARHEAD: IXMLDHead read Get_DECLARHEAD;
    property DECLARBODY: IXMLDBody read Get_DECLARBODY;
  end;

{ IXMLDHead }

  IXMLDHead = interface(IXMLNode)
    ['{CD09DEC6-F237-41A1-8E39-18146C9DE53F}']
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
    property D_FILL: WideString read Get_D_FILL write Set_D_FILL;
    property SOFTWARE: WideString read Get_SOFTWARE write Set_SOFTWARE;
  end;

{ IXMLDBody }

  IXMLDBody = interface(IXMLNode)
    ['{55CA16EA-7112-4839-ADDD-8FEB9701EE57}']
    { Property Accessors }
    function Get_HNUM: WideString;
    function Get_HZY: Integer;
    function Get_HZKV: Integer;
    function Get_HZM: Integer;
    function Get_HNAME: WideString;
    function Get_HLOC: WideString;
    function Get_HNPDV: WideString;
    function Get_HNSPDV: WideString;
    function Get_H01G01D: WideString;
    function Get_H02G01D: WideString;
    function Get_H03G01S: WideString;
    function Get_T1RXXXXG2D: IXMLDateColumnList;
    function Get_T1RXXXXG3S: IXMLStrColumnList;
    function Get_T1RXXXXG4S: IXMLStrColumnList;
    function Get_T1RXXXXG5: IXMLIndTaxNumColumnList;
    function Get_T1RXXXXG6: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG7: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG8: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG9: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG10: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG11: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG12: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG13: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG14: IXMLDecimal2ColumnList;
    function Get_T1R01G6: WideString;
    function Get_T1R01G7: WideString;
    function Get_T1R01G8: WideString;
    function Get_T1R01G9: WideString;
    function Get_T1R01G10: WideString;
    function Get_T1R01G11: WideString;
    function Get_T1R01G12: WideString;
    function Get_T1R01G13: WideString;
    function Get_T1R01G14: WideString;
    function Get_T2RXXXXG2D: IXMLDateColumnList;
    function Get_T2RXXXXG3S: IXMLStrColumnList;
    function Get_T2RXXXXG4S: IXMLStrColumnList;
    function Get_T2RXXXXG5: IXMLIndTaxNumColumnList;
    function Get_T2RXXXXG6: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG7: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG8: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG9: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG10: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG11: IXMLDecimal2ColumnList;
    function Get_T2R01G6: WideString;
    function Get_T2R01G7: WideString;
    function Get_T2R01G8: WideString;
    function Get_T2R01G9: WideString;
    function Get_T2R01G10: WideString;
    function Get_T2R01G11: WideString;
    procedure Set_HNUM(Value: WideString);
    procedure Set_HZY(Value: Integer);
    procedure Set_HZKV(Value: Integer);
    procedure Set_HZM(Value: Integer);
    procedure Set_HNAME(Value: WideString);
    procedure Set_HLOC(Value: WideString);
    procedure Set_HNPDV(Value: WideString);
    procedure Set_HNSPDV(Value: WideString);
    procedure Set_H01G01D(Value: WideString);
    procedure Set_H02G01D(Value: WideString);
    procedure Set_H03G01S(Value: WideString);
    procedure Set_T1R01G6(Value: WideString);
    procedure Set_T1R01G7(Value: WideString);
    procedure Set_T1R01G8(Value: WideString);
    procedure Set_T1R01G9(Value: WideString);
    procedure Set_T1R01G10(Value: WideString);
    procedure Set_T1R01G11(Value: WideString);
    procedure Set_T1R01G12(Value: WideString);
    procedure Set_T1R01G13(Value: WideString);
    procedure Set_T1R01G14(Value: WideString);
    procedure Set_T2R01G6(Value: WideString);
    procedure Set_T2R01G7(Value: WideString);
    procedure Set_T2R01G8(Value: WideString);
    procedure Set_T2R01G9(Value: WideString);
    procedure Set_T2R01G10(Value: WideString);
    procedure Set_T2R01G11(Value: WideString);
    { Methods & Properties }
    property HNUM: WideString read Get_HNUM write Set_HNUM;
    property HZY: Integer read Get_HZY write Set_HZY;
    property HZKV: Integer read Get_HZKV write Set_HZKV;
    property HZM: Integer read Get_HZM write Set_HZM;
    property HNAME: WideString read Get_HNAME write Set_HNAME;
    property HLOC: WideString read Get_HLOC write Set_HLOC;
    property HNPDV: WideString read Get_HNPDV write Set_HNPDV;
    property HNSPDV: WideString read Get_HNSPDV write Set_HNSPDV;
    property H01G01D: WideString read Get_H01G01D write Set_H01G01D;
    property H02G01D: WideString read Get_H02G01D write Set_H02G01D;
    property H03G01S: WideString read Get_H03G01S write Set_H03G01S;
    property T1RXXXXG2D: IXMLDateColumnList read Get_T1RXXXXG2D;
    property T1RXXXXG3S: IXMLStrColumnList read Get_T1RXXXXG3S;
    property T1RXXXXG4S: IXMLStrColumnList read Get_T1RXXXXG4S;
    property T1RXXXXG5: IXMLIndTaxNumColumnList read Get_T1RXXXXG5;
    property T1RXXXXG6: IXMLDecimal2ColumnList read Get_T1RXXXXG6;
    property T1RXXXXG7: IXMLDecimal2ColumnList read Get_T1RXXXXG7;
    property T1RXXXXG8: IXMLDecimal2ColumnList read Get_T1RXXXXG8;
    property T1RXXXXG9: IXMLDecimal2ColumnList read Get_T1RXXXXG9;
    property T1RXXXXG10: IXMLDecimal2ColumnList read Get_T1RXXXXG10;
    property T1RXXXXG11: IXMLDecimal2ColumnList read Get_T1RXXXXG11;
    property T1RXXXXG12: IXMLDecimal2ColumnList read Get_T1RXXXXG12;
    property T1RXXXXG13: IXMLDecimal2ColumnList read Get_T1RXXXXG13;
    property T1RXXXXG14: IXMLDecimal2ColumnList read Get_T1RXXXXG14;
    property T1R01G6: WideString read Get_T1R01G6 write Set_T1R01G6;
    property T1R01G7: WideString read Get_T1R01G7 write Set_T1R01G7;
    property T1R01G8: WideString read Get_T1R01G8 write Set_T1R01G8;
    property T1R01G9: WideString read Get_T1R01G9 write Set_T1R01G9;
    property T1R01G10: WideString read Get_T1R01G10 write Set_T1R01G10;
    property T1R01G11: WideString read Get_T1R01G11 write Set_T1R01G11;
    property T1R01G12: WideString read Get_T1R01G12 write Set_T1R01G12;
    property T1R01G13: WideString read Get_T1R01G13 write Set_T1R01G13;
    property T1R01G14: WideString read Get_T1R01G14 write Set_T1R01G14;
    property T2RXXXXG2D: IXMLDateColumnList read Get_T2RXXXXG2D;
    property T2RXXXXG3S: IXMLStrColumnList read Get_T2RXXXXG3S;
    property T2RXXXXG4S: IXMLStrColumnList read Get_T2RXXXXG4S;
    property T2RXXXXG5: IXMLIndTaxNumColumnList read Get_T2RXXXXG5;
    property T2RXXXXG6: IXMLDecimal2ColumnList read Get_T2RXXXXG6;
    property T2RXXXXG7: IXMLDecimal2ColumnList read Get_T2RXXXXG7;
    property T2RXXXXG8: IXMLDecimal2ColumnList read Get_T2RXXXXG8;
    property T2RXXXXG9: IXMLDecimal2ColumnList read Get_T2RXXXXG9;
    property T2RXXXXG10: IXMLDecimal2ColumnList read Get_T2RXXXXG10;
    property T2RXXXXG11: IXMLDecimal2ColumnList read Get_T2RXXXXG11;
    property T2R01G6: WideString read Get_T2R01G6 write Set_T2R01G6;
    property T2R01G7: WideString read Get_T2R01G7 write Set_T2R01G7;
    property T2R01G8: WideString read Get_T2R01G8 write Set_T2R01G8;
    property T2R01G9: WideString read Get_T2R01G9 write Set_T2R01G9;
    property T2R01G10: WideString read Get_T2R01G10 write Set_T2R01G10;
    property T2R01G11: WideString read Get_T2R01G11 write Set_T2R01G11;
  end;

{ IXMLDateColumn }

  IXMLDateColumn = interface(IXMLNode)
    ['{FAA954A6-A533-43CD-ADD6-B3ED993783B5}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLDateColumnList }

  IXMLDateColumnList = interface(IXMLNodeCollection)
    ['{C4D92C87-BE41-4C28-B1D2-AE0AC6300888}']
    { Methods & Properties }
    function Add: IXMLDateColumn;
    function Insert(const Index: Integer): IXMLDateColumn;
    function Get_Item(Index: Integer): IXMLDateColumn;
    property Items[Index: Integer]: IXMLDateColumn read Get_Item; default;
  end;

{ IXMLStrColumn }

  IXMLStrColumn = interface(IXMLNode)
    ['{C02D582D-6DDE-4B52-86A8-1ACC52533B65}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLStrColumnList }

  IXMLStrColumnList = interface(IXMLNodeCollection)
    ['{CA2D9ECC-3682-4635-8189-269453888029}']
    { Methods & Properties }
    function Add: IXMLStrColumn;
    function Insert(const Index: Integer): IXMLStrColumn;
    function Get_Item(Index: Integer): IXMLStrColumn;
    property Items[Index: Integer]: IXMLStrColumn read Get_Item; default;
  end;

{ IXMLIndTaxNumColumn }

  IXMLIndTaxNumColumn = interface(IXMLNode)
    ['{67BD84C0-C7AE-46CD-82C7-7522FE31C485}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLIndTaxNumColumnList }

  IXMLIndTaxNumColumnList = interface(IXMLNodeCollection)
    ['{C51E6C63-EFDA-4BE7-B27C-05D4AA7FBEEC}']
    { Methods & Properties }
    function Add: IXMLIndTaxNumColumn;
    function Insert(const Index: Integer): IXMLIndTaxNumColumn;
    function Get_Item(Index: Integer): IXMLIndTaxNumColumn;
    property Items[Index: Integer]: IXMLIndTaxNumColumn read Get_Item; default;
  end;

{ IXMLDecimal2Column }

  IXMLDecimal2Column = interface(IXMLNode)
    ['{615C9DE9-85F1-4A99-9FE7-280D521796F6}']
    { Property Accessors }
    function Get_ROWNUM: Integer;
    procedure Set_ROWNUM(Value: Integer);
    { Methods & Properties }
    property ROWNUM: Integer read Get_ROWNUM write Set_ROWNUM;
  end;

{ IXMLDecimal2ColumnList }

  IXMLDecimal2ColumnList = interface(IXMLNodeCollection)
    ['{FE912FA9-3245-4B08-AB78-29449C32F598}']
    { Methods & Properties }
    function Add: IXMLDecimal2Column;
    function Insert(const Index: Integer): IXMLDecimal2Column;
    function Get_Item(Index: Integer): IXMLDecimal2Column;
    property Items[Index: Integer]: IXMLDecimal2Column read Get_Item; default;
  end;

{ Forward Decls }

  TXMLDeclarContent = class;
  TXMLDHead = class;
  TXMLDBody = class;
  TXMLDateColumn = class;
  TXMLDateColumnList = class;
  TXMLStrColumn = class;
  TXMLStrColumnList = class;
  TXMLIndTaxNumColumn = class;
  TXMLIndTaxNumColumnList = class;
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
    procedure Set_D_FILL(Value: WideString);
    procedure Set_SOFTWARE(Value: WideString);
  end;

{ TXMLDBody }

  TXMLDBody = class(TXMLNode, IXMLDBody)
  private
    FT1RXXXXG2D: IXMLDateColumnList;
    FT1RXXXXG3S: IXMLStrColumnList;
    FT1RXXXXG4S: IXMLStrColumnList;
    FT1RXXXXG5: IXMLIndTaxNumColumnList;
    FT1RXXXXG6: IXMLDecimal2ColumnList;
    FT1RXXXXG7: IXMLDecimal2ColumnList;
    FT1RXXXXG8: IXMLDecimal2ColumnList;
    FT1RXXXXG9: IXMLDecimal2ColumnList;
    FT1RXXXXG10: IXMLDecimal2ColumnList;
    FT1RXXXXG11: IXMLDecimal2ColumnList;
    FT1RXXXXG12: IXMLDecimal2ColumnList;
    FT1RXXXXG13: IXMLDecimal2ColumnList;
    FT1RXXXXG14: IXMLDecimal2ColumnList;
    FT2RXXXXG2D: IXMLDateColumnList;
    FT2RXXXXG3S: IXMLStrColumnList;
    FT2RXXXXG4S: IXMLStrColumnList;
    FT2RXXXXG5: IXMLIndTaxNumColumnList;
    FT2RXXXXG6: IXMLDecimal2ColumnList;
    FT2RXXXXG7: IXMLDecimal2ColumnList;
    FT2RXXXXG8: IXMLDecimal2ColumnList;
    FT2RXXXXG9: IXMLDecimal2ColumnList;
    FT2RXXXXG10: IXMLDecimal2ColumnList;
    FT2RXXXXG11: IXMLDecimal2ColumnList;
  protected
    { IXMLDBody }
    function Get_HNUM: WideString;
    function Get_HZY: Integer;
    function Get_HZKV: Integer;
    function Get_HZM: Integer;
    function Get_HNAME: WideString;
    function Get_HLOC: WideString;
    function Get_HNPDV: WideString;
    function Get_HNSPDV: WideString;
    function Get_H01G01D: WideString;
    function Get_H02G01D: WideString;
    function Get_H03G01S: WideString;
    function Get_T1RXXXXG2D: IXMLDateColumnList;
    function Get_T1RXXXXG3S: IXMLStrColumnList;
    function Get_T1RXXXXG4S: IXMLStrColumnList;
    function Get_T1RXXXXG5: IXMLIndTaxNumColumnList;
    function Get_T1RXXXXG6: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG7: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG8: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG9: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG10: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG11: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG12: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG13: IXMLDecimal2ColumnList;
    function Get_T1RXXXXG14: IXMLDecimal2ColumnList;
    function Get_T1R01G6: WideString;
    function Get_T1R01G7: WideString;
    function Get_T1R01G8: WideString;
    function Get_T1R01G9: WideString;
    function Get_T1R01G10: WideString;
    function Get_T1R01G11: WideString;
    function Get_T1R01G12: WideString;
    function Get_T1R01G13: WideString;
    function Get_T1R01G14: WideString;
    function Get_T2RXXXXG2D: IXMLDateColumnList;
    function Get_T2RXXXXG3S: IXMLStrColumnList;
    function Get_T2RXXXXG4S: IXMLStrColumnList;
    function Get_T2RXXXXG5: IXMLIndTaxNumColumnList;
    function Get_T2RXXXXG6: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG7: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG8: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG9: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG10: IXMLDecimal2ColumnList;
    function Get_T2RXXXXG11: IXMLDecimal2ColumnList;
    function Get_T2R01G6: WideString;
    function Get_T2R01G7: WideString;
    function Get_T2R01G8: WideString;
    function Get_T2R01G9: WideString;
    function Get_T2R01G10: WideString;
    function Get_T2R01G11: WideString;
    procedure Set_HNUM(Value: WideString);
    procedure Set_HZY(Value: Integer);
    procedure Set_HZKV(Value: Integer);
    procedure Set_HZM(Value: Integer);
    procedure Set_HNAME(Value: WideString);
    procedure Set_HLOC(Value: WideString);
    procedure Set_HNPDV(Value: WideString);
    procedure Set_HNSPDV(Value: WideString);
    procedure Set_H01G01D(Value: WideString);
    procedure Set_H02G01D(Value: WideString);
    procedure Set_H03G01S(Value: WideString);
    procedure Set_T1R01G6(Value: WideString);
    procedure Set_T1R01G7(Value: WideString);
    procedure Set_T1R01G8(Value: WideString);
    procedure Set_T1R01G9(Value: WideString);
    procedure Set_T1R01G10(Value: WideString);
    procedure Set_T1R01G11(Value: WideString);
    procedure Set_T1R01G12(Value: WideString);
    procedure Set_T1R01G13(Value: WideString);
    procedure Set_T1R01G14(Value: WideString);
    procedure Set_T2R01G6(Value: WideString);
    procedure Set_T2R01G7(Value: WideString);
    procedure Set_T2R01G8(Value: WideString);
    procedure Set_T2R01G9(Value: WideString);
    procedure Set_T2R01G10(Value: WideString);
    procedure Set_T2R01G11(Value: WideString);
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
  RegisterChildNode('T1RXXXXG2D', TXMLDateColumn);
  RegisterChildNode('T1RXXXXG3S', TXMLStrColumn);
  RegisterChildNode('T1RXXXXG4S', TXMLStrColumn);
  RegisterChildNode('T1RXXXXG5', TXMLIndTaxNumColumn);
  RegisterChildNode('T1RXXXXG6', TXMLDecimal2Column);
  RegisterChildNode('T1RXXXXG7', TXMLDecimal2Column);
  RegisterChildNode('T1RXXXXG8', TXMLDecimal2Column);
  RegisterChildNode('T1RXXXXG9', TXMLDecimal2Column);
  RegisterChildNode('T1RXXXXG10', TXMLDecimal2Column);
  RegisterChildNode('T1RXXXXG11', TXMLDecimal2Column);
  RegisterChildNode('T1RXXXXG12', TXMLDecimal2Column);
  RegisterChildNode('T1RXXXXG13', TXMLDecimal2Column);
  RegisterChildNode('T1RXXXXG14', TXMLDecimal2Column);
  RegisterChildNode('T2RXXXXG2D', TXMLDateColumn);
  RegisterChildNode('T2RXXXXG3S', TXMLStrColumn);
  RegisterChildNode('T2RXXXXG4S', TXMLStrColumn);
  RegisterChildNode('T2RXXXXG5', TXMLIndTaxNumColumn);
  RegisterChildNode('T2RXXXXG6', TXMLDecimal2Column);
  RegisterChildNode('T2RXXXXG7', TXMLDecimal2Column);
  RegisterChildNode('T2RXXXXG8', TXMLDecimal2Column);
  RegisterChildNode('T2RXXXXG9', TXMLDecimal2Column);
  RegisterChildNode('T2RXXXXG10', TXMLDecimal2Column);
  RegisterChildNode('T2RXXXXG11', TXMLDecimal2Column);
  FT1RXXXXG2D := CreateCollection(TXMLDateColumnList, IXMLDateColumn, 'T1RXXXXG2D') as IXMLDateColumnList;
  FT1RXXXXG3S := CreateCollection(TXMLStrColumnList, IXMLStrColumn, 'T1RXXXXG3S') as IXMLStrColumnList;
  FT1RXXXXG4S := CreateCollection(TXMLStrColumnList, IXMLStrColumn, 'T1RXXXXG4S') as IXMLStrColumnList;
  FT1RXXXXG5 := CreateCollection(TXMLIndTaxNumColumnList, IXMLIndTaxNumColumn, 'T1RXXXXG5') as IXMLIndTaxNumColumnList;
  FT1RXXXXG6 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T1RXXXXG6') as IXMLDecimal2ColumnList;
  FT1RXXXXG7 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T1RXXXXG7') as IXMLDecimal2ColumnList;
  FT1RXXXXG8 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T1RXXXXG8') as IXMLDecimal2ColumnList;
  FT1RXXXXG9 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T1RXXXXG9') as IXMLDecimal2ColumnList;
  FT1RXXXXG10 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T1RXXXXG10') as IXMLDecimal2ColumnList;
  FT1RXXXXG11 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T1RXXXXG11') as IXMLDecimal2ColumnList;
  FT1RXXXXG12 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T1RXXXXG12') as IXMLDecimal2ColumnList;
  FT1RXXXXG13 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T1RXXXXG13') as IXMLDecimal2ColumnList;
  FT1RXXXXG14 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T1RXXXXG14') as IXMLDecimal2ColumnList;
  FT2RXXXXG2D := CreateCollection(TXMLDateColumnList, IXMLDateColumn, 'T2RXXXXG2D') as IXMLDateColumnList;
  FT2RXXXXG3S := CreateCollection(TXMLStrColumnList, IXMLStrColumn, 'T2RXXXXG3S') as IXMLStrColumnList;
  FT2RXXXXG4S := CreateCollection(TXMLStrColumnList, IXMLStrColumn, 'T2RXXXXG4S') as IXMLStrColumnList;
  FT2RXXXXG5 := CreateCollection(TXMLIndTaxNumColumnList, IXMLIndTaxNumColumn, 'T2RXXXXG5') as IXMLIndTaxNumColumnList;
  FT2RXXXXG6 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T2RXXXXG6') as IXMLDecimal2ColumnList;
  FT2RXXXXG7 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T2RXXXXG7') as IXMLDecimal2ColumnList;
  FT2RXXXXG8 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T2RXXXXG8') as IXMLDecimal2ColumnList;
  FT2RXXXXG9 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T2RXXXXG9') as IXMLDecimal2ColumnList;
  FT2RXXXXG10 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T2RXXXXG10') as IXMLDecimal2ColumnList;
  FT2RXXXXG11 := CreateCollection(TXMLDecimal2ColumnList, IXMLDecimal2Column, 'T2RXXXXG11') as IXMLDecimal2ColumnList;
  inherited;
end;

function TXMLDBody.Get_HNUM: WideString;
begin
  Result := ChildNodes['HNUM'].Text;
end;

procedure TXMLDBody.Set_HNUM(Value: WideString);
begin
  ChildNodes['HNUM'].NodeValue := Value;
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

function TXMLDBody.Get_HNAME: WideString;
begin
  Result := ChildNodes['HNAME'].Text;
end;

procedure TXMLDBody.Set_HNAME(Value: WideString);
begin
  ChildNodes['HNAME'].NodeValue := Value;
end;

function TXMLDBody.Get_HLOC: WideString;
begin
  Result := ChildNodes['HLOC'].Text;
end;

procedure TXMLDBody.Set_HLOC(Value: WideString);
begin
  ChildNodes['HLOC'].NodeValue := Value;
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

function TXMLDBody.Get_H01G01D: WideString;
begin
  Result := ChildNodes['H01G01D'].Text;
end;

procedure TXMLDBody.Set_H01G01D(Value: WideString);
begin
  ChildNodes['H01G01D'].NodeValue := Value;
end;

function TXMLDBody.Get_H02G01D: WideString;
begin
  Result := ChildNodes['H02G01D'].Text;
end;

procedure TXMLDBody.Set_H02G01D(Value: WideString);
begin
  ChildNodes['H02G01D'].NodeValue := Value;
end;

function TXMLDBody.Get_H03G01S: WideString;
begin
  Result := ChildNodes['H03G01S'].Text;
end;

procedure TXMLDBody.Set_H03G01S(Value: WideString);
begin
  ChildNodes['H03G01S'].NodeValue := Value;
end;

function TXMLDBody.Get_T1RXXXXG2D: IXMLDateColumnList;
begin
  Result := FT1RXXXXG2D;
end;

function TXMLDBody.Get_T1RXXXXG3S: IXMLStrColumnList;
begin
  Result := FT1RXXXXG3S;
end;

function TXMLDBody.Get_T1RXXXXG4S: IXMLStrColumnList;
begin
  Result := FT1RXXXXG4S;
end;

function TXMLDBody.Get_T1RXXXXG5: IXMLIndTaxNumColumnList;
begin
  Result := FT1RXXXXG5;
end;

function TXMLDBody.Get_T1RXXXXG6: IXMLDecimal2ColumnList;
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

function TXMLDBody.Get_T1RXXXXG14: IXMLDecimal2ColumnList;
begin
  Result := FT1RXXXXG14;
end;

function TXMLDBody.Get_T1R01G6: WideString;
begin
  Result := ChildNodes['T1R01G6'].Text;
end;

procedure TXMLDBody.Set_T1R01G6(Value: WideString);
begin
  ChildNodes['T1R01G6'].NodeValue := Value;
end;

function TXMLDBody.Get_T1R01G7: WideString;
begin
  Result := ChildNodes['T1R01G7'].Text;
end;

procedure TXMLDBody.Set_T1R01G7(Value: WideString);
begin
  ChildNodes['T1R01G7'].NodeValue := Value;
end;

function TXMLDBody.Get_T1R01G8: WideString;
begin
  Result := ChildNodes['T1R01G8'].Text;
end;

procedure TXMLDBody.Set_T1R01G8(Value: WideString);
begin
  ChildNodes['T1R01G8'].NodeValue := Value;
end;

function TXMLDBody.Get_T1R01G9: WideString;
begin
  Result := ChildNodes['T1R01G9'].Text;
end;

procedure TXMLDBody.Set_T1R01G9(Value: WideString);
begin
  ChildNodes['T1R01G9'].NodeValue := Value;
end;

function TXMLDBody.Get_T1R01G10: WideString;
begin
  Result := ChildNodes['T1R01G10'].Text;
end;

procedure TXMLDBody.Set_T1R01G10(Value: WideString);
begin
  ChildNodes['T1R01G10'].NodeValue := Value;
end;

function TXMLDBody.Get_T1R01G11: WideString;
begin
  Result := ChildNodes['T1R01G11'].Text;
end;

procedure TXMLDBody.Set_T1R01G11(Value: WideString);
begin
  ChildNodes['T1R01G11'].NodeValue := Value;
end;

function TXMLDBody.Get_T1R01G12: WideString;
begin
  Result := ChildNodes['T1R01G12'].Text;
end;

procedure TXMLDBody.Set_T1R01G12(Value: WideString);
begin
  ChildNodes['T1R01G12'].NodeValue := Value;
end;

function TXMLDBody.Get_T1R01G13: WideString;
begin
  Result := ChildNodes['T1R01G13'].Text;
end;

procedure TXMLDBody.Set_T1R01G13(Value: WideString);
begin
  ChildNodes['T1R01G13'].NodeValue := Value;
end;

function TXMLDBody.Get_T1R01G14: WideString;
begin
  Result := ChildNodes['T1R01G14'].Text;
end;

procedure TXMLDBody.Set_T1R01G14(Value: WideString);
begin
  ChildNodes['T1R01G14'].NodeValue := Value;
end;

function TXMLDBody.Get_T2RXXXXG2D: IXMLDateColumnList;
begin
  Result := FT2RXXXXG2D;
end;

function TXMLDBody.Get_T2RXXXXG3S: IXMLStrColumnList;
begin
  Result := FT2RXXXXG3S;
end;

function TXMLDBody.Get_T2RXXXXG4S: IXMLStrColumnList;
begin
  Result := FT2RXXXXG4S;
end;

function TXMLDBody.Get_T2RXXXXG5: IXMLIndTaxNumColumnList;
begin
  Result := FT2RXXXXG5;
end;

function TXMLDBody.Get_T2RXXXXG6: IXMLDecimal2ColumnList;
begin
  Result := FT2RXXXXG6;
end;

function TXMLDBody.Get_T2RXXXXG7: IXMLDecimal2ColumnList;
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

function TXMLDBody.Get_T2R01G6: WideString;
begin
  Result := ChildNodes['T2R01G6'].Text;
end;

procedure TXMLDBody.Set_T2R01G6(Value: WideString);
begin
  ChildNodes['T2R01G6'].NodeValue := Value;
end;

function TXMLDBody.Get_T2R01G7: WideString;
begin
  Result := ChildNodes['T2R01G7'].Text;
end;

procedure TXMLDBody.Set_T2R01G7(Value: WideString);
begin
  ChildNodes['T2R01G7'].NodeValue := Value;
end;

function TXMLDBody.Get_T2R01G8: WideString;
begin
  Result := ChildNodes['T2R01G8'].Text;
end;

procedure TXMLDBody.Set_T2R01G8(Value: WideString);
begin
  ChildNodes['T2R01G8'].NodeValue := Value;
end;

function TXMLDBody.Get_T2R01G9: WideString;
begin
  Result := ChildNodes['T2R01G9'].Text;
end;

procedure TXMLDBody.Set_T2R01G9(Value: WideString);
begin
  ChildNodes['T2R01G9'].NodeValue := Value;
end;

function TXMLDBody.Get_T2R01G10: WideString;
begin
  Result := ChildNodes['T2R01G10'].Text;
end;

procedure TXMLDBody.Set_T2R01G10(Value: WideString);
begin
  ChildNodes['T2R01G10'].NodeValue := Value;
end;

function TXMLDBody.Get_T2R01G11: WideString;
begin
  Result := ChildNodes['T2R01G11'].Text;
end;

procedure TXMLDBody.Set_T2R01G11(Value: WideString);
begin
  ChildNodes['T2R01G11'].NodeValue := Value;
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

end. 