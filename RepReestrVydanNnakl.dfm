object frmRepReestrVydanNnakl: TfrmRepReestrVydanNnakl
  Left = 288
  Top = 407
  BorderStyle = bsDialog
  Caption = #1056#1077#1077#1089#1090#1088' '#1074#1099#1076#1072#1085#1085#1099#1093' '#1085#1072#1083#1086#1075#1086#1074#1099#1093' '#1085#1072#1082#1083#1072#1076#1085#1099#1093
  ClientHeight = 285
  ClientWidth = 383
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
    383
    285)
  PixelsPerInch = 96
  TextHeight = 13
  object dbgRep: TDBGridEh
    Tag = 1
    Left = 12
    Top = 4
    Width = 365
    Height = 165
    AllowedOperations = []
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsRasx
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
    TabOrder = 0
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
        FieldName = 'F2_DAT'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'F3_ID'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'F4_VIDDOC'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'F5_ZAK'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'F6_IPN'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'F7_SUMWITHNDS'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'F8_BAZANDS'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'F9_NDS'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'F11_BEZOBLOGENIYA'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'F12_BAZANDSEXPORT'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'TIP'
        Footers = <>
      end>
  end
  object BitBtn5: TBitBtn
    Left = 106
    Top = 56
    Width = 113
    Height = 57
    Action = actSettings
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
    TabOrder = 1
  end
  object Button1: TButton
    Left = 244
    Top = 140
    Width = 75
    Height = 25
    Caption = #1058#1077#1089#1090
    TabOrder = 2
    Visible = False
    OnClick = Button1Click
  end
  object BitBtn1: TBitBtn
    Left = 110
    Top = 124
    Width = 113
    Height = 57
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
    TabOrder = 3
    Visible = False
  end
  object Button2: TButton
    Left = 232
    Top = 56
    Width = 113
    Height = 57
    Action = actGenerateXml
    TabOrder = 4
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
    object actGenerateXml: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100' Xml'
      OnExecute = actGenerateXmlExecute
    end
    object actRefresh: TAction
      Caption = 'actRefresh'
      OnExecute = actRefreshExecute
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
    ReportOptions.LastChange = 40676.935645428240000000
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
      'select '#13#10'  *'#13#10'from '#13#10'  REP_REESTR_VYDAN_NNAKL_PC('#13#10'     :id_izg,' +
      #13#10'     :date_from,'#13#10'     :date_to'#13#10'  )'
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
    object cdsRasxF1_NPP: TIntegerField
      FieldName = 'F1_NPP'
    end
    object cdsRasxF2_DAT: TSQLTimeStampField
      FieldName = 'F2_DAT'
    end
    object cdsRasxF3_ID: TStringField
      DisplayWidth = 20
      FieldName = 'F3_ID'
      Size = 30
    end
    object cdsRasxF4_VIDDOC: TStringField
      FieldName = 'F4_VIDDOC'
    end
    object cdsRasxF5_ZAK: TStringField
      FieldName = 'F5_ZAK'
      Size = 250
    end
    object cdsRasxF6_IPN: TStringField
      FieldName = 'F6_IPN'
      Size = 12
    end
    object cdsRasxF7_SUMWITHNDS: TFMTBCDField
      FieldName = 'F7_SUMWITHNDS'
      Precision = 15
      Size = 4
    end
    object cdsRasxF8_BAZANDS: TFMTBCDField
      FieldName = 'F8_BAZANDS'
      Precision = 15
      Size = 4
    end
    object cdsRasxF9_NDS: TFMTBCDField
      FieldName = 'F9_NDS'
      Precision = 15
      Size = 4
    end
    object cdsRasxF11_BEZOBLOGENIYA: TFMTBCDField
      FieldName = 'F11_BEZOBLOGENIYA'
      Precision = 15
      Size = 4
    end
    object cdsRasxF12_BAZANDSEXPORT: TFMTBCDField
      FieldName = 'F12_BAZANDSEXPORT'
      Precision = 15
      Size = 4
    end
    object cdsRasxTIP: TIntegerField
      FieldName = 'TIP'
    end
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
  object XMLDocument1: TXMLDocument
    Left = 260
    Top = 108
    DOMVendorDesc = 'MSXML'
  end
  object frdNNaklp: TfrxDBDataset
    UserName = 'frdNNaklp'
    CloseDataSource = False
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
    ReportOptions.LastChange = 40215.629990405090000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    Left = 324
    Top = 96
    Datasets = <
      item
        DataSet = frdNNaklp
        DataSetName = 'frdNNaklp'
      end>
    Variables = <>
    Style = <>
  end
  object SaveDialog: TSaveDialog
    Left = 112
    Top = 64
  end
end
