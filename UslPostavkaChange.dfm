object frmUslPostavkaChange: TfrmUslPostavkaChange
  Left = 259
  Top = 0
  BorderStyle = bsDialog
  Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1103' '#1091#1089#1083#1086#1074#1080#1081' '#1087#1086#1089#1090#1072#1074#1082#1080
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
  OnDeactivate = FormDeactivate
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
  object dbgNaklot: TDBGridEh
    Left = 0
    Top = 233
    Width = 621
    Height = 171
    Align = alClient
    AllowedOperations = [alopUpdateEh, alopDeleteEh]
    Anchors = []
    Constraints.MinHeight = 10
    DataSource = dsNaklot
    EditActions = [geaCopyEh, geaPasteEh]
    Flat = False
    FooterColor = clInfoBk
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch]
    PopupMenu = PopupMenu2
    SortLocal = True
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
        EditButtons = <>
        FieldName = 'ID_POS'
        Footer.ValueType = fvtCount
        Footers = <>
        Width = 37
      end
      item
        AutoDropDown = True
        EditButtons = <
          item
            Style = ebsPlusEh
            OnClick = dbgNaklotColumns1EditButtons0Click
          end>
        FieldName = 'USL_POSTAVKA'
        Footers = <>
        Width = 104
      end
      item
        AutoDropDown = True
        DropDownBox.ListSource = dmdEx.dsTovarAllND
        DropDownRows = 20
        EditButtons = <>
        FieldName = 'TOVAR'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'TRANSPORT'
        Footers = <>
        Width = 46
      end
      item
        EditButtons = <>
        FieldName = 'TARA'
        Footers = <>
        Width = 42
      end
      item
        EditButtons = <>
        FieldName = 'VALUTA'
        Footers = <>
        Width = 47
      end
      item
        EditButtons = <>
        FieldName = 'TAMOGNYA'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'PROCENT_PREDOPL'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'OTSROCHKA'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'STAVKA_BANKA'
        Footers = <>
      end
      item
        DisplayFormat = '0.00'
        EditButtons = <>
        FieldName = 'ZATRATY'
        Footers = <>
      end>
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
      OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight]
      PopupMenu = PopupMenu1
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
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'USL_POSTAVKA'
          Footers = <>
          Width = 144
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
          Width = 133
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
        Action = actUnpost
        Anchors = [akLeft, akTop, akRight]
        Caption = #1042'&'#1077#1088#1085#1091#1090#1100
        TabOrder = 1
        TabStop = False
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
      ShortCut = 16468
      OnExecute = actAddDetExecute
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
    object actMakeUslPostavkaChange: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1077' '#1091#1089#1083#1086#1074#1080#1081' '#1087#1086#1089#1090#1072#1074#1082#1080' '#1085#1072' '#1086#1089#1085#1086#1074#1072#1085#1080#1080'...'
      OnExecute = actMakeUslPostavkaChangeExecute
    end
    object actPost: TAction
      Caption = #1055#1088#1086#1074#1077#1089#1090#1080
      OnExecute = actPostExecute
    end
    object actUnpost: TAction
      Caption = #1042'&'#1077#1088#1085#1091#1090#1100
      OnExecute = actUnpostExecute
    end
  end
  object sdsNaklo: TSQLDataSet
    CommandText = 
      'select'#13#10'    ID_NAKL,'#13#10'    ID,'#13#10'    ID_MANAGER,'#13#10'    DAT,'#13#10'    PO' +
      'STED,'#13#10'    BLOCKED,'#13#10'    DELMARKED,'#13#10'    COMMENT,'#13#10'    ID_SKLAD'#13 +
      #10'from '#13#10'  USL_POSTAVKA_CHANGE_VW n'#13#10'order by'#13#10'  n.dat, n.id_nakl' +
      #13#10
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
      ProviderFlags = []
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
    AfterPost = cdsNakloAfterPost
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
    object cdsNakloPRICE: TStringField
      DisplayLabel = #1059#1089#1083#1086#1074#1080#1103' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
      FieldKind = fkLookup
      FieldName = 'USL_POSTAVKA'
      LookupDataSet = dmdEx.cdsUslPostavka
      LookupKeyFields = 'OID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_SKLAD'
      Lookup = True
    end
    object cdsNakloID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
      Required = True
    end
  end
  object sdsPost: TSQLDataSet
    CommandText = 'USL_POSTAVKA_CHANGE_POST_PC'
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
      end>
    SQLConnection = dmdEx.scUchet
    Left = 456
    Top = 208
  end
  object sdsUnpost: TSQLDataSet
    CommandText = 'USL_POSTAVKA_CHANGE_UNPOST_PC'
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
      object N7: TMenuItem
        Action = actShowDeleted
      end
      object N8: TMenuItem
        Action = actUndeleteNakl
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
    Left = 426
    Top = 304
    object N6: TMenuItem
      Action = actMakeUslPostavkaChange
    end
  end
  object sdsDelmark: TSQLDataSet
    CommandText = 'USL_POSTAVKA_CHANGE_DELMARK_PC'
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
      'select '#13#10'    d.ID_NAKLD,'#13#10'    d.ID_NAKL,'#13#10'    d.ID_POS,'#13#10'    d.I' +
      'D_TOVAR,'#13#10'    d.TRANSPORT,'#13#10'    d.TARA,'#13#10'    d.VALUTA,'#13#10'    d.TA' +
      'MOGNYA,'#13#10'    d.PROCENT_PREDOPL,'#13#10'    d.OTSROCHKA,'#13#10'    d.STAVKA_' +
      'BANKA,'#13#10'    d.ID_USL_POSTAVKA'#13#10'from '#13#10'  USL_POSTAVKA_CHANGE_DET_' +
      'VW d '#13#10'  inner join tovar t '#13#10'  on t.oid=d.id_tovar'#13#10'where '#13#10'  d' +
      '.id_nakl=:id_nakl'#13#10'order by '#13#10'   upper(t.gruppa1),t.gruppa2,t.gr' +
      'uppa3,t.gruppa4'
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
    object sdsNaklotTRANSPORT: TFMTBCDField
      FieldName = 'TRANSPORT'
      Precision = 15
      Size = 6
    end
    object sdsNaklotTARA: TFMTBCDField
      FieldName = 'TARA'
      Precision = 15
    end
    object sdsNaklotVALUTA: TFMTBCDField
      FieldName = 'VALUTA'
      Precision = 15
    end
    object sdsNaklotTAMOGNYA: TFMTBCDField
      FieldName = 'TAMOGNYA'
      Precision = 15
      Size = 2
    end
    object sdsNaklotPROCENT_PREDOPL: TFMTBCDField
      FieldName = 'PROCENT_PREDOPL'
      Precision = 15
    end
    object sdsNaklotOTSROCHKA: TSmallintField
      FieldName = 'OTSROCHKA'
    end
    object sdsNaklotSTAVKA_BANKA: TFMTBCDField
      FieldName = 'STAVKA_BANKA'
      Precision = 15
    end
    object sdsNaklotID_USL_POSTAVKA: TIntegerField
      FieldName = 'ID_USL_POSTAVKA'
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
        Name = 'TRANSPORT'
        DataType = ftFMTBcd
        Precision = 15
        Size = 6
      end
      item
        Name = 'TARA'
        DataType = ftFMTBcd
        Precision = 15
        Size = 4
      end
      item
        Name = 'VALUTA'
        DataType = ftFMTBcd
        Precision = 15
        Size = 4
      end
      item
        Name = 'TAMOGNYA'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'PROCENT_PREDOPL'
        DataType = ftFMTBcd
        Precision = 15
        Size = 4
      end
      item
        Name = 'OTSROCHKA'
        DataType = ftSmallint
      end
      item
        Name = 'STAVKA_BANKA'
        DataType = ftFMTBcd
        Precision = 15
        Size = 4
      end
      item
        Name = 'ID_USL_POSTAVKA'
        DataType = ftInteger
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
      OnChange = cdsNaklotID_TOVARChange
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
    object cdsNaklotPRICE: TStringField
      DisplayLabel = #1059#1089#1083#1086#1074#1080#1103' '#1087#1086#1089#1090#1072#1074#1082#1080
      FieldKind = fkLookup
      FieldName = 'USL_POSTAVKA'
      LookupDataSet = dmdEx.cdsUslPostavka
      LookupKeyFields = 'OID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_USL_POSTAVKA'
      Lookup = True
    end
    object cdsNaklotTRANSPORT: TFMTBCDField
      DisplayLabel = #1058#1088#1072#1085#1089#1087#1086#1088#1090
      DisplayWidth = 8
      FieldName = 'TRANSPORT'
      Precision = 15
      Size = 6
    end
    object cdsNaklotTARA: TFMTBCDField
      DisplayLabel = #1058#1072#1088#1072
      DisplayWidth = 8
      FieldName = 'TARA'
      Precision = 15
    end
    object cdsNaklotVALUTA: TFMTBCDField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      DisplayWidth = 8
      FieldName = 'VALUTA'
      Precision = 15
    end
    object cdsNaklotTAMOGNYA: TFMTBCDField
      DisplayLabel = #1058#1072#1084#1086#1078#1085#1103
      DisplayWidth = 8
      FieldName = 'TAMOGNYA'
      Precision = 15
      Size = 2
    end
    object cdsNaklotPROCENT_PREDOPL: TFMTBCDField
      DisplayLabel = '% '#1087#1088#1077#1076#1086#1087#1083#1072#1090#1099
      DisplayWidth = 3
      FieldName = 'PROCENT_PREDOPL'
      Precision = 15
    end
    object cdsNaklotOTSROCHKA: TSmallintField
      DisplayLabel = #1054#1090#1089#1088#1086#1095#1082#1072' '#1087#1083#1072#1090#1077#1078#1072', '#1076#1085#1080
      DisplayWidth = 4
      FieldName = 'OTSROCHKA'
    end
    object cdsNaklotSTAVKA_BANKA: TFMTBCDField
      DisplayLabel = #1041#1072#1085#1082#1086#1074#1089#1082#1080#1081' % '#1087#1086' '#1082#1088#1077#1076#1080#1090#1091
      DisplayWidth = 5
      FieldName = 'STAVKA_BANKA'
      Precision = 15
    end
    object cdsNaklotID_USL_POSTAVKA: TIntegerField
      FieldName = 'ID_USL_POSTAVKA'
      OnChange = cdsNaklotID_USL_POSTAVKAChange
    end
    object cdsNaklotZATRATY: TFloatField
      DisplayLabel = #1042#1089#1077#1075#1086' '#1079#1072#1090#1088#1072#1090
      DisplayWidth = 5
      FieldKind = fkCalculated
      FieldName = 'ZATRATY'
      Calculated = True
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
    Section = 'TfrmUslPostavkaChange'
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
    object N5: TMenuItem
      Action = actAddDet
    end
    object actSetColumnValue1: TMenuItem
      Action = actSetColumnValue
    end
    object N3: TMenuItem
      Action = actIncColumnValue
    end
    object N4: TMenuItem
      Action = actMultColumnValue
    end
  end
  object frddNaklo: TfrxDBDataset
    UserName = 'frddNaklo'
    CloseDataSource = False
    DataSet = cdsNaklot
    Left = 392
    Top = 368
  end
  object mtePriceDetGen: TMemTableEh
    FieldDefs = <
      item
        Name = 'ID_TOVAR'
        DataType = ftInteger
      end
      item
        Name = 'ID_USL_POSTAVKA'
        DataType = ftInteger
      end
      item
        Name = 'TRANSPORT'
        DataType = ftFloat
      end
      item
        Name = 'TARA'
        DataType = ftFloat
      end
      item
        Name = 'VALUTA'
        DataType = ftFloat
      end
      item
        Name = 'TAMOGNYA'
        DataType = ftFloat
      end
      item
        Name = 'STAVKA_BANKA'
        DataType = ftFloat
      end
      item
        Name = 'OTSROCHKA'
        DataType = ftInteger
      end
      item
        Name = 'PROCENT_PREDOPL'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 493
    Top = 236
    object mtePriceDetGenID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
    end
    object mtePriceDetGenID_USL_POSTAVKA: TIntegerField
      FieldName = 'ID_USL_POSTAVKA'
    end
    object mtePriceDetGenTRANSPORT: TFloatField
      FieldName = 'TRANSPORT'
    end
    object mtePriceDetGenTARA: TFloatField
      FieldName = 'TARA'
    end
    object mtePriceDetGenVALUTA: TFloatField
      FieldName = 'VALUTA'
    end
    object mtePriceDetGenTAMOGNYA: TFloatField
      FieldName = 'TAMOGNYA'
    end
    object mtePriceDetGenSTAVKA_BANKA: TFloatField
      FieldName = 'STAVKA_BANKA'
    end
    object mtePriceDetGenOTSROCHKA: TIntegerField
      FieldName = 'OTSROCHKA'
    end
    object mtePriceDetGenPROCENT_PREDOPL: TFloatField
      FieldName = 'PROCENT_PREDOPL'
    end
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object ID_TOVAR: TMTNumericDataFieldEh
          FieldName = 'ID_TOVAR'
          NumericDataType = fdtIntegerEh
          Alignment = taLeftJustify
          DisplayWidth = 0
          Required = False
          Visible = False
          currency = False
          Precision = 0
        end
        object ID_USL_POSTAVKA: TMTNumericDataFieldEh
          FieldName = 'ID_USL_POSTAVKA'
          NumericDataType = fdtIntegerEh
          Alignment = taLeftJustify
          DisplayWidth = 0
          Required = False
          Visible = False
          currency = False
          Precision = 0
        end
        object TRANSPORT: TMTNumericDataFieldEh
          FieldName = 'TRANSPORT'
          NumericDataType = fdtFloatEh
          Alignment = taLeftJustify
          DisplayWidth = 0
          Required = False
          Visible = False
          currency = False
          Precision = 0
        end
        object TARA: TMTNumericDataFieldEh
          FieldName = 'TARA'
          NumericDataType = fdtFloatEh
          Alignment = taLeftJustify
          DisplayWidth = 0
          Required = False
          Visible = False
          currency = False
          Precision = 0
        end
        object VALUTA: TMTNumericDataFieldEh
          FieldName = 'VALUTA'
          NumericDataType = fdtFloatEh
          Alignment = taLeftJustify
          DisplayWidth = 0
          Required = False
          Visible = False
          currency = False
          Precision = 0
        end
        object TAMOGNYA: TMTNumericDataFieldEh
          FieldName = 'TAMOGNYA'
          NumericDataType = fdtFloatEh
          Alignment = taLeftJustify
          DisplayWidth = 0
          Required = False
          Visible = False
          currency = False
          Precision = 0
        end
        object STAVKA_BANKA: TMTNumericDataFieldEh
          FieldName = 'STAVKA_BANKA'
          NumericDataType = fdtFloatEh
          Alignment = taLeftJustify
          DisplayWidth = 0
          Required = False
          Visible = False
          currency = False
          Precision = 0
        end
        object OTSROCHKA: TMTNumericDataFieldEh
          FieldName = 'OTSROCHKA'
          NumericDataType = fdtIntegerEh
          Alignment = taLeftJustify
          DisplayWidth = 0
          Required = False
          Visible = False
          currency = False
          Precision = 0
        end
        object PROCENT_PREDOPL: TMTNumericDataFieldEh
          FieldName = 'PROCENT_PREDOPL'
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
    Left = 493
    Top = 271
  end
end
