object frmSettings: TfrmSettings
  Left = 717
  Top = 488
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 223
  ClientWidth = 299
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnHide = FormHide
  PixelsPerInch = 96
  TextHeight = 13
  object gbxPeriod: TGroupBox
    Left = 0
    Top = 49
    Width = 299
    Height = 113
    Align = alTop
    Caption = #1042#1099#1073#1086#1088' '#1087#1077#1088#1080#1086#1076#1072
    TabOrder = 0
    object lblDateTo: TLabel
      Left = 16
      Top = 52
      Width = 79
      Height = 13
      Caption = #1050#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072':'
    end
    object lblDateFrom: TLabel
      Left = 16
      Top = 20
      Width = 85
      Height = 13
      Caption = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072':'
    end
    object cbxMonth: TComboBox
      Left = 15
      Top = 79
      Width = 90
      Height = 21
      Color = clBtnFace
      DropDownCount = 12
      ItemHeight = 13
      TabOrder = 0
      TabStop = False
      Text = '<'#1052#1077#1089#1103#1094'>'
      OnDropDown = cbxMonthDropDown
      OnSelect = cbxMonthSelect
      Items.Strings = (
        #1071#1085#1074#1072#1088#1100
        #1060#1077#1074#1088#1072#1083#1100
        #1052#1072#1088#1090
        #1040#1087#1088#1077#1083#1100
        #1052#1072#1081
        #1048#1102#1085#1100
        #1048#1102#1083#1100
        #1040#1074#1075#1091#1089#1090
        #1057#1077#1085#1090#1103#1073#1088#1100
        #1054#1082#1090#1103#1073#1088#1100
        #1053#1086#1103#1073#1088#1100
        #1044#1077#1082#1072#1073#1088#1100)
    end
    object cbxYear: TComboBox
      Left = 111
      Top = 79
      Width = 82
      Height = 21
      Color = clBtnFace
      DropDownCount = 10
      ItemHeight = 13
      TabOrder = 1
      TabStop = False
      Text = '<'#1043#1086#1076'>'
      OnDropDown = cbxYearDropDown
      OnSelect = cbxYearSelect
    end
    object cbxRestDates: TComboBox
      Left = 200
      Top = 79
      Width = 89
      Height = 21
      Color = clBtnFace
      ItemHeight = 13
      TabOrder = 2
      TabStop = False
      Text = '<'#1057#1087#1077#1094'>'
      OnSelect = cbxRestDatesSelect
      Items.Strings = (
        #1055#1088#1077#1076' '#1084#1077#1089#1103#1094
        #1069#1090#1086#1090' '#1084#1077#1089#1103#1094
        '3 '#1084#1077#1089#1103#1094#1072
        '6 '#1084#1077#1089#1103#1094#1077#1074
        '13 '#1084#1077#1089#1103#1094#1077#1074)
    end
    object medDateFrom: TDBDateTimeEditEh
      Left = 128
      Top = 16
      Width = 161
      Height = 21
      EditButtons = <>
      TabOrder = 3
      Visible = True
      OnChange = medDateFromChange
      EditFormat = 'DD/MM/YY'
    end
    object medDateTo: TDBDateTimeEditEh
      Left = 128
      Top = 48
      Width = 161
      Height = 21
      EditButtons = <>
      TabOrder = 4
      Visible = True
      OnChange = medDateToChange
      EditFormat = 'DD/MM/YY'
    end
  end
  object gbxManager: TGroupBox
    Left = 0
    Top = 0
    Width = 299
    Height = 49
    Align = alTop
    Caption = #1042#1099#1073#1086#1088' '#1084#1077#1085#1077#1076#1078#1077#1088#1072
    TabOrder = 1
    Visible = False
    object lblManag: TLabel
      Left = 16
      Top = 16
      Width = 53
      Height = 13
      Caption = #1052#1077#1085#1077#1076#1078#1077#1088
    end
    object cbxAllManag: TCheckBox
      Left = 224
      Top = 8
      Width = 41
      Height = 17
      Action = actAllManager
      TabOrder = 0
    end
    object dlcSelManag: TDBLookupComboBox
      Left = 112
      Top = 8
      Width = 105
      Height = 21
      DropDownRows = 20
      KeyField = 'ID'
      ListField = 'NAME'
      TabOrder = 1
      OnClick = dlcSelManagClick
      OnKeyUp = dlcSelManagKeyUp
    end
  end
  object gbxVlad: TGroupBox
    Left = 0
    Top = 162
    Width = 299
    Height = 47
    Align = alTop
    Caption = #1042#1099#1073#1086#1088' '#1092#1080#1088#1084#1099
    TabOrder = 4
    Visible = False
    object Label1: TLabel
      Left = 15
      Top = 17
      Width = 37
      Height = 13
      Caption = #1060#1080#1088#1084#1072
    end
    object dlcVlad: TDBLookupComboboxEh
      Left = 136
      Top = 16
      Width = 153
      Height = 21
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = dmdEx.dsVlad
      TabOrder = 0
      Visible = True
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 162
    Width = 299
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object btnOk: TBitBtn
      Left = 8
      Top = 8
      Width = 129
      Height = 25
      Caption = #1054#1050
      Default = True
      TabOrder = 0
      OnClick = btnOkClick
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
      Left = 168
      Top = 8
      Width = 118
      Height = 25
      Action = actCancel
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
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
  end
  object stbStatusBar1: TStatusBar
    Left = 0
    Top = 201
    Width = 299
    Height = 22
    Panels = <>
    SimplePanel = True
  end
  object ActionList1: TActionList
    Left = 16
    Top = 64
    object actOK: TAction
      Caption = #1054#1050
      OnExecute = btnOkClick
    end
    object actCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      OnExecute = actCancelExecute
    end
    object actAllManager: TAction
      Caption = #1042#1089#1077
      OnExecute = actAllManagerExecute
    end
    object actAllManagerOn: TAction
      Caption = #1042#1082#1083#1102#1095#1080#1090#1100' '#39#1074#1089#1077' '#1084#1077#1085#1077#1076#1078#1077#1088#1099#39
      OnExecute = actAllManagerOnExecute
    end
    object actFirstShow: TAction
      Caption = #1047#1072#1087#1091#1089#1082' '#1087#1088#1080' '#1089#1086#1079#1076#1072#1085#1080#1080
      OnExecute = actFirstShowExecute
    end
    object actDataOnly: TAction
      Caption = 'actDataOnly'
      OnExecute = actDataOnlyExecute
    end
    object actVladOn: TAction
      Caption = 'actVladOn'
    end
    object actManagerOff: TAction
      Caption = 'actManagerOff'
      OnExecute = actManagerOffExecute
    end
    object actDataOff: TAction
      Caption = #1053#1077' '#1087#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1087#1072#1085#1077#1083#1100' '#1076#1072#1090#1099' '#1074' '#1085#1072#1089#1090#1088#1086#1081#1082#1072#1093
      OnExecute = actDataOffExecute
    end
  end
  object PropStorageEh1: TPropStorageEh
    Active = False
    StorageManager = rpsSettings
    StoredProps.Strings = (
      '<P>.Left'
      '<P>.Top'
      'gbxPeriod.medDateFrom.<P>.Value'
      'gbxPeriod.medDateTo.<P>.Value')
    Left = 48
    Top = 64
  end
  object rpsSettings: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 80
    Top = 64
  end
end
