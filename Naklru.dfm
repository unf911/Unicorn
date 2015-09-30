object frmNaklru: TfrmNaklru
  Left = 569
  Top = 241
  BorderStyle = bsDialog
  Caption = #1056#1072#1089#1093#1086#1076#1085#1099#1077' '#1087#1086' '#1072#1088#1077#1085#1076#1077
  ClientHeight = 379
  ClientWidth = 665
  Color = clBtnFace
  Constraints.MinHeight = 391
  Constraints.MinWidth = 474
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
  OnHide = FormHide
  OnShow = FormShow
  DesignSize = (
    665
    379)
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 177
    Width = 665
    Height = 8
    Cursor = crVSplit
    Align = alTop
    Beveled = True
    MinSize = 5
    ResizeStyle = rsUpdate
  end
  object dbgNaklrt: TDBGridEh
    Left = 0
    Top = 185
    Width = 665
    Height = 194
    Align = alClient
    DataSource = dsNaklot
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    PopupMenu = ppmNaklrt
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgNaklrtDblClick
    OnKeyUp = dbgNaklrtKeyUp
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ID_POS'
        Footers = <>
        Width = 39
      end
      item
        EditButtons = <>
        FieldName = 'TOVAR'
        Footers = <>
        ReadOnly = True
        Width = 214
      end
      item
        EditButtons = <>
        FieldName = 'KOD'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'SKIDKA'
        Footers = <>
        Width = 25
      end
      item
        EditButtons = <>
        FieldName = 'CENA'
        Footers = <>
        Width = 67
      end
      item
        EditButtons = <>
        FieldName = 'CENANDS'
        Footers = <>
        Width = 67
      end
      item
        EditButtons = <>
        FieldName = 'KOLOTP'
        Footers = <>
        Width = 88
      end
      item
        EditButtons = <>
        FieldName = 'SUMA'
        Footers = <>
        Width = 67
      end
      item
        EditButtons = <>
        FieldName = 'SUMANDS'
        Footers = <>
        Width = 67
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 665
    Height = 177
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      665
      177)
    object dbgNaklr: TDBGridEh
      Left = 0
      Top = 0
      Width = 570
      Height = 177
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsNaklo
      EditActions = [geaSelectAllEh]
      Flat = False
      FooterColor = clInfoBk
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgMultiSelect]
      PopupMenu = ppmNaklr
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = dbgNaklrDblClick
      OnKeyDown = dbgNaklrKeyDown
      Columns = <
        item
          EditButtons = <>
          FieldName = 'ID'
          Footer.ValueType = fvtCount
          Footers = <>
          Width = 38
        end
        item
          ButtonStyle = cbsNone
          EditButtons = <>
          FieldName = 'DAT'
          Footers = <>
          Width = 47
        end
        item
          EditButtons = <>
          FieldName = 'IZG'
          Footers = <>
          Width = 116
        end
        item
          EditButtons = <>
          FieldName = 'ZAK'
          Footers = <>
          Width = 116
        end
        item
          EditButtons = <>
          FieldName = 'MANAGER'
          Footers = <>
          Width = 40
        end
        item
          EditButtons = <>
          FieldName = 'CURRENCY'
          Footers = <>
          Width = 39
        end
        item
          EditButtons = <>
          FieldName = 'KURS'
          Footers = <>
          Width = 46
        end
        item
          EditButtons = <>
          FieldName = 'NDS'
          Footer.ValueType = fvtSum
          Footers = <>
          Width = 69
        end
        item
          EditButtons = <>
          FieldName = 'COMMENT'
          Footers = <>
          Width = 74
        end
        item
          Checkboxes = True
          EditButtons = <>
          FieldName = 'POSTED'
          Footers = <>
          KeyList.Strings = (
            '1'
            '0')
          Width = 25
        end
        item
          EditButtons = <>
          FieldName = 'STATYAR'
          Footers = <>
          Width = 74
        end
        item
          EditButtons = <>
          FieldName = 'PROJECT'
          Footers = <>
          Width = 74
        end
        item
          EditButtons = <>
          FieldName = 'XOZOPER'
          Footers = <>
          Width = 74
        end
        item
          EditButtons = <>
          FieldName = 'ID_NAKL'
          Footers = <>
          Visible = False
          Width = 74
        end
        item
          Checkboxes = True
          EditButtons = <>
          FieldName = 'BLOCKED'
          Footers = <>
          KeyList.Strings = (
            '1'
            '0')
          Width = 16
        end>
    end
    object Button3: TButton
      Left = 577
      Top = 74
      Width = 81
      Height = 33
      Action = actCalculateSum
      Anchors = [akTop, akRight]
      TabOrder = 1
      TabStop = False
    end
    object BitBtn2: TBitBtn
      Left = 577
      Top = 0
      Width = 81
      Height = 33
      Action = actPost
      Anchors = [akTop, akRight]
      Caption = #1055#1088#1086#1074#1077#1089#1090#1080
      TabOrder = 2
      TabStop = False
    end
    object BitBtn3: TBitBtn
      Left = 577
      Top = 40
      Width = 81
      Height = 33
      Action = actUnpost
      Anchors = [akTop, akRight]
      Caption = #1042#1077#1088#1085#1091#1090#1100
      TabOrder = 3
      TabStop = False
    end
    object Button2: TButton
      Left = 577
      Top = 112
      Width = 81
      Height = 25
      Action = actRefresh
      Anchors = [akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      TabStop = False
    end
    object Button1: TButton
      Left = 577
      Top = 144
      Width = 81
      Height = 25
      Action = actSettings
      Anchors = [akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      TabStop = False
    end
  end
  object ulbListBox2: TUnfDbLookupListbox
    Left = 600
    Top = 188
    Width = 57
    Height = 147
    Anchors = [akRight, akBottom]
    TabOrder = 2
    Visible = False
    OnDblClick = ulbListBox2DblClick
    OnExit = ulbListBox2Exit
    OnKeyUp = ulbListBox2KeyUp
  end
  object ActionList1: TActionList
    Images = dmdEx.ImageList1
    Left = 296
    Top = 48
    object actSettings: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      ImageIndex = 8
      ShortCut = 16465
      OnExecute = actSettingsExecute
    end
    object actGrid1ListShow: TAction
      Caption = 'actGrid1ListShow'
      OnExecute = actGrid1ListShowExecute
    end
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 9
      ShortCut = 116
      OnExecute = actRefreshExecute
    end
    object actGrid2ListShow: TAction
      Caption = 'actGrid2ListShow'
      OnExecute = actGrid2ListShowExecute
    end
    object actPreview: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      ImageIndex = 2
      ShortCut = 16471
      OnExecute = actPreviewExecute
    end
    object actSchet: TAction
      Caption = #1048#1079' '#1089#1095#1105#1090#1072
      ShortCut = 120
      OnExecute = actSchetExecute
    end
    object actCalculateSum: TAction
      Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100
      OnExecute = actCalculateSumExecute
    end
    object actShowDeleted: TAction
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1091#1076#1072#1083#1105#1085#1085#1099#1077
      OnExecute = actShowDeletedExecute
    end
    object actPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      ImageIndex = 1
      ShortCut = 123
      OnExecute = actPrintExecute
    end
    object actUndeleteNakl: TAction
      Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1091#1076#1072#1083#1105#1085#1085#1091#1102' '#1085#1072#1082#1083#1072#1076#1085#1091#1102
      Visible = False
      OnExecute = actUndeleteNaklExecute
    end
    object actNaklrPost: TAction
      Caption = #1055#1077#1088#1077#1087#1088#1086#1074#1077#1089#1090#1080' '#1085#1072#1082#1083#1072#1076#1085#1091#1102
      OnExecute = actNaklrPostExecute
    end
    object actDebug: TAction
      Caption = #1056#1077#1078#1080#1084' '#1086#1090#1083#1072#1076#1082#1080
      OnExecute = actDebugExecute
    end
    object actShowNaklo: TAction
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1079#1072#1074#1080#1089#1080#1084#1099#1077' '#1086#1090#1075#1088#1091#1079#1082#1080
      Visible = False
      OnExecute = actShowNakloExecute
    end
    object actDesigner: TAction
      Caption = #1044#1080#1079#1072#1081#1085#1077#1088
      Visible = False
      OnExecute = actDesignerExecute
    end
    object actPost: TAction
      Caption = #1055#1088#1086#1074#1077#1089#1090#1080
      OnExecute = actPostExecute
    end
    object actUnpost: TAction
      Caption = #1042#1077#1088#1085#1091#1090#1100
      OnExecute = actUnpostExecute
    end
    object actDefaultopen: TAction
      Caption = 'actDefaultopen'
      OnExecute = actDefaultopenExecute
    end
    object actRecountNakl: TAction
      Caption = 'actRecountNakl'
      OnExecute = actRecountNaklExecute
    end
    object actColumnSetValue: TAction
      Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077#1084
      OnExecute = actColumnSetValueExecute
    end
    object actPostIf2: TAction
      Caption = 'actPostIf2'
      OnExecute = actPostIf2Execute
    end
    object actCreateNaklru: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1088#1072#1089#1093#1086#1076#1085#1091#1102' '#1087#1086' '#1072#1088#1077#1085#1076#1077
      OnExecute = actCreateNaklruExecute
    end
    object actMakeNnakl: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1085#1072#1083#1086#1075#1086#1074#1091#1102' '#1085#1072' '#1086#1089#1085#1086#1074#1072#1085#1080#1080'...'
      OnExecute = actMakeNnaklExecute
    end
  end
  object qeNaklot: TQueryExtender
    Query = cdsNaklot
    KeyField = 'id_nakld'
    Left = 80
    Top = 232
  end
  object Curr2StrUA1: TCurr2StrRU
    Active = False
    MoneyType = mtUAH
    FullString = False
    Left = 328
    Top = 112
  end
  object MainMenu1: TMainMenu
    Left = 328
    Top = 144
    object mnuActions: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      GroupIndex = 10
      object N2: TMenuItem
        Action = actSchet
      end
      object N3: TMenuItem
        Action = actPreview
      end
      object N4: TMenuItem
        Action = actPrint
      end
      object N1: TMenuItem
        Action = actRefresh
      end
      object N5: TMenuItem
        Action = actSettings
      end
      object N7: TMenuItem
        Action = actShowDeleted
      end
      object N8: TMenuItem
        Action = actUndeleteNakl
      end
      object N9: TMenuItem
        Action = actNaklrPost
      end
      object N16: TMenuItem
        Action = actShowNaklo
      end
      object N10: TMenuItem
        Action = actCreateNaklru
      end
      object N11: TMenuItem
        Action = actMakeNnakl
      end
      object N15: TMenuItem
        Action = actDebug
      end
      object N17: TMenuItem
        Action = actDesigner
      end
    end
  end
  object sdsNaklo: TSQLDataSet
    CommandText = 
      'select '#13#10'  om.id_nakl,om.id,om.kurs,'#13#10'  om.nds,'#13#10'  om.dat,'#13#10'  om' +
      '.id_izg,om.id_zak, om.id_manager,'#13#10'  om.nalog_nds,'#13#10'  om.posted,' +
      #13#10'  om.blocked,'#13#10'  om.delmarked,'#13#10'  om.id_currency,'#13#10'  om.id_sta' +
      'tya,'#13#10'  om.id_project,'#13#10'  om.id_xoz_oper,'#13#10'  om.parent_id_nakl,'#13 +
      #10'  om.comment,'#13#10'  (select id from naklo om2 where om2.id_nakl=om' +
      '.parent_id_nakl) as parent_id,'#13#10'  om.id_dogovor'#13#10'from '#13#10'  NAKLRU' +
      '_VW om'#13#10'order by'#13#10'  om.dat,om.id_nakl'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 48
    Top = 104
    object sdsNakloID: TStringField
      FieldName = 'ID'
    end
    object sdsNakloNALOG_NDS: TFMTBCDField
      FieldName = 'NALOG_NDS'
      Required = True
      Precision = 15
      Size = 2
    end
    object sdsNakloDAT: TSQLTimeStampField
      FieldName = 'DAT'
      Required = True
    end
    object sdsNakloPOSTED: TSmallintField
      FieldName = 'POSTED'
      ProviderFlags = []
      Required = True
    end
    object sdsNakloID_CURRENCY: TSmallintField
      FieldName = 'ID_CURRENCY'
      Required = True
    end
    object sdsNakloID_IZG: TIntegerField
      FieldName = 'ID_IZG'
      Required = True
    end
    object sdsNakloID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
      Required = True
    end
    object sdsNakloID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
      Required = True
    end
    object sdsNakloKURS: TFloatField
      FieldName = 'KURS'
      Required = True
    end
    object sdsNakloNDS: TFMTBCDField
      FieldName = 'NDS'
      Required = True
      Precision = 15
    end
    object sdsNakloDELMARKED: TSmallintField
      FieldName = 'DELMARKED'
      Required = True
    end
    object sdsNakloBLOCKED: TSmallintField
      FieldName = 'BLOCKED'
      Required = True
    end
    object sdsNakloID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsNakloID_STATYA: TIntegerField
      FieldName = 'ID_STATYA'
    end
    object sdsNakloID_PROJECT: TIntegerField
      FieldName = 'ID_PROJECT'
    end
    object sdsNakloID_XOZ_OPER: TIntegerField
      FieldName = 'ID_XOZ_OPER'
    end
    object sdsNakloPARENT_ID_NAKL: TIntegerField
      FieldName = 'PARENT_ID_NAKL'
    end
    object sdsNakloPARENT_ID: TStringField
      FieldName = 'PARENT_ID'
      ProviderFlags = []
    end
    object sdsNakloCOMMENT: TStringField
      FieldName = 'COMMENT'
      Size = 50
    end
    object sdsNakloID_DOGOVOR: TIntegerField
      FieldName = 'ID_DOGOVOR'
    end
  end
  object dspNaklo: TDataSetProvider
    DataSet = sdsNaklo
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poPropogateChanges, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspNakloBeforeUpdateRecord
    OnGetTableName = dspNakloGetTableName
    Left = 48
    Top = 136
  end
  object cdsNaklo: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NALOG_NDS'
        Attributes = [faRequired]
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'DAT'
        Attributes = [faRequired]
        DataType = ftTimeStamp
      end
      item
        Name = 'POSTED'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'ID_CURRENCY'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'ID_IZG'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ID_ZAK'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ID_MANAGER'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'KURS'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'NDS'
        Attributes = [faRequired]
        DataType = ftFMTBcd
        Precision = 15
        Size = 8
      end
      item
        Name = 'DELMARKED'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'BLOCKED'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'ID_NAKL'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ID_STATYA'
        DataType = ftInteger
      end
      item
        Name = 'ID_PROJECT'
        DataType = ftInteger
      end
      item
        Name = 'ID_XOZ_OPER'
        DataType = ftInteger
      end
      item
        Name = 'PARENT_ID_NAKL'
        DataType = ftInteger
      end
      item
        Name = 'PARENT_ID'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'COMMENT'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ID_DOGOVOR'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspNaklo'
    StoreDefs = True
    AfterInsert = cdsNakloAfterInsert
    BeforePost = cdsNakloBeforePost
    BeforeScroll = cdsNakloBeforeScroll
    OnReconcileError = cdsNakloReconcileError
    Left = 48
    Top = 168
    object cdsNakloID: TStringField
      DisplayLabel = #8470#1085#1072#1082#1083
      DisplayWidth = 5
      FieldName = 'ID'
      Size = 10
    end
    object cdsNakloDAT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 8
      FieldName = 'DAT'
      Required = True
      DisplayFormat = 'dd.mm.yy'
      EditMask = '!99/99/00;1;_'
    end
    object cdsNakloIZG: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      DisplayWidth = 16
      FieldKind = fkLookup
      FieldName = 'IZG'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_IZG'
      Required = True
      Size = 50
      Lookup = True
    end
    object cdsNakloZAK: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      DisplayWidth = 16
      FieldKind = fkLookup
      FieldName = 'ZAK'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_ZAK'
      Required = True
      Size = 50
      Lookup = True
    end
    object cdsNakloMANAGER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      DisplayWidth = 9
      FieldKind = fkLookup
      FieldName = 'MANAGER'
      LookupDataSet = dmdEx.cdsManager
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_MANAGER'
      Required = True
      Size = 30
      Lookup = True
    end
    object cdsNakloKURS: TFloatField
      DisplayLabel = #1050#1091#1088#1089
      DisplayWidth = 6
      FieldName = 'KURS'
      DisplayFormat = '0.0000'
    end
    object cdsNakloNDS: TFMTBCDField
      DefaultExpression = '0'
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 8
      FieldName = 'NDS'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object cdsNakloNALOG_NDS: TFMTBCDField
      FieldName = 'NALOG_NDS'
      Required = True
      Visible = False
      Precision = 15
      Size = 2
    end
    object cdsNakloPOSTED: TSmallintField
      DefaultExpression = '0'
      DisplayLabel = #1055#1088#1086#1074#1077#1076#1077#1085#1086
      DisplayWidth = 3
      FieldName = 'POSTED'
      ProviderFlags = []
      Required = True
      Visible = False
    end
    object cdsNakloBLOCKED: TSmallintField
      DefaultExpression = '0'
      DisplayLabel = #1054#1088#1080#1075#1080#1085#1072#1083' '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1080
      DisplayWidth = 4
      FieldName = 'BLOCKED'
      Required = True
      Visible = False
    end
    object cdsNakloDELMARKED: TSmallintField
      DefaultExpression = '0'
      DisplayWidth = 3
      FieldName = 'DELMARKED'
      Required = True
      Visible = False
    end
    object cdsNakloID_NAKL: TIntegerField
      DisplayLabel = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088
      FieldName = 'ID_NAKL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object cdsNakloID_IZG: TIntegerField
      FieldName = 'ID_IZG'
      Required = True
      Visible = False
    end
    object cdsNakloID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
      Required = True
      Visible = False
    end
    object cdsNakloID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
      Required = True
      Visible = False
    end
    object cdsNakloID_CURRENCY: TSmallintField
      DefaultExpression = '0'
      FieldName = 'ID_CURRENCY'
      Required = True
      Visible = False
    end
    object cdsNakloIZGFULLNAME: TStringField
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'IZGFULLNAME'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'FULLNAME'
      KeyFields = 'ID_IZG'
      Visible = False
      Size = 252
      Lookup = True
    end
    object cdsNakloZAKFULLNAME: TStringField
      FieldKind = fkLookup
      FieldName = 'ZAKFULLNAME'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'FULLNAME'
      KeyFields = 'ID_ZAK'
      Visible = False
      Size = 252
      Lookup = True
    end
    object cdsNakloID_STATYA: TIntegerField
      FieldName = 'ID_STATYA'
    end
    object cdsNakloID_PROJECT: TIntegerField
      FieldName = 'ID_PROJECT'
    end
    object cdsNakloID_XOZ_OPER: TIntegerField
      FieldName = 'ID_XOZ_OPER'
    end
    object cdsNakloPROJECT: TStringField
      DisplayLabel = #1055#1088#1086#1077#1082#1090
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'PROJECT'
      LookupDataSet = dmdEx.cdsProject
      LookupKeyFields = 'ID'
      LookupResultField = 'FULLNAME'
      KeyFields = 'ID_PROJECT'
      Size = 50
      Lookup = True
    end
    object cdsNakloSTATYAR: TStringField
      DisplayLabel = #1057#1090#1072#1090#1100#1103
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'STATYAR'
      LookupDataSet = dmdEx.cdsStatyaDR
      LookupKeyFields = 'ID'
      LookupResultField = 'FULLNAME'
      KeyFields = 'ID_STATYA'
      Size = 50
      Lookup = True
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
    object cdsNakloPARENT_ID_NAKL: TIntegerField
      FieldName = 'PARENT_ID_NAKL'
    end
    object cdsNakloPARENT_ID: TStringField
      FieldName = 'PARENT_ID'
      ProviderFlags = []
    end
    object cdsNakloCURRENCY: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      DisplayWidth = 5
      FieldKind = fkLookup
      FieldName = 'CURRENCY'
      LookupDataSet = dmdEx.cdsCurrency
      LookupKeyFields = 'OID'
      LookupResultField = 'FULLNAME'
      KeyFields = 'ID_CURRENCY'
      Size = 50
      Lookup = True
    end
    object cdsNakloCOMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      DisplayWidth = 10
      FieldName = 'COMMENT'
      Size = 50
    end
    object cdsNakloID_DOGOVOR: TIntegerField
      FieldName = 'ID_DOGOVOR'
    end
    object cdsNakloDOGOVOR: TStringField
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'DOGOVOR'
      LookupDataSet = cdsDogovor
      LookupKeyFields = 'ID_DOGOVOR'
      LookupResultField = 'ID'
      KeyFields = 'ID_DOGOVOR'
      Size = 50
      Lookup = True
    end
  end
  object dsNaklo: TDataSource
    DataSet = cdsNaklo
    Left = 48
    Top = 200
  end
  object qeNaklo: TQueryExtender
    SlaveQueryExtender = qeNaklot
    Query = cdsNaklo
    KeyField = 'id_nakl'
    Left = 48
    Top = 232
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmNaklru'
    StorageManager = rpsClientEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      'dbgNaklrt.<P>.Columns.<ForAllItems>.Width'
      'Panel1.<P>.Height'
      'Panel1.dbgNaklr.<P>.Columns.<ForAllItems>.Width')
    Left = 112
    Top = 168
  end
  object rpsClientEdit: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 112
    Top = 104
  end
  object sdsDelmark: TSQLDataSet
    CommandText = 'DELMARK_OBJECT_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'OID'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'CLASSID'
        ParamType = ptInput
        Value = Null
      end>
    SQLConnection = dmdEx.scUchet
    Left = 112
    Top = 136
  end
  object sdsNaklot: TSQLDataSet
    CommandText = 
      'select '#13#10'  id_nakl,'#13#10'  id_nakld,'#13#10'  id_pos,  '#13#10'  kodcn,'#13#10'  id_to' +
      'var,'#13#10'  skidka,'#13#10'  cena,'#13#10'  kolotp'#13#10'from '#13#10'  NAKLRU_DET_VW ot'#13#10'w' +
      'here'#13#10'  ot.id_nakl=:id_nakl'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'id_nakl'
        ParamType = ptInput
        Value = '6305'
      end>
    SQLConnection = dmdEx.scUchet
    Left = 80
    Top = 104
    object sdsNaklotID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      Required = True
    end
    object sdsNaklotID_NAKLD: TIntegerField
      FieldName = 'ID_NAKLD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsNaklotID_POS: TIntegerField
      FieldName = 'ID_POS'
      Required = True
    end
    object sdsNaklotKODCN: TSmallintField
      FieldName = 'KODCN'
    end
    object sdsNaklotID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
      Required = True
    end
    object sdsNaklotSKIDKA: TFMTBCDField
      FieldName = 'SKIDKA'
      Precision = 15
      Size = 2
    end
    object sdsNaklotCENA: TFMTBCDField
      FieldName = 'CENA'
      Precision = 15
    end
    object sdsNaklotKOLOTP: TFMTBCDField
      FieldName = 'KOLOTP'
      Precision = 15
    end
  end
  object dspNaklot: TDataSetProvider
    DataSet = sdsNaklot
    Options = [poPropogateChanges, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 80
    Top = 136
  end
  object cdsNaklot: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_NAKL'
    MasterFields = 'ID_NAKL'
    MasterSource = dsNaklo
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'id_nakl'
        ParamType = ptInput
        Value = '6305'
      end>
    ProviderName = 'dspNaklot'
    AfterOpen = cdsNaklotAfterOpen
    BeforeInsert = cdsNaklotBeforeInsert
    AfterInsert = cdsNaklotAfterInsert
    BeforeEdit = cdsNaklotBeforeEdit
    BeforePost = cdsNaklotBeforePost
    AfterDelete = cdsNaklotAfterDelete
    BeforeScroll = cdsNaklotBeforeScroll
    AfterRefresh = cdsNaklotAfterRefresh
    OnCalcFields = cdsNaklotCalcFields
    OnReconcileError = cdsNaklotReconcileError
    Left = 80
    Top = 168
    object cdsNaklotFULLNAME: TStringField
      FieldKind = fkLookup
      FieldName = 'FULLNAME'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'FULLNAME'
      KeyFields = 'ID_TOVAR'
      Size = 250
      Lookup = True
    end
    object cdsNaklotID_POS: TIntegerField
      DisplayLabel = #8470#1087#1086#1079
      DisplayWidth = 5
      FieldName = 'ID_POS'
      Required = True
    end
    object cdsNaklotTOVAR: TStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'TOVAR'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_TOVAR'
      Required = True
      Size = 50
      Lookup = True
    end
    object cdsNaklotSKIDKA: TFMTBCDField
      DisplayLabel = #1057#1082#1080#1076#1082#1072
      DisplayWidth = 3
      FieldName = 'SKIDKA'
      OnChange = cdsNaklotSKIDKAChange
      DisplayFormat = '0.0'
      EditFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsNaklotCENA: TFMTBCDField
      DisplayLabel = #1062#1077#1085#1072
      DisplayWidth = 9
      FieldName = 'CENA'
      OnChange = cdsNaklotCENAChange
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 15
    end
    object cdsNaklotCENANDS: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1089' '#1053#1044#1057
      DisplayWidth = 9
      FieldKind = fkInternalCalc
      FieldName = 'CENANDS'
      OnChange = cdsNaklotCENANDSChange
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object cdsNaklotKOLOTP: TFMTBCDField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      DisplayWidth = 12
      FieldName = 'KOLOTP'
      OnChange = cdsNaklotKOLOTPChange
      DisplayFormat = '0.000'
      EditFormat = '0.000'
      Precision = 15
    end
    object cdsNaklotSUMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 9
      FieldKind = fkInternalCalc
      FieldName = 'SUMA'
      OnChange = cdsNaklotSUMAChange
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object cdsNaklotSUMANDS: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1089' '#1053#1044#1057
      DisplayWidth = 9
      FieldKind = fkInternalCalc
      FieldName = 'SUMANDS'
      OnChange = cdsNaklotSUMANDSChange
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object cdsNaklotKODCN: TSmallintField
      FieldName = 'KODCN'
      Visible = False
    end
    object cdsNaklotID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      Required = True
      Visible = False
    end
    object cdsNaklotID_NAKLD: TIntegerField
      FieldName = 'ID_NAKLD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object cdsNaklotID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
      Required = True
      Visible = False
      OnChange = cdsNaklotID_TOVARChange
    end
    object cdsNaklotEDIZ: TStringField
      FieldKind = fkLookup
      FieldName = 'EDIZ'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'EDIZ'
      KeyFields = 'ID_TOVAR'
      Visible = False
      Lookup = True
    end
    object cdsNaklotTARA: TIntegerField
      FieldKind = fkLookup
      FieldName = 'TARA'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'TARA'
      KeyFields = 'ID_TOVAR'
      Lookup = True
    end
  end
  object dsNaklot: TDataSource
    DataSet = cdsNaklot
    Left = 80
    Top = 200
  end
  object frNaklr2: TfrxReport
    Version = '3.23.7'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38987.469603831000000000
    ReportOptions.LastChange = 40968.877187951390000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      ''
      'procedure Memo53OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo19, Engine do begin'
      '   if <frdbNaklot."KOLOTP"> > 0 then'
      '     Font.Color := clBlack'
      '   else'
      '     Font.Color := clWhite;'
      '  end;'
      'end;'
      ''
      'procedure Memo54OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo20, Engine do begin'
      '   if <frdbNaklot."KOLOTP"> > 0 then'
      '     Font.Color := clBlack'
      '   else'
      '     Font.Color := clWhite;'
      '  end;'
      'end;'
      ''
      ''
      ''
      ''
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnGetValue = frNaklrGetValue
    Left = 360
    Top = 48
    Datasets = <
      item
        DataSet = frdbNaklo
        DataSetName = 'frdbNaklo'
      end
      item
        DataSet = frdbNaklot
        DataSetName = 'frdbNaklot'
      end>
    Variables = <
      item
        Name = ' AllVars'
        Value = Null
      end
      item
        Name = 'SUMA2'
        Value = Null
      end>
    Style = <>
  end
  object frNaklr: TfrxReport
    Version = '3.23.7'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.ShowDialog = False
    ReportOptions.CreateDate = 38982.467101585700000000
    ReportOptions.LastChange = 42204.897381724500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      'end.')
    StoreInDFM = False
    OnGetValue = frNaklrGetValue
    Left = 328
    Top = 48
    Datasets = <
      item
        DataSet = frdbDogovor
        DataSetName = 'frdbDogovor'
      end
      item
        DataSet = frdbNaklo
        DataSetName = 'frdbNaklo'
      end
      item
        DataSet = frdbNaklot
        DataSetName = 'frdbNaklot'
      end>
    Variables = <
      item
        Name = ' AllVars'
        Value = Null
      end
      item
        Name = 'NDSTEXT'
        Value = Null
      end
      item
        Name = 'VSEGO'
        Value = Null
      end
      item
        Name = 'New Variable1'
        Value = Null
      end>
    Style = <>
  end
  object frdbNaklot: TfrxDBDataset
    UserName = 'frdbNaklot'
    CloseDataSource = False
    DataSet = cdsNaklot
    Left = 392
    Top = 48
  end
  object dsTemp: TDataSource
    DataSet = cdsNaklot
    Left = 296
    Top = 112
  end
  object sdsOrder: TSQLDataSet
    CommandText = 'NAKLO_ORDER_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_NAKL'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 208
    Top = 136
    object IntegerField1: TIntegerField
      FieldName = 'ID_NAKL'
      Required = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'ID_NAKLD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField3: TIntegerField
      FieldName = 'ID_POS'
      Required = True
    end
    object SmallintField1: TSmallintField
      FieldName = 'KODCN'
    end
    object IntegerField4: TIntegerField
      FieldName = 'ID_TOVAR'
      Required = True
    end
    object FMTBCDField1: TFMTBCDField
      FieldName = 'SKIDKA'
      Precision = 15
      Size = 2
    end
    object FMTBCDField2: TFMTBCDField
      FieldName = 'CENA'
      Precision = 15
    end
    object FMTBCDField3: TFMTBCDField
      FieldName = 'KOLOTP'
      Precision = 15
    end
  end
  object sdsNaklrPost: TSQLDataSet
    CommandText = 'NAKLRU_POST_PC'
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
    Left = 144
    Top = 136
    object IntegerField5: TIntegerField
      FieldName = 'ID_NAKL'
      Required = True
    end
    object IntegerField6: TIntegerField
      FieldName = 'ID_NAKLD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField7: TIntegerField
      FieldName = 'ID_POS'
      Required = True
    end
    object SmallintField2: TSmallintField
      FieldName = 'KODCN'
    end
    object IntegerField8: TIntegerField
      FieldName = 'ID_TOVAR'
      Required = True
    end
    object FMTBCDField4: TFMTBCDField
      FieldName = 'SKIDKA'
      Precision = 15
      Size = 2
    end
    object FMTBCDField5: TFMTBCDField
      FieldName = 'CENA'
      Precision = 15
    end
    object FMTBCDField6: TFMTBCDField
      FieldName = 'KOLOTP'
      Precision = 15
    end
  end
  object ppmNaklr: TPopupMenu
    Left = 296
    Top = 144
    object N13: TMenuItem
      Action = actPreview
    end
    object N12: TMenuItem
      Action = actCalculateSum
    end
    object N14: TMenuItem
      Action = actNaklrPost
    end
    object N19: TMenuItem
      Action = actShowNaklo
    end
    object N6: TMenuItem
      Action = actCreateNaklru
    end
  end
  object frxDesigner1: TfrxDesigner
    DefaultScriptLanguage = 'PascalScript'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -13
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultLeftMargin = 10.000000000000000000
    DefaultRightMargin = 10.000000000000000000
    DefaultTopMargin = 10.000000000000000000
    DefaultBottomMargin = 10.000000000000000000
    DefaultPaperSize = 9
    DefaultOrientation = poPortrait
    Restrictions = []
    RTLLanguage = False
    Left = 424
    Top = 48
  end
  object frdbNaklo: TfrxDBDataset
    UserName = 'frdbNaklo'
    CloseDataSource = False
    DataSet = cdsNaklo
    Left = 392
    Top = 80
  end
  object UnfFilter1: TUnfFilter
    DBGridEh = dbgNaklr
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
    Left = 48
    Top = 72
  end
  object UnfFilter2: TUnfFilter
    DBGridEh = dbgNaklrt
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
    Left = 80
    Top = 72
  end
  object sdsMakeVozvrat: TSQLDataSet
    CommandText = 'NAKLR_MAKE_VOZVRAT_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_NAKL_IN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_NAKL'
        ParamType = ptOutput
        Size = 4
      end>
    SQLConnection = dmdEx.scUchet
    Left = 144
    Top = 80
  end
  object sdsNaklrUnpost: TSQLDataSet
    CommandText = 'NAKLRU_UNPOST_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_NAKL'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 176
    Top = 136
    object IntegerField9: TIntegerField
      FieldName = 'ID_NAKL'
      Required = True
    end
    object IntegerField10: TIntegerField
      FieldName = 'ID_NAKLD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField11: TIntegerField
      FieldName = 'ID_POS'
      Required = True
    end
    object SmallintField3: TSmallintField
      FieldName = 'KODCN'
    end
    object IntegerField12: TIntegerField
      FieldName = 'ID_TOVAR'
      Required = True
    end
    object FMTBCDField7: TFMTBCDField
      FieldName = 'SKIDKA'
      Precision = 15
      Size = 2
    end
    object FMTBCDField8: TFMTBCDField
      FieldName = 'CENA'
      Precision = 15
    end
    object FMTBCDField9: TFMTBCDField
      FieldName = 'KOLOTP'
      Precision = 15
    end
  end
  object ppmNaklrt: TPopupMenu
    Left = 368
    Top = 144
    object N20: TMenuItem
      Action = actColumnSetValue
    end
  end
  object sdsXozoper: TSQLDataSet
    CommandText = 
      'select *'#13#10'from spr_xozoper_vw s'#13#10'where s.delmarked=0'#13#10'  and s.ti' +
      'p_document=(select oid'#13#10'    from get_oid_objects_pc('#39#1056#1040#1057#1061#1054#1044#1053#1067#1045' '#1053 +
      #1040#1050#1051#1040#1044#1053#1067#1045' '#1053#1040' '#1059#1057#1051#1059#1043#1048#39',-100))'#13#10'order by s.name'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 264
    Top = 104
  end
  object dspXozOper: TDataSetProvider
    DataSet = sdsXozoper
    Left = 264
    Top = 136
  end
  object cdsXozOper: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspXozOper'
    Left = 264
    Top = 168
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
    Left = 264
    Top = 200
  end
  object sdsDogovor: TSQLDataSet
    CommandText = 
      'select d.id_dogovor,d.id_klient, d.dat, d.id, d.is_default, d.de' +
      'lmarked, d.predmet,'#13#10'  d.adres,d.id_contact,c.name,c.id_dolgnost' +
      ',dg.name as dolgnost'#13#10'from DOGOVOR_VW d '#13#10'  left join CONTACTS_V' +
      'W c '#13#10'  on d.id_contact=c.oid'#13#10'  left join OBJECTS dg'#13#10'  on c.id' +
      '_dolgnost=dg.oid'#13#10'where d.id_klient=:id_klient and d.delmarked=0' +
      #13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_klient'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 400
    Top = 112
  end
  object dspDogovor: TDataSetProvider
    DataSet = sdsDogovor
    Left = 400
    Top = 144
  end
  object cdsDogovor: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'id_klient'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'dspDogovor'
    Left = 400
    Top = 176
    object cdsDogovorID_DOGOVOR: TIntegerField
      FieldName = 'ID_DOGOVOR'
      Required = True
    end
    object cdsDogovorID_KLIENT: TIntegerField
      FieldName = 'ID_KLIENT'
    end
    object cdsDogovorDAT: TSQLTimeStampField
      FieldName = 'DAT'
    end
    object cdsDogovorID: TStringField
      DisplayWidth = 20
      FieldName = 'ID'
      Size = 30
    end
    object cdsDogovorIS_DEFAULT: TIntegerField
      FieldName = 'IS_DEFAULT'
    end
    object cdsDogovorDELMARKED: TSmallintField
      FieldName = 'DELMARKED'
    end
    object cdsDogovorPREDMET: TStringField
      FieldName = 'PREDMET'
      Size = 250
    end
    object cdsDogovorADRES: TStringField
      FieldName = 'ADRES'
      Size = 250
    end
    object cdsDogovorID_CONTACT: TIntegerField
      FieldName = 'ID_CONTACT'
    end
    object cdsDogovorNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
    object cdsDogovorID_DOLGNOST: TIntegerField
      FieldName = 'ID_DOLGNOST'
    end
    object cdsDogovorDOLGNOST: TStringField
      FieldName = 'DOLGNOST'
      Size = 50
    end
  end
  object dsDogovor: TDataSource
    DataSet = cdsDogovor
    Left = 400
    Top = 208
  end
  object frdbDogovor: TfrxDBDataset
    UserName = 'frdbDogovor'
    CloseDataSource = False
    DataSet = cdsDogovor
    Left = 400
    Top = 240
  end
  object qeDogovor: TQueryExtender
    Query = sdsDogovor
    DefSql = 
      'select d.id_dogovor,d.id_klient, d.dat, d.id, d.is_default, d.de' +
      'lmarked, d.predmet,'#13#10'  d.adres,d.id_contact,c.name,c.id_dolgnost' +
      ',dg.name as dolgnost'#13#10'from DOGOVOR_VW d '#13#10'  left join CONTACTS_V' +
      'W c '#13#10'  on d.id_contact=c.oid'#13#10'  left join OBJECTS dg'#13#10'  on c.id' +
      '_dolgnost=dg.oid'#13#10'where d.id_klient=:id_klient and d.delmarked=0' +
      #13#10
    Left = 400
    Top = 272
  end
end
