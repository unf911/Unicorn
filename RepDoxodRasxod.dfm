object frmRepDoxodRasxod: TfrmRepDoxodRasxod
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
      'select'#13#10'    (select o.fullname from objects o where o.oid=r.sub1' +
      ') as sub1_name,'#13#10'    (select o2.fullname from objects o2 where o' +
      '2.oid=r.sub2) as sub2_name,'#13#10'    case max(kurs_indirect)'#13#10'    wh' +
      'en 1'#13#10'    then'#13#10'        dzero('#13#10'            (z(sum(r.debet)) -z(' +
      'sum(r.kredit))),'#13#10'            z(sum(r.sumincurrency)),'#13#10'        ' +
      '    0)'#13#10'    else'#13#10'        dzero ('#13#10'            z(sum(r.sumincurr' +
      'ency)),'#13#10'            (z(sum(r.debet)) -z(sum(r.kredit))),       ' +
      '     '#13#10'            0)'#13#10'    end as kurs,'#13#10'    max(kurs_indirect) ' +
      'as kurs_indirect,'#13#10#13#10'    sum(r.debet) as debet,sum(r.kredit) as ' +
      'kredit,'#13#10'    z(sum(r.sumincurrency)) as sumincurrency,'#13#10'    sub1' +
      ','#13#10'    sub2'#13#10'from rep_doxod_rasxod_pc('#13#10'    :dat_from,:dat_to,:i' +
      'd_currency_to,'#13#10'    :id_nakl_in,:sub1_in,:sub2_in,:sub3_in) r'#13#10'g' +
      'roup by sub1, sub2'
    MaxBlobSize = -1
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
      end
      item
        DataType = ftUnknown
        Name = 'id_currency_to'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_nakl_in'
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
        Name = 'id_currency_to'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_nakl_in'
        ParamType = ptInput
        Value = Null
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
      end>
    ProviderName = 'dspDolgBux2'
    Left = 264
    Top = 192
  end
end
