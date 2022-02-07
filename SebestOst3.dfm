object frmSebestOst3: TfrmSebestOst3
  Left = 7
  Top = 0
  BorderStyle = bsDialog
  Caption = #1054#1090#1095#1105#1090' '#1087#1086' '#1089#1077#1073#1077#1089#1090#1086#1080#1084#1086#1089#1090#1080' '#1089#1082#1083#1072#1076#1072'3'
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
    AutoFitColWidths = True
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
        FieldName = 'SKLAD'
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
        FieldName = 'ID_SKLAD'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'ID_TOVAR'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'ID_PARTIYA'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'KOLOTP'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'SEBEST'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'SEBESTSUM'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'DAT'
        Footers = <>
        Visible = False
        Width = 53
      end
      item
        EditButtons = <>
        FieldName = 'ID_SKLAD'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'ID_TOVAR'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'ID_MANAGER'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'MANAGER'
        Footers = <>
        Visible = False
        Width = 94
      end
      item
        EditButtons = <>
        FieldName = 'ANALOG'
        Footers = <>
        Visible = False
      end>
  end
  object BitBtn2: TBitBtn
    Left = 4
    Top = 0
    Width = 97
    Height = 25
    Action = actRefresh
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100
    TabOrder = 1
    Kind = bkRetry
  end
  object BitBtn1: TBitBtn
    Left = 108
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
    Left = 212
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
    object actDetail: TAction
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      ShortCut = 120
      OnExecute = actDetailExecute
    end
    object actSettings: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      ImageIndex = 8
      OnExecute = actSettingsExecute
    end
    object actClose: TAction
      Caption = 'actClose'
      OnExecute = actCloseExecute
    end
    object actDebug: TAction
      Caption = #1056#1077#1078#1080#1084' '#1086#1090#1083#1072#1076#1082#1080
      OnExecute = actDebugExecute
    end
    object actPartiyaRecount: TAction
      Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1087#1072#1088#1090#1080#1102
      OnExecute = actPartiyaRecountExecute
    end
  end
  object MainMenu1: TMainMenu
    Left = 104
    Top = 128
    object mnuActions: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      GroupIndex = 10
      object N1: TMenuItem
        Caption = #1055#1088#1086#1089#1084#1086#1090#1088
        ShortCut = 16471
        Visible = False
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
      object N7: TMenuItem
        Action = actPartiyaRecount
      end
    end
  end
  object sdsRasx: TSQLDataSet
    CommandText = 
      'select'#13#10'  (select name from objects o where o.oid=r.id_sklad) as' +
      ' sklad,'#13#10'  (select name from objects o where o.oid=r.id_tovar) a' +
      's tovar,'#13#10'  id_sklad,id_tovar,id_partiya,dat,'#13#10'  kolotp,sebest,s' +
      'ebestsum,'#13#10'  id_manager,'#13#10'  (select name from objects o where o.' +
      'oid=r.id_manager) as manager,'#13#10'  (select name from objects o whe' +
      're o.oid=('#13#10'    select id_analog from tovar t where t.oid=r.id_t' +
      'ovar'#13#10')) as analog'#13#10'from '#13#10'  rep_sebest4_sklad_pc(:mode,:id_skla' +
      'd_in,:id_tovar_in,'#13#10'  :id_currency_to,:dat_to) r'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'mode'
        ParamType = ptInput
        Value = 2
      end
      item
        DataType = ftInteger
        Name = 'id_sklad_in'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'id_tovar_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_currency_to'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dat_to'
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
        Value = 2
      end
      item
        DataType = ftInteger
        Name = 'id_sklad_in'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'id_tovar_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'id_currency_to'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftDate
        Name = 'dat_to'
        ParamType = ptInput
        Value = Null
      end>
    ProviderName = 'dspRasx'
    OnCalcFields = cdsRasxCalcFields
    Left = 40
    Top = 128
    object cdsRasxSKLAD: TStringField
      DisplayLabel = #1057#1082#1083#1072#1076
      DisplayWidth = 15
      FieldName = 'SKLAD'
      Size = 50
    end
    object cdsRasxTOVAR: TStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      DisplayWidth = 25
      FieldName = 'TOVAR'
      Size = 50
    end
    object cdsRasxID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
      Visible = False
    end
    object cdsRasxID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
      Visible = False
    end
    object cdsRasxID_PARTIYA: TFMTBCDField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1087#1072#1088#1090#1080#1080
      FieldName = 'ID_PARTIYA'
      Precision = 15
    end
    object cdsRasxKOLOTP: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'KOLOTP'
      DisplayFormat = '0.000'
    end
    object cdsRasxSEBEST: TFloatField
      DisplayLabel = #1057#1077#1073#1077#1089#1090
      FieldName = 'SEBEST'
      DisplayFormat = '0.00000'
    end
    object cdsRasxSEBESTSUM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SEBESTSUM'
      DisplayFormat = '0.00000'
    end
    object cdsRasxDAT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086#1089#1090#1072#1074#1082#1080
      DisplayWidth = 10
      FieldName = 'DAT'
      DisplayFormat = 'dd.mm.yy'
    end
    object cdsRasxID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
    end
    object cdsRasxMANAGER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      FieldName = 'MANAGER'
      Size = 50
    end
    object cdsRasxANALOG: TStringField
      DisplayLabel = #1054#1089#1085'. '#1072#1085#1072#1083#1086#1075
      DisplayWidth = 25
      FieldName = 'ANALOG'
      Size = 50
    end
  end
  object qeRasx: TQueryExtender
    Query = cdsRasx
    KeyField = 'id_partiya'
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
    Section = 'TfrmSebestOst'
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
    object N8: TMenuItem
      Action = actPartiyaRecount
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
  object sdsSebestRecount: TSQLDataSet
    CommandText = 'NAKLP_SEBEST4_PART_RECOUNT_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftTimeStamp
        Name = 'DAT_FROM_IN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_TOVAR_IN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_SKLAD_IN'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'ID_PARTIYA_IN'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 140
    Top = 68
  end
end
