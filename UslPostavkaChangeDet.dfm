object frmUslPostavkaChangeDet: TfrmUslPostavkaChangeDet
  Left = 390
  Top = 237
  Width = 362
  Height = 294
  Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1091#1089#1083#1086#1074#1080#1081' '#1087#1086#1089#1090#1072#1074#1082#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    354
    267)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 8
    Top = 32
    Width = 31
    Height = 13
    Caption = #1058#1086#1074#1072#1088
  end
  object Label1: TLabel
    Left = 8
    Top = 56
    Width = 68
    Height = 13
    Caption = #1058#1088#1072#1085#1089#1087#1086#1088#1090', %'
  end
  object Label12: TLabel
    Left = 8
    Top = 9
    Width = 94
    Height = 13
    Caption = #1059#1089#1083#1086#1074#1080#1103' '#1087#1086#1089#1090#1072#1074#1082#1080
    WordWrap = True
  end
  object Label3: TLabel
    Left = 8
    Top = 80
    Width = 39
    Height = 13
    Caption = #1058#1072#1088#1072', %'
  end
  object Label4: TLabel
    Left = 8
    Top = 104
    Width = 52
    Height = 13
    Caption = #1042#1072#1083#1102#1090#1072', %'
  end
  object Label5: TLabel
    Left = 8
    Top = 128
    Width = 61
    Height = 13
    Caption = #1058#1072#1084#1086#1078#1085#1103', %'
  end
  object Label6: TLabel
    Left = 8
    Top = 152
    Width = 72
    Height = 13
    Caption = '% '#1087#1088#1077#1076#1086#1087#1083#1072#1090#1099
  end
  object Label7: TLabel
    Left = 8
    Top = 176
    Width = 118
    Height = 13
    Caption = #1054#1090#1089#1088#1086#1095#1082#1072' '#1087#1083#1072#1090#1077#1078#1072', '#1076#1085#1080
  end
  object Label8: TLabel
    Left = 8
    Top = 200
    Width = 130
    Height = 13
    Caption = #1041#1072#1085#1082#1086#1074#1089#1082#1080#1081' % '#1087#1086' '#1082#1088#1077#1076#1080#1090#1091
  end
  object btnCancel: TBitBtn
    Left = 248
    Top = 230
    Width = 97
    Height = 25
    Action = actCancel
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 4
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
    Top = 230
    Width = 187
    Height = 25
    Action = actOk
    Anchors = [akLeft, akRight, akBottom]
    Caption = 'Ok'
    TabOrder = 3
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
    Left = 152
    Top = 32
    Width = 198
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'ID_TOVAR'
    DataSource = dsNaklotEdit
    DropDownBox.AutoDrop = True
    DropDownBox.Rows = 15
    EditButtons = <>
    KeyField = 'ID'
    ListField = 'NAME'
    ListSource = dmdEx.dsTovarAllND
    TabOrder = 1
    Visible = True
  end
  object dneTransport: TDBNumberEditEh
    Left = 152
    Top = 56
    Width = 198
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Ctl3D = True
    currency = True
    DataField = 'TRANSPORT'
    DataSource = dsNaklotEdit
    DecimalPlaces = 6
    DisplayFormat = '0.000'
    EditButton.Style = ebsEllipsisEh
    EditButton.Visible = True
    EditButtons = <>
    Increment = 0.001000000000000000
    ParentCtl3D = False
    TabOrder = 2
    Visible = True
  end
  object lcbSkidka: TDBLookupComboboxEh
    Left = 152
    Top = 8
    Width = 198
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'USL_POSTAVKA'
    DataSource = dsNaklotEdit
    DropDownBox.AutoDrop = True
    DropDownBox.Rows = 15
    EditButtons = <
      item
        Style = ebsPlusEh
        OnClick = lcbPriceEditButtons0Click
      end>
    TabOrder = 0
    Visible = True
  end
  object dneTara: TDBNumberEditEh
    Left = 152
    Top = 80
    Width = 198
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Ctl3D = True
    currency = True
    DataField = 'TARA'
    DataSource = dsNaklotEdit
    DecimalPlaces = 6
    DisplayFormat = '0.000'
    EditButton.Style = ebsEllipsisEh
    EditButton.Visible = True
    EditButtons = <>
    Increment = 0.001000000000000000
    ParentCtl3D = False
    TabOrder = 5
    Visible = True
  end
  object dneValuta: TDBNumberEditEh
    Left = 152
    Top = 104
    Width = 198
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Ctl3D = True
    currency = True
    DataField = 'VALUTA'
    DataSource = dsNaklotEdit
    DecimalPlaces = 6
    DisplayFormat = '0.000'
    EditButton.Style = ebsEllipsisEh
    EditButton.Visible = True
    EditButtons = <>
    Increment = 0.001000000000000000
    ParentCtl3D = False
    TabOrder = 6
    Visible = True
  end
  object dneTamognya: TDBNumberEditEh
    Left = 152
    Top = 128
    Width = 198
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Ctl3D = True
    currency = True
    DataField = 'TAMOGNYA'
    DataSource = dsNaklotEdit
    DecimalPlaces = 6
    DisplayFormat = '0.000'
    EditButton.Style = ebsEllipsisEh
    EditButton.Visible = True
    EditButtons = <>
    Increment = 0.001000000000000000
    ParentCtl3D = False
    TabOrder = 7
    Visible = True
  end
  object dneProcentPredopl: TDBNumberEditEh
    Left = 152
    Top = 152
    Width = 198
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Ctl3D = True
    currency = False
    DataField = 'PROCENT_PREDOPL'
    DataSource = dsNaklotEdit
    DecimalPlaces = 6
    EditButton.Style = ebsEllipsisEh
    EditButton.Visible = True
    EditButtons = <>
    Increment = 0.010000000000000000
    ParentCtl3D = False
    TabOrder = 8
    Visible = True
  end
  object dneOtsrochka: TDBNumberEditEh
    Left = 152
    Top = 176
    Width = 198
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Ctl3D = True
    currency = False
    DataField = 'OTSROCHKA'
    DataSource = dsNaklotEdit
    DecimalPlaces = 0
    DisplayFormat = '0'
    EditButton.Style = ebsEllipsisEh
    EditButton.Visible = True
    EditButtons = <>
    Increment = 0.001000000000000000
    ParentCtl3D = False
    TabOrder = 9
    Visible = True
  end
  object DBNumberEditEh6: TDBNumberEditEh
    Left = 152
    Top = 200
    Width = 198
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Ctl3D = True
    currency = True
    DataField = 'STAVKA_BANKA'
    DataSource = dsNaklotEdit
    DecimalPlaces = 6
    DisplayFormat = '0.000'
    EditButton.Style = ebsEllipsisEh
    EditButton.Visible = True
    EditButtons = <>
    Increment = 0.001000000000000000
    ParentCtl3D = False
    TabOrder = 10
    Visible = True
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
    Section = 'TfrmUslPostavkaChangeDet'
    StorageManager = rpsClientEdit
    StoredProps.Strings = (
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width')
    Left = 72
    Top = 72
  end
  object rpsClientEdit: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 104
    Top = 72
  end
end
