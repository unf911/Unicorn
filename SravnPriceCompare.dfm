object frmSravnPriceCompare: TfrmSravnPriceCompare
  Left = 76
  Top = 98
  Width = 652
  Height = 288
  Caption = #1057#1088#1072#1074#1085#1077#1085#1080#1077' '#1094#1077#1085' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1086#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    644
    261)
  PixelsPerInch = 96
  TextHeight = 13
  object dbgSravnPriceCompare: TDBGridEh
    Left = 4
    Top = 4
    Width = 637
    Height = 221
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoFitColWidths = True
    DataSource = dsSravnPriceCompare
    EditActions = [geaCopyEh]
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghDialogFind]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'DAT'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'POST'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'ANALOG'
        Footers = <>
        Width = 159
      end
      item
        EditButtons = <>
        FieldName = 'TOVAR'
        Footers = <>
        Width = 128
      end
      item
        EditButtons = <>
        FieldName = 'CENA'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'PROCENTTOBEST'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'PROCENTTOPREVIOUS'
        Footers = <>
      end>
  end
  object BitBtn1: TBitBtn
    Left = 236
    Top = 232
    Width = 189
    Height = 25
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Kind = bkOK
  end
  object UnfFilter1: TUnfFilter
    DBGridEh = dbgSravnPriceCompare
    MTStrings.Find = #1055#1086#1080#1089#1082
    MTStrings.Filter = #1060#1080#1083#1100#1090#1088
    MTStrings.Copy = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
    MTStrings.Paste = #1042#1089#1090#1072#1074#1080#1090#1100
    MTStrings.Restore = #1057#1085#1103#1090#1100' '#1092#1080#1083#1100#1090#1088
    MTStrings.RestoreColumn = #1057#1085#1103#1090#1100' '#1092#1080#1083#1100#1090#1088' c '#1082#1086#1083#1086#1085#1082#1080
    MTStrings.MatchCase = #1059#1095#1080#1090#1099#1074#1072#1090#1100' '#1088#1077#1075#1080#1089#1090#1088
    MTStrings.AnyPartofField = #1042' '#1089#1090#1088#1086#1082#1077
    MTStrings.WholeField = #1057#1090#1088#1086#1082#1072' '#1094#1077#1083#1080#1082#1086#1084
    MTStrings.StartofField = #1042' '#1085#1072#1095#1072#1083#1077' '#1089#1090#1088#1086#1082#1080
    Left = 116
    Top = 124
  end
  object dsSravnPriceCompare: TDataSource
    DataSet = mteSravnPriceCompare
    Left = 184
    Top = 108
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'frmSravnPriceCompare'
    StorageManager = RegPropStorageManEh1
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      'dbgSravnPriceCompare.<P>.Columns.<ForAllItems>.Width')
    Left = 244
    Top = 68
  end
  object RegPropStorageManEh1: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 276
    Top = 68
  end
  object mteSravnPriceCompare: TMemTableEh
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'mteSravnPriceCompareIndex1'
        Fields = 'cena'
      end>
    Params = <>
    StoreDefs = True
    Left = 185
    Top = 76
    object mteSravnPriceCompareDAT: TDateField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DAT'
      DisplayFormat = 'dd.mm.yy'
    end
    object mteSravnPriceComparePOST: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'POST'
      LookupDataSet = dmdEx.cdsPost
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_POST'
      Lookup = True
    end
    object mteSravnPriceCompareANALOG: TStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      FieldKind = fkLookup
      FieldName = 'ANALOG'
      LookupDataSet = dmdEx.cdsTovar
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_ANALOG'
      Lookup = True
    end
    object mteSravnPriceCompareTOVAR: TStringField
      DisplayLabel = #1058#1086#1095#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'TOVAR'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_ANALOG'
      Size = 50
      Lookup = True
    end
    object mteSravnPriceCompareCENA: TFloatField
      DisplayLabel = #1042#1093#1086#1076
      FieldName = 'CENA'
      DisplayFormat = '0.0000'
    end
    object mteSravnPriceCompareID_ANALOG: TIntegerField
      FieldName = 'ID_ANALOG'
      Visible = False
    end
    object mteSravnPriceCompareID_POST: TIntegerField
      FieldName = 'ID_POST'
      Visible = False
    end
    object mteSravnPriceCompareID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
      Visible = False
    end
    object mteSravnPriceComparePROCENTTOBEST: TFloatField
      DisplayLabel = '% '#1082' '#1083#1091#1095#1096#1077#1084#1091
      FieldName = 'PROCENTTOBEST'
      DisplayFormat = '0.00'
    end
    object mteSravnPriceComparePROCENTTOPREVIOUS: TFloatField
      DisplayLabel = '% '#1082' '#1087#1088#1077#1076#1099#1076#1091#1097#1077#1084#1091
      FieldName = 'PROCENTTOPREVIOUS'
      DisplayFormat = '0.00'
    end
  end
end
