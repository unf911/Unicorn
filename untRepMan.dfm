object frmRepMan: TfrmRepMan
  Left = 800
  Top = 428
  Anchors = [akLeft, akTop, akBottom]
  BorderStyle = bsDialog
  Caption = #1054#1090#1095#1105#1090' '#1087#1086' '#1084#1077#1085#1077#1076#1078#1077#1088#1072#1084
  ClientHeight = 396
  ClientWidth = 632
  Color = clBtnFace
  Constraints.MinHeight = 442
  Constraints.MinWidth = 160
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDefault
  Scaled = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    632
    396)
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 373
    Width = 632
    Height = 23
    Panels = <>
  end
  object btnSettings: TBitBtn
    Left = 8
    Top = 10
    Width = 65
    Height = 23
    Action = actSettings
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object btnPreview: TBitBtn
    Left = 83
    Top = 10
    Width = 70
    Height = 23
    Action = actPreview
    Caption = #1055#1088#1086#1089#1084#1086#1090#1088
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 160
    Top = 10
    Width = 57
    Height = 23
    Action = actRefresh
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100
    TabOrder = 3
  end
  object BitBtn2: TBitBtn
    Left = 224
    Top = 10
    Width = 65
    Height = 23
    Action = actRealPrice
    Caption = #1060#1072#1082#1090' '#1094#1077#1085#1099
    TabOrder = 4
  end
  object DBGridEh1: TDBGridEh
    Left = 8
    Top = 40
    Width = 614
    Height = 166
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dtSource2
    Flat = False
    FooterColor = clInfoBk
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghRowHighlight]
    ReadOnly = True
    SortLocal = True
    SumList.Active = True
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGridEh1DblClick
    OnKeyUp = DBGridEh1KeyUp
    Columns = <
      item
        EditButtons = <>
        FieldName = 'DAT'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'ID'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'IZG'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'ZAK'
        Footer.Value = #1042#1089#1077#1075#1086' '#1079#1072#1087#1080#1089#1077#1081
        Footer.ValueType = fvtStaticText
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'MANAGER'
        Footer.ValueType = fvtCount
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'NDS'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'TARA'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'OTKAT'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'MAX_PREM'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'OPLACH'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'PERC_OPLACH'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'OPLACH_ZA_PERIOD'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.TitleButton = True
        Width = 72
      end
      item
        EditButtons = <>
        FieldName = 'MAX_PREM_OPL'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'VYPL_PREM'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'PREMIYA'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.TitleButton = True
      end>
  end
  object DBGridEh2: TDBGridEh
    Left = 8
    Top = 213
    Width = 614
    Height = 153
    Anchors = [akLeft, akRight, akBottom]
    DataSource = dtSource3
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    ReadOnly = True
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object BitBtn3: TBitBtn
    Left = 376
    Top = 10
    Width = 97
    Height = 23
    Action = actPremiyaVypl
    Caption = #1042#1099#1087#1083#1072#1090#1072' '#1087#1088#1077#1084#1080#1080
    TabOrder = 7
  end
  object BitBtn4: TBitBtn
    Left = 296
    Top = 10
    Width = 65
    Height = 23
    Action = actPrixDet
    Caption = #1054#1087#1083#1072#1090#1099
    TabOrder = 8
  end
  object ActionList1: TActionList
    Left = 128
    Top = 88
    object actSettings: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      ShortCut = 16467
      OnExecute = actSettingsExecute
    end
    object actPrepareReport: TAction
      Caption = #1055#1086#1076#1075#1086#1090#1086#1074#1080#1090#1100' '#1086#1090#1095#1105#1090
    end
    object actSumsRecalc: TAction
      Caption = #1055#1077#1088#1077#1089#1095#1105#1090
    end
    object actPrint: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088' ('#1082#1088#1072#1090#1082#1086')'
      Hint = #1055#1077#1095#1072#1090#1100' '#1086#1090#1095#1105#1090#1072' (F12)'
      OnExecute = actPrintExecute
    end
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnExecute = actRefreshExecute
    end
    object actPreview: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      Hint = #1055#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1099#1081' '#1087#1088#1086#1089#1084#1086#1090#1088' '#1086#1090#1095#1105#1090#1072' (Ctrl+W) '
      ShortCut = 16471
      OnExecute = actPreviewExecute
    end
    object actRealPrice: TAction
      Caption = #1060#1072#1082#1090' '#1094#1077#1085#1099
      OnExecute = actRealPriceExecute
    end
    object actPremiyaVypl: TAction
      Caption = #1042#1099#1087#1083#1072#1090#1072' '#1087#1088#1077#1084#1080#1080
      OnExecute = actPremiyaVyplExecute
    end
    object actPrixDet: TAction
      Caption = #1054#1087#1083#1072#1090#1099
      OnExecute = actPrixDetExecute
    end
  end
  object dtSource2: TDataSource
    DataSet = cdsQuery1
    Left = 272
    Top = 192
  end
  object qeQuery2: TQueryExtender
    Query = cdsQuery1
    KeyField = 'id_nakl'
    Left = 32
    Top = 88
  end
  object dtSource3: TDataSource
    DataSet = cdsQuery2
    Left = 304
    Top = 192
  end
  object qeQuery3: TQueryExtender
    DefSql = 
      'select'#13#10'a.npp,a.tovar,a.kolotp,'#13#10'Round('#13#10'  Round(a.cena,2)*dif(a' +
      '.tara-1,n.kurs,1) ,'#13#10'  2'#13#10') as cena,'#13#10'a.nakl,'#13#10'Round(a.kolotp*'#13#10 +
      '  Round('#13#10'    Round(a.cena,2)*dif(a.tara-1,n.kurs,1) ,'#13#10'    2'#13#10' ' +
      ' ),'#13#10'  2'#13#10') as suma2,'#13#10'Round('#13#10'  ('#13#10'    (Round(a.cena,2)-Round(a' +
      '.cena_fact,2))'#13#10'    *'#13#10'    dif(a.tara-1,n.kurs_fact,1)'#13#10'   )'#13#10'  ' +
      '*'#13#10'  a.kolotp,2'#13#10') as otkat,'#13#10#13#10'Round('#13#10'  Round(a.cena_fact,2)*d' +
      'if(a.tara-1,n.kurs_fact,1) ,'#13#10'  2'#13#10') as cena_fact,'#13#10'a.skidka_fac' +
      't'#13#10'from '#13#10'  naklrt a inner join naklr n on n.nakl=a.nakl'#13#10'where ' +
      #13#10'  a.nakl=:nakl and'#13#10'  bitand(a.tip,2)=2'#13#10'order by npp'#13#10
    KeyField = 'npp'
    Left = 64
    Top = 88
  end
  object frDBNaklo: TfrxDBDataset
    UserName = 'frDBNaklo'
    CloseDataSource = False
    DataSource = dtSource2
    Left = 32
    Top = 120
  end
  object frDBOplaty: TfrxDBDataset
    UserName = 'frDBOplaty'
    CloseDataSource = False
    DataSource = dtOplaty
    Left = 96
    Top = 120
  end
  object frDBNaklot: TfrxDBDataset
    UserName = 'frDBNaklot'
    CloseDataSource = False
    DataSource = dtSource3
    Left = 64
    Top = 120
  end
  object dtOplaty: TDataSource
    DataSet = cdsQuery3
    Left = 336
    Top = 192
  end
  object frReport1: TfrxReport
    Version = '3.23.7'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38989.722892465310000000
    ReportOptions.LastChange = 39142.691239178240000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnBeginDoc = frReport1BeginDoc
    OnGetValue = frReport1GetValue
    Left = 32
    Top = 160
    Datasets = <
      item
        DataSet = frDBNaklo
        DataSetName = 'frDBNaklo'
      end
      item
        DataSet = frDBNaklot
        DataSetName = 'frDBNaklot'
      end
      item
        DataSet = frDBOplaty
        DataSetName = 'frDBOplaty'
      end>
    Variables = <
      item
        Name = ' All vars'
        Value = Null
      end
      item
        Name = 'Title'
        Value = Null
      end
      item
        Name = 'TotalNds'
        Value = Null
      end
      item
        Name = 'TotalOpl'
        Value = Null
      end
      item
        Name = 'TotalPrem'
        Value = Null
      end
      item
        Name = 'FactPrem'
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
      Columns = 1
      ColumnWidth = 190.000000000000000000
      ColumnPositions.Strings = (
        '0')
      Bin = 65535
      BinOtherPages = 65535
      object MasterData2: TfrxMasterData
        Height = 15.000000000000000000
        Top = 154.960730000000000000
        Width = 718.110700000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        DataSet = frDBNaklo
        DataSetName = 'frDBNaklo'
        RowCount = 0
        object Memo30: TfrxMemoView
          Left = 314.000000000000000000
          Width = 56.000000000000000000
          Height = 15.000000000000000000
          Color = clWhite
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frDBNaklo."OTKAT"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 31.000000000000000000
          Width = 76.000000000000000000
          Height = 15.000000000000000000
          Color = clWhite
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frDBNaklo."IZG"]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 107.000000000000000000
          Width = 140.000000000000000000
          Height = 15.000000000000000000
          Color = clWhite
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frDBNaklo."ZAK"]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Width = 31.000000000000000000
          Height = 15.000000000000000000
          Color = clWhite
          DisplayFormat.FormatStr = 'dd.mm'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frDBNaklo."DAT"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 247.000000000000000000
          Width = 67.000000000000000000
          Height = 15.000000000000000000
          Color = clWhite
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frDBNaklo."NDS"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 370.000000000000000000
          Width = 56.000000000000000000
          Height = 15.000000000000000000
          Color = clWhite
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frDBNaklo."TARA"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 553.000000000000000000
          Width = 66.000000000000000000
          Height = 15.000000000000000000
          Color = clWhite
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frDBNaklo."OPLACH"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 619.000000000000000000
          Width = 67.000000000000000000
          Height = 15.000000000000000000
          Color = clWhite
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frDBNaklo."PREMIYA"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 426.000000000000000000
          Width = 127.000000000000000000
          Height = 15.000000000000000000
          Color = clWhite
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frDBNaklo."COMMENT"]')
          ParentFont = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 36.000000000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Title: TfrxMemoView
          Top = 2.000000000000000000
          Width = 687.779530000000000000
          Height = 30.000000000000000000
          StretchMode = smMaxHeight
          Color = clTeal
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clNone
          Memo.UTF8 = (
            '[Title]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 15.000000000000000000
        Top = 79.370130000000000000
        Width = 718.110700000000000000
        object Memo45: TfrxMemoView
          Left = 31.000000000000000000
          Top = 0.000000000000014211
          Width = 76.000000000000000000
          Height = 15.000000000000000000
          Color = clWhite
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#1115#1057#8218#1056#1111#1057#1026#1056#176#1056#1030#1056#1105#1057#8218#1056#181#1056#187#1057#1034)
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 107.000000000000000000
          Top = 0.000000000000014211
          Width = 140.000000000000000000
          Height = 15.000000000000000000
          Color = clWhite
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#1108#1057#1107#1056#1111#1056#176#1057#8218#1056#181#1056#187#1057#1034)
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 247.000000000000000000
          Top = 0.000000000000014211
          Width = 67.000000000000000000
          Height = 15.000000000000000000
          Color = clWhite
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176' '#1056#1029#1056#176#1056#1108#1056#187)
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 370.000000000000000000
          Top = 0.000000000000014211
          Width = 56.000000000000000000
          Height = 15.000000000000000000
          Color = clWhite
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1118#1056#176#1057#1026#1056#176)
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 314.000000000000000000
          Top = 0.000000000000014211
          Width = 56.000000000000000000
          Height = 15.000000000000000000
          Color = clWhite
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1115#1057#8218#1056#1108#1056#176#1057#8218)
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 619.000000000000000000
          Top = 0.000000000000014211
          Width = 67.000000000000000000
          Height = 15.000000000000000000
          Color = clWhite
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#164#1056#176#1056#1108#1057#8218' '#1056#1111#1057#1026#1056#181#1056#1112)
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 553.000000000000000000
          Top = 0.000000000000014211
          Width = 66.000000000000000000
          Height = 15.000000000000000000
          Color = clWhite
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1115#1056#1111#1056#187#1056#176#1057#8225#1056#181#1056#1029#1056#1109)
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Width = 31.000000000000000000
          Height = 15.000000000000000000
          Color = clWhite
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 426.000000000000000000
          Top = 0.000000000000014211
          Width = 127.000000000000000000
          Height = 15.000000000000000000
          Color = clWhite
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1112#1056#1112#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#8470)
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 28.000000000000000000
        Top = 294.803340000000000000
        Width = 718.110700000000000000
        object Memo9: TfrxMemoView
          Left = 194.000000000000000000
          Top = 12.000000000000000000
          Width = 380.000000000000000000
          Height = 15.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clNone
          HAlign = haRight
          Memo.UTF8 = (
            '[Title]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 590.000000000000000000
          Top = 12.000000000000000000
          Width = 88.000000000000000000
          Height = 15.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clNone
          HAlign = haRight
          Memo.UTF8 = (
            #1057#1027#1057#8218#1057#1026' [PAGE#]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 40.000000000000000000
        Top = 230.551330000000000000
        Width = 718.110700000000000000
        object Memo44: TfrxMemoView
          Width = 687.779530000000000000
          Height = 40.000000000000000000
          Color = clTeal
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clNone
          ParentFont = False
        end
        object Line3: TfrxLineView
          Left = 614.000000000000000000
          Top = 4.000000000000000000
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Memo19: TfrxMemoView
          Left = 46.000000000000000000
          Width = 67.000000000000000000
          Height = 15.000000000000000000
          Color = clWhite
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176' '#1056#1029#1056#176#1056#1108#1056#187)
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 181.000000000000000000
          Width = 56.000000000000000000
          Height = 15.000000000000000000
          Color = clWhite
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1118#1056#176#1057#1026#1056#176)
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Left = 113.000000000000000000
          Width = 68.000000000000000000
          Height = 15.000000000000000000
          Color = clWhite
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1115#1057#8218#1056#1108#1056#176#1057#8218)
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          Left = 237.000000000000000000
          Width = 68.000000000000000000
          Height = 15.000000000000000000
          Color = clWhite
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8217#1057#1027#1057#1039' '#1056#1111#1057#1026#1056#181#1056#1112#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          Left = 616.000000000000000000
          Width = 67.000000000000000000
          Height = 15.000000000000000000
          Color = clWhite
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#164#1056#176#1056#1108#1057#8218' '#1056#1111#1057#1026#1056#181#1056#1112)
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Left = 305.000000000000000000
          Width = 67.000000000000000000
          Height = 15.000000000000000000
          Color = clWhite
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1115#1056#1111#1056#187#1056#176#1057#8225#1056#181#1056#1029#1056#1109)
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Left = 616.000000000000000000
          Top = 19.000000000000000000
          Width = 67.000000000000000000
          Height = 15.000000000000000000
          Color = clWhite
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frDBNaklo."PREMIYA">,MasterData2)]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = -1.000000000000000000
          Width = 47.000000000000000000
          Height = 15.000000000000000000
          Color = clWhite
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8212#1056#176#1056#1111#1056#1105#1057#1027#1056#181#1056#8470)
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          Left = -1.000000000000000000
          Top = 19.000000000000000000
          Width = 47.000000000000000000
          Height = 15.000000000000000000
          Color = clWhite
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[COUNT(MasterData2)]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 46.000000000000000000
          Top = 19.000000000000000000
          Width = 67.000000000000000000
          Height = 15.000000000000000000
          Color = clWhite
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frDBNaklo."NDS">,MasterData2)]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 113.000000000000000000
          Top = 19.000000000000000000
          Width = 68.000000000000000000
          Height = 15.000000000000000000
          Color = clWhite
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frDBNaklo."OTKAT">,MasterData2)]')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 181.000000000000000000
          Top = 19.000000000000000000
          Width = 56.000000000000000000
          Height = 15.000000000000000000
          Color = clWhite
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frDBNaklo."TARA">,MasterData2)]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 237.000000000000000000
          Top = 19.000000000000000000
          Width = 68.000000000000000000
          Height = 15.000000000000000000
          Color = clWhite
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frDBNaklo."MAX_PREM">,MasterData2)]')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 477.000000000000000000
          Width = 68.000000000000000000
          Height = 15.000000000000000000
          Color = clWhite
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1115#1056#1111#1056#187' '#1056#1111#1057#1026#1056#181#1056#1112#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 477.000000000000000000
          Top = 19.000000000000000000
          Width = 68.000000000000000000
          Height = 15.000000000000000000
          Color = clWhite
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frDBNaklo."MAX_PREM_OPL">,MasterData2)]')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 305.000000000000000000
          Top = 19.000000000000000000
          Width = 67.000000000000000000
          Height = 15.000000000000000000
          Color = clWhite
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frDBNaklo."OPLACH">,MasterData2)]')
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          Left = 372.000000000000000000
          Width = 35.000000000000000000
          Height = 15.000000000000000000
          Color = clWhite
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '% '#1056#1109#1056#1111#1056#187)
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          Left = 372.000000000000000000
          Top = 19.000000000000000000
          Width = 35.000000000000000000
          Height = 15.000000000000000000
          Color = clWhite
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
            
              '[sum(<frDBNaklo."OPLACH">,MasterData2)/sum(<frDBNaklo."NDS">,Mas' +
              'terData2)*100]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 544.000000000000000000
          Width = 72.000000000000000000
          Height = 15.000000000000000000
          Color = clWhite
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8217#1057#8249#1056#1111#1056#187' '#1056#1111#1057#1026#1056#181#1056#1112#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 544.000000000000000000
          Top = 19.000000000000000000
          Width = 72.000000000000000000
          Height = 15.000000000000000000
          Color = clWhite
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frDBNaklo."VYPL_PREM">,MasterData2)]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 407.000000000000000000
          Width = 70.000000000000000000
          Height = 15.000000000000000000
          Color = clWhite
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1115#1056#1111#1056#187' '#1056#183#1056#176' '#1056#1111#1056#181#1057#1026#1056#1105#1056#1109#1056#1169)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 407.000000000000000000
          Top = 19.000000000000000000
          Width = 70.000000000000000000
          Height = 15.000000000000000000
          Color = clWhite
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frDBNaklo."OPLACH_ZA_PERIOD">,MasterData2)]')
          ParentFont = False
        end
      end
    end
  end
  object qeOplaty: TQueryExtender
    DefSql = 
      'select * '#13#10'from '#13#10'  oplnakl t inner join oplaty o on t.opl_id=o.' +
      'idi'#13#10'where'#13#10'  t.nakl_id=:nakl'#13#10'order by'#13#10'  o.dat'#13#10
    Left = 96
    Top = 88
  end
  object sdsQuery1: TSQLDataSet
    CommandText = 
      'select *'#13#10'from rep_manager_pc('#13#10'  :date_from,'#13#10'  :date_to,'#13#10'  :i' +
      'd_izg_in,'#13#10'  :id_zak_in,'#13#10'  :id_manager_in)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'date_from'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'date_to'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_izg_in'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_zak_in'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_manager_in'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 272
    Top = 96
    object sdsQuery1DAT: TSQLTimeStampField
      FieldName = 'DAT'
    end
    object sdsQuery1ID: TStringField
      FieldName = 'ID'
    end
    object sdsQuery1ID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
    end
    object sdsQuery1ID_IZG: TIntegerField
      FieldName = 'ID_IZG'
    end
    object sdsQuery1ID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
    end
    object sdsQuery1ID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
    end
    object sdsQuery1NDS: TFloatField
      FieldName = 'NDS'
    end
    object sdsQuery1NDS_FACT: TFloatField
      FieldName = 'NDS_FACT'
    end
    object sdsQuery1TARA: TFloatField
      FieldName = 'TARA'
    end
    object sdsQuery1OTKAT: TFloatField
      FieldName = 'OTKAT'
    end
    object sdsQuery1OPLACH: TFloatField
      FieldName = 'OPLACH'
    end
    object sdsQuery1PERC_OPLACH: TFloatField
      FieldName = 'PERC_OPLACH'
    end
    object sdsQuery1MAX_PREM: TFloatField
      FieldName = 'MAX_PREM'
    end
    object sdsQuery1MAX_PREM_OPL: TFloatField
      FieldName = 'MAX_PREM_OPL'
    end
    object sdsQuery1VYPL_PREM: TFloatField
      FieldName = 'VYPL_PREM'
    end
    object sdsQuery1PREMIYA: TFloatField
      FieldName = 'PREMIYA'
    end
    object sdsQuery1COMMENT: TStringField
      FieldName = 'COMMENT'
      Size = 50
    end
    object sdsQuery1OPLACH_ZA_PERIOD: TFloatField
      FieldName = 'OPLACH_ZA_PERIOD'
    end
  end
  object sdsQuery2: TSQLDataSet
    CommandText = 
      'select *'#13#10'from REALPRICEMAKE_VW t'#13#10'where t.tip=5 and t.parent_id' +
      '_nakl=:parent_id_nakl'#13#10'order by '#13#10'  t.id_nakl,t.id_pos'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'parent_id_nakl'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 304
    Top = 96
  end
  object sdsQuery3: TSQLDataSet
    CommandText = 
      'select t.transh,o.dat,t.id_to'#13#10'from '#13#10'  oplnakl t inner join nak' +
      'lo o on t.id_from=o.id_nakl'#13#10'where'#13#10'  t.id_to = :id_to'#13#10'order by' +
      #13#10'  o.dat'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_to'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 336
    Top = 96
  end
  object dspQuery1: TDataSetProvider
    DataSet = sdsQuery1
    Options = [poAllowCommandText]
    Left = 272
    Top = 128
  end
  object dspQuery2: TDataSetProvider
    DataSet = sdsQuery2
    Left = 304
    Top = 128
  end
  object dspQuery3: TDataSetProvider
    DataSet = sdsQuery3
    Left = 336
    Top = 128
  end
  object cdsQuery1: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DAT'
        DataType = ftTimeStamp
      end
      item
        Name = 'ID'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ID_NAKL'
        DataType = ftInteger
      end
      item
        Name = 'ID_IZG'
        DataType = ftInteger
      end
      item
        Name = 'ID_ZAK'
        DataType = ftInteger
      end
      item
        Name = 'ID_MANAGER'
        DataType = ftInteger
      end
      item
        Name = 'NDS'
        DataType = ftFloat
      end
      item
        Name = 'NDS_FACT'
        DataType = ftFloat
      end
      item
        Name = 'TARA'
        DataType = ftFloat
      end
      item
        Name = 'OTKAT'
        DataType = ftFloat
      end
      item
        Name = 'OPLACH'
        DataType = ftFloat
      end
      item
        Name = 'PERC_OPLACH'
        DataType = ftFloat
      end
      item
        Name = 'MAX_PREM'
        DataType = ftFloat
      end
      item
        Name = 'MAX_PREM_OPL'
        DataType = ftFloat
      end
      item
        Name = 'VYPL_PREM'
        DataType = ftFloat
      end
      item
        Name = 'PREMIYA'
        DataType = ftFloat
      end
      item
        Name = 'COMMENT'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'OPLACH_ZA_PERIOD'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'ClientDataSet1Index1'
        Fields = 'DAT;ID'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'ClientDataSet1Index1'
    Params = <
      item
        DataType = ftUnknown
        Name = 'date_from'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'date_to'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_izg_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'id_zak_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'id_manager_in'
        ParamType = ptInput
        Value = Null
      end>
    ProviderName = 'dspQuery1'
    StoreDefs = True
    Left = 272
    Top = 160
    object cdsQuery1DAT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 8
      FieldName = 'DAT'
      DisplayFormat = 'dd.mm.yy'
    end
    object cdsQuery1ID: TStringField
      DisplayLabel = #8470#1085#1072#1082#1083
      DisplayWidth = 5
      FieldName = 'ID'
    end
    object cdsQuery1ID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      Visible = False
    end
    object cdsQuery1ID_IZG: TIntegerField
      FieldName = 'ID_IZG'
      Visible = False
    end
    object cdsQuery1ID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
      Visible = False
    end
    object cdsQuery1ID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
      Visible = False
    end
    object cdsQuery1IZG: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      DisplayWidth = 7
      FieldKind = fkLookup
      FieldName = 'IZG'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_IZG'
      Size = 50
      Lookup = True
    end
    object cdsQuery1ZAK: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      DisplayWidth = 12
      FieldKind = fkLookup
      FieldName = 'ZAK'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_ZAK'
      Size = 50
      Lookup = True
    end
    object cdsQuery1MANAGER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      DisplayWidth = 7
      FieldKind = fkLookup
      FieldName = 'MANAGER'
      LookupDataSet = dmdEx.cdsManager
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_MANAGER'
      Size = 30
      Lookup = True
    end
    object cdsQuery1NDS: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072'+'#1053#1044#1057
      FieldName = 'NDS'
      DisplayFormat = '0.00'
    end
    object cdsQuery1TARA: TFloatField
      DisplayLabel = #1058#1072#1088#1072
      FieldName = 'TARA'
      DisplayFormat = '0.00'
    end
    object cdsQuery1OTKAT: TFloatField
      DisplayLabel = #1054#1090#1082#1072#1090
      FieldName = 'OTKAT'
      DisplayFormat = '0.00'
    end
    object cdsQuery1NDS_FACT: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1092#1072#1082#1090
      FieldName = 'NDS_FACT'
      DisplayFormat = '0.00'
    end
    object cdsQuery1OPLACH: TFloatField
      DisplayLabel = #1054#1087#1083#1072#1095#1077#1085#1086
      FieldName = 'OPLACH'
      DisplayFormat = '0.00'
    end
    object cdsQuery1PERC_OPLACH: TFloatField
      DisplayLabel = '%'#1086#1087#1083
      DisplayWidth = 5
      FieldName = 'PERC_OPLACH'
      DisplayFormat = '0.0'
    end
    object cdsQuery1MAX_PREM: TFloatField
      DisplayLabel = #1042#1089#1103' '#1087#1088#1077#1084#1080#1103
      FieldName = 'MAX_PREM'
      Visible = False
      DisplayFormat = '0.00'
    end
    object cdsQuery1MAX_PREM_OPL: TFloatField
      DisplayLabel = #1054#1087#1083' '#1087#1088#1077#1084#1080#1103
      FieldName = 'MAX_PREM_OPL'
      DisplayFormat = '0.00'
    end
    object cdsQuery1VYPL_PREM: TFloatField
      DisplayLabel = #1042#1099#1087#1083' '#1087#1088#1077#1084#1080#1103
      FieldName = 'VYPL_PREM'
      DisplayFormat = '0.00'
    end
    object cdsQuery1PREMIYA: TFloatField
      DisplayLabel = #1060#1072#1082#1090' '#1087#1088#1077#1084#1080#1103
      FieldName = 'PREMIYA'
      DisplayFormat = '0.00'
    end
    object cdsQuery1OPLACH_ZA_PERIOD: TFloatField
      DisplayLabel = #1054#1087#1083#1072#1090#1072' '#1079#1072' '#1087#1077#1088#1080#1086#1076
      FieldName = 'OPLACH_ZA_PERIOD'
      DisplayFormat = '0.00'
    end
    object cdsQuery1COMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'COMMENT'
      Size = 50
    end
  end
  object cdsQuery2: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'PARENT_ID_NAKL'
    MasterFields = 'ID_NAKL'
    MasterSource = dtSource2
    PacketRecords = 0
    Params = <
      item
        DataType = ftInteger
        Name = 'parent_id_nakl'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspQuery2'
    Left = 304
    Top = 160
    object cdsQuery2ID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
      Required = True
      Visible = False
    end
    object cdsQuery2ID_NAKLD: TIntegerField
      FieldName = 'ID_NAKLD'
      Required = True
      Visible = False
    end
    object cdsQuery2ID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      Required = True
      Visible = False
    end
    object cdsQuery2KODCN: TSmallintField
      FieldName = 'KODCN'
      Visible = False
    end
    object cdsQuery2PARENT_ID_NAKL: TIntegerField
      FieldName = 'PARENT_ID_NAKL'
      Visible = False
    end
    object cdsQuery2NALOG_NDS: TFMTBCDField
      FieldName = 'NALOG_NDS'
      Visible = False
      Precision = 15
      Size = 2
    end
    object cdsQuery2ID_POS: TIntegerField
      DisplayLabel = #8470#1087'.'#1087'.'
      DisplayWidth = 2
      FieldName = 'ID_POS'
      Required = True
    end
    object cdsQuery2TOVAR: TStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      DisplayWidth = 35
      FieldKind = fkLookup
      FieldName = 'TOVAR'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_TOVAR'
      Size = 50
      Lookup = True
    end
    object cdsQuery2SKIDKA: TFMTBCDField
      DisplayLabel = #1057#1082#1080#1076#1082#1072
      DisplayWidth = 3
      FieldName = 'SKIDKA'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsQuery2CENA: TFMTBCDField
      DisplayLabel = #1062#1077#1085#1072
      DisplayWidth = 10
      FieldName = 'CENA'
      DisplayFormat = '0.00'
      Precision = 15
    end
    object cdsQuery2KOLOTP: TFMTBCDField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      DisplayWidth = 10
      FieldName = 'KOLOTP'
      DisplayFormat = '0.000'
      Precision = 15
    end
    object cdsQuery2KURS: TFloatField
      DisplayLabel = #1050#1091#1088#1089
      FieldName = 'KURS'
      Required = True
      DisplayFormat = '0.0000'
    end
    object cdsQuery2TARA: TSmallintField
      FieldName = 'TARA'
      Visible = False
    end
  end
  object cdsQuery3: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_TO'
    MasterFields = 'ID_NAKL'
    MasterSource = dtSource2
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'id_to'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'dspQuery3'
    Left = 336
    Top = 160
    object cdsQuery3TRANSH: TFMTBCDField
      FieldName = 'TRANSH'
      Required = True
      Precision = 15
    end
    object cdsQuery3DAT: TSQLTimeStampField
      FieldName = 'DAT'
      Required = True
    end
    object cdsQuery3ID_TO: TIntegerField
      FieldName = 'ID_TO'
    end
  end
  object PropStorageEh2: TPropStorageEh
    Section = 'TfrmRepMan'
    StorageManager = RegPropStorageManEh2
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      'DBGridEh1.<P>.Columns.<ForAllItems>.Width')
    Left = 432
    Top = 96
  end
  object RegPropStorageManEh2: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 400
    Top = 96
  end
  object UnfFilter1: TUnfFilter
    DBGridEh = DBGridEh1
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
    Left = 336
    Top = 64
  end
  object sdsPremiyaVypl: TSQLDataSet
    CommandText = 'REP_MANAGER_PREMIYA_VYPL_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_NAKL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PREMIYA'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DAT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIP_NAME'
        ParamType = ptInput
        Value = #1042#1067#1055#1051#1040#1058#1040' '#1055#1056#1045#1052#1048#1048
      end>
    SQLConnection = dmdEx.scUchet
    Left = 368
    Top = 96
  end
  object PopupMenu1: TPopupMenu
    Left = 368
    Top = 128
    object N1: TMenuItem
      Action = actRealPrice
      Default = True
    end
  end
  object MainMenu1: TMainMenu
    Left = 104
    Top = 168
    object MenuItem1: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      GroupIndex = 10
      object mnuRefresh: TMenuItem
        Action = actRefresh
      end
      object MenuItem3: TMenuItem
        Action = actSettings
      end
      object MenuItem4: TMenuItem
        Action = actPreview
      end
      object N5: TMenuItem
        Action = actPrint
      end
      object N2: TMenuItem
        Action = actRealPrice
      end
      object N3: TMenuItem
        Action = actPrixDet
      end
      object N4: TMenuItem
        Action = actPremiyaVypl
      end
    end
  end
end
