object frmClientSpr: TfrmClientSpr
  Left = 225
  Top = 192
  BorderStyle = bsDialog
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1082#1083#1080#1077#1085#1090#1086#1074
  ClientHeight = 315
  ClientWidth = 632
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
  OnDeactivate = FormDeactivate
  DesignSize = (
    632
    315)
  PixelsPerInch = 96
  TextHeight = 13
  object dbgClient: TDBGridEh
    Left = 1
    Top = 24
    Width = 548
    Height = 289
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsKlient
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghTraceColSizing, dghPreferIncSearch, dghRowHighlight]
    ReadOnly = True
    SortLocal = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    VertScrollBar.VisibleMode = sbAlwaysShowEh
    OnDblClick = dbgClientDblClick
    OnKeyDown = dbgClientKeyDown
    Columns = <
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Title.TitleButton = True
        Width = 97
      end
      item
        EditButtons = <>
        FieldName = 'ADRP'
        Footers = <>
        Title.TitleButton = True
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'GOROD'
        Footers = <>
        Title.TitleButton = True
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'ADRES'
        Footers = <>
        Title.TitleButton = True
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'STAN'
        Footers = <>
        Title.TitleButton = True
        Width = 100
      end
      item
        Checkboxes = True
        EditButtons = <>
        FieldName = 'DELMARKED'
        Footers = <>
        KeyList.Strings = (
          '1'
          '0')
        Title.TitleButton = True
        Width = 27
      end
      item
        EditButtons = <>
        FieldName = 'ID'
        Footers = <>
        Width = 57
      end
      item
        EditButtons = <>
        FieldName = 'MANAGER'
        Footers = <>
        Width = 75
      end
      item
        EditButtons = <>
        FieldName = 'CREATED'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'IPN'
        Footers = <>
      end>
  end
  object cbxFields: TComboBox
    Left = 0
    Top = 0
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    Text = ' '
  end
  object edtFilter: TEdit
    Left = 248
    Top = 0
    Width = 145
    Height = 21
    Hint = #1042#1074#1077#1076#1080#1090#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1092#1080#1083#1100#1090#1088#1072
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnKeyUp = edtFilterKeyUp
  end
  object cbxContains: TCheckBox
    Left = 152
    Top = 0
    Width = 81
    Height = 17
    Caption = #1057#1086#1076#1077#1088#1078#1080#1090
    TabOrder = 3
    OnClick = cbxContainsClick
  end
  object Panel1: TPanel
    Left = 552
    Top = 0
    Width = 80
    Height = 315
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 4
    DesignSize = (
      80
      315)
    object btnInsert: TButton
      Left = 4
      Top = 24
      Width = 76
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 0
      TabStop = False
      OnClick = btnInsertClick
    end
    object btnEdit: TButton
      Left = 4
      Top = 56
      Width = 76
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      TabStop = False
      OnClick = btnEditClick
    end
    object btnDelete: TButton
      Left = 4
      Top = 88
      Width = 76
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 2
      TabStop = False
      OnClick = btnDeleteClick
    end
    object BitBtn1: TBitBtn
      Left = 4
      Top = 124
      Width = 76
      Height = 25
      Action = actRefresh
      Anchors = [akTop, akRight]
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 3
      Kind = bkRetry
    end
    object btnOk: TBitBtn
      Left = 15
      Top = 220
      Width = 53
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 4
      TabStop = False
      Visible = False
      OnClick = btnOkClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object sdsKlient: TSQLDataSet
    CommandText = 'select k.* from KLIENT_ALL_VW k ORDER BY k.name'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 56
    Top = 88
    object sdsKlientNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
    object sdsKlientIPN: TStringField
      FieldName = 'IPN'
      Size = 12
    end
    object sdsKlientSVREG: TStringField
      FieldName = 'SVREG'
      Size = 16
    end
    object sdsKlientOKPO: TStringField
      FieldName = 'OKPO'
      Size = 10
    end
    object sdsKlientINDEXI: TFloatField
      FieldName = 'INDEXI'
    end
    object sdsKlientOBLAST: TStringField
      FieldName = 'OBLAST'
      Size = 50
    end
    object sdsKlientTEL: TStringField
      FieldName = 'TEL'
      Size = 30
    end
    object sdsKlientFAX: TStringField
      FieldName = 'FAX'
      Size = 14
    end
    object sdsKlientFORIN: TStringField
      FieldName = 'FORIN'
      Size = 10
    end
    object sdsKlientLICO: TStringField
      FieldName = 'LICO'
      Size = 50
    end
    object sdsKlientFIO: TStringField
      FieldName = 'FIO'
      Size = 40
    end
    object sdsKlientOTV: TStringField
      FieldName = 'OTV'
      Size = 45
    end
    object sdsKlientGOROD: TStringField
      FieldName = 'GOROD'
      Size = 40
    end
    object sdsKlientSTAN: TStringField
      FieldName = 'STAN'
      Size = 60
    end
    object sdsKlientID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sdsKlientTIP: TIntegerField
      FieldName = 'TIP'
      Required = True
    end
    object sdsKlientDELMARKED: TSmallintField
      FieldName = 'DELMARKED'
      Required = True
    end
    object sdsKlientFULLNAME: TStringField
      FieldName = 'FULLNAME'
      Size = 250
    end
    object sdsKlientDAT_OSNOV: TSQLTimeStampField
      FieldName = 'DAT_OSNOV'
    end
    object sdsKlientOFFICESKLAD: TStringField
      FieldName = 'OFFICESKLAD'
      Size = 252
    end
    object sdsKlientSOTRUDNIKOV_OT: TIntegerField
      FieldName = 'SOTRUDNIKOV_OT'
    end
    object sdsKlientSOTRUDNIKOV_DO: TStringField
      FieldName = 'SOTRUDNIKOV_DO'
      Size = 252
    end
    object sdsKlientFILIALY: TStringField
      FieldName = 'FILIALY'
      Size = 252
    end
    object sdsKlientID_ANALOG: TIntegerField
      FieldName = 'ID_ANALOG'
    end
    object sdsKlientKTOZAKUPAET: TStringField
      FieldName = 'KTOZAKUPAET'
      Size = 252
    end
    object sdsKlientKAKOYKABELNUGEN: TStringField
      FieldName = 'KAKOYKABELNUGEN'
      Size = 252
    end
    object sdsKlientOBJEMZAGOD: TStringField
      FieldName = 'OBJEMZAGOD'
      Size = 252
    end
    object sdsKlientOBJEMZA6MESYATSEV: TStringField
      FieldName = 'OBJEMZA6MESYATSEV'
      Size = 252
    end
    object sdsKlientKTOMOGETPORUCHITSYA: TStringField
      FieldName = 'KTOMOGETPORUCHITSYA'
      Size = 252
    end
    object sdsKlientVASHIPARTNERY: TStringField
      FieldName = 'VASHIPARTNERY'
      Size = 252
    end
    object sdsKlientVASHIKONKURENTY: TStringField
      FieldName = 'VASHIKONKURENTY'
      Size = 252
    end
    object sdsKlientFINANSOVOEPOLOGENIE: TStringField
      FieldName = 'FINANSOVOEPOLOGENIE'
      Size = 252
    end
    object sdsKlientDELOVAYAREPUTACIYA: TStringField
      FieldName = 'DELOVAYAREPUTACIYA'
      Size = 252
    end
    object sdsKlientRASPOLAGAETLIKONKURENT: TStringField
      FieldName = 'RASPOLAGAETLIKONKURENT'
      Size = 252
    end
    object sdsKlientID_SFERADEYATELNOSTI: TIntegerField
      FieldName = 'ID_SFERADEYATELNOSTI'
    end
    object sdsKlientID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
    end
    object sdsKlientID_RESULT: TIntegerField
      FieldName = 'ID_RESULT'
    end
    object sdsKlientDAT_CONTACT: TSQLTimeStampField
      FieldName = 'DAT_CONTACT'
    end
    object sdsKlientOBLAST2: TStringField
      FieldName = 'OBLAST2'
      Size = 50
    end
    object sdsKlientMODIFIED: TSQLTimeStampField
      FieldName = 'MODIFIED'
      Required = True
    end
    object sdsKlientID_PRICE: TIntegerField
      FieldName = 'ID_PRICE'
    end
    object sdsKlientID_SKIDKA: TIntegerField
      FieldName = 'ID_SKIDKA'
    end
    object sdsKlientID_USL_POSTAVKA: TIntegerField
      FieldName = 'ID_USL_POSTAVKA'
    end
    object sdsKlientADRP: TStringField
      FieldName = 'ADRP'
      Size = 130
    end
    object sdsKlientADRES: TStringField
      FieldName = 'ADRES'
      Size = 100
    end
    object sdsKlientISDEFAULT: TSmallintField
      FieldName = 'ISDEFAULT'
    end
    object sdsKlientCREATED: TSQLTimeStampField
      FieldName = 'CREATED'
    end
    object sdsKlientLGOTY: TIntegerField
      FieldName = 'LGOTY'
    end
    object sdsKlientPLAT_ED_NALOGA: TSmallintField
      FieldName = 'PLAT_ED_NALOGA'
    end
    object sdsKlientIS_FIZLICO: TSmallintField
      FieldName = 'IS_FIZLICO'
    end
  end
  object dspKlient: TDataSetProvider
    DataSet = sdsKlient
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 56
    Top = 120
  end
  object dsKlient: TDataSource
    DataSet = cdsKlient
    Left = 56
    Top = 184
  end
  object cdsKlient: TClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ProviderName = 'dspKlient'
    AfterInsert = cdsKlientAfterInsert
    BeforePost = cdsKlientBeforePost
    OnReconcileError = cdsKlientReconcileError
    Left = 56
    Top = 152
    object cdsKlientNAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'NAME'
      Required = True
      OnChange = cdsKlientNAMEChange
      Size = 50
    end
    object cdsKlientADRES: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      DisplayWidth = 50
      FieldName = 'ADRES'
      Size = 100
    end
    object cdsKlientADRP: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      FieldName = 'ADRP'
      Size = 130
    end
    object cdsKlientIPN: TStringField
      DisplayLabel = #1048#1055#1053
      FieldName = 'IPN'
      Size = 12
    end
    object cdsKlientSVREG: TStringField
      FieldName = 'SVREG'
      Size = 16
    end
    object cdsKlientOKPO: TStringField
      FieldName = 'OKPO'
      Size = 10
    end
    object cdsKlientINDEXI: TFloatField
      FieldName = 'INDEXI'
    end
    object cdsKlientOBLAST: TStringField
      FieldName = 'OBLAST'
      Size = 50
    end
    object cdsKlientTEL: TStringField
      FieldName = 'TEL'
      Size = 30
    end
    object cdsKlientFAX: TStringField
      FieldName = 'FAX'
      Size = 14
    end
    object cdsKlientFORIN: TStringField
      FieldName = 'FORIN'
      Size = 10
    end
    object cdsKlientLICO: TStringField
      FieldName = 'LICO'
      Size = 50
    end
    object cdsKlientFIO: TStringField
      FieldName = 'FIO'
      Size = 40
    end
    object cdsKlientOTV: TStringField
      FieldName = 'OTV'
      Size = 45
    end
    object cdsKlientGOROD: TStringField
      DisplayLabel = #1043#1086#1088#1086#1076
      FieldName = 'GOROD'
      Size = 40
    end
    object cdsKlientSTAN: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'STAN'
      Size = 60
    end
    object cdsKlientID: TIntegerField
      DisplayLabel = #8470
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsKlientTIP: TIntegerField
      FieldName = 'TIP'
    end
    object cdsKlientDELMARKED: TSmallintField
      DisplayLabel = #1059#1076#1072#1083#1105#1085
      FieldName = 'DELMARKED'
      Required = True
    end
    object cdsKlientFULLNAME: TStringField
      FieldName = 'FULLNAME'
      Size = 250
    end
    object cdsKlientMANAGER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      FieldKind = fkLookup
      FieldName = 'MANAGER'
      LookupDataSet = dmdEx.cdsManager
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_MANAGER'
      Size = 30
      Lookup = True
    end
    object cdsKlientID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
    end
    object cdsKlientDAT_OSNOV: TSQLTimeStampField
      FieldName = 'DAT_OSNOV'
    end
    object cdsKlientOFFICESKLAD: TStringField
      FieldName = 'OFFICESKLAD'
      Size = 252
    end
    object cdsKlientSOTRUDNIKOV_OT: TIntegerField
      FieldName = 'SOTRUDNIKOV_OT'
    end
    object cdsKlientSOTRUDNIKOV_DO: TStringField
      FieldName = 'SOTRUDNIKOV_DO'
      Size = 252
    end
    object cdsKlientFILIALY: TStringField
      FieldName = 'FILIALY'
      Size = 252
    end
    object cdsKlientID_ANALOG: TIntegerField
      FieldName = 'ID_ANALOG'
    end
    object cdsKlientKTOZAKUPAET: TStringField
      FieldName = 'KTOZAKUPAET'
      Size = 252
    end
    object cdsKlientKAKOYKABELNUGEN: TStringField
      FieldName = 'KAKOYKABELNUGEN'
      Size = 252
    end
    object cdsKlientOBJEMZAGOD: TStringField
      FieldName = 'OBJEMZAGOD'
      Size = 252
    end
    object cdsKlientOBJEMZA6MESYATSEV: TStringField
      FieldName = 'OBJEMZA6MESYATSEV'
      Size = 252
    end
    object cdsKlientKTOMOGETPORUCHITSYA: TStringField
      FieldName = 'KTOMOGETPORUCHITSYA'
      Size = 252
    end
    object cdsKlientVASHIPARTNERY: TStringField
      FieldName = 'VASHIPARTNERY'
      Size = 252
    end
    object cdsKlientVASHIKONKURENTY: TStringField
      FieldName = 'VASHIKONKURENTY'
      Size = 252
    end
    object cdsKlientFINANSOVOEPOLOGENIE: TStringField
      FieldName = 'FINANSOVOEPOLOGENIE'
      Size = 252
    end
    object cdsKlientDELOVAYAREPUTACIYA: TStringField
      FieldName = 'DELOVAYAREPUTACIYA'
      Size = 252
    end
    object cdsKlientRASPOLAGAETLIKONKURENT: TStringField
      FieldName = 'RASPOLAGAETLIKONKURENT'
      Size = 252
    end
    object cdsKlientID_SFERADEYATELNOSTI: TIntegerField
      FieldName = 'ID_SFERADEYATELNOSTI'
    end
    object cdsKlientSFERA: TStringField
      FieldKind = fkLookup
      FieldName = 'SFERA'
      LookupDataSet = dmdEx.cdsSfera
      LookupKeyFields = 'OID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_SFERADEYATELNOSTI'
      Lookup = True
    end
    object cdsKlientANALOG: TStringField
      FieldKind = fkLookup
      FieldName = 'ANALOG'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_ANALOG'
      Lookup = True
    end
    object cdsKlientRESULT: TStringField
      DisplayLabel = #1056#1077#1079#1091#1083#1100#1090#1072#1090
      FieldKind = fkLookup
      FieldName = 'RESULT'
      LookupDataSet = dmdEx.cdsResult
      LookupKeyFields = 'OID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_RESULT'
      Lookup = True
    end
    object cdsKlientDAT_CONTACT: TSQLTimeStampField
      FieldName = 'DAT_CONTACT'
    end
    object cdsKlientID_RESULT: TIntegerField
      FieldName = 'ID_RESULT'
    end
    object cdsKlientMODIFIED: TSQLTimeStampField
      FieldName = 'MODIFIED'
      Required = True
    end
    object cdsKlientID_PRICE: TIntegerField
      FieldName = 'ID_PRICE'
    end
    object cdsKlientID_SKIDKA: TIntegerField
      FieldName = 'ID_SKIDKA'
    end
    object cdsKlientID_USL_POSTAVKA: TIntegerField
      FieldName = 'ID_USL_POSTAVKA'
    end
    object cdsKlientOBLAST2: TStringField
      FieldName = 'OBLAST2'
      Size = 50
    end
    object cdsKlientISDEFAULT: TSmallintField
      FieldName = 'ISDEFAULT'
    end
    object cdsKlientCREATED: TSQLTimeStampField
      DisplayLabel = #1057#1086#1079#1076#1072#1085
      DisplayWidth = 10
      FieldName = 'CREATED'
      DisplayFormat = 'dd.mm.yy'
    end
    object cdsKlientLGOTY: TIntegerField
      FieldName = 'LGOTY'
    end
    object cdsKlientPLAT_ED_NALOGA: TSmallintField
      FieldName = 'PLAT_ED_NALOGA'
    end
    object cdsKlientIS_FIZLICO: TSmallintField
      FieldName = 'IS_FIZLICO'
    end
  end
  object ActionList1: TActionList
    Left = 88
    Top = 88
    object actApply: TAction
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      OnExecute = actApplyExecute
    end
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ShortCut = 116
      OnExecute = actRefreshExecute
    end
    object actRefreshReferenceTables: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1087#1086#1076#1095#1080#1085#1105#1085#1085#1099#1077' '#1089#1087#1088#1072#1074#1086#1095#1085#1099#1077' '#1090#1072#1073#1083#1080#1094#1099' '#1074' '#1087#1072#1084#1103#1090#1080
      OnExecute = actRefreshReferenceTablesExecute
    end
    object actShowDeleted: TAction
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1091#1076#1072#1083#1105#1085#1085#1099#1077
      OnExecute = actShowDeletedExecute
    end
  end
  object MainMenu1: TMainMenu
    Left = 88
    Top = 120
    object N1: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      GroupIndex = 10
      object N2: TMenuItem
        Action = actRefresh
      end
      object N3: TMenuItem
        Action = actShowDeleted
      end
    end
  end
  object UnfFilter1: TUnfFilter
    DBGridEh = dbgClient
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
    Left = 56
    Top = 216
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmClient'
    StorageManager = rpsClientEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      'dbgClient.<P>.Columns.<ForAllItems>.Width')
    Left = 88
    Top = 184
  end
  object rpsClientEdit: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 120
    Top = 184
  end
  object qeKlient: TQueryExtender
    Query = cdsKlient
    KeyField = 'ID'
    Left = 56
    Top = 248
  end
end
