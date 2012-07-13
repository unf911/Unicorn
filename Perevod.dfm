object frmPerevod: TfrmPerevod
  Left = 166
  Top = 131
  BorderStyle = bsDialog
  Caption = #1055#1077#1088#1077#1074#1086#1076#1099
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
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 337
    Width = 626
    Height = 23
    Panels = <>
    SimplePanel = True
  end
  object dbgNaklo: TDBGridEh
    Left = 0
    Top = 0
    Width = 536
    Height = 337
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
    FooterRowCount = 1
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight]
    PopupMenu = PopupMenu1
    ReadOnly = True
    SortLocal = True
    SumList.Active = True
    TabOrder = 1
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
        FieldName = 'BANK_FROM'
        Footers = <>
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'ZAK'
        Footers = <>
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'BANK_TO'
        Footers = <>
        Width = 58
      end
      item
        EditButtons = <>
        FieldName = 'NDS_FROM'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'NDS'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 62
      end
      item
        EditButtons = <>
        FieldName = 'MANAGER'
        Footers = <>
        Width = 50
      end
      item
        Checkboxes = True
        EditButtons = <>
        FieldName = 'POSTED'
        Footers = <>
        KeyList.Strings = (
          '1'
          '0')
        MaxWidth = 16
      end
      item
        EditButtons = <>
        FieldName = 'COMMENT'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'CURRENCY'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'CURRENCY_TO'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'KURS'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'ID_NAKL'
        Footers = <>
        Visible = False
      end>
  end
  object Panel4: TPanel
    Left = 536
    Top = 0
    Width = 90
    Height = 337
    Align = alRight
    BevelOuter = bvNone
    Constraints.MinHeight = 150
    TabOrder = 2
    DesignSize = (
      90
      337)
    object BitBtn2: TBitBtn
      Left = 3
      Top = 0
      Width = 85
      Height = 33
      Action = actPost
      Anchors = [akLeft, akTop, akRight]
      Caption = #1055#1088#1086#1074#1077#1089#1090#1080
      TabOrder = 0
    end
    object btnUnpost: TBitBtn
      Left = 3
      Top = 40
      Width = 85
      Height = 33
      Action = actUnpost
      Anchors = [akLeft, akTop, akRight]
      Caption = #1042#1077#1088#1085#1091#1090#1100
      TabOrder = 1
    end
    object BitBtn7: TBitBtn
      Left = 3
      Top = 80
      Width = 85
      Height = 25
      Action = actRefresh
      Anchors = [akLeft, akTop, akRight]
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 2
      Kind = bkRetry
    end
    object BitBtn6: TBitBtn
      Left = 3
      Top = 113
      Width = 85
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
  end
  object ActionList1: TActionList
    Images = dmdEx.ImageList1
    Left = 192
    Top = 56
    object actGrid1ListShow: TAction
      Caption = 'actGrid1ListShow'
      OnExecute = actGrid1ListShowExecute
    end
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 9
      ShortCut = 116
      OnExecute = actRefreshExecute
    end
    object actSettings: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      Hint = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1077#1088#1080#1086#1076#1072' '#1074#1088#1077#1084#1077#1085#1080
      ImageIndex = 8
      ShortCut = 16465
      OnExecute = actSettingsExecute
    end
    object actApply: TAction
      Caption = 'actApply'
      OnExecute = actApplyExecute
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
    object actDebug: TAction
      Caption = #1056#1077#1078#1080#1084' '#1086#1090#1083#1072#1076#1082#1080
      OnExecute = actDebugExecute
    end
    object actMakePerevodFromPerevod: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1087#1077#1088#1077#1074#1086#1076' '#1085#1072' '#1086#1089#1085#1086#1074#1072#1085#1080#1080'...'
      OnExecute = actMakePerevodFromPerevodExecute
    end
  end
  object dsNaklo: TDataSource
    DataSet = cdsNaklo
    Left = 64
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
      object N7: TMenuItem
        Action = actMakePerevodFromPerevod
        GroupIndex = 7
      end
      object N2: TMenuItem
        Action = actDebug
        GroupIndex = 7
      end
    end
  end
  object sdsPlat: TSQLDataSet
    CommandText = 'select'#13#10'  om.*'#13#10'from PEREVOD_VW om'#13#10'order by om.dat,om.id_nakl'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 64
    Top = 184
    object sdsPlatDAT: TSQLTimeStampField
      FieldName = 'DAT'
      Required = True
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
      ProviderFlags = []
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
      Size = 8
    end
    object sdsPlatCOMMENT: TStringField
      FieldName = 'COMMENT'
      Size = 50
    end
    object sdsPlatPARENT_ID_NAKL: TIntegerField
      FieldName = 'PARENT_ID_NAKL'
    end
    object sdsPlatZATRATY: TFMTBCDField
      FieldName = 'ZATRATY'
      Precision = 15
      Size = 8
    end
    object sdsPlatKURS: TFloatField
      FieldName = 'KURS'
      Required = True
    end
    object sdsPlatID_CURRENCY: TSmallintField
      FieldName = 'ID_CURRENCY'
      Required = True
    end
    object sdsPlatID_CURRENCY_TO: TIntegerField
      FieldName = 'ID_CURRENCY_TO'
    end
    object sdsPlatKURS_INDIRECT: TSmallintField
      FieldName = 'KURS_INDIRECT'
    end
    object sdsPlatNDS_FROM: TFMTBCDField
      FieldName = 'NDS_FROM'
      Precision = 15
      Size = 8
    end
    object sdsPlatBLOCKED: TSmallintField
      FieldName = 'BLOCKED'
    end
    object sdsPlatDELMARKED: TSmallintField
      FieldName = 'DELMARKED'
    end
    object sdsPlatID_SCHET_IZG: TIntegerField
      FieldName = 'ID_SCHET_IZG'
    end
    object sdsPlatID_SCHET_ZAK: TIntegerField
      FieldName = 'ID_SCHET_ZAK'
    end
  end
  object dspPlat: TDataSetProvider
    DataSet = sdsPlat
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspPlatBeforeUpdateRecord
    Left = 64
    Top = 216
  end
  object cdsNaklo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPlat'
    AfterInsert = cdsNakloAfterInsert
    BeforeScroll = cdsNakloBeforeScroll
    OnReconcileError = cdsNakloReconcileError
    Left = 64
    Top = 248
    object cdsNakloID: TStringField
      DisplayLabel = #8470#1076#1086#1082
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
      DisplayLabel = #1054#1090#1087#1088#1072#1074#1080#1090#1077#1083#1100
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
    object cdsNakloBANK_FROM: TStringField
      DisplayLabel = #1057#1095#1105#1090' '#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083#1103
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'BANK_FROM'
      LookupDataSet = dmdEx.cdsBank
      LookupKeyFields = 'OID'
      LookupResultField = 'FULLNAME'
      KeyFields = 'ID_SCHET_IZG'
      Size = 50
      Lookup = True
    end
    object cdsNakloZAK: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
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
      DisplayLabel = #1057#1091#1084#1084#1072' '#1087#1086#1083#1091#1095#1077#1085#1080#1103
      DisplayWidth = 10
      FieldName = 'NDS'
      Required = True
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 64
      Size = 8
    end
    object cdsNakloPRIM: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      DisplayWidth = 15
      FieldName = 'COMMENT'
      Size = 50
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
      FieldName = 'ZATRATY'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 8
    end
    object cdsNakloKURS: TFloatField
      DisplayLabel = #1050#1091#1088#1089
      FieldName = 'KURS'
      Required = True
      DisplayFormat = '0.0000'
    end
    object cdsNakloCURRENCY: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072' '#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083#1103
      DisplayWidth = 5
      FieldKind = fkLookup
      FieldName = 'CURRENCY'
      LookupDataSet = dmdEx.cdsCurrency
      LookupKeyFields = 'OID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_CURRENCY'
      Lookup = True
    end
    object cdsNakloID_CURRENCY: TSmallintField
      FieldName = 'ID_CURRENCY'
      Required = True
    end
    object cdsNakloCURRENCY_TO: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
      FieldKind = fkLookup
      FieldName = 'CURRENCY_TO'
      LookupDataSet = dmdEx.cdsCurrency
      LookupKeyFields = 'OID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_CURRENCY_TO'
      Size = 10
      Lookup = True
    end
    object cdsNakloID_CURRENCY_TO: TIntegerField
      FieldName = 'ID_CURRENCY_TO'
    end
    object cdsNakloKURS_INDIRECT: TSmallintField
      FieldName = 'KURS_INDIRECT'
    end
    object cdsNakloNDS_FROM: TFMTBCDField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1080#1103
      FieldName = 'NDS_FROM'
      DisplayFormat = '0.00'
      Precision = 64
      Size = 8
    end
    object cdsNakloBLOCKED: TSmallintField
      FieldName = 'BLOCKED'
    end
    object cdsNakloDELMARKED: TSmallintField
      FieldName = 'DELMARKED'
    end
    object cdsNakloID_SCHET_IZG: TIntegerField
      FieldName = 'ID_SCHET_IZG'
    end
    object cdsNakloID_SCHET_ZAK: TIntegerField
      FieldName = 'ID_SCHET_ZAK'
    end
    object cdsNakloBANK_TO: TStringField
      DisplayLabel = #1057#1095#1105#1090' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'BANK_TO'
      LookupDataSet = dmdEx.cdsBank
      LookupKeyFields = 'OID'
      LookupResultField = 'FULLNAME'
      KeyFields = 'ID_SCHET_ZAK'
      Size = 50
      Lookup = True
    end
  end
  object qeNaklo: TQueryExtender
    Query = cdsNaklo
    KeyField = 'id_nakl'
    Left = 64
    Top = 120
  end
  object sdsDelmark: TSQLDataSet
    CommandText = 'PEREVOD_DELMARK_PC'
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
    CommandText = 'PEREVOD_POST_PC'
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
        Value = Null
      end>
    SQLConnection = dmdEx.scUchet
    Left = 160
    Top = 184
  end
  object sdsUnpost: TSQLDataSet
    CommandText = 'PEREVOD_UNPOST_PC'
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
    Section = 'TfrmPlategy'
    StorageManager = rpsClientEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      '<P>.WindowState'
      'dbgNaklo.<P>.Columns.<ForAllItems>.Width')
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
    Left = 96
    Top = 120
    object N8: TMenuItem
      Action = actMakePerevodFromPerevod
    end
  end
end
