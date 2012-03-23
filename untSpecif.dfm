object frmSpecif: TfrmSpecif
  Left = 146
  Top = 97
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1057#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1103
  ClientHeight = 369
  ClientWidth = 536
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    536
    369)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 88
    Height = 13
    Caption = #8470' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1080
  end
  object Label2: TLabel
    Left = 8
    Top = 61
    Width = 61
    Height = 13
    Caption = #8470' '#1076#1086#1075#1086#1074#1086#1088#1072
  end
  object Label3: TLabel
    Left = 8
    Top = 93
    Width = 76
    Height = 13
    Caption = #1044#1072#1090#1072' '#1076#1086#1075#1086#1074#1086#1088#1072
  end
  object Label4: TLabel
    Left = 8
    Top = 125
    Width = 91
    Height = 13
    Caption = #1051#1080#1094#1086' '#1086#1090' '#1087#1088#1086#1076#1072#1074#1094#1072
  end
  object Label5: TLabel
    Left = 8
    Top = 157
    Width = 109
    Height = 26
    Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1087#1088#1086#1076#1072#1074#1094#1072
    WordWrap = True
  end
  object Label6: TLabel
    Left = 8
    Top = 189
    Width = 60
    Height = 13
    Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100
    WordWrap = True
  end
  object Label7: TLabel
    Left = 8
    Top = 221
    Width = 101
    Height = 13
    Caption = #1051#1080#1094#1086' '#1086#1090' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1103
    WordWrap = True
  end
  object Label8: TLabel
    Left = 8
    Top = 253
    Width = 109
    Height = 26
    Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1103
    WordWrap = True
  end
  object Label9: TLabel
    Left = 312
    Top = 8
    Width = 75
    Height = 13
    Caption = #1057#1088#1086#1082' '#1087#1086#1089#1090#1072#1074#1082#1080
  end
  object Label10: TLabel
    Left = 312
    Top = 160
    Width = 84
    Height = 13
    Caption = #1054#1089#1086#1073#1099#1077' '#1091#1089#1083#1086#1074#1080#1103
  end
  object Label11: TLabel
    Left = 8
    Top = 29
    Width = 103
    Height = 13
    Caption = #1044#1072#1090#1072' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1080
  end
  object dbnSpecNum: TDBNumberEditEh
    Left = 152
    Top = 4
    Width = 145
    Height = 21
    DataField = 'SPEC_NUM'
    DataSource = dsSpecif
    DecimalPlaces = 0
    EditButton.Style = ebsUpDownEh
    EditButton.Visible = True
    EditButtons = <>
    TabOrder = 0
    Visible = True
  end
  object dbeDogNum: TDBEdit
    Left = 152
    Top = 61
    Width = 145
    Height = 21
    DataField = 'DOG_NUM'
    DataSource = dsSpecif
    TabOrder = 2
  end
  object dbeIzgDirector: TDBEdit
    Left = 152
    Top = 125
    Width = 145
    Height = 21
    DataField = 'IZG_DIRECTOR'
    DataSource = dsSpecif
    TabOrder = 4
  end
  object dbeZak: TDBEdit
    Left = 152
    Top = 189
    Width = 145
    Height = 21
    DataField = 'ZAK'
    DataSource = dsSpecif
    TabOrder = 6
  end
  object dbcIzgOsnov: TDBComboBox
    Left = 152
    Top = 157
    Width = 145
    Height = 21
    DataField = 'IZG_OSNOV'
    DataSource = dsSpecif
    ItemHeight = 13
    Items.Strings = (
      #1059#1089#1090#1072#1074#1072
      #1044#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1080)
    TabOrder = 5
  end
  object dbeZakDirector: TDBEdit
    Left = 152
    Top = 221
    Width = 145
    Height = 21
    DataField = 'ZAK_DIRECTOR'
    DataSource = dsSpecif
    TabOrder = 7
  end
  object dbmOsobyeUsloviya: TDBMemo
    Left = 311
    Top = 176
    Width = 218
    Height = 153
    DataField = 'OSOBYE_USLOVIYA'
    DataSource = dsSpecif
    TabOrder = 10
  end
  object btnCancel: TBitBtn
    Left = 192
    Top = 333
    Width = 129
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 13
    OnClick = btnCancelClick
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
  object btnApply: TBitBtn
    Left = 360
    Top = 333
    Width = 129
    Height = 25
    Action = actApply
    Anchors = [akLeft, akBottom]
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    TabOrder = 14
    Glyph.Data = {
      F2010000424DF201000000000000760000002800000024000000130000000100
      0400000000007C01000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
      3333333333388F3333333333000033334224333333333333338338F333333333
      0000333422224333333333333833338F33333333000033422222243333333333
      83333338F3333333000034222A22224333333338F33F33338F33333300003222
      A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
      38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
      2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
      0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
      333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
      33333A2224A2233333333338F338F83300003333333333A2224A333333333333
      8F338F33000033333333333A222433333333333338F338F30000333333333333
      A224333333333333338F38F300003333333333333A223333333333333338F8F3
      000033333333333333A3333333333333333383330000}
    NumGlyphs = 2
  end
  object dbcZakOsnov: TDBComboBox
    Left = 152
    Top = 253
    Width = 145
    Height = 21
    DataField = 'ZAK_OSNOV'
    DataSource = dsSpecif
    ItemHeight = 13
    Items.Strings = (
      #1059#1089#1090#1072#1074#1072
      #1044#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1080
      #1057#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1072' '#1086' '#1075#1086#1089#1091#1076#1072#1088#1089#1090#1074#1077#1085#1085#1086#1081' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080)
    TabOrder = 8
  end
  object BitBtn2: TBitBtn
    Left = 24
    Top = 293
    Width = 161
    Height = 25
    Action = actPreview
    Anchors = [akLeft, akBottom]
    Caption = #1055#1077#1095#1072#1090#1100' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1080
    TabOrder = 11
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF00000000000000000000000000000000
      0000000000000000000000000000000000FF00FFFF00FFFF00FFFF00FF000000
      C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6000000C6C6
      C6000000FF00FFFF00FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000C6C6C6000000FF00FF000000C6C6C6
      C6C6C6C6C6C6C6C6C6C6C6C6C6C6C600FFFF00FFFF00FFFFC6C6C6C6C6C60000
      00000000000000FF00FF000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C684
      8484848484848484C6C6C6C6C6C6000000C6C6C6000000FF00FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00C6C6C6C6C6C6000000000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
      C6C6C6C6C6C6C6C6C6C6C6000000C6C6C6000000C6C6C6000000FF00FF000000
      000000000000000000000000000000000000000000000000000000C6C6C60000
      00C6C6C6000000000000FF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF000000C6C6C6000000C6C6C6000000FF00FFFF00FF
      FF00FF000000FFFFFF000000000000000000000000000000FFFFFF0000000000
      00000000000000FF00FFFF00FFFF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF000000FFFFFF000000000000000000000000000000FFFFFF0000
      00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF0000000000000000000000000000000000000000000000
      00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
  end
  object btnOk: TBitBtn
    Left = 24
    Top = 333
    Width = 121
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 12
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
  object dteDat2: TDBDateTimeEditEh
    Left = 152
    Top = 93
    Width = 145
    Height = 21
    DataField = 'DOG_DATE'
    DataSource = dsSpecif
    EditButtons = <>
    Kind = dtkDateEh
    TabOrder = 3
    Visible = True
  end
  object dteSpecDate: TDBDateTimeEditEh
    Left = 152
    Top = 29
    Width = 145
    Height = 21
    DataField = 'SPEC_DATE'
    DataSource = dsSpecif
    EditButtons = <>
    Kind = dtkDateEh
    TabOrder = 1
    Visible = True
  end
  object dbmSrokPostavki: TDBEditEh
    Left = 312
    Top = 24
    Width = 217
    Height = 129
    AutoSize = False
    DataField = 'SROK_POSTAVKI'
    DataSource = dsSpecif
    EditButtons = <>
    MRUList.Active = True
    TabOrder = 9
    Visible = True
    WantReturns = True
    WordWrap = True
  end
  object BitBtn1: TBitBtn
    Left = 240
    Top = 293
    Width = 57
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1055#1077#1095#1072#1090#1100' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1080
    TabOrder = 15
    Visible = False
    OnClick = BitBtn1Click
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF00000000000000000000000000000000
      0000000000000000000000000000000000FF00FFFF00FFFF00FFFF00FF000000
      C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6000000C6C6
      C6000000FF00FFFF00FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000C6C6C6000000FF00FF000000C6C6C6
      C6C6C6C6C6C6C6C6C6C6C6C6C6C6C600FFFF00FFFF00FFFFC6C6C6C6C6C60000
      00000000000000FF00FF000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C684
      8484848484848484C6C6C6C6C6C6000000C6C6C6000000FF00FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00C6C6C6C6C6C6000000000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
      C6C6C6C6C6C6C6C6C6C6C6000000C6C6C6000000C6C6C6000000FF00FF000000
      000000000000000000000000000000000000000000000000000000C6C6C60000
      00C6C6C6000000000000FF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF000000C6C6C6000000C6C6C6000000FF00FFFF00FF
      FF00FF000000FFFFFF000000000000000000000000000000FFFFFF0000000000
      00000000000000FF00FFFF00FFFF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF000000FFFFFF000000000000000000000000000000FFFFFF0000
      00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF0000000000000000000000000000000000000000000000
      00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
  end
  object sdsSpecif: TSQLDataSet
    CommandText = 'select *'#13#10'from'#13#10'  SPECIF sf'#13#10'where'#13#10'  sf.id_nakl=:id_nakl'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_nakl'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 472
    object sdsSpecifID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsSpecifSPEC_NUM: TIntegerField
      FieldName = 'SPEC_NUM'
    end
    object sdsSpecifSPEC_DATE: TSQLTimeStampField
      FieldName = 'SPEC_DATE'
      Required = True
    end
    object sdsSpecifDOG_NUM: TStringField
      FieldName = 'DOG_NUM'
    end
    object sdsSpecifDOG_DATE: TSQLTimeStampField
      FieldName = 'DOG_DATE'
      Required = True
    end
    object sdsSpecifIZG_DIRECTOR: TStringField
      FieldName = 'IZG_DIRECTOR'
      Size = 50
    end
    object sdsSpecifIZG_OSNOV: TStringField
      FieldName = 'IZG_OSNOV'
      Size = 30
    end
    object sdsSpecifZAK: TStringField
      FieldName = 'ZAK'
      Required = True
      Size = 100
    end
    object sdsSpecifZAK_DIRECTOR: TStringField
      FieldName = 'ZAK_DIRECTOR'
      Required = True
      Size = 100
    end
    object sdsSpecifZAK_OSNOV: TStringField
      FieldName = 'ZAK_OSNOV'
      Required = True
      Size = 100
    end
    object sdsSpecifSROK_POSTAVKI: TStringField
      FieldName = 'SROK_POSTAVKI'
      Size = 32000
    end
    object sdsSpecifOSOBYE_USLOVIYA: TStringField
      FieldName = 'OSOBYE_USLOVIYA'
      Size = 32000
    end
  end
  object dspSpecif: TDataSetProvider
    DataSet = sdsSpecif
    UpdateMode = upWhereKeyOnly
    Left = 472
    Top = 32
  end
  object cdsSpecif: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_nakl'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspSpecif'
    AfterInsert = cdsSpecifAfterInsert
    OnReconcileError = cdsSpecifReconcileError
    Left = 472
    Top = 64
    object cdsSpecifID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSpecifSPEC_NUM: TIntegerField
      FieldName = 'SPEC_NUM'
    end
    object cdsSpecifSPEC_DATE: TSQLTimeStampField
      FieldName = 'SPEC_DATE'
      Required = True
    end
    object cdsSpecifDOG_NUM: TStringField
      FieldName = 'DOG_NUM'
    end
    object cdsSpecifDOG_DATE: TSQLTimeStampField
      FieldName = 'DOG_DATE'
      Required = True
    end
    object cdsSpecifIZG_DIRECTOR: TStringField
      FieldName = 'IZG_DIRECTOR'
      Size = 50
    end
    object cdsSpecifIZG_OSNOV: TStringField
      FieldName = 'IZG_OSNOV'
      Size = 30
    end
    object cdsSpecifZAK: TStringField
      FieldName = 'ZAK'
      Required = True
      Size = 100
    end
    object cdsSpecifZAK_DIRECTOR: TStringField
      FieldName = 'ZAK_DIRECTOR'
      Required = True
      Size = 100
    end
    object cdsSpecifZAK_OSNOV: TStringField
      FieldName = 'ZAK_OSNOV'
      Required = True
      Size = 100
    end
    object cdsSpecifSROK_POSTAVKI: TStringField
      FieldName = 'SROK_POSTAVKI'
      Size = 32000
    end
    object cdsSpecifOSOBYE_USLOVIYA: TStringField
      FieldName = 'OSOBYE_USLOVIYA'
      Size = 32000
    end
  end
  object dsSpecif: TDataSource
    DataSet = cdsSpecif
    Left = 472
    Top = 96
  end
  object ActionList1: TActionList
    Left = 472
    Top = 128
    object actApply: TAction
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      OnExecute = actApplyExecute
    end
    object actPreview: TAction
      Caption = #1055#1077#1095#1072#1090#1100' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1080
      ImageIndex = 12
      ShortCut = 16471
      OnExecute = actPreviewExecute
    end
  end
  object frSpecif: TfrxReport
    Version = '3.23.7'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38985.433781828700000000
    ReportOptions.LastChange = 40593.746071678250000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      '  i :integer;'
      ''
      'procedure Memo4OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo4, Engine do'
      '  begin'
      '    set(<iPunkt>,1);'
      '    i:=2;'
      '    //if FinalPass then inc(i);'
      '  end'
      'end;'
      ''
      'procedure Memo18OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo18, Engine do'
      '  begin'
      '    set(<iPunkt>,<iPunkt>+1);'
      '    //if FinalPass then inc(i);'
      '  end'
      'end;'
      ''
      'procedure ReportSummary1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  set(<iPunkt>,<iPunkt>+1);'
      '  //inc(i);'
      'end;'
      ''
      'procedure Memo16OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo16, Engine do'
      '  begin'
      '    set(<iPunkt>,<iPunkt>+1);'
      '    if FinalPass then inc(i);'
      '  end'
      'end;'
      ''
      'procedure Memo40OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo40, Engine do'
      '  begin'
      '    set(<iPunkt>,<iPunkt>+1);'
      '    if FinalPass then begin'
      '     if LENGTH(<frdSpecif."OSOBYE_USLOVIYA">)>0 then begin'
      '       inc(i);'
      '     end'
      '    end'
      '  end'
      'end;'
      ''
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnGetValue = frSpecifGetValue
    Left = 472
    Top = 160
    Datasets = <
      item
        DataSet = frdNaklr
        DataSetName = 'frdNaklr'
      end
      item
        DataSet = frdNaklrt
        DataSetName = 'frdNaklrt'
      end
      item
        DataSet = frdSpecif
        DataSetName = 'frdSpecif'
      end>
    Variables = <
      item
        Name = ' All vars'
        Value = Null
      end
      item
        Name = 'iPunkt'
        Value = '1'
      end
      item
        Name = 'sZak'
        Value = Null
      end
      item
        Name = 'sIzg'
        Value = Null
      end
      item
        Name = 'IzgName'
        Value = Null
      end
      item
        Name = 'ZakName'
        Value = ''
      end>
    Style = <>
  end
  object frdNaklrt: TfrxDBDataset
    UserName = 'frdNaklrt'
    CloseDataSource = False
    DataSource = dsNaklrt
    Left = 472
    Top = 224
  end
  object frdNaklr: TfrxDBDataset
    UserName = 'frdNaklr'
    CloseDataSource = False
    DataSource = dsNaklr
    Left = 440
    Top = 224
  end
  object dsNaklr: TDataSource
    Left = 440
    Top = 192
  end
  object dsNaklrt: TDataSource
    Left = 472
    Top = 192
  end
  object MainMenu1: TMainMenu
    Left = 440
    Top = 160
    object N1: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      GroupIndex = 10
      object N6: TMenuItem
        Action = actPreview
      end
    end
  end
  object frdSpecif: TfrxDBDataset
    UserName = 'frdSpecif'
    CloseDataSource = False
    DataSource = dsSpecif
    Left = 408
    Top = 224
  end
end
