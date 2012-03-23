object frmRepBalansKursDiff: TfrmRepBalansKursDiff
  Left = 223
  Top = 196
  Width = 559
  Height = 450
  Caption = #1054#1090#1095#1105#1090' '#1087#1086' '#1082#1091#1088#1089#1086#1074#1099#1084' '#1088#1072#1079#1085#1080#1094#1072#1084
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ActionList2: TActionList
    Left = 64
    Top = 28
  end
  object sdsRasxodNalMake: TSQLDataSet
    CommandText = 'RASXOD_NAL_MAKE_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_NAKL_IN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'MODE_IN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_NAKL'
        ParamType = ptOutput
        Size = 4
      end>
    SQLConnection = dmdEx.scUchet
    Left = 104
    Top = 28
  end
  object sdsDolgBux2: TSQLDataSet
    CommandText = 
      'select'#13#10'  *'#13#10'from REP_BALANS_KURS_DIFF_PC(:dat_from,:dat_to,:id_' +
      'currency_to) b'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'dat_from'
        ParamType = ptInput
        Value = 39814d
      end
      item
        DataType = ftDate
        Name = 'dat_to'
        ParamType = ptInput
        Value = 39814d
      end
      item
        DataType = ftInteger
        Name = 'id_currency_to'
        ParamType = ptInput
        Value = 3035
      end>
    SQLConnection = dmdEx.scUchet
    Left = 264
    Top = 128
  end
  object dspDolgBux2: TDataSetProvider
    DataSet = sdsDolgBux2
    Options = [poAllowCommandText]
    Left = 264
    Top = 160
  end
  object cdsDolgBux2: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDateTime
        Name = 'dat_from'
        ParamType = ptInput
        Value = 39814d
      end
      item
        DataType = ftDateTime
        Name = 'dat_to'
        ParamType = ptInput
        Value = 39814d
      end
      item
        DataType = ftInteger
        Name = 'id_currency_to'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspDolgBux2'
    Left = 264
    Top = 192
    object cdsDolgBux2OID: TIntegerField
      FieldName = 'OID'
      Visible = False
    end
    object cdsDolgBux2NAME: TStringField
      FieldName = 'NAME'
      Visible = False
      Size = 50
    end
    object cdsDolgBux2FULLNAME: TStringField
      DisplayLabel = #1057#1090#1072#1090#1100#1103' '#1073#1072#1083#1072#1085#1089#1072
      DisplayWidth = 20
      FieldName = 'FULLNAME'
      Size = 255
    end
    object cdsDolgBux2ID_CURRENCY: TIntegerField
      FieldName = 'ID_CURRENCY'
      Visible = False
    end
    object cdsDolgBux2CURRENCY: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072' '#1080#1089#1093#1086#1076#1085#1072#1103
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'CURRENCY'
      LookupDataSet = dmdEx.cdsCurrency
      LookupKeyFields = 'OID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_CURRENCY'
      Size = 50
      Lookup = True
    end
    object cdsDolgBux2SUM_FROM: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082' '#1074' '#1080#1089#1093' '#1074#1072#1083#1102#1090#1077
      FieldName = 'SUM_FROM'
      DisplayFormat = '0.00'
    end
    object cdsDolgBux2KURS_INDIRECT: TIntegerField
      DisplayLabel = #1054#1073#1088#1072#1090#1085#1099#1081' '#1082#1091#1088#1089
      FieldName = 'KURS_INDIRECT'
    end
    object cdsDolgBux2KURS_DAT_FROM: TFloatField
      DisplayLabel = #1050#1091#1088#1089' '#1085#1072' '#1085#1072#1095#1072#1083#1086
      FieldName = 'KURS_DAT_FROM'
    end
    object cdsDolgBux2KURS_DAT_TO: TFloatField
      DisplayLabel = #1050#1091#1088#1089' '#1085#1072' '#1082#1086#1085#1077#1094
      FieldName = 'KURS_DAT_TO'
    end
    object cdsDolgBux2SUM_DAT_FROM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1085#1072' '#1085#1072#1095#1072#1083#1086
      FieldName = 'SUM_DAT_FROM'
      DisplayFormat = '0.00'
    end
    object cdsDolgBux2SUM_DAT_TO: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1085#1072' '#1082#1086#1085#1077#1094
      FieldName = 'SUM_DAT_TO'
      DisplayFormat = '0.00'
    end
    object cdsDolgBux2KURS_DIFF: TFloatField
      DisplayLabel = #1050#1091#1088#1089#1086#1074#1072#1103' '#1088#1072#1079#1085#1080#1094#1072
      FieldName = 'KURS_DIFF'
      DisplayFormat = '0.00'
    end
  end
end
