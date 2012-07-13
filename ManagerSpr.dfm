object frmManagerSpr: TfrmManagerSpr
  Left = 277
  Top = 150
  BorderStyle = bsDialog
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1084#1077#1085#1077#1076#1078#1077#1088#1086#1074
  ClientHeight = 207
  ClientWidth = 409
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
    409
    207)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 8
    Top = 4
    Width = 306
    Height = 165
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsManager
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGridEh1DblClick
    OnKeyDown = DBGridEh1KeyDown
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ID'
        Footers = <>
        Width = 133
      end
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Width = 169
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
        Width = 43
      end>
  end
  object btnOk: TBitBtn
    Left = 340
    Top = 164
    Width = 37
    Height = 25
    Anchors = [akLeft, akBottom]
    TabOrder = 1
    Visible = False
    OnClick = btnOkClick
    Kind = bkOK
  end
  object btnCancel: TBitBtn
    Left = 364
    Top = 160
    Width = 37
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    Visible = False
    OnClick = btnCancelClick
    Kind = bkCancel
  end
  object btnApply: TBitBtn
    Left = 192
    Top = 176
    Width = 89
    Height = 25
    Action = actApply
    Anchors = [akLeft, akBottom]
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    TabOrder = 3
    Kind = bkAll
  end
  object Panel1: TPanel
    Left = 320
    Top = 0
    Width = 89
    Height = 207
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 4
    DesignSize = (
      89
      207)
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
    object BitBtn2: TBitBtn
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
  object sdsManager: TSQLDataSet
    CommandText = 
      'select'#13#10'  name,'#13#10'  id,'#13#10'  delmarked,'#13#10'  fullname,'#13#10'  signature,'#13 +
      #10'  poid,'#13#10'  visible_area,'#13#10'  id_dolgnost '#13#10'from'#13#10'  MANAGER_VW p'#13 +
      #10'order by'#13#10'  p.name'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 96
    Top = 56
    object sdsManagerNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
    object sdsManagerID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sdsManagerDELMARKED: TSmallintField
      FieldName = 'DELMARKED'
    end
    object sdsManagerFULLNAME: TStringField
      FieldName = 'FULLNAME'
      Size = 250
    end
    object sdsManagerSIGNATURE: TStringField
      FieldName = 'SIGNATURE'
      Size = 250
    end
    object sdsManagerPOID: TIntegerField
      FieldName = 'POID'
    end
    object sdsManagerVISIBLE_AREA: TIntegerField
      FieldName = 'VISIBLE_AREA'
    end
    object sdsManagerID_DOLGNOST: TIntegerField
      FieldName = 'ID_DOLGNOST'
    end
  end
  object dspManager: TDataSetProvider
    DataSet = sdsManager
    UpdateMode = upWhereKeyOnly
    Left = 128
    Top = 56
  end
  object cdsSklad: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspManager'
    Left = 160
    Top = 56
    object cdsSkladID: TIntegerField
      DisplayLabel = #8470
      DisplayWidth = 5
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsSkladNAME: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      DisplayWidth = 20
      FieldName = 'NAME'
      Size = 32
    end
    object cdsSkladFULLNAME: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      DisplayWidth = 20
      FieldName = 'FULLNAME'
      Size = 250
    end
    object cdsSkladDELMARKED: TSmallintField
      DisplayLabel = #1059#1076#1072#1083
      DisplayWidth = 2
      FieldName = 'DELMARKED'
      Required = True
    end
    object cdsSkladSIGNATURE: TStringField
      DisplayLabel = #1055#1086#1076#1087#1080#1089#1100
      FieldName = 'SIGNATURE'
      Size = 250
    end
    object cdsSkladPOID: TIntegerField
      FieldName = 'POID'
      Visible = False
    end
    object cdsSkladVISIBLE_AREA: TIntegerField
      FieldName = 'VISIBLE_AREA'
      Visible = False
    end
    object cdsSkladID_DOLGNOST: TIntegerField
      FieldName = 'ID_DOLGNOST'
    end
    object cdsSkladDOLGNOST: TStringField
      FieldKind = fkLookup
      FieldName = 'DOLGNOST'
      LookupDataSet = dmdEx.cdsDolgnost
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_DOLGNOST'
      Size = 50
      Lookup = True
    end
  end
  object dsManager: TDataSource
    DataSet = MemTableEh1
    Left = 256
    Top = 56
  end
  object ActionList1: TActionList
    Left = 192
    Top = 88
    object actApply: TAction
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      OnExecute = actApplyExecute
    end
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnExecute = actRefreshExecute
    end
  end
  object rpsClientEdit: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 160
    Top = 88
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmManager'
    StorageManager = rpsClientEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      'DBGridEh1.<P>.Columns.<ForAllItems>.Width')
    Left = 128
    Top = 88
  end
  object UnfFilter1: TUnfFilter
    DBGridEh = DBGridEh1
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
    Left = 96
    Top = 88
  end
  object MemTableEh1: TMemTableEh
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 32
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
        Name = 'SIGNATURE'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'POID'
        DataType = ftInteger
      end
      item
        Name = 'VISIBLE_AREA'
        DataType = ftInteger
      end
      item
        Name = 'ID_DOLGNOST'
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
    TreeList.Active = True
    TreeList.KeyFieldName = 'ID'
    TreeList.RefParentFieldName = 'POID'
    TreeList.DefaultNodeExpanded = True
    BeforeInsert = MemTableEh1BeforeInsert
    AfterInsert = MemTableEh1AfterInsert
    Left = 224
    Top = 56
    object MemTableEh1ID: TIntegerField
      DisplayLabel = #8470
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object MemTableEh1NAME: TStringField
      DisplayLabel = #1048#1084#1103' '#1084#1077#1085#1077#1076#1078#1077#1088#1072
      FieldName = 'NAME'
      Size = 32
    end
    object MemTableEh1FULLNAME: TStringField
      DisplayLabel = #1055#1086#1083#1085#1086#1077' '#1080#1084#1103
      FieldName = 'FULLNAME'
      Size = 250
    end
    object MemTableEh1DELMARKED: TSmallintField
      DisplayLabel = #1059#1076#1072#1083#1105#1085
      FieldName = 'DELMARKED'
      Required = True
    end
    object MemTableEh1SIGNATURE: TStringField
      DisplayLabel = #1055#1086#1076#1087#1080#1089#1100
      FieldName = 'SIGNATURE'
      Size = 250
    end
    object MemTableEh1POID: TIntegerField
      FieldName = 'POID'
      Visible = False
    end
    object MemTableEh1VISIBLE_AREA: TIntegerField
      FieldName = 'VISIBLE_AREA'
      Visible = False
    end
    object MemTableEh1POID_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'POID_NAME'
      LookupDataSet = dmdEx.cdsManager
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'POID'
      ProviderFlags = []
      Lookup = True
    end
    object MemTableEh1VISIBLE_AREA_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'VISIBLE_AREA_NAME'
      LookupDataSet = dmdEx.cdsManager
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'VISIBLE_AREA'
      ProviderFlags = []
      Lookup = True
    end
    object MemTableEh1DOLGNOST: TStringField
      FieldKind = fkLookup
      FieldName = 'DOLGNOST'
      LookupDataSet = dmdEx.cdsDolgnost
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_DOLGNOST'
      Size = 50
      Lookup = True
    end
    object MemTableEh1ID_DOLGNOST: TIntegerField
      FieldName = 'ID_DOLGNOST'
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
    Left = 192
    Top = 56
  end
end
