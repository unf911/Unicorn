object frmReysSprEdit: TfrmReysSprEdit
  Left = 276
  Top = 204
  Width = 352
  Height = 360
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1088#1077#1081#1089#1072
  Color = clBtnFace
  Constraints.MinHeight = 360
  Constraints.MinWidth = 351
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  DesignSize = (
    336
    322)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 60
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1072#1074#1090#1086
  end
  object Label3: TLabel
    Left = 16
    Top = 40
    Width = 59
    Height = 13
    Caption = #1044#1072#1090#1072' '#1088#1077#1081#1089#1072
  end
  object Label2: TLabel
    Left = 16
    Top = 64
    Width = 77
    Height = 13
    Caption = #1060#1048#1054' '#1074#1086#1076#1080#1090#1077#1083#1103
  end
  object Label4: TLabel
    Left = 16
    Top = 88
    Width = 61
    Height = 13
    Caption = #1055#1077#1088#1077#1074#1086#1079#1095#1080#1082
  end
  object Label5: TLabel
    Left = 16
    Top = 112
    Width = 79
    Height = 13
    Caption = #1055#1091#1085#1082#1090' '#1079#1072#1075#1088#1091#1079#1082#1080
  end
  object Label6: TLabel
    Left = 16
    Top = 136
    Width = 79
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1087#1088#1080#1094#1077#1087#1072
  end
  object Label7: TLabel
    Left = 16
    Top = 160
    Width = 59
    Height = 13
    Caption = #1062#1077#1085#1072' '#1088#1077#1081#1089#1072
  end
  object Label8: TLabel
    Left = 16
    Top = 184
    Width = 70
    Height = 13
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
  end
  object Label9: TLabel
    Left = 16
    Top = 227
    Width = 111
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1087#1088#1072#1074' '#1074#1086#1076#1080#1090#1077#1083#1103
  end
  object Label10: TLabel
    Left = 16
    Top = 251
    Width = 76
    Height = 13
    Caption = #1042#1080#1076' '#1087#1077#1088#1077#1074#1086#1079#1086#1082
  end
  object dbeNomerAvto: TDBEdit
    Left = 176
    Top = 8
    Width = 162
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'NOMER_AVTO'
    DataSource = dsSkladEdit
    TabOrder = 0
  end
  object btnOk: TBitBtn
    Left = 16
    Top = 302
    Width = 129
    Height = 25
    Action = actOk
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    TabOrder = 9
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
    Left = 223
    Top = 302
    Width = 113
    Height = 25
    Action = actCancel
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 10
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
  object lcbPEREVOZCHIK: TDBLookupComboboxEh
    Left = 176
    Top = 80
    Width = 162
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'PEREVOZCHIK'
    DataSource = dsSkladEdit
    DropDownBox.AutoDrop = True
    EditButtons = <>
    TabOrder = 3
    Visible = True
  end
  object dbeFIOVoditelya: TDBEdit
    Left = 176
    Top = 56
    Width = 162
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'FIO_VODITELYA'
    DataSource = dsSkladEdit
    TabOrder = 2
  end
  object dbeNomerPritsepa: TDBEdit
    Left = 176
    Top = 128
    Width = 162
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'NOMER_PRITSEPA'
    DataSource = dsSkladEdit
    TabOrder = 5
  end
  object dbePunktZagruzki: TDBEdit
    Left = 176
    Top = 104
    Width = 162
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'PUNKT_ZAGRUZKI'
    DataSource = dsSkladEdit
    TabOrder = 4
  end
  object dteDat: TDBDateTimeEditEh
    Left = 176
    Top = 32
    Width = 162
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'DAT_REYS'
    DataSource = dsSkladEdit
    EditButtons = <>
    Kind = dtkDateEh
    TabOrder = 1
    Visible = True
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 273
    Width = 322
    Height = 21
    Action = actVygruzka
    Anchors = [akLeft, akTop, akRight]
    Caption = #1055#1091#1085#1082#1090#1099' '#1074#1099#1075#1088#1091#1079#1082#1080
    TabOrder = 11
  end
  object dbcPokupatelPlatit: TDBCheckBoxEh
    Left = 16
    Top = 205
    Width = 322
    Height = 15
    Alignment = taLeftJustify
    Anchors = [akLeft, akTop, akRight]
    BiDiMode = bdLeftToRight
    Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100' '#1087#1083#1072#1090#1080#1090
    DataField = 'POKUPATEL_PLATIT'
    DataSource = dsSkladEdit
    ParentBiDiMode = False
    TabOrder = 8
    ValueChecked = '1'
    ValueUnchecked = '0;null'
  end
  object dneCena: TDBNumberEditEh
    Left = 176
    Top = 152
    Width = 162
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Ctl3D = True
    currency = False
    DataField = 'CENA_REYSA'
    DataSource = dsSkladEdit
    DisplayFormat = '0.00'
    EditButton.Style = ebsEllipsisEh
    EditButtons = <>
    Increment = 0.010000000000000000
    ParentCtl3D = False
    TabOrder = 6
    Visible = True
  end
  object dbeComment: TDBEdit
    Left = 176
    Top = 176
    Width = 162
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'COMMENT'
    DataSource = dsSkladEdit
    TabOrder = 7
  end
  object dbeNomerPrav: TDBEdit
    Left = 174
    Top = 224
    Width = 162
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'NOMER_PRAV'
    DataSource = dsSkladEdit
    TabOrder = 12
  end
  object dbeVidPerevozok: TDBEdit
    Left = 174
    Top = 248
    Width = 162
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'VID_PEREVOZOK'
    DataSource = dsSkladEdit
    TabOrder = 13
  end
  object ActionList1: TActionList
    Left = 160
    Top = 48
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
    object actVygruzka: TAction
      Caption = #1055#1091#1085#1082#1090#1099' '#1074#1099#1075#1088#1091#1079#1082#1080
      OnExecute = actVygruzkaExecute
    end
  end
  object dsSkladEdit: TDataSource
    Left = 120
    Top = 48
  end
  object rpsTovarEdit: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 208
    Top = 40
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmReysSprEdit'
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
end
