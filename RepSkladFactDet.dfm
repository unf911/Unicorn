object frmRepSkladFactDet: TfrmRepSkladFactDet
  Left = 141
  Top = 143
  BorderStyle = bsDialog
  Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103' '#1089#1077#1073#1077#1089#1090#1086#1080#1084#1086#1089#1090#1080
  ClientHeight = 333
  ClientWidth = 689
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
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    689
    333)
  PixelsPerInch = 96
  TextHeight = 13
  object dbgSklostdet: TDBGridEh
    Left = 4
    Top = 40
    Width = 678
    Height = 254
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
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghRowHighlight]
    PopupMenu = PopupMenu1
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
    Columns = <
      item
        EditButtons = <>
        FieldName = 'DAT'
        Footer.Value = #1047#1072#1087#1080#1089#1077#1081
        Footer.ValueType = fvtStaticText
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'ID'
        Footer.ValueType = fvtCount
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'IZG'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'ZAK'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'MANAGER'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'TIPCONST'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'CENA'
        Footers = <>
        Width = 61
      end
      item
        EditButtons = <>
        FieldName = 'DEBET_KOLOTP'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'DEBET'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'KREDIT_KOLOTP'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'KREDIT'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'ID_NAKL'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'TIP'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'ATTR1'
        Footers = <>
        Visible = False
      end>
  end
  object btnOk: TBitBtn
    Left = 184
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 689
    Height = 39
    Align = alTop
    TabOrder = 2
    object BitBtn3: TBitBtn
      Left = 4
      Top = 9
      Width = 97
      Height = 25
      Action = actRefresh
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 0
      Kind = bkRetry
    end
    object BitBtn4: TBitBtn
      Left = 112
      Top = 9
      Width = 93
      Height = 25
      Action = actDetail
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      TabOrder = 1
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
        Name = 'id_schet'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftDate
        Name = 'dat_from'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftDate
        Name = 'dat_to'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'sub1_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'sub2_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'sub3_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'sub4_in'
        ParamType = ptInput
        Value = Null
      end>
    ProviderName = 'dspSklostdet'
    OnCalcFields = cdsSklostdetCalcFields
    Left = 32
    Top = 120
    object cdsSklostdetDAT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 10
      FieldName = 'DAT'
      DisplayFormat = 'dd.mm.yy'
    end
    object cdsSklostdetID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      Visible = False
    end
    object cdsSklostdetID: TStringField
      DisplayLabel = #8470#1085#1072#1082#1083
      DisplayWidth = 10
      FieldName = 'ID'
    end
    object cdsSklostdetIZG: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'IZG'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_IZG'
      Size = 50
      Lookup = True
    end
    object cdsSklostdetZAK: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'ZAK'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_ZAK'
      Size = 50
      Lookup = True
    end
    object cdsSklostdetMANAGER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'MANAGER'
      LookupDataSet = dmdEx.cdsManager
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_MANAGER'
      Size = 30
      Lookup = True
    end
    object cdsSklostdetNDS: TFMTBCDField
      FieldName = 'NDS'
      Required = True
      Precision = 15
    end
    object cdsSklostdetDEBET: TFloatField
      DisplayLabel = #1044#1077#1073#1077#1090
      FieldName = 'DEBET'
      DisplayFormat = '0.00000'
    end
    object cdsSklostdetKREDIT: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090
      FieldName = 'KREDIT'
      DisplayFormat = '0.00000'
    end
    object cdsSklostdetDEBET_KOLOTP: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1076#1077#1073#1077#1090
      FieldName = 'DEBET_KOLOTP'
      DisplayFormat = '0.000'
    end
    object cdsSklostdetKREDIT_KOLOTP: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1082#1088#1077#1076#1080#1090
      FieldName = 'KREDIT_KOLOTP'
      DisplayFormat = '0.000'
    end
    object cdsSklostdetID_IZG: TIntegerField
      FieldName = 'ID_IZG'
    end
    object cdsSklostdetID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
    end
    object cdsSklostdetID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
    end
    object cdsSklostdetTIP: TSmallintField
      FieldName = 'TIP'
      Required = True
      Visible = False
    end
    object cdsSklostdetCENA: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      FieldKind = fkInternalCalc
      FieldName = 'CENA'
      DisplayFormat = '0.00000'
    end
    object cdsSklostdetTIPCONST: TStringField
      DisplayLabel = #1058#1080#1087
      FieldName = 'TIPCONST'
      Size = 50
    end
    object cdsSklostdetATTR1: TIntegerField
      FieldName = 'ATTR1'
    end
    object cdsSklostdetSUB3: TIntegerField
      FieldName = 'SUB3'
    end
  end
  object sdsSklostdet: TSQLDataSet
    CommandText = 
      'select'#13#10'  r.dat,'#13#10'  r.id_nakl,'#13#10'  r.debet,'#13#10'  r.kredit,'#13#10'  r.deb' +
      'et_kolotp,'#13#10'  r.kredit_kolotp,'#13#10'  om.id_izg, '#13#10'  om.id_zak,'#13#10'  o' +
      'm.id_manager,  '#13#10'  om.nds,'#13#10'  om.id,'#13#10'  om.tip,'#13#10'  r.attr1,'#13#10'  r' +
      '.sub3,'#13#10'  (select fullname from objects o where o.oid=om.tip) as' +
      ' tipconst'#13#10'from rep_oborotka_det_pc(:id_schet,:dat_from,:dat_to,' +
      #13#10'  :sub1_in,:sub2_in,'#13#10'  :sub3_in,:sub4_in,'#13#10'  null,null,'#13#10'  nu' +
      'll,null,'#13#10'  null,null,'#13#10'  null,null,null) r inner join naklo om'#13 +
      #10'    on om.id_nakl=r.id_nakl'#13#10'order by'#13#10'  r.dat'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_schet'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dat_from'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dat_to'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sub1_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sub2_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sub3_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sub4_in'
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
    object actSebestBuxRecount: TAction
      Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1089#1077#1073#1077#1089#1090#1086#1080#1084#1086#1089#1090#1100
      OnExecute = actSebestBuxRecountExecute
    end
    object actDebug: TAction
      Caption = #1056#1077#1078#1080#1084' '#1086#1090#1083#1072#1076#1082#1080
      OnExecute = actDebugExecute
    end
    object actShowSebestSumColumns: TAction
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1089#1091#1084#1084#1099
      Checked = True
      OnExecute = actShowSebestSumColumnsExecute
    end
  end
  object RegPropStorageManEh1: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 136
    Top = 56
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'frmRepSkladFactDet'
    StorageManager = RegPropStorageManEh1
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
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
    Left = 104
    Top = 88
    object N1: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      GroupIndex = 10
      object N3: TMenuItem
        Action = actDetail
      end
      object mnuRefresh: TMenuItem
        Action = actRefresh
      end
      object N2: TMenuItem
        Action = actSebestBuxRecount
      end
      object N6: TMenuItem
        Action = actDebug
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 104
    Top = 120
    object N4: TMenuItem
      Action = actDetail
    end
    object N5: TMenuItem
      Action = actSebestBuxRecount
    end
  end
  object sdsSebestRecount: TSQLDataSet
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
    Left = 136
    Top = 88
  end
  object qeDet: TQueryExtender
    Query = cdsSklostdet
    KeyField = 'id_nakl'
    Left = 32
    Top = 252
  end
end
