object frmNaklpOstDet: TfrmNaklpOstDet
  Left = 110
  Top = 457
  BorderStyle = bsDialog
  Caption = #1054#1090#1095#1105#1090' '#1087#1086' '#1085#1077#1076#1086#1087#1086#1089#1090#1072#1074#1082#1072#1084' '#1087#1086' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
  ClientHeight = 367
  ClientWidth = 756
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
  DesignSize = (
    756
    367)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 217
    Top = 8
    Width = 71
    Height = 13
    Caption = #1056#1077#1078#1080#1084' '#1086#1090#1095#1105#1090#1072
  end
  object dbgNaklr: TDBGridEh
    Left = 0
    Top = 28
    Width = 756
    Height = 339
    AllowedOperations = [alopUpdateEh]
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsNaklr
    EditActions = [geaCopyEh]
    Flat = False
    FooterColor = clInfoBk
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
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
        FieldName = 'TOVAR'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'DEBET_KOLOTP'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'KREDIT_KOLOTP'
        Footers = <>
      end
      item
        Color = clInfoBk
        EditButtons = <>
        FieldName = 'DEBET_KOLOTP_AFTER'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'DEBET_CENA'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'KREDIT_CENA'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'DELTA_CENA'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'DEBET'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'KREDIT'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        Color = clInfoBk
        EditButtons = <>
        FieldName = 'DIFF'
        Footer.ValueType = fvtSum
        Footers = <>
      end>
  end
  object cbxMode: TComboBox
    Left = 308
    Top = 4
    Width = 145
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 1
    Text = #1042#1089#1077' '#1087#1086#1079#1080#1094#1080#1080
    OnChange = cbxModeChange
    Items.Strings = (
      #1042#1089#1077' '#1087#1086#1079#1080#1094#1080#1080
      #1054#1090#1083#1080#1095#1072#1102#1097#1080#1077#1089#1103' '#1087#1086' '#1082#1086#1083'-'#1074#1091' '#1080#1083#1080' '#1087#1086' '#1089#1091#1084#1084#1077
      #1054#1090#1083#1080#1095#1072#1102#1097#1080#1077#1089#1103' '#1087#1086' '#1089#1091#1084#1084#1077
      #1054#1090#1083#1080#1095#1072#1102#1097#1080#1077#1089#1103' '#1087#1086' '#1082#1086#1083'-'#1074#1091)
  end
  object BitBtn3: TBitBtn
    Left = 100
    Top = 0
    Width = 105
    Height = 25
    Action = actDetail
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
  object BitBtn2: TBitBtn
    Left = 2
    Top = 0
    Width = 91
    Height = 25
    Action = actRefresh
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100
    TabOrder = 3
    Kind = bkRetry
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
      object N2: TMenuItem
        Action = actRefresh
      end
      object N1: TMenuItem
        Action = actDetail
      end
    end
  end
  object sdsNaklr: TSQLDataSet
    CommandText = 
      'select'#13#10'  r.sub1,r.sub2,r.sub3,r.sub4,sub5,'#13#10'  sum(r.debet) as d' +
      'ebet,'#13#10'  sum(kredit) as kredit,'#13#10'  sum(r.debet)-sum(kredit) as d' +
      'iff,'#13#10#13#10'  sum(r.debet_kolotp) as debet_kolotp,'#13#10'  sum(r.kredit_k' +
      'olotp) as kredit_kolotp,'#13#10'  sum(r.kolotp_after) as debet_kolotp_' +
      'after,'#13#10'  (dzero(sum(debet),sum(r.debet_kolotp),0)/(1+(select na' +
      'log_nds from naklo om where om.id_nakl=r.sub4))) as debet_cena,'#13 +
      #10'  (dzero(sum(kredit),sum(r.kredit_kolotp),0)/(1+(select nalog_n' +
      'ds from naklo om where om.id_nakl=r.sub4)))as kredit_cena  '#13#10#13#10'f' +
      'rom rep_oborotka2_pc(:id_schet_nedopost,:dat_from,:dat_to,'#13#10'  :s' +
      'ub1_in,:sub2_in,:sub3_in, :sub4_in, null,'#13#10'  null,null,null, nul' +
      'l, null) r'#13#10'group by r.sub1,r.sub2,r.sub3,r.sub4,r.sub5'#13#10'order b' +
      'y r.sub1,r.sub2,r.sub3,r.sub4,r.sub5'
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
        DataType = ftInteger
        Name = 'sub1_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sub2_in'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'sub3_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sub4_in'
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
        Name = 'SUB1'
        DataType = ftInteger
      end
      item
        Name = 'SUB2'
        DataType = ftInteger
      end
      item
        Name = 'SUB3'
        DataType = ftFMTBcd
        Precision = 15
      end
      item
        Name = 'SUB4'
        DataType = ftInteger
      end
      item
        Name = 'SUB5'
        DataType = ftInteger
      end
      item
        Name = 'DEBET'
        DataType = ftFloat
      end
      item
        Name = 'KREDIT'
        DataType = ftFloat
      end
      item
        Name = 'DIFF'
        DataType = ftFloat
      end
      item
        Name = 'DEBET_KOLOTP'
        DataType = ftFloat
      end
      item
        Name = 'KREDIT_KOLOTP'
        DataType = ftFloat
      end
      item
        Name = 'DEBET_KOLOTP_AFTER'
        DataType = ftFloat
      end
      item
        Name = 'DEBET_CENA'
        DataType = ftFloat
      end
      item
        Name = 'KREDIT_CENA'
        DataType = ftFloat
      end
      item
        Name = 'DELTA_CENA'
        DataType = ftFMTBcd
        Precision = 32
        Size = 8
      end>
    IndexDefs = <
      item
        Name = 'cdsNaklrIndex1'
        Fields = 'IZG2'
        Options = [ixCaseInsensitive]
      end>
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
        DataType = ftInteger
        Name = 'sub1_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sub2_in'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'sub3_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sub4_in'
        ParamType = ptInput
      end>
    ProviderName = 'dspNaklr'
    StoreDefs = True
    BeforeScroll = cdsNaklrBeforeScroll
    OnCalcFields = cdsNaklrCalcFields
    Left = 104
    Top = 240
    object cdsNaklrSUB1: TIntegerField
      FieldName = 'SUB1'
    end
    object cdsNaklrSUB2: TIntegerField
      FieldName = 'SUB2'
    end
    object cdsNaklrSUB3: TFMTBCDField
      FieldName = 'SUB3'
      Precision = 15
    end
    object cdsNaklrSUB4: TIntegerField
      FieldName = 'SUB4'
    end
    object cdsNaklrSUB5: TIntegerField
      FieldName = 'SUB5'
    end
    object cdsNaklrDEBETAFTER: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1073#1091#1093
      FieldName = 'DEBET'
      DisplayFormat = '0.00'
    end
    object cdsNaklrTOVAR: TStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'TOVAR'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'SUB5'
      Size = 50
      Lookup = True
    end
    object cdsNaklrKREDITAFTER: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1089#1082#1083#1072#1076
      FieldName = 'KREDIT'
      DisplayFormat = '0.00'
    end
    object cdsNaklrDIFF: TFloatField
      DisplayLabel = #1053#1077#1076#1086#1087#1086#1089#1090#1072#1074#1082#1072
      FieldName = 'DIFF'
      DisplayFormat = '0.00'
    end
    object cdsNaklrDEBET_KOLOTP: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1087#1086' '#1073#1091#1093
      FieldName = 'DEBET_KOLOTP'
      DisplayFormat = '0.000'
    end
    object cdsNaklrKREDIT_KOLOTP: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1089#1082#1083#1072#1076
      FieldName = 'KREDIT_KOLOTP'
      DisplayFormat = '0.000'
    end
    object cdsNaklrDEBET_KOLOTP_AFTER: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082' '#1082#1086#1083'-'#1074#1086
      FieldName = 'DEBET_KOLOTP_AFTER'
      DisplayFormat = '0.000'
    end
    object cdsNaklrDEBET_CENA: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1087#1086' '#1073#1091#1093
      FieldName = 'DEBET_CENA'
      DisplayFormat = '0.00'
    end
    object cdsNaklrKREDIT_CENA: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1089#1082#1083#1072#1076
      FieldName = 'KREDIT_CENA'
      DisplayFormat = '0.00'
    end
    object cdsNaklrDELTA_CENA: TFMTBCDField
      DisplayLabel = #1056#1072#1079#1085#1080#1094#1072' '#1094#1077#1085
      FieldKind = fkInternalCalc
      FieldName = 'DELTA_CENA'
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
    Top = 48
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'frmNaklpOstDet'
    StorageManager = RegPropStorageManEh1
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      '<P>.WindowState'
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
  end
end
