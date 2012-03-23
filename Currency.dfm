object frmCurrency: TfrmCurrency
  Left = 52
  Top = 160
  BorderStyle = bsDialog
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1074#1072#1083#1102#1090
  ClientHeight = 248
  ClientWidth = 428
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
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 428
    Height = 248
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      428
      248)
    object btnDelete: TButton
      Left = 364
      Top = 64
      Width = 58
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 0
      OnClick = btnDeleteClick
    end
    object btnEdit: TButton
      Left = 364
      Top = 32
      Width = 58
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      OnClick = btnEditClick
    end
    object btnInsert: TButton
      Left = 364
      Top = 0
      Width = 58
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 2
      OnClick = btnInsertClick
    end
    object btnOk: TBitBtn
      Left = 96
      Top = 223
      Width = 185
      Height = 25
      Anchors = [akLeft, akBottom]
      TabOrder = 3
      TabStop = False
      OnClick = btnOkClick
      Kind = bkOK
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 360
    Height = 217
    Align = alCustom
    AllowedOperations = [alopUpdateEh]
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoFitColWidths = True
    DataSource = dsTovar
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    VertScrollBar.VisibleMode = sbAlwaysShowEh
    OnDblClick = DBGridEh1DblClick
    OnKeyDown = DBGridEh1KeyDown
    Columns = <
      item
        EditButtons = <>
        FieldName = 'OID'
        Footers = <>
        Width = 25
      end
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'FULLNAME'
        Footers = <>
      end
      item
        Checkboxes = True
        EditButtons = <>
        FieldName = 'DELMARKED'
        Footers = <>
        KeyList.Strings = (
          '1'
          '0')
        MinWidth = 15
      end>
  end
  object sdsTovar: TSQLDataSet
    CommandText = 
      'select '#13#10'    t.oid,'#13#10'    t.name,'#13#10'    t.fullname,'#13#10'    t.delmark' +
      'ed'#13#10'  from '#13#10'    SPR_CURRENCY_VW t'#13#10'  order by'#13#10'    t.name'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 72
    Top = 56
    object sdsTovarOID: TIntegerField
      FieldName = 'OID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsTovarNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
    object sdsTovarFULLNAME: TStringField
      FieldName = 'FULLNAME'
      Size = 250
    end
    object sdsTovarDELMARKED: TSmallintField
      FieldName = 'DELMARKED'
      Required = True
    end
  end
  object dspTovar: TDataSetProvider
    DataSet = sdsTovar
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 72
    Top = 88
  end
  object cdsTovar: TClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ProviderName = 'dspTovar'
    AfterInsert = cdsTovarAfterInsert
    BeforePost = cdsTovarBeforePost
    OnReconcileError = cdsTovarReconcileError
    Left = 72
    Top = 120
    object cdsTovarOID: TIntegerField
      DisplayLabel = #8470
      FieldName = 'OID'
      Required = True
    end
    object cdsTovarNAME: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      DisplayWidth = 10
      FieldName = 'NAME'
      Size = 48
    end
    object cdsTovarFULLNAME: TStringField
      DisplayLabel = #1055#1086#1083#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1074#1072#1083#1102#1090#1099
      DisplayWidth = 30
      FieldName = 'FULLNAME'
      Size = 250
    end
    object cdsTovarDELMARKED: TSmallintField
      DisplayLabel = #1059#1076#1072#1083#1077#1085
      DisplayWidth = 4
      FieldName = 'DELMARKED'
      Required = True
    end
  end
  object dsTovar: TDataSource
    DataSet = cdsTovar
    Left = 72
    Top = 152
  end
  object ActionList1: TActionList
    Left = 104
    Top = 56
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ShortCut = 116
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
    Left = 72
    Top = 184
  end
  object qeTovar: TQueryExtender
    Query = cdsTovar
    Left = 104
    Top = 88
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmCurrency'
    StorageManager = rpsClientEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      'DBGridEh1.<P>.Columns.<ForAllItems>.Width')
    Left = 104
    Top = 120
  end
  object rpsClientEdit: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 136
    Top = 120
  end
end
