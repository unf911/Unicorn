object frmNaklrList: TfrmNaklrList
  Left = 106
  Top = 206
  Width = 537
  Height = 355
  BorderIcons = [biSystemMenu]
  Caption = #1042#1099#1073#1086#1088' '#1088#1072#1089#1093#1086#1076#1085#1086#1081' '#1085#1072#1082#1083#1072#1076#1085#1086#1081' '#1076#1083#1103' '#1086#1073#1088#1072#1073#1086#1090#1082#1080
  Color = clBtnFace
  Constraints.MinHeight = 355
  Constraints.MinWidth = 537
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  DesignSize = (
    529
    307)
  PixelsPerInch = 96
  TextHeight = 13
  object Button2: TButton
    Left = 0
    Top = 0
    Width = 89
    Height = 17
    Action = actSettings
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TabStop = False
  end
  object BitBtn1: TBitBtn
    Left = 72
    Top = 276
    Width = 145
    Height = 25
    Action = actOk
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    TabOrder = 2
    TabStop = False
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 312
    Top = 276
    Width = 145
    Height = 25
    Action = actCancel
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    Default = True
    TabOrder = 3
    TabStop = False
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object edtIzg: TEdit
    Left = 192
    Top = 0
    Width = 177
    Height = 21
    TabOrder = 0
    OnKeyUp = edtIzgKeyUp
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 24
    Width = 525
    Height = 245
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsSchet
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object dsSchet: TDataSource
    DataSet = cdsNaklr
    Left = 192
    Top = 216
  end
  object ActionList1: TActionList
    Left = 192
    Top = 56
    object actSettings: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      ShortCut = 16465
      OnExecute = actSettingsExecute
    end
    object actOk: TAction
      Caption = 'OK'
      OnExecute = actOkExecute
    end
    object actCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      OnExecute = actCancelExecute
    end
    object actRefresh: TAction
      Caption = 'actRefresh'
      OnExecute = actRefreshExecute
    end
  end
  object sdsNaklr: TSQLDataSet
    CommandText = 
      'select  '#13#10'    f.dat,'#13#10'    f.id_izg,'#13#10'    f.id_zak,'#13#10'    f.id_man' +
      'ager,'#13#10'    f.id_nakl as nakl,'#13#10'    f.nds,'#13#10'    f.id '#13#10'  from '#13#10' ' +
      '    NAKLR_VW f'#13#10'  where f.delmarked=0'#13#10'  order by f.dat desc,f.i' +
      'd_nakl desc'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 192
    Top = 120
  end
  object dspNaklr: TDataSetProvider
    DataSet = sdsNaklr
    Options = [poAllowCommandText]
    Left = 192
    Top = 152
  end
  object cdsNaklr: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    Filter = 'zak2 like '#39#1040'*'#39
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ProviderName = 'dspNaklr'
    ReadOnly = True
    Left = 192
    Top = 184
    object cdsNaklrID: TStringField
      DisplayLabel = #8470#1085#1072#1082#1083
      DisplayWidth = 6
      FieldName = 'ID'
    end
    object cdsNaklrDAT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 8
      FieldName = 'DAT'
      DisplayFormat = 'dd.mm.yy'
    end
    object cdsNaklrIZG: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      DisplayWidth = 15
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
      DisplayLabel = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100
      DisplayWidth = 25
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
      DisplayWidth = 9
      FieldKind = fkLookup
      FieldName = 'MANAGER'
      LookupDataSet = dmdEx.cdsManager
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_MANAGER'
      Size = 50
      Lookup = True
    end
    object cdsNaklrNDS: TFMTBCDField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 10
      FieldName = 'NDS'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
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
    object cdsNaklrNAKL: TIntegerField
      FieldName = 'NAKL'
      Visible = False
    end
  end
  object qeNaklr: TQueryExtender
    Query = cdsNaklr
    KeyField = 'nakl'
    Left = 192
    Top = 88
  end
  object PropStorageEh1: TPropStorageEh
    Active = False
    Section = 'TfrmNaklrList'
    StorageManager = RegPropStorageManEh1
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width')
    Left = 360
    Top = 80
  end
  object RegPropStorageManEh1: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 392
    Top = 80
  end
  object sdsNaklo: TSQLDataSet
    CommandText = 
      'select  '#13#10'    f.dat,'#13#10'    f.id_izg,'#13#10'    f.id_zak,'#13#10'    f.id_man' +
      'ager,'#13#10'    f.id_nakl as nakl,'#13#10'    f.nds,'#13#10'    f.id '#13#10'  from '#13#10' ' +
      '    NAKLO f'#13#10'  where f.delmarked=0 and f.tip=5'#13#10'  order by f.dat' +
      ' desc,f.id_nakl desc'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 224
    Top = 120
  end
  object sdsSchet: TSQLDataSet
    CommandText = 
      'select'#13#10'  s.schet as nakl,'#13#10'  s.dat,'#13#10'  s.id_izg,'#13#10'  s.id_manage' +
      'r,'#13#10'  s.id_zak,'#13#10'  s.nds,'#13#10'  s.id'#13#10'from'#13#10'  schet s'#13#10'order by'#13#10'  ' +
      's.dat desc,s.schet desc'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 256
    Top = 120
  end
  object cdsClient: TClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    Left = 224
    Top = 184
  end
  object MainMenu1: TMainMenu
    Left = 424
    Top = 80
    object mnuActions: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      GroupIndex = 10
      object N5: TMenuItem
        Action = actSettings
      end
    end
  end
  object sdsSpec: TSQLDataSet
    CommandText = 
      'select  '#13#10'    f.dat,'#13#10'    f.id_izg,'#13#10'    f.id_zak,'#13#10'    f.id_man' +
      'ager,'#13#10'    f.id_nakl as nakl,'#13#10'    f.nds,'#13#10'    f.id '#13#10'  from '#13#10' ' +
      '    spec_vw f'#13#10'  where f.delmarked=0'#13#10'  order by f.dat desc,f.id' +
      '_nakl desc'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 288
    Top = 120
  end
  object sdsNaklpBux: TSQLDataSet
    CommandText = 
      'select  '#13#10'    f.dat,'#13#10'    f.id_izg,'#13#10'    f.id_zak,'#13#10'    f.id_man' +
      'ager,'#13#10'    f.id_nakl as nakl,'#13#10'    f.nds,'#13#10'    f.id '#13#10'  from '#13#10' ' +
      '    naklp_vw f'#13#10'  where f.delmarked=0'#13#10'  order by f.dat desc,f.i' +
      'd_nakl desc'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 320
    Top = 120
  end
  object sdsSravnPrice: TSQLDataSet
    CommandText = 
      'select'#13#10'    ID_NAKL as nakl,'#13#10'    ID,'#13#10'    ID_MANAGER,'#13#10'    DAT,' +
      #13#10'    id_sklad,'#13#10'    COMMENT'#13#10'from '#13#10'  sravn_price_vw n'#13#10'where '#13 +
      #10'  n.delmarked=0'#13#10'order by'#13#10'  n.dat desc, n.id_nakl desc'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 352
    Top = 120
    object sdsNakloID: TStringField
      FieldName = 'ID'
    end
    object sdsNakloID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
    end
    object sdsNakloDAT: TSQLTimeStampField
      FieldName = 'DAT'
      Required = True
    end
    object sdsNakloCOMMENT: TStringField
      FieldName = 'COMMENT'
      Size = 50
    end
    object sdsNakloID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
      Required = True
    end
    object sdsSravnPriceNAKL: TIntegerField
      FieldName = 'NAKL'
      Required = True
    end
  end
  object dspSravnPrice: TDataSetProvider
    DataSet = sdsSravnPrice
    Options = [poAllowCommandText]
    Left = 352
    Top = 152
  end
  object cdsSravnPrice: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ID_MANAGER'
        DataType = ftInteger
      end
      item
        Name = 'DAT'
        Attributes = [faRequired]
        DataType = ftTimeStamp
      end
      item
        Name = 'COMMENT'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ID_SKLAD'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NAKL'
        Attributes = [faRequired]
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspSravnPrice'
    StoreDefs = True
    Left = 352
    Top = 184
    object cdsSravnPriceID: TStringField
      DisplayLabel = #8470#1087'.'#1087'.'
      DisplayWidth = 6
      FieldName = 'ID'
      Size = 10
    end
    object cdsSravnPriceDAT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 8
      FieldName = 'DAT'
      Required = True
      DisplayFormat = 'dd.mm.yy'
    end
    object cdsSravnPriceMANAGER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'MANAGER'
      LookupDataSet = dmdEx.cdsManager
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_MANAGER'
      Size = 30
      Lookup = True
    end
    object cdsSravnPriceCOMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      DisplayWidth = 50
      FieldName = 'COMMENT'
      Size = 50
    end
    object cdsSravnPriceID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
      Required = True
      Visible = False
    end
    object cdsSravnPriceCURRENCY: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      DisplayWidth = 5
      FieldKind = fkLookup
      FieldName = 'CURRENCY'
      LookupDataSet = dmdEx.cdsCurrency
      LookupKeyFields = 'OID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_SKLAD'
      Lookup = True
    end
    object cdsSravnPriceID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
      Required = True
      Visible = False
    end
    object cdsSravnPriceNAKL: TIntegerField
      FieldName = 'NAKL'
      Required = True
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
    Left = 224
    Top = 88
  end
  object sdsVozvrat: TSQLDataSet
    CommandText = 
      'select  '#13#10'    f.dat,'#13#10'    f.id_izg,'#13#10'    f.id_zak,'#13#10'    f.id_man' +
      'ager,'#13#10'    f.id_nakl as nakl,'#13#10'    f.nds,'#13#10'    f.id '#13#10'  from '#13#10' ' +
      '    vozvrat_vw f'#13#10'  where f.delmarked=0'#13#10'  order by f.dat desc,f' +
      '.id_nakl desc'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 384
    Top = 120
  end
  object sdsNaklru: TSQLDataSet
    CommandText = 
      'select  '#13#10'    f.dat,'#13#10'    f.id_izg,'#13#10'    f.id_zak,'#13#10'    f.id_man' +
      'ager,'#13#10'    f.id_nakl as nakl,'#13#10'    f.nds,'#13#10'    f.id '#13#10'  from '#13#10' ' +
      '    NAKLRU_VW f'#13#10'  where f.delmarked=0 and'#13#10'     f.id_xoz_oper=(' +
      'select oid from get_oid_objects_pc('#39#1056#1040#1057#1061#1054#1044#1053#1040#1071' '#1053#1040' '#1059#1057#1051#1059#1043#1048' '#1057' '#1050#1054#1052#1048#1057#1057 +
      #1048#1045#1049#39','#13#10'(select oid from get_oid_objects_pc('#39#1061#1054#1047#1071#1049#1057#1058#1042#1045#1053#1053#1067#1045' '#1054#1055#1045#1056#1040#1062 +
      #1048#1048#39',-100))))'#13#10'  order by f.dat desc,f.id_nakl desc'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 416
    Top = 120
  end
  object sdsNaklpu: TSQLDataSet
    CommandText = 
      'select  '#13#10'    f.dat,'#13#10'    f.id_izg,'#13#10'    f.id_zak,'#13#10'    f.id_man' +
      'ager,'#13#10'    f.id_nakl as nakl,'#13#10'    f.nds,'#13#10'    f.id '#13#10'  from '#13#10' ' +
      '    NAKLPU_VW f'#13#10'  where f.delmarked=0 and'#13#10'     f.id_xoz_oper=(' +
      'select oid from get_oid_objects_pc('#39#1055#1056#1048#1061#1054#1044#1053#1040#1071' '#1053#1040' '#1059#1057#1051#1059#1043#1048' '#1057' '#1050#1054#1052#1048#1057#1057 +
      #1048#1045#1049#39','#13#10'(select oid from get_oid_objects_pc('#39#1061#1054#1047#1071#1049#1057#1058#1042#1045#1053#1053#1067#1045' '#1054#1055#1045#1056#1040#1062 +
      #1048#1048#39',-100))))'#13#10'  order by f.dat desc,f.id_nakl desc'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 448
    Top = 120
  end
  object sdsNaklrAndVozvratPost: TSQLDataSet
    CommandText = 
      'select  '#13#10'    f.dat,'#13#10'    f.id_izg,'#13#10'    f.id_zak,'#13#10'    f.id_man' +
      'ager,'#13#10'    f.id_nakl as nakl,'#13#10'    f.nds,'#13#10'    f.id '#13#10'  from '#13#10' ' +
      '    naklo f'#13#10'  where f.delmarked=0 and f.tip in ('#13#10#13#10'  (select o' +
      'id'#13#10'    from GET_OID_OBJECTS_PC('#39#1056#1040#1057#1061#1054#1044#1053#1067#1045' '#1053#1040#1050#1051#1040#1044#1053#1067#1045#39',-100)),'#13#10' ' +
      ' (select oid'#13#10'    from GET_OID_OBJECTS_PC('#39#1042#1054#1047#1042#1056#1040#1058' '#1055#1054#1057#1058#1040#1042#1065#1048#1050#1059#39',-' +
      '100))'#13#10'  )'#13#10' '#13#10'  order by f.dat desc,f.id_nakl desc'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 480
    Top = 120
  end
end
