object frmNakloSelect: TfrmNakloSelect
  Left = 135
  Top = 129
  Width = 615
  Height = 380
  Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103' '#1087#1086#1079#1080#1094#1080#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    607
    353)
  PixelsPerInch = 96
  TextHeight = 13
  object btnOk: TBitBtn
    Left = 184
    Top = 320
    Width = 169
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 0
    OnClick = btnOkClick
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
  object dbgNaklo: TDBGridEh
    Left = 8
    Top = 8
    Width = 513
    Height = 297
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsNaklo
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'DAT'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1044#1072#1090#1072
        Title.TitleButton = True
        Width = 45
      end
      item
        EditButtons = <>
        FieldName = 'IZG'
        Footers = <>
        ReadOnly = True
        Width = 62
      end
      item
        EditButtons = <>
        FieldName = 'ZAK'
        Footers = <>
        ReadOnly = True
        Width = 89
      end
      item
        EditButtons = <>
        FieldName = 'MANAGER'
        Footers = <>
        ReadOnly = True
        Width = 56
      end
      item
        EditButtons = <>
        FieldName = 'KURS'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1050#1091#1088#1089
        Title.TitleButton = True
        Width = 55
      end
      item
        Checkboxes = True
        EditButtons = <>
        FieldName = 'POSTED'
        Footers = <>
        KeyList.Strings = (
          '1'
          '0')
        ReadOnly = True
        Width = 32
      end
      item
        EditButtons = <>
        FieldName = 'NDS'
        Footers = <>
        ReadOnly = True
        Width = 49
      end
      item
        EditButtons = <>
        FieldName = 'COMMENT'
        Footers = <>
        ReadOnly = True
        Width = 95
      end>
  end
  object Button1: TButton
    Left = 528
    Top = 40
    Width = 75
    Height = 25
    Action = actInsert
    Anchors = [akTop, akRight]
    TabOrder = 2
  end
  object btnSettings: TBitBtn
    Left = 528
    Top = 8
    Width = 75
    Height = 25
    Action = actSettings
    Anchors = [akTop, akRight]
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
    TabOrder = 3
  end
  object sdsNaklo: TSQLDataSet
    CommandText = 
      'select'#13#10'  n.id,'#13#10'  n.id_nakl,'#13#10'  n.nalog_nds,'#13#10'  n.id_sklad,'#13#10'  ' +
      'n.dat,'#13#10'  n.posted,'#13#10'  n.id_currency,'#13#10'  n.comment, '#13#10'  n.id_izg' +
      ','#13#10'  n.id_zak,'#13#10'  n.id_manager,'#13#10'  n.kurs,'#13#10'  n.nds,'#13#10'  n.tip,'#13#10 +
      '  n.delmarked  '#13#10'from '#13#10'  naklo n'#13#10'where'#13#10'  n.delmarked=0 and n.' +
      'tip=5 and'#13#10'  n.posted=0'#13#10'order by'#13#10'  n.dat,n.id_manager,n.id_izg' +
      #13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 80
    Top = 56
    object sdsNakloID_NAKL: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_NAKL'
    end
    object sdsNakloNALOG_NDS: TFMTBCDField
      FieldName = 'NALOG_NDS'
      Precision = 15
      Size = 2
    end
    object sdsNakloID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
    end
    object sdsNakloDAT: TSQLTimeStampField
      FieldName = 'DAT'
    end
    object sdsNakloPOSTED: TSmallintField
      FieldName = 'POSTED'
    end
    object sdsNakloID_CURRENCY: TSmallintField
      FieldName = 'ID_CURRENCY'
    end
    object sdsNakloCOMMENT: TStringField
      FieldName = 'COMMENT'
      Size = 58
    end
    object sdsNakloID_IZG: TIntegerField
      FieldName = 'ID_IZG'
    end
    object sdsNakloID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
    end
    object sdsNakloID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
    end
    object sdsNakloKURS: TFloatField
      FieldName = 'KURS'
    end
    object sdsNakloNDS: TFMTBCDField
      FieldName = 'NDS'
      Precision = 15
      Size = 2
    end
    object sdsNakloTIP: TSmallintField
      FieldName = 'TIP'
      Required = True
    end
    object sdsNakloDELMARKED: TSmallintField
      FieldName = 'DELMARKED'
      Required = True
    end
    object sdsNakloID: TStringField
      FieldName = 'ID'
      Size = 10
    end
  end
  object dsNakloSrc: TDataSource
    DataSet = sdsNaklo
    Left = 80
    Top = 88
  end
  object dspNaklo: TDataSetProvider
    DataSet = sdsNaklo
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 80
    Top = 120
  end
  object cdsNaklo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNaklo'
    AfterInsert = cdsNakloAfterInsert
    Left = 80
    Top = 152
    object cdsNakloID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsNakloID_IZG: TIntegerField
      FieldName = 'ID_IZG'
      Required = True
    end
    object cdsNakloID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
      Required = True
    end
    object cdsNakloID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
      Required = True
    end
    object cdsNakloID_CURRENCY: TSmallintField
      FieldName = 'ID_CURRENCY'
      Required = True
    end
    object cdsNakloNALOG_NDS: TFMTBCDField
      FieldName = 'NALOG_NDS'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdsNakloNDS: TFMTBCDField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'NDS'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object cdsNakloID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
      Required = True
    end
    object cdsNakloPOSTED: TSmallintField
      DisplayLabel = #1055#1088#1086#1074#1077#1076#1077#1085#1086
      FieldName = 'POSTED'
      ProviderFlags = [pfInWhere]
      Required = True
    end
    object cdsNakloCOMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'COMMENT'
      Size = 50
    end
    object cdsNakloIZG: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      FieldKind = fkLookup
      FieldName = 'IZG'
      LookupDataSet = dmdEx.cdsVlad
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_IZG'
      Lookup = True
    end
    object cdsNakloZAK: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      FieldKind = fkLookup
      FieldName = 'ZAK'
      LookupDataSet = dmdEx.cdsClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_ZAK'
      Lookup = True
    end
    object cdsNakloMANAGER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      FieldKind = fkLookup
      FieldName = 'MANAGER'
      LookupDataSet = dmdEx.cdsManager
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_MANAGER'
      Lookup = True
    end
    object cdsNakloDAT: TSQLTimeStampField
      FieldName = 'DAT'
      Required = True
    end
    object cdsNakloKURS: TFloatField
      FieldName = 'KURS'
      DisplayFormat = '0.0000'
    end
    object cdsNakloTIP: TSmallintField
      FieldName = 'TIP'
      Required = True
    end
    object cdsNakloTIPCONST: TStringField
      DisplayLabel = #1058#1080#1087
      FieldKind = fkLookup
      FieldName = 'TIPCONST'
      LookupDataSet = dmdEx.cdsNakloTip
      LookupKeyFields = 'ID_FIELD'
      LookupResultField = 'FIELD_VALUE'
      KeyFields = 'TIP'
      Lookup = True
    end
    object cdsNakloDELMARKED: TSmallintField
      FieldName = 'DELMARKED'
      Required = True
    end
    object cdsNakloID: TStringField
      FieldName = 'ID'
      Size = 10
    end
  end
  object dsNaklo: TDataSource
    DataSet = cdsNaklo
    Left = 80
    Top = 184
  end
  object qeNaklr: TQueryExtender
    Query = sdsNaklo
    DefSql = 
      'select'#13#10'  n.id,'#13#10'  n.id_nakl,'#13#10'  n.nalog_nds,'#13#10'  n.id_sklad,'#13#10'  ' +
      'n.dat,'#13#10'  n.posted,'#13#10'  n.id_currency,'#13#10'  n.comment, '#13#10'  n.id_izg' +
      ','#13#10'  n.id_zak,'#13#10'  n.id_manager,'#13#10'  n.kurs,'#13#10'  n.nds,'#13#10'  n.tip,'#13#10 +
      '  n.delmarked  '#13#10'from '#13#10'  naklo n'#13#10'where'#13#10'  n.delmarked=0 and n.' +
      'tip=5 and'#13#10'  n.posted=0'#13#10'order by'#13#10'  n.dat,n.id_manager,n.id_izg' +
      #13#10
    Left = 112
    Top = 88
  end
  object ActionList2: TActionList
    Left = 112
    Top = 56
    object actGrid1ListShow: TAction
      Caption = 'actGrid1ListShow'
    end
    object actInsert: TAction
      Caption = #1053#1086#1074#1072#1103
      OnExecute = actInsertExecute
    end
    object actSettings: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      OnExecute = actSettingsExecute
    end
    object actRefresh: TAction
      Caption = 'actRefresh'
      OnExecute = actRefreshExecute
    end
  end
end
