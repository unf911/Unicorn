object frmSebestOstDet: TfrmSebestOstDet
  Left = 9
  Top = 120
  BorderStyle = bsDialog
  Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103' '#1089#1077#1073#1077#1089#1090#1086#1080#1084#1086#1089#1090#1080
  ClientHeight = 352
  ClientWidth = 611
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    611
    352)
  PixelsPerInch = 96
  TextHeight = 13
  object lblPartiya: TLabel
    Left = 224
    Top = 4
    Width = 37
    Height = 13
    Caption = #1055#1072#1088#1090#1080#1103
  end
  object lblid: TLabel
    Left = 336
    Top = 4
    Width = 35
    Height = 13
    Caption = #8470#1085#1072#1082#1083
  end
  object Label5: TLabel
    Left = 8
    Top = 4
    Width = 31
    Height = 13
    Caption = #1057#1082#1083#1072#1076
  end
  object Label6: TLabel
    Left = 112
    Top = 4
    Width = 31
    Height = 13
    Caption = #1058#1086#1074#1072#1088
  end
  object Label2: TLabel
    Left = 464
    Top = 4
    Width = 38
    Height = 13
    Caption = #1042#1072#1083#1102#1090#1072
    Visible = False
  end
  object Label4: TLabel
    Left = 536
    Top = 4
    Width = 26
    Height = 13
    Caption = #1044#1072#1090#1072
    Visible = False
  end
  object dbgSklostdet: TDBGridEh
    Left = 8
    Top = 48
    Width = 596
    Height = 265
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
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    VertScrollBar.VisibleMode = sbAlwaysShowEh
    OnDblClick = dbgSklostdetDblClick
    OnKeyUp = dbgSklostdetKeyUp
  end
  object btnOk: TBitBtn
    Left = 184
    Top = 320
    Width = 297
    Height = 25
    Action = actExit
    Anchors = [akLeft, akBottom]
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
  object dbeID: TDBEditEh
    Left = 336
    Top = 16
    Width = 121
    Height = 21
    TabStop = False
    DataField = 'ID'
    DataSource = dsSklostdet
    EditButtons = <>
    ReadOnly = True
    TabOrder = 2
    Visible = True
  end
  object BitBtn1: TBitBtn
    Left = 498
    Top = 319
    Width = 97
    Height = 25
    Action = actDetail
    Anchors = [akRight, akBottom]
    Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
    TabOrder = 3
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
  object edtSklad: TEdit
    Left = 8
    Top = 16
    Width = 97
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 4
  end
  object edtTovar: TEdit
    Left = 112
    Top = 16
    Width = 105
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 5
  end
  object edtPartiya: TEdit
    Left = 224
    Top = 16
    Width = 105
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 6
  end
  object edtCurrency: TEdit
    Left = 464
    Top = 16
    Width = 65
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 7
    Visible = False
  end
  object edtDate: TEdit
    Left = 536
    Top = 16
    Width = 65
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 8
    Visible = False
  end
  object BitBtn2: TBitBtn
    Left = 9
    Top = 320
    Width = 97
    Height = 25
    Action = actRefresh
    Anchors = [akLeft, akBottom]
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100
    TabOrder = 9
    Kind = bkRetry
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
        Name = 'mode'
        ParamType = ptInput
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'id_sklad_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_tovar_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_currency_to'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dat_to'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_partiya_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_nakld_in'
        ParamType = ptInput
      end>
    ProviderName = 'dspSklostdet'
    Left = 32
    Top = 120
    object cdsSklostdetID_PARTIYA: TIntegerField
      DisplayLabel = #8470#1087#1072#1088#1090#1080#1080
      FieldName = 'ID_PARTIYA'
    end
    object cdsSklostdetID: TStringField
      DisplayLabel = #8470#1085#1072#1082#1083
      DisplayWidth = 15
      FieldName = 'ID'
    end
    object cdsSklostdetDAT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 10
      FieldName = 'DAT'
      DisplayFormat = 'dd.mm.yy'
    end
    object cdsSklostdetKOLOTP: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'KOLOTP'
      DisplayFormat = '0.000'
    end
    object cdsSklostdetSEBEST: TFloatField
      DisplayLabel = #1057'/'#1089
      FieldName = 'SEBEST'
      DisplayFormat = '0.00'
    end
    object cdsSklostdetCENA: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'CENA'
      DisplayFormat = '0.00'
    end
    object cdsSklostdetKURS: TFloatField
      DisplayLabel = #1050#1091#1088#1089
      FieldName = 'KURS'
      DisplayFormat = '0.0000'
    end
    object cdsSklostdetNALOG_NDS: TFloatField
      DisplayLabel = #1053#1072#1083#1086#1075' '#1053#1044#1057
      FieldName = 'NALOG_NDS'
      DisplayFormat = '0.00'
    end
    object cdsSklostdetZATRATY: TFloatField
      DisplayLabel = #1047#1072#1090#1088#1072#1090#1099
      FieldName = 'ZATRATY'
      DisplayFormat = '0.0'
    end
    object cdsSklostdetID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      Visible = False
    end
    object cdsSklostdetID_NAKLD: TIntegerField
      FieldName = 'ID_NAKLD'
      Visible = False
    end
    object cdsSklostdetID_UCHET_POLITICS: TIntegerField
      FieldName = 'ID_UCHET_POLITICS'
      Visible = False
    end
    object cdsSklostdetTIP: TIntegerField
      FieldName = 'TIP'
      Visible = False
    end
  end
  object sdsSklostdet: TSQLDataSet
    CommandText = 
      'select'#13#10'   id_partiya,id,dat,'#13#10'  kolotp,sebest,'#13#10'  cena,kurs,'#13#10' ' +
      ' nalog_nds,'#13#10'  zatraty,'#13#10'  id_nakl,'#13#10'  id_nakld,'#13#10'  id_uchet_pol' +
      'itics,'#13#10'  tip'#13#10'from '#13#10'  rep_sebest_sklad_det_pc(:mode,:id_sklad_' +
      'in,:id_tovar_in,'#13#10'  :id_currency_to,:dat_to,:id_partiya_in,:id_n' +
      'akld_in) r'#13#10'order by'#13#10'  dat'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'mode'
        ParamType = ptInput
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'id_sklad_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_tovar_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_currency_to'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dat_to'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_partiya_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_nakld_in'
        ParamType = ptInput
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
    Images = dmdEx.ImageList1
    Left = 32
    Top = 184
    object actExit: TAction
      Caption = 'OK'
      ShortCut = 27
      OnExecute = actExitExecute
    end
    object actDetail: TAction
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      ImageIndex = 5
      ShortCut = 120
      OnExecute = actDetailExecute
    end
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ShortCut = 116
      OnExecute = actRefreshExecute
    end
  end
  object sdsSklostt2: TSQLDataSet
    CommandText = 
      'select'#13#10'  st.id_tara,'#13#10'  st.nomer_tary,'#13#10'  sm.id_tovar,'#13#10'  sm.id' +
      '_sklad'#13#10'from '#13#10'  sklostt st inner join sklost sm on sm.id_ost=st' +
      '.id_ost  '#13#10'where '#13#10'  st.id_ostt=:id_ostt'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_ostt'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = dmdEx.scUchet
    Left = 248
    Top = 88
    object sdsSklostt2ID_TARA: TIntegerField
      FieldName = 'ID_TARA'
      Required = True
    end
    object sdsSklostt2NOMER_TARY: TStringField
      FieldName = 'NOMER_TARY'
      Size = 30
    end
    object sdsSklostt2ID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
      Required = True
    end
    object sdsSklostt2ID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
      Required = True
    end
  end
  object dsSklostt2: TDataSource
    Tag = 2
    DataSet = cdsSklostt23
    Left = 248
    Top = 184
  end
  object dspSklostt: TDataSetProvider
    DataSet = sdsSklostt2
    Left = 248
    Top = 120
  end
  object cdsSklostt23: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_ostt'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspSklostt'
    ReadOnly = True
    Left = 248
    Top = 152
    object cdsSklostt23ID_TARA: TIntegerField
      FieldName = 'ID_TARA'
      Required = True
    end
    object cdsSklostt23NOMER_TARY: TStringField
      FieldName = 'NOMER_TARY'
      Size = 30
    end
    object cdsSklostt23ID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
      Required = True
    end
    object cdsSklostt23ID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
      Required = True
    end
    object cdsSklostt23TOVAR: TStringField
      FieldKind = fkLookup
      FieldName = 'TOVAR'
      LookupDataSet = dmdEx.cdsTovar
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_TOVAR'
      Lookup = True
    end
    object cdsSklostt23TARA: TStringField
      FieldKind = fkLookup
      FieldName = 'TARA'
      LookupDataSet = dmdEx.cdsTara
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_TARA'
      Lookup = True
    end
  end
  object RegPropStorageManEh1: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 136
    Top = 56
  end
  object PropStorageEh1: TPropStorageEh
    Active = False
    Section = 'frmSebestOstDet'
    StorageManager = RegPropStorageManEh1
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      '<P>.WindowState'
      'dbgSklostdet.<P>.Columns.<ForAllItems>.Width')
    Left = 104
    Top = 56
  end
  object UnfFilter1: TUnfFilter
    DBGridEh = dbgSklostdet
    MTStrings.Find = #1055#1086#1080#1089#1082
    MTStrings.Filter = #1060#1080#1083#1100#1090#1088
    MTStrings.Copy = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
    MTStrings.Paste = #1042#1089#1090#1072#1074#1080#1090#1100
    MTStrings.Restore = #1057#1085#1103#1090#1100' '#1092#1080#1083#1100#1090#1088
    MTStrings.RestoreColumn = #1057#1085#1103#1090#1100' '#1092#1080#1083#1100#1090#1088' c '#1082#1086#1083#1086#1085#1082#1080
    MTStrings.MatchCase = #1059#1095#1080#1090#1099#1074#1072#1090#1100' '#1088#1077#1075#1080#1089#1090#1088
    MTStrings.AnyPartofField = #1042' '#1089#1090#1088#1086#1082#1077
    MTStrings.WholeField = #1057#1090#1088#1086#1082#1072' '#1094#1077#1083#1080#1082#1086#1084
    MTStrings.StartofField = #1042' '#1085#1072#1095#1072#1083#1077' '#1089#1090#1088#1086#1082#1080
    Left = 32
    Top = 216
  end
end
