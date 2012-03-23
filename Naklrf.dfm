object frmNaklrf: TfrmNaklrf
  Left = 62
  Top = 155
  Width = 665
  Height = 396
  Caption = #1056#1072#1089#1093#1086#1076#1085#1099#1077' '#1085#1072' '#1091#1089#1083#1091#1075#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dspNaklf: TDataSetProvider
    DataSet = sdsNaklf
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poPropogateChanges, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspNaklfBeforeUpdateRecord
    OnGetTableName = dspNaklfGetTableName
    Left = 48
    Top = 136
  end
  object sdsNaklf: TSQLDataSet
    CommandText = 
      'select '#13#10'  om.id_nakl,om.id,om.kurs,'#13#10'  om.nds,'#13#10'  om.dat,'#13#10'  om' +
      '.id_izg,om.id_zak, om.id_manager,'#13#10'  om.nalog_nds,'#13#10'  om.posted,' +
      #13#10'  om.blocked,'#13#10'  om.delmarked,'#13#10'  om.id_currency,'#13#10'  om.id_sta' +
      'tya,'#13#10'  om.id_project,'#13#10'  om.id_xoz_oper,'#13#10'  om.parent_id_nakl,'#13 +
      #10'  om.comment,'#13#10'  (select id from naklo om2 where om2.id_nakl=om' +
      '.parent_id_nakl) as parent_id,'#13#10'  om.id_dogovor'#13#10'from '#13#10'  NAKLRF' +
      '_VW om'#13#10'order by'#13#10'  om.dat,om.id_nakl'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 48
    Top = 104
    object sdsNaklfID: TStringField
      FieldName = 'ID'
    end
    object sdsNaklfNALOG_NDS: TFMTBCDField
      FieldName = 'NALOG_NDS'
      Required = True
      Precision = 15
      Size = 2
    end
    object sdsNaklfDAT: TSQLTimeStampField
      FieldName = 'DAT'
      Required = True
    end
    object sdsNaklfPOSTED: TSmallintField
      FieldName = 'POSTED'
      ProviderFlags = []
      Required = True
    end
    object sdsNaklfID_CURRENCY: TSmallintField
      FieldName = 'ID_CURRENCY'
      Required = True
    end
    object sdsNaklfID_IZG: TIntegerField
      FieldName = 'ID_IZG'
      Required = True
    end
    object sdsNaklfID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
      Required = True
    end
    object sdsNaklfID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
      Required = True
    end
    object sdsNaklfKURS: TFloatField
      FieldName = 'KURS'
      Required = True
    end
    object sdsNaklfNDS: TFMTBCDField
      FieldName = 'NDS'
      Required = True
      Precision = 15
      Size = 8
    end
    object sdsNaklfDELMARKED: TSmallintField
      FieldName = 'DELMARKED'
      Required = True
    end
    object sdsNaklfBLOCKED: TSmallintField
      FieldName = 'BLOCKED'
      Required = True
    end
    object sdsNaklfID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsNaklfID_STATYA: TIntegerField
      FieldName = 'ID_STATYA'
    end
    object sdsNaklfID_PROJECT: TIntegerField
      FieldName = 'ID_PROJECT'
    end
    object sdsNaklfID_XOZ_OPER: TIntegerField
      FieldName = 'ID_XOZ_OPER'
    end
    object sdsNaklfPARENT_ID_NAKL: TIntegerField
      FieldName = 'PARENT_ID_NAKL'
    end
    object sdsNaklfPARENT_ID: TStringField
      FieldName = 'PARENT_ID'
      ProviderFlags = []
    end
    object sdsNaklfCOMMENT: TStringField
      FieldName = 'COMMENT'
      Size = 50
    end
    object sdsNaklfID_DOGOVOR: TIntegerField
      FieldName = 'ID_DOGOVOR'
    end
  end
  object sdsNaklrfPost: TSQLDataSet
    CommandText = 'NAKLRF_POST_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_NAKL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_SCHET'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 80
    Top = 104
  end
  object sdsNaklrfUnpost: TSQLDataSet
    CommandText = 'NAKLRF_UNPOST_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_NAKL'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 112
    Top = 104
  end
end
