object frmSkladSpr: TfrmSkladSpr
  Left = 156
  Top = 174
  BorderStyle = bsDialog
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1089#1082#1083#1072#1076#1086#1074
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
      Kind = bkRetry
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
        FieldName = 'OID'
        Footers = <>
        Width = 109
      end
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Width = 147
      end
      item
        EditButtons = <>
        FieldName = 'MANAGER'
        Footers = <>
        Width = 100
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
        Width = 32
      end
      item
        Checkboxes = True
        EditButtons = <>
        FieldName = 'ISDEFAULT'
        Footers = <>
        KeyList.Strings = (
          '1'
          '0')
        Width = 25
      end
      item
        EditButtons = <>
        FieldName = 'FULLNAME'
        Footers = <>
        Width = 93
      end>
  end
  object sdsSklad: TSQLDataSet
    CommandText = 
      'select '#13#10'  o.oid,'#13#10'  o.name,'#13#10'  o.delmarked,'#13#10'  o.id_manager,'#13#10' ' +
      ' o.fullname,'#13#10'  o.isdefault,'#13#10'  o.poid'#13#10'from'#13#10'  SPR_SKLAD_VW o'#13#10 +
      'order by'#13#10'  o.delmarked, '#13#10'  o.name'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 72
    Top = 56
    object sdsSkladOID: TIntegerField
      FieldName = 'OID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsSkladNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
    object sdsSkladDELMARKED: TSmallintField
      FieldName = 'DELMARKED'
      Required = True
    end
    object sdsSkladID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
    end
    object sdsSkladFULLNAME: TStringField
      FieldName = 'FULLNAME'
      Size = 250
    end
    object sdsSkladISDEFAULT: TSmallintField
      FieldName = 'ISDEFAULT'
    end
    object sdsSkladPOID: TIntegerField
      FieldName = 'POID'
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
    OnReconcileError = cdsSkladReconcileError
    Left = 72
    Top = 120
    object cdsSkladOID: TIntegerField
      DisplayLabel = #8470
      DisplayWidth = 5
      FieldName = 'OID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSkladNAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1082#1083#1072#1076#1072
      FieldName = 'NAME'
      Required = True
      Size = 50
    end
    object cdsSkladDELMARKED: TSmallintField
      DisplayLabel = #1059#1076#1072#1083#1105#1085
      FieldName = 'DELMARKED'
      Required = True
    end
    object cdsSkladMANAGER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      FieldKind = fkLookup
      FieldName = 'MANAGER'
      LookupDataSet = dmdEx.cdsManager
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_MANAGER'
      Size = 30
      Lookup = True
    end
    object cdsSkladID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
      Visible = False
    end
    object cdsSkladFULLNAME: TStringField
      DisplayLabel = #1055#1086#1083#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1089#1082#1083#1072#1076#1072
      DisplayWidth = 30
      FieldName = 'FULLNAME'
      Size = 250
    end
    object cdsSkladISDEFAULT: TSmallintField
      DisplayLabel = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
      FieldName = 'ISDEFAULT'
    end
    object cdsSkladPOID: TIntegerField
      FieldName = 'POID'
    end
    object cdsSkladPARENT_SKLAD: TStringField
      DisplayLabel = #1056#1086#1076#1080#1090#1077#1083#1100#1089#1082#1080#1081' '#1089#1082#1083#1072#1076
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'PARENT_SKLAD'
      LookupDataSet = dmdEx.cdsSklads
      LookupKeyFields = 'OID'
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
    object actShowDeleted: TAction
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1091#1076#1072#1083#1105#1085#1085#1099#1077
      OnExecute = actShowDeletedExecute
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
    Section = 'TfrmSklad'
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
  object qeSklad: TQueryExtender
    Query = cdsSklad
    KeyField = 'OID'
    Left = 72
    Top = 184
  end
  object MainMenu1: TMainMenu
    Left = 104
    Top = 184
    object N1: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      GroupIndex = 10
      object N2: TMenuItem
        Action = actRefresh
      end
      object N3: TMenuItem
        Action = actShowDeleted
      end
    end
  end
  object DataSetDriverEh1: TDataSetDriverEh
    KeyFields = 'OID'
    ProviderDataSet = cdsSklad
    Left = 192
    Top = 56
  end
  object MemTableEh1: TMemTableEh
    FieldDefs = <
      item
        Name = 'OID'
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
        Name = 'DELMARKED'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'ID_MANAGER'
        DataType = ftInteger
      end
      item
        Name = 'FULLNAME'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'ISDEFAULT'
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
        Fields = 'OID'
        Options = [ixPrimary]
      end>
    Params = <>
    DataDriver = DataSetDriverEh1
    StoreDefs = True
    TreeList.Active = True
    TreeList.KeyFieldName = 'OID'
    TreeList.RefParentFieldName = 'POID'
    TreeList.DefaultNodeExpanded = True
    BeforeInsert = MemTableEh1BeforeInsert
    AfterInsert = MemTableEh1AfterInsert
    BeforePost = MemTableEh1BeforePost
    Left = 224
    Top = 56
    object MemTableEh1OID: TIntegerField
      DisplayLabel = #8470
      DisplayWidth = 5
      FieldName = 'OID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object MemTableEh1NAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1082#1083#1072#1076#1072
      FieldName = 'NAME'
      Required = True
      Size = 50
    end
    object MemTableEh1DELMARKED: TSmallintField
      DisplayLabel = #1059#1076#1072#1083#1105#1085
      FieldName = 'DELMARKED'
      Required = True
    end
    object MemTableEh1MANAGER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      FieldKind = fkLookup
      FieldName = 'MANAGER'
      LookupDataSet = dmdEx.cdsManager
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_MANAGER'
      Size = 30
      Lookup = True
    end
    object MemTableEh1ID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
      Visible = False
    end
    object MemTableEh1FULLNAME: TStringField
      DisplayLabel = #1055#1086#1083#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1089#1082#1083#1072#1076#1072
      DisplayWidth = 30
      FieldName = 'FULLNAME'
      Size = 250
    end
    object MemTableEh1ISDEFAULT: TSmallintField
      DisplayLabel = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
      FieldName = 'ISDEFAULT'
    end
    object MemTableEh1PARENT_SKLAD: TStringField
      DisplayLabel = #1056#1086#1076#1080#1090#1077#1083#1100#1089#1082#1080#1081' '#1089#1082#1083#1072#1076
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'PARENT_SKLAD'
      LookupDataSet = dmdEx.cdsSklads
      LookupKeyFields = 'OID'
      LookupResultField = 'NAME'
      KeyFields = 'POID'
      Size = 50
      Lookup = True
    end
    object MemTableEh1POID: TIntegerField
      FieldName = 'POID'
    end
    object MemTableEh1ExpCount: TAggregateField
      FieldName = 'ExpCount'
      Active = True
      Expression = 'SUM(Expanded)'
    end
  end
end
