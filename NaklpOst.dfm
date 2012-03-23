object frmNaklpOst: TfrmNaklpOst
  Left = 326
  Top = 157
  BorderStyle = bsDialog
  Caption = #1054#1090#1095#1105#1090' '#1087#1086' '#1085#1077#1076#1086#1087#1086#1089#1090#1072#1074#1082#1072#1084
  ClientHeight = 367
  ClientWidth = 632
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
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    632
    367)
  PixelsPerInch = 96
  TextHeight = 13
  object dbgNaklr: TDBGridEh
    Left = 8
    Top = 32
    Width = 615
    Height = 329
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
    ReadOnly = True
    SumList.Active = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    VertScrollBar.VisibleMode = sbAlwaysShowEh
    OnDblClick = dbgNaklrDblClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ID'
        Footer.Value = #1047#1072#1087#1080#1089#1077#1081':'
        Footer.ValueType = fvtStaticText
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'DAT'
        Footer.ValueType = fvtCount
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'SUB1_NAME'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'SUB2_NAME'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'SUB3_NAME'
        Footer.Value = #1057#1091#1084#1084#1072':'
        Footer.ValueType = fvtStaticText
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'SUB6_NAME'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'DIFFBEFORE'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'DEBETAFTER'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'KREDITAFTER'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'DIFF'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'DIFF_IN_CURRENCY'
        Footer.ValueType = fvtSum
        Footers = <>
      end>
  end
  object cbxOnlyEmpty: TCheckBox
    Left = 443
    Top = 0
    Width = 65
    Height = 17
    Hint = 
      #1055#1086#1082#1072#1079#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1085#1072#1082#1083#1072#1076#1085#1099#1077', '#1074' '#1082#1086#1090#1086#1088#1099#1093' '#1085#1077' '#1073#1099#1083#1080' '#1079#1072#1087#1086#1083#1085#1077#1085#1099' '#1092#1072#1082#1090#1080#1095#1077#1089#1082 +
      #1080#1077' '#1094#1077#1085#1099
    Anchors = [akTop, akRight]
    Caption = #1042#1085#1077#1089#1090#1080
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Visible = False
  end
  object BitBtn2: TBitBtn
    Left = 6
    Top = 0
    Width = 91
    Height = 25
    Action = actRefresh
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100
    TabOrder = 2
    Kind = bkRetry
  end
  object BitBtn4: TBitBtn
    Left = 220
    Top = 0
    Width = 97
    Height = 25
    Action = actSettings
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
    TabOrder = 3
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FF00FFFF00FF
      FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF0000FF00FFFF00FFFF00FFFF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF0000FF00FFFF0000FF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF0000FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF0000FF0000FF00FF
      FF00FFFF00FFFF00FFFF00FFFF0000FF00FFFF00FFFF0000FF00FFFF00FFFF00
      FFFF00FFFF00FFFF0000FF0000FF00FFFF00FFFF00FFFF0000FF0000FF00FFFF
      00FFFF00FFFF00FFFF0000FF0000FF00FFFF00FFFF00FFFF0000FF0000FF00FF
      FF0000FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      00FF0000FF00FFFF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00FF
      FF0000FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      00FF0000FF00FFFF0000FF0000FF00FFFF00FFFF00FFFF0000FF0000FF00FFFF
      00FFFF00FFFF00FFFF0000FF0000FF00FFFF00FFFF00FFFF0000FF0000FF00FF
      FF00FFFF00FFFF00FFFF00FFFF0000FF00FFFF00FFFF0000FF00FFFF00FFFF00
      FFFF00FFFF00FFFF0000FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF0000FF0000FF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF0000FF00FFFF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF0000FF00FFFF00FFFF00FF
      FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
  end
  object BitBtn3: TBitBtn
    Left = 108
    Top = 0
    Width = 97
    Height = 25
    Action = actDetail
    Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
    TabOrder = 4
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
  object dsNaklr: TDataSource
    DataSet = cdsNaklr
    Left = 104
    Top = 80
  end
  object ActionList1: TActionList
    Left = 72
    Top = 48
    object actSettings: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      Hint = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1077#1088#1080#1086#1076#1072' '#1074#1088#1077#1084#1077#1085#1080' '#1080' '#1074#1099#1073#1086#1088' '#1084#1077#1085#1077#1076#1078#1077#1088#1072
      OnExecute = actSettingsExecute
    end
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1074#1089#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077
      ShortCut = 116
      OnExecute = actRefreshExecute
    end
    object actDetail: TAction
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      ShortCut = 120
      OnExecute = actDetailExecute
    end
    object actShowNaklpbux: TAction
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1088#1080#1093#1086#1076#1085#1091#1102' '#1073#1091#1093#1075#1072#1083#1090#1077#1088#1089#1082#1091#1102' '#1085#1072#1082#1083#1072#1076#1085#1091#1102
      OnExecute = actShowNaklpbuxExecute
    end
    object actShowNaklp: TAction
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1079#1072#1074#1080#1089#1080#1084#1099#1077' '#1089#1082#1083#1072#1076#1089#1082#1080#1077' '#1087#1088#1080#1093#1086#1076#1099
      OnExecute = actShowNaklpExecute
    end
  end
  object qeNaklr: TQueryExtender
    Query = cdsNaklr
    KeyField = 'sub4'
    Left = 104
    Top = 112
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
        Action = actShowNaklpbux
      end
      object N6: TMenuItem
        Action = actShowNaklp
      end
    end
  end
  object sdsNaklr: TSQLDataSet
    CommandText = 
      'select'#13#10'  (select dat from naklo om where om.id_nakl=r.sub4) as ' +
      'dat,'#13#10'  (select id from naklo om where om.id_nakl=r.sub4) as id,' +
      #13#10'  r.sub1,r.sub2,r.sub3,r.sub4,r.sub6,'#13#10'  (sum(r.debetbefore)-s' +
      'um(r.kreditbefore)) as diffbefore,'#13#10'  sum(r.debet) as debetafter' +
      ','#13#10'  sum(r.kredit) as kreditafter,'#13#10'  (sum(r.debetbefore)-sum(r.' +
      'kreditbefore))+sum(r.debet)-sum(kredit) as diff,'#13#10'  sum(r.debeta' +
      'fterincurrency-r.kreditafterincurrency) as diff_in_currency'#13#10'fro' +
      'm rep_oborotka2_roles_pc(:id_schet_nedopost,:dat_from,:dat_to,'#13#10 +
      '  :sub1_in,:sub2_in,:sub3_in, :sub4_in, null,'#13#10'  null,null,null,' +
      ' null, null,'#39'POWER_USER;SNAB'#39',:id_currency_to,6) r'#13#10'group by r.s' +
      'ub1,r.sub2,r.sub3,r.sub4,r.sub6'#13#10#13#10'order by 1,r.sub1'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_schet_nedopost'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'dat_from'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'dat_to'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'sub1_in'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'sub2_in'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'sub3_in'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'sub4_in'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_currency_to'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 104
    Top = 176
  end
  object dspNaklr: TDataSetProvider
    DataSet = sdsNaklr
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 104
    Top = 208
  end
  object cdsNaklr: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DAT'
        DataType = ftTimeStamp
      end
      item
        Name = 'ID'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SUB1'
        DataType = ftInteger
      end
      item
        Name = 'SUB2'
        DataType = ftInteger
      end
      item
        Name = 'SUB3'
        DataType = ftInteger
      end
      item
        Name = 'SUB4'
        DataType = ftInteger
      end
      item
        Name = 'SUB6'
        DataType = ftInteger
      end
      item
        Name = 'DIFFBEFORE'
        DataType = ftFloat
      end
      item
        Name = 'DEBETAFTER'
        DataType = ftFloat
      end
      item
        Name = 'KREDITAFTER'
        DataType = ftFloat
      end
      item
        Name = 'DIFF'
        DataType = ftFloat
      end
      item
        Name = 'DIFF_IN_CURRENCY'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'cdsNaklrIndex1'
        Fields = 'IZG2'
        Options = [ixCaseInsensitive]
      end>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_schet_nedopost'
        ParamType = ptInput
        Value = 10899
      end
      item
        DataType = ftDate
        Name = 'dat_from'
        ParamType = ptInput
        Value = 36892d
      end
      item
        DataType = ftDate
        Name = 'dat_to'
        ParamType = ptInput
        Value = 36892d
      end
      item
        DataType = ftInteger
        Name = 'sub1_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'sub2_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'sub3_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'sub4_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'id_currency_to'
        ParamType = ptInput
        Value = Null
      end>
    ProviderName = 'dspNaklr'
    StoreDefs = True
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
    object cdsNaklrSUB1: TIntegerField
      FieldName = 'SUB1'
    end
    object cdsNaklrSUB2: TIntegerField
      FieldName = 'SUB2'
    end
    object cdsNaklrSUB3: TIntegerField
      FieldName = 'SUB3'
    end
    object cdsNaklrSUB4: TIntegerField
      FieldName = 'SUB4'
    end
    object cdsNaklrSUB6: TIntegerField
      FieldName = 'SUB6'
    end
    object cdsNaklrSUB1_NAME: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      DisplayWidth = 15
      FieldKind = fkLookup
      FieldName = 'SUB1_NAME'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'SUB1'
      Size = 50
      Lookup = True
    end
    object cdsNaklrSUB2_NAME: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      DisplayWidth = 15
      FieldKind = fkLookup
      FieldName = 'SUB2_NAME'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'SUB2'
      Size = 50
      Lookup = True
    end
    object cdsNaklrSUB3_NAME: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'SUB3_NAME'
      LookupDataSet = dmdEx.cdsManager
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'SUB3'
      Size = 50
      Lookup = True
    end
    object cdsNaklrSUB6_NAME: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'SUB6_NAME'
      LookupDataSet = dmdEx.cdsCurrency
      LookupKeyFields = 'OID'
      LookupResultField = 'NAME'
      KeyFields = 'SUB6'
      Size = 50
      Lookup = True
    end
    object cdsNaklrDIFFBEFORE: TFloatField
      DisplayLabel = #1053#1072' '#1085#1072#1095#1072#1083#1086' '#1085#1077#1076#1086#1087#1086#1089#1090#1072#1074#1082#1072
      FieldName = 'DIFFBEFORE'
      DisplayFormat = '0.00'
    end
    object cdsNaklrDEBETAFTER: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1073#1091#1093
      FieldName = 'DEBETAFTER'
      DisplayFormat = '0.00'
    end
    object cdsNaklrKREDITAFTER: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1089#1082#1083#1072#1076
      FieldName = 'KREDITAFTER'
      DisplayFormat = '0.00'
    end
    object cdsNaklrDIFF: TFloatField
      DisplayLabel = #1053#1077#1076#1086#1087#1086#1089#1090#1072#1074#1082#1072
      FieldName = 'DIFF'
      DisplayFormat = '0.00'
    end
    object cdsNaklrDIFF_IN_CURRENCY: TFloatField
      DisplayLabel = #1053#1077#1076#1086#1087#1086#1089#1090#1072#1074#1082#1072' '#1074' '#1074#1072#1083#1102#1090#1077
      FieldName = 'DIFF_IN_CURRENCY'
      DisplayFormat = '0.00'
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
    Top = 112
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'frmNaklpOst'
    StorageManager = RegPropStorageManEh1
    StoredProps.Strings = (
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
    Left = 136
    Top = 48
    object N4: TMenuItem
      Action = actDetail
      Default = True
      ShortCut = 13
    end
    object N5: TMenuItem
      Action = actShowNaklpbux
    end
    object N7: TMenuItem
      Action = actShowNaklp
    end
  end
end
