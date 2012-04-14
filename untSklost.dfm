object frmSklost: TfrmSklost
  Left = 129
  Top = 178
  BorderStyle = bsDialog
  Caption = #1054#1089#1090#1072#1090#1082#1080' '#1085#1072' '#1089#1082#1083#1072#1076#1077
  ClientHeight = 404
  ClientWidth = 688
  Color = clBtnFace
  Constraints.MinHeight = 24
  Constraints.MinWidth = 160
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
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 193
    Width = 688
    Height = 8
    Cursor = crVSplit
    Align = alBottom
    Beveled = True
    Constraints.MinHeight = 8
    MinSize = 193
    ResizeStyle = rsUpdate
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 193
    Align = alClient
    BevelOuter = bvNone
    Constraints.MinHeight = 193
    TabOrder = 0
    DesignSize = (
      688
      193)
    object dbgSklost: TDBGridEh
      Left = 8
      Top = 24
      Width = 583
      Height = 169
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsSklost
      EditActions = [geaCopyEh, geaSelectAllEh]
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
      PopupMenu = PopSklost
      ReadOnly = True
      SortLocal = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = dbgSklostDblClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'SKLAD'
          Footers = <>
          Title.TitleButton = True
          Width = 49
        end
        item
          EditButtons = <>
          FieldName = 'ANALOG'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'TOVAR'
          Footers = <>
          Title.TitleButton = True
          Width = 167
        end
        item
          DisplayFormat = '0.000'
          EditButtons = <>
          FieldName = 'KOLOTP'
          Footers = <>
          Title.TitleButton = True
          Width = 71
        end
        item
          EditButtons = <>
          FieldName = 'KOLREZERV'
          Footers = <>
          Title.TitleButton = True
          Width = 78
        end
        item
          EditButtons = <>
          FieldName = 'KOLTOTAL'
          Footers = <>
        end>
    end
    object lcbSklad: TDBLookupComboboxEh
      Left = 8
      Top = 2
      Width = 181
      Height = 21
      TabStop = False
      DropDownBox.AutoDrop = True
      DropDownBox.Rows = 15
      DropDownBox.Width = -1
      EditButtons = <>
      KeyField = 'OID'
      ListField = 'NAME'
      ListSource = dmdEx.dsSklads
      TabOrder = 2
      Visible = True
      OnChange = lcbSkladChange
    end
    object edtTovar: TEdit
      Left = 196
      Top = 2
      Width = 169
      Height = 21
      TabOrder = 3
      OnChange = edtTovarChange
    end
    object Panel2: TPanel
      Left = 596
      Top = 18
      Width = 89
      Height = 175
      Anchors = [akTop, akRight, akBottom]
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        89
        175)
      object RadioGroup1: TRadioGroup
        Left = 0
        Top = 0
        Width = 89
        Height = 73
        Anchors = [akLeft, akTop, akRight]
        Caption = #1056#1077#1078#1080#1084
        ItemIndex = 0
        Items.Strings = (
          #1057#1090#1072#1085#1076#1072#1088#1090
          #1055#1086#1083#1085#1099#1081
          #1053#1072' '#1076#1072#1090#1091)
        TabOrder = 0
        OnClick = RadioGroup1Click
      end
      object BitBtn1: TBitBtn
        Left = 0
        Top = 96
        Width = 89
        Height = 25
        Action = actRefresh
        Anchors = [akLeft, akTop, akRight]
        Caption = #1054#1073#1085#1086#1074#1080#1090#1100
        TabOrder = 1
        TabStop = False
        Kind = bkRetry
      end
      object BitBtn2: TBitBtn
        Left = 0
        Top = 120
        Width = 89
        Height = 25
        Action = actDetail
        Anchors = [akLeft, akTop, akRight]
        Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
        ModalResult = 5
        TabOrder = 2
        TabStop = False
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
      object btnSettings: TBitBtn
        Left = 0
        Top = 144
        Width = 89
        Height = 25
        Action = actSettings
        Anchors = [akLeft, akTop, akRight]
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
        TabOrder = 3
        TabStop = False
      end
      object dteToday: TDBDateTimeEditEh
        Left = 0
        Top = 72
        Width = 89
        Height = 21
        EditButtons = <>
        TabOrder = 4
        Visible = True
        EditFormat = 'DD/MM/YY'
      end
    end
  end
  object dbgSklostt: TDBGridEh
    Left = 0
    Top = 201
    Width = 688
    Height = 203
    Align = alBottom
    Constraints.MinHeight = 60
    DataSource = dsSklostt
    EditActions = [geaCopyEh, geaSelectAllEh]
    Flat = False
    FooterColor = clInfoBk
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    ReadOnly = True
    SortLocal = True
    SumList.Active = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgSklosttDblClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'TARA'
        Footer.FieldName = 'TARA'
        Footer.Value = #1055#1086#1079#1080#1094#1080#1081
        Footer.ValueType = fvtStaticText
        Footers = <>
        Title.TitleButton = True
        Width = 102
      end
      item
        EditButtons = <>
        FieldName = 'NOMER_TARY'
        Footer.FieldName = 'NOMER_TARY'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'KOLOTP'
        Footers = <>
        Title.TitleButton = True
        Width = 53
      end
      item
        EditButtons = <>
        FieldName = 'KOLBUXT'
        Footers = <>
        Title.TitleButton = True
        Width = 25
      end
      item
        EditButtons = <>
        FieldName = 'KOLREZERV'
        Footers = <>
        Title.TitleButton = True
        Width = 68
      end
      item
        EditButtons = <>
        FieldName = 'KOLBREZERV'
        Footers = <>
        Title.TitleButton = True
        Width = 19
      end
      item
        EditButtons = <>
        FieldName = 'COMMENT'
        Footers = <>
        Title.TitleButton = True
        Width = 99
      end
      item
        EditButtons = <>
        FieldName = 'ID_TYPE'
        Footers = <>
        Title.TitleButton = True
        Width = 3
      end
      item
        EditButtons = <>
        FieldName = 'IZG'
        Footers = <>
        Width = 85
      end
      item
        EditButtons = <>
        FieldName = 'TIP2'
        Footer.Value = #1044#1083#1080#1085#1072' '#1074#1089#1077#1075#1086
        Footer.ValueType = fvtStaticText
        Footers = <>
        Width = 82
      end
      item
        EditButtons = <>
        FieldName = 'KOLTOTAL'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'DAT_POST'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'KOLOTP_ISX'
        Footers = <>
      end>
  end
  object sdsSklost: TSQLDataSet
    CommandText = 
      'select'#13#10'  s.id_ost, '#13#10'  s.id_sklad,'#13#10'  t.name as tovar,'#13#10'(  sele' +
      'ct ta.name from tovar ta where ta.oid=t2.id_analog) as analog,'#13#10 +
      '  s.kolotp,'#13#10'  s.kolrezerv,'#13#10'  t2.tara,'#13#10'  t.oid as id_tovar,'#13#10' ' +
      ' t2.id_analog'#13#10'from '#13#10'  sklost s '#13#10'  inner join objects t '#13#10'    ' +
      'on t.oid=s.id_tovar'#13#10'  inner join get_object_children_pc(:oid,:t' +
      'ree_oid) c'#13#10'    on c.oid=s.id_sklad'#13#10'  inner join tovar t2'#13#10'    ' +
      'on s.id_tovar=t2.oid'#13#10'where'#13#10'  t2.nothing is null'#13#10'order by'#13#10'  3' +
      ',id_sklad'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'oid'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'tree_oid'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 8
    Top = 32
    object sdsSklostID_OST: TIntegerField
      FieldName = 'ID_OST'
    end
    object sdsSklostID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
    end
    object sdsSklostANALOG: TStringField
      FieldName = 'ANALOG'
      Size = 50
    end
    object sdsSklostTOVAR: TStringField
      FieldName = 'TOVAR'
      Size = 50
    end
    object sdsSklostKOLOTP: TFMTBCDField
      FieldName = 'KOLOTP'
      Precision = 15
      Size = 8
    end
    object sdsSklostKOLREZERV: TFMTBCDField
      FieldName = 'KOLREZERV'
      Precision = 15
      Size = 8
    end
    object sdsSklostTARA: TSmallintField
      FieldName = 'TARA'
      Required = True
    end
    object sdsSklostID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
      Required = True
    end
    object sdsSklostID_ANALOG: TIntegerField
      FieldName = 'ID_ANALOG'
    end
  end
  object sdsSklostt: TSQLDataSet
    CommandText = 
      'select'#13#10'  id_tara,'#13#10'  nomer_tary,'#13#10'  kolotp,'#13#10'  kolbuxt,'#13#10'  comm' +
      'ent,'#13#10'  id_ostt,'#13#10'  kolrezerv,'#13#10'  kolbrezerv,'#13#10'  id_type,'#13#10'  id_' +
      'izg'#13#10'from '#13#10'  sklostt_notime_short_pc(:id_tovar,:id_sklad)'#13#10'orde' +
      'r by'#13#10'  kolotp desc'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_tovar'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'id_sklad'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = dmdEx.scUchet
    Left = 40
    Top = 32
  end
  object dspSklost: TDataSetProvider
    DataSet = sdsSklost
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 8
    Top = 72
  end
  object dspSklostt: TDataSetProvider
    DataSet = sdsSklostt
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 40
    Top = 72
  end
  object cdsSklost: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_OST'
        DataType = ftInteger
      end
      item
        Name = 'ID_SKLAD'
        DataType = ftInteger
      end
      item
        Name = 'TOVAR'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'KOLOTP'
        DataType = ftFMTBcd
        Precision = 15
        Size = 8
      end
      item
        Name = 'KOLREZERV'
        DataType = ftFMTBcd
        Precision = 15
        Size = 8
      end
      item
        Name = 'CENA'
        DataType = ftFloat
      end
      item
        Name = 'TARA'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'ID_TOVAR'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ANALOG'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'oid'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'tree_oid'
        ParamType = ptInput
      end>
    ProviderName = 'dspSklost'
    ReadOnly = True
    StoreDefs = True
    AfterOpen = cdsSklostAfterScroll
    AfterScroll = cdsSklostAfterScroll
    OnCalcFields = cdsSklostCalcFields
    Left = 8
    Top = 104
    object cdsSklostKOLOTP: TFMTBCDField
      DisplayLabel = #1044#1083#1080#1085#1072' '#1089#1074#1086#1073
      FieldName = 'KOLOTP'
      ProviderFlags = []
      DisplayFormat = '0.000'
      Precision = 15
      Size = 8
    end
    object cdsSklostID_SKLAD: TIntegerField
      DisplayLabel = #8470#1089#1082#1083#1072#1076#1072
      FieldName = 'id_sklad'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsSklostID_OST: TIntegerField
      FieldName = 'ID_OST'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsSklostKOLREZERV: TFMTBCDField
      DisplayLabel = #1044#1083#1080#1085#1072' '#1086#1090#1083#1086#1078
      FieldName = 'KOLREZERV'
      ProviderFlags = []
      Required = True
      DisplayFormat = '0.000'
      Precision = 15
      Size = 8
    end
    object cdsSklostANALOG: TStringField
      DisplayLabel = #1040#1085#1072#1083#1086#1075
      DisplayWidth = 20
      FieldName = 'ANALOG'
      Size = 50
    end
    object cdsSklostTOVAR: TStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      FieldName = 'TOVAR'
      Size = 46
    end
    object cdsSklostKOLTOTAL: TFloatField
      DisplayLabel = #1044#1083#1080#1085#1072' '#1074#1089#1077#1075#1086
      FieldKind = fkCalculated
      FieldName = 'KOLTOTAL'
      DisplayFormat = '0.000'
      Calculated = True
    end
    object cdsSklostSKLAD: TStringField
      DisplayLabel = #1057#1082#1083#1072#1076
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'SKLAD'
      LookupDataSet = dmdEx.cdsSklads
      LookupKeyFields = 'OID'
      LookupResultField = 'NAME'
      KeyFields = 'id_sklad'
      Size = 50
      Lookup = True
    end
    object cdsSklostTARA: TSmallintField
      FieldName = 'TARA'
      Required = True
    end
    object cdsSklostID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
      Required = True
      Visible = False
    end
    object cdsSklostID_ANALOG: TIntegerField
      FieldName = 'ID_ANALOG'
      Visible = False
    end
  end
  object cdsSklostt: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_tovar'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'id_sklad'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspSklostt'
    ReadOnly = True
    OnCalcFields = cdsSklosttCalcFields
    Left = 40
    Top = 104
    object cdsSklosttNOMER_TARY: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1090#1072#1088#1099
      DisplayWidth = 14
      FieldName = 'NOMER_TARY'
      Size = 30
    end
    object cdsSklosttKOLOTP: TFMTBCDField
      DisplayLabel = #1044#1083#1080#1085#1072' '#1089#1074#1086#1073
      DisplayWidth = 9
      FieldName = 'KOLOTP'
      Required = True
      DisplayFormat = '0.000'
      Precision = 15
      Size = 8
    end
    object cdsSklosttKOLBUXT: TIntegerField
      DisplayLabel = #1041#1091#1093#1090' '#1089#1074#1086#1073
      DisplayWidth = 10
      FieldName = 'KOLBUXT'
      Required = True
    end
    object cdsSklosttCOMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      DisplayWidth = 13
      FieldName = 'COMMENT'
      Size = 50
    end
    object cdsSklosttID_OSTT: TIntegerField
      DisplayWidth = 10
      FieldName = 'ID_OSTT'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object cdsSklosttKOLREZERV: TFMTBCDField
      DisplayLabel = #1044#1083#1080#1085#1072' '#1086#1090#1083#1086#1078
      DisplayWidth = 16
      FieldName = 'KOLREZERV'
      Required = True
      DisplayFormat = '0.000'
      Precision = 15
      Size = 8
    end
    object cdsSklosttKOLBREZERV: TIntegerField
      DisplayLabel = #1041#1091#1093#1090' '#1086#1090#1083#1086#1078
      DisplayWidth = 10
      FieldName = 'KOLBREZERV'
      Required = True
    end
    object cdsSklosttID_TYPE: TIntegerField
      DisplayLabel = #1058#1080#1087
      FieldName = 'ID_TYPE'
      Required = True
    end
    object cdsSklosttTARA: TStringField
      DisplayLabel = #1058#1072#1088#1072
      FieldKind = fkLookup
      FieldName = 'TARA'
      LookupDataSet = dmdEx.cdsTara
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_TARA'
      Required = True
      Size = 44
      Lookup = True
    end
    object cdsSklosttID_TARA: TIntegerField
      FieldName = 'ID_TARA'
      Required = True
    end
    object cdsSklosttID_IZG: TIntegerField
      FieldName = 'ID_IZG'
      Required = True
    end
    object cdsSklosttIZG: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      FieldKind = fkLookup
      FieldName = 'IZG'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_IZG'
      Size = 50
      Lookup = True
    end
    object cdsSklosttTIP2: TStringField
      DisplayLabel = #1041#1072#1088#1072#1073#1072#1085
      FieldKind = fkLookup
      FieldName = 'TIP2'
      LookupDataSet = dmdEx.cdsSklottIdtype
      LookupKeyFields = 'ID_FIELD'
      LookupResultField = 'FIELD_VALUE'
      KeyFields = 'ID_TYPE'
      Lookup = True
    end
    object cdsSklosttKOLTOTAL: TFloatField
      DisplayLabel = #1044#1083#1080#1085#1072' '#1074#1089#1077#1075#1086
      FieldKind = fkInternalCalc
      FieldName = 'KOLTOTAL'
      DisplayFormat = '0.000'
    end
  end
  object dsSklost: TDataSource
    DataSet = cdsSklost
    Left = 8
    Top = 136
  end
  object dsSklostt: TDataSource
    DataSet = cdsSklostt
    Left = 40
    Top = 136
  end
  object dsSklostSrc: TDataSource
    Tag = 1
    Left = 272
    Top = 128
  end
  object MainMenu1: TMainMenu
    Left = 72
    Top = 96
    object N1: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      GroupIndex = 10
      object mnuRefresh: TMenuItem
        Action = actRefresh
      end
      object N2: TMenuItem
        Action = actRecalcPosit
      end
      object actDetail1: TMenuItem
        Action = actDetail
      end
      object N4: TMenuItem
        Action = actPrint
      end
      object N6: TMenuItem
        Action = actPrintDet
      end
      object N7: TMenuItem
        Action = actDesignDet
      end
      object N9: TMenuItem
        Action = actShowSpecOst
      end
    end
  end
  object ActionList1: TActionList
    Images = dmdEx.ImageList1
    Left = 72
    Top = 64
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ShortCut = 116
      OnExecute = actRefreshExecute
    end
    object actRecalcPosit: TAction
      Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1087#1086#1079#1080#1094#1080#1102
      OnExecute = actRecalcPositExecute
    end
    object actDetail: TAction
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      ShortCut = 120
      OnExecute = actDetailExecute
    end
    object actSettings: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      Visible = False
      OnExecute = actSettingsExecute
    end
    object actCopy: TAction
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
    end
    object actPrint: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      ImageIndex = 1
      OnExecute = actPrintExecute
    end
    object actPriceCalc: TAction
      Caption = #1055#1086#1076#1089#1095#1105#1090' '#1094#1077#1085#1099
      OnExecute = actPriceCalcExecute
    end
    object actPrintDet: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1076#1077#1090#1072#1083#1100#1085#1086#1075#1086' '#1086#1090#1095#1105#1090#1072
      ImageIndex = 1
      OnExecute = actPrintDetExecute
    end
    object actDesignDet: TAction
      Caption = #1044#1080#1079#1072#1081#1085#1077#1088' '#1076#1077#1090#1072#1083#1100#1085#1086#1075#1086' '#1086#1090#1095#1105#1090#1072
      Visible = False
      OnExecute = actDesignDetExecute
    end
    object actShowSpecOst: TAction
      Caption = #1054#1090#1095#1105#1090' '#1087#1086' '#1086#1089#1090#1072#1090#1082#1072#1084' '#1085#1072' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1103#1093
      OnExecute = actShowSpecOstExecute
    end
  end
  object qeSklostt: TQueryExtender
    Query = cdsSklostt
    KeyField = 'id_ostt'
    Left = 40
    Top = 168
  end
  object sdsSklostdetRecalcPc: TSQLDataSet
    CommandText = 'SKLOSTDET_RECALC_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_ostt'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = dmdEx.scUchet
    Left = 72
    Top = 32
  end
  object sdsSklostt2: TSQLDataSet
    CommandText = 
      'select'#13#10'  id_tara,'#13#10'  nomer_tary,'#13#10'  kolotp,'#13#10'  kolbuxt,'#13#10'  comm' +
      'ent,'#13#10'  id_ostt,'#13#10'  kolrezerv,'#13#10'  kolbrezerv,'#13#10'  id_type,'#13#10'  id_' +
      'izg,'#13#10'  dat_post,'#13#10'  KOLOTP_ISX'#13#10'from '#13#10'  sklostt_time_pc(:id_to' +
      'var,:id_sklad,:today)'#13#10'order by'#13#10'  kolotp desc'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_tovar'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_sklad'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'today'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 104
    Top = 32
  end
  object dspSklostt2: TDataSetProvider
    DataSet = sdsSklostt2
    UpdateMode = upWhereKeyOnly
    Left = 104
    Top = 72
  end
  object cdsSklostt2: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <
      item
        DataType = ftInteger
        Name = 'id_tovar'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_sklad'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'today'
        ParamType = ptInput
      end>
    ProviderName = 'dspSklostt2'
    ReadOnly = True
    OnCalcFields = cdsSklostt2CalcFields
    Left = 104
    Top = 104
    object StringField1: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1090#1072#1088#1099
      DisplayWidth = 14
      FieldName = 'NOMER_TARY'
      Size = 30
    end
    object FMTBCDField1: TFMTBCDField
      DisplayLabel = #1044#1083#1080#1085#1072' '#1089#1074#1086#1073
      DisplayWidth = 9
      FieldName = 'KOLOTP'
      Required = True
      DisplayFormat = '0.000'
      Precision = 15
      Size = 8
    end
    object IntegerField1: TIntegerField
      DisplayLabel = #1041#1091#1093#1090' '#1089#1074#1086#1073
      DisplayWidth = 10
      FieldName = 'KOLBUXT'
      Required = True
    end
    object StringField2: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      DisplayWidth = 13
      FieldName = 'COMMENT'
      Size = 50
    end
    object IntegerField2: TIntegerField
      DisplayWidth = 10
      FieldName = 'ID_OSTT'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object FMTBCDField2: TFMTBCDField
      DisplayLabel = #1044#1083#1080#1085#1072' '#1086#1090#1083#1086#1078
      DisplayWidth = 16
      FieldName = 'KOLREZERV'
      Required = True
      DisplayFormat = '0.000'
      Precision = 15
      Size = 8
    end
    object IntegerField3: TIntegerField
      DisplayLabel = #1041#1091#1093#1090' '#1086#1090#1083#1086#1078
      DisplayWidth = 10
      FieldName = 'KOLBREZERV'
      Required = True
    end
    object IntegerField4: TIntegerField
      DisplayLabel = #1058#1080#1087
      FieldName = 'ID_TYPE'
      Required = True
    end
    object StringField3: TStringField
      DisplayLabel = #1058#1072#1088#1072
      FieldKind = fkLookup
      FieldName = 'TARA'
      LookupDataSet = dmdEx.cdsTara
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_TARA'
      Required = True
      Size = 44
      Lookup = True
    end
    object IntegerField5: TIntegerField
      FieldName = 'ID_TARA'
      Required = True
    end
    object IntegerField6: TIntegerField
      FieldName = 'ID_IZG'
      Required = True
    end
    object StringField4: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      FieldKind = fkLookup
      FieldName = 'IZG'
      LookupDataSet = dmdEx.cdsPost
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_IZG'
      Size = 50
      Lookup = True
    end
    object StringField5: TStringField
      DisplayLabel = #1041#1072#1088#1072#1073#1072#1085
      FieldKind = fkLookup
      FieldName = 'TIP2'
      LookupDataSet = dmdEx.cdsSklottIdtype
      LookupKeyFields = 'ID_FIELD'
      LookupResultField = 'FIELD_VALUE'
      KeyFields = 'ID_TYPE'
      Lookup = True
    end
    object FloatField1: TFloatField
      DisplayLabel = #1044#1083#1080#1085#1072' '#1074#1089#1077#1075#1086
      FieldKind = fkInternalCalc
      FieldName = 'KOLTOTAL'
      DisplayFormat = '0.000'
    end
    object cdsSklostt2KOLTARA: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'KOLTARA'
    end
    object cdsSklostt2DAT_POST: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086#1089#1090#1072#1074#1082#1080
      DisplayWidth = 10
      FieldName = 'DAT_POST'
      DisplayFormat = 'dd.mm.yy'
    end
    object cdsSklostt2KOLOTP_ISX: TFMTBCDField
      DisplayLabel = #1048#1089#1093#1086#1076#1085#1099#1081' '#1084#1077#1090#1088#1072#1078
      DisplayWidth = 10
      FieldName = 'KOLOTP_ISX'
      DisplayFormat = '0.000'
      Precision = 15
    end
    object cdsSklostt2KOLTOTAL2: TAggregateField
      FieldName = 'KOLTOTAL2'
      Active = True
      Expression = 'sum(koltotal)'
    end
    object cdsSklostt2KOLTARA2: TAggregateField
      FieldName = 'KOLTARA2'
      Active = True
      Expression = 'sum(koltara)'
    end
  end
  object dsSklostt2: TDataSource
    DataSet = cdsSklostt2
    Left = 104
    Top = 136
  end
  object qeSklost: TQueryExtender
    Query = cdsSklost
    KeyField = 'id_ost'
    Left = 8
    Top = 168
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmSklost'
    StorageManager = rpsClientEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      'dbgSklostt.<P>.Columns.<ForAllItems>.Width'
      'dbgSklostt.<P>.Height'
      'Panel1.dbgSklost.<P>.Columns.<ForAllItems>.Width')
    Left = 144
    Top = 32
  end
  object rpsClientEdit: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 176
    Top = 32
  end
  object PopSklost: TPopupMenu
    Images = dmdEx.ImageList1
    Left = 72
    Top = 128
    object N3: TMenuItem
      Action = actPrint
    end
    object N5: TMenuItem
      Action = actPriceCalc
      Default = True
      ShortCut = 13
    end
    object N8: TMenuItem
      Action = actShowSpecOst
    end
  end
  object ufSklost: TUnfFilter
    DBGridEh = dbgSklost
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
    Left = 8
    Top = 200
  end
  object frSklost: TfrxReport
    Version = '3.23.7'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38985.433534432900000000
    ReportOptions.LastChange = 39535.441208680550000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frSklostGetValue
    Left = 176
    Top = 72
    Datasets = <
      item
        DataSet = frdSklost
        DataSetName = 'frdSklost'
      end
      item
        DataSet = frdSklostt
        DataSetName = 'frdSklostt'
      end
      item
        DataSet = frUserDataset1
        DataSetName = 'frUserDataset1'
      end>
    Variables = <
      item
        Name = ' All vars'
        Value = Null
      end
      item
        Name = 'Title'
        Value = Null
      end
      item
        Name = 'KOLTOTAL'
        Value = '0'
      end
      item
        Name = 'TOVAR'
        Value = '0'
      end
      item
        Name = '  '
        Value = Null
      end>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Columns = 2
      ColumnWidth = 95.000000000000000000
      ColumnPositions.Strings = (
        '0'
        '95')
      Bin = 65535
      BinOtherPages = 65535
      object ReportTitle1: TfrxReportTitle
        Height = 64.000000000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo18: TfrxMemoView
          Left = -1.000000000000000000
          Width = 677.000000000000000000
          Height = 63.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[Title]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 10.000000000000000000
        Top = 349.606525000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 225.000000000000000000
          Width = 416.000000000000000000
          Height = 10.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Title]                 [PAGE#]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 40.000000000000000000
        Top = 286.866327000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          Left = 253.000000000000000000
          Top = 2.000000000000000000
          Width = 95.000000000000000000
          Height = 18.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frdSklostt."KOLTOTAL">, MasterData1)]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Top = 2.000000000000000000
          Width = 253.000000000000000000
          Height = 18.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            #1056#1115#1056#177#1057#8240#1056#176#1057#1039' '#1056#1169#1056#187#1056#1105#1056#1029#1056#176' : ')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 253.000000000000000000
          Top = 20.000000000000000000
          Width = 95.000000000000000000
          Height = 18.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[COUNT(MasterData1)]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Top = 20.000000000000000000
          Width = 253.000000000000000000
          Height = 18.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109' '#1056#1111#1056#1109#1056#183#1056#1105#1057#8224#1056#1105#1056#8470' : ')
          ParentFont = False
        end
      end
      object DetailData1: TfrxDetailData
        Height = 17.779530000000000000
        Top = 208.252103000000000000
        Width = 718.110700000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        DataSet = frdSklostt
        DataSetName = 'frdSklostt'
        RowCount = 0
        object Memo8: TfrxMemoView
          Width = 83.338589999999970000
          Height = 17.779530000000000000
          DataSet = frdSklostt
          DataSetName = 'frdSklostt'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frdSklostt."TARA"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 83.338590000000000000
          Width = 68.000000000000000000
          Height = 17.779530000000000000
          DataSet = frdSklostt
          DataSetName = 'frdSklostt'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frdSklostt."NOMER_TARY"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 151.338590000000000000
          Width = 48.000000000000000000
          Height = 17.779530000000000000
          DataSet = frdSklostt
          DataSetName = 'frdSklostt'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frdSklostt."KOLTOTAL"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 199.338590000000000000
          Width = 94.661410000000000000
          Height = 17.779530000000000000
          DataField = 'COMMENT'
          DataSet = frdSklostt
          DataSetName = 'frdSklostt'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frdSklostt."COMMENT"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 294.000000000000000000
          Width = 55.000000000000000000
          Height = 17.779530000000000000
          DataField = 'IZG'
          DataSet = frdSklostt
          DataSetName = 'frdSklostt'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frdSklostt."IZG"]')
          ParentFont = False
          WordBreak = True
        end
      end
      object MasterData1: TfrxMasterData
        Top = 143.622140000000000000
        Width = 718.110700000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        DataSet = frUserDataset1
        DataSetName = 'frUserDataset1'
        RowCount = 0
      end
      object DetailHeader1: TfrxHeader
        Height = 18.779530000000000000
        Top = 166.677273000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Width = 349.000000000000000000
          Height = 18.779530000000000000
          Color = clSilver
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frdSklost."TOVAR"]')
          ParentFont = False
        end
      end
    end
  end
  object frUserDataset1: TfrxUserDataSet
    UserName = 'frUserDataset1'
    OnCheckEOF = frUserDataset1CheckEOF
    OnFirst = frUserDataset1First
    OnNext = frUserDataset1Next
    OnPrior = frUserDataset1Prior
    Left = 176
    Top = 104
  end
  object ufSklostt: TUnfFilter
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
    Left = 40
    Top = 200
  end
  object sdsSklostt3: TSQLDataSet
    CommandText = 
      'select'#13#10'  id_tara,'#13#10'  nomer_tary,'#13#10'  kolotp,'#13#10'  kolbuxt,'#13#10'  comm' +
      'ent,'#13#10'  id_ostt,'#13#10'  kolrezerv,'#13#10'  kolbrezerv,'#13#10'  id_type,'#13#10'  id_' +
      'izg'#13#10'from '#13#10'  sklostt_notime_full_pc(:id_tovar,:id_sklad)'#13#10'order' +
      ' by'#13#10'  kolotp desc'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_tovar'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'id_sklad'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = dmdEx.scUchet
    Left = 216
    Top = 32
  end
  object dspSklostt3: TDataSetProvider
    DataSet = sdsSklostt3
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 216
    Top = 72
  end
  object cdsSklostt3: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_tovar'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'id_sklad'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspSklostt3'
    ReadOnly = True
    OnCalcFields = cdsSklostt3CalcFields
    Left = 216
    Top = 104
    object StringField6: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1090#1072#1088#1099
      DisplayWidth = 14
      FieldName = 'NOMER_TARY'
      Size = 30
    end
    object FMTBCDField3: TFMTBCDField
      DisplayLabel = #1044#1083#1080#1085#1072' '#1089#1074#1086#1073
      DisplayWidth = 9
      FieldName = 'KOLOTP'
      Required = True
      DisplayFormat = '0.000'
      Precision = 15
      Size = 8
    end
    object IntegerField7: TIntegerField
      DisplayLabel = #1041#1091#1093#1090' '#1089#1074#1086#1073
      DisplayWidth = 10
      FieldName = 'KOLBUXT'
      Required = True
    end
    object StringField7: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      DisplayWidth = 13
      FieldName = 'COMMENT'
      Size = 50
    end
    object IntegerField8: TIntegerField
      DisplayWidth = 10
      FieldName = 'ID_OSTT'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object FMTBCDField4: TFMTBCDField
      DisplayLabel = #1044#1083#1080#1085#1072' '#1086#1090#1083#1086#1078
      DisplayWidth = 16
      FieldName = 'KOLREZERV'
      Required = True
      DisplayFormat = '0.000'
      Precision = 15
      Size = 8
    end
    object IntegerField9: TIntegerField
      DisplayLabel = #1041#1091#1093#1090' '#1086#1090#1083#1086#1078
      DisplayWidth = 10
      FieldName = 'KOLBREZERV'
      Required = True
    end
    object IntegerField10: TIntegerField
      DisplayLabel = #1058#1080#1087
      FieldName = 'ID_TYPE'
      Required = True
    end
    object StringField8: TStringField
      DisplayLabel = #1058#1072#1088#1072
      FieldKind = fkLookup
      FieldName = 'TARA'
      LookupDataSet = dmdEx.cdsTara
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_TARA'
      Required = True
      Size = 44
      Lookup = True
    end
    object IntegerField11: TIntegerField
      FieldName = 'ID_TARA'
      Required = True
    end
    object IntegerField12: TIntegerField
      FieldName = 'ID_IZG'
      Required = True
    end
    object StringField9: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      FieldKind = fkLookup
      FieldName = 'IZG'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_IZG'
      Size = 50
      Lookup = True
    end
    object StringField10: TStringField
      DisplayLabel = #1041#1072#1088#1072#1073#1072#1085
      FieldKind = fkLookup
      FieldName = 'TIP2'
      LookupDataSet = dmdEx.cdsSklottIdtype
      LookupKeyFields = 'ID_FIELD'
      LookupResultField = 'FIELD_VALUE'
      KeyFields = 'ID_TYPE'
      Lookup = True
    end
    object FloatField2: TFloatField
      DisplayLabel = #1044#1083#1080#1085#1072' '#1074#1089#1077#1075#1086
      FieldKind = fkInternalCalc
      FieldName = 'KOLTOTAL'
      DisplayFormat = '0.000'
    end
  end
  object dsSklostt3: TDataSource
    DataSet = cdsSklostt3
    Left = 216
    Top = 136
  end
  object frSklostDet: TfrxReport
    Version = '3.23.7'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38985.433534432900000000
    ReportOptions.LastChange = 39017.772872581000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frSklostGetValue
    Left = 144
    Top = 72
    Datasets = <
      item
        DataSet = frdSklost
        DataSetName = 'frdSklost'
      end
      item
        DataSet = frdSklostt
        DataSetName = 'frdSklostt'
      end
      item
        DataSet = frUserDataset1
        DataSetName = 'frUserDataset1'
      end>
    Variables = <
      item
        Name = ' All vars'
        Value = Null
      end
      item
        Name = 'Title'
        Value = Null
      end
      item
        Name = 'KOLTOTAL'
        Value = '0'
      end
      item
        Name = 'TOVAR'
        Value = '0'
      end
      item
        Name = '  '
        Value = Null
      end>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Columns = 2
      ColumnWidth = 95.000000000000000000
      ColumnPositions.Strings = (
        '0'
        '95')
      Bin = 65535
      BinOtherPages = 65535
      object ReportTitle1: TfrxReportTitle
        Height = 64.000000000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo18: TfrxMemoView
          Left = -1.000000000000000000
          Width = 677.000000000000000000
          Height = 63.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[Title]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 10.000000000000000000
        Top = 342.047465000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 225.000000000000000000
          Width = 416.000000000000000000
          Height = 10.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Title]                 [PAGE#]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 40.000000000000000000
        Top = 279.307267000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          Left = 253.000000000000000000
          Top = 2.000000000000000000
          Width = 95.000000000000000000
          Height = 18.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frdSklostt."KOLTOTAL">, MasterData1)]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Top = 2.000000000000000000
          Width = 253.000000000000000000
          Height = 18.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            #1056#1115#1056#177#1057#8240#1056#176#1057#1039' '#1056#1169#1056#187#1056#1105#1056#1029#1056#176' : ')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 253.000000000000000000
          Top = 20.000000000000000000
          Width = 95.000000000000000000
          Height = 18.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[COUNT(MasterData1)]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Top = 20.000000000000000000
          Width = 253.000000000000000000
          Height = 18.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109' '#1056#1111#1056#1109#1056#183#1056#1105#1057#8224#1056#1105#1056#8470' : ')
          ParentFont = False
        end
      end
      object DetailData1: TfrxDetailData
        Height = 14.000000000000000000
        Top = 204.472573000000000000
        Width = 718.110700000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        DataSet = frdSklostt
        DataSetName = 'frdSklostt'
        RowCount = 0
        object Memo8: TfrxMemoView
          Width = 72.000000000000000000
          Height = 14.000000000000000000
          DataSet = frdSklostt
          DataSetName = 'frdSklostt'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frdSklostt."TARA"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 72.000000000000000000
          Width = 68.000000000000000000
          Height = 14.000000000000000000
          DataSet = frdSklostt
          DataSetName = 'frdSklostt'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frdSklostt."NOMER_TARY"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 140.000000000000000000
          Width = 48.000000000000000000
          Height = 14.000000000000000000
          DataSet = frdSklostt
          DataSetName = 'frdSklostt'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frdSklostt."KOLTOTAL"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 188.000000000000000000
          Width = 106.000000000000000000
          Height = 14.000000000000000000
          DataField = 'COMMENT'
          DataSet = frdSklostt
          DataSetName = 'frdSklostt'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frdSklostt."COMMENT"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 294.000000000000000000
          Width = 55.000000000000000000
          Height = 14.000000000000000000
          DataSet = frdSklostt
          DataSetName = 'frdSklostt'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frdSklostt."IZG"]')
          ParentFont = False
          WordBreak = True
        end
      end
      object MasterData1: TfrxMasterData
        Top = 143.622140000000000000
        Width = 718.110700000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        DataSet = frUserDataset1
        DataSetName = 'frUserDataset1'
        RowCount = 0
      end
      object DetailHeader1: TfrxHeader
        Height = 15.000000000000000000
        Top = 166.677273000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Width = 349.000000000000000000
          Height = 15.000000000000000000
          Color = clSilver
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frdSklost."TOVAR"]')
          ParentFont = False
        end
      end
    end
  end
  object frdSklostt: TfrxDBDataset
    UserName = 'frdSklostt'
    CloseDataSource = False
    Left = 144
    Top = 104
  end
  object frdSklost: TfrxDBDataset
    UserName = 'frdSklost'
    CloseDataSource = False
    DataSource = dsSklost
    Left = 144
    Top = 140
  end
end
