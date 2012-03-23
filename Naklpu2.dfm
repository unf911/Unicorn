inherited frmNaklpu2: TfrmNaklpu2
  Left = 720
  Top = 143
  Caption = #1055#1088#1080#1093#1086#1076#1085#1099#1077' '#1085#1072' '#1091#1089#1083#1091#1075#1080
  PixelsPerInch = 96
  TextHeight = 13
  inherited ActionList1: TActionList
    inherited actCreateNaklru: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1087#1088#1080#1093#1086#1076#1085#1091#1102' '#1085#1072' '#1091#1089#1083#1091#1075#1080
    end
  end
  inherited sdsNaklo: TSQLDataSet
    CommandText = 
      'select '#13#10'  om.id_nakl,om.id,om.kurs,'#13#10'  om.nds,'#13#10'  om.dat,'#13#10'  om' +
      '.id_izg,om.id_zak, om.id_manager,'#13#10'  om.nalog_nds,'#13#10'  om.posted,' +
      #13#10'  om.blocked,'#13#10'  om.delmarked,'#13#10'  om.id_currency,'#13#10'  om.id_sta' +
      'tya,'#13#10'  om.id_project,'#13#10'  om.id_xoz_oper,'#13#10'  om.parent_id_nakl,'#13 +
      #10'  om.comment,'#13#10'  (select id from naklo om2 where om2.id_nakl=om' +
      '.parent_id_nakl) as parent_id,'#13#10'  (cast (null as integer)) as id' +
      '_dogovor'#13#10'from '#13#10'  NAKLPU_VW om'#13#10'order by'#13#10'  om.dat,om.id_nakl'
  end
  inherited PropStorageEh1: TPropStorageEh
    Section = 'TfrmNaklpu'
  end
  inherited sdsDelmark: TSQLDataSet
    Params = <
      item
        DataType = ftInteger
        Name = 'OID'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'CLASSID'
        ParamType = ptInput
      end>
  end
  inherited sdsNaklot: TSQLDataSet
    CommandText = 
      'select '#13#10'  id_nakl,'#13#10'  id_nakld,'#13#10'  id_pos,  '#13#10'  kodcn,'#13#10'  id_to' +
      'var,'#13#10'  skidka,'#13#10'  cena,'#13#10'  kolotp'#13#10'from '#13#10'  NAKLPU_DET_VW ot'#13#10'w' +
      'here'#13#10'  ot.id_nakl=:id_nakl'
  end
  inherited frNaklr2: TfrxReport
    Datasets = <>
    Variables = <>
    Style = <>
  end
  inherited frNaklr: TfrxReport
    Datasets = <
      item
        DataSet = frdbNaklot
        DataSetName = 'frdbNaklot'
      end>
    Variables = <
      item
        Name = ' AllVars'
        Value = Null
      end
      item
        Name = 'NDSTEXT'
        Value = Null
      end
      item
        Name = 'VSEGO'
        Value = Null
      end>
    Style = <>
  end
  inherited sdsNaklrPost: TSQLDataSet
    CommandText = 'NAKLPU_POST_PC'
  end
  inherited sdsNaklrUnpost: TSQLDataSet
    CommandText = 'NAKLPU_UNPOST_PC'
  end
  inherited sdsXozoper: TSQLDataSet
    CommandText = 
      'select *'#13#10'from spr_xozoper_vw s'#13#10'where s.delmarked=0'#13#10'  and s.ti' +
      'p_document=(select oid'#13#10'    from get_oid_objects_pc('#39#1055#1056#1048#1061#1054#1044#1053#1067#1045' '#1053 +
      #1040#1050#1051#1040#1044#1053#1067#1045' '#1053#1040' '#1059#1057#1051#1059#1043#1048#39',-100))'#13#10'order by s.name'#13#10
  end
end
