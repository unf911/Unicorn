object frmZakaz: TfrmZakaz
  Left = 653
  Top = 376
  BorderStyle = bsDialog
  Caption = #1047#1072#1082#1072#1079#1099
  ClientHeight = 448
  ClientWidth = 619
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
    Width = 619
    Height = 8
    Cursor = crVSplit
    Align = alTop
    Beveled = True
    ResizeStyle = rsUpdate
  end
  object dbgNaklot: TDBGridEh
    Left = 0
    Top = 233
    Width = 619
    Height = 215
    Align = alClient
    AllowedOperations = [alopInsertEh, alopDeleteEh, alopAppendEh]
    Anchors = []
    DataSource = dsNaklot
    EditActions = [geaCopyEh, geaSelectAllEh]
    Flat = False
    FooterColor = clWindow
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
    OnDblClick = dbgNaklotDblClick
    OnKeyDown = dbgNaklotKeyDown
    Columns = <
      item
        EditButtons = <>
        FieldName = 'TOVAR'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'TOVAR_TEXT'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'CENA'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'KOLOTP'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'TOVAR_SNAB'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'POST'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'CENA_SNAB'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'SROK_SNAB_TEXT'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'COMMENT_SNAB'
        Footers = <>
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 619
    Height = 225
    Align = alTop
    BevelOuter = bvNone
    Constraints.MinHeight = 225
    TabOrder = 0
    DesignSize = (
      619
      225)
    object dbgNaklo: TDBGridEh
      Left = 1
      Top = 8
      Width = 534
      Height = 209
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
      ReadOnly = True
      SortLocal = True
      TabOrder = 0
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
        end
        item
          EditButtons = <>
          FieldName = 'DAT'
          Footers = <>
          Title.TitleButton = True
          Width = 45
        end
        item
          EditButtons = <>
          FieldName = 'ZAK'
          Footers = <>
          Width = 89
        end
        item
          EditButtons = <>
          FieldName = 'COMMENT'
          Footers = <>
          Title.TitleButton = True
          Width = 95
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
          FieldName = 'BLOCKED'
          Footers = <>
          KeyList.Strings = (
            '1'
            '0')
          Width = 22
        end
        item
          EditButtons = <>
          FieldName = 'MANAGER_SNAB'
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
          EditButtons = <>
          FieldName = 'DAT_OTVET'
          Footers = <>
          MinWidth = 2
        end
        item
          EditButtons = <>
          FieldName = 'ID_NAKL'
          Footers = <>
          Width = 1
        end>
    end
    object Panel4: TPanel
      Left = 542
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
        Top = 40
        Width = 71
        Height = 33
        Action = actPost
        Anchors = [akLeft, akTop, akRight]
        Caption = #1054#1073#1088#1072#1073#1086#1090#1072#1085
        TabOrder = 0
        TabStop = False
      end
      object btnUnpost: TBitBtn
        Left = 0
        Top = 80
        Width = 71
        Height = 33
        Action = actUnpost
        Anchors = [akLeft, akTop, akRight]
        Caption = #1053#1077#1086#1073#1088#1072#1073#1086#1090#1072#1085
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
      object btnBlock: TBitBtn
        Left = 0
        Top = 0
        Width = 71
        Height = 32
        Action = actBlock
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = #1050' '#1086#1073#1088#1072#1073#1086#1090#1082#1077
        Constraints.MinHeight = 32
        TabOrder = 4
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
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
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
    object actCalculateSum: TAction
      Caption = 'actCalculateSum'
      OnExecute = actCalculateSumExecute
    end
    object actShowDeleted: TAction
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1091#1076#1072#1083#1105#1085#1085#1099#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077
      OnExecute = actShowDeletedExecute
    end
    object actBlock: TAction
      Caption = #1050' '#1086#1073#1088#1072#1073#1086#1090#1082#1077
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
    object actPost: TAction
      Caption = #1054#1073#1088#1072#1073#1086#1090#1072#1085
      OnExecute = actPostExecute
    end
    object actUnpost: TAction
      Caption = #1053#1077#1086#1073#1088#1072#1073#1086#1090#1072#1085
      Visible = False
      OnExecute = actUnpostExecute
    end
    object actSetColumnValue: TAction
      Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077#1084
      OnExecute = actSetColumnValueExecute
    end
    object actAddDet: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1079#1080#1094#1080#1080' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1090#1086#1074#1072#1088#1086#1074
      OnExecute = actAddDetExecute
    end
  end
  object sdsNaklo: TSQLDataSet
    CommandText = 
      'select'#13#10'  *'#13#10'from '#13#10'  ZAKAZ_VW om'#13#10'order by'#13#10'  om.dat, om.id_nak' +
      'l'#13#10
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
    object sdsNakloDAT: TSQLTimeStampField
      FieldName = 'DAT'
      Required = True
    end
    object sdsNakloID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
    end
    object sdsNakloID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
    end
    object sdsNakloBLOCKED: TSmallintField
      FieldName = 'BLOCKED'
      Required = True
    end
    object sdsNakloPOSTED: TSmallintField
      FieldName = 'POSTED'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsNakloID_MANAGER_SNAB: TIntegerField
      FieldName = 'ID_MANAGER_SNAB'
    end
    object sdsNakloDAT_OTVET: TSQLTimeStampField
      FieldName = 'DAT_OTVET'
    end
    object sdsNakloCOMMENT: TStringField
      FieldName = 'COMMENT'
      Size = 50
    end
    object sdsNakloDELMARKED: TSmallintField
      FieldName = 'DELMARKED'
      Required = True
    end
    object sdsNakloID: TStringField
      FieldName = 'ID'
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
        Name = 'DAT'
        Attributes = [faRequired]
        DataType = ftTimeStamp
      end
      item
        Name = 'ID_ZAK'
        DataType = ftInteger
      end
      item
        Name = 'ID_MANAGER'
        DataType = ftInteger
      end
      item
        Name = 'BLOCKED'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'POSTED'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'ID_MANAGER_SNAB'
        DataType = ftInteger
      end
      item
        Name = 'DAT_OTVET'
        DataType = ftTimeStamp
      end
      item
        Name = 'COMMENT'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'DELMARKED'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'ID'
        DataType = ftString
        Size = 20
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
    object cdsNakloID: TStringField
      DisplayLabel = #8470
      DisplayWidth = 10
      FieldName = 'ID'
    end
    object cdsNakloDAT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DAT'
      Required = True
      DisplayFormat = 'dd.mm.yy hh:mm'
    end
    object cdsNakloZAK: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      DisplayWidth = 16
      FieldKind = fkLookup
      FieldName = 'ZAK'
      LookupDataSet = dmdEx.cdsClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_ZAK'
      Required = True
      Size = 50
      Lookup = True
    end
    object cdsNakloMANAGER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      DisplayWidth = 9
      FieldKind = fkLookup
      FieldName = 'MANAGER'
      LookupDataSet = dmdEx.cdsManager
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_MANAGER'
      Required = True
      Size = 30
      Lookup = True
    end
    object cdsNakloIZG: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088' '#1089#1085#1072#1073#1078#1077#1085#1080#1103
      DisplayWidth = 16
      FieldKind = fkLookup
      FieldName = 'MANAGER_SNAB'
      LookupDataSet = dmdEx.cdsManager
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_MANAGER_SNAB'
      Required = True
      Size = 50
      Lookup = True
    end
    object cdsNakloDAT_OTVET: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1090#1074#1077#1090#1072
      FieldName = 'DAT_OTVET'
      DisplayFormat = 'dd.mm.yy hh:mm'
    end
    object cdsNakloCOMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'COMMENT'
      Size = 50
    end
    object cdsNakloID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsNakloID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
    end
    object cdsNakloID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
    end
    object cdsNakloBLOCKED: TSmallintField
      DisplayLabel = #1050' '#1086#1073#1088#1072#1073#1086#1090#1082#1077
      FieldName = 'BLOCKED'
      Required = True
    end
    object cdsNakloPOSTED: TSmallintField
      DisplayLabel = #1054#1073#1088#1072#1073#1086#1090#1072#1085
      FieldName = 'POSTED'
      Required = True
    end
    object cdsNakloID_MANAGER_SNAB: TIntegerField
      FieldName = 'ID_MANAGER_SNAB'
    end
    object cdsNakloDELMARKED: TSmallintField
      FieldName = 'DELMARKED'
      Required = True
    end
  end
  object sdsPost: TSQLDataSet
    CommandText = 'ZAKAZ_POST_PC'
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
    CommandText = 'ZAKAZ_UNPOST_PC'
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
    Left = 424
    Top = 240
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
      end>
    SQLConnection = dmdEx.scUchet
    Left = 456
    Top = 176
  end
  object sdsNaklot: TSQLDataSet
    CommandText = 
      'select '#13#10'  *'#13#10'from '#13#10'  ZAKAZ_DET_VW d'#13#10'where '#13#10'  d.id_nakl=:id_n' +
      'akl'#13#10'order by'#13#10'  d.id_nakld'
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
    object sdsNaklotID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      Required = True
    end
    object sdsNaklotID_NAKLD: TIntegerField
      FieldName = 'ID_NAKLD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
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
    object sdsNaklotCENA: TFMTBCDField
      FieldName = 'CENA'
      Precision = 15
    end
    object sdsNaklotTOVAR_TEXT: TStringField
      FieldName = 'TOVAR_TEXT'
      Size = 250
    end
    object sdsNaklotID_TOVAR_SNAB: TIntegerField
      FieldName = 'ID_TOVAR_SNAB'
    end
    object sdsNaklotID_POST_SNAB: TIntegerField
      FieldName = 'ID_POST_SNAB'
    end
    object sdsNaklotCENA_SNAB: TFMTBCDField
      FieldName = 'CENA_SNAB'
      Precision = 15
      Size = 2
    end
    object sdsNaklotSROK_SNAB: TSmallintField
      FieldName = 'SROK_SNAB'
    end
    object sdsNaklotCOMMENT_SNAB: TStringField
      FieldName = 'COMMENT_SNAB'
      Size = 250
    end
    object sdsNaklotSROK_SNAB_TEXT: TStringField
      FieldName = 'SROK_SNAB_TEXT'
      Size = 250
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
        Name = 'ID_NAKL'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ID_NAKLD'
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
        Name = 'CENA'
        DataType = ftFMTBcd
        Precision = 15
        Size = 4
      end
      item
        Name = 'TOVAR_TEXT'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'ID_TOVAR_SNAB'
        DataType = ftInteger
      end
      item
        Name = 'ID_POST_SNAB'
        DataType = ftInteger
      end
      item
        Name = 'CENA_SNAB'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'SROK_SNAB'
        DataType = ftSmallint
      end
      item
        Name = 'COMMENT_SNAB'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'SROK_SNAB_TEXT'
        DataType = ftString
        Size = 250
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
    AfterInsert = cdsNaklotAfterInsert
    BeforeScroll = cdsNaklotBeforeScroll
    OnReconcileError = cdsNaklotReconcileError
    Left = 312
    Top = 304
    object cdsNaklotTOVAR: TStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'TOVAR'
      LookupDataSet = dmdEx.cdsTovar
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_TOVAR'
      Size = 50
      Lookup = True
    end
    object cdsNaklotTOVAR_TEXT: TStringField
      DisplayLabel = #1058#1086#1074#1072#1088' '#1090#1077#1082#1089#1090#1086#1084
      DisplayWidth = 20
      FieldName = 'TOVAR_TEXT'
      Size = 250
    end
    object cdsNaklotCENA: TFMTBCDField
      DisplayLabel = #1055#1088#1077#1076#1077#1083#1100#1085#1072#1103' '#1094#1077#1085#1072
      DisplayWidth = 20
      FieldName = 'CENA'
      DisplayFormat = '0.00'
      Precision = 15
    end
    object cdsNaklotKOLOTP: TFMTBCDField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      DisplayWidth = 20
      FieldName = 'KOLOTP'
      DisplayFormat = '0.000'
      Precision = 15
      Size = 6
    end
    object cdsNaklotTOVAR_SNAB: TStringField
      DisplayLabel = #1058#1086#1074#1072#1088' '#1086#1090' '#1089#1085#1072#1073#1078#1077#1085#1080#1103
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'TOVAR_SNAB'
      LookupDataSet = dmdEx.cdsTovar
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_TOVAR_SNAB'
      Size = 50
      Lookup = True
    end
    object cdsNaklotPOST: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'POST'
      LookupDataSet = dmdEx.cdsPost
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_POST_SNAB'
      Size = 50
      Lookup = True
    end
    object cdsNaklotCENA_SNAB: TFMTBCDField
      DisplayLabel = #1062#1077#1085#1072' '#1089#1085#1072#1073#1078#1077#1085#1080#1103
      DisplayWidth = 20
      FieldName = 'CENA_SNAB'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object cdsNaklotSROK_SNAB: TSmallintField
      DisplayLabel = #1057#1088#1086#1082' '#1080#1079#1075#1086#1090#1086#1074#1083#1077#1085#1080#1103
      DisplayWidth = 20
      FieldName = 'SROK_SNAB'
    end
    object cdsNaklotCOMMENT_SNAB: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081' '#1089#1085#1072#1073#1078#1077#1085#1080#1103
      DisplayWidth = 20
      FieldName = 'COMMENT_SNAB'
      Size = 250
    end
    object cdsNaklotID_POST_SNAB: TIntegerField
      FieldName = 'ID_POST_SNAB'
    end
    object cdsNaklotID_NAKLD: TIntegerField
      FieldName = 'ID_NAKLD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object cdsNaklotID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
      Required = True
      Visible = False
    end
    object cdsNaklotID_TOVAR_SNAB: TIntegerField
      FieldName = 'ID_TOVAR_SNAB'
    end
    object cdsNaklotID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      Required = True
      Visible = False
    end
    object cdsNaklotSROK_SNAB_TEXT: TStringField
      DisplayLabel = #1057#1088#1086#1082' '#1080#1079#1075#1086#1090#1086#1074#1083#1077#1085#1080#1103
      DisplayWidth = 20
      FieldName = 'SROK_SNAB_TEXT'
      Size = 250
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
    Section = 'TfrmZakaz'
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
    object N4: TMenuItem
      Action = actAddDet
    end
    object N3: TMenuItem
      Action = actSetColumnValue
    end
  end
end
