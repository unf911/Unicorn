object frmSravnPrice: TfrmSravnPrice
  Left = 494
  Top = 325
  Width = 642
  Height = 490
  Caption = #1057#1088#1072#1074#1085#1077#1085#1080#1077' '#1087#1088#1072#1081#1089#1086#1074
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
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 634
    Height = 39
    Align = alTop
    TabOrder = 0
    object BitBtn2: TBitBtn
      Left = 592
      Top = 9
      Width = 13
      Height = 25
      Action = actRefresh
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 0
      Kind = bkRetry
    end
    object BitBtn3: TBitBtn
      Left = 12
      Top = 9
      Width = 93
      Height = 25
      Action = actDetail
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      TabOrder = 1
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
      Left = 120
      Top = 9
      Width = 85
      Height = 25
      Action = actSettings
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      TabOrder = 2
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
    object BitBtn1: TBitBtn
      Left = 216
      Top = 9
      Width = 109
      Height = 25
      Action = actFillFact
      Caption = #1056#1072#1089#1089#1095#1080#1090#1072#1090#1100' '#1094#1077#1085#1099
      TabOrder = 3
    end
    object BitBtn4: TBitBtn
      Left = 340
      Top = 9
      Width = 102
      Height = 25
      Action = actSravnPrice
      Caption = #1057#1088#1072#1074#1085#1080#1090#1100' '#1094#1077#1085#1099
      TabOrder = 4
    end
    object BitBtn5: TBitBtn
      Left = 452
      Top = 9
      Width = 113
      Height = 25
      Action = actFillFactAndSravnPrice
      Caption = #1056#1072#1089#1089#1095#1080#1090#1072#1090#1100' '#1074#1089#1105
      TabOrder = 5
    end
    object cbxManuallySelected: TCheckBox
      Left = 572
      Top = 8
      Width = 173
      Height = 17
      Caption = #1042#1099#1073#1086#1088' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1086#1074' '#1074#1088#1091#1095#1085#1091#1102
      TabOrder = 6
      Visible = False
      OnClick = cbxManuallySelectedClick
    end
    object cbxShowSpecOst: TCheckBox
      Left = 577
      Top = 16
      Width = 173
      Height = 17
      Caption = #1042#1099#1073#1086#1088' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1086#1074' '#1074#1088#1091#1095#1085#1091#1102
      TabOrder = 7
      Visible = False
      OnClick = cbxManuallySelectedClick
    end
  end
  object AutoPanel1: TAutoPanel
    Left = 0
    Top = 39
    Width = 634
    Height = 405
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 2
      Top = 2
      Width = 630
      Height = 401
      ActivePage = tsAllPrices
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082#1080
        OnExit = TabSheet1Exit
        OnShow = TabSheet1Show
        object dbgPost: TDBGridEh
          Left = 0
          Top = 0
          Width = 622
          Height = 373
          Align = alClient
          AllowedOperations = [alopUpdateEh, alopDeleteEh]
          DataSource = dsPost
          EditActions = [geaCopyEh, geaSelectAllEh]
          Flat = False
          FooterColor = clInfoBk
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
          PopupMenu = ppmPost
          SortLocal = True
          SumList.Active = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          VertScrollBar.VisibleMode = sbAlwaysShowEh
          OnExit = dbgPostExit
          OnKeyUp = dbgPostKeyUp
          Columns = <
            item
              Checkboxes = True
              EditButtons = <>
              FieldName = 'IN_LIST'
              Footers = <>
              KeyList.Strings = (
                '1'
                '0')
              Width = 75
            end
            item
              Checkboxes = True
              EditButtons = <>
              FieldName = 'EXCLUDED'
              Footers = <>
              KeyList.Strings = (
                '1'
                '0')
            end
            item
              EditButtons = <>
              FieldName = 'POST'
              Footers = <>
              Width = 269
            end
            item
              EditButtons = <>
              FieldName = 'DAT'
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'KURS'
              Footers = <>
            end>
        end
      end
      object TabSheet2: TTabSheet
        Caption = #1058#1086#1074#1072#1088#1099
        ImageIndex = 1
        OnExit = TabSheet2Exit
        OnShow = TabSheet2Show
        object dbgTovar: TDBGridEh
          Left = 0
          Top = 0
          Width = 622
          Height = 373
          Align = alClient
          AllowedOperations = [alopUpdateEh, alopDeleteEh]
          DataSource = dsTovar
          EditActions = [geaCopyEh, geaSelectAllEh]
          Flat = False
          FooterColor = clInfoBk
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
          PopupMenu = ppmTovar
          SortLocal = True
          SumList.Active = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          VertScrollBar.VisibleMode = sbAlwaysShowEh
          OnExit = dbgTovarExit
          OnKeyUp = dbgTovarKeyUp
          Columns = <
            item
              Checkboxes = True
              EditButtons = <>
              FieldName = 'IN_LIST'
              Footers = <>
              KeyList.Strings = (
                '1'
                '0')
            end
            item
              EditButtons = <>
              FieldName = 'TOVAR'
              Footers = <>
              Width = 339
            end>
        end
      end
      object tsAllPrices: TTabSheet
        Caption = #1042#1089#1077' '#1094#1077#1085#1099
        ImageIndex = 2
        OnShow = tsAllPricesShow
        object dbgRepFact: TDBGridEh
          Left = 0
          Top = 0
          Width = 622
          Height = 357
          Align = alClient
          DataSource = dsFactTable
          EditActions = [geaCopyEh, geaSelectAllEh]
          Flat = False
          FooterColor = clInfoBk
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
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
        end
        object pbAllPrices: TProgressBar
          Left = 0
          Top = 357
          Width = 622
          Height = 16
          Align = alBottom
          Step = 1
          TabOrder = 1
          Visible = False
        end
      end
      object tsSravnPrice: TTabSheet
        Caption = #1057#1088#1072#1074#1085#1077#1085#1080#1077' '#1087#1088#1072#1081#1089#1086#1074
        ImageIndex = 3
        OnShow = tsSravnPriceShow
        object ProgressBar1: TProgressBar
          Left = 0
          Top = 357
          Width = 622
          Height = 16
          Align = alBottom
          Step = 1
          TabOrder = 0
          Visible = False
        end
        object dbgRep: TDBGridEh
          Left = 0
          Top = 0
          Width = 622
          Height = 357
          Align = alClient
          DataSource = dsSravnPrice
          EditActions = [geaCopyEh, geaSelectAllEh]
          Flat = False
          FooterColor = clInfoBk
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          FooterRowCount = 1
          FrozenCols = 4
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
          PopupMenu = ppmRep
          SortLocal = True
          SumList.Active = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          VertScrollBar.VisibleMode = sbAlwaysShowEh
          OnDblClick = dbgRepDblClick
        end
      end
    end
  end
  object ActionList1: TActionList
    Images = dmdEx.ImageList1
    Left = 104
    Top = 136
    object actSettings: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      ShortCut = 16465
      OnExecute = actSettingsExecute
    end
    object actDetail: TAction
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      ImageIndex = 5
      ShortCut = 120
      OnExecute = actDetailExecute
    end
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ShortCut = 116
      Visible = False
      OnExecute = actRefreshExecute
    end
    object actDebug: TAction
      Caption = #1056#1077#1078#1080#1084' '#1086#1090#1083#1072#1076#1082#1080
      OnExecute = actDebugExecute
    end
    object actShowColumnsSum: TAction
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1089#1091#1084#1084#1099
    end
    object actShowColumnsKolotp: TAction
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1072
    end
    object actFillFact: TAction
      Caption = #1056#1072#1089#1089#1095#1080#1090#1072#1090#1100' '#1094#1077#1085#1099
      OnExecute = actFillFactExecute
    end
    object actSravnPrice: TAction
      Caption = #1057#1088#1072#1074#1085#1080#1090#1100' '#1094#1077#1085#1099
      OnExecute = actSravnPriceExecute
    end
    object actAddAllPostWithPrice: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074#1089#1077#1093' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1086#1074
      Enabled = False
      Visible = False
      OnExecute = actAddAllPostWithPriceExecute
    end
    object actAddTovar: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1079#1080#1094#1080#1080' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1090#1086#1074#1072#1088#1086#1074
      OnExecute = actAddTovarExecute
    end
    object actAddPost: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1086#1074
      OnExecute = actAddPostExecute
    end
    object actChooseBestPost: TAction
      Caption = #1058#1086#1083#1100#1082#1086' '#1074#1099#1073#1088#1072#1090#1100' '#1083#1091#1095#1096#1077#1075#1086
      Visible = False
      OnExecute = actChooseBestPostExecute
    end
    object actDetail2: TAction
      Caption = #1057#1088#1072#1074#1085#1077#1085#1080#1077' '#1094#1077#1085' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1086#1074
      ImageIndex = 5
      ShortCut = 121
      OnExecute = actDetail2Execute
    end
    object actSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      OnExecute = actSaveExecute
    end
    object actShowPricePostWithTovar: TAction
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1086#1090#1095#1105#1090' '#1087#1086' '#1094#1077#1085#1072#1084
      ImageIndex = 5
      ShortCut = 122
      OnExecute = actShowPricePostWithTovarExecute
    end
    object actFillFactAndSravnPrice: TAction
      Caption = #1056#1072#1089#1089#1095#1080#1090#1072#1090#1100' '#1074#1089#1105
      OnExecute = actFillFactAndSravnPriceExecute
    end
    object actMakeSpecBest: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1102' '#1089' '#1083#1091#1095#1096#1080#1084#1080' '#1094#1077#1085#1072#1084#1080' '#1076#1083#1103' '#1074#1099#1073#1088#1072#1085#1085#1086#1075#1086' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
      OnExecute = actMakeSpecBestExecute
    end
    object actMakeSpec: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1102' '#1076#1083#1103' '#1074#1099#1073#1088#1072#1085#1085#1086#1075#1086' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
      OnExecute = actMakeSpecExecute
    end
    object actMakeSpecOnlyForBestPosit: TAction
      Caption = 
        #1057#1086#1079#1076#1072#1090#1100' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1102' '#1076#1083#1103' '#1074#1099#1073#1088#1072#1085#1085#1086#1075#1086' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072' '#1090#1086#1083#1100#1082#1086' '#1076#1083#1103' '#1087#1086#1079#1080#1094#1080 +
        #1081', '#1075#1076#1077' '#1086#1085' '#1083#1080#1076#1077#1088
      OnExecute = actMakeSpecOnlyForBestPositExecute
    end
    object actShowSpec: TAction
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1079#1072#1074#1080#1089#1080#1084#1099#1077' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1080
      OnExecute = actShowSpecExecute
    end
    object actMakeSpecAllAuto: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1080' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080
      OnExecute = actMakeSpecAllAutoExecute
    end
    object actMakeSpecBestVxod: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1102' '#1089' '#1083#1091#1095#1096#1080#1084#1080' '#1074#1093#1086#1076#1072#1084#1080' '#1076#1083#1103' '#1074#1099#1073#1088#1072#1085#1085#1086#1075#1086' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
      OnExecute = actMakeSpecBestVxodExecute
    end
    object actShowPriceChange: TAction
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1087#1088#1072#1081#1089#1086#1074
      OnExecute = actShowPriceChangeExecute
    end
    object actRefreshOnePost: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1094#1077#1085#1099' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
      OnExecute = actRefreshOnePostExecute
    end
  end
  object ufRep: TUnfFilter
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
    Section = 'frmRepSravn'
    StorageManager = rpsClientEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width')
    Left = 168
    Top = 136
  end
  object rpsClientEdit: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 200
    Top = 136
  end
  object MainMenu1: TMainMenu
    Images = dmdEx.ImageList1
    Left = 104
    Top = 168
    object N1: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      GroupIndex = 10
      object N3: TMenuItem
        Action = actDetail
      end
      object N8: TMenuItem
        Action = actDetail2
      end
      object N10: TMenuItem
        Action = actShowPricePostWithTovar
      end
      object mnuRefresh: TMenuItem
        Action = actRefresh
      end
      object N2: TMenuItem
        Action = actSettings
      end
      object N4: TMenuItem
        Action = actDebug
      end
      object N5: TMenuItem
        Action = actAddPost
      end
      object N6: TMenuItem
        Action = actAddTovar
      end
      object N11: TMenuItem
        Action = actFillFact
      end
      object N7: TMenuItem
        Action = actChooseBestPost
      end
      object N12: TMenuItem
        Action = actSravnPrice
      end
      object N15: TMenuItem
        Action = actFillFactAndSravnPrice
      end
      object N21: TMenuItem
        Action = actSave
      end
    end
  end
  object psGrid: TPropStorageEh
    Active = False
    Section = 'frmRepSravnGrid'
    StorageManager = RegPropStorageManEh1
    StoredProps.Strings = (
      
        'AutoPanel1.PageControl1.tsSravnPrice.dbgRep.<P>.Columns.<Item0>.' +
        'Width'
      
        'AutoPanel1.PageControl1.tsSravnPrice.dbgRep.<P>.Columns.<Item1>.' +
        'Width'
      
        'AutoPanel1.PageControl1.tsSravnPrice.dbgRep.<P>.Columns.<Item2>.' +
        'Width'
      
        'AutoPanel1.PageControl1.tsSravnPrice.dbgRep.<P>.Columns.<Item3>.' +
        'Width'
      
        'AutoPanel1.PageControl1.tsSravnPrice.dbgRep.<P>.Columns.<Item4>.' +
        'Width'
      
        'AutoPanel1.PageControl1.tsSravnPrice.dbgRep.<P>.Columns.<Item5>.' +
        'Width'
      
        'AutoPanel1.PageControl1.tsSravnPrice.dbgRep.<P>.Columns.<Item6>.' +
        'Width')
    Left = 168
    Top = 168
  end
  object RegPropStorageManEh1: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 200
    Top = 168
  end
  object mtePost: TMemTableEh
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterInsert = mtePostAfterInsert
    BeforePost = mtePostBeforePost
    Left = 325
    Top = 92
    object mtePostIN_LIST: TSmallintField
      DisplayLabel = #1059#1095#1072#1089#1090#1074#1091#1077#1090' '#1074' '#1089#1088#1072#1074#1085#1077#1085#1080#1080
      FieldName = 'IN_LIST'
    end
    object mtePostEXCLUDED: TIntegerField
      DisplayLabel = #1048#1089#1082#1083#1102#1095#1105#1085
      FieldName = 'EXCLUDED'
      OnChange = mtePostEXCLUDEDChange
    end
    object mtePostPOST: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'POST'
      LookupDataSet = dmdEx.cdsPost
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_POST'
      Required = True
      Size = 50
      Lookup = True
    end
    object mtePostDAT: TDateField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DAT'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = 'dd.mm.yy'
    end
    object mtePostID_POST: TIntegerField
      FieldName = 'ID_POST'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object mtePostKURS: TFloatField
      DisplayLabel = #1050#1091#1088#1089
      FieldName = 'KURS'
    end
  end
  object dsPost: TDataSource
    DataSet = mtePost
    Left = 325
    Top = 127
  end
  object mteTovar: TMemTableEh
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'mteTovarIndex1'
        Fields = 'id_tovar'
        Options = [ixUnique]
      end
      item
        Name = 'mteTovarIndex2'
        Fields = 'GRUPPA1;GRUPPA2;GRUPPA3;GRUPPA4'
      end>
    Params = <>
    StoreDefs = True
    AfterInsert = mteTovarAfterInsert
    BeforePost = mteTovarBeforePost
    Left = 357
    Top = 92
    object SmallintField1: TSmallintField
      DisplayLabel = #1059#1095#1072#1089#1090#1074#1091#1077#1090' '#1074' '#1089#1088#1072#1074#1085#1077#1085#1080#1080
      FieldName = 'IN_LIST'
    end
    object mteTovarTOVAR: TStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'TOVAR'
      LookupDataSet = dmdEx.cdsTovar
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_TOVAR'
      Required = True
      Size = 50
      Lookup = True
    end
    object mteTovarID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object mteTovarGRUPPA1: TStringField
      FieldName = 'GRUPPA1'
    end
    object mteTovarGRUPPA2: TFloatField
      FieldName = 'GRUPPA2'
    end
    object mteTovarGRUPPA3: TFloatField
      FieldName = 'GRUPPA3'
    end
    object mteTovarGRUPPA4: TFloatField
      FieldName = 'GRUPPA4'
    end
    object mteTovarKOLOTP: TFloatField
      FieldName = 'KOLOTP'
    end
  end
  object dsTovar: TDataSource
    DataSet = mteTovar
    Left = 357
    Top = 127
  end
  object sdsPost: TSQLDataSet
    CommandText = 
      'select k.id,k.name'#13#10'from klient_all_vw k'#13#10'where k.delmarked=0 an' +
      'd bitand(k.tip,4)<>0'#13#10'  and id_price is not null'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 296
    Top = 92
  end
  object dspPost: TDataSetProvider
    DataSet = sdsPost
    Options = [poAllowCommandText]
    Left = 296
    Top = 124
  end
  object cdsPostWithPrice: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspPost'
    StoreDefs = True
    Left = 296
    Top = 156
    object cdsPostWithPriceID: TIntegerField
      FieldName = 'ID'
    end
    object cdsPostWithPriceNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
  end
  object dsPostWithPrice: TDataSource
    DataSet = cdsPostWithPrice
    Left = 296
    Top = 188
  end
  object dsFactTable: TDataSource
    DataSet = mteFactTable
    Left = 389
    Top = 127
  end
  object dsSravnPrice: TDataSource
    DataSet = cdsSravnPrice
    Left = 421
    Top = 127
  end
  object mteSravnPricePost: TMemTableEh
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    BeforeInsert = mteSravnPricePostBeforeInsert
    AfterInsert = mteSravnPricePostAfterInsert
    Left = 453
    Top = 92
    object DateField1: TDateField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DAT'
      DisplayFormat = 'dd.mm.yy'
    end
    object IntegerField15: TIntegerField
      FieldName = 'ID_POST'
      Visible = False
    end
    object mteSravnPricePostID_COLUMN: TIntegerField
      FieldName = 'ID_COLUMN'
    end
    object mteSravnPricePostCOLUMN_NAME: TStringField
      DisplayWidth = 50
      FieldName = 'COLUMN_NAME'
      Size = 50
    end
  end
  object dsSravnPricePost: TDataSource
    DataSet = mteSravnPricePost
    Left = 453
    Top = 127
  end
  object ufRepFact: TUnfFilter
    DBGridEh = dbgRepFact
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
    Top = 168
  end
  object ppmTovar: TPopupMenu
    Left = 102
    Top = 201
    object actAddDet1: TMenuItem
      Action = actAddTovar
    end
  end
  object ppmPost: TPopupMenu
    Left = 134
    Top = 201
    object actAddPost1: TMenuItem
      Action = actAddPost
    end
    object N9: TMenuItem
      Action = actShowPricePostWithTovar
    end
    object N23: TMenuItem
      Action = actShowPriceChange
    end
    object N24: TMenuItem
      Action = actRefreshOnePost
    end
  end
  object ppmRep: TPopupMenu
    Left = 168
    Top = 201
    object N13: TMenuItem
      Action = actDetail
    end
    object N14: TMenuItem
      Action = actDetail2
    end
    object N16: TMenuItem
      Action = actMakeSpecBest
    end
    object N22: TMenuItem
      Action = actMakeSpecBestVxod
    end
    object N17: TMenuItem
      Action = actMakeSpec
    end
    object N18: TMenuItem
      Action = actMakeSpecOnlyForBestPosit
    end
    object N20: TMenuItem
      Action = actMakeSpecAllAuto
    end
    object N19: TMenuItem
      Action = actShowSpec
    end
  end
  object cdsSravnPrice: TClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    FieldDefs = <
      item
        Name = 'DAT'
        DataType = ftDateTime
      end
      item
        Name = 'CENA'
        DataType = ftFloat
      end
      item
        Name = 'ZAKUPKA'
        DataType = ftFloat
      end
      item
        Name = 'CENA_FROM'
        DataType = ftFloat
      end
      item
        Name = 'ID_ANALOG'
        DataType = ftInteger
      end
      item
        Name = 'ID_POST'
        DataType = ftInteger
      end
      item
        Name = 'ID_TOVAR'
        DataType = ftInteger
      end
      item
        Name = 'PROCENT'
        DataType = ftFloat
      end
      item
        Name = 'KOLOTP'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    OnCalcFields = cdsSravnPriceCalcFields
    Left = 420
    Top = 92
    object cdsSravnPriceDAT: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 10
      FieldName = 'DAT'
      DisplayFormat = 'dd.mm.yy'
    end
    object cdsSravnPricePost: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'POST'
      LookupDataSet = dmdEx.cdsPost
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_POST'
      Lookup = True
    end
    object cdsSravnPriceTovar: TStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      FieldKind = fkLookup
      FieldName = 'ANALOG'
      LookupDataSet = dmdEx.cdsTovar
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_ANALOG'
      Size = 50
      Lookup = True
    end
    object cdsSravnPriceCena: TFloatField
      DisplayLabel = #1042#1093#1086#1076
      FieldName = 'CENA'
      DisplayFormat = '0.0000'
    end
    object cdsSravnPriceTovarExact: TStringField
      DisplayLabel = #1058#1086#1095#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
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
    object cdsSravnPriceTovarZAKUPKA: TFloatField
      DisplayLabel = #1047#1072#1082#1091#1087#1082#1072
      FieldName = 'ZAKUPKA'
      DisplayFormat = '0.0000'
    end
    object cdsSravnPriceTovarCENA_FROM: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1074' '#1074#1072#1083#1102#1090#1077
      FieldName = 'CENA_FROM'
      DisplayFormat = '0.0000'
    end
    object cdsSravnPriceIdAnalog: TIntegerField
      FieldName = 'ID_ANALOG'
      Visible = False
    end
    object cdsSravnPriceIdPos: TIntegerField
      FieldName = 'ID_POST'
      Visible = False
    end
    object cdsSravnPriceIdTovar: TIntegerField
      FieldName = 'ID_TOVAR'
      Visible = False
    end
    object cdsSravnPriceIdAnalogPROCENT: TFloatField
      DisplayLabel = '%'
      FieldName = 'PROCENT'
      DisplayFormat = '0.00'
    end
    object cdsSravnPriceKOLOTP: TFloatField
      DisplayLabel = #1047#1072#1082#1091#1087#1082#1072' '#1082#1086#1083'-'#1074#1086
      FieldName = 'KOLOTP'
      DisplayFormat = '0.000'
    end
    object cdsSravnPriceSPEC_OST_NERAZM: TFloatField
      DisplayLabel = #1053#1077#1088#1072#1079#1084#1077#1097#1077#1085#1086
      DisplayWidth = 6
      FieldName = 'SPEC_OST_NERAZM'
      DisplayFormat = '0.000'
    end
    object cdsSravnPriceSPEC_OST_RAZM: TFloatField
      DisplayLabel = #1056#1072#1079#1084#1077#1097#1077#1085#1086
      DisplayWidth = 6
      FieldName = 'SPEC_OST_RAZM'
      DisplayFormat = '0.000'
    end
    object cdsSravnPriceSPEC_FREE: TFloatField
      DisplayLabel = #1050' '#1088#1072#1079#1084#1077#1097#1077#1085#1080#1102
      DisplayWidth = 6
      FieldKind = fkInternalCalc
      FieldName = 'SPEC_FREE'
      DisplayFormat = '0.000'
    end
  end
  object sdsSravnPriceMakeSpec: TSQLDataSet
    CommandText = 'SRAVNPRICE_MAKE_SPEC_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_POST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'COMMENT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'MODE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_CURRENCY'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PARENT_ID_NAKL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_NAKL'
        ParamType = ptOutput
        Size = 4
      end>
    SQLConnection = dmdEx.scUchet
    Left = 484
    Top = 92
  end
  object sdsSpecOstNerazm: TSQLDataSet
    CommandText = 
      'select t.id_analog, sum(sd.kolotp) as kolotp_nerazm'#13#10'from spec_d' +
      'et_vw sd inner join tovar t'#13#10'  on sd.id_tovar=t.oid'#13#10'  inner joi' +
      'n spec_vw sm on sm.id_nakl=sd.id_nakl'#13#10'where sd.id_sebest=:id_na' +
      'kl '#13#10'  and sm.delmarked=0 and sm.posted=0'#13#10'group by t.id_analog'#13 +
      #10'having sum(sd.kolotp)>0'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_nakl'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = dmdEx.scUchet
    Left = 228
    Top = 92
  end
  object sdsSpecOstRazm: TSQLDataSet
    CommandText = 
      'select t.id_analog, sum(sd.kolotp) as kolotp_razm'#13#10'from spec_det' +
      '_vw sd inner join tovar t'#13#10'  on sd.id_tovar=t.oid'#13#10'  inner join ' +
      'spec_vw sm on sm.id_nakl=sd.id_nakl'#13#10'where sd.id_sebest=:id_nakl' +
      ' '#13#10'  and sm.delmarked=0 and sm.posted=1'#13#10'group by t.id_analog'#13#10'h' +
      'aving sum(sd.kolotp)>0'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_nakl'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = dmdEx.scUchet
    Left = 264
    Top = 92
  end
  object dspSpecOstRazm: TDataSetProvider
    DataSet = sdsSpecOstRazm
    Options = [poAllowCommandText]
    Left = 264
    Top = 124
  end
  object dspSpecOstNerazm: TDataSetProvider
    DataSet = sdsSpecOstNerazm
    Options = [poAllowCommandText]
    Left = 228
    Top = 124
  end
  object cdsSpecOstNerazm: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_nakl'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspSpecOstNerazm'
    Left = 228
    Top = 156
    object cdsSpecOstNerazmTOVAR: TStringField
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'TOVAR'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_ANALOG'
      Size = 50
      Lookup = True
    end
    object cdsSpecOstNerazmID_ANALOG: TIntegerField
      FieldName = 'ID_ANALOG'
    end
    object cdsSpecOstNerazmKOLOTP_NERAZM: TFMTBCDField
      FieldName = 'KOLOTP_NERAZM'
      Precision = 15
      Size = 4
    end
  end
  object cdsSpecOstRazm: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_nakl'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspSpecOstRazm'
    Left = 264
    Top = 156
    object StringField3: TStringField
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'TOVAR'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_ANALOG'
      Size = 50
      Lookup = True
    end
    object IntegerField1: TIntegerField
      FieldName = 'ID_ANALOG'
    end
    object cdsSpecOstRazmKOLOTP_RAZM: TFMTBCDField
      FieldName = 'KOLOTP_RAZM'
      Precision = 15
      Size = 4
    end
  end
  object dsSpecOstRazm: TDataSource
    DataSet = cdsSpecOstRazm
    Left = 264
    Top = 188
  end
  object dsSpecNerazm: TDataSource
    DataSet = cdsSpecOstNerazm
    Left = 228
    Top = 188
  end
  object mteFactTable: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DAT'
        DataType = ftTimeStamp
      end
      item
        Name = 'CENA'
        DataType = ftFMTBcd
        Precision = 32
        Size = 8
      end
      item
        Name = 'ZAKUPKA'
        DataType = ftFloat
      end
      item
        Name = 'CENA_FROM'
        DataType = ftFloat
      end
      item
        Name = 'ID_ANALOG'
        DataType = ftInteger
      end
      item
        Name = 'ID_POST'
        DataType = ftInteger
      end
      item
        Name = 'ID_TOVAR'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    OnCalcFields = cdsSravnPriceCalcFields
    Left = 388
    Top = 92
    object mteFactTableDAT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 10
      FieldName = 'DAT'
      DisplayFormat = 'dd.mm.yy'
    end
    object mteFactTablePOST: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'POST'
      LookupDataSet = dmdEx.cdsPost
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_POST'
      Size = 50
      Lookup = True
    end
    object mteFactTableANALOG: TStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      FieldKind = fkLookup
      FieldName = 'ANALOG'
      LookupDataSet = dmdEx.cdsTovar
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_ANALOG'
      Size = 50
      Lookup = True
    end
    object mteFactTableTOVAR: TStringField
      DisplayLabel = #1058#1086#1095#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'TOVAR'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_TOVAR'
      Size = 50
      Lookup = True
    end
    object mteFactTableCENA: TFMTBCDField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'CENA'
      DisplayFormat = '0.0000'
    end
    object mteFactTableZAKUPKA: TFloatField
      DisplayLabel = #1047#1072#1082#1091#1087#1082#1072
      FieldName = 'ZAKUPKA'
      DisplayFormat = '0.0000'
    end
    object mteFactTableCENA_FROM: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1074' '#1074#1072#1083#1102#1090#1077
      FieldName = 'CENA_FROM'
      DisplayFormat = '0.0000'
    end
    object mteFactTableID_ANALOG: TIntegerField
      FieldName = 'ID_ANALOG'
      Visible = False
    end
    object mteFactTableID_POST: TIntegerField
      FieldName = 'ID_POST'
      Visible = False
    end
    object mteFactTableID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
      Visible = False
    end
  end
end
