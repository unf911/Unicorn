object frmPlategyVxod: TfrmPlategyVxod
  Left = 338
  Top = 193
  BorderStyle = bsDialog
  Caption = #1055#1083#1072#1090#1077#1078#1080
  ClientHeight = 404
  ClientWidth = 590
  Color = clBtnFace
  Constraints.MinHeight = 252
  Constraints.MinWidth = 332
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
  DesignSize = (
    590
    404)
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 381
    Width = 590
    Height = 23
    Panels = <>
    SimplePanel = True
  end
  object pnlPanel2: TPanel
    Left = 454
    Top = 217
    Width = 129
    Height = 161
    Anchors = [akRight, akBottom]
    BevelOuter = bvNone
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 2
    DesignSize = (
      129
      161)
    object Edit1: TEdit
      Left = 9
      Top = 32
      Width = 115
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Text = '0'
    end
    object btnPreview: TBitBtn
      Left = 9
      Top = 17
      Width = 115
      Height = 17
      Action = actPartTransh
      Anchors = [akLeft, akTop, akRight]
      Caption = #1063#1072#1089#1090#1080#1095#1085#1086' '#1086#1087'&'#1083#1072#1090#1080#1090#1100
      TabOrder = 1
      TabStop = False
    end
    object btnPrint: TBitBtn
      Left = 9
      Top = 73
      Width = 115
      Height = 16
      Action = actClearNakl
      Anchors = [akLeft, akTop, akRight]
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100' &'#1085#1072#1082#1083#1072#1076#1085#1091#1102
      TabOrder = 2
      TabStop = False
    end
    object Button1: TButton
      Left = 9
      Top = 57
      Width = 115
      Height = 16
      Action = actClearOpl
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      TabStop = False
    end
    object btnSettings: TBitBtn
      Left = 9
      Top = 0
      Width = 115
      Height = 17
      Action = actFullTransh
      Anchors = [akLeft, akTop, akRight]
      Caption = '&'#1054#1087#1083#1072#1090#1080#1090#1100
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      TabStop = False
    end
    object cbxAllOpl: TCheckBox
      Left = 8
      Top = 112
      Width = 113
      Height = 17
      TabStop = False
      Action = actAllOpl
      ParentShowHint = False
      ShowHint = True
      State = cbChecked
      TabOrder = 5
      Visible = False
    end
    object cbxAllNakl: TCheckBox
      Left = 8
      Top = 128
      Width = 97
      Height = 17
      TabStop = False
      Action = actAllNakl
      ParentShowHint = False
      ShowHint = True
      State = cbChecked
      TabOrder = 6
      Visible = False
    end
    object BitBtn1: TBitBtn
      Left = 9
      Top = 96
      Width = 115
      Height = 16
      Hint = #1044#1077#1090#1072#1083#1100#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1087#1086' '#1087#1083#1072#1090#1077#1078#1091' '#1080' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      Action = actShowDet
      Anchors = [akLeft, akTop, akRight]
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      TabStop = False
    end
    object cbxNerazn: TCheckBox
      Left = 8
      Top = 144
      Width = 97
      Height = 17
      TabStop = False
      Action = actNerazn
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      Visible = False
    end
  end
  object udgGrid1: TDBGridEh
    Left = 0
    Top = 24
    Width = 589
    Height = 188
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dtsSource1
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnColEnter = udgGrid1ColEnter
    OnDblClick = udgGrid1DblClick
    OnKeyUp = udgGrid1KeyUp
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ID'
        Footers = <>
        Width = 38
      end
      item
        ButtonStyle = cbsNone
        EditButtons = <>
        FieldName = 'DAT'
        Footers = <>
        Width = 69
      end
      item
        EditButtons = <>
        FieldName = 'IZG'
        Footers = <>
        ReadOnly = True
        Width = 92
      end
      item
        EditButtons = <>
        FieldName = 'BANK_FROM'
        Footers = <>
        ReadOnly = True
      end
      item
        EditButtons = <>
        FieldName = 'ZAK'
        Footers = <>
        ReadOnly = True
        Width = 160
      end
      item
        EditButtons = <>
        FieldName = 'NDS'
        Footers = <>
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'POTRACHENO'
        Footers = <>
        ReadOnly = True
        Width = 61
      end
      item
        EditButtons = <>
        FieldName = 'OSTATOK'
        Footers = <>
        ReadOnly = True
        Width = 57
      end
      item
        EditButtons = <>
        FieldName = 'MANAGER2'
        Footers = <>
        ReadOnly = True
        Width = 42
      end
      item
        EditButtons = <>
        FieldName = 'COMMENT'
        Footers = <>
        Width = 69
      end
      item
        EditButtons = <>
        FieldName = 'PARENT_ID_NAKL'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'XOZ_OPER'
        Footers = <>
        ReadOnly = True
      end
      item
        EditButtons = <>
        FieldName = 'AGENT'
        Footers = <>
        ReadOnly = True
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'NDS_FROM'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'ZATRATY'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'ID_NAKL'
        Footers = <>
        Visible = False
      end>
  end
  object udgGrid2: TDBGridEh
    Left = 0
    Top = 217
    Width = 448
    Height = 161
    Anchors = [akLeft, akRight, akBottom]
    DataSource = dtsSource2
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind]
    PopupMenu = PopupMenu2
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = udgGrid2DblClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ID'
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
        FieldName = 'MANAGER'
        Footers = <>
        Width = 51
      end
      item
        EditButtons = <>
        FieldName = 'NDS'
        Footers = <>
        Width = 57
      end
      item
        EditButtons = <>
        FieldName = 'OPLACHENO'
        Footers = <>
        Width = 57
      end
      item
        EditButtons = <>
        FieldName = 'OSTATOK'
        Footers = <>
        Width = 62
      end
      item
        EditButtons = <>
        FieldName = 'OPL_DATA'
        Footers = <>
        Width = 51
      end>
  end
  object ulbListBox1: TUnfDbLookupListbox
    Left = 304
    Top = 72
    Width = 43
    Height = 43
    TabOrder = 1
    TabStop = False
    Visible = False
    OnDblClick = ulbListBox1DblClick
    OnExit = ulbListBox1Exit
    OnKeyUp = ulbListBox1KeyUp
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 545
    Height = 19
    BevelOuter = bvNone
    TabOrder = 5
    object btnRefresh: TButton
      Left = 137
      Top = 2
      Width = 120
      Height = 16
      Action = actRefresh
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TabStop = False
    end
    object btnTime: TButton
      Left = 9
      Top = 2
      Width = 120
      Height = 16
      Action = actSettings
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TabStop = False
    end
    object Button2: TButton
      Left = 273
      Top = 2
      Width = 120
      Height = 16
      Action = actItogo
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      TabStop = False
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
      OnExecute = actPartTranshExecute
    end
    object actClearNakl: TAction
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100' &'#1085#1072#1082#1083#1072#1076#1085#1091#1102
      ShortCut = 32857
      OnExecute = actClearNaklExecute
    end
    object actClearOpl: TAction
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100' &'#1087#1083#1072#1090#1105#1078
      ShortCut = 32839
      OnExecute = actClearOplExecute
    end
    object actStart: TAction
      Caption = 'actStart'
    end
    object actGrid1ListShow: TAction
      Caption = 'actGrid1ListShow'
      OnExecute = actGrid1ListShowExecute
    end
    object actClearOplaty: TAction
      Caption = 'actClearOplaty'
      OnExecute = actClearOplatyExecute
    end
    object actPostIf: TAction
      Caption = 'actPostIf'
      OnExecute = actPostIfExecute
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
      ShortCut = 120
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
    object actItogo: TAction
      Caption = #1048#1090#1086#1075#1086
      OnExecute = actItogoExecute
    end
    object actApply: TAction
      Caption = 'actApply'
      OnExecute = actApplyExecute
    end
    object actFinance: TAction
      Caption = #1060#1080#1085#1072#1085#1089#1086#1074#1099#1081' '#1087#1083#1072#1090#1105#1078
      OnExecute = actFinanceExecute
    end
    object actRefreshRecord: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      OnExecute = actRefreshRecordExecute
    end
    object actShowNaklr: TAction
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1088#1072#1089#1093#1086#1076#1085#1091#1102' '#1085#1072#1082#1083#1072#1076#1085#1091#1102
      OnExecute = actShowNaklrExecute
    end
    object actDebug: TAction
      Caption = #1056#1077#1078#1080#1084' '#1086#1090#1083#1072#1076#1082#1080
      OnExecute = actDebugExecute
    end
    object actFinanceFinusl: TAction
      Caption = #1060#1080#1085#1072#1085#1089#1086#1074#1099#1081' '#1087#1083#1072#1090#1105#1078' '#1085#1072' '#1091#1089#1083#1091#1075#1080
      OnExecute = actFinanceFinuslExecute
    end
    object actFinanceArenda: TAction
      Caption = #1060#1080#1085#1072#1085#1089#1086#1074#1099#1081' '#1087#1083#1072#1090#1105#1078' '#1087#1086' '#1072#1088#1077#1085#1076#1077
      OnExecute = actFinanceArendaExecute
    end
  end
  object dtsSource1: TDataSource
    DataSet = cdsNaklo
    Left = 64
    Top = 56
  end
  object dtsSource2: TDataSource
    DataSet = qurQuery2
    Left = 96
    Top = 56
  end
  object qeQuery2: TQueryExtender
    Query = qurQuery2
    KeyField = 'id_nakl'
    Left = 96
    Top = 120
  end
  object MainMenu1: TMainMenu
    Left = 256
    Top = 68
    object N1: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      GroupIndex = 10
      object N2: TMenuItem
        Action = actFinance
        GroupIndex = 7
      end
      object N12: TMenuItem
        Action = actFinanceArenda
        GroupIndex = 7
      end
      object N14: TMenuItem
        Action = actFinanceFinusl
        GroupIndex = 7
      end
      object N3: TMenuItem
        Action = actRefreshRecord
        GroupIndex = 7
      end
      object N5: TMenuItem
        Action = actDebug
        GroupIndex = 7
      end
    end
  end
  object sdsPlat: TSQLDataSet
    CommandText = 
      'select '#13#10'  id_nakl,dat,id_zak,id_izg,id_sklad,nds,'#13#10'  (select z(' +
      'sum(t.transh)) '#13#10'    from oplnakl t'#13#10'    where t.id_from=om.id_n' +
      'akl'#13#10'    ) as potracheno,   '#13#10'  (nds-z('#13#10'  (select sum(t.transh)' +
      #13#10'    from oplnakl t'#13#10'    where t.id_from=om.id_nakl'#13#10'    )'#13#10'  )' +
      ') as ostatok,'#13#10'  comment, id_manager,id,'#13#10'  posted,'#13#10'  parent_id' +
      '_nakl,'#13#10'  id_sklad_to,'#13#10'  id_currency_to,'#13#10'  id_currency,'#13#10'  nds' +
      '_from,'#13#10'  zatraty'#13#10'from OPLATY_VW om'#13#10'where  om.delmarked=0'#13#10'ord' +
      'er by om.dat,om.id_nakl'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 64
    Top = 184
    object sdsPlatDAT: TSQLTimeStampField
      FieldName = 'DAT'
      Required = True
    end
    object sdsPlatOSTATOK: TFloatField
      FieldName = 'OSTATOK'
      ProviderFlags = []
    end
    object sdsPlatID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
    end
    object sdsPlatID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
    end
    object sdsPlatID_IZG: TIntegerField
      FieldName = 'ID_IZG'
    end
    object sdsPlatID: TStringField
      FieldName = 'ID'
    end
    object sdsPlatPOSTED: TSmallintField
      FieldName = 'POSTED'
      ProviderFlags = [pfInWhere]
      Required = True
    end
    object sdsPlatID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsPlatNDS: TFMTBCDField
      FieldName = 'NDS'
      Required = True
      Precision = 15
    end
    object sdsPlatCOMMENT: TStringField
      FieldName = 'COMMENT'
      Size = 50
    end
    object sdsPlatID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
    end
    object sdsPlatPARENT_ID_NAKL: TIntegerField
      FieldName = 'PARENT_ID_NAKL'
    end
    object sdsPlatID_SKLAD_TO: TIntegerField
      FieldName = 'ID_SKLAD_TO'
    end
    object sdsPlatID_CURRENCY_TO: TIntegerField
      FieldName = 'ID_CURRENCY_TO'
    end
    object sdsPlatNDS_FROM: TFMTBCDField
      FieldName = 'NDS_FROM'
      Precision = 15
    end
    object sdsPlatZATRATY: TFMTBCDField
      FieldName = 'ZATRATY'
      Precision = 15
    end
    object sdsPlatID_CURRENCY: TSmallintField
      FieldName = 'ID_CURRENCY'
    end
    object sdsPlatPOTRACHENO: TFloatField
      FieldName = 'POTRACHENO'
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
    Params = <>
    ProviderName = 'dspPlat'
    AfterInsert = cdsNakloAfterInsert
    BeforePost = cdsNakloBeforePost
    BeforeScroll = cdsNakloBeforeScroll
    AfterScroll = cdsNakloAfterScroll
    OnReconcileError = cdsNakloReconcileError
    Left = 64
    Top = 248
    object cdsNakloIDI: TIntegerField
      DisplayLabel = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088
      FieldName = 'ID_NAKL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsNakloDAT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DAT'
      Required = True
      DisplayFormat = 'dd.mm.yy'
      EditMask = '!99/99/00;1;_'
    end
    object cdsNakloZAK: TStringField
      DisplayLabel = #1050#1083#1080#1077#1085#1090
      FieldKind = fkLookup
      FieldName = 'ZAK'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_ZAK'
      Size = 50
      Lookup = True
    end
    object cdsNakloIZG: TStringField
      DisplayLabel = #1060#1080#1088#1084#1072
      FieldKind = fkLookup
      FieldName = 'IZG'
      LookupDataSet = dmdEx.cdsVlad
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_IZG'
      Size = 50
      Lookup = True
    end
    object cdsNakloPRIM: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'COMMENT'
      Size = 25
    end
    object cdsNakloID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
    end
    object cdsNakloMANAGER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      FieldKind = fkLookup
      FieldName = 'MANAGER2'
      LookupDataSet = dmdEx.cdsManager
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_MANAGER'
      Lookup = True
    end
    object cdsNakloID_IZG: TIntegerField
      FieldName = 'ID_IZG'
    end
    object cdsNakloID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
    end
    object cdsNakloOSTATOK: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082
      FieldName = 'OSTATOK'
      ProviderFlags = []
      DisplayFormat = '0.00'
    end
    object cdsNakloPOTRACHENO: TFloatField
      DisplayLabel = #1056#1072#1089#1087#1088#1077#1076#1077#1083#1077#1085#1086
      FieldName = 'POTRACHENO'
      DisplayFormat = '0.00'
    end
    object cdsNakloOPL: TFMTBCDField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1087#1083#1072#1090#1077#1078#1072
      FieldName = 'NDS'
      Required = True
      OnChange = cdsNakloOPLChange
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 15
    end
    object cdsNakloID: TStringField
      DisplayLabel = #8470#1087#1083#1072#1090
      FieldName = 'ID'
    end
    object cdsNakloBANK_FROM: TStringField
      DisplayLabel = #1057#1095#1105#1090' '#1092#1080#1088#1084#1099
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'BANK_FROM'
      LookupDataSet = dmdEx.cdsBank
      LookupKeyFields = 'OID'
      LookupResultField = 'FULLNAME'
      KeyFields = 'ID_SKLAD'
      Size = 50
      Lookup = True
    end
    object cdsNakloPOSTED: TSmallintField
      FieldName = 'POSTED'
      ProviderFlags = [pfInWhere]
      Required = True
      Visible = False
    end
    object cdsNakloID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
    end
    object cdsNakloPARENT_ID_NAKL: TIntegerField
      DisplayLabel = #8470' '#1085#1072#1083#1086#1075#1086#1074#1086#1081
      FieldName = 'PARENT_ID_NAKL'
    end
    object cdsNakloID_SKLAD_TO: TIntegerField
      FieldName = 'ID_SKLAD_TO'
    end
    object cdsNakloXOZ_OPER: TStringField
      DisplayLabel = #1061#1086#1079#1086#1087#1077#1088#1072#1094#1080#1103
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'XOZ_OPER'
      LookupDataSet = cdsXozOper
      LookupKeyFields = 'OID'
      LookupResultField = 'FULLNAME'
      KeyFields = 'ID_SKLAD_TO'
      Size = 50
      Lookup = True
    end
    object cdsNakloAGENT: TStringField
      DisplayLabel = #1040#1075#1077#1085#1090
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'AGENT'
      LookupDataSet = dmdEx.cdsAgent
      LookupKeyFields = 'OID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_CURRENCY_TO'
      Size = 50
      Lookup = True
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
      Lookup = True
    end
    object cdsNakloID_CURRENCY_TO: TIntegerField
      FieldName = 'ID_CURRENCY_TO'
    end
    object cdsNakloNDS_FROM: TFMTBCDField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1082#1086#1084#1080#1089#1089#1080#1080
      FieldName = 'NDS_FROM'
      OnChange = cdsNakloNDS_FROMChange
      DisplayFormat = '0.00'
      Precision = 15
    end
    object cdsNakloZATRATY: TFMTBCDField
      DisplayLabel = #1050#1086#1084#1080#1089#1089#1080#1103', %'
      FieldName = 'ZATRATY'
      OnChange = cdsNakloZATRATYChange
      DisplayFormat = '0.00'
      Precision = 15
    end
    object cdsNakloID_CURRENCY: TSmallintField
      FieldName = 'ID_CURRENCY'
    end
  end
  object qurQuery2: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_IZG'
        ParamType = ptInput
        Value = 1265
      end
      item
        DataType = ftInteger
        Name = 'ID_ZAK'
        ParamType = ptInput
        Value = 1265
      end
      item
        DataType = ftInteger
        Name = 'tip_rasx'
        ParamType = ptUnknown
        Value = 3047
      end>
    ProviderName = 'dspNaklr'
    OnReconcileError = qurQuery2ReconcileError
    Left = 96
    Top = 248
    object qurQuery2ID: TStringField
      DisplayLabel = #8470#1085#1072#1082#1083
      FieldName = 'ID'
    end
    object qurQuery2DAT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DAT'
      DisplayFormat = 'dd.mm.yy'
    end
    object qurQuery2AUTHER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      FieldKind = fkLookup
      FieldName = 'MANAGER'
      LookupDataSet = dmdEx.cdsManager
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_MANAGER'
      Size = 30
      Lookup = True
    end
    object qurQuery2NDS: TFMTBCDField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'NDS'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object qurQuery2OPLACHENO: TFloatField
      DisplayLabel = #1054#1087#1083#1072#1095#1077#1085#1086
      FieldName = 'OPLACHENO'
      DisplayFormat = '0.00'
    end
    object qurQuery2OSTATOK: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082
      FieldName = 'OSTATOK'
      DisplayFormat = '0.00'
    end
    object qurQuery2OPL_DATA: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1087#1083#1072#1090#1099
      FieldName = 'OPL_DATA'
      DisplayFormat = 'dd.mm.yy'
    end
    object qurQuery2ID_IZG: TIntegerField
      FieldName = 'ID_IZG'
      Visible = False
    end
    object qurQuery2ID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
      Visible = False
    end
    object qurQuery2POSTED: TSmallintField
      FieldName = 'POSTED'
      Required = True
      Visible = False
    end
    object qurQuery2ID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
      Visible = False
    end
    object qurQuery2ID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
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
      'select '#13#10'  n.id_izg,n.id_zak,n.id_nakl,n.id,n.dat,n.posted, '#13#10'  ' +
      'n.id_manager,n.nds,'#13#10'  z(sum(t.transh)) as oplacheno,'#13#10'  (n.nds-' +
      'z(sum(t.transh))) as ostatok,'#13#10'  max(t.opl_data) as opl_data'#13#10'fr' +
      'om '#13#10'   NAKLO n left join OPLNAKL t on  n.id_nakl=t.id_to and t.' +
      'tip in (0,2,-50,-28)'#13#10'where'#13#10'   n.id_zak=:id_zak and '#13#10'   n.id_i' +
      'zg=:id_izg  and '#13#10'   n.delmarked=0 and '#13#10'   n.posted=1 and'#13#10'   n' +
      '.tip=  :tip_rasx'#13#10'group by '#13#10'  id_izg, id_zak, n.id_nakl,'#13#10'  n.i' +
      'd,n.dat,n.posted,'#13#10'  n.id_manager,n.nds'#13#10'order by n.dat desc,n.i' +
      'd desc'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_zak'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_izg'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'tip_rasx'
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
    object sdsNaklrNDS: TFMTBCDField
      FieldName = 'NDS'
      Precision = 15
      Size = 2
    end
    object sdsNaklrOPLACHENO: TFloatField
      FieldName = 'OPLACHENO'
    end
    object sdsNaklrOSTATOK: TFloatField
      FieldName = 'OSTATOK'
    end
    object sdsNaklrOPL_DATA: TSQLTimeStampField
      FieldName = 'OPL_DATA'
    end
    object sdsNaklrID_IZG: TIntegerField
      FieldName = 'ID_IZG'
    end
    object sdsNaklrID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
    end
    object sdsNaklrPOSTED: TSmallintField
      FieldName = 'POSTED'
      Required = True
    end
    object sdsNaklrID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
    end
    object sdsNaklrID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
    end
  end
  object stpTransh: TSQLDataSet
    CommandText = 'MAKE_TRANSH'
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
    Top = 56
  end
  object qeQuery1: TQueryExtender
    SlaveQueryExtender = qeQuery2
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
    Top = 124
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
  object sdsDelmark: TSQLDataSet
    CommandText = 'OPLATY_DELMARK_PC'
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
  object UnfFilter1: TUnfFilter
    DBGridEh = udgGrid1
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
    Top = 152
  end
  object UnfFilter2: TUnfFilter
    DBGridEh = udgGrid2
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
    Left = 100
    Top = 152
  end
  object PopupMenu2: TPopupMenu
    Left = 168
    Top = 324
    object N4: TMenuItem
      Action = actShowNaklr
    end
    object N10: TMenuItem
      Action = actShowDet
    end
    object N11: TMenuItem
      Action = actClearNakl
    end
  end
  object sdsTemp: TSQLDataSet
    CommandText = 
      'select '#13#10'  s.schet,s.id,s.izg,s.zak,s.kurs,'#13#10'  s.auther,'#13#10'  s.nd' +
      's,s.vsego,s.dat,'#13#10'  s.nalog_nds, s.sch,s.id_bank'#13#10'from '#13#10'  schet' +
      ' s '#13#10'order by'#13#10'  s.dat,s.schet'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 160
    Top = 184
  end
  object dspTemp: TDataSetProvider
    DataSet = sdsTemp
    Options = [poAllowCommandText]
    Left = 160
    Top = 216
  end
  object cdsTemp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTemp'
    Left = 160
    Top = 248
  end
  object dsTemp: TDataSource
    DataSet = cdsTemp
    Left = 160
    Top = 280
  end
  object sdsXozoper: TSQLDataSet
    CommandText = 
      'select *'#13#10'from spr_xozoper_vw s'#13#10'where s.delmarked=0'#13#10'  and s.ti' +
      'p_document=(select oid'#13#10'    from get_oid_objects_pc('#39#1054#1055#1051#1040#1058#1067#39',-10' +
      '0))'#13#10'order by s.name'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 224
    Top = 176
  end
  object dspXozOper: TDataSetProvider
    DataSet = sdsXozoper
    Left = 224
    Top = 208
  end
  object cdsXozOper: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspXozOper'
    Left = 224
    Top = 240
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
    Left = 224
    Top = 272
  end
  object rpsClientEdit: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 304
    Top = 136
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmPrixMain'
    StorageManager = rpsClientEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      'udgGrid1.<P>.Columns.<ForAllItems>.Width')
    Left = 304
    Top = 168
  end
  object PopupMenu1: TPopupMenu
    Left = 128
    Top = 324
    object N7: TMenuItem
      Action = actShowDet
    end
    object N6: TMenuItem
      Action = actFinance
    end
    object N13: TMenuItem
      Action = actFinanceArenda
    end
    object N8: TMenuItem
      Action = actFullTransh
    end
    object N9: TMenuItem
      Action = actClearOpl
    end
  end
  object sdsFinTranshArenda: TSQLDataSet
    CommandText = 'MAKE_FIN_TRASH_USL'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_NAKL'
        ParamType = ptOutput
        Size = 4
      end>
    SQLConnection = dmdEx.scUchet
    Left = 256
    Top = 124
  end
  object sdsFinTranshFinusl: TSQLDataSet
    CommandText = 'MAKE_FIN_TRASH_FINUSL'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_NAKL'
        ParamType = ptOutput
        Size = 4
      end>
    SQLConnection = dmdEx.scUchet
    Left = 288
    Top = 124
  end
end
