object frmSkladRasxEx: TfrmSkladRasxEx
  Left = 182
  Top = 196
  BorderStyle = bsDialog
  Caption = #1054#1090#1095#1105#1090' '#1087#1086' '#1088#1072#1089#1093#1086#1076#1091' '#1089#1086' '#1089#1082#1083#1072#1076#1072
  ClientHeight = 331
  ClientWidth = 510
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
  OnDestroy = FormDestroy
  DesignSize = (
    510
    331)
  PixelsPerInch = 96
  TextHeight = 13
  object dbhRasx: TDBGridEh
    Left = 0
    Top = 40
    Width = 509
    Height = 289
    AllowedOperations = []
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsRasx
    EditActions = [geaCopyEh, geaSelectAllEh]
    Flat = False
    FooterColor = clInfoBk
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 2
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
    OnDblClick = dbhRasxDblClick
    OnKeyDown = dbhRasxKeyDown
    Columns = <
      item
        EditButtons = <>
        FieldName = 'TOVAR'
        Footer.ValueType = fvtCount
        Footers = <
          item
            Value = #1042#1089#1077#1075#1086' '#1087#1086#1079#1080#1094#1080#1081
            ValueType = fvtStaticText
          end
          item
            ValueType = fvtCount
          end>
        Title.TitleButton = True
        Width = 204
      end
      item
        EditButtons = <>
        FieldName = 'KOLOTP'
        Footer.ValueType = fvtSum
        Footers = <
          item
            Value = #1054#1073#1097#1072#1103' '#1076#1083#1080#1085#1072
            ValueType = fvtStaticText
          end
          item
            ValueType = fvtSum
          end>
        Title.TitleButton = True
        Width = 75
      end
      item
        EditButtons = <>
        FieldName = 'SUM'
        Footers = <
          item
            Value = #1054#1073#1097#1072#1103' '#1089#1091#1084#1084#1072
            ValueType = fvtStaticText
          end
          item
            ValueType = fvtSum
          end>
      end
      item
        EditButtons = <>
        FieldName = 'COUNT_NUM'
        Footers = <
          item
            ValueType = fvtStaticText
          end
          item
          end>
        Width = 1
      end
      item
        EditButtons = <>
        FieldName = 'WEIGHT'
        Footers = <
          item
            Value = #1054#1073#1097#1080#1081' '#1074#1077#1089
            ValueType = fvtStaticText
          end
          item
            ValueType = fvtSum
          end>
      end>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 510
    Height = 39
    Align = alTop
    TabOrder = 1
    object BitBtn5: TBitBtn
      Left = 8
      Top = 9
      Width = 97
      Height = 25
      Action = actRefresh
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 0
      Kind = bkRetry
    end
    object BitBtn6: TBitBtn
      Left = 120
      Top = 9
      Width = 97
      Height = 25
      Action = actDetail
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      TabOrder = 1
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
    object BitBtn3: TBitBtn
      Left = 227
      Top = 9
      Width = 97
      Height = 25
      Action = actPreview
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      TabOrder = 2
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF00000000000000000000000000000000
        0000000000000000000000000000000000FF00FFFF00FFFF00FFFF00FF000000
        C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6000000C6C6
        C6000000FF00FFFF00FF00000000000000000000000000000000000000000000
        0000000000000000000000000000000000C6C6C6000000FF00FF000000C6C6C6
        C6C6C6C6C6C6C6C6C6C6C6C6C6C6C600FFFF00FFFF00FFFFC6C6C6C6C6C60000
        00000000000000FF00FF000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C684
        8484848484848484C6C6C6C6C6C6000000C6C6C6000000FF00FF000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00C6C6C6C6C6C6000000000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
        C6C6C6C6C6C6C6C6C6C6C6000000C6C6C6000000C6C6C6000000FF00FF000000
        000000000000000000000000000000000000000000000000000000C6C6C60000
        00C6C6C6000000000000FF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF000000C6C6C6000000C6C6C6000000FF00FFFF00FF
        FF00FF000000FFFFFF000000000000000000000000000000FFFFFF0000000000
        00000000000000FF00FFFF00FFFF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF000000FFFFFF000000000000000000000000000000FFFFFF0000
        00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0000000000000000000000000000000000000000000000
        00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object BitBtn4: TBitBtn
      Left = 334
      Top = 9
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
      OnExecute = actItogoExecute
    end
    object actPreview: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      ShortCut = 16471
      OnExecute = actPreviewExecute
    end
    object actDetail: TAction
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      ShortCut = 120
      OnExecute = actDetailExecute
    end
    object actWithoutTara: TAction
      Caption = #1041#1077#1079' '#1090#1072#1088#1099
      Checked = True
    end
    object actSettings: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      ImageIndex = 8
      OnExecute = actSettingsExecute
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
    ReportOptions.CreateDate = 38981.613542349540000000
    ReportOptions.LastChange = 38981.613542349540000000
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
      'select '#13#10'  t.name as tovar,'#13#10'  ot.id_tovar,'#13#10'  sum(ot.kolotp) as' +
      ' kolotp,'#13#10'  sum(Round(Round(ot.cena*(case when t2.tara=1 then 1 ' +
      'else om.kurs end),2)*ot.kolotp,2)*(1+om.nalog_nds)),'#13#10'  count(*)' +
      ' as count_num,'#13#10'  sum(ot.kolotp*t2.weight) as weight'#13#10'from'#13#10'  na' +
      'klo om'#13#10'  join naklot ot'#13#10'  on om.id_nakl=ot.id_nakl'#13#10'  inner jo' +
      'in objects t on t.oid=ot.id_tovar'#13#10'  inner join tovar t2 on t.oi' +
      'd=t2.oid'#13#10'where'#13#10'  om.posted=1'#13#10'group by'#13#10'  t.name,ot.id_tovar'#13#10 +
      'order by'#13#10'  t.name'
    MaxBlobSize = -1
    Params = <>
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
    Params = <>
    ProviderName = 'dspRasx'
    Left = 40
    Top = 128
    object cdsRasxTOVAR: TStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      DisplayWidth = 42
      FieldName = 'TOVAR'
      Size = 44
    end
    object cdsRasxKOLOTP: TFMTBCDField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      FieldName = 'KOLOTP'
      DisplayFormat = '0.000'
      Precision = 15
    end
    object cdsRasxID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
      Required = True
    end
    object cdsRasxSUM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 16
      FieldName = 'SUM'
      DisplayFormat = '0.00'
    end
    object cdsRasxCOUNT_NUM: TIntegerField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1088#1072#1079
      DisplayWidth = 1
      FieldName = 'COUNT_NUM'
      Required = True
      DisplayFormat = '0'
    end
    object cdsRasxWEIGHT: TFloatField
      DisplayLabel = #1042#1077#1089
      FieldName = 'WEIGHT'
      DisplayFormat = '0.'
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
    Section = 'TfrmSkladRasxEx'
    StorageManager = rpsSkladRasxDetEx
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
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
    Left = 224
    Top = 88
    object N5: TMenuItem
      Action = actDetail
      Default = True
    end
  end
end
