object frmRepDolgNal: TfrmRepDolgNal
  Left = 81
  Top = 0
  Width = 559
  Height = 450
  Caption = #1053#1072#1083#1080#1095#1085#1099#1077' '#1076#1086#1083#1075#1080
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
    object actRasxodNalMake: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1088#1072#1089#1093#1086#1076' '#1087#1086' '#1082#1072#1089#1089#1077' '#1080' '#1086#1087#1083#1072#1090#1080#1090#1100
      OnExecute = actRasxodNalMakeExecute
    end
    object actNaklr: TAction
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1088#1072#1089#1093#1086#1076#1085#1091#1102' '#1085#1072#1082#1083#1072#1076#1085#1091#1102
      OnExecute = actNaklrExecute
    end
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
      'b2_name,'#13#10'  (select name from objects o where o.oid=r.sub5) as s' +
      'ub5_name,'#13#10'  r.sub1, r.sub2,r.sub5,'#13#10'  (select fullname from obj' +
      'ects o where o.oid=r.sub1) as IZGFULLNAME,'#13#10'  (select fullname f' +
      'rom objects o where o.oid=r.sub2) as ZAKFULLNAME,'#13#10'  sum(r.debet' +
      'before)-minnum(sum(r.debetbefore),sum(kreditbefore)) as debetbef' +
      'ore,'#13#10'  sum(r.kreditbefore)-minnum(sum(r.debetbefore),sum(kredit' +
      'before)) as kreditbefore,'#13#10'  sum(debet) as debet,'#13#10'  sum(kredit)' +
      ' as kredit,'#13#10'  sum(r.debetafter)-minnum(sum(r.debetafter),sum(kr' +
      'editafter)) as debetafter,'#13#10'  sum(r.kreditafter)-minnum(sum(r.de' +
      'betafter),sum(kreditafter)) as kreditafter,'#13#10'  sum(r.DEBETAFTERI' +
      'NCURRENCY)-minnum(sum(r.DEBETAFTERINCURRENCY),sum(KREDITAFTERINC' +
      'URRENCY)) as DEBETAFTERINCURRENCY,'#13#10'  sum(r.KREDITAFTERINCURRENC' +
      'Y)-minnum(sum(r.DEBETAFTERINCURRENCY),sum(KREDITAFTERINCURRENCY)' +
      ') as KREDITAFTERINCURRENCY'#13#10'from REP_OBOROTKA2_ROLES_PC(:id_sche' +
      't,:dat_from,:dat_to,'#13#10'  :sub1_in,:sub2_in,:sub3_in, :sub4_in, :s' +
      'ub5_in,'#13#10'  :sub6_in,:sub7_in,:sub8_in, :sub9_in,   :sub10_in,'#39'PO' +
      'WER_USER;MANAGER'#39','#13#10'  :id_currency_to,5) r'#13#10'group by sub1,sub2,s' +
      'ub5'#13#10'order by 1,2'#13#10#13#10
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
        DataType = ftInteger
        Name = 'sub1_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'sub2_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'sub3_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'sub4_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'sub5_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'sub6_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'sub7_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'sub8_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'sub9_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'sub10_in'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'id_currency_to'
        ParamType = ptInput
        Value = Null
      end>
    ProviderName = 'dspDolgBux2'
    Left = 264
    Top = 192
  end
end
