object frmClientSchet: TfrmClientSchet
  Left = 163
  Top = 262
  Width = 527
  Height = 180
  Caption = #1057#1095#1077#1090#1072' '#1092#1080#1088#1084#1099
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
  object sdsSchet: TSQLDataSet
    CommandText = 
      'select oid,bank_name,rasch,mfo,id_klient,delmarked,id_currency,'#13 +
      #10'  fullname,id_manager,'#13#10'  is_nal'#13#10'from BANK_VW b'#13#10'where'#13#10'  id_k' +
      'lient=:id_klient and '#13#10'  delmarked=0'#13#10'order by b.fullname'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_klient'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 104
    Top = 40
    object sdsSchetID: TIntegerField
      FieldName = 'OID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsSchetBANK_NAME: TStringField
      FieldName = 'BANK_NAME'
      Size = 50
    end
    object sdsSchetRASCH: TFloatField
      FieldName = 'RASCH'
    end
    object sdsSchetMFO: TFloatField
      FieldName = 'MFO'
    end
    object sdsSchetID_KLIENT: TIntegerField
      FieldName = 'ID_KLIENT'
      Required = True
    end
    object sdsSchetDELMARKED: TSmallintField
      FieldName = 'DELMARKED'
      Required = True
    end
    object sdsSchetID_CURRENCY: TIntegerField
      FieldName = 'ID_CURRENCY'
    end
    object sdsSchetFULLNAME: TStringField
      FieldName = 'FULLNAME'
      Size = 250
    end
    object sdsSchetIS_NAL: TSmallintField
      FieldName = 'IS_NAL'
    end
    object sdsSchetID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
    end
  end
  object dspSchet: TDataSetProvider
    DataSet = sdsSchet
    Options = [poPropogateChanges]
    UpdateMode = upWhereKeyOnly
    Left = 136
    Top = 40
  end
  object cdsSchet: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_klient'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspSchet'
    AfterInsert = cdsSchetAfterInsert
    Left = 168
    Top = 40
    object cdsSchetID: TIntegerField
      FieldName = 'OID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object cdsSchetFULLNAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1095#1105#1090#1072
      DisplayWidth = 15
      FieldName = 'FULLNAME'
      Size = 250
    end
    object cdsSchetBANK_NAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1073#1072#1085#1082#1072
      DisplayWidth = 40
      FieldName = 'BANK_NAME'
      Size = 50
    end
    object cdsSchetRASCH: TFloatField
      DisplayLabel = #1056#1072#1089#1095'/'#1089#1095
      FieldName = 'RASCH'
    end
    object cdsSchetMFO: TFloatField
      DisplayLabel = #1052#1060#1054
      FieldName = 'MFO'
    end
    object cdsSchetID_KLIENT: TIntegerField
      FieldName = 'ID_KLIENT'
      Required = True
      Visible = False
    end
    object cdsSchetDELMARKED: TSmallintField
      FieldName = 'DELMARKED'
      Required = True
      Visible = False
    end
    object cdsSchetID_CURRENCY: TIntegerField
      FieldName = 'ID_CURRENCY'
      Visible = False
    end
    object cdsSchetCURRENCY: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      DisplayWidth = 5
      FieldKind = fkLookup
      FieldName = 'CURRENCY'
      LookupDataSet = dmdEx.cdsCurrency
      LookupKeyFields = 'OID'
      LookupResultField = 'FULLNAME'
      KeyFields = 'ID_CURRENCY'
      Size = 10
      Lookup = True
    end
    object cdsSchetIS_NAL: TSmallintField
      DisplayLabel = #1050#1072#1089#1089#1072
      FieldName = 'IS_NAL'
    end
    object cdsSchetID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
    end
    object cdsSchetMANAGER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'MANAGER'
      LookupDataSet = dmdEx.cdsManager
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_MANAGER'
      Size = 50
      Lookup = True
    end
  end
end
