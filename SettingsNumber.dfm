object fmSettingsNumber: TfmSettingsNumber
  Left = 121
  Top = 202
  Width = 304
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
    Width = 280
    Height = 47
    Align = alTop
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1085#1086#1084#1077#1088
    TabOrder = 0
    object Label1: TLabel
      Left = 15
      Top = 17
      Width = 34
      Height = 13
      Caption = #1053#1086#1084#1077#1088
    end
    object dbnNumber: TDBNumberEditEh
      Left = 128
      Top = 16
      Width = 161
      Height = 21
      DecimalPlaces = 0
      EditButton.Style = ebsUpDownEh
      EditButton.Visible = True
      EditButtons = <
        item
          Style = ebsMinusEh
          OnClick = dbnNumberEditButtons0Click
        end>
      TabOrder = 0
      Visible = True
    end
  end
end
