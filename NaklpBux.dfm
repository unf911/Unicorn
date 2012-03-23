object frmNaklpBux: TfrmNaklpBux
  Left = 628
  Top = 266
  BorderStyle = bsDialog
  Caption = #1055#1088#1080#1093#1086#1076#1085#1099#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077
  ClientHeight = 406
  ClientWidth = 598
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
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 225
    Width = 598
    Height = 8
    Cursor = crVSplit
    Align = alTop
    Beveled = True
    ResizeStyle = rsUpdate
  end
  object dbgNaklot: TDBGridEh
    Left = 0
    Top = 233
    Width = 598
    Height = 173
    Align = alClient
    AllowedOperations = [alopInsertEh, alopDeleteEh, alopAppendEh]
    Anchors = []
    DataSource = dsNaklot
    EditActions = [geaCopyEh, geaPasteEh]
    Flat = False
    FooterColor = clInfoBk
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight]
    PopupMenu = PopupMenu2
    ReadOnly = True
    SortLocal = True
    SumList.Active = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    VertScrollBar.VisibleMode = sbAlwaysShowEh
    OnDblClick = dbgNaklotDblClick
    OnKeyDown = dbgNaklotKeyDown
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ID_POS'
        Footer.ValueType = fvtCount
        Footers = <>
        Width = 37
      end
      item
        EditButtons = <>
        FieldName = 'TOVAR'
        Footers = <>
        Width = 250
      end
      item
        EditButtons = <>
        FieldName = 'KOLOTP'
        Footer.ValueType = fvtSum
        Footers = <>
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
        Width = 58
      end
      item
        EditButtons = <>
        FieldName = 'CENANDS'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'SUMA'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'SUMANDS'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'PARENT_ID'
        Footers = <>
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 598
    Height = 225
    Align = alTop
    BevelOuter = bvNone
    Constraints.MinHeight = 225
    TabOrder = 0
    DesignSize = (
      598
      225)
    object dbgNaklo: TDBGridEh
      Left = 1
      Top = 8
      Width = 503
      Height = 209
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsNaklo
      EditActions = [geaCopyEh, geaSelectAllEh]
      Flat = False
      FooterColor = clInfoBk
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight]
      PopupMenu = PopupMenu1
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      VertScrollBar.VisibleMode = sbAlwaysShowEh
      OnDblClick = dbgNakloDblClick
      OnKeyDown = dbgNakloKeyDown
      OnTitleBtnClick = dbgNakloTitleBtnClick
      OnTitleClick = dbgNakloTitleClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'ID'
          Footer.ValueType = fvtCount
          Footers = <>
          Title.TitleButton = True
          Width = 37
        end
        item
          EditButtons = <>
          FieldName = 'DAT'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072
          Title.TitleButton = True
          Width = 45
        end
        item
          EditButtons = <>
          FieldName = 'IZG'
          Footers = <>
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'ZAK'
          Footers = <>
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'MANAGER'
          Footers = <>
          Width = 56
        end
        item
          Checkboxes = True
          EditButtons = <>
          FieldName = 'POSTED'
          Footers = <>
          KeyList.Strings = (
            '1'
            '0')
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
          Width = 22
        end
        item
          EditButtons = <>
          FieldName = 'COMMENT'
          Footers = <>
          Title.TitleButton = True
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'SKLAD'
          Footers = <>
          Width = 1
        end
        item
          EditButtons = <>
          FieldName = 'CURRENCY_TO'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'NALOG_NDS'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'KURS'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'NDS'
          Footer.ValueType = fvtSum
          Footers = <>
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'ZATRATY'
          Footers = <>
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'PARENT_ID'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'XOZ_OPER'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'LICO'
          Footers = <>
          Width = 112
        end
        item
          EditButtons = <>
          FieldName = 'DOV'
          Footers = <>
          Width = 106
        end
        item
          EditButtons = <>
          FieldName = 'DDO'
          Footers = <>
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'REYS_NOMER_AVTO'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'ID_NAKL'
          Footers = <>
          Width = 2
        end>
    end
    object Panel4: TPanel
      Left = 511
      Top = 8
      Width = 81
      Height = 216
      Anchors = [akTop, akRight]
      BevelOuter = bvNone
      Constraints.MinHeight = 216
      TabOrder = 1
      DesignSize = (
        81
        216)
      object BitBtn1: TBitBtn
        Left = 0
        Top = 0
        Width = 81
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
        Width = 81
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
        Width = 81
        Height = 24
        Action = actPreview
        Anchors = [akLeft, akRight, akBottom]
        Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1079#1072#1090#1088#1072#1090
        TabOrder = 2
        TabStop = False
        Visible = False
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
        Left = -8
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
        Width = 81
        Height = 25
        Action = actSettings
        Anchors = [akLeft, akRight, akBottom]
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
        TabOrder = 4
        TabStop = False
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF000000FF00FF00FF00FF00FF00FF00FF00
          0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF00FF00FF000000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF00FF00FF00FF00FF00
          0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF00
          FF00FF00FF00FF00FF00FF000000FF000000FF00FF00FF00FF00FF00FF00FF00
          FF00FF000000FF000000FF00FF00FF00FF00FF00FF00FF000000FF000000FF00
          FF00FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF000000FF000000FF00FF00FF000000FF000000FF00
          0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
          0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
          FF00FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF000000FF000000FF00FF00FF000000FF000000FF00
          FF00FF00FF00FF00FF00FF000000FF000000FF00FF00FF00FF00FF00FF00FF00
          FF00FF000000FF000000FF00FF00FF00FF00FF00FF00FF000000FF000000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF00FF00FF00FF00FF00
          0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF00FF00FF00
          0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF00FF00FF00FF00FF00
          FF00FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF000000FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      end
      object BitBtn7: TBitBtn
        Left = 0
        Top = 151
        Width = 81
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
        Width = 81
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
    Images = dmdEx.ImageList1
    Left = 456
    Top = 304
    object actSettings: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      ImageIndex = 8
      ShortCut = 16465
      OnExecute = actSettingsExecute
    end
    object actGrid1ListShow: TAction
      Caption = 'actGrid1ListShow'
      OnExecute = actGrid1ListShowExecute
    end
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 9
      ShortCut = 116
      OnExecute = actRefreshExecute
    end
    object actGrid2ListShow: TAction
      Caption = 'actGrid2ListShow'
      OnExecute = actGrid2ListShowExecute
    end
    object actRecalc: TAction
      Caption = #1055#1086#1076#1089#1095#1080#1090#1072#1090#1100
      OnExecute = actRecalcExecute
    end
    object actAutoRecalc: TAction
      Caption = 'actAutoRecalc'
    end
    object actPreview: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1079#1072#1090#1088#1072#1090
      ImageIndex = 2
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
    object actShowDeleted: TAction
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1091#1076#1072#1083#1105#1085#1085#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
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
      Caption = #1042#1077#1088#1085#1091#1090#1100' '#1091#1076#1072#1083#1105#1085#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      Visible = False
      OnExecute = actUndeleteNaklExecute
    end
    object actSpecOst: TAction
      Caption = #1054#1090#1095#1105#1090' '#1087#1086' '#1086#1089#1090#1072#1090#1082#1072#1084' '#1085#1072' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1080
      OnExecute = actSpecOstExecute
    end
    object actAddDet: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1079#1080#1094#1080#1080' '#1080#1079' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1080
      OnExecute = actAddDetExecute
    end
    object actShowZatr: TAction
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1079#1072#1090#1088#1072#1090#1099
      OnExecute = actShowZatrExecute
    end
    object actSpecList: TAction
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1088#1086#1076#1080#1090#1077#1083#1100#1089#1082#1091#1102' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1102
      OnExecute = actSpecListExecute
    end
    object actChangeSpecForPosit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1088#1086#1076#1080#1090#1077#1083#1100#1089#1082#1091#1102' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1102' '#1076#1083#1103' '#1087#1086#1079#1080#1094#1080#1081
      OnExecute = actChangeSpecForPositExecute
    end
    object actShowNaklp: TAction
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1079#1072#1074#1080#1089#1080#1084#1099#1077' '#1089#1082#1083#1072#1076#1089#1082#1080#1077' '#1087#1088#1080#1093#1086#1076#1099
      OnExecute = actShowNaklpExecute
    end
    object actSebestRecount: TAction
      Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1089#1077#1073#1077#1089#1090#1086#1080#1084#1086#1089#1090#1100
      OnExecute = actSebestRecountExecute
    end
    object actDetAddSum: TAction
      Caption = 'actDetAddSum'
      OnExecute = actDetAddSumExecute
    end
    object actDesign: TAction
      Caption = #1044#1080#1079#1072#1081#1085#1077#1088
      Visible = False
      OnExecute = actDesignExecute
    end
    object actPreviewBux: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1073#1091#1093' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      ImageIndex = 2
      OnExecute = actPreviewBuxExecute
    end
    object actDesignBux: TAction
      Caption = #1044#1080#1079#1072#1081#1085#1077#1088' '#1073#1091#1093
      Visible = False
      OnExecute = actDesignBuxExecute
    end
    object actSpecOst2: TAction
      Caption = #1054#1090#1095#1105#1090' '#1087#1086' '#1086#1089#1090#1072#1090#1082#1072#1084' '#1085#1072' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1080
      OnExecute = actSpecOst2Execute
    end
    object actShowNaklpOst: TAction
      Caption = #1054#1090#1095#1105#1090' '#1087#1086' '#1085#1077#1076#1086#1087#1086#1089#1090#1072#1074#1082#1072#1084
      OnExecute = actShowNaklpOstExecute
    end
    object actSebestRecountBux: TAction
      Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1089#1077#1073#1077#1089#1090#1086#1080#1084#1086#1089#1090#1100' ('#1073#1091#1093')'
      OnExecute = actSebestRecountBuxExecute
    end
    object actPost: TAction
      Caption = #1055#1088#1086#1074#1077#1089#1090#1080
      OnExecute = actPostExecute
    end
    object actUnpost: TAction
      Caption = #1042#1077#1088#1085#1091#1090#1100
      OnExecute = actUnpostExecute
    end
    object actMakeVozvratPost: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1074#1086#1079#1074#1088#1072#1090' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1091' '#1085#1072' '#1086#1089#1085#1086#1074#1072#1085#1080#1080' '#1087#1088#1080#1093#1086#1076#1085#1086#1081
      OnExecute = actMakeVozvratPostExecute
    end
  end
  object sdsNaklo: TSQLDataSet
    CommandText = 
      'select'#13#10'  n.id,'#13#10'  n.id_nakl,'#13#10'  n.nalog_nds,'#13#10'  n.id_sklad,'#13#10'  ' +
      'n.dat,'#13#10'  n.posted,'#13#10'  n.id_currency,'#13#10'  n.comment, '#13#10'  n.id_izg' +
      ','#13#10'  n.id_zak,'#13#10'  n.id_manager,'#13#10'  n.kurs,'#13#10'  n.nds,'#13#10'  n.delmar' +
      'ked,'#13#10'  n.blocked,'#13#10'  n.parent_id_nakl,'#13#10'  n.zatraty,'#13#10'  n.id_cu' +
      'rrency_to,'#13#10'  n.nds_from,'#13#10'  n.kurs_indirect,'#13#10'  n.nds_from,'#13#10'  ' +
      '(select om.id from naklo om where om.id_nakl=n.parent_id_nakl) a' +
      's parent_id,'#13#10'  n.id_xoz_oper, '#13#10'  n.DOV, '#13#10'  n.DDO, '#13#10'  n.LICO,' +
      #13#10'  n.id_vygruzka  '#13#10'from '#13#10'  NAKLP_VW n'#13#10'order by'#13#10'  n.dat, n.i' +
      'd_nakl'#13#10
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
      ProviderFlags = []
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
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 32
      Size = 8
    end
    object sdsNakloDELMARKED: TSmallintField
      FieldName = 'DELMARKED'
      Required = True
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
    object sdsNakloZATRATY: TFMTBCDField
      FieldName = 'ZATRATY'
      Required = True
      Precision = 15
      Size = 8
    end
    object sdsNakloID_CURRENCY_TO: TIntegerField
      FieldName = 'ID_CURRENCY_TO'
    end
    object sdsNakloNDS_FROM: TFMTBCDField
      FieldName = 'NDS_FROM'
      Precision = 32
      Size = 8
    end
    object sdsNakloKURS_INDIRECT: TSmallintField
      FieldName = 'KURS_INDIRECT'
    end
    object sdsNakloID_XOZ_OPER: TIntegerField
      FieldName = 'ID_XOZ_OPER'
    end
    object sdsNakloDOV: TStringField
      FieldName = 'DOV'
      Size = 50
    end
    object sdsNakloDDO: TSQLTimeStampField
      FieldName = 'DDO'
    end
    object sdsNakloLICO: TStringField
      FieldName = 'LICO'
      Size = 50
    end
    object sdsNakloID_VYGRUZKA: TIntegerField
      FieldName = 'ID_VYGRUZKA'
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
    OnGetTableName = dspNakloGetTableName
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
        Precision = 32
        Size = 8
      end
      item
        Name = 'DELMARKED'
        Attributes = [faRequired]
        DataType = ftSmallint
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
        Name = 'ZATRATY'
        Attributes = [faRequired]
        DataType = ftFMTBcd
        Precision = 15
        Size = 8
      end
      item
        Name = 'ID_CURRENCY_TO'
        DataType = ftInteger
      end
      item
        Name = 'NDS_FROM'
        DataType = ftFMTBcd
        Precision = 32
        Size = 8
      end
      item
        Name = 'KURS_INDIRECT'
        DataType = ftSmallint
      end
      item
        Name = 'ID_XOZ_OPER'
        DataType = ftInteger
      end
      item
        Name = 'DOV'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'DDO'
        DataType = ftTimeStamp
      end
      item
        Name = 'LICO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ID_VYGRUZKA'
        DataType = ftInteger
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
    object cdsNakloZATRATY: TFMTBCDField
      DisplayLabel = #1047#1072#1090#1088#1072#1090#1099
      FieldName = 'ZATRATY'
      Required = True
      DisplayFormat = '0.00'
      Precision = 15
      Size = 8
    end
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
      OnChange = cdsNakloID_CURRENCYChange
    end
    object cdsNakloNALOG_NDS: TFMTBCDField
      DisplayLabel = #1053#1044#1057
      DisplayWidth = 5
      FieldName = 'NALOG_NDS'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdsNakloNDS: TFMTBCDField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 10
      FieldName = 'NDS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '0.00'
      Precision = 32
      Size = 2
    end
    object cdsNakloID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
      Required = True
    end
    object cdsNakloPOSTED: TSmallintField
      DisplayLabel = #1055#1088#1086#1074#1077#1076#1077#1085#1086
      FieldName = 'POSTED'
      ProviderFlags = []
      Required = True
    end
    object cdsNakloCOMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'COMMENT'
      Size = 50
    end
    object cdsNakloIZG: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'IZG'
      LookupDataSet = dmdEx.cdsPost
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_IZG'
      Size = 50
      Lookup = True
    end
    object cdsNakloZAK: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'ZAK'
      LookupDataSet = dmdEx.cdsVlad
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
      OnChange = cdsNakloDATChange
      DisplayFormat = 'dd.mm.yy'
    end
    object cdsNakloKURS: TFloatField
      DisplayLabel = #1050#1091#1088#1089
      FieldName = 'KURS'
    end
    object cdsNakloDELMARKED: TSmallintField
      FieldName = 'DELMARKED'
      Required = True
    end
    object cdsNakloID: TStringField
      DisplayLabel = #8470#1085#1072#1082#1083
      FieldName = 'ID'
      Size = 10
    end
    object cdsNakloBLOCKED: TSmallintField
      DisplayLabel = #1041#1083#1086#1082
      FieldName = 'BLOCKED'
      Required = True
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
    object cdsNakloCURRENCY_TO: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072' '#1082#1086#1085#1077#1095#1085#1072#1103
      DisplayWidth = 5
      FieldKind = fkLookup
      FieldName = 'CURRENCY_TO'
      LookupDataSet = dmdEx.cdsCurrency
      LookupKeyFields = 'OID'
      LookupResultField = 'FULLNAME'
      KeyFields = 'ID_CURRENCY_TO'
      Size = 50
      Lookup = True
    end
    object cdsNakloCURRENCY: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      DisplayWidth = 5
      FieldKind = fkLookup
      FieldName = 'CURRENCY'
      LookupDataSet = dmdEx.cdsCurrency
      LookupKeyFields = 'OID'
      LookupResultField = 'FULLNAME'
      KeyFields = 'ID_CURRENCY'
      Size = 50
      Lookup = True
    end
    object cdsNakloPARENT_ID_NAKL: TIntegerField
      FieldName = 'PARENT_ID_NAKL'
      OnChange = cdsNakloPARENT_ID_NAKLChange
    end
    object cdsNakloPARENT_ID: TStringField
      DisplayLabel = #8470' '#1089#1087#1077#1094
      FieldName = 'PARENT_ID'
      ProviderFlags = []
    end
    object cdsNakloID_CURRENCY_TO: TIntegerField
      FieldName = 'ID_CURRENCY_TO'
    end
    object cdsNakloNDS_FROM: TFMTBCDField
      FieldName = 'NDS_FROM'
      Precision = 32
      Size = 8
    end
    object cdsNakloKURS_INDIRECT: TSmallintField
      FieldName = 'KURS_INDIRECT'
    end
    object cdsNakloZAKFULLNAME: TStringField
      FieldKind = fkLookup
      FieldName = 'ZAKFULLNAME'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'FULLNAME'
      KeyFields = 'ID_ZAK'
      Visible = False
      Size = 252
      Lookup = True
    end
    object cdsNakloIZGFULLNAME: TStringField
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'IZGFULLNAME'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'FULLNAME'
      KeyFields = 'ID_IZG'
      Visible = False
      Size = 252
      Lookup = True
    end
    object cdsNakloID_XOZ_OPER: TIntegerField
      FieldName = 'ID_XOZ_OPER'
    end
    object cdsNakloXOZ_OPER: TStringField
      DisplayLabel = #1061#1086#1079#1086#1087#1077#1088#1072#1094#1080#1103
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'XOZ_OPER'
      LookupDataSet = cdsXozOper
      LookupKeyFields = 'OID'
      LookupResultField = 'FULLNAME'
      KeyFields = 'ID_XOZ_OPER'
      Size = 50
      Lookup = True
    end
    object cdsNakloLICO: TStringField
      DisplayLabel = #1063#1077#1088#1077#1079' '#1082#1086#1075#1086
      FieldName = 'LICO'
      Visible = False
      Size = 30
    end
    object cdsNakloDOV: TStringField
      DisplayLabel = #1044#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1100
      DisplayWidth = 11
      FieldName = 'DOV'
      Visible = False
      Size = 50
    end
    object cdsNakloDDO: TSQLTimeStampField
      DisplayLabel = #1044#1077#1081#1089#1090#1074#1080#1090#1077#1083#1100#1085#1072' '#1076#1086
      DisplayWidth = 34
      FieldName = 'DDO'
      Visible = False
      EditMask = '!99/99/00;1;_'
    end
    object cdsNakloID_VYGRUZKA: TIntegerField
      FieldName = 'ID_VYGRUZKA'
    end
    object cdsNakloREYS_NOMER_AVTO: TStringField
      DisplayLabel = #1042#1099#1075#1088#1091#1079#1082#1072
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'REYS_NOMER_AVTO'
      LookupDataSet = dmdEx.cdsVygruzka
      LookupKeyFields = 'ID_VYGRUZKA'
      LookupResultField = 'NOMER_AVTO'
      KeyFields = 'ID_VYGRUZKA'
      Size = 50
      Lookup = True
    end
  end
  object sdsPost: TSQLDataSet
    CommandText = 'NAKLPBUX_POST_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_NAKL'
        ParamType = ptInput
        Value = '107203'
      end
      item
        DataType = ftInteger
        Name = 'ID_SCHET'
        ParamType = ptInput
        Value = Null
      end>
    SQLConnection = dmdEx.scUchet
    Left = 456
    Top = 208
  end
  object sdsUnpost: TSQLDataSet
    CommandText = 'NAKLPBUX_UNPOST_PC'
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
      object N6: TMenuItem
        Action = actPreview
      end
      object N16: TMenuItem
        Action = actPreviewBux
      end
      object N3: TMenuItem
        Action = actSpecOst
      end
      object N23: TMenuItem
        Action = actShowNaklpOst
      end
      object N7: TMenuItem
        Action = actShowDeleted
      end
      object N8: TMenuItem
        Action = actUndeleteNakl
      end
      object N11: TMenuItem
        Action = actShowNaklp
      end
      object N25: TMenuItem
        Action = actSebestRecountBux
      end
      object N13: TMenuItem
        Action = actSebestRecount
      end
      object N15: TMenuItem
        Action = actDesign
      end
      object N17: TMenuItem
        Action = actDesignBux
      end
      object N18: TMenuItem
        Action = actShowZatr
      end
      object N26: TMenuItem
        Action = actMakeVozvratPost
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
    Images = dmdEx.ImageList1
    Left = 424
    Top = 240
    object N4: TMenuItem
      Action = actSpecOst
    end
    object N22: TMenuItem
      Action = actShowNaklpOst
    end
    object N9: TMenuItem
      Action = actShowZatr
    end
    object N10: TMenuItem
      Action = actSpecList
    end
    object N12: TMenuItem
      Action = actShowNaklp
    end
    object N24: TMenuItem
      Action = actSebestRecountBux
    end
    object N14: TMenuItem
      Action = actSebestRecount
    end
    object N19: TMenuItem
      Action = actPreview
    end
    object N20: TMenuItem
      Action = actPreviewBux
    end
    object N27: TMenuItem
      Action = actMakeVozvratPost
    end
  end
  object frRepNaklpbuxZatraty: TfrxReport
    Version = '3.23.7'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38985.428507662000000000
    ReportOptions.LastChange = 39240.721135879630000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      '{'
      'procedure Memo14OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo14, Engine do'
      '  begin'
      '  SumZatr :=  SUM([cdsRepZatratyBux."NDS"],Band2);'
      '  end'
      'end;'
      ''
      'procedure Memo19OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo19, Engine do'
      '  begin'
      '  SumTransh :=0;'
      '  SumZatr:=0;'
      '  end'
      'end;'
      ''
      'procedure Memo20OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo20, Engine do'
      '  begin'
      '  SumTransh := SUM([cdsRepNaklo."TRANSH_IN_GRN"], Band3 );'
      '  SumAll:=SumTransh+SumZatr;'
      '  end'
      'end;  }'
      ''
      'begin'
      ''
      'end.')
    StoreInDFM = False
    Left = 488
    Top = 336
    Datasets = <
      item
        DataSet = frdBux
        DataSetName = 'frdBux'
      end
      item
        DataSet = frdNaklo
        DataSetName = 'frdNaklo'
      end
      item
        DataSet = frdRepNaklo
        DataSetName = 'frdRepNaklo'
      end
      item
        DataSet = frdZatraty
        DataSetName = 'frdZatraty'
      end>
    Variables = <
      item
        Name = ' All'
        Value = Null
      end
      item
        Name = 'SumZatr'
        Value = Null
      end
      item
        Name = 'SumTransh'
        Value = Null
      end>
    Style = <>
  end
  object frdRepNaklo: TfrxDBDataset
    UserName = 'frdRepNaklo'
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
        Value = 133742
      end>
    ProviderName = 'dspRepNaklo'
    Left = 488
    Top = 272
    object cdsRepNakloCURRENCY: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      DisplayWidth = 5
      FieldKind = fkLookup
      FieldName = 'CURRENCY'
      LookupDataSet = dmdEx.cdsCurrency
      LookupKeyFields = 'OID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_CURRENCY_TO'
      Lookup = True
    end
    object cdsRepNakloID_CURRENCY_TO: TIntegerField
      FieldName = 'ID_CURRENCY_TO'
    end
    object cdsRepNakloTRANSH_IN_CURRENCY: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1074
      FieldName = 'TRANSH_IN_CURRENCY'
    end
    object cdsRepNakloKURS_NBU: TFloatField
      DisplayLabel = #1082#1091#1088#1089
      FieldName = 'KURS_NBU'
    end
    object cdsRepNakloTRANSH_IN_GRN: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1074' '#1075#1088#1085'.'
      FieldName = 'TRANSH_IN_GRN'
    end
  end
  object sdsDelmark: TSQLDataSet
    CommandText = 'NAKLPBUX_DELMARK_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'OID'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 456
    Top = 176
  end
  object sdsNaklot: TSQLDataSet
    CommandText = 
      'select '#13#10'  d.id_nakld,'#13#10'  d.cena,'#13#10'  d.id_nakl,'#13#10'  d.id_pos,'#13#10'  ' +
      'd.id_tovar,'#13#10'  d.kodcn,'#13#10'  d.kolotp,'#13#10'  d.skidka,'#13#10'  d.id_sebest' +
      ','#13#10'  (select om.id from naklo om where om.id_nakl=d.id_sebest) a' +
      's parent_id'#13#10'from '#13#10'  NAKLP_DET_VW d '#13#10'where '#13#10'  d.id_nakl=:id_n' +
      'akl'
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
      Size = 8
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
      Size = 8
    end
    object sdsNaklotSKIDKA: TFMTBCDField
      FieldName = 'SKIDKA'
      Precision = 15
      Size = 2
    end
    object sdsNaklotID_SEBEST: TIntegerField
      FieldName = 'ID_SEBEST'
    end
    object sdsNaklotPARENT_ID: TStringField
      FieldName = 'PARENT_ID'
      ProviderFlags = []
    end
  end
  object dspNaklot: TDataSetProvider
    DataSet = sdsNaklot
    UpdateMode = upWhereKeyOnly
    OnGetTableName = dspNaklotGetTableName
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
      end
      item
        Name = 'ID_SEBEST'
        DataType = ftInteger
      end
      item
        Name = 'PARENT_ID'
        DataType = ftString
        Size = 20
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
    AfterDelete = cdsNaklotAfterDelete
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
      DisplayWidth = 10
      FieldName = 'CENA'
      OnChange = cdsNaklotCENAChange
      DisplayFormat = '0.0000'
      Precision = 15
      Size = 8
    end
    object cdsNaklotID_NAKL: TIntegerField
      DisplayLabel = #1048#1076#1077#1085#1090
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
      DisplayWidth = 10
      FieldName = 'KOLOTP'
      OnChange = cdsNaklotKOLOTPChange
      DisplayFormat = '0.000'
      Precision = 15
      Size = 8
    end
    object cdsNaklotSKIDKA: TFMTBCDField
      DisplayLabel = #1057#1082#1080#1076#1082#1072
      DisplayWidth = 5
      FieldName = 'SKIDKA'
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
      OnChange = cdsNaklotCENANDSChange
      DisplayFormat = '0.0000'
      EditFormat = '0.00'
    end
    object cdsNaklotSUMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 9
      FieldKind = fkInternalCalc
      FieldName = 'SUMA'
      OnChange = cdsNaklotSUMAChange
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object cdsNaklotSUMANDS: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1089' '#1053#1044#1057
      DisplayWidth = 9
      FieldKind = fkInternalCalc
      FieldName = 'SUMANDS'
      OnChange = cdsNaklotSUMANDSChange
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object cdsNaklotID_SEBEST: TIntegerField
      DisplayLabel = #8470' '#1089#1087#1077#1094
      FieldName = 'ID_SEBEST'
    end
    object cdsNaklotPARENT_ID: TStringField
      DisplayLabel = #8470' '#1089#1087#1077#1094
      FieldName = 'PARENT_ID'
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
    Section = 'TfrmNaklpBux'
    StorageManager = rpsClientEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      '<P>.WindowState'
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
    object N5: TMenuItem
      Action = actAddDet
    end
    object actChangeSpecForPosit1: TMenuItem
      Action = actChangeSpecForPosit
    end
    object N21: TMenuItem
      Action = actSpecOst2
    end
  end
  object dspRepZatratyBux: TDataSetProvider
    DataSet = sdsRepZatratyBux
    Left = 520
    Top = 240
  end
  object cdsRepZatratyBux: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_nakl'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspRepZatratyBux'
    Left = 520
    Top = 272
    object cdsRepZatratyBuxNAME: TStringField
      DisplayLabel = #1057#1090#1072#1090#1100#1103' '#1079#1072#1090#1088#1072#1090
      FieldName = 'NAME'
      Size = 50
    end
    object cdsRepZatratyBuxNDS: TFMTBCDField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'NDS'
      Required = True
      DisplayFormat = '0.00'
      Precision = 15
      Size = 8
    end
  end
  object sdsGetKurs: TSQLDataSet
    CommandText = 
      'select '#13#10'  dzero(kurs_to,kurs_from,0) as kurs'#13#10'from '#13#10'  kurs_get' +
      '_pc('#13#10'    :dat,'#13#10'    (select oid'#13#10'      from get_oid_objects_pc(' +
      #39'UAH'#39','#13#10'        (select oid from get_oid_objects_pc('#39#1058#1048#1055' '#1042#1040#1051#1070#1058#39',' +
      '-100))'#13#10'      )'#13#10'    ),'#13#10'    :id_currency'#13#10'  )'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'dat'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_currency'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 488
    Top = 176
    object sdsGetKursKURS: TFloatField
      FieldName = 'KURS'
    end
  end
  object sdsSebestRecount: TSQLDataSet
    CommandText = 'NAKLP_SEBEST_RECOUNT_PC'
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
        Name = 'ID_NAKLD_IN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_SKLAD_IN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_PARTIYA_IN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_SCHET_IN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIP_IN'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DAT_FROM_IN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'MODE_IN'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 496
    Top = 124
  end
  object sdsRepNaklo: TSQLDataSet
    CommandText = 
      'select'#13#10'  ID_CURRENCY_TO,'#13#10'  TRANSH_IN_CURRENCY,'#13#10'  KURS_NBU,'#13#10' ' +
      ' TRANSH_IN_GRN'#13#10'from'#13#10'  REP_NAKLPBUX_TO_GRN_CONVERT_PC(:id_nakl,' +
      '0)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_nakl'
        ParamType = ptInput
        Value = 133742
      end>
    SQLConnection = dmdEx.scUchet
    Left = 488
    Top = 208
  end
  object sdsRepZatratyBux: TSQLDataSet
    CommandText = 
      'select s.name, om.nds'#13#10'from naklp_zatr_vw om inner join'#13#10'  spr_s' +
      'tatya_vw s on s.oid=om.id_sklad_to'#13#10'where om.parent_id_nakl=:id_' +
      'nakl and om.delmarked=0 and'#13#10'  s.is_bux=1 and s.is_for_tovar=1 a' +
      'nd s.is_bux=1'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_nakl'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = dmdEx.scUchet
    Left = 520
    Top = 208
  end
  object frdZatraty: TfrxDBDataset
    UserName = 'frdZatraty'
    CloseDataSource = False
    DataSet = cdsRepZatratyBux
    Left = 520
    Top = 304
  end
  object frRepNaklpbuxSebest: TfrxReport
    Version = '3.23.7'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38985.427938726900000000
    ReportOptions.LastChange = 39240.720770937500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnGetValue = frRepNaklpbuxSebestGetValue
    Left = 552
    Top = 336
    Datasets = <
      item
        DataSet = frdBux
        DataSetName = 'frdBux'
      end
      item
        DataSet = frdNaklo
        DataSetName = 'frdNaklo'
      end>
    Variables = <
      item
        Name = ' AllVars'
        Value = Null
      end
      item
        Name = 'NDSTEXT'
        Value = Null
      end
      item
        Name = 'VSEGO'
        Value = Null
      end>
    Style = <>
  end
  object frdNaklo: TfrxDBDataset
    UserName = 'frdNaklo'
    CloseDataSource = False
    DataSet = cdsNaklo
    Left = 392
    Top = 368
  end
  object sdsRepBux: TSQLDataSet
    CommandText = 
      'select id_pos,id_tovar,cena,kolotp,nds'#13#10'from rep_naklpbux_to_grn' +
      '_print_pc(:id_nakl,0)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_nakl'
        ParamType = ptInput
        Value = 133742
      end>
    SQLConnection = dmdEx.scUchet
    Left = 552
    Top = 208
  end
  object dspRepBux: TDataSetProvider
    DataSet = sdsRepBux
    Left = 552
    Top = 240
  end
  object cdsRepBux: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <
      item
        DataType = ftInteger
        Name = 'id_nakl'
        ParamType = ptInput
        Value = 133742
      end>
    ProviderName = 'dspRepBux'
    Left = 552
    Top = 272
    object cdsRepBuxTOVAR: TStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      FieldKind = fkLookup
      FieldName = 'TOVAR'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'FULLNAME'
      KeyFields = 'ID_TOVAR'
      Size = 50
      Lookup = True
    end
    object cdsRepBuxID_POS: TIntegerField
      FieldName = 'ID_POS'
    end
    object cdsRepBuxID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
    end
    object cdsRepBuxCENA: TFloatField
      FieldName = 'CENA'
    end
    object cdsRepBuxKOLOTP: TFloatField
      FieldName = 'KOLOTP'
    end
    object cdsRepBuxNDS: TFloatField
      FieldName = 'NDS'
    end
    object cdsRepBuxSUMNDS: TAggregateField
      FieldName = 'SUMNDS'
      Active = True
      Expression = 'Sum(NDS)'
    end
  end
  object frdBux: TfrxDBDataset
    UserName = 'frdBux'
    CloseDataSource = False
    DataSet = cdsRepBux
    Left = 552
    Top = 304
  end
  object Curr2StrUA1: TCurr2StrRU
    Active = False
    MoneyType = mtUAH
    FullString = False
    Left = 344
    Top = 176
  end
  object frdNaklot: TfrxDBDataset
    UserName = 'frdNaklot'
    CloseDataSource = False
    DataSet = cdsNaklot
    Left = 312
    Top = 368
  end
  object sdsXozoper: TSQLDataSet
    CommandText = 
      'select *'#13#10'from spr_xozoper_vw s'#13#10'where s.delmarked=0'#13#10'  and s.ti' +
      'p_document=(select oid'#13#10'    from get_oid_objects_pc('#39#1055#1056#1048#1061#1054#1044#1053#1067#1045' '#1053 +
      #1040#1050#1051#1040#1044#1053#1067#1045#39',-100))'#13#10'order by s.name'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 264
    Top = 208
  end
  object dspXozOper: TDataSetProvider
    DataSet = sdsXozoper
    Left = 264
    Top = 240
  end
  object cdsXozOper: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspXozOper'
    Left = 264
    Top = 272
    object cdsXozOperOID: TIntegerField
      FieldName = 'OID'
    end
    object cdsXozOperNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
    object cdsXozOperFULLNAME: TStringField
      FieldName = 'FULLNAME'
      Size = 250
    end
  end
  object dsXozOper: TDataSource
    DataSet = cdsXozOper
    Left = 264
    Top = 304
  end
  object sdsMakeVozvrat: TSQLDataSet
    CommandText = 'NAKLPBUX_MAKE_VOZVRAT_POST_PC'
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
    Left = 456
    Top = 144
  end
end
