object frmRepBalans: TfrmRepBalans
  Left = 223
  Top = 213
  Width = 559
  Height = 450
  Caption = #1041#1072#1083#1072#1085#1089
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
      'select'#13#10'  b.OID,'#13#10'  b.NAME,'#13#10'  b.FULLNAME,'#13#10'  b.DELMARKED,'#13#10'  b.' +
      'ID_CURRENCY,'#13#10'  b.SQL_TEXT,'#13#10'  b.IS_MINUS,'#13#10'  cast (null as nume' +
      'ric(15,4)) as sum_orig,'#13#10'  (select name from objects o where o.o' +
      'id=b.id_currency) as currency,'#13#10'  cast (1 as numeric(15,4)) as k' +
      'urs,'#13#10'  cast (0 as numeric(15,4)) as kurs_indirect,'#13#10'  cast (nul' +
      'l as numeric(15,4)) as sum_final'#13#10#13#10'from balans_vw b'#13#10'where b.de' +
      'lmarked=0'#13#10'order by b.name'
    MaxBlobSize = -1
    Params = <>
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
  object sdsRowBalans: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 220
    Top = 128
  end
  object dspRowBalans: TDataSetProvider
    DataSet = sdsRowBalans
    Options = [poAllowCommandText]
    Left = 220
    Top = 160
  end
  object cdsRowBalans: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRowBalans'
    Left = 220
    Top = 192
  end
  object dsRowBalans: TDataSource
    DataSet = cdsRowBalans
    Left = 220
    Top = 224
  end
end
