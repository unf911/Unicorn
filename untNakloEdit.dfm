object frmNakloEdit: TfrmNakloEdit
  Left = 542
  Top = 218
  Anchors = [akLeft, akTop, akRight]
  BorderStyle = bsDialog
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1086#1090#1075#1088#1091#1079#1082#1080' '
  ClientHeight = 390
  ClientWidth = 328
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    328
    390)
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 324
    Height = 386
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    DesignSize = (
      324
      386)
    object Label1: TLabel
      Left = 8
      Top = 112
      Width = 58
      Height = 13
      Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
    end
    object Label2: TLabel
      Left = 8
      Top = 136
      Width = 59
      Height = 13
      Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
    end
    object Label3: TLabel
      Left = 8
      Top = 160
      Width = 53
      Height = 13
      Caption = #1052#1077#1085#1077#1076#1078#1077#1088
    end
    object Label4: TLabel
      Left = 8
      Top = 88
      Width = 26
      Height = 13
      Caption = #1044#1072#1090#1072
    end
    object Label5: TLabel
      Left = 8
      Top = 184
      Width = 24
      Height = 13
      Caption = #1050#1091#1088#1089
    end
    object Label6: TLabel
      Left = 8
      Top = 16
      Width = 80
      Height = 13
      Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088
    end
    object Label8: TLabel
      Left = 8
      Top = 232
      Width = 30
      Height = 13
      Caption = #1048#1090#1086#1075#1086
    end
    object Label7: TLabel
      Left = 8
      Top = 208
      Width = 70
      Height = 13
      Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
    end
    object Label9: TLabel
      Left = 8
      Top = 64
      Width = 19
      Height = 13
      Caption = #1058#1080#1087
    end
    object Label10: TLabel
      Left = 8
      Top = 40
      Width = 91
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
    end
    object Label11: TLabel
      Left = 8
      Top = 256
      Width = 31
      Height = 13
      Caption = #1057#1082#1083#1072#1076
    end
    object lblSkladTo: TLabel
      Left = 8
      Top = 280
      Width = 93
      Height = 13
      Caption = #1057#1082#1083#1072#1076' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
    end
    object lblParentIdNakl: TLabel
      Left = 8
      Top = 304
      Width = 103
      Height = 26
      Caption = #1053#1072' '#1086#1089#1085#1086#1074#1072#1085#1080#1080' '#1088#1072#1089#1093'. '#1085#1072#1082#1083'.'
      WordWrap = True
    end
    object dbeIDNAKL: TDBEditEh
      Left = 112
      Top = 16
      Width = 191
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
    object dneKurs: TDBNumberEditEh
      Left = 112
      Top = 184
      Width = 191
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Ctl3D = True
      currency = False
      DataField = 'KURS'
      DataSource = dsNakloEdit
      DecimalPlaces = 4
      DisplayFormat = '0.0000'
      EditButton.Style = ebsUpDownEh
      EditButton.Visible = True
      EditButtons = <>
      Increment = 0.010000000000000000
      ParentCtl3D = False
      TabOrder = 7
      Visible = True
      OnKeyPress = dbeIDKeyPress
    end
    object lcbIZG: TDBLookupComboboxEh
      Left = 112
      Top = 112
      Width = 191
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'ID_IZG'
      DataSource = dsNakloEdit
      DropDownBox.AutoDrop = True
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = dmdEx.dsVlad
      TabOrder = 4
      Visible = True
      OnKeyPress = dbeIDKeyPress
    end
    object lcbZAK: TDBLookupComboboxEh
      Left = 112
      Top = 136
      Width = 191
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'ID_ZAK'
      DataSource = dsNakloEdit
      DropDownBox.AutoDrop = True
      DropDownBox.Rows = 15
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = dmdEx.dsClient
      TabOrder = 5
      Visible = True
      OnKeyPress = dbeIDKeyPress
    end
    object lcbMANAGER: TDBLookupComboboxEh
      Left = 112
      Top = 160
      Width = 191
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
      OnKeyPress = dbeIDKeyPress
    end
    object btnOk: TBitBtn
      Left = 8
      Top = 353
      Width = 134
      Height = 25
      Action = actOk
      Anchors = [akLeft, akBottom]
      Caption = 'Ok'
      TabOrder = 13
      OnKeyDown = btnOkKeyDown
      OnKeyUp = btnOkKeyUp
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
      Left = 176
      Top = 353
      Width = 139
      Height = 25
      Action = actCancel
      Anchors = [akLeft, akRight, akBottom]
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 14
      OnKeyUp = btnCancelKeyUp
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
    object dbnItogo: TDBNumberEditEh
      Left = 112
      Top = 232
      Width = 191
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Ctl3D = True
      currency = False
      DataField = 'NDS'
      DataSource = dsNakloEdit
      DecimalPlaces = 4
      DisplayFormat = '0.00'
      Enabled = False
      EditButton.Style = ebsUpDownEh
      EditButton.Visible = True
      EditButtons = <>
      Increment = 0.010000000000000000
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 9
      Visible = True
    end
    object dbeComment: TDBEdit
      Left = 112
      Top = 208
      Width = 191
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      DataField = 'Comment'
      DataSource = dsNakloEdit
      TabOrder = 8
      OnKeyPress = dbeIDKeyPress
    end
    object lcbTipConst: TDBLookupComboboxEh
      Left = 112
      Top = 64
      Width = 191
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'TIP'
      DataSource = dsNakloEdit
      DropDownBox.AutoDrop = True
      DropDownBox.Rows = 15
      EditButtons = <>
      KeyField = 'ID_FIELD'
      ListField = 'FIELD_VALUE'
      ListSource = dsNakloTip
      TabOrder = 2
      Visible = True
      OnCloseUp = lcbTipConstCloseUp
      OnKeyPress = dbeIDKeyPress
      OnKeyValueChanged = lcbTipConstKeyValueChanged
    end
    object dbeID: TDBEditEh
      Left = 112
      Top = 40
      Width = 191
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'id'
      DataSource = dsNakloEdit
      EditButtons = <>
      TabOrder = 1
      Visible = True
      OnKeyPress = dbeIDKeyPress
    end
    object lcbSklad: TDBLookupComboboxEh
      Left = 112
      Top = 256
      Width = 191
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'SKLAD'
      DataSource = dsNakloEdit
      DropDownBox.AutoDrop = True
      DropDownBox.Rows = 15
      EditButtons = <>
      TabOrder = 10
      Visible = True
      OnKeyPress = dbeIDKeyPress
    end
    object lcbSkladTo: TDBLookupComboboxEh
      Left = 112
      Top = 280
      Width = 207
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'SKLAD_TO'
      DataSource = dsNakloEdit
      DropDownBox.AutoDrop = True
      DropDownBox.Rows = 15
      EditButtons = <
        item
          ShortCut = 0
          Style = ebsPlusEh
          OnClick = lcbSkladToEditButtons0Click
        end>
      TabOrder = 11
      Visible = True
      OnKeyPress = dbeIDKeyPress
    end
    object dteDat: TDBDateTimeEditEh
      Left = 112
      Top = 88
      Width = 191
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'dat'
      DataSource = dsNakloEdit
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 3
      Visible = True
      OnKeyPress = dbeIDKeyPress
    end
    object lcdParentIdNakl2: TDBComboBoxEh
      Left = 112
      Top = 304
      Width = 207
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      DataField = 'parent_id'
      DataSource = dsNakloEdit
      EditButtons = <
        item
          Style = ebsMinusEh
          OnClick = lcdParentIdNakl2EditButtons0Click
        end>
      Items.Strings = (
        #1055#1088#1080#1093#1086#1076#1085#1072#1103' '#1073#1091#1093#1075#1072#1083#1090#1077#1088#1089#1082#1072#1103' '#1085#1072#1082#1083#1072#1076#1085#1072#1103
        #1042#1086#1079#1074#1088#1072#1090#1085#1072#1103' '#1085#1072#1082#1083#1072#1076#1085#1072#1103)
      TabOrder = 12
      Visible = True
      OnButtonDown = lcdParentIdNakl2ButtonDown
      OnChange = lcdParentIdNakl2Change
      OnCloseUp = lcdParentIdNakl2CloseUp
      OnKeyPress = dbeIDKeyPress
    end
  end
  object dsNakloEdit: TDataSource
    Left = 264
    Top = 184
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
  end
  object cdsNakloTip: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNakloTip'
    Left = 264
    Top = 152
    object StringField3: TStringField
      FieldName = 'FIELD_VALUE'
      Size = 50
    end
    object IntegerField2: TIntegerField
      FieldName = 'ID_FIELD'
      Required = True
    end
  end
  object dspNakloTip: TDataSetProvider
    DataSet = sdsNakloTip
    Left = 264
    Top = 120
  end
  object sdsNakloTip: TSQLDataSet
    CommandText = 
      'select '#13#10'  o.oid as id_field,'#13#10'  o.name as field_value'#13#10'from'#13#10'  ' +
      'objects o'#13#10'where'#13#10'  o.classid=101 and o.delmarked=0'#13#10'order by'#13#10' ' +
      ' o.name'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 264
    Top = 88
  end
  object dsNakloTip: TDataSource
    DataSet = cdsNakloTip
    Left = 264
    Top = 56
  end
end
