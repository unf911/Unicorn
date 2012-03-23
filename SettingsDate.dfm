object fmSettingsDate: TfmSettingsDate
  Left = 114
  Top = 311
  Width = 311
  Height = 47
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  object gbxVlad: TGroupBox
    Left = 0
    Top = 0
    Width = 287
    Height = 47
    Align = alTop
    Caption = #1042#1099#1073#1086#1088' '#1076#1072#1090#1099
    TabOrder = 0
    object lblDate: TLabel
      Left = 26
      Top = 17
      Width = 39
      Height = 13
      Caption = #1053#1072' '#1076#1072#1090#1091
    end
    object CheckBox1: TCheckBox
      Left = 8
      Top = 16
      Width = 17
      Height = 17
      Caption = #1053#1072' '#1076#1072#1090#1091
      TabOrder = 0
      OnClick = CheckBox1Click
    end
    object dteDateTo: TDBDateTimeEditEh
      Left = 128
      Top = 16
      Width = 159
      Height = 21
      EditButtons = <>
      TabOrder = 1
      Visible = True
      EditFormat = 'DD/MM/YY'
    end
  end
end
