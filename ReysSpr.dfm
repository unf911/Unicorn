object frmReysSpr: TfrmReysSpr
  Left = 396
  Top = 158
  BorderStyle = bsDialog
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1088#1077#1081#1089#1086#1074
  ClientHeight = 217
  ClientWidth = 554
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 465
    Top = 0
    Width = 89
    Height = 217
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      89
      217)
    object btnDelete: TButton
      Left = 5
      Top = 72
      Width = 77
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 0
      OnClick = btnDeleteClick
    end
    object btnEdit: TButton
      Left = 5
      Top = 40
      Width = 77
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      OnClick = btnEditClick
    end
    object btnInsert: TButton
      Left = 5
      Top = 8
      Width = 77
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 2
      OnClick = btnInsertClick
    end
    object BitBtn1: TBitBtn
      Left = 6
      Top = 104
      Width = 77
      Height = 25
      Action = actRefresh
      Anchors = [akLeft, akTop, akRight]
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 3
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
        33333333333F8888883F33330000324334222222443333388F3833333388F333
        000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
        F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
        223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
        3338888300003AAAAAAA33333333333888888833333333330000333333333333
        333333333333333333FFFFFF000033333333333344444433FFFF333333888888
        00003A444333333A22222438888F333338F3333800003A2243333333A2222438
        F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
        22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
        33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
        3333333333338888883333330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object dbgClient: TDBGridEh
    Left = 0
    Top = 0
    Width = 465
    Height = 217
    Align = alClient
    DataSource = dsSklad
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghTraceColSizing, dghIncSearch, dghPreferIncSearch, dghRowHighlight]
    ReadOnly = True
    SortLocal = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    VertScrollBar.VisibleMode = sbAlwaysShowEh
    OnDblClick = dbgClientDblClick
    OnKeyDown = dbgClientKeyDown
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ID_REYS'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'NOMER_AVTO'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'DAT_REYS'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'FIO_VODITELYA'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'PEREVOZCHIK'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'PUNKT_ZAGRUZKI'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'NOMER_PRITSEPA'
        Footers = <>
      end
      item
        Checkboxes = True
        EditButtons = <>
        FieldName = 'POKUPATEL_PLATIT'
        Footers = <>
        KeyList.Strings = (
          '1'
          '0')
      end
      item
        EditButtons = <>
        FieldName = 'CENA_REYSA'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'COMMENT'
        Footers = <>
      end>
  end
  object sdsSklad: TSQLDataSet
    CommandText = 
      'select '#13#10'  id_reys,'#13#10'  id_perevozchik,'#13#10'  fio_voditelya,'#13#10'  dat_' +
      'reys,'#13#10'  punkt_zagruzki,'#13#10'  nomer_avto,'#13#10'  nomer_pritsepa,'#13#10'  PO' +
      'KUPATEL_PLATIT,'#13#10'  CENA_REYSA,'#13#10'  delmarked,'#13#10'  comment'#13#10'from'#13#10' ' +
      ' SPR_REYS_VW o'#13#10'order by'#13#10'  o.dat_reys,'#13#10'  o.nomer_avto'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 72
    Top = 56
    object sdsSkladID_REYS: TIntegerField
      FieldName = 'ID_REYS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsSkladID_PEREVOZCHIK: TIntegerField
      FieldName = 'ID_PEREVOZCHIK'
    end
    object sdsSkladFIO_VODITELYA: TStringField
      FieldName = 'FIO_VODITELYA'
      Size = 50
    end
    object sdsSkladDAT_REYS: TSQLTimeStampField
      FieldName = 'DAT_REYS'
    end
    object sdsSkladPUNKT_ZAGRUZKI: TStringField
      FieldName = 'PUNKT_ZAGRUZKI'
      Size = 50
    end
    object sdsSkladNOMER_AVTO: TStringField
      FieldName = 'NOMER_AVTO'
      Size = 30
    end
    object sdsSkladNOMER_PRITSEPA: TStringField
      FieldName = 'NOMER_PRITSEPA'
      Size = 50
    end
    object sdsSkladPOKUPATEL_PLATIT: TSmallintField
      FieldName = 'POKUPATEL_PLATIT'
    end
    object sdsSkladCENA_REYSA: TFMTBCDField
      FieldName = 'CENA_REYSA'
      Precision = 15
      Size = 4
    end
    object sdsSkladDELMARKED: TSmallintField
      FieldName = 'DELMARKED'
    end
    object sdsSkladCOMMENT: TStringField
      FieldName = 'COMMENT'
      Size = 50
    end
  end
  object dspSklad: TDataSetProvider
    DataSet = sdsSklad
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 72
    Top = 88
  end
  object cdsSklad: TClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ProviderName = 'dspSklad'
    AfterInsert = cdsSkladAfterInsert
    BeforePost = cdsSkladBeforePost
    OnReconcileError = cdsSkladReconcileError
    Left = 72
    Top = 120
    object cdsSkladID_PEREVOZCHIK: TIntegerField
      FieldName = 'ID_PEREVOZCHIK'
    end
    object cdsSkladID_REYS: TIntegerField
      DisplayLabel = #8470' '#1088#1077#1081#1089#1072
      FieldName = 'ID_REYS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSkladNOMER_AVTO: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1072#1074#1090#1086#1084#1086#1073#1080#1083#1103
      DisplayWidth = 10
      FieldName = 'NOMER_AVTO'
      Size = 30
    end
    object cdsSkladDAT_REYS: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072' '#1088#1077#1081#1089#1072
      DisplayWidth = 10
      FieldName = 'DAT_REYS'
    end
    object cdsSkladFIO_VODITELYA: TStringField
      DisplayLabel = #1060#1048#1054' '#1074#1086#1076#1080#1090#1077#1083#1103
      DisplayWidth = 20
      FieldName = 'FIO_VODITELYA'
      Size = 50
    end
    object cdsSkladPEREVOZCHIK: TStringField
      DisplayLabel = #1055#1077#1088#1077#1074#1086#1079#1095#1080#1082
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'PEREVOZCHIK'
      LookupDataSet = dmdEx.cdsClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_PEREVOZCHIK'
      Size = 50
      Lookup = True
    end
    object cdsSkladPUNKT_ZAGRUZKI: TStringField
      DisplayLabel = #1055#1091#1085#1082#1090' '#1079#1072#1075#1088#1091#1079#1082#1080
      DisplayWidth = 20
      FieldName = 'PUNKT_ZAGRUZKI'
      Size = 50
    end
    object cdsSkladNOMER_PRITSEPA: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1087#1088#1080#1094#1077#1087#1072
      DisplayWidth = 20
      FieldName = 'NOMER_PRITSEPA'
      Size = 50
    end
    object cdsSkladPOKUPATEL_PLATIT: TSmallintField
      DisplayLabel = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100' '#1087#1083#1072#1090#1080#1090
      FieldName = 'POKUPATEL_PLATIT'
    end
    object cdsSkladCENA_REYSA: TFMTBCDField
      DisplayLabel = #1062#1077#1085#1072' '#1088#1077#1081#1089#1072
      FieldName = 'CENA_REYSA'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 4
    end
    object cdsSkladCOMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      DisplayWidth = 20
      FieldName = 'COMMENT'
      Size = 50
    end
    object cdsSkladDELMARKED: TSmallintField
      FieldName = 'DELMARKED'
    end
  end
  object dsSklad: TDataSource
    DataSet = cdsSklad
    Left = 72
    Top = 152
  end
  object ActionList1: TActionList
    Left = 104
    Top = 56
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ShortCut = 116
      OnExecute = actRefreshExecute
    end
    object actShowDeleted: TAction
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1091#1076#1072#1083#1105#1085#1085#1099#1077
      OnExecute = actShowDeletedExecute
    end
    object actSettings: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      OnExecute = actSettingsExecute
    end
    object actUndeleteNakl: TAction
      Caption = #1042#1077#1088#1085#1091#1090#1100' '#1091#1076#1072#1083#1105#1085#1085#1099#1081
      Visible = False
      OnExecute = actUndeleteNaklExecute
    end
  end
  object UnfFilter1: TUnfFilter
    DBGridEh = dbgClient
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
    Left = 104
    Top = 88
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmReysSpr'
    StorageManager = rpsClientEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      'dbgClient.<P>.Columns.<ForAllItems>.Width')
    Left = 104
    Top = 120
  end
  object rpsClientEdit: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 104
    Top = 152
  end
  object qeKlient: TQueryExtender
    Query = cdsSklad
    KeyField = 'ID_REYS'
    Left = 72
    Top = 184
  end
  object MainMenu1: TMainMenu
    Left = 104
    Top = 184
    object N1: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      GroupIndex = 10
      object N4: TMenuItem
        Action = actSettings
      end
      object N2: TMenuItem
        Action = actRefresh
      end
      object N3: TMenuItem
        Action = actShowDeleted
      end
      object N5: TMenuItem
        Action = actUndeleteNakl
      end
    end
  end
end
