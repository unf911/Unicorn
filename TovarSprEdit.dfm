object frmTovarSprEdit: TfrmTovarSprEdit
  Left = 289
  Top = 126
  Width = 375
  Height = 420
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1086#1074
  Color = clBtnFace
  Constraints.MinHeight = 420
  Constraints.MinWidth = 375
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  DesignSize = (
    359
    382)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 8
    Width = 31
    Height = 13
    Caption = #1058#1086#1074#1072#1088
  end
  object Label4: TLabel
    Left = 12
    Top = 156
    Width = 73
    Height = 13
    Hint = #1059#1089#1090#1072#1088#1077#1074#1096#1077#1077' '#1087#1086#1083#1077' '#1077#1076#1080#1085#1080#1094' '#1080#1079#1084#1077#1088#1077#1085#1080#1103'. '#1048#1089#1087#1086#1083#1100#1079#1091#1081#1090#1077' '#1085#1086#1074#1086#1077' '#1074#1084#1077#1089#1090#1086' '#1085#1077#1075#1086
    Caption = #1045#1076'.'#1080#1079#1084' ('#1091#1089#1090#1072#1088')'
  end
  object Label8: TLabel
    Left = 12
    Top = 247
    Width = 36
    Height = 13
    Caption = #1040#1085#1072#1083#1086#1075
  end
  object Label9: TLabel
    Left = 12
    Top = 269
    Width = 19
    Height = 13
    Caption = #1042#1077#1089
  end
  object Label10: TLabel
    Left = 12
    Top = 32
    Width = 96
    Height = 13
    Caption = #1044#1083#1080#1085#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
  end
  object Label11: TLabel
    Left = 12
    Top = 204
    Width = 41
    Height = 13
    Caption = #1043#1088#1091#1087#1087#1072'1'
  end
  object Label12: TLabel
    Left = 188
    Top = 204
    Width = 41
    Height = 13
    Caption = #1043#1088#1091#1087#1087#1072'2'
  end
  object Label13: TLabel
    Left = 12
    Top = 228
    Width = 41
    Height = 13
    Caption = #1043#1088#1091#1087#1087#1072'3'
  end
  object Label14: TLabel
    Left = 188
    Top = 220
    Width = 41
    Height = 13
    Caption = #1043#1088#1091#1087#1087#1072'4'
  end
  object Label15: TLabel
    Left = 12
    Top = 293
    Width = 112
    Height = 13
    Caption = #1050#1075' '#1084#1077#1076#1080' '#1085#1072' '#1082#1084' '#1082#1072#1073#1077#1083#1103
  end
  object Label16: TLabel
    Left = 12
    Top = 317
    Width = 38
    Height = 13
    Hint = 
      #1050#1086#1076' '#1090#1086#1074#1072#1088#1085#1086#1081' '#1085#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1099' '#1076#1083#1103' '#1074#1085#1077#1096#1085#1077#1101#1082#1086#1085#1086#1084#1080#1095#1077#1089#1082#1086#1081' '#1076#1077#1103#1090#1077#1083#1100#1085#1086#1089#1090#1080'. ' +
      #1048#1089#1087#1086#1083#1100#1079#1091#1077#1090#1089#1103' '#1076#1083#1103' '#1080#1084#1087#1086#1088#1090#1085#1099#1093' '#1090#1086#1074#1072#1088#1086#1074' '#1087#1088#1080' '#1088#1072#1089#1087#1077#1095#1072#1090#1082#1077' '#1085#1072#1083#1086#1075#1086#1074#1086#1081' '#1085#1072#1082#1083 +
      #1072#1076#1085#1086#1081
    Caption = #1058#1053#1042#1069#1044
    ParentShowHint = False
    ShowHint = True
  end
  object Label17: TLabel
    Left = 12
    Top = 132
    Width = 36
    Height = 13
    Caption = #1045#1076'.'#1080#1079#1084
  end
  object dbeName: TDBEdit
    Left = 172
    Top = 4
    Width = 185
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'NAME'
    DataSource = dsTovarEdit
    TabOrder = 0
  end
  object dbeEdizm: TDBEdit
    Left = 172
    Top = 156
    Width = 185
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'EDIZ_OLD'
    DataSource = dsTovarEdit
    TabOrder = 3
  end
  object btnOk: TBitBtn
    Left = 16
    Top = 366
    Width = 129
    Height = 25
    Action = actOk
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    TabOrder = 12
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
    Left = 224
    Top = 366
    Width = 113
    Height = 25
    Action = actCancel
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 13
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
  object dbrgTipTara: TDBRadioGroup
    Left = 4
    Top = 48
    Width = 353
    Height = 81
    Anchors = [akLeft, akTop, akRight]
    Caption = #1058#1080#1087' '#1090#1086#1074#1072#1088#1072
    DataField = 'TARA'
    DataSource = dsTovarEdit
    Items.Strings = (
      #1050#1072#1073#1077#1083#1100
      #1058#1072#1088#1072
      #1059#1089#1083#1091#1075#1080)
    TabOrder = 2
    Values.Strings = (
      '2'
      '1'
      '3')
  end
  object dbcbDelmarked: TDBCheckBox
    Left = 12
    Top = 180
    Width = 345
    Height = 17
    Anchors = [akLeft, akTop, akRight]
    Caption = #1055#1086#1084#1077#1090#1082#1072' '#1085#1072' '#1091#1076#1072#1083#1077#1085#1080#1077
    DataField = 'delmarked'
    DataSource = dsTovarEdit
    TabOrder = 4
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object dblIdAnalog: TDBLookupComboboxEh
    Left = 172
    Top = 245
    Width = 185
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'id_analog'
    DataSource = dsTovarEdit
    EditButtons = <>
    KeyField = 'OID'
    ListField = 'NAME'
    ListSource = dsMainAnalog
    TabOrder = 9
    Visible = True
  end
  object dbcSkladskaya: TDBCheckBoxEh
    Left = 12
    Top = 345
    Width = 321
    Height = 17
    Caption = #1057#1082#1083#1072#1076#1089#1082#1072#1103
    DataField = 'skladskaya'
    DataSource = dsTovarEdit
    TabOrder = 11
    ValueChecked = '1'
    ValueUnchecked = '0;null'
  end
  object dbeWeight: TDBEdit
    Left = 172
    Top = 269
    Width = 185
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'WEIGHT'
    DataSource = dsTovarEdit
    TabOrder = 10
  end
  object dbeFullName: TDBEdit
    Left = 172
    Top = 28
    Width = 185
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'FULLNAME'
    DataSource = dsTovarEdit
    TabOrder = 1
  end
  object dbeGruppa1: TDBEdit
    Left = 68
    Top = 200
    Width = 109
    Height = 21
    DataField = 'GRUPPA1'
    DataSource = dsTovarEdit
    TabOrder = 5
  end
  object dbnGruppa2: TDBNumberEditEh
    Left = 240
    Top = 200
    Width = 117
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'GRUPPA2'
    DataSource = dsTovarEdit
    EditButtons = <>
    TabOrder = 6
    Visible = True
  end
  object dbnGruppa3: TDBNumberEditEh
    Left = 68
    Top = 221
    Width = 109
    Height = 21
    DataField = 'GRUPPA3'
    DataSource = dsTovarEdit
    EditButtons = <>
    TabOrder = 7
    Visible = True
  end
  object dbnGruppa4: TDBNumberEditEh
    Left = 240
    Top = 221
    Width = 117
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'GRUPPA4'
    DataSource = dsTovarEdit
    EditButtons = <>
    TabOrder = 8
    Visible = True
  end
  object dbeCopperPerKm: TDBNumberEditEh
    Left = 172
    Top = 292
    Width = 185
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'COPPERPERKM'
    DataSource = dsTovarEdit
    DecimalPlaces = 6
    EditButtons = <>
    TabOrder = 14
    Visible = True
  end
  object dbeKodVed: TDBEdit
    Left = 172
    Top = 317
    Width = 185
    Height = 21
    Hint = 
      #1050#1086#1076' '#1090#1086#1074#1072#1088#1085#1086#1081' '#1085#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1099' '#1076#1083#1103' '#1074#1085#1077#1096#1085#1077#1101#1082#1086#1085#1086#1084#1080#1095#1077#1089#1082#1086#1081' '#1076#1077#1103#1090#1077#1083#1100#1085#1086#1089#1090#1080'. ' +
      #1048#1089#1087#1086#1083#1100#1079#1091#1077#1090#1089#1103' '#1076#1083#1103' '#1080#1084#1087#1086#1088#1090#1085#1099#1093' '#1090#1086#1074#1072#1088#1086#1074' '#1087#1088#1080' '#1088#1072#1089#1087#1077#1095#1072#1090#1082#1077' '#1085#1072#1083#1086#1075#1086#1074#1086#1081' '#1085#1072#1082#1083 +
      #1072#1076#1085#1086#1081
    Anchors = [akLeft, akTop, akRight]
    DataField = 'KODVED'
    DataSource = dsTovarEdit
    ParentShowHint = False
    ShowHint = True
    TabOrder = 15
  end
  object dblEdiz: TDBLookupComboboxEh
    Left = 172
    Top = 133
    Width = 185
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'id_ediz'
    DataSource = dsTovarEdit
    EditButtons = <>
    KeyField = 'OID'
    ListField = 'NAME'
    ListSource = dsEdiz
    TabOrder = 16
    Visible = True
  end
  object ActionList1: TActionList
    Left = 84
    Top = 236
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
    object actShowMainAnalog: TAction
      Caption = 'actShowMainAnalog'
    end
  end
  object dsTovarEdit: TDataSource
    Left = 84
    Top = 196
  end
  object rpsTovarEdit: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 208
    Top = 40
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmTovarEdit'
    StorageManager = rpsTovarEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width')
    Left = 208
    Top = 72
  end
  object dsMainAnalog: TDataSource
    Left = 116
    Top = 196
  end
  object dsEdiz: TDataSource
    DataSet = dmdEx.cdsEdiz
    Left = 148
    Top = 196
  end
end
