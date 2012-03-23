object frmSpecOst: TfrmSpecOst
  Left = 0
  Top = 0
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
  object dbhRasx: TDBGridEh
    Left = 4
    Top = 36
    Width = 779
    Height = 482
    AllowedOperations = []
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoFitColWidths = True
    DataSource = dsRasx
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
    SortLocal = True
    SumList.Active = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    VertScrollBar.VisibleMode = sbAlwaysShowEh
    Columns = <
      item
        EditButtons = <>
        FieldName = 'SUB5_NAME'
        Footer.ValueType = fvtCount
        Footers = <>
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
        FieldName = 'DEBET_KOLOTP_AFTER'
        Footer.ValueType = fvtSum
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
  object cbxMode: TComboBox
    Left = 512
    Top = 0
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    Text = #1042#1089#1077' '#1087#1086#1079#1080#1094#1080#1080
    OnChange = cbxModeChange
    Items.Strings = (
      #1042#1089#1077' '#1087#1086#1079#1080#1094#1080#1080
      #1054#1090#1083#1080#1095#1072#1102#1097#1080#1077#1089#1103' '#1087#1086' '#1082#1086#1083'-'#1074#1091' '#1080#1083#1080' '#1087#1086' '#1094#1077#1085#1072
      #1054#1090#1083#1080#1095#1072#1102#1097#1080#1077#1089#1103' '#1087#1086' '#1094#1077#1085#1077
      #1054#1090#1083#1080#1095#1072#1102#1097#1080#1077#1089#1103' '#1087#1086' '#1082#1086#1083'-'#1074#1091)
  end
  object dsRasx: TDataSource
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
    object actWithoutTara: TAction
      Caption = #1041#1077#1079' '#1090#1072#1088#1099
      Checked = True
    end
    object actClose: TAction
      Caption = 'actClose'
      ShortCut = 27
      OnExecute = actCloseExecute
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
        Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
        ShortCut = 120
        Visible = False
      end
      object N2: TMenuItem
        Action = actRefresh
      end
      object N4: TMenuItem
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
        ImageIndex = 8
        Visible = False
      end
    end
  end
  object frRasx: TfrxReport
    Version = '3.23.7'
    DataSet = frdRasx
    DataSetName = 'frdRasx'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38981.611038622690000000
    ReportOptions.LastChange = 38981.611038622690000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frRasxGetValue
    Left = 136
    Top = 128
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frdRasx: TfrxDBDataset
    UserName = 'frdRasx'
    CloseDataSource = False
    DataSet = cdsRasx
    Left = 136
    Top = 160
  end
  object sdsRasx: TSQLDataSet
    CommandText = 
      'select'#13#10'  (select name from objects o where o.oid=r.sub5) as sub' +
      '5_name,'#13#10'  r.sub4,r.sub5, r.sub6,'#13#10'  sum(r.debetbefore)-minnum(s' +
      'um(r.debetbefore),sum(kreditbefore)) as debetbefore,'#13#10'  sum(r.kr' +
      'editbefore)-minnum(sum(r.debetbefore),sum(kreditbefore)) as kred' +
      'itbefore,'#13#10'  sum(debet) as debet,'#13#10'  sum(kredit) as kredit,'#13#10'  s' +
      'um(r.debetafter)-sum(kreditafter) as debetafter,'#13#10'  sum(r.debet_' +
      'kolotp) as debet_kolotp,'#13#10'  sum(r.kredit_kolotp) as kredit_kolot' +
      'p,'#13#10'  sum(r.kolotp_after) as debet_kolotp_after,'#13#10'  (dzero(sum(d' +
      'ebet),sum(r.debet_kolotp),0)/(1+(select nalog_nds from naklo om ' +
      'where om.id_nakl=r.sub4))) as debet_cena,'#13#10'  (dzero(sum(kredit),' +
      'sum(r.kredit_kolotp),0)/(1+(select nalog_nds from naklo om where' +
      ' om.id_nakl=r.sub4))) as kredit_cena,'#13#10'  (dzero(sum(debet),sum(r' +
      '.debet_kolotp),0)/(1+(select nalog_nds from naklo om where om.id' +
      '_nakl=r.sub4))) - '#13#10'  (dzero(sum(kredit),sum(r.kredit_kolotp),0)' +
      '/(1+(select nalog_nds from naklo om where om.id_nakl=r.sub4))) a' +
      's delta_cena'#13#10'  '#13#10'from rep_oborotka2_pc(:id_schet_spec,:dat_from' +
      ',:dat_to,'#13#10'  null,null,null, :sub4_in, null,'#13#10'  null,null,null, ' +
      'null, null) r'#13#10'group by sub4,sub5,sub6'#13#10'order by 1'
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
        DataType = ftInteger
        Name = 'sub4_in'
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
        DataType = ftInteger
        Name = 'sub4_in'
        ParamType = ptInput
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
    object cdsRasxDEBETBEFORE: TFloatField
      DisplayLabel = #1057#1087#1077#1094' '#1085#1072' '#1085#1072#1095#1072#1083#1086
      DisplayWidth = 8
      FieldName = 'DEBETBEFORE'
      Visible = False
      DisplayFormat = '0.00'
    end
    object cdsRasxKREDITBEFORE: TFloatField
      DisplayLabel = #1055#1088#1080#1093' '#1085#1072' '#1085#1072#1095#1072#1083#1086
      DisplayWidth = 8
      FieldName = 'KREDITBEFORE'
      Visible = False
      DisplayFormat = '0.00'
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
    object cdsRasxDEBET_KOLOTP_AFTER: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082' '#1082#1086#1083'-'#1074#1086
      FieldName = 'DEBET_KOLOTP_AFTER'
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
  end
  object qeRasx: TQueryExtender
    Query = cdsRasx
    Left = 40
    Top = 192
  end
  object UnfFilter1: TUnfFilter
    DBGridEh = dbhRasx
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
    Active = False
    Section = 'TfrmSpecOst'
    StorageManager = rpsSkladRasxDetEx
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      '<P>.WindowState'
      'dbhRasx.<P>.Columns.<ForAllItems>.Width')
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
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      Default = True
      ShortCut = 120
      Visible = False
    end
  end
end
