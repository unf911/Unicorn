object frmNNaklp: TfrmNNaklp
  Left = 34
  Top = 109
  BorderStyle = bsDialog
  Caption = #1055#1086#1083#1091#1095#1077#1085#1085#1099#1077' '#1085#1072#1083#1086#1075#1086#1074#1099#1077
  ClientHeight = 358
  ClientWidth = 709
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
  DesignSize = (
    709
    358)
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 335
    Width = 709
    Height = 23
    Panels = <>
    SimplePanel = True
  end
  object dbgNaklo: TDBGridEh
    Left = 0
    Top = 24
    Width = 708
    Height = 311
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoFitColWidths = True
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
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghRowHighlight]
    ReadOnly = True
    SortLocal = True
    SumList.Active = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    VertScrollBar.VisibleMode = sbAlwaysShowEh
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
        FieldName = 'DAT_VYPISKI'
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
        FieldName = 'NALOG_NDS'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'VSEGO'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'VSEGONDS'
        Footer.ValueType = fvtSum
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
        FieldName = 'ID_NAKL'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'TIPNAME'
        Footers = <>
      end>
  end
  object Button1: TButton
    Left = 4
    Top = 4
    Width = 89
    Height = 17
    Action = actSettings
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object Button2: TButton
    Left = 108
    Top = 4
    Width = 89
    Height = 17
    Action = actRefresh
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object ActionList1: TActionList
    Left = 192
    Top = 56
    object actGrid1ListShow: TAction
      Caption = 'actGrid1ListShow'
      OnExecute = actGrid1ListShowExecute
    end
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ShortCut = 116
      OnExecute = actRefreshExecute
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
  end
  object dsNaklo: TDataSource
    DataSet = cdsNaklo
    Left = 64
    Top = 280
  end
  object qeNaklot: TQueryExtender
    KeyField = 'nakl'
    Left = 96
    Top = 120
  end
  object MainMenu1: TMainMenu
    Left = 212
    Top = 4
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
    end
  end
  object qeNaklo: TQueryExtender
    Query = cdsNaklo
    KeyField = 'id_nakl'
    Left = 64
    Top = 120
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmNNaklp'
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
  object cdsNaklo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNaklo'
    AfterInsert = cdsNakloAfterInsert
    BeforeScroll = cdsNakloBeforeScroll
    OnReconcileError = cdsNakloReconcileError
    Left = 64
    Top = 248
    object cdsNakloID: TStringField
      DisplayLabel = #8470
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
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086#1083#1091#1095#1077#1085#1080#1103
      DisplayWidth = 10
      FieldName = 'DAT'
      Required = True
      DisplayFormat = 'dd.mm.yy'
      EditMask = '!99/99/00;1;_'
    end
    object cdsNakloID_IZG: TIntegerField
      FieldName = 'ID_IZG'
      Visible = False
    end
    object cdsNakloID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
      Visible = False
    end
    object cdsNakloID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
      Visible = False
    end
    object cdsNakloDAT_POLUCH: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072' '#1074#1099#1087#1080#1089#1082#1080
      DisplayWidth = 10
      FieldName = 'DAT_VYPISKI'
      DisplayFormat = 'dd.mm.yy'
    end
    object cdsNakloIZG: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'IZG'
      LookupDataSet = dmdEx.cdsPost
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_IZG'
      Size = 50
      Lookup = True
    end
    object cdsNakloZAK: TStringField
      DisplayLabel = #1060#1080#1088#1084#1072
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
    object cdsNakloMANAGER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      DisplayWidth = 1
      FieldKind = fkLookup
      FieldName = 'MANAGER'
      LookupDataSet = dmdEx.cdsManager
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_MANAGER'
      Lookup = True
    end
    object cdsNakloNALOG_NDS: TFMTBCDField
      DisplayLabel = #1057#1090#1072#1074#1082#1072' '#1053#1044#1057
      DisplayWidth = 4
      FieldName = 'NALOG_NDS'
      Required = True
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object cdsNakloOPL: TFMTBCDField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1089' '#1053#1044#1057
      DisplayWidth = 10
      FieldName = 'NDS'
      Required = True
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 32
    end
    object cdsNakloDELMARKED: TSmallintField
      FieldName = 'DELMARKED'
      Required = True
      Visible = False
    end
    object cdsNakloVSEGO: TFMTBCDField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 1
      FieldName = 'VSEGO'
      DisplayFormat = '0.00'
      Precision = 32
      Size = 2
    end
    object cdsNakloVSEGONDS: TFMTBCDField
      DisplayLabel = #1053#1044#1057
      DisplayWidth = 1
      FieldName = 'VSEGONDS'
      DisplayFormat = '0.00'
      Precision = 32
      Size = 2
    end
    object cdsNakloTIP: TSmallintField
      FieldName = 'TIP'
      Required = True
    end
    object cdsNakloTIPNAME: TStringField
      DisplayLabel = #1058#1080#1087
      DisplayWidth = 15
      FieldKind = fkLookup
      FieldName = 'TIPNAME'
      LookupDataSet = cdsTipNNakl
      LookupKeyFields = 'OID'
      LookupResultField = 'FULLNAME'
      KeyFields = 'TIP'
      Size = 250
      Lookup = True
    end
  end
  object sdsNaklo: TSQLDataSet
    CommandText = 
      'SELECT'#13#10'    ID_NAKL, ID, '#13#10'    NDS, DAT,'#13#10'    ID_IZG, ID_ZAK, ID' +
      '_MANAGER,'#13#10'    NALOG_NDS,'#13#10'    DELMARKED,'#13#10'    DAT_VYPISKI,'#13#10'   ' +
      ' VSEGO,'#13#10'    VSEGONDS,'#13#10'    TIP'#13#10'FROM'#13#10'  NNAKLP_VW om'#13#10'ORDER BY ' +
      #13#10'  om.dat,om.id'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 64
    Top = 184
    object sdsNakloID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsNakloID: TStringField
      FieldName = 'ID'
    end
    object sdsNakloNDS: TFMTBCDField
      FieldName = 'NDS'
      Required = True
      Precision = 32
    end
    object sdsNakloDAT: TSQLTimeStampField
      FieldName = 'DAT'
      Required = True
    end
    object sdsNakloID_IZG: TIntegerField
      FieldName = 'ID_IZG'
    end
    object sdsNakloID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
    end
    object sdsNakloID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
    end
    object sdsNakloNALOG_NDS: TFMTBCDField
      FieldName = 'NALOG_NDS'
      Precision = 15
      Size = 2
    end
    object sdsNakloDELMARKED: TSmallintField
      FieldName = 'DELMARKED'
      Required = True
    end
    object sdsNakloDAT_VYPISKI: TSQLTimeStampField
      FieldName = 'DAT_VYPISKI'
    end
    object sdsNakloVSEGO: TFMTBCDField
      FieldName = 'VSEGO'
      Precision = 32
      Size = 2
    end
    object sdsNakloVSEGONDS: TFMTBCDField
      FieldName = 'VSEGONDS'
      Precision = 32
      Size = 2
    end
    object sdsNakloTIP: TSmallintField
      FieldName = 'TIP'
      Required = True
    end
  end
  object dspNaklo: TDataSetProvider
    DataSet = sdsNaklo
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspNakloBeforeUpdateRecord
    Left = 64
    Top = 216
  end
  object sdsTipNNakl: TSQLDataSet
    CommandText = 
      'select'#13#10'  o.oid,'#13#10'  o.name,'#13#10'  o.fullname'#13#10'from '#13#10'  objects o'#13#10'w' +
      'here o.classid=('#13#10'  select oid from get_oid_objects_pc('#39#1058#1048#1055' '#1055#1054#1051#1059 +
      #1063#1045#1053#1053#1067#1061' '#1053#1040#1051#1054#1043#1054#1042#1067#1061' '#1053#1040#1050#1051#1040#1044#1053#1067#1061#39',-100)'#13#10')'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 96
    Top = 184
  end
  object dspTipNNakl: TDataSetProvider
    DataSet = sdsTipNNakl
    Left = 96
    Top = 216
  end
  object cdsTipNNakl: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipNNakl'
    Left = 96
    Top = 248
  end
  object dsTipNNakl: TDataSource
    DataSet = cdsTipNNakl
    Left = 96
    Top = 280
  end
  object sdsDelmark: TSQLDataSet
    CommandText = 'NNAKLP_DELMARK_PC'
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
end
