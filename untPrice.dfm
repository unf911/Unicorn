object frmPrice: TfrmPrice
  Left = 14
  Top = 58
  VertScrollBar.Visible = False
  Anchors = []
  BorderStyle = bsDialog
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1089#1077#1073#1077#1089#1090#1086#1080#1084#1086#1089#1090#1080
  ClientHeight = 451
  ClientWidth = 477
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
    477
    451)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 69
    Height = 13
    Caption = #1053#1072#1095#1080#1085#1072#1077#1090#1089#1103' '#1089
  end
  object SpeedButton1: TSpeedButton
    Left = 432
    Top = 0
    Width = 23
    Height = 22
    Caption = 'Ok'
    OnClick = SpeedButton1Click
  end
  object edtFilter: TEdit
    Left = 72
    Top = 0
    Width = 193
    Height = 21
    TabStop = False
    TabOrder = 0
    OnChange = edtFilterChange
  end
  object DBGridEh1: TDBGridEh
    Left = 8
    Top = 24
    Width = 457
    Height = 241
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsPrice
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    VertScrollBar.VisibleMode = sbAlwaysShowEh
    Columns = <
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Width = 422
      end>
  end
  object DBGridEh2: TDBGridEh
    Left = 8
    Top = 272
    Width = 457
    Height = 169
    Anchors = [akLeft, akRight, akBottom]
    DataSource = dsSebest
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    VertScrollBar.VisibleMode = sbAlwaysShowEh
    OnKeyUp = DBGridEh2KeyUp
    Columns = <
      item
        EditButtons = <>
        FieldName = 'DAT'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'SEBEST'
        Footers = <>
      end>
  end
  object dsSebest: TDataSource
    DataSet = qurSebest
    Left = 400
    Top = 352
  end
  object dsPrice: TDataSource
    DataSet = qurPrice
    Left = 368
    Top = 352
  end
  object qePrice: TQueryExtender
    Query = qurPrice
    KeyField = 'tovar'
    Left = 368
    Top = 320
  end
  object ActionList1: TActionList
    Left = 368
    Top = 384
    object actApply: TAction
      Caption = 'actApply'
      OnExecute = actApplyExecute
    end
    object actPaste: TAction
      Caption = #1042#1089#1090#1072#1074#1080#1090#1100
      OnExecute = actPasteExecute
    end
  end
  object sdsPrice: TSQLDataSet
    CommandText = 
      'select '#13#10'  t.id, t.name '#13#10'from '#13#10'  TOVAR_ALL_VW t'#13#10'where'#13#10'  t.de' +
      'lmarked=0'#13#10'order '#13#10'  by name'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 288
    Top = 320
    object sdsPriceNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 50
    end
    object sdsPriceID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
  end
  object dspPrice: TDataSetProvider
    DataSet = sdsPrice
    UpdateMode = upWhereKeyOnly
    Left = 288
    Top = 352
  end
  object qurPrice: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPrice'
    ReadOnly = True
    BeforeScroll = qurPriceBeforeScroll
    Left = 288
    Top = 384
    object qurPriceNAME: TStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      FieldName = 'NAME'
      Origin = 'DBNINTER.TOVAR.NAME'
      Size = 50
    end
    object qurPriceID: TIntegerField
      FieldName = 'ID'
      Required = True
      Visible = False
    end
  end
  object sdsSebest: TSQLDataSet
    CommandText = 
      'select '#13#10'  dat,sebest,id_sklad,id_tovar'#13#10'from SEBEST'#13#10'where id_t' +
      'ovar = :id_tovar'#13#10'order by dat'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_tovar'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 320
    Top = 320
  end
  object dspSebest: TDataSetProvider
    DataSet = sdsSebest
    Left = 320
    Top = 352
  end
  object qurSebest: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_TOVAR'
    MasterFields = 'ID'
    MasterSource = dsPrice
    PacketRecords = 0
    Params = <
      item
        DataType = ftInteger
        Name = 'tovar'
        ParamType = ptInput
      end>
    ProviderName = 'dspSebest'
    AfterInsert = qurSebestAfterInsert
    BeforePost = qurSebestBeforePost
    AfterDelete = qurSebestAfterDelete
    BeforeScroll = qurSebestBeforeScroll
    OnReconcileError = qurSebestReconcileError
    Left = 320
    Top = 384
    object qurSebestDAT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 34
      FieldName = 'DAT'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = 'dd.mm.yy'
      EditMask = '!99/99/00;1;_'
    end
    object qurSebestSEBEST: TFMTBCDField
      DisplayLabel = #1057#1077#1073#1077#1089#1090#1086#1080#1084#1086#1089#1090#1100',$ '#1089' '#1053#1044#1057
      DisplayWidth = 22
      FieldName = 'SEBEST'
      OnSetText = qurSebestSEBESTSetText
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object qurSebestID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
      Required = True
      Visible = False
    end
    object qurSebestID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
      Visible = False
    end
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
    Left = 368
    Top = 288
  end
  object rpsClientEdit: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 256
    Top = 352
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmPrice'
    StorageManager = rpsClientEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      'DBGridEh1.<P>.Columns.<ForAllItems>.Width'
      'DBGridEh2.<P>.Columns.<ForAllItems>.Width')
    Left = 256
    Top = 384
  end
end
