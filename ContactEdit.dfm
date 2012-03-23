object frmContactEdit: TfrmContactEdit
  Left = 68
  Top = 151
  Width = 360
  Height = 437
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1082#1086#1085#1090#1072#1082#1090#1086#1074
  Color = clBtnFace
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
  object AutoPanel1: TAutoPanel
    Left = 0
    Top = 0
    Width = 352
    Height = 410
    AutoChildPosLeft = True
    AutoChildPosTop = True
    AutoChildWidth = True
    AutoChildHeight = True
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      352
      410)
    object Label1: TLabel
      Left = 12
      Top = 4
      Width = 49
      Height = 13
      Caption = #1060#1072#1084#1080#1083#1080#1103
    end
    object Label10: TLabel
      Left = 12
      Top = 24
      Width = 22
      Height = 13
      Caption = #1048#1084#1103
    end
    object Label11: TLabel
      Left = 12
      Top = 44
      Width = 47
      Height = 13
      Caption = #1054#1090#1095#1077#1089#1090#1074#1086
    end
    object Label5: TLabel
      Left = 12
      Top = 116
      Width = 58
      Height = 13
      Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
    end
    object Label4: TLabel
      Left = 12
      Top = 136
      Width = 79
      Height = 13
      Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
    end
    object Label2: TLabel
      Left = 12
      Top = 156
      Width = 85
      Height = 13
      Caption = #1052#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103
    end
    object Label9: TLabel
      Left = 12
      Top = 240
      Width = 26
      Height = 13
      Caption = #1044#1077#1090#1080
    end
    object Label3: TLabel
      Left = 12
      Top = 260
      Width = 31
      Height = 13
      Caption = #1061#1086#1073#1073#1080
    end
    object Label6: TLabel
      Left = 12
      Top = 280
      Width = 88
      Height = 13
      Caption = #1056#1072#1073#1086#1095#1080#1081' '#1090#1077#1083#1077#1092#1086#1085
    end
    object Label7: TLabel
      Left = 12
      Top = 300
      Width = 105
      Height = 13
      Caption = #1052#1086#1073#1080#1083#1100#1085#1099#1081' '#1090#1077#1083#1077#1092#1086#1085
    end
    object Label8: TLabel
      Left = 12
      Top = 320
      Width = 108
      Height = 13
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1081' '#1090#1077#1083
    end
    object Label12: TLabel
      Left = 12
      Top = 340
      Width = 97
      Height = 13
      Caption = #1069#1083#1077#1082#1090#1088#1086#1085#1085#1072#1103' '#1087#1086#1095#1090#1072
    end
    object dbeName: TDBEdit
      Left = 120
      Top = 4
      Width = 225
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'LASTNAME'
      DataSource = dsEdit
      TabOrder = 0
    end
    object dbeFullName: TDBEdit
      Left = 120
      Top = 24
      Width = 225
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'FIRSTNAME'
      DataSource = dsEdit
      TabOrder = 1
    end
    object DBEdit1: TDBEdit
      Left = 120
      Top = 44
      Width = 225
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'MIDDLENAME'
      DataSource = dsEdit
      TabOrder = 2
    end
    object dbrgTipTara: TDBRadioGroup
      Left = 12
      Top = 60
      Width = 333
      Height = 45
      Anchors = [akLeft, akTop, akRight]
      Caption = #1055#1086#1083
      DataField = 'SEX'
      DataSource = dsEdit
      Items.Strings = (
        #1052#1091#1078#1089#1082#1086#1081
        #1046#1077#1085#1089#1082#1080#1081)
      TabOrder = 3
      TabStop = True
      Values.Strings = (
        '2'
        '1')
    end
    object lcbSkladTo: TDBLookupComboboxEh
      Left = 120
      Top = 112
      Width = 224
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'DOLGNOST'
      DataSource = dsEdit
      DropDownBox.AutoDrop = True
      DropDownBox.Rows = 15
      EditButtons = <
        item
          ShortCut = 0
          Style = ebsMinusEh
          OnClick = lcbSkladToEditButtons0Click
        end
        item
          ShortCut = 0
          Style = ebsPlusEh
          OnClick = lcbSkladToEditButtons1Click
        end>
      TabOrder = 4
      Visible = True
    end
    object dteDat: TDBDateTimeEditEh
      Left = 120
      Top = 132
      Width = 225
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'BIRTHDAY'
      DataSource = dsEdit
      EditButtons = <>
      TabOrder = 5
      Visible = True
      EditFormat = 'DD/MM/YY'
    end
    object dbeKod2: TDBEdit
      Left = 120
      Top = 152
      Width = 225
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'BIRTHPLACE'
      DataSource = dsEdit
      TabOrder = 6
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 12
      Top = 172
      Width = 333
      Height = 61
      Anchors = [akLeft, akTop, akRight]
      Caption = #1057#1077#1084#1077#1081#1085#1086#1077' '#1087#1086#1083#1086#1078#1077#1085#1080#1077
      DataField = 'ID_MARRIAGE'
      DataSource = dsEdit
      Items.Strings = (
        #1061#1086#1083#1086#1089#1090'/'#1085#1077' '#1079#1072#1084#1091#1078#1077#1084
        #1046#1077#1085#1072#1090'/'#1079#1072#1084#1091#1078#1077#1084
        #1056#1072#1079#1074#1077#1076#1105#1085'/'#1088#1072#1079#1074#1077#1076#1077#1085#1072)
      TabOrder = 7
      Values.Strings = (
        '1'
        '2'
        '3')
    end
    object dbeWeight: TDBEdit
      Left = 120
      Top = 240
      Width = 225
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'CHILDREN'
      DataSource = dsEdit
      TabOrder = 8
    end
    object DBEdit2: TDBEdit
      Left = 120
      Top = 260
      Width = 225
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'HOBBY'
      DataSource = dsEdit
      TabOrder = 9
    end
    object DBEdit3: TDBEdit
      Left = 120
      Top = 280
      Width = 225
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'WORKPHONE'
      DataSource = dsEdit
      TabOrder = 10
    end
    object DBEdit4: TDBEdit
      Left = 120
      Top = 300
      Width = 225
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'CELLPHONE'
      DataSource = dsEdit
      TabOrder = 11
    end
    object DBEdit5: TDBEdit
      Left = 120
      Top = 320
      Width = 225
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'ADDPHONE'
      DataSource = dsEdit
      TabOrder = 12
    end
    object DBEdit6: TDBEdit
      Left = 120
      Top = 340
      Width = 225
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'EMAIL'
      DataSource = dsEdit
      TabOrder = 13
    end
    object dbcbDelmarked: TDBCheckBox
      Left = 12
      Top = 360
      Width = 333
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Caption = #1054#1089#1085#1086#1074#1085#1086#1081' '#1082#1086#1085#1090#1072#1082#1090
      DataField = 'PERSONBYDEF'
      DataSource = dsEdit
      TabOrder = 14
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object BitBtn2: TBitBtn
      Left = 220
      Top = 378
      Width = 125
      Height = 25
      Action = actCancel
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 16
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
    object BitBtn1: TBitBtn
      Left = 12
      Top = 378
      Width = 129
      Height = 25
      Action = actOk
      Anchors = [akLeft, akBottom]
      Caption = 'OK'
      TabOrder = 15
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
  object ActionList1: TActionList
    Left = 84
    Top = 116
    object actOk: TAction
      Caption = 'OK'
      ShortCut = 16397
      OnExecute = actOkExecute
    end
    object actCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = actCancelExecute
    end
  end
  object dsEdit: TDataSource
    Left = 84
    Top = 152
  end
  object rpsTovarEdit: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 208
    Top = 40
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmContactEdit'
    StorageManager = rpsTovarEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width')
    Left = 240
    Top = 72
  end
  object SQLDataSet1: TSQLDataSet
    CommandText = 'select * '#13#10'from CONTACTS_vw c'#13#10'where c.id_klient=:id_klient'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_klient'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = dmdEx.scUchet
    Left = 116
    Top = 88
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
    AfterInsert = cdsContactsAfterInsert
    BeforePost = cdsContactsBeforePost
    Left = 116
    Top = 152
    object cdsContactsOID: TIntegerField
      FieldName = 'OID'
      Required = True
    end
    object cdsContactsNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
    object cdsContactsFULLNAME: TStringField
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
      Required = True
    end
    object cdsContactsBIRTHDAY: TSQLTimeStampField
      FieldName = 'BIRTHDAY'
    end
    object cdsContactsBIRTHPLACE: TStringField
      FieldName = 'BIRTHPLACE'
      Size = 50
    end
    object cdsContactsID_MARRIAGE: TIntegerField
      FieldName = 'ID_MARRIAGE'
    end
    object cdsContactsHOBBY: TStringField
      FieldName = 'HOBBY'
      Size = 50
    end
    object cdsContactsWORKPHONE: TStringField
      FieldName = 'WORKPHONE'
      Size = 50
    end
    object cdsContactsCELLPHONE: TStringField
      FieldName = 'CELLPHONE'
      Size = 50
    end
    object cdsContactsADDPHONE: TStringField
      FieldName = 'ADDPHONE'
      Size = 50
    end
    object cdsContactsEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object cdsContactsPERSONBYDEF: TSmallintField
      FieldName = 'PERSONBYDEF'
      Required = True
    end
    object cdsContactsID_KLIENT: TIntegerField
      FieldName = 'ID_KLIENT'
      Required = True
    end
    object cdsContactsCHILDREN: TStringField
      FieldName = 'CHILDREN'
      Size = 50
    end
    object cdsContactsSEX: TSmallintField
      FieldName = 'SEX'
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLDataSet1
    Left = 116
    Top = 120
  end
end
