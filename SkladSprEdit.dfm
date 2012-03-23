object frmSkladSprEdit: TfrmSkladSprEdit
  Left = 276
  Top = 204
  Width = 401
  Height = 192
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1089#1082#1083#1072#1076#1086#1074
  Color = clBtnFace
  Constraints.MaxHeight = 192
  Constraints.MaxWidth = 401
  Constraints.MinHeight = 192
  Constraints.MinWidth = 301
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  DesignSize = (
    393
    164)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 89
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1082#1083#1072#1076#1072
  end
  object Label3: TLabel
    Left = 16
    Top = 40
    Width = 53
    Height = 13
    Caption = #1052#1077#1085#1077#1076#1078#1077#1088
  end
  object Label2: TLabel
    Left = 16
    Top = 64
    Width = 96
    Height = 13
    Caption = #1044#1083#1080#1085#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
  end
  object Label4: TLabel
    Left = 16
    Top = 88
    Width = 105
    Height = 13
    Caption = #1056#1086#1076#1080#1090#1077#1083#1100#1089#1082#1080#1081' '#1089#1082#1083#1072#1076
  end
  object dbeName: TDBEdit
    Left = 176
    Top = 8
    Width = 211
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'NAME'
    DataSource = dsSkladEdit
    TabOrder = 0
  end
  object btnOk: TBitBtn
    Left = 8
    Top = 134
    Width = 129
    Height = 25
    Action = actOk
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
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
  object btnCancel: TBitBtn
    Left = 216
    Top = 134
    Width = 113
    Height = 25
    Action = actCancel
    Anchors = [akRight, akBottom]
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
  object dbcbDelmarked: TDBCheckBox
    Left = 16
    Top = 112
    Width = 321
    Height = 17
    Caption = #1055#1086#1084#1077#1090#1082#1072' '#1085#1072' '#1091#1076#1072#1083#1077#1085#1080#1077
    DataField = 'delmarked'
    DataSource = dsSkladEdit
    TabOrder = 2
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object lcbMANAGER: TDBLookupComboboxEh
    Left = 176
    Top = 32
    Width = 211
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'MANAGER'
    DataSource = dsSkladEdit
    DropDownBox.AutoDrop = True
    EditButtons = <>
    TabOrder = 1
    Visible = True
  end
  object DBEdit1: TDBEdit
    Left = 176
    Top = 56
    Width = 211
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'FULLNAME'
    DataSource = dsSkladEdit
    TabOrder = 5
  end
  object DBLookupComboboxEh1: TDBLookupComboboxEh
    Left = 176
    Top = 80
    Width = 211
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'PARENT_SKLAD'
    DataSource = dsSkladEdit
    DropDownBox.AutoDrop = True
    EditButtons = <>
    TabOrder = 6
    Visible = True
  end
  object ActionList1: TActionList
    Left = 160
    Top = 48
    object actOk: TAction
      Caption = 'OK'
      ShortCut = 16397
      OnExecute = actOkExecute
    end
    object actCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = actCancelExecute
    end
  end
  object dsSkladEdit: TDataSource
    Left = 120
    Top = 48
  end
  object rpsTovarEdit: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 208
    Top = 40
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmSkladSprEdit'
    StorageManager = rpsTovarEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width')
    Left = 208
    Top = 72
  end
end
