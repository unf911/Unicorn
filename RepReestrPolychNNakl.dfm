object frmRepReestrPolychNNakl: TfrmRepReestrPolychNNakl
  Left = 247
  Top = 282
  BorderStyle = bsDialog
  Caption = #1056#1077#1077#1089#1090#1088' '#1087#1086#1083#1091#1095#1077#1085#1085#1099#1093' '#1085#1072#1083#1086#1075#1086#1074#1099#1093' '#1085#1072#1082#1083#1072#1076#1085#1099#1093
  ClientHeight = 184
  ClientWidth = 326
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
    326
    184)
  PixelsPerInch = 96
  TextHeight = 13
  object dbgRasx: TDBGridEh
    Tag = 1
    Left = 8
    Top = 8
    Width = 305
    Height = 105
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
        FieldName = 'F3_DAT_VYPISKI'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'F4_ID'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'F5_VIDDOC'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'F6_IZG'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'F7_IPN'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'F8_SUMWITHNDS'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'F9_BAZANDS'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'F10_NDS'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'F12_NDS'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'F13_BAZANDS'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'F14_NDS'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'F16_NDS'
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
    Action = actBrowse
    Caption = #1055#1088#1086#1089#1084#1086#1090#1088
    TabOrder = 1
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
    object actBrowse: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      OnExecute = actBrowseExecute
    end
  end
  object frRasx: TfrxReport
    Version = '3.23.7'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38985.431979525500000000
    ReportOptions.LastChange = 40593.776335173610000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnGetValue = frRasxGetValue
    Left = 72
    Top = 96
    Datasets = <
      item
        DataSet = frdNnaklp
        DataSetName = 'frdNnaklp'
      end>
    Variables = <>
    Style = <>
  end
  object frdNnaklp: TfrxDBDataset
    UserName = 'frdNnaklp'
    CloseDataSource = False
    FieldAliases.Strings = (
      'F1_NPP=F1_NPP'
      'F2_DAT=F2_DAT'
      'F3_DAT_VYPISKI=F3_DAT_VYPISKI'
      'F4_ID=F4_ID'
      'F5_VIDDOC=F5_VIDDOC'
      'F6_IZG=F6_IZG'
      'F7_IPN=F7_IPN'
      'F8_SUMWITHNDS=F8_SUMWITHNDS'
      'F9_BAZANDS=F9_BAZANDS'
      'F10_NDS=F10_NDS'
      'F12_NDS=F12_NDS'
      'F13_BAZANDS=F13_BAZANDS'
      'F14_NDS=F14_NDS'
      'F16_NDS=F16_NDS'
      'TIP=TIP')
    DataSet = cdsRasx
    Left = 72
    Top = 64
  end
  object sdsRasx: TSQLDataSet
    CommandText = 
      'select '#13#10'  *'#13#10'from '#13#10'  rep_reestr_polych_nnakl_pc('#13#10'     :id_zak' +
      ','#13#10'     :date_from,'#13#10'     :date_to'#13#10'  )'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_zak'
        ParamType = ptInput
        Value = 1264
      end
      item
        DataType = ftDate
        Name = 'date_from'
        ParamType = ptInput
        Value = 38353d
      end
      item
        DataType = ftDate
        Name = 'date_to'
        ParamType = ptInput
        Value = 38718d
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
        Name = 'id_zak'
        ParamType = ptInput
        Value = 1264
      end
      item
        DataType = ftDate
        Name = 'date_from'
        ParamType = ptInput
        Value = 38353d
      end
      item
        DataType = ftDate
        Name = 'date_to'
        ParamType = ptInput
        Value = 38718d
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
    object cdsRasxF3_DAT_VYPISKI: TSQLTimeStampField
      FieldName = 'F3_DAT_VYPISKI'
    end
    object cdsRasxF4_ID: TStringField
      FieldName = 'F4_ID'
      Size = 30
    end
    object cdsRasxF5_VIDDOC: TStringField
      FieldName = 'F5_VIDDOC'
    end
    object cdsRasxF53_VIDDOC: TStringField
      FieldName = 'F53_VIDDOC'
      Size = 1
    end
    object cdsRasxF6_IZG: TStringField
      FieldName = 'F6_IZG'
      Size = 250
    end
    object cdsRasxF7_IPN: TStringField
      FieldName = 'F7_IPN'
      Size = 12
    end
    object cdsRasxF8_SUMWITHNDS: TFMTBCDField
      FieldName = 'F8_SUMWITHNDS'
      Precision = 15
    end
    object cdsRasxF9_BAZANDS: TFMTBCDField
      FieldName = 'F9_BAZANDS'
      Precision = 15
    end
    object cdsRasxF10_NDS: TFMTBCDField
      FieldName = 'F10_NDS'
      Precision = 15
    end
    object cdsRasxF11: TFMTBCDField
      FieldName = 'F11'
      Precision = 15
    end
    object cdsRasxF12_NDS: TFMTBCDField
      FieldName = 'F12_NDS'
      Precision = 15
    end
    object cdsRasxF13_BAZANDS: TFMTBCDField
      FieldName = 'F13_BAZANDS'
      Precision = 15
    end
    object cdsRasxF14_NDS: TFMTBCDField
      FieldName = 'F14_NDS'
      Precision = 15
    end
    object cdsRasxF15: TFMTBCDField
      FieldName = 'F15'
      Precision = 15
    end
    object cdsRasxF16_NDS: TFMTBCDField
      FieldName = 'F16_NDS'
      Precision = 15
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
end
