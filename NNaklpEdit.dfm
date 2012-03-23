object frmNnaklpEdit: TfrmNnaklpEdit
  Left = 250
  Top = 79
  Width = 351
  Height = 380
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1087#1086#1083#1091#1095#1077#1085#1085#1086#1081' '#1085#1072#1083#1086#1075#1086#1074#1086#1081
  Color = clBtnFace
  Constraints.MinHeight = 380
  Constraints.MinWidth = 351
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    343
    353)
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 338
    Height = 352
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    DesignSize = (
      338
      352)
    object Label3: TLabel
      Left = 8
      Top = 160
      Width = 53
      Height = 13
      Caption = #1052#1077#1085#1077#1076#1078#1077#1088
    end
    object Label4: TLabel
      Left = 8
      Top = 64
      Width = 81
      Height = 13
      Caption = #1044#1072#1090#1072' '#1087#1086#1083#1091#1095#1077#1085#1080#1103
    end
    object Label8: TLabel
      Left = 8
      Top = 16
      Width = 80
      Height = 13
      Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088
    end
    object Label15: TLabel
      Left = 8
      Top = 40
      Width = 91
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
    end
    object Label1: TLabel
      Left = 8
      Top = 112
      Width = 58
      Height = 13
      Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
    end
    object Label7: TLabel
      Left = 8
      Top = 136
      Width = 37
      Height = 13
      Caption = #1060#1080#1088#1084#1072
    end
    object Label10: TLabel
      Left = 8
      Top = 208
      Width = 63
      Height = 13
      Caption = #1057#1090#1072#1074#1082#1072' '#1053#1044#1057
    end
    object Label5: TLabel
      Left = 8
      Top = 284
      Width = 70
      Height = 13
      Caption = #1057#1091#1084#1084#1072' '#1089' '#1053#1044#1057
    end
    object Label2: TLabel
      Left = 8
      Top = 88
      Width = 73
      Height = 13
      Caption = #1044#1072#1090#1072' '#1074#1099#1087#1080#1089#1082#1080
    end
    object Label6: TLabel
      Left = 8
      Top = 184
      Width = 19
      Height = 13
      Caption = #1058#1080#1087
    end
    object Label9: TLabel
      Left = 8
      Top = 236
      Width = 34
      Height = 13
      Caption = #1057#1091#1084#1084#1072
    end
    object Label11: TLabel
      Left = 8
      Top = 260
      Width = 24
      Height = 13
      Caption = #1053#1044#1057
    end
    object dbeIDNAKL: TDBEditEh
      Left = 112
      Top = 16
      Width = 213
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      DataField = 'ID_NAKL'
      DataSource = dsNakloEdit
      EditButtons = <>
      Enabled = False
      TabOrder = 0
      Visible = True
    end
    object lcbMANAGER: TDBLookupComboboxEh
      Left = 112
      Top = 160
      Width = 213
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'ID_MANAGER'
      DataSource = dsNakloEdit
      DropDownBox.AutoDrop = True
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = dmdEx.dsManagerSel
      TabOrder = 6
      Visible = True
    end
    object dbeID: TDBEditEh
      Left = 112
      Top = 40
      Width = 213
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'id'
      DataSource = dsNakloEdit
      EditButtons = <>
      TabOrder = 1
      Visible = True
    end
    object dteDat: TDBDateTimeEditEh
      Left = 112
      Top = 64
      Width = 213
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'dat'
      DataSource = dsNakloEdit
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 2
      Visible = True
    end
    object btnOk: TBitBtn
      Left = 12
      Top = 320
      Width = 165
      Height = 25
      Action = actOk
      Anchors = [akLeft, akRight, akBottom]
      Caption = 'Ok'
      TabOrder = 12
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
      Left = 228
      Top = 320
      Width = 97
      Height = 25
      Action = actCancel
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 13
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
    object lcbIZG: TDBLookupComboboxEh
      Left = 112
      Top = 112
      Width = 213
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'IZG'
      DataSource = dsNakloEdit
      DropDownBox.AutoDrop = True
      DropDownBox.Rows = 15
      EditButtons = <>
      TabOrder = 4
      Visible = True
      OnChange = lcbIZGChange
    end
    object lcbZak: TDBLookupComboboxEh
      Left = 112
      Top = 136
      Width = 213
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'ZAK'
      DataSource = dsNakloEdit
      DropDownBox.AutoDrop = True
      DropDownBox.Rows = 15
      EditButtons = <>
      TabOrder = 5
      Visible = True
    end
    object dneNalogNds: TDBNumberEditEh
      Left = 112
      Top = 208
      Width = 213
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      AutoSelect = False
      Ctl3D = True
      currency = True
      DataField = 'NALOG_NDS'
      DataSource = dsNakloEdit
      DecimalPlaces = 3
      DisplayFormat = '0.00'
      EditButton.ShortCut = 0
      EditButton.Style = ebsUpDownEh
      EditButton.Visible = True
      EditButtons = <>
      Increment = 0.010000000000000000
      ParentCtl3D = False
      TabOrder = 8
      Visible = True
      OnChange = dneNalogNdsChange
    end
    object dneNds: TDBNumberEditEh
      Left = 112
      Top = 280
      Width = 214
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Ctl3D = True
      currency = False
      DataField = 'NDS'
      DataSource = dsNakloEdit
      DisplayFormat = '0.00'
      Enabled = False
      EditButton.Style = ebsEllipsisEh
      EditButton.Visible = True
      EditButtons = <>
      Increment = 0.010000000000000000
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 11
      Visible = True
    end
    object dteDatVypiski: TDBDateTimeEditEh
      Left = 112
      Top = 88
      Width = 213
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'DAT_VYPISKI'
      DataSource = dsNakloEdit
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 3
      Visible = True
    end
    object lcbTipName: TDBLookupComboboxEh
      Left = 112
      Top = 184
      Width = 213
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'TIPNAME'
      DataSource = dsNakloEdit
      DropDownBox.AutoDrop = True
      EditButtons = <>
      TabOrder = 7
      Visible = True
    end
    object dneVsego: TDBNumberEditEh
      Left = 112
      Top = 232
      Width = 214
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Ctl3D = True
      currency = False
      DataField = 'VSEGO'
      DataSource = dsNakloEdit
      DisplayFormat = '0.00'
      EditButton.Style = ebsEllipsisEh
      EditButton.Visible = True
      EditButtons = <>
      Increment = 0.010000000000000000
      ParentCtl3D = False
      TabOrder = 9
      Visible = True
      OnChange = dneVsegoChange
    end
    object dneVsegoNds: TDBNumberEditEh
      Left = 112
      Top = 256
      Width = 214
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Ctl3D = True
      currency = False
      DataField = 'VSEGONDS'
      DataSource = dsNakloEdit
      DisplayFormat = '0.00'
      EditButton.Style = ebsEllipsisEh
      EditButton.Visible = True
      EditButtons = <>
      Increment = 0.010000000000000000
      ParentCtl3D = False
      TabOrder = 10
      Visible = True
      OnChange = dneVsegoNdsChange
    end
  end
  object ActionList1: TActionList
    Left = 264
    Top = 216
    object actCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = actCancelExecute
    end
    object actApply: TAction
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      OnExecute = actApplyExecute
    end
    object actOk: TAction
      Caption = 'Ok'
      ShortCut = 16397
      OnExecute = actOkExecute
    end
    object actKursChange: TAction
      Caption = 'actKursChange'
    end
  end
  object dsNakloEdit: TDataSource
    Left = 192
    Top = 180
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmNNaklpEdit'
    StorageManager = rpsClientEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width')
    Left = 144
    Top = 144
  end
  object rpsClientEdit: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 176
    Top = 144
  end
  object sdsKlientAttr: TSQLDataSet
    CommandText = 
      'select '#13#10'  ab.oid,ab.attribute_id,ab.value1'#13#10'from '#13#10'  attributes' +
      ' ab'#13#10'where'#13#10'  ab.oid=:oid and ab.attribute_id=1'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'oid'
        ParamType = ptInput
        Value = 1698
      end>
    SQLConnection = dmdEx.scUchet
    Left = 232
    Top = 72
  end
end
