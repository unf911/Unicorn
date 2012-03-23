object frmVygruzkaSpr: TfrmVygruzkaSpr
  Left = 396
  Top = 158
  BorderStyle = bsDialog
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1074#1099#1075#1088#1091#1079#1086#1082
  ClientHeight = 217
  ClientWidth = 554
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDefault
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
        FieldName = 'ID_VYGRUZKA'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'PUNKT_VYGRUZKI'
        Footers = <>
      end
      item
        Checkboxes = True
        EditButtons = <>
        FieldName = 'IS_LAST'
        Footers = <>
        KeyList.Strings = (
          '1'
          '0')
      end>
  end
  object sdsSklad: TSQLDataSet
    CommandText = 
      'select '#13#10'  id_reys,'#13#10'  id_vygruzka,'#13#10'  punkt_vygruzki,'#13#10'  is_las' +
      't,'#13#10'  delmarked'#13#10'from'#13#10'  SPR_VYGRUZKA_VW o'#13#10'where'#13#10'   o.id_reys=' +
      ':id_reys'#13#10'order by'#13#10'   o.id_vygruzka'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'id_reys'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = dmdEx.scUchet
    Left = 72
    Top = 56
    object sdsSkladID_REYS: TIntegerField
      FieldName = 'ID_REYS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsSkladDELMARKED: TSmallintField
      FieldName = 'DELMARKED'
    end
    object sdsSkladID_VYGRUZKA: TIntegerField
      FieldName = 'ID_VYGRUZKA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsSkladPUNKT_VYGRUZKI: TStringField
      FieldName = 'PUNKT_VYGRUZKI'
      Size = 50
    end
    object sdsSkladIS_LAST: TSmallintField
      FieldName = 'IS_LAST'
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
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_reys'
        ParamType = ptInput
      end>
    ProviderName = 'dspSklad'
    AfterInsert = cdsSkladAfterInsert
    BeforePost = cdsSkladBeforePost
    OnReconcileError = cdsSkladReconcileError
    Left = 72
    Top = 120
    object cdsSkladID_VYGRUZKA: TIntegerField
      DisplayLabel = #8470' '#1074#1099#1075#1088#1091#1079#1082#1080
      FieldName = 'ID_VYGRUZKA'
      Required = True
    end
    object cdsSkladID_REYS: TIntegerField
      DisplayLabel = #8470' '#1088#1077#1081#1089#1072
      FieldName = 'ID_REYS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSkladPUNKT_VYGRUZKI: TStringField
      DisplayLabel = #1055#1091#1085#1082#1090' '#1074#1099#1075#1088#1091#1079#1082#1080
      DisplayWidth = 20
      FieldName = 'PUNKT_VYGRUZKI'
      Size = 50
    end
    object cdsSkladDELMARKED: TSmallintField
      FieldName = 'DELMARKED'
    end
    object cdsSkladIS_LAST: TSmallintField
      DisplayLabel = #1050#1086#1085#1077#1095#1085#1099#1081' '#1087#1091#1085#1082#1090
      FieldName = 'IS_LAST'
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
    Section = 'TfrmVygruzkaSpr'
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
    KeyField = 'ID_VYGRUZKA'
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
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
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
