object frmDetSelect: TfrmDetSelect
  Left = 237
  Top = 135
  Width = 403
  Height = 300
  Caption = #1042#1099#1073#1086#1088' '#1087#1086#1079#1080#1094#1080#1081
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 403
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  DesignSize = (
    387
    262)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 8
    Top = 32
    Width = 379
    Height = 200
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoFitColWidths = True
    DataSource = dsNaklo
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghDialogFind]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    VertScrollBar.VisibleMode = sbAlwaysShowEh
  end
  object btnOk: TBitBtn
    Left = 8
    Top = 237
    Width = 169
    Height = 25
    Action = actOk
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    TabOrder = 2
    TabStop = False
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
  object btnCancel: TBitBtn
    Left = 218
    Top = 237
    Width = 169
    Height = 25
    Action = actCancel
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 3
    TabStop = False
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
  object BitBtn1: TBitBtn
    Left = 8
    Top = 3
    Width = 105
    Height = 25
    Action = actSelectAll
    Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1105
    TabOrder = 4
    TabStop = False
    Glyph.Data = {
      F2010000424DF201000000000000760000002800000024000000130000000100
      0400000000007C01000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
      3333333333388F3333333333000033334224333333333333338338F333333333
      0000333422224333333333333833338F33333333000033422222243333333333
      83333338F3333333000034222A22224333333338F33F33338F33333300003222
      A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
      38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
      2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
      0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
      333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
      33333A2224A2233333333338F338F83300003333333333A2224A333333333333
      8F338F33000033333333333A222433333333333338F338F30000333333333333
      A224333333333333338F38F300003333333333333A223333333333333338F8F3
      000033333333333333A3333333333333333383330000}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 121
    Top = 3
    Width = 101
    Height = 25
    Action = aclDeselectAll
    Cancel = True
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1074#1089#1105
    TabOrder = 5
    TabStop = False
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333FFFFF333333000033333388888833333333333F888888FFF333
      000033338811111188333333338833FFF388FF33000033381119999111833333
      38F338888F338FF30000339119933331111833338F388333383338F300003391
      13333381111833338F8F3333833F38F3000039118333381119118338F38F3338
      33F8F38F000039183333811193918338F8F333833F838F8F0000391833381119
      33918338F8F33833F8338F8F000039183381119333918338F8F3833F83338F8F
      000039183811193333918338F8F833F83333838F000039118111933339118338
      F3833F83333833830000339111193333391833338F33F8333FF838F300003391
      11833338111833338F338FFFF883F83300003339111888811183333338FF3888
      83FF83330000333399111111993333333388FFFFFF8833330000333333999999
      3333333333338888883333330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object edtFilter: TEdit
    Left = 336
    Top = 4
    Width = 28
    Height = 21
    Hint = #1042#1074#1077#1076#1080#1090#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1092#1080#1083#1100#1090#1088#1072
    Anchors = [akLeft, akTop, akRight]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Visible = False
    OnExit = edtFilterExit
    OnKeyUp = edtFilterKeyUp
  end
  object BitBtn3: TBitBtn
    Left = 232
    Top = 3
    Width = 93
    Height = 25
    Action = actShowAllSelected
    Caption = #1042#1099#1073#1088#1072#1085#1085#1086#1077
    TabOrder = 6
    TabStop = False
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
  object btnFilterOk: TBitBtn
    Left = 363
    Top = 5
    Width = 25
    Height = 21
    Anchors = [akTop, akRight]
    Caption = 'OK'
    TabOrder = 7
    TabStop = False
    Visible = False
    OnClick = btnFilterOkClick
    NumGlyphs = 2
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmDetSelect'
    StorageManager = rpsClientEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width')
    Left = 144
    Top = 144
  end
  object rpsClientEdit: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 176
    Top = 144
  end
  object UnfFilter1: TUnfFilter
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
    Left = 176
    Top = 112
  end
  object sdsNaklo: TSQLDataSet
    CommandText = 
      'select '#13#10'  d.id_nakld,'#13#10'  d.cena,'#13#10'  d.id_nakl,'#13#10'  d.id_pos,'#13#10'  ' +
      'd.id_tovar,'#13#10'  d.kodcn,'#13#10'  d.kolotp,'#13#10'  d.skidka,'#13#10'  cast (0 as ' +
      'integer) as checked'#13#10'from '#13#10'  naklot d '#13#10'where '#13#10'  d.id_nakl=:id' +
      '_nakl'#13#10'order by'#13#10'  d.id_pos'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_nakl'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = dmdEx.scUchet
    Left = 232
    Top = 152
  end
  object dspNaklo: TDataSetProvider
    DataSet = sdsNaklo
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 232
    Top = 184
  end
  object cdsNaklo: TClientDataSet
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
        Size = 4
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
        Size = 6
      end
      item
        Name = 'SKIDKA'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'CHECKED'
        Attributes = [faRequired]
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_nakl'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspNaklo'
    StoreDefs = True
    Left = 232
    Top = 216
    object cdsNakloCHECKED: TIntegerField
      DisplayLabel = #1042#1099#1073#1088#1072#1085#1072
      FieldName = 'CHECKED'
      Required = True
    end
    object cdsNakloID_NAKLD: TIntegerField
      FieldName = 'ID_NAKLD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object cdsNakloID_POS: TIntegerField
      DisplayLabel = #8470#1087#1086#1079
      DisplayWidth = 2
      FieldName = 'ID_POS'
      Required = True
    end
    object cdsNakloTOVAR: TStringField
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
    object cdsNakloSKIDKA: TFMTBCDField
      DisplayLabel = #1057#1082#1080#1076#1082#1072
      DisplayWidth = 5
      FieldName = 'SKIDKA'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsNakloCENA: TFMTBCDField
      DisplayLabel = #1062#1077#1085#1072
      DisplayWidth = 10
      FieldName = 'CENA'
      DisplayFormat = '0.00'
      Precision = 15
    end
    object cdsNakloID_NAKL: TIntegerField
      DisplayWidth = 1
      FieldName = 'ID_NAKL'
      Required = True
      Visible = False
    end
    object cdsNakloID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
      Required = True
      Visible = False
    end
    object cdsNakloKODCN: TSmallintField
      FieldName = 'KODCN'
      Visible = False
    end
    object cdsNakloKOLOTP: TFMTBCDField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      DisplayWidth = 10
      FieldName = 'KOLOTP'
      DisplayFormat = '0.000'
      Precision = 15
    end
  end
  object dsNaklo: TDataSource
    DataSet = cdsNaklo
    Left = 232
    Top = 248
  end
  object qeNaklo: TQueryExtender
    Query = cdsNaklo
    KeyField = 'id_nakld'
    Left = 232
    Top = 120
  end
  object ActionList1: TActionList
    Left = 144
    Top = 112
    object actSettings: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      ShortCut = 16465
    end
    object actOk: TAction
      Caption = 'OK'
      ShortCut = 16397
      OnExecute = actOkExecute
    end
    object actCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      OnExecute = actCancelExecute
    end
    object actSelectAll: TAction
      Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1105
      ShortCut = 16449
      OnExecute = actSelectAllExecute
    end
    object aclDeselectAll: TAction
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1074#1089#1105
      ShortCut = 16452
      OnExecute = aclDeselectAllExecute
    end
    object actShowAllSelected: TAction
      Caption = #1042#1099#1073#1088#1072#1085#1085#1086#1077
      OnExecute = actShowAllSelectedExecute
    end
  end
  object sdsDetCopy: TSQLDataSet
    CommandText = 'NAKLOT_DET_COPY_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_NAKL_TO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_NAKLD_FROM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIP_TO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'MODE'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 296
    Top = 152
  end
  object sdsSprTovar: TSQLDataSet
    CommandText = 
      'select '#13#10'  id as tovar,'#13#10'  name,'#13#10'  cast (0 as integer) as check' +
      'ed'#13#10'from '#13#10'  tovar_all_vw '#13#10'where '#13#10'  delmarked=0'#13#10'order by'#13#10'  n' +
      'ame'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 264
    Top = 152
  end
  object dspSprTovar: TDataSetProvider
    DataSet = sdsSprTovar
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowCommandText]
    Left = 264
    Top = 184
  end
  object cdsSprTovar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSprTovar'
    Left = 264
    Top = 216
    object cdsSprTovarCHECKED: TIntegerField
      DisplayLabel = #1042#1099#1073#1088#1072#1085#1072
      FieldName = 'CHECKED'
      Required = True
    end
    object cdsSprTovarTOVAR: TIntegerField
      DisplayLabel = #8470
      DisplayWidth = 5
      FieldName = 'TOVAR'
    end
    object cdsSprTovarNAME: TStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      DisplayWidth = 30
      FieldName = 'NAME'
      Size = 50
    end
  end
  object qeSprTovar: TQueryExtender
    Query = cdsSprTovar
    KeyField = 'tovar'
    Left = 264
    Top = 120
  end
  object UnfFilter2: TUnfFilter
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
    Left = 232
    Top = 88
  end
  object psGrid: TPropStorageEh
    Active = False
    Section = 'TfrmDetSelectTovarForPriceChange'
    StorageManager = rpsGrid
    StoredProps.Strings = (
      'DBGridEh1.<P>.Columns.<ForAllItems>.Width')
    Left = 144
    Top = 176
  end
  object rpsGrid: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 176
    Top = 176
  end
  object sdsQuery: TSQLDataSet
    CommandText = 
      'select '#13#10'  id as tovar,'#13#10'  name,'#13#10'  cast (0 as integer) as check' +
      'ed'#13#10'from '#13#10'  tovar_all_vw '#13#10'where '#13#10'  delmarked=0'#13#10'order by'#13#10'  n' +
      'ame'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 328
    Top = 152
  end
  object dspQuery: TDataSetProvider
    DataSet = sdsQuery
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowCommandText]
    Left = 328
    Top = 184
  end
  object cdsQuery: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSprTovar'
    Left = 328
    Top = 216
  end
  object qeQuery: TQueryExtender
    Query = cdsQuery
    KeyField = 'name'
    Left = 328
    Top = 120
  end
end
