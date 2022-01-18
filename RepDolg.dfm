object frmRepDolg3: TfrmRepDolg3
  Left = 169
  Top = 131
  BorderStyle = bsDialog
  Caption = #1044#1086#1083#1078#1085#1080#1082#1080' ('#1086#1090#1095#1105#1090')'
  ClientHeight = 324
  ClientWidth = 640
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
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 640
    Height = 41
    Align = alTop
    TabOrder = 0
    DesignSize = (
      640
      41)
    object cbxNotNull: TCheckBox
      Left = 408
      Top = 12
      Width = 121
      Height = 17
      Action = actNotNull
      State = cbChecked
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 110
      Top = 12
      Width = 91
      Height = 25
      Action = actRefresh
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 1
      Kind = bkRetry
    end
    object BitBtn3: TBitBtn
      Left = 296
      Top = 12
      Width = 97
      Height = 25
      Action = actDetail
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      TabOrder = 2
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
    object BitBtn4: TBitBtn
      Left = 8
      Top = 12
      Width = 97
      Height = 25
      Action = actSettings
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      TabOrder = 3
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
    object BitBtn1: TBitBtn
      Left = 208
      Top = 12
      Width = 81
      Height = 25
      Action = actPreview
      Anchors = [akLeft, akBottom]
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      TabOrder = 4
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF00000000000000000000000000000000
        0000000000000000000000000000000000FF00FFFF00FFFF00FFFF00FF000000
        C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6000000C6C6
        C6000000FF00FFFF000700313100000000000000000000000000000000000000
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
  object dbgDolg: TDBGridEh
    Left = 0
    Top = 41
    Width = 640
    Height = 283
    Align = alClient
    DataSource = dsDolg
    Flat = False
    FooterColor = clInfoBk
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghRowHighlight]
    PopupMenu = PopupMenu1
    SortLocal = True
    SumList.Active = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    VertScrollBar.VisibleMode = sbAlwaysShowEh
    OnDblClick = dbgDolgDblClick
    OnKeyUp = dbgDolgKeyUp
    Columns = <
      item
        EditButtons = <>
        FieldName = 'IZG'
        Footer.Value = #1042#1089#1077#1075#1086' '#1079#1072#1087#1080#1089#1077#1081
        Footer.ValueType = fvtStaticText
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'ZAK'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'MANAGER'
        Footer.Value = #1048#1090#1086#1075#1086
        Footer.ValueType = fvtStaticText
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'DEBET'
        Footer.DisplayFormat = '0.00'
        Footer.FieldName = 'DEBET'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'KREDIT'
        Footer.DisplayFormat = '0.00'
        Footer.FieldName = 'KREDIT'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.TitleButton = True
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'LAST_OPL_DAT'
        Footers = <>
        ReadOnly = True
        Title.TitleButton = True
        Width = 79
      end
      item
        EditButtons = <>
        FieldName = 'LAST_OTG_NEOPL_DAT'
        Footers = <>
        ReadOnly = True
        Title.TitleButton = True
        Width = 118
      end
      item
        EditButtons = <>
        FieldName = 'LAST_OTG_SUM'
        Footers = <>
        Title.TitleButton = True
        Width = 87
      end
      item
        EditButtons = <>
        FieldName = 'SUB1P'
        Footers = <>
        Tag = 1
        Title.TitleButton = True
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'SUB2P'
        Footers = <>
        Tag = 1
        Title.TitleButton = True
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'SUB3P'
        Footers = <>
        Tag = 1
        Title.TitleButton = True
        Visible = False
      end>
  end
  object dsDolg: TDataSource
    DataSet = cdsDolg
    Left = 112
    Top = 96
  end
  object ActionList1: TActionList
    Left = 80
    Top = 224
    object actPreview: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      ShortCut = 16471
      OnExecute = actPreviewExecute
    end
    object actSumRecalc: TAction
      Caption = 'actSumRecalc'
    end
    object actCall: TAction
      Caption = 'actCall'
    end
    object actSettings: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      ShortCut = 16465
      OnExecute = actSettingsExecute
    end
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ShortCut = 116
      OnExecute = actRefreshExecute
    end
    object actDetail: TAction
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      ShortCut = 120
      OnExecute = actDetailExecute
    end
    object actNotNull: TAction
      Caption = #1058#1086#1083#1100#1082#1086' '#1072#1082#1090#1080#1074#1085#1099#1077
      Checked = True
      OnExecute = actNotNullExecute
    end
    object actTest: TAction
      Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1086#1089#1090#1072#1090#1082#1080
      OnExecute = actTestExecute
    end
    object actDebug: TAction
      Caption = #1056#1077#1078#1080#1084' '#1086#1090#1083#1072#1076#1082#1080
      OnExecute = actDebugExecute
    end
  end
  object frDolg: TfrxReport
    Version = '3.23.7'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38981.610988692130000000
    ReportOptions.LastChange = 38981.610988692130000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frDolgGetValue
    Left = 80
    Top = 96
    Datasets = <>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
    end
  end
  object frDBDataSet1: TfrxDBDataset
    UserName = 'frDBDataSet1'
    CloseDataSource = False
    DataSource = dsDolg
    Left = 80
    Top = 128
  end
  object qeDolg: TQueryExtender
    Query = cdsDolg
    KeyField = 'zak'
    Left = 48
    Top = 256
  end
  object UnfFilter1: TUnfFilter
    DBGridEh = dbgDolg
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
    Left = 352
    Top = 136
  end
  object cdsDolg: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'sub1_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'sub2_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftFMTBcd
        Name = 'sub3_in'
        ParamType = ptInput
        Value = 222222222
      end
      item
        DataType = ftDate
        Name = 'dat_in'
        ParamType = ptInput
        Value = 37987d
      end>
    ProviderName = 'dspDolg'
    ReadOnly = True
    Left = 48
    Top = 224
    object cdsDolgIZG: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      DisplayWidth = 20
      FieldName = 'IZG'
      ProviderFlags = []
      Size = 50
    end
    object cdsDolgZAK: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      DisplayWidth = 30
      FieldName = 'ZAK'
      ProviderFlags = []
      Size = 50
    end
    object cdsDolgMANAGER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      DisplayWidth = 10
      FieldName = 'MANAGER'
      ProviderFlags = []
      Size = 50
    end
    object cdsDolgDEBET: TFloatField
      DisplayLabel = #1044#1086#1083#1075
      DisplayWidth = 10
      FieldName = 'DEBET'
      ProviderFlags = []
      DisplayFormat = '0.00'
    end
    object cdsDolgKREDIT: TFloatField
      DisplayLabel = #1055#1088#1077#1076#1086#1087#1083#1072#1090#1072
      DisplayWidth = 10
      FieldName = 'KREDIT'
      ProviderFlags = []
      DisplayFormat = '0.00'
    end
    object cdsDolgSUB1P: TIntegerField
      DisplayWidth = 1
      FieldName = 'SUB1P'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsDolgSUB2P: TIntegerField
      DisplayWidth = 1
      FieldName = 'SUB2P'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsDolgSUB3P: TFMTBCDField
      DisplayWidth = 1
      FieldName = 'SUB3P'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Precision = 15
    end
    object cdsDolgLAST_OPL_DAT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086#1089#1083' '#1086#1087#1083
      DisplayWidth = 6
      FieldName = 'LAST_OPL_DAT'
      DisplayFormat = 'dd.mm.yy'
    end
    object cdsDolgLAST_OTG_NEOPL_DAT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086#1089#1083' '#1085#1077#1086#1087#1083' '#1086#1090#1075#1088
      DisplayWidth = 6
      FieldName = 'LAST_OTG_NEOPL_DAT'
      DisplayFormat = 'dd.mm.yy'
    end
    object cdsDolgLAST_OTG_SUM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1087#1086#1089#1083' '#1086#1090#1075
      DisplayWidth = 9
      FieldName = 'LAST_OTG_SUM'
      DisplayFormat = '0.00'
    end
  end
  object dspDolg: TDataSetProvider
    DataSet = sdsDolg
    Options = [poAllowCommandText]
    Left = 48
    Top = 192
  end
  object sdsDolg: TSQLDataSet
    CommandText = 
      'select'#13#10'(select name from objects o where o.oid=d.sub1p) as izg,' +
      #13#10'(select name from objects o where o.oid=d.sub2p) as zak,'#13#10'(sel' +
      'ect name from objects o where o.oid=d.sub3p) as manager,'#13#10'sub1p,' +
      #13#10'sub2p,'#13#10'sub3p,'#13#10'debet,'#13#10'kredit,'#13#10'd.last_opl_dat,'#13#10'd.last_otg_n' +
      'eopl_dat,'#13#10'd.last_otg_sum'#13#10#13#10'from REP_DOLGBUX_MANAGER_PC(:sub1_i' +
      'n,:sub2_in,:sub3_in,:dat_in) d'#13#10'order by'#13#10'2,1,3'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'sub1_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sub2_in'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'sub3_in'
        ParamType = ptInput
        Value = 222222222
      end
      item
        DataType = ftDate
        Name = 'dat_in'
        ParamType = ptInput
        Value = 37987d
      end>
    SQLConnection = dmdEx.scUchet
    Left = 48
    Top = 160
    object sdsDolgIZG: TStringField
      FieldName = 'IZG'
      ProviderFlags = []
      Size = 50
    end
    object sdsDolgZAK: TStringField
      FieldName = 'ZAK'
      ProviderFlags = []
      Size = 50
    end
    object sdsDolgMANAGER: TStringField
      FieldName = 'MANAGER'
      ProviderFlags = []
      Size = 50
    end
    object sdsDolgSUB1P: TIntegerField
      FieldName = 'SUB1P'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sdsDolgSUB2P: TIntegerField
      FieldName = 'SUB2P'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sdsDolgSUB3P: TFMTBCDField
      FieldName = 'SUB3P'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Precision = 15
    end
    object sdsDolgDEBET: TFloatField
      FieldName = 'DEBET'
      ProviderFlags = []
    end
    object sdsDolgKREDIT: TFloatField
      FieldName = 'KREDIT'
      ProviderFlags = []
    end
    object sdsDolgLAST_OPL_DAT: TSQLTimeStampField
      FieldName = 'LAST_OPL_DAT'
    end
    object sdsDolgLAST_OTG_NEOPL_DAT: TSQLTimeStampField
      FieldName = 'LAST_OTG_NEOPL_DAT'
    end
    object sdsDolgLAST_OTG_SUM: TFloatField
      FieldName = 'LAST_OTG_SUM'
    end
  end
  object PopupMenu1: TPopupMenu
    Images = dmdEx.ImageList1
    Left = 80
    Top = 160
    object N21: TMenuItem
      Action = actDetail
      Default = True
      ImageIndex = 2
    end
    object N7: TMenuItem
      Action = actRefresh
    end
    object N8: TMenuItem
      Action = actPreview
    end
  end
  object MainMenu1: TMainMenu
    Left = 80
    Top = 192
    object N1: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      GroupIndex = 10
      object N3: TMenuItem
        Action = actDetail
      end
      object mnuRefresh: TMenuItem
        Action = actRefresh
      end
      object N2: TMenuItem
        Action = actSettings
      end
      object N6: TMenuItem
        Action = actPreview
      end
      object N5: TMenuItem
        Action = actTest
      end
      object N9: TMenuItem
        Action = actDebug
      end
    end
  end
  object sdsProvodkiRefresh: TSQLDataSet
    CommandText = 'PROVODKI_REFRESH_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_SCHET'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SUB1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SUB2'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'SUB3'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SUB4'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SUB5'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SUB6'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SUB7'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SUB8'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SUB9'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SUB10'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 352
    Top = 168
  end
  object rpsClientEdit: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 184
    Top = 96
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'frmRepDolg3'
    StorageManager = rpsClientEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      '<P>.WindowState'
      'dbgDolg.<P>.Columns.<ForAllItems>.Width')
    Left = 152
    Top = 96
  end
  object sdsDolgProsrochen: TSQLDataSet
    CommandText = 
      'select'#13#10'(select name from objects o where o.oid=d.sub1p) as izg,' +
      #13#10'(select name from objects o where o.oid=d.sub2p) as zak,'#13#10'(sel' +
      'ect name from objects o where o.oid=d.sub3p) as manager,'#13#10'sub1p,' +
      #13#10'sub2p,'#13#10'sub3p,'#13#10'debet,'#13#10'kredit,'#13#10'd.last_opl_dat,'#13#10'd.last_otg_n' +
      'eopl_dat,'#13#10'd.last_otg_sum'#13#10#13#10'from REP_DOLGBUX_MANAGER2_PC(:sub1_' +
      'in,:sub2_in,:sub3_in,:dat_from_in,:dat_to_in) d'#13#10'order by'#13#10'2,1,3'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'sub1_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sub2_in'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'sub3_in'
        ParamType = ptInput
        Value = '222222222'
      end
      item
        DataType = ftDate
        Name = 'dat_from_in'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dat_to_in'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 112
    Top = 160
    object StringField1: TStringField
      FieldName = 'IZG'
      ProviderFlags = []
      Size = 50
    end
    object StringField2: TStringField
      FieldName = 'ZAK'
      ProviderFlags = []
      Size = 50
    end
    object StringField3: TStringField
      FieldName = 'MANAGER'
      ProviderFlags = []
      Size = 50
    end
    object IntegerField1: TIntegerField
      FieldName = 'SUB1P'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object IntegerField2: TIntegerField
      FieldName = 'SUB2P'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object IntegerField3: TFMTBCDField
      FieldName = 'SUB3P'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Precision = 15
    end
    object FloatField1: TFloatField
      FieldName = 'DEBET'
      ProviderFlags = []
    end
    object FloatField2: TFloatField
      FieldName = 'KREDIT'
      ProviderFlags = []
    end
    object SQLTimeStampField1: TSQLTimeStampField
      FieldName = 'LAST_OPL_DAT'
    end
    object SQLTimeStampField2: TSQLTimeStampField
      FieldName = 'LAST_OTG_NEOPL_DAT'
    end
    object FloatField3: TFloatField
      FieldName = 'LAST_OTG_SUM'
    end
  end
  object dspDolgProsrochen: TDataSetProvider
    DataSet = sdsDolgProsrochen
    Options = [poAllowCommandText]
    Left = 112
    Top = 192
  end
  object cdsDolgProsrochen: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'sub1_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'sub2_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftFMTBcd
        Name = 'sub3_in'
        ParamType = ptInput
        Value = '222222222'
      end
      item
        DataType = ftDate
        Name = 'dat_from_in'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dat_to_in'
        ParamType = ptInput
      end>
    ProviderName = 'dspDolgProsrochen'
    ReadOnly = True
    Left = 112
    Top = 224
    object StringField4: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      DisplayWidth = 20
      FieldName = 'IZG'
      ProviderFlags = []
      Size = 50
    end
    object StringField5: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      DisplayWidth = 30
      FieldName = 'ZAK'
      ProviderFlags = []
      Size = 50
    end
    object StringField6: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      DisplayWidth = 10
      FieldName = 'MANAGER'
      ProviderFlags = []
      Size = 50
    end
    object FloatField4: TFloatField
      DisplayLabel = #1044#1086#1083#1075
      DisplayWidth = 10
      FieldName = 'DEBET'
      ProviderFlags = []
      DisplayFormat = '0.00'
    end
    object FloatField5: TFloatField
      DisplayLabel = #1055#1088#1077#1076#1086#1087#1083#1072#1090#1072
      DisplayWidth = 10
      FieldName = 'KREDIT'
      ProviderFlags = []
      DisplayFormat = '0.00'
    end
    object IntegerField4: TIntegerField
      DisplayWidth = 1
      FieldName = 'SUB1P'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object IntegerField5: TIntegerField
      DisplayWidth = 1
      FieldName = 'SUB2P'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object IntegerField6: TFMTBCDField
      DisplayWidth = 1
      FieldName = 'SUB3P'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Precision = 15
    end
    object SQLTimeStampField3: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086#1089#1083' '#1086#1087#1083
      DisplayWidth = 6
      FieldName = 'LAST_OPL_DAT'
      DisplayFormat = 'dd.mm.yy'
    end
    object SQLTimeStampField4: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086#1089#1083' '#1085#1077#1086#1087#1083' '#1086#1090#1075#1088
      DisplayWidth = 6
      FieldName = 'LAST_OTG_NEOPL_DAT'
      DisplayFormat = 'dd.mm.yy'
    end
    object FloatField6: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1087#1086#1089#1083' '#1086#1090#1075
      DisplayWidth = 9
      FieldName = 'LAST_OTG_SUM'
      DisplayFormat = '0.00'
    end
  end
  object qeDolgProsrochen: TQueryExtender
    Query = cdsDolgProsrochen
    KeyField = 'zak'
    Left = 112
    Top = 256
  end
end
