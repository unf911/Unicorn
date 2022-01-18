object frmRepSkladBux: TfrmRepSkladBux
  Left = 96
  Top = 110
  Width = 587
  Height = 368
  Caption = #1054#1089#1090#1072#1090#1082#1080' '#1080' '#1086#1073#1086#1088#1086#1090#1099' '#1089#1082#1083#1072#1076#1072' ('#1073#1091#1093')'
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
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 579
    Height = 39
    Align = alTop
    TabOrder = 0
    object cbxNotNull: TCheckBox
      Left = 303
      Top = 10
      Width = 125
      Height = 21
      Action = actShowColumnsSum
      TabOrder = 0
    end
    object CheckBox1: TCheckBox
      Left = 432
      Top = 12
      Width = 145
      Height = 17
      Action = actShowColumnsKolotp
      TabOrder = 1
    end
    object BitBtn2: TBitBtn
      Left = 4
      Top = 9
      Width = 97
      Height = 25
      Action = actRefresh
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 2
      Kind = bkRetry
    end
    object BitBtn3: TBitBtn
      Left = 112
      Top = 9
      Width = 93
      Height = 25
      Action = actDetail
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      TabOrder = 3
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
    object BitBtn6: TBitBtn
      Left = 216
      Top = 9
      Width = 85
      Height = 25
      Action = actSettings
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      TabOrder = 4
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF0000FF00FFFF00FFFF00FFFF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF0000FF00FFFF0000FF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF0000FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF0000FF0000FF00FF
        FF00FFFF00FFFF00FFFF00FFFF0000FF00FFFF00FFFF0000FF00FFFF00FFFF00
        FFFF00FFFF00FFFF0000FF0000FF00FFFF00FFFF00FFFF0000FF0000FF00FFFF
        00FFFF00FFFF00FFFF0000FF0000FF00FFFF00FFFF00FFFF0000FF0000FF00FF
        FF0000FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        00FF0000FF00FFFF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00FF
        FF0000FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        00FF0000FF00FFFF0000FF0000FF00FFFF00FFFF00FFFF0000FF0000FF00FFFF
        00FFFF00FFFF00FFFF0000FF0000FF00FFFF00FFFF00FFFF0000FF0000FF00FF
        FF00FFFF00FFFF00FFFF00FFFF0000FF00FFFF00FFFF0000FF00FFFF00FFFF00
        FFFF00FFFF00FFFF0000FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF0000FF0000FF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF0000FF00FFFF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF0000FF00FFFF00FFFF00FF
        FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
  end
  object AutoPanel1: TAutoPanel
    Left = 0
    Top = 39
    Width = 579
    Height = 283
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object dbgRep: TDBGridEh
      Left = 2
      Top = 2
      Width = 575
      Height = 279
      Align = alClient
      DataSource = dsRep
      EditActions = [geaCopyEh, geaSelectAllEh]
      Flat = False
      FooterColor = clInfoBk
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      FooterRowCount = 1
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghRowHighlight]
      ReadOnly = True
      SortLocal = True
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      VertScrollBar.VisibleMode = sbAlwaysShowEh
      OnDblClick = dbgRepDblClick
      OnKeyUp = dbgRepKeyUp
      Columns = <
        item
          EditButtons = <>
          FieldName = 'SUB1_NAME'
          Footer.ValueType = fvtCount
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'SUB2_NAME'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'SUB5_NAME'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'SUB3'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'CENA'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'KOLOTP_BEFORE'
          Footer.ValueType = fvtSum
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'DEBETBEFORE'
          Footer.ValueType = fvtSum
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'KREDITBEFORE'
          Footer.ValueType = fvtSum
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'DEBET_KOLOTP'
          Footer.ValueType = fvtSum
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'DEBET'
          Footer.ValueType = fvtSum
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'KREDIT_KOLOTP'
          Footer.ValueType = fvtSum
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'KREDIT'
          Footer.ValueType = fvtSum
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'KOLOTP_AFTER'
          Footer.ValueType = fvtSum
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'DEBETAFTER'
          Footer.ValueType = fvtSum
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'KREDITAFTER'
          Footer.ValueType = fvtSum
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'SUB1'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'SUB2'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'SUB5'
          Footers = <>
          Visible = False
        end>
    end
  end
  object ActionList1: TActionList
    Images = dmdEx.ImageList1
    Left = 104
    Top = 136
    object actPreview: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      ShortCut = 16471
      Visible = False
    end
    object actCall: TAction
      Caption = 'actCall'
    end
    object actSettings: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      ShortCut = 16465
      OnExecute = actSettingsExecute
    end
    object actDetail: TAction
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      ImageIndex = 9
      ShortCut = 120
      OnExecute = actDetailExecute
    end
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ShortCut = 116
      OnExecute = actRefreshExecute
    end
    object actNotNull: TAction
      Caption = #1058#1086#1083#1100#1082#1086' '#1072#1082#1090#1080#1074#1085#1099#1077
    end
    object actRecalc: TAction
      Caption = #1048#1090#1086#1075#1086
    end
    object actDebug: TAction
      Caption = #1056#1077#1078#1080#1084' '#1086#1090#1083#1072#1076#1082#1080
      OnExecute = actDebugExecute
    end
    object actShowColumnsSum: TAction
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1089#1091#1084#1084#1099
      OnExecute = actShowColumnsSumExecute
    end
    object actShowColumnsKolotp: TAction
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1072
      OnExecute = actShowColumnsKolotpExecute
    end
    object actPartiyaRecount: TAction
      Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1087#1072#1088#1090#1080#1102
      OnExecute = actPartiyaRecountExecute
    end
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
    Left = 136
    Top = 136
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'frmRepSkladBux'
    StorageManager = rpsClientEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      'ActionList1.actShowColumnsKolotp.<P>.Checked'
      'ActionList1.actShowColumnsSum.<P>.Checked'
      'AutoPanel1.dbgRep.<P>.Columns.<ForAllItems>.Width')
    Left = 168
    Top = 136
  end
  object rpsClientEdit: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 200
    Top = 136
  end
  object MainMenu1: TMainMenu
    Left = 104
    Top = 168
    object N1: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      GroupIndex = 10
      object N3: TMenuItem
        Action = actDetail
      end
      object mnuRefresh: TMenuItem
        Action = actRefresh
      end
      object N2: TMenuItem
        Action = actSettings
      end
      object N6: TMenuItem
        Action = actPreview
      end
      object N5: TMenuItem
        Action = actPartiyaRecount
      end
      object N4: TMenuItem
        Action = actDebug
      end
    end
  end
  object qeRep: TQueryExtender
    Query = cdsRep
    KeyField = 'sub1_name'
    Left = 264
    Top = 224
  end
  object sdsRep: TSQLDataSet
    CommandText = 
      'select'#13#10'  sum(r.debetbefore)-minnum(sum(r.debetbefore),sum(kredi' +
      'tbefore)) as debetbefore,'#13#10'  sum(r.kreditbefore)-minnum(sum(r.de' +
      'betbefore),sum(kreditbefore)) as kreditbefore,'#13#10'  sum(debet) as ' +
      'debet,'#13#10'  sum(kredit) as kredit,'#13#10'  sum(r.debetafter)-minnum(sum' +
      '(r.debetafter),sum(kreditafter)) as debetafter,'#13#10'  sum(r.kredita' +
      'fter)-minnum(sum(r.debetafter),sum(kreditafter)) as kreditafter,' +
      #13#10'  '#13#10'  sum(r.debet_kolotp_before-r.kredit_kolotp_before) as kol' +
      'otp_before,'#13#10'  sum(r.debet_kolotp) as debet_kolotp,'#13#10'  sum(r.kre' +
      'dit_kolotp) as kredit_kolotp,'#13#10'  sum(r.debet_kolotp_after-r.kred' +
      'it_kolotp_after) as kolotp_after'#13#10'  '#13#10'from rep_oborotka_pc('#13#10'  :' +
      'id_schet,:dat_from,:dat_to,'#13#10'  :sub1_in,:sub2_in,:sub3_in, :sub4' +
      '_in, :sub5_in,'#13#10'  :sub6_in,:sub7_in,:sub8_in, :sub9_in, :sub10_i' +
      'n) r'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_schet'
        ParamType = ptInput
        Value = 11352
      end
      item
        DataType = ftDate
        Name = 'dat_from'
        ParamType = ptInput
        Value = 36526d
      end
      item
        DataType = ftDate
        Name = 'dat_to'
        ParamType = ptInput
        Value = 36526d
      end
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
        DataType = ftFMTBcd
        Name = 'sub3_in'
        ParamType = ptInput
        Value = 222222222
      end
      item
        DataType = ftInteger
        Name = 'sub4_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sub5_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sub6_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sub7_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sub8_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sub9_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sub10_in'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 264
    Top = 92
  end
  object dspRep: TDataSetProvider
    DataSet = sdsRep
    Options = [poAllowCommandText]
    Left = 264
    Top = 124
  end
  object cdsRep: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DEBETBEFORE'
        DataType = ftFloat
      end
      item
        Name = 'KREDITBEFORE'
        DataType = ftFloat
      end
      item
        Name = 'DEBET'
        DataType = ftFloat
      end
      item
        Name = 'KREDIT'
        DataType = ftFloat
      end
      item
        Name = 'DEBETAFTER'
        DataType = ftFloat
      end
      item
        Name = 'KREDITAFTER'
        DataType = ftFloat
      end
      item
        Name = 'KOLOTP_BEFORE'
        DataType = ftFloat
      end
      item
        Name = 'DEBET_KOLOTP'
        DataType = ftFloat
      end
      item
        Name = 'KREDIT_KOLOTP'
        DataType = ftFloat
      end
      item
        Name = 'KOLOTP_AFTER'
        DataType = ftFloat
      end
      item
        Name = 'CENA'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_schet'
        ParamType = ptInput
        Value = 11352
      end
      item
        DataType = ftDate
        Name = 'dat_from'
        ParamType = ptInput
        Value = 36526d
      end
      item
        DataType = ftDate
        Name = 'dat_to'
        ParamType = ptInput
        Value = 36526d
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
        DataType = ftFMTBcd
        Name = 'sub3_in'
        ParamType = ptInput
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
    ProviderName = 'dspRep'
    StoreDefs = True
    OnCalcFields = cdsRepCalcFields
    Left = 264
    Top = 156
    object cdsRepSUB1_NAME: TStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      DisplayWidth = 50
      FieldName = 'SUB1_NAME'
      Size = 50
    end
    object cdsRepSUB2_NAME: TStringField
      DisplayLabel = #1057#1082#1083#1072#1076
      DisplayWidth = 30
      FieldName = 'SUB2_NAME'
      Size = 50
    end
    object cdsRepSUB5_NAME: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      DisplayWidth = 20
      FieldName = 'SUB5_NAME'
      Size = 50
    end
    object cdsRepSUB3: TFMTBCDField
      DisplayLabel = #1055#1072#1088#1090#1080#1103
      FieldName = 'SUB3'
      Precision = 15
    end
    object cdsRepDEBETBEFORE: TFloatField
      DisplayLabel = #1044#1077#1073#1077#1090' '#1085#1072' '#1085#1072#1095#1072#1083#1086
      FieldName = 'DEBETBEFORE'
      DisplayFormat = '0.0000'
    end
    object cdsRepKREDITBEFORE: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090' '#1085#1072' '#1085#1072#1095#1072#1083#1086
      FieldName = 'KREDITBEFORE'
      DisplayFormat = '0.0000'
    end
    object cdsRepDEBET: TFloatField
      DisplayLabel = #1044#1077#1073#1077#1090
      FieldName = 'DEBET'
      DisplayFormat = '0.0000'
    end
    object cdsRepKREDIT: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090
      FieldName = 'KREDIT'
      DisplayFormat = '0.0000'
    end
    object cdsRepDEBETAFTER: TFloatField
      DisplayLabel = #1044#1077#1073#1077#1090' '#1085#1072' '#1082#1086#1085#1077#1094
      FieldName = 'DEBETAFTER'
      DisplayFormat = '0.0000'
    end
    object cdsRepKREDITAFTER: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090' '#1085#1072' '#1082#1086#1085#1077#1094
      FieldName = 'KREDITAFTER'
      DisplayFormat = '0.0000'
    end
    object cdsRepKOLOTP_BEFORE: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1085#1072' '#1085#1072#1095#1072#1083#1086
      FieldName = 'KOLOTP_BEFORE'
      DisplayFormat = '0.000'
    end
    object cdsRepDEBET_KOLOTP: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1087#1088#1080#1093#1086#1076#1072
      FieldName = 'DEBET_KOLOTP'
      DisplayFormat = '0.000'
    end
    object cdsRepKREDIT_KOLOTP: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1088#1072#1089#1093#1086#1076#1072
      FieldName = 'KREDIT_KOLOTP'
      DisplayFormat = '0.000'
    end
    object cdsRepKOLOTP_AFTER: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1085#1072' '#1082#1086#1085#1077#1094
      FieldName = 'KOLOTP_AFTER'
      DisplayFormat = '0.000'
    end
    object cdsRepSUB1: TIntegerField
      DisplayWidth = 5
      FieldName = 'SUB1'
      Visible = False
    end
    object cdsRepSUB2: TIntegerField
      DisplayWidth = 5
      FieldName = 'SUB2'
      Visible = False
    end
    object cdsRepSUB5: TIntegerField
      FieldName = 'SUB5'
      Visible = False
    end
    object cdsRepCENA: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      FieldKind = fkInternalCalc
      FieldName = 'CENA'
      DisplayFormat = '0.00'
    end
  end
  object dsRep: TDataSource
    DataSet = cdsRep
    Left = 264
    Top = 188
  end
  object sdsSebestRecount: TSQLDataSet
    CommandText = 'NAKLP_SEBEST_PART_RECOUNT_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_SCHET_IN'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DAT_FROM_IN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_TOVAR_IN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_SKLAD_IN'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'ID_PARTIYA_IN'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 300
    Top = 92
  end
end
