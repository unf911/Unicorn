object frmProjectSpr: TfrmProjectSpr
  Left = 366
  Top = 347
  BorderStyle = bsDialog
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1087#1088#1086#1077#1082#1090#1086#1074
  ClientHeight = 218
  ClientWidth = 631
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
  DesignSize = (
    631
    218)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 544
    Top = 0
    Width = 89
    Height = 214
    Anchors = [akTop, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 1
    TabStop = True
    DesignSize = (
      89
      214)
    object btnDelete: TButton
      Left = 5
      Top = 72
      Width = 77
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 2
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
      TabOrder = 0
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
    Left = 4
    Top = 0
    Width = 536
    Height = 184
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
    TabOrder = 0
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
        FieldName = 'NAME'
        Footers = <>
        Width = 131
      end
      item
        EditButtons = <>
        FieldName = 'FULLNAME'
        Footers = <>
      end
      item
        Checkboxes = True
        EditButtons = <>
        FieldName = 'DELMARKED'
        Footers = <>
        KeyList.Strings = (
          '1'
          '0')
      end
      item
        EditButtons = <>
        FieldName = 'POID'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'ID'
        Footers = <>
        Visible = False
      end>
  end
  object btnOk: TBitBtn
    Left = 168
    Top = 189
    Width = 245
    Height = 25
    Anchors = [akLeft, akBottom]
    TabOrder = 2
    TabStop = False
    OnClick = btnOkClick
    Kind = bkOK
  end
  object sdsSklad: TSQLDataSet
    CommandText = 'select *'#13#10'from SPR_PROJECT_VW'#13#10'order by name'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 72
    Top = 56
    object sdsSkladID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsSkladNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
    object sdsSkladFULLNAME: TStringField
      FieldName = 'FULLNAME'
      Size = 250
    end
    object sdsSkladDELMARKED: TSmallintField
      FieldName = 'DELMARKED'
    end
    object sdsSkladPOID: TIntegerField
      FieldName = 'POID'
    end
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
    OnReconcileError = cdsSkladReconcileError
    Left = 72
    Top = 120
    object cdsSkladID: TIntegerField
      DisplayLabel = #8470' '
      FieldName = 'ID'
      Required = True
    end
    object cdsSkladNAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      DisplayWidth = 40
      FieldName = 'NAME'
      Required = True
      Size = 50
    end
    object cdsSkladFULLNAME: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      DisplayWidth = 20
      FieldName = 'FULLNAME'
      Size = 250
    end
    object cdsSkladDELMARKED: TSmallintField
      DisplayLabel = #1059#1076#1072#1083#1105#1085
      DisplayWidth = 5
      FieldName = 'DELMARKED'
      Required = True
    end
    object cdsSkladPOID: TIntegerField
      DisplayLabel = #8470' '#1088#1086#1076#1080#1090#1077#1083#1103
      FieldName = 'POID'
    end
    object cdsSkladPOID_NAME: TStringField
      DisplayLabel = #1056#1086#1076#1080#1090#1077#1083#1100
      FieldKind = fkLookup
      FieldName = 'POID_NAME'
      LookupDataSet = dmdEx.cdsProject
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'POID'
      Size = 50
      Lookup = True
    end
  end
  object dsSklad: TDataSource
    DataSet = MemTableEh1
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
    object actDebug: TAction
      Caption = #1056#1077#1078#1080#1084' '#1086#1090#1083#1072#1076#1082#1080
      OnExecute = actDebugExecute
    end
    object Action1: TAction
      Caption = 'Action1'
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
    Section = 'TfrmSkidkaSpr'
    StorageManager = rpsClientEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      '<P>.WindowState'
      'dbgClient.<P>.Columns.<ForAllItems>.Width')
    Left = 104
    Top = 120
  end
  object rpsClientEdit: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 104
    Top = 152
  end
  object MainMenu1: TMainMenu
    Left = 136
    Top = 152
    object mnuActions: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      GroupIndex = 10
      object N1: TMenuItem
        Action = actRefresh
      end
      object N15: TMenuItem
        Action = actDebug
      end
    end
  end
  object MemTableEh1: TMemTableEh
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NAME'
        Attributes = [faRequired]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'FULLNAME'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'DELMARKED'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'POID'
        DataType = ftInteger
      end>
    FetchAllOnOpen = True
    IndexDefs = <
      item
        Name = 'MemTableEh1Index1'
        Fields = 'ID'
        Options = [ixPrimary]
      end>
    Params = <>
    DataDriver = DataSetDriverEh1
    StoreDefs = True
    BeforeInsert = MemTableEh1BeforeInsert
    AfterInsert = MemTableEh1AfterInsert
    BeforePost = cdsSkladBeforePost
    Left = 40
    Top = 56
    object MemTableEh1NAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'NAME'
      Required = True
      Size = 50
    end
    object MemTableEh1FULLNAME: TStringField
      DisplayLabel = #1044#1083#1080#1085#1085#1086#1077' '#1080#1084#1103
      FieldName = 'FULLNAME'
      Visible = False
      Size = 250
    end
    object MemTableEh1DELMARKED: TSmallintField
      DisplayLabel = #1059#1076#1072#1083#1105#1085
      FieldName = 'DELMARKED'
      Required = True
      Visible = False
    end
    object MemTableEh1POID: TIntegerField
      FieldName = 'POID'
      Visible = False
    end
    object MemTableEh1ID: TIntegerField
      FieldName = 'ID'
      Required = True
      Visible = False
    end
    object MemTableEh1POID_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'POID_NAME'
      LookupDataSet = dmdEx.cdsProject
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'POID'
      Size = 50
      Lookup = True
    end
    object MemTableEh1ExpCount: TAggregateField
      FieldName = 'ExpCount'
      Active = True
      Expression = 'SUM(Expanded)'
    end
  end
  object DataSetDriverEh1: TDataSetDriverEh
    KeyFields = 'ID'
    ProviderDataSet = cdsSklad
    Left = 40
    Top = 88
  end
end
