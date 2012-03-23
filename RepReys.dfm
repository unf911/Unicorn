object frmRepReys: TfrmRepReys
  Left = 223
  Top = 213
  Width = 559
  Height = 450
  Caption = #1054#1090#1095#1105#1090' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1085#1099#1081
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
    Images = dmdEx.ImageList1
    Left = 64
    Top = 28
    object actDetailReys: TAction
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1088#1077#1081#1089#1086#1074
      ImageIndex = 5
      OnExecute = actDetailReysExecute
    end
  end
  object sdsDolgBux2: TSQLDataSet
    CommandText = 
      'select'#13#10'  s.dat_reys  , s.nomer_avto, '#13#10'  (select name from obje' +
      'cts o where o.oid=s.id_perevozchik) as perevozchik,'#13#10'  s.punkt_z' +
      'agruzki,'#13#10'  max(case when (v.is_last=1) then v.punkt_vygruzki el' +
      'se  null end) as punkt_vygruzki,'#13#10'  z(s.cena_reysa) as cena_reys' +
      'a,'#13#10'  z(sum(om.nds)) as sum_naklr,  '#13#10'  dzero(z(s.cena_reysa)*10' +
      '0, z(sum(om.nds)), (case when (z(s.cena_reysa)=0) then 0 else 10' +
      '00 end)) as percent,'#13#10'  s.fio_voditelya,   s.nomer_pritsepa,s.po' +
      'kupatel_platit, s.comment, s.delmarked, s.id_reys'#13#10'from spr_reys' +
      '_vw s'#13#10'inner join spr_vygruzka_vw v on s.id_reys=v.id_reys'#13#10'left' +
      ' join naklo om on v.id_vygruzka=om.id_vygruzka and om.posted=1 '#13 +
      #10'and om.tip in ('#13#10'3047/*'#1056#1040#1057#1061#1054#1044#1053#1067#1045' '#1053#1040#1050#1051#1040#1044#1053#1067#1045'*/, '#13#10'-87 /*'#1041#1059#1061#1043#1040#1051#1058#1045#1056 +
      #1057#1050#1054#1045' '#1055#1045#1056#1045#1052#1045#1065#1045#1053#1048#1045'*/,'#13#10'8896 /*'#1055#1056#1048#1061#1054#1044#1053#1067#1045' '#1053#1040#1050#1051#1040#1044#1053#1067#1045'*/,'#13#10'10957 /*'#1055#1056#1048#1061 +
      #1054#1044' '#1058#1040#1056#1067'*/)'#13#10'where s.delmarked=0 and s.dat_reys between :dat_from' +
      ' and :dat_to'#13#10'group by s.id_reys,s.id_perevozchik,s.fio_voditely' +
      'a,s.dat_reys,s.punkt_zagruzki,s.nomer_avto,s.nomer_pritsepa,s.po' +
      'kupatel_platit,s.cena_reysa,s.delmarked, s.comment'#13#10'order by s.d' +
      'at_reys, s.id_reys'
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
        Value = 38169d
      end
      item
        DataType = ftDate
        Name = 'dat_to'
        ParamType = ptInput
        Value = 38169d
      end>
    ProviderName = 'dspDolgBux2'
    Left = 264
    Top = 192
    object cdsDolgBux2DAT_REYS: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 10
      FieldName = 'DAT_REYS'
    end
    object cdsDolgBux2NOMER_AVTO: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1072#1074#1090#1086
      DisplayWidth = 10
      FieldName = 'NOMER_AVTO'
      Size = 30
    end
    object cdsDolgBux2PEREVOZCHIK: TStringField
      DisplayLabel = #1055#1077#1088#1077#1074#1086#1079#1095#1080#1082
      DisplayWidth = 15
      FieldName = 'PEREVOZCHIK'
      Size = 50
    end
    object cdsDolgBux2PUNKT_ZAGRUZKI: TStringField
      DisplayLabel = #1055#1091#1085#1082#1090' '#1079#1072#1075#1088#1091#1079#1082#1080
      DisplayWidth = 15
      FieldName = 'PUNKT_ZAGRUZKI'
      Size = 50
    end
    object cdsDolgBux2PUNKT_VYGRUZKI: TStringField
      DisplayLabel = #1055#1091#1085#1082#1090' '#1074#1099#1075#1088#1091#1079#1082#1080
      DisplayWidth = 15
      FieldName = 'PUNKT_VYGRUZKI'
      Size = 50
    end
    object cdsDolgBux2CENA_REYSA: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1088#1077#1081#1089#1072
      FieldName = 'CENA_REYSA'
      DisplayFormat = '0.00'
    end
    object cdsDolgBux2SUM_NAKLR: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1085#1072#1082#1083#1072#1076#1085#1099#1093
      FieldName = 'SUM_NAKLR'
      DisplayFormat = '0.00'
    end
    object cdsDolgBux2PERCENT: TFloatField
      DisplayLabel = '% '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1085#1099#1093' '#1088#1072#1089#1093#1086#1076#1086#1074
      FieldName = 'PERCENT'
      DisplayFormat = '0.00'
    end
    object cdsDolgBux2FIO_VODITELYA: TStringField
      DisplayLabel = #1060#1048#1054' '#1074#1086#1076#1080#1090#1077#1083#1103
      DisplayWidth = 15
      FieldName = 'FIO_VODITELYA'
      Size = 50
    end
    object cdsDolgBux2NOMER_PRITSEPA: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1087#1088#1080#1094#1077#1087#1072
      DisplayWidth = 10
      FieldName = 'NOMER_PRITSEPA'
      Size = 50
    end
    object cdsDolgBux2POKUPATEL_PLATIT: TSmallintField
      DisplayLabel = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100' '#1087#1083#1072#1090#1080#1090
      DisplayWidth = 2
      FieldName = 'POKUPATEL_PLATIT'
    end
    object cdsDolgBux2COMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'COMMENT'
      Size = 50
    end
    object cdsDolgBux2ID_REYS: TIntegerField
      FieldName = 'ID_REYS'
      Required = True
      Visible = False
    end
    object cdsDolgBux2DELMARKED: TSmallintField
      FieldName = 'DELMARKED'
      Visible = False
    end
  end
end
