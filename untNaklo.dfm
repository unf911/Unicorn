object frmNaklo: TfrmNaklo
  Left = 286
  Top = 124
  BorderStyle = bsDialog
  Caption = #1054#1090#1075#1088#1091#1079#1082#1080' '#1089#1086' '#1089#1082#1083#1072#1076#1072
  ClientHeight = 524
  ClientWidth = 617
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
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnDeactivate = FormDeactivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 411
    Width = 617
    Height = 8
    Cursor = crVSplit
    Align = alTop
    Beveled = True
    ResizeStyle = rsUpdate
  end
  object dbgNaklot: TDBGridEh
    Left = 0
    Top = 419
    Width = 617
    Height = 105
    Align = alClient
    AllowedOperations = [alopInsertEh, alopDeleteEh, alopAppendEh]
    Constraints.MinHeight = 30
    DataSource = dsNaklot
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
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghRowHighlight]
    PopupMenu = PopupMenu2
    SortLocal = True
    SumList.Active = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgNaklotDblClick
    OnKeyDown = dbgNaklotKeyDown
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ID_POS'
        Footer.ValueType = fvtCount
        Footers = <>
        ReadOnly = True
      end
      item
        EditButtons = <>
        FieldName = 'TOVAR'
        Footers = <>
        ReadOnly = True
      end
      item
        EditButtons = <>
        FieldName = 'KOLOTP'
        Footer.ValueType = fvtSum
        Footers = <>
        ReadOnly = True
        Width = 81
      end
      item
        EditButtons = <>
        FieldName = 'SKIDKA'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'CENA'
        Footers = <>
        ReadOnly = True
      end
      item
        EditButtons = <>
        FieldName = 'CENANDS'
        Footers = <>
        ReadOnly = True
      end
      item
        EditButtons = <>
        FieldName = 'SUMA'
        Footer.ValueType = fvtSum
        Footers = <>
        ReadOnly = True
      end
      item
        EditButtons = <>
        FieldName = 'SUMANDS'
        Footers = <>
        ReadOnly = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 617
    Height = 411
    Align = alTop
    BevelOuter = bvNone
    Constraints.MinHeight = 30
    TabOrder = 0
    DesignSize = (
      617
      411)
    object dbgNaklo: TDBGridEh
      Left = 0
      Top = 0
      Width = 532
      Height = 411
      Align = alLeft
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsNaklo
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight]
      PopupMenu = PopupMenu1
      SortLocal = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = dbgNakloDblClick
      OnKeyDown = dbgNakloKeyDown
      Columns = <
        item
          EditButtons = <>
          FieldName = 'ID'
          Footers = <>
          Title.TitleButton = True
          Width = 37
        end
        item
          EditButtons = <>
          FieldName = 'DAT'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1044#1072#1090#1072
          Title.TitleButton = True
          Width = 45
        end
        item
          EditButtons = <>
          FieldName = 'IZG'
          Footers = <>
          ReadOnly = True
          Width = 62
        end
        item
          EditButtons = <>
          FieldName = 'ZAK'
          Footers = <>
          ReadOnly = True
          Width = 89
        end
        item
          EditButtons = <>
          FieldName = 'MANAGER'
          Footers = <>
          ReadOnly = True
          Width = 56
        end
        item
          EditButtons = <>
          FieldName = 'KURS'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1050#1091#1088#1089
          Title.TitleButton = True
          Width = 55
        end
        item
          Checkboxes = True
          EditButtons = <>
          FieldName = 'POSTED'
          Footers = <>
          KeyList.Strings = (
            '1'
            '0')
          ReadOnly = True
          Title.TitleButton = True
          Width = 32
        end
        item
          Checkboxes = True
          EditButtons = <>
          FieldName = 'BLOCKED'
          Footers = <>
          KeyList.Strings = (
            '1'
            '0')
          ReadOnly = True
          Width = 22
        end
        item
          Checkboxes = True
          EditButtons = <>
          FieldName = 'OTGRUGENO'
          Footers = <>
          KeyList.Strings = (
            '1'
            '0')
          NotInKeyListIndex = 0
          ReadOnly = True
          Title.Hint = #1054#1090#1075#1088#1091#1078#1077#1085#1086
          Width = 22
        end
        item
          Checkboxes = True
          EditButtons = <>
          FieldName = 'POLUCHENO'
          Footers = <>
          KeyList.Strings = (
            '1'
            '0')
          NotInKeyListIndex = 0
          ReadOnly = True
          Title.Hint = #1055#1086#1083#1091#1095#1077#1085#1086
          Width = 22
        end
        item
          EditButtons = <>
          FieldName = 'NDS'
          Footers = <>
          ReadOnly = True
          Title.TitleButton = True
          Width = 49
        end
        item
          EditButtons = <>
          FieldName = 'COMMENT'
          Footers = <>
          ReadOnly = True
          Title.TitleButton = True
          Width = 95
        end
        item
          EditButtons = <>
          FieldName = 'TIPCONST'
          Footers = <>
          ReadOnly = True
          Width = 109
        end
        item
          EditButtons = <>
          FieldName = 'SKLAD'
          Footers = <>
          ReadOnly = True
        end
        item
          EditButtons = <>
          FieldName = 'PARENT_ID'
          Footers = <>
          Width = 39
        end
        item
          EditButtons = <>
          FieldName = 'ID_NAKL'
          Footers = <>
          Width = 1
        end>
    end
    object Panel4: TPanel
      Left = 540
      Top = 8
      Width = 71
      Height = 216
      Anchors = [akTop, akRight]
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        71
        216)
      object BitBtn1: TBitBtn
        Left = 0
        Top = 0
        Width = 71
        Height = 33
        Action = actPost
        Anchors = [akLeft, akTop, akRight]
        Caption = #1055#1088#1086#1074#1077#1089#1090#1080
        TabOrder = 0
        TabStop = False
      end
      object btnUnpost: TBitBtn
        Left = 0
        Top = 40
        Width = 71
        Height = 33
        Action = actUnpost
        Anchors = [akLeft, akTop, akRight]
        Caption = #1042#1077#1088#1085#1091#1090#1100
        TabOrder = 1
        TabStop = False
      end
      object BitBtn3: TBitBtn
        Left = 0
        Top = 120
        Width = 71
        Height = 24
        Action = actPreview
        Anchors = [akLeft, akRight, akBottom]
        Caption = #1055#1088#1086#1089#1084#1086#1090#1088
        TabOrder = 2
        TabStop = False
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF00000000000000000000000000000000
          0000000000000000000000000000000000FF00FFFF00FFFF00FFFF00FF000000
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6000000C6C6
          C6000000FF00FFFF000700313100000000000000000000000000000000000000
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
      object BitBtn4: TBitBtn
        Left = -18
        Top = 120
        Width = 73
        Height = 17
        Anchors = [akTop, akRight]
        Caption = #1044#1080#1079#1072#1081#1085#1077#1088
        TabOrder = 3
        Visible = False
      end
      object BitBtn5: TBitBtn
        Left = 0
        Top = 183
        Width = 71
        Height = 25
        Action = actSettings
        Anchors = [akLeft, akRight, akBottom]
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
        TabOrder = 4
        TabStop = False
      end
      object BitBtn7: TBitBtn
        Left = 0
        Top = 151
        Width = 71
        Height = 25
        Action = actRefresh
        Anchors = [akLeft, akRight, akBottom]
        Caption = #1054#1073#1085#1086#1074#1080#1090#1100
        TabOrder = 5
        TabStop = False
        Kind = bkRetry
      end
      object btnBlock: TBitBtn
        Left = 0
        Top = 80
        Width = 71
        Height = 32
        Action = actBlock
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = #1041#1083#1086#1082
        Constraints.MinHeight = 32
        TabOrder = 6
        TabStop = False
      end
    end
  end
  object ActionList1: TActionList
    Left = 456
    Top = 304
    object actSettings: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      ShortCut = 16465
      OnExecute = actSettingsExecute
    end
    object actGrid1ListShow: TAction
      Caption = 'actGrid1ListShow'
      OnExecute = actGrid1ListShowExecute
    end
    object actPostIf: TAction
      Caption = 'actPostIf'
    end
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ShortCut = 116
      OnExecute = actRefreshExecute
    end
    object actGrid2ListShow: TAction
      Caption = 'actGrid2ListShow'
      OnExecute = actGrid2ListShowExecute
    end
    object actPostIf2: TAction
      Caption = 'actPostIf2'
    end
    object actRecalc: TAction
      Caption = #1055#1086#1076#1089#1095#1080#1090#1072#1090#1100
      OnExecute = actRecalcExecute
    end
    object actAutoRecalc: TAction
      Caption = 'actAutoRecalc'
    end
    object actPreview: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      ShortCut = 16471
      OnExecute = actPreviewExecute
    end
    object actPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      ShortCut = 123
    end
    object actSchet: TAction
      Caption = #1048#1079' '#1089#1095#1105#1090#1072
      ShortCut = 120
    end
    object actCalculateSum: TAction
      Caption = 'actCalculateSum'
      OnExecute = actCalculateSumExecute
    end
    object actAfterCutOstatok: TAction
      Caption = #1054#1090#1095#1105#1090' '#1087#1086' '#1086#1089#1090#1072#1090#1082#1072#1084' '#1087#1086#1089#1083#1077' '#1076#1072#1085#1085#1086#1081' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      ShortCut = 16463
      Visible = False
      OnExecute = actAfterCutOstatokExecute
    end
    object actShowDeleted: TAction
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1091#1076#1072#1083#1105#1085#1085#1099#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077
      OnExecute = actShowDeletedExecute
    end
    object actBlock: TAction
      Caption = #1041#1083#1086#1082
      OnExecute = actBlockExecute
    end
    object actOrder: TAction
      Caption = #1059#1087#1086#1088#1103#1076#1086#1095#1080#1090#1100' '#1090#1072#1088#1091
      OnExecute = actOrderExecute
    end
    object actUndeleteNakl: TAction
      Caption = #1042#1077#1088#1085#1091#1090#1100' '#1091#1076#1072#1083#1105#1085#1085#1091#1102
      Visible = False
      OnExecute = actUndeleteNaklExecute
    end
    object actRealPriceOpen: TAction
      Caption = #1060#1072#1082#1090' '#1094#1077#1085#1099
      OnExecute = actRealPriceOpenExecute
    end
    object actRepNakloWeight: TAction
      Caption = #1054#1090#1095#1105#1090' '#1087#1086' '#1074#1077#1089#1091' '#1080' '#1089#1090#1086#1080#1084#1086#1089#1090#1080
      OnExecute = actRepNakloWeightExecute
    end
    object actMakeNaklr: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1088#1072#1089#1093#1086#1076#1085#1091#1102' '#1085#1072' '#1086#1089#1085#1086#1074#1072#1085#1080#1080' '#1086#1090#1075#1088#1091#1079#1082#1080
      OnExecute = actMakeNaklrExecute
    end
    object actMakeSchet: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1089#1095#1105#1090' '#1085#1072' '#1086#1089#1085#1086#1074#1072#1085#1080#1080' '#1086#1090#1075#1088#1091#1079#1082#1080
      OnExecute = actMakeSchetExecute
    end
    object actMakeNakloTop: TAction
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1096#1072#1087#1082#1091' '#1086#1090#1075#1088#1091#1079#1082#1080
      OnExecute = actMakeNakloTopExecute
    end
    object actShowOtpravka: TAction
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1086#1090#1087#1088#1072#1074#1082#1091
      OnExecute = actShowOtpravkaExecute
    end
    object actMakeNaklPerem: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1077' '#1085#1072' '#1086#1089#1085#1086#1074#1072#1085#1080#1080' '#1086#1090#1075#1088#1091#1079#1082#1080
      OnExecute = actMakeNaklPeremExecute
    end
    object actShowNaklr: TAction
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1088#1086#1076#1080#1090#1077#1083#1100#1089#1082#1091#1102' '#1088#1072#1089#1093#1086#1076#1085#1091#1102
      OnExecute = actShowNaklrExecute
    end
    object actShowRepDependNaklo: TAction
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1079#1072#1074#1080#1089#1080#1084#1099#1077' '#1089#1082#1083#1072#1076#1089#1082#1080#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077
      OnExecute = actShowRepDependNakloExecute
    end
    object actUnpost: TAction
      Caption = #1042#1077#1088#1085#1091#1090#1100
      OnExecute = actUnpostExecute
    end
    object actPost: TAction
      Caption = #1055#1088#1086#1074#1077#1089#1090#1080
      OnExecute = actPostExecute
    end
    object actSetColumnValue: TAction
      Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077#1084
      OnExecute = actSetColumnValueExecute
    end
    object actOtgrugeno: TAction
      Caption = #1054#1090#1075#1088#1091#1079#1080#1090#1100
      OnExecute = actOtgrugenoExecute
    end
    object actPolucheno: TAction
      Caption = #1055#1086#1083#1091#1095#1080#1090#1100
      OnExecute = actPoluchenoExecute
    end
  end
  object sdsNaklo: TSQLDataSet
    CommandText = 
      'select'#13#10'  om.id,'#13#10'  om.id_nakl,'#13#10'  om.nalog_nds,'#13#10'  om.id_sklad,' +
      #13#10'  om.dat,'#13#10'  om.posted,'#13#10'  om.id_currency,'#13#10'  om.comment, '#13#10'  ' +
      'om.id_izg,'#13#10'  om.id_zak,'#13#10'  om.id_manager,'#13#10'  om.kurs,'#13#10'  om.nds' +
      ','#13#10'  om.tip,'#13#10'  om.delmarked,'#13#10'  om.id_sklad_to,'#13#10'  om.blocked,'#13 +
      #10'  om.parent_id_nakl,'#13#10'  (select id from NAKLO om2 where om2.id_' +
      'nakl=om.parent_id_nakl) as parent_id,'#13#10'  om.OTGRUGENO,'#13#10'  om.POL' +
      'UCHENO'#13#10'from '#13#10'  NAKLO om'#13#10'where'#13#10'   om.tip in (5,6,103,30)'#13#10'ord' +
      'er by'#13#10'  om.dat, om.id, om.id_nakl'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 392
    Top = 208
    object sdsNakloID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsNakloID: TStringField
      FieldName = 'ID'
    end
    object sdsNakloNALOG_NDS: TFMTBCDField
      FieldName = 'NALOG_NDS'
      Required = True
      Precision = 15
      Size = 2
    end
    object sdsNakloID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
      Required = True
    end
    object sdsNakloDAT: TSQLTimeStampField
      FieldName = 'DAT'
      Required = True
    end
    object sdsNakloPOSTED: TSmallintField
      FieldName = 'POSTED'
      Required = True
    end
    object sdsNakloID_CURRENCY: TSmallintField
      FieldName = 'ID_CURRENCY'
      Required = True
    end
    object sdsNakloCOMMENT: TStringField
      FieldName = 'COMMENT'
      Size = 50
    end
    object sdsNakloID_IZG: TIntegerField
      FieldName = 'ID_IZG'
      Required = True
    end
    object sdsNakloID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
      Required = True
    end
    object sdsNakloID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
      Required = True
    end
    object sdsNakloKURS: TFloatField
      FieldName = 'KURS'
      Required = True
    end
    object sdsNakloNDS: TFMTBCDField
      FieldName = 'NDS'
      Required = True
      Precision = 15
    end
    object sdsNakloTIP: TSmallintField
      FieldName = 'TIP'
      Required = True
    end
    object sdsNakloDELMARKED: TSmallintField
      FieldName = 'DELMARKED'
      Required = True
    end
    object sdsNakloID_SKLAD_TO: TIntegerField
      FieldName = 'ID_SKLAD_TO'
    end
    object sdsNakloBLOCKED: TSmallintField
      FieldName = 'BLOCKED'
      Required = True
    end
    object sdsNakloPARENT_ID_NAKL: TIntegerField
      FieldName = 'PARENT_ID_NAKL'
    end
    object sdsNakloPARENT_ID: TStringField
      FieldName = 'PARENT_ID'
      ProviderFlags = []
    end
    object sdsNakloOTGRUGENO: TSmallintField
      FieldName = 'OTGRUGENO'
      ProviderFlags = []
      Required = True
    end
    object sdsNakloPOLUCHENO: TSmallintField
      FieldName = 'POLUCHENO'
      ProviderFlags = []
    end
  end
  object dsNaklo: TDataSource
    DataSet = cdsNaklo
    Left = 392
    Top = 336
  end
  object dspNaklo: TDataSetProvider
    DataSet = sdsNaklo
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspNakloBeforeUpdateRecord
    Left = 392
    Top = 272
  end
  object cdsNaklo: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_NAKL'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ID'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NALOG_NDS'
        Attributes = [faRequired]
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'ID_SKLAD'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DAT'
        Attributes = [faRequired]
        DataType = ftTimeStamp
      end
      item
        Name = 'POSTED'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'ID_CURRENCY'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'COMMENT'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ID_IZG'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ID_ZAK'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ID_MANAGER'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'KURS'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'NDS'
        Attributes = [faRequired]
        DataType = ftFMTBcd
        Precision = 15
        Size = 8
      end
      item
        Name = 'TIP'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'DELMARKED'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'ID_SKLAD_TO'
        DataType = ftInteger
      end
      item
        Name = 'BLOCKED'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'PARENT_ID_NAKL'
        DataType = ftInteger
      end
      item
        Name = 'PARENT_ID'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'OTGRUGENO'
        DataType = ftSmallint
      end
      item
        Name = 'POLUCHENO'
        DataType = ftSmallint
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspNaklo'
    StoreDefs = True
    AfterInsert = cdsNakloAfterInsert
    BeforeScroll = cdsNakloBeforeScroll
    OnReconcileError = cdsNakloReconcileError
    Left = 392
    Top = 304
    object cdsNakloID_NAKL: TIntegerField
      DisplayLabel = #1048#1076#1077#1085#1090
      FieldName = 'ID_NAKL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsNakloID_IZG: TIntegerField
      FieldName = 'ID_IZG'
      Required = True
    end
    object cdsNakloID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
      Required = True
    end
    object cdsNakloID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
      Required = True
    end
    object cdsNakloID_CURRENCY: TSmallintField
      FieldName = 'ID_CURRENCY'
      Required = True
    end
    object cdsNakloNALOG_NDS: TFMTBCDField
      FieldName = 'NALOG_NDS'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdsNakloNDS: TFMTBCDField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'NDS'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object cdsNakloID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
      Required = True
    end
    object cdsNakloPOSTED: TSmallintField
      DisplayLabel = #1055#1088#1086#1074#1077#1076#1077#1085#1086
      FieldName = 'POSTED'
      Required = True
    end
    object cdsNakloCOMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'COMMENT'
      Size = 50
    end
    object cdsNakloIZG: TStringField
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
    object cdsNakloZAK: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      FieldKind = fkLookup
      FieldName = 'ZAK'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_ZAK'
      Size = 50
      Lookup = True
    end
    object cdsNakloMANAGER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      FieldKind = fkLookup
      FieldName = 'MANAGER'
      LookupDataSet = dmdEx.cdsManager
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_MANAGER'
      Size = 30
      Lookup = True
    end
    object cdsNakloDAT: TSQLTimeStampField
      FieldName = 'DAT'
      Required = True
      DisplayFormat = 'dd.mm.yy'
    end
    object cdsNakloKURS: TFloatField
      FieldName = 'KURS'
      DisplayFormat = '0.0000'
    end
    object cdsNakloTIP: TSmallintField
      FieldName = 'TIP'
      Required = True
    end
    object cdsNakloDELMARKED: TSmallintField
      FieldName = 'DELMARKED'
      Required = True
    end
    object cdsNakloTIPCONST: TStringField
      DisplayLabel = #1058#1080#1087
      FieldKind = fkLookup
      FieldName = 'TIPCONST'
      LookupDataSet = dmdEx.cdsNakloTip
      LookupKeyFields = 'ID_FIELD'
      LookupResultField = 'FIELD_VALUE'
      KeyFields = 'TIP'
      Lookup = True
    end
    object cdsNakloID: TStringField
      DisplayLabel = #8470#1085#1072#1082#1083
      FieldName = 'ID'
      Size = 10
    end
    object cdsNakloSKLAD: TStringField
      DisplayLabel = #1057#1082#1083#1072#1076
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'SKLAD'
      LookupDataSet = dmdEx.cdsSklads
      LookupKeyFields = 'OID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_SKLAD'
      Size = 50
      Lookup = True
    end
    object cdsNakloSKLAD_TO: TStringField
      DisplayLabel = #1057#1082#1083#1072#1076' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'SKLAD_TO'
      LookupDataSet = dmdEx.cdsSklads
      LookupKeyFields = 'OID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_SKLAD_TO'
      Size = 50
      Lookup = True
    end
    object cdsNakloID_SKLAD_TO: TIntegerField
      DefaultExpression = '0'
      FieldName = 'ID_SKLAD_TO'
    end
    object cdsNakloBLOCKED: TSmallintField
      DisplayLabel = #1041#1083#1086#1082
      FieldName = 'BLOCKED'
      Required = True
    end
    object cdsNakloPARENT_ID_NAKL: TIntegerField
      FieldName = 'PARENT_ID_NAKL'
    end
    object cdsNakloPARENT_ID: TStringField
      DisplayLabel = #8470#1088#1072#1089#1093' '#1085#1072#1082#1083
      DisplayWidth = 6
      FieldName = 'PARENT_ID'
      ProviderFlags = []
    end
    object cdsNakloOTGRUGENO: TSmallintField
      DisplayLabel = #1054#1090#1075#1088#1091#1078#1077#1085#1086
      FieldName = 'OTGRUGENO'
      ProviderFlags = []
    end
    object cdsNakloPOLUCHENO: TSmallintField
      DisplayLabel = #1055#1086#1083#1091#1095#1077#1085#1086
      FieldName = 'POLUCHENO'
      ProviderFlags = []
    end
  end
  object sdsPost: TSQLDataSet
    CommandText = 'NAKLO_POST_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_NAKL'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'ID_SCHET'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 456
    Top = 208
  end
  object sdsUnpost: TSQLDataSet
    CommandText = 'NAKLO_UNPOST_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_nakl'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = dmdEx.scUchet
    Left = 456
    Top = 240
  end
  object MainMenu1: TMainMenu
    Left = 456
    Top = 272
    object N1: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      GroupIndex = 10
      object mnuRefresh: TMenuItem
        Action = actRefresh
      end
      object N2: TMenuItem
        Action = actSettings
      end
      object N3: TMenuItem
        Action = actAfterCutOstatok
      end
      object N11: TMenuItem
        Action = actRepNakloWeight
      end
      object N6: TMenuItem
        Action = actPreview
      end
      object N7: TMenuItem
        Action = actShowDeleted
      end
      object N8: TMenuItem
        Action = actUndeleteNakl
      end
      object N15: TMenuItem
        Action = actMakeNakloTop
      end
      object N16: TMenuItem
        Action = actRealPriceOpen
      end
      object N18: TMenuItem
        Action = actShowOtpravka
      end
      object N23: TMenuItem
        Action = actShowNaklr
      end
      object N19: TMenuItem
        Action = actMakeSchet
      end
      object N20: TMenuItem
        Action = actMakeNaklr
      end
      object N13: TMenuItem
        Action = actOtgrugeno
      end
      object N21: TMenuItem
        Action = actPolucheno
      end
    end
  end
  object qeNaklo: TQueryExtender
    SlaveQueryExtender = qeNaklot
    Query = cdsNaklo
    KeyField = 'id_nakl'
    Left = 392
    Top = 176
  end
  object PopupMenu1: TPopupMenu
    Left = 424
    Top = 240
    object N5: TMenuItem
      Action = actAfterCutOstatok
    end
    object N10: TMenuItem
      Action = actRepNakloWeight
    end
    object N9: TMenuItem
      Action = actRealPriceOpen
    end
    object N4: TMenuItem
      Action = actMakeNaklr
    end
    object N12: TMenuItem
      Action = actMakeSchet
    end
    object N22: TMenuItem
      Action = actMakeNaklPerem
    end
    object N14: TMenuItem
      Action = actMakeNakloTop
    end
    object N17: TMenuItem
      Action = actShowOtpravka
    end
    object N24: TMenuItem
      Action = actShowNaklr
    end
    object N25: TMenuItem
      Action = actShowRepDependNaklo
    end
  end
  object sdsRepNaklo: TSQLDataSet
    CommandText = 
      'select'#13#10'  id_tovar,id_tara,'#13#10'  nomer_tary,kolotp,'#13#10'  kolbuxt,tip' +
      ','#13#10'  kolotp_itog,'#13#10'  id_tara_itog,'#13#10'  nomer_tary_itog,'#13#10'  id_izg' +
      '_itog,'#13#10'  comment,'#13#10'  prim,'#13#10'  tip2'#13#10'from'#13#10'  rep_naklo_pc(:id_na' +
      'kl)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'id_nakl'
        ParamType = ptInput
        Value = '0'
      end>
    SQLConnection = dmdEx.scUchet
    Left = 488
    Top = 208
  end
  object frRepNaklo: TfrxReport
    Version = '3.23.7'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38993.456650069400000000
    ReportOptions.LastChange = 38995.507740185190000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Band3OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Band3, Engine do begin'
      '    {Set(<TIP2>, '#39#1085#1077#1080#1079#1074#1077#1089#1090#1085#1086#39');'
      '    if <frDBDataSet1."TIP"> = 0 then begin'
      '       Set(<TIP2>, '#39#1085#1077#1090' '#1082#1072#1073#1077#1083#1103#39') ;'
      '    end;'
      '    if <frDBDataSet1."TIP"> = 1 then begin'
      '       Set(<TIP2>, '#39#1087#1088#1080#1093#1086#1076#39');'
      '    end;'
      '    if (<frDBDataSet1."TIP"> = 2) or'
      '     (<frDBDataSet1."TIP"> = 8) or'
      '     (<frDBDataSet1."TIP"> = 11) or'
      '     (<frDBDataSet1."TIP"> = 14) then begin'
      '      Set(<TIP2>,'#39#1094#1077#1083#1080#1082#1086#1084#39');'
      '    end;'
      '    if (<frDBDataSet1."TIP"> = 3) or'
      '     (<frDBDataSet1."TIP"> = 9) or'
      '     (<frDBDataSet1."TIP"> = 12) or'
      '     (<frDBDataSet1."TIP"> = 15)  then begin'
      '       Set(<TIP2>,'#39#1089#1084#1086#1090#1082#1072#39');'
      '    end;'
      '    if (<frDBDataSet1."TIP"> = 4) or'
      '     (<frDBDataSet1."TIP"> = 10) or'
      '     (<frDBDataSet1."TIP"> = 13) or'
      '     (<frDBDataSet1."TIP"> = 16) then begin'
      '       Set(<TIP2>,'#39#1085#1072#1084#1086#1090#1082#1072#39');'
      '    end;'
      '    if (<frDBDataSet1."TIP"> = 5) then begin'
      '       Set(<TIP2>,'#39#1080#1079#1083#1080#1096#1077#1082#39');'
      '    end;}'
      '  end;'
      'end;'
      ''
      'procedure Memo33OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo33, Engine do begin'
      '    if ([UPPERCASE('#39#1062#1045#1051#1048#1050#1054#1052#39'{<TIP2>})]='#39#1062#1045#1051#1048#1050#1054#1052#39') then begin'
      '      { Set(<PRIM>, <frDBDataSet1."NOMER_TARY">);}'
      '    end;'
      '    {'
      '    if ([UPPERCASE(<"TIP2">)]='#39#1057#1052#1054#1058#1050#1040#39') then begin'
      '       Set(<PRIM>, '#39'c '#39'+'
      '        [FORMATFLOAT('#39'0.000'#39' , <frDBDataSet1."KOLOTP_ITOG">)]+'
      '        '#39' '#39'+ <frDBDataSet1."nomer_tary_itog">);'
      '    end;'
      '    if ([UPPERCASE(<"TIP2">)]='#39#1053#1040#1052#1054#1058#1050#1040#39') then begin'
      '      Set(<PRIM>, '#39'c '#39'+'
      '        [FORMATFLOAT('#39'0.000'#39', <frDBDataSet1."KOLOTP_ITOG">)]+'
      '        '#39' '#39'+ <frDBDataSet1."nomer_tary_itog">);'
      '    end;'
      '    if ([UPPERCASE(<"TARA">)]='#39' '#1041#1059#1061#1058#1040#39') then begin'
      
        '      Set(<PRIM>, <PRIM> + '#39' '#39' + [COPY(<frDBDataSet1."IZG_ITOG">' +
        ',0,4)]);'
      '    end;'
      '    }'
      '  end'
      ''
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 488
    Top = 336
    Datasets = <
      item
        DataSet = frDBDataSet1
        DataSetName = 'frDBDataSet1'
      end
      item
        DataSet = frdNaklo
        DataSetName = 'frdNaklo'
      end>
    Variables = <
      item
        Name = ' All'
        Value = Null
      end
      item
        Name = 'TIP2'
        Value = Null
      end
      item
        Name = 'PRIM'
        Value = Null
      end>
    Style = <>
    object TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Bin = 65535
      BinOtherPages = 65535
      object ReportTitle1: TfrxReportTitle
        Height = 74.000000000000000000
        Top = 16.000000000000000000
        Width = 718.110700000000000000
        object Memo15: TfrxMemoView
          Left = 114.000000000000000000
          Top = 4.000000000000000000
          Width = 140.000000000000000000
          Height = 22.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1108#1056#187#1056#176#1056#1169#1056#1029#1056#176#1057#1039' '#1074#8222#8211)
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 258.000000000000000000
          Top = 4.000000000000000000
          Width = 96.000000000000000000
          Height = 24.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdNaklo."ID"]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 254.000000000000000000
          Top = 28.000000000000000000
          Width = 96.000000000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 1.500000000000000000
        end
        object Memo17: TfrxMemoView
          Left = 366.000000000000000000
          Top = 4.000000000000000000
          Width = 160.000000000000000000
          Height = 22.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119' '#1056#160' '#1056#1115' '#1056#1119' '#1056#1032' '#1056#1038' '#1056#1113)
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 526.000000000000000000
          Top = 4.000000000000000000
          Width = 120.000000000000000000
          Height = 22.000000000000000000
          DisplayFormat.FormatStr = 'd mmm yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdNaklo."DAT"]')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Left = 530.000000000000000000
          Top = 28.000000000000000000
          Width = 112.000000000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 1.500000000000000000
        end
        object Memo19: TfrxMemoView
          Left = 126.000000000000000000
          Top = 48.000000000000000000
          Width = 240.000000000000000000
          Height = 18.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frdNaklo."ZAK"]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = -2.000000000000000000
          Top = 48.000000000000000000
          Width = 96.000000000000000000
          Height = 18.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#187#1057#1107#1057#8225#1056#176#1057#8218#1056#181#1056#187#1057#1034)
          ParentFont = False
        end
        object Line3: TfrxLineView
          Left = 118.000000000000000000
          Top = 68.000000000000000000
          Width = 264.000000000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 1.500000000000000000
        end
        object Memo21: TfrxMemoView
          Left = 410.000000000000000000
          Top = 48.000000000000000000
          Width = 96.000000000000000000
          Height = 18.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1114#1056#181#1056#1029#1056#181#1056#1169#1056#182#1056#181#1057#1026)
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 518.000000000000000000
          Top = 48.000000000000000000
          Width = 136.000000000000000000
          Height = 18.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdNaklo."MANAGER"]')
          ParentFont = False
        end
        object Line4: TfrxLineView
          Left = 518.000000000000000000
          Top = 68.000000000000000000
          Width = 136.000000000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 1.500000000000000000
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 18.000000000000000000
        Top = 416.000000000000000000
        Width = 718.110700000000000000
      end
      object Band1: TfrxPageHeader
        Height = 38.000000000000000000
        Top = 131.000000000000000000
        Width = 718.110700000000000000
        object Memo26: TfrxMemoView
          Left = 46.000000000000000000
          Width = 200.000000000000000000
          Height = 38.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 246.000000000000000000
          Width = 32.000000000000000000
          Height = 38.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#8226#1056#1169'.'
            #1056#1105#1056#183#1056#1112'.')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 474.000000000000000000
          Width = 84.000000000000000000
          Height = 38.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1118#1056#176#1057#1026#1056#176)
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 558.000000000000000000
          Width = 124.000000000000000000
          Height = 38.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1105#1056#1112#1056#181#1057#8225#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Left = 278.000000000000000000
          Width = 64.000000000000000000
          Height = 38.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109)
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 342.000000000000000000
          Width = 40.000000000000000000
          Height = 38.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187'.'
            #1056#177#1057#1107#1057#8230#1057#8218)
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 382.000000000000000000
          Width = 92.000000000000000000
          Height = 38.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1118#1056#1105#1056#1111' '#1056#1109#1057#8218#1056#1110#1057#1026#1057#1107#1056#183#1056#1108#1056#1105)
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Left = -2.000000000000000000
          Width = 48.000000000000000000
          Height = 38.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#1119#1056#1109#1057#1026#1057#1039#1056#1169#1056#1109#1056#1108
            #1056#1111#1056#1109#1056#1110#1057#1026#1057#1107#1056#183#1056#1108#1056#1105)
          ParentFont = False
        end
      end
      object Band3: TfrxMasterData
        Height = 18.000000000000000000
        Top = 250.000000000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'Band3OnBeforePrint'
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        DataSet = frDBDataSet1
        DataSetName = 'frDBDataSet1'
        RowCount = 0
        Stretched = True
        object Memo27: TfrxMemoView
          Left = 46.000000000000000000
          Width = 200.000000000000000000
          Height = 18.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frDBDataSet1."TOVAR"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 246.000000000000000000
          Width = 32.000000000000000000
          Height = 18.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frDBDataSet1."EDIZ"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 474.000000000000000000
          Width = 84.000000000000000000
          Height = 18.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frDBDataSet1."TARA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 558.000000000000000000
          Width = 124.000000000000000000
          Height = 18.000000000000000000
          OnBeforePrint = 'Memo33OnBeforePrint'
          StretchMode = smMaxHeight
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frDBDataSet1."PRIM"]')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Left = 278.000000000000000000
          Width = 64.000000000000000000
          Height = 18.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frDBDataSet1."KOLOTP"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 342.000000000000000000
          Width = 40.000000000000000000
          Height = 18.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frDBDataSet1."KOLBUXT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 382.000000000000000000
          Width = 92.000000000000000000
          Height = 18.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frDBDataSet1."TIP2"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Left = -2.000000000000000000
          Width = 48.000000000000000000
          Height = 18.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
      end
      object Band4: TfrxFooter
        Height = 26.000000000000000000
        Top = 309.000000000000000000
        Width = 718.110700000000000000
        object Memo42: TfrxMemoView
          Left = 66.000000000000000000
          Top = 8.000000000000000000
          Width = 96.000000000000000000
          Height = 18.000000000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1057#8218#1056#1111#1057#1107#1057#1027#1057#8218#1056#1105#1056#187)
          ParentFont = False
        end
      end
    end
  end
  object frDBDataSet1: TfrxDBDataset
    UserName = 'frDBDataSet1'
    CloseDataSource = False
    DataSet = cdsRepNaklo
    Left = 488
    Top = 304
  end
  object dspRepNaklo: TDataSetProvider
    DataSet = sdsRepNaklo
    Left = 488
    Top = 240
  end
  object cdsRepNaklo: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_nakl'
        ParamType = ptInput
        Value = 3788
      end>
    ProviderName = 'dspRepNaklo'
    Left = 488
    Top = 272
    object cdsRepNakloNOMER_TARY: TStringField
      FieldName = 'NOMER_TARY'
      Size = 30
    end
    object cdsRepNakloKOLOTP: TFMTBCDField
      FieldName = 'KOLOTP'
      Precision = 15
    end
    object cdsRepNakloKOLBUXT: TIntegerField
      FieldName = 'KOLBUXT'
    end
    object cdsRepNakloTIP: TIntegerField
      FieldName = 'TIP'
    end
    object cdsRepNakloKOLOTP_ITOG: TFMTBCDField
      FieldName = 'KOLOTP_ITOG'
      Precision = 15
    end
    object cdsRepNakloNOMER_TARY_ITOG: TStringField
      FieldName = 'NOMER_TARY_ITOG'
      Size = 30
    end
    object cdsRepNakloID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
    end
    object cdsRepNakloID_TARA: TIntegerField
      FieldName = 'ID_TARA'
    end
    object cdsRepNakloID_TARA_ITOG: TIntegerField
      FieldName = 'ID_TARA_ITOG'
    end
    object cdsRepNakloID_IZG_ITOG: TIntegerField
      FieldName = 'ID_IZG_ITOG'
    end
    object cdsRepNakloTOVAR: TStringField
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'TOVAR'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_TOVAR'
      Size = 50
      Lookup = True
    end
    object cdsRepNakloEDIZ: TStringField
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'EDIZ'
      LookupDataSet = dmdEx.cdsTovar
      LookupKeyFields = 'ID'
      LookupResultField = 'EDIZ'
      KeyFields = 'ID_TOVAR'
      Size = 50
      Lookup = True
    end
    object cdsRepNakloTARA: TStringField
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'TARA'
      LookupDataSet = dmdEx.cdsTara
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_TARA'
      Size = 50
      Lookup = True
    end
    object cdsRepNakloTARA_ITOG: TStringField
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'TARA_ITOG'
      LookupDataSet = dmdEx.cdsTara
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_TARA_ITOG'
      Size = 50
      Lookup = True
    end
    object cdsRepNakloIZG_ITOG: TStringField
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'IZG_ITOG'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_IZG_ITOG'
      Size = 50
      Lookup = True
    end
    object cdsRepNakloCOMMENT: TStringField
      FieldName = 'COMMENT'
      Size = 50
    end
    object cdsRepNakloPRIM: TStringField
      FieldName = 'PRIM'
      Size = 100
    end
    object cdsRepNakloTIP2: TStringField
      FieldName = 'TIP2'
      Size = 50
    end
  end
  object sdsDelmark: TSQLDataSet
    CommandText = 'NAKLO_DELMARK_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_NAKL'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 456
    Top = 176
  end
  object sdsNaklot: TSQLDataSet
    CommandText = 
      'select '#13#10'  d.id_nakld,'#13#10'  d.cena,'#13#10'  d.id_nakl,'#13#10'  d.id_pos,'#13#10'  ' +
      'd.id_tovar,'#13#10'  d.kodcn,'#13#10'  d.kolotp,'#13#10'  d.skidka'#13#10'from '#13#10'  NAKLO' +
      'T d '#13#10'where '#13#10'  d.id_nakl=:id_nakl'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_nakl'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 312
    Top = 208
    object sdsNaklotID_NAKLD: TIntegerField
      FieldName = 'ID_NAKLD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsNaklotCENA: TFMTBCDField
      FieldName = 'CENA'
      Precision = 15
    end
    object sdsNaklotID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      Required = True
    end
    object sdsNaklotID_POS: TIntegerField
      FieldName = 'ID_POS'
      Required = True
    end
    object sdsNaklotID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
      Required = True
    end
    object sdsNaklotKODCN: TSmallintField
      FieldName = 'KODCN'
    end
    object sdsNaklotKOLOTP: TFMTBCDField
      FieldName = 'KOLOTP'
      Precision = 15
    end
    object sdsNaklotSKIDKA: TFMTBCDField
      FieldName = 'SKIDKA'
      Precision = 15
      Size = 2
    end
  end
  object dspNaklot: TDataSetProvider
    DataSet = sdsNaklot
    UpdateMode = upWhereKeyOnly
    Left = 312
    Top = 272
  end
  object cdsNaklot: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_NAKLD'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CENA'
        DataType = ftFMTBcd
        Precision = 15
        Size = 8
      end
      item
        Name = 'ID_NAKL'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ID_POS'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ID_TOVAR'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'KODCN'
        DataType = ftSmallint
      end
      item
        Name = 'KOLOTP'
        DataType = ftFMTBcd
        Precision = 15
        Size = 8
      end
      item
        Name = 'SKIDKA'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end>
    IndexDefs = <>
    IndexFieldNames = 'ID_NAKL;id_pos'
    MasterFields = 'ID_NAKL'
    MasterSource = dsNaklo
    PacketRecords = 0
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_NAKL'
        ParamType = ptInput
        Value = 258
      end>
    ProviderName = 'dspNaklot'
    StoreDefs = True
    BeforeInsert = cdsNaklotBeforeInsert
    AfterInsert = cdsNaklotAfterInsert
    BeforeScroll = cdsNaklotBeforeScroll
    OnCalcFields = cdsNaklotCalcFields
    OnReconcileError = cdsNaklotReconcileError
    Left = 312
    Top = 304
    object cdsNaklotID_NAKLD: TIntegerField
      FieldName = 'ID_NAKLD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsNaklotCENA: TFMTBCDField
      DisplayLabel = #1062#1077#1085#1072
      DisplayWidth = 9
      FieldName = 'CENA'
      DisplayFormat = '0.00'
      Precision = 15
    end
    object cdsNaklotID_NAKL: TIntegerField
      DisplayWidth = 1
      FieldName = 'ID_NAKL'
      Required = True
    end
    object cdsNaklotID_POS: TIntegerField
      DisplayLabel = #8470#1087#1086#1079
      FieldName = 'ID_POS'
      Required = True
    end
    object cdsNaklotID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
      Required = True
    end
    object cdsNaklotKODCN: TSmallintField
      FieldName = 'KODCN'
    end
    object cdsNaklotKOLOTP: TFMTBCDField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'KOLOTP'
      DisplayFormat = '0.000'
      Precision = 15
    end
    object cdsNaklotSKIDKA: TFMTBCDField
      DisplayLabel = #1057#1082#1080#1076#1082#1072
      DisplayWidth = 4
      FieldName = 'SKIDKA'
      OnChange = cdsNaklotSKIDKAChange
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsNaklotTOVAR: TStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      FieldKind = fkLookup
      FieldName = 'TOVAR'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_TOVAR'
      Size = 50
      Lookup = True
    end
    object cdsNaklotCENANDS: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1089' '#1053#1044#1057
      DisplayWidth = 9
      FieldKind = fkInternalCalc
      FieldName = 'CENANDS'
      DisplayFormat = '0.00'
    end
    object cdsNaklotSUMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 9
      FieldKind = fkInternalCalc
      FieldName = 'SUMA'
      DisplayFormat = '0.00'
    end
    object cdsNaklotSUMANDS: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1089' '#1053#1044#1057
      DisplayWidth = 9
      FieldKind = fkInternalCalc
      FieldName = 'SUMANDS'
      DisplayFormat = '0.00'
    end
  end
  object dsNaklot: TDataSource
    DataSet = cdsNaklot
    Left = 312
    Top = 336
  end
  object qeNaklot: TQueryExtender
    Query = cdsNaklot
    KeyField = 'id_nakld'
    Left = 312
    Top = 176
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmNaklo'
    StorageManager = rpsClientEdit
    StoredProps.Strings = (
      'dbgNaklot.<P>.Columns.<ForAllItems>.Width'
      'Panel2.<P>.Height'
      'Panel2.dbgNaklo.<P>.Columns.<ForAllItems>.Width')
    Left = 312
    Top = 144
  end
  object rpsClientEdit: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 344
    Top = 144
  end
  object UnfFilter1: TUnfFilter
    DBGridEh = dbgNaklo
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
    Left = 312
    Top = 112
  end
  object UnfFilter2: TUnfFilter
    DBGridEh = dbgNaklot
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
    Left = 344
    Top = 112
  end
  object PopupMenu2: TPopupMenu
    Left = 424
    Top = 272
    object N26: TMenuItem
      Action = actSetColumnValue
    end
  end
  object sdsRepNakloWeight: TSQLDataSet
    CommandText = 
      'select'#13#10'  om.id_nakl,om.id,ot.id_pos,ot.id_nakld,ot.id_tovar,ot.' +
      'kolotp,'#13#10'  t.weight,'#13#10'  weight_total,'#13#10'  cena_grn,'#13#10'  sum_grn,'#13#10 +
      '  om.nalog_nds'#13#10'  id_tara,'#13#10'  tip,'#13#10'  dat,id_izg,id_zak,id_manag' +
      'er'#13#10'from'#13#10'  naklo om '#13#10'     inner join naklot ot on om.id_nakl=o' +
      't.id_nakl'#13#10'     inner join tovar t on t.oid=ot.id_tovar'#13#10'where '#13 +
      #10'  om.id_nakl=:id_nakl'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_nakl'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 520
    Top = 208
  end
  object dspRepNakloWeight: TDataSetProvider
    DataSet = sdsRepNakloWeight
    Left = 520
    Top = 240
  end
  object cdsRepNakloWeight: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_nakl'
        ParamType = ptInput
        Value = 3788
      end>
    ProviderName = 'dspRepWeightCost'
    Left = 520
    Top = 272
    object StringField1: TStringField
      FieldName = 'NOMER_TARY'
      Size = 30
    end
    object FMTBCDField1: TFMTBCDField
      FieldName = 'KOLOTP'
      Precision = 15
    end
    object IntegerField1: TIntegerField
      FieldName = 'KOLBUXT'
    end
    object IntegerField2: TIntegerField
      FieldName = 'TIP'
    end
    object FMTBCDField2: TFMTBCDField
      FieldName = 'KOLOTP_ITOG'
      Precision = 15
    end
    object StringField2: TStringField
      FieldName = 'NOMER_TARY_ITOG'
      Size = 30
    end
    object IntegerField3: TIntegerField
      FieldName = 'ID_TOVAR'
    end
    object IntegerField4: TIntegerField
      FieldName = 'ID_TARA'
    end
    object IntegerField5: TIntegerField
      FieldName = 'ID_TARA_ITOG'
    end
    object IntegerField6: TIntegerField
      FieldName = 'ID_IZG_ITOG'
    end
    object StringField3: TStringField
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'TOVAR'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_TOVAR'
      Size = 50
      Lookup = True
    end
    object StringField4: TStringField
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'EDIZ'
      LookupDataSet = dmdEx.cdsTovar
      LookupKeyFields = 'ID'
      LookupResultField = 'EDIZ'
      KeyFields = 'ID_TOVAR'
      Size = 50
      Lookup = True
    end
    object StringField5: TStringField
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'TARA'
      LookupDataSet = dmdEx.cdsTara
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_TARA'
      Size = 50
      Lookup = True
    end
    object StringField6: TStringField
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'TARA_ITOG'
      LookupDataSet = dmdEx.cdsTara
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_TARA_ITOG'
      Size = 50
      Lookup = True
    end
    object StringField7: TStringField
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'IZG_ITOG'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_IZG_ITOG'
      Size = 50
      Lookup = True
    end
  end
  object sdsMakeNaklr: TSQLDataSet
    CommandText = 'NAKLO_MAKE_NAKLR_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_NAKL_IN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_NAKL'
        ParamType = ptOutput
        Size = 4
      end>
    SQLConnection = dmdEx.scUchet
    Left = 488
    Top = 176
  end
  object sdsMakeSchet: TSQLDataSet
    CommandText = 'NAKLO_MAKE_SCHET_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_NAKL_IN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_NAKL'
        ParamType = ptOutput
        Size = 4
      end>
    SQLConnection = dmdEx.scUchet
    Left = 520
    Top = 176
  end
  object sdsMakeNaklPeremBux: TSQLDataSet
    CommandText = 'NAKLO_MAKE_NAKL_PEREM_BUX_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_NAKL_IN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_NAKL'
        ParamType = ptOutput
        Size = 4
      end>
    SQLConnection = dmdEx.scUchet
    Left = 488
    Top = 144
  end
  object frdNaklo: TfrxDBDataset
    UserName = 'frdNaklo'
    CloseDataSource = False
    DataSource = dsNaklo
    Left = 520
    Top = 304
  end
  object sdsOtgruzit: TSQLDataSet
    CommandText = 'NAKLO_OTGRUZIT_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_NAKL'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 456
    Top = 144
  end
  object sdsPoluchit: TSQLDataSet
    CommandText = 'NAKLO_POLUCHIT_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_NAKL'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 456
    Top = 112
  end
end
