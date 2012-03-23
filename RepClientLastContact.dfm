object frmRepClientLastContact: TfrmRepClientLastContact
  Left = 182
  Top = 196
  BorderStyle = bsDialog
  Caption = #1054#1090#1095#1105#1090' '#1087#1086' '#1076#1072#1090#1077' '#1087#1086#1089#1083#1077#1076#1085#1077#1075#1086' '#1082#1086#1085#1090#1072#1082#1090#1072' '#1089' '#1082#1083#1080#1077#1085#1090#1086#1084
  ClientHeight = 331
  ClientWidth = 510
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
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    510
    331)
  PixelsPerInch = 96
  TextHeight = 13
  object dbhRasx: TDBGridEh
    Left = 0
    Top = 40
    Width = 509
    Height = 289
    AllowedOperations = []
    AllowedSelections = []
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsRasx
    Flat = False
    FooterColor = clInfoBk
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
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
    OnDblClick = dbhRasxDblClick
    OnKeyDown = dbhRasxKeyDown
    Columns = <
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'YUR_ADRES'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'FIZ_ADRES'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'TEL'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'FAX'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'KONTACT_LICO'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'DIRECTOR'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'DAT'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'MANAGER'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'ID_KLIENT'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'ID_NAKL'
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
        FieldName = 'TIP'
        Footers = <>
        Visible = False
      end>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 510
    Height = 39
    Align = alTop
    TabOrder = 1
    object BitBtn5: TBitBtn
      Left = 8
      Top = 9
      Width = 97
      Height = 25
      Action = actRefresh
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 0
      Kind = bkRetry
    end
    object BitBtn6: TBitBtn
      Left = 120
      Top = 9
      Width = 97
      Height = 25
      Action = actDetail
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      TabOrder = 1
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
      Left = 230
      Top = 9
      Width = 97
      Height = 25
      Action = actSettings
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      TabOrder = 2
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
    object actDebug: TAction
      Caption = #1056#1077#1078#1080#1084' '#1086#1090#1083#1072#1076#1082#1080
      OnExecute = actDebugExecute
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
        Enabled = False
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
    end
  end
  object sdsRasx: TSQLDataSet
    CommandText = 
      'select'#13#10'    (select name from objects o where o.oid=r.id_manager' +
      ') as manager,'#13#10'    (select fullname from objects o where o.oid=r' +
      '.tip) as tip_name,'#13#10'    dat,'#13#10'    tip,'#13#10'    id_nakl,'#13#10'    id_kli' +
      'ent,'#13#10'    name,'#13#10'    id_manager,'#13#10'    yur_adres,'#13#10'    fiz_adres,' +
      #13#10'    tel,'#13#10'    fax,'#13#10'    kontact_lico,'#13#10'    director'#13#10'from'#13#10'   ' +
      ' rep_klient_last_contact_pc(:id_manager) r'#13#10'order by'#13#10'    r.name'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_manager'
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
        Name = 'id_manager'
        ParamType = ptInput
        Value = Null
      end>
    ProviderName = 'dspRasx'
    Left = 40
    Top = 128
    object cdsRasxNAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      DisplayWidth = 40
      FieldName = 'NAME'
      Size = 50
    end
    object cdsRasxYUR_ADRES: TStringField
      DisplayLabel = #1070#1088'. '#1072#1076#1088#1077#1089
      DisplayWidth = 30
      FieldName = 'YUR_ADRES'
      Size = 100
    end
    object cdsRasxFIZ_ADRES: TStringField
      DisplayLabel = #1060#1080#1079'. '#1072#1076#1088#1077#1089
      DisplayWidth = 30
      FieldName = 'FIZ_ADRES'
      Size = 100
    end
    object cdsRasxTEL: TStringField
      DisplayLabel = #1058#1077#1083
      DisplayWidth = 15
      FieldName = 'TEL'
      Size = 50
    end
    object cdsRasxFAX: TStringField
      DisplayLabel = #1060#1072#1082#1089
      DisplayWidth = 15
      FieldName = 'FAX'
      Size = 50
    end
    object cdsRasxKONTACT_LICO: TStringField
      DisplayLabel = #1050#1086#1085#1090#1072#1082#1090#1085#1086#1077' '#1083#1080#1094#1086
      DisplayWidth = 20
      FieldName = 'KONTACT_LICO'
      Size = 50
    end
    object cdsRasxDIRECTOR: TStringField
      DisplayLabel = #1044#1080#1088#1077#1082#1090#1086#1088
      DisplayWidth = 20
      FieldName = 'DIRECTOR'
      Size = 50
    end
    object cdsRasxDAT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086#1089#1083#1077#1076#1085#1077#1081' '#1088#1072#1089#1093#1086#1076#1085#1086#1081' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      DisplayWidth = 10
      FieldName = 'DAT'
      DisplayFormat = 'dd.mm.yy'
    end
    object cdsRasxMANAGER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      DisplayWidth = 10
      FieldName = 'MANAGER'
      Size = 50
    end
    object cdsRasxID_KLIENT: TIntegerField
      FieldName = 'ID_KLIENT'
      Visible = False
    end
    object cdsRasxID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      Visible = False
    end
    object cdsRasxID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
      Visible = False
    end
    object cdsRasxTIP: TIntegerField
      FieldName = 'TIP'
      Visible = False
    end
  end
  object qeRasx: TQueryExtender
    Query = cdsRasx
    Left = 40
    Top = 192
  end
  object UnfFilter1: TUnfFilter
    DBGridEh = dbhRasx
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
    Section = 'TfrmRepClientData'
    StorageManager = rpsSkladRasxDetEx
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      'dbhRasx.<P>.Columns.<ForAllItems>.Width')
    Left = 72
    Top = 64
  end
  object rpsSkladRasxDetEx: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 104
    Top = 64
  end
  object PopupMenu1: TPopupMenu
    Left = 224
    Top = 88
    object N5: TMenuItem
      Action = actDetail
      Default = True
    end
  end
end
