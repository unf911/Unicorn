object frmRasxPoKasse: TfrmRasxPoKasse
  Left = 6
  Top = 44
  BorderStyle = bsDialog
  Caption = #1056#1072#1089#1093#1086#1076' '#1087#1086' '#1082#1072#1089#1089#1077
  ClientHeight = 360
  ClientWidth = 626
  Color = clBtnFace
  Constraints.MinHeight = 362
  Constraints.MinWidth = 479
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
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 213
    Width = 626
    Height = 8
    Cursor = crVSplit
    Align = alTop
    Beveled = True
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 337
    Width = 626
    Height = 23
    Panels = <>
    SimplePanel = True
  end
  object dbgNaklot: TDBGridEh
    Left = 0
    Top = 221
    Width = 626
    Height = 116
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
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind]
    PopupMenu = PopupMenu1
    ReadOnly = True
    SumList.Active = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ID'
        Footer.ValueType = fvtCount
        Footers = <>
        Width = 39
      end
      item
        EditButtons = <>
        FieldName = 'DAT'
        Footers = <>
        Width = 47
      end
      item
        EditButtons = <>
        FieldName = 'NDS'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 57
      end
      item
        EditButtons = <>
        FieldName = 'OTKAT'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 57
      end
      item
        EditButtons = <>
        FieldName = 'OSTATOK'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 62
      end
      item
        EditButtons = <>
        FieldName = 'ID_NAKL'
        Footers = <>
        Visible = False
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 626
    Height = 213
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Panel4: TPanel
      Left = 532
      Top = 0
      Width = 94
      Height = 213
      Align = alRight
      BevelOuter = bvNone
      Constraints.MinHeight = 150
      TabOrder = 1
      DesignSize = (
        94
        213)
      object BitBtn2: TBitBtn
        Left = 4
        Top = 0
        Width = 90
        Height = 33
        Action = actPost
        Anchors = [akLeft, akTop, akRight]
        Caption = #1055#1088#1086#1074#1077#1089#1090#1080
        TabOrder = 0
      end
      object btnUnpost: TBitBtn
        Left = 4
        Top = 40
        Width = 90
        Height = 33
        Action = actUnpost
        Anchors = [akLeft, akTop, akRight]
        Caption = #1042#1077#1088#1085#1091#1090#1100
        TabOrder = 1
      end
      object BitBtn5: TBitBtn
        Left = 4
        Top = 112
        Width = 90
        Height = 25
        Action = actSettings
        Anchors = [akLeft, akTop, akRight]
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
        TabOrder = 2
      end
      object BitBtn7: TBitBtn
        Left = 4
        Top = 80
        Width = 90
        Height = 25
        Action = actRefresh
        Anchors = [akLeft, akTop, akRight]
        Caption = #1054#1073#1085#1086#1074#1080#1090#1100
        TabOrder = 3
        Kind = bkRetry
      end
      object btnSettings: TBitBtn
        Left = 4
        Top = 144
        Width = 90
        Height = 25
        Action = actFullTransh
        Anchors = [akLeft, akTop, akRight]
        Caption = '&'#1054#1087#1083#1072#1090#1080#1090#1100
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        TabStop = False
      end
      object Button1: TButton
        Left = 4
        Top = 173
        Width = 90
        Height = 25
        Action = actClearOpl
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 5
        TabStop = False
      end
    end
    object dbgNaklo: TDBGridEh
      Left = 0
      Top = 0
      Width = 532
      Height = 213
      Align = alClient
      DataSource = dsNaklo
      EditActions = [geaCopyEh, geaSelectAllEh]
      Flat = False
      FooterColor = clInfoBk
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight]
      PopupMenu = PopupMenu2
      ReadOnly = True
      SortLocal = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = dbgNakloDblClick
      OnKeyDown = dbgNakloKeyDown
      Columns = <
        item
          EditButtons = <>
          FieldName = 'ID'
          Footer.ValueType = fvtCount
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'DAT'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'IZG'
          Footers = <>
          Width = 70
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
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'NDS'
          Footer.ValueType = fvtSum
          Footers = <>
          Width = 67
        end
        item
          Checkboxes = True
          EditButtons = <>
          FieldName = 'POSTED'
          Footers = <>
          KeyList.Strings = (
            '1'
            '0')
        end
        item
          EditButtons = <>
          FieldName = 'OSTATOK'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'COMMENT'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'BANK_FROM'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'ZATRATY'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'XOZOPER'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'ID_NAKL'
          Footers = <>
          Visible = False
        end>
    end
  end
  object ActionList1: TActionList
    Left = 192
    Top = 56
    object actFullTransh: TAction
      Caption = '&'#1054#1087#1083#1072#1090#1080#1090#1100
      ShortCut = 32842
      OnExecute = actFullTranshExecute
    end
    object actPartTransh: TAction
      Caption = #1063#1072#1089#1090#1080#1095#1085#1086' '#1086#1087'&'#1083#1072#1090#1080#1090#1100
      ShortCut = 32843
    end
    object actClearNakl: TAction
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100' &'#1085#1072#1082#1083#1072#1076#1085#1091#1102
      ShortCut = 32857
    end
    object actClearOpl: TAction
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100' &'#1087#1083#1072#1090#1105#1078
      ShortCut = 32839
      OnExecute = actClearOplExecute
    end
    object actGrid1ListShow: TAction
      Caption = 'actGrid1ListShow'
      OnExecute = actGrid1ListShowExecute
    end
    object actClearOplaty: TAction
      Caption = 'actClearOplaty'
      OnExecute = actClearOplatyExecute
    end
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ShortCut = 116
      OnExecute = actRefreshExecute
    end
    object actShowDet: TAction
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      Hint = #1044#1077#1090#1072#1083#1100#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1087#1086' '#1087#1083#1072#1090#1077#1078#1091' '#1080' '#1085#1072#1082#1083#1072#1076#1085#1086#1081' (F9)'
      OnExecute = actShowDetExecute
    end
    object actNerazn: TAction
      Caption = #1053#1077#1088#1072#1079#1085#1077#1089#1077#1085#1085#1086
      Hint = 
        #1055#1088#1080' '#1074#1082#1083#1102#1095#1077#1085#1080#1080' '#1074#1080#1076#1085#1099' '#1087#1083#1072#1090#1077#1078#1080' '#1074' '#1082#1086#1090#1086#1088#1099#1093' '#1090#1088#1077#1073#1091#1077#1090#1089#1103' '#1079#1072#1087#1086#1083#1085#1080#1090#1100' '#1087#1086#1083#1077' "' +
        #1063#1100#1103' '#1087#1088#1077#1076#1086#1087#1083#1072#1090#1072'"'
    end
    object actAllOpl: TAction
      Caption = #1042#1089#1077' '#1087#1083#1072#1090#1077#1078#1080'/'#1087#1088#1077#1076
      Checked = True
      Hint = 
        #1055#1088#1080' '#1074#1099#1082#1083#1102#1095#1077#1085#1080#1080' '#1074#1080#1076#1085#1099' '#1074#1089#1077' '#1087#1088#1077#1086#1087#1083#1072#1090#1099' '#1082#1086#1090#1086#1088#1099#1077' '#1084#1086#1078#1085#1086' '#1088#1072#1079#1085#1077#1089#1090#1080' '#1087#1086' '#1085#1072#1082 +
        #1083#1072#1076#1085#1099#1084
    end
    object actAllNakl: TAction
      Caption = #1042#1089#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077
      Checked = True
      Hint = #1055#1088#1080' '#1074#1099#1082#1083#1102#1095#1077#1085#1080#1080' '#1074#1080#1076#1085#1099' '#1090#1086#1083#1100#1082#1086' '#1085#1077#1086#1087#1083#1072#1095#1077#1085#1085#1099#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077
    end
    object actSettings: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      Hint = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1077#1088#1080#1086#1076#1072' '#1074#1088#1077#1084#1077#1085#1080
      ShortCut = 16465
      OnExecute = actSettingsExecute
    end
    object actApply: TAction
      Caption = 'actApply'
      OnExecute = actApplyExecute
    end
    object actFinance: TAction
      Caption = #1060#1080#1085#1072#1085#1089#1086#1074#1099#1081' '#1087#1083#1072#1090#1105#1078
      OnExecute = actFinanceExecute
    end
    object actPost: TAction
      Caption = #1055#1088#1086#1074#1077#1089#1090#1080
      OnExecute = actPostExecute
    end
    object actUnpost: TAction
      Caption = #1042#1077#1088#1085#1091#1090#1100
      OnExecute = actUnpostExecute
    end
    object actShowDeleted: TAction
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1091#1076#1072#1083#1105#1085#1085#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
      OnExecute = actShowDeletedExecute
    end
    object actUndeleteNakl: TAction
      Caption = #1042#1077#1088#1085#1091#1090#1100' '#1091#1076#1072#1083#1105#1085#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      Visible = False
      OnExecute = actUndeleteNaklExecute
    end
    object actKursChange: TAction
      Caption = 'actKursChange'
    end
    object actDebug: TAction
      Caption = #1056#1077#1078#1080#1084' '#1086#1090#1083#1072#1076#1082#1080
      OnExecute = actDebugExecute
    end
    object actShowRealPrice: TAction
      Caption = #1060#1072#1082#1090#1080#1095#1077#1089#1082#1080#1077' '#1094#1077#1085#1099
      OnExecute = actShowRealPriceExecute
    end
    object actShowRepDolgNal: TAction
      Caption = #1053#1072#1083#1080#1095#1085#1099#1077' '#1076#1086#1083#1075#1080
      OnExecute = actShowRepDolgNalExecute
    end
  end
  object dsNaklo: TDataSource
    DataSet = cdsNaklo
    Left = 64
    Top = 56
  end
  object dsNaklot: TDataSource
    DataSet = cdsNaklot
    Left = 96
    Top = 56
  end
  object qeNaklot: TQueryExtender
    Query = cdsNaklot
    KeyField = 'id_nakl'
    Left = 96
    Top = 120
  end
  object dsTemp: TDataSource
    Left = 160
    Top = 56
  end
  object MainMenu1: TMainMenu
    Left = 256
    Top = 24
    object N1: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      GroupIndex = 10
      object N4: TMenuItem
        Action = actRefresh
        GroupIndex = 7
      end
      object N3: TMenuItem
        Action = actSettings
        GroupIndex = 7
      end
      object N5: TMenuItem
        Action = actShowDeleted
        GroupIndex = 7
      end
      object N6: TMenuItem
        Action = actUndeleteNakl
        GroupIndex = 7
      end
      object N8: TMenuItem
        Action = actShowRealPrice
        GroupIndex = 7
      end
      object N9: TMenuItem
        Action = actShowRepDolgNal
        GroupIndex = 7
      end
      object N2: TMenuItem
        Action = actDebug
        GroupIndex = 7
      end
    end
  end
  object sdsPlat: TSQLDataSet
    CommandText = 
      'select'#13#10'  id_nakl,dat,id_zak,id_izg,nds,comment, id_manager,id,'#13 +
      #10'  posted,id_schet,parent_id_nakl,zatraty,kurs,id_currency,'#13#10'  i' +
      'd_vlad_schet,kurs_indirect,nds_from,'#13#10'  (select z(sum(kredit)) f' +
      'rom provodki pr where pr.id_nakl=o.id_nakl and pr.id_schet=:id_s' +
      'chet and pr.sub4=o.id_nakl) as ostatok,'#13#10'  id_xoz_oper'#13#10'from RAS' +
      'XOD_NAL_VW o'#13#10'order by o.dat,o.id_nakl'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'id_schet'
        ParamType = ptInput
        Value = -82
      end>
    SQLConnection = dmdEx.scUchet
    Left = 64
    Top = 184
    object sdsPlatID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sdsPlatDAT: TSQLTimeStampField
      FieldName = 'DAT'
    end
    object sdsPlatID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
    end
    object sdsPlatID_IZG: TIntegerField
      FieldName = 'ID_IZG'
    end
    object sdsPlatNDS: TFMTBCDField
      FieldName = 'NDS'
      Precision = 15
      Size = 4
    end
    object sdsPlatCOMMENT: TStringField
      FieldName = 'COMMENT'
      Size = 50
    end
    object sdsPlatID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
    end
    object sdsPlatID: TStringField
      FieldName = 'ID'
    end
    object sdsPlatPOSTED: TSmallintField
      FieldName = 'POSTED'
      ProviderFlags = []
    end
    object sdsPlatPARENT_ID_NAKL: TIntegerField
      FieldName = 'PARENT_ID_NAKL'
    end
    object sdsPlatZATRATY: TFMTBCDField
      FieldName = 'ZATRATY'
      Precision = 15
      Size = 4
    end
    object sdsPlatKURS: TFloatField
      FieldName = 'KURS'
    end
    object sdsPlatID_CURRENCY: TSmallintField
      FieldName = 'ID_CURRENCY'
    end
    object sdsPlatKURS_INDIRECT: TSmallintField
      FieldName = 'KURS_INDIRECT'
    end
    object sdsPlatOSTATOK: TFloatField
      FieldName = 'OSTATOK'
      ProviderFlags = []
    end
    object sdsPlatID_SCHET: TIntegerField
      FieldName = 'ID_SCHET'
    end
    object sdsPlatID_VLAD_SCHET: TIntegerField
      FieldName = 'ID_VLAD_SCHET'
    end
    object sdsPlatNDS_FROM: TFMTBCDField
      FieldName = 'NDS_FROM'
      Precision = 15
      Size = 4
    end
    object sdsPlatID_XOZ_OPER: TIntegerField
      FieldName = 'ID_XOZ_OPER'
    end
  end
  object dspPlat: TDataSetProvider
    DataSet = sdsPlat
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspPlatBeforeUpdateRecord
    OnGetTableName = dspPlatGetTableName
    Left = 64
    Top = 216
  end
  object cdsNaklo: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'id_schet'
        ParamType = ptInput
        Value = -82
      end>
    ProviderName = 'dspPlat'
    AfterInsert = cdsNakloAfterInsert
    BeforeScroll = cdsNakloBeforeScroll
    AfterScroll = cdsNakloAfterScroll
    OnReconcileError = cdsNakloReconcileError
    Left = 64
    Top = 248
    object cdsNakloID: TStringField
      DisplayLabel = #8470#1087#1083#1072#1090
      DisplayWidth = 7
      FieldName = 'ID'
    end
    object cdsNakloIDI: TIntegerField
      DisplayLabel = #8470#1087#1083#1072#1090
      FieldName = 'ID_NAKL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object cdsNakloDAT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 10
      FieldName = 'DAT'
      Required = True
      DisplayFormat = 'dd.mm.yy'
      EditMask = '!99/99/00;1;_'
    end
    object cdsNakloIZG: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'IZG'
      LookupDataSet = dmdEx.cdsVlad
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_IZG'
      Size = 50
      Lookup = True
    end
    object cdsNakloZAK: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'ZAK'
      LookupDataSet = dmdEx.cdsClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_ZAK'
      Size = 50
      Lookup = True
    end
    object cdsNakloID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
      Visible = False
    end
    object cdsNakloMANAGER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'MANAGER'
      LookupDataSet = dmdEx.cdsManager
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_MANAGER'
      Lookup = True
    end
    object cdsNakloID_IZG: TIntegerField
      FieldName = 'ID_IZG'
      Visible = False
    end
    object cdsNakloOPL: TFMTBCDField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1079#1072#1095#1080#1089#1083#1077#1085#1080#1103
      DisplayWidth = 10
      FieldName = 'NDS'
      Required = True
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 15
    end
    object cdsNakloPRIM: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      DisplayWidth = 15
      FieldName = 'COMMENT'
      Size = 25
    end
    object cdsNakloID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
      Visible = False
    end
    object cdsNakloPOSTED: TSmallintField
      DisplayLabel = #1055#1088#1086#1074#1077#1076#1077#1085#1086
      DisplayWidth = 2
      FieldName = 'POSTED'
      ProviderFlags = []
      Required = True
    end
    object cdsNakloPARENT_ID_NAKL: TIntegerField
      FieldName = 'PARENT_ID_NAKL'
    end
    object cdsNakloZATRATY: TFMTBCDField
      DisplayLabel = '% '#1082#1086#1084#1080#1089#1089#1080#1080
      FieldName = 'ZATRATY'
      DisplayFormat = '0.00'
      Precision = 15
    end
    object cdsNakloKURS: TFloatField
      DisplayLabel = #1050#1091#1088#1089
      FieldName = 'KURS'
      Required = True
      DisplayFormat = '0.0000'
    end
    object cdsNakloCURRENCY: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072' '#1080#1089#1093#1086#1076#1085#1072#1103
      DisplayWidth = 5
      FieldKind = fkLookup
      FieldName = 'CURRENCY'
      LookupDataSet = dmdEx.cdsCurrency
      LookupKeyFields = 'OID'
      LookupResultField = 'FULLNAME'
      KeyFields = 'ID_CURRENCY'
      Lookup = True
    end
    object cdsNakloID_CURRENCY: TSmallintField
      FieldName = 'ID_CURRENCY'
      Required = True
    end
    object cdsNakloKURS_INDIRECT: TSmallintField
      FieldName = 'KURS_INDIRECT'
    end
    object cdsNakloOSTATOK: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082
      FieldName = 'OSTATOK'
      ProviderFlags = []
      DisplayFormat = '0.00'
    end
    object cdsNakloID_SCHET: TIntegerField
      FieldName = 'ID_SCHET'
      Visible = False
    end
    object cdsNakloID_VLAD_SCHET: TIntegerField
      FieldName = 'ID_VLAD_SCHET'
      Visible = False
    end
    object cdsNakloVLAD_SCHET: TStringField
      DisplayLabel = #1060#1080#1088#1084#1072
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'VLAD_SCHET'
      LookupDataSet = dmdEx.cdsVlad
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_VLAD_SCHET'
      Size = 50
      Lookup = True
    end
    object cdsNakloBANK_FROM: TStringField
      DisplayLabel = #1057#1095#1105#1090' '#1092#1080#1088#1084#1099
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'BANK_FROM'
      LookupDataSet = dmdEx.cdsBank
      LookupKeyFields = 'OID'
      LookupResultField = 'FULLNAME'
      KeyFields = 'ID_SCHET'
      Size = 50
      Lookup = True
    end
    object cdsNakloNDS_FROM: TFMTBCDField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1082#1086#1084#1080#1089#1089#1080#1080
      FieldName = 'NDS_FROM'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 4
    end
    object cdsNakloID_XOZ_OPER: TIntegerField
      FieldName = 'ID_XOZ_OPER'
    end
    object cdsNakloXOZOPER: TStringField
      DisplayLabel = #1061#1086#1079#1086#1087#1077#1088#1072#1094#1080#1103
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'XOZOPER'
      LookupDataSet = cdsXozOper
      LookupKeyFields = 'OID'
      LookupResultField = 'FULLNAME'
      KeyFields = 'ID_XOZ_OPER'
      Size = 50
      Lookup = True
    end
  end
  object cdsNaklot: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_izg'
        ParamType = ptInput
        Value = 14975
      end
      item
        DataType = ftString
        Name = 'id_zak'
        ParamType = ptInput
        Value = 14
      end
      item
        DataType = ftInteger
        Name = 'id_manager'
        ParamType = ptInput
        Value = 3084
      end>
    ProviderName = 'dspNaklr'
    BeforeOpen = cdsNaklotBeforeOpen
    OnReconcileError = cdsNaklotReconcileError
    Left = 96
    Top = 248
    object cdsNaklotID: TStringField
      DisplayLabel = #8470#1085#1072#1082#1083
      FieldName = 'ID'
    end
    object cdsNaklotDAT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DAT'
      DisplayFormat = 'dd.mm.yy'
    end
    object cdsNaklotNDS: TFMTBCDField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'NDS'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object cdsNaklotID_NAKL: TIntegerField
      DisplayLabel = #1048#1076#1077#1085#1090
      FieldName = 'ID_NAKL'
    end
    object cdsNaklotOTKAT: TFloatField
      DisplayLabel = #1054#1090#1082#1072#1090
      FieldName = 'OTKAT'
      DisplayFormat = '0.00'
    end
    object cdsNaklotSUB1: TIntegerField
      FieldName = 'SUB1'
    end
    object cdsNaklotSUB2: TIntegerField
      FieldName = 'SUB2'
    end
    object cdsNaklotSUB3: TIntegerField
      FieldName = 'SUB3'
    end
    object cdsNaklotDAT_FIRST: TSQLTimeStampField
      FieldName = 'DAT_FIRST'
    end
    object cdsNaklotOSTATOK: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082
      FieldName = 'OSTATOK'
      ProviderFlags = []
      DisplayFormat = '0.00'
    end
  end
  object dspNaklr: TDataSetProvider
    DataSet = sdsNaklr
    Options = [poAllowCommandText]
    Left = 96
    Top = 216
  end
  object sdsNaklr: TSQLDataSet
    CommandText = 
      'select ID,  DAT,  NDS,  SUB1 , SUB2,  SUB3,  ID_NAKL,  OTKAT,  D' +
      'AT_FIRST,  OSTATOK'#13#10'from RASXOD_NAL_LOWER_GRID_PC(:id_izg,:id_za' +
      'k,:id_manager,0)'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_izg'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_zak'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_manager'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 96
    Top = 184
    object sdsNaklrID: TStringField
      FieldName = 'ID'
    end
    object sdsNaklrDAT: TSQLTimeStampField
      FieldName = 'DAT'
    end
    object sdsNaklrSUB1: TIntegerField
      FieldName = 'SUB1'
    end
    object sdsNaklrSUB2: TIntegerField
      FieldName = 'SUB2'
    end
    object sdsNaklrSUB3: TIntegerField
      FieldName = 'SUB3'
    end
    object sdsNaklrID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
    end
    object sdsNaklrOTKAT: TFloatField
      FieldName = 'OTKAT'
    end
    object sdsNaklrDAT_FIRST: TSQLTimeStampField
      FieldName = 'DAT_FIRST'
    end
    object sdsNaklrOSTATOK: TFloatField
      FieldName = 'OSTATOK'
      ProviderFlags = []
    end
    object sdsNaklrNDS: TFMTBCDField
      FieldName = 'NDS'
      Precision = 15
      Size = 4
    end
  end
  object stpTransh: TSQLDataSet
    CommandText = 'MAKE_TRANSH_PROVODKI'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'TYPE1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TYPE2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'WHAT_ID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'SUMA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'RESULT'
        ParamType = ptOutput
        Size = 8
      end>
    SQLConnection = dmdEx.scUchet
    Left = 224
    Top = 24
  end
  object qeNaklo: TQueryExtender
    Query = cdsNaklo
    KeyField = 'id_nakl'
    Left = 64
    Top = 120
  end
  object sdsFinTransh: TSQLDataSet
    CommandText = 'MAKE_FIN_TRASH'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'RESULT'
        ParamType = ptOutput
        Size = 8
      end>
    SQLConnection = dmdEx.scUchet
    Left = 224
    Top = 56
  end
  object stpClearTransh: TSQLDataSet
    CommandText = 'CLEAR_TRANSH'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'TYPE1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID1'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'RESULT'
        ParamType = ptOutput
        Size = 8
      end>
    SQLConnection = dmdEx.scUchet
    Left = 192
    Top = 24
  end
  object sdsOplatyPost: TSQLDataSet
    CommandText = 'OPLATY_POST_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_NAKL'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 224
    Top = 88
  end
  object sdsDelmark: TSQLDataSet
    CommandText = 'RASXOD_NAL_DELMARK_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_NAKL'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 128
    Top = 184
  end
  object sdsPost: TSQLDataSet
    CommandText = 'RASXOD_NAL_POST_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_NAKL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_SCHET'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 160
    Top = 184
  end
  object sdsUnpost: TSQLDataSet
    CommandText = 'RASXOD_NAL_UNPOST_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_NAKL'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 192
    Top = 184
  end
  object PropStorageEh1: TPropStorageEh
    Active = False
    Section = 'TfrmRasxPoKasse'
    StorageManager = rpsClientEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      'dbgNaklot.<P>.Columns.<ForAllItems>.Width'
      'Panel1.dbgNaklo.<P>.Columns.<ForAllItems>.Width')
    Left = 64
    Top = 152
  end
  object rpsClientEdit: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 96
    Top = 152
  end
  object UnfFilter1: TUnfFilter
    DBGridEh = dbgNaklo
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
    Left = 64
    Top = 88
  end
  object PopupMenu1: TPopupMenu
    Left = 252
    Top = 164
    object N7: TMenuItem
      Action = actShowRealPrice
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 288
    Top = 164
    object MenuItem1: TMenuItem
      Action = actShowRepDolgNal
    end
  end
  object sdsBank: TSQLDataSet
    CommandText = 'select '#13#10'   *'#13#10'from '#13#10'   bank_vw b'#13#10'order by b.fullname'
    MaxBlobSize = -1
    Params = <>
    Left = 392
    Top = 181
    object sdsBankID: TIntegerField
      FieldName = 'OID'
      Required = True
    end
    object sdsBankBANK_NAME: TStringField
      FieldName = 'BANK_NAME'
      Size = 50
    end
    object sdsBankRASCH: TFloatField
      FieldName = 'RASCH'
    end
    object sdsBankMFO: TFloatField
      FieldName = 'MFO'
    end
    object sdsBankID_KLIENT: TIntegerField
      FieldName = 'ID_KLIENT'
      Required = True
    end
    object sdsBankID_CURRENCY: TIntegerField
      FieldName = 'ID_CURRENCY'
    end
    object sdsBankDELMARKED: TSmallintField
      FieldName = 'DELMARKED'
    end
    object sdsBankFULLNAME: TStringField
      FieldName = 'FULLNAME'
      Size = 250
    end
  end
  object dspBank: TDataSetProvider
    DataSet = sdsBank
    Options = [poAllowCommandText]
    Left = 392
    Top = 217
  end
  object cdsBank: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBank'
    Left = 392
    Top = 253
    object cdsBankID: TIntegerField
      FieldName = 'OID'
      Required = True
    end
    object cdsBankBANK_NAME: TStringField
      FieldName = 'BANK_NAME'
      Size = 50
    end
    object cdsBankRASCH: TFloatField
      FieldName = 'RASCH'
    end
    object cdsBankMFO: TFloatField
      FieldName = 'MFO'
    end
    object cdsBankID_KLIENT: TIntegerField
      FieldName = 'ID_KLIENT'
      Required = True
    end
    object cdsBankID_CURRENCY: TIntegerField
      FieldName = 'ID_CURRENCY'
    end
    object cdsBankDELMARKED: TSmallintField
      FieldName = 'DELMARKED'
    end
    object cdsBankFULLNAME: TStringField
      FieldName = 'FULLNAME'
      Size = 250
    end
  end
  object dsBank: TDataSource
    DataSet = cdsBank
    Left = 392
    Top = 285
  end
  object sdsXozoper: TSQLDataSet
    CommandText = 
      'select *'#13#10'from spr_xozoper_vw s'#13#10'where s.delmarked=0'#13#10'  and s.ti' +
      'p_document=(select oid'#13#10'    from get_oid_objects_pc('#39#1056#1040#1057#1061#1054#1044' '#1055#1054' '#1050 +
      #1040#1057#1057#1045#39',-100))'#13#10'order by s.name'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 32
    Top = 184
  end
  object dspXozOper: TDataSetProvider
    DataSet = sdsXozoper
    Left = 32
    Top = 216
  end
  object cdsXozOper: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspXozOper'
    Left = 32
    Top = 248
    object cdsXozOperOID: TIntegerField
      FieldName = 'OID'
    end
    object cdsXozOperNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
    object cdsXozOperFULLNAME: TStringField
      FieldName = 'FULLNAME'
      Size = 250
    end
  end
  object dsXozOper: TDataSource
    DataSet = cdsXozOper
    Left = 32
    Top = 280
  end
end
