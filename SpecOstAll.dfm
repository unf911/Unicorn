object frmSpecOstAll: TfrmSpecOstAll
  Left = 440
  Top = 57
  BorderStyle = bsDialog
  Caption = #1054#1090#1095#1105#1090' '#1087#1086' '#1086#1089#1090#1072#1090#1082#1072#1084' '#1085#1072' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1103#1093
  ClientHeight = 524
  ClientWidth = 792
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
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    792
    524)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 421
    Top = 4
    Width = 71
    Height = 13
    Caption = #1056#1077#1078#1080#1084' '#1086#1090#1095#1105#1090#1072
  end
  object dbgRep: TDBGridEh
    Left = 8
    Top = 32
    Width = 779
    Height = 482
    AllowedOperations = []
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoFitColWidths = True
    DataSource = dsNaklr
    EditActions = [geaCopyEh, geaSelectAllEh]
    Flat = False
    FooterColor = clInfoBk
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghRowHighlight]
    PopupMenu = PopupMenu1
    ReadOnly = True
    SortLocal = True
    SumList.Active = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    VertScrollBar.VisibleMode = sbAlwaysShowEh
    OnDblClick = dbgRepDblClick
    OnKeyDown = dbgRepKeyDown
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ID'
        Footers = <>
        Width = 46
      end
      item
        EditButtons = <>
        FieldName = 'DAT'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'ID_PRIX'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'DAT_PRIX'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'IZG'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'ZAK'
        Footers = <>
        Width = 32
      end
      item
        EditButtons = <>
        FieldName = 'MANAGER'
        Footers = <>
        Width = 53
      end
      item
        EditButtons = <>
        FieldName = 'SUB5_NAME'
        Footer.ValueType = fvtCount
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'ANALOG'
        Footers = <>
        Width = 68
      end
      item
        EditButtons = <>
        FieldName = 'DEBET_KOLOTP'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'KREDIT_KOLOTP'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        Color = clInfoBk
        EditButtons = <>
        FieldName = 'KOLOTP_AFTER'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 62
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
        FieldName = 'DEBETAFTER'
        Footer.ValueType = fvtSum
        Footers = <>
      end>
  end
  object BitBtn2: TBitBtn
    Left = 4
    Top = 0
    Width = 97
    Height = 25
    Action = actRefresh
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100
    TabOrder = 1
    Kind = bkRetry
  end
  object BitBtn1: TBitBtn
    Left = 108
    Top = 0
    Width = 97
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
  object BitBtn4: TBitBtn
    Left = 212
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
  object cbxMode: TComboBox
    Left = 512
    Top = 0
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 4
    Text = #1042#1089#1077' '#1087#1086#1079#1080#1094#1080#1080
    OnChange = cbxModeChange
    Items.Strings = (
      #1042#1089#1077' '#1087#1086#1079#1080#1094#1080#1080
      #1054#1090#1083#1080#1095#1072#1102#1097#1080#1077#1089#1103' '#1087#1086' '#1082#1086#1083'-'#1074#1091' '#1080#1083#1080' '#1087#1086' '#1094#1077#1085#1077
      #1054#1090#1083#1080#1095#1072#1102#1097#1080#1077#1089#1103' '#1087#1086' '#1094#1077#1085#1077
      #1054#1090#1083#1080#1095#1072#1102#1097#1080#1077#1089#1103' '#1087#1086' '#1082#1086#1083'-'#1074#1091)
  end
  object dsNaklr: TDataSource
    DataSet = cdsRasx
    Left = 40
    Top = 160
  end
  object ActionList1: TActionList
    Images = dmdEx.ImageList1
    Left = 72
    Top = 128
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ShortCut = 116
      OnExecute = actRefreshExecute
    end
    object actItogo: TAction
      Caption = #1048#1090#1086#1075#1086
    end
    object actPreview: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      ShortCut = 16471
      Visible = False
    end
    object actDetail: TAction
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      ShortCut = 120
      OnExecute = actDetailExecute
    end
    object actSettings: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      ImageIndex = 8
      OnExecute = actSettingsExecute
    end
    object actClose: TAction
      Caption = 'actClose'
      ShortCut = 27
      OnExecute = actCloseExecute
    end
    object actManagerMode: TAction
      Caption = #1056#1077#1078#1080#1084' '#1076#1083#1103' '#1084#1077#1085#1077#1076#1078#1077#1088#1086#1074
      OnExecute = actManagerModeExecute
    end
    object actSelfTest: TAction
      Caption = #1057#1072#1084#1086#1090#1077#1089#1090#1080#1088#1086#1074#1072#1085#1080#1077
      Visible = False
      OnExecute = actSelfTestExecute
    end
  end
  object MainMenu1: TMainMenu
    Left = 104
    Top = 128
    object mnuActions: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      GroupIndex = 10
      object N1: TMenuItem
        Action = actPreview
      end
      object N3: TMenuItem
        Action = actDetail
      end
      object N2: TMenuItem
        Action = actRefresh
      end
      object N4: TMenuItem
        Action = actSettings
      end
      object N6: TMenuItem
        Action = actSelfTest
      end
    end
  end
  object sdsRasx: TSQLDataSet
    CommandText = 
      'select'#13#10'  o.name as sub5_name,'#13#10'  om.id, om.dat, r.sub8 as id_an' +
      'alog,  '#13#10'  r.sub4,r.sub5, r.sub6,r.sub7,r.sub1, r.sub2,r.sub3,'#13#10 +
      '  sum(debet) as debet,'#13#10'  sum(kredit) as kredit,'#13#10'  sum(r.debeta' +
      'fter)-sum(kreditafter) as debetafter,'#13#10'  sum(r.debet_kolotp) as ' +
      'debet_kolotp,'#13#10'  sum(r.kredit_kolotp) as kredit_kolotp,'#13#10'  Round' +
      '(sum(r.kolotp_after),3) as kolotp_after,'#13#10'  (dzero(sum(debet),su' +
      'm(r.debet_kolotp),0)/(1+(om.nalog_nds ))) as debet_cena,'#13#10'  (dze' +
      'ro(sum(kredit),sum(r.kredit_kolotp),0)/(1+(om.nalog_nds ))) as k' +
      'redit_cena,'#13#10'  Round((dzero(sum(debet),sum(r.debet_kolotp),0)/(1' +
      '+(om.nalog_nds ))) - '#13#10'  (dzero(sum(kredit),sum(r.kredit_kolotp)' +
      ',0)/(1+(om.nalog_nds ))),2) as delta_cena'#13#10'from rep_oborotka2_pc' +
      '(:id_schet_spec,:dat_from,:dat_to,'#13#10'  :sub1_in,:sub2_in,:sub3_in' +
      ', :sub4_in, null,'#13#10'  null,:sub7_in,:sub8_in, null, null) r  '#13#10'  ' +
      'inner join naklo om on r.sub4=om.id_nakl'#13#10'  inner join tovar o o' +
      'n o.oid=r.sub5'#13#10'group by sub1, sub2,sub3, sub4,sub5,sub6,sub7,om' +
      '.nalog_nds,om.id_nakl, o.name,om.id,r.sub8,om.dat'#13#10'order by 1'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_schet_spec'
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
        Name = 'sub7_in'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'sub8_in'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 40
    Top = 64
  end
  object dspRasx: TDataSetProvider
    DataSet = sdsRasx
    Options = [poAllowCommandText]
    Left = 40
    Top = 96
  end
  object cdsRasx: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_schet_spec'
        ParamType = ptInput
        Value = 8927
      end
      item
        DataType = ftDate
        Name = 'dat_from'
        ParamType = ptInput
        Value = 38718d
      end
      item
        DataType = ftDate
        Name = 'dat_to'
        ParamType = ptInput
        Value = 38718d
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
      end
      item
        DataType = ftInteger
        Name = 'sub7_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sub8_in'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspRasx'
    Left = 40
    Top = 128
    object cdsRasxSUB5_NAME: TStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      DisplayWidth = 25
      FieldName = 'SUB5_NAME'
      Size = 50
    end
    object cdsRasxSUB4: TIntegerField
      FieldName = 'SUB4'
      Visible = False
    end
    object cdsRasxSUB5: TIntegerField
      FieldName = 'SUB5'
      Visible = False
    end
    object cdsRasxSUB6: TIntegerField
      FieldName = 'SUB6'
      Visible = False
    end
    object cdsRasxDEBET: TFloatField
      DisplayLabel = #1057#1087#1077#1094
      FieldName = 'DEBET'
      DisplayFormat = '0.00'
    end
    object cdsRasxKREDIT: TFloatField
      DisplayLabel = #1055#1088#1080#1093
      FieldName = 'KREDIT'
      DisplayFormat = '0.00'
    end
    object cdsRasxDEBETAFTER: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082' '#1076#1077#1085#1100#1075#1080
      FieldName = 'DEBETAFTER'
      DisplayFormat = '0.00'
    end
    object cdsRasxDEBET_KOLOTP: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1087#1086' '#1089#1087#1077#1094
      FieldName = 'DEBET_KOLOTP'
      DisplayFormat = '0.000'
    end
    object cdsRasxKREDIT_KOLOTP: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1087#1086' '#1087#1088#1080#1093
      FieldName = 'KREDIT_KOLOTP'
      DisplayFormat = '0.000'
    end
    object cdsRasxDEBET_CENA: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1089#1087#1077#1094
      FieldName = 'DEBET_CENA'
      DisplayFormat = '0.00'
    end
    object cdsRasxKREDIT_CENA: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1087#1088#1080#1093
      FieldName = 'KREDIT_CENA'
      DisplayFormat = '0.00'
    end
    object cdsRasxDELTA_CENA: TFloatField
      DisplayLabel = #1056#1072#1079#1085#1080#1094#1072' '#1094#1077#1085
      FieldName = 'DELTA_CENA'
      DisplayFormat = '0.00'
    end
    object cdsRasxSUB7: TIntegerField
      FieldName = 'SUB7'
    end
    object cdsRasxSUB1: TIntegerField
      FieldName = 'SUB1'
    end
    object cdsRasxSUB2: TIntegerField
      FieldName = 'SUB2'
    end
    object cdsRasxSUB3: TFMTBCDField
      FieldName = 'SUB3'
      Precision = 15
    end
    object cdsRasxKOLOTP_AFTER: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082' '#1082#1086#1083'-'#1074#1086
      FieldName = 'KOLOTP_AFTER'
      DisplayFormat = '0.000'
    end
    object cdsRasxID: TStringField
      DisplayLabel = #8470#1089#1087#1077#1094
      FieldName = 'ID'
    end
    object cdsRasxDAT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 10
      FieldName = 'DAT'
      DisplayFormat = 'dd.mm.yy'
    end
    object cdsNakloIZG: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'IZG'
      LookupDataSet = dmdEx.cdsPost
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'SUB1'
      Size = 50
      Lookup = True
    end
    object cdsNakloZAK: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'ZAK'
      LookupDataSet = dmdEx.cdsVlad
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'SUB2'
      Size = 50
      Lookup = True
    end
    object cdsNakloMANAGER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      FieldKind = fkLookup
      FieldName = 'MANAGER'
      LookupDataSet = dmdEx.cdsManager
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'SUB3'
      Size = 30
      Lookup = True
    end
    object cdsRasxID_ANALOG: TIntegerField
      FieldName = 'ID_ANALOG'
    end
    object cdsRasxANALOG: TStringField
      DisplayLabel = #1054#1089#1085'. '#1072#1085#1072#1083#1086#1075
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'ANALOG'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_ANALOG'
      Size = 50
      Lookup = True
    end
  end
  object qeRasx: TQueryExtender
    Query = cdsRasx
    KeyField = 'sub5'
    Left = 40
    Top = 192
  end
  object UnfFilter1: TUnfFilter
    DBGridEh = dbgRep
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
    Left = 40
    Top = 224
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmSpecOstAll'
    StorageManager = rpsSkladRasxDetEx
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      '<P>.WindowState'
      'dbgRep.<P>.Columns.<ForAllItems>.Width')
    Left = 72
    Top = 64
  end
  object rpsSkladRasxDetEx: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 104
    Top = 64
  end
  object PopupMenu1: TPopupMenu
    Left = 72
    Top = 96
    object N5: TMenuItem
      Action = actDetail
      Default = True
    end
  end
  object dspNaklpOst: TDataSetProvider
    DataSet = sdsNaklpOst
    Options = [poAllowCommandText]
    Left = 136
    Top = 96
  end
  object cdsNaklpOst: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_schet_spec'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'sub3_in'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'sub3_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sub1_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'sub1_in'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dat_from'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dat_to'
        ParamType = ptInput
      end>
    ProviderName = 'dspNaklpOst'
    Left = 136
    Top = 128
    object cdsNaklpOstID: TStringField
      DisplayLabel = #8470#1089#1087#1077#1094
      FieldName = 'ID'
    end
    object cdsNaklpOstSQLTimeStampField: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 10
      FieldName = 'DAT'
      DisplayFormat = 'dd.mm.yy'
    end
    object cdsNaklpOstID_PRIX: TStringField
      DisplayLabel = #8470#1087#1088#1080#1093
      FieldName = 'ID_PRIX'
      Size = 30
    end
    object cdsNaklpOstDAT_PRIX: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1080#1093
      FieldName = 'DAT_PRIX'
      Required = True
      DisplayFormat = 'dd.mm.yy'
    end
    object cdsNaklpOstIntegerField5: TIntegerField
      FieldName = 'SUB1'
    end
    object cdsNaklpOstIntegerField6: TIntegerField
      FieldName = 'SUB2'
    end
    object cdsNaklpOstIntegerField7: TFMTBCDField
      FieldName = 'SUB3'
      Precision = 15
    end
    object cdsNaklpOstIntegerField2: TIntegerField
      FieldName = 'SUB5'
      Visible = False
    end
    object cdsNaklpOstStringField: TStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      DisplayWidth = 25
      FieldName = 'SUB5_NAME'
      Size = 50
    end
    object cdsNaklpOstIntegerField8: TIntegerField
      FieldName = 'ID_ANALOG'
    end
    object cdsNaklpOstStringField6: TStringField
      DisplayLabel = #1054#1089#1085'. '#1072#1085#1072#1083#1086#1075
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'ANALOG'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_ANALOG'
      Size = 50
      Lookup = True
    end
    object cdsNaklpOstStringField5: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      FieldKind = fkLookup
      FieldName = 'MANAGER'
      LookupDataSet = dmdEx.cdsManager
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'SUB3'
      Size = 30
      Lookup = True
    end
    object cdsNaklpOstStringField4: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'ZAK'
      LookupDataSet = dmdEx.cdsVlad
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'SUB2'
      Size = 50
      Lookup = True
    end
    object cdsNaklpOstStringField3: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'IZG'
      LookupDataSet = dmdEx.cdsPost
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'SUB1'
      Size = 50
      Lookup = True
    end
    object cdsNaklpOstFloatField2: TFloatField
      DisplayLabel = #1055#1088#1080#1093
      FieldName = 'KREDIT'
      DisplayFormat = '0.00'
    end
    object cdsNaklpOstFloatField5: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1087#1086' '#1087#1088#1080#1093
      FieldName = 'KREDIT_KOLOTP'
      DisplayFormat = '0.000'
    end
    object cdsNaklpOstFloatField7: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1087#1088#1080#1093
      FieldName = 'KREDIT_CENA'
      DisplayFormat = '0.00'
    end
    object cdsNaklpOstSUB4: TIntegerField
      FieldName = 'SUB4'
    end
    object cdsNaklpOstID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
    end
  end
  object sdsNaklpOst: TSQLDataSet
    CommandText = 
      'select'#13#10'  (select id from naklo om where om.id_nakl=r.sub4) as i' +
      'd,'#13#10'  (select dat from naklo om where om.id_nakl=r.sub4) as dat,' +
      #13#10'  (select id from naklo om where om.id_nakl=r.id_nakl) as id_p' +
      'rix,'#13#10'  r.dat as dat_prix,'#13#10'  r.sub1,'#13#10'  r.sub2,'#13#10'  r.sub3,'#13#10'  r' +
      '.sub4,'#13#10'  r.sub5,'#13#10'  (select name from objects o where o.oid=r.s' +
      'ub5) as sub5_name,'#13#10'  r.sub8 as id_analog,'#13#10'  r.kredit_kolotp,'#13#10 +
      '  dzero(r.kredit, r.kredit_kolotp, 0) as kredit_cena,'#13#10'  r.kredi' +
      't,'#13#10'  r.id_nakl'#13#10'from provodki r'#13#10'where  r.id_schet=:id_schet_sp' +
      'ec and'#13#10'  (r.sub3 between coalesce(:sub3_in, -2147483648) and co' +
      'alesce(:sub3_in, 2147483647) or r.sub3 is null) and'#13#10'  (r.sub1 b' +
      'etween coalesce(:sub1_in, -2147483648) and coalesce(:sub1_in, 21' +
      '47483647) or r.sub1 is null) and'#13#10'  r.dat between :dat_from and ' +
      ':dat_to'#13#10'and r.kredit_kolotp > 0'#13#10'order by 2,1'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_schet_spec'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sub3_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'sub3_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sub1_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'sub1_in'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dat_from'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dat_to'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 136
    Top = 64
  end
end
