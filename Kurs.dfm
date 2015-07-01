object frmKurs: TfrmKurs
  Left = 236
  Top = 145
  VertScrollBar.Visible = False
  BorderStyle = bsDialog
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1082#1091#1088#1089#1086#1074
  ClientHeight = 346
  ClientWidth = 323
  Color = clBtnFace
  ParentFont = True
  FormStyle = fsMDIChild
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    323
    346)
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 296
    Top = 32
    Width = 23
    Height = 22
    Anchors = [akTop, akRight]
    Caption = 'Ok'
    OnClick = SpeedButton1Click
  end
  object Label1: TLabel
    Left = 3
    Top = 10
    Width = 14
    Height = 13
    Caption = #1048#1079
  end
  object Label2: TLabel
    Left = 163
    Top = 10
    Width = 14
    Height = 31
    AutoSize = False
    Caption = #1042
  end
  object edtDate: TDateTimePicker
    Left = 88
    Top = 32
    Width = 113
    Height = 21
    Date = 37410.000000000000000000
    Format = 'dd.MM.yy'
    Time = 37410.000000000000000000
    TabOrder = 0
    OnChange = edtDateChange
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 32
    Width = 65
    Height = 17
    Caption = #1044#1072#1090#1072' '#1089
    TabOrder = 1
    OnClick = CheckBox1Click
  end
  object edtKurs: TEdit
    Left = 224
    Top = 32
    Width = 65
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    OnKeyUp = edtKursKeyUp
  end
  object DBGridEh1: TDBGridEh
    Left = 8
    Top = 64
    Width = 313
    Height = 273
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsKurs
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    VertScrollBar.VisibleMode = sbAlwaysShowEh
    OnKeyUp = DBGridEh1KeyUp
    Columns = <
      item
        EditButtons = <>
        FieldName = 'DAT'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'USD'
        Footers = <>
      end>
  end
  object dblCurrencyFrom: TDBLookupComboboxEh
    Left = 24
    Top = 8
    Width = 137
    Height = 21
    EditButtons = <>
    KeyField = 'OID'
    ListField = 'FULLNAME'
    ListSource = dsCurrency
    TabOrder = 4
    Visible = True
    OnChange = dblCurrencyFromChange
  end
  object dblCurrencyTo: TDBLookupComboboxEh
    Left = 184
    Top = 8
    Width = 137
    Height = 21
    EditButtons = <>
    KeyField = 'OID'
    ListField = 'FULLNAME'
    ListSource = dsCurrency
    TabOrder = 5
    Visible = True
    OnChange = dblCurrencyToChange
  end
  object dsKurs: TDataSource
    DataSet = qurKurs
    Left = 224
    Top = 240
  end
  object sdsKurs: TSQLDataSet
    CommandText = 'select *'#13#10'from KURS k'#13#10'order by k.dat'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 224
    Top = 112
    object sdsKursDAT: TSQLTimeStampField
      FieldName = 'DAT'
      Required = True
    end
    object sdsKursUSD: TFloatField
      FieldName = 'USD'
    end
    object sdsKursID_CURRENCY: TIntegerField
      FieldName = 'ID_CURRENCY'
      Required = True
    end
    object sdsKursID_CURRENCY_FROM: TIntegerField
      FieldName = 'ID_CURRENCY_FROM'
    end
    object sdsKursKURS_FROM: TFloatField
      FieldName = 'KURS_FROM'
      Required = True
    end
  end
  object dspKurs: TDataSetProvider
    DataSet = sdsKurs
    Options = [poAllowCommandText]
    Left = 224
    Top = 144
  end
  object qurKurs: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspKurs'
    AfterInsert = qurKursAfterInsert
    AfterDelete = qurKursAfterDelete
    BeforeScroll = qurKursBeforeScroll
    OnReconcileError = qurKursReconcileError
    Left = 224
    Top = 176
    object qurKursDAT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 24
      FieldName = 'DAT'
      Required = True
      DisplayFormat = 'dd.mm.yy'
      EditMask = '!99/99/00;1;_'
    end
    object qurKursUSD: TFloatField
      DisplayLabel = #1050#1091#1088#1089
      DisplayWidth = 12
      FieldName = 'USD'
      DisplayFormat = '0.0000##'
    end
    object qurKursID_CURRENCY: TIntegerField
      DefaultExpression = '3035'
      FieldName = 'ID_CURRENCY'
      Required = True
      Visible = False
    end
    object qurKursID_CURRENCY_FROM: TIntegerField
      FieldName = 'ID_CURRENCY_FROM'
    end
    object qurKursKURS_FROM: TFloatField
      FieldName = 'KURS_FROM'
      Required = True
    end
  end
  object qeKurs: TQueryExtender
    Query = qurKurs
    Left = 224
    Top = 208
  end
  object rpsClientEdit: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 160
    Top = 112
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmKurs'
    StorageManager = rpsClientEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      'DBGridEh1.<P>.Columns.<ForAllItems>.Width')
    Left = 160
    Top = 144
  end
  object ActionList1: TActionList
    Images = dmdEx.ImageList1
    Left = 192
    Top = 144
    object actSettings: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      ImageIndex = 8
      OnExecute = actSettingsExecute
    end
    object actRefresh: TAction
      Caption = 'actRefresh'
      OnExecute = actRefreshExecute
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
    Left = 192
    Top = 176
  end
  object MainMenu1: TMainMenu
    Left = 160
    Top = 176
    object N1: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      GroupIndex = 10
      object N2: TMenuItem
        Action = actSettings
      end
    end
  end
  object sdsCurrency: TSQLDataSet
    CommandText = 
      'select s.oid,s.name,s.fullname'#13#10'from SPR_CURRENCY_VW s'#13#10'where s.' +
      'delmarked=0'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 256
    Top = 112
  end
  object dspCurrency: TDataSetProvider
    DataSet = sdsCurrency
    Options = [poAllowCommandText]
    Left = 256
    Top = 144
  end
  object cdsCurrency: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCurrency'
    AfterInsert = qurKursAfterInsert
    AfterDelete = qurKursAfterDelete
    BeforeScroll = qurKursBeforeScroll
    OnReconcileError = qurKursReconcileError
    Left = 256
    Top = 176
    object cdsCurrencyOID: TIntegerField
      FieldName = 'OID'
      Required = True
    end
    object cdsCurrencyNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
    object cdsCurrencyFULLNAME: TStringField
      FieldName = 'FULLNAME'
      Size = 250
    end
  end
  object dsCurrency: TDataSource
    DataSet = cdsCurrency
    Left = 256
    Top = 240
  end
end
