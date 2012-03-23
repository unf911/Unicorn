object fmSettingsVlad: TfmSettingsVlad
  Left = 162
  Top = 219
  Width = 302
  Height = 49
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  object gbxVlad: TGroupBox
    Left = 0
    Top = 0
    Width = 278
    Height = 47
    Align = alTop
    Caption = #1042#1099#1073#1086#1088' '#1092#1080#1088#1084#1099
    TabOrder = 0
    object Label1: TLabel
      Left = 15
      Top = 17
      Width = 37
      Height = 13
      Caption = #1060#1080#1088#1084#1072
    end
    object cbxFirm: TDBComboBoxEh
      Left = 128
      Top = 16
      Width = 161
      Height = 21
      DropDownBox.AutoDrop = True
      DropDownBox.Width = 300
      EditButton.Width = -1
      EditButtons = <
        item
          Style = ebsMinusEh
          OnClick = cbxFirmEditButtons0Click
        end>
      TabOrder = 0
      Text = 'cbxFirm'
      Visible = True
    end
  end
end
