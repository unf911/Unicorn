object frmPerevodEdit: TfrmPerevodEdit
  Left = 254
  Top = 200
  Width = 377
  Height = 370
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1087#1077#1088#1077#1074#1086#1076#1072
  Color = clBtnFace
  Constraints.MinHeight = 370
  Constraints.MinWidth = 310
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 369
    Height = 343
    Align = alClient
    TabOrder = 0
    DesignSize = (
      369
      343)
    object Label3: TLabel
      Left = 8
      Top = 248
      Width = 53
      Height = 13
      Caption = #1052#1077#1085#1077#1076#1078#1077#1088
    end
    object Label4: TLabel
      Left = 8
      Top = 36
      Width = 26
      Height = 13
      Caption = #1044#1072#1090#1072
    end
    object Label13: TLabel
      Left = 8
      Top = 272
      Width = 70
      Height = 13
      Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
    end
    object Label15: TLabel
      Left = 8
      Top = 12
      Width = 85
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1087#1077#1088#1077#1074#1086#1076#1072
    end
    object Label1: TLabel
      Left = 8
      Top = 60
      Width = 66
      Height = 13
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1077#1083#1100
    end
    object Label7: TLabel
      Left = 8
      Top = 83
      Width = 59
      Height = 13
      Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
    end
    object Label2: TLabel
      Left = 8
      Top = 108
      Width = 90
      Height = 13
      Caption = #1057#1095#1105#1090' '#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083#1103
    end
    object Label9: TLabel
      Left = 8
      Top = 135
      Width = 83
      Height = 13
      Caption = #1057#1095#1105#1090' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
    end
    object dblCurrency: TDBText
      Left = 320
      Top = 164
      Width = 41
      Height = 17
      Anchors = [akTop, akRight]
      DataField = 'CURRENCY'
      DataSource = dsNakloEdit
    end
    object dblCurrencyTo: TDBText
      Left = 320
      Top = 188
      Width = 41
      Height = 17
      Anchors = [akTop, akRight]
      DataField = 'CURRENCY_TO'
      DataSource = dsNakloEdit
    end
    object RadioGroup1: TRadioGroup
      Left = 4
      Top = 156
      Width = 317
      Height = 85
      Anchors = [akLeft, akTop, akRight]
      ItemIndex = 2
      Items.Strings = (
        #1057#1091#1084#1084#1072' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1080#1103
        #1057#1091#1084#1084#1072' '#1087#1086#1083#1091#1095#1077#1085#1080#1103
        #1050#1091#1088#1089' '#1087#1077#1088#1077#1089#1095#1105#1090#1072)
      TabOrder = 14
      OnClick = RadioGroup1Click
    end
    object lcbMANAGER: TDBLookupComboboxEh
      Left = 112
      Top = 244
      Width = 244
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'ID_MANAGER'
      DataSource = dsNakloEdit
      DropDownBox.AutoDrop = True
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = dmdEx.dsManagerSel
      TabOrder = 12
      Visible = True
      OnKeyPress = dbeIDKeyPress
    end
    object dbeComment: TDBEdit
      Left = 112
      Top = 268
      Width = 244
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'Comment'
      DataSource = dsNakloEdit
      TabOrder = 13
      OnKeyPress = dbeIDKeyPress
    end
    object dbeID: TDBEditEh
      Left = 112
      Top = 12
      Width = 244
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'id'
      DataSource = dsNakloEdit
      EditButtons = <>
      TabOrder = 0
      Visible = True
      OnKeyPress = dbeIDKeyPress
    end
    object dteDat: TDBDateTimeEditEh
      Left = 112
      Top = 36
      Width = 244
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'dat'
      DataSource = dsNakloEdit
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 1
      Visible = True
      OnChange = dteDatChange
      OnKeyPress = dbeIDKeyPress
    end
    object btnOk: TBitBtn
      Left = 8
      Top = 307
      Width = 169
      Height = 25
      Action = actOk
      Anchors = [akLeft, akRight, akBottom]
      Caption = 'Ok'
      TabOrder = 10
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
    object btnCancel: TBitBtn
      Left = 260
      Top = 308
      Width = 97
      Height = 25
      Action = actCancel
      Anchors = [akRight, akBottom]
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 11
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object lcbIZG: TDBLookupComboboxEh
      Left = 112
      Top = 60
      Width = 244
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'IZG'
      DataSource = dsNakloEdit
      DropDownBox.AutoDrop = True
      DropDownBox.Rows = 15
      EditButtons = <>
      TabOrder = 2
      Visible = True
      OnChange = lcbIZGChange
      OnKeyPress = dbeIDKeyPress
    end
    object lcbZak: TDBLookupComboboxEh
      Left = 112
      Top = 83
      Width = 244
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'ZAK'
      DataSource = dsNakloEdit
      DropDownBox.AutoDrop = True
      DropDownBox.Rows = 15
      EditButtons = <>
      TabOrder = 3
      Visible = True
      OnChange = lcbZakChange
      OnKeyPress = dbeIDKeyPress
    end
    object lcbBankFrom: TDBLookupComboboxEh
      Left = 112
      Top = 108
      Width = 244
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'ID_SCHET_IZG'
      DataSource = dsNakloEdit
      DropDownBox.AutoDrop = True
      DropDownBox.Rows = 15
      EditButtons = <>
      KeyField = 'OID'
      ListField = 'FULLNAME'
      ListSource = dsBank
      TabOrder = 4
      Visible = True
      OnChange = lcbBankFromChange
      OnKeyPress = dbeIDKeyPress
      OnKeyValueChanged = lcbBankFromKeyValueChanged
    end
    object lcbBankTo: TDBLookupComboboxEh
      Left = 112
      Top = 132
      Width = 244
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'ID_SCHET_ZAK'
      DataSource = dsNakloEdit
      DropDownBox.AutoDrop = True
      EditButtons = <>
      KeyField = 'OID'
      ListField = 'FULLNAME'
      ListSource = dsBankTo
      TabOrder = 5
      Visible = True
      OnChange = lcbBankToChange
      OnKeyPress = dbeIDKeyPress
      OnKeyValueChanged = lcbBankToKeyValueChanged
    end
    object dneNds: TDBNumberEditEh
      Left = 160
      Top = 188
      Width = 157
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Ctl3D = True
      currency = False
      DataField = 'NDS'
      DataSource = dsNakloEdit
      DisplayFormat = '0.00'
      EditButton.Style = ebsEllipsisEh
      EditButton.Visible = True
      EditButtons = <>
      Increment = 0.010000000000000000
      ParentCtl3D = False
      TabOrder = 7
      Visible = True
      OnChange = dneNdsChange
      OnKeyPress = dbeIDKeyPress
    end
    object dneKurs: TDBNumberEditEh
      Left = 160
      Top = 212
      Width = 157
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Ctl3D = True
      currency = False
      DataField = 'KURS'
      DataSource = dsNakloEdit
      DecimalPlaces = 4
      DisplayFormat = '0.0000'
      EditButton.Style = ebsEllipsisEh
      EditButton.Visible = True
      EditButtons = <>
      Increment = 0.000100000000000000
      ParentCtl3D = False
      TabOrder = 8
      Visible = True
      OnChange = dneKursChange
      OnKeyPress = dbeIDKeyPress
    end
    object dneKursIndirect: TDBComboBoxEh
      Left = 320
      Top = 212
      Width = 45
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'KURS_INDIRECT'
      DataSource = dsNakloEdit
      DropDownBox.Width = 50
      EditButtons = <>
      Items.Strings = (
        #1055#1088#1103#1084#1086#1081' '#1082#1091#1088#1089
        #1054#1073#1088#1072#1090#1085#1099#1081' '#1082#1091#1088#1089)
      KeyItems.Strings = (
        '0'
        '1')
      TabOrder = 9
      Visible = True
      OnChange = dneKursIndirectChange
      OnKeyPress = dbeIDKeyPress
    end
    object dneNdsFrom: TDBNumberEditEh
      Left = 160
      Top = 164
      Width = 157
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Ctl3D = True
      currency = False
      DataField = 'NDS_FROM'
      DataSource = dsNakloEdit
      DisplayFormat = '0.00'
      EditButton.Style = ebsEllipsisEh
      EditButton.Visible = True
      EditButtons = <>
      Increment = 0.010000000000000000
      ParentCtl3D = False
      TabOrder = 6
      Visible = True
      OnChange = dneNdsFromChange
      OnKeyPress = dbeIDKeyPress
    end
  end
  object ActionList1: TActionList
    Left = 240
    Top = 216
    object actCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = actCancelExecute
    end
    object actApply: TAction
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      OnExecute = actApplyExecute
    end
    object actOk: TAction
      Caption = 'Ok'
      ShortCut = 16397
      OnExecute = actOkExecute
    end
    object actKursChange: TAction
      Caption = 'actKursChange'
      OnExecute = actKursChangeExecute
    end
  end
  object dsNakloEdit: TDataSource
    Left = 244
    Top = 184
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmPerevodEdit'
    StorageManager = rpsClientEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width')
    Left = 144
    Top = 144
  end
  object rpsClientEdit: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 176
    Top = 144
  end
  object sdsBank: TSQLDataSet
    CommandText = 
      'select '#13#10'   *'#13#10'from '#13#10'   bank_vw b'#13#10'where'#13#10'  b.id_klient=:id_kli' +
      'ent and '#13#10'  b.delmarked=0'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_klient'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 128
    Top = 24
  end
  object dspBank: TDataSetProvider
    DataSet = sdsBank
    Options = [poAllowCommandText]
    Left = 160
    Top = 24
  end
  object cdsBank: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_klient'
        ParamType = ptInput
        Value = Null
      end>
    ProviderName = 'dspBank'
    Left = 192
    Top = 24
    object cdsBankBANK_NAME: TStringField
      FieldName = 'BANK_NAME'
      Size = 50
    end
    object cdsBankRASCH: TStringField
      FieldName = 'RASCH'
      Size = 32
    end
    object cdsBankMFO: TFloatField
      FieldName = 'MFO'
    end
    object cdsBankID_KLIENT: TIntegerField
      FieldName = 'ID_KLIENT'
    end
    object cdsBankID_CURRENCY: TIntegerField
      FieldName = 'ID_CURRENCY'
    end
    object cdsBankOID: TIntegerField
      FieldName = 'OID'
    end
    object cdsBankDELMARKED: TSmallintField
      FieldName = 'DELMARKED'
    end
    object cdsBankFULLNAME: TStringField
      FieldName = 'FULLNAME'
      Size = 250
    end
  end
  object dsBank: TDataSource
    DataSet = cdsBank
    Left = 224
    Top = 24
  end
  object SQLDataSet1: TSQLDataSet
    CommandText = 
      'select '#13#10'   *'#13#10'from '#13#10'   bank_vw b'#13#10'where'#13#10'  b.id_klient=:id_kli' +
      'ent and'#13#10'  b.delmarked=0'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_klient'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 128
    Top = 56
  end
  object dspBankZak: TDataSetProvider
    DataSet = SQLDataSet1
    Options = [poAllowCommandText]
    Left = 160
    Top = 56
  end
  object cdsBankTo: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_klient'
        ParamType = ptInput
        Value = Null
      end>
    ProviderName = 'dspBankZak'
    Left = 192
    Top = 56
    object cdsBankToBANK_NAME: TStringField
      FieldName = 'BANK_NAME'
      Size = 50
    end
    object cdsBankToRASCH: TStringField
      FieldName = 'RASCH'
      Size = 32
    end
    object cdsBankToMFO: TFloatField
      FieldName = 'MFO'
    end
    object cdsBankToID_KLIENT: TIntegerField
      FieldName = 'ID_KLIENT'
    end
    object cdsBankToID_CURRENCY: TIntegerField
      FieldName = 'ID_CURRENCY'
    end
    object cdsBankToOID: TIntegerField
      FieldName = 'OID'
    end
    object cdsBankToDELMARKED: TSmallintField
      FieldName = 'DELMARKED'
    end
    object cdsBankToFULLNAME: TStringField
      FieldName = 'FULLNAME'
      Size = 250
    end
  end
  object dsBankTo: TDataSource
    DataSet = cdsBankTo
    Left = 224
    Top = 56
  end
end
