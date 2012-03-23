object frmClientSchetEdit: TfrmClientSchetEdit
  Left = 281
  Top = 244
  Width = 309
  Height = 246
  BorderIcons = [biSystemMenu]
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1082#1083#1080#1077#1085#1090#1086#1074
  Color = clBtnFace
  Constraints.MinHeight = 246
  Constraints.MinWidth = 309
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    301
    219)
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 8
    Top = 191
    Width = 97
    Height = 25
    Action = actOk
    Anchors = [akTop]
    Caption = 'OK'
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
    Left = 200
    Top = 191
    Width = 97
    Height = 25
    Action = actCancel
    Anchors = [akTop]
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
    Width = 301
    Height = 186
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      301
      186)
    object Label2: TLabel
      Left = 4
      Top = 52
      Width = 40
      Height = 13
      Caption = #1056#1072#1089#1095'/'#1089#1095
    end
    object Label3: TLabel
      Left = 4
      Top = 76
      Width = 28
      Height = 13
      Caption = #1052#1060#1054
    end
    object Label8: TLabel
      Left = 4
      Top = 28
      Width = 25
      Height = 13
      Caption = #1041#1072#1085#1082
    end
    object Label1: TLabel
      Left = 4
      Top = 104
      Width = 38
      Height = 13
      Caption = #1042#1072#1083#1102#1090#1072
    end
    object Label4: TLabel
      Left = 4
      Top = 4
      Width = 81
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1095#1105#1090#1072
    end
    object Label5: TLabel
      Left = 4
      Top = 128
      Width = 53
      Height = 13
      Caption = #1052#1077#1085#1077#1076#1078#1077#1088
    end
    object dbeRS: TDBEdit
      Left = 92
      Top = 52
      Width = 202
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'RASCH'
      DataSource = dtsEdit
      TabOrder = 2
    end
    object dbeMfo: TDBEdit
      Left = 92
      Top = 76
      Width = 202
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'MFO'
      DataSource = dtsEdit
      TabOrder = 3
    end
    object dbeBank: TDBEdit
      Left = 92
      Top = 28
      Width = 202
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'BANK_NAME'
      DataSource = dtsEdit
      TabOrder = 1
    end
    object dlcCurrency: TDBLookupComboboxEh
      Left = 92
      Top = 100
      Width = 202
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'CURRENCY'
      DataSource = dtsEdit
      DropDownBox.AutoDrop = True
      EditButtons = <>
      TabOrder = 4
      Visible = True
    end
    object DBEdit1: TDBEdit
      Left = 92
      Top = 4
      Width = 202
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'FULLNAME'
      DataSource = dtsEdit
      TabOrder = 0
    end
    object cbxFirm: TCheckBox
      Left = 2
      Top = 149
      Width = 104
      Height = 21
      Alignment = taLeftJustify
      BiDiMode = bdLeftToRight
      Caption = #1050#1072#1089#1089#1072
      ParentBiDiMode = False
      TabOrder = 5
    end
    object dlcManager: TDBLookupComboboxEh
      Left = 92
      Top = 124
      Width = 202
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'MANAGER'
      DataSource = dtsEdit
      DropDownBox.AutoDrop = True
      EditButtons = <
        item
          Style = ebsMinusEh
          OnClick = DBLookupComboboxEh1EditButtons0Click
        end>
      TabOrder = 6
      Visible = True
    end
  end
  object ActionList1: TActionList
    Left = 168
    Top = 32
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
  object dtsEdit: TDataSource
    Left = 168
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmClientSchetEdit'
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
