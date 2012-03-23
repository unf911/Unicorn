object frmDogovor: TfrmDogovor
  Left = 171
  Top = 201
  Width = 421
  Height = 186
  Caption = #1044#1086#1075#1086#1074#1086#1088#1072
  Color = clBtnFace
  Constraints.MinHeight = 186
  Constraints.MinWidth = 421
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    405
    148)
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 184
    Top = 129
    Width = 97
    Height = 25
    Action = actOk
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    TabOrder = 0
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
  object dbgSchet: TDBGridEh
    Left = 0
    Top = 0
    Width = 335
    Height = 127
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgSchetDblClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'DAT'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'ID'
        Footers = <>
      end
      item
        Checkboxes = True
        EditButtons = <>
        FieldName = 'IS_DEFAULT'
        Footers = <>
        KeyList.Strings = (
          '1'
          '0')
      end
      item
        Checkboxes = True
        EditButtons = <>
        FieldName = 'DELMARKED'
        Footers = <>
        KeyList.Strings = (
          '1'
          '0')
      end>
  end
  object Panel1: TPanel
    Left = 330
    Top = 0
    Width = 75
    Height = 148
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      75
      148)
    object Button2: TButton
      Left = 6
      Top = 68
      Width = 70
      Height = 25
      Action = actDelete
      Anchors = [akTop, akRight]
      TabOrder = 0
      TabStop = False
    end
    object Button3: TButton
      Left = 6
      Top = 36
      Width = 70
      Height = 25
      Action = actEdit
      Anchors = [akTop, akRight]
      TabOrder = 1
      TabStop = False
    end
    object Button1: TButton
      Left = 6
      Top = 4
      Width = 70
      Height = 25
      Action = actInsert
      Anchors = [akTop, akRight]
      TabOrder = 2
      TabStop = False
    end
    object BitBtn2: TBitBtn
      Left = 6
      Top = 100
      Width = 70
      Height = 25
      Action = actRefresh
      Anchors = [akTop, akRight]
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 3
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
        33333333333F8888883F33330000324334222222443333388F3833333388F333
        000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
        F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
        223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
        3338888300003AAAAAAA33333333333888888833333333330000333333333333
        333333333333333333FFFFFF000033333333333344444433FFFF333333888888
        00003A444333333A22222438888F333338F3333800003A2243333333A2222438
        F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
        22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
        33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
        3333333333338888883333330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object ActionList1: TActionList
    Left = 40
    Top = 40
    object actOk: TAction
      Caption = 'OK'
      OnExecute = actOkExecute
    end
    object actCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
    end
    object actDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnExecute = actDeleteExecute
    end
    object actInsert: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnExecute = actInsertExecute
    end
    object actEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      OnExecute = actEditExecute
    end
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnExecute = actRefreshExecute
    end
  end
  object sdsSchet: TSQLDataSet
    CommandText = 
      'select '#13#10'    ID_DOGOVOR,'#13#10'    ID_KLIENT,'#13#10'    DAT,'#13#10'    ID,'#13#10'   ' +
      ' IS_DEFAULT,'#13#10'    DELMARKED,'#13#10'    PREDMET,'#13#10'    ADRES,'#13#10'    ID_C' +
      'ONTACT,'#13#10'    TIP_DOGOVORA'#13#10'from DOGOVOR_VW d'#13#10'where'#13#10'  id_klient' +
      '=:id_klient and'#13#10'  delmarked=0'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_klient'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = dmdEx.scUchet
    Left = 104
    Top = 40
    object sdsSchetID_DOGOVOR: TIntegerField
      FieldName = 'ID_DOGOVOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsSchetID_KLIENT: TIntegerField
      FieldName = 'ID_KLIENT'
    end
    object sdsSchetDAT: TSQLTimeStampField
      FieldName = 'DAT'
      Required = True
    end
    object sdsSchetID: TStringField
      FieldName = 'ID'
      Size = 30
    end
    object sdsSchetIS_DEFAULT: TIntegerField
      FieldName = 'IS_DEFAULT'
    end
    object sdsSchetDELMARKED: TSmallintField
      FieldName = 'DELMARKED'
      Required = True
    end
    object sdsSchetPREDMET: TStringField
      FieldName = 'PREDMET'
      Size = 250
    end
    object sdsSchetADRES: TStringField
      FieldName = 'ADRES'
      Size = 250
    end
    object sdsSchetID_CONTACT: TIntegerField
      FieldName = 'ID_CONTACT'
    end
    object sdsSchetTIP_DOGOVORA: TStringField
      FieldName = 'TIP_DOGOVORA'
      Size = 250
    end
  end
  object dspSchet: TDataSetProvider
    DataSet = sdsSchet
    Options = [poPropogateChanges]
    UpdateMode = upWhereKeyOnly
    OnGetTableName = dspSchetGetTableName
    Left = 136
    Top = 40
  end
  object cdsSchet: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_klient'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspSchet'
    AfterInsert = cdsSchetAfterInsert
    BeforePost = cdsSchetBeforePost
    Left = 168
    Top = 40
    object cdsSchetID_DOGOVOR: TIntegerField
      FieldName = 'ID_DOGOVOR'
      Required = True
      Visible = False
    end
    object cdsSchetID_KLIENT: TIntegerField
      FieldName = 'ID_KLIENT'
      Visible = False
    end
    object cdsSchetDAT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 10
      FieldName = 'DAT'
      Required = True
      DisplayFormat = 'dd.mm.yy'
    end
    object cdsSchetID: TStringField
      DisplayLabel = #8470' '#1076#1086#1075#1086#1074#1086#1088#1072
      DisplayWidth = 20
      FieldName = 'ID'
      Size = 30
    end
    object cdsSchetIS_DEFAULT: TIntegerField
      DisplayLabel = #1054#1089#1085#1086#1074#1085#1086#1081' '#1076#1086#1075#1086#1074#1086#1088
      DisplayWidth = 15
      FieldName = 'IS_DEFAULT'
    end
    object cdsSchetDELMARKED: TSmallintField
      DisplayLabel = #1059#1076#1072#1083#1105#1085
      DisplayWidth = 5
      FieldName = 'DELMARKED'
      Required = True
    end
    object cdsSchetPREDMET: TStringField
      FieldName = 'PREDMET'
      Size = 250
    end
    object cdsSchetADRES: TStringField
      FieldName = 'ADRES'
      Size = 250
    end
    object cdsSchetID_CONTACT: TIntegerField
      FieldName = 'ID_CONTACT'
    end
    object cdsSchetCONTACT: TStringField
      DisplayLabel = #1050#1086#1085#1090#1072#1082#1090
      FieldKind = fkLookup
      FieldName = 'CONTACT'
      LookupDataSet = cdsContacts
      LookupKeyFields = 'OID'
      LookupResultField = 'FULLNAME'
      KeyFields = 'ID_CONTACT'
      Lookup = True
    end
    object cdsSchetTIP_DOGOVORA: TStringField
      FieldName = 'TIP_DOGOVORA'
      Size = 250
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsSchet
    Left = 200
    Top = 40
  end
  object UnfFilter1: TUnfFilter
    DBGridEh = dbgSchet
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
    Left = 72
    Top = 40
  end
  object rpsClientEdit: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 72
    Top = 72
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmDogovor'
    StorageManager = rpsClientEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width')
    Left = 40
    Top = 72
  end
  object SQLDataSet1: TSQLDataSet
    CommandText = 
      'select * '#13#10'from CONTACTS_vw c'#13#10'where c.id_klient=:id_klient and'#13 +
      #10'  c.delmarked=0'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_klient'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = dmdEx.scUchet
    Left = 368
    Top = 4
    object SQLDataSet1OID: TIntegerField
      FieldName = 'OID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SQLDataSet1NAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
    object SQLDataSet1FULLNAME: TStringField
      FieldName = 'FULLNAME'
      Size = 250
    end
    object SQLDataSet1DELMARKED: TSmallintField
      FieldName = 'DELMARKED'
      Required = True
    end
    object SQLDataSet1LASTNAME: TStringField
      FieldName = 'LASTNAME'
      Size = 50
    end
    object SQLDataSet1FIRSTNAME: TStringField
      FieldName = 'FIRSTNAME'
      Size = 50
    end
    object SQLDataSet1MIDDLENAME: TStringField
      FieldName = 'MIDDLENAME'
      Size = 50
    end
    object SQLDataSet1BIRTHDAY: TSQLTimeStampField
      FieldName = 'BIRTHDAY'
    end
    object SQLDataSet1BIRTHPLACE: TStringField
      FieldName = 'BIRTHPLACE'
      Size = 50
    end
    object SQLDataSet1ID_MARRIAGE: TIntegerField
      FieldName = 'ID_MARRIAGE'
    end
    object SQLDataSet1CHILDREN: TStringField
      FieldName = 'CHILDREN'
      Size = 50
    end
    object SQLDataSet1HOBBY: TStringField
      FieldName = 'HOBBY'
      Size = 50
    end
    object SQLDataSet1WORKPHONE: TStringField
      FieldName = 'WORKPHONE'
      Size = 50
    end
    object SQLDataSet1CELLPHONE: TStringField
      FieldName = 'CELLPHONE'
      Size = 50
    end
    object SQLDataSet1ADDPHONE: TStringField
      FieldName = 'ADDPHONE'
      Size = 50
    end
    object SQLDataSet1EMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object SQLDataSet1PERSONBYDEF: TSmallintField
      FieldName = 'PERSONBYDEF'
      Required = True
    end
    object SQLDataSet1ID_KLIENT: TIntegerField
      FieldName = 'ID_KLIENT'
      Required = True
    end
    object SQLDataSet1SEX: TSmallintField
      FieldName = 'SEX'
    end
    object SQLDataSet1ID_DOLGNOST: TIntegerField
      FieldName = 'ID_DOLGNOST'
    end
    object SQLDataSet1ID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLDataSet1
    UpdateMode = upWhereKeyOnly
    Left = 368
    Top = 36
  end
  object cdsContacts: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_klient'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'DataSetProvider1'
    Left = 368
    Top = 68
    object cdsContactsOID: TIntegerField
      FieldName = 'OID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsContactsNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
    object cdsContactsFULLNAME: TStringField
      DisplayLabel = #1060#1048#1054
      FieldName = 'FULLNAME'
      Size = 250
    end
    object cdsContactsDELMARKED: TSmallintField
      FieldName = 'DELMARKED'
      Required = True
    end
    object cdsContactsLASTNAME: TStringField
      FieldName = 'LASTNAME'
      Size = 50
    end
    object cdsContactsFIRSTNAME: TStringField
      FieldName = 'FIRSTNAME'
      Size = 50
    end
    object cdsContactsMIDDLENAME: TStringField
      FieldName = 'MIDDLENAME'
      Size = 50
    end
    object cdsContactsID_DOLGNOST: TIntegerField
      FieldName = 'ID_DOLGNOST'
    end
    object cdsContactsBIRTHDAY: TSQLTimeStampField
      DisplayLabel = #1044#1077#1085#1100' '#1088#1086#1078#1076#1077#1085#1080#1103
      FieldName = 'BIRTHDAY'
      DisplayFormat = 'dd.mm.yy'
    end
    object cdsContactsBIRTHPLACE: TStringField
      DisplayLabel = #1052#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103
      FieldName = 'BIRTHPLACE'
      Size = 50
    end
    object cdsContactsID_MARRIAGE: TIntegerField
      FieldName = 'ID_MARRIAGE'
    end
    object cdsContactsHOBBY: TStringField
      DisplayLabel = #1061#1086#1073#1073#1080
      FieldName = 'HOBBY'
      Size = 50
    end
    object cdsContactsWORKPHONE: TStringField
      DisplayLabel = #1056#1072#1073#1086#1095#1080#1081' '#1090#1077#1083#1077#1092#1086#1085
      FieldName = 'WORKPHONE'
      Size = 50
    end
    object cdsContactsCELLPHONE: TStringField
      DisplayLabel = #1052#1086#1073#1080#1083#1100#1085#1099#1081' '#1090#1077#1083#1077#1092#1086#1085
      FieldName = 'CELLPHONE'
      Size = 50
    end
    object cdsContactsADDPHONE: TStringField
      DisplayLabel = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1081' '#1090#1077#1083
      FieldName = 'ADDPHONE'
      Size = 50
    end
    object cdsContactsEMAIL: TStringField
      DisplayLabel = #1069#1083#1077#1082#1090#1088#1086#1085#1085#1072#1103' '#1087#1086#1095#1090#1072
      FieldName = 'EMAIL'
      Size = 50
    end
    object cdsContactsPERSONBYDEF: TSmallintField
      DisplayLabel = #1054#1089#1085#1086#1074#1085#1086#1081
      FieldName = 'PERSONBYDEF'
      Required = True
    end
    object cdsContactsID_KLIENT: TIntegerField
      FieldName = 'ID_KLIENT'
      Required = True
    end
    object cdsContactsCHILDREN: TStringField
      DisplayLabel = #1044#1077#1090#1080
      FieldName = 'CHILDREN'
      Size = 50
    end
    object cdsContactsDOLGNOST: TStringField
      DisplayLabel = #1044#1086#1083#1078#1085#1086#1089#1090#1100
      FieldKind = fkLookup
      FieldName = 'DOLGNOST'
      LookupDataSet = dmdEx.cdsDolgnost
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_DOLGNOST'
      Lookup = True
    end
    object cdsContactsSEX: TSmallintField
      FieldName = 'SEX'
    end
    object cdsContactsID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
    end
    object cdsContactsMANAGER: TStringField
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
  end
  object dsContacts: TDataSource
    DataSet = cdsContacts
    Left = 368
    Top = 100
  end
end
