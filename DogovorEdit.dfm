object frmDogovorEdit: TfrmDogovorEdit
  Left = 326
  Top = 136
  Width = 362
  Height = 286
  BorderIcons = [biSystemMenu]
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1076#1086#1075#1086#1074#1086#1088#1072
  Color = clBtnFace
  Constraints.MinHeight = 278
  Constraints.MinWidth = 361
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 0
    Top = 220
    Width = 97
    Height = 25
    Action = actOk
    Caption = 'OK'
    Default = True
    TabOrder = 1
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
  object BitBtn2: TBitBtn
    Left = 216
    Top = 220
    Width = 97
    Height = 25
    Action = actCancel
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 346
    Height = 209
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      346
      209)
    object Label2: TLabel
      Left = 8
      Top = 30
      Width = 61
      Height = 13
      Caption = #8470' '#1076#1086#1075#1086#1074#1086#1088#1072
    end
    object Label8: TLabel
      Left = 8
      Top = 4
      Width = 26
      Height = 13
      Caption = #1044#1072#1090#1072
    end
    object Label1: TLabel
      Left = 8
      Top = 56
      Width = 95
      Height = 13
      Caption = #1055#1088#1077#1076#1084#1077#1090' '#1076#1086#1075#1086#1074#1086#1088#1072
    end
    object Label3: TLabel
      Left = 8
      Top = 82
      Width = 31
      Height = 13
      Caption = #1040#1076#1088#1077#1089
    end
    object Label5: TLabel
      Left = 8
      Top = 108
      Width = 41
      Height = 13
      Caption = #1050#1086#1085#1090#1072#1082#1090
    end
    object Label4: TLabel
      Left = 8
      Top = 130
      Width = 69
      Height = 13
      Hint = 
        #1048#1089#1087#1086#1083#1100#1079#1091#1077#1090#1089#1103' '#1074' '#1088#1072#1089#1087#1077#1095#1072#1090#1082#1077' '#1085#1072#1083#1086#1075#1086#1074#1099#1093' '#1085#1072#1082#1083#1072#1076#1085#1099#1093', '#1082#1072#1082' '#1074#1080#1076' '#1075#1088#1072#1078#1076#1072#1085#1089#1082 +
        #1086'-'#1087#1088#1072#1074#1086#1074#1086#1075#1086' '#1076#1086#1075#1086#1074#1086#1088#1072
      Caption = #1042#1080#1076' '#1076#1086#1075#1086#1074#1086#1088#1072
      ParentShowHint = False
      ShowHint = True
      WordWrap = True
    end
    object dbeID: TDBEdit
      Left = 144
      Top = 29
      Width = 193
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'ID'
      DataSource = dsEdit
      TabOrder = 0
    end
    object DBDateTimeEditEh1: TDBDateTimeEditEh
      Left = 144
      Top = 4
      Width = 193
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'DAT'
      DataSource = dsEdit
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 1
      Visible = True
    end
    object dbcbDelmarked: TDBCheckBox
      Left = 8
      Top = 180
      Width = 185
      Height = 17
      Caption = #1055#1086#1084#1077#1090#1082#1072' '#1085#1072' '#1091#1076#1072#1083#1077#1085#1080#1077
      DataField = 'delmarked'
      DataSource = dsEdit
      TabOrder = 2
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBCheckBox1: TDBCheckBox
      Left = 8
      Top = 160
      Width = 185
      Height = 17
      Caption = #1054#1089#1085#1086#1074#1085#1086#1081' '#1076#1086#1075#1086#1074#1086#1088
      DataField = 'is_default'
      DataSource = dsEdit
      TabOrder = 3
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dbePredmet: TDBEdit
      Left = 144
      Top = 54
      Width = 193
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'PREDMET'
      DataSource = dsEdit
      TabOrder = 4
    end
    object dbeAdres: TDBEdit
      Left = 144
      Top = 79
      Width = 193
      Height = 21
      Hint = 
        #1048#1089#1087#1086#1083#1100#1079#1091#1077#1090#1089#1103' '#1074' '#1088#1072#1089#1087#1077#1095#1072#1090#1082#1077' '#1088#1072#1089#1093#1086#1076#1085#1099#1093' '#1085#1072#1082#1083#1072#1076#1085#1099#1093' '#1085#1072' '#1091#1089#1083#1091#1075#1080', '#1082#1072#1082' '#1072#1076#1088 +
        #1077#1089' '#1089#1076#1072#1074#1072#1077#1084#1086#1075#1086' '#1087#1086#1084#1077#1097#1077#1085#1080#1103
      Anchors = [akLeft, akTop, akRight]
      DataField = 'ADRES'
      DataSource = dsEdit
      TabOrder = 5
    end
    object lcbContact: TDBLookupComboboxEh
      Left = 144
      Top = 104
      Width = 194
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'CONTACT'
      DataSource = dsEdit
      DropDownBox.AutoDrop = True
      DropDownBox.Rows = 15
      EditButtons = <
        item
          ShortCut = 0
          Style = ebsMinusEh
          OnClick = lcbContactEditButtons0Click
        end>
      TabOrder = 6
      Visible = True
    end
    object dbeTipDogovora: TDBEdit
      Left = 144
      Top = 127
      Width = 193
      Height = 21
      Hint = 
        #1048#1089#1087#1086#1083#1100#1079#1091#1077#1090#1089#1103' '#1074' '#1088#1072#1089#1087#1077#1095#1072#1090#1082#1077' '#1085#1072#1083#1086#1075#1086#1074#1099#1093' '#1085#1072#1082#1083#1072#1076#1085#1099#1093', '#1082#1072#1082' '#1074#1080#1076' '#1075#1088#1072#1078#1076#1072#1085#1089#1082 +
        #1086'-'#1087#1088#1072#1074#1086#1074#1086#1075#1086' '#1076#1086#1075#1086#1074#1086#1088#1072
      Anchors = [akLeft, akTop, akRight]
      DataField = 'TIP_DOGOVORA'
      DataSource = dsEdit
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
    end
  end
  object ActionList1: TActionList
    Left = 168
    Top = 32
    object actOk: TAction
      Caption = 'OK'
      OnExecute = actOkExecute
    end
    object actCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = actCancelExecute
    end
  end
  object dsEdit: TDataSource
    Left = 168
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmDogovorEdit'
    StorageManager = rpsClientEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width')
    Left = 168
    Top = 64
  end
  object rpsClientEdit: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 200
  end
end
