object frmTovarSpr: TfrmTovarSpr
  Left = 1
  Top = 0
  BorderStyle = bsDialog
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1090#1086#1074#1072#1088#1086#1074
  ClientHeight = 404
  ClientWidth = 643
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
    Left = 560
    Top = 0
    Width = 83
    Height = 404
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      83
      404)
    object btnDelete: TButton
      Left = 5
      Top = 88
      Width = 72
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 0
      OnClick = btnDeleteClick
    end
    object btnEdit: TButton
      Left = 5
      Top = 56
      Width = 72
      Height = 25
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      OnClick = btnEditClick
    end
    object btnInsert: TButton
      Left = 5
      Top = 24
      Width = 72
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 2
      OnClick = btnInsertClick
    end
    object BitBtn1: TBitBtn
      Left = 5
      Top = 120
      Width = 72
      Height = 25
      Action = actRefresh
      Anchors = [akLeft, akTop, akRight]
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 3
      Kind = bkRetry
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 24
    Width = 561
    Height = 380
    Align = alCustom
    AllowedOperations = [alopUpdateEh]
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsTovar
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    ReadOnly = True
    TabOrder = 1
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
        FieldName = 'NAME'
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
        Width = 16
      end
      item
        EditButtons = <>
        FieldName = 'EDIZ'
        Footers = <>
        Title.Caption = 
          #1045#1076#1080#1085#1080#1094#1099' '#1080#1079#1084#1077#1088#1077#1085#1080#1103' ('#1087#1086#1076#1090#1103#1075#1080#1074#1072#1102#1090#1089#1103' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1077#1076#1080#1085#1080#1094' '#1080#1079#1084#1077#1088#1077#1085#1080#1103 +
          ')'
      end
      item
        EditButtons = <>
        FieldName = 'EDIZ_OLD'
        Footers = <>
        Title.Hint = 
          #1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103' ('#1091#1089#1090#1072#1088#1077#1074#1096#1077#1077', '#1089#1077#1081#1095#1072#1089' '#1080#1089#1087#1086#1083#1100#1079#1091#1077#1090#1089#1103' '#1077#1076#1080#1085#1080#1094#1099' '#1080#1079#1084#1077#1088 +
          #1077#1085#1080#1103' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1077#1076#1080#1085#1080#1094' '#1080#1079#1084#1077#1088#1077#1085#1080#1103')'
        Width = 26
      end
      item
        EditButtons = <>
        FieldName = 'WEIGHT'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'ID'
        Footers = <>
      end>
  end
  object edtFilter: TEdit
    Left = 248
    Top = 0
    Width = 145
    Height = 21
    Hint = #1042#1074#1077#1076#1080#1090#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1092#1080#1083#1100#1090#1088#1072
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnKeyUp = edtFilterKeyUp
  end
  object cbxContains: TCheckBox
    Left = 152
    Top = 0
    Width = 81
    Height = 17
    Caption = #1057#1086#1076#1077#1088#1078#1080#1090
    TabOrder = 4
    OnKeyUp = cbxContainsKeyUp
  end
  object cbxFields: TComboBox
    Left = 0
    Top = 0
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 3
    Text = ' '
  end
  object sdsTovar: TSQLDataSet
    CommandText = 
      'select '#13#10'  t.id,'#13#10'  t.name,'#13#10'  t.ediz as ediz_old,'#13#10'  t.tara,'#13#10' ' +
      ' t.delmarked,'#13#10'  t.id_analog,'#13#10'  t.skladskaya,'#13#10'  t.weight,'#13#10'  t' +
      '.nothing,'#13#10'  t.fullname,'#13#10'  t.gruppa1,'#13#10'  t.gruppa2,'#13#10'  t.gruppa' +
      '3,'#13#10'  t.gruppa4,'#13#10'  t.COPPERPERKM,'#13#10'  t.kodved,'#13#10'  t.id_ediz'#13#10'fr' +
      'om '#13#10'  TOVAR_ALL_VW t'#13#10'order by'#13#10' t.name'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 72
    Top = 56
    object sdsTovarTOVAR: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsTovarNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 44
    end
    object sdsTovarTARA: TSmallintField
      FieldName = 'TARA'
      Required = True
    end
    object sdsTovarDELMARKED: TSmallintField
      FieldName = 'DELMARKED'
      Required = True
    end
    object sdsTovarID_ANALOG: TIntegerField
      FieldName = 'ID_ANALOG'
    end
    object sdsTovarSKLADSKAYA: TSmallintField
      FieldName = 'SKLADSKAYA'
      Required = True
    end
    object sdsTovarWEIGHT: TFloatField
      FieldName = 'WEIGHT'
    end
    object sdsTovarNOTHING: TIntegerField
      FieldName = 'NOTHING'
    end
    object sdsTovarFULLNAME: TStringField
      FieldName = 'FULLNAME'
      Size = 250
    end
    object sdsTovarGRUPPA1: TStringField
      FieldName = 'GRUPPA1'
      Size = 50
    end
    object sdsTovarGRUPPA2: TFloatField
      FieldName = 'GRUPPA2'
    end
    object sdsTovarGRUPPA3: TFloatField
      FieldName = 'GRUPPA3'
    end
    object sdsTovarGRUPPA4: TFloatField
      FieldName = 'GRUPPA4'
    end
    object sdsTovarCOPPERPERKM: TFloatField
      FieldName = 'COPPERPERKM'
    end
    object sdsTovarKODVED: TFMTBCDField
      FieldName = 'KODVED'
      Precision = 15
      Size = 0
    end
    object sdsTovarID_EDIZ: TIntegerField
      FieldName = 'ID_EDIZ'
    end
    object sdsTovarEDIZ_OLD: TStringField
      FieldName = 'EDIZ_OLD'
      Size = 5
    end
  end
  object dspTovar: TDataSetProvider
    DataSet = sdsTovar
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 72
    Top = 88
  end
  object cdsTovar: TClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ProviderName = 'dspTovar'
    AfterInsert = cdsTovarAfterInsert
    BeforePost = cdsTovarBeforePost
    OnReconcileError = cdsTovarReconcileError
    Left = 72
    Top = 120
    object cdsTovarTOVAR: TIntegerField
      DisplayLabel = #8470
      DisplayWidth = 4
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsTovarNAME: TStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      DisplayWidth = 24
      FieldName = 'NAME'
      OnChange = cdsTovarNAMEChange
      Size = 48
    end
    object cdsTovarEDIZ_OLD: TStringField
      DisplayLabel = #1045#1076'.'#1080#1079' ('#1091#1089#1090#1072#1088')'
      DisplayWidth = 4
      FieldName = 'EDIZ_OLD'
      Size = 9
    end
    object cdsTovarTARA: TSmallintField
      DisplayLabel = #1058#1072#1088#1072
      DisplayWidth = 10
      FieldName = 'TARA'
    end
    object cdsTovarDELMARKED: TSmallintField
      DisplayLabel = #1059#1076#1072#1083#1077#1085
      DisplayWidth = 4
      FieldName = 'DELMARKED'
      Required = True
    end
    object cdsTovarID_ANALOG: TIntegerField
      DisplayWidth = 10
      FieldName = 'ID_ANALOG'
      Visible = False
    end
    object cdsTovarSKLADSKAYA: TSmallintField
      DefaultExpression = '0'
      DisplayWidth = 10
      FieldName = 'SKLADSKAYA'
      Required = True
      Visible = False
    end
    object cdsTovarWEIGHT: TFloatField
      DisplayLabel = #1042#1077#1089
      DisplayWidth = 8
      FieldName = 'WEIGHT'
    end
    object cdsTovarNOTHING: TIntegerField
      FieldName = 'NOTHING'
    end
    object cdsTovarFULLNAME: TStringField
      FieldName = 'FULLNAME'
      Size = 250
    end
    object cdsTovarGRUPPA1: TStringField
      FieldName = 'GRUPPA1'
      Size = 50
    end
    object cdsTovarGRUPPA2: TFloatField
      FieldName = 'GRUPPA2'
    end
    object cdsTovarGRUPPA3: TFloatField
      FieldName = 'GRUPPA3'
    end
    object cdsTovarGRUPPA4: TFloatField
      FieldName = 'GRUPPA4'
    end
    object cdsTovarCOPPERPERKM: TFloatField
      FieldName = 'COPPERPERKM'
    end
    object cdsTovarKODVED: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'KODVED'
      EditFormat = '##########'
      Precision = 10
      Size = 0
    end
    object cdsTovarID_EDIZ: TIntegerField
      FieldName = 'ID_EDIZ'
    end
    object cdsTovarEDIZ: TStringField
      DisplayLabel = #1045#1076'. '#1080#1079#1084
      DisplayWidth = 4
      FieldKind = fkLookup
      FieldName = 'EDIZ'
      LookupDataSet = dmdEx.cdsEdiz
      LookupKeyFields = 'OID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_EDIZ'
      Lookup = True
    end
  end
  object dsTovar: TDataSource
    DataSet = cdsTovar
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
    Left = 72
    Top = 184
  end
  object qeTovar: TQueryExtender
    Query = cdsTovar
    Left = 104
    Top = 88
  end
  object MainMenu1: TMainMenu
    Left = 104
    Top = 120
    object N1: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      GroupIndex = 10
      object N2: TMenuItem
        Action = actRefresh
      end
    end
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmTovar'
    StorageManager = rpsClientEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.Top'
      '<P>.Width'
      'DBGridEh1.<P>.Columns.<ForAllItems>.Width')
    Left = 104
    Top = 152
  end
  object rpsClientEdit: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 104
    Top = 184
  end
  object cdsMainAnalog: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_tovar'
        ParamType = ptInput
      end>
    ProviderName = 'DataSetProvider1'
    Left = 136
    Top = 124
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLDataSet1
    Left = 136
    Top = 88
  end
  object SQLDataSet1: TSQLDataSet
    CommandText = 
      'select '#13#10'  id as oid, name'#13#10'from '#13#10'  TOVAR_ALL_VW t '#13#10'where t.de' +
      'lmarked=0   '#13#10'  and (t.id=t.id_analog or t.id=:id_tovar)'#13#10'order ' +
      'by name '
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_tovar'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 136
    Top = 56
  end
end
