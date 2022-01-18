object frmRepDengiNaSchetax: TfrmRepDengiNaSchetax
  Left = 129
  Top = 159
  BorderStyle = bsDialog
  Caption = #1054#1090#1095#1105#1090' '#1087#1086' '#1076#1074#1080#1078#1077#1085#1080#1102' '#1076#1077#1085#1077#1078#1085#1099#1093' '#1089#1088#1077#1076#1089#1090#1074
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
      'select'#13#10'  (select name from objects o where o.oid=r.sub1) as sub' +
      '1_name,'#13#10'  (select fullname from objects o where o.oid=r.sub2) a' +
      's sub2_name,'#13#10'  (select name from objects o where o.oid=r.sub3) ' +
      'as sub3_name,'#13#10'  r.sub1, r.sub2,r.sub3,'#13#10'  (select fullname from' +
      ' objects o where o.oid=r.sub1) as IZGFULLNAME,'#13#10'  (select fullna' +
      'me from objects o where o.oid=r.sub2) as BANKFULLNAME,'#13#10'  sum(r.' +
      'debetbefore)-minnum(sum(r.debetbefore),sum(kreditbefore)) as deb' +
      'etbefore,'#13#10'  sum(r.kreditbefore)-minnum(sum(r.debetbefore),sum(k' +
      'reditbefore)) as kreditbefore,'#13#10'  sum(debet) as debet,'#13#10'  sum(kr' +
      'edit) as kredit,'#13#10'  sum(r.debetafter)-minnum(sum(r.debetafter),s' +
      'um(kreditafter)) as debetafter,'#13#10'  sum(r.kreditafter)-minnum(sum' +
      '(r.debetafter),sum(kreditafter)) as kreditafter,'#13#10'  max(kurs) as' +
      ' kurs,'#13#10'  max(kurs_indirect) as kurs_indirect,'#13#10'  sum(r.DEBETAFT' +
      'ERINCURRENCY)-minnum(sum(r.DEBETAFTERINCURRENCY),sum(KREDITAFTER' +
      'INCURRENCY)) as DEBETAFTERINCURRENCY,'#13#10'  sum(r.KREDITAFTERINCURR' +
      'ENCY)-minnum(sum(r.DEBETAFTERINCURRENCY),sum(KREDITAFTERINCURREN' +
      'CY)) as KREDITAFTERINCURRENCY'#13#10#13#10'from rep_oborotka2_roles_pc(:id' +
      '_schet,:dat_from,:dat_to,'#13#10'  :sub1_in,:sub2_in,:sub3_in, :sub4_i' +
      'n, :sub5_in,'#13#10'  :sub6_in,:sub7_in,:sub8_in, :sub9_in, :sub10_in,' +
      #13#10'  '#39'POWER_USER;BUXG'#39',:id_currency_to,3) r'#13#10'group by sub1,sub2,s' +
      'ub3'#13#10'order by 1,2'#13#10#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_schet'
        ParamType = ptInput
        Value = -80
      end
      item
        DataType = ftDate
        Name = 'dat_from'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dat_to'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sub1_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sub2_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sub3_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sub4_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sub5_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sub6_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sub7_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sub8_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sub9_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sub10_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_currency_to'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 264
    Top = 124
    object sdsDolgBux2SUB1_NAME: TStringField
      FieldName = 'SUB1_NAME'
      Size = 50
    end
    object sdsDolgBux2SUB2_NAME: TStringField
      FieldName = 'SUB2_NAME'
      Size = 50
    end
    object sdsDolgBux2SUB3_NAME: TStringField
      FieldName = 'SUB3_NAME'
      Size = 50
    end
    object sdsDolgBux2SUB1: TIntegerField
      FieldName = 'SUB1'
    end
    object sdsDolgBux2SUB2: TIntegerField
      FieldName = 'SUB2'
    end
    object sdsDolgBux2SUB3: TFMTBCDField
      FieldName = 'SUB3'
      Precision = 15
    end
    object sdsDolgBux2IZGFULLNAME: TStringField
      FieldName = 'IZGFULLNAME'
      Size = 250
    end
    object sdsDolgBux2BANKFULLNAME: TStringField
      FieldName = 'BANKFULLNAME'
      Size = 250
    end
    object sdsDolgBux2DEBETBEFORE: TFloatField
      FieldName = 'DEBETBEFORE'
    end
    object sdsDolgBux2KREDITBEFORE: TFloatField
      FieldName = 'KREDITBEFORE'
    end
    object sdsDolgBux2DEBET: TFloatField
      FieldName = 'DEBET'
    end
    object sdsDolgBux2KREDIT: TFloatField
      FieldName = 'KREDIT'
    end
    object sdsDolgBux2DEBETAFTER: TFloatField
      FieldName = 'DEBETAFTER'
    end
    object sdsDolgBux2KREDITAFTER: TFloatField
      FieldName = 'KREDITAFTER'
    end
    object sdsDolgBux2DEBETAFTERINCURRENCY: TFloatField
      FieldName = 'DEBETAFTERINCURRENCY'
    end
    object sdsDolgBux2KREDITAFTERINCURRENCY: TFloatField
      FieldName = 'KREDITAFTERINCURRENCY'
    end
    object sdsDolgBux2KURS: TFloatField
      FieldName = 'KURS'
    end
    object sdsDolgBux2KURS_INDIRECT: TIntegerField
      FieldName = 'KURS_INDIRECT'
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
        Name = 'id_schet'
        ParamType = ptInput
        Value = -80
      end
      item
        DataType = ftDate
        Name = 'dat_from'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dat_to'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sub1_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sub2_in'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'sub3_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sub4_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sub5_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sub6_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sub7_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sub8_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sub9_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sub10_in'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_currency_to'
        ParamType = ptInput
      end>
    ProviderName = 'dspDolgBux2'
    Left = 264
    Top = 192
    object cdsDolgBux2SUB1_NAME: TStringField
      DisplayLabel = #1060#1080#1088#1084#1072
      DisplayWidth = 20
      FieldName = 'SUB1_NAME'
      Size = 50
    end
    object cdsDolgBux2SUB2_NAME: TStringField
      DisplayLabel = #1057#1095#1105#1090
      DisplayWidth = 20
      FieldName = 'SUB2_NAME'
      Size = 50
    end
    object cdsDolgBux2SUB3_NAME: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      DisplayWidth = 10
      FieldName = 'SUB3_NAME'
      Size = 50
    end
    object cdsDolgBux2SUB1: TIntegerField
      FieldName = 'SUB1'
      Visible = False
    end
    object cdsDolgBux2SUB2: TIntegerField
      FieldName = 'SUB2'
      Visible = False
    end
    object cdsDolgBux2SUB3: TFMTBCDField
      FieldName = 'SUB3'
      Visible = False
      Precision = 15
    end
    object cdsDolgBux2IZGFULLNAME: TStringField
      FieldName = 'IZGFULLNAME'
      Visible = False
      Size = 250
    end
    object cdsDolgBux2BANKFULLNAME: TStringField
      FieldName = 'BANKFULLNAME'
      Visible = False
      Size = 250
    end
    object cdsDolgBux2DEBETBEFORE: TFloatField
      DisplayLabel = #1044#1077#1073#1077#1090' '#1085#1072' '#1085#1072#1095#1072#1083#1086
      FieldName = 'DEBETBEFORE'
      DisplayFormat = '0.00'
    end
    object cdsDolgBux2KREDITBEFORE: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090' '#1085#1072' '#1085#1072#1095#1072#1083#1086
      FieldName = 'KREDITBEFORE'
      DisplayFormat = '0.00'
    end
    object cdsDolgBux2DEBET: TFloatField
      DisplayLabel = #1044#1077#1073#1077#1090
      FieldName = 'DEBET'
      DisplayFormat = '0.00'
    end
    object cdsDolgBux2KREDIT: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090
      FieldName = 'KREDIT'
      DisplayFormat = '0.00'
    end
    object cdsDolgBux2DEBETAFTER: TFloatField
      DisplayLabel = #1044#1077#1073#1077#1090' '#1085#1072' '#1082#1086#1085#1077#1094
      FieldName = 'DEBETAFTER'
      DisplayFormat = '0.00'
    end
    object cdsDolgBux2KREDITAFTER: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090' '#1085#1072' '#1082#1086#1085#1077#1094
      FieldName = 'KREDITAFTER'
      DisplayFormat = '0.00'
    end
    object cdsDolgBux2DEBETAFTERINCURRENCY: TFloatField
      FieldName = 'DEBETAFTERINCURRENCY'
      DisplayFormat = '0.00'
    end
    object cdsDolgBux2KREDITAFTERINCURRENCY: TFloatField
      FieldName = 'KREDITAFTERINCURRENCY'
      DisplayFormat = '0.00'
    end
    object cdsDolgBux2KURS: TFloatField
      FieldName = 'KURS'
      Visible = False
    end
    object cdsDolgBux2KURS_INDIRECT: TIntegerField
      FieldName = 'KURS_INDIRECT'
      Visible = False
    end
  end
  object sdsBankNotlist: TSQLDataSet
    CommandText = 'select id_bank'#13#10'from GET_MANAGER_BANK_NOTLIST_PC(null)'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 300
    Top = 124
    object sdsBankNotlistID_BANK: TIntegerField
      FieldName = 'ID_BANK'
    end
  end
  object dspBankNotlist: TDataSetProvider
    DataSet = sdsBankNotlist
    Options = [poAllowCommandText]
    Left = 300
    Top = 160
  end
  object cdsBankNotlist: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBankNotlist'
    Left = 300
    Top = 192
    object cdsBankNotlistID_BANK: TIntegerField
      FieldName = 'ID_BANK'
    end
  end
end
