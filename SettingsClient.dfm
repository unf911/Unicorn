object fmSettingsClient: TfmSettingsClient
  Left = 185
  Top = 246
  Width = 306
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
    Width = 282
    Height = 47
    Align = alTop
    Caption = #1042#1099#1073#1086#1088' '#1082#1083#1080#1077#1085#1090#1072
    TabOrder = 0
    object Label1: TLabel
      Left = 15
      Top = 17
      Width = 36
      Height = 13
      Caption = #1050#1083#1080#1077#1085#1090
    end
    object dlcTovar: TDBLookupComboboxEh
      Left = 128
      Top = 16
      Width = 161
      Height = 21
      DropDownBox.AutoDrop = True
      DropDownBox.Width = -1
      EditButtons = <
        item
          Glyph.Data = {
            76050000424D7605000000000000360000002800000015000000150000000100
            1800000000004005000000000000000000000000000000000000000000000000
            000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FF00000000000000000000000000000000000000000000
            000000000000000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FF00000000000000000000000000000000000000000000
            000000000000000000000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FF00000000000000000000000000000000000000000000FF00FF000000
            000000000000000000000000000000000000000000FF00FFFF00FFFF00FFFF00
            FF000000000000000000000000000000000000000000FF00FF00FF00FFFF00FF
            FF00FF000000000000000000000000000000000000000000FF00FFFF00FF0000
            00000000000000000000000000000000000000FF00FFFF00FF00FF00FFFF00FF
            FF00FFFF00FF0000000000000000000000000000000000000000000000000000
            00000000000000000000000000FF00FFFF00FFFF00FFFF00FF00FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FF0000000000000000000000000000000000000000
            00000000000000000000FF00FFFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FF0000000000000000000000000000000000
            00000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000000000000000000000000000
            00000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FF0000000000000000000000000000000000
            00000000000000000000FF00FFFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FF0000000000000000000000000000000000000000
            00000000000000000000000000FF00FFFF00FFFF00FFFF00FF00FF00FFFF00FF
            FF00FFFF00FFFF00FF000000000000000000000000000000000000FF00FF0000
            00000000000000000000000000FF00FFFF00FFFF00FFFF00FF00FF00FFFF00FF
            FF00FFFF00FFFF00FF000000000000000000000000000000FF00FFFF00FFFF00
            FF000000000000000000000000000000000000FF00FFFF00FF00FF00FFFF00FF
            FF00FFFF00FF000000000000000000000000000000FF00FFFF00FFFF00FFFF00
            FF00000000000000000000000000000000000000000000000000FF00FFFF00FF
            FF00FF000000000000000000000000000000000000FF00FFFF00FFFF00FFFF00
            FFFF00FF00000000000000000000000000000000000000000000FF00FFFF00FF
            000000000000000000000000000000000000FF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FF00000000000000000000000000000000000000FF00FF000000
            000000000000000000000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FF00000000000000000000FF00FF000000
            000000000000000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00000000FF00FF000000
            000000000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00FF000000
            000000000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FF
            000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00}
          Style = ebsMinusEh
          OnClick = dlcTovarEditButtons0Click
        end>
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = dmdEx.dsClient
      TabOrder = 0
      Visible = True
    end
  end
end
