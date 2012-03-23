object frmRepSkladBuxVyravn: TfrmRepSkladBuxVyravn
  Left = 263
  Top = 260
  Width = 587
  Height = 368
  Caption = #1042#1099#1088#1072#1074#1085#1080#1074#1072#1085#1080#1077' '#1089#1082#1083#1072#1076#1072
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 579
    Height = 39
    Align = alTop
    TabOrder = 0
    object cbxNotNull: TCheckBox
      Left = 411
      Top = 14
      Width = 125
      Height = 21
      Action = actShowColumnsSum
      TabOrder = 0
      Visible = False
    end
    object CheckBox1: TCheckBox
      Left = 432
      Top = 12
      Width = 145
      Height = 17
      Action = actShowColumnsKolotp
      TabOrder = 1
      Visible = False
    end
    object BitBtn2: TBitBtn
      Left = 4
      Top = 9
      Width = 97
      Height = 25
      Action = actRefresh
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 2
      Kind = bkRetry
    end
    object BitBtn3: TBitBtn
      Left = 112
      Top = 9
      Width = 93
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
    object BitBtn6: TBitBtn
      Left = 216
      Top = 9
      Width = 85
      Height = 25
      Action = actSettings
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      TabOrder = 4
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
  end
  object AutoPanel1: TAutoPanel
    Left = 0
    Top = 39
    Width = 579
    Height = 283
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object dbgRep: TDBGridEh
      Left = 2
      Top = 2
      Width = 575
      Height = 279
      Align = alClient
      DataSource = dsRep
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
      OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghRowHighlight]
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
      OnKeyUp = dbgRepKeyUp
      Columns = <
        item
          EditButtons = <>
          FieldName = 'ID_TOVAR'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'TOVAR'
          Footer.ValueType = fvtCount
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'KOLOTP_BUX'
          Footer.ValueType = fvtSum
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'KOLOTP_SKLAD'
          Footer.ValueType = fvtSum
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'KOLOTP_REST_SKLADS'
          Footer.ValueType = fvtSum
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'DIFF'
          Footer.ValueType = fvtSum
          Footers = <>
        end>
    end
  end
  object ActionList1: TActionList
    Images = dmdEx.ImageList1
    Left = 104
    Top = 136
    object actPreview: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      ShortCut = 16471
      Visible = False
    end
    object actCall: TAction
      Caption = 'actCall'
    end
    object actSettings: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      ShortCut = 16465
      OnExecute = actSettingsExecute
    end
    object actDetail: TAction
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      ImageIndex = 9
      ShortCut = 120
      OnExecute = actDetailExecute
    end
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ShortCut = 116
      OnExecute = actRefreshExecute
    end
    object actNotNull: TAction
      Caption = #1058#1086#1083#1100#1082#1086' '#1072#1082#1090#1080#1074#1085#1099#1077
    end
    object actRecalc: TAction
      Caption = #1048#1090#1086#1075#1086
    end
    object actDebug: TAction
      Caption = #1056#1077#1078#1080#1084' '#1086#1090#1083#1072#1076#1082#1080
      OnExecute = actDebugExecute
    end
    object actShowColumnsSum: TAction
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1089#1091#1084#1084#1099
      OnExecute = actShowColumnsSumExecute
    end
    object actShowColumnsKolotp: TAction
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1072
      OnExecute = actShowColumnsKolotpExecute
    end
    object actPrixodCreate: TAction
      Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1087#1088#1080#1093#1086#1076#1085#1086#1081' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      OnExecute = actPrixodCreateExecute
    end
    object actRasxodCreate: TAction
      Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1088#1072#1089#1093#1086#1076#1085#1086#1081' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      OnExecute = actRasxodCreateExecute
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
    Left = 136
    Top = 136
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'frmRepSkladBuxVyravn'
    StorageManager = rpsClientEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      'AutoPanel1.dbgRep.<P>.Columns.<ForAllItems>.Width')
    Left = 168
    Top = 136
  end
  object frReport1: TfrxReport
    Version = '3.23.7'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38981.610816319440000000
    ReportOptions.LastChange = 38981.610816319440000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 168
    Top = 168
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object rpsClientEdit: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 200
    Top = 136
  end
  object MainMenu1: TMainMenu
    Left = 104
    Top = 168
    object N1: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      GroupIndex = 10
      object N3: TMenuItem
        Action = actDetail
      end
      object mnuRefresh: TMenuItem
        Action = actRefresh
      end
      object N2: TMenuItem
        Action = actSettings
      end
      object N6: TMenuItem
        Action = actPreview
      end
      object N4: TMenuItem
        Action = actDebug
      end
      object N5: TMenuItem
        Action = actPrixodCreate
      end
      object N7: TMenuItem
        Action = actRasxodCreate
      end
    end
  end
  object frdDolgBux: TfrxDBDataset
    UserName = 'frdDolgBux'
    CloseDataSource = False
    Left = 104
    Top = 200
  end
  object qeRep: TQueryExtender
    Query = cdsRep
    KeyField = 'zak'
    Left = 264
    Top = 224
  end
  object sdsRep: TSQLDataSet
    CommandText = 
      'select id_tovar_out as id_tovar,'#13#10'  (select name from objects o ' +
      'where o.oid=r.id_tovar_out) as tovar,'#13#10'  z(sum(r.kolotp_bux)) as' +
      ' kolotp_bux,'#13#10'  z(sum(r.kolotp_all_sklads)) as kolotp_all_sklads' +
      ','#13#10'  z(sum(r.kolotp_sklad)) as kolotp_sklad,'#13#10'  z(sum(r.kolotp_a' +
      'll_sklads)) as kolotp_rest_sklads'#13#10'from rep_sklad_bux_vyravnivan' +
      'ie_pc('#13#10':id_sklad_bux, '#13#10':id_sklad_in,:id_sklad_rest_in,:id_tova' +
      'r_in, :id_izg_in,:id_schet_in,:id_tara_in,:dat_to) r'#13#10'group by i' +
      'd_tovar_out'#13#10'order by 2'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_sklad_bux'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_sklad_in'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_sklad_rest_in'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_tovar_in'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_izg_in'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_schet_in'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_tara_in'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'dat_to'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 264
    Top = 92
  end
  object dspRep: TDataSetProvider
    DataSet = sdsRep
    Options = [poAllowCommandText]
    Left = 264
    Top = 124
  end
  object cdsRep: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_TOVAR'
        DataType = ftInteger
      end
      item
        Name = 'TOVAR'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'KOLOTP_BUX'
        DataType = ftFloat
      end
      item
        Name = 'KOLOTP_ALL_SKLADS'
        DataType = ftFloat
      end
      item
        Name = 'KOLOTP_SKLAD'
        DataType = ftFloat
      end
      item
        Name = 'KOLOTP_REST_SKLADS'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_sklad_bux'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'id_sklad_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'id_sklad_rest_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'id_tovar_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'id_izg_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'id_schet_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'id_tara_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftDate
        Name = 'dat_to'
        ParamType = ptInput
        Value = Null
      end>
    ProviderName = 'dspRep'
    StoreDefs = True
    OnCalcFields = cdsRepCalcFields
    Left = 264
    Top = 156
    object cdsRepID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
      Visible = False
    end
    object cdsRepTOVAR: TStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      DisplayWidth = 25
      FieldName = 'TOVAR'
      Size = 50
    end
    object cdsRepKOLOTP_BUX: TFloatField
      DisplayLabel = #1054#1089#1090' '#1087#1086' '#1073#1091#1093
      FieldName = 'KOLOTP_BUX'
      DisplayFormat = '0.000'
    end
    object cdsRepKOLOTP_ALL_SKLADS: TFloatField
      FieldName = 'KOLOTP_ALL_SKLADS'
      Visible = False
    end
    object cdsRepKOLOTP_SKLAD: TFloatField
      DisplayLabel = #1054#1089#1090' '#1085#1072' '#1089#1082#1083
      FieldName = 'KOLOTP_SKLAD'
      DisplayFormat = '0.000'
    end
    object cdsRepKOLOTP_REST_SKLADS: TFloatField
      DisplayLabel = #1054#1089#1090' '#1085#1072' '#1076#1088#1091#1075#1080#1093' '#1089#1082#1083
      FieldName = 'KOLOTP_REST_SKLADS'
      DisplayFormat = '0.000'
    end
    object cdsRepDIFF: TFloatField
      DisplayLabel = #1056#1072#1079#1085#1080#1094#1072
      FieldKind = fkInternalCalc
      FieldName = 'DIFF'
      DisplayFormat = '0.000'
    end
  end
  object dsRep: TDataSource
    DataSet = cdsRep
    Left = 264
    Top = 188
  end
  object sdsPrixodCreate: TSQLDataSet
    CommandText = 
      'select id_nakl'#13#10'from rep_sklad_bux_vyr_prixod_pc(:dat,:id_izg,:i' +
      'd_sklad)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'dat'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_izg'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_sklad'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 300
    Top = 92
  end
  object sdsPrixodDetCreate: TSQLDataSet
    CommandText = 
      'insert into naklp_det_vw('#13#10'    ID_NAKL,'#13#10'    ID_TOVAR,'#13#10'    CENA' +
      ','#13#10'    KOLOTP'#13#10')'#13#10'values '#13#10' (:id_nakl,:id_tovar,:cena,:kolotp)'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_nakl'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_tovar'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'cena'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'kolotp'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 332
    Top = 92
  end
  object sdsRasxodCreate: TSQLDataSet
    CommandText = 
      'select id_nakl'#13#10'from rep_sklad_bux_vyr_rasxod_pc(:dat,:id_izg,:i' +
      'd_sklad)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'dat'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_izg'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_sklad'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 300
    Top = 128
  end
  object sdsRasxodDetCreate: TSQLDataSet
    CommandText = 
      'insert into NAKLR_DET_VW('#13#10'    ID_POS,'#13#10'    ID_NAKL,'#13#10'    ID_TOV' +
      'AR,'#13#10'    CENA,'#13#10'    KOLOTP'#13#10')'#13#10'values '#13#10' (:id_pos,'#13#10'  :id_nakl,'#13 +
      #10'  :id_tovar,'#13#10'  :cena,'#13#10'  :kolotp)'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_pos'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_nakl'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_tovar'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'cena'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'kolotp'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 332
    Top = 128
  end
end
