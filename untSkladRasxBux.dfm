object frmSkladRasxBux: TfrmSkladRasxBux
  Left = 344
  Top = 205
  BorderStyle = bsDialog
  Caption = #1054#1090#1095#1105#1090' '#1087#1086' '#1088#1072#1089#1093#1086#1076#1091' '#1089#1086' '#1089#1082#1083#1072#1076#1072' ('#1073#1091#1093')'
  ClientHeight = 404
  ClientWidth = 568
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
  PixelsPerInch = 96
  TextHeight = 13
  object udgRasx: TDBGridEh
    Left = 0
    Top = 39
    Width = 568
    Height = 365
    Align = alClient
    AllowedOperations = []
    DataSource = dsRasx
    EditActions = [geaCopyEh, geaSelectAllEh]
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 2
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghRowHighlight]
    SortLocal = True
    SumList.Active = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = udgRasxDblClick
    OnKeyUp = udgRasxKeyUp
    Columns = <
      item
        EditButtons = <>
        FieldName = 'TOVAR'
        Footer.ValueType = fvtCount
        Footers = <
          item
            Color = clInfoBk
            Value = #1042#1089#1077#1075#1086' '#1087#1086#1079#1080#1094#1080#1081
            ValueType = fvtStaticText
          end
          item
            Color = clInfoBk
            ValueType = fvtCount
          end>
        Width = 219
      end
      item
        EditButtons = <>
        FieldName = 'KOLOTP'
        Footer.ValueType = fvtSum
        Footers = <
          item
            Color = clInfoBk
            Value = #1054#1073#1097#1072#1103' '#1076#1083#1080#1085#1072
            ValueType = fvtStaticText
          end
          item
            Color = clInfoBk
            ValueType = fvtSum
          end>
        Width = 75
      end
      item
        EditButtons = <>
        FieldName = 'SUM'
        Footer.Color = clInfoBk
        Footer.ValueType = fvtSum
        Footers = <
          item
            Color = clInfoBk
            Value = #1054#1073#1097#1072#1103' '#1089#1091#1084#1084#1072
            ValueType = fvtStaticText
          end
          item
            Color = clInfoBk
            ValueType = fvtSum
          end>
      end>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 568
    Height = 39
    Align = alTop
    TabOrder = 1
    object BitBtn5: TBitBtn
      Left = 4
      Top = 9
      Width = 97
      Height = 25
      Action = actRefresh
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 0
      Kind = bkRetry
    end
    object BitBtn6: TBitBtn
      Left = 112
      Top = 9
      Width = 93
      Height = 25
      Action = actDetail
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      TabOrder = 1
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8400
        00840000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF840000C6C6C6840000840000FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000C6C6C68400
        00840000840000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF840000C6C6C6840000840000840000FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF000000000000000000000000840000C6C6C68400008400008400
        00FF00FFFF00FFFF00FFFF00FFFF00FF000000000000C6C6C6C6C6C6C6C6C6FF
        FFFF848484840000840000840000FF00FFFF00FFFF00FFFF00FFFF00FF000000
        848484C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6FFFFFF848484000000FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
        C6C6C6C6C6FFFFFF000000FF00FFFF00FFFF00FFFF00FFFF00FF000000C6C6C6
        C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6000000FF00
        FFFF00FFFF00FFFF00FF000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
        C6C6C6C6C6C6C6C6C6C6C6000000FF00FFFF00FFFF00FFFF00FF000000C6C6C6
        FFFFFFFFFF00C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6000000FF00
        FFFF00FFFF00FFFF00FF000000C6C6C6FFFFFFFFFF00C6C6C6C6C6C6C6C6C6C6
        C6C6C6C6C6C6C6C6C6C6C6000000FF00FFFF00FFFF00FFFF00FFFF00FF000000
        FFFFFFFFFFFFFFFF00FFFF00C6C6C6C6C6C6C6C6C6C6C6C6000000FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF000000848484FFFFFFFFFFFFFFFFFFC6C6C6C6
        C6C6C6C6C6848484000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        000000000000C6C6C6C6C6C6C6C6C6C6C6C6000000000000FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00000000000000000000
        0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object BitBtn7: TBitBtn
      Left = 308
      Top = 9
      Width = 85
      Height = 25
      Action = actSettings
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      TabOrder = 2
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF0000FF00FFFF00FFFF00FFFF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF0000FF00FFFF0000FF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF0000FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF0000FF0000FF00FF
        FF00FFFF00FFFF00FFFF00FFFF0000FF00FFFF00FFFF0000FF00FFFF00FFFF00
        FFFF00FFFF00FFFF0000FF0000FF00FFFF00FFFF00FFFF0000FF0000FF00FFFF
        00FFFF00FFFF00FFFF0000FF0000FF00FFFF00FFFF00FFFF0000FF0000FF00FF
        FF0000FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        00FF0000FF00FFFF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00FF
        FF0000FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        00FF0000FF00FFFF0000FF0000FF00FFFF00FFFF00FFFF0000FF0000FF00FFFF
        00FFFF00FFFF00FFFF0000FF0000FF00FFFF00FFFF00FFFF0000FF0000FF00FF
        FF00FFFF00FFFF00FFFF00FFFF0000FF00FFFF00FFFF0000FF00FFFF00FFFF00
        FFFF00FFFF00FFFF0000FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF0000FF0000FF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF0000FF00FFFF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF0000FF00FFFF00FFFF00FF
        FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object BitBtn3: TBitBtn
      Left = 212
      Top = 9
      Width = 89
      Height = 25
      Action = actPreview
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      TabOrder = 3
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF00000000000000000000000000000000
        0000000000000000000000000000000000FF00FFFF00FFFF00FFFF00FF000000
        C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6000000C6C6
        C6000000FF00FFFF00FF00000000000000000000000000000000000000000000
        0000000000000000000000000000000000C6C6C6000000FF00FF000000C6C6C6
        C6C6C6C6C6C6C6C6C6C6C6C6C6C6C600FFFF00FFFF00FFFFC6C6C6C6C6C60000
        00000000000000FF00FF000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C684
        8484848484848484C6C6C6C6C6C6000000C6C6C6000000FF00FF000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00C6C6C6C6C6C6000000000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
        C6C6C6C6C6C6C6C6C6C6C6000000C6C6C6000000C6C6C6000000FF00FF000000
        000000000000000000000000000000000000000000000000000000C6C6C60000
        00C6C6C6000000000000FF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF000000C6C6C6000000C6C6C6000000FF00FFFF00FF
        FF00FF000000FFFFFF000000000000000000000000000000FFFFFF0000000000
        00000000000000FF00FFFF00FFFF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF000000FFFFFF000000000000000000000000000000FFFFFF0000
        00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0000000000000000000000000000000000000000000000
        00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
  end
  object ActionList1: TActionList
    Left = 72
    Top = 128
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ShortCut = 116
      OnExecute = actRefreshExecute
    end
    object actItogo: TAction
      Caption = #1048#1090#1086#1075#1086
      OnExecute = actItogoExecute
    end
    object actPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      ShortCut = 123
      Visible = False
      OnExecute = actPrintExecute
    end
    object actPreview: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      ShortCut = 16471
      OnExecute = actPreviewExecute
    end
    object actDetail: TAction
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      ShortCut = 120
      OnExecute = actDetailExecute
    end
    object actWithoutTara: TAction
      Caption = #1041#1077#1079' '#1090#1072#1088#1099
      Checked = True
    end
    object actSettings: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      OnExecute = actSettingsExecute
    end
  end
  object MainMenu1: TMainMenu
    Left = 104
    Top = 128
    object mnuActions: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      GroupIndex = 10
      object N1: TMenuItem
        Action = actPreview
      end
      object N2: TMenuItem
        Action = actPrint
      end
      object N3: TMenuItem
        Action = actDetail
      end
    end
  end
  object qeRasx: TQueryExtender
    Query = qurRasx
    KeyField = 'tovar'
    Left = 40
    Top = 192
  end
  object dsRasx: TDataSource
    DataSet = qurRasx
    Left = 40
    Top = 160
  end
  object frRasx: TfrxReport
    Version = '3.23.7'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38985.432248078700000000
    ReportOptions.LastChange = 38985.710414490750000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnBeginDoc = frRasxBeginDoc
    OnEndDoc = frRasxEndDoc
    OnGetValue = frRasxGetValue
    Left = 136
    Top = 128
    Datasets = <
      item
        DataSet = frdRasx
        DataSetName = 'frdRasx'
      end>
    Variables = <
      item
        Name = ' All vars'
        Value = Null
      end
      item
        Name = 'TotalSum'
        Value = Null
      end
      item
        Name = 'Title'
        Value = Null
      end
      item
        Name = '  '
        Value = Null
      end>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Columns = 2
      ColumnWidth = 95.000000000000000000
      ColumnPositions.Strings = (
        '0'
        '95')
      Bin = 65535
      BinOtherPages = 65535
      object ReportTitle1: TfrxReportTitle
        Height = 92.000000000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo18: TfrxMemoView
          Left = -1.000000000000000000
          Top = 1.000000000000000000
          Width = 677.000000000000000000
          Height = 63.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[Title]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 312.000000000000000000
          Top = 69.000000000000000000
          Width = 124.000000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[TotalSum]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 129.000000000000000000
          Top = 69.000000000000000000
          Width = 183.000000000000000000
          Height = 17.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            #1056#1115#1056#177#1057#8240#1056#176#1057#1039' '#1056#1169#1056#187#1056#1105#1056#1029#1056#176' :')
          ParentFont = False
        end
      end
      object MasterHeader1: TfrxHeader
        Height = 15.000000000000000000
        Top = 170.078850000000000000
        Width = 718.110700000000000000
        ReprintOnNewPage = True
        Stretched = True
        object Memo2: TfrxMemoView
          Left = -2.000000000000000000
          Width = 245.000000000000000000
          Height = 15.000000000000000000
          StretchMode = smMaxHeight
          Color = clTeal
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#1113#1056#176#1056#177#1056#181#1056#187#1057#1034)
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 243.000000000000000000
          Width = 95.000000000000000000
          Height = 15.000000000000000000
          StretchMode = smMaxHeight
          Color = clTeal
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109)
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 15.000000000000000000
        Top = 207.874150000000000000
        Width = 718.110700000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        RowCount = 0
        object Memo10: TfrxMemoView
          Left = -2.000000000000000000
          Width = 245.000000000000000000
          Height = 15.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frdRasx."TOVAR"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 243.000000000000000000
          Width = 95.000000000000000000
          Height = 15.000000000000000000
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
          Memo.UTF8 = (
            '[frdRasx."KOLOTP"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 10.000000000000000000
        Top = 347.716760000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 225.000000000000000000
          Width = 416.000000000000000000
          Height = 10.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Title]                 [PAGE#] '#1056#1105#1056#183' [TOTALPAGES]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 40.000000000000000000
        Top = 283.464750000000000000
        Width = 718.110700000000000000
      end
    end
  end
  object frdRasx: TfrxDBDataset
    UserName = 'frdRasx'
    CloseDataSource = False
    DataSource = dsRasx
    Left = 136
    Top = 160
  end
  object sdsRasx: TSQLDataSet
    CommandText = 
      'select '#13#10'  (select t2.name from objects t2 where t2.oid=t.id_tov' +
      'ar) as tovar,  '#13#10'  t.id_tovar,'#13#10'  sum(t.kolotp) as kolotp,'#13#10'  su' +
      'm(Round(Round(t.cena*n.kurs,2)*t.kolotp*(1+n.nalog_nds),2))'#13#10'fro' +
      'm'#13#10'  naklo n join naklot  t'#13#10'  on n.id_nakl=t.id_nakl'#13#10'where'#13#10'  ' +
      'n.posted=1'#13#10'group by'#13#10'  t.id_tovar'#13#10'order by'#13#10'  1'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 40
    Top = 64
  end
  object dspRasx: TDataSetProvider
    DataSet = sdsRasx
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 40
    Top = 96
  end
  object qurRasx: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRasx'
    Left = 40
    Top = 128
    object qurRasxTOVAR: TStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      FieldName = 'TOVAR'
      Size = 44
    end
    object qurRasxID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
      Visible = False
    end
    object qurRasxKOLOTP2: TFMTBCDField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'KOLOTP'
      DisplayFormat = '0.000'
    end
    object qurRasxSUM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUM'
      DisplayFormat = '0.00'
    end
  end
  object UnfFilter1: TUnfFilter
    DBGridEh = udgRasx
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
    Left = 40
    Top = 224
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmSkladRasxBux'
    StorageManager = rpsClientEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      'udgRasx.<P>.Columns.<ForAllItems>.Width')
    Left = 168
    Top = 160
  end
  object rpsClientEdit: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 168
    Top = 128
  end
end
