object frmZakazDet: TfrmZakazDet
  Left = 293
  Top = 307
  Width = 322
  Height = 303
  Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103' '#1079#1072#1082#1072#1079#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    314
    276)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 8
    Top = 16
    Width = 31
    Height = 13
    Caption = #1058#1086#1074#1072#1088
  end
  object Label5: TLabel
    Left = 8
    Top = 40
    Width = 34
    Height = 13
    Caption = #1050#1086#1083'-'#1074#1086
  end
  object Label1: TLabel
    Left = 8
    Top = 64
    Width = 76
    Height = 13
    Caption = #1058#1086#1074#1072#1088' '#1090#1077#1082#1089#1090#1086#1084
  end
  object Label3: TLabel
    Left = 8
    Top = 88
    Width = 89
    Height = 13
    Caption = #1055#1088#1077#1076#1077#1083#1100#1085#1072#1103' '#1094#1077#1085#1072
  end
  object Label4: TLabel
    Left = 8
    Top = 112
    Width = 104
    Height = 13
    Caption = #1058#1086#1074#1072#1088' '#1086#1090' '#1089#1085#1072#1073#1078#1077#1085#1080#1103
  end
  object Label6: TLabel
    Left = 8
    Top = 136
    Width = 58
    Height = 13
    Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
  end
  object Label7: TLabel
    Left = 8
    Top = 184
    Width = 98
    Height = 13
    Caption = #1057#1088#1086#1082' '#1080#1079#1075#1086#1090#1086#1074#1083#1077#1085#1080#1103
  end
  object Label8: TLabel
    Left = 8
    Top = 208
    Width = 70
    Height = 13
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
  end
  object Label9: TLabel
    Left = 8
    Top = 160
    Width = 85
    Height = 13
    Caption = #1062#1077#1085#1072' '#1089#1085#1072#1073#1078#1077#1085#1080#1103
  end
  object btnCancel: TBitBtn
    Left = 197
    Top = 243
    Width = 105
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
  object btnOk: TBitBtn
    Left = 8
    Top = 243
    Width = 113
    Height = 25
    Action = actOk
    Anchors = [akLeft, akBottom]
    Caption = 'Ok'
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
  object lcbTovar: TDBLookupComboboxEh
    Left = 144
    Top = 16
    Width = 154
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'TOVAR'
    DataSource = dsNaklotEdit
    DropDownBox.AutoDrop = True
    DropDownBox.Rows = 15
    EditButtons = <>
    TabOrder = 0
    Visible = True
    OnKeyPress = lcbTovarKeyPress
  end
  object dneKolotp: TDBNumberEditEh
    Left = 144
    Top = 40
    Width = 154
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Ctl3D = True
    currency = True
    DataField = 'KOLOTP'
    DataSource = dsNaklotEdit
    DecimalPlaces = 4
    DisplayFormat = '0.000'
    EditButton.Style = ebsUpDownEh
    EditButton.Visible = True
    EditButtons = <>
    Increment = 0.001000000000000000
    ParentCtl3D = False
    TabOrder = 1
    Visible = True
    OnKeyPress = lcbTovarKeyPress
  end
  object dbeTovarText: TDBEdit
    Left = 144
    Top = 64
    Width = 154
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'TOVAR_TEXT'
    DataSource = dsNaklotEdit
    TabOrder = 2
    OnKeyPress = lcbTovarKeyPress
  end
  object dneCena: TDBNumberEditEh
    Left = 144
    Top = 88
    Width = 154
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Ctl3D = True
    currency = True
    DataField = 'CENA'
    DataSource = dsNaklotEdit
    DecimalPlaces = 4
    DisplayFormat = '0.000'
    EditButton.Style = ebsUpDownEh
    EditButton.Visible = True
    EditButtons = <>
    Increment = 0.001000000000000000
    ParentCtl3D = False
    TabOrder = 3
    Visible = True
    OnKeyPress = lcbTovarKeyPress
  end
  object dblTovarSnab: TDBLookupComboboxEh
    Left = 144
    Top = 112
    Width = 154
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'TOVAR_SNAB'
    DataSource = dsNaklotEdit
    DropDownBox.AutoDrop = True
    DropDownBox.Rows = 15
    EditButtons = <>
    TabOrder = 4
    Visible = True
    OnKeyPress = lcbTovarKeyPress
  end
  object dblPostSnab: TDBLookupComboboxEh
    Left = 144
    Top = 136
    Width = 154
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'POST'
    DataSource = dsNaklotEdit
    DropDownBox.AutoDrop = True
    DropDownBox.Rows = 15
    EditButtons = <>
    TabOrder = 5
    Visible = True
    OnKeyPress = lcbTovarKeyPress
  end
  object dbeComment: TDBEdit
    Left = 144
    Top = 208
    Width = 154
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'COMMENT_SNAB'
    DataSource = dsNaklotEdit
    TabOrder = 8
    OnKeyPress = lcbTovarKeyPress
  end
  object dbnCenaSnab: TDBNumberEditEh
    Left = 144
    Top = 160
    Width = 154
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Ctl3D = True
    currency = True
    DataField = 'CENA_SNAB'
    DataSource = dsNaklotEdit
    DecimalPlaces = 4
    DisplayFormat = '0.000'
    EditButton.Style = ebsUpDownEh
    EditButton.Visible = True
    EditButtons = <>
    Increment = 0.001000000000000000
    ParentCtl3D = False
    TabOrder = 6
    Visible = True
    OnKeyPress = lcbTovarKeyPress
  end
  object dbeSrokSnab: TDBEdit
    Left = 144
    Top = 184
    Width = 154
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'SROK_SNAB_TEXT'
    DataSource = dsNaklotEdit
    TabOrder = 7
    OnKeyPress = lcbTovarKeyPress
  end
  object dsNaklotEdit: TDataSource
    Left = 72
    Top = 8
  end
  object ActionList1: TActionList
    Left = 72
    Top = 40
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
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmZakazDet'
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
end
