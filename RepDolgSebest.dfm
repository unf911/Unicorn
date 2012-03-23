object frmRepDolgSebest: TfrmRepDolgSebest
  Left = 276
  Top = 282
  BorderStyle = bsDialog
  Caption = #1054#1090#1095#1105#1090' '#1087#1086' '#1089#1077#1073#1077#1089#1090#1086#1080#1084#1086#1089#1090#1080' '#1076#1086#1083#1075#1072
  ClientHeight = 351
  ClientWidth = 632
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
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object sdsDolgBux2: TSQLDataSet
    CommandText = 
      'select '#13#10'  (select name from objects o where o.oid=r.id_izg) as ' +
      'izg,'#13#10'  (select name from objects o where o.oid=r.id_zak) as zak' +
      ','#13#10'  (select name from objects o where o.oid=r.id_manager) as ma' +
      'nager,'#13#10' '#13#10'  r.*'#13#10'from rep_dolg_sebest_pc(:id_izg,:id_zak,:id_ma' +
      'nager,:dat_to_in) r'#13#10'order by 1,2,3 '#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_izg'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_zak'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_manager'
        ParamType = ptInput
        Value = 12889
      end
      item
        DataType = ftDate
        Name = 'dat_to_in'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 264
    Top = 128
    object sdsDolgBux2IZG: TStringField
      FieldName = 'IZG'
      Size = 50
    end
    object sdsDolgBux2ZAK: TStringField
      FieldName = 'ZAK'
      Size = 50
    end
    object sdsDolgBux2MANAGER: TStringField
      FieldName = 'MANAGER'
      Size = 50
    end
    object sdsDolgBux2ID: TStringField
      FieldName = 'ID'
    end
    object sdsDolgBux2DAT: TSQLTimeStampField
      FieldName = 'DAT'
    end
    object sdsDolgBux2ID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
    end
    object sdsDolgBux2ID_IZG: TIntegerField
      FieldName = 'ID_IZG'
    end
    object sdsDolgBux2ID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
    end
    object sdsDolgBux2ID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
    end
    object sdsDolgBux2NDS: TFloatField
      FieldName = 'NDS'
    end
    object sdsDolgBux2DOLG: TFloatField
      FieldName = 'DOLG'
    end
    object sdsDolgBux2PERCENT_NEOPL: TFloatField
      FieldName = 'PERCENT_NEOPL'
    end
    object sdsDolgBux2SUM_OTGR: TFloatField
      FieldName = 'SUM_OTGR'
    end
    object sdsDolgBux2SUM_SEBEST: TFloatField
      FieldName = 'SUM_SEBEST'
    end
    object sdsDolgBux2PRIBYL: TFloatField
      FieldName = 'PRIBYL'
    end
    object sdsDolgBux2OTKAT: TFloatField
      FieldName = 'OTKAT'
    end
    object sdsDolgBux2SEBEST: TFloatField
      FieldName = 'SEBEST'
    end
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
        DataType = ftInteger
        Name = 'id_izg'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'id_zak'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'id_manager'
        ParamType = ptInput
        Value = 12889
      end
      item
        DataType = ftDate
        Name = 'dat_to_in'
        ParamType = ptInput
        Value = Null
      end>
    ProviderName = 'dspDolgBux2'
    Left = 264
    Top = 192
    object cdsDolgBux2IZG: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      DisplayWidth = 20
      FieldName = 'IZG'
      Size = 50
    end
    object cdsDolgBux2ZAK: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      DisplayWidth = 20
      FieldName = 'ZAK'
      Size = 50
    end
    object cdsDolgBux2MANAGER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      DisplayWidth = 10
      FieldName = 'MANAGER'
      Size = 50
    end
    object cdsDolgBux2ID: TStringField
      DisplayLabel = #8470
      DisplayWidth = 10
      FieldName = 'ID'
    end
    object cdsDolgBux2DAT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 10
      FieldName = 'DAT'
    end
    object cdsDolgBux2ID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      Visible = False
    end
    object cdsDolgBux2ID_IZG: TIntegerField
      FieldName = 'ID_IZG'
      Visible = False
    end
    object cdsDolgBux2ID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
      Visible = False
    end
    object cdsDolgBux2ID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
      Visible = False
    end
    object cdsDolgBux2NDS: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1085#1072#1082#1083' '#1089' '#1053#1044#1057
      FieldName = 'NDS'
      DisplayFormat = '0.00'
    end
    object cdsDolgBux2DOLG: TFloatField
      DisplayLabel = #1044#1086#1083#1075
      FieldName = 'DOLG'
      DisplayFormat = '0.00'
    end
    object cdsDolgBux2PERCENT_NEOPL: TFloatField
      DisplayLabel = '% '#1085#1077#1086#1087#1083#1072#1095#1077#1085#1085#1086#1089#1090#1080
      FieldName = 'PERCENT_NEOPL'
      DisplayFormat = '0.00'
    end
    object cdsDolgBux2SUM_OTGR: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1092#1072#1082#1090
      FieldName = 'SUM_OTGR'
      DisplayFormat = '0.00'
    end
    object cdsDolgBux2SUM_SEBEST: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1089#1077#1073#1077#1089#1090' '#1074' '#1075#1088#1085' '#1089' '#1053#1044#1057
      FieldName = 'SUM_SEBEST'
      DisplayFormat = '0.00'
    end
    object cdsDolgBux2PRIBYL: TFloatField
      DisplayLabel = #1055#1088#1080#1073#1099#1083#1100' '#1074' '#1076#1086#1083#1075#1072#1093
      FieldName = 'PRIBYL'
      DisplayFormat = '0.00'
    end
    object cdsDolgBux2OTKAT: TFloatField
      DisplayLabel = #1054#1090#1082#1072#1090' '#1074' '#1076#1086#1083#1075#1072#1093
      FieldName = 'OTKAT'
      DisplayFormat = '0.00'
    end
    object cdsDolgBux2SEBEST: TFloatField
      DisplayLabel = #1057#1077#1073#1077#1089#1090#1086#1080#1084#1086#1089#1090#1100' '#1076#1086#1083#1075#1072
      FieldName = 'SEBEST'
      DisplayFormat = '0.00'
    end
  end
end
