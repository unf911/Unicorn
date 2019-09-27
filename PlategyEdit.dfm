object frmPlategyEdit: TfrmPlategyEdit
  Left = 693
  Top = 455
  Width = 331
  Height = 397
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1080#1089#1093#1086#1076#1103#1097#1080#1093' '#1087#1083#1072#1090#1077#1078#1077#1081
  Color = clBtnFace
  Constraints.MinHeight = 397
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
    Width = 323
    Height = 370
    Align = alClient
    TabOrder = 0
    DesignSize = (
      323
      370)
    object Label3: TLabel
      Left = 8
      Top = 156
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
      Top = 236
      Width = 70
      Height = 13
      Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
    end
    object Label15: TLabel
      Left = 8
      Top = 12
      Width = 91
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
    end
    object lblIzg: TLabel
      Left = 8
      Top = 84
      Width = 58
      Height = 13
      Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
    end
    object lblZak: TLabel
      Left = 8
      Top = 107
      Width = 37
      Height = 13
      Caption = #1060#1080#1088#1084#1072
    end
    object Label2: TLabel
      Left = 8
      Top = 132
      Width = 62
      Height = 13
      Caption = #1057#1095#1105#1090' '#1092#1080#1088#1084#1099
    end
    object Label6: TLabel
      Left = 8
      Top = 211
      Width = 34
      Height = 13
      Caption = #1057#1091#1084#1084#1072
    end
    object lblCurrency: TLabel
      Left = 8
      Top = 183
      Width = 38
      Height = 13
      Caption = #1042#1072#1083#1102#1090#1072
    end
    object Label11: TLabel
      Left = 8
      Top = 59
      Width = 67
      Height = 13
      Caption = #1061#1086#1079#1086#1087#1077#1088#1072#1094#1080#1103
    end
    object lblAgent: TLabel
      Left = 8
      Top = 260
      Width = 29
      Height = 13
      Caption = #1040#1075#1077#1085#1090
    end
    object lblZatraty: TLabel
      Left = 8
      Top = 308
      Width = 61
      Height = 13
      Caption = '% '#1082#1086#1084#1080#1089#1089#1080#1080
    end
    object lblNdsFrom: TLabel
      Left = 8
      Top = 284
      Width = 87
      Height = 13
      Caption = #1057#1091#1084#1084#1072' '#1082#1086#1084#1080#1089#1089#1080#1080
    end
    object lcbMANAGER: TDBLookupComboboxEh
      Left = 112
      Top = 156
      Width = 198
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'ID_MANAGER'
      DataSource = dsNakloEdit
      DropDownBox.AutoDrop = True
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = dmdEx.dsManagerSel
      TabOrder = 6
      Visible = True
      OnKeyPress = dbeIDKeyPress
    end
    object dbeComment: TDBEdit
      Left = 112
      Top = 228
      Width = 198
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'Comment'
      DataSource = dsNakloEdit
      TabOrder = 9
      OnKeyPress = dbeIDKeyPress
    end
    object dbeID: TDBEditEh
      Left = 112
      Top = 12
      Width = 198
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
      Width = 198
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'dat'
      DataSource = dsNakloEdit
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 1
      Visible = True
      OnKeyPress = dbeIDKeyPress
    end
    object btnOk: TBitBtn
      Left = 8
      Top = 338
      Width = 133
      Height = 25
      Action = actOk
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Ok'
      TabOrder = 13
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
      Left = 196
      Top = 338
      Width = 115
      Height = 25
      Action = actCancel
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 14
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
      Top = 84
      Width = 198
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'ID_IZG'
      DataSource = dsNakloEdit
      DropDownBox.AutoDrop = True
      DropDownBox.Rows = 15
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = dmdEx.dsClient
      TabOrder = 3
      Visible = True
      OnChange = lcbIZGChange
      OnKeyPress = dbeIDKeyPress
    end
    object lcbZak: TDBLookupComboboxEh
      Left = 112
      Top = 107
      Width = 198
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'ZAK'
      DataSource = dsNakloEdit
      DropDownBox.AutoDrop = True
      DropDownBox.Rows = 15
      EditButtons = <>
      TabOrder = 4
      Visible = True
      OnChange = lcbZakChange
      OnKeyPress = dbeIDKeyPress
    end
    object lcbBankFrom: TDBLookupComboboxEh
      Left = 112
      Top = 132
      Width = 198
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'ID_SKLAD'
      DataSource = dsNakloEdit
      DropDownBox.AutoDrop = True
      DropDownBox.Rows = 15
      EditButtons = <>
      KeyField = 'OID'
      ListField = 'FULLNAME'
      ListSource = dsBank
      TabOrder = 5
      Visible = True
      OnChange = lcbBankFromChange
      OnEnter = lcbBankFromEnter
      OnKeyPress = dbeIDKeyPress
    end
    object lcbCurrency: TDBLookupComboboxEh
      Left = 112
      Top = 180
      Width = 198
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      DataField = 'CURRENCY'
      DataSource = dsNakloEdit
      DropDownBox.AutoDrop = True
      Enabled = False
      EditButtons = <>
      TabOrder = 7
      Visible = True
    end
    object dneNds: TDBNumberEditEh
      Left = 112
      Top = 204
      Width = 198
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
      TabOrder = 8
      Visible = True
      OnChange = dneNdsChange
      OnKeyPress = dbeIDKeyPress
    end
    object lcbXozOper: TDBLookupComboboxEh
      Left = 112
      Top = 59
      Width = 198
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'XOZ_OPER'
      DataSource = dsNakloEdit
      DropDownBox.AutoDrop = True
      DropDownBox.Rows = 15
      EditButtons = <>
      TabOrder = 2
      Visible = True
      OnChange = lcbXozOperChange
      OnKeyPress = dbeIDKeyPress
    end
    object lcbAgent: TDBLookupComboboxEh
      Left = 112
      Top = 252
      Width = 198
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'ID_CURRENCY_TO'
      DataSource = dsNakloEdit
      DropDownBox.AutoDrop = True
      EditButtons = <
        item
          Style = ebsMinusEh
          OnClick = lcbAgentEditButtons0Click
        end>
      KeyField = 'OID'
      ListField = 'NAME'
      ListSource = dmdEx.dsAgent
      TabOrder = 10
      Visible = True
      OnKeyPress = dbeIDKeyPress
    end
    object dneZatraty: TDBNumberEditEh
      Left = 112
      Top = 300
      Width = 198
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Ctl3D = True
      currency = False
      DataField = 'ZATRATY'
      DataSource = dsNakloEdit
      DisplayFormat = '0.00'
      EditButton.Style = ebsEllipsisEh
      EditButton.Visible = True
      EditButtons = <>
      Increment = 0.010000000000000000
      ParentCtl3D = False
      TabOrder = 12
      Visible = True
      OnChange = dneZatratyChange
      OnKeyPress = dbeIDKeyPress
    end
    object dneNdsFrom: TDBNumberEditEh
      Left = 112
      Top = 276
      Width = 198
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
      TabOrder = 11
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
    end
  end
  object dsNakloEdit: TDataSource
    Left = 244
    Top = 184
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmPlategyEdit'
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
      'ent and'#13#10'  b.delmarked=0'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
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
end
