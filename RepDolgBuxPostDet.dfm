object frmRepDolgBuxPostDet: TfrmRepDolgBuxPostDet
  Left = 196
  Top = 164
  BorderStyle = bsDialog
  Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103' '#1076#1086#1083#1075#1086#1074' ('#1073#1091#1093')'
  ClientHeight = 518
  ClientWidth = 633
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
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 353
    Top = 97
    Width = 8
    Height = 421
    Beveled = True
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 633
    Height = 97
    Align = alTop
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1076#1077#1090#1072#1083#1080#1079#1072#1094#1080#1080
    TabOrder = 0
    DesignSize = (
      633
      97)
    object LabelDatFrom: TLabel
      Left = 8
      Top = 16
      Width = 82
      Height = 13
      Caption = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072
    end
    object LabelDatTo: TLabel
      Left = 216
      Top = 16
      Width = 76
      Height = 13
      Caption = #1050#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072
    end
    object Label_1: TLabel
      Left = 8
      Top = 48
      Width = 37
      Height = 13
      Caption = #1060#1080#1088#1084#1072
      Visible = False
    end
    object Label_2: TLabel
      Left = 144
      Top = 48
      Width = 36
      Height = 13
      Caption = #1050#1083#1080#1077#1085#1090
      Visible = False
    end
    object Label_3: TLabel
      Left = 340
      Top = 48
      Width = 38
      Height = 13
      Caption = #1042#1072#1083#1102#1090#1072
      Visible = False
    end
    object medDateFrom2: TDateTimePicker
      Left = 96
      Top = 16
      Width = 113
      Height = 21
      Date = 37495.000000000000000000
      Format = 'dd.MM.yy'
      Time = 37495.000000000000000000
      TabOrder = 0
      OnChange = medDateFrom2Change
    end
    object medDateTo2: TDateTimePicker
      Left = 304
      Top = 16
      Width = 113
      Height = 21
      Date = 37495.000000000000000000
      Format = 'dd.MM.yy'
      Time = 37495.000000000000000000
      TabOrder = 1
      OnChange = medDateTo2Change
    end
    object BitBtn1: TBitBtn
      Left = 456
      Top = 16
      Width = 121
      Height = 25
      Action = actRefresh
      Anchors = [akTop, akRight]
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 2
    end
    object dbe_1: TEdit
      Left = 8
      Top = 64
      Width = 121
      Height = 24
      ReadOnly = True
      TabOrder = 3
      Text = 'dbe_1'
      Visible = False
    end
    object dbe_2: TEdit
      Left = 144
      Top = 64
      Width = 177
      Height = 24
      ReadOnly = True
      TabOrder = 4
      Text = 'dbe_2'
      Visible = False
    end
    object BitBtn2: TBitBtn
      Left = 452
      Top = 64
      Width = 29
      Height = 25
      Action = actDesigner
      Caption = #1044#1080#1079#1072#1081#1085#1077#1088
      TabOrder = 5
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF008400000084000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0084000000C6C6C6008400000084000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0084000000C6C6C600840000008400000084000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008400
        0000C6C6C600840000008400000084000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000000000000000000000000000000000084000000C6C6
        C600840000008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000000000000000000C6C6C600C6C6C600C6C6C600FFFFFF00848484008400
        00008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
        000084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF008484
        840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
        0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFF
        FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
        C600C6C6C60000000000FF00FF00FF00FF00FF00FF00FF00FF0000000000C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
        C600C6C6C60000000000FF00FF00FF00FF00FF00FF00FF00FF0000000000C6C6
        C600FFFFFF00FFFF0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
        C600C6C6C60000000000FF00FF00FF00FF00FF00FF00FF00FF0000000000C6C6
        C600FFFFFF00FFFF0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
        C600C6C6C60000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
        0000FFFFFF00FFFFFF00FFFF0000FFFF0000C6C6C600C6C6C600C6C6C600C6C6
        C60000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
        000084848400FFFFFF00FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C6008484
        840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600000000000000
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object BitBtn3: TBitBtn
      Left = 491
      Top = 64
      Width = 86
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
    object dbe_3: TEdit
      Left = 340
      Top = 64
      Width = 105
      Height = 24
      ReadOnly = True
      TabOrder = 7
      Text = 'dbe_3'
      Visible = False
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 97
    Width = 353
    Height = 421
    Align = alLeft
    Caption = #1044#1077#1073#1077#1090
    TabOrder = 1
    DesignSize = (
      353
      421)
    object Label3: TLabel
      Left = 16
      Top = 380
      Width = 153
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
      Top = 348
      Width = 153
      Height = 33
      Anchors = [akLeft, akRight, akBottom]
      AutoSize = False
      Caption = #1044#1077#1073#1077#1090' '#1079#1072' '#1087#1077#1088#1080#1086#1076
      WordWrap = True
    end
    object dbeDolgAfter: TDBEdit
      Left = 152
      Top = 392
      Width = 193
      Height = 24
      Anchors = [akLeft, akRight, akBottom]
      DataField = 'DEBETAFTER'
      DataSource = dsDolg
      ReadOnly = True
      TabOrder = 0
    end
    object dbeDolgBefore: TDBEdit
      Left = 152
      Top = 16
      Width = 193
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      DataField = 'DEBETBEFORE'
      DataSource = dsDolg
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit1: TDBEdit
      Left = 152
      Top = 352
      Width = 193
      Height = 24
      Anchors = [akLeft, akRight, akBottom]
      DataField = 'DEBET'
      DataSource = dsDolg
      ReadOnly = True
      TabOrder = 2
    end
    object DBGridEh1: TDBGridEh
      Left = 16
      Top = 48
      Width = 329
      Height = 293
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
    Left = 361
    Top = 97
    Width = 272
    Height = 421
    Align = alClient
    Caption = #1050#1088#1077#1076#1080#1090
    TabOrder = 2
    DesignSize = (
      272
      421)
    object Label2: TLabel
      Left = 16
      Top = 380
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
      Top = 348
      Width = 81
      Height = 33
      Anchors = [akLeft, akBottom]
      AutoSize = False
      Caption = #1050#1088#1077#1076#1080#1090' '#1079#1072' '#1087#1077#1088#1080#1086#1076
      WordWrap = True
    end
    object DBEdit4: TDBEdit
      Left = 143
      Top = 392
      Width = 121
      Height = 24
      Anchors = [akRight, akBottom]
      DataField = 'KREDITAFTER'
      DataSource = dsDolg
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 143
      Top = 16
      Width = 121
      Height = 24
      Anchors = [akTop, akRight]
      DataField = 'KREDITBEFORE'
      DataSource = dsDolg
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 143
      Top = 352
      Width = 121
      Height = 24
      Anchors = [akRight, akBottom]
      DataField = 'KREDIT'
      DataSource = dsDolg
      ReadOnly = True
      TabOrder = 2
    end
    object DBGridEh2: TDBGridEh
      Left = 16
      Top = 48
      Width = 248
      Height = 293
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
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnExecute = actRefreshExecute
    end
    object actPreview: TAction
      Caption = #1040#1082#1090' '#1089#1074#1077#1088#1082#1080
      ShortCut = 16471
      OnExecute = actPreviewExecute
    end
    object actDesigner: TAction
      Caption = #1044#1080#1079#1072#1081#1085#1077#1088
      Visible = False
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
    RangeBegin = rbCurrent
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
      'select'#13#10'  (select name from objects o where o.oid=r.sub1) as sub' +
      '1_name,'#13#10'  (select name from objects o where o.oid=r.sub2) as su' +
      'b2_name,'#13#10'  r.sub1, r.sub2,'#13#10'  (select fullname from objects o w' +
      'here o.oid=r.sub1) as IZGFULLNAME,'#13#10'  (select fullname from obje' +
      'cts o where o.oid=r.sub2) as ZAKFULLNAME,'#13#10'  sum(r.debetbefore)-' +
      'minnum(sum(r.debetbefore),sum(kreditbefore)) as debetbefore,'#13#10'  ' +
      'sum(r.kreditbefore)-minnum(sum(r.debetbefore),sum(kreditbefore))' +
      ' as kreditbefore,'#13#10'  sum(debet) as debet,'#13#10'  sum(kredit) as kred' +
      'it,'#13#10'  sum(r.debetafter)-minnum(sum(r.debetafter),sum(kreditafte' +
      'r)) as debetafter,'#13#10'  sum(r.kreditafter)-minnum(sum(r.debetafter' +
      '),sum(kreditafter)) as kreditafter'#13#10'from rep_oborotka2_pc(:id_sc' +
      'het,:dat_from,:dat_to,'#13#10'  :sub1_in,:sub2_in,:sub3_in, :sub4_in, ' +
      ':sub5_in,'#13#10'  :sub6_in,:sub7_in,:sub8_in, :sub9_in, :sub10_in) r'#13 +
      #10'order by 1,2'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_schet'
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
      end
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
        Name = 'sub3_in'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'sub4_in'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'sub5_in'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'sub6_in'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'sub7_in'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'sub8_in'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'sub9_in'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'sub10_in'
        ParamType = ptInput
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
        Name = 'id_schet'
        ParamType = ptInput
        Value = 9043
      end
      item
        DataType = ftDate
        Name = 'dat_from'
        ParamType = ptInput
        Value = 38169d
      end
      item
        DataType = ftDate
        Name = 'dat_to'
        ParamType = ptInput
        Value = 38277d
      end
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
        DataType = ftInteger
        Name = 'sub4_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'sub5_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'sub6_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'sub7_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'sub8_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'sub9_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'sub10_in'
        ParamType = ptInput
        Value = Null
      end>
    ProviderName = 'dspDolgBux'
    Left = 232
    Top = 288
  end
  object sdsNakl: TSQLDataSet
    CommandText = 
      'select'#13#10'    pr.id_nakl,'#13#10'    pr.dat,'#13#10'    (select id from naklo ' +
      'om where om.id_nakl=pr.id_nakl) as id,'#13#10'    (select name from ob' +
      'jects o where o.oid=pr.sub3) as sub3_name,'#13#10'    pr.debet,'#13#10'    (' +
      'select fullname from objects o where o.oid=pr.tip) as tip_name,'#13 +
      #10'    pr.tip'#13#10'  from provodki pr'#13#10'  where pr.id_schet=:id_schet'#13#10 +
      '    and pr.debet is not null'#13#10'    and pr.tip<>1 '#13#10'    and pr.tip' +
      '<>(select oid from get_oid_objects_pc('#39#1058#1048#1055' '#1058#1056#1040#1053#1064#1048#39',-100))'#13#10'    a' +
      'nd pr.dat between :dat_from and :dat_to'#13#10'  order by 2,1'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_schet'
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
  object dspNakl: TDataSetProvider
    DataSet = sdsNakl
    Options = [poAllowCommandText]
    Left = 312
    Top = 256
  end
  object cdsNakl: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_schet'
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
    ProviderName = 'dspNakl'
    Left = 312
    Top = 288
  end
  object sdsOpl: TSQLDataSet
    CommandText = 
      'select'#13#10'    pr.id_nakl,'#13#10'    pr.dat,'#13#10'    (select id from naklo ' +
      'om where om.id_nakl=pr.id_nakl) as id,'#13#10'    (select name from ob' +
      'jects o where o.oid=pr.sub3) as sub3_name,'#13#10'    pr.kredit,'#13#10'    ' +
      '(select fullname from objects o where o.oid=pr.tip) as tip_name,' +
      #13#10'    tip'#13#10'  from provodki pr'#13#10'  where pr.id_schet=:id_schet'#13#10'  ' +
      '  and pr.kredit is not null'#13#10'    and pr.tip<>1 '#13#10'    and pr.tip<' +
      '>(select oid from get_oid_objects_pc('#39#1058#1048#1055' '#1058#1056#1040#1053#1064#1048#39',-100))'#13#10'    an' +
      'd pr.dat between :dat_from and :dat_to'#13#10'  order by 2,1'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_schet'
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
  object dspOpl: TDataSetProvider
    DataSet = sdsOpl
    Options = [poAllowCommandText]
    Left = 344
    Top = 256
  end
  object cdsOpl: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_schet'
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
    ProviderName = 'dspOpl'
    Left = 344
    Top = 288
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
  object qeNakl: TQueryExtender
    Query = cdsNakl
    Left = 312
    Top = 192
  end
  object qeOpl: TQueryExtender
    Query = cdsOpl
    Left = 344
    Top = 192
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
    Left = 388
    Top = 192
  end
  object UnfFilter2: TUnfFilter
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
    Left = 420
    Top = 192
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'frmRepDolgBuxPostDet'
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
  object frActSvDolgi: TfrxReport
    Version = '3.23.7'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = '\\JUL\SAMSUNG'
    ReportOptions.CreateDate = 38985.427757152800000000
    ReportOptions.LastChange = 39638.679876076390000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnGetValue = frActSvDolgiGetValue
    Left = 160
    Top = 224
    Datasets = <
      item
        DataSet = fudActSvDolgi
        DataSetName = 'fudActSvDolgi'
      end>
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
  object fudActSvDolgi: TfrxUserDataSet
    UserName = 'fudActSvDolgi'
    OnCheckEOF = fudActSvDolgiCheckEOF
    OnFirst = fudActSvDolgiFirst
    OnNext = fudActSvDolgiNext
    OnPrior = fudActSvDolgiPrior
    Left = 160
    Top = 256
  end
end
