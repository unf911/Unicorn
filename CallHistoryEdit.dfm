object frmCallHistoryEdit: TfrmCallHistoryEdit
  Left = 666
  Top = 67
  Width = 360
  Height = 437
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1082#1086#1085#1090#1072#1082#1090#1086#1074
  Color = clBtnFace
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
  object AutoPanel1: TAutoPanel
    Left = 0
    Top = 0
    Width = 352
    Height = 410
    AutoChildPosLeft = True
    AutoChildPosTop = True
    AutoChildWidth = True
    AutoChildHeight = True
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      352
      410)
    object Label1: TLabel
      Left = 12
      Top = 52
      Width = 43
      Height = 13
      Caption = #1055#1088#1080#1095#1080#1085#1072
    end
    object Label5: TLabel
      Left = 12
      Top = 28
      Width = 41
      Height = 13
      Caption = #1050#1086#1085#1090#1072#1082#1090
    end
    object Label4: TLabel
      Left = 12
      Top = 4
      Width = 26
      Height = 13
      Caption = #1044#1072#1090#1072
    end
    object Label12: TLabel
      Left = 12
      Top = 104
      Width = 70
      Height = 13
      Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
    end
    object Label10: TLabel
      Left = 12
      Top = 76
      Width = 52
      Height = 13
      Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090
    end
    object lcbSkladTo: TDBLookupComboboxEh
      Left = 120
      Top = 24
      Width = 224
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
          OnClick = lcbSkladToEditButtons0Click
        end>
      TabOrder = 1
      Visible = True
    end
    object dteDat: TDBDateTimeEditEh
      Left = 120
      Top = 0
      Width = 225
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'DAT'
      DataSource = dsEdit
      EditButtons = <>
      TabOrder = 0
      Visible = True
      EditFormat = ''
    end
    object BitBtn2: TBitBtn
      Left = 220
      Top = 378
      Width = 125
      Height = 25
      Action = actCancel
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 6
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
    object BitBtn1: TBitBtn
      Left = 12
      Top = 378
      Width = 129
      Height = 25
      Action = actOk
      Anchors = [akLeft, akBottom]
      Caption = 'OK'
      TabOrder = 5
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
    object lcbReason: TDBLookupComboboxEh
      Left = 120
      Top = 48
      Width = 224
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'REASON'
      DataSource = dsEdit
      DropDownBox.AutoDrop = True
      DropDownBox.Rows = 15
      EditButtons = <
        item
          ShortCut = 0
          Style = ebsMinusEh
          OnClick = lcbReasonEditButtons0Click
        end
        item
          ShortCut = 0
          Style = ebsPlusEh
          OnClick = lcbReasonEditButtons1Click
        end>
      TabOrder = 2
      Visible = True
    end
    object lcbResult: TDBLookupComboboxEh
      Left = 120
      Top = 72
      Width = 224
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'RESULT'
      DataSource = dsEdit
      DropDownBox.AutoDrop = True
      DropDownBox.Rows = 15
      EditButtons = <
        item
          ShortCut = 0
          Style = ebsMinusEh
          OnClick = lcbResultEditButtons0Click
        end
        item
          ShortCut = 0
          Style = ebsPlusEh
          OnClick = lcbResultEditButtons1Click
        end>
      TabOrder = 3
      Visible = True
    end
    object DBEditEh1: TDBEditEh
      Left = 120
      Top = 100
      Width = 225
      Height = 269
      AutoSize = False
      DataField = 'COMMENT'
      DataSource = dsEdit
      EditButtons = <>
      TabOrder = 4
      Visible = True
      WantReturns = True
    end
  end
  object ActionList1: TActionList
    Left = 84
    Top = 116
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
  object dsEdit: TDataSource
    Left = 84
    Top = 152
  end
  object rpsTovarEdit: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 208
    Top = 40
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmContactEdit'
    StorageManager = rpsTovarEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      '<P>.WindowState')
    Left = 240
    Top = 72
  end
  object SQLDataSet1: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 116
    Top = 88
  end
  object cdsContacts: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_klient'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'DataSetProvider1'
    AfterInsert = cdsContactsAfterInsert
    BeforePost = cdsContactsBeforePost
    Left = 116
    Top = 152
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLDataSet1
    Left = 116
    Top = 120
  end
end
