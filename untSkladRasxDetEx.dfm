object frmSkladRasxDetEx: TfrmSkladRasxDetEx
  Left = 101
  Top = 239
  BorderStyle = bsDialog
  Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
  ClientHeight = 311
  ClientWidth = 582
  Color = clBtnFace
  Constraints.MinHeight = 220
  Constraints.MinWidth = 490
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    582
    311)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 40
    Width = 582
    Height = 229
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsDet
    EditActions = [geaCopyEh, geaSelectAllEh]
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
    ReadOnly = True
    SumList.Active = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    VertScrollBar.VisibleMode = sbAlwaysShowEh
    OnDblClick = DBGridEh1DblClick
    OnKeyUp = DBGridEh1KeyUp
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ID'
        Footers = <>
        Width = 42
      end
      item
        EditButtons = <>
        FieldName = 'DAT'
        Footers = <>
        Width = 61
      end
      item
        EditButtons = <>
        FieldName = 'IZG'
        Footer.Value = #1055#1086#1079#1080#1094#1080#1081':'
        Footer.ValueType = fvtStaticText
        Footers = <>
        Width = 109
      end
      item
        EditButtons = <>
        FieldName = 'ZAK'
        Footer.Alignment = taRightJustify
        Footer.ValueType = fvtCount
        Footers = <>
        Width = 145
      end
      item
        EditButtons = <>
        FieldName = 'MANAGER'
        Footers = <>
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'TIP_NAME'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'SKLAD'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'KOLOTP'
        Footer.DisplayFormat = '0.000'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 83
      end
      item
        EditButtons = <>
        FieldName = 'CENA_GRN_NDS'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'SUM_GRN_NDS'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'COMMENT'
        Footers = <>
        Width = 137
      end
      item
        EditButtons = <>
        FieldName = 'WEIGHT_PER_KM'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'WEIGHT'
        Footer.ValueType = fvtSum
        Footers = <>
      end>
  end
  object btnOk: TBitBtn
    Left = 248
    Top = 279
    Width = 115
    Height = 25
    Anchors = [akLeft, akRight, akBottom]
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 582
    Height = 39
    Align = alTop
    TabOrder = 2
    object BitBtn5: TBitBtn
      Left = 4
      Top = 9
      Width = 97
      Height = 25
      Action = actRefresh
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 0
      Kind = bkRetry
    end
    object BitBtn6: TBitBtn
      Left = 112
      Top = 9
      Width = 97
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
  object dsDet: TDataSource
    DataSet = cdsDet
    Left = 192
    Top = 144
  end
  object sdsDet: TSQLDataSet
    CommandText = 
      'select'#13#10'  om.id_nakl as id,'#13#10'  om.dat,'#13#10'  om.tip,'#13#10'  om.id_nakl,' +
      #13#10'  k.name as izg,'#13#10'  k2.name as zak,'#13#10'  p.name as manager,'#13#10'  t' +
      '.name as tip_name,'#13#10'  s.name as sklad,'#13#10'  ot.kolotp,'#13#10'  om.comme' +
      'nt,'#13#10'  Round(ot.cena*(case when t2.tara=1 then 1 else om.kurs en' +
      'd),2)*(1+om.nalog_nds) as cena_grn_nds,'#13#10'  Round(Round(ot.cena*(' +
      'case when t2.tara=1 then 1 else om.kurs end),2)*ot.kolotp,2)*(1+' +
      'om.nalog_nds) as sum_grn_nds,'#13#10'  t2.weight as weight_per_km,'#13#10'  ' +
      '(ot.kolotp*t2.weight) as weight'#13#10'from'#13#10'  naklo om '#13#10'  join naklo' +
      't ot on om.id_nakl=ot.id_nakl'#13#10'  join objects k on k.oid=om.id_i' +
      'zg'#13#10'  join objects k2 on k2.oid=om.id_zak'#13#10'  join objects p on p' +
      '.oid=om.id_manager'#13#10'  join objects t on t.oid=om.tip'#13#10'  join obj' +
      'ects s on s.oid=om.id_sklad'#13#10'  join tovar t2 on ot.id_tovar=t2.o' +
      'id'#13#10'where'#13#10'  om.posted=1'#13#10'order by'#13#10'  om.dat'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 192
    Top = 48
  end
  object dspDet: TDataSetProvider
    DataSet = sdsDet
    Options = [poAllowCommandText]
    Left = 192
    Top = 80
  end
  object cdsDet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDet'
    Left = 192
    Top = 112
    object cdsDetID: TIntegerField
      DisplayLabel = #8470#1085#1072#1082#1083
      FieldName = 'ID'
    end
    object cdsDetDAT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DAT'
      DisplayFormat = 'dd.mm.yy'
    end
    object cdsDetIZG: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      FieldName = 'IZG'
      Size = 54
    end
    object cdsDetZAK: TStringField
      DisplayLabel = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100
      FieldName = 'ZAK'
      Size = 54
    end
    object cdsDetMANAGER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      FieldName = 'MANAGER'
      Size = 34
    end
    object cdsDetTIP_NAME: TStringField
      DisplayLabel = #1058#1080#1087
      DisplayWidth = 10
      FieldName = 'TIP_NAME'
      Size = 50
    end
    object cdsDetSKLAD: TStringField
      DisplayLabel = #1057#1082#1083#1072#1076
      DisplayWidth = 10
      FieldName = 'SKLAD'
      Size = 50
    end
    object cdsDetKOLOTP: TFMTBCDField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      FieldName = 'KOLOTP'
      DisplayFormat = '0.000'
      Precision = 15
    end
    object cdsDetTIP: TSmallintField
      FieldName = 'TIP'
      Required = True
    end
    object cdsDetID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      Required = True
    end
    object cdsDetCOMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'COMMENT'
      Size = 50
    end
    object cdsDetCENA_GRN_NDS: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1075#1088#1085'/'#1053#1044#1057
      FieldName = 'CENA_GRN_NDS'
      DisplayFormat = '0.00'
    end
    object cdsDetSUM_GRN_NDS: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1075#1088#1085'/'#1053#1044#1057
      FieldName = 'SUM_GRN_NDS'
      DisplayFormat = '0.00'
    end
    object cdsDetWEIGHT_PER_KM: TFloatField
      DisplayLabel = #1059#1076#1077#1083#1100#1085#1099#1081' '#1074#1077#1089', '#1082#1075'/'#1082#1084
      FieldName = 'WEIGHT_PER_KM'
    end
    object cdsDetWEIGHT: TFloatField
      DisplayLabel = #1042#1077#1089', '#1082#1075
      FieldName = 'WEIGHT'
      DisplayFormat = '0.'
    end
  end
  object ActionList1: TActionList
    Images = dmdEx.ImageList1
    Left = 192
    Top = 176
    object actExit: TAction
      Caption = 'actExit'
      ShortCut = 27
      OnExecute = actExitExecute
    end
    object actDetail: TAction
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      OnExecute = actDetailExecute
    end
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnExecute = actRefreshExecute
    end
  end
  object qeDet: TQueryExtender
    Query = cdsDet
    Left = 192
    Top = 208
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmSkladRasxDetEx'
    StorageManager = rpsSkladRasxDetEx
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      'DBGridEh1.<P>.Columns.<ForAllItems>.Width')
    Left = 224
    Top = 48
  end
  object rpsSkladRasxDetEx: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 256
    Top = 48
  end
  object UnfFilter1: TUnfFilter
    DBGridEh = DBGridEh1
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
    Left = 224
    Top = 80
  end
end
