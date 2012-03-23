object frmNakloWeight: TfrmNakloWeight
  Left = 320
  Top = 469
  BorderStyle = bsDialog
  Caption = #1054#1090#1095#1105#1090' '#1087#1086' '#1074#1077#1089#1091' '#1080' '#1089#1090#1086#1080#1084#1086#1089#1090#1080' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
  ClientHeight = 334
  ClientWidth = 621
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
    621
    334)
  PixelsPerInch = 96
  TextHeight = 13
  object dbgAfterCutOstatok: TDBGridEh
    Left = 0
    Top = 0
    Width = 617
    Height = 297
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsSklostdet
    Flat = False
    FooterColor = clInfoBk
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
    PopupMenu = PopupMenu1
    SortLocal = True
    SumList.Active = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    VertScrollBar.VisibleMode = sbAlwaysShowEh
    OnDblClick = dbgAfterCutOstatokDblClick
    OnKeyUp = dbgAfterCutOstatokKeyUp
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ID'
        Footer.Value = #1047#1072#1087#1080#1089#1077#1081
        Footer.ValueType = fvtStaticText
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'ID_POS'
        Footer.ValueType = fvtCount
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'TOVAR'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'KOLOTP'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        Color = clInfoBk
        EditButtons = <>
        FieldName = 'WEIGHT'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'SUM_WEIGHT'
        Footer.DisplayFormat = '0'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'CENA_GRN'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'SUM_GRN'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'SUM_GRN_NDS'
        Footer.ValueType = fvtSum
        Footers = <>
      end>
  end
  object btnOk: TBitBtn
    Left = 208
    Top = 303
    Width = 185
    Height = 25
    Anchors = [akLeft, akBottom]
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
  object BitBtn1: TBitBtn
    Left = 10
    Top = 302
    Width = 119
    Height = 25
    Action = actRefresh
    Anchors = [akLeft, akBottom]
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100
    TabOrder = 2
    Kind = bkRetry
  end
  object dspSklostdet: TDataSetProvider
    DataSet = sdsSklostdet
    Options = [poAllowCommandText]
    Left = 32
    Top = 88
  end
  object cdsSklostdet: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_nakl'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspSklostdet'
    Left = 32
    Top = 120
    object cdsSklostdetID: TStringField
      DisplayLabel = #8470#1085#1072#1082#1083
      DisplayWidth = 5
      FieldName = 'ID'
      Size = 10
    end
    object cdsSklostdetID_POS: TIntegerField
      DisplayLabel = #8470#1087#1086#1079
      DisplayWidth = 3
      FieldName = 'ID_POS'
    end
    object cdsSklostdetTOVAR: TStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'TOVAR'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_TOVAR'
      Size = 50
      Lookup = True
    end
    object cdsSklostdetID_NAKLD: TIntegerField
      FieldName = 'ID_NAKLD'
      Visible = False
    end
    object cdsSklostdetID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
      Visible = False
    end
    object cdsSklostdetKOLOTP: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'KOLOTP'
      DisplayFormat = '0.000'
    end
    object cdsSklostdetWEIGHT: TFloatField
      DisplayLabel = #1059#1076#1077#1083#1100#1085#1099#1081' '#1074#1077#1089
      FieldName = 'WEIGHT'
    end
    object cdsSklostdetSUM_WEIGHT: TFloatField
      DisplayLabel = #1042#1077#1089
      FieldName = 'SUM_WEIGHT'
    end
    object cdsSklostdetCENA_GRN: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'CENA_GRN'
      DisplayFormat = '0.00'
    end
    object cdsSklostdetSUM_GRN: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072', '#1075#1088#1085
      FieldName = 'SUM_GRN'
      DisplayFormat = '0.00'
    end
    object cdsSklostdetSUM_GRN_NDS: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072'+'#1053#1044#1057', '#1075#1088#1085
      FieldName = 'SUM_GRN_NDS'
      DisplayFormat = '0.00'
    end
    object cdsSklostdetNALOG_NDS: TFMTBCDField
      FieldName = 'NALOG_NDS'
      Visible = False
      Precision = 15
      Size = 2
    end
    object cdsSklostdetTARA: TIntegerField
      FieldName = 'TARA'
      Visible = False
    end
    object cdsSklostdetTIP: TIntegerField
      FieldName = 'TIP'
      Visible = False
    end
    object cdsSklostdetDAT: TSQLTimeStampField
      FieldName = 'DAT'
      Visible = False
    end
    object cdsSklostdetID_IZG: TIntegerField
      FieldName = 'ID_IZG'
      Visible = False
    end
    object cdsSklostdetID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
      Visible = False
    end
    object cdsSklostdetID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
      Visible = False
    end
    object cdsSklostdetID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      Visible = False
    end
  end
  object sdsSklostdet: TSQLDataSet
    CommandText = 'select *'#13#10'from rep_naklo_weigth_pc(:id_nakl)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_nakl'
        ParamType = ptInput
        Value = 0
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
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ShortCut = 116
      OnExecute = actRefreshExecute
    end
    object actTovarEdit: TAction
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1090#1086#1074#1072#1088#1086#1074
      ImageIndex = 5
      ShortCut = 120
      OnExecute = actTovarEditExecute
    end
  end
  object MainMenu1: TMainMenu
    Left = 32
    Top = 216
    object mnuAction: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      GroupIndex = 10
      object N1: TMenuItem
        Action = actRefresh
      end
      object N2: TMenuItem
        Action = actTovarEdit
      end
    end
  end
  object rpsClientEdit: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 64
    Top = 88
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmNakloWeight'
    StorageManager = rpsClientEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      '<P>.WindowState'
      'dbgAfterCutOstatok.<P>.Columns.<ForAllItems>.Width')
    Left = 64
    Top = 56
  end
  object UnfFilter1: TUnfFilter
    DBGridEh = dbgAfterCutOstatok
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
    Top = 120
  end
  object PopupMenu1: TPopupMenu
    Left = 64
    Top = 152
    object N3: TMenuItem
      Action = actTovarEdit
    end
  end
  object qeSklostdet: TQueryExtender
    Query = cdsSklostdet
    Left = 64
    Top = 184
  end
end
