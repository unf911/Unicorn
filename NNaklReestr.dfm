object frmNnaklReestr: TfrmNnaklReestr
  Left = 290
  Top = 409
  BorderStyle = bsDialog
  Caption = #1056#1077#1077#1089#1090#1088' '#1074#1099#1076#1072#1085#1085#1099#1093' '#1085#1072#1083#1086#1075#1086#1074#1099#1093' '#1085#1072#1082#1083#1072#1076#1085#1099#1093
  ClientHeight = 344
  ClientWidth = 567
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    567
    344)
  PixelsPerInch = 96
  TextHeight = 13
  object dbgRep: TDBGridEh
    Tag = 1
    Left = 12
    Top = 4
    Width = 549
    Height = 261
    AllowedOperations = []
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsRasx
    EditActions = [geaCopyEh, geaSelectAllEh]
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking]
    SortLocal = True
    SumList.Active = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'F1_NPP'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'F4_ZAK'
        Footers = <>
        Width = 83
      end
      item
        EditButtons = <>
        FieldName = 'F5_IPN'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'F6_NDS'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'F7_NDS'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'F8_NDS'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'ROWCOUNT'
        Footers = <>
      end>
  end
  object BitBtn5: TBitBtn
    Left = 10
    Top = 272
    Width = 129
    Height = 41
    Action = actSettings
    Anchors = [akLeft, akBottom]
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 110
    Top = 84
    Width = 113
    Height = 57
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
    TabOrder = 2
    Visible = False
  end
  object Button2: TButton
    Left = 150
    Top = 272
    Width = 129
    Height = 41
    Action = actGenerateXml
    Anchors = [akLeft, akBottom]
    TabOrder = 3
  end
  object dbgNNaklpNexoz: TDBGridEh
    Tag = 1
    Left = 12
    Top = 312
    Width = 230
    Height = 25
    AllowedOperations = []
    Anchors = [akLeft, akTop, akRight]
    DataSource = dsNNaklpNexoz
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking]
    SortLocal = True
    SumList.Active = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
    Columns = <
      item
        EditButtons = <>
        FieldName = 'F1_NPP'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'F4_IZG'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'F5_IPN'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'F6_NDS'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'F7_NDS'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'F8_NDS'
        Footer.ValueType = fvtSum
        Footers = <>
      end>
  end
  object BitBtn2: TBitBtn
    Left = 291
    Top = 272
    Width = 129
    Height = 41
    Action = actShowNNaklr
    Anchors = [akLeft, akBottom]
    Caption = #1042#1099#1076#1072#1085#1085#1099#1077
    TabOrder = 5
  end
  object BitBtn3: TBitBtn
    Left = 432
    Top = 272
    Width = 129
    Height = 41
    Action = actShowNNaklp
    Anchors = [akLeft, akBottom]
    Caption = #1055#1086#1083#1091#1095#1077#1085#1085#1099#1077
    TabOrder = 6
  end
  object dsRasx: TDataSource
    Tag = 1
    DataSet = cdsRasx
    Left = 16
    Top = 24
  end
  object ActionList1: TActionList
    Left = 72
    Top = 128
    object actSettings: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      OnExecute = actSettingsExecute
    end
    object actRefresh: TAction
      Caption = 'actRefresh'
      OnExecute = actRefreshExecute
    end
    object actRefreshNNaklp: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
    end
    object actGenerateXml: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100' Xml'
      OnExecute = actGenerateXmlExecute
    end
    object actShowNNaklr: TAction
      Caption = #1042#1099#1076#1072#1085#1085#1099#1077
      OnExecute = actShowNNaklrExecute
    end
    object actShowNNaklp: TAction
      Caption = #1055#1086#1083#1091#1095#1077#1085#1085#1099#1077
      OnExecute = actShowNNaklpExecute
    end
  end
  object frRasx: TfrxReport
    Version = '3.23.7'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38985.433947662000000000
    ReportOptions.LastChange = 39036.674937719910000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    Left = 72
    Top = 96
    Datasets = <
      item
        DataSet = frdRasx
        DataSetName = 'frdRasx'
      end>
    Variables = <>
    Style = <>
  end
  object frdRasx: TfrxDBDataset
    UserName = 'frdRasx'
    CloseDataSource = False
    DataSet = cdsRasx
    Left = 72
    Top = 64
  end
  object sdsRasx: TSQLDataSet
    CommandText = 
      'select '#13#10'  *'#13#10'from '#13#10'  REP_REESTR_VYDAN_NNAKL2_PC('#13#10'     :id_izg' +
      ','#13#10'     :date_from,'#13#10'     :date_to'#13#10'  )'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_izg'
        ParamType = ptInput
        Value = 1264
      end
      item
        DataType = ftDate
        Name = 'date_from'
        ParamType = ptInput
        Value = 37622d
      end
      item
        DataType = ftDate
        Name = 'date_to'
        ParamType = ptInput
        Value = 37681d
      end>
    SQLConnection = dmdEx.scUchet
    Left = 40
    Top = 64
  end
  object dspRasx: TDataSetProvider
    Tag = 1
    DataSet = sdsRasx
    Options = [poAllowCommandText]
    Left = 40
    Top = 96
  end
  object cdsRasx: TClientDataSet
    Tag = 1
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_izg'
        ParamType = ptInput
        Value = 1264
      end
      item
        DataType = ftDate
        Name = 'date_from'
        ParamType = ptInput
        Value = 37622d
      end
      item
        DataType = ftDate
        Name = 'date_to'
        ParamType = ptInput
        Value = 37681d
      end>
    ProviderName = 'dspRasx'
    Left = 40
    Top = 128
  end
  object qeRasx: TQueryExtender
    Query = cdsRasx
    Left = 8
    Top = 128
  end
  object MainMenu1: TMainMenu
    Left = 108
    Top = 128
    object MenuItem1: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      GroupIndex = 10
      object MenuItem3: TMenuItem
        Action = actSettings
      end
    end
  end
  object sdsNNaklp: TSQLDataSet
    CommandText = 
      'select '#13#10'  *'#13#10'from '#13#10'  rep_reestr_polych_nnakl2_pc('#13#10'     :id_iz' +
      'g,'#13#10'     :date_from,'#13#10'     :date_to'#13#10'  )'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_izg'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'date_from'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'date_to'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 220
    Top = 68
  end
  object dspNNaklp: TDataSetProvider
    Tag = 1
    DataSet = sdsNNaklp
    Options = [poAllowCommandText]
    Left = 220
    Top = 100
  end
  object cdsNNaklp: TClientDataSet
    Tag = 1
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_izg'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'date_from'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'date_to'
        ParamType = ptInput
      end>
    ProviderName = 'dspNNaklp'
    Left = 220
    Top = 132
  end
  object dsNNaklp: TDataSource
    Tag = 1
    DataSet = cdsNNaklp
    Left = 188
    Top = 132
  end
  object XMLDocument1: TXMLDocument
    Left = 260
    Top = 108
    DOMVendorDesc = 'MSXML'
  end
  object frdNNaklp: TfrxDBDataset
    UserName = 'frdNNaklp'
    CloseDataSource = False
    DataSet = cdsNNaklp
    Left = 324
    Top = 64
  end
  object frxNNaklp: TfrxReport
    Version = '3.23.7'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38985.431979525500000000
    ReportOptions.LastChange = 39330.721755636570000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 324
    Top = 96
    Datasets = <
      item
        DataSet = frdNNaklp
        DataSetName = 'frdNNaklp'
      end>
    Variables = <>
    Style = <>
    object TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Bin = 65535
      BinOtherPages = 65535
      object PageHeader1: TfrxPageHeader
        Height = 166.000000000000000000
        Top = 150.000000000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Width = 24.000000000000000000
          Height = 148.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211
            #1056#183'/'#1056#1111)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 72.000000000000000000
          Top = 20.000000000000000000
          Width = 48.000000000000000000
          Height = 128.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1029#1056#1109#1056#1112#1056#181#1057#1026)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 24.000000000000000000
          Top = 20.000000000000000000
          Width = 48.000000000000000000
          Height = 128.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1169#1056#176#1057#8218#1056#176' '#1056#1109#1057#8218#1057#1026#1056#1105#1056#1112#1056#176#1056#1029#1056#1029#1057#1039)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 120.000000000000000000
          Top = 39.000000000000000000
          Width = 180.000000000000000000
          Height = 109.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1029#1056#176#1056#183#1056#1030#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 300.000000000000000000
          Top = 39.000000000000000000
          Width = 64.000000000000000000
          Height = 109.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#8211#1056#1169#1056#1029#1056#1105#1056#1030#1057#8211#1056#1169#1057#1107#1056#176#1056#187#1057#1034#1056#1029#1056#1105#1056#8470' '#1056#1111#1056#1109#1056#1169#1056#176#1057#8218#1056#1108#1056#1109#1056#1030#1056#1105#1056#8470' '#1056#1029#1056#1109#1056#1112#1056#181#1057#1026)
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 736.000000000000000000
          Top = 30.000000000000000000
          Width = 132.000000000000000000
          Height = 84.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1057#1039#1056#1108#1057#8211' '#1056#1029#1056#181' '#1056#1111#1057#1026#1056#1105#1056#183#1056#1029#1056#176#1057#8225#1056#176#1057#1035#1057#8218#1057#1034#1057#1027#1057#1039' '#1056#1169#1056#187#1057#1039' '#1057#8212#1057#8230' '#1056#1030#1056#1105#1056#1108#1056#1109#1057#1026#1056#1105#1057 +
              #1027#1057#8218#1056#176#1056#1029#1056#1029#1057#1039' '#1057#1107' '#1056#1110#1056#1109#1057#1027#1056#1111#1056#1109#1056#1169#1056#176#1057#1026#1057#1027#1057#1034#1056#1108#1057#8211#1056#8470' '#1056#1169#1057#8211#1057#1039#1056#187#1057#1034#1056#1029#1056#1109#1057#1027#1057#8218#1057#8211)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 624.000000000000000000
          Top = 114.000000000000000000
          Width = 56.000000000000000000
          Height = 34.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            #1056#1030#1056#176#1057#1026#1057#8218#1057#8211#1057#1027#1057#8218#1057#1034' '#1056#177#1056#181#1056#183' '#1056#1119#1056#8221#1056#8217)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 364.000000000000000000
          Width = 72.000000000000000000
          Height = 148.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8212#1056#176#1056#1110#1056#176#1056#187#1057#1034#1056#1029#1056#176' '#1057#1027#1057#1107#1056#1112#1056#176', '#1056#1030#1056#1108#1056#187#1057#1035#1057#8225#1056#176#1057#1035#1057#8225#1056#1105' '#1056#1119#1056#8221#1056#8217)
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 868.000000000000000000
          Top = 30.000000000000000000
          Width = 128.000000000000000000
          Height = 84.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1169#1056#187#1057#1039' '#1056#1111#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#1108#1056#1105' '#1056#1111#1056#1109#1057#1027#1056#187#1057#1107#1056#1110', '#1056#1112#1057#8211#1057#1027#1057#8224#1056#181' '#1056#1111#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#1108#1056 +
              #1105' '#1057#1039#1056#1108#1056#1105#1057#8230' '#1056#1030#1056#1105#1056#183#1056#1029#1056#176#1057#8225#1056#176#1057#8221#1057#8218#1057#1034#1057#1027#1057#1039' '#1056#1030#1057#8211#1056#1169#1056#1111#1056#1109#1056#1030#1057#8211#1056#1169#1056#1029#1056#1109' '#1056#1169#1056#1109' '#1056#1111 +
              #1057#1107#1056#1029#1056#1108#1057#8218#1057#1107' 6.5 '#1057#1027#1057#8218#1056#176#1057#8218#1057#8218#1057#8211' 6 '#1056#8212#1056#176#1056#1108#1056#1109#1056#1029#1057#1107)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Top = 148.000000000000000000
          Width = 24.000000000000000000
          Height = 18.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '1')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          Left = 24.000000000000000000
          Top = 148.000000000000000000
          Width = 48.000000000000000000
          Height = 18.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '2')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          Left = 24.000000000000000000
          Width = 340.000000000000000000
          Height = 20.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#1169#1056#176#1057#8218#1056#1108#1056#1109#1056#1030#1056#176' '#1056#1029#1056#176#1056#1108#1056#187#1056#176#1056#1169#1056#1029#1056#176', '#1056#8217#1056#1114#1056#8221', '#1057#8225#1056#181#1056#1108' '#1057#8218#1056#1109#1057#8240#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Left = 72.000000000000000000
          Top = 148.000000000000000000
          Width = 48.000000000000000000
          Height = 18.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '3')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 120.000000000000000000
          Top = 148.000000000000000000
          Width = 180.000000000000000000
          Height = 18.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '4')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 300.000000000000000000
          Top = 148.000000000000000000
          Width = 64.000000000000000000
          Height = 18.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '5')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 364.000000000000000000
          Top = 148.000000000000000000
          Width = 72.000000000000000000
          Height = 18.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '6')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 680.000000000000000000
          Top = 148.000000000000000000
          Width = 56.000000000000000000
          Height = 18.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '10')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 736.000000000000000000
          Top = 148.000000000000000000
          Width = 72.000000000000000000
          Height = 18.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '11')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 808.000000000000000000
          Top = 148.000000000000000000
          Width = 60.000000000000000000
          Height = 18.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '12')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Left = 868.000000000000000000
          Top = 148.000000000000000000
          Width = 72.000000000000000000
          Height = 18.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '13')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          Left = 940.000000000000000000
          Top = 148.000000000000000000
          Width = 56.000000000000000000
          Height = 18.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '14')
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          Left = 436.000000000000000000
          Top = 30.000000000000000000
          Width = 300.000000000000000000
          Height = 30.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            
              #1056#183' '#1056#1112#1056#181#1057#8218#1056#1109#1057#1035' '#1057#8212#1057#8230' '#1056#1030#1056#1105#1056#1108#1056#1109#1057#1026#1056#1105#1057#1027#1057#8218#1056#176#1056#1029#1056#1029#1057#1039' '#1057#1107' '#1056#1112#1056#181#1056#182#1056#176#1057#8230' '#1056#1110#1056#1109#1057#1027 +
              #1056#1111#1056#1109#1056#1169#1056#176#1057#1026#1057#1027#1057#1034#1056#1108#1056#1109#1057#8212' '#1056#1169#1057#8211#1057#1039#1056#187#1057#1034#1056#1029#1056#1109#1057#1027#1057#8218#1057#8211' '#1056#1169#1056#187#1057#1039' '#1056#183#1056#1169#1057#8211#1056#8470#1057#1027#1056#1029#1056#181#1056 +
              #1029#1056#1029#1057#1039' '#1056#1109#1056#1111#1056#181#1057#1026#1056#176#1057#8224#1057#8211#1056#8470', '#1057#1039#1056#1108#1057#8211':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo59: TfrxMemoView
          Left = 436.000000000000000000
          Top = 60.000000000000000000
          Width = 188.000000000000000000
          Height = 54.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            
              #1056#1119#1057#8211#1056#1169#1056#187#1057#1039#1056#1110#1056#176#1057#1035#1057#8218#1057#1034' '#1056#1109#1056#1111#1056#1109#1056#1169#1056#176#1057#8218#1056#1108#1057#1107#1056#1030#1056#176#1056#1029#1056#1029#1057#1035' '#1056#183#1056#176' '#1057#1027#1057#8218#1056#176#1056#1030#1056#1108#1056 +
              #1109#1057#1035' 20 %, 0 %')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo60: TfrxMemoView
          Left = 624.000000000000000000
          Top = 60.000000000000000000
          Width = 112.000000000000000000
          Height = 54.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            #1056#183#1056#1030#1057#8211#1056#187#1057#1034#1056#1029#1056#181#1056#1029#1057#8211' '#1056#1030#1057#8211#1056#1169' '#1056#1109#1056#1111#1056#1109#1056#1169#1056#176#1057#8218#1056#1108#1057#1107#1056#1030#1056#176#1056#1029#1056#1029#1057#1039','
            #1056#1029#1056#181' '#1057#8221' '#1056#1109#1056#177#39#1057#8221#1056#1108#1057#8218#1056#176#1056#1112#1056#1105' '#1056#1109#1056#1111#1056#1109#1056#1169#1056#176#1057#8218#1056#1108#1057#1107#1056#1030#1056#176#1056#1029#1056#1029#1057#1039)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo61: TfrxMemoView
          Left = 436.000000000000000000
          Width = 560.000000000000000000
          Height = 30.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            
              #1056#1119#1057#1026#1056#1105#1056#1169#1056#177#1056#176#1056#1029#1056#1029#1057#1039' ('#1056#1030#1056#1105#1056#1110#1056#1109#1057#8218#1056#1109#1056#1030#1056#187#1056#181#1056#1029#1056#1029#1057#1039', '#1056#177#1057#1107#1056#1169#1057#8211#1056#1030#1056#1029#1056#1105#1057#8224#1057#8218 +
              #1056#1030#1056#1109', '#1057#1027#1056#1111#1056#1109#1057#1026#1057#1107#1056#1169#1056#182#1056#181#1056#1029#1056#1029#1057#1039'), '#1057#8211#1056#1112#1056#1111#1056#1109#1057#1026#1057#8218' '#1057#8218#1056#1109#1056#1030#1056#176#1057#1026#1057#8211#1056#1030' ('#1056#1111#1056#1109 +
              #1057#1027#1056#187#1057#1107#1056#1110', '#1056#1030#1056#1108#1056#187#1057#1035#1057#8225#1056#176#1057#1035#1057#8225#1056#1105' '#1056#1109#1056#1169#1056#181#1057#1026#1056#182#1056#176#1056#1029#1056#1029#1057#1039' '#1056#1030#1057#8211#1056#1169' '#1056#1029#1056#181#1057#1026#1056#181#1056 +
              #183#1056#1105#1056#1169#1056#181#1056#1029#1057#8218#1056#176'):')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 120.000000000000000000
          Top = 20.000000000000000000
          Width = 244.000000000000000000
          Height = 19.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1111#1056#1109#1057#1027#1057#8218#1056#176#1057#8225#1056#176#1056#187#1057#1034#1056#1029#1056#1105#1056#1108)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 680.000000000000000000
          Top = 114.000000000000000000
          Width = 56.000000000000000000
          Height = 34.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1027#1057#1107#1056#1112#1056#176' '#1056#1119#1056#8221#1056#8217)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 868.000000000000000000
          Top = 114.000000000000000000
          Width = 72.000000000000000000
          Height = 34.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            #1056#1030#1056#176#1057#1026#1057#8218#1057#8211#1057#1027#1057#8218#1057#1034' '#1056#177#1056#181#1056#183' '#1056#1119#1056#8221#1056#8217)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 940.000000000000000000
          Top = 114.000000000000000000
          Width = 56.000000000000000000
          Height = 34.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1027#1057#1107#1056#1112#1056#176' '#1056#1119#1056#8221#1056#8217)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 736.000000000000000000
          Top = 114.000000000000000000
          Width = 72.000000000000000000
          Height = 34.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            #1056#1030#1056#176#1057#1026#1057#8218#1057#8211#1057#1027#1057#8218#1057#1034' '#1056#177#1056#181#1056#183' '#1056#1119#1056#8221#1056#8217)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 808.000000000000000000
          Top = 114.000000000000000000
          Width = 60.000000000000000000
          Height = 34.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1027#1057#1107#1056#1112#1056#176' '#1056#1119#1056#8221#1056#8217)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 552.000000000000000000
          Top = 114.000000000000000000
          Width = 72.000000000000000000
          Height = 34.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1027#1057#1107#1056#1112#1056#176' '#1056#1119#1056#8221#1056#8217)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 436.000000000000000000
          Top = 114.000000000000000000
          Width = 116.000000000000000000
          Height = 34.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            #1056#1030#1056#176#1057#1026#1057#8218#1057#8211#1057#1027#1057#8218#1057#1034' '#1056#177#1056#181#1056#183' '#1056#1119#1056#8221#1056#8217)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 436.000000000000000000
          Top = 148.000000000000000000
          Width = 116.000000000000000000
          Height = 18.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '7')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 552.000000000000000000
          Top = 148.000000000000000000
          Width = 72.000000000000000000
          Height = 18.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '8')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 624.000000000000000000
          Top = 148.000000000000000000
          Width = 56.000000000000000000
          Height = 18.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '9')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.000000000000000000
        Top = 396.000000000000000000
        Width = 1046.929810000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        DataSet = frdNNaklp
        DataSetName = 'frdNNaklp'
        KeepFooter = True
        RowCount = 0
        object Memo2: TfrxMemoView
          Width = 24.000000000000000000
          Height = 22.000000000000000000
          DataSet = frdNNaklp
          DataSetName = 'frdNNaklp'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdNNaklp."F1_NPP"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 72.000000000000000000
          Width = 48.000000000000000000
          Height = 22.000000000000000000
          DataField = 'F3_ID'
          DataSet = frdNNaklp
          DataSetName = 'frdNNaklp'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdNNaklp."F3_ID"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 24.000000000000000000
          Width = 48.000000000000000000
          Height = 22.000000000000000000
          DataField = 'F2_DAT'
          DataSet = frdNNaklp
          DataSetName = 'frdNNaklp'
          DisplayFormat.FormatStr = 'dd.mm'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frdNNaklp."F2_DAT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 120.000000000000000000
          Width = 180.000000000000000000
          Height = 22.000000000000000000
          DataField = 'F4_IZG'
          DataSet = frdNNaklp
          DataSetName = 'frdNNaklp'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frdNNaklp."F4_IZG"]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 300.000000000000000000
          Width = 64.000000000000000000
          Height = 22.000000000000000000
          DataField = 'F5_IPN'
          DataSet = frdNNaklp
          DataSetName = 'frdNNaklp'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HideZeros = True
          Memo.UTF8 = (
            '[frdNNaklp."F5_IPN"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 364.000000000000000000
          Width = 72.000000000000000000
          Height = 22.000000000000000000
          DataField = 'F6_NDS'
          DataSet = frdNNaklp
          DataSetName = 'frdNNaklp'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frdNNaklp."F6_NDS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 436.000000000000000000
          Width = 116.000000000000000000
          Height = 22.000000000000000000
          DataField = 'F7_NDS'
          DataSet = frdNNaklp
          DataSetName = 'frdNNaklp'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frdNNaklp."F7_NDS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 940.000000000000000000
          Width = 56.000000000000000000
          Height = 22.000000000000000000
          DataField = 'F14'
          DataSet = frdNNaklp
          DataSetName = 'frdNNaklp'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frdNNaklp."F14"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 736.000000000000000000
          Width = 72.000000000000000000
          Height = 22.000000000000000000
          DataField = 'F11'
          DataSet = frdNNaklp
          DataSetName = 'frdNNaklp'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frdNNaklp."F11"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 552.000000000000000000
          Width = 72.000000000000000000
          Height = 22.000000000000000000
          DataField = 'F8_NDS'
          DataSet = frdNNaklp
          DataSetName = 'frdNNaklp'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frdNNaklp."F8_NDS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          Left = 624.000000000000000000
          Width = 56.000000000000000000
          Height = 22.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 680.000000000000000000
          Width = 56.000000000000000000
          Height = 22.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frdNNaklp."F10"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 808.000000000000000000
          Width = 60.000000000000000000
          Height = 22.000000000000000000
          DataField = 'F12'
          DataSet = frdNNaklp
          DataSetName = 'frdNNaklp'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frdNNaklp."F12"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 868.000000000000000000
          Width = 72.000000000000000000
          Height = 22.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          ParentFont = False
        end
      end
      object MasterFooter1: TfrxFooter
        Height = 22.000000000000000000
        Top = 480.000000000000000000
        Width = 1046.929810000000000000
        object Memo39: TfrxMemoView
          Left = 364.000000000000000000
          Width = 72.000000000000000000
          Height = 22.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[SUM(<frdNNaklp."F6_NDS">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Left = 436.000000000000000000
          Width = 116.000000000000000000
          Height = 22.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[SUM(<frdNNaklp."F7_NDS">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 552.000000000000000000
          Width = 72.000000000000000000
          Height = 22.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[SUM(<frdNNaklp."F8_NDS">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo57: TfrxMemoView
          Left = 624.000000000000000000
          Width = 56.000000000000000000
          Height = 22.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          ParentFont = False
        end
        object Memo77: TfrxMemoView
          Width = 364.000000000000000000
          Height = 22.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#1032#1057#1027#1057#1034#1056#1109#1056#1110#1056#1109' '#1056#183#1056#176' '#1056#1112#1057#8211#1057#1027#1057#1039#1057#8224#1057#1034)
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo84: TfrxMemoView
          Left = 868.000000000000000000
          Width = 72.000000000000000000
          Height = 22.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo88: TfrxMemoView
          Left = 736.000000000000000000
          Width = 72.000000000000000000
          Height = 22.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[SUM(<frdNNaklp."F11">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo91: TfrxMemoView
          Left = 680.000000000000000000
          Width = 56.000000000000000000
          Height = 22.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[SUM(<frdNNaklp."F10">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo93: TfrxMemoView
          Left = 808.000000000000000000
          Width = 60.000000000000000000
          Height = 22.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[SUM(<frdNNaklp."F12">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo95: TfrxMemoView
          Left = 940.000000000000000000
          Width = 56.000000000000000000
          Height = 22.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[SUM(<frdNNaklp."F14">)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 22.000000000000000000
        Top = 438.000000000000000000
        Width = 1046.929810000000000000
        KeepChild = True
        object Memo69: TfrxMemoView
          Left = 364.000000000000000000
          Width = 72.000000000000000000
          Height = 22.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[SUM(<frdNNaklp."F6_NDS">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo70: TfrxMemoView
          Left = 436.000000000000000000
          Width = 116.000000000000000000
          Height = 22.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[SUM(<frdNNaklp."F7_NDS">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo71: TfrxMemoView
          Left = 868.000000000000000000
          Width = 72.000000000000000000
          Height = 22.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo74: TfrxMemoView
          Left = 552.000000000000000000
          Width = 72.000000000000000000
          Height = 22.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[SUM(<frdNNaklp."F8_NDS">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo75: TfrxMemoView
          Left = 624.000000000000000000
          Width = 56.000000000000000000
          Height = 22.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          ParentFont = False
        end
        object Memo76: TfrxMemoView
          Left = 736.000000000000000000
          Width = 72.000000000000000000
          Height = 22.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[SUM(<frdNNaklp."F11">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo66: TfrxMemoView
          Width = 364.000000000000000000
          Height = 22.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#1032#1057#1027#1057#1034#1056#1109#1056#1110#1056#1109' '#1056#183#1056#176' '#1056#1169#1056#181#1056#1029#1057#1034)
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 680.000000000000000000
          Width = 56.000000000000000000
          Height = 22.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[SUM(<frdNNaklp."F10">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 808.000000000000000000
          Width = 60.000000000000000000
          Height = 22.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[SUM(<frdNNaklp."F12">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo72: TfrxMemoView
          Left = 940.000000000000000000
          Width = 56.000000000000000000
          Height = 22.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[SUM(<frdNNaklp."F14">)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Top = 376.000000000000000000
        Width = 1046.929810000000000000
        Condition = '<frdNNaklp."F2_DAT">'
      end
      object ReportTitle1: TfrxReportTitle
        Height = 114.000000000000000000
        Top = 16.000000000000000000
        Width = 1046.929810000000000000
        object Memo97: TfrxMemoView
          Top = 96.000000000000000000
          Width = 996.000000000000000000
          Height = 18.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#160#1056#1109#1056#183#1056#1169#1057#8211#1056#187' I. '#1056#1115#1057#8218#1057#1026#1056#1105#1056#1112#1056#176#1056#1029#1057#8249' '#1056#1111#1056#1109#1056#1169#1056#176#1057#8218#1056#1108#1056#1109#1056#1030#1057#8211' '#1056#1029#1056#176#1056#1108#1056#187#1056#176#1056#1169 +
              #1056#1029#1057#8211)
          ParentFont = False
        end
        object Memo98: TfrxMemoView
          Top = 28.000000000000000000
          Width = 996.000000000000000000
          Height = 18.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#160#1056#8226#1056#8222#1056#1038#1056#1118#1056#160' '#1056#1115#1056#1118#1056#160#1056#152#1056#1114#1056#1106#1056#1116#1056#152#1056#1168' '#1056#1118#1056#1106' '#1056#8217#1056#152#1056#8221#1056#1106#1056#1116#1056#152#1056#1168' '#1056#1119#1056#1115#1056#8221#1056#1106#1056#1118#1056#1113 +
              #1056#1115#1056#8217#1056#152#1056#1168' '#1056#1116#1056#1106#1056#1113#1056#8250#1056#1106#1056#8221#1056#1116#1056#152#1056#1168)
          ParentFont = False
        end
        object Memo99: TfrxMemoView
          Left = 744.000000000000000000
          Width = 252.000000000000000000
          Height = 26.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          HAlign = haRight
          Memo.UTF8 = (
            
              #1056#8212#1056#176#1057#8218#1056#1030#1056#181#1057#1026#1056#1169#1056#182#1056#181#1056#1029#1056#1109' '#1056#1029#1056#176#1056#1108#1056#176#1056#183#1056#1109#1056#1112' '#1056#8221#1056#1119#1056#1106' '#1056#1032#1056#1108#1057#1026#1056#176#1057#8212#1056#1029#1056#1105' '#1056#1030#1057#8211 +
              #1056#1169' 30.06.2005 '#1057#1026'. '#1074#8222#8211' 244')
          ParentFont = False
        end
        object Memo100: TfrxMemoView
          Top = 48.000000000000000000
          Width = 136.000000000000000000
          Height = 14.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#183#1056#1030#1056#176' '#1056#1111#1056#187#1056#176#1057#8218#1056#1029#1056#1105#1056#1108#1056#176' '#1056#1111#1056#1109#1056#1169#1056#176#1057#8218#1056#1108#1057#1107)
          ParentFont = False
        end
        object Memo101: TfrxMemoView
          Top = 64.000000000000000000
          Width = 184.000000000000000000
          Height = 14.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'I'#1056#1029#1056#1169#1056#1105#1056#1030#1057#8211#1056#1169#1057#1107#1056#176#1056#187#1057#1034#1056#1029#1056#1105#1056#8470' '#1056#1111#1056#1109#1056#1169#1056#176#1057#8218#1056#1108#1056#1109#1056#1030#1056#1105#1056#8470' '#1056#1029#1056#1109#1056#1112#1056#181#1057#1026)
          ParentFont = False
        end
        object Memo102: TfrxMemoView
          Top = 80.000000000000000000
          Width = 256.000000000000000000
          Height = 14.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1038#1056#1030#1057#8211#1056#1169#1056#1109#1057#8224#1057#8218#1056#1030#1056#1109' '#1056#1111#1057#1026#1056#1109' '#1057#1026#1056#181#1057#8221#1057#1027#1057#8218#1057#1026#1056#176#1057#8224#1057#8211#1057#1035' '#1056#1111#1056#187#1056#176#1057#8218#1056#1029#1056#1105#1056#1108#1056#176' ' +
              #1056#1111#1056#1109#1056#1169#1056#176#1057#8218#1056#1108#1057#1107' '#1056#1029#1056#176' '#1056#1169#1056#1109#1056#1169#1056#176#1056#1029#1057#1107' '#1056#1030#1056#176#1057#1026#1057#8218#1057#8211#1057#1027#1057#8218#1057#1034)
          ParentFont = False
        end
        object Memo103: TfrxMemoView
          Left = 140.000000000000000000
          Top = 48.000000000000000000
          Width = 480.000000000000000000
          Height = 14.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo104: TfrxMemoView
          Left = 188.000000000000000000
          Top = 64.000000000000000000
          Width = 432.000000000000000000
          Height = 14.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo105: TfrxMemoView
          Left = 260.000000000000000000
          Top = 80.000000000000000000
          Width = 360.000000000000000000
          Height = 14.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo106: TfrxMemoView
          Left = 652.000000000000000000
          Top = 48.000000000000000000
          Width = 136.000000000000000000
          Height = 14.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#160#1056#181#1057#8221#1057#1027#1057#8218#1057#1026' '#1057#1026#1056#1109#1056#183#1056#1111#1056#1109#1057#8225#1056#176#1057#8218#1056#1109)
          ParentFont = False
        end
        object Memo107: TfrxMemoView
          Left = 652.000000000000000000
          Top = 64.000000000000000000
          Width = 136.000000000000000000
          Height = 14.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#160#1056#181#1057#8221#1057#1027#1057#8218#1057#1026' '#1056#183#1056#176#1056#1108#1057#8211#1056#1029#1057#8225#1056#181#1056#1029#1056#1109)
          ParentFont = False
        end
        object Memo108: TfrxMemoView
          Left = 652.000000000000000000
          Top = 80.000000000000000000
          Width = 136.000000000000000000
          Height = 14.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8212#1056#177#1056#181#1057#1026#1057#8211#1056#1110#1056#176#1057#8218#1056#1105)
          ParentFont = False
        end
        object Memo109: TfrxMemoView
          Left = 792.000000000000000000
          Top = 48.000000000000000000
          Width = 204.000000000000000000
          Height = 14.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo110: TfrxMemoView
          Left = 792.000000000000000000
          Top = 64.000000000000000000
          Width = 204.000000000000000000
          Height = 14.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo111: TfrxMemoView
          Left = 792.000000000000000000
          Top = 80.000000000000000000
          Width = 204.000000000000000000
          Height = 14.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
      end
    end
  end
  object sdsNNaklpNexoz: TSQLDataSet
    CommandText = 
      'select '#13#10'  *'#13#10'from '#13#10'  rep_reestr_polych_nnakl3_pc('#13#10'     :id_iz' +
      'g,'#13#10'     :date_from,'#13#10'     :date_to'#13#10'  )'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_izg'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'date_from'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'date_to'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 268
    Top = 68
  end
  object dspNNaklpNexoz: TDataSetProvider
    Tag = 1
    DataSet = sdsNNaklpNexoz
    Options = [poAllowCommandText]
    Left = 268
    Top = 100
  end
  object cdsNNaklpNexoz: TClientDataSet
    Tag = 1
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_izg'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'date_from'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'date_to'
        ParamType = ptInput
      end>
    ProviderName = 'dspNNaklpNexoz'
    Left = 268
    Top = 132
  end
  object dsNNaklpNexoz: TDataSource
    Tag = 1
    DataSet = cdsNNaklpNexoz
    Left = 268
    Top = 164
  end
  object SaveDialog: TSaveDialog
    Left = 112
    Top = 64
  end
  object UnfFilter1: TUnfFilter
    DBGridEh = dbgRep
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
    Left = 144
    Top = 24
  end
end
