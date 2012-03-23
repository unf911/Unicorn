object frmNaklodet: TfrmNaklodet
  Left = 477
  Top = 383
  Width = 640
  Height = 458
  Caption = #1042#1099#1073#1086#1088' '#1086#1090#1075#1088#1091#1079#1086#1082' '#1089#1086' '#1089#1082#1083#1072#1076#1072
  Color = clBtnFace
  Constraints.MinHeight = 458
  Constraints.MinWidth = 640
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    632
    410)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 0
    Width = 31
    Height = 13
    Caption = #1058#1086#1074#1072#1088
  end
  object Label3: TLabel
    Left = 8
    Top = 40
    Width = 59
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
  end
  object dbgSklostt: TDBGridEh
    Left = 8
    Top = 88
    Width = 619
    Height = 105
    AllowedSelections = [gstRecordBookmarks]
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoFitColWidths = True
    DataSource = dsSklostdet
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    ParentShowHint = False
    PopupMenu = popSklostt
    ReadOnly = True
    ShowHint = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyPress = dlcTovarKeyPress
    Columns = <
      item
        EditButtons = <>
        FieldName = 'TARA'
        Footers = <>
        Width = 86
      end
      item
        EditButtons = <>
        FieldName = 'NOMER_TARY'
        Footers = <>
        Width = 62
      end
      item
        EditButtons = <>
        FieldName = 'KOLOTP'
        Footers = <>
        Width = 48
      end
      item
        EditButtons = <>
        FieldName = 'KOLREZERV'
        Footers = <>
        Width = 49
      end
      item
        EditButtons = <>
        FieldName = 'KOLBUXT'
        Footers = <>
        Width = 35
      end
      item
        EditButtons = <>
        FieldName = 'KOLBREZERV'
        Footers = <>
        Width = 33
      end
      item
        EditButtons = <>
        FieldName = 'COMMENT'
        Footers = <>
        Width = 61
      end
      item
        EditButtons = <>
        FieldName = 'IZG'
        Footers = <>
        Width = 108
      end
      item
        EditButtons = <>
        FieldName = 'TIP2'
        Footers = <>
        Width = 111
      end>
  end
  object btnWhole: TBitBtn
    Left = 160
    Top = 200
    Width = 81
    Height = 25
    Action = actWhole
    Anchors = [akLeft, akBottom]
    Caption = #1062#1077#1083#1080#1082#1086#1084
    TabOrder = 2
  end
  object btnCutPart: TBitBtn
    Left = 272
    Top = 200
    Width = 81
    Height = 25
    Action = actCutPart
    Anchors = [akLeft, akBottom]
    Caption = #1054#1090#1088#1077#1079#1072#1090#1100
    TabOrder = 3
  end
  object dlcTovar: TDBLookupComboboxEh
    Left = 8
    Top = 16
    Width = 369
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DropDownBox.AutoDrop = True
    DropDownBox.Rows = 25
    EditButtons = <>
    KeyField = 'ID'
    ListField = 'NAME'
    ListSource = dmdEx.dsTovar
    TabOrder = 0
    Visible = True
    OnChange = dlcTovarChange
    OnCloseUp = dlcTovarCloseUp
    OnKeyPress = dlcTovarKeyPress
  end
  object dbgNaklodet: TDBGridEh
    Left = 8
    Top = 232
    Width = 619
    Height = 145
    TabStop = False
    Anchors = [akLeft, akRight, akBottom]
    AutoFitColWidths = True
    DataSource = dsNaklodet
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    PopupMenu = PopupNaklodet
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgNaklodetDblClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'TARA'
        Footers = <>
        ReadOnly = True
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'NOMER_TARY'
        Footers = <>
        ReadOnly = True
        Width = 51
      end
      item
        EditButtons = <>
        FieldName = 'KOLOTP'
        Footers = <>
        ReadOnly = True
        Width = 58
      end
      item
        EditButtons = <>
        FieldName = 'KOLBUXT'
        Footers = <>
        ReadOnly = True
        Width = 49
      end
      item
        EditButtons = <>
        FieldName = 'COMMENT'
        Footers = <>
        Width = 77
      end>
  end
  object btnOk: TBitBtn
    Left = 208
    Top = 384
    Width = 257
    Height = 25
    Anchors = [akLeft, akRight, akBottom]
    Caption = 'OK'
    TabOrder = 7
    TabStop = False
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
  object dbnKolotp: TDBNumberEditEh
    Left = 8
    Top = 56
    Width = 161
    Height = 21
    TabStop = False
    DataField = 'KOLOTp'
    DataSource = dsNaklotEdit
    Enabled = False
    EditButton.Style = ebsUpDownEh
    EditButton.Visible = True
    EditButtons = <>
    TabOrder = 8
    Visible = True
  end
  object btnReturn: TBitBtn
    Left = 528
    Top = 200
    Width = 97
    Height = 25
    Action = actReturn
    Anchors = [akLeft, akBottom]
    Caption = #1042#1077#1088#1085#1091#1090#1100' '#1085#1072' '#1089#1082#1083#1072#1076
    TabOrder = 6
    TabStop = False
  end
  object btnNamotka: TBitBtn
    Left = 384
    Top = 200
    Width = 81
    Height = 25
    Action = actNamotka
    Anchors = [akLeft, akBottom]
    Caption = #1053#1072#1084#1086#1090#1072#1090#1100
    TabOrder = 4
  end
  object rgCena: TRadioGroup
    Left = 384
    Top = 6
    Width = 241
    Height = 75
    Anchors = [akTop, akRight]
    ItemIndex = 0
    Items.Strings = (
      #1057#1082#1080#1076#1082#1072
      #1062#1077#1085#1072' '#1073#1077#1079' '#1053#1044#1057
      #1062#1077#1085#1072' '#1089' '#1053#1044#1057)
    TabOrder = 9
    OnClick = rgCenaClick
  end
  object dbnCena: TDBNumberEditEh
    Left = 499
    Top = 37
    Width = 121
    Height = 21
    TabStop = False
    Anchors = [akTop, akRight]
    currency = False
    DataField = 'CENA'
    DataSource = dsNaklotEdit
    DisplayFormat = '0.00'
    Enabled = False
    EditButton.Style = ebsEllipsisEh
    EditButton.Visible = True
    EditButtons = <
      item
        Style = ebsPlusEh
        OnClick = dbnCenaEditButtons0Click
      end>
    Increment = 0.010000000000000000
    MaxValue = 9E999
    TabOrder = 10
    Visible = True
    OnExit = dbnCenaExit
    OnKeyUp = dbnCenaKeyUp
  end
  object dbnCenaNds: TDBNumberEditEh
    Left = 499
    Top = 58
    Width = 121
    Height = 21
    TabStop = False
    Anchors = [akTop, akRight]
    currency = False
    DisplayFormat = '0.00'
    Enabled = False
    EditButton.Style = ebsEllipsisEh
    EditButton.Visible = True
    EditButtons = <
      item
        Style = ebsPlusEh
        OnClick = dbnCenaNdsEditButtons0Click
      end>
    Increment = 0.010000000000000000
    MaxValue = 9E999
    TabOrder = 11
    Visible = True
    OnExit = dbnCenaNdsExit
    OnKeyUp = dbnCenaNdsKeyUp
  end
  object dbnSkidka: TDBNumberEditEh
    Left = 499
    Top = 16
    Width = 121
    Height = 21
    TabStop = False
    Anchors = [akTop, akRight]
    currency = False
    DataField = 'SKIDKA'
    DataSource = dsNaklotEdit
    DecimalPlaces = 1
    DisplayFormat = '0.0'
    EditButton.Style = ebsEllipsisEh
    EditButton.Visible = True
    EditButtons = <
      item
        Style = ebsPlusEh
        OnClick = dbnSkidkaEditButtons0Click
      end>
    Increment = 0.100000000000000000
    MaxValue = 100.000000000000000000
    TabOrder = 12
    Visible = True
    OnExit = dbnSkidkaExit
    OnKeyUp = dbnSkidkaKeyUp
  end
  object BitBtn2: TBitBtn
    Left = 8
    Top = 200
    Width = 89
    Height = 25
    Action = actDetail
    Anchors = [akLeft, akBottom]
    Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
    TabOrder = 13
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
  object PopupNaklodet: TPopupMenu
    Images = dmdEx.ImageList1
    OnPopup = PopupNaklodetPopup
    Left = 64
    Top = 264
    object mnuChangeBuxt: TMenuItem
      Action = actChangeBuxt
    end
    object N7: TMenuItem
      Action = actReturn
    end
    object N6: TMenuItem
      Action = actDetail
    end
  end
  object sdsSklostdet: TSQLDataSet
    CommandText = 
      'select'#13#10'  st.comment,'#13#10'  st.id_ostt,'#13#10'  st.id_tara,'#13#10'  st.kolbre' +
      'zerv,'#13#10'  st.kolbuxt,'#13#10'  st.kolotp,'#13#10'  st.kolrezerv,'#13#10'  st.nomer_' +
      'tary,'#13#10'  st.id_type,'#13#10'  st.id_izg '#13#10'from'#13#10'  SKLOSTT st'#13#10'where'#13#10' ' +
      ' st.id_ost=('#13#10'      select sm.id_ost '#13#10'      from sklost sm '#13#10'  ' +
      '    where sm.id_tovar=:id_tovar and'#13#10'         sm.id_sklad=:id_sk' +
      'lad'#13#10'  ) and'#13#10'  st.id_type<>3 and st.id_type<>1'#13#10'order by'#13#10'  st.' +
      'kolotp desc'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_tovar'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_sklad'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 32
    Top = 104
    object sdsSklostdetCOMMENT: TStringField
      FieldName = 'COMMENT'
      Size = 50
    end
    object sdsSklostdetID_OSTT: TIntegerField
      FieldName = 'ID_OSTT'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsSklostdetID_TARA: TIntegerField
      FieldName = 'ID_TARA'
      Required = True
    end
    object sdsSklostdetKOLBREZERV: TIntegerField
      FieldName = 'KOLBREZERV'
      Required = True
    end
    object sdsSklostdetKOLBUXT: TIntegerField
      FieldName = 'KOLBUXT'
      Required = True
    end
    object sdsSklostdetKOLOTP: TFMTBCDField
      FieldName = 'KOLOTP'
      Required = True
      Precision = 15
    end
    object sdsSklostdetKOLREZERV: TFMTBCDField
      FieldName = 'KOLREZERV'
      Required = True
      Precision = 15
    end
    object sdsSklostdetNOMER_TARY: TStringField
      FieldName = 'NOMER_TARY'
      Size = 30
    end
    object sdsSklostdetID_TYPE: TIntegerField
      FieldName = 'ID_TYPE'
      Required = True
    end
    object sdsSklostdetID_IZG: TIntegerField
      FieldName = 'ID_IZG'
      Required = True
    end
  end
  object dspSklostdet: TDataSetProvider
    DataSet = sdsSklostdet
    UpdateMode = upWhereKeyOnly
    Left = 32
    Top = 168
  end
  object cdsSklostdet: TClientDataSet
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
    ProviderName = 'dspSklostdet'
    AfterScroll = cdsSklostdetAfterScroll
    OnCalcFields = cdsSklostdetCalcFields
    Left = 32
    Top = 200
    object cdsSklostdetCOMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'COMMENT'
      Size = 50
    end
    object cdsSklostdetID_OSTT: TIntegerField
      FieldName = 'ID_OSTT'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsSklostdetID_TARA: TIntegerField
      FieldName = 'ID_TARA'
      Required = True
    end
    object cdsSklostdetKOLBREZERV: TIntegerField
      DisplayLabel = #1047#1072#1088#1077#1079' '#1082#1086#1083' '#1073#1091#1093#1090
      FieldName = 'KOLBREZERV'
      Required = True
    end
    object cdsSklostdetKOLBUXT: TIntegerField
      DisplayLabel = #1050#1086#1083'.'#1073#1091#1093#1090
      FieldName = 'KOLBUXT'
      Required = True
    end
    object cdsSklostdetKOLOTP: TFMTBCDField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'KOLOTP'
      Required = True
      DisplayFormat = '0.000'
      Precision = 15
    end
    object cdsSklostdetKOLREZERV: TFMTBCDField
      DisplayLabel = #1047#1072#1088#1077#1079' '#1082#1086#1083'-'#1074#1086
      FieldName = 'KOLREZERV'
      Required = True
      DisplayFormat = '0.000'
      Precision = 15
    end
    object cdsSklostdetNOMER_TARY: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1090#1072#1088#1099
      FieldName = 'NOMER_TARY'
      Size = 30
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
    object cdsSklostdetID_TYPE: TIntegerField
      FieldName = 'ID_TYPE'
      Required = True
    end
    object cdsSklostdetID_IZG: TIntegerField
      FieldName = 'ID_IZG'
      Required = True
    end
    object cdsSklostdetTIP2: TStringField
      DisplayLabel = #1041#1072#1088#1072#1073#1072#1085
      FieldKind = fkLookup
      FieldName = 'TIP2'
      LookupDataSet = dmdEx.cdsSklottIdtype
      LookupKeyFields = 'ID_FIELD'
      LookupResultField = 'FIELD_VALUE'
      KeyFields = 'ID_TYPE'
      Lookup = True
    end
    object cdsSklostdetIZG: TStringField
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
  end
  object dsSklostdet: TDataSource
    DataSet = cdsSklostdet
    Left = 32
    Top = 232
  end
  object ActionList1: TActionList
    Images = dmdEx.ImageList1
    Left = 64
    Top = 200
    object actWhole: TAction
      Caption = #1062#1077#1083#1080#1082#1086#1084
      OnExecute = actWholeExecute
    end
    object actCutPart: TAction
      Caption = #1054#1090#1088#1077#1079#1072#1090#1100
      OnExecute = actCutPartExecute
    end
    object actApply: TAction
      Caption = 'Ok'
      OnExecute = actApplyExecute
    end
    object actCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      ShortCut = 27
      OnExecute = actCancelExecute
    end
    object actReturn: TAction
      Caption = #1042#1077#1088#1085#1091#1090#1100' '#1085#1072' '#1089#1082#1083#1072#1076
      OnExecute = actReturnExecute
    end
    object actReCount: TAction
      Caption = 'actReCount'
      OnExecute = actReCountExecute
    end
    object actNamotka: TAction
      Caption = #1053#1072#1084#1086#1090#1072#1090#1100
      OnExecute = actNamotkaExecute
    end
    object actDetail: TAction
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      ImageIndex = 5
      ShortCut = 120
      OnExecute = actDetailExecute
    end
    object actChangeBuxt: TAction
      Caption = #1055#1086#1084#1077#1085#1103#1090#1100' '#1073#1091#1093#1090#1099
      ImageIndex = 3
      OnExecute = actChangeBuxtExecute
    end
  end
  object dsNaklotEdit: TDataSource
    Left = 64
    Top = 168
  end
  object sdsNaklodet: TSQLDataSet
    CommandText = 
      'select '#13#10'  d.comment,'#13#10'  d.id_det,'#13#10'  d.id_nakld,'#13#10'  d.id_tara,'#13 +
      #10'  d.kolbuxt,'#13#10'  d.kolotp,'#13#10'  d.nomer_tary,'#13#10'  d.id_ostt,'#13#10'  d.t' +
      'ip'#13#10'from '#13#10'  NAKLODET d'#13#10'where  '#13#10'  d.id_nakld=:id_nakld'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_nakld'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 96
    Top = 104
    object sdsNaklodetCOMMENT: TStringField
      FieldName = 'COMMENT'
      Size = 50
    end
    object sdsNaklodetID_DET: TIntegerField
      FieldName = 'ID_DET'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsNaklodetID_NAKLD: TIntegerField
      FieldName = 'ID_NAKLD'
      Required = True
    end
    object sdsNaklodetID_TARA: TIntegerField
      FieldName = 'ID_TARA'
      Required = True
    end
    object sdsNaklodetKOLBUXT: TIntegerField
      FieldName = 'KOLBUXT'
      Required = True
    end
    object sdsNaklodetKOLOTP: TFMTBCDField
      FieldName = 'KOLOTP'
      Precision = 15
    end
    object sdsNaklodetNOMER_TARY: TStringField
      FieldName = 'NOMER_TARY'
      Size = 30
    end
    object sdsNaklodetID_OSTT: TIntegerField
      FieldName = 'ID_OSTT'
      Required = True
    end
    object sdsNaklodetTIP: TSmallintField
      FieldName = 'TIP'
      Required = True
    end
  end
  object dspNaklodet: TDataSetProvider
    DataSet = sdsNaklodet
    Options = [poDisableInserts]
    UpdateMode = upWhereKeyOnly
    Left = 96
    Top = 168
  end
  object cdsNaklodet: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_nakld'
        ParamType = ptInput
        Value = 1
      end>
    ProviderName = 'dspNaklodet'
    OnReconcileError = cdsNaklodetReconcileError
    Left = 96
    Top = 200
    object cdsNaklodetID_DET: TIntegerField
      FieldName = 'ID_DET'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsNaklodetNOMER_TARY: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1090#1072#1088#1099
      FieldName = 'NOMER_TARY'
      Size = 32
    end
    object cdsNaklodetID_TARA: TIntegerField
      FieldName = 'ID_TARA'
    end
    object cdsNaklodetKOLOTP: TFMTBCDField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'KOLOTP'
      DisplayFormat = '0.000'
      Precision = 15
    end
    object cdsNaklodetCOMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'COMMENT'
      Size = 52
    end
    object cdsNaklodetKOLBUXT: TIntegerField
      DisplayLabel = #1050#1086#1083'. '#1073#1091#1093#1090
      FieldName = 'KOLBUXT'
    end
    object cdsNaklodetTARA: TStringField
      DisplayLabel = #1058#1072#1088#1072
      FieldKind = fkLookup
      FieldName = 'TARA'
      LookupDataSet = dmdEx.cdsTara
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_TARA'
      Lookup = True
    end
    object cdsNaklodetkolsum: TFloatField
      FieldKind = fkCalculated
      FieldName = 'KOLSUM'
      Calculated = True
    end
    object cdsNaklodetID_NAKLD: TIntegerField
      FieldName = 'ID_NAKLD'
      Required = True
    end
    object cdsNaklodetID_OSTT: TIntegerField
      FieldName = 'ID_OSTT'
      Required = True
      Visible = False
    end
    object cdsNaklodetTIP: TSmallintField
      FieldName = 'TIP'
      Required = True
    end
  end
  object dsNaklodet: TDataSource
    DataSet = cdsNaklodet
    Left = 96
    Top = 232
  end
  object dsSklostodetSrc: TDataSource
    DataSet = sdsSklostdet
    Left = 32
    Top = 136
  end
  object sdsProcess: TSQLDataSet
    CommandText = 'NAKLODET_PROCESS_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_DET'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = dmdEx.scUchet
    Left = 160
    Top = 104
  end
  object sdsRecalc: TSQLDataSet
    CommandText = 'SKLOSTDET_RECALC_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_OSTT'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = dmdEx.scUchet
    Left = 192
    Top = 104
  end
  object sdsNaklodetInsertPc: TSQLDataSet
    CommandText = 'NAKLODET_INSERT_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'WHAT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_NAKLD'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_OSTT'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'KOLOTP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'KOLBUXT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_OSTT_TARA'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 224
    Top = 104
  end
  object MainMenu1: TMainMenu
    Left = 64
    Top = 232
    object N1: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      GroupIndex = 10
      object actDetail1: TMenuItem
        Action = actDetail
      end
    end
  end
  object qeSklostdet: TQueryExtender
    Query = cdsSklostdet
    Left = 32
    Top = 264
  end
  object qeNaklodet: TQueryExtender
    Query = cdsNaklodet
    KeyField = 'ID_OSTT'
    Left = 96
    Top = 264
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmNaklodet'
    StorageManager = rpsNaklodet
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      'dbgNaklodet.<P>.Columns.<ForAllItems>.Width'
      'dbgSklostt.<P>.Columns.<ForAllItems>.Width')
    Left = 160
    Top = 136
  end
  object rpsNaklodet: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 192
    Top = 136
  end
  object UnfFilter1: TUnfFilter
    DBGridEh = dbgNaklodet
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
    Left = 96
    Top = 296
  end
  object UnfFilter2: TUnfFilter
    DBGridEh = dbgSklostt
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
    Left = 32
    Top = 296
  end
  object sdsExchange: TSQLDataSet
    CommandText = 'NAKLODET_EXCHANGE_BUXT_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_OSTT1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_OSTT2'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 256
    Top = 104
  end
  object popSklostt: TPopupMenu
    Left = 64
    Top = 296
    object N2: TMenuItem
      Action = actWhole
    end
    object N3: TMenuItem
      Action = actCutPart
    end
    object N4: TMenuItem
      Action = actNamotka
    end
    object N5: TMenuItem
      Action = actDetail
    end
  end
  object dsNakloEdit: TDataSource
    Left = 128
    Top = 168
  end
end
