object frmSebestOstDet3: TfrmSebestOstDet3
  Left = 334
  Top = 186
  BorderStyle = bsDialog
  Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103' '#1089#1077#1073#1077#1089#1090#1086#1080#1084#1086#1089#1090#1080
  ClientHeight = 333
  ClientWidth = 611
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    611
    333)
  PixelsPerInch = 96
  TextHeight = 13
  object dbgSklostdet: TDBGridEh
    Left = 4
    Top = 76
    Width = 605
    Height = 214
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoFitColWidths = True
    DataSource = dsSklostdet
    Flat = False
    FooterColor = clInfoBk
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghRowHighlight]
    ReadOnly = True
    SortLocal = True
    SumList.Active = True
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
    Left = 180
    Top = 301
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
  object BitBtn1: TBitBtn
    Left = 119
    Top = 1
    Width = 97
    Height = 25
    Action = actDetail
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
  object BitBtn2: TBitBtn
    Left = 1
    Top = 1
    Width = 104
    Height = 25
    Action = actRefresh
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100
    TabOrder = 3
    Kind = bkRetry
  end
  object Panel1: TPanel
    Left = 0
    Top = 28
    Width = 609
    Height = 45
    Anchors = [akLeft, akTop, akRight]
    BevelInner = bvLowered
    TabOrder = 4
    object Label5: TLabel
      Left = 8
      Top = 2
      Width = 31
      Height = 13
      Caption = #1057#1082#1083#1072#1076
    end
    object Label6: TLabel
      Left = 108
      Top = 2
      Width = 31
      Height = 13
      Caption = #1058#1086#1074#1072#1088
    end
    object lblPartiya: TLabel
      Left = 260
      Top = 4
      Width = 37
      Height = 13
      Caption = #1055#1072#1088#1090#1080#1103
    end
    object lblid: TLabel
      Left = 360
      Top = 4
      Width = 35
      Height = 13
      Caption = #8470#1085#1072#1082#1083
      Visible = False
    end
    object Label2: TLabel
      Left = 468
      Top = 4
      Width = 38
      Height = 13
      Caption = #1042#1072#1083#1102#1090#1072
      Visible = False
    end
    object Label4: TLabel
      Left = 539
      Top = 4
      Width = 26
      Height = 13
      Caption = #1044#1072#1090#1072
      Visible = False
    end
    object edtSklad: TEdit
      Left = 8
      Top = 16
      Width = 97
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 0
    end
    object edtTovar: TEdit
      Left = 108
      Top = 16
      Width = 149
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 1
    end
    object dbeID: TDBEditEh
      Left = 360
      Top = 16
      Width = 101
      Height = 21
      TabStop = False
      DataField = 'ID'
      DataSource = dsSklostdet
      EditButtons = <>
      ReadOnly = True
      TabOrder = 2
      Visible = False
    end
    object edtPartiya: TEdit
      Left = 260
      Top = 16
      Width = 97
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 3
    end
    object edtCurrency: TEdit
      Left = 464
      Top = 16
      Width = 69
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 4
      Visible = False
    end
    object edtDate: TEdit
      Left = 536
      Top = 16
      Width = 65
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 5
      Visible = False
    end
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
        DataType = ftFMTBcd
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
    object cdsSklostdetID_PARTIYA: TFMTBCDField
      DisplayLabel = #8470#1087#1072#1088#1090#1080#1080
      FieldName = 'ID_PARTIYA'
      Precision = 15
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
      DisplayLabel = #1057'/'#1089', '#1091'.'#1077'.'
      FieldName = 'SEBEST'
      DisplayFormat = '0.00000'
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
      DisplayFormat = '0.0##'
    end
    object cdsSklostdetID_UCHET_POLITICS: TIntegerField
      FieldName = 'ID_UCHET_POLITICS'
      Visible = False
    end
    object cdsSklostdetTIP_NAME: TStringField
      DisplayLabel = #1058#1080#1087
      FieldName = 'TIP_NAME'
      Size = 10
    end
    object cdsSklostdetTIP: TIntegerField
      FieldName = 'TIP'
      Visible = False
    end
    object cdsSklostdetID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
      Visible = False
    end
    object cdsSklostdetID_NAKL: TIntegerField
      DisplayLabel = #8470#1085#1072#1082#1083
      FieldName = 'ID_NAKL'
      Visible = False
    end
    object cdsSklostdetID_NAKLD: TIntegerField
      DisplayLabel = #8470#1087#1086#1079
      FieldName = 'ID_NAKLD'
      Visible = False
    end
    object cdsSklostdetID_SKLAD_TO: TIntegerField
      FieldName = 'ID_SKLAD_TO'
      Visible = False
    end
  end
  object sdsSklostdet: TSQLDataSet
    CommandText = 
      'select'#13#10'   id_partiya,id,dat,'#13#10'  kolotp,sebest,'#13#10'  cena,kurs,'#13#10' ' +
      ' nalog_nds,'#13#10'  zatraty,'#13#10'  id_nakl,'#13#10'  id_nakld,'#13#10'  id_uchet_pol' +
      'itics,'#13#10'  tip,'#13#10'  (select name from objects o where o.oid=r.tip)' +
      ' as tip_name,'#13#10'  (select om.id_sklad from naklo om where om.id_n' +
      'akl=r.id_nakl) as id_sklad,'#13#10'  (select om.id_sklad_to from naklo' +
      ' om where om.id_nakl=r.id_nakl) as id_sklad_to'#13#10'from '#13#10'  rep_seb' +
      'est4_sklad_det_pc(:mode,:id_sklad_in,:id_tovar_in,'#13#10'  :id_curren' +
      'cy_to,:dat_to,:id_partiya_in,:id_nakld_in) r'#13#10'order by'#13#10'  dat'
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
        DataType = ftFMTBcd
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
    object actDebug: TAction
      Caption = #1056#1077#1078#1080#1084' '#1086#1090#1083#1072#1076#1082#1080
      OnExecute = actDebugExecute
    end
    object actGotoRasx: TAction
      Caption = #1055#1077#1088#1077#1081#1090#1080' '#1082' '#1088#1072#1089#1093#1086#1076#1072#1084' '#1087#1072#1088#1090#1080#1081
      OnExecute = actGotoRasxExecute
    end
    object actPartiyaRecount: TAction
      Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1079#1072#1074#1080#1089#1080#1084#1099#1077' '#1086#1090' '#1087#1088#1080#1093#1086#1076#1072
      OnExecute = actPartiyaRecountExecute
    end
    object actPositionRecount: TAction
      Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1087#1086#1079#1080#1094#1080#1102
      OnExecute = actPositionRecountExecute
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
  object MainMenu1: TMainMenu
    Left = 68
    Top = 88
    object N1: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      GroupIndex = 10
      object mnuRefresh: TMenuItem
        Action = actRefresh
      end
      object N2: TMenuItem
        Action = actDetail
      end
      object N4: TMenuItem
        Action = actGotoRasx
      end
      object N3: TMenuItem
        Action = actDebug
      end
      object N5: TMenuItem
        Action = actPartiyaRecount
      end
      object N6: TMenuItem
        Action = actPositionRecount
      end
    end
  end
  object sdsNaklp_Sebest4_Recount: TSQLDataSet
    CommandText = 'NAKLP_SEBEST4_RECOUNT_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_NAKL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_SKLAD'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_PARTIYA_IN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'MODE'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 104
    Top = 92
  end
  object qeSklostdet: TQueryExtender
    Query = cdsSklostdet
    KeyField = 'id_nakld'
    Left = 32
    Top = 252
  end
end
