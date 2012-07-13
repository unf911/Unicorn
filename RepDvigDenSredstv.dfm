object frmRepDvigDenSredstv: TfrmRepDvigDenSredstv
  Left = 230
  Top = 153
  Width = 559
  Height = 450
  Caption = #1057#1090#1072#1090#1100#1080' '#1076#1086#1093#1086#1076#1072' '#1080' '#1088#1072#1089#1093#1086#1076#1072
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
  object sdsDolgBux2: TSQLDataSet
    CommandText = 
      'select'#13#10'  (select o.fullname from objects o where o.oid=r.sub1) ' +
      'as sub1_name,'#13#10'  (select o2.fullname from objects o2 where o2.oi' +
      'd=r.sub2) as sub2_name,'#13#10'  (select o3.name from objects o3 where' +
      ' o3.oid=r.sub3) as sub3_name,'#13#10'  cast (1 as numeric(15,4)) as ku' +
      'rs,'#13#10'  cast (0 as numeric(15,4)) as kurs_indirect,'#13#10#13#10'  sum(r.de' +
      'bet) as debet,sum(r.kredit) as kredit,'#13#10'  cast (null as numeric(' +
      '15,4)) as sum_final,'#13#10'  sub1,'#13#10'  sub2,'#13#10'  sub3'#13#10'from rep_oborotk' +
      'a_det_pc('#13#10'  (select oid from get_oid_objects_pc('#39#1060#1048#1053#1040#1053#1057#1054#1042#1067#1049' '#1056#1045#1047 +
      #1059#1051#1068#1058#1040#1058#39','#13#10'    (select oid from get_oid_objects_pc('#39#1058#1048#1055' '#1057#1063#1045#1058#1040#39',-1' +
      '00)))'#13#10'  ), :dat_from,:dat_to,'#13#10'    null,null,null,null,null,nul' +
      'l,null,null,null,null,null,null,null) r'#13#10'group by'#13#10'   sub1, sub2' +
      ',sub3'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'dat_from'
        ParamType = ptInput
        Value = 39448d
      end
      item
        DataType = ftDate
        Name = 'dat_to'
        ParamType = ptInput
        Value = 39448d
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
        DataType = ftUnknown
        Name = 'dat_from'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'dat_to'
        ParamType = ptInput
      end>
    ProviderName = 'dspDolgBux2'
    Left = 264
    Top = 192
    object cdsDolgBux2SUB1_NAME: TStringField
      DisplayWidth = 20
      FieldName = 'SUB1_NAME'
      Size = 250
    end
    object cdsDolgBux2SUB2_NAME: TStringField
      DisplayWidth = 20
      FieldName = 'SUB2_NAME'
      Size = 250
    end
    object cdsDolgBux2SUB3_NAME: TStringField
      DisplayWidth = 20
      FieldName = 'SUB3_NAME'
      Size = 50
    end
    object cdsDolgBux2KURS: TFMTBCDField
      FieldName = 'KURS'
      Required = True
      Precision = 15
    end
    object cdsDolgBux2KURS_INDIRECT: TFMTBCDField
      FieldName = 'KURS_INDIRECT'
      Required = True
      Precision = 15
    end
    object cdsDolgBux2DEBET: TFloatField
      FieldName = 'DEBET'
    end
    object cdsDolgBux2KREDIT: TFloatField
      FieldName = 'KREDIT'
    end
    object cdsDolgBux2SUM_FINAL: TFMTBCDField
      FieldName = 'SUM_FINAL'
      Precision = 15
    end
    object cdsDolgBux2SUB1: TIntegerField
      FieldName = 'SUB1'
    end
    object cdsDolgBux2SUB2: TIntegerField
      FieldName = 'SUB2'
    end
    object cdsDolgBux2SUB3: TIntegerField
      FieldName = 'SUB3'
    end
  end
end
