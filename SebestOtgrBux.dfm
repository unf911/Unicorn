object frmSebestOtgrBux: TfrmSebestOtgrBux
  Left = 518
  Top = 420
  BorderStyle = bsDialog
  Caption = #1054#1090#1095#1105#1090' '#1087#1086' '#1089#1077#1073#1077#1089#1090#1086#1080#1084#1086#1089#1090#1080' '#1086#1090#1075#1088#1091#1079#1086#1082' ('#1073#1091#1093')'
  ClientHeight = 404
  ClientWidth = 630
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
  OnDestroy = FormDestroy
  DesignSize = (
    630
    404)
  PixelsPerInch = 96
  TextHeight = 13
  object dbgRasx: TDBGridEh
    Left = 8
    Top = 32
    Width = 617
    Height = 362
    AllowedOperations = []
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsRasx
    EditActions = [geaCopyEh, geaSelectAllEh]
    Flat = False
    FooterColor = clInfoBk
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghRowHighlight]
    PopupMenu = PopupMenu1
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
    OnDblClick = dbgRasxDblClick
    OnKeyDown = dbgRasxKeyDown
    Columns = <
      item
        EditButtons = <>
        FieldName = 'DAT'
        Footer.Value = #1047#1072#1087#1080#1089#1077#1081
        Footer.ValueType = fvtStaticText
        Footers = <>
        Title.TitleButton = True
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = 'IZG'
        Footer.ValueType = fvtCount
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
        FieldName = 'SKLAD'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'TOVAR'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'ANALOG'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'KOLOTP'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'NDS_FACT'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'NDS_SEBEST'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'DOXOD'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'RENT'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'ID_TOVAR'
        Footers = <>
        Title.TitleButton = True
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'ID_SKLAD'
        Footers = <>
        Title.TitleButton = True
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'ID_MANAGER'
        Footers = <>
        Title.TitleButton = True
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'ID_ZAK'
        Footers = <>
        Title.TitleButton = True
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'ID_IZG'
        Footers = <>
        Title.TitleButton = True
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'ID_ANALOG'
        Footers = <>
        Visible = False
      end>
  end
  object BitBtn2: TBitBtn
    Left = 12
    Top = 0
    Width = 97
    Height = 25
    Action = actRefresh
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100
    TabOrder = 1
    Kind = bkRetry
  end
  object BitBtn1: TBitBtn
    Left = 116
    Top = 0
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
    Left = 220
    Top = 0
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
  object dsRasx: TDataSource
    DataSet = cdsRasx
    Left = 40
    Top = 160
  end
  object ActionList1: TActionList
    Images = dmdEx.ImageList1
    Left = 72
    Top = 128
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ShortCut = 116
      OnExecute = actRefreshExecute
    end
    object actItogo: TAction
      Caption = #1048#1090#1086#1075#1086
    end
    object actPreview: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      ShortCut = 16471
      Visible = False
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
      ImageIndex = 8
      OnExecute = actSettingsExecute
    end
    object actClose: TAction
      Caption = 'actClose'
      ShortCut = 27
      OnExecute = actCloseExecute
    end
    object actDebug: TAction
      Caption = #1056#1077#1078#1080#1084' '#1086#1090#1083#1072#1076#1082#1080
      OnExecute = actDebugExecute
    end
    object actShowNakl: TAction
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1089#1082#1083#1072#1076#1089#1082#1091#1102' '#1085#1072#1082#1083#1072#1076#1085#1091#1102
      OnExecute = actShowNaklExecute
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
      object N3: TMenuItem
        Action = actDetail
      end
      object N2: TMenuItem
        Action = actRefresh
      end
      object N4: TMenuItem
        Action = actSettings
      end
      object N6: TMenuItem
        Action = actDebug
      end
      object N8: TMenuItem
        Action = actShowNakl
      end
    end
  end
  object sdsRasx: TSQLDataSet
    CommandText = 
      'select '#13#10'from rep_sebest_otgr_bux_pc(:mode,:dat_from,:dat_to,'#13#10':' +
      'id_schet_in,'#13#10':id_izg_in,:id_zak_in,:id_manager_in,:id_sklad_in,' +
      #13#10':id_tovar_in,:id_post_in,null) r'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'mode'
        ParamType = ptInput
      end
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
        Name = 'id_schet_in'
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
      end
      item
        DataType = ftUnknown
        Name = 'id_sklad_in'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_tovar_in'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_post_in'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 40
    Top = 64
  end
  object dspRasx: TDataSetProvider
    DataSet = sdsRasx
    Options = [poAllowCommandText]
    Left = 40
    Top = 96
  end
  object cdsRasx: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'mode'
        ParamType = ptInput
        Value = Null
      end
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
        DataType = ftInteger
        Name = 'id_schet_in'
        ParamType = ptInput
        Value = Null
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
      end
      item
        DataType = ftInteger
        Name = 'id_sklad_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'id_tovar_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'id_post_in'
        ParamType = ptInput
        Value = Null
      end>
    ProviderName = 'dspRasx'
    Left = 40
    Top = 128
    object cdsRasxDAT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 10
      FieldName = 'DAT'
      DisplayFormat = 'dd.mm.yy'
    end
    object cdsRasxIZG: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      FieldKind = fkLookup
      FieldName = 'IZG'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_IZG'
      Lookup = True
    end
    object cdsRasxZAK: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      FieldKind = fkLookup
      FieldName = 'ZAK'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_ZAK'
      Lookup = True
    end
    object cdsRasxMANAGER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      FieldKind = fkLookup
      FieldName = 'MANAGER'
      LookupDataSet = dmdEx.cdsManager
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_MANAGER'
      Lookup = True
    end
    object cdsRasxSKLAD: TStringField
      DisplayLabel = #1057#1082#1083#1072#1076
      FieldKind = fkLookup
      FieldName = 'SKLAD'
      LookupDataSet = dmdEx.cdsSklads
      LookupKeyFields = 'OID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_SKLAD'
      Lookup = True
    end
    object cdsRasxANALOG: TStringField
      DisplayLabel = #1040#1085#1072#1083#1086#1075
      FieldKind = fkLookup
      FieldName = 'ANALOG'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_ANALOG'
      Lookup = True
    end
    object cdsRasxTOVAR: TStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      FieldKind = fkLookup
      FieldName = 'TOVAR'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_TOVAR'
      Lookup = True
    end
    object cdsRasxKOLOTP: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'KOLOTP'
      DisplayFormat = '0.000'
    end
    object cdsRasxNDS_FACT: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1087#1088#1086#1076', '#1075#1088#1085
      FieldName = 'NDS_FACT'
      DisplayFormat = '0.00'
    end
    object cdsRasxNDS_SEBEST: TFloatField
      DisplayLabel = #1057'/'#1089', '#1075#1088#1085
      FieldName = 'NDS_SEBEST'
      DisplayFormat = '0.0000'
    end
    object cdsRasxDOXOD: TFloatField
      DisplayLabel = #1044#1086#1093#1086#1076', '#1075#1088#1085
      FieldName = 'DOXOD'
      DisplayFormat = '0.0000'
    end
    object cdsRasxRENT: TFloatField
      DisplayLabel = #1056#1077#1085#1090#1072#1073', %'
      FieldName = 'RENT'
      DisplayFormat = '0.0'
    end
    object cdsRasxID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
    end
    object cdsRasxID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
    end
    object cdsRasxID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
    end
    object cdsRasxID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
    end
    object cdsRasxID_IZG: TIntegerField
      FieldName = 'ID_IZG'
    end
    object cdsRasxID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      Visible = False
    end
    object cdsRasxID_ANALOG: TIntegerField
      FieldName = 'ID_ANALOG'
    end
  end
  object qeRasx: TQueryExtender
    Query = cdsRasx
    Left = 40
    Top = 192
  end
  object UnfFilter1: TUnfFilter
    DBGridEh = dbgRasx
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
    Section = 'TfrmSebes'#1077'Otgr'
    StorageManager = rpsSebestOst1
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      '<P>.WindowState')
    Left = 72
    Top = 64
  end
  object rpsSebestOst1: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 104
    Top = 64
  end
  object PopupMenu1: TPopupMenu
    Left = 72
    Top = 96
    object N5: TMenuItem
      Action = actDetail
      Default = True
    end
    object N7: TMenuItem
      Action = actShowNakl
    end
  end
  object PropStorageEh2: TPropStorageEh
    Active = False
    Section = 'TfrmSebestOst'
    StorageManager = rpsSebestOst2
    StoredProps.Strings = (
      'dbhRasx.<P>.Columns.<ForAllItems>.Width')
    Left = 72
    Top = 160
  end
  object rpsSebestOst2: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 104
    Top = 160
  end
  object MemTableEh1: TMemTableEh
    Params = <>
    DataDriver = SQLDataDriverEh1
    Left = 8
    Top = 128
    object MemTableEh1DAT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 10
      FieldName = 'DAT'
      DisplayFormat = 'dd.mm.yy'
    end
    object MemTableEh1IZG: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      FieldKind = fkLookup
      FieldName = 'IZG'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_IZG'
      Lookup = True
    end
    object MemTableEh1ZAK: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      FieldKind = fkLookup
      FieldName = 'ZAK'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_ZAK'
      Lookup = True
    end
    object MemTableEh1MANAGER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      FieldKind = fkLookup
      FieldName = 'MANAGER'
      LookupDataSet = dmdEx.cdsManager
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_MANAGER'
      Lookup = True
    end
    object MemTableEh1SKLAD: TStringField
      DisplayLabel = #1057#1082#1083#1072#1076
      FieldKind = fkLookup
      FieldName = 'SKLAD'
      LookupDataSet = dmdEx.cdsSklads
      LookupKeyFields = 'OID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_SKLAD'
      Lookup = True
    end
    object MemTableEh1ANALOG: TStringField
      DisplayLabel = #1040#1085#1072#1083#1086#1075
      FieldKind = fkLookup
      FieldName = 'ANALOG'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_ANALOG'
      Lookup = True
    end
    object MemTableEh1TOVAR: TStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      FieldKind = fkLookup
      FieldName = 'TOVAR'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_TOVAR'
      Lookup = True
    end
    object MemTableEh1KOLOTP: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'KOLOTP'
      DisplayFormat = '0.000'
    end
    object MemTableEh1NDS_FACT: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1087#1088#1086#1076', '#1075#1088#1085
      FieldName = 'NDS_FACT'
      DisplayFormat = '0.00'
    end
    object MemTableEh1NDS_SEBEST: TFloatField
      DisplayLabel = #1057'/'#1089', '#1075#1088#1085
      FieldName = 'NDS_SEBEST'
      DisplayFormat = '0.0000'
    end
    object MemTableEh1DOXOD: TFloatField
      DisplayLabel = #1044#1086#1093#1086#1076', '#1075#1088#1085
      FieldName = 'DOXOD'
      DisplayFormat = '0.0000'
    end
    object MemTableEh1RENT: TFloatField
      DisplayLabel = #1056#1077#1085#1090#1072#1073', %'
      FieldName = 'RENT'
      DisplayFormat = '0.0'
    end
    object MemTableEh1ID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
    end
    object MemTableEh1ID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
    end
    object MemTableEh1ID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
    end
    object MemTableEh1ID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
    end
    object MemTableEh1ID_IZG: TIntegerField
      FieldName = 'ID_IZG'
    end
    object MemTableEh1ID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      Visible = False
    end
    object MemTableEh1ID_ANALOG: TIntegerField
      FieldName = 'ID_ANALOG'
    end
  end
  object SQLDataDriverEh1: TSQLDataDriverEh
    DeleteCommand.Params = <>
    DynaSQLParams.Options = []
    GetrecCommand.Params = <>
    InsertCommand.Params = <>
    SelectCommand.Params = <>
    UpdateCommand.Params = <>
    ProviderDataSet = sdsRasx
    Left = 8
    Top = 96
  end
end
