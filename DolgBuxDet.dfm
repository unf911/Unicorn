object frmDolgBuxDet: TfrmDolgBuxDet
  Left = 80
  Top = 115
  BorderStyle = bsDialog
  Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103' '#1076#1086#1083#1075#1086#1074' ('#1073#1091#1093')'
  ClientHeight = 407
  ClientWidth = 627
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
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 281
    Top = 97
    Width = 8
    Height = 310
    Beveled = True
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 627
    Height = 97
    Align = alTop
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1076#1077#1090#1072#1083#1080#1079#1072#1094#1080#1080
    TabOrder = 0
    DesignSize = (
      627
      97)
    object Label5: TLabel
      Left = 8
      Top = 16
      Width = 82
      Height = 13
      Caption = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072
    end
    object Label6: TLabel
      Left = 216
      Top = 16
      Width = 76
      Height = 13
      Caption = #1050#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072
    end
    object Label7: TLabel
      Left = 8
      Top = 48
      Width = 37
      Height = 13
      Caption = #1060#1080#1088#1084#1072
    end
    object Label8: TLabel
      Left = 160
      Top = 48
      Width = 36
      Height = 13
      Caption = #1050#1083#1080#1077#1085#1090
    end
    object medDateFrom: TDateTimePicker
      Left = 96
      Top = 16
      Width = 113
      Height = 21
      Date = 37495.000000000000000000
      Time = 37495.000000000000000000
      TabOrder = 0
    end
    object medDateTo: TDateTimePicker
      Left = 304
      Top = 16
      Width = 113
      Height = 21
      Date = 37495.000000000000000000
      Time = 37495.000000000000000000
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 450
      Top = 16
      Width = 121
      Height = 25
      Action = actRefresh
      Anchors = [akTop, akRight]
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 2
    end
    object dbeIZG: TEdit
      Left = 8
      Top = 64
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 3
      Text = 'dbeIZG'
    end
    object dbeZAK: TEdit
      Left = 160
      Top = 64
      Width = 177
      Height = 21
      ReadOnly = True
      TabOrder = 4
      Text = 'dbeZAK'
    end
    object BitBtn2: TBitBtn
      Left = 360
      Top = 56
      Width = 97
      Height = 25
      Action = actDesigner
      Caption = #1044#1080#1079#1072#1081#1085#1077#1088
      TabOrder = 5
      Visible = False
    end
    object BitBtn3: TBitBtn
      Left = 474
      Top = 56
      Width = 97
      Height = 25
      Action = actPreview
      Anchors = [akTop, akRight]
      Caption = #1040#1082#1090' '#1089#1074#1077#1088#1082#1080
      TabOrder = 6
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF00000000000000000000000000000000
        0000000000000000000000000000000000FF00FFFF00FFFF00FFFF00FF000000
        C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6000000C6C6
        C6000000FF00FFFF00FF00000000000000000000000000000000000000000000
        0000000000000000000000000000000000C6C6C6000000FF00FF000000C6C6C6
        C6C6C6C6C6C6C6C6C6C6C6C6C6C6C600FFFF00FFFF00FFFFC6C6C6C6C6C60000
        00000000000000FF00FF000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C684
        8484848484848484C6C6C6C6C6C6000000C6C6C6000000FF00FF000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00C6C6C6C6C6C6000000000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
        C6C6C6C6C6C6C6C6C6C6C6000000C6C6C6000000C6C6C6000000FF00FF000000
        000000000000000000000000000000000000000000000000000000C6C6C60000
        00C6C6C6000000000000FF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF000000C6C6C6000000C6C6C6000000FF00FFFF00FF
        FF00FF000000FFFFFF000000000000000000000000000000FFFFFF0000000000
        00000000000000FF00FFFF00FFFF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF000000FFFFFF000000000000000000000000000000FFFFFF0000
        00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0000000000000000000000000000000000000000000000
        00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 97
    Width = 281
    Height = 310
    Align = alLeft
    Caption = #1044#1086#1083#1075#1080
    TabOrder = 1
    DesignSize = (
      281
      310)
    object Label3: TLabel
      Left = 16
      Top = 269
      Width = 81
      Height = 33
      Anchors = [akLeft, akRight, akBottom]
      AutoSize = False
      Caption = #1044#1077#1073#1077#1090' '#1085#1072' '#1082#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072
      WordWrap = True
    end
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 81
      Height = 33
      AutoSize = False
      Caption = #1044#1077#1073#1077#1090' '#1085#1072' '#1085#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072
      WordWrap = True
    end
    object Label9: TLabel
      Left = 16
      Top = 237
      Width = 81
      Height = 33
      Anchors = [akLeft, akRight, akBottom]
      AutoSize = False
      Caption = #1044#1077#1073#1077#1090
      WordWrap = True
    end
    object dbeDolgAfter: TDBEdit
      Left = 152
      Top = 281
      Width = 121
      Height = 21
      Anchors = [akLeft, akRight, akBottom]
      DataField = 'DEBETAFTER'
      DataSource = dsDolg
      ReadOnly = True
      TabOrder = 0
    end
    object dbeDolgBefore: TDBEdit
      Left = 152
      Top = 16
      Width = 121
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'DEBETBEFORE'
      DataSource = dsDolg
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit1: TDBEdit
      Left = 152
      Top = 241
      Width = 121
      Height = 21
      Anchors = [akLeft, akRight, akBottom]
      DataField = 'DEBET'
      DataSource = dsDolg
      ReadOnly = True
      TabOrder = 2
    end
    object DBGridEh1: TDBGridEh
      Left = 16
      Top = 48
      Width = 257
      Height = 182
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dtsNakl
      EditActions = [geaCopyEh]
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      PopupMenu = PopupMenu1
      ReadOnly = True
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      VertScrollBar.VisibleMode = sbAlwaysShowEh
      OnDblClick = DBGridEh1DblClick
    end
  end
  object GroupBox3: TGroupBox
    Left = 289
    Top = 97
    Width = 338
    Height = 310
    Align = alClient
    Caption = #1054#1087#1083#1072#1090#1099' '#1080' '#1087#1088#1077#1076#1086#1087#1083#1072#1090#1099
    TabOrder = 2
    DesignSize = (
      338
      310)
    object Label2: TLabel
      Left = 16
      Top = 269
      Width = 81
      Height = 33
      Anchors = [akLeft, akBottom]
      AutoSize = False
      Caption = #1050#1088#1077#1076#1080#1090' '#1085#1072' '#1082#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072
      WordWrap = True
    end
    object Label4: TLabel
      Left = 16
      Top = 16
      Width = 81
      Height = 33
      AutoSize = False
      Caption = #1050#1088#1077#1076#1080#1090' '#1085#1072' '#1085#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072
      WordWrap = True
    end
    object Label10: TLabel
      Left = 16
      Top = 237
      Width = 81
      Height = 33
      Anchors = [akLeft, akBottom]
      AutoSize = False
      Caption = #1050#1088#1077#1076#1080#1090
      WordWrap = True
    end
    object DBEdit4: TDBEdit
      Left = 209
      Top = 281
      Width = 121
      Height = 21
      Anchors = [akRight, akBottom]
      DataField = 'KREDITAFTER'
      DataSource = dsDolg
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 209
      Top = 16
      Width = 121
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'KREDITBEFORE'
      DataSource = dsDolg
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 209
      Top = 241
      Width = 121
      Height = 21
      Anchors = [akRight, akBottom]
      DataField = 'KREDIT'
      DataSource = dsDolg
      ReadOnly = True
      TabOrder = 2
    end
    object DBGridEh2: TDBGridEh
      Left = 16
      Top = 48
      Width = 314
      Height = 182
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dtsOpl
      EditActions = [geaCopyEh]
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      PopupMenu = PopupMenu2
      ReadOnly = True
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      VertScrollBar.VisibleMode = sbAlwaysShowEh
      OnDblClick = DBGridEh2DblClick
    end
  end
  object ActionList1: TActionList
    Images = dmdEx.ImageList1
    Left = 24
    Top = 224
    object actClose: TAction
      Caption = 'actClose'
      ShortCut = 27
      OnExecute = actCloseExecute
    end
    object actRecalc: TAction
      Caption = 'actRecalc'
      OnExecute = actRecalcExecute
    end
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ShortCut = 116
      OnExecute = actRefreshExecute
    end
    object actPreview: TAction
      Caption = #1040#1082#1090' '#1089#1074#1077#1088#1082#1080
      ShortCut = 16471
      OnExecute = actPreviewExecute
    end
    object actDesigner: TAction
      Caption = #1044#1080#1079#1072#1081#1085#1077#1088
      OnExecute = actDesignerExecute
    end
    object actDetail1: TAction
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      ImageIndex = 5
      OnExecute = actDetail1Execute
    end
    object actDetail2: TAction
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      ImageIndex = 5
      OnExecute = actDetail2Execute
    end
  end
  object dtsNakl: TDataSource
    DataSet = cdsNakl
    Left = 56
    Top = 256
  end
  object dtsOpl: TDataSource
    DataSet = cdsOpl
    Left = 88
    Top = 256
  end
  object dsDolg: TDataSource
    DataSet = cdsDolg
    Left = 120
    Top = 256
  end
  object qeDolg: TQueryExtender
    Query = cdsDolg
    Left = 232
    Top = 192
  end
  object frActSv: TfrxReport
    Version = '3.23.7'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = '\\JUL\SAMSUNG'
    ReportOptions.CreateDate = 38985.427757152800000000
    ReportOptions.LastChange = 39097.650736585600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnGetValue = frActSvGetValue
    Left = 200
    Top = 224
    Datasets = <>
    Variables = <
      item
        Name = ' AllVars'
        Value = Null
      end
      item
        Name = 'sIzg'
        Value = Null
      end
      item
        Name = 'sZak'
        Value = Null
      end
      item
        Name = 'sDateFrom'
        Value = Null
      end
      item
        Name = 'DatDoc'
        Value = Null
      end
      item
        Name = 'Oper'
        Value = Null
      end
      item
        Name = 'Nomer'
        Value = Null
      end
      item
        Name = 'Debet'
        Value = Null
      end
      item
        Name = 'Kredit'
        Value = Null
      end
      item
        Name = 'DebetBegin'
        Value = Null
      end
      item
        Name = 'DebetEnd'
        Value = Null
      end
      item
        Name = 'KreditBegin'
        Value = Null
      end
      item
        Name = 'KreditEnd'
        Value = Null
      end
      item
        Name = 'KreditSum'
        Value = Null
      end
      item
        Name = 'DebetSum'
        Value = Null
      end
      item
        Name = 'sDateTo'
        Value = Null
      end>
    Style = <>
  end
  object frUserDataset1: TfrxUserDataSet
    UserName = 'frUserDataset1'
    OnCheckEOF = frUserDataset1CheckEOF
    OnFirst = frUserDataset1First
    OnNext = frUserDataset1Next
    OnPrior = frUserDataset1Prior
    Left = 200
    Top = 256
  end
  object sdsDolgBux: TSQLDataSet
    CommandText = 
      'select'#13#10'  r.sub1,r.sub2,'#13#10'  (select name from objects o where o.' +
      'oid=r.sub1) as izg,'#13#10'  (select name from objects o2 where o2.oid' +
      '=r.sub2) as zak,'#13#10'  r.debetbefore,r.kreditbefore,'#13#10'  r.debet,r.k' +
      'redit,'#13#10'  r.debetafter,r.kreditafter'#13#10'from'#13#10'  rep_dolgbux_pc('#13#10' ' +
      '   :sub1_in,:sub2_in,:sub3_in,'#13#10'    :dat_from,:dat_to) r;'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'sub1_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sub2_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sub3_in'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dat_from'
        ParamType = ptInput
        Value = '01.01.03'
      end
      item
        DataType = ftDate
        Name = 'dat_to'
        ParamType = ptInput
        Value = '01.01.04'
      end>
    SQLConnection = dmdEx.scUchet
    Left = 232
    Top = 224
  end
  object dspDolgBux: TDataSetProvider
    DataSet = sdsDolgBux
    Options = [poAllowCommandText]
    Left = 232
    Top = 256
  end
  object cdsDolg: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'sub1_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'sub2_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'sub3_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftDate
        Name = 'dat_from'
        ParamType = ptInput
        Value = '01.01.03'
      end
      item
        DataType = ftDate
        Name = 'dat_to'
        ParamType = ptInput
        Value = '01.01.04'
      end>
    ProviderName = 'dspDolgBux'
    Left = 232
    Top = 288
    object cdsDolgSUB1: TIntegerField
      DisplayWidth = 5
      FieldName = 'SUB1'
      Visible = False
    end
    object cdsDolgSUB2: TIntegerField
      DisplayWidth = 5
      FieldName = 'SUB2'
      Visible = False
    end
    object cdsDolgIZG: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      DisplayWidth = 10
      FieldName = 'IZG'
      Size = 50
    end
    object cdsDolgZAK: TStringField
      DisplayLabel = #1047#1072#1082#1072#1079#1095#1080#1082
      DisplayWidth = 20
      FieldName = 'ZAK'
      Size = 50
    end
    object cdsDolgDEBETBEFORE: TFloatField
      DisplayLabel = #1044#1077#1073#1077#1090' '#1085#1072' '#1085#1072#1095#1072#1083#1086
      FieldName = 'DEBETBEFORE'
      DisplayFormat = '0.00'
    end
    object cdsDolgKREDITBEFORE: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090' '#1085#1072' '#1085#1072#1095#1072#1083#1086
      FieldName = 'KREDITBEFORE'
      DisplayFormat = '0.00'
    end
    object cdsDolgDEBET: TFloatField
      DisplayLabel = #1044#1077#1073#1077#1090
      FieldName = 'DEBET'
      DisplayFormat = '0.00'
    end
    object cdsDolgKREDIT: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090
      FieldName = 'KREDIT'
      DisplayFormat = '0.00'
    end
    object cdsDolgDEBETAFTER: TFloatField
      DisplayLabel = #1044#1077#1073#1077#1090' '#1085#1072' '#1082#1086#1085#1077#1094
      FieldName = 'DEBETAFTER'
      DisplayFormat = '0.00'
    end
    object cdsDolgKREDITAFTER: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090' '#1085#1072' '#1082#1086#1085#1077#1094
      FieldName = 'KREDITAFTER'
      DisplayFormat = '0.00'
    end
    object cdsDolgIZGFULLNAME: TStringField
      FieldKind = fkLookup
      FieldName = 'IZGFULLNAME'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'FULLNAME'
      KeyFields = 'SUB1'
      Size = 150
      Lookup = True
    end
    object cdsDolgZAKFULLNAME: TStringField
      FieldKind = fkLookup
      FieldName = 'ZAKFULLNAME'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'FULLNAME'
      KeyFields = 'SUB2'
      Size = 150
      Lookup = True
    end
  end
  object SQLDataSet1: TSQLDataSet
    CommandText = 
      'select'#13#10'    pr.id_nakl,'#13#10'    pr.dat,'#13#10'    (select id from naklo ' +
      'om where om.id_nakl=pr.id_nakl) as id,'#13#10'    pr.sub3 as id_manage' +
      'r,'#13#10'    pr.debet as nds,'#13#10'    pr.tip'#13#10'  from provodki pr'#13#10'  wher' +
      'e pr.id_schet='#13#10'    (select oid from GET_OID_OBJECTS_PC('#13#10'      ' +
      ' '#39#1044#1054#1051#1043#1048' '#1047#1040' '#1050#1040#1041#1045#1051#1068#39','#13#10'       (select oid from GET_OID_OBJECTS_PC(' +
      #39#1058#1048#1055' '#1057#1063#1045#1058#1040#39',-100))'#13#10'       )'#13#10'    )/*'#1076#1086#1083#1075#1080' '#1079#1072' '#1082#1072#1073#1077#1083#1100'*/ '#13#10'    and' +
      ' pr.sub1=:sub1_in'#13#10'    and pr.sub2=:sub2_in'#13#10'    and pr.debet is' +
      ' not null'#13#10'    and pr.tip<>1'#13#10'    and pr.tip<>(select oid from g' +
      'et_oid_objects_pc('#39#1058#1048#1055' '#1058#1056#1040#1053#1064#1048#39',-100))'#13#10'    and pr.dat between :d' +
      'at_from and :dat_to'#13#10'  order by 2,1 '
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'sub1_in'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'sub2_in'
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
    Left = 312
    Top = 224
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLDataSet1
    Options = [poAllowCommandText]
    Left = 312
    Top = 256
  end
  object cdsNakl: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'sub1_in'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'sub2_in'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftDate
        Name = 'dat_from'
        ParamType = ptInput
        Value = 37987d
      end
      item
        DataType = ftDate
        Name = 'dat_to'
        ParamType = ptInput
        Value = 37987d
      end>
    ProviderName = 'DataSetProvider1'
    Left = 312
    Top = 288
    object cdsNaklID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      Visible = False
    end
    object cdsNaklDAT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 7
      FieldName = 'DAT'
      DisplayFormat = 'dd.mm.yy'
    end
    object cdsNaklID: TStringField
      DisplayLabel = #8470#1085#1072#1082#1083
      DisplayWidth = 7
      FieldName = 'ID'
    end
    object cdsNaklID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
      Visible = False
    end
    object cdsNaklMANAGER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'MANAGER'
      LookupDataSet = dmdEx.cdsManager
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_MANAGER'
      Lookup = True
    end
    object cdsNaklNDS: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1085#1072#1082#1083
      FieldName = 'NDS'
      DisplayFormat = '0.00'
    end
    object cdsNaklTIP: TIntegerField
      FieldName = 'TIP'
      Required = True
      Visible = False
    end
  end
  object SQLDataSet2: TSQLDataSet
    CommandText = 
      'select'#13#10'    pr.id_nakl,'#13#10'    pr.dat,'#13#10'    (select id from naklo ' +
      'om where om.id_nakl=pr.id_nakl) as id,'#13#10'    pr.sub3 as id_manage' +
      'r,'#13#10'    pr.kredit as nds,'#13#10'    pr.tip'#13#10'  from provodki pr'#13#10'  whe' +
      're pr.id_schet='#13#10'    (select oid from GET_OID_OBJECTS_PC('#13#10'     ' +
      '  '#39#1044#1054#1051#1043#1048' '#1047#1040' '#1050#1040#1041#1045#1051#1068#39','#13#10'       (select oid from GET_OID_OBJECTS_PC' +
      '('#39#1058#1048#1055' '#1057#1063#1045#1058#1040#39',-100))'#13#10'       )'#13#10'    )/*'#1076#1086#1083#1075#1080' '#1079#1072' '#1082#1072#1073#1077#1083#1100'*/ '#13#10'    an' +
      'd pr.sub1=:sub1_in'#13#10'    and pr.sub2=:sub2_in'#13#10'    and pr.kredit ' +
      'is not null'#13#10'    and pr.tip<>1'#13#10'    and pr.tip<>(select oid from' +
      ' get_oid_objects_pc('#39#1058#1048#1055' '#1058#1056#1040#1053#1064#1048#39',-100))'#13#10'    and pr.dat between ' +
      ':dat_from and :dat_to'#13#10'  order by 2,1'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'sub1_in'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'sub2_in'
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
    Left = 344
    Top = 224
  end
  object DataSetProvider2: TDataSetProvider
    DataSet = SQLDataSet2
    Options = [poAllowCommandText]
    Left = 344
    Top = 256
  end
  object cdsOpl: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'sub1_in'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'sub2_in'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftDate
        Name = 'dat_from'
        ParamType = ptInput
        Value = 37987d
      end
      item
        DataType = ftDate
        Name = 'dat_to'
        ParamType = ptInput
        Value = 37987d
      end>
    ProviderName = 'DataSetProvider2'
    Left = 344
    Top = 288
    object IntegerField1: TIntegerField
      FieldName = 'ID_NAKL'
      Visible = False
    end
    object SQLTimeStampField1: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 7
      FieldName = 'DAT'
      DisplayFormat = 'dd.mm.yy'
    end
    object StringField1: TStringField
      DisplayLabel = #8470#1087#1083#1072#1090
      DisplayWidth = 7
      FieldName = 'ID'
    end
    object IntegerField2: TIntegerField
      FieldName = 'ID_MANAGER'
      Visible = False
    end
    object StringField2: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'MANAGER'
      LookupDataSet = dmdEx.cdsManager
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_MANAGER'
      Lookup = True
    end
    object FloatField1: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 12
      FieldName = 'NDS'
      DisplayFormat = '0.00'
    end
    object IntegerField3: TIntegerField
      FieldName = 'TIP'
      Required = True
      Visible = False
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 168
    Top = 192
    object N1: TMenuItem
      Action = actDetail1
      Default = True
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 200
    Top = 192
    object N2: TMenuItem
      Action = actDetail2
      Checked = True
    end
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmDolgBuxDet'
    StorageManager = rpsClientEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      'GroupBox2.<P>.Width')
    Left = 168
    Top = 136
  end
  object rpsClientEdit: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 200
    Top = 136
  end
  object UnfFilter1: TUnfFilter
    DBGridEh = DBGridEh2
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
    Left = 132
    Top = 137
  end
  object UnfFilter2: TUnfFilter
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
    Left = 96
    Top = 137
  end
end
