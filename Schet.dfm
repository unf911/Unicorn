object frmSchet: TfrmSchet
  Left = 380
  Top = 270
  BorderStyle = bsDialog
  Caption = #1057#1095#1077#1090#1072
  ClientHeight = 382
  ClientWidth = 639
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
  OnDeactivate = FormDeactivate
  DesignSize = (
    639
    382)
  PixelsPerInch = 96
  TextHeight = 13
  object dbgNaklr: TDBGridEh
    Left = 8
    Top = 24
    Width = 613
    Height = 120
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsNaklr
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgMultiSelect]
    PopupMenu = PopupMenu1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgNaklrDblClick
    OnExit = dbgNaklrExit
    OnKeyUp = dbgNaklrKeyUp
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ID'
        Footers = <>
        Width = 38
      end
      item
        ButtonStyle = cbsNone
        EditButtons = <>
        FieldName = 'DAT'
        Footers = <>
        Width = 47
      end
      item
        EditButtons = <>
        FieldName = 'IZG'
        Footers = <>
        ReadOnly = True
        Width = 116
      end
      item
        ButtonStyle = cbsNone
        EditButtons = <>
        FieldName = 'BANK'
        Footers = <>
        ReadOnly = True
        Width = 89
      end
      item
        EditButtons = <>
        FieldName = 'ZAK'
        Footers = <>
        ReadOnly = True
        Width = 116
      end
      item
        EditButtons = <>
        FieldName = 'MANAGER'
        Footers = <>
        ReadOnly = True
        Width = 69
      end
      item
        EditButtons = <>
        FieldName = 'KURS'
        Footers = <>
        Width = 53
      end
      item
        EditButtons = <>
        FieldName = 'NDS'
        Footers = <>
        ReadOnly = True
        Width = 69
      end>
  end
  object dbgNaklrt: TDBGridEh
    Left = 8
    Top = 151
    Width = 613
    Height = 158
    Anchors = [akLeft, akRight, akBottom]
    DataSource = dsNaklrt
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgNaklrtDblClick
    OnKeyUp = dbgNaklrtKeyUp
    Columns = <
      item
        EditButtons = <>
        FieldName = 'NPP'
        Footers = <>
        ReadOnly = True
        Width = 18
      end
      item
        EditButtons = <>
        FieldName = 'TOVAR'
        Footers = <>
        ReadOnly = True
        Width = 214
      end
      item
        EditButtons = <>
        FieldName = 'SKIDKA'
        Footers = <>
        Width = 35
      end
      item
        EditButtons = <>
        FieldName = 'CENA'
        Footers = <>
        Width = 74
      end
      item
        EditButtons = <>
        FieldName = 'CENANDS'
        Footers = <>
        Width = 74
      end
      item
        EditButtons = <>
        FieldName = 'KOLOTP'
        Footers = <>
        Width = 74
      end
      item
        EditButtons = <>
        FieldName = 'SUMA'
        Footers = <>
        Width = 74
      end
      item
        EditButtons = <>
        FieldName = 'SUMANDS'
        Footers = <>
        Width = 74
      end>
  end
  object Button1: TButton
    Left = 8
    Top = 0
    Width = 89
    Height = 17
    Action = actSettings
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    TabStop = False
  end
  object ulbListBox1: TUnfDbLookupListbox
    Left = 584
    Top = 24
    Width = 41
    Height = 43
    Anchors = [akTop, akRight, akBottom]
    TabOrder = 3
    Visible = False
    OnDblClick = ulbListBox1DblClick
    OnExit = ulbListBox1Exit
    OnKeyUp = ulbListBox1KeyUp
  end
  object Button2: TButton
    Left = 112
    Top = 0
    Width = 89
    Height = 17
    Action = actRefresh
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    TabStop = False
  end
  object ulbListBox2: TUnfDbLookupListbox
    Left = 584
    Top = 151
    Width = 41
    Height = 108
    Anchors = [akRight, akBottom]
    TabOrder = 5
    Visible = False
    OnDblClick = ulbListBox2DblClick
    OnExit = ulbListBox2Exit
    OnKeyUp = ulbListBox2KeyUp
  end
  object Panel1: TPanel
    Left = 272
    Top = 314
    Width = 363
    Height = 57
    Anchors = [akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 6
    DesignSize = (
      363
      57)
    object RadioGroup2: TRadioGroup
      Left = 112
      Top = 0
      Width = 249
      Height = 49
      Anchors = [akLeft, akBottom]
      TabOrder = 0
    end
    object rdbCol1: TRadioButton
      Left = 224
      Top = 8
      Width = 89
      Height = 17
      Action = actPostIf2
      Caption = #1050#1086#1083' 1'
      TabOrder = 1
    end
    object rdbCol3: TRadioButton
      Left = 296
      Top = 8
      Width = 57
      Height = 17
      Action = actPostIf2
      Caption = #1050#1086#1083' 3'
      TabOrder = 2
    end
    object rdbCol2: TRadioButton
      Left = 224
      Top = 24
      Width = 81
      Height = 17
      Action = actPostIf2
      Caption = #1050#1086#1083' 2'
      TabOrder = 3
    end
    object rdbCol4: TRadioButton
      Left = 296
      Top = 24
      Width = 57
      Height = 17
      Action = actPostIf2
      Caption = #1050#1086#1083' 4'
      TabOrder = 4
    end
    object rdbCol0: TRadioButton
      Left = 120
      Top = 8
      Width = 97
      Height = 17
      Action = actPostIf2
      Caption = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
      Checked = True
      TabOrder = 5
      TabStop = True
    end
  end
  object Button3: TButton
    Left = 40
    Top = 322
    Width = 137
    Height = 41
    Action = actRecalc
    Anchors = [akLeft, akBottom]
    TabOrder = 7
    TabStop = False
  end
  object Button4: TButton
    Left = 216
    Top = 0
    Width = 89
    Height = 17
    Action = actPreview
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    TabStop = False
  end
  object Button5: TButton
    Left = 320
    Top = 0
    Width = 89
    Height = 17
    Action = actPrint
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    TabStop = False
  end
  object dsNaklr: TDataSource
    DataSet = qurNaklr
    Left = 184
    Top = 240
  end
  object ActionList1: TActionList
    Left = 296
    Top = 48
    object actSettings: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      ShortCut = 16465
      OnExecute = actSettingsExecute
    end
    object actGrid1ListShow: TAction
      Caption = 'actGrid1ListShow'
      OnExecute = actGrid1ListShowExecute
    end
    object actPostIf: TAction
      Caption = 'actPostIf'
      OnExecute = actPostIfExecute
    end
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ShortCut = 116
      OnExecute = actRefreshExecute
    end
    object actGrid2ListShow: TAction
      Caption = 'actGrid2ListShow'
      OnExecute = actGrid2ListShowExecute
    end
    object actPostIf2: TAction
      Caption = 'actPostIf2'
      OnExecute = actPostIf2Execute
    end
    object actRecalc: TAction
      Caption = #1055#1086#1076#1089#1095#1080#1090#1072#1090#1100
      OnExecute = actRecalcExecute
    end
    object actAutoRecalc: TAction
      Caption = 'actAutoRecalc'
    end
    object actPreview: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      ShortCut = 16471
      OnExecute = actPreviewExecute
    end
    object actPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      ShortCut = 123
      OnExecute = actPrintExecute
    end
    object actCalculateSum: TAction
      Caption = 'actCalculateSum'
      OnExecute = actCalculateSumExecute
    end
    object actMakeSchetTop: TAction
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1096#1072#1087#1082#1091' '#1089#1095#1105#1090#1072
      OnExecute = actMakeSchetTopExecute
    end
    object actPreviewUsl: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1091#1089#1083#1091#1075
      OnExecute = actPreviewUslExecute
    end
    object actPrintUsl: TAction
      Caption = #1055#1077#1095#1072#1090#1100' '#1091#1089#1083#1091#1075
      OnExecute = actPrintUslExecute
    end
    object actCopySchet: TAction
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1089#1095#1077#1090#1072
      OnExecute = actCopySchetExecute
    end
  end
  object qeNaklo: TQueryExtender
    SlaveQueryExtender = qeNaklot
    Query = qurNaklr
    KeyField = 'schet'
    Left = 184
    Top = 272
  end
  object dsTemp: TDataSource
    DataSet = cdsTemp
    Left = 248
    Top = 240
  end
  object dsNaklrt: TDataSource
    DataSet = qurNaklrt
    Left = 216
    Top = 240
  end
  object dsTovar: TDataSource
    Left = 184
    Top = 80
  end
  object frNaklr: TfrxReport
    Version = '3.23.7'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38987.469603831000000000
    ReportOptions.LastChange = 40736.353696099500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      ''
      'procedure Memo53OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo19, Engine do begin'
      '   if <frdbNaklot."KOLOTP"> > 0 then'
      '     Font.Color := clBlack'
      '   else'
      '     Font.Color := clWhite;'
      '  end;'
      'end;'
      ''
      'procedure Memo54OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo20, Engine do begin'
      '   if <frdbNaklot."KOLOTP"> > 0 then'
      '     Font.Color := clBlack'
      '   else'
      '     Font.Color := clWhite;'
      '  end;'
      'end;'
      ''
      ''
      ''
      ''
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnBeginDoc = frNaklrBeginDoc
    OnEndDoc = frNaklrEndDoc
    OnGetValue = frNaklrGetValue
    Left = 328
    Top = 48
    Datasets = <
      item
        DataSet = frdbNaklo
        DataSetName = 'frDBNaklo'
      end
      item
        DataSet = frDBNaklot
        DataSetName = 'frDBNaklot'
      end>
    Variables = <
      item
        Name = ' AllVars'
        Value = Null
      end
      item
        Name = 'SUMA2'
        Value = Null
      end>
    Style = <>
  end
  object frDBNaklot: TfrxDBDataset
    UserName = 'frDBNaklot'
    CloseDataSource = False
    DataSource = dsNaklrt
    Left = 328
    Top = 80
  end
  object qeNaklot: TQueryExtender
    Query = qurNaklrt
    KeyField = 'sch'
    Left = 216
    Top = 272
  end
  object dspNaklr: TDataSetProvider
    DataSet = sdsNaklr
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 184
    Top = 176
  end
  object qurNaklr: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNaklr'
    AfterInsert = qurNaklrAfterInsert
    BeforePost = qurNaklrBeforePost
    BeforeDelete = qurNaklrBeforeDelete
    BeforeScroll = qurNaklrBeforeScroll
    OnReconcileError = qurNaklrReconcileError
    Left = 184
    Top = 208
    object qurNaklrID: TStringField
      DisplayLabel = #8470#1089#1095#1105#1090#1072
      DisplayWidth = 5
      FieldName = 'ID'
    end
    object qurNaklrDAT2: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DAT'
      DisplayFormat = 'dd.mm.yy'
      EditMask = '!99/99/00;1;_'
    end
    object qurNaklrIZG: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      DisplayWidth = 16
      FieldKind = fkLookup
      FieldName = 'IZG'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_IZG'
      Required = True
      Size = 50
      Lookup = True
    end
    object qurNaklrZAK: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      DisplayWidth = 16
      FieldKind = fkLookup
      FieldName = 'ZAK'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_ZAK'
      Required = True
      Size = 50
      Lookup = True
    end
    object qurNaklrMANAGER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      DisplayWidth = 9
      FieldKind = fkLookup
      FieldName = 'MANAGER'
      LookupDataSet = dmdEx.cdsManager
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_MANAGER'
      Required = True
      Size = 30
      Lookup = True
    end
    object qurNaklrID_IZG: TIntegerField
      FieldName = 'ID_IZG'
      Required = True
      Visible = False
    end
    object qurNaklrID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
      Required = True
      Visible = False
    end
    object qurNaklrID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
      Required = True
      Visible = False
    end
    object qurNaklrIZGFULLNAME: TStringField
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'IZGFULLNAME'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'FULLNAME'
      KeyFields = 'ID_IZG'
      Visible = False
      Size = 252
      Lookup = True
    end
    object qurNaklrZAKFULLNAME: TStringField
      FieldKind = fkLookup
      FieldName = 'ZAKFULLNAME'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'FULLNAME'
      KeyFields = 'ID_ZAK'
      Visible = False
      Size = 252
      Lookup = True
    end
    object qurNaklrKURS: TFloatField
      DisplayLabel = #1050#1091#1088#1089
      DisplayWidth = 7
      FieldName = 'KURS'
      DisplayFormat = '0.0000'
    end
    object qurNaklrNDS: TFMTBCDField
      DefaultExpression = '0'
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 8
      FieldName = 'NDS'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object qurNaklrVSEGO: TFMTBCDField
      FieldName = 'VSEGO'
      Precision = 15
      Size = 2
    end
    object qurNaklrNALOG_NDS: TFMTBCDField
      FieldName = 'NALOG_NDS'
      Required = True
      Visible = False
      Precision = 15
      Size = 2
    end
    object qurNaklrSCHET: TIntegerField
      FieldName = 'SCHET'
    end
    object qurNaklrID_BANK: TIntegerField
      FieldName = 'ID_BANK'
      Visible = False
    end
    object qurNaklrBANK: TStringField
      DisplayLabel = #1057#1095#1105#1090' '#1092#1080#1088#1084#1099
      FieldKind = fkLookup
      FieldName = 'BANK'
      LookupDataSet = dmdEx.cdsBank
      LookupKeyFields = 'OID'
      LookupResultField = 'FULLNAME'
      KeyFields = 'ID_BANK'
      Lookup = True
    end
  end
  object qurNaklrt: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'SCHET'
    MasterFields = 'SCHET'
    MasterSource = dsNaklr
    PacketRecords = 0
    Params = <
      item
        DataType = ftInteger
        Name = 'schet'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspNaklrt'
    AfterOpen = qurNaklrtAfterOpen
    BeforeInsert = qurNaklrtBeforeInsert
    AfterInsert = qurNaklrtAfterInsert
    BeforeEdit = qurNaklrtBeforeEdit
    BeforePost = qurNaklrtBeforePost
    BeforeDelete = qurNaklrtBeforeDelete
    AfterDelete = qurNaklrtAfterDelete
    BeforeScroll = qurNaklrtBeforeScroll
    AfterRefresh = qurNaklrtAfterRefresh
    OnCalcFields = qurNaklrtCalcFields
    OnReconcileError = qurNaklrtReconcileError
    Left = 216
    Top = 208
    object qurNaklrtNPP: TIntegerField
      DisplayLabel = #8470#1087'.'#1087'.'
      DisplayWidth = 2
      FieldName = 'NPP'
    end
    object qurNaklrtKODCN: TIntegerField
      DisplayWidth = 4
      FieldName = 'KODCN'
      Visible = False
    end
    object qurNaklrtEDIZ: TStringField
      FieldKind = fkLookup
      FieldName = 'EDIZ'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'EDIZ'
      KeyFields = 'ID_TOVAR'
      Visible = False
      Lookup = True
    end
    object qurNaklrtTARA: TIntegerField
      FieldKind = fkLookup
      FieldName = 'TARA'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'TARA'
      KeyFields = 'ID_TOVAR'
      Lookup = True
    end
    object qurNaklrtSCH: TIntegerField
      DisplayWidth = 6
      FieldName = 'SCH'
      Visible = False
    end
    object qurNaklrtFULLNAME: TStringField
      FieldKind = fkLookup
      FieldName = 'FULLNAME'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'FULLNAME'
      KeyFields = 'ID_TOVAR'
      Size = 250
      Lookup = True
    end
    object qurNaklrtTOVAR: TStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      DisplayWidth = 30
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
    object qurNaklrtSCHET: TIntegerField
      FieldName = 'SCHET'
      Visible = False
    end
    object qurNaklrtSKIDKA: TFMTBCDField
      DisplayLabel = #1057#1082#1080#1076#1082#1072
      DisplayWidth = 4
      FieldName = 'SKIDKA'
      OnChange = qurNaklrtSKIDKAChange
      DisplayFormat = '0.0'
      Size = 8
    end
    object qurNaklrtCENA: TFMTBCDField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'CENA'
      OnChange = qurNaklrtCENAChange
      DisplayFormat = '0.00'
      EditFormat = '0.00####'
      Size = 8
    end
    object qurNaklrtKOLOTP: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'KOLOTP'
      OnChange = qurNaklrtKOLOTPChange
      DisplayFormat = '0.000'
    end
    object qurNaklrtSUMA2: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldKind = fkInternalCalc
      FieldName = 'SUMA'
      OnChange = qurNaklrtSUMAChange
      DisplayFormat = '0.00'
    end
    object qurNaklrtID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
    end
    object qurNaklrtCENANDS: TFloatField
      DisplayLabel = #1062#1077#1085#1072'+'#1053#1044#1057
      DisplayWidth = 10
      FieldKind = fkInternalCalc
      FieldName = 'CENANDS'
      OnChange = qurNaklrtCENANDSChange
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object qurNaklrtSUMANDS: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072'+'#1053#1044#1057
      DisplayWidth = 10
      FieldKind = fkInternalCalc
      FieldName = 'SUMANDS'
      OnChange = qurNaklrtSUMANDSChange
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
  end
  object dspNaklrt: TDataSetProvider
    DataSet = sdsNaklrt
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 216
    Top = 176
  end
  object sdsNaklr: TSQLDataSet
    CommandText = 
      'select'#13#10'  om.schet,om.id,om.id_izg,om.id_zak,om.kurs,'#13#10'  om.id_m' +
      'anager,'#13#10'  om.nds,om.vsego,om.dat,'#13#10'  om.nalog_nds, om.id_bank'#13#10 +
      'from '#13#10'  SCHET om'#13#10'order by'#13#10'  om.dat,om.schet'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 184
    Top = 144
    object sdsNaklrSCHET: TIntegerField
      FieldName = 'SCHET'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsNaklrID: TStringField
      FieldName = 'ID'
      Size = 15
    end
    object sdsNaklrID_IZG: TIntegerField
      FieldName = 'ID_IZG'
    end
    object sdsNaklrID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
    end
    object sdsNaklrKURS: TFloatField
      FieldName = 'KURS'
    end
    object sdsNaklrID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
    end
    object sdsNaklrNDS: TFMTBCDField
      FieldName = 'NDS'
      Precision = 15
      Size = 2
    end
    object sdsNaklrVSEGO: TFMTBCDField
      FieldName = 'VSEGO'
      Precision = 15
      Size = 2
    end
    object sdsNaklrDAT: TSQLTimeStampField
      FieldName = 'DAT'
    end
    object sdsNaklrNALOG_NDS: TFMTBCDField
      FieldName = 'NALOG_NDS'
      Precision = 15
      Size = 2
    end
    object sdsNaklrID_BANK: TIntegerField
      FieldName = 'ID_BANK'
    end
  end
  object sdsNaklrt: TSQLDataSet
    CommandText = 
      'select '#13#10'  d.schet,d.npp,d.kodcn,'#13#10'  d.sch,d.id_tovar,'#13#10'  d.skid' +
      'ka,d.cena,'#13#10'  d.kolotp'#13#10'from'#13#10'  SCHETT d'#13#10'where'#13#10'  d.schet=:sche' +
      't'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'schet'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = dmdEx.scUchet
    Left = 216
    Top = 144
    object sdsNaklrtSCHET: TIntegerField
      FieldName = 'SCHET'
      Required = True
    end
    object sdsNaklrtNPP: TIntegerField
      FieldName = 'NPP'
    end
    object sdsNaklrtKODCN: TIntegerField
      FieldName = 'KODCN'
    end
    object sdsNaklrtSCH: TIntegerField
      FieldName = 'SCH'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsNaklrtID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
    end
    object sdsNaklrtSKIDKA: TFMTBCDField
      FieldName = 'SKIDKA'
      Precision = 15
      Size = 2
    end
    object sdsNaklrtKOLOTP: TFloatField
      FieldName = 'KOLOTP'
    end
    object sdsNaklrtCENA: TFMTBCDField
      FieldName = 'CENA'
      Precision = 15
      Size = 8
    end
  end
  object sdsTemp: TSQLDataSet
    CommandText = 
      'select '#13#10'  s.schet,s.id,s.izg,s.zak,s.kurs,'#13#10'  s.auther,'#13#10'  s.nd' +
      's,s.vsego,s.dat,'#13#10'  s.nalog_nds, s.sch,s.id_bank'#13#10'from '#13#10'  SCHET' +
      ' s '#13#10'order by'#13#10'  s.dat,s.schet'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 248
    Top = 144
  end
  object dspTemp: TDataSetProvider
    DataSet = sdsTemp
    Options = [poAllowCommandText]
    Left = 248
    Top = 176
  end
  object cdsTemp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTemp'
    Left = 248
    Top = 208
  end
  object sdsTemp2: TSQLDataSet
    CommandText = 
      'select '#13#10'  s.schet,s.id,s.izg,s.zak,s.kurs,'#13#10'  s.auther,'#13#10'  s.nd' +
      's,s.vsego,s.dat,'#13#10'  s.nalog_nds, s.sch,s.id_bank'#13#10'from '#13#10'  SCHET' +
      ' s '#13#10'order by'#13#10'  s.dat,s.schet'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 280
    Top = 144
  end
  object dspTemp2: TDataSetProvider
    DataSet = sdsTemp2
    Options = [poAllowCommandText]
    Left = 280
    Top = 176
  end
  object cdsTemp2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTemp2'
    Left = 280
    Top = 208
  end
  object dsTemp2: TDataSource
    DataSet = cdsTemp2
    Left = 280
    Top = 240
  end
  object sdsOrder: TSQLDataSet
    CommandText = 'SCHET_ORDER_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_NAKL'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 344
    Top = 144
    object IntegerField1: TIntegerField
      FieldName = 'ID_NAKL'
      Required = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'ID_NAKLD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField3: TIntegerField
      FieldName = 'ID_POS'
      Required = True
    end
    object SmallintField1: TSmallintField
      FieldName = 'KODCN'
    end
    object IntegerField4: TIntegerField
      FieldName = 'ID_TOVAR'
      Required = True
    end
    object FMTBCDField1: TFMTBCDField
      FieldName = 'SKIDKA'
      Precision = 15
      Size = 2
    end
    object FMTBCDField2: TFMTBCDField
      FieldName = 'CENA'
      Precision = 15
      Size = 8
    end
    object FMTBCDField3: TFMTBCDField
      FieldName = 'KOLOTP'
      Precision = 15
      Size = 8
    end
  end
  object MainMenu1: TMainMenu
    Left = 376
    Top = 144
    object mnuActions: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      GroupIndex = 10
      object N3: TMenuItem
        Action = actPreview
      end
      object N4: TMenuItem
        Action = actPrint
      end
      object N1: TMenuItem
        Action = actRefresh
      end
      object N5: TMenuItem
        Action = actSettings
      end
      object N6: TMenuItem
        Action = actMakeSchetTop
      end
      object N7: TMenuItem
        Action = actPreviewUsl
      end
      object N8: TMenuItem
        Action = actPrintUsl
      end
      object N9: TMenuItem
        Action = actCopySchet
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 296
    Top = 80
    object N2: TMenuItem
      Action = actMakeSchetTop
    end
    object N10: TMenuItem
      Action = actCopySchet
    end
  end
  object frdbNaklo: TfrxDBDataset
    UserName = 'frDBNaklo'
    CloseDataSource = False
    DataSource = dsNaklr
    Left = 360
    Top = 80
  end
  object frxGIFExport1: TfrxGIFExport
    UseFileCache = True
    ShowProgress = False
    Monochrome = True
    Left = 392
    Top = 80
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
    Left = 184
    Top = 112
  end
  object UnfFilter2: TUnfFilter
    DBGridEh = dbgNaklrt
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
    Left = 216
    Top = 112
  end
  object sdsSchetMakeFromSchet: TSQLDataSet
    CommandText = 'SCHET_MAKE_FROM_SCHET'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_NAKL_IN'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DAT_NEW'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_TOVAR_FROM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_TOVAR_TO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_NAKL'
        ParamType = ptOutput
        Size = 4
      end>
    SQLConnection = dmdEx.scUchet
    Left = 312
    Top = 144
  end
end
