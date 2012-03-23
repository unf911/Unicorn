object frmRepDolgAgent: TfrmRepDolgAgent
  Left = 81
  Top = 0
  Width = 559
  Height = 450
  Caption = #1044#1086#1083#1075#1080' '#1072#1075#1077#1085#1090#1086#1074
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
      'select'#13#10'  (select name from objects o where o.oid=r.sub1) as sub' +
      '1_name,'#13#10'  (select name from objects o where o.oid=r.sub2) as su' +
      'b2_name,'#13#10'  r.sub1, r.sub2,'#13#10'  sum(r.debetbefore)-minnum(sum(r.d' +
      'ebetbefore),sum(kreditbefore)) as debetbefore,'#13#10'  sum(r.kreditbe' +
      'fore)-minnum(sum(r.debetbefore),sum(kreditbefore)) as kreditbefo' +
      're,'#13#10'  sum(debet) as debet,'#13#10'  sum(kredit) as kredit,'#13#10'  sum(r.d' +
      'ebetafter)-minnum(sum(r.debetafter),sum(kreditafter)) as debetaf' +
      'ter,'#13#10'  sum(r.kreditafter)-minnum(sum(r.debetafter),sum(kreditaf' +
      'ter)) as kreditafter,'#13#10'  sum(r.DEBETAFTERINCURRENCY)-minnum(sum(' +
      'r.DEBETAFTERINCURRENCY),sum(KREDITAFTERINCURRENCY)) as DEBETAFTE' +
      'RINCURRENCY,'#13#10'  sum(r.KREDITAFTERINCURRENCY)-minnum(sum(r.DEBETA' +
      'FTERINCURRENCY),sum(KREDITAFTERINCURRENCY)) as KREDITAFTERINCURR' +
      'ENCY'#13#10'  '#13#10'from rep_oborotka2_roles_pc(:id_schet,:dat_from,:dat_t' +
      'o,'#13#10'  :sub1_in,:sub2_in,:sub3_in, :sub4_in, :sub5_in,'#13#10'  :sub6_i' +
      'n,:sub7_in,:sub8_in, :sub9_in, :sub10_in,'#39'POWER_USER'#39',:id_curren' +
      'cy_to,2) r'#13#10'group by sub1,sub2'#13#10'order by 1,2'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_schet'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'dat_from'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'dat_to'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'sub1_in'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'sub2_in'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'sub3_in'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'sub4_in'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'sub5_in'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'sub6_in'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'sub7_in'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'sub8_in'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'sub9_in'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'sub10_in'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_currency_to'
        ParamType = ptInput
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
        DataType = ftInteger
        Name = 'id_schet'
        ParamType = ptInput
        Value = '9043'
      end
      item
        DataType = ftDate
        Name = 'dat_from'
        ParamType = ptInput
        Value = 38169d
      end
      item
        DataType = ftDate
        Name = 'dat_to'
        ParamType = ptInput
        Value = 38169d
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
        Value = 3036
      end>
    ProviderName = 'dspDolgBux2'
    Left = 264
    Top = 192
  end
end
