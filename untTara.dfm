object frmTara: TfrmTara
  Left = 438
  Top = 503
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1090#1072#1088#1099
  ClientHeight = 261
  ClientWidth = 481
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    481
    261)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 8
    Top = 8
    Width = 465
    Height = 209
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsTara
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'TARA'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'NOMER_TARY'
        Footers = <>
      end>
  end
  object BitBtn1: TBitBtn
    Left = 80
    Top = 232
    Width = 121
    Height = 25
    Anchors = [akLeft, akBottom]
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 240
    Top = 232
    Width = 105
    Height = 25
    Anchors = [akLeft, akBottom]
    TabOrder = 2
    Kind = bkCancel
  end
  object BitBtn3: TBitBtn
    Left = 376
    Top = 232
    Width = 97
    Height = 25
    Action = actDetail
    Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
    TabOrder = 3
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
  object sdsTara: TSQLDataSet
    CommandText = 
      'select '#13#10'  st.id_ostt,'#13#10'  st.ID_TARA, '#13#10'  st.NOMER_TARY  '#13#10'from ' +
      'SKLOSTT st inner join sklost sm'#13#10'  on st.id_ost=sm.id_ost'#13#10'where' +
      '  st.id_type=1 and sm.id_sklad=:id_sklad'#13#10'order by st.ID_TARA, s' +
      't.NOMER_TARY'#13#10'  '#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'id_sklad'
        ParamType = ptInput
        Value = '0'
      end>
    SQLConnection = dmdEx.scUchet
    Left = 24
    Top = 128
  end
  object dspTara: TDataSetProvider
    DataSet = sdsTara
    Left = 24
    Top = 160
  end
  object cdsTara: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'id_sklad'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'dspTara'
    Left = 24
    Top = 192
    object cdsTaraTARA: TStringField
      DisplayLabel = #1058#1072#1088#1072
      FieldKind = fkLookup
      FieldName = 'TARA'
      LookupDataSet = dmdEx.cdsTara
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_TARA'
      Lookup = True
    end
    object cdsTaraNOMER_TARY: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1090#1072#1088#1099
      FieldName = 'NOMER_TARY'
      Size = 30
    end
    object cdsTaraID_TARA: TIntegerField
      FieldName = 'ID_TARA'
    end
    object cdsTaraID_OSTT: TIntegerField
      FieldName = 'ID_OSTT'
      Required = True
    end
  end
  object dsTara: TDataSource
    DataSet = cdsTara
    Left = 24
    Top = 224
  end
  object ActionList1: TActionList
    Left = 56
    Top = 128
    object actDetail: TAction
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      OnExecute = actDetailExecute
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
    Left = 56
    Top = 160
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'frmTara'
    StorageManager = rpsClientEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      '<P>.WindowState')
    Left = 56
    Top = 192
  end
  object rpsClientEdit: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 56
    Top = 224
  end
end
