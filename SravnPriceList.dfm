object frmSravnPriceList: TfrmSravnPriceList
  Left = 77
  Top = 139
  BorderStyle = bsDialog
  Caption = #1057#1087#1080#1089#1086#1082' '#1089#1088#1072#1074#1085#1077#1085#1080#1081' '#1087#1088#1072#1081#1089#1086#1074
  ClientHeight = 404
  ClientWidth = 621
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
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 225
    Width = 621
    Height = 8
    Cursor = crVSplit
    Align = alTop
    Beveled = True
    ResizeStyle = rsUpdate
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 621
    Height = 225
    Align = alTop
    BevelOuter = bvNone
    Constraints.MinHeight = 225
    TabOrder = 0
    DesignSize = (
      621
      225)
    object dbgNaklo: TDBGridEh
      Left = 1
      Top = 8
      Width = 536
      Height = 209
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoFitColWidths = True
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
      OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghRowHighlight]
      PopupMenu = ppmGrid1
      ReadOnly = True
      SortLocal = True
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
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'MANAGER'
          Footers = <>
          Width = 117
        end
        item
          EditButtons = <>
          FieldName = 'CURRENCY'
          Footers = <>
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
          Width = 203
        end
        item
          EditButtons = <>
          FieldName = 'ID_NAKL'
          Footers = <>
          Width = 2
        end>
    end
    object Panel4: TPanel
      Left = 544
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
        Top = 151
        Width = 71
        Height = 25
        Action = actRefresh
        Anchors = [akLeft, akRight, akBottom]
        Caption = #1054#1073#1085#1086#1074#1080#1090#1100
        TabOrder = 3
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
        TabOrder = 4
        TabStop = False
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 233
    Width = 621
    Height = 171
    Align = alClient
    BevelOuter = bvNone
    Constraints.MinHeight = 10
    TabOrder = 1
    object Splitter2: TSplitter
      Left = 293
      Top = 0
      Height = 171
      Beveled = True
      ResizeStyle = rsUpdate
    end
    object dbgNaklot: TDBGridEh
      Left = 0
      Top = 0
      Width = 293
      Height = 171
      Align = alLeft
      AllowedOperations = [alopUpdateEh, alopDeleteEh, alopAppendEh]
      AutoFitColWidths = True
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
      OnExit = dbgNaklotExit
      OnKeyDown = dbgNaklotKeyDown
      Columns = <
        item
          Checkboxes = True
          EditButtons = <>
          FieldName = 'IN_LIST'
          Footer.ValueType = fvtCount
          Footers = <>
          KeyList.Strings = (
            '1'
            '0')
          Width = 32
        end
        item
          AutoDropDown = True
          DropDownRows = 20
          EditButtons = <>
          FieldName = 'TOVAR'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'KOLOTP'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'CENA'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'POST_BEST'
          Footers = <>
        end>
    end
    object dbgNaklot2: TDBGridEh
      Left = 296
      Top = 0
      Width = 325
      Height = 171
      Align = alClient
      AllowedOperations = [alopUpdateEh, alopDeleteEh, alopAppendEh]
      AutoFitColWidths = True
      DataSource = dsNaklot2
      EditActions = [geaCopyEh, geaPasteEh]
      Flat = False
      FooterColor = clInfoBk
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghRowHighlight]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      VertScrollBar.VisibleMode = sbAlwaysShowEh
      OnExit = dbgNaklotExit
      OnKeyDown = dbgNaklotKeyDown
      Columns = <
        item
          Checkboxes = True
          EditButtons = <>
          FieldName = 'IN_LIST'
          Footer.ValueType = fvtCount
          Footers = <>
          KeyList.Strings = (
            '1'
            '0')
        end
        item
          Checkboxes = True
          EditButtons = <>
          FieldName = 'ID_POS'
          Footers = <>
          KeyList.Strings = (
            '1'
            '0')
        end
        item
          EditButtons = <>
          FieldName = 'POST'
          Footers = <>
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
  object ActionList1: TActionList
    Left = 456
    Top = 304
    object actSettings: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      ShortCut = 16465
      OnExecute = actSettingsExecute
    end
    object actGrid1ListShow: TAction
      Caption = #1057#1088#1072#1074#1085#1077#1085#1080#1077' '#1087#1088#1072#1081#1089#1086#1074
      OnExecute = actGrid1ListShowExecute
    end
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ShortCut = 116
      OnExecute = actRefreshExecute
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
    object actGrid1SklOborotyShow: TAction
      Caption = #1054#1073#1086#1088#1086#1090#1099' '#1089#1082#1083#1072#1076#1072
      OnExecute = actGrid1SklOborotyShowExecute
    end
    object actGrid1SravnPriceSpecShow: TAction
      Caption = 'C'#1088#1072#1074#1085#1077#1085#1080#1077' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1081
      OnExecute = actGrid1SravnPriceSpecShowExecute
    end
    object actShowSpec: TAction
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1079#1072#1074#1080#1089#1080#1084#1099#1077' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1080
      OnExecute = actShowSpecExecute
    end
    object actPost: TAction
      Caption = #1055#1088#1086#1074#1077#1089#1090#1080
      OnExecute = actPostExecute
    end
  end
  object sdsNaklo: TSQLDataSet
    CommandText = 
      'select'#13#10'    ID_NAKL,'#13#10'    ID,'#13#10'    ID_MANAGER,'#13#10'    DAT,'#13#10'    PO' +
      'STED,'#13#10'    BLOCKED,'#13#10'    DELMARKED,'#13#10'    id_sklad,'#13#10'    COMMENT'#13 +
      #10'from '#13#10'  SRAVN_PRICE_VW n'#13#10'order by'#13#10'  n.dat, n.id_nakl'#13#10
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
    object sdsNakloID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
    end
    object sdsNakloDAT: TSQLTimeStampField
      FieldName = 'DAT'
      Required = True
    end
    object sdsNakloPOSTED: TSmallintField
      FieldName = 'POSTED'
      Required = True
    end
    object sdsNakloBLOCKED: TSmallintField
      FieldName = 'BLOCKED'
      Required = True
    end
    object sdsNakloDELMARKED: TSmallintField
      FieldName = 'DELMARKED'
      Required = True
    end
    object sdsNakloCOMMENT: TStringField
      FieldName = 'COMMENT'
      Size = 50
    end
    object sdsNakloID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
      Required = True
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
        Name = 'ID_MANAGER'
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
        Name = 'BLOCKED'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'DELMARKED'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'COMMENT'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ID_SKLAD'
        Attributes = [faRequired]
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
    object cdsNakloID_NAKL: TIntegerField
      DisplayLabel = #1048#1076#1077#1085#1090
      FieldName = 'ID_NAKL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsNakloID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
      Required = True
    end
    object cdsNakloPOSTED: TSmallintField
      DisplayLabel = #1055#1088#1086#1074#1077#1076#1077#1085#1086
      FieldName = 'POSTED'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsNakloCOMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'COMMENT'
      Size = 50
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
    object cdsNakloDELMARKED: TSmallintField
      FieldName = 'DELMARKED'
      Required = True
    end
    object cdsNakloID: TStringField
      DisplayLabel = #8470#1087'.'#1087'.'
      FieldName = 'ID'
      Size = 10
    end
    object cdsNakloBLOCKED: TSmallintField
      DisplayLabel = #1041#1083#1086#1082
      FieldName = 'BLOCKED'
      Required = True
    end
    object cdsNakloID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
      Required = True
    end
    object cdsNakloCURRENCY: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      FieldKind = fkLookup
      FieldName = 'CURRENCY'
      LookupDataSet = dmdEx.cdsCurrency
      LookupKeyFields = 'OID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_SKLAD'
      Lookup = True
    end
  end
  object sdsPost: TSQLDataSet
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 456
    Top = 208
  end
  object sdsUnpost: TSQLDataSet
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <>
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
      object N7: TMenuItem
        Action = actShowDeleted
      end
      object N8: TMenuItem
        Action = actUndeleteNakl
      end
    end
  end
  object qeNaklo: TQueryExtender
    SlaveQueryExtender = qeNaklot2
    Query = cdsNaklo
    KeyField = 'id_nakl'
    Left = 392
    Top = 176
  end
  object sdsDelmark: TSQLDataSet
    CommandText = 'SRAVN_PRICE_DELMARK_PC'
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
      'select '#13#10'  d.ID_NAKLD,'#13#10'  d.ID_NAKL,'#13#10'  d.ID_POS,'#13#10'  d.ID_TOVAR,' +
      #13#10'  d.kolotp,'#13#10'  d.kolotp_prognoz,'#13#10'  d.IN_LIST,'#13#10'  d.KOEF,'#13#10'  d' +
      '.cena,'#13#10'  d.cena_from,'#13#10'  d.procent,'#13#10'  d.id_post,'#13#10'  d.id_post_' +
      'best'#13#10'from '#13#10'  SRAVN_PRICE_DET_VW d '#13#10'  inner join tovar t '#13#10'  o' +
      'n t.oid=d.id_tovar'#13#10'where '#13#10'  d.id_nakl=:id_nakl'#13#10'order by '#13#10'   ' +
      'upper(t.gruppa1),t.gruppa2,t.gruppa3,t.gruppa4'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_NAKL'
        ParamType = ptInput
        Value = 258
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
      Size = 6
    end
    object sdsNaklotIN_LIST: TIntegerField
      FieldName = 'IN_LIST'
    end
    object sdsNaklotKOLOTP_PROGNOZ: TFMTBCDField
      FieldName = 'KOLOTP_PROGNOZ'
      Precision = 15
      Size = 4
    end
    object sdsNaklotKOEF: TFMTBCDField
      FieldName = 'KOEF'
      Precision = 15
      Size = 4
    end
    object sdsNaklotPROCENT: TFMTBCDField
      FieldName = 'PROCENT'
      Precision = 15
      Size = 4
    end
    object sdsNaklotID_POST: TIntegerField
      FieldName = 'ID_POST'
    end
    object sdsNaklotID_POST_BEST: TIntegerField
      FieldName = 'ID_POST_BEST'
    end
    object sdsNaklotCENA_FROM: TFMTBCDField
      FieldName = 'CENA_FROM'
      Precision = 15
      Size = 4
    end
    object sdsNaklotCENA: TFMTBCDField
      FieldName = 'CENA'
      Precision = 15
      Size = 4
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
        Size = 6
      end
      item
        Name = 'IN_LIST'
        DataType = ftInteger
      end
      item
        Name = 'KOLOTP_PROGNOZ'
        DataType = ftFMTBcd
        Precision = 15
        Size = 4
      end
      item
        Name = 'KOEF'
        DataType = ftFMTBcd
        Precision = 15
        Size = 4
      end
      item
        Name = 'PROCENT'
        DataType = ftFMTBcd
        Precision = 15
        Size = 4
      end
      item
        Name = 'ID_POST'
        DataType = ftInteger
      end
      item
        Name = 'ID_POST_BEST'
        DataType = ftInteger
      end
      item
        Name = 'CENA_FROM'
        DataType = ftFMTBcd
        Precision = 15
        Size = 4
      end
      item
        Name = 'CENA'
        DataType = ftFMTBcd
        Precision = 15
        Size = 4
      end>
    IndexDefs = <>
    IndexFieldNames = 'ID_NAKL'
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
    BeforePost = cdsNaklotBeforePost
    OnReconcileError = cdsNaklotReconcileError
    Left = 312
    Top = 304
    object cdsNaklotID_NAKLD: TIntegerField
      FieldName = 'ID_NAKLD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
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
    object cdsNaklotTOVAR: TStringField
      DisplayLabel = #1058#1086#1074#1072#1088
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
    object cdsNaklotKOLOTP: TFMTBCDField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'KOLOTP'
      DisplayFormat = '0.000'
      Precision = 15
      Size = 6
    end
    object cdsNaklotIN_LIST: TIntegerField
      DisplayLabel = #1059#1095#1072#1089#1090#1074#1091#1077#1090' '#1074' '#1089#1088#1072#1074#1085#1077#1085#1080#1080
      FieldName = 'IN_LIST'
    end
    object cdsNaklotKOLOTP_PROGNOZ: TFMTBCDField
      FieldName = 'KOLOTP_PROGNOZ'
      Precision = 15
      Size = 4
    end
    object cdsNaklotCENA: TFMTBCDField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'CENA'
      DisplayFormat = '0.0000'
      Precision = 15
      Size = 4
    end
    object cdsNaklotKOEF: TFMTBCDField
      DisplayLabel = #1050#1086#1101#1092#1080#1094#1080#1077#1085#1090
      FieldName = 'KOEF'
      Precision = 15
      Size = 4
    end
    object cdsNaklotPROCENT: TFMTBCDField
      FieldName = 'PROCENT'
      Precision = 15
      Size = 4
    end
    object cdsNaklotID_POST: TIntegerField
      FieldName = 'ID_POST'
    end
    object cdsNaklotID_POST_BEST: TIntegerField
      FieldName = 'ID_POST_BEST'
    end
    object cdsNaklotPOST: TStringField
      DisplayLabel = #1051#1091#1095#1096#1080#1081' '#1087#1086#1089#1090#1072#1074#1097#1080#1082
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'POST_BEST'
      LookupDataSet = dmdEx.cdsPost
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_POST_BEST'
      Size = 50
      Lookup = True
    end
    object cdsNaklotCENA_FROM: TFMTBCDField
      FieldName = 'CENA_FROM'
      DisplayFormat = '0.0000'
      Precision = 15
      Size = 4
    end
  end
  object dsNaklot: TDataSource
    DataSet = cdsNaklot
    Left = 312
    Top = 336
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmSravnPriceList'
    StorageManager = rpsClientEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.Top'
      '<P>.Width'
      'Panel1.dbgNaklot.<P>.Columns.<ForAllItems>.Width'
      'Panel1.dbgNaklot.<P>.Width'
      'Panel1.dbgNaklot2.<P>.Columns.<ForAllItems>.Width'
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
  object frddNaklo: TfrxDBDataset
    UserName = 'frddNaklo'
    CloseDataSource = False
    DataSet = cdsNaklot
    Left = 392
    Top = 368
  end
  object sdsNaklot2: TSQLDataSet
    CommandText = 
      'select '#13#10'    ID_NAKLD,'#13#10'    ID_NAKL,'#13#10'    ID_POS,'#13#10'    ID_POST,'#13 +
      #10'    DAT,'#13#10'    KURS,'#13#10'    IN_LIST'#13#10'from '#13#10'  SRAVN_PRICE_DET2_VW ' +
      'd '#13#10'where '#13#10'  d.id_nakl=:id_nakl'#13#10'order by '#13#10'   d.id_pos,d.id_na' +
      'kld'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_nakl'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 280
    Top = 208
    object sdsNaklot2ID_NAKLD: TIntegerField
      FieldName = 'ID_NAKLD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsNaklot2ID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      Required = True
    end
    object sdsNaklot2ID_POS: TIntegerField
      FieldName = 'ID_POS'
    end
    object sdsNaklot2ID_POST: TIntegerField
      FieldName = 'ID_POST'
    end
    object sdsNaklot2DAT: TSQLTimeStampField
      FieldName = 'DAT'
    end
    object sdsNaklot2IN_LIST: TIntegerField
      FieldName = 'IN_LIST'
    end
    object sdsNaklot2KURS: TFMTBCDField
      FieldName = 'KURS'
      Precision = 15
      Size = 6
    end
  end
  object dspNaklot2: TDataSetProvider
    DataSet = sdsNaklot2
    UpdateMode = upWhereKeyOnly
    Left = 280
    Top = 272
  end
  object cdsNaklot2: TClientDataSet
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
        DataType = ftInteger
      end
      item
        Name = 'ID_POST'
        DataType = ftInteger
      end
      item
        Name = 'DAT'
        DataType = ftTimeStamp
      end
      item
        Name = 'IN_LIST'
        DataType = ftInteger
      end
      item
        Name = 'KURS'
        DataType = ftFMTBcd
        Precision = 15
        Size = 6
      end>
    IndexDefs = <>
    IndexFieldNames = 'ID_NAKL;id_pos;id_nakld'
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
    ProviderName = 'dspNaklot2'
    StoreDefs = True
    BeforeInsert = cdsNaklot2BeforeInsert
    AfterInsert = cdsNaklot2AfterInsert
    BeforePost = cdsNaklot2BeforePost
    OnReconcileError = cdsNaklotReconcileError
    Left = 280
    Top = 304
    object IntegerField6: TIntegerField
      FieldName = 'ID_NAKLD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object IntegerField7: TIntegerField
      DisplayLabel = #1048#1076#1077#1085#1090
      DisplayWidth = 1
      FieldName = 'ID_NAKL'
      Required = True
      Visible = False
    end
    object IntegerField8: TIntegerField
      DisplayLabel = #1048#1089#1082#1083#1102#1095#1105#1085
      FieldName = 'ID_POS'
      Required = True
      Visible = False
    end
    object cdsNaklot2POST: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'POST'
      LookupDataSet = dmdEx.cdsPost
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_POST'
      Size = 50
      Lookup = True
    end
    object IntegerField10: TIntegerField
      DisplayLabel = #1059#1095#1072#1089#1090#1074#1091#1077#1090' '#1074' '#1089#1088#1072#1074#1085#1077#1085#1080#1080
      FieldName = 'IN_LIST'
    end
    object cdsNaklot2ID_POST: TIntegerField
      FieldName = 'ID_POST'
      Visible = False
    end
    object cdsNaklot2DAT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 10
      FieldName = 'DAT'
      DisplayFormat = 'dd.mm.yy'
    end
    object cdsNaklot2KURS: TFMTBCDField
      DisplayLabel = #1050#1091#1088#1089
      DisplayWidth = 7
      FieldName = 'KURS'
      DisplayFormat = '0.00#'
      Precision = 15
      Size = 6
    end
  end
  object dsNaklot2: TDataSource
    DataSet = cdsNaklot2
    Left = 280
    Top = 336
  end
  object ppmGrid1: TPopupMenu
    Left = 280
    Top = 144
    object actGrid1ListShow1: TMenuItem
      Action = actGrid1ListShow
    end
    object N3: TMenuItem
      Action = actGrid1SklOborotyShow
    end
    object N4: TMenuItem
      Action = actGrid1SravnPriceSpecShow
    end
    object N5: TMenuItem
      Action = actShowSpec
    end
  end
  object qeNaklot: TQueryExtender
    Query = cdsNaklot
    KeyField = 'id_nakld'
    Left = 312
    Top = 176
  end
  object qeNaklot2: TQueryExtender
    Query = cdsNaklot2
    KeyField = 'id_nakld'
    Left = 280
    Top = 176
  end
  object UnfFilter3: TUnfFilter
    DBGridEh = dbgNaklot2
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
    Left = 376
    Top = 112
  end
end
