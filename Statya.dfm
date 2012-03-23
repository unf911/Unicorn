object frmStatya: TfrmStatya
  Left = 98
  Top = 138
  BorderStyle = bsDialog
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1089#1090#1072#1090#1077#1081' '#1088#1072#1089#1093#1086#1076#1086#1074
  ClientHeight = 282
  ClientWidth = 586
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    586
    282)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 499
    Top = 0
    Width = 89
    Height = 278
    Anchors = [akTop, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      89
      278)
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
    Left = 8
    Top = 8
    Width = 484
    Height = 270
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoFitColWidths = True
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
        FieldName = 'OID'
        Footers = <>
        Width = 2
      end
      item
        EditButtons = <>
        FieldName = 'FULLNAME'
        Footers = <>
        Width = 203
      end
      item
        Checkboxes = True
        EditButtons = <>
        FieldName = 'IS_FACT'
        Footers = <>
        KeyList.Strings = (
          '1'
          '0')
        MinWidth = 15
        Width = 46
      end
      item
        Checkboxes = False
        EditButtons = <>
        FieldName = 'IS_BUX'
        Footers = <>
        KeyList.Strings = (
          '1'
          '0')
      end
      item
        Checkboxes = True
        EditButtons = <>
        FieldName = 'IS_FOR_TOVAR'
        Footers = <>
        KeyList.Strings = (
          '1'
          '0')
        MinWidth = 15
        Width = 79
      end
      item
        Checkboxes = True
        EditButtons = <>
        FieldName = 'IS_FOR_TARA'
        Footers = <>
        KeyList.Strings = (
          '1'
          '0')
        MinWidth = 15
        Width = 72
      end
      item
        Checkboxes = True
        EditButtons = <>
        FieldName = 'DELMARKED'
        Footers = <>
        KeyList.Strings = (
          '1'
          '0')
        MinWidth = 15
        Width = 15
      end>
  end
  object sdsSklad: TSQLDataSet
    CommandText = 'select *'#13#10'from spr_statya_vw s'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 72
    Top = 56
  end
  object dspSklad: TDataSetProvider
    DataSet = sdsSklad
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
    object cdsSkladOID: TIntegerField
      DisplayLabel = #8470
      FieldName = 'OID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSkladNAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'NAME'
      Required = True
      Visible = False
      Size = 50
    end
    object cdsSkladFULLNAME: TStringField
      DisplayLabel = #1044#1083#1080#1085#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
      DisplayWidth = 50
      FieldName = 'FULLNAME'
      OnChange = cdsSkladFULLNAMEChange
      Size = 250
    end
    object cdsSkladDELMARKED: TSmallintField
      DisplayLabel = #1059#1076#1072#1083#1105#1085
      FieldName = 'DELMARKED'
      Required = True
    end
    object cdsSkladIS_FACT: TIntegerField
      DisplayLabel = #1060#1072#1082#1090#1080#1095#1077#1089#1082#1072#1103
      FieldName = 'IS_FACT'
    end
    object cdsSkladID_BUX: TIntegerField
      DisplayLabel = #1041#1091#1093#1075#1072#1083#1090#1077#1088#1089#1082#1072#1103
      FieldName = 'IS_BUX'
    end
    object cdsSkladIS_FOR_TOVAR: TIntegerField
      DisplayLabel = #1041#1091#1093' '#1076#1083#1103' '#1090#1086#1074#1072#1088#1086#1074
      FieldName = 'IS_FOR_TOVAR'
    end
    object cdsSkladIS_FOR_TARA: TIntegerField
      DisplayLabel = #1041#1091#1093' '#1076#1083#1103' '#1090#1072#1088#1099
      FieldName = 'IS_FOR_TARA'
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
end
