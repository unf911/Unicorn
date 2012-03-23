object frmNaklpbuxZatraty: TfrmNaklpbuxZatraty
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1047#1072#1090#1088#1072#1090#1099' '#1085#1072' '#1087#1088#1080#1093#1086#1076#1085#1091#1102' '#1085#1072#1082#1083#1072#1076#1085#1091#1102
  ClientHeight = 543
  ClientWidth = 792
  Color = clBtnFace
  Constraints.MinWidth = 380
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    792
    543)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 8
    Top = 8
    Width = 776
    Height = 489
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsNaklo
    Flat = False
    FooterColor = clInfoBk
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
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
    OnDblClick = DBGridEh1DblClick
    OnKeyDown = DBGridEh1KeyDown
    Columns = <
      item
        EditButtons = <>
        FieldName = 'IZG'
        Footer.ValueType = fvtCount
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'NDS'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'ZATRATY'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'STATYA'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'COMMENT'
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
      end>
  end
  object btnOk: TBitBtn
    Left = 160
    Top = 507
    Width = 169
    Height = 25
    Action = actOk
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'OK'
    TabOrder = 1
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
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmNaklpbuxZatraty'
    StorageManager = rpsClientEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      'DBGridEh1.<P>.Columns.<ForAllItems>.Width')
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
      'select'#13#10'  id_nakl,dat,id_zak,id_izg,nds,comment, id_manager,id,'#13 +
      #10'  posted,id_sklad,id_currency,id_sklad_to,kurs,zatraty,'#13#10'  pare' +
      'nt_id_nakl'#13#10'from NAKLP_ZATR_VW p'#13#10'where p.delmarked=0 and p.pare' +
      'nt_id_nakl=:id_nakl'#13#10'order by p.dat,p.id_nakl'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_nakl'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 232
    Top = 152
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
    object sdsNakloID_IZG: TIntegerField
      FieldName = 'ID_IZG'
    end
    object sdsNakloNDS: TFMTBCDField
      FieldName = 'NDS'
      Required = True
      Precision = 15
    end
    object sdsNakloCOMMENT: TStringField
      FieldName = 'COMMENT'
      Size = 50
    end
    object sdsNakloID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
      Required = True
    end
    object sdsNakloID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
    end
    object sdsNakloID: TStringField
      FieldName = 'ID'
    end
    object sdsNakloPOSTED: TSmallintField
      FieldName = 'POSTED'
      Required = True
    end
    object sdsNakloID_CURRENCY: TSmallintField
      FieldName = 'ID_CURRENCY'
      Required = True
    end
    object sdsNakloID_SKLAD_TO: TIntegerField
      FieldName = 'ID_SKLAD_TO'
      Required = True
    end
    object sdsNakloKURS: TFloatField
      FieldName = 'KURS'
    end
    object sdsNakloZATRATY: TFMTBCDField
      FieldName = 'ZATRATY'
      Precision = 15
    end
    object sdsNakloPARENT_ID_NAKL: TIntegerField
      FieldName = 'PARENT_ID_NAKL'
    end
  end
  object dspNaklo: TDataSetProvider
    DataSet = sdsNaklo
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspNakloBeforeUpdateRecord
    Left = 232
    Top = 184
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
        Name = 'ID_IZG'
        DataType = ftInteger
      end
      item
        Name = 'NDS'
        Attributes = [faRequired]
        DataType = ftFMTBcd
        Precision = 15
        Size = 4
      end
      item
        Name = 'COMMENT'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ID_MANAGER'
        DataType = ftInteger
      end
      item
        Name = 'ID'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'POSTED'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'ID_SKLAD'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ID_CURRENCY'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'ID_SKLAD_TO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'KURS'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'ZATRATY'
        Attributes = [faRequired]
        DataType = ftFMTBcd
        Precision = 15
        Size = 4
      end
      item
        Name = 'PARENT_ID_NAKL'
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
    AfterInsert = cdsNakloAfterInsert
    BeforeScroll = cdsNakloBeforeScroll
    OnReconcileError = cdsNakloReconcileError
    Left = 232
    Top = 216
    object cdsNakloDAT: TSQLTimeStampField
      FieldName = 'DAT'
      Required = True
      Visible = False
    end
    object cdsNakloIZG: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      DisplayWidth = 15
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
      Visible = False
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
      Visible = False
      Size = 30
      Lookup = True
    end
    object cdsNakloSKLAD: TStringField
      DisplayLabel = #1057#1082#1083#1072#1076
      FieldKind = fkLookup
      FieldName = 'SKLAD'
      LookupDataSet = dmdEx.cdsSklads
      LookupKeyFields = 'OID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_SKLAD'
      Visible = False
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
      Visible = False
      Lookup = True
    end
    object cdsNakloID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      Required = True
      Visible = False
    end
    object cdsNakloID: TStringField
      FieldName = 'ID'
      Visible = False
    end
    object cdsNakloID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
      Visible = False
    end
    object cdsNakloID_IZG: TIntegerField
      FieldName = 'ID_IZG'
      Visible = False
    end
    object cdsNakloNDS: TFMTBCDField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 10
      FieldName = 'NDS'
      OnChange = cdsNakloNDSChange
      DisplayFormat = '0.00'
      Precision = 15
    end
    object cdsNakloID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
      Visible = False
    end
    object cdsNakloPOSTED: TSmallintField
      DisplayLabel = #1055#1088#1086#1074#1077#1076#1077#1085#1072
      DisplayWidth = 2
      FieldName = 'POSTED'
      Required = True
      Visible = False
    end
    object cdsNakloID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
      Required = True
      Visible = False
    end
    object cdsNakloID_CURRENCY: TSmallintField
      FieldName = 'ID_CURRENCY'
      Required = True
      Visible = False
    end
    object cdsNakloID_SKLAD_TO: TIntegerField
      FieldName = 'ID_SKLAD_TO'
      Required = True
      Visible = False
    end
    object cdsNakloKURS: TFloatField
      FieldName = 'KURS'
      Required = True
      Visible = False
    end
    object cdsNakloZATRATY: TFMTBCDField
      DisplayLabel = #1055#1088#1086#1094#1077#1085#1090' '#1086#1090' '#1089#1091#1084#1084#1099' '#1087#1088#1080#1093#1086#1076#1085#1086#1081
      DisplayWidth = 7
      FieldName = 'ZATRATY'
      OnChange = cdsNakloZATRATYChange
      Precision = 15
    end
    object cdsNakloSTATYA: TStringField
      DisplayLabel = #1057#1090#1072#1090#1100#1103' '#1088#1072#1089#1093#1086#1076#1072
      FieldKind = fkLookup
      FieldName = 'STATYA'
      LookupDataSet = dmdEx.cdsStatya
      LookupKeyFields = 'OID'
      LookupResultField = 'FULLNAME'
      KeyFields = 'ID_SKLAD_TO'
      Lookup = True
    end
    object cdsNakloPARENT_ID_NAKL: TIntegerField
      FieldName = 'PARENT_ID_NAKL'
      Visible = False
    end
    object cdsNakloCOMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      DisplayWidth = 20
      FieldName = 'COMMENT'
      Size = 50
    end
  end
  object dsNaklo: TDataSource
    DataSet = cdsNaklo
    Left = 232
    Top = 248
  end
  object qeNaklo: TQueryExtender
    Query = cdsNaklo
    KeyField = 'id_nakl'
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
      OnExecute = actOkExecute
    end
    object actCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      OnExecute = actCancelExecute
    end
    object actGrid1ListShow: TAction
      Caption = 'actGrid1ListShow'
      OnExecute = actGrid1ListShowExecute
    end
  end
  object sdsConst: TSQLDataSet
    CommandText = 
      'select def_value,field_value,id_field,table_field'#13#10'from const_ge' +
      't_params_pc(:table_name,:table_field)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'table_name'
        ParamType = ptInput
        Value = 'naklp_zatr_vw'
      end
      item
        DataType = ftString
        Name = 'table_field'
        ParamType = ptInput
        Value = Null
      end>
    SQLConnection = dmdEx.scUchet
    Left = 264
    Top = 152
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
    Left = 296
    Top = 152
  end
end
