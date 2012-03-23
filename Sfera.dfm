object frmSfera: TfrmSfera
  Left = 144
  Top = 244
  BorderStyle = bsDialog
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1089#1092#1077#1088' '#1076#1077#1103#1090#1077#1083#1100#1085#1086#1089#1090#1080
  ClientHeight = 237
  ClientWidth = 539
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
  DesignSize = (
    539
    237)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 452
    Top = 0
    Width = 89
    Height = 233
    Anchors = [akTop, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      89
      233)
    object btnDelete: TButton
      Left = 5
      Top = 72
      Width = 77
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 0
      OnClick = btnDeleteClick
    end
    object btnEdit: TButton
      Left = 5
      Top = 40
      Width = 77
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      OnClick = btnEditClick
    end
    object btnInsert: TButton
      Left = 5
      Top = 8
      Width = 77
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 2
      OnClick = btnInsertClick
    end
    object BitBtn1: TBitBtn
      Left = 6
      Top = 104
      Width = 77
      Height = 25
      Action = actRefresh
      Anchors = [akLeft, akTop, akRight]
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 3
      Kind = bkRetry
    end
  end
  object dbgClient: TDBGridEh
    Left = 8
    Top = 8
    Width = 437
    Height = 225
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoFitColWidths = True
    DataSource = dsSklad
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghTraceColSizing, dghIncSearch, dghPreferIncSearch, dghRowHighlight]
    ReadOnly = True
    SortLocal = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    VertScrollBar.VisibleMode = sbAlwaysShowEh
    OnDblClick = dbgClientDblClick
    OnKeyDown = dbgClientKeyDown
    Columns = <
      item
        EditButtons = <>
        FieldName = 'OID'
        Footers = <>
        Width = 2
      end
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        MinWidth = 267
        Width = 267
      end
      item
        Checkboxes = True
        EditButtons = <>
        FieldName = 'DELMARKED'
        Footers = <>
        KeyList.Strings = (
          '1'
          '0')
        Width = 39
      end>
  end
  object sdsSklad: TSQLDataSet
    SQLConnection = dmdEx.scUchet
    CommandText = 
      'select o.oid,o.name,o.classid,o.delmarked '#13#10'from objects o'#13#10'  wh' +
      'ere classid=(select oid '#13#10'  from get_oid_objects_pc('#39#1057#1055#1056#1040#1042#1054#1063#1053#1048#1050' ' +
      #1057#1060#1045#1056' '#1044#1045#1071#1058#1045#1051#1068#1053#1054#1057#1058#1048#39',-100)) '#13#10'order by'#13#10'  o.name,'#13#10'  o.delmarked'#13#10
    Params = <>
    Left = 72
    Top = 56
  end
  object dspSklad: TDataSetProvider
    DataSet = sdsSklad
    Constraints = True
    Left = 72
    Top = 88
  end
  object cdsSklad: TClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ProviderName = 'dspSklad'
    AfterInsert = cdsSkladAfterInsert
    BeforePost = cdsSkladBeforePost
    OnReconcileError = cdsSkladReconcileError
    Left = 72
    Top = 120
    object cdsSkladOID: TIntegerField
      DisplayLabel = #8470
      FieldName = 'OID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSkladNAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'NAME'
      Required = True
      Size = 50
    end
    object cdsSkladDELMARKED: TSmallintField
      DisplayLabel = #1059#1076#1072#1083#1105#1085
      FieldName = 'DELMARKED'
      Required = True
    end
    object cdsSkladCLASSID: TIntegerField
      FieldName = 'CLASSID'
      Required = True
    end
  end
  object dsSklad: TDataSource
    DataSet = cdsSklad
    Left = 72
    Top = 152
  end
  object ActionList1: TActionList
    Left = 104
    Top = 56
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ShortCut = 116
      OnExecute = actRefreshExecute
    end
  end
  object UnfFilter1: TUnfFilter
    DBGridEh = dbgClient
    MTStrings.Find = #1055#1086#1080#1089#1082
    MTStrings.Filter = #1060#1080#1083#1100#1090#1088
    MTStrings.Copy = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
    MTStrings.Restore = #1057#1085#1103#1090#1100' '#1092#1080#1083#1100#1090#1088
    MTStrings.RestoreColumn = #1057#1085#1103#1090#1100' '#1092#1080#1083#1100#1090#1088' c '#1082#1086#1083#1086#1085#1082#1080
    MTStrings.MatchCase = #1059#1095#1080#1090#1099#1074#1072#1090#1100' '#1088#1077#1075#1080#1089#1090#1088
    MTStrings.AnyPartofField = #1042' '#1089#1090#1088#1086#1082#1077
    MTStrings.WholeField = #1057#1090#1088#1086#1082#1072' '#1094#1077#1083#1080#1082#1086#1084
    MTStrings.StartofField = #1042' '#1085#1072#1095#1072#1083#1077' '#1089#1090#1088#1086#1082#1080
    Left = 104
    Top = 88
  end
end
