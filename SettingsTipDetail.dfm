object fmSettingsTipDetail: TfmSettingsTipDetail
  Left = 223
  Top = 257
  Width = 302
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
    Width = 278
    Height = 47
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 15
      Top = 17
      Width = 55
      Height = 13
      Caption = #1058#1080#1087' '#1086#1090#1095#1105#1090#1072
    end
    object cbxFirm: TDBComboBoxEh
      Left = 128
      Top = 12
      Width = 161
      Height = 21
      DropDownBox.Width = 300
      EditButton.Width = -1
      EditButtons = <
        item
          Style = ebsMinusEh
          Visible = False
          OnClick = DBComboBoxEh1EditButtons0Click
        end>
      TabOrder = 0
      Visible = True
    end
  end
end
