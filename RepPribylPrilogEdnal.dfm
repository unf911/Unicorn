object frmRepPribylPrilogEdnal: TfrmRepPribylPrilogEdnal
  Left = 328
  Top = 402
  BorderStyle = bsDialog
  Caption = #1057#1086#1079#1076#1072#1085#1080#1077' XML '#1080#1079' '#1085#1072#1083#1086#1075#1086#1074#1086#1081
  ClientHeight = 344
  ClientWidth = 567
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
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 164
    Width = 567
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object dbgFizLico: TDBGridEh
    Left = 0
    Top = 0
    Width = 567
    Height = 164
    Align = alClient
    Constraints.MinHeight = 60
    DataSource = dsNNakl
    EditActions = [geaCopyEh, geaSelectAllEh]
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgMultiSelect]
    PopupMenu = PopupMenu1
    SumList.Active = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'NPP'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'OKPO'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'VSEGO'
        Footer.ValueType = fvtSum
        Footers = <>
      end>
  end
  object dbgYurLico: TDBGridEh
    Left = 0
    Top = 167
    Width = 567
    Height = 177
    Align = alBottom
    Constraints.MinHeight = 60
    DataSource = dsYurLico
    EditActions = [geaCopyEh, geaSelectAllEh]
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgMultiSelect]
    PopupMenu = PopupMenu1
    SumList.Active = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'NPP'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'OKPO'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'VSEGO'
        Footer.ValueType = fvtSum
        Footers = <>
      end>
  end
  object ActionList1: TActionList
    Left = 72
    Top = 128
    object actSettings: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      OnExecute = actSettingsExecute
    end
    object actGenerateXml: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100' Xml'
      OnExecute = actGenerateXmlExecute
    end
  end
  object frdRasx: TfrxDBDataset
    UserName = 'frdRasx'
    CloseDataSource = False
    Left = 72
    Top = 64
  end
  object MainMenu1: TMainMenu
    Left = 108
    Top = 128
    object MenuItem1: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      GroupIndex = 10
      object MenuItem3: TMenuItem
        Action = actSettings
      end
      object Xml1: TMenuItem
        Action = actGenerateXml
      end
    end
  end
  object sdsNNakl: TSQLDataSet
    CommandText = 
      'select k.name, k.okpo, r.vsego, k.fullname'#13#10'from rep_pribyl_pril' +
      'og_ednal_pc(:id_izg, :dat_from, :dat_to) r'#13#10'inner join klient_al' +
      'l_vw k on k.id=r.id_zak'#13#10'where k.plat_ed_naloga=1 and k.is_fizli' +
      'co=1'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_izg'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'dat_from'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'dat_to'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 220
    Top = 68
    object sdsNNaklNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
    object sdsNNaklOKPO: TStringField
      FieldName = 'OKPO'
      Size = 10
    end
    object sdsNNaklVSEGO: TFMTBCDField
      FieldName = 'VSEGO'
      Precision = 15
      Size = 8
    end
    object sdsNNaklFULLNAME: TStringField
      FieldName = 'FULLNAME'
      Size = 250
    end
  end
  object dspNNakl: TDataSetProvider
    Tag = 1
    DataSet = sdsNNakl
    Options = [poAllowCommandText]
    Left = 220
    Top = 100
  end
  object cdsFizLico: TClientDataSet
    Tag = 1
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NAME'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'OKPO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VSEGO'
        DataType = ftFMTBcd
        Precision = 15
        Size = 8
      end
      item
        Name = 'FULLNAME'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'NPP'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftString
        Name = 'id_izg'
        ParamType = ptInput
        Value = 1264
      end
      item
        DataType = ftString
        Name = 'dat_from'
        ParamType = ptInput
        Value = 36892d
      end
      item
        DataType = ftString
        Name = 'dat_to'
        ParamType = ptInput
        Value = 36892d
      end>
    ProviderName = 'dspNNakl'
    StoreDefs = True
    AfterOpen = cdsFizLicoAfterOpen
    OnCalcFields = cdsFizLicoCalcFields
    Left = 220
    Top = 132
    object cdsFizLicoNPP: TIntegerField
      DisplayLabel = #8470#1087'.'#1087
      FieldKind = fkInternalCalc
      FieldName = 'NPP'
    end
    object cdsFizLicoNAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'NAME'
      Size = 50
    end
    object cdsFizLicoOKPO: TStringField
      DisplayLabel = #1054#1050#1055#1054
      FieldName = 'OKPO'
      Size = 10
    end
    object cdsFizLicoVSEGO: TFMTBCDField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'VSEGO'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 8
    end
    object cdsFizLicoFULLNAME: TStringField
      FieldName = 'FULLNAME'
      Size = 250
    end
  end
  object dsNNakl: TDataSource
    Tag = 1
    DataSet = cdsFizLico
    Left = 220
    Top = 164
  end
  object XMLDocument1: TXMLDocument
    Left = 324
    Top = 132
    DOMVendorDesc = 'MSXML'
  end
  object frdNNaklp: TfrxDBDataset
    UserName = 'frdNNaklp'
    CloseDataSource = False
    DataSet = cdsFizLico
    Left = 324
    Top = 64
  end
  object SaveDialog: TSaveDialog
    Left = 112
    Top = 64
  end
  object UnfFilter1: TUnfFilter
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
    Left = 144
    Top = 24
  end
  object PopupMenu1: TPopupMenu
    Left = 176
    Top = 72
    object Xml2: TMenuItem
      Action = actGenerateXml
    end
  end
  object rpsClientEdit: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 360
    Top = 64
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmRepPribylPrilogEdnal'
    StorageManager = rpsClientEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      'dbgFizLico.<P>.Columns.<ForAllItems>.Width'
      'dbgFizLico.<P>.Height'
      'dbgYurLico.<P>.Columns.<ForAllItems>.Width'
      'dbgYurLico.<P>.Height'
      'Splitter1.<P>.Top')
    Left = 360
    Top = 160
  end
  object UnfFilter2: TUnfFilter
    DBGridEh = dbgFizLico
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
    Left = 112
    Top = 160
  end
  object sdsYurLico: TSQLDataSet
    CommandText = 
      'select k.name, k.okpo, r.vsego, k.fullname'#13#10'from rep_pribyl_pril' +
      'og_ednal_pc(:id_izg, :dat_from, :dat_to) r'#13#10'inner join klient_al' +
      'l_vw k on k.id=r.id_zak'#13#10'where k.plat_ed_naloga=1 and k.is_fizli' +
      'co=0'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_izg'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'dat_from'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'dat_to'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 260
    Top = 68
    object StringField1: TStringField
      FieldName = 'NAME'
      Size = 50
    end
    object StringField2: TStringField
      FieldName = 'OKPO'
      Size = 10
    end
    object FMTBCDField1: TFMTBCDField
      FieldName = 'VSEGO'
      Precision = 15
      Size = 8
    end
    object sdsYurLicoFULLNAME: TStringField
      FieldName = 'FULLNAME'
      Size = 250
    end
  end
  object dspYurLico: TDataSetProvider
    Tag = 1
    DataSet = sdsYurLico
    Options = [poAllowCommandText]
    Left = 260
    Top = 100
  end
  object cdsYurLico: TClientDataSet
    Tag = 1
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NAME'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'OKPO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VSEGO'
        DataType = ftFMTBcd
        Precision = 15
        Size = 8
      end
      item
        Name = 'FULLNAME'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'NPP'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftString
        Name = 'id_izg'
        ParamType = ptInput
        Value = 1264
      end
      item
        DataType = ftString
        Name = 'dat_from'
        ParamType = ptInput
        Value = 36892d
      end
      item
        DataType = ftString
        Name = 'dat_to'
        ParamType = ptInput
        Value = 36892d
      end>
    ProviderName = 'dspYurLico'
    StoreDefs = True
    AfterOpen = cdsYurLicoAfterOpen
    OnCalcFields = cdsYurLicoCalcFields
    Left = 260
    Top = 132
    object StringField3: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'NAME'
      Size = 50
    end
    object StringField4: TStringField
      DisplayLabel = #1054#1050#1055#1054
      FieldName = 'OKPO'
      Size = 10
    end
    object FMTBCDField2: TFMTBCDField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'VSEGO'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 8
    end
    object cdsYurLicoFULLNAME: TStringField
      FieldName = 'FULLNAME'
      Size = 250
    end
    object cdsYurLicoNPP: TIntegerField
      DisplayLabel = #8470#1087'.'#1087'.'
      FieldKind = fkInternalCalc
      FieldName = 'NPP'
    end
  end
  object dsYurLico: TDataSource
    Tag = 1
    DataSet = cdsYurLico
    Left = 260
    Top = 164
  end
end
