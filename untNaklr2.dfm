object frmNaklr2: TfrmNaklr2
  Left = 119
  Top = 113
  BorderStyle = bsDialog
  Caption = #1056#1072#1089#1093#1086#1076#1085#1099#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077
  ClientHeight = 368
  ClientWidth = 610
  Color = clBtnFace
  Constraints.MinHeight = 414
  Constraints.MinWidth = 618
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
    610
    368)
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 16
    Top = 0
    Width = 89
    Height = 17
    Action = actSettings
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 775
    Top = 584
    Width = 369
    Height = 57
    Anchors = [akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      369
      57)
    object rdgCable: TRadioGroup
      Left = 24
      Top = 0
      Width = 81
      Height = 49
      ItemIndex = 0
      Items.Strings = (
        #1050#1072#1073#1077#1083#1100
        #1058#1072#1088#1072)
      TabOrder = 0
      Visible = False
    end
    object RadioGroup2: TRadioGroup
      Left = 112
      Top = 0
      Width = 249
      Height = 49
      Anchors = [akLeft, akBottom]
      TabOrder = 1
      Visible = False
    end
    object rdbCol1: TRadioButton
      Left = 224
      Top = 8
      Width = 89
      Height = 17
      Action = actPostIf2
      Caption = #1050#1086#1083' 1'
      TabOrder = 2
      Visible = False
    end
    object rdbCol3: TRadioButton
      Left = 296
      Top = 8
      Width = 57
      Height = 17
      Action = actPostIf2
      Caption = #1050#1086#1083' 3'
      TabOrder = 3
      Visible = False
    end
    object rdbCol2: TRadioButton
      Left = 224
      Top = 24
      Width = 81
      Height = 17
      Action = actPostIf2
      Caption = #1050#1086#1083' 2'
      TabOrder = 4
      Visible = False
    end
    object rdbCol4: TRadioButton
      Left = 296
      Top = 24
      Width = 57
      Height = 17
      Action = actPostIf2
      Caption = #1050#1086#1083' 4'
      TabOrder = 5
      Visible = False
    end
    object rdbCol0: TRadioButton
      Left = 120
      Top = 8
      Width = 97
      Height = 17
      Action = actPostIf2
      Caption = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
      Checked = True
      TabOrder = 6
      TabStop = True
      Visible = False
    end
  end
  object Button3: TButton
    Left = 40
    Top = 592
    Width = 137
    Height = 41
    Action = actRecalc
    Anchors = [akLeft, akBottom]
    TabOrder = 2
  end
  object dbgNaklp: TDBGridEh
    Left = 8
    Top = 16
    Width = 506
    Height = 102
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsNaklr
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyUp = dbgNaklpKeyUp
    Columns = <
      item
        EditButtons = <>
        FieldName = 'DAT'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1044#1072#1090#1072
        Title.TitleButton = True
        Width = 59
      end
      item
        EditButtons = <>
        FieldName = 'IZG2'
        Footers = <>
        Width = 92
      end
      item
        EditButtons = <>
        FieldName = 'ZAK2'
        Footers = <>
        Width = 91
      end
      item
        EditButtons = <>
        FieldName = 'MANAGER2'
        Footers = <>
        Width = 61
      end
      item
        EditButtons = <>
        FieldName = 'VSEGO'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1048#1090#1086#1075#1086
        Title.TitleButton = True
        Width = 66
      end
      item
        EditButtons = <>
        FieldName = 'KURS'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1050#1091#1088#1089
        Title.TitleButton = True
        Width = 55
      end
      item
        Checkboxes = True
        EditButtons = <>
        FieldName = 'POSTED'
        Footers = <>
        KeyList.Strings = (
          '1'
          '0')
        ReadOnly = True
        Width = 32
      end>
  end
  object dbgNaklpt: TDBGridEh
    Left = 8
    Top = 129
    Width = 594
    Height = 229
    Anchors = [akLeft, akRight, akBottom]
    DataSource = dsNaklrt
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyUp = dbgNaklptKeyUp
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ID_POS'
        Footers = <>
        ReadOnly = True
      end
      item
        EditButtons = <>
        FieldName = 'TOVAR'
        Footers = <>
        ReadOnly = True
      end
      item
        EditButtons = <>
        FieldName = 'KOLOTP'
        Footers = <>
        ReadOnly = True
        Width = 81
      end
      item
        EditButtons = <>
        FieldName = 'CENA'
        Footers = <>
        ReadOnly = True
      end>
  end
  object Panel2: TPanel
    Left = 522
    Top = 8
    Width = 81
    Height = 121
    Anchors = [akTop, akRight]
    BevelOuter = bvNone
    TabOrder = 5
    DesignSize = (
      81
      121)
    object btnInsert: TBitBtn
      Left = 6
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 0
      OnClick = btnInsertClick
    end
    object btnUpdate: TBitBtn
      Left = 6
      Top = 32
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      OnClick = btnUpdateClick
    end
    object btnDelete: TBitBtn
      Left = 6
      Top = 56
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 2
      OnClick = btnDeleteClick
    end
    object btnPost: TBitBtn
      Left = 6
      Top = 80
      Width = 75
      Height = 17
      Anchors = [akTop, akRight]
      Caption = #1055#1088#1086#1074#1077#1089#1090#1080
      TabOrder = 3
      OnClick = btnPostClick
    end
    object btnUnpost: TBitBtn
      Left = 6
      Top = 96
      Width = 75
      Height = 17
      Anchors = [akTop, akRight]
      Caption = #1042#1077#1088#1085#1091#1090#1100
      TabOrder = 4
      OnClick = btnUnpostClick
    end
  end
  object ActionList1: TActionList
    Left = 456
    Top = 304
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
    end
    object actPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      ShortCut = 123
    end
    object actSchet: TAction
      Caption = #1048#1079' '#1089#1095#1105#1090#1072
      ShortCut = 120
      OnExecute = actSchetExecute
    end
    object actCalculateSum: TAction
      Caption = 'actCalculateSum'
      OnExecute = actCalculateSumExecute
    end
  end
  object sdsNaklr: TSQLDataSet
    SQLConnection = dmdEx.scUchet
    CommandText = 
      'select * '#13#10'from '#13#10'  naklr n'#13#10'where'#13#10'  n.fix='#39'*'#39#13#10'order by'#13#10'  n.d' +
      'at,n.id_manager,n.id_izg'#13#10
    Params = <>
    Left = 392
    Top = 208
    object sdsNaklrNAKL: TIntegerField
      FieldName = 'NAKL'
    end
    object sdsNaklrDAT: TSQLTimeStampField
      FieldName = 'DAT'
    end
    object sdsNaklrIZG: TStringField
      FieldName = 'IZG'
      Size = 60
    end
    object sdsNaklrLICO: TStringField
      FieldName = 'LICO'
      Size = 40
    end
    object sdsNaklrKURS: TFloatField
      FieldName = 'KURS'
    end
    object sdsNaklrKODIZG: TIntegerField
      FieldName = 'KODIZG'
    end
    object sdsNaklrID: TStringField
      FieldName = 'ID'
      Size = 30
    end
    object sdsNaklrSCH: TIntegerField
      FieldName = 'SCH'
    end
    object sdsNaklrAUTHER: TStringField
      FieldName = 'AUTHER'
      Size = 40
    end
    object sdsNaklrVSEGO: TFMTBCDField
      FieldName = 'VSEGO'
      Precision = 15
      Size = 2
    end
    object sdsNaklrNDS: TFMTBCDField
      FieldName = 'NDS'
      Precision = 15
      Size = 2
    end
    object sdsNaklrDOV: TStringField
      FieldName = 'DOV'
      Size = 40
    end
    object sdsNaklrDDO: TSQLTimeStampField
      FieldName = 'DDO'
    end
    object sdsNaklrFIX: TStringField
      FieldName = 'FIX'
      Size = 11
    end
    object sdsNaklrFR: TStringField
      FieldName = 'FR'
      Size = 15
    end
    object sdsNaklrZAK: TStringField
      FieldName = 'ZAK'
      Size = 60
    end
    object sdsNaklrOPLACHENO: TFMTBCDField
      FieldName = 'OPLACHENO'
      Precision = 15
      Size = 2
    end
    object sdsNaklrMODIFIED: TSQLTimeStampField
      FieldName = 'MODIFIED'
    end
    object sdsNaklrMODIFIED_BY: TStringField
      FieldName = 'MODIFIED_BY'
      Size = 60
    end
    object sdsNaklrSTATE: TSmallintField
      FieldName = 'STATE'
    end
    object sdsNaklrID_IZG: TIntegerField
      FieldName = 'ID_IZG'
    end
    object sdsNaklrID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
    end
    object sdsNaklrID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
    end
    object sdsNaklrID_CURRENCY: TSmallintField
      FieldName = 'ID_CURRENCY'
    end
    object sdsNaklrNALOG_NDS: TFMTBCDField
      FieldName = 'NALOG_NDS'
      Precision = 15
      Size = 2
    end
    object sdsNaklrKURS_FACT: TFloatField
      FieldName = 'KURS_FACT'
    end
    object sdsNaklrOTKAT_OPL: TStringField
      FieldName = 'OTKAT_OPL'
      Size = 11
    end
    object sdsNaklrID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
    end
    object sdsNaklrMODIFIED_IDUSER: TSmallintField
      FieldName = 'MODIFIED_IDUSER'
    end
    object sdsNaklrPOSTED: TSmallintField
      FieldName = 'POSTED'
    end
  end
  object dsNaklr: TDataSource
    DataSet = cdsNaklr
    Left = 392
    Top = 336
  end
  object dsNaklrSrc: TDataSource
    DataSet = sdsNaklr
    Left = 392
    Top = 240
  end
  object dspNaklr: TDataSetProvider
    DataSet = sdsNaklr
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 392
    Top = 272
  end
  object cdsNaklr: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNaklr'
    AfterInsert = cdsNaklrAfterInsert
    AfterEdit = cdsNaklrAfterEdit
    Left = 392
    Top = 304
    object cdsNaklrNAKL: TIntegerField
      FieldName = 'NAKL'
    end
    object cdsNaklrDAT: TSQLTimeStampField
      FieldName = 'DAT'
    end
    object cdsNaklrIZG: TStringField
      FieldName = 'IZG'
      Size = 60
    end
    object cdsNaklrLICO: TStringField
      FieldName = 'LICO'
      Size = 40
    end
    object cdsNaklrKURS: TFloatField
      FieldName = 'KURS'
      DisplayFormat = '0.0000'
    end
    object cdsNaklrKODIZG: TIntegerField
      FieldName = 'KODIZG'
    end
    object cdsNaklrID: TStringField
      FieldName = 'ID'
      Size = 30
    end
    object cdsNaklrSCH: TIntegerField
      FieldName = 'SCH'
    end
    object cdsNaklrAUTHER: TStringField
      FieldName = 'AUTHER'
      Size = 40
    end
    object cdsNaklrVSEGO: TFMTBCDField
      FieldName = 'VSEGO'
      Precision = 15
      Size = 2
    end
    object cdsNaklrNDS: TFMTBCDField
      FieldName = 'NDS'
      Precision = 15
      Size = 2
    end
    object cdsNaklrDOV: TStringField
      FieldName = 'DOV'
      Size = 40
    end
    object cdsNaklrDDO: TSQLTimeStampField
      FieldName = 'DDO'
    end
    object cdsNaklrFIX: TStringField
      FieldName = 'FIX'
      Size = 11
    end
    object cdsNaklrFR: TStringField
      FieldName = 'FR'
      Size = 15
    end
    object cdsNaklrZAK: TStringField
      FieldName = 'ZAK'
      Size = 60
    end
    object cdsNaklrOPLACHENO: TFMTBCDField
      FieldName = 'OPLACHENO'
      Precision = 15
      Size = 2
    end
    object cdsNaklrMODIFIED: TSQLTimeStampField
      FieldName = 'MODIFIED'
    end
    object cdsNaklrMODIFIED_BY: TStringField
      FieldName = 'MODIFIED_BY'
      Size = 60
    end
    object cdsNaklrSTATE: TSmallintField
      FieldName = 'STATE'
    end
    object cdsNaklrID_IZG: TIntegerField
      FieldName = 'ID_IZG'
    end
    object cdsNaklrID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
    end
    object cdsNaklrID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
    end
    object cdsNaklrID_CURRENCY: TSmallintField
      FieldName = 'ID_CURRENCY'
    end
    object cdsNaklrNALOG_NDS: TFMTBCDField
      FieldName = 'NALOG_NDS'
      Precision = 15
      Size = 2
    end
    object cdsNaklrKURS_FACT: TFloatField
      FieldName = 'KURS_FACT'
    end
    object cdsNaklrOTKAT_OPL: TStringField
      FieldName = 'OTKAT_OPL'
      Size = 11
    end
    object cdsNaklrID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
    end
    object cdsNaklrMODIFIED_IDUSER: TSmallintField
      FieldName = 'MODIFIED_IDUSER'
    end
    object cdsNaklrPOSTED: TSmallintField
      FieldName = 'POSTED'
    end
    object cdsNaklrIZG2: TStringField
      FieldKind = fkLookup
      FieldName = 'IZG2'
      LookupDataSet = dmdEx.cdsVlad
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_IZG'
      Lookup = True
    end
    object cdsNaklrZAK2: TStringField
      FieldKind = fkLookup
      FieldName = 'ZAK2'
      LookupDataSet = dmdEx.cdsClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_ZAK'
      Lookup = True
    end
    object cdsNaklrMANAGER2: TStringField
      FieldKind = fkLookup
      FieldName = 'MANAGER2'
      LookupDataSet = dmdEx.cdsManager
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_MANAGER'
      Lookup = True
    end
  end
  object sdsNaklrt: TSQLDataSet
    SQLConnection = dmdEx.scUchet
    CommandText = 'select '#13#10'  * '#13#10'from '#13#10'  naklrt d '#13#10'where '#13#10'  d.nakl=:nakl'
    Params = <
      item
        DataType = ftInteger
        Name = 'NAKL'
        ParamType = ptInput
        Size = 4
      end>
    Left = 424
    Top = 208
    object sdsNaklrtEDIZ: TStringField
      FieldName = 'EDIZ'
      Size = 4
    end
    object sdsNaklrtKOLOTP: TFloatField
      FieldName = 'KOLOTP'
    end
    object sdsNaklrtNPP: TSmallintField
      FieldName = 'NPP'
    end
    object sdsNaklrtNAKL: TIntegerField
      FieldName = 'NAKL'
      Required = True
    end
    object sdsNaklrtTARA: TSmallintField
      FieldName = 'TARA'
    end
    object sdsNaklrtKOD: TIntegerField
      FieldName = 'KOD'
    end
    object sdsNaklrtKODCN: TSmallintField
      FieldName = 'KODCN'
    end
    object sdsNaklrtCENA: TFMTBCDField
      FieldName = 'CENA'
      Precision = 15
      Size = 2
    end
    object sdsNaklrtNDS: TFMTBCDField
      FieldName = 'NDS'
      Precision = 15
      Size = 2
    end
    object sdsNaklrtVSEGO: TFMTBCDField
      FieldName = 'VSEGO'
      Precision = 15
      Size = 2
    end
    object sdsNaklrtSUMA2: TFMTBCDField
      FieldName = 'SUMA2'
      Precision = 15
      Size = 2
    end
    object sdsNaklrtSKIDKA: TFMTBCDField
      FieldName = 'SKIDKA'
      Precision = 15
      Size = 2
    end
    object sdsNaklrtTOVAR: TStringField
      FieldName = 'TOVAR'
      Required = True
      Size = 44
    end
    object sdsNaklrtPREMIYA: TFMTBCDField
      FieldName = 'PREMIYA'
      Precision = 15
      Size = 8
    end
    object sdsNaklrtCENA_FACT: TFMTBCDField
      FieldName = 'CENA_FACT'
      Precision = 15
      Size = 8
    end
    object sdsNaklrtSKIDKA_FACT: TFloatField
      FieldName = 'SKIDKA_FACT'
      Required = True
    end
    object sdsNaklrtSCH: TIntegerField
      FieldName = 'SCH'
      Required = True
    end
    object sdsNaklrtMODIFIED: TSQLTimeStampField
      FieldName = 'MODIFIED'
      Required = True
    end
    object sdsNaklrtMODIFIED_BY: TStringField
      FieldName = 'MODIFIED_BY'
      Required = True
      Size = 50
    end
    object sdsNaklrtSTATE: TSmallintField
      FieldName = 'STATE'
      Required = True
    end
    object sdsNaklrtTIP: TSmallintField
      FieldName = 'TIP'
      Required = True
    end
    object sdsNaklrtID_SEBEST: TIntegerField
      FieldName = 'ID_SEBEST'
      Required = True
    end
  end
  object dspNaklrt: TDataSetProvider
    DataSet = sdsNaklrt
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 424
    Top = 272
  end
  object cdsNaklrt: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNaklrt'
    BeforeInsert = cdsNaklrtBeforeInsert
    AfterInsert = cdsNaklrtAfterInsert
    AfterEdit = cdsNaklrtAfterEdit
    Left = 424
    Top = 304
    object cdsNaklrtEDIZ: TStringField
      FieldName = 'EDIZ'
      Size = 4
    end
    object cdsNaklrtKOLOTP: TFloatField
      FieldName = 'KOLOTP'
    end
    object cdsNaklrtNPP: TSmallintField
      FieldName = 'NPP'
    end
    object cdsNaklrtNAKL: TIntegerField
      FieldName = 'NAKL'
      Required = True
    end
    object cdsNaklrtTARA: TSmallintField
      FieldName = 'TARA'
    end
    object cdsNaklrtKOD: TIntegerField
      FieldName = 'KOD'
    end
    object cdsNaklrtKODCN: TSmallintField
      FieldName = 'KODCN'
    end
    object cdsNaklrtCENA: TFMTBCDField
      FieldName = 'CENA'
      Precision = 15
      Size = 2
    end
    object cdsNaklrtNDS: TFMTBCDField
      FieldName = 'NDS'
      Precision = 15
      Size = 2
    end
    object cdsNaklrtVSEGO: TFMTBCDField
      FieldName = 'VSEGO'
      Precision = 15
      Size = 2
    end
    object cdsNaklrtSUMA2: TFMTBCDField
      FieldName = 'SUMA2'
      Precision = 15
      Size = 2
    end
    object cdsNaklrtSKIDKA: TFMTBCDField
      FieldName = 'SKIDKA'
      Precision = 15
      Size = 2
    end
    object cdsNaklrtTOVAR: TStringField
      FieldName = 'TOVAR'
      Required = True
      Size = 44
    end
    object cdsNaklrtPREMIYA: TFMTBCDField
      FieldName = 'PREMIYA'
      Precision = 15
      Size = 8
    end
    object cdsNaklrtCENA_FACT: TFMTBCDField
      FieldName = 'CENA_FACT'
      Precision = 15
      Size = 8
    end
    object cdsNaklrtSKIDKA_FACT: TFloatField
      FieldName = 'SKIDKA_FACT'
      Required = True
    end
    object cdsNaklrtSCH: TIntegerField
      FieldName = 'SCH'
      Required = True
    end
    object cdsNaklrtMODIFIED: TSQLTimeStampField
      FieldName = 'MODIFIED'
      Required = True
    end
    object cdsNaklrtMODIFIED_BY: TStringField
      FieldName = 'MODIFIED_BY'
      Required = True
      Size = 50
    end
    object cdsNaklrtTIP: TSmallintField
      FieldName = 'TIP'
      Required = True
    end
    object cdsNaklrtID_SEBEST: TIntegerField
      FieldName = 'ID_SEBEST'
      Required = True
    end
  end
  object dsNaklrt: TDataSource
    DataSet = cdsNaklrt
    Left = 424
    Top = 336
  end
  object sdsPost: TSQLDataSet
    SQLConnection = dmdEx.scUchet
    CommandText = 'NAKLP_POST_PC'
    CommandType = ctStoredProc
    DataSource = dsNaklr
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_NAKL'
        ParamType = ptInput
      end>
    Left = 456
    Top = 208
  end
  object sdsUnpost: TSQLDataSet
    SQLConnection = dmdEx.scUchet
    CommandText = 'NAKLP_UNPOST_PC'
    CommandType = ctStoredProc
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_NAKL'
        ParamType = ptInput
      end>
    Left = 456
    Top = 240
  end
  object MainMenu1: TMainMenu
    Left = 456
    Top = 272
    object N1: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      GroupIndex = 10
      object mnuRefresh: TMenuItem
        Action = actRefresh
      end
    end
  end
  object qeNaklr: TQueryExtender
    Query = cdsNaklr
    Left = 392
    Top = 176
  end
end
