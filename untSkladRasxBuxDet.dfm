object frmSkladRasxBuxDet: TfrmSkladRasxBuxDet
  Left = 174
  Top = 244
  BorderStyle = bsDialog
  Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
  ClientHeight = 306
  ClientWidth = 528
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
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    528
    306)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 8
    Top = 8
    Width = 517
    Height = 257
    AllowedOperations = []
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsDet
    Flat = False
    FooterColor = clInfoBk
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghRowHighlight]
    ReadOnly = True
    SumList.Active = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    VertScrollBar.VisibleMode = sbAlwaysShowEh
    OnDblClick = DBGridEh1DblClick
    OnKeyUp = DBGridEh1KeyUp
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ID'
        Footers = <>
        Width = 42
      end
      item
        EditButtons = <>
        FieldName = 'DAT'
        Footers = <>
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'IZG'
        Footer.Value = #1055#1086#1079#1080#1094#1080#1081':'
        Footer.ValueType = fvtStaticText
        Footers = <>
        Width = 78
      end
      item
        EditButtons = <>
        FieldName = 'ZAK'
        Footer.Alignment = taRightJustify
        Footer.ValueType = fvtCount
        Footers = <>
        Width = 129
      end
      item
        EditButtons = <>
        FieldName = 'AUTHER'
        Footer.Value = #1042#1089#1077#1075#1086':'
        Footer.ValueType = fvtStaticText
        Footers = <>
        Width = 84
      end
      item
        EditButtons = <>
        FieldName = 'KOLOTP'
        Footer.DisplayFormat = '0.000'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 89
      end>
  end
  object BitBtn1: TBitBtn
    Left = 200
    Top = 272
    Width = 121
    Height = 25
    Anchors = [akLeft, akRight, akBottom]
    Caption = 'OK'
    Default = True
    TabOrder = 1
    OnClick = BitBtn1Click
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
    Left = 10
    Top = 271
    Width = 97
    Height = 25
    Action = actDetail
    Anchors = [akLeft, akBottom]
    Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
    TabOrder = 2
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8400
      00840000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF840000C6C6C6840000840000FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000C6C6C68400
      00840000840000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FF840000C6C6C6840000840000840000FF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF000000000000000000000000840000C6C6C68400008400008400
      00FF00FFFF00FFFF00FFFF00FFFF00FF000000000000C6C6C6C6C6C6C6C6C6FF
      FFFF848484840000840000840000FF00FFFF00FFFF00FFFF00FFFF00FF000000
      848484C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6FFFFFF848484000000FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FF000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
      C6C6C6C6C6FFFFFF000000FF00FFFF00FFFF00FFFF00FFFF00FF000000C6C6C6
      C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6000000FF00
      FFFF00FFFF00FFFF00FF000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
      C6C6C6C6C6C6C6C6C6C6C6000000FF00FFFF00FFFF00FFFF00FF000000C6C6C6
      FFFFFFFFFF00C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6000000FF00
      FFFF00FFFF00FFFF00FF000000C6C6C6FFFFFFFFFF00C6C6C6C6C6C6C6C6C6C6
      C6C6C6C6C6C6C6C6C6C6C6000000FF00FFFF00FFFF00FFFF00FFFF00FF000000
      FFFFFFFFFFFFFFFF00FFFF00C6C6C6C6C6C6C6C6C6C6C6C6000000FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FF000000848484FFFFFFFFFFFFFFFFFFC6C6C6C6
      C6C6C6C6C6848484000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      000000000000C6C6C6C6C6C6C6C6C6C6C6C6000000000000FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00000000000000000000
      0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
  end
  object qeDet: TQueryExtender
    Query = cdsDet
    Left = 152
    Top = 112
  end
  object dsDet: TDataSource
    DataSet = cdsDet
    Left = 152
    Top = 80
  end
  object sdsDet: TSQLDataSet
    CommandText = 
      'select'#13#10'  n.id,'#13#10'  n.dat,'#13#10'  n.id_nakl,'#13#10'  n.id_izg,'#13#10'  n.id_zak' +
      ','#13#10'  n.id_manager,'#13#10'  t.kolotp,'#13#10'  n.tip,'#13#10'  (select name from o' +
      'bjects o where o.oid=n.tip) as tip_name'#13#10'from'#13#10'  naklo n '#13#10'  joi' +
      'n naklot t on n.id_nakl=t.id_nakl'#13#10'where'#13#10'  n.posted=1 '#13#10'order b' +
      'y'#13#10'  n.dat'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 192
    Top = 48
  end
  object dspDet: TDataSetProvider
    DataSet = sdsDet
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 192
    Top = 80
  end
  object cdsDet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDet'
    Left = 192
    Top = 112
    object cdsDetDAT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DAT'
    end
    object cdsDetIZG: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      FieldKind = fkLookup
      FieldName = 'IZG'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_IZG'
      Size = 54
      Lookup = True
    end
    object cdsDetZAK: TStringField
      DisplayLabel = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100
      FieldKind = fkLookup
      FieldName = 'ZAK'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_ZAK'
      Size = 54
      Lookup = True
    end
    object cdsDetMANAGER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      FieldKind = fkLookup
      FieldName = 'AUTHER'
      LookupDataSet = dmdEx.cdsManager
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_MANAGER'
      Size = 34
      Lookup = True
    end
    object cdsDetID: TStringField
      DisplayLabel = #8470#1085#1072#1082#1083
      FieldName = 'ID'
    end
    object cdsDetID_IZG: TIntegerField
      FieldName = 'ID_IZG'
    end
    object cdsDetID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
    end
    object cdsDetID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
    end
    object cdsDetKOLOTP2: TFMTBCDField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      FieldName = 'KOLOTP'
      DisplayFormat = '0.000'
    end
    object cdsDetID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      Required = True
    end
    object cdsDetTIP: TSmallintField
      FieldName = 'TIP'
      Required = True
      Visible = False
    end
  end
  object ActionList1: TActionList
    Images = dmdEx.ImageList1
    Left = 192
    Top = 144
    object actExit: TAction
      Caption = 'actExit'
      ShortCut = 27
      OnExecute = actExitExecute
    end
    object actDetail: TAction
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      ImageIndex = 5
      OnExecute = actDetailExecute
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
    Left = 256
    Top = 72
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmSkladRasxBuxDet'
    StorageManager = rpsClientEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width')
    Left = 256
    Top = 136
  end
  object rpsClientEdit: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 256
    Top = 104
  end
end
