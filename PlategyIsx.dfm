object frmPlategyIsx: TfrmPlategyIsx
  Left = 32
  Top = 164
  BorderStyle = bsDialog
  Caption = #1048#1089#1093#1086#1076#1103#1097#1080#1077' '#1087#1083#1072#1090#1077#1078#1080
  ClientHeight = 360
  ClientWidth = 626
  Color = clBtnFace
  Constraints.MinHeight = 362
  Constraints.MinWidth = 479
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
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 337
    Width = 626
    Height = 23
    Panels = <>
    SimplePanel = True
  end
  object dbgNaklo: TDBGridEh
    Left = 0
    Top = 0
    Width = 532
    Height = 337
    Align = alClient
    DataSource = dsNaklo
    EditActions = [geaCopyEh, geaSelectAllEh]
    Flat = False
    FooterColor = clInfoBk
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight]
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
    OnDblClick = dbgNakloDblClick
    OnKeyDown = dbgNakloKeyDown
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ID'
        Footer.ValueType = fvtCount
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'DAT'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'IZG'
        Footers = <>
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'ZAK'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'BANK_FROM'
        Footers = <>
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'MANAGER'
        Footers = <>
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'CURRENCY'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'NDS'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 67
      end
      item
        Checkboxes = True
        EditButtons = <>
        FieldName = 'POSTED'
        Footers = <>
        KeyList.Strings = (
          '1'
          '0')
        MaxWidth = 16
      end
      item
        EditButtons = <>
        FieldName = 'COMMENT'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'XOZ_OPER'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'ZATRATY'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'CURRENCY_TO'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'ID_NAKL'
        Footers = <>
        Visible = False
      end>
  end
  object Panel4: TPanel
    Left = 532
    Top = 0
    Width = 94
    Height = 337
    Align = alRight
    BevelOuter = bvNone
    Constraints.MinHeight = 150
    TabOrder = 1
    DesignSize = (
      94
      337)
    object BitBtn2: TBitBtn
      Left = 3
      Top = 0
      Width = 89
      Height = 33
      Action = actPost
      Anchors = [akLeft, akTop, akRight]
      Caption = #1055#1088#1086#1074#1077#1089#1090#1080
      TabOrder = 0
      TabStop = False
    end
    object btnUnpost: TBitBtn
      Left = 3
      Top = 40
      Width = 89
      Height = 33
      Action = actUnpost
      Anchors = [akLeft, akTop, akRight]
      Caption = #1042#1077#1088#1085#1091#1090#1100
      TabOrder = 1
      TabStop = False
    end
    object BitBtn7: TBitBtn
      Left = 3
      Top = 80
      Width = 89
      Height = 25
      Action = actRefresh
      Anchors = [akLeft, akTop, akRight]
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 2
      TabStop = False
      Kind = bkRetry
    end
    object BitBtn3: TBitBtn
      Left = 3
      Top = 145
      Width = 89
      Height = 25
      Action = actShowDet
      Anchors = [akLeft, akTop, akRight]
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      TabOrder = 3
      TabStop = False
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
      Left = 3
      Top = 113
      Width = 89
      Height = 25
      Action = actSettings
      Anchors = [akLeft, akTop, akRight]
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      TabOrder = 4
      TabStop = False
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
  object ActionList1: TActionList
    Images = dmdEx.ImageList1
    Left = 192
    Top = 56
    object actFullTransh: TAction
      Caption = '&'#1054#1087#1083#1072#1090#1080#1090#1100
      ShortCut = 32842
    end
    object actPartTransh: TAction
      Caption = #1063#1072#1089#1090#1080#1095#1085#1086' '#1086#1087'&'#1083#1072#1090#1080#1090#1100
      ShortCut = 32843
    end
    object actClearNakl: TAction
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100' &'#1085#1072#1082#1083#1072#1076#1085#1091#1102
      ShortCut = 32857
    end
    object actClearOpl: TAction
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100' &'#1087#1083#1072#1090#1105#1078
      ShortCut = 32839
    end
    object actGrid1ListShow: TAction
      Caption = 'actGrid1ListShow'
      OnExecute = actGrid1ListShowExecute
    end
    object actClearOplaty: TAction
      Caption = 'actClearOplaty'
    end
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 9
      ShortCut = 116
      OnExecute = actRefreshExecute
    end
    object actShowDet: TAction
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      Hint = #1044#1077#1090#1072#1083#1100#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1087#1086' '#1087#1083#1072#1090#1077#1078#1091' '#1080' '#1085#1072#1082#1083#1072#1076#1085#1086#1081' (F9)'
      ImageIndex = 5
      OnExecute = actShowDetExecute
    end
    object actNerazn: TAction
      Caption = #1053#1077#1088#1072#1079#1085#1077#1089#1077#1085#1085#1086
      Hint = 
        #1055#1088#1080' '#1074#1082#1083#1102#1095#1077#1085#1080#1080' '#1074#1080#1076#1085#1099' '#1087#1083#1072#1090#1077#1078#1080' '#1074' '#1082#1086#1090#1086#1088#1099#1093' '#1090#1088#1077#1073#1091#1077#1090#1089#1103' '#1079#1072#1087#1086#1083#1085#1080#1090#1100' '#1087#1086#1083#1077' "' +
        #1063#1100#1103' '#1087#1088#1077#1076#1086#1087#1083#1072#1090#1072'"'
    end
    object actAllOpl: TAction
      Caption = #1042#1089#1077' '#1087#1083#1072#1090#1077#1078#1080'/'#1087#1088#1077#1076
      Checked = True
      Hint = 
        #1055#1088#1080' '#1074#1099#1082#1083#1102#1095#1077#1085#1080#1080' '#1074#1080#1076#1085#1099' '#1074#1089#1077' '#1087#1088#1077#1086#1087#1083#1072#1090#1099' '#1082#1086#1090#1086#1088#1099#1077' '#1084#1086#1078#1085#1086' '#1088#1072#1079#1085#1077#1089#1090#1080' '#1087#1086' '#1085#1072#1082 +
        #1083#1072#1076#1085#1099#1084
    end
    object actAllNakl: TAction
      Caption = #1042#1089#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077
      Checked = True
      Hint = #1055#1088#1080' '#1074#1099#1082#1083#1102#1095#1077#1085#1080#1080' '#1074#1080#1076#1085#1099' '#1090#1086#1083#1100#1082#1086' '#1085#1077#1086#1087#1083#1072#1095#1077#1085#1085#1099#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077
    end
    object actSettings: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      Hint = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1077#1088#1080#1086#1076#1072' '#1074#1088#1077#1084#1077#1085#1080
      ImageIndex = 8
      ShortCut = 16465
      OnExecute = actSettingsExecute
    end
    object actApply: TAction
      Caption = 'actApply'
      OnExecute = actApplyExecute
    end
    object actFinance: TAction
      Caption = #1060#1080#1085#1072#1085#1089#1086#1074#1099#1081' '#1087#1083#1072#1090#1105#1078
    end
    object actPost: TAction
      Caption = #1055#1088#1086#1074#1077#1089#1090#1080
      OnExecute = actPostExecute
    end
    object actUnpost: TAction
      Caption = #1042#1077#1088#1085#1091#1090#1100
      OnExecute = actUnpostExecute
    end
    object actShowDeleted: TAction
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1091#1076#1072#1083#1105#1085#1085#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
      OnExecute = actShowDeletedExecute
    end
    object actUndeleteNakl: TAction
      Caption = #1042#1077#1088#1085#1091#1090#1100' '#1091#1076#1072#1083#1105#1085#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      Visible = False
      OnExecute = actUndeleteNaklExecute
    end
    object actKursChange: TAction
      Caption = 'actKursChange'
    end
    object actDebug: TAction
      Caption = #1056#1077#1078#1080#1084' '#1086#1090#1083#1072#1076#1082#1080
      OnExecute = actDebugExecute
    end
    object actCreateNaklpBux: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1087#1088#1080#1093#1086#1076#1085#1091#1102' '#1073#1091#1093' '#1085#1072#1082#1083
      OnExecute = actCreateNaklpBuxExecute
    end
    object actMakePlategyIsx: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1087#1083#1072#1090#1105#1078' '#1085#1072' '#1086#1089#1085#1086#1074#1072#1085#1080#1080'...'
      OnExecute = actMakePlategyIsxExecute
    end
    object actMakePlategFromPlateg: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1087#1083#1072#1090#1105#1078' '#1085#1072' '#1086#1089#1085#1086#1074#1072#1085#1080#1080'...'
      OnExecute = actMakePlategFromPlategExecute
    end
    object actCreateNaklpu: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1087#1088#1080#1093#1086#1076#1085#1091#1102' '#1085#1072#1082#1083' '#1085#1072' '#1091#1089#1083#1091#1075#1080
      OnExecute = actCreateNaklpuExecute
    end
    object actCreatePlategyIsx: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1080#1089#1093#1086#1076#1103#1097#1080#1081' '#1087#1083#1072#1090#1105#1078
      OnExecute = actCreatePlategyIsxExecute
    end
  end
  object dsNaklo: TDataSource
    DataSet = cdsNaklo
    Left = 64
    Top = 56
  end
  object qeNaklot: TQueryExtender
    KeyField = 'nakl'
    Left = 96
    Top = 120
  end
  object MainMenu1: TMainMenu
    Left = 256
    Top = 24
    object N1: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      GroupIndex = 10
      object N4: TMenuItem
        Action = actRefresh
        GroupIndex = 7
      end
      object N3: TMenuItem
        Action = actSettings
        GroupIndex = 7
      end
      object N12: TMenuItem
        Action = actShowDet
        GroupIndex = 7
      end
      object N7: TMenuItem
        Action = actCreateNaklpBux
        GroupIndex = 7
      end
      object N5: TMenuItem
        Action = actShowDeleted
        GroupIndex = 7
      end
      object N6: TMenuItem
        Action = actUndeleteNakl
        GroupIndex = 7
      end
      object N2: TMenuItem
        Action = actDebug
        GroupIndex = 7
      end
    end
  end
  object sdsPlat: TSQLDataSet
    CommandText = 
      'select'#13#10'  id_nakl,dat,id_zak,id_izg,nds,comment, id_manager,id,'#13 +
      #10'  posted,id_sklad,parent_id_nakl,zatraty,kurs,id_currency,'#13#10'  i' +
      'd_currency_to,kurs_indirect,nds_from,id_sklad_to'#13#10'from PLATEGY_V' +
      'W om'#13#10'order by om.dat,om.id_nakl'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 64
    Top = 184
    object sdsPlatDAT: TSQLTimeStampField
      FieldName = 'DAT'
      Required = True
    end
    object sdsPlatID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
    end
    object sdsPlatID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
    end
    object sdsPlatID_IZG: TIntegerField
      FieldName = 'ID_IZG'
    end
    object sdsPlatID: TStringField
      FieldName = 'ID'
    end
    object sdsPlatPOSTED: TSmallintField
      FieldName = 'POSTED'
      ProviderFlags = []
      Required = True
    end
    object sdsPlatID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsPlatNDS: TFMTBCDField
      FieldName = 'NDS'
      Required = True
      Precision = 15
    end
    object sdsPlatCOMMENT: TStringField
      FieldName = 'COMMENT'
      Size = 50
    end
    object sdsPlatID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
    end
    object sdsPlatPARENT_ID_NAKL: TIntegerField
      FieldName = 'PARENT_ID_NAKL'
    end
    object sdsPlatZATRATY: TFMTBCDField
      FieldName = 'ZATRATY'
      Precision = 15
    end
    object sdsPlatKURS: TFloatField
      FieldName = 'KURS'
      Required = True
    end
    object sdsPlatID_CURRENCY: TSmallintField
      FieldName = 'ID_CURRENCY'
      Required = True
    end
    object sdsPlatID_CURRENCY_TO: TIntegerField
      FieldName = 'ID_CURRENCY_TO'
    end
    object sdsPlatKURS_INDIRECT: TSmallintField
      FieldName = 'KURS_INDIRECT'
    end
    object sdsPlatNDS_FROM: TFMTBCDField
      FieldName = 'NDS_FROM'
      Precision = 15
    end
    object sdsPlatID_SKLAD_TO: TIntegerField
      FieldName = 'ID_SKLAD_TO'
    end
  end
  object dspPlat: TDataSetProvider
    DataSet = sdsPlat
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspPlatBeforeUpdateRecord
    Left = 64
    Top = 216
  end
  object cdsNaklo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPlat'
    AfterInsert = cdsNakloAfterInsert
    BeforeScroll = cdsNakloBeforeScroll
    OnReconcileError = cdsNakloReconcileError
    Left = 64
    Top = 248
    object cdsNakloID: TStringField
      DisplayLabel = #8470#1087#1083#1072#1090
      DisplayWidth = 7
      FieldName = 'ID'
    end
    object cdsNakloIDI: TIntegerField
      DisplayLabel = #8470#1087#1083#1072#1090
      FieldName = 'ID_NAKL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object cdsNakloDAT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 10
      FieldName = 'DAT'
      Required = True
      DisplayFormat = 'dd.mm.yy'
      EditMask = '!99/99/00;1;_'
    end
    object cdsNakloIZG: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'IZG'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_IZG'
      Size = 50
      Lookup = True
    end
    object cdsNakloBANK_FROM: TStringField
      DisplayLabel = #1057#1095#1105#1090' '#1092#1080#1088#1084#1099
      FieldKind = fkLookup
      FieldName = 'BANK_FROM'
      LookupDataSet = dmdEx.cdsBank
      LookupKeyFields = 'OID'
      LookupResultField = 'FULLNAME'
      KeyFields = 'ID_SKLAD'
      Lookup = True
    end
    object cdsNakloZAK: TStringField
      DisplayLabel = #1060#1080#1088#1084#1072
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'ZAK'
      LookupDataSet = dmdEx.cdsVlad
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_ZAK'
      Size = 50
      Lookup = True
    end
    object cdsNakloID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
      Visible = False
    end
    object cdsNakloMANAGER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'MANAGER'
      LookupDataSet = dmdEx.cdsManager
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_MANAGER'
      Lookup = True
    end
    object cdsNakloID_IZG: TIntegerField
      FieldName = 'ID_IZG'
      Visible = False
    end
    object cdsNakloOPL: TFMTBCDField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1079#1072#1095#1080#1089#1083#1077#1085#1080#1103
      DisplayWidth = 10
      FieldName = 'NDS'
      Required = True
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 15
    end
    object cdsNakloPRIM: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      DisplayWidth = 15
      FieldName = 'COMMENT'
      Size = 50
    end
    object cdsNakloID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
      Visible = False
    end
    object cdsNakloPOSTED: TSmallintField
      DisplayLabel = #1055#1088#1086#1074#1077#1076#1077#1085#1086
      DisplayWidth = 2
      FieldName = 'POSTED'
      ProviderFlags = [pfInWhere]
      Required = True
    end
    object cdsNakloID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
    end
    object cdsNakloPARENT_ID_NAKL: TIntegerField
      FieldName = 'PARENT_ID_NAKL'
    end
    object cdsNakloZATRATY: TFMTBCDField
      DisplayLabel = #1050#1086#1084#1080#1089#1089#1080#1103', %'
      FieldName = 'ZATRATY'
      DisplayFormat = '0.00'
      Precision = 15
    end
    object cdsNakloKURS: TFloatField
      DisplayLabel = #1050#1091#1088#1089
      FieldName = 'KURS'
      Required = True
      DisplayFormat = '0.0000'
    end
    object cdsNakloCURRENCY: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      DisplayWidth = 5
      FieldKind = fkLookup
      FieldName = 'CURRENCY'
      LookupDataSet = dmdEx.cdsCurrency
      LookupKeyFields = 'OID'
      LookupResultField = 'FULLNAME'
      KeyFields = 'ID_CURRENCY'
      Lookup = True
    end
    object cdsNakloID_CURRENCY: TSmallintField
      FieldName = 'ID_CURRENCY'
      Required = True
    end
    object cdsNakloCURRENCY_TO: TStringField
      DisplayLabel = #1040#1075#1077#1085#1090
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'CURRENCY_TO'
      LookupDataSet = dmdEx.cdsAgent
      LookupKeyFields = 'OID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_CURRENCY_TO'
      Size = 50
      Lookup = True
    end
    object cdsNakloID_CURRENCY_TO: TIntegerField
      FieldName = 'ID_CURRENCY_TO'
    end
    object cdsNakloKURS_INDIRECT: TSmallintField
      FieldName = 'KURS_INDIRECT'
    end
    object cdsNakloNDS_FROM: TFMTBCDField
      FieldName = 'NDS_FROM'
      Precision = 15
    end
    object cdsNakloID_SKLAD_TO: TIntegerField
      FieldName = 'ID_SKLAD_TO'
    end
    object cdsNakloXOZ_OPER: TStringField
      DisplayLabel = #1061#1086#1079#1086#1087#1077#1088#1072#1094#1080#1103
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'XOZ_OPER'
      LookupDataSet = cdsXozOper
      LookupKeyFields = 'OID'
      LookupResultField = 'FULLNAME'
      KeyFields = 'ID_SKLAD_TO'
      Size = 50
      Lookup = True
    end
  end
  object qeNaklo: TQueryExtender
    Query = cdsNaklo
    KeyField = 'id_nakl'
    Left = 64
    Top = 120
  end
  object sdsDelmark: TSQLDataSet
    CommandText = 'PLATEGY_DELMARK_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_NAKL'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 128
    Top = 184
  end
  object sdsPost: TSQLDataSet
    CommandText = 'PLATEGY_POST_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_NAKL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_SCHET'
        ParamType = ptInput
        Value = Null
      end>
    SQLConnection = dmdEx.scUchet
    Left = 160
    Top = 184
  end
  object sdsUnpost: TSQLDataSet
    CommandText = 'PLATEGY_UNPOST_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_NAKL'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 192
    Top = 184
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmPlategy'
    StorageManager = rpsClientEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      '<P>.WindowState'
      'dbgNaklo.<P>.Columns.<ForAllItems>.Width')
    Left = 64
    Top = 152
  end
  object rpsClientEdit: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 96
    Top = 152
  end
  object UnfFilter1: TUnfFilter
    DBGridEh = dbgNaklo
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
    Left = 64
    Top = 88
  end
  object sdsXozoper: TSQLDataSet
    CommandText = 
      'select *'#13#10'from spr_xozoper_vw s'#13#10'where s.delmarked=0'#13#10'  and s.ti' +
      'p_document=(select oid'#13#10'    from get_oid_objects_pc('#39#1054#1055#1051#1040#1058#1067' '#1048#1057#1061#1054 +
      #1044#1071#1065#1048#1045#39',-100))'#13#10'order by s.name'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 224
    Top = 176
  end
  object dspXozOper: TDataSetProvider
    DataSet = sdsXozoper
    Left = 224
    Top = 208
  end
  object cdsXozOper: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspXozOper'
    Left = 224
    Top = 240
    object cdsXozOperOID: TIntegerField
      FieldName = 'OID'
    end
    object cdsXozOperNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
    object cdsXozOperFULLNAME: TStringField
      FieldName = 'FULLNAME'
      Size = 250
    end
  end
  object dsXozOper: TDataSource
    DataSet = cdsXozOper
    Left = 224
    Top = 272
  end
  object PopupMenu1: TPopupMenu
    Left = 256
    Top = 60
    object N11: TMenuItem
      Action = actShowDet
    end
    object N8: TMenuItem
      Action = actCreateNaklpBux
    end
    object N9: TMenuItem
      Action = actCreateNaklpu
    end
    object N10: TMenuItem
      Action = actCreatePlategyIsx
    end
  end
end
