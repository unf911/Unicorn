object frmNNakl: TfrmNNakl
  Left = 64
  Top = 210
  BorderStyle = bsDialog
  Caption = #1053#1072#1083#1086#1075#1086#1074#1099#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077
  ClientHeight = 409
  ClientWidth = 657
  Color = clBtnFace
  Constraints.MinHeight = 447
  Constraints.MinWidth = 641
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
    657
    409)
  PixelsPerInch = 96
  TextHeight = 13
  object dbgNaklr: TDBGridEh
    Left = 8
    Top = 24
    Width = 631
    Height = 148
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
    PopupMenu = ppmNaklr
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgNaklrDblClick
    OnEnter = dbgNaklrEnter
    OnKeyUp = dbgNaklrKeyUp
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ID2'
        Footers = <>
        Width = 33
      end
      item
        ButtonStyle = cbsNone
        EditButtons = <>
        FieldName = 'DAT'
        Footers = <>
        Width = 45
      end
      item
        EditButtons = <>
        FieldName = 'IZG'
        Footers = <>
        ReadOnly = True
        Width = 98
      end
      item
        EditButtons = <>
        FieldName = 'ZAK'
        Footers = <>
        ReadOnly = True
        Width = 111
      end
      item
        EditButtons = <>
        FieldName = 'MANAGER'
        Footers = <>
        ReadOnly = True
        Width = 58
      end
      item
        EditButtons = <>
        FieldName = 'KURS'
        Footers = <>
        Width = 45
      end
      item
        EditButtons = <>
        FieldName = 'NALOG_NDS'
        Footers = <>
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'NDS'
        Footers = <>
        ReadOnly = True
        Width = 69
      end
      item
        EditButtons = <>
        FieldName = 'VIDOPL'
        Footers = <>
        Width = 26
      end
      item
        EditButtons = <>
        FieldName = 'USL'
        Footers = <>
        Width = 78
      end
      item
        EditButtons = <>
        FieldName = 'TIPNAME'
        Footers = <>
        ReadOnly = True
        Width = 109
      end
      item
        EditButtons = <>
        FieldName = 'SIGNATURE'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'DOGOVOR'
        Footers = <>
        ReadOnly = True
      end>
  end
  object dbgNaklrt: TDBGridEh
    Left = 8
    Top = 177
    Width = 631
    Height = 164
    Anchors = [akLeft, akRight, akBottom]
    DataSource = dsNaklrt
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgNaklrtDblClick
    OnEnter = dbgNaklrtEnter
    OnKeyDown = dbgNaklrtKeyDown
    OnKeyUp = dbgNaklrtKeyUp
    Columns = <
      item
        EditButtons = <>
        FieldName = 'NPP'
        Footers = <>
        Width = 28
      end
      item
        EditButtons = <>
        FieldName = 'TOVAR'
        Footers = <>
        ReadOnly = True
        Width = 154
      end
      item
        EditButtons = <>
        FieldName = 'SKIDKA'
        Footers = <>
        Width = 41
      end
      item
        EditButtons = <>
        FieldName = 'CENA'
        Footers = <>
        Width = 58
      end
      item
        EditButtons = <>
        FieldName = 'NDS'
        Footers = <>
        Width = 72
      end
      item
        EditButtons = <>
        FieldName = 'KOLOTP'
        Footers = <>
        Width = 55
      end
      item
        EditButtons = <>
        FieldName = 'SUMA2'
        Footers = <>
        Width = 62
      end
      item
        EditButtons = <>
        FieldName = 'VSEGO'
        Footers = <>
        Width = 77
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
  end
  object ulbListBox1: TUnfDbLookupListbox
    Left = 602
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
  end
  object ulbListBox2: TUnfDbLookupListbox
    Left = 602
    Top = 181
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
    Left = 280
    Top = 347
    Width = 373
    Height = 57
    Anchors = [akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 6
    Visible = False
    DesignSize = (
      373
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
      Top = 12
      Width = 89
      Height = 17
      Action = actPostIf2
      Caption = #1050#1086#1083' 1'
      TabOrder = 1
    end
    object rdbCol3: TRadioButton
      Left = 296
      Top = 12
      Width = 57
      Height = 17
      Action = actPostIf2
      Caption = #1050#1086#1083' 3'
      TabOrder = 2
    end
    object rdbCol2: TRadioButton
      Left = 224
      Top = 28
      Width = 81
      Height = 17
      Action = actPostIf2
      Caption = #1050#1086#1083' 2'
      TabOrder = 3
    end
    object rdbCol4: TRadioButton
      Left = 296
      Top = 28
      Width = 57
      Height = 17
      Action = actPostIf2
      Caption = #1050#1086#1083' 4'
      TabOrder = 4
    end
    object rdbCol0: TRadioButton
      Left = 120
      Top = 12
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
    Left = 16
    Top = 360
    Width = 137
    Height = 41
    Action = actRecalc
    Anchors = [akLeft, akBottom]
    TabOrder = 7
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
  end
  object Button6: TButton
    Left = 424
    Top = 0
    Width = 89
    Height = 17
    Action = actSchet
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
  end
  object Button7: TButton
    Left = 528
    Top = 0
    Width = 89
    Height = 17
    Action = actMarkCorrect
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
  end
  object dsNaklr: TDataSource
    DataSet = cdsNaklr
    Left = 96
    Top = 304
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
    object actSchet: TAction
      Caption = #1048#1079' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      ShortCut = 120
      OnExecute = actSchetExecute
    end
    object actCalculateSum: TAction
      Caption = 'actCalculateSum'
      OnExecute = actCalculateSumExecute
    end
    object actMarkCorrect: TAction
      Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072
      Hint = #1055#1086#1084#1077#1090#1080#1090#1100' '#1080#1083#1080' '#1089#1085#1103#1090#1100' '#1087#1086#1084#1077#1090#1082#1091' '#1086' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1077'.'
      OnExecute = actMarkCorrectExecute
    end
    object actMakeNNaklrFromNNaklr: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1085#1072#1083#1086#1075#1086#1074#1091#1102' '#1085#1072' '#1086#1089#1085#1086#1074#1072#1085#1080#1080'...'
      OnExecute = actMakeNNaklrFromNNaklrExecute
    end
    object actPreviewOld: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1089#1090#1072#1088#1086#1081' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      OnExecute = actPreviewOldExecute
    end
    object actPreviewCopy: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1082#1086#1087#1080#1080
      OnExecute = actPreviewCopyExecute
    end
    object actPrintCopy: TAction
      Caption = #1055#1077#1095#1072#1090#1100' '#1082#1086#1087#1080#1080
      OnExecute = actPrintCopyExecute
    end
    object actGenerateXML: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100' XML'
      OnExecute = actGenerateXMLExecute
    end
  end
  object qeNaklr: TQueryExtender
    SlaveQueryExtender = qeNaklrt
    Query = cdsNaklr
    KeyField = 'schet'
    Left = 96
    Top = 144
  end
  object dsTemp: TDataSource
    Left = 296
    Top = 80
  end
  object dsNaklrt: TDataSource
    DataSet = cdsNaklrt
    Left = 128
    Top = 304
  end
  object frdNaklot: TfrxDBDataset
    UserName = 'frdNaklot'
    CloseDataSource = False
    DataSource = dsNaklrt
    Left = 328
    Top = 80
  end
  object frNaklr: TfrxReport
    Version = '3.23.7'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38985.430610532400000000
    ReportOptions.LastChange = 41434.942259363420000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Memo23OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo23, Engine do begin'
      '    set(<datvis>, 1);'
      '  end'
      'end;'
      ''
      'procedure Memo28OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo28, Engine do begin'
      '    if <frdNaklot."KOLOTP"> > 0 then'
      '      Font.Color := clBlack'
      '    else'
      '      Font.Color := clWhite;'
      '  end'
      'end;'
      ''
      'procedure Memo29OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo29, Engine do'
      '  begin'
      '    if <frdNaklot."KOLOTP"> > 0 then'
      '      Font.Color := clBlack'
      '    else'
      '      Font.Color := clWhite;'
      '  end'
      'end;'
      ''
      'procedure MemoDateOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with MemoDate, Engine do'
      '  begin'
      '    if <datvis>=1 then'
      '      MemoDate.Font.Color := clBlack'
      '    else'
      '      MemoDate.Font.Color := clRed;'
      '  end'
      'end;'
      ''
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnBeginDoc = frNaklrBeginDoc
    OnGetValue = frNaklrGetValue
    Left = 328
    Top = 48
    Datasets = <
      item
        DataSet = frdNaklo
        DataSetName = 'frdNaklo'
      end
      item
        DataSet = frdNaklot
        DataSetName = 'frdNaklot'
      end>
    Variables = <
      item
        Name = ' AllVars'
        Value = Null
      end
      item
        Name = 'DAT'
        Value = Null
      end
      item
        Name = 'datvis'
        Value = '0'
      end
      item
        Name = 'Z_IPN'
        Value = '0'
      end
      item
        Name = 'Z_ADRP'
        Value = '0'
      end
      item
        Name = 'Z_TEL'
        Value = '0'
      end
      item
        Name = 'Z_SVREG'
        Value = '0'
      end
      item
        Name = 'I_IPN'
        Value = '0'
      end
      item
        Name = 'I_ADRP'
        Value = '0'
      end
      item
        Name = 'I_TEL'
        Value = '0'
      end
      item
        Name = 'I_SVREG'
        Value = '0'
      end
      item
        Name = 'IS_COPY'
        Value = Null
      end
      item
        Name = 'ORIGINAL_VYDAETSYA_POLUPATELYU'
        Value = Null
      end
      item
        Name = 'ORIGINAL_OSTAYETSYA_U_PRODAVTSA_TIP_PRICHINY'
        Value = Null
      end
      item
        Name = 'ORIGINAL_OSTAYETSYA_U_PRODAVTSA'
        Value = Null
      end
      item
        Name = 'VKLUCHENO_V_EDINIY_REESTR_PN'
        Value = Null
      end
      item
        Name = ' datvis2'
        Value = Null
      end>
    Style = <>
  end
  object qeNaklrt: TQueryExtender
    Query = cdsNaklrt
    KeyField = 'sch'
    Left = 128
    Top = 144
  end
  object sdsNaklr: TSQLDataSet
    CommandText = 
      'SELECT'#13#10'  om.schet,'#13#10'  om.id2,'#13#10'  om.id_izg,'#13#10'  om.id_zak,'#13#10'  om' +
      '.id_manager,'#13#10'  om.dat,'#13#10'  om.nds,'#13#10'  om.nakl,'#13#10'  om.kurs,'#13#10'  om' +
      '.vsego,'#13#10'  om.vidopl,'#13#10'  om.usl,'#13#10'  om.nalog_nds,'#13#10'  om.tip,'#13#10'  ' +
      'om.blocked,'#13#10'  om.signature,'#13#10'  om.id_dogovor'#13#10'FROM'#13#10'  NAKLRAS o' +
      'm'#13#10'ORDER BY '#13#10'  om.dat,om.id2'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 96
    Top = 176
    object sdsNaklrSCHET: TIntegerField
      FieldName = 'SCHET'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsNaklrID2: TIntegerField
      FieldName = 'ID2'
      Required = True
    end
    object sdsNaklrID_IZG: TIntegerField
      FieldName = 'ID_IZG'
      Required = True
    end
    object sdsNaklrID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
      Required = True
    end
    object sdsNaklrID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
      Required = True
    end
    object sdsNaklrDAT: TSQLTimeStampField
      FieldName = 'DAT'
    end
    object sdsNaklrNDS: TFMTBCDField
      FieldName = 'NDS'
      Precision = 15
      Size = 2
    end
    object sdsNaklrNAKL: TIntegerField
      FieldName = 'NAKL'
    end
    object sdsNaklrKURS: TFMTBCDField
      FieldName = 'KURS'
      Precision = 15
      Size = 8
    end
    object sdsNaklrVSEGO: TFMTBCDField
      FieldName = 'VSEGO'
      Precision = 15
      Size = 2
    end
    object sdsNaklrUSL: TStringField
      FieldName = 'USL'
      Size = 45
    end
    object sdsNaklrNALOG_NDS: TFMTBCDField
      FieldName = 'NALOG_NDS'
      Precision = 15
      Size = 2
    end
    object sdsNaklrTIP: TSmallintField
      FieldName = 'TIP'
      Required = True
    end
    object sdsNaklrVIDOPL: TStringField
      FieldName = 'VIDOPL'
      Size = 50
    end
    object sdsNaklrBLOCKED: TSmallintField
      FieldName = 'BLOCKED'
    end
    object sdsNaklrSIGNATURE: TStringField
      FieldName = 'SIGNATURE'
      Size = 50
    end
    object sdsNaklrID_DOGOVOR: TIntegerField
      FieldName = 'ID_DOGOVOR'
    end
  end
  object sdsNaklrt: TSQLDataSet
    CommandText = 
      'select '#13#10'  q.schet, '#13#10'  q.npp,'#13#10'  q.kodcn, '#13#10'  q.id_tovar,'#13#10'  q.' +
      'tara, '#13#10'  q.sch,'#13#10'  q.skidka, '#13#10'  q.cena,'#13#10'  q.nds,'#13#10'  q.kolotp,' +
      #13#10'  q.suma2,'#13#10'  q.vsego'#13#10'from '#13#10'  NAKLRAST q'#13#10'where'#13#10'  q.schet=:' +
      'schet'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'schet'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = dmdEx.scUchet
    Left = 128
    Top = 176
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
    object sdsNaklrtID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
      Required = True
    end
    object sdsNaklrtTARA: TSmallintField
      FieldName = 'TARA'
    end
    object sdsNaklrtSCH: TIntegerField
      FieldName = 'SCH'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsNaklrtSKIDKA: TFMTBCDField
      FieldName = 'SKIDKA'
      Precision = 15
      Size = 2
    end
    object sdsNaklrtCENA: TFMTBCDField
      FieldName = 'CENA'
      Precision = 15
      Size = 2
    end
    object sdsNaklrtNDS: TFMTBCDField
      FieldName = 'NDS'
      Precision = 15
      Size = 8
    end
    object sdsNaklrtKOLOTP: TFloatField
      FieldName = 'KOLOTP'
    end
    object sdsNaklrtSUMA2: TFMTBCDField
      FieldName = 'SUMA2'
      Precision = 15
      Size = 2
    end
    object sdsNaklrtVSEGO: TFMTBCDField
      FieldName = 'VSEGO'
      Precision = 15
      Size = 8
    end
  end
  object dspNaklr: TDataSetProvider
    DataSet = sdsNaklr
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 96
    Top = 240
  end
  object dspNaklrt: TDataSetProvider
    DataSet = sdsNaklrt
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 128
    Top = 240
  end
  object cdsNaklr: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    Params = <>
    ProviderName = 'dspNaklr'
    AfterInsert = cdsNaklrAfterInsert
    BeforePost = cdsNaklrBeforePost
    BeforeDelete = cdsNaklrBeforeDelete
    BeforeScroll = cdsNaklrBeforeScroll
    OnReconcileError = cdsNaklrReconcileError
    Left = 96
    Top = 272
    object cdsNaklrSCHET: TIntegerField
      FieldName = 'SCHET'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsNaklrID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
      Required = True
      OnChange = cdsNaklrID_ZAKChange
    end
    object cdsNaklrID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
      Required = True
      OnChange = cdsNaklrID_MANAGERChange
    end
    object cdsNaklrNDS: TFMTBCDField
      DisplayLabel = #1057#1091#1084#1084#1072'+'#1053#1044#1057
      FieldName = 'NDS'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object cdsNaklrNAKL: TIntegerField
      FieldName = 'NAKL'
    end
    object cdsNaklrKURS: TFMTBCDField
      DisplayLabel = #1050#1091#1088#1089
      FieldName = 'KURS'
      DisplayFormat = '0.0000'
      EditFormat = '##########.0000'
      Precision = 15
      Size = 8
    end
    object cdsNaklrVSEGO: TFMTBCDField
      FieldName = 'VSEGO'
      Precision = 15
      Size = 2
    end
    object cdsNaklrVIDOPL: TStringField
      DisplayLabel = #1042#1080#1076'.'#1086#1087#1083
      FieldName = 'VIDOPL'
      Size = 50
    end
    object cdsNaklrUSL: TStringField
      DisplayLabel = #1059#1089#1083#1086#1074#1080#1103
      FieldName = 'USL'
      Size = 45
    end
    object cdsNaklrNALOG_NDS: TFMTBCDField
      DisplayLabel = #1057#1090#1072#1074#1082#1072' '#1053#1044#1057
      FieldName = 'NALOG_NDS'
      Precision = 15
      Size = 2
    end
    object cdsNaklrIZG: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'IZG'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_IZG'
      Size = 50
      Lookup = True
    end
    object cdsNaklrZAK: TStringField
      DisplayLabel = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'ZAK'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_ZAK'
      Size = 50
      Lookup = True
    end
    object cdsNaklrMANAGER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'MANAGER'
      LookupDataSet = dmdEx.cdsManager
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_MANAGER'
      Size = 30
      Lookup = True
    end
    object cdsNaklrID2: TIntegerField
      DisplayLabel = #8470#1085#1072#1082#1083
      DisplayWidth = 5
      FieldName = 'ID2'
      Required = True
    end
    object cdsNaklrDAT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DAT'
      DisplayFormat = 'dd.mm.yy'
      EditMask = '!99/99/00;1;_'
    end
    object cdsNaklrID_IZG: TIntegerField
      FieldName = 'ID_IZG'
      Required = True
    end
    object cdsNaklrTIP: TSmallintField
      DefaultExpression = '3002'
      FieldName = 'TIP'
      Required = True
    end
    object cdsNaklrTIPNAME: TStringField
      DisplayLabel = #1058#1080#1087
      DisplayWidth = 15
      FieldKind = fkLookup
      FieldName = 'TIPNAME'
      LookupDataSet = cdsTipNNakl
      LookupKeyFields = 'OID'
      LookupResultField = 'FULLNAME'
      KeyFields = 'TIP'
      Size = 250
      Lookup = True
    end
    object cdsNaklrBLOCKED: TSmallintField
      DisplayLabel = #1054#1088#1080#1075#1080#1085#1072#1083
      DisplayWidth = 3
      FieldName = 'BLOCKED'
    end
    object cdsNaklrSIGNATURE: TStringField
      DisplayLabel = #1055#1086#1076#1087#1080#1089#1100
      DisplayWidth = 25
      FieldName = 'SIGNATURE'
      Size = 50
    end
    object cdsNaklrID_DOGOVOR: TIntegerField
      FieldName = 'ID_DOGOVOR'
    end
    object cdsNaklrDOGOVOR: TStringField
      DisplayLabel = #1044#1086#1075#1086#1074#1086#1088
      FieldKind = fkLookup
      FieldName = 'DOGOVOR'
      LookupDataSet = cdsDogovor
      LookupKeyFields = 'ID_DOGOVOR'
      LookupResultField = 'ID'
      KeyFields = 'ID_DOGOVOR'
      Lookup = True
    end
    object cdsNaklrDOGOVOR_DAT: TDateField
      FieldKind = fkLookup
      FieldName = 'DOGOVOR_DAT'
      LookupDataSet = cdsDogovor
      LookupKeyFields = 'ID_DOGOVOR'
      LookupResultField = 'DAT'
      KeyFields = 'ID_DOGOVOR'
      Lookup = True
    end
    object cdsNaklrTIP_DOGOVORA: TStringField
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'TIP_DOGOVORA'
      LookupDataSet = cdsDogovor
      LookupKeyFields = 'ID_DOGOVOR'
      LookupResultField = 'TIP_DOGOVORA'
      KeyFields = 'ID_DOGOVOR'
      Size = 250
      Lookup = True
    end
    object cdsNaklrTIP_CODE: TStringField
      FieldKind = fkLookup
      FieldName = 'TIP_CODE'
      LookupDataSet = cdsTipNNakl
      LookupKeyFields = 'OID'
      LookupResultField = 'TIP_CODE'
      KeyFields = 'TIP'
      Lookup = True
    end
  end
  object cdsNaklrt: TClientDataSet
    Aggregates = <
      item
        Visible = False
      end>
    AutoCalcFields = False
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
    BeforeInsert = cdsNaklrtBeforeInsert
    AfterInsert = cdsNaklrtAfterInsert
    BeforeEdit = cdsNaklrtBeforeEdit
    BeforeDelete = cdsNaklrtBeforeDelete
    AfterDelete = cdsNaklrtAfterDelete
    BeforeScroll = cdsNaklrtBeforeScroll
    OnReconcileError = cdsNaklrtReconcileError
    Left = 128
    Top = 272
    object cdsNaklrtSCHET: TIntegerField
      FieldName = 'SCHET'
      Required = True
    end
    object cdsNaklrtNPP: TIntegerField
      DisplayLabel = #8470#1087'.'#1087
      FieldName = 'NPP'
    end
    object cdsNaklrtKODCN: TIntegerField
      FieldName = 'KODCN'
    end
    object cdsNaklrtTARA: TIntegerField
      FieldKind = fkLookup
      FieldName = 'TARA'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'TARA'
      KeyFields = 'ID_TOVAR'
      Lookup = True
    end
    object cdsNaklrtSCH: TIntegerField
      FieldName = 'SCH'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsNaklrtSKIDKA: TFMTBCDField
      DisplayLabel = #1057#1082#1080#1076#1082#1072
      FieldName = 'SKIDKA'
      OnChange = cdsNaklrtSKIDKAChange
      DisplayFormat = '0.0'
      EditFormat = '##.0'
      Precision = 15
      Size = 2
    end
    object cdsNaklrtCENA: TFMTBCDField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'CENA'
      OnChange = cdsNaklrtCENAChange
      DisplayFormat = '0.00'
      EditFormat = '##########.00'
      Precision = 15
      Size = 2
    end
    object cdsNaklrtKOLOTP: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'KOLOTP'
      OnChange = cdsNaklrtKOLOTPChange
      DisplayFormat = '0.000'
      EditFormat = '##########.000'
    end
    object cdsNaklrtNDS: TFMTBCDField
      DisplayLabel = #1062#1077#1085#1072'+'#1053#1044#1057
      FieldName = 'NDS'
      OnChange = cdsNaklrtNDSChange
      DisplayFormat = '0.00'
      EditFormat = '##########.00'
      Precision = 15
      Size = 2
    end
    object cdsNaklrtSUMA2: TFMTBCDField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMA2'
      OnChange = cdsNaklrtSUMA2Change
      DisplayFormat = '0.00'
      EditFormat = '##########.00'
      Precision = 15
      Size = 2
    end
    object cdsNaklrtID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
      Required = True
    end
    object cdsNaklrtEDIZ: TStringField
      DisplayLabel = #1045#1076'.'#1080#1079#1084'.'
      FieldKind = fkLookup
      FieldName = 'EDIZ'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'EDIZ'
      KeyFields = 'ID_TOVAR'
      ReadOnly = True
      Lookup = True
    end
    object cdsNaklrtVSEGO: TFMTBCDField
      DisplayLabel = #1057#1091#1084#1084#1072'+'#1053#1044#1057
      FieldName = 'VSEGO'
      OnChange = cdsNaklrtVSEGOChange
      DisplayFormat = '0.00'
      EditFormat = '##########.00'
      Size = 8
    end
    object cdsNaklrtFULLNAME: TStringField
      FieldKind = fkLookup
      FieldName = 'FULLNAME'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'FULLNAME'
      KeyFields = 'ID_TOVAR'
      Size = 250
      Lookup = True
    end
    object cdsNaklrtTOVAR: TStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      FieldKind = fkLookup
      FieldName = 'TOVAR'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_TOVAR'
      Size = 100
      Lookup = True
    end
    object cdsNaklrtKODVED: TFMTBCDField
      FieldKind = fkLookup
      FieldName = 'KODVED'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'KODVED'
      KeyFields = 'ID_TOVAR'
      DisplayFormat = '0000000000'
      Size = 10
      Lookup = True
    end
  end
  object dsNaklrSrc2: TDataSource
    Tag = 1
    DataSet = sdsNaklr
    Left = 96
    Top = 208
  end
  object sdsTipNNakl: TSQLDataSet
    CommandText = 
      'select'#13#10'  o.oid,'#13#10'  o.name,'#13#10'  o.fullname,'#13#10'  trim(case when sub' +
      'str(o.predefined,1,2) ='#39#1055#1053#39#13#10'    then'#13#10'      case when strlen(su' +
      'bstr(o.predefined,4,2))>=2'#13#10'      then substr(o.predefined,4,2)'#13 +
      #10'      else '#39'00'#39' end'#13#10'    else '#39'00'#39' end) as tip_code'#13#10'from '#13#10'  o' +
      'bjects o'#13#10'where o.classid=('#13#10'  select oid from get_oid_objects_p' +
      'c('#39#1058#1048#1055' '#1053#1040#1051#1054#1043#1054#1042#1067#1061' '#1053#1040#1050#1051#1040#1044#1053#1067#1061#39',-100)'#13#10') and o.delmarked=0'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 160
    Top = 176
  end
  object dspTipNNakl: TDataSetProvider
    DataSet = sdsTipNNakl
    Left = 160
    Top = 240
  end
  object cdsTipNNakl: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipNNakl'
    Left = 160
    Top = 272
  end
  object dsTipNNakl: TDataSource
    DataSet = cdsTipNNakl
    Left = 160
    Top = 304
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
      object N10: TMenuItem
        Action = actPrintCopy
      end
      object N9: TMenuItem
        Action = actPreviewCopy
      end
      object N8: TMenuItem
        Action = actPreviewOld
      end
      object N1: TMenuItem
        Action = actRefresh
      end
      object N5: TMenuItem
        Action = actSettings
      end
      object N2: TMenuItem
        Action = actMakeNNaklrFromNNaklr
      end
      object XML1: TMenuItem
        Action = actGenerateXML
      end
    end
  end
  object frdNaklo: TfrxDBDataset
    UserName = 'frdNaklo'
    CloseDataSource = False
    DataSource = dsNaklr
    Left = 360
    Top = 80
  end
  object mtePriceDetGen: TMemTableEh
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 393
    Top = 48
    object mtePriceDetGenID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
    end
    object mtePriceDetGenCENA: TFloatField
      FieldName = 'CENA'
    end
    object mtePriceDetGenSKIDKA: TFloatField
      FieldName = 'SKIDKA'
    end
    object mtePriceDetGenKOLOTP: TFloatField
      FieldName = 'KOLOTP'
    end
    object mtePriceDetGenTARA: TIntegerField
      FieldName = 'TARA'
    end
    object mtePriceDetGenKODCN: TIntegerField
      FieldName = 'KODCN'
    end
    object mtePriceDetGenNPP: TIntegerField
      FieldName = 'NPP'
    end
  end
  object dsPriceDetGen: TDataSource
    DataSet = mtePriceDetGen
    Left = 393
    Top = 83
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
    Left = 96
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
    Left = 128
    Top = 112
  end
  object ppmNaklr: TPopupMenu
    Left = 296
    Top = 144
    object N6: TMenuItem
      Action = actMakeNNaklrFromNNaklr
    end
    object N13: TMenuItem
      Action = actPreview
    end
    object N7: TMenuItem
      Action = actPrint
    end
  end
  object sdsDogovor: TSQLDataSet
    CommandText = 
      'select d.id_dogovor,d.id_klient, d.dat, d.id, d.is_default, d.de' +
      'lmarked, d.tip_dogovora'#13#10'from DOGOVOR_VW d '#13#10'where d.delmarked=0'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 200
    Top = 144
  end
  object dspDogovor: TDataSetProvider
    DataSet = sdsDogovor
    Left = 200
    Top = 176
  end
  object cdsDogovor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDogovor'
    Left = 200
    Top = 208
    object cdsDogovorID_DOGOVOR: TIntegerField
      FieldName = 'ID_DOGOVOR'
      Required = True
    end
    object cdsDogovorID_KLIENT: TIntegerField
      FieldName = 'ID_KLIENT'
    end
    object cdsDogovorDAT: TSQLTimeStampField
      FieldName = 'DAT'
    end
    object cdsDogovorID: TStringField
      DisplayWidth = 20
      FieldName = 'ID'
      Size = 30
    end
    object cdsDogovorIS_DEFAULT: TIntegerField
      FieldName = 'IS_DEFAULT'
    end
    object cdsDogovorTIP_DOGOVORA: TStringField
      FieldName = 'TIP_DOGOVORA'
      Size = 250
    end
    object cdsDogovorDELMARKED: TSmallintField
      FieldName = 'DELMARKED'
    end
  end
  object dsDogovor: TDataSource
    DataSet = cdsDogovor
    Left = 200
    Top = 240
  end
  object sdsDogovorForClient: TSQLDataSet
    CommandText = 
      'select d.id_dogovor,d.id_klient, d.dat, d.id, d.is_default, d.de' +
      'lmarked, d.tip_dogovora'#13#10'from DOGOVOR_VW d '#13#10'where d.delmarked=0' +
      ' and d.id_klient=:id_klient'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_klient'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = dmdEx.scUchet
    Left = 232
    Top = 144
  end
  object dspDogovorForClient: TDataSetProvider
    DataSet = sdsDogovorForClient
    Left = 232
    Top = 176
  end
  object cdsDogovorForClient: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_klient'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspDogovorForClient'
    Left = 232
    Top = 208
    object IntegerField1: TIntegerField
      FieldName = 'ID_DOGOVOR'
      Required = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'ID_KLIENT'
    end
    object SQLTimeStampField1: TSQLTimeStampField
      FieldName = 'DAT'
    end
    object StringField1: TStringField
      DisplayWidth = 20
      FieldName = 'ID'
      Size = 30
    end
    object IntegerField3: TIntegerField
      FieldName = 'IS_DEFAULT'
    end
    object StringField2: TStringField
      FieldName = 'TIP_DOGOVORA'
      Size = 250
    end
    object SmallintField1: TSmallintField
      FieldName = 'DELMARKED'
    end
  end
  object dsDogovorForClient: TDataSource
    DataSet = cdsDogovorForClient
    Left = 232
    Top = 240
  end
  object rpsClientEdit: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 64
    Top = 112
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmNnaklr'
    StorageManager = rpsClientEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      'dbgNaklr.<P>.Columns.<ForAllItems>.Width'
      'dbgNaklrt.<P>.Columns.<ForAllItems>.Width')
    Left = 64
    Top = 208
  end
  object qeDogovor: TQueryExtender
    Query = cdsDogovor
    KeyField = 'id_dogovor'
    Left = 200
    Top = 112
  end
end
