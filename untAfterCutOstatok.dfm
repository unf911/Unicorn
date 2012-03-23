object frmAfterCutOstatok: TfrmAfterCutOstatok
  Left = 147
  Top = 259
  BorderStyle = bsDialog
  Caption = #1054#1090#1095#1105#1090' '#1087#1086' '#1086#1089#1090#1072#1090#1082#1072#1084' '#1087#1086#1089#1083#1077' '#1076#1072#1085#1085#1086#1081' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
  ClientHeight = 334
  ClientWidth = 621
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    621
    334)
  PixelsPerInch = 96
  TextHeight = 13
  object dbgAfterCutOstatok: TDBGridEh
    Left = 8
    Top = 8
    Width = 609
    Height = 286
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsSklostdet
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'TOVAR'
        Footers = <>
        Width = 127
      end
      item
        EditButtons = <>
        FieldName = 'TARA'
        Footers = <>
        Width = 66
      end
      item
        EditButtons = <>
        FieldName = 'NOMER_TARY'
        Footers = <>
        Width = 67
      end
      item
        EditButtons = <>
        FieldName = 'KOLOTP'
        Footers = <>
        Width = 58
      end
      item
        EditButtons = <>
        FieldName = 'KOLBUXT'
        Footers = <>
        Width = 37
      end
      item
        EditButtons = <>
        FieldName = 'TIP2'
        Footers = <>
        Width = 97
      end
      item
        EditButtons = <>
        FieldName = 'KOLOTP_ITOG'
        Footers = <>
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'KOLBUXT_ITOG'
        Footers = <>
        Width = 35
      end>
  end
  object btnOk: TBitBtn
    Left = 208
    Top = 303
    Width = 185
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    TabOrder = 1
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
  object BitBtn2: TBitBtn
    Left = 504
    Top = 303
    Width = 112
    Height = 25
    Action = actDetail
    Anchors = [akRight, akBottom]
    Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
    TabOrder = 2
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8400
      00840000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF840000C6C6C6840000840000FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000C6C6C68400
      00840000840000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FF840000C6C6C6840000840000840000FF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF000000000000000000000000840000C6C6C68400008400008400
      00FF00FFFF00FFFF00FFFF00FFFF00FF000000000000C6C6C6C6C6C6C6C6C6FF
      FFFF848484840000840000840000FF00FFFF00FFFF00FFFF00FFFF00FF000000
      848484C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6FFFFFF848484000000FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FF000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
      C6C6C6C6C6FFFFFF000000FF00FFFF00FFFF00FFFF00FFFF00FF000000C6C6C6
      C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6000000FF00
      FFFF00FFFF00FFFF00FF000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
      C6C6C6C6C6C6C6C6C6C6C6000000FF00FFFF00FFFF00FFFF00FF000000C6C6C6
      FFFFFFFFFF00C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6000000FF00
      FFFF00FFFF00FFFF00FF000000C6C6C6FFFFFFFFFF00C6C6C6C6C6C6C6C6C6C6
      C6C6C6C6C6C6C6C6C6C6C6000000FF00FFFF00FFFF00FFFF00FFFF00FF000000
      FFFFFFFFFFFFFFFF00FFFF00C6C6C6C6C6C6C6C6C6C6C6C6000000FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FF000000848484FFFFFFFFFFFFFFFFFFC6C6C6C6
      C6C6C6C6C6848484000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      000000000000C6C6C6C6C6C6C6C6C6C6C6C6000000000000FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00000000000000000000
      0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
  end
  object dspSklostdet: TDataSetProvider
    DataSet = sdsSklostdet
    Left = 32
    Top = 88
  end
  object cdsSklostdet: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_nakl'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspSklostdet'
    Left = 32
    Top = 120
    object cdsSklostdetTOVAR: TStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      FieldName = 'TOVAR'
      Size = 50
    end
    object cdsSklostdetTARA: TStringField
      DisplayLabel = #1058#1072#1088#1072
      FieldName = 'TARA'
      Size = 50
    end
    object cdsSklostdetNOMER_TARY: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1090#1072#1088#1099
      FieldName = 'NOMER_TARY'
      Size = 30
    end
    object cdsSklostdetKOLOTP: TFMTBCDField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'KOLOTP'
      DisplayFormat = '0.000'
      Precision = 15
    end
    object cdsSklostdetKOLBUXT: TIntegerField
      DisplayLabel = #1050#1086#1083'.'#1073#1091#1093#1090
      FieldName = 'KOLBUXT'
    end
    object cdsSklostdetTIP2: TStringField
      DisplayLabel = #1058#1080#1087
      FieldKind = fkLookup
      FieldName = 'TIP2'
      LookupDataSet = dmdEx.cdsNaklodetTip
      LookupKeyFields = 'ID_FIELD'
      LookupResultField = 'FIELD_VALUE'
      KeyFields = 'TIP'
      Lookup = True
    end
    object cdsSklostdetTIP: TIntegerField
      FieldName = 'TIP'
    end
    object cdsSklostdetKOLOTP_ITOG: TFMTBCDField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1086#1089#1090#1072#1083#1086#1089#1100
      FieldName = 'KOLOTP_ITOG'
      DisplayFormat = '0.000'
      Precision = 15
    end
    object cdsSklostdetKOLBUXT_ITOG: TIntegerField
      DisplayLabel = #1041#1091#1093#1090' '#1086#1089#1090#1072#1083#1086#1089#1100
      FieldName = 'KOLBUXT_ITOG'
    end
    object cdsSklostdetID_OSTT: TIntegerField
      FieldName = 'ID_OSTT'
    end
  end
  object sdsSklostdet: TSQLDataSet
    CommandText = 
      'select '#13#10'  tovar,tara,nomer_tary,kolotp,kolbuxt,tip,kolotp_itog,' +
      'kolbuxt_itog,id_ostt'#13#10'from'#13#10'  rep_after_cut_ostatok_pc(:id_nakl)' +
      #13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_nakl'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = dmdEx.scUchet
    Left = 32
    Top = 56
  end
  object dsSklostdet: TDataSource
    DataSet = cdsSklostdet
    Left = 32
    Top = 152
  end
  object ActionList1: TActionList
    Left = 32
    Top = 184
    object actDetail: TAction
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      ShortCut = 120
      OnExecute = actDetailExecute
    end
  end
  object MainMenu1: TMainMenu
    Left = 32
    Top = 216
    object mnuAction: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      GroupIndex = 10
      object N1: TMenuItem
        Action = actDetail
      end
    end
  end
end
