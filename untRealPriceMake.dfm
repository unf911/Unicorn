object frmRealPriceMake: TfrmRealPriceMake
  Left = 316
  Top = 189
  BorderStyle = bsDialog
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1088#1072#1089#1093#1086#1076#1085#1086#1081' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
  ClientHeight = 437
  ClientWidth = 535
  Color = clBtnFace
  Constraints.MinHeight = 464
  Constraints.MinWidth = 543
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 153
    Width = 535
    Height = 8
    Cursor = crVSplit
    Align = alTop
    Beveled = True
    ResizeStyle = rsUpdate
  end
  object Splitter2: TSplitter
    Left = 0
    Top = 289
    Width = 535
    Height = 8
    Cursor = crVSplit
    Align = alBottom
    Beveled = True
    ResizeStyle = rsUpdate
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 535
    Height = 153
    Align = alTop
    BevelOuter = bvNone
    Constraints.MinHeight = 153
    TabOrder = 0
    DesignSize = (
      535
      153)
    object Label1: TLabel
      Left = 8
      Top = -2
      Width = 124
      Height = 13
      Caption = #1055#1086#1079#1080#1094#1080#1080' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1084
    end
    object btnCopy: TBitBtn
      Left = 8
      Top = 132
      Width = 129
      Height = 17
      Action = actCopy
      Anchors = [akLeft, akBottom]
      Caption = #1060#1072#1082#1090'='#1076#1086#1082
      TabOrder = 0
    end
    object DBGridEh1: TDBGridEh
      Left = 8
      Top = 12
      Width = 520
      Height = 117
      AllowedOperations = [alopUpdateEh]
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsPaper
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
      PopupMenu = PopupMenu1
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      VertScrollBar.VisibleMode = sbAlwaysShowEh
      Columns = <
        item
          EditButtons = <>
          FieldName = 'ID_POS'
          Footers = <>
          Width = 21
        end
        item
          EditButtons = <>
          FieldName = 'TOVAR'
          Footers = <>
          Width = 260
        end
        item
          EditButtons = <>
          FieldName = 'KURS'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'SKIDKA'
          Footers = <>
        end
        item
          ButtonStyle = cbsDropDown
          EditButtons = <>
          FieldName = 'CENA'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'KOLOTP'
          Footers = <>
        end>
    end
    object CheckBox1: TCheckBox
      Left = 152
      Top = 132
      Width = 261
      Height = 17
      Action = actMove
      Anchors = [akLeft, akBottom]
      TabOrder = 2
    end
    object CheckBox2: TCheckBox
      Left = 408
      Top = 132
      Width = 133
      Height = 17
      Action = actDiffKolotp
      Anchors = [akLeft, akBottom]
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 161
    Width = 535
    Height = 128
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      535
      128)
    object Label2: TLabel
      Left = 8
      Top = -1
      Width = 114
      Height = 13
      Caption = #1060#1072#1082#1090#1080#1095#1077#1089#1082#1080#1077' '#1087#1086#1079#1080#1094#1080#1080
    end
    object DBGridEh2: TDBGridEh
      Left = 8
      Top = 12
      Width = 519
      Height = 111
      AllowedOperations = [alopUpdateEh]
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsReal
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      VertScrollBar.VisibleMode = sbAlwaysShowEh
      Columns = <
        item
          EditButtons = <>
          FieldName = 'ID'
          Footers = <>
          Width = 32
        end
        item
          EditButtons = <>
          FieldName = 'ID_POS'
          Footers = <>
          Width = 31
        end
        item
          EditButtons = <>
          FieldName = 'TOVAR'
          Footers = <>
          Width = 216
        end
        item
          EditButtons = <>
          FieldName = 'KURS'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'SKIDKA'
          Footers = <>
        end
        item
          ButtonStyle = cbsDropDown
          EditButtons = <>
          FieldName = 'CENA'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'KOLOTP'
          Footers = <>
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 297
    Width = 535
    Height = 140
    Align = alBottom
    Constraints.MinHeight = 50
    TabOrder = 2
    DesignSize = (
      535
      140)
    object Label3: TLabel
      Left = 8
      Top = -2
      Width = 151
      Height = 13
      Caption = #1057#1087#1080#1089#1086#1082' '#1089#1082#1083#1072#1076#1089#1082#1080#1093' '#1085#1072#1082#1083#1072#1076#1085#1099#1093
    end
    object DBGridEh3: TDBGridEh
      Left = 7
      Top = 9
      Width = 521
      Height = 98
      AllowedOperations = []
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsNew
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
      PopupMenu = PopupMenu3
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      VertScrollBar.VisibleMode = sbAlwaysShowEh
      OnDblClick = DBGridEh3DblClick
      OnKeyUp = DBGridEh3KeyUp
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
        end
        item
          EditButtons = <>
          FieldName = 'IZG'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'ZAK'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'MANAGER'
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
          Width = 28
        end
        item
          Checkboxes = True
          EditButtons = <>
          FieldName = 'BLOCKED'
          Footers = <>
          KeyList.Strings = (
            '1'
            '0')
          Width = 30
        end
        item
          EditButtons = <>
          FieldName = 'NDS'
          Footers = <>
          Width = 70
        end>
    end
    object BitBtn1: TBitBtn
      Left = 40
      Top = 112
      Width = 153
      Height = 25
      Action = actOk
      Anchors = [akLeft, akBottom]
      TabOrder = 1
      Kind = bkOK
    end
    object BitBtn2: TBitBtn
      Left = 216
      Top = 111
      Width = 153
      Height = 25
      Action = actRefresh
      Anchors = [akLeft, akBottom]
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 2
      Kind = bkRetry
    end
    object btnCancel: TBitBtn
      Left = 400
      Top = 111
      Width = 121
      Height = 25
      Action = actCancel
      Anchors = [akLeft, akBottom]
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 3
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object ActionList1: TActionList
    Images = dmdEx.ImageList1
    Left = 264
    Top = 40
    object actOk: TAction
      Caption = #1054#1050
      OnExecute = actOkExecute
    end
    object actCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      OnExecute = actCancelExecute
    end
    object actCopy: TAction
      Caption = #1060#1072#1082#1090'='#1076#1086#1082
      OnExecute = actCopyExecute
    end
    object actNew: TAction
      Caption = #1053#1086#1074#1072#1103
    end
    object actMove: TAction
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1085#1077#1089#1086#1074#1087#1072#1076#1072#1102#1097#1080#1077' '#1087#1086#1079#1080#1094#1080#1080
      OnExecute = actMoveExecute
    end
    object actReturn: TAction
      Caption = #1055#1077#1088#1077#1084#1077#1089#1090#1080#1090#1100' '#1074' '#1076#1086#1082
      Enabled = False
    end
    object actApply: TAction
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      OnExecute = actApplyExecute
    end
    object actTovarSelect: TAction
      Caption = 'actTovarSelect'
    end
    object actCheckButtons: TAction
      Caption = 'actCheckButtons'
    end
    object actNakloOpen: TAction
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      ShortCut = 120
      OnExecute = actNakloOpenExecute
    end
    object actAddNaklo: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1082#1083#1072#1076#1089#1082#1091#1102' '#1085#1072#1082#1083#1072#1076#1085#1091#1102
      ShortCut = 45
      OnExecute = actAddNakloExecute
    end
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnExecute = actRefreshExecute
    end
    object actNaklrOpen: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1088#1072#1089#1093#1086#1076#1085#1091#1102' '#1085#1072#1082#1083#1072#1076#1085#1091#1102
      OnExecute = actNaklrOpenExecute
    end
    object actDiffKolotp: TAction
      Caption = #1056#1072#1079#1085#1099#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1072
      OnExecute = actDiffKolotpExecute
    end
  end
  object dsPaper: TDataSource
    DataSet = cdsPaper
    Left = 136
    Top = 72
  end
  object dsReal: TDataSource
    DataSet = cdsReal
    Left = 168
    Top = 72
  end
  object dsNew: TDataSource
    DataSet = cdsNew
    Left = 200
    Top = 72
  end
  object dsNakloEdit: TDataSource
    Left = 296
    Top = 72
  end
  object SQLDataSet1: TSQLDataSet
    CommandText = 
      'select ot.id_pos,ot.id_tovar,ot.cena,ot.kolotp,ot.id_nakld,ot.id' +
      '_nakl,'#13#10'  ot.skidka,ot.kodcn,ot.kurs,ot.tara,ot.nalog_nds,ot.tip' +
      #13#10'from REALPRICEMAKE_VW ot'#13#10'where ot.id_nakl = :id_nakl'#13#10'order b' +
      'y ot.id_nakl,ot.id_pos'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_nakl'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 40
    Top = 40
    object SQLDataSet1ID_POS: TIntegerField
      FieldName = 'ID_POS'
      Required = True
    end
    object SQLDataSet1ID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
      Required = True
    end
    object SQLDataSet1CENA: TFMTBCDField
      FieldName = 'CENA'
      Precision = 15
      Size = 8
    end
    object SQLDataSet1KOLOTP: TFMTBCDField
      FieldName = 'KOLOTP'
      ProviderFlags = []
      Precision = 15
      Size = 8
    end
    object SQLDataSet1ID_NAKLD: TIntegerField
      FieldName = 'ID_NAKLD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SQLDataSet1ID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      Required = True
    end
    object SQLDataSet1SKIDKA: TFMTBCDField
      FieldName = 'SKIDKA'
      Precision = 15
      Size = 2
    end
    object SQLDataSet1KODCN: TSmallintField
      FieldName = 'KODCN'
    end
    object SQLDataSet1KURS: TFloatField
      FieldName = 'KURS'
      ProviderFlags = []
      Required = True
    end
    object SQLDataSet1TARA: TSmallintField
      FieldName = 'TARA'
    end
    object SQLDataSet1NALOG_NDS: TFMTBCDField
      FieldName = 'NALOG_NDS'
      Precision = 15
      Size = 2
    end
    object SQLDataSet1TIP: TSmallintField
      FieldName = 'TIP'
      Required = True
    end
  end
  object SQLDataSet2: TSQLDataSet
    CommandText = 
      'select   ot.id_pos,ot.id_tovar,'#13#10'  ot.cena,ot.kolotp,'#13#10'  ot.id_n' +
      'akld,ot.id_nakl,'#13#10'  ot.skidka,ot.kodcn,ot.kurs,ot.id,ot.tara'#13#10'fr' +
      'om REALPRICEMAKE_VW ot'#13#10'where ot.parent_id_nakl=:id_nakl'#13#10'  and ' +
      'ot.tip=(select oid from get_oid_objects_pc('#13#10'      '#39#1054#1090#1075#1088#1091#1079#1082#1072#39','#13#10 +
      '      (select oid from get_oid_objects_pc('#39#1058#1048#1055' '#1053#1040#1050#1051#1040#1044#1053#1067#1061' '#1044#1051#1071' '#1057#1050#1051 +
      #1040#1044#1040#39',-100)) ) )'#13#10'order by ot.id_nakl,ot.id_pos'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_nakl'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 72
    Top = 40
    object SQLDataSet2ID_POS: TIntegerField
      FieldName = 'ID_POS'
      Required = True
    end
    object SQLDataSet2ID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
      Required = True
    end
    object SQLDataSet2CENA: TFMTBCDField
      FieldName = 'CENA'
      Precision = 15
      Size = 8
    end
    object SQLDataSet2KOLOTP: TFMTBCDField
      FieldName = 'KOLOTP'
      ProviderFlags = []
      Precision = 15
      Size = 8
    end
    object SQLDataSet2ID_NAKLD: TIntegerField
      FieldName = 'ID_NAKLD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SQLDataSet2ID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      Required = True
    end
    object SQLDataSet2SKIDKA: TFMTBCDField
      FieldName = 'SKIDKA'
      Precision = 15
      Size = 2
    end
    object SQLDataSet2KODCN: TSmallintField
      FieldName = 'KODCN'
    end
    object SQLDataSet2KURS: TFloatField
      FieldName = 'KURS'
      Required = True
    end
    object SQLDataSet2ID: TStringField
      FieldName = 'ID'
    end
    object SQLDataSet2TARA: TSmallintField
      FieldName = 'TARA'
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLDataSet1
    Left = 40
    Top = 72
  end
  object DataSetProvider2: TDataSetProvider
    DataSet = SQLDataSet2
    UpdateMode = upWhereKeyOnly
    Left = 72
    Top = 72
  end
  object cdsPaper: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_nakl'
        ParamType = ptInput
      end>
    ProviderName = 'DataSetProvider1'
    OnReconcileError = cdsPaperReconcileError
    Left = 40
    Top = 104
    object cdsPaperID_POS: TIntegerField
      DisplayLabel = #8470#1087#1086#1079
      DisplayWidth = 2
      FieldName = 'ID_POS'
      ReadOnly = True
      Required = True
    end
    object cdsPaperTOVAR: TStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      DisplayWidth = 38
      FieldKind = fkLookup
      FieldName = 'TOVAR'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_TOVAR'
      ReadOnly = True
      Size = 50
      Lookup = True
    end
    object cdsPaperKURS: TFloatField
      DisplayLabel = #1050#1091#1088#1089
      DisplayWidth = 6
      FieldName = 'KURS'
      ProviderFlags = []
      Required = True
      DisplayFormat = '0.000'
    end
    object cdsPaperSKIDKA: TFMTBCDField
      DisplayLabel = #1057#1082#1080#1076#1082#1072
      DisplayWidth = 4
      FieldName = 'SKIDKA'
      OnChange = cdsPaperSKIDKAChange
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsPaperCENA: TFMTBCDField
      DisplayLabel = #1062#1077#1085#1072' '#1073#1077#1079' '#1053#1044#1057
      DisplayWidth = 10
      FieldName = 'CENA'
      OnChange = cdsPaperCENAChange
      DisplayFormat = '0.00'
      Precision = 15
      Size = 8
    end
    object cdsPaperID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
      ReadOnly = True
      Required = True
      Visible = False
    end
    object cdsPaperKOLOTP: TFMTBCDField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      DisplayWidth = 10
      FieldName = 'KOLOTP'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '0.000'
      Precision = 15
      Size = 8
    end
    object cdsPaperID_NAKLD: TIntegerField
      FieldName = 'ID_NAKLD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
      Required = True
      Visible = False
    end
    object cdsPaperID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      ReadOnly = True
      Required = True
      Visible = False
    end
    object cdsPaperKODCN: TSmallintField
      FieldName = 'KODCN'
      Visible = False
    end
    object cdsPaperTARA: TSmallintField
      FieldName = 'TARA'
      ReadOnly = True
    end
    object cdsPaperNALOG_NDS: TFMTBCDField
      FieldName = 'NALOG_NDS'
      ReadOnly = True
      Precision = 15
      Size = 2
    end
    object cdsPaperTIP: TSmallintField
      FieldName = 'TIP'
      ReadOnly = True
      Required = True
    end
  end
  object cdsReal: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_nakl'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'DataSetProvider2'
    OnReconcileError = cdsRealReconcileError
    Left = 72
    Top = 104
    object cdsRealID_POS: TIntegerField
      DisplayLabel = #8470#1087#1086#1079
      DisplayWidth = 2
      FieldName = 'ID_POS'
      ReadOnly = True
      Required = True
    end
    object cdsRealTOVAR: TStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      DisplayWidth = 38
      FieldKind = fkLookup
      FieldName = 'TOVAR'
      LookupDataSet = dmdEx.cdsTovarAll
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_TOVAR'
      ReadOnly = True
      Size = 50
      Lookup = True
    end
    object cdsRealID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
      ReadOnly = True
      Required = True
      Visible = False
    end
    object cdsRealKURS: TFloatField
      DisplayLabel = #1050#1091#1088#1089
      DisplayWidth = 6
      FieldName = 'KURS'
      Required = True
      DisplayFormat = '0.000'
    end
    object cdsRealSKIDKA: TFMTBCDField
      DisplayLabel = #1057#1082#1080#1076#1082#1072
      DisplayWidth = 4
      FieldName = 'SKIDKA'
      OnChange = cdsRealSKIDKAChange
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsRealCENA: TFMTBCDField
      DisplayLabel = #1062#1077#1085#1072' '#1073#1077#1079' '#1053#1044#1057
      DisplayWidth = 10
      FieldName = 'CENA'
      OnChange = cdsRealCENAChange
      DisplayFormat = '0.00'
      Precision = 15
      Size = 8
    end
    object cdsRealKOLOTP: TFMTBCDField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      DisplayWidth = 10
      FieldName = 'KOLOTP'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '0.000'
      Precision = 15
      Size = 8
    end
    object cdsRealID_NAKLD: TIntegerField
      FieldName = 'ID_NAKLD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
      Required = True
      Visible = False
    end
    object cdsRealID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      ReadOnly = True
      Required = True
      Visible = False
    end
    object cdsRealKODCN: TSmallintField
      FieldName = 'KODCN'
      Visible = False
    end
    object cdsRealID: TStringField
      DisplayLabel = #8470#1085#1072#1082#1083
      FieldName = 'ID'
      ReadOnly = True
    end
    object cdsRealTARA: TSmallintField
      FieldName = 'TARA'
      ReadOnly = True
    end
  end
  object SQLDataSet3: TSQLDataSet
    CommandText = 
      'select'#13#10'  om.id,om.dat,om.id_izg,om.id_zak,om.id_manager,om.id_n' +
      'akl,'#13#10'  om.posted,om.blocked,om.nds'#13#10'from'#13#10'  NAKLO om'#13#10'where'#13#10'  ' +
      'om.parent_id_nakl=:id_nakl and om.tip=5'#13#10'order by'#13#10'  om.id_nakl'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_nakl'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 104
    Top = 40
  end
  object DataSetProvider3: TDataSetProvider
    DataSet = SQLDataSet3
    Left = 104
    Top = 72
  end
  object cdsNew: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_nakl'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'DataSetProvider3'
    OnReconcileError = cdsNewReconcileError
    Left = 104
    Top = 104
    object cdsNewID: TStringField
      DisplayLabel = #8470#1085#1072#1082#1083
      DisplayWidth = 4
      FieldName = 'ID'
    end
    object cdsNewDAT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 7
      FieldName = 'DAT'
      Required = True
      DisplayFormat = 'dd.mm.yy'
    end
    object cdsNewID_IZG: TIntegerField
      FieldName = 'ID_IZG'
      Visible = False
    end
    object cdsNewID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
      Visible = False
    end
    object cdsNewID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
      Visible = False
    end
    object cdsNewIZG: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      DisplayWidth = 12
      FieldKind = fkLookup
      FieldName = 'IZG'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_IZG'
      Size = 50
      Lookup = True
    end
    object cdsNewZAK: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'ZAK'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_ZAK'
      Size = 50
      Lookup = True
    end
    object cdsNewMANAGER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      DisplayWidth = 11
      FieldKind = fkLookup
      FieldName = 'MANAGER'
      LookupDataSet = dmdEx.cdsManager
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_MANAGER'
      Size = 50
      Lookup = True
    end
    object cdsNewID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      Required = True
      Visible = False
    end
    object cdsNewBLOCKED: TSmallintField
      DisplayLabel = #1041#1083#1086#1082
      DisplayWidth = 1
      FieldName = 'BLOCKED'
      Required = True
    end
    object cdsNewPOSTED: TSmallintField
      DisplayLabel = #1055#1088#1086#1074#1077#1076#1077#1085
      DisplayWidth = 1
      FieldName = 'POSTED'
      Required = True
    end
    object cdsNewNDS: TFMTBCDField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'NDS'
      Required = True
      DisplayFormat = '0.00'
      Precision = 15
      Size = 8
    end
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmRealPriceMake2'
    StorageManager = RegPropStorageManEh1
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      '<P>.WindowState'
      'Panel1.<P>.Height'
      'Panel3.<P>.Height')
    Left = 416
    Top = 80
  end
  object RegPropStorageManEh1: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 384
    Top = 80
  end
  object PopupMenu3: TPopupMenu
    Images = dmdEx.ImageList1
    Left = 416
    Top = 48
    object N1: TMenuItem
      Action = actNakloOpen
      Default = True
    end
    object N2: TMenuItem
      Action = actAddNaklo
    end
  end
  object SdsNakloIdParent: TSQLDataSet
    CommandText = 
      'update naklo om'#13#10'  set om.parent_id_nakl=:parent_id_nakl'#13#10'  wher' +
      'e om.id_nakl=:id_nakl and om.delmarked=0 and om.tip=5'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'parent_id_nakl'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_nakl'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 136
    Top = 40
  end
  object sdsNaklrRecount: TSQLDataSet
    CommandText = 'NAKLO_SUM_RECOUNT'
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
        Name = 'MODE'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = dmdEx.scUchet
    Left = 168
    Top = 40
  end
  object sdsNakloRecount: TSQLDataSet
    CommandText = 'REALPRICEMAKE_FACT_RECOUNT'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_NAKL'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 200
    Top = 40
  end
  object PopupMenu1: TPopupMenu
    Images = dmdEx.ImageList1
    Left = 384
    Top = 48
    object N3: TMenuItem
      Action = actNaklrOpen
    end
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
    Left = 136
    Top = 104
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
    Left = 168
    Top = 104
  end
  object UnfFilter3: TUnfFilter
    DBGridEh = DBGridEh3
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
    Left = 200
    Top = 104
  end
end
