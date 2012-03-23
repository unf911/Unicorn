object frmSebMain3: TfrmSebMain3
  Left = 48
  Top = 110
  BorderStyle = bsDialog
  Caption = #1042#1074#1086#1076' '#1089#1077#1073#1077#1089#1090#1086#1080#1084#1086#1089#1090#1080
  ClientHeight = 407
  ClientWidth = 738
  Color = clBtnFace
  Constraints.MinHeight = 453
  Constraints.MinWidth = 577
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poOwnerFormCenter
  Scaled = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 249
    Width = 738
    Height = 8
    Cursor = crVSplit
    Align = alTop
    Beveled = True
    ResizeStyle = rsUpdate
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 738
    Height = 249
    Align = alTop
    BevelOuter = bvNone
    Constraints.MinHeight = 100
    TabOrder = 0
    DesignSize = (
      738
      249)
    object Label1: TLabel
      Left = 496
      Top = 64
      Width = 32
      Height = 13
      Caption = 'Label1'
    end
    object btnSettings: TBitBtn
      Left = 8
      Top = 0
      Width = 81
      Height = 17
      Action = actSettings
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object cbxPreview: TComboBox
      Left = 96
      Top = 0
      Width = 209
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      OnChange = cbxPreviewChange
      Items.Strings = (
        #1055#1086' '#1091#1073#1099#1090#1086#1095#1085#1099#1084' '#1080' '#1089#1074#1077#1088#1093#1087#1088#1080#1073#1099#1083#1100#1085#1099#1084' '#1087#1086#1079#1080#1094#1080#1103#1084
        #1055#1086' '#1089#1077#1073#1077#1089#1090#1086#1080#1084#1086#1089#1090#1080
        #1055#1086' '#1076#1086#1093#1086#1076#1072#1084
        #1055#1086' '#1087#1086#1079#1080#1094#1080#1103#1084' '#1085#1080#1078#1077' '#1087#1088#1072#1081#1089#1072
        #1055#1086' '#1087#1086#1079#1080#1094#1080#1103#1084' '#1085#1080#1078#1077' '#1087#1088#1072#1081#1089#1072' ('#1074#1082#1083#1102#1095#1072#1103' '#1089#1077#1073#1077#1089#1090#1086#1080#1084#1086#1089#1090#1100')')
    end
    object btnPreview: TBitBtn
      Left = 424
      Top = 0
      Width = 83
      Height = 17
      Action = actPreview
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object btnRefresh: TButton
      Left = 512
      Top = 0
      Width = 75
      Height = 17
      Action = actRefresh
      TabOrder = 3
    end
    object BitBtn2: TBitBtn
      Left = 592
      Top = 0
      Width = 65
      Height = 17
      Action = actRealPrice
      Caption = #1060#1072#1082#1090' '#1094#1077#1085#1099
      TabOrder = 4
    end
    object DBGridEh1: TDBGridEh
      Left = 0
      Top = 24
      Width = 738
      Height = 225
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsNaklo
      Flat = False
      FooterColor = clInfoBk
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      FooterRowCount = 1
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
      PopupMenu = PopupMenu1
      ReadOnly = True
      SortLocal = True
      SumList.Active = True
      TabOrder = 5
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      VertScrollBar.VisibleMode = sbAlwaysShowEh
      Columns = <
        item
          EditButtons = <>
          FieldName = 'ID'
          Footer.Value = #1047#1072#1087#1080#1089#1077#1081
          Footer.ValueType = fvtStaticText
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'DAT'
          Footer.ValueType = fvtCount
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'IZG'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'ZAK'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'MANAGER'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'NDS'
          Footer.ValueType = fvtSum
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'TARA'
          Footer.ValueType = fvtSum
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'NDS_FACT'
          Footer.ValueType = fvtSum
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'OBOROT'
          Footer.ValueType = fvtSum
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'NDS_SEBEST'
          Footer.ValueType = fvtSum
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'NDS_SEBEST2'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'OPLACH'
          Footer.ValueType = fvtSum
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'OPLACH_ZA_PERIOD'
          Footer.ValueType = fvtSum
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'PERC_OPLACH'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'MAX_DOXOD'
          Footer.ValueType = fvtSum
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'MAX_DOXOD_OPL'
          Footer.ValueType = fvtSum
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'VYPL_DOXOD'
          Footer.ValueType = fvtSum
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'DOXOD'
          Footer.ValueType = fvtSum
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'RENT'
          Footers = <>
        end>
    end
    object BitBtn1: TBitBtn
      Left = 664
      Top = 0
      Width = 65
      Height = 17
      Action = actPrixDet
      Caption = #1054#1087#1083#1072#1090#1099
      TabOrder = 6
    end
    object pnlMaxSkidka: TPanel
      Left = 312
      Top = 0
      Width = 97
      Height = 25
      BevelOuter = bvNone
      TabOrder = 7
      Visible = False
      object Label2: TLabel
        Left = 42
        Top = 4
        Width = 47
        Height = 13
        Caption = '% '#1089#1082#1080#1076#1082#1080
      end
      object dbeMaxSkidka: TDBNumberEditEh
        Left = 0
        Top = 0
        Width = 41
        Height = 21
        DecimalPlaces = 1
        EditButtons = <>
        MaxValue = 100.000000000000000000
        TabOrder = 0
        Value = 18.000000000000000000
        Visible = True
        OnExit = dbeMaxSkidkaExit
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 257
    Width = 738
    Height = 150
    Align = alClient
    BevelOuter = bvNone
    Constraints.MinHeight = 150
    TabOrder = 1
    object DBGridEh2: TDBGridEh
      Left = 0
      Top = 0
      Width = 738
      Height = 150
      Align = alClient
      DataSource = dsNaklot
      Flat = False
      FooterColor = clInfoBk
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      FooterRowCount = 1
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
      PopupMenu = PopupMenu2
      ReadOnly = True
      SortLocal = True
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      VertScrollBar.VisibleMode = sbAlwaysShowEh
      OnDblClick = DBGridEh2DblClick
      OnKeyUp = DBGridEh2KeyUp
      Columns = <
        item
          EditButtons = <>
          FieldName = 'ID_POS'
          Footer.ValueType = fvtCount
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'TOVAR'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'KOLOTP'
          Footer.ValueType = fvtSum
          Footers = <>
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'SKIDKA'
          Footers = <>
        end
        item
          Color = clInfoBk
          EditButtons = <>
          FieldName = 'KURS2'
          Footers = <>
        end
        item
          DisplayFormat = '0.00'
          EditButtons = <>
          FieldName = 'CENA_GRN'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'CENA_GRN_NDS'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'SUM_GRN_NDS'
          Footer.ValueType = fvtSum
          Footers = <>
        end
        item
          Color = clInfoBk
          EditButtons = <>
          FieldName = 'CENA_SEBEST'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'SSUM_YE_NDS'
          Footer.ValueType = fvtSum
          Footers = <>
          Width = 81
        end
        item
          EditButtons = <>
          FieldName = 'NDS_SEBEST'
          Footer.ValueType = fvtSum
          Footers = <>
          Width = 71
        end
        item
          EditButtons = <>
          FieldName = 'DOXOD'
          Footer.ValueType = fvtSum
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'PERCENT'
          Footers = <>
          Width = 41
        end
        item
          Color = clInfoBk
          EditButtons = <>
          FieldName = 'PRICE_MINUS_18_COMPARE'
          Footers = <>
        end>
    end
  end
  object ActionList1: TActionList
    Left = 200
    Top = 56
    object actSettings: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      ShortCut = 16467
      OnExecute = actSettingsExecute
    end
    object actKurs: TAction
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1082#1091#1088#1089#1086#1074
      OnExecute = actKursExecute
    end
    object actPreview: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      OnExecute = actPreviewExecute
    end
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ShortCut = 116
      OnExecute = actRefreshExecute
    end
    object actPremiyaVypl: TAction
      Caption = #1042#1099#1087#1083#1072#1090#1072' '#1087#1088#1080#1073#1099#1083#1080
    end
    object actRealPrice: TAction
      Caption = #1060#1072#1082#1090' '#1094#1077#1085#1099
      OnExecute = actRealPriceExecute
    end
    object actPrixDet: TAction
      Caption = #1054#1087#1083#1072#1090#1099
      OnExecute = actPrixDetExecute
    end
    object actSebestDet: TAction
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103' '#1089#1077#1073#1077#1089#1090#1086#1080#1084#1086#1089#1090#1080
      ShortCut = 120
      OnExecute = actSebestDetExecute
    end
    object actShowRepPrice: TAction
      Caption = #1054#1090#1095#1105#1090' '#1087#1086' '#1094#1077#1085#1072#1084
      OnExecute = actShowRepPriceExecute
    end
    object actShowNaklr: TAction
      Caption = #1056#1072#1089#1093#1086#1076#1085#1072#1103' '#1085#1072#1082#1083#1072#1076#1085#1072#1103
      OnExecute = actShowNaklrExecute
    end
    object actShowNaklo: TAction
      Caption = #1054#1090#1075#1088#1091#1079#1082#1080
      OnExecute = actShowNakloExecute
    end
  end
  object dsNaklo: TDataSource
    DataSet = qurQuery1
    Left = 104
    Top = 104
  end
  object qeQuery2: TQueryExtender
    SlaveQueryExtender = qeQuery3
    Query = qurQuery1
    KeyField = 'id_nakl'
    Left = 104
    Top = 200
  end
  object dsNaklot: TDataSource
    DataSet = qurQuery3
    Left = 136
    Top = 104
  end
  object qeQuery3: TQueryExtender
    Query = qurQuery3
    KeyField = 'id_pos'
    Left = 136
    Top = 200
  end
  object dsPrice: TDataSource
    Left = 168
    Top = 104
  end
  object qePrice: TQueryExtender
    DefSql = 'select * from tovar'#13#10'order by name'#13#10
    Left = 168
    Top = 200
  end
  object frRepSebest: TfrxReport
    Version = '3.23.7'
    DataSet = frDBNaklo
    DataSetName = 'frDBNaklo'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38981.610846898150000000
    ReportOptions.LastChange = 38981.610846898150000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frRepSebestGetValue
    Left = 232
    Top = 56
    Datasets = <>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.015666666666600000
      PaperHeight = 297.010666666666700000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
    end
  end
  object frDBNaklo: TfrxDBDataset
    UserName = 'frDBNaklo'
    CloseDataSource = False
    DataSource = dsNaklo
    Left = 232
    Top = 104
  end
  object frDBNaklot: TfrxDBDataset
    UserName = 'frDBNaklot'
    CloseDataSource = False
    DataSource = dsNaklot
    Left = 264
    Top = 104
  end
  object frRepDoxod: TfrxReport
    Version = '3.23.7'
    DataSet = frDBNaklo
    DataSetName = 'frDBNaklo'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38981.610853761570000000
    ReportOptions.LastChange = 38981.610853761570000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frRepDoxodGetValue
    Left = 264
    Top = 56
    Datasets = <>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.015666666666600000
      PaperHeight = 297.010666666666700000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
    end
  end
  object SQLDataSet1: TSQLDataSet
    CommandText = 
      'select   id,dat,id_nakl,r.id_izg,r.id_zak,r.id_manager,'#13#10'  kurs2' +
      ',nds,tara,nds_fact,oborot,'#13#10'  nds_sebest,nds_sebest2,oplach,opla' +
      'ch_za_period,'#13#10'  perc_oplach,max_doxod,max_doxod_opl,vypl_doxod,' +
      'doxod,rent,'#13#10'  (select name from objects o where o.oid=r.id_izg)' +
      ' as izg,'#13#10'  (select name from objects o where o.oid=r.id_zak) as' +
      ' zak,'#13#10'  (select name from objects o where o.oid=r.id_manager) a' +
      's manager'#13#10'from '#13#10'  rep_sebest4_pc(:dat_from,:dat_to,:sub1_in,:s' +
      'ub2_in,:sub3_in) r'#13#10'order by dat'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'dat_from'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'dat_to'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'sub1_in'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'sub2_in'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'sub3_in'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 328
    Top = 56
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLDataSet1
    UpdateMode = upWhereKeyOnly
    Left = 328
    Top = 88
  end
  object qurQuery1: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'dat_from'
        ParamType = ptInput
        Value = '01.03.04'
      end
      item
        DataType = ftDate
        Name = 'dat_to'
        ParamType = ptInput
        Value = '31.03.04'
      end
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
        DataType = ftInteger
        Name = 'sub3_in'
        ParamType = ptInput
        Value = '3025'
      end>
    ProviderName = 'DataSetProvider1'
    AfterScroll = qurQuery1AfterScroll
    Left = 328
    Top = 120
    object qurQuery1ID: TStringField
      DisplayLabel = #8470#1085#1072#1082#1083
      DisplayWidth = 4
      FieldName = 'ID'
      Size = 10
    end
    object qurQuery1DAT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 4
      FieldName = 'DAT'
      DisplayFormat = 'dd.mm.yy'
    end
    object qurQuery1IZG: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      DisplayWidth = 6
      FieldName = 'IZG'
      LookupResultField = 'NAME'
      Size = 50
    end
    object qurQuery1ZAK: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      DisplayWidth = 15
      FieldName = 'ZAK'
      Size = 50
    end
    object qurQuery1MANAGER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      DisplayWidth = 5
      FieldName = 'MANAGER'
      Size = 30
    end
    object qurQuery1ID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qurQuery1ID_IZG: TIntegerField
      FieldName = 'ID_IZG'
      Visible = False
    end
    object qurQuery1ID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
      Visible = False
    end
    object qurQuery1ID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
      Visible = False
    end
    object qurQuery1KURS2: TFloatField
      DisplayLabel = #1050#1091#1088#1089
      DisplayWidth = 6
      FieldName = 'KURS2'
      ProviderFlags = []
      DisplayFormat = '0.0000'
    end
    object qurQuery1NDS: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1076#1086#1082','#1075#1088#1085
      FieldName = 'NDS'
      DisplayFormat = '0.00'
    end
    object qurQuery1TARA: TFloatField
      DisplayLabel = #1058#1072#1088#1072
      DisplayWidth = 8
      FieldName = 'TARA'
      DisplayFormat = '0.00'
    end
    object qurQuery1NDS_FACT: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1092#1072#1082#1090','#1075#1088#1085
      FieldName = 'NDS_FACT'
      DisplayFormat = '0.00'
    end
    object qurQuery1OBOROT: TFloatField
      DisplayLabel = #1054#1073#1086#1088#1086#1090','#1075#1088#1085
      FieldName = 'OBOROT'
      DisplayFormat = '0.00'
    end
    object qurQuery1NDS_SEBEST: TFloatField
      DisplayLabel = #1057'/'#1089','#1075#1088#1085
      FieldName = 'NDS_SEBEST'
      DisplayFormat = '0.00'
    end
    object qurQuery1NDS_SEBEST2: TFloatField
      DisplayLabel = #1057'/'#1089'2,'#1075#1088#1085
      FieldName = 'NDS_SEBEST2'
      DisplayFormat = '0.00'
    end
    object qurQuery1OPLACH: TFloatField
      DisplayLabel = #1054#1087#1083#1072#1095#1077#1085#1086','#1075#1088#1085
      FieldName = 'OPLACH'
      DisplayFormat = '0.00'
    end
    object qurQuery1OPLACH_ZA_PERIOD: TFloatField
      DisplayLabel = #1054#1087#1083#1072#1090#1072' '#1079#1072' '#1087#1077#1088#1080#1086#1076','#1075#1088#1085
      FieldName = 'OPLACH_ZA_PERIOD'
      DisplayFormat = '0.00'
    end
    object qurQuery1PERC_OPLACH: TFloatField
      DisplayLabel = '% '#1054#1087#1083#1072#1090#1099
      DisplayWidth = 5
      FieldName = 'PERC_OPLACH'
      DisplayFormat = '0.0'
    end
    object qurQuery1MAX_DOXOD: TFloatField
      DisplayLabel = #1052#1072#1082#1089' '#1076#1086#1093#1086#1076', '#1075#1088#1085
      FieldName = 'MAX_DOXOD'
      DisplayFormat = '0.00'
    end
    object qurQuery1MAX_DOXOD_OPL: TFloatField
      DisplayLabel = #1054#1087#1083' '#1076#1086#1093#1086#1076', '#1075#1088#1085
      FieldName = 'MAX_DOXOD_OPL'
      DisplayFormat = '0.00'
    end
    object qurQuery1VYPL_DOXOD: TFloatField
      DisplayLabel = #1042#1099#1087#1083' '#1076#1086#1093#1086#1076', '#1075#1088#1085
      FieldName = 'VYPL_DOXOD'
      DisplayFormat = '0.00'
    end
    object qurQuery1DOXOD: TFloatField
      DisplayLabel = #1044#1086#1093#1086#1076', '#1075#1088#1085
      FieldName = 'DOXOD'
      DisplayFormat = '0.00'
    end
    object qurQuery1RENT: TFloatField
      DisplayLabel = '% '#1056#1077#1085#1090#1072#1073#1077#1083#1100#1085#1086#1089#1090#1080
      DisplayWidth = 5
      FieldName = 'RENT'
      DisplayFormat = '0.0'
    end
  end
  object DataSetProvider2: TDataSetProvider
    DataSet = SQLDataSet2
    UpdateMode = upWhereKeyOnly
    Left = 360
    Top = 88
  end
  object SQLDataSet2: TSQLDataSet
    CommandText = 
      'select id_pos,id_nakld,id_tovar,id_sklad,tara,nalog_nds,'#13#10'  kurs' +
      ',kurs2,skidka,cena,kolotp,cena_sebest,'#13#10'  cena_grn, dat,'#13#10'  cena' +
      '_grn*(1+nalog_nds) as cena_grn_nds,'#13#10'  Round(cena_grn*(1+nalog_n' +
      'ds),2)*kolotp as sum_grn_nds,'#13#10'  Round(cena_sebest*kolotp,2) as ' +
      'ssum_ye_nds,'#13#10'  Round(cena_sebest*kurs2,2)*kolotp as nds_sebest,' +
      '       Round(cena_grn*(1+nalog_nds),2)*kolotp -        Round(cen' +
      'a_sebest*kurs2,2)*kolotp  as doxod,    100*dzero(   Round(cena_g' +
      'rn*(1+nalog_nds),2)*kolotp -   Round(cena_sebest*kurs2,2)*kolotp' +
      ', '#13#10'  Round(cena_sebest*kurs2,2)*kolotp, 0) as percent,'#13#10'  price' +
      '_minus_18_compare,'#13#10'  id_analog '#13#10'from '#13#10'  rep_sebest4_rec_pc(:i' +
      'd_nakl,null)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_nakl'
        ParamType = ptInput
        Value = 27736
      end>
    SQLConnection = dmdEx.scUchet
    Left = 360
    Top = 56
    object SQLDataSet2ID_POS: TIntegerField
      FieldName = 'ID_POS'
      ProviderFlags = []
    end
    object SQLDataSet2ID_NAKLD: TIntegerField
      FieldName = 'ID_NAKLD'
      ProviderFlags = [pfInKey]
    end
    object SQLDataSet2ID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
      ProviderFlags = []
    end
    object SQLDataSet2TARA: TIntegerField
      FieldName = 'TARA'
      ProviderFlags = []
    end
    object SQLDataSet2NALOG_NDS: TFMTBCDField
      FieldName = 'NALOG_NDS'
      ProviderFlags = []
      Precision = 15
    end
    object SQLDataSet2KURS: TFloatField
      FieldName = 'KURS'
      ProviderFlags = []
    end
    object SQLDataSet2KURS2: TFloatField
      FieldName = 'KURS2'
      ProviderFlags = []
    end
    object SQLDataSet2SKIDKA: TFMTBCDField
      FieldName = 'SKIDKA'
      ProviderFlags = []
      Precision = 15
      Size = 2
    end
    object SQLDataSet2CENA: TFMTBCDField
      FieldName = 'CENA'
      ProviderFlags = []
      Precision = 15
    end
    object SQLDataSet2KOLOTP: TFloatField
      FieldName = 'KOLOTP'
      ProviderFlags = []
    end
    object SQLDataSet2CENA_SEBEST: TFMTBCDField
      FieldName = 'CENA_SEBEST'
      ProviderFlags = []
      Precision = 15
    end
    object SQLDataSet2CENA_GRN: TFMTBCDField
      FieldName = 'CENA_GRN'
      ProviderFlags = []
      Precision = 15
    end
    object SQLDataSet2DAT: TSQLTimeStampField
      FieldName = 'DAT'
      ProviderFlags = []
    end
    object SQLDataSet2SUM_GRN_NDS: TFloatField
      FieldName = 'SUM_GRN_NDS'
      ProviderFlags = []
    end
    object SQLDataSet2SSUM_YE_NDS: TFloatField
      FieldName = 'SSUM_YE_NDS'
      ProviderFlags = []
    end
    object SQLDataSet2NDS_SEBEST: TFloatField
      FieldName = 'NDS_SEBEST'
      ProviderFlags = []
    end
    object SQLDataSet2DOXOD: TFloatField
      FieldName = 'DOXOD'
      ProviderFlags = []
    end
    object SQLDataSet2PERCENT: TFloatField
      FieldName = 'PERCENT'
      ProviderFlags = []
    end
    object SQLDataSet2ID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
    end
    object SQLDataSet2PRICE_MINUS_18_COMPARE: TFloatField
      FieldName = 'PRICE_MINUS_18_COMPARE'
    end
    object SQLDataSet2ID_ANALOG: TIntegerField
      FieldName = 'ID_ANALOG'
    end
    object SQLDataSet2CENA_GRN_NDS: TFMTBCDField
      FieldName = 'CENA_GRN_NDS'
      Precision = 15
    end
  end
  object qurQuery3: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_nakl'
        ParamType = ptInput
        Value = 27736
      end>
    ProviderName = 'DataSetProvider2'
    Left = 360
    Top = 120
    object qurQuery3ID_POS: TIntegerField
      DisplayLabel = #8470#1087'.'#1087
      DisplayWidth = 2
      FieldName = 'ID_POS'
      ProviderFlags = []
    end
    object qurQuery3ID_NAKLD: TIntegerField
      FieldName = 'ID_NAKLD'
      ProviderFlags = [pfInKey]
      Visible = False
    end
    object qurQuery3ID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
      ProviderFlags = []
      Visible = False
    end
    object qurQuery3TOVAR: TStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      DisplayWidth = 15
      FieldKind = fkLookup
      FieldName = 'TOVAR'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_TOVAR'
      Size = 50
      Lookup = True
    end
    object qurQuery3KOLOTP: TFloatField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      DisplayWidth = 8
      FieldName = 'KOLOTP'
      ProviderFlags = []
      DisplayFormat = '0.000'
    end
    object qurQuery3SKIDKA: TFMTBCDField
      DisplayLabel = #1057#1082#1080#1076#1082#1072',%'
      DisplayWidth = 4
      FieldName = 'SKIDKA'
      ProviderFlags = []
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object qurQuery3TARA: TIntegerField
      FieldName = 'TARA'
      ProviderFlags = []
      Visible = False
      DisplayFormat = '0.00'
    end
    object qurQuery3NALOG_NDS: TFMTBCDField
      FieldName = 'NALOG_NDS'
      ProviderFlags = []
      Visible = False
      Precision = 15
    end
    object qurQuery3KURS: TFloatField
      FieldName = 'KURS'
      ProviderFlags = []
      Visible = False
      DisplayFormat = '0.0000'
    end
    object qurQuery3KURS2: TFloatField
      DisplayLabel = #1050#1091#1088#1089
      DisplayWidth = 7
      FieldName = 'KURS2'
      ProviderFlags = []
      DisplayFormat = '0.0000'
    end
    object qurQuery3CENA: TFMTBCDField
      DisplayLabel = #1062#1077#1085#1072', '#1075#1088#1085
      FieldName = 'CENA'
      ProviderFlags = []
      Visible = False
      DisplayFormat = '0.00'
      Precision = 15
    end
    object qurQuery3CENA_GRN: TFMTBCDField
      DisplayLabel = #1062#1077#1085#1072', '#1075#1088#1085
      DisplayWidth = 10
      FieldName = 'CENA_GRN'
      ProviderFlags = []
      DisplayFormat = '0.00'
      Precision = 15
    end
    object qurQuery3CENA_GRN_NDS: TFMTBCDField
      DisplayLabel = #1062#1077#1085#1072'+'#1053#1044#1057', '#1075#1088#1085
      DisplayWidth = 10
      FieldName = 'CENA_GRN_NDS'
      DisplayFormat = '0.00'
      Precision = 15
    end
    object qurQuery3SUM_GRN_NDS: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1087#1088#1086#1076', '#1075#1088#1085
      DisplayWidth = 10
      FieldName = 'SUM_GRN_NDS'
      ProviderFlags = []
      DisplayFormat = '0.00'
    end
    object qurQuery3CENA_SEBEST: TFMTBCDField
      DisplayLabel = #1057#1077#1073#1077#1089#1090#1086#1080#1084', '#1091'.'#1077'.'
      DisplayWidth = 10
      FieldName = 'CENA_SEBEST'
      ProviderFlags = []
      DisplayFormat = '0.00'
      Precision = 15
    end
    object qurQuery3SSUM_YE_NDS: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1089#1077#1073', '#1091'.'#1077'.'
      DisplayWidth = 10
      FieldName = 'SSUM_YE_NDS'
      ProviderFlags = []
      DisplayFormat = '0.00'
    end
    object qurQuery3NDS_SEBEST: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1089#1077#1073', '#1075#1088#1085
      DisplayWidth = 10
      FieldName = 'NDS_SEBEST'
      ProviderFlags = []
      DisplayFormat = '0.00'
    end
    object qurQuery3DOXOD: TFloatField
      DisplayLabel = #1044#1086#1093#1086#1076', '#1075#1088#1085
      DisplayWidth = 10
      FieldName = 'DOXOD'
      ProviderFlags = []
      DisplayFormat = '0.00'
    end
    object qurQuery3PERCENT: TFloatField
      DisplayLabel = #1056#1077#1085#1090#1072#1073', %'
      DisplayWidth = 7
      FieldName = 'PERCENT'
      ProviderFlags = []
      DisplayFormat = '0.00'
    end
    object qurQuery3DAT: TSQLTimeStampField
      FieldName = 'DAT'
      ProviderFlags = []
    end
    object qurQuery3ID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
      Visible = False
    end
    object qurQuery3PRICE_MINUS_18_COMPARE: TFloatField
      DisplayLabel = #1057#1082#1080#1076#1082#1072' '#1086#1090' '#1087#1088#1072#1081#1089#1072', %'
      DisplayWidth = 7
      FieldName = 'PRICE_MINUS_18_COMPARE'
      DisplayFormat = '0.00'
    end
    object qurQuery3ID_ANALOG: TIntegerField
      FieldName = 'ID_ANALOG'
    end
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmSebMain'
    StorageManager = RegPropStorageManEh1
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      '<P>.WindowState'
      'Panel1.<P>.Height'
      'Panel1.DBGridEh1.<P>.Columns.<ForAllItems>.Width'
      'Panel2.DBGridEh2.<P>.Columns.<ForAllItems>.Width')
    Left = 360
    Top = 152
  end
  object RegPropStorageManEh1: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 328
    Top = 152
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
    Left = 392
    Top = 56
  end
  object UnfFilter2: TUnfFilter
    DBGridEh = DBGridEh2
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
    Left = 392
    Top = 88
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
        Value = #1042#1067#1055#1051#1040#1058#1040' '#1055#1056#1048#1041#1067#1051#1048
      end>
    SQLConnection = dmdEx.scUchet
    Left = 424
    Top = 56
  end
  object PopupMenu2: TPopupMenu
    Left = 392
    Top = 120
    object N1: TMenuItem
      Action = actSebestDet
    end
    object actKurs1: TMenuItem
      Action = actKurs
    end
    object N6: TMenuItem
      Action = actShowRepPrice
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 424
    Top = 120
    object N2: TMenuItem
      Action = actRealPrice
    end
    object N3: TMenuItem
      Action = actPrixDet
    end
    object N4: TMenuItem
      Action = actShowNaklr
    end
    object N5: TMenuItem
      Action = actShowNaklo
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
      object N7: TMenuItem
        Action = actShowNaklr
      end
      object MenuItem5: TMenuItem
        Action = actShowNaklo
      end
      object N8: TMenuItem
        Action = actShowRepPrice
      end
      object N9: TMenuItem
        Action = actKurs
      end
      object N10: TMenuItem
        Action = actSebestDet
      end
    end
  end
end
