object frmPriceCalc: TfrmPriceCalc
  Left = 180
  Top = 191
  BorderStyle = bsDialog
  Caption = #1055#1086#1076#1089#1095#1105#1090' '#1094#1077#1085#1099
  ClientHeight = 215
  ClientWidth = 272
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    272
    215)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 83
    Height = 13
    Caption = #1062#1077#1085#1072' '#1087#1088#1072#1081#1089#1086#1074#1072#1103
  end
  object Label2: TLabel
    Left = 8
    Top = 96
    Width = 24
    Height = 13
    Caption = #1050#1091#1088#1089
  end
  object Label3: TLabel
    Left = 8
    Top = 64
    Width = 37
    Height = 13
    Caption = #1057#1082#1080#1076#1082#1072
  end
  object Label4: TLabel
    Left = 8
    Top = 136
    Width = 74
    Height = 13
    Caption = #1062#1077#1085#1072' '#1073#1077#1079' '#1053#1044#1057
  end
  object Label5: TLabel
    Left = 8
    Top = 160
    Width = 62
    Height = 13
    Caption = #1062#1077#1085#1072' '#1089' '#1053#1044#1057
  end
  object Label6: TLabel
    Left = 8
    Top = 32
    Width = 119
    Height = 13
    Caption = #1062#1077#1085#1072' '#1087#1088#1072#1081#1089#1086#1074#1072#1103' c '#1053#1044#1057
  end
  object dbePrice: TDBNumberEditEh
    Left = 144
    Top = 8
    Width = 121
    Height = 21
    Anchors = [akTop, akRight]
    DisplayFormat = '0.00'
    EditButton.Style = ebsEllipsisEh
    EditButton.Visible = True
    EditButtons = <>
    Increment = 0.010000000000000000
    TabOrder = 0
    Visible = True
    OnChange = dbePriceChange
  end
  object dbeKurs: TDBNumberEditEh
    Left = 144
    Top = 96
    Width = 121
    Height = 21
    Anchors = [akTop, akRight]
    DecimalPlaces = 4
    DisplayFormat = '0.0000'
    EditButton.Style = ebsEllipsisEh
    EditButton.Visible = True
    EditButtons = <>
    Increment = 0.010000000000000000
    TabOrder = 2
    Visible = True
    OnChange = dbeKursChange
  end
  object dbeSkidka: TDBNumberEditEh
    Left = 144
    Top = 64
    Width = 121
    Height = 21
    Anchors = [akTop, akRight]
    DisplayFormat = '0.0'
    EditButton.Style = ebsEllipsisEh
    EditButton.Visible = True
    EditButtons = <>
    TabOrder = 1
    Visible = True
    OnChange = dbeSkidkaChange
  end
  object dbeCena: TDBNumberEditEh
    Left = 144
    Top = 136
    Width = 121
    Height = 21
    TabStop = False
    Anchors = [akTop, akRight]
    DisplayFormat = '0.00'
    Enabled = False
    EditButton.Style = ebsEllipsisEh
    EditButton.Visible = True
    EditButtons = <>
    ReadOnly = True
    TabOrder = 3
    Visible = True
  end
  object dbeCenaNds: TDBNumberEditEh
    Left = 144
    Top = 160
    Width = 121
    Height = 21
    TabStop = False
    Anchors = [akTop, akRight]
    DisplayFormat = '0.00'
    Enabled = False
    EditButton.Style = ebsEllipsisEh
    EditButton.Visible = True
    EditButtons = <>
    ReadOnly = True
    TabOrder = 4
    Visible = True
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 182
    Width = 231
    Height = 25
    Anchors = [akLeft, akRight, akBottom]
    Cancel = True
    Caption = 'OK'
    Default = True
    TabOrder = 5
    TabStop = False
    OnClick = BitBtn1Click
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
  object dbePriceNds: TDBNumberEditEh
    Left = 144
    Top = 32
    Width = 121
    Height = 21
    Anchors = [akTop, akRight]
    DisplayFormat = '0.00'
    Enabled = False
    EditButton.Style = ebsEllipsisEh
    EditButton.Visible = True
    EditButtons = <>
    Increment = 0.010000000000000000
    TabOrder = 6
    Visible = True
    OnChange = dbePriceChange
  end
  object ActionList1: TActionList
    Left = 112
    Top = 48
    object actCancel: TAction
      Caption = 'actCancel'
    end
  end
  object sdsGetKurs: TSQLDataSet
    CommandText = 'select '#13#10'  kurs'#13#10'from '#13#10'  get_kurs_pc(:dat,:id_currency)'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'dat'
        ParamType = ptInput
        Value = 38153d
      end
      item
        DataType = ftInteger
        Name = 'id_currency'
        ParamType = ptInput
        Value = 3035
      end>
    SQLConnection = dmdEx.scUchet
    Left = 144
    Top = 48
    object sdsGetKursKURS: TFloatField
      FieldName = 'KURS'
    end
  end
  object PropStorageEh1: TPropStorageEh
    Active = False
    Section = 'TfrmPriceCalc_Skidka'
    StorageManager = rpsClientEdit
    StoredProps.Strings = (
      'dbeKurs.<P>.Value'
      'dbeSkidka.<P>.Value')
    Left = 112
    Top = 88
  end
  object rpsClientEdit: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 144
    Top = 88
  end
  object PropStorageEh2: TPropStorageEh
    Section = 'TfrmPriceCalc'
    StorageManager = rpsForm
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width')
    Left = 112
    Top = 120
  end
  object rpsForm: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 144
    Top = 120
  end
end
