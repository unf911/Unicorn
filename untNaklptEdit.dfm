object frmNaklptEdit: TfrmNaklptEdit
  Left = 225
  Top = 404
  Width = 605
  Height = 411
  Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103' '#1087#1088#1080#1093#1086#1076#1072
  Color = clBtnFace
  Constraints.MinHeight = 386
  Constraints.MinWidth = 518
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnHide = FormHide
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 597
    Height = 383
    Align = alClient
    TabOrder = 0
    DesignSize = (
      597
      383)
    object lblTara: TLabel
      Left = 8
      Top = 40
      Width = 25
      Height = 13
      Caption = #1058#1072#1088#1072
      Visible = False
    end
    object lblTovar: TLabel
      Left = 8
      Top = 40
      Width = 31
      Height = 13
      Caption = #1058#1086#1074#1072#1088
    end
    object Label4: TLabel
      Left = 184
      Top = 16
      Width = 79
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1087#1086#1079#1080#1094#1080#1080
    end
    object Label6: TLabel
      Left = 8
      Top = 16
      Width = 91
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
    end
    object Label2: TLabel
      Left = 8
      Top = 64
      Width = 34
      Height = 13
      Caption = #1050#1086#1083'-'#1074#1086
    end
    object Label3: TLabel
      Left = 8
      Top = 88
      Width = 26
      Height = 13
      Caption = #1062#1077#1085#1072
    end
    object dlcTara: TDBLookupComboboxEh
      Left = 112
      Top = 40
      Width = 153
      Height = 21
      DataField = 'id_TOVAR'
      DataSource = dsNaklptEdit
      DropDownBox.AutoDrop = True
      DropDownBox.Rows = 25
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = dmdEx.dsTara
      TabOrder = 5
      Visible = False
    end
    object dbeIDNAKL: TDBEditEh
      Left = 112
      Top = 16
      Width = 65
      Height = 21
      TabStop = False
      DataField = 'id_nakl'
      DataSource = dsNaklptEdit
      EditButtons = <>
      Enabled = False
      TabOrder = 6
      Visible = True
    end
    object dbeIdPos: TDBEditEh
      Left = 272
      Top = 16
      Width = 49
      Height = 21
      TabStop = False
      DataField = 'id_pos'
      DataSource = dsNaklptEdit
      EditButtons = <>
      Enabled = False
      TabOrder = 7
      Visible = True
    end
    object dlcTovar: TDBLookupComboboxEh
      Left = 112
      Top = 40
      Width = 481
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'id_TOVAR'
      DataSource = dsNaklptEdit
      DropDownBox.AutoDrop = True
      DropDownBox.Rows = 25
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = dmdEx.dsTovar
      TabOrder = 0
      Visible = True
      OnChange = dlcTovarChange
    end
    object btnOk: TBitBtn
      Left = 72
      Top = 344
      Width = 153
      Height = 25
      Action = actOk
      Anchors = [akLeft, akRight, akBottom]
      Caption = 'OK'
      Default = True
      TabOrder = 3
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object dbnKolotp: TDBNumberEditEh
      Left = 112
      Top = 64
      Width = 153
      Height = 21
      TabStop = False
      DataField = 'KOLOTP'
      DataSource = dsNaklptEdit
      Enabled = False
      EditButton.Style = ebsUpDownEh
      EditButton.Visible = True
      EditButtons = <>
      Increment = 0.001000000000000000
      TabOrder = 2
      Visible = True
    end
    object btnCancel: TBitBtn
      Left = 344
      Top = 344
      Width = 137
      Height = 25
      Action = actCancel2
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 4
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
    object PageControl1: TPageControl
      Left = 5
      Top = 112
      Width = 588
      Height = 225
      ActivePage = TabSheet2
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      object TabSheet1: TTabSheet
        Caption = #1055#1088#1080#1093#1086#1076#1099
        OnShow = TabSheet1Show
        object dbgNaklpdet: TDBGridEh
          Left = 0
          Top = 0
          Width = 580
          Height = 197
          Align = alClient
          DataSource = dsNaklpdet
          Flat = False
          FooterColor = clInfoBk
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          FooterRowCount = 1
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
          PopupMenu = PopupMenu1
          SortLocal = True
          SumList.Active = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnColEnter = dbgNaklpdetColEnter
          OnExit = dbgNaklpdetExit
          OnKeyUp = dbgNaklpdetKeyUp
          Columns = <
            item
              AutoDropDown = True
              DropDownBox.ColumnDefValues.EndEllipsis = True
              EditButtons = <>
              FieldName = 'TARA'
              Footer.ValueType = fvtCount
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'NOMER_TARY'
              Footers = <>
              Width = 72
            end
            item
              EditButtons = <>
              FieldName = 'KOLOTP'
              Footers = <>
              Width = 57
            end
            item
              EditButtons = <>
              FieldName = 'KOLBUXT'
              Footer.ValueType = fvtSum
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'COMMENT'
              Footers = <>
              Width = 136
            end>
        end
      end
      object TabSheet2: TTabSheet
        Caption = #1048#1079#1083#1080#1096#1082#1080
        ImageIndex = 1
        OnShow = TabSheet2Show
        DesignSize = (
          580
          197)
        object DBGridEh1: TDBGridEh
          Left = 328
          Top = 0
          Width = 252
          Height = 197
          TabStop = False
          Align = alRight
          AutoFitColWidths = True
          DataSource = dsNaklpdet
          Flat = False
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          ReadOnly = True
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
              FieldName = 'TARA'
              Footers = <>
              Width = 80
            end
            item
              EditButtons = <>
              FieldName = 'NOMER_TARY'
              Footers = <>
              Width = 69
            end
            item
              EditButtons = <>
              FieldName = 'KOLOTP'
              Footers = <>
              Width = 70
            end>
        end
        object btnAdd: TBitBtn
          Left = 264
          Top = 36
          Width = 57
          Height = 25
          Hint = #1044#1086#1073#1072#1074#1080#1090#1100
          Anchors = [akTop, akRight]
          Caption = '-->'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          TabStop = False
          OnClick = btnAddClick
        end
        object btnRemove: TBitBtn
          Left = 264
          Top = 100
          Width = 57
          Height = 25
          Hint = #1059#1076#1072#1083#1080#1090#1100
          Anchors = [akTop, akRight]
          Caption = '<--'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          TabStop = False
          OnClick = btnRemoveClick
        end
        object DBGridEh2: TDBGridEh
          Left = 0
          Top = 0
          Width = 257
          Height = 197
          TabStop = False
          Align = alLeft
          Anchors = [akLeft, akTop, akRight, akBottom]
          AutoFitColWidths = True
          DataSource = dsTara
          Flat = False
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          ReadOnly = True
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          VertScrollBar.VisibleMode = sbAlwaysShowEh
          Columns = <
            item
              EditButtons = <>
              FieldName = 'TARA'
              Footers = <>
              Width = 70
            end
            item
              EditButtons = <>
              FieldName = 'NOMER_TARY'
              Footers = <>
              Width = 65
            end
            item
              EditButtons = <>
              FieldName = 'KOLOTP'
              Footers = <>
              Width = 68
            end
            item
              EditButtons = <>
              FieldName = 'KOLBUXT'
              Footers = <>
              Width = 20
            end>
        end
      end
    end
  end
  object dsNaklptEdit: TDataSource
    Left = 296
    Top = 184
  end
  object ActionList1: TActionList
    Left = 296
    Top = 216
    object actOk: TAction
      Caption = 'OK'
      OnExecute = actOkExecute
    end
    object actApply: TAction
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      OnExecute = actApplyExecute
    end
    object actKolotpCount: TAction
      Caption = 'actKolotpCount'
      OnExecute = actKolotpCountExecute
    end
    object actCancel2: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      OnExecute = actCancel2Execute
    end
    object actFilterTara: TAction
      Caption = 'actFilterTara'
      OnExecute = actFilterTaraExecute
    end
    object actDublicate: TAction
      Caption = #1044#1091#1073#1083#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1087#1080#1089#1100
      OnExecute = actDublicateExecute
    end
  end
  object dsNaklpdet: TDataSource
    DataSet = cdsNaklpdet
    Left = 328
    Top = 280
  end
  object sdsNaklpdet: TSQLDataSet
    CommandText = 
      'select '#13#10'  d.id_det,'#13#10'  d.NOMER_TARY,'#13#10'  d.ID_TARA,'#13#10'  d.kolotp,' +
      #13#10'  d.comment,'#13#10'  d.kolbuxt,'#13#10'  d.id_nakld,'#13#10'  d.tip,'#13#10'  d.id_os' +
      'tt'#13#10'from '#13#10'  NAKLODET d'#13#10'where  '#13#10'  d.id_nakld=:id_nakld'#13#10'order ' +
      'by'#13#10'  d.id_det'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_nakld'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 328
    Top = 184
    object sdsNaklpdetID_DET: TIntegerField
      FieldName = 'ID_DET'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsNaklpdetNOMER_TARY: TStringField
      FieldName = 'NOMER_TARY'
      Size = 30
    end
    object sdsNaklpdetID_TARA: TIntegerField
      FieldName = 'ID_TARA'
      Required = True
    end
    object sdsNaklpdetKOLOTP: TFMTBCDField
      FieldName = 'KOLOTP'
      Precision = 15
    end
    object sdsNaklpdetCOMMENT: TStringField
      FieldName = 'COMMENT'
      Size = 50
    end
    object sdsNaklpdetKOLBUXT: TIntegerField
      FieldName = 'KOLBUXT'
      Required = True
    end
    object sdsNaklpdetID_NAKLD: TIntegerField
      FieldName = 'ID_NAKLD'
      Required = True
    end
    object sdsNaklpdetTIP: TSmallintField
      FieldName = 'TIP'
      Required = True
    end
    object sdsNaklpdetID_OSTT: TIntegerField
      FieldName = 'ID_OSTT'
    end
  end
  object dspNaklpdet: TDataSetProvider
    DataSet = sdsNaklpdet
    UpdateMode = upWhereKeyOnly
    Left = 328
    Top = 216
  end
  object cdsNaklpdet: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_nakld'
        ParamType = ptInput
      end>
    ProviderName = 'dspNaklpdet'
    BeforeInsert = cdsNaklpdetBeforeInsert
    AfterInsert = cdsNaklpdetAfterInsert
    BeforeEdit = cdsNaklpdetBeforeEdit
    BeforePost = cdsNaklpdetBeforePost
    AfterPost = cdsNaklpdetAfterPost
    BeforeDelete = cdsNaklpdetBeforeDelete
    AfterDelete = cdsNaklpdetAfterDelete
    BeforeScroll = cdsNaklpdetBeforeScroll
    OnCalcFields = cdsNaklpdetCalcFields
    OnReconcileError = cdsNaklpdetReconcileError
    Left = 328
    Top = 248
    object cdsNaklpdetID_DET: TIntegerField
      FieldName = 'ID_DET'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsNaklpdetNOMER_TARY: TStringField
      DisplayLabel = #8470#1073#1072#1088
      FieldName = 'NOMER_TARY'
      Size = 32
    end
    object cdsNaklpdetID_TARA: TIntegerField
      FieldName = 'ID_TARA'
    end
    object cdsNaklpdetKOLOTP: TFMTBCDField
      DefaultExpression = '0'
      DisplayLabel = #1044#1083#1080#1085#1072
      FieldName = 'KOLOTP'
      DisplayFormat = '0.000'
      Precision = 15
    end
    object cdsNaklpdetCOMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'COMMENT'
      Size = 52
    end
    object cdsNaklpdetKOLBUXT: TIntegerField
      DisplayLabel = #1050#1086#1083'. '#1073#1091#1093#1090
      FieldName = 'KOLBUXT'
    end
    object cdsNaklpdetTARA: TStringField
      DisplayLabel = #1058#1072#1088#1072
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'TARA'
      LookupDataSet = dmdEx.cdsTara
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_TARA'
      Size = 50
      Lookup = True
    end
    object cdsNaklpdetkolsum: TFloatField
      FieldKind = fkCalculated
      FieldName = 'KOLSUM'
      Calculated = True
    end
    object cdsNaklpdetID_NAKLD: TIntegerField
      FieldName = 'ID_NAKLD'
    end
    object cdsNaklpdetTIP: TSmallintField
      FieldName = 'TIP'
      Required = True
    end
    object cdsNaklpdetID_OSTT: TIntegerField
      DefaultExpression = '0'
      FieldName = 'ID_OSTT'
    end
  end
  object DBSumList1: TDBSumList
    Active = False
    DataSet = cdsNaklpdet
    ExternalRecalc = False
    SumCollection = <
      item
        FieldName = 'kolsum'
        GroupOperation = goSum
      end>
    VirtualRecords = False
    SumListChanged = DBSumList1SumListChanged
    Left = 296
    Top = 248
  end
  object sdsTara: TSQLDataSet
    CommandText = 
      'select '#13#10'  st.id_ostt,'#13#10'  st.ID_TARA, '#13#10'  st.NOMER_TARY,'#13#10'  st.k' +
      'olotp,'#13#10'  st.kolbuxt,'#13#10'  st.comment'#13#10'from '#13#10'  SKLOSTT st '#13#10'  inn' +
      'er join SKLOST sm'#13#10'    on sm.id_ost=st.id_ost'#13#10'where'#13#10'  st.id_ty' +
      'pe<>3  and'#13#10'  sm.id_tovar=:id_tovar and'#13#10'  sm.id_sklad=:id_sklad' +
      #13#10'order by '#13#10'  st.kolotp desc, st.nomer_tary'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_tovar'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_sklad'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = dmdEx.scUchet
    Left = 264
    Top = 184
    object sdsTaraID_OSTT: TIntegerField
      FieldName = 'ID_OSTT'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsTaraID_TARA: TIntegerField
      FieldName = 'ID_TARA'
      Required = True
    end
    object sdsTaraNOMER_TARY: TStringField
      FieldName = 'NOMER_TARY'
      Size = 30
    end
    object sdsTaraKOLOTP: TFMTBCDField
      FieldName = 'KOLOTP'
      Required = True
      Precision = 15
    end
    object sdsTaraCOMMENT: TStringField
      FieldName = 'COMMENT'
      Size = 50
    end
    object sdsTaraKOLBUXT: TIntegerField
      FieldName = 'KOLBUXT'
    end
  end
  object dspTara: TDataSetProvider
    DataSet = sdsTara
    Left = 264
    Top = 216
  end
  object cdsTara: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_tovar'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_sklad'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspTara'
    Left = 264
    Top = 248
    object cdsTaraID_OSTT: TIntegerField
      FieldName = 'ID_OSTT'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTaraID_TARA: TIntegerField
      FieldName = 'ID_TARA'
      Required = True
    end
    object cdsTaraNOMER_TARY: TStringField
      DisplayLabel = #8470#1073#1072#1088
      FieldName = 'NOMER_TARY'
      Size = 30
    end
    object cdsTaraKOLOTP: TFMTBCDField
      DisplayLabel = #1044#1083#1080#1085#1072
      FieldName = 'KOLOTP'
      Required = True
      DisplayFormat = '0.000'
      Precision = 15
    end
    object cdsTaraTARA: TStringField
      DisplayLabel = #1058#1072#1088#1072
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'TARA'
      LookupDataSet = dmdEx.cdsTara
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_TARA'
      Size = 50
      Lookup = True
    end
    object cdsTaraCOMMENT: TStringField
      FieldName = 'COMMENT'
      Size = 50
    end
    object cdsTaraKOLBUXT: TIntegerField
      DisplayLabel = #1041#1091#1093#1090
      FieldName = 'KOLBUXT'
    end
  end
  object dsTara: TDataSource
    DataSet = cdsTara
    Left = 264
    Top = 280
  end
  object PopupMenu1: TPopupMenu
    Left = 185
    Top = 216
    object N1: TMenuItem
      Action = actDublicate
    end
  end
end
