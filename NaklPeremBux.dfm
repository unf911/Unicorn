object frmNaklPeremBux: TfrmNaklPeremBux
  Left = 162
  Top = 121
  BorderStyle = bsDialog
  Caption = #1055#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103
  ClientHeight = 403
  ClientWidth = 630
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
    Width = 630
    Height = 8
    Cursor = crVSplit
    Align = alTop
    Beveled = True
    ResizeStyle = rsUpdate
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 630
    Height = 225
    Align = alTop
    BevelOuter = bvNone
    Constraints.MinHeight = 225
    TabOrder = 0
    DesignSize = (
      630
      225)
    object dbgNaklo: TDBGridEh
      Left = 1
      Top = 8
      Width = 545
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
          Width = 124
        end
        item
          EditButtons = <>
          FieldName = 'SKLAD_TO'
          Footers = <>
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
          Visible = False
          Width = 40
        end>
    end
    object Panel4: TPanel
      Left = 553
      Top = 8
      Width = 71
      Height = 216
      Anchors = [akTop, akRight]
      BevelOuter = bvNone
      Constraints.MinHeight = 216
      TabOrder = 1
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
        Anchors = [akLeft, akTop, akRight]
        Caption = #1042'&'#1077#1088#1085#1091#1090#1100
        TabOrder = 1
        TabStop = False
        OnClick = btnUnpostClick
      end
      object BitBtn5: TBitBtn
        Left = 0
        Top = 183
        Width = 71
        Height = 25
        Action = actSettings
        Anchors = [akLeft, akRight, akBottom]
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
        TabOrder = 2
        TabStop = False
      end
      object BitBtn7: TBitBtn
        Left = 0
        Top = 155
        Width = 71
        Height = 25
        Action = actRefresh
        Anchors = [akLeft, akRight, akBottom]
        Caption = #1054#1073#1085#1086#1074#1080#1090#1100
        TabOrder = 3
        TabStop = False
        Kind = bkRetry
      end
      object BitBtn3: TBitBtn
        Left = 0
        Top = 124
        Width = 71
        Height = 24
        Action = actPreview
        Anchors = [akLeft, akRight, akBottom]
        Caption = #1055#1088#1086#1089#1084#1086#1090#1088
        TabOrder = 4
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
        Left = 0
        Top = 76
        Width = 71
        Height = 9
        Action = actDesign
        Anchors = [akTop, akRight]
        Caption = #1044#1080#1079#1072#1081#1085#1077#1088
        TabOrder = 5
      end
    end
  end
  object dbgNaklot: TDBGridEh
    Left = 0
    Top = 233
    Width = 630
    Height = 170
    Align = alClient
    AllowedOperations = [alopInsertEh, alopDeleteEh, alopAppendEh]
    Constraints.MinHeight = 10
    DataSource = dsNaklot
    EditActions = [geaCopyEh, geaPasteEh, geaSelectAllEh]
    Flat = False
    FooterColor = clInfoBk
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight]
    PopupMenu = PopupMenu2
    ReadOnly = True
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
      end>
  end
  object ActionList1: TActionList
    Images = dmdEx.ImageList1
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
    object actSchet: TAction
      Caption = #1048#1079' '#1089#1095#1105#1090#1072
      ShortCut = 120
    end
    object actCalculateSum: TAction
      Caption = 'actCalculateSum'
      OnExecute = actCalculateSumExecute
    end
    object actShowDeleted: TAction
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1091#1076#1072#1083#1105#1085#1085#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
      OnExecute = actShowDeletedExecute
    end
    object actBlock: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
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
    object actAddDet: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1079#1080#1094#1080#1080' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1090#1086#1074#1072#1088#1086#1074
    end
    object actShowSravnPriceList: TAction
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1088#1086#1076#1080#1090#1077#1083#1100#1089#1082#1086#1077' '#1089#1088#1072#1074#1085#1077#1085#1080#1077' '#1087#1088#1072#1081#1089#1086#1074
      OnExecute = actShowSravnPriceListExecute
    end
    object actSetColumnValue: TAction
      Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077#1084
      OnExecute = actSetColumnValueExecute
    end
    object actIncColumnValue: TAction
      Caption = #1055#1088#1080#1073#1072#1074#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077
      OnExecute = actIncColumnValueExecute
    end
    object actMultColumnValue: TAction
      Caption = #1059#1084#1085#1086#1078#1080#1090#1100' '#1085#1072' '#1079#1085#1072#1095#1077#1085#1080#1077
      OnExecute = actMultColumnValueExecute
    end
    object actMakeSpec: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1077' '#1085#1072' '#1086#1089#1085#1086#1074#1072#1085#1080#1080'...'
      OnExecute = actMakeSpecExecute
    end
    object actMakeSpecDet: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1102' '#1085#1072' '#1086#1089#1085#1086#1074#1072#1085#1080#1080'...'
      OnExecute = actMakeSpecDetExecute
    end
    object actPreview: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      ImageIndex = 2
      OnExecute = actPreviewExecute
    end
    object actPreviewPrice: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1089' '#1094#1077#1085#1072#1084#1080' '#1080#1079' '#1087#1088#1072#1081#1089#1072
      ImageIndex = 2
      OnExecute = actPreviewPriceExecute
    end
    object actDesign: TAction
      Caption = #1044#1080#1079#1072#1081#1085#1077#1088
      Visible = False
      OnExecute = actDesignExecute
    end
    object actPost: TAction
      Caption = #1055#1088#1086#1074#1077#1089#1090#1080
      OnExecute = actPostExecute
    end
    object actPreviewTtn: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1058#1058#1053
      ImageIndex = 2
      OnExecute = actPreviewTtnExecute
    end
    object actDebug: TAction
      Caption = #1056#1077#1078#1080#1084' '#1086#1090#1083#1072#1076#1082#1080
      OnExecute = actDebugExecute
    end
  end
  object sdsNaklo: TSQLDataSet
    CommandText = 
      'select'#13#10'  n.id,'#13#10'  n.id_nakl,'#13#10'  n.id_sklad,'#13#10'  n.id_sklad_to,'#13#10 +
      '  n.dat,'#13#10'  n.posted,'#13#10'  n.comment, '#13#10'  n.id_izg,'#13#10'  n.id_manage' +
      'r,'#13#10'  n.delmarked,'#13#10'  n.id_vygruzka'#13#10'from  NAKL_PEREM_BUX_VW n'#13#10 +
      'order by n.dat, n.id, n.id_nakl'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'dat_from'
        ParamType = ptInput
        Value = 38139d
      end
      item
        DataType = ftDate
        Name = 'dat_to'
        ParamType = ptInput
        Value = 38169d
      end>
    SQLConnection = dmdEx.scUchet
    Left = 392
    Top = 208
    object sdsNakloID: TStringField
      FieldName = 'ID'
    end
    object sdsNakloID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsNakloID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
      Required = True
    end
    object sdsNakloID_SKLAD_TO: TIntegerField
      FieldName = 'ID_SKLAD_TO'
    end
    object sdsNakloDAT: TSQLTimeStampField
      FieldName = 'DAT'
      Required = True
    end
    object sdsNakloPOSTED: TSmallintField
      FieldName = 'POSTED'
      Required = True
    end
    object sdsNakloCOMMENT: TStringField
      FieldName = 'COMMENT'
      Size = 50
    end
    object sdsNakloID_IZG: TIntegerField
      FieldName = 'ID_IZG'
    end
    object sdsNakloID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
    end
    object sdsNakloDELMARKED: TSmallintField
      FieldName = 'DELMARKED'
      Required = True
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
        Name = 'ID'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ID_NAKL'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ID_SKLAD'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ID_SKLAD_TO'
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
        Name = 'COMMENT'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ID_IZG'
        DataType = ftInteger
      end
      item
        Name = 'ID_MANAGER'
        DataType = ftInteger
      end
      item
        Name = 'DELMARKED'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'ID_VYGRUZKA'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftDate
        Name = 'dat_from'
        ParamType = ptInput
        Value = 38139d
      end
      item
        DataType = ftDate
        Name = 'dat_to'
        ParamType = ptInput
        Value = 38169d
      end>
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
    object cdsNakloID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
      Required = True
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
    object cdsNakloMANAGER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      FieldKind = fkLookup
      FieldName = 'MANAGER'
      LookupDataSet = dmdEx.cdsManager
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_MANAGER'
      Size = 50
      Lookup = True
    end
    object cdsNakloDAT: TSQLTimeStampField
      FieldName = 'DAT'
      Required = True
      DisplayFormat = 'dd.mm.yy'
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
    object cdsNakloSKLAD: TStringField
      DisplayLabel = #1057#1082#1083#1072#1076
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'SKLAD'
      LookupDataSet = dmdEx.cdsSklads
      LookupKeyFields = 'OID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_SKLAD'
      Size = 50
      Lookup = True
    end
    object cdsNakloID_SKLAD_TO: TIntegerField
      FieldName = 'ID_SKLAD_TO'
      Visible = False
    end
    object cdsNakloSKLAD_TO: TStringField
      DisplayLabel = #1057#1082#1083#1072#1076' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'SKLAD_TO'
      LookupDataSet = dmdEx.cdsSklads
      LookupKeyFields = 'OID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_SKLAD_TO'
      Size = 50
      Lookup = True
    end
    object cdsNakloIZGFULLNAME: TStringField
      FieldKind = fkLookup
      FieldName = 'IZGFULLNAME'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'FULLNAME'
      KeyFields = 'ID_IZG'
      Size = 250
      Lookup = True
    end
    object cdsNakloSKLADFULLNAME: TStringField
      FieldKind = fkLookup
      FieldName = 'SKLAD_FULLNAME'
      LookupDataSet = dmdEx.cdsSklads
      LookupKeyFields = 'OID'
      LookupResultField = 'FULLNAME'
      KeyFields = 'ID_SKLAD'
      Size = 250
      Lookup = True
    end
    object cdsNakloSKLAD_TO_FULLNAME: TStringField
      FieldKind = fkLookup
      FieldName = 'SKLAD_TO_FULLNAME'
      LookupDataSet = dmdEx.cdsSklads
      LookupKeyFields = 'OID'
      LookupResultField = 'FULLNAME'
      KeyFields = 'ID_SKLAD_TO'
      Size = 250
      Lookup = True
    end
    object cdsNakloID_VYGRUZKA: TIntegerField
      FieldName = 'ID_VYGRUZKA'
    end
    object cdsNakloREYS_POKUPATEL_PLATIT: TIntegerField
      FieldKind = fkLookup
      FieldName = 'REYS_POKUPATEL_PLATIT'
      LookupDataSet = dmdEx.cdsVygruzka
      LookupKeyFields = 'ID_VYGRUZKA'
      LookupResultField = 'POKUPATEL_PLATIT'
      KeyFields = 'ID_VYGRUZKA'
      Lookup = True
    end
    object cdsNakloREYS_NOMER_PRITSEPA: TStringField
      FieldKind = fkLookup
      FieldName = 'REYS_NOMER_PRITSEPA'
      LookupDataSet = dmdEx.cdsVygruzka
      LookupKeyFields = 'ID_VYGRUZKA'
      LookupResultField = 'NOMER_PRITSEPA'
      KeyFields = 'ID_VYGRUZKA'
      Size = 50
      Lookup = True
    end
    object cdsNakloREYS_PUNKT_VYGRUZKI: TStringField
      FieldKind = fkLookup
      FieldName = 'REYS_PUNKT_VYGRUZKI'
      LookupDataSet = dmdEx.cdsVygruzka
      LookupKeyFields = 'ID_VYGRUZKA'
      LookupResultField = 'PUNKT_VYGRUZKI'
      KeyFields = 'ID_VYGRUZKA'
      Lookup = True
    end
    object cdsNakloREYS_PUNKT_ZAGRUZKI: TStringField
      FieldKind = fkLookup
      FieldName = 'REYS_PUNKT_ZAGRUZKI'
      LookupDataSet = dmdEx.cdsVygruzka
      LookupKeyFields = 'ID_VYGRUZKA'
      LookupResultField = 'PUNKT_ZAGRUZKI'
      KeyFields = 'ID_VYGRUZKA'
      Size = 50
      Lookup = True
    end
    object cdsNakloREYS_PEREVOZCHIK: TStringField
      FieldKind = fkLookup
      FieldName = 'REYS_PEREVOZCHIK'
      LookupDataSet = dmdEx.cdsVygruzka
      LookupKeyFields = 'ID_VYGRUZKA'
      LookupResultField = 'PEREVOZCHIK'
      KeyFields = 'ID_VYGRUZKA'
      Size = 50
      Lookup = True
    end
    object cdsNakloREYS_DAT_REYS: TSQLTimeStampField
      FieldKind = fkLookup
      FieldName = 'REYS_DAT_REYS'
      LookupDataSet = dmdEx.cdsVygruzka
      LookupKeyFields = 'ID_VYGRUZKA'
      LookupResultField = 'DAT_REYS'
      KeyFields = 'ID_VYGRUZKA'
      Lookup = True
    end
    object cdsNakloREYS_FIO_VODITELYA: TStringField
      FieldKind = fkLookup
      FieldName = 'REYS_FIO_VODITELYA'
      LookupDataSet = dmdEx.cdsVygruzka
      LookupKeyFields = 'ID_VYGRUZKA'
      LookupResultField = 'FIO_VODITELYA'
      KeyFields = 'ID_VYGRUZKA'
      Size = 50
      Lookup = True
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
    CommandText = 'NAKL_PEREM_BUX_POST_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_NAKL'
        ParamType = ptInput
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
    CommandText = 'NAKL_PEREM_BUX_UNPOST_PC'
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
    Images = dmdEx.ImageList1
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
      object N7: TMenuItem
        Action = actShowDeleted
      end
      object N8: TMenuItem
        Action = actUndeleteNakl
      end
      object N3: TMenuItem
        Action = actPreview
      end
      object N4: TMenuItem
        Action = actPreviewPrice
      end
      object actPreviewTtn1: TMenuItem
        Action = actPreviewTtn
      end
      object N9: TMenuItem
        Action = actDebug
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
    object N15: TMenuItem
      Action = actMakeSpec
    end
    object N5: TMenuItem
      Action = actPreview
    end
    object N6: TMenuItem
      Action = actPreviewPrice
    end
  end
  object sdsRepNaklo: TSQLDataSet
    CommandText = 'select *'#13#10'from  rep_nakl_perem_bux_pc(:id_nakl,:mode)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_nakl'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'mode'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = dmdEx.scUchet
    Left = 488
    Top = 208
  end
  object frRepNaklo: TfrxReport
    Version = '3.23.7'
    DataSet = frDBNaklot
    DataSetName = 'frDBNaklot'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38981.610688993050000000
    ReportOptions.LastChange = 38981.610688993050000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frRepNakloGetValue
    Left = 488
    Top = 336
    Datasets = <>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
    end
  end
  object frDBNaklot: TfrxDBDataset
    UserName = 'frDBNaklot'
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
    AggregatesActive = True
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_nakl'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'mode'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspRepNaklo'
    Left = 488
    Top = 272
    object cdsRepNakloTOVAR: TStringField
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
    object cdsRepNakloFULLNAME: TStringField
      DisplayLabel = #1055#1086#1083#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
      FieldKind = fkLookup
      FieldName = 'FULLNAME'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'FULLNAME'
      KeyFields = 'ID_TOVAR'
      Size = 250
      Lookup = True
    end
    object cdsRepNakloEDIZ: TStringField
      FieldKind = fkLookup
      FieldName = 'EDIZ'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'EDIZ'
      KeyFields = 'ID_TOVAR'
      Lookup = True
    end
    object cdsRepNakloID_POS: TIntegerField
      FieldName = 'ID_POS'
    end
    object cdsRepNakloID_NAKLD: TIntegerField
      FieldName = 'ID_NAKLD'
    end
    object cdsRepNakloID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
    end
    object cdsRepNakloID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
    end
    object cdsRepNakloKOLOTP: TFMTBCDField
      FieldName = 'KOLOTP'
      Precision = 15
      Size = 4
    end
    object cdsRepNakloCENA: TFloatField
      FieldName = 'CENA'
    end
    object cdsRepNakloNALOG_NDS: TFloatField
      FieldName = 'NALOG_NDS'
    end
    object cdsRepNakloSUMA: TFloatField
      FieldName = 'SUMA'
    end
    object cdsRepNakloSUMNDS: TAggregateField
      FieldName = 'SUMNDS'
      Active = True
      Expression = 'Sum(SUMA)'
    end
  end
  object sdsDelmark: TSQLDataSet
    CommandText = 'DELMARK_OBJECT_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'OID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CLASSID'
        ParamType = ptInput
        Value = 8660
      end>
    SQLConnection = dmdEx.scUchet
    Left = 456
    Top = 176
  end
  object sdsNaklot: TSQLDataSet
    CommandText = 
      'select '#13#10'  d.id_nakld,'#13#10'  d.id_nakl,'#13#10'  d.id_pos,'#13#10'  d.id_tovar,' +
      #13#10'  d.kolotp'#13#10'from '#13#10'  NAKL_PEREM_BUX_DET_VW d '#13#10'where '#13#10'  d.id_' +
      'nakl=:id_nakl'
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
    object sdsNaklotKOLOTP: TFMTBCDField
      FieldName = 'KOLOTP'
      Precision = 15
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
        Name = 'KOLOTP'
        DataType = ftFMTBcd
        Precision = 15
        Size = 8
      end
      item
        Name = 'CENANDS'
        DataType = ftFloat
      end
      item
        Name = 'SUMA'
        DataType = ftFloat
      end
      item
        Name = 'SUMANDS'
        DataType = ftFloat
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
    OnReconcileError = cdsNaklotReconcileError
    Left = 312
    Top = 304
    object cdsNaklotID_NAKLD: TIntegerField
      FieldName = 'ID_NAKLD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
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
    object cdsNaklotKOLOTP: TFMTBCDField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      DisplayWidth = 10
      FieldName = 'KOLOTP'
      DisplayFormat = '0.000'
      Precision = 15
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
    object cdsNaklotFULLNAME: TStringField
      DisplayLabel = #1055#1086#1083#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
      FieldKind = fkLookup
      FieldName = 'FULLNAME'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'FULLNAME'
      KeyFields = 'ID_TOVAR'
      Size = 250
      Lookup = True
    end
    object cdsNaklotEDIZ: TStringField
      FieldKind = fkLookup
      FieldName = 'EDIZ'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'EDIZ'
      KeyFields = 'ID_TOVAR'
      Lookup = True
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
    Active = False
    Section = 'TfrmSpec'
    StorageManager = rpsClientEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
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
    object N11: TMenuItem
      Action = actSetColumnValue
    end
    object N12: TMenuItem
      Action = actIncColumnValue
    end
    object N13: TMenuItem
      Action = actMultColumnValue
    end
  end
  object mtePriceDetGen: TMemTableEh
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 553
    Top = 212
    object mtePriceDetGenID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
      Required = True
    end
    object mtePriceDetGenID_SEBEST: TIntegerField
      FieldName = 'ID_SEBEST'
    end
    object mtePriceDetGenCENA2: TFloatField
      FieldName = 'CENA'
    end
    object mtePriceDetGenKOLOTP: TFloatField
      FieldName = 'KOLOTP'
    end
    object mtePriceDetGenSKIDKA: TFloatField
      FieldName = 'SKIDKA'
    end
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object ID_TOVAR: TMTNumericDataFieldEh
          FieldName = 'ID_TOVAR'
          NumericDataType = fdtIntegerEh
          Alignment = taLeftJustify
          DisplayWidth = 0
          Required = True
          Visible = False
          currency = False
          Precision = 0
        end
        object ID_SEBEST: TMTNumericDataFieldEh
          FieldName = 'ID_SEBEST'
          NumericDataType = fdtIntegerEh
          Alignment = taLeftJustify
          DisplayWidth = 0
          Required = False
          Visible = False
          currency = False
          Precision = 0
        end
        object CENA: TMTNumericDataFieldEh
          FieldName = 'CENA'
          NumericDataType = fdtFloatEh
          Alignment = taLeftJustify
          DisplayWidth = 0
          Required = False
          Visible = False
          currency = False
          Precision = 0
        end
        object KOLOTP: TMTNumericDataFieldEh
          FieldName = 'KOLOTP'
          NumericDataType = fdtFloatEh
          Alignment = taLeftJustify
          DisplayWidth = 0
          Required = False
          Visible = False
          currency = False
          Precision = 0
        end
        object SKIDKA: TMTNumericDataFieldEh
          FieldName = 'SKIDKA'
          NumericDataType = fdtFloatEh
          Alignment = taLeftJustify
          DisplayWidth = 0
          Required = False
          Visible = False
          currency = False
          Precision = 0
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object dsPriceDetGen: TDataSource
    DataSet = mtePriceDetGen
    Left = 553
    Top = 247
  end
  object Curr2StrUA1: TCurr2StrRU
    Active = False
    MoneyType = mtUAH
    FullString = False
    Left = 376
    Top = 144
  end
  object frDBNaklo: TfrxDBDataset
    UserName = 'frDBNaklo'
    CloseDataSource = False
    DataSet = cdsNaklo
    Left = 520
    Top = 304
  end
  object frTtn: TfrxReport
    Version = '3.23.7'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38982.467101585700000000
    ReportOptions.LastChange = 40756.736308773200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Memo19OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo19, Engine do'
      '  begin'
      '    if <frdbNaklot."KOLOTP"> > 0 then'
      '      Font.Color := clBlack'
      '    else'
      '      Font.Color := clWhite;'
      '  end'
      'end;'
      ''
      ''
      ''
      'procedure Memo20OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo20, Engine do  begin'
      '    if <frdbNaklot."KOLOTP"> > 0 then'
      '      Font.Color := clBlack'
      '    else'
      '      Font.Color := clWhite;'
      '  end'
      'end;'
      ''
      'procedure Memo37OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo37, Engine do begin'
      '    if <frdbNaklot."KOLOTP"> > 0 then'
      '      Font.Color := clBlack'
      '    else'
      '      Font.Color := clWhite;'
      '  end'
      'end;'
      ''
      'procedure Memo38OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo38, Engine do begin'
      '    if <frdbNaklot."KOLOTP"> > 0 then'
      '      Font.Color := clBlack'
      '    else'
      '      Font.Color := clWhite;'
      '  end'
      'end;'
      ''
      'begin'
      'end.')
    StoreInDFM = False
    Left = 520
    Top = 336
    Datasets = <
      item
        DataSet = frDBNaklo
        DataSetName = 'frDBNaklo'
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
end
