object frmRepNnaklXml: TfrmRepNnaklXml
  Left = 328
  Top = 402
  BorderStyle = bsDialog
  Caption = #1057#1086#1079#1076#1072#1085#1080#1077' XML '#1080#1079' '#1085#1072#1083#1086#1075#1086#1074#1086#1081
  ClientHeight = 344
  ClientWidth = 567
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
  object dbgNaklr: TDBGridEh
    Left = 0
    Top = 0
    Width = 567
    Height = 344
    Align = alClient
    DataSource = dsNNakl
    EditActions = [geaCopyEh, geaSelectAllEh]
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgMultiSelect]
    PopupMenu = PopupMenu1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ID'
        Footers = <>
        ReadOnly = True
        Width = 33
      end
      item
        ButtonStyle = cbsNone
        EditButtons = <>
        FieldName = 'DAT'
        Footers = <>
        ReadOnly = True
        Width = 45
      end
      item
        EditButtons = <>
        FieldName = 'IZG'
        Footers = <>
        ReadOnly = True
        Width = 98
      end
      item
        EditButtons = <>
        FieldName = 'ZAK'
        Footers = <>
        ReadOnly = True
        Width = 111
      end
      item
        EditButtons = <>
        FieldName = 'MANAGER'
        Footers = <>
        ReadOnly = True
        Width = 58
      end
      item
        EditButtons = <>
        FieldName = 'NDS'
        Footers = <>
        ReadOnly = True
        Width = 69
      end
      item
        Checkboxes = True
        EditButtons = <>
        FieldName = 'OTOSLANO_V_GNU'
        Footers = <>
        KeyList.Strings = (
          '1'
          '0')
      end
      item
        Checkboxes = True
        EditButtons = <>
        FieldName = 'POLUCHEN_OTVET_IZ_GNU'
        Footers = <>
        KeyList.Strings = (
          '1'
          '0')
      end>
  end
  object dsNNaklrt: TDataSource
    Tag = 1
    DataSet = cdsNaklrt
    Left = 40
    Top = 160
  end
  object ActionList1: TActionList
    Left = 72
    Top = 128
    object actSettings: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      OnExecute = actSettingsExecute
    end
    object actGenerateXml: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100' Xml'
      OnExecute = actGenerateXmlExecute
    end
  end
  object frdRasx: TfrxDBDataset
    UserName = 'frdRasx'
    CloseDataSource = False
    DataSet = cdsNaklrt
    Left = 72
    Top = 64
  end
  object sdsNaklrt: TSQLDataSet
    CommandText = 
      'select '#13#10'  ot.*,'#13#10'  om.dat'#13#10'from '#13#10'  naklrast ot inner join nakl' +
      'ras om on ot.schet=om.schet'#13#10'where '#13#10'  ot.schet=:schet'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'schet'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = dmdEx.scUchet
    Left = 40
    Top = 64
  end
  object dspNaklrt: TDataSetProvider
    Tag = 1
    DataSet = sdsNaklrt
    Options = [poAllowCommandText]
    Left = 40
    Top = 96
  end
  object cdsNaklrt: TClientDataSet
    Tag = 1
    Aggregates = <>
    IndexFieldNames = 'SCHET'
    MasterFields = 'SCHET'
    MasterSource = dsNNakl
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'schet'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspNaklrt'
    OnCalcFields = cdsNaklrtCalcFields
    Left = 40
    Top = 128
    object cdsNaklrtKODVED: TFMTBCDField
      FieldKind = fkLookup
      FieldName = 'KODVED'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'KODVED'
      KeyFields = 'ID_TOVAR'
      DisplayFormat = '0000000000'
      Size = 10
      Lookup = True
    end
    object cdsNaklrtFULLNAME: TStringField
      FieldKind = fkLookup
      FieldName = 'FULLNAME'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'FULLNAME'
      KeyFields = 'ID_TOVAR'
      Size = 250
      Lookup = True
    end
    object cdsNaklrtKOLOTP: TFloatField
      FieldName = 'KOLOTP'
    end
    object cdsNaklrtNPP: TIntegerField
      FieldName = 'NPP'
    end
    object cdsNaklrtSCHET: TIntegerField
      FieldName = 'SCHET'
    end
    object cdsNaklrtTARA: TSmallintField
      FieldName = 'TARA'
    end
    object cdsNaklrtSCH: TIntegerField
      FieldName = 'SCH'
      Required = True
    end
    object cdsNaklrtKODCN: TIntegerField
      FieldName = 'KODCN'
    end
    object cdsNaklrtCENA: TFMTBCDField
      FieldName = 'CENA'
      Precision = 15
      Size = 2
    end
    object cdsNaklrtNDS: TFMTBCDField
      FieldName = 'NDS'
      Precision = 15
      Size = 2
    end
    object cdsNaklrtVSEGO: TFMTBCDField
      FieldName = 'VSEGO'
      Precision = 15
      Size = 2
    end
    object cdsNaklrtSUMA2: TFMTBCDField
      FieldName = 'SUMA2'
      Precision = 15
      Size = 2
    end
    object cdsNaklrtSKIDKA: TFMTBCDField
      FieldName = 'SKIDKA'
      Precision = 15
      Size = 2
    end
    object cdsNaklrtID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
    end
    object cdsNaklrtDAT: TSQLTimeStampField
      FieldName = 'DAT'
    end
    object cdsNaklrtSUMA2GRN: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'SUMA2GRN'
      Calculated = True
    end
    object cdsNaklrtEDIZ: TStringField
      DisplayLabel = #1045#1076'.'#1080#1079#1084'.'
      FieldKind = fkLookup
      FieldName = 'EDIZ'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'EDIZ'
      KeyFields = 'ID_TOVAR'
      ReadOnly = True
      Lookup = True
    end
    object cdsNaklrtEDIZ_KOD: TIntegerField
      FieldKind = fkLookup
      FieldName = 'EDIZ_KOD'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'EDIZ_KOD'
      KeyFields = 'ID_TOVAR'
      Lookup = True
    end
  end
  object qeNNakl: TQueryExtender
    Query = cdsNNakl
    Left = 224
    Top = 200
  end
  object MainMenu1: TMainMenu
    Left = 108
    Top = 128
    object MenuItem1: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      GroupIndex = 10
      object MenuItem3: TMenuItem
        Action = actSettings
      end
      object Xml1: TMenuItem
        Action = actGenerateXml
      end
    end
  end
  object sdsNNakl: TSQLDataSet
    CommandText = 
      'SELECT'#13#10'  om.schet,'#13#10'  om.id2 as id,'#13#10'  om.id_izg,'#13#10'  om.id_zak,' +
      #13#10'  om.id_manager,'#13#10'  om.dat,'#13#10'  om.nds,'#13#10'  om.nakl,'#13#10'  om.kurs,' +
      #13#10'  om.vsego,'#13#10'  om.vidopl,'#13#10'  om.usl,'#13#10'  om.nalog_nds,'#13#10'  om.ti' +
      'p,'#13#10'  om.blocked,'#13#10'  om.signature,'#13#10'  om.id_dogovor,'#13#10'  om.otosl' +
      'ano_v_gnu,'#13#10'  om.poluchen_otvet_iz_gnu,'#13#10'  d.dat as dat_dogovora' +
      ', '#13#10'  d.id as nomer_dogovora, '#13#10'  d.tip_dogovora as tip_dogovora' +
      #13#10#13#10'FROM'#13#10'  NAKLRAS om left join DOGOVOR_VW d '#13#10'  on om.id_dogov' +
      'or=d.id_dogovor'#13#10'ORDER BY '#13#10'  om.dat,om.id2'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 220
    Top = 68
    object sdsNNaklSCHET: TIntegerField
      FieldName = 'SCHET'
      ProviderFlags = [pfInWhere, pfInKey]
      Required = True
    end
    object sdsNNaklID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
      Required = True
    end
    object sdsNNaklID_IZG: TIntegerField
      FieldName = 'ID_IZG'
      ProviderFlags = []
    end
    object sdsNNaklID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
      ProviderFlags = []
    end
    object sdsNNaklID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
      ProviderFlags = []
    end
    object sdsNNaklDAT: TSQLTimeStampField
      FieldName = 'DAT'
      ProviderFlags = []
    end
    object sdsNNaklNDS: TFMTBCDField
      FieldName = 'NDS'
      ProviderFlags = []
      Precision = 15
      Size = 2
    end
    object sdsNNaklNAKL: TIntegerField
      FieldName = 'NAKL'
      ProviderFlags = []
    end
    object sdsNNaklKURS: TFMTBCDField
      FieldName = 'KURS'
      ProviderFlags = []
      Precision = 15
    end
    object sdsNNaklVSEGO: TFMTBCDField
      FieldName = 'VSEGO'
      ProviderFlags = []
      Precision = 15
      Size = 2
    end
    object sdsNNaklVIDOPL: TStringField
      FieldName = 'VIDOPL'
      ProviderFlags = []
      Size = 50
    end
    object sdsNNaklUSL: TStringField
      FieldName = 'USL'
      ProviderFlags = []
      Size = 45
    end
    object sdsNNaklNALOG_NDS: TFMTBCDField
      FieldName = 'NALOG_NDS'
      ProviderFlags = []
      Precision = 15
      Size = 2
    end
    object sdsNNaklTIP: TSmallintField
      FieldName = 'TIP'
      ProviderFlags = []
    end
    object sdsNNaklBLOCKED: TSmallintField
      FieldName = 'BLOCKED'
      ProviderFlags = []
    end
    object sdsNNaklSIGNATURE: TStringField
      FieldName = 'SIGNATURE'
      ProviderFlags = []
      Size = 50
    end
    object sdsNNaklID_DOGOVOR: TIntegerField
      FieldName = 'ID_DOGOVOR'
      ProviderFlags = []
    end
    object sdsNNaklOTOSLANO_V_GNU: TSmallintField
      FieldName = 'OTOSLANO_V_GNU'
      Required = True
    end
    object sdsNNaklPOLUCHEN_OTVET_IZ_GNU: TSmallintField
      FieldName = 'POLUCHEN_OTVET_IZ_GNU'
      Required = True
    end
    object sdsNNaklDAT_DOGOVORA: TSQLTimeStampField
      FieldName = 'DAT_DOGOVORA'
      ProviderFlags = []
    end
    object sdsNNaklNOMER_DOGOVORA: TStringField
      FieldName = 'NOMER_DOGOVORA'
      ProviderFlags = []
      Size = 30
    end
    object sdsNNaklTIP_DOGOVORA: TStringField
      FieldName = 'TIP_DOGOVORA'
      ProviderFlags = []
      Size = 250
    end
  end
  object dspNNakl: TDataSetProvider
    Tag = 1
    DataSet = sdsNNakl
    Options = [poAllowCommandText]
    OnGetTableName = dspNNaklGetTableName
    Left = 220
    Top = 100
  end
  object cdsNNakl: TClientDataSet
    Tag = 1
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNNakl'
    BeforeScroll = cdsNNaklBeforeScroll
    Left = 220
    Top = 132
    object cdsNNaklTIP_CODE: TStringField
      FieldKind = fkLookup
      FieldName = 'TIP_CODE'
      LookupDataSet = cdsTipNNakl
      LookupKeyFields = 'OID'
      LookupResultField = 'TIP_CODE'
      KeyFields = 'TIP'
      ProviderFlags = []
      Lookup = True
    end
    object cdsNNaklSCHET: TIntegerField
      FieldName = 'SCHET'
      ProviderFlags = [pfInWhere, pfInKey]
      Required = True
    end
    object cdsNNaklID: TIntegerField
      DisplayLabel = #8470
      DisplayWidth = 5
      FieldName = 'ID'
      ProviderFlags = []
      Required = True
    end
    object cdsNNaklMANAGER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      DisplayWidth = 15
      FieldKind = fkLookup
      FieldName = 'MANAGER'
      LookupDataSet = dmdEx.cdsManager
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_MANAGER'
      ProviderFlags = []
      Size = 30
      Lookup = True
    end
    object cdsNNaklZAK: TStringField
      DisplayLabel = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'ZAK'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_ZAK'
      ProviderFlags = []
      Size = 50
      Lookup = True
    end
    object cdsNNaklIZG: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'IZG'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_IZG'
      ProviderFlags = []
      Size = 50
      Lookup = True
    end
    object cdsNNaklID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
      ProviderFlags = []
    end
    object cdsNNaklID_IZG: TIntegerField
      FieldName = 'ID_IZG'
      ProviderFlags = []
    end
    object cdsNNaklID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
      ProviderFlags = []
    end
    object cdsNNaklDAT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 10
      FieldName = 'DAT'
      ProviderFlags = []
      DisplayFormat = 'dd.mm.yy'
    end
    object cdsNNaklNDS: TFMTBCDField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'NDS'
      ProviderFlags = []
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object cdsNNaklNAKL: TIntegerField
      FieldName = 'NAKL'
      ProviderFlags = []
    end
    object cdsNNaklKURS: TFMTBCDField
      FieldName = 'KURS'
      ProviderFlags = []
      Precision = 15
    end
    object cdsNNaklVSEGO: TFMTBCDField
      FieldName = 'VSEGO'
      ProviderFlags = []
      Precision = 15
      Size = 2
    end
    object cdsNNaklVIDOPL: TStringField
      FieldName = 'VIDOPL'
      ProviderFlags = []
      Size = 50
    end
    object cdsNNaklUSL: TStringField
      FieldName = 'USL'
      ProviderFlags = []
      Size = 45
    end
    object cdsNNaklNALOG_NDS: TFMTBCDField
      FieldName = 'NALOG_NDS'
      ProviderFlags = []
      Precision = 15
      Size = 2
    end
    object cdsNNaklTIP: TSmallintField
      FieldName = 'TIP'
      ProviderFlags = []
    end
    object cdsNNaklBLOCKED: TSmallintField
      FieldName = 'BLOCKED'
      ProviderFlags = []
    end
    object cdsNNaklSIGNATURE: TStringField
      FieldName = 'SIGNATURE'
      ProviderFlags = []
      Size = 50
    end
    object cdsNNaklID_DOGOVOR: TIntegerField
      FieldName = 'ID_DOGOVOR'
      ProviderFlags = []
    end
    object cdsNNaklDAT_DOGOVORA: TSQLTimeStampField
      FieldName = 'DAT_DOGOVORA'
      ProviderFlags = []
    end
    object cdsNNaklNOMER_DOGOVORA: TStringField
      FieldName = 'NOMER_DOGOVORA'
      ProviderFlags = []
      Size = 30
    end
    object cdsNNaklTIP_DOGOVORA: TStringField
      FieldName = 'TIP_DOGOVORA'
      ProviderFlags = []
      Size = 250
    end
    object cdsNNaklOTOSLANO_V_GNU: TSmallintField
      DisplayLabel = #1054#1090#1086#1089#1083#1072#1085#1086
      DisplayWidth = 3
      FieldName = 'OTOSLANO_V_GNU'
      Required = True
    end
    object cdsNNaklPOLUCHEN_OTVET_IZ_GNU: TSmallintField
      DisplayLabel = #1055#1086#1083#1091#1095#1077#1085#1086
      DisplayWidth = 3
      FieldName = 'POLUCHEN_OTVET_IZ_GNU'
      Required = True
    end
  end
  object dsNNakl: TDataSource
    Tag = 1
    DataSet = cdsNNakl
    Left = 220
    Top = 164
  end
  object XMLDocument1: TXMLDocument
    Left = 324
    Top = 132
    DOMVendorDesc = 'MSXML'
  end
  object frdNNaklp: TfrxDBDataset
    UserName = 'frdNNaklp'
    CloseDataSource = False
    DataSet = cdsNNakl
    Left = 324
    Top = 64
  end
  object SaveDialog: TSaveDialog
    Left = 112
    Top = 64
  end
  object UnfFilter1: TUnfFilter
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
    Left = 144
    Top = 24
  end
  object sdsTipNNakl: TSQLDataSet
    CommandText = 
      'select'#13#10'  o.oid,'#13#10'  o.name,'#13#10'  o.fullname,'#13#10'  trim(case when sub' +
      'str(o.predefined,1,2) ='#39#1055#1053#39#13#10'    then'#13#10'      case when strlen(su' +
      'bstr(o.predefined,4,2))>=2'#13#10'      then substr(o.predefined,4,2)'#13 +
      #10'      else '#39'00'#39' end'#13#10'    else '#39'00'#39' end) as tip_code'#13#10'from '#13#10'  o' +
      'bjects o'#13#10'where o.classid=('#13#10'  select oid from get_oid_objects_p' +
      'c('#39#1058#1048#1055' '#1053#1040#1051#1054#1043#1054#1042#1067#1061' '#1053#1040#1050#1051#1040#1044#1053#1067#1061#39',-100)'#13#10') and o.delmarked=0'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 256
    Top = 72
  end
  object dspTipNNakl: TDataSetProvider
    DataSet = sdsTipNNakl
    Left = 256
    Top = 104
  end
  object cdsTipNNakl: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipNNakl'
    Left = 256
    Top = 136
  end
  object dsTipNNakl: TDataSource
    DataSet = cdsTipNNakl
    Left = 256
    Top = 168
  end
  object PopupMenu1: TPopupMenu
    Left = 176
    Top = 72
    object Xml2: TMenuItem
      Action = actGenerateXml
    end
  end
  object rpsClientEdit: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 360
    Top = 64
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmRepNNaklXml'
    StorageManager = rpsClientEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      'dbgNaklr.<P>.Columns.<ForAllItems>.Width')
    Left = 360
    Top = 160
  end
  object UnfFilter2: TUnfFilter
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
    Left = 112
    Top = 160
  end
end
