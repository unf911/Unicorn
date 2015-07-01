object frmRealPrice: TfrmRealPrice
  Left = 236
  Top = 146
  BorderStyle = bsDialog
  Caption = #1060#1072#1082#1090' '#1094#1077#1085#1099
  ClientHeight = 367
  ClientWidth = 700
  Color = clBtnFace
  Constraints.MinHeight = 407
  Constraints.MinWidth = 514
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDefault
  ShowHint = True
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    700
    367)
  PixelsPerInch = 96
  TextHeight = 13
  object btnSettings: TBitBtn
    Left = 618
    Top = 4
    Width = 80
    Height = 17
    Action = actSettings
    Anchors = [akTop, akRight]
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object bntRecalc: TBitBtn
    Left = 618
    Top = 84
    Width = 80
    Height = 17
    Action = actNdsFactRecalc
    Anchors = [akTop, akRight]
    Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Visible = False
  end
  object btnRefresh: TBitBtn
    Left = 618
    Top = 30
    Width = 80
    Height = 17
    Action = actRefresh
    Anchors = [akTop, akRight]
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 618
    Top = 57
    Width = 80
    Height = 17
    Action = actRealMake
    Anchors = [akTop, akRight]
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object dbgNaklr: TDBGridEh
    Left = 8
    Top = 4
    Width = 603
    Height = 357
    AllowedOperations = [alopUpdateEh]
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsNaklr
    Flat = False
    FooterColor = clInfoBk
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    PopupMenu = PopupMenu1
    SumList.Active = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    VertScrollBar.VisibleMode = sbAlwaysShowEh
    OnDblClick = dbgNaklrDblClick
    OnExit = dbgNaklrExit
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ID'
        Footer.Value = #1047#1072#1087#1080#1089#1077#1081':'
        Footer.ValueType = fvtStaticText
        Footers = <>
        ReadOnly = True
      end
      item
        EditButtons = <>
        FieldName = 'DAT'
        Footer.ValueType = fvtCount
        Footers = <>
        ReadOnly = True
      end
      item
        EditButtons = <>
        FieldName = 'DAT_FACT'
        Footers = <>
        ReadOnly = True
      end
      item
        EditButtons = <>
        FieldName = 'IZG'
        Footers = <>
        ReadOnly = True
      end
      item
        EditButtons = <>
        FieldName = 'ZAK'
        Footers = <>
        ReadOnly = True
      end
      item
        EditButtons = <>
        FieldName = 'MANAGER'
        Footer.Value = #1057#1091#1084#1084#1072':'
        Footer.ValueType = fvtStaticText
        Footers = <>
        ReadOnly = True
      end
      item
        EditButtons = <>
        FieldName = 'NDS'
        Footer.ValueType = fvtSum
        Footers = <>
        ReadOnly = True
      end
      item
        EditButtons = <>
        FieldName = 'NDS_FACT'
        Footer.ValueType = fvtSum
        Footers = <>
        ReadOnly = True
      end
      item
        EditButtons = <>
        FieldName = 'OTKAT'
        Footer.ValueType = fvtSum
        Footers = <>
        ReadOnly = True
      end
      item
        EditButtons = <>
        FieldName = 'COMMENT'
        Footers = <>
        Width = 89
      end>
  end
  object cbxOnlyEmpty: TCheckBox
    Left = 631
    Top = 112
    Width = 65
    Height = 17
    Action = actOnlyEmpty
    Anchors = [akTop, akRight]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    Visible = False
  end
  object dsNaklr: TDataSource
    DataSet = cdsNaklr
    Left = 104
    Top = 80
  end
  object dtsNaklrt: TDataSource
    Left = 136
    Top = 80
  end
  object dtsPrice: TDataSource
    Left = 72
    Top = 80
  end
  object qePrice: TQueryExtender
    DefSql = 
      'select '#13#10'  tovar,name,'#13#10'  cena,cenavx,'#13#10'  kod1,kod2,kod3,'#13#10'  tar' +
      'a '#13#10'from '#13#10'  tovar t'#13#10'where '#13#10'  t.delmarked=0'#13#10'order by '#13#10'  name' +
      #13#10
    Left = 72
    Top = 112
  end
  object ActionList1: TActionList
    Left = 72
    Top = 48
    object actSettings: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      Hint = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1077#1088#1080#1086#1076#1072' '#1074#1088#1077#1084#1077#1085#1080' '#1080' '#1074#1099#1073#1086#1088' '#1084#1077#1085#1077#1076#1078#1077#1088#1072
      OnExecute = actSettingsExecute
    end
    object actNdsFactRecalc: TAction
      Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100
      Hint = #1055#1077#1088#1077#1088#1072#1089#1095#1105#1090' '#1090#1077#1082#1091#1097#1077#1081' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      ShortCut = 117
    end
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1074#1089#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077
      ShortCut = 116
      OnExecute = actRefreshExecute
    end
    object actOnlyEmpty: TAction
      Caption = #1042#1085#1077#1089#1090#1080
      Hint = 
        #1055#1086#1082#1072#1079#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1085#1072#1082#1083#1072#1076#1085#1099#1077', '#1074' '#1082#1086#1090#1086#1088#1099#1093' '#1085#1077' '#1073#1099#1083#1080' '#1079#1072#1087#1086#1083#1085#1077#1085#1099' '#1092#1072#1082#1090#1080#1095#1077#1089#1082 +
        #1080#1077' '#1094#1077#1085#1099
      OnExecute = actOnlyEmptyExecute
    end
    object actRealMake: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      OnExecute = actRealMakeExecute
    end
    object actRefreshRecord: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      Visible = False
      OnExecute = actRefreshRecordExecute
    end
  end
  object qeNaklr: TQueryExtender
    Query = cdsNaklr
    KeyField = 'id_nakl'
    Left = 104
    Top = 112
  end
  object qeNaklrt: TQueryExtender
    DefSql = 
      'select '#13#10'  d.sch,  d.nakl,  d.npp,  d.tovar,  d.kolotp,  d.skidk' +
      'a,'#13#10'  d.cena,  d.cena_fact,  '#13#10'  Round(cena_fact*1.2,2)  as cena' +
      '_fact_nds,'#13#10'  d.skidka_fact,  d.tara, d.tip'#13#10'from '#13#10'  naklrt d'#13#10 +
      'where '#13#10'  bitand(d.tip,2)=2 and'#13#10'  nakl=:nakl'#13#10'order by '#13#10'  d.np' +
      'p'#13#10
    KeyField = 'sch'
    Left = 136
    Top = 112
  end
  object dsTemp: TDataSource
    Left = 208
    Top = 80
  end
  object MainMenu1: TMainMenu
    Left = 104
    Top = 48
    object mnuActions: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      GroupIndex = 10
      object N1: TMenuItem
        Action = actSettings
      end
      object N2: TMenuItem
        Action = actRefresh
      end
      object N3: TMenuItem
        Action = actRefreshRecord
      end
      object N5: TMenuItem
        Action = actRealMake
      end
    end
  end
  object sdsNaklr: TSQLDataSet
    CommandText = 
      'select om.id, om.dat,'#13#10'    max(sk.dat) as dat_fact,'#13#10'    sum(sk.' +
      'nds) as nds_fact,'#13#10'    om.id_izg, om.id_zak, om.id_manager,'#13#10'   ' +
      ' om.id_nakl, om.nds, om.comment'#13#10'from naklr_vw om'#13#10'  left join n' +
      'aklo sk on om.id_nakl=sk.parent_id_nakl and'#13#10'  sk.tip=(select oi' +
      'd from get_oid_objects_pc('#39#1054#1090#1075#1088#1091#1079#1082#1072#39',101)) and'#13#10'  sk.delmarked=0' +
      #13#10'where '#13#10'  om.delmarked=0'#13#10'group by sk.parent_id_nakl, sk.tip, ' +
      'om.id, om.dat,'#13#10'    om.id_izg, om.id_zak, om.id_manager,'#13#10'    om' +
      '.id_nakl, om.nds, om.comment'#13#10'order by om.dat, om.id'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 104
    Top = 176
    object sdsNaklrID: TStringField
      FieldName = 'ID'
      ProviderFlags = []
    end
    object sdsNaklrDAT: TSQLTimeStampField
      FieldName = 'DAT'
      ProviderFlags = []
      Required = True
    end
    object sdsNaklrDAT_FACT: TSQLTimeStampField
      FieldName = 'DAT_FACT'
      ProviderFlags = []
    end
    object sdsNaklrNDS_FACT: TFMTBCDField
      FieldName = 'NDS_FACT'
      ProviderFlags = []
      Precision = 15
    end
    object sdsNaklrID_IZG: TIntegerField
      FieldName = 'ID_IZG'
      ProviderFlags = []
    end
    object sdsNaklrID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
      ProviderFlags = []
    end
    object sdsNaklrID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
      ProviderFlags = []
    end
    object sdsNaklrID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      ProviderFlags = [pfInKey]
      Required = True
    end
    object sdsNaklrNDS: TFMTBCDField
      FieldName = 'NDS'
      ProviderFlags = []
      Required = True
      Precision = 15
    end
    object sdsNaklrCOMMENT: TStringField
      FieldName = 'COMMENT'
      Size = 50
    end
  end
  object dspNaklr: TDataSetProvider
    DataSet = sdsNaklr
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    OnGetTableName = dspNaklrGetTableName
    Left = 104
    Top = 208
  end
  object cdsNaklr: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DAT'
        Attributes = [faRequired]
        DataType = ftTimeStamp
      end
      item
        Name = 'DAT_FACT'
        DataType = ftTimeStamp
      end
      item
        Name = 'NDS_FACT'
        DataType = ftFMTBcd
        Precision = 15
        Size = 8
      end
      item
        Name = 'ID_IZG'
        DataType = ftInteger
      end
      item
        Name = 'ID_ZAK'
        DataType = ftInteger
      end
      item
        Name = 'ID_MANAGER'
        DataType = ftInteger
      end
      item
        Name = 'ID_NAKL'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NDS'
        Attributes = [faRequired]
        DataType = ftFMTBcd
        Precision = 15
        Size = 8
      end
      item
        Name = 'COMMENT'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <
      item
        Name = 'cdsNaklrIndex1'
        Fields = 'IZG2'
        Options = [ixCaseInsensitive]
      end>
    Params = <>
    ProviderName = 'dspNaklr'
    StoreDefs = True
    BeforeScroll = cdsNaklrBeforeScroll
    OnCalcFields = cdsNaklrCalcFields
    Left = 104
    Top = 240
    object cdsNaklrID: TStringField
      DisplayLabel = #8470#1085#1072#1082#1083
      DisplayWidth = 5
      FieldName = 'ID'
    end
    object cdsNaklrDAT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 7
      FieldName = 'DAT'
      DisplayFormat = 'dd.mm.yy'
    end
    object cdsNaklrDAT_FACT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090'.'#1086#1090#1075#1088
      DisplayWidth = 7
      FieldName = 'DAT_FACT'
      DisplayFormat = 'dd.mm.yy'
    end
    object cdsNaklrID_IZG: TIntegerField
      FieldName = 'ID_IZG'
      Visible = False
    end
    object cdsNaklrID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
      Visible = False
    end
    object cdsNaklrID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
      Visible = False
    end
    object cdsNaklrID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsNaklrIZG: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'IZG'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_IZG'
      Size = 50
      Lookup = True
    end
    object cdsNaklrZAK: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'ZAK'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_ZAK'
      Size = 50
      Lookup = True
    end
    object cdsNaklrMANAGER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'MANAGER'
      LookupDataSet = dmdEx.cdsManager
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_MANAGER'
      Size = 50
      Lookup = True
    end
    object cdsNaklrNDS2: TFMTBCDField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1076#1086#1082
      DisplayWidth = 10
      FieldName = 'NDS'
      DisplayFormat = '0.00'
    end
    object cdsNaklrNDS_FACT2: TFMTBCDField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1092#1072#1082#1090
      FieldName = 'NDS_FACT'
      DisplayFormat = '0.00'
    end
    object cdsNaklrIZG2: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'IZG2'
      Visible = False
    end
    object cdsNaklrOTKAT: TFloatField
      DisplayLabel = #1041#1086#1085#1091#1089
      FieldKind = fkInternalCalc
      FieldName = 'OTKAT'
      DisplayFormat = '0.00'
    end
    object cdsNaklrCOMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      DisplayWidth = 20
      FieldName = 'COMMENT'
      Size = 50
    end
  end
  object UnfFilter1: TUnfFilter
    DBGridEh = dbgNaklr
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
    Left = 136
    Top = 48
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'frmRealPrice'
    StorageManager = RegPropStorageManEh1
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      'dbgNaklr.<P>.Columns.<ForAllItems>.Width')
    Left = 392
    Top = 48
  end
  object RegPropStorageManEh1: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 424
    Top = 48
  end
  object PopupMenu1: TPopupMenu
    Left = 296
    Top = 88
    object N4: TMenuItem
      Action = actRealMake
      Default = True
      ShortCut = 13
    end
  end
end
