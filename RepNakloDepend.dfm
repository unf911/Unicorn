object frmRepNakloDepend: TfrmRepNakloDepend
  Left = 651
  Top = 490
  Width = 629
  Height = 380
  Caption = #1054#1090#1095#1105#1090' '#1087#1086' '#1079#1072#1074#1080#1089#1080#1084#1086#1089#1090#1103#1084' '#1086#1090' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
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
  PixelsPerInch = 96
  TextHeight = 13
  object dbgRep: TDBGridEh
    Left = 0
    Top = 39
    Width = 621
    Height = 295
    Align = alClient
    DataSource = dsSklostdet
    EditActions = [geaCopyEh, geaSelectAllEh]
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgRepDblClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ID'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'DAT'
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
        Checkboxes = True
        EditButtons = <>
        FieldName = 'POSTED'
        Footers = <>
        KeyList.Strings = (
          '1'
          '0')
      end
      item
        EditButtons = <>
        FieldName = 'NDS'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'TIP_NAME'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'TOVAR'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'TARA'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'NOMER_TARY'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'KOLOTP'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'KOLBUXT'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'COMMENT'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'ID_TOVAR'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'ID_NAKL'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'ID_NAKLD'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'ID_TARA'
        Footers = <>
        Visible = False
      end>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 621
    Height = 39
    Align = alTop
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 4
      Top = 9
      Width = 97
      Height = 25
      Action = actRefresh
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 0
      Kind = bkRetry
    end
    object BitBtn3: TBitBtn
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
  object cdsRep: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_nakl'
        ParamType = ptInput
      end>
    ProviderName = 'dspSklostdet'
    Left = 32
    Top = 120
    object cdsRepID: TStringField
      DisplayLabel = #8470
      DisplayWidth = 5
      FieldName = 'ID'
    end
    object cdsRepDAT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 10
      FieldName = 'DAT'
      DisplayFormat = 'dd.mm.yy'
    end
    object cdsRepIZG: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      DisplayWidth = 10
      FieldName = 'IZG'
      Size = 50
    end
    object cdsRepZAK: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      DisplayWidth = 10
      FieldName = 'ZAK'
      Size = 50
    end
    object cdsRepMANAGER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      DisplayWidth = 10
      FieldName = 'MANAGER'
      Size = 50
    end
    object cdsRepPOSTED: TIntegerField
      DisplayLabel = #1055#1088#1086#1074#1077#1076#1077#1085#1086
      FieldName = 'POSTED'
    end
    object cdsRepNDS: TFMTBCDField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 10
      FieldName = 'NDS'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object cdsRepTIP_NAME: TStringField
      DisplayLabel = #1058#1080#1087
      DisplayWidth = 5
      FieldName = 'TIP_NAME'
      Size = 50
    end
    object cdsRepTOVAR: TStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      DisplayWidth = 20
      FieldName = 'TOVAR'
      Size = 50
    end
    object cdsRepTARA: TStringField
      DisplayLabel = #1058#1072#1088#1072
      DisplayWidth = 10
      FieldName = 'TARA'
      Size = 50
    end
    object cdsRepNOMER_TARY: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1090#1072#1088#1099
      DisplayWidth = 10
      FieldName = 'NOMER_TARY'
      Size = 50
    end
    object cdsRepKOLOTP: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'KOLOTP'
      DisplayFormat = '0.000'
    end
    object cdsRepKOLBUXT: TIntegerField
      DisplayLabel = #1050#1086#1083' '#1073#1091#1093#1090
      DisplayWidth = 2
      FieldName = 'KOLBUXT'
    end
    object cdsRepCOMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      DisplayWidth = 20
      FieldName = 'COMMENT'
      Size = 50
    end
    object cdsRepID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
      Visible = False
    end
    object cdsRepID_POS: TIntegerField
      DisplayLabel = #8470#1087'.'#1087'.'
      FieldName = 'ID_POS'
      Visible = False
    end
    object cdsRepID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      Visible = False
    end
    object cdsRepID_IZG: TIntegerField
      FieldName = 'ID_IZG'
      Visible = False
    end
    object cdsRepID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
      Visible = False
    end
    object cdsRepID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
      Visible = False
    end
    object cdsRepTIP: TIntegerField
      FieldName = 'TIP'
      Visible = False
    end
    object cdsRepID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
      Visible = False
    end
    object cdsRepID_SKLAD_TO: TIntegerField
      FieldName = 'ID_SKLAD_TO'
      Visible = False
    end
    object cdsRepID_DET: TIntegerField
      FieldName = 'ID_DET'
      Visible = False
    end
    object cdsRepID_NAKLD: TIntegerField
      FieldName = 'ID_NAKLD'
      Visible = False
    end
    object cdsRepID_TARA: TIntegerField
      FieldName = 'ID_TARA'
      Visible = False
    end
  end
  object sdsSklostdet: TSQLDataSet
    CommandText = 
      'select '#13#10'  (select name from objects o where o.oid=r.id_izg) as ' +
      'izg,'#13#10'  (select name from objects o where o.oid=r.id_zak) as zak' +
      ','#13#10'  (select name from objects o where o.oid=r.id_manager) as ma' +
      'nager,'#13#10'  (select name from objects o where o.oid=r.tip) as tip_' +
      'name,'#13#10'  (select name from objects o where o.oid=r.id_tovar) as ' +
      'tovar,'#13#10'  (select name from objects o where o.oid=r.id_tara) as ' +
      'tara,'#13#10'  r.*'#13#10'from rep_naklo_depend_pc(:id_nakl) r'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_nakl'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 32
    Top = 56
  end
  object dsSklostdet: TDataSource
    DataSet = cdsRep
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
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ShortCut = 116
      OnExecute = actRefreshExecute
    end
    object actDebug: TAction
      Caption = #1056#1077#1078#1080#1084' '#1086#1090#1083#1072#1076#1082#1080
      OnExecute = actDebugExecute
    end
  end
  object MainMenu1: TMainMenu
    Images = dmdEx.ImageList1
    Left = 32
    Top = 216
    object mnuAction: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      GroupIndex = 10
      object N1: TMenuItem
        Action = actDetail
      end
      object N2: TMenuItem
        Action = actDebug
      end
    end
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'frmRepNakloDepend'
    StorageManager = rpsClientEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      'dbgRep.<P>.Columns.<ForAllItems>.Width')
    Left = 64
    Top = 56
  end
  object rpsClientEdit: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 96
    Top = 56
  end
  object UnfFilter1: TUnfFilter
    DBGridEh = dbgRep
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
    Left = 64
    Top = 88
  end
  object PopupMenu1: TPopupMenu
    Images = dmdEx.ImageList1
    Left = 64
    Top = 120
    object N3: TMenuItem
      Action = actDetail
    end
  end
end
