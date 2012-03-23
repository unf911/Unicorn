object frmNnaklRepXml: TfrmNnaklRepXml
  Left = 326
  Top = 400
  BorderStyle = bsDialog
  Caption = #1056#1077#1077#1089#1090#1088' '#1074#1099#1076#1072#1085#1085#1099#1093' '#1085#1072#1083#1086#1075#1086#1074#1099#1093' '#1085#1072#1082#1083#1072#1076#1085#1099#1093
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
  DesignSize = (
    567
    344)
  PixelsPerInch = 96
  TextHeight = 13
  object dbgRep: TDBGridEh
    Tag = 1
    Left = 12
    Top = 4
    Width = 549
    Height = 261
    AllowedOperations = []
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsNaklrt
    EditActions = [geaCopyEh, geaSelectAllEh]
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking]
    SortLocal = True
    SumList.Active = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object BitBtn5: TBitBtn
    Left = 10
    Top = 272
    Width = 129
    Height = 41
    Action = actSettings
    Anchors = [akLeft, akBottom]
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 110
    Top = 84
    Width = 113
    Height = 57
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
    TabOrder = 2
    Visible = False
  end
  object Button2: TButton
    Left = 150
    Top = 272
    Width = 129
    Height = 41
    Action = actGenerateXml
    Anchors = [akLeft, akBottom]
    TabOrder = 3
  end
  object dbgNNaklpNexoz: TDBGridEh
    Tag = 1
    Left = 12
    Top = 312
    Width = 230
    Height = 25
    AllowedOperations = []
    Anchors = [akLeft, akTop, akRight]
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking]
    SortLocal = True
    SumList.Active = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
    Columns = <
      item
        EditButtons = <>
        FieldName = 'F1_NPP'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'F4_IZG'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'F5_IPN'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'F6_NDS'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'F7_NDS'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'F8_NDS'
        Footer.ValueType = fvtSum
        Footers = <>
      end>
  end
  object BitBtn2: TBitBtn
    Left = 291
    Top = 272
    Width = 129
    Height = 41
    Action = actShowNNaklr
    Anchors = [akLeft, akBottom]
    Caption = #1042#1099#1076#1072#1085#1085#1099#1077
    TabOrder = 5
  end
  object BitBtn3: TBitBtn
    Left = 432
    Top = 272
    Width = 129
    Height = 41
    Action = actShowNNaklp
    Anchors = [akLeft, akBottom]
    Caption = #1055#1086#1083#1091#1095#1077#1085#1085#1099#1077
    TabOrder = 6
  end
  object dsNaklrt: TDataSource
    Tag = 1
    DataSet = cdsNaklrt
    Left = 40
    Top = 160
  end
  object ActionList1: TActionList
    Left = 72
    Top = 128
    object actSettings: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      OnExecute = actSettingsExecute
    end
    object actRefresh: TAction
      Caption = 'actRefresh'
      OnExecute = actRefreshExecute
    end
    object actRefreshNNaklp: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
    end
    object actGenerateXml: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100' Xml'
      OnExecute = actGenerateXmlExecute
    end
    object actShowNNaklr: TAction
      Caption = #1042#1099#1076#1072#1085#1085#1099#1077
      OnExecute = actShowNNaklrExecute
    end
    object actShowNNaklp: TAction
      Caption = #1055#1086#1083#1091#1095#1077#1085#1085#1099#1077
      OnExecute = actShowNNaklpExecute
    end
  end
  object frRasx: TfrxReport
    Version = '3.23.7'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38985.433947662000000000
    ReportOptions.LastChange = 39036.674937719910000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    Left = 72
    Top = 96
    Datasets = <
      item
        DataSet = frdRasx
        DataSetName = 'frdRasx'
      end>
    Variables = <>
    Style = <>
  end
  object frdRasx: TfrxDBDataset
    UserName = 'frdRasx'
    CloseDataSource = False
    DataSet = cdsNaklrt
    Left = 72
    Top = 64
  end
  object sdsNaklrt: TSQLDataSet
    CommandText = 'select '#13#10'  *'#13#10'from '#13#10'  naklrast ot'#13#10'where '#13#10'  ot.schet=:schet'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'SCHET'
        ParamType = ptInput
        Value = 133798
      end>
    SQLConnection = dmdEx.scUchet
    Left = 40
    Top = 64
  end
  object dspNaklrt: TDataSetProvider
    Tag = 1
    DataSet = sdsNaklrt
    Options = [poAllowCommandText]
    Left = 40
    Top = 96
  end
  object cdsNaklrt: TClientDataSet
    Tag = 1
    Active = True
    Aggregates = <>
    IndexFieldNames = 'SCHET'
    MasterFields = 'SCHET'
    MasterSource = dsNNakl
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'schet'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspNaklrt'
    Left = 40
    Top = 128
  end
  object qeRasx: TQueryExtender
    Query = cdsNaklrt
    Left = 8
    Top = 128
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
    end
  end
  object sdsNNakl: TSQLDataSet
    CommandText = 
      'SELECT'#13#10'  om.schet,'#13#10'  om.id2,'#13#10'  om.id_izg,'#13#10'  om.id_zak,'#13#10'  om' +
      '.id_manager,'#13#10'  om.dat,'#13#10'  om.nds,'#13#10'  om.nakl,'#13#10'  om.kurs,'#13#10'  om' +
      '.vsego,'#13#10'  om.vidopl,'#13#10'  om.usl,'#13#10'  om.nalog_nds,'#13#10'  om.tip,'#13#10'  ' +
      'om.blocked,'#13#10'  om.signature,'#13#10'  om.id_dogovor'#13#10'FROM'#13#10'  NAKLRAS o' +
      'm'#13#10'WHERE'#13#10'  om.schet=:id_schet'#13#10'ORDER BY '#13#10'  om.dat,om.id2'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'id_schet'
        ParamType = ptInput
        Value = '133798'
      end>
    SQLConnection = dmdEx.scUchet
    Left = 220
    Top = 68
  end
  object dspNNakl: TDataSetProvider
    Tag = 1
    DataSet = sdsNNakl
    Options = [poAllowCommandText]
    Left = 220
    Top = 100
  end
  object cdsNNakl: TClientDataSet
    Tag = 1
    Active = True
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'id_schet'
        ParamType = ptInput
        Value = '133798'
      end>
    ProviderName = 'dspNNakl'
    Left = 220
    Top = 132
  end
  object dsNNakl: TDataSource
    Tag = 1
    DataSet = cdsNNakl
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
    DataSet = cdsNNakl
    Left = 324
    Top = 64
  end
  object SaveDialog: TSaveDialog
    Left = 112
    Top = 64
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
    Left = 144
    Top = 24
  end
end
