object frmEdizSpr: TfrmEdizSpr
  Left = 425
  Top = 249
  Width = 456
  Height = 181
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1077#1076#1080#1085#1080#1094' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
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
  object sdsEdiz: TSQLDataSet
    CommandText = 'select *'#13#10'from EDIZ'#13#10'order by name'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 104
    Top = 40
    object sdsEdizOID: TIntegerField
      FieldName = 'OID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsEdizNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
    object sdsEdizKOD: TIntegerField
      FieldName = 'KOD'
    end
    object sdsEdizFULLNAME: TStringField
      FieldName = 'FULLNAME'
      Size = 100
    end
    object sdsEdizDELMARKED: TSmallintField
      FieldName = 'DELMARKED'
    end
  end
  object dspEdiz: TDataSetProvider
    DataSet = sdsEdiz
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 136
    Top = 40
  end
  object cdsEdiz: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEdiz'
    AfterInsert = cdsEdizAfterInsert
    Left = 168
    Top = 40
    object cdsEdizOID: TIntegerField
      DisplayLabel = #8470#1087#1087
      FieldName = 'OID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsEdizNAME: TStringField
      DisplayLabel = #1050#1088#1072#1090#1082#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
      DisplayWidth = 10
      FieldName = 'NAME'
      Size = 50
    end
    object cdsEdizKOD: TIntegerField
      DisplayLabel = #1050#1086#1076' '#1077#1076#1080#1085#1080#1094#1099' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
      DisplayWidth = 4
      FieldName = 'KOD'
    end
    object cdsEdizFULLNAME: TStringField
      DisplayLabel = #1044#1083#1080#1085#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
      DisplayWidth = 50
      FieldName = 'FULLNAME'
      Size = 100
    end
    object cdsEdizDELMARKED: TSmallintField
      DisplayLabel = #1059#1076#1072#1083#1077#1085
      DisplayWidth = 4
      FieldName = 'DELMARKED'
    end
  end
end
