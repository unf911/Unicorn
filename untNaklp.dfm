object frmNaklp: TfrmNaklp
  Left = 383
  Top = 254
  BorderStyle = bsDialog
  Caption = #1055#1088#1080#1093#1086#1076#1085#1099#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077' '#1080' '#1080#1079#1083#1080#1096#1082#1080
  ClientHeight = 370
  ClientWidth = 580
  Color = clBtnFace
  Constraints.MinHeight = 416
  Constraints.MinWidth = 555
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
  OnDestroy = FormDestroy
  OnDeactivate = FormDeactivate
  DesignSize = (
    580
    370)
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 201
    Width = 580
    Height = 8
    Cursor = crVSplit
    Align = alTop
    Beveled = True
  end
  object Panel1: TPanel
    Left = 745
    Top = 586
    Width = 369
    Height = 57
    Anchors = [akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      369
      57)
    object rdgCable: TRadioGroup
      Left = 24
      Top = 0
      Width = 81
      Height = 49
      ItemIndex = 0
      Items.Strings = (
        #1050#1072#1073#1077#1083#1100
        #1058#1072#1088#1072)
      TabOrder = 0
      Visible = False
    end
    object RadioGroup2: TRadioGroup
      Left = 112
      Top = 0
      Width = 249
      Height = 49
      Anchors = [akLeft, akBottom]
      TabOrder = 1
      Visible = False
    end
    object rdbCol1: TRadioButton
      Left = 224
      Top = 8
      Width = 89
      Height = 17
      Action = actPostIf2
      Caption = #1050#1086#1083' 1'
      TabOrder = 2
      Visible = False
    end
    object rdbCol3: TRadioButton
      Left = 296
      Top = 8
      Width = 57
      Height = 17
      Action = actPostIf2
      Caption = #1050#1086#1083' 3'
      TabOrder = 3
      Visible = False
    end
    object rdbCol2: TRadioButton
      Left = 224
      Top = 24
      Width = 81
      Height = 17
      Action = actPostIf2
      Caption = #1050#1086#1083' 2'
      TabOrder = 4
      Visible = False
    end
    object rdbCol4: TRadioButton
      Left = 296
      Top = 24
      Width = 57
      Height = 17
      Action = actPostIf2
      Caption = #1050#1086#1083' 4'
      TabOrder = 5
      Visible = False
    end
    object rdbCol0: TRadioButton
      Left = 120
      Top = 8
      Width = 97
      Height = 17
      Action = actPostIf2
      Caption = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
      Checked = True
      TabOrder = 6
      TabStop = True
      Visible = False
    end
  end
  object Button3: TButton
    Left = 40
    Top = 594
    Width = 137
    Height = 41
    Action = actRecalc
    Anchors = [akLeft, akBottom]
    TabOrder = 3
  end
  object dbgNaklpt: TDBGridEh
    Left = 0
    Top = 209
    Width = 580
    Height = 161
    Align = alClient
    DataSource = dsNaklpt
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghRowHighlight]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgNaklptDblClick
    OnKeyDown = dbgNaklptKeyDown
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ID_POS'
        Footers = <>
        ReadOnly = True
        Width = 74
      end
      item
        EditButtons = <>
        FieldName = 'TOVAR'
        Footers = <>
        ReadOnly = True
        Width = 354
      end
      item
        EditButtons = <>
        FieldName = 'KOLOTP'
        Footers = <>
        ReadOnly = True
        Width = 81
      end
      item
        EditButtons = <>
        FieldName = 'CENA'
        Footers = <>
        ReadOnly = True
        Visible = False
        Width = 116
      end>
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 580
    Height = 201
    Align = alTop
    BevelOuter = bvNone
    Constraints.MinHeight = 201
    TabOrder = 2
    DesignSize = (
      580
      201)
    object dbgNaklp: TDBGridEh
      Left = 0
      Top = 8
      Width = 497
      Height = 193
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsNaklp
      EditActions = [geaSelectAllEh]
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghRowHighlight]
      PopupMenu = PopupMenu1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = dbgNaklpDblClick
      OnKeyDown = dbgNaklpKeyDown
      Columns = <
        item
          EditButtons = <>
          FieldName = 'ID'
          Footers = <>
          ReadOnly = True
          Title.Caption = #8470#1085#1072#1082#1083
          Title.TitleButton = True
          Width = 38
        end
        item
          EditButtons = <>
          FieldName = 'DAT'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1044#1072#1090#1072
          Title.TitleButton = True
          Width = 59
        end
        item
          ButtonStyle = cbsNone
          DropDownRows = 15
          EditButtons = <>
          FieldName = 'IZG'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
          Width = 58
        end
        item
          ButtonStyle = cbsNone
          DropDownRows = 15
          EditButtons = <>
          FieldName = 'ZAK'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
          Width = 57
        end
        item
          ButtonStyle = cbsNone
          EditButtons = <>
          FieldName = 'MANAGER'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1052#1077#1085#1077#1076#1078#1077#1088
          Width = 51
        end
        item
          EditButtons = <>
          FieldName = 'NDS'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1048#1090#1086#1075#1086
          Title.TitleButton = True
          Visible = False
          Width = 86
        end
        item
          EditButtons = <>
          FieldName = 'KURS'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1050#1091#1088#1089
          Title.TitleButton = True
          Width = 45
        end
        item
          Checkboxes = True
          EditButtons = <>
          FieldName = 'POSTED'
          Footers = <>
          KeyList.Strings = (
            '1'
            '0')
          ReadOnly = True
          Width = 27
        end
        item
          EditButtons = <>
          FieldName = 'SKLAD'
          Footers = <>
          ReadOnly = True
          Width = 144
        end
        item
          EditButtons = <>
          FieldName = 'TIPCONST'
          Footers = <>
          ReadOnly = True
          Width = 71
        end
        item
          EditButtons = <>
          FieldName = 'PARENT_ID'
          Footers = <>
          ReadOnly = True
          Width = 144
        end
        item
          EditButtons = <>
          FieldName = 'ID_NAKL'
          Footers = <>
          ReadOnly = True
          Width = 74
        end>
    end
    object Panel2: TPanel
      Left = 504
      Top = 3
      Width = 73
      Height = 185
      Anchors = [akTop, akRight]
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        73
        185)
      object BitBtn7: TBitBtn
        Left = 0
        Top = 148
        Width = 73
        Height = 33
        Action = actRefresh
        Anchors = [akTop, akRight]
        Caption = #1054#1073#1085#1086#1074#1080#1090#1100
        TabOrder = 3
        TabStop = False
        Kind = bkRetry
      end
      object BitBtn5: TBitBtn
        Left = 0
        Top = 100
        Width = 73
        Height = 33
        Action = actSettings
        Anchors = [akTop, akRight]
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
        TabOrder = 2
        TabStop = False
      end
      object btnUnpost: TBitBtn
        Left = 2
        Top = 52
        Width = 71
        Height = 33
        Anchors = [akTop, akRight]
        Caption = #1042#1077#1088#1085#1091#1090#1100
        TabOrder = 1
        TabStop = False
        OnClick = btnUnpostClick
      end
      object btnPost: TBitBtn
        Left = 2
        Top = 4
        Width = 71
        Height = 33
        Action = actPost
        Anchors = [akTop, akRight]
        Caption = #1055#1088#1086#1074#1077#1089#1090#1080
        TabOrder = 0
        TabStop = False
      end
    end
  end
  object ActionList1: TActionList
    Left = 456
    Top = 304
    object actSettings: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      ShortCut = 16465
      OnExecute = actSettingsExecute
    end
    object actGrid1ListShow: TAction
      Caption = 'actGrid1ListShow'
      OnExecute = actGrid1ListShowExecute
    end
    object actPostIf: TAction
      Caption = 'actPostIf'
    end
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ShortCut = 116
      OnExecute = actRefreshExecute
    end
    object actGrid2ListShow: TAction
      Caption = 'actGrid2ListShow'
      OnExecute = actGrid2ListShowExecute
    end
    object actPostIf2: TAction
      Caption = 'actPostIf2'
    end
    object actRecalc: TAction
      Caption = #1055#1086#1076#1089#1095#1080#1090#1072#1090#1100
      OnExecute = actRecalcExecute
    end
    object actAutoRecalc: TAction
      Caption = 'actAutoRecalc'
    end
    object actPreview: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      ShortCut = 16471
    end
    object actPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      ShortCut = 123
    end
    object actCalculateSum: TAction
      Caption = 'actCalculateSum'
      OnExecute = actCalculateSumExecute
    end
    object actNaklpFilltovarNaklpbux: TAction
      Caption = #1059#1082#1072#1079#1072#1090#1100' '#1089#1085#1072#1073#1078#1077#1085#1094#1072#1084' '#1085#1072' '#1085#1077#1089#1090#1099#1082#1086#1074#1082#1080' '#1089#1082#1083#1072#1076' '#1080' '#1073#1091#1093'. '#1085#1072#1082#1083
      OnExecute = actNaklpFilltovarNaklpbuxExecute
    end
    object actMakeNaklpbux: TAction
      Caption = 
        #1057#1086#1079#1076#1072#1090#1100' '#1087#1088#1080#1093#1086#1076#1085#1091#1102' '#1073#1091#1093'. '#1085#1072#1082#1083#1072#1076#1085#1091#1102' '#1085#1072' '#1086#1089#1085#1086#1074#1072#1085#1080#1080' '#1087#1088#1080#1093#1086#1076#1085#1086#1081' '#1089#1082#1083#1072#1076#1089#1082#1086 +
        #1081
      OnExecute = actMakeNaklpbuxExecute
    end
    object actSebestRecount: TAction
      Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1089#1077#1073#1077#1089#1090#1086#1080#1084#1086#1089#1090#1100
      Visible = False
      OnExecute = actSebestRecountExecute
    end
    object actNakloList: TAction
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1088#1086#1076#1080#1090#1077#1083#1100#1089#1082#1091#1102' '#1087#1088#1080#1093#1086#1076#1085#1091#1102' '#1085#1072#1082#1083#1072#1076#1085#1091#1102
      OnExecute = actNakloListExecute
    end
    object actSebestRecount2: TAction
      Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1089#1077#1073#1077#1089#1090#1086#1080#1084#1086#1089#1090#1100
      OnExecute = actSebestRecount2Execute
    end
    object actShowRepNakloDepend: TAction
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1079#1072#1074#1080#1089#1080#1084#1099#1077' '#1089#1082#1083#1072#1076#1089#1082#1080#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077
      OnExecute = actShowRepNakloDependExecute
    end
    object actPost: TAction
      Caption = #1055#1088#1086#1074#1077#1089#1090#1080
      OnExecute = actPostExecute
    end
    object actGenerateTara: TAction
      Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1090#1072#1088#1091
      OnExecute = actGenerateTaraExecute
    end
  end
  object sdsNaklp: TSQLDataSet
    CommandText = 
      'select  '#13#10'  id,'#13#10'  id_nakl,'#13#10'  nalog_nds,'#13#10'  id_sklad,'#13#10'  dat,'#13#10 +
      '  posted,'#13#10'  id_currency,'#13#10'  comment, '#13#10'  id_izg,'#13#10'  id_zak,'#13#10'  ' +
      'id_manager,'#13#10'  kurs,'#13#10'  nds,'#13#10'  delmarked,'#13#10'  blocked,'#13#10'  tip,'#13#10 +
      '  id_sklad_to,'#13#10'  parent_id_nakl,'#13#10'  zatraty,'#13#10'  (select om2.id ' +
      'from NAKLO om2 where om2.id_nakl=om.parent_id_nakl) as parent_id' +
      #13#10#13#10'from '#13#10'  NAKLO om'#13#10'where'#13#10'  om.delmarked=0 and om.tip in (1,' +
      '2)'#13#10'order by'#13#10'  om.dat'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 392
    Top = 208
    object sdsNaklpID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sdsNaklpDAT: TSQLTimeStampField
      FieldName = 'DAT'
    end
    object sdsNaklpID: TStringField
      FieldName = 'ID'
      Size = 32
    end
    object sdsNaklpID_IZG: TIntegerField
      FieldName = 'ID_IZG'
    end
    object sdsNaklpID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
    end
    object sdsNaklpID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
    end
    object sdsNaklpID_CURRENCY: TSmallintField
      FieldName = 'ID_CURRENCY'
    end
    object sdsNaklpNALOG_NDS: TFMTBCDField
      FieldName = 'NALOG_NDS'
      Precision = 15
      Size = 2
    end
    object sdsNaklpNDS: TFMTBCDField
      FieldName = 'NDS'
      Precision = 15
    end
    object sdsNaklpID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
    end
    object sdsNaklpPOSTED: TSmallintField
      FieldName = 'POSTED'
    end
    object sdsNaklpCOMMENT: TStringField
      FieldName = 'COMMENT'
      Size = 72
    end
    object sdsNaklpKURS: TFloatField
      FieldName = 'KURS'
    end
    object sdsNaklpTIP: TSmallintField
      FieldName = 'TIP'
    end
    object sdsNaklpBLOCKED: TSmallintField
      FieldName = 'BLOCKED'
      Required = True
    end
    object sdsNaklpDELMARKED: TSmallintField
      FieldName = 'DELMARKED'
    end
    object sdsNaklpID_SKLAD_TO: TIntegerField
      FieldName = 'ID_SKLAD_TO'
      Required = True
    end
    object sdsNaklpZATRATY: TFMTBCDField
      FieldName = 'ZATRATY'
      Required = True
      Precision = 15
    end
    object sdsNaklpPARENT_ID_NAKL: TIntegerField
      FieldName = 'PARENT_ID_NAKL'
    end
    object sdsNaklpPARENT_ID: TStringField
      FieldName = 'PARENT_ID'
      ProviderFlags = []
    end
  end
  object dsNaklp: TDataSource
    DataSet = cdsNaklp
    Left = 392
    Top = 336
  end
  object dspNaklp: TDataSetProvider
    DataSet = sdsNaklp
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspNaklpBeforeUpdateRecord
    Left = 392
    Top = 272
  end
  object cdsNaklp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNaklp'
    AfterInsert = cdsNaklpAfterInsert
    BeforeScroll = cdsNaklpBeforeScroll
    OnReconcileError = cdsNaklpReconcileError
    Left = 392
    Top = 304
    object cdsNaklpID_NAKL: TIntegerField
      DisplayLabel = #1048#1076#1077#1085#1090
      FieldName = 'ID_NAKL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsNaklpDAT: TSQLTimeStampField
      FieldName = 'DAT'
      DisplayFormat = 'dd.mm.yy'
    end
    object cdsNaklpID_IZG: TIntegerField
      FieldName = 'ID_IZG'
    end
    object cdsNaklpID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
    end
    object cdsNaklpID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
    end
    object cdsNaklpVSEGO: TFMTBCDField
      FieldName = 'NDS'
      DisplayFormat = '0.00'
      Precision = 15
    end
    object cdsNaklpNALOG_NDS: TFMTBCDField
      FieldName = 'NALOG_NDS'
      Precision = 15
    end
    object cdsNaklpID_SKLAD: TIntegerField
      DefaultExpression = '0'
      FieldName = 'ID_SKLAD'
    end
    object cdsNaklpZAK: TStringField
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'ZAK'
      LookupDataSet = dmdEx.cdsVlad
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_ZAK'
      Size = 50
      Lookup = True
    end
    object cdsNaklpIZG: TStringField
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'IZG'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_IZG'
      Size = 50
      Lookup = True
    end
    object cdsNaklpMANAGER: TStringField
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'MANAGER'
      LookupDataSet = dmdEx.cdsManager
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_MANAGER'
      Size = 30
      Lookup = True
    end
    object cdsNaklpPOSTED: TSmallintField
      DefaultExpression = '0'
      DisplayLabel = #1055#1088#1086#1074#1077#1076#1077#1085#1072
      FieldName = 'POSTED'
      ProviderFlags = [pfInWhere]
      Required = True
    end
    object cdsNaklpID: TStringField
      FieldName = 'ID'
    end
    object cdsNaklpKURS: TFloatField
      FieldName = 'KURS'
      DisplayFormat = '0.0000'
    end
    object cdsNaklpID_CURRENCY: TSmallintField
      FieldName = 'ID_CURRENCY'
    end
    object cdsNaklpCOMMENT: TStringField
      FieldName = 'COMMENT'
      Size = 72
    end
    object cdsNaklpTIP: TSmallintField
      FieldName = 'TIP'
    end
    object cdsNaklpDELMARKED: TSmallintField
      DefaultExpression = '0'
      FieldName = 'DELMARKED'
    end
    object cdsNaklpSKLAD: TStringField
      DisplayLabel = #1057#1082#1083#1072#1076
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'SKLAD'
      LookupDataSet = dmdEx.cdsSklads
      LookupKeyFields = 'OID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_SKLAD'
      Size = 50
      Lookup = True
    end
    object cdsNaklpBLOCKED: TSmallintField
      DefaultExpression = '0'
      FieldName = 'BLOCKED'
      Required = True
    end
    object cdsNaklpSKLAD_TO: TStringField
      FieldKind = fkLookup
      FieldName = 'SKLAD_TO'
      LookupDataSet = dmdEx.cdsSklads
      LookupKeyFields = 'OID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_SKLAD_TO'
      Size = 0
      Lookup = True
    end
    object cdsNaklpTIPCONST: TStringField
      DisplayLabel = #1058#1080#1087
      FieldKind = fkLookup
      FieldName = 'TIPCONST'
      LookupDataSet = dmdEx.cdsNakloTip
      LookupKeyFields = 'ID_FIELD'
      LookupResultField = 'FIELD_VALUE'
      KeyFields = 'TIP'
      Lookup = True
    end
    object cdsNaklpID_SKLAD_TO: TIntegerField
      DefaultExpression = '0'
      FieldName = 'ID_SKLAD_TO'
      Required = True
    end
    object cdsNaklpZATRATY: TFMTBCDField
      DefaultExpression = '0'
      FieldName = 'ZATRATY'
      Required = True
      Precision = 15
    end
    object cdsNaklpPARENT_ID_NAKL: TIntegerField
      FieldName = 'PARENT_ID_NAKL'
    end
    object cdsNaklpPARENT_ID: TStringField
      DisplayLabel = #8470#1087#1088#1080#1093' '#1085#1072#1082#1083
      FieldName = 'PARENT_ID'
    end
  end
  object sdsNaklpt: TSQLDataSet
    CommandText = 
      'select '#13#10'  d.id_nakl,'#13#10'  d.id_tovar,'#13#10'  d.cena,'#13#10'  d.kolotp,'#13#10'  ' +
      'd.id_nakld,'#13#10'  d.id_pos'#13#10'from '#13#10'  NAKLOT d '#13#10'where '#13#10'  d.id_nakl' +
      '=:id_nakl'#13#10'order by'#13#10'  d.id_pos '
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_NAKL'
        ParamType = ptInput
        Value = 115
      end>
    SQLConnection = dmdEx.scUchet
    Left = 424
    Top = 208
    object sdsNaklptID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      Required = True
    end
    object sdsNaklptID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
      Required = True
    end
    object sdsNaklptCENA: TFMTBCDField
      FieldName = 'CENA'
      Precision = 15
    end
    object sdsNaklptKOLOTP: TFMTBCDField
      FieldName = 'KOLOTP'
      Precision = 15
    end
    object sdsNaklptID_NAKLD: TIntegerField
      FieldName = 'ID_NAKLD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsNaklptID_POS: TIntegerField
      FieldName = 'ID_POS'
      Required = True
    end
  end
  object dspNaklpt: TDataSetProvider
    DataSet = sdsNaklpt
    UpdateMode = upWhereKeyOnly
    Left = 424
    Top = 272
  end
  object cdsNaklpt: TClientDataSet
    Aggregates = <>
    DisableStringTrim = True
    IndexFieldNames = 'ID_NAKL'
    MasterFields = 'ID_NAKL'
    MasterSource = dsNaklp
    PacketRecords = 0
    Params = <
      item
        DataType = ftInteger
        Name = 'id_nakl'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'dspNaklpt'
    BeforeInsert = cdsNaklptBeforeInsert
    AfterInsert = cdsNaklptAfterInsert
    BeforeEdit = cdsNaklptBeforeEdit
    BeforePost = cdsNaklptBeforePost
    BeforeDelete = cdsNaklptBeforeDelete
    AfterDelete = cdsNaklptAfterDelete
    BeforeScroll = cdsNaklptBeforeScroll
    OnReconcileError = cdsNaklptReconcileError
    Left = 424
    Top = 304
    object cdsNaklptID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      Required = True
    end
    object cdsNaklptID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
      Required = True
    end
    object cdsNaklptCENA: TFMTBCDField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'CENA'
      DisplayFormat = '0.00'
      Precision = 15
    end
    object cdsNaklptKOLOTP: TFMTBCDField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'KOLOTP'
      DisplayFormat = '0.000'
      Precision = 15
    end
    object cdsNaklptID_NAKLD: TIntegerField
      FieldName = 'ID_NAKLD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsNaklptTOVAR: TStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      FieldKind = fkLookup
      FieldName = 'TOVAR'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_TOVAR'
      Size = 50
      Lookup = True
    end
    object cdsNaklptID_POS: TIntegerField
      DisplayLabel = #8470#1087#1086#1079
      FieldName = 'ID_POS'
      Required = True
    end
  end
  object dsNaklpt: TDataSource
    DataSet = cdsNaklpt
    Left = 424
    Top = 336
  end
  object sdsPost: TSQLDataSet
    CommandText = 'NAKLP_POST_PC'
    CommandType = ctStoredProc
    DataSource = dsNaklp
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
        Value = Null
      end>
    SQLConnection = dmdEx.scUchet
    Left = 456
    Top = 208
  end
  object sdsUnpost: TSQLDataSet
    CommandText = 'NAKLP_UNPOST_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_NAKL'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 456
    Top = 240
  end
  object MainMenu1: TMainMenu
    Left = 456
    Top = 272
    object N1: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      GroupIndex = 10
      object mnuRefresh: TMenuItem
        Action = actRefresh
      end
      object N2: TMenuItem
        Action = actSettings
      end
      object N7: TMenuItem
        Action = actNaklpFilltovarNaklpbux
      end
      object N8: TMenuItem
        Action = actMakeNaklpbux
      end
      object N9: TMenuItem
        Action = actNakloList
      end
      object N5: TMenuItem
        Action = actSebestRecount
      end
      object N21: TMenuItem
        Action = actSebestRecount2
      end
      object N11: TMenuItem
        Action = actShowRepNakloDepend
      end
      object N13: TMenuItem
        Action = actGenerateTara
      end
    end
  end
  object qeNaklo: TQueryExtender
    SlaveQueryExtender = qeNaklot
    Query = cdsNaklp
    KeyField = 'id_nakl'
    Left = 392
    Top = 176
  end
  object sdsDelmark: TSQLDataSet
    CommandText = 'NAKLO_DELMARK_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_NAKL'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 456
    Top = 176
  end
  object qeNaklot: TQueryExtender
    Query = cdsNaklpt
    Left = 424
    Top = 176
  end
  object UnfFilter1: TUnfFilter
    DBGridEh = dbgNaklp
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
    Top = 144
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmNaklp'
    StorageManager = rpsClientEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      '<P>.WindowState'
      'dbgNaklpt.<P>.Columns.<ForAllItems>.Width'
      'Panel3.dbgNaklp.<P>.Columns.<ForAllItems>.Width')
    Left = 424
    Top = 144
  end
  object rpsClientEdit: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 456
    Top = 144
  end
  object PopupMenu1: TPopupMenu
    Left = 272
    Top = 104
    object N3: TMenuItem
      Action = actNaklpFilltovarNaklpbux
    end
    object N4: TMenuItem
      Action = actMakeNaklpbux
    end
    object N6: TMenuItem
      Action = actNakloList
    end
    object N10: TMenuItem
      Action = actSebestRecount
    end
    object N12: TMenuItem
      Action = actShowRepNakloDepend
    end
  end
  object sdsNaklpFilltovarNaklpbux: TSQLDataSet
    CommandText = 'NAKLP_FILL_TOVAR_NAKLPBUX_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_NAKL'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 488
    Top = 176
  end
  object sdsMakeNaklpbux: TSQLDataSet
    CommandText = 'NAKLP_MAKE_NAKLPBUX_PC'
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
    Left = 488
    Top = 208
  end
  object sdsSebestRecount: TSQLDataSet
    CommandText = 'NAKLP_SEBEST_RECOUNT_PC'
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
        Name = 'MODE'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 520
    Top = 176
  end
  object sdsSebestRecount2: TSQLDataSet
    CommandText = 'NAKLP_POST_PC'
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
    Left = 520
    Top = 208
  end
  object sdsGenerateTara: TSQLDataSet
    CommandText = 'GENERATE_TARA'
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
        Name = 'ID_TARA'
        ParamType = ptOutput
        Size = 4
      end
      item
        DataType = ftFloat
        Name = 'KOLOTP_OLD'
        ParamType = ptOutput
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'KOLOTP'
        ParamType = ptOutput
        Size = 8
      end>
    SQLConnection = dmdEx.scUchet
    Left = 488
    Top = 240
  end
end
