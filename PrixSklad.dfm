object frmPrixSklad: TfrmPrixSklad
  Left = 131
  Top = 89
  BorderStyle = bsDialog
  Caption = #1054#1073#1086#1088#1086#1090#1099' '#1089#1082#1083#1072#1076#1072
  ClientHeight = 653
  ClientWidth = 1026
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
  DesignSize = (
    1026
    653)
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 28
    Width = 1026
    Height = 625
    ActivePage = TabSheet2
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1058#1086#1074#1072#1088#1099
      object dbgTovar: TDBGridEh
        Left = 0
        Top = 0
        Width = 1018
        Height = 597
        Align = alClient
        AllowedOperations = [alopUpdateEh, alopDeleteEh]
        DataSource = dsTovar
        EditActions = [geaCopyEh, geaSelectAllEh]
        Flat = False
        FooterColor = clInfoBk
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
        PopupMenu = ppmTovar
        SortLocal = True
        SumList.Active = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        VertScrollBar.VisibleMode = sbAlwaysShowEh
        OnDblClick = dbgTovarDblClick
        OnKeyUp = dbgTovarKeyUp
        Columns = <
          item
            EditButtons = <>
            FieldName = 'TOVAR'
            Footers = <>
            Width = 339
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1054#1073#1098#1105#1084#1099
      ImageIndex = 1
      DesignSize = (
        1018
        597)
      object dbgRep: TDBGridEh
        Left = 0
        Top = 0
        Width = 1018
        Height = 597
        Align = alClient
        AllowedOperations = [alopUpdateEh]
        DataSource = dsReport
        EditActions = [geaCopyEh, geaSelectAllEh]
        Flat = False
        FooterColor = clInfoBk
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FooterRowCount = 1
        FrozenCols = 1
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind]
        PopupMenu = ppmReport
        SortLocal = True
        SumList.Active = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbgRepDblClick
      end
      object ProgressBar1: TProgressBar
        Left = 104
        Top = 184
        Width = 841
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Visible = False
      end
    end
  end
  object BitBtn2: TBitBtn
    Left = 116
    Top = 0
    Width = 93
    Height = 25
    Action = actSettings
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
    TabOrder = 1
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF000000FF00FF00FF00FF00FF00FF00FF00
      0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF00FF00FF000000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF00FF00FF00FF00FF00
      0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF00
      FF00FF00FF00FF00FF00FF000000FF000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF000000FF000000FF00FF00FF00FF00FF00FF00FF000000FF000000FF00
      FF00FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF000000FF000000FF00FF00FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      FF00FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF000000FF000000FF00FF00FF000000FF000000FF00
      FF00FF00FF00FF00FF00FF000000FF000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF000000FF000000FF00FF00FF00FF00FF00FF00FF000000FF000000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF00FF00FF00FF00FF00
      0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF00FF00FF00
      0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF00FF00FF00FF00FF00
      FF00FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
  end
  object BitBtn1: TBitBtn
    Left = 232
    Top = 0
    Width = 117
    Height = 25
    Action = actRefresh
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100
    ModalResult = 4
    TabOrder = 2
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00800000008000000080000000800000008000
      0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000080
      000080000000FF00FF0080000000008000000080000000800000008000000080
      00008000000080000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000080
      0000008000008000000000800000008000000080000000800000008000000080
      0000008000000080000080000000FF00FF00FF00FF00FF00FF00FF00FF000080
      00000080000000800000008000000080000000FF000000FF000000FF000000FF
      0000008000000080000000800000FF00FF00FF00FF00FF00FF00FF00FF000080
      0000008000000080000000800000FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0000FF00000080000080000000FF00FF00FF00FF00FF00FF000080
      000000800000008000000080000000800000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0000FF00008000000080000000FF00FF00FF00FF00FF00FF0000FF
      000000FF000000FF000000FF000000FF000000FF0000FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF008000000080000000800000008000000080000000FF00FF00FF00FF0000FF
      00008000000080000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000FF
      00000080000000800000008000000080000080000000FF00FF00FF00FF0000FF
      00000080000080000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF0000FF000000800000008000000080000080000000FF00FF00FF00FF00FF00
      FF0000FF00000080000080000000FF00FF00FF00FF00FF00FF00FF00FF008000
      00008000000000800000008000000080000080000000FF00FF00FF00FF00FF00
      FF00FF00FF000080000000800000008000000080000000800000008000000080
      0000008000000080000000FF00000080000080000000FF00FF00FF00FF00FF00
      FF00FF00FF0000FF000000FF0000008000000080000000800000008000000080
      000000FF000000FF0000FF00FF0000FF0000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF0000FF000000FF000000FF000000FF000000FF
      0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
  end
  object BitBtn3: TBitBtn
    Left = 0
    Top = 0
    Width = 97
    Height = 25
    Action = actDetail
    Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
    TabOrder = 3
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
  object ActionList1: TActionList
    Images = dmdEx.ImageList1
    Left = 400
    Top = 8
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 9
      OnExecute = actRefreshExecute
    end
    object actSettings: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      ImageIndex = 8
      ShortCut = 16465
      OnExecute = actSettingsExecute
    end
    object actDetail: TAction
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      ShortCut = 120
      OnExecute = actDetailExecute
    end
    object actAverageCount: TAction
      Caption = #1056#1072#1089#1089#1095#1080#1090#1072#1090#1100' '#1089#1088#1077#1076#1085#1077#1077
      OnExecute = actAverageCountExecute
    end
    object actAddTovar: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1079#1080#1094#1080#1080' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1090#1086#1074#1072#1088#1086#1074
      OnExecute = actAddTovarExecute
    end
    object actDebug: TAction
      Caption = #1056#1077#1078#1080#1084' '#1086#1090#1083#1072#1076#1082#1080
      OnExecute = actDebugExecute
    end
    object actSetColumnValue: TAction
      Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077#1084
      OnExecute = actSetColumnValueExecute
    end
    object actIncColumnValue: TAction
      Caption = #1055#1088#1080#1073#1072#1074#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077
      OnExecute = actIncColumnValueExecute
    end
    object actMultColumnValue: TAction
      Caption = #1059#1084#1085#1086#1078#1080#1090#1100' '#1085#1072' '#1079#1085#1072#1095#1077#1085#1080#1077
      OnExecute = actMultColumnValueExecute
    end
    object actSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ShortCut = 16467
      OnExecute = actSaveExecute
    end
  end
  object sdsSkladRasx: TSQLDataSet
    CommandText = 
      'select '#13#10'  (select t2.name'#13#10'    from tovar t2'#13#10'    where t2.oid=' +
      't.id_analog) as tovar,'#13#10'  sum(ot.kolotp) as kolotp,'#13#10'  t.id_anal' +
      'og'#13#10'from'#13#10'  tovar t'#13#10'  join naklot ot on t.oid=ot.id_tovar'#13#10'  in' +
      'ner join naklo om on om.id_nakl=ot.id_nakl'#13#10'where'#13#10'  om.posted=1' +
      ' and'#13#10'  om.tip in ('#13#10'    (select oid from get_oid_objects_pc('#39#1054#1090 +
      #1075#1088#1091#1079#1082#1072#39',101))'#13#10'  ) and'#13#10'  om.dat >= :datefrom and'#13#10'  om.dat<:dat' +
      'eto'#13#10'group by'#13#10'  t.id_analog'#13#10'order by'#13#10'  1'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'datefrom'
        ParamType = ptInput
        Value = 36892d
      end
      item
        DataType = ftDate
        Name = 'dateto'
        ParamType = ptInput
        Value = 36892d
      end>
    SQLConnection = dmdEx.scUchet
    Left = 432
    Top = 40
  end
  object dspSkladRasx: TDataSetProvider
    DataSet = sdsSkladRasx
    Options = [poAllowCommandText]
    Left = 432
    Top = 72
  end
  object cdsSkladRasx: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'datefrom'
        ParamType = ptInput
        Value = 36892d
      end
      item
        DataType = ftDate
        Name = 'dateto'
        ParamType = ptInput
        Value = 36892d
      end>
    ProviderName = 'dspSkladRasx'
    Left = 432
    Top = 104
    object cdsSkladRasxTOVAR: TStringField
      FieldName = 'TOVAR'
      Size = 44
    end
    object cdsSkladRasxKOLOTP: TFMTBCDField
      FieldName = 'KOLOTP'
      DisplayFormat = '0.000'
      Precision = 15
    end
    object cdsSkladRasxID_ANALOG: TIntegerField
      FieldName = 'ID_ANALOG'
    end
  end
  object cdsReport: TClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    OnCalcFields = cdsReportCalcFields
    Left = 496
    Top = 104
    object cdsReportTOVAR: TStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      DisplayWidth = 20
      FieldName = 'TOVAR'
      Size = 50
    end
    object cdsReportID_ANALOG: TIntegerField
      FieldName = 'ID_ANALOG'
      Visible = False
    end
    object cdsReportSKLADSKAYA: TIntegerField
      DisplayLabel = #1057#1082#1083#1072#1076#1089#1082#1072#1103
      FieldName = 'SKLADSKAYA'
      Visible = False
    end
    object cdsReportMONTHS_SALE: TIntegerField
      DisplayLabel = #1052#1077#1089#1103#1094#1077#1074' '#1087#1088#1086#1076#1072#1074#1072#1083#1086#1089#1100
      DisplayWidth = 2
      FieldName = 'MONTHS_SALE'
    end
    object cdsReportTOTAL_SALE: TFloatField
      DisplayLabel = #1054#1073#1097#1072#1103' '#1087#1088#1086#1076#1072#1078#1072
      DisplayWidth = 6
      FieldName = 'TOTAL_SALE'
      DisplayFormat = '0.000'
    end
    object cdsReportAVERAGE_SALE: TFloatField
      DisplayLabel = #1057#1088#1077#1076#1085#1103#1103' '#1087#1088#1086#1076#1072#1078#1072
      DisplayWidth = 6
      FieldName = 'AVERAGE_SALE'
      DisplayFormat = '0.000'
    end
    object cdsReportAVERAGE_SALE_WITH_ZEROS: TFloatField
      DisplayLabel = #1057#1088#1077#1076#1085#1103#1103' '#1087#1088#1086#1076#1072#1078#1072' '#1074#1082#1083#1102#1095#1072#1103' '#1085#1091#1083#1080
      FieldName = 'AVERAGE_SALE_WITH_ZEROS'
      Visible = False
      DisplayFormat = '0.000'
    end
    object cdsReportAVG2OTKL_SALE: TFloatField
      DisplayLabel = #1057#1088#1077#1076#1085#1077#1082#1074#1072#1076#1088#1072#1090#1080#1095#1085#1086#1077' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1077
      DisplayWidth = 6
      FieldName = 'AVG2OTKL_SALE'
      Visible = False
      DisplayFormat = '0.000'
    end
    object cdsReportRAZBROS_SALE: TFloatField
      DisplayLabel = #1056#1072#1079#1073#1088#1086#1089' '#1087#1088#1086#1076#1072#1078
      DisplayWidth = 6
      FieldName = 'RAZBROS_SALE'
      Visible = False
    end
    object cdsReportKOEF_SALE: TFloatField
      DisplayLabel = #1050#1086#1101#1092#1080#1094#1080#1077#1085#1090
      DisplayWidth = 6
      FieldName = 'KOEF_SALE'
    end
    object cdsReportOSTATOK: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082' '#1089#1074#1086#1073
      DisplayWidth = 6
      FieldName = 'OSTATOK'
      DisplayFormat = '0.000'
    end
    object cdsReportOSTATOK_REZERV: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082' '#1079#1072#1088#1077#1079
      DisplayWidth = 6
      FieldName = 'OSTATOK_REZERV'
      DisplayFormat = '0.000'
    end
    object cdsReportOSTATOK_FILIAL: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082' '#1092#1080#1083#1080#1072#1083#1072' '#1082#1080#1077#1074' '#1089#1074#1086#1073
      DisplayWidth = 6
      FieldName = 'OSTATOK_FILIAL'
      DisplayFormat = '0.000'
    end
    object cdsReportOSTATOK_FILIAL_REZERV: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082' '#1092#1080#1083#1080#1072#1083#1072' '#1082#1080#1077#1074' '#1088#1077#1079#1077#1088#1074
      DisplayWidth = 6
      FieldName = 'OSTATOK_FILIAL_REZERV'
      DisplayFormat = '0.000'
    end
    object cdsReportOSTATOK_FILIAL_SIMF: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082' '#1092#1080#1083#1080#1072#1083#1072' '#1089#1080#1084#1092' '#1089#1074#1086#1073
      DisplayWidth = 6
      FieldName = 'OSTATOK_FILIAL_SIMF'
      DisplayFormat = '0.000'
    end
    object cdsReportSPEC_OST: TFloatField
      DisplayLabel = #1055#1091#1090#1100
      DisplayWidth = 6
      FieldName = 'SPEC_OST'
      DisplayFormat = '0.000'
    end
    object cdsReportPROGNOZ: TFloatField
      DisplayLabel = #1055#1088#1086#1075#1085#1086#1079
      DisplayWidth = 6
      FieldName = 'PROGNOZ'
      DisplayFormat = '0.000'
    end
    object cdsReportZAKUPKA: TFloatField
      DisplayLabel = #1047#1072#1082#1091#1087#1082#1072
      DisplayWidth = 6
      FieldName = 'ZAKUPKA'
      DisplayFormat = '0.000'
    end
    object cdsReportSPEC_OST_RAZM: TFloatField
      DisplayLabel = #1056#1072#1079#1084#1077#1097#1077#1085#1086
      DisplayWidth = 6
      FieldName = 'SPEC_OST_RAZM'
      DisplayFormat = '0.000'
    end
    object cdsReportSPEC_OST_NERAZM: TFloatField
      DisplayLabel = #1053#1077#1088#1072#1079#1084#1077#1097#1077#1085#1086
      DisplayWidth = 6
      FieldName = 'SPEC_OST_NERAZM'
      DisplayFormat = '0.000'
    end
    object cdsReportSPEC_FREE: TFloatField
      DisplayLabel = #1050' '#1088#1072#1079#1084#1077#1097#1077#1085#1080#1102
      DisplayWidth = 6
      FieldKind = fkInternalCalc
      FieldName = 'SPEC_FREE'
      DisplayFormat = '0.000'
    end
  end
  object dsReport: TDataSource
    DataSet = cdsReport
    Left = 496
    Top = 136
  end
  object sdsSkladskaya: TSQLDataSet
    CommandText = 
      'select'#13#10'  t.name as tovar,'#13#10'  t.skladskaya ,'#13#10'  upper(t.gruppa1)' +
      ' as gruppa1,'#13#10'  t.gruppa2,'#13#10'  t.gruppa3,'#13#10'  t.gruppa4,'#13#10'  t.id_a' +
      'nalog'#13#10'from'#13#10'  tovar t'#13#10'where'#13#10'  (t.oid=t.id_analog)'#13#10'  and t.de' +
      'lmarked=0'#13#10'  and t.tara=2'#13#10'order by 3,'#13#10'  t.gruppa2,'#13#10'  t.gruppa' +
      '3,'#13#10'  t.gruppa4'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 400
    Top = 40
  end
  object dspSkladskaya: TDataSetProvider
    DataSet = sdsSkladskaya
    Options = [poAllowCommandText]
    Left = 400
    Top = 72
  end
  object cdsSkladskaya: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSkladskaya'
    Left = 400
    Top = 104
    object cdsSkladskayaTOVAR: TStringField
      FieldName = 'TOVAR'
      Size = 44
    end
    object cdsSkladskayaSKLADSKAYA: TSmallintField
      FieldName = 'SKLADSKAYA'
      Required = True
    end
    object cdsSkladskayaGRUPPA1: TStringField
      FieldName = 'GRUPPA1'
      Size = 50
    end
    object cdsSkladskayaGRUPPA2: TFloatField
      FieldName = 'GRUPPA2'
    end
    object cdsSkladskayaGRUPPA3: TFloatField
      FieldName = 'GRUPPA3'
    end
    object cdsSkladskayaGRUPPA4: TFloatField
      FieldName = 'GRUPPA4'
    end
    object cdsSkladskayaID_ANALOG: TIntegerField
      FieldName = 'ID_ANALOG'
    end
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
    Left = 496
    Top = 72
  end
  object sdsNaklr: TSQLDataSet
    CommandText = 
      'select '#13#10'  (select t2.name from objects t2 where t2.oid=t3.id_an' +
      'alog) as tovar,'#13#10'  sum(t.kolotp) as kolotp,'#13#10'  t3.id_analog'#13#10'fro' +
      'm'#13#10'  naklo n join naklot  t on n.id_nakl=t.id_nakl'#13#10'  inner join' +
      ' tovar t3 on t.id_tovar=t3.oid'#13#10'where'#13#10'  n.delmarked=0 and'#13#10'  n.' +
      'posted=1 and'#13#10'  n.dat>=:datefrom and'#13#10'  n.dat<:dateto and'#13#10'  n.t' +
      'ip = (select oid from '#13#10'GET_OID_OBJECTS_PC('#39#1056#1040#1057#1061#1054#1044#1053#1067#1045' '#1053#1040#1050#1051#1040#1044#1053#1067#1045#39 +
      ',-100))'#13#10'group by'#13#10'  t3.id_analog'#13#10'order by'#13#10'  1'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'datefrom'
        ParamType = ptInput
        Value = 36892d
      end
      item
        DataType = ftDate
        Name = 'dateto'
        ParamType = ptInput
        Value = 36892d
      end>
    SQLConnection = dmdEx.scUchet
    Left = 368
    Top = 40
  end
  object dspNaklr: TDataSetProvider
    DataSet = sdsNaklr
    Options = [poAllowCommandText]
    Left = 368
    Top = 72
  end
  object cdsNaklr: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'datefrom'
        ParamType = ptInput
        Value = 36892d
      end
      item
        DataType = ftDate
        Name = 'dateto'
        ParamType = ptInput
        Value = 36892d
      end>
    ProviderName = 'dspNaklr'
    Left = 368
    Top = 104
    object StringField1: TStringField
      FieldName = 'TOVAR'
      Size = 44
    end
    object cdsNaklrKOLOTP: TFMTBCDField
      FieldName = 'KOLOTP'
      Precision = 15
    end
    object cdsNaklrID_ANALOG: TIntegerField
      FieldName = 'ID_ANALOG'
    end
  end
  object sdsSklost: TSQLDataSet
    CommandText = 
      'select'#13#10'  tovar,kolotp,kolotp_rezerv,id_tovar as id_analog'#13#10'from' +
      ' rep_snab_sklostatki_time_pc(:dateto,:id_sklad_in,:id_tovars_in)' +
      ' r'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'dateto'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_sklad_in'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_tovars_in'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 336
    Top = 40
  end
  object dspSklost: TDataSetProvider
    DataSet = sdsSklost
    Options = [poAllowCommandText]
    Left = 336
    Top = 72
  end
  object cdsSklost: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'dateto'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_sklad_in'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_tovars_in'
        ParamType = ptInput
      end>
    ProviderName = 'dspSklost'
    Left = 336
    Top = 104
    object StringField2: TStringField
      DisplayWidth = 21
      FieldName = 'TOVAR'
      Size = 44
    end
    object cdsSklostKOLOTP: TFMTBCDField
      DisplayWidth = 9
      FieldName = 'KOLOTP'
      Precision = 15
    end
    object cdsSklostKOLOTP_REZERV: TFMTBCDField
      FieldName = 'KOLOTP_REZERV'
      Precision = 15
    end
    object cdsSklostID_ANALOG: TIntegerField
      FieldName = 'ID_ANALOG'
    end
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'frmPrixSklad'
    StorageManager = rpsClientEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width')
    Left = 272
    Top = 136
  end
  object rpsClientEdit: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 304
    Top = 136
  end
  object sdsSpecOst: TSQLDataSet
    CommandText = 
      'select id_analog,sum(kolotp_after) as kolotp_after'#13#10'from rep_sna' +
      'b_specost_pc('#39#39',:dat_to)'#13#10'group by id_analog'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'dat_to'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 464
    Top = 40
  end
  object dspSpecOst: TDataSetProvider
    DataSet = sdsSpecOst
    Options = [poAllowCommandText]
    Left = 464
    Top = 72
  end
  object cdsSpecOst: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'dat_to'
        ParamType = ptInput
      end>
    ProviderName = 'dspSpecOst'
    Left = 464
    Top = 104
    object cdsSpecOstKOLOTP_AFTER: TFloatField
      FieldName = 'KOLOTP_AFTER'
    end
    object cdsSpecOstTOVAR: TStringField
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'TOVAR'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_ANALOG'
      Size = 50
      Lookup = True
    end
    object cdsSpecOstID_ANALOG: TIntegerField
      FieldName = 'ID_ANALOG'
    end
  end
  object dsSpecOst: TDataSource
    DataSet = cdsSpecOst
    Left = 464
    Top = 136
  end
  object mteTovar: TMemTableEh
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'mteTovarIndex1'
        Fields = 'id_tovar'
        Options = [ixUnique]
      end
      item
        Name = 'mteTovarIndex2'
        Fields = 'GRUPPA1;GRUPPA2;GRUPPA3;GRUPPA4'
      end>
    Params = <>
    StoreDefs = True
    BeforePost = mteTovarBeforePost
    Left = 529
    Top = 36
    object mteTovarTOVAR: TStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'TOVAR'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_TOVAR'
      Required = True
      Size = 50
      Lookup = True
    end
    object mteTovarID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object mteTovarGRUPPA1: TStringField
      FieldName = 'GRUPPA1'
    end
    object mteTovarGRUPPA2: TFloatField
      FieldName = 'GRUPPA2'
    end
    object mteTovarGRUPPA3: TFloatField
      FieldName = 'GRUPPA3'
    end
    object mteTovarGRUPPA4: TFloatField
      FieldName = 'GRUPPA4'
    end
    object mteTovarKOEF_SALE: TFloatField
      FieldName = 'KOEF_SALE'
    end
    object mteTovarZAKUPKA: TFloatField
      FieldName = 'ZAKUPKA'
    end
  end
  object dsTovar: TDataSource
    DataSet = mteTovar
    Left = 529
    Top = 71
  end
  object ppmTovar: TPopupMenu
    Left = 530
    Top = 105
    object actAddDet1: TMenuItem
      Action = actAddTovar
    end
  end
  object ppmReport: TPopupMenu
    OnPopup = ppmReportPopup
    Left = 530
    Top = 137
    object N1: TMenuItem
      Action = actDetail
    end
    object N7: TMenuItem
      Action = actSetColumnValue
    end
    object N8: TMenuItem
      Action = actIncColumnValue
    end
    object N9: TMenuItem
      Action = actMultColumnValue
    end
  end
  object MainMenu1: TMainMenu
    Left = 532
    Top = 168
    object mnuActions: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      GroupIndex = 10
      object N3: TMenuItem
        Action = actDetail
      end
      object N2: TMenuItem
        Action = actRefresh
      end
      object N4: TMenuItem
        Action = actSettings
      end
      object N5: TMenuItem
        Action = actAverageCount
      end
      object N6: TMenuItem
        Action = actDebug
      end
      object N10: TMenuItem
        Action = actSave
      end
    end
  end
  object dsSkladskaya: TDataSource
    DataSet = cdsSkladskaya
    Left = 400
    Top = 136
  end
  object sdsSpecOstNerazm: TSQLDataSet
    CommandText = 
      'select t.id_analog, sum(sd.kolotp) as kolotp_nerazm'#13#10'from spec_d' +
      'et_vw sd inner join tovar t'#13#10'  on sd.id_tovar=t.oid'#13#10'  inner joi' +
      'n spec_vw sm on sm.id_nakl=sd.id_nakl'#13#10'where sd.id_sebest=:id_na' +
      'kl '#13#10'  and sm.delmarked=0 and sm.posted=0'#13#10'group by t.id_analog'#13 +
      #10'having sum(sd.kolotp)>0'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_nakl'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = dmdEx.scUchet
    Left = 572
    Top = 40
  end
  object dspSpecOstNerazm: TDataSetProvider
    DataSet = sdsSpecOstNerazm
    Options = [poAllowCommandText]
    Left = 572
    Top = 72
  end
  object cdsSpecOstNerazm: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_nakl'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspSpecOstNerazm'
    Left = 572
    Top = 104
    object cdsSpecOstNerazmTOVAR: TStringField
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'TOVAR'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_ANALOG'
      Size = 50
      Lookup = True
    end
    object cdsSpecOstNerazmID_ANALOG: TIntegerField
      FieldName = 'ID_ANALOG'
    end
    object cdsSpecOstNerazmKOLOTP_NERAZM: TFMTBCDField
      FieldName = 'KOLOTP_NERAZM'
      Precision = 15
      Size = 4
    end
  end
  object dsSpecNerazm: TDataSource
    DataSet = cdsSpecOstNerazm
    Left = 572
    Top = 136
  end
  object sdsSpecOstRazm: TSQLDataSet
    CommandText = 
      'select t.id_analog, sum(sd.kolotp) as kolotp_razm'#13#10'from spec_det' +
      '_vw sd inner join tovar t'#13#10'  on sd.id_tovar=t.oid'#13#10'  inner join ' +
      'spec_vw sm on sm.id_nakl=sd.id_nakl'#13#10'where sd.id_sebest=:id_nakl' +
      ' '#13#10'  and sm.delmarked=0 and sm.posted=1'#13#10'group by t.id_analog'#13#10'h' +
      'aving sum(sd.kolotp)>0'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_nakl'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = dmdEx.scUchet
    Left = 608
    Top = 40
  end
  object dspSpecOstRazm: TDataSetProvider
    DataSet = sdsSpecOstRazm
    Options = [poAllowCommandText]
    Left = 608
    Top = 72
  end
  object cdsSpecOstRazm: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_nakl'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspSpecOstRazm'
    Left = 608
    Top = 104
    object StringField3: TStringField
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'TOVAR'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_ANALOG'
      Size = 50
      Lookup = True
    end
    object IntegerField1: TIntegerField
      FieldName = 'ID_ANALOG'
    end
    object cdsSpecOstRazmKOLOTP_RAZM: TFMTBCDField
      FieldName = 'KOLOTP_RAZM'
      Precision = 15
      Size = 4
    end
  end
  object dsSpecOstRazm: TDataSource
    DataSet = cdsSpecOstRazm
    Left = 608
    Top = 136
  end
end
