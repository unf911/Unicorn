object frmSklostDet: TfrmSklostDet
  Left = 45
  Top = 614
  Width = 711
  Height = 380
  Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103' '#1087#1086#1079#1080#1094#1080#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dbgSklostdet: TDBGridEh
    Left = 0
    Top = 49
    Width = 703
    Height = 263
    Align = alClient
    DataSource = dsSklostdet
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghRowHighlight]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgSklostdetDblClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'DAT'
        Footers = <>
        Title.TitleButton = True
        Width = 36
      end
      item
        EditButtons = <>
        FieldName = 'ID'
        Footers = <>
        Width = 23
      end
      item
        EditButtons = <>
        FieldName = 'IZG'
        Footers = <>
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'ZAK'
        Footers = <>
        Title.TitleButton = True
        Width = 161
      end
      item
        EditButtons = <>
        FieldName = 'MANAGER'
        Footers = <>
        Title.TitleButton = True
        Width = 59
      end
      item
        EditButtons = <>
        FieldName = 'OM_TIP2'
        Footers = <>
        Width = 38
      end
      item
        EditButtons = <>
        FieldName = 'TARA'
        Footers = <>
        Title.TitleButton = True
        Width = 78
      end
      item
        EditButtons = <>
        FieldName = 'KOLOTP'
        Footers = <>
        Title.TitleButton = True
        Width = 51
      end
      item
        EditButtons = <>
        FieldName = 'KOLBUXT'
        Footers = <>
        Title.TitleButton = True
        Width = 34
      end
      item
        EditButtons = <>
        FieldName = 'TIP2'
        Footers = <>
        Title.TitleButton = True
        Width = 87
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 703
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 552
      Top = 5
      Width = 77
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1086#1089#1090#1072#1090#1082#1072
    end
    object Label2: TLabel
      Left = 144
      Top = 4
      Width = 31
      Height = 13
      Caption = #1058#1086#1074#1072#1088
    end
    object Label3: TLabel
      Left = 280
      Top = 4
      Width = 25
      Height = 13
      Caption = #1058#1072#1088#1072
    end
    object Label4: TLabel
      Left = 416
      Top = 4
      Width = 62
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1090#1072#1088#1099
    end
    object edtIdOstt: TEdit
      Left = 552
      Top = 17
      Width = 81
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object dbeTovar: TDBEditEh
      Left = 144
      Top = 16
      Width = 121
      Height = 21
      DataField = 'TOVAR'
      DataSource = dsSklostt
      EditButtons = <>
      TabOrder = 1
      Visible = True
    end
    object dbeTara: TDBEditEh
      Left = 280
      Top = 16
      Width = 121
      Height = 21
      DataField = 'TARA'
      DataSource = dsSklostt
      EditButtons = <>
      TabOrder = 2
      Visible = True
    end
    object dbeNomerTary: TDBEditEh
      Left = 416
      Top = 16
      Width = 121
      Height = 21
      DataField = 'NOMER_TARY'
      DataSource = dsSklostt
      EditButtons = <>
      TabOrder = 3
      Visible = True
    end
    object BitBtn1: TBitBtn
      Left = 2
      Top = 8
      Width = 97
      Height = 25
      Action = actDetail
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      TabOrder = 4
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
  object Panel2: TPanel
    Left = 0
    Top = 312
    Width = 703
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      703
      41)
    object btnOk: TBitBtn
      Left = 216
      Top = 12
      Width = 297
      Height = 25
      Anchors = [akBottom]
      Caption = 'OK'
      Default = True
      TabOrder = 0
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
        Name = 'id_ostt'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspSklostdet'
    Left = 32
    Top = 120
    object cdsSklostdetDAT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DAT'
      DisplayFormat = 'dd.mm.yy'
    end
    object cdsSklostdetKOLOTP: TFMTBCDField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'KOLOTP'
      DisplayFormat = '0.000'
      Precision = 15
    end
    object cdsSklostdetKOLBUXT: TIntegerField
      DisplayLabel = #1050#1086#1083'.'#1073#1091#1093#1090
      FieldName = 'KOLBUXT'
    end
    object cdsSklostdetTIP: TSmallintField
      FieldName = 'TIP'
    end
    object cdsSklostdettip2: TStringField
      DisplayLabel = #1058#1080#1087
      FieldKind = fkLookup
      FieldName = 'TIP2'
      LookupDataSet = dmdEx.cdsNaklodetTip
      LookupKeyFields = 'ID_FIELD'
      LookupResultField = 'FIELD_VALUE'
      KeyFields = 'TIP'
      Lookup = True
    end
    object cdsSklostdetID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
      Required = True
    end
    object cdsSklostdetID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
      Required = True
    end
    object cdsSklostdetID_TARA: TIntegerField
      FieldName = 'ID_TARA'
      Required = True
    end
    object cdsSklostdetIZG: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      DisplayWidth = 50
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
      DisplayLabel = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'ZAK'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_ZAK'
      Size = 50
      Lookup = True
    end
    object cdsSklostdetID_IZG: TIntegerField
      FieldName = 'ID_IZG'
      Required = True
    end
    object cdsSklostdetMANAGER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      FieldKind = fkLookup
      FieldName = 'MANAGER'
      LookupDataSet = dmdEx.cdsManager
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_MANAGER'
      Lookup = True
    end
    object cdsSklostdetTARA: TStringField
      DisplayLabel = #1058#1072#1088#1072
      FieldKind = fkLookup
      FieldName = 'TARA'
      LookupDataSet = dmdEx.cdsTara
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_TARA'
      Lookup = True
    end
    object cdsSklostdetOM_TIP: TSmallintField
      FieldName = 'OM_TIP'
      Required = True
    end
    object cdsSklostdetOM_TIP2: TStringField
      DisplayLabel = #1058#1080#1087' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      FieldKind = fkLookup
      FieldName = 'OM_TIP2'
      LookupDataSet = dmdEx.cdsNakloTip
      LookupKeyFields = 'ID_FIELD'
      LookupResultField = 'FIELD_VALUE'
      KeyFields = 'OM_TIP'
      Lookup = True
    end
    object cdsSklostdetID: TStringField
      DisplayLabel = #8470#1085#1072#1082#1083
      FieldName = 'ID'
    end
    object cdsSklostdetID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      Required = True
    end
  end
  object sdsSklostdet: TSQLDataSet
    CommandText = 
      'select'#13#10'  om.tip as om_tip,om.dat, om.id_izg, om.id_zak, om.id_m' +
      'anager,'#13#10'  od.id_tara, od.kolotp, od.kolbuxt,od.tip,om.id,om.id_' +
      'nakl'#13#10'from '#13#10'  naklodet od'#13#10'  inner join naklot ot on ot.id_nakl' +
      'd=od.id_nakld'#13#10'  inner join naklo om on om.id_nakl=ot.id_nakl'#13#10' ' +
      ' inner join sklostdet sd on sd.id_det=od.id_det'#13#10'where '#13#10'  sd.id' +
      '_ostt=:id_ostt'#13#10'group by '#13#10'  om.tip,om.dat, om.id_izg, om.id_zak' +
      ', om.id_manager,'#13#10'  od.id_tara, od.kolotp, od.kolbuxt,od.tip,od.' +
      'id_det,'#13#10'  om.id,om.id_nakl'#13#10'order by'#13#10'  om.dat, om.id_nakl, od.' +
      'tip'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_ostt'
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
    object actExit: TAction
      Caption = 'a'
      ShortCut = 27
      OnExecute = actExitExecute
    end
    object actDetail: TAction
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      ImageIndex = 5
      ShortCut = 120
      OnExecute = actDetailExecute
    end
  end
  object sdsSklostt: TSQLDataSet
    CommandText = 
      'select'#13#10'  st.id_tara,'#13#10'  st.nomer_tary,'#13#10'  sm.id_tovar,'#13#10'  sm.id' +
      '_sklad'#13#10'from '#13#10'  sklostt st inner join sklost sm on sm.id_ost=st' +
      '.id_ost  '#13#10'where '#13#10'  st.id_ostt=:id_ostt'#13#10
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
    Top = 56
    object sdsSklosttID_TARA: TIntegerField
      FieldName = 'ID_TARA'
      Required = True
    end
    object sdsSklosttNOMER_TARY: TStringField
      FieldName = 'NOMER_TARY'
      Size = 30
    end
    object sdsSklosttID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
      Required = True
    end
    object sdsSklosttID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
      Required = True
    end
  end
  object dsSklostt: TDataSource
    Tag = 2
    DataSet = cdsSklostt
    Left = 72
    Top = 152
  end
  object dspSklostt: TDataSetProvider
    DataSet = sdsSklostt
    Left = 72
    Top = 88
  end
  object cdsSklostt: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_ostt'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspSklostt'
    ReadOnly = True
    Left = 72
    Top = 120
    object cdsSklosttID_TARA: TIntegerField
      FieldName = 'ID_TARA'
      Required = True
    end
    object cdsSklosttNOMER_TARY: TStringField
      FieldName = 'NOMER_TARY'
      Size = 30
    end
    object cdsSklosttID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
      Required = True
    end
    object cdsSklosttID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
      Required = True
    end
    object cdsSklosttTOVAR: TStringField
      FieldKind = fkLookup
      FieldName = 'TOVAR'
      LookupDataSet = dmdEx.cdsTovar
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_TOVAR'
      Lookup = True
    end
    object cdsSklosttTARA: TStringField
      FieldKind = fkLookup
      FieldName = 'TARA'
      LookupDataSet = dmdEx.cdsTara
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_TARA'
      Lookup = True
    end
  end
  object RegPropStorageManEh1: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 136
    Top = 56
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'frmSklostDet'
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
end
