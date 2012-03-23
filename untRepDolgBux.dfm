object frmRepDolgBux: TfrmRepDolgBux
  Left = 87
  Top = 137
  BorderStyle = bsDialog
  Caption = #1044#1086#1083#1075#1080' ('#1073#1091#1093#1075#1072#1083#1090#1077#1088#1080#1103')'
  ClientHeight = 334
  ClientWidth = 660
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    660
    334)
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 7
    Top = 0
    Width = 650
    Height = 33
    Anchors = [akLeft, akTop, akRight]
    Caption = #1044#1077#1081#1089#1090#1074#1080#1103
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 296
      Top = 12
      Width = 73
      Height = 17
      Action = actShowDet
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 224
      Top = 12
      Width = 65
      Height = 17
      Action = actPreview
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      TabOrder = 1
    end
    object BitBtn3: TBitBtn
      Left = 166
      Top = 12
      Width = 51
      Height = 17
      Action = actPrint
      Caption = #1055#1077#1095#1072#1090#1100
      TabOrder = 2
    end
    object BitBtn4: TBitBtn
      Left = 14
      Top = 12
      Width = 75
      Height = 17
      Action = actSettings
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      TabOrder = 3
    end
    object BitBtn5: TBitBtn
      Left = 96
      Top = 12
      Width = 65
      Height = 17
      Action = actRefresh
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 4
    end
    object cbxNotNull: TCheckBox
      Left = 456
      Top = 12
      Width = 113
      Height = 17
      Action = actNotNull
      TabOrder = 5
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 8
    Top = 40
    Width = 649
    Height = 286
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsDolgBux
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object frdDolgBux: TfrxDBDataset
    UserName = 'frdDolgBux'
    CloseDataSource = False
    DataSource = dsDolgBux
    Left = 104
    Top = 200
  end
  object qurDolgBux: TQuery
    DatabaseName = 'dbnInter'
    SessionName = 'snName'
    SQL.Strings = (
      'select'
      '  izg,zak,'
      '(select'
      '  z(Round(sum(n.nds),2))'
      '  from'
      '    naklr n'
      '  where'
      '    n.fix='#39'*'#39' and'
      '    n.izg=m.izg and'
      '    n.zak=m.zak and'
      '    n.dat<:datefrom'
      ')-'
      '( select'
      '    z(Round(sum(t.transh),2))'
      '  from'
      '    naklr n2 inner join oplnakl t on n2.nakl=t.nakl_id'
      '  where'
      '    n2.fix="*" and'
      '    n2.izg=m.izg and'
      '    n2.zak=m.zak and'
      '    t.opl_data<:datefrom'
      ') as dolgbefore,'
      ''
      '('
      'select'
      '  z(Round(sum(o2.opl),2))'
      'from'
      '  oplaty o2'
      'where'
      '  o2.izg=m.izg and'
      '  o2.zak=m.zak and'
      '  o2.dat<:datefrom'
      ')'
      '-'
      '('
      'select'
      '  z(Round(sum(t.transh),2))'
      'from'
      '  oplaty o left join oplnakl t'
      '  on o.idi=t.opl_id'
      'where'
      '  o.izg=m.izg and'
      '  o.zak=m.zak and'
      '  o.dat<:datefrom  and'
      '  (t.opl_data<:datefrom or t.opl_data is null)'
      ')'
      ''
      'as predbefore,'
      ''
      '(select'
      '  z(Round(sum(n2.nds),2))'
      'from'
      '  naklr n2'
      'where'
      '  n2.fix='#39'*'#39' and'
      '  n2.izg=m.izg and'
      '  n2.zak=m.zak and'
      '  n2.dat >= :datefrom and'
      '  n2.dat <=:dateto'
      ') as otg,'
      ''
      '('
      'select'
      '  z(Round(sum(o2.opl),2))'
      'from'
      '  oplaty o2'
      'where'
      '  o2.izg=m.izg and'
      '  o2.zak=m.zak and'
      '  o2.dat>=:datefrom and'
      '  o2.dat<=:dateto'
      ') as opl,'
      ''
      '(select'
      '  z(Round(sum(n.nds),2))'
      '  from'
      '    naklr n'
      '  where'
      '    n.fix='#39'*'#39' and'
      '    n.izg=m.izg and'
      '    n.zak=m.zak and'
      '    n.dat<=:dateto'
      ')-'
      '( select'
      '    z(Round(sum(t.transh),2))'
      '  from'
      '    naklr n2 inner join oplnakl t on n2.nakl=t.nakl_id'
      '  where'
      '    n2.fix="*" and'
      '    n2.izg=m.izg and'
      '    n2.zak=m.zak and'
      '    t.opl_data<=:dateto'
      ') as dolgafter,'
      ''
      '('
      'select'
      '  z(Round(sum(o2.opl),2))'
      'from'
      '  oplaty o2'
      'where'
      '  o2.izg=m.izg and'
      '  o2.zak=m.zak and'
      '  o2.dat<=:dateto'
      ')'
      '-'
      '('
      'select'
      '  z(Round(sum(t.transh),2))'
      'from'
      '  oplaty o left join oplnakl t'
      '  on o.idi=t.opl_id'
      'where'
      '  o.izg=m.izg and'
      '  o.zak=m.zak and'
      '  o.dat<=:dateto  and'
      '  (t.opl_data<=:dateto or t.opl_data is null)'
      ')'
      'as predafter'
      ''
      'from'
      '  tmp_dolglist m'
      'group by '
      '  m.izg,m.zak'
      'order by'
      '  m.izg,m.zak'
      '')
    Left = 136
    Top = 136
    ParamData = <
      item
        DataType = ftDate
        Name = 'datefrom'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'datefrom'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'datefrom'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'datefrom'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'datefrom'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'datefrom'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'dateto'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'datefrom'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'dateto'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'dateto'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'dateto'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'dateto'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'dateto'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'dateto'
        ParamType = ptUnknown
      end>
    object qurDolgBuxIZG: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      FieldName = 'IZG'
      Size = 50
    end
    object qurDolgBuxZAK: TStringField
      DisplayLabel = #1047#1072#1082#1072#1079#1095#1080#1082
      FieldName = 'ZAK'
      Size = 50
    end
    object qurDolgBuxDOLGBEFORE: TFloatField
      DisplayLabel = #1044#1077#1073#1077#1090' '#1085#1072' '#1085#1072#1095#1072#1083#1086
      FieldName = 'DOLGBEFORE'
      DisplayFormat = '0.00'
    end
    object qurDolgBuxPREDBEFORE: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090' '#1085#1072' '#1085#1072#1095#1072#1083#1086
      FieldName = 'PREDBEFORE'
      DisplayFormat = '0.00'
    end
    object qurDolgBuxOTG: TFloatField
      DisplayLabel = #1044#1077#1073#1077#1090
      FieldName = 'OTG'
      DisplayFormat = '0.00'
    end
    object qurDolgBuxOPL: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090
      FieldName = 'OPL'
      DisplayFormat = '0.00'
    end
    object qurDolgBuxDOLGAFTER: TFloatField
      DisplayLabel = #1044#1077#1073#1077#1090' '#1085#1072' '#1082#1086#1085#1077#1094
      FieldName = 'DOLGAFTER'
      DisplayFormat = '0.00'
    end
    object qurDolgBuxPREDAFTER: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090' '#1085#1072' '#1082#1086#1094#1077#1094
      FieldName = 'PREDAFTER'
      DisplayFormat = '0.00'
    end
    object qurDolgBuxNum: TStringField
      FieldKind = fkCalculated
      FieldName = 'Num'
      Calculated = True
    end
  end
  object dsDolgBux: TDataSource
    DataSet = cdsDolgBux
    Left = 136
    Top = 168
  end
  object qeDolgBux: TQueryExtender
    Query = qurDolgBux
    DefSql = 
      'select'#13#10'  izg,zak,'#13#10'(select'#13#10'  z(Round(sum(n.nds),2))'#13#10'  from'#13#10' ' +
      '   naklr n'#13#10'  where'#13#10'    n.fix='#39'*'#39' and'#13#10'    n.izg=m.izg and'#13#10'   ' +
      ' n.zak=m.zak and'#13#10'    n.dat<:datefrom'#13#10')-'#13#10'( select'#13#10'    z(Round' +
      '(sum(t.transh),2))'#13#10'  from'#13#10'    naklr n2 inner join oplnakl t on' +
      ' n2.nakl=t.nakl_id'#13#10'  where'#13#10'    n2.fix="*" and'#13#10'    n2.izg=m.iz' +
      'g and'#13#10'    n2.zak=m.zak and'#13#10'    t.opl_data<:datefrom'#13#10') as dolg' +
      'before,'#13#10#13#10'('#13#10'select'#13#10'  z(Round(sum(o2.opl),2))'#13#10'from'#13#10'  oplaty ' +
      'o2'#13#10'where'#13#10'  o2.izg=m.izg and'#13#10'  o2.zak=m.zak and'#13#10'  o2.dat<:dat' +
      'efrom'#13#10')'#13#10'-'#13#10'('#13#10'select'#13#10'  z(Round(sum(t.transh),2))'#13#10'from'#13#10'  opl' +
      'aty o left join oplnakl t'#13#10'  on o.idi=t.opl_id'#13#10'where'#13#10'  o.izg=m' +
      '.izg and'#13#10'  o.zak=m.zak and'#13#10'  o.dat<:datefrom  and'#13#10'  (t.opl_da' +
      'ta<:datefrom or t.opl_data is null)'#13#10')'#13#10#13#10'as predbefore,'#13#10#13#10'(sel' +
      'ect'#13#10'  z(Round(sum(n2.nds),2))'#13#10'from'#13#10'  naklr n2'#13#10'where'#13#10'  n2.fi' +
      'x='#39'*'#39' and'#13#10'  n2.izg=m.izg and'#13#10'  n2.zak=m.zak and'#13#10'  n2.dat >= :' +
      'datefrom and'#13#10'  n2.dat <=:dateto'#13#10') as otg,'#13#10#13#10'('#13#10'select'#13#10'  z(Ro' +
      'und(sum(o2.opl),2))'#13#10'from'#13#10'  oplaty o2'#13#10'where'#13#10'  o2.izg=m.izg an' +
      'd'#13#10'  o2.zak=m.zak and'#13#10'  o2.dat>=:datefrom and'#13#10'  o2.dat<=:datet' +
      'o'#13#10') as opl,'#13#10#13#10'(select'#13#10'  z(Round(sum(n.nds),2))'#13#10'  from'#13#10'    n' +
      'aklr n'#13#10'  where'#13#10'    n.fix='#39'*'#39' and'#13#10'    n.izg=m.izg and'#13#10'    n.z' +
      'ak=m.zak and'#13#10'    n.dat<=:dateto'#13#10')-'#13#10'( select'#13#10'    z(Round(sum(' +
      't.transh),2))'#13#10'  from'#13#10'    naklr n2 inner join oplnakl t on n2.n' +
      'akl=t.nakl_id'#13#10'  where'#13#10'    n2.fix="*" and'#13#10'    n2.izg=m.izg and' +
      #13#10'    n2.zak=m.zak and'#13#10'    t.opl_data<=:dateto'#13#10') as dolgafter,' +
      #13#10#13#10'('#13#10'select'#13#10'  z(Round(sum(o2.opl),2))'#13#10'from'#13#10'  oplaty o2'#13#10'whe' +
      're'#13#10'  o2.izg=m.izg and'#13#10'  o2.zak=m.zak and'#13#10'  o2.dat<=:dateto'#13#10')' +
      #13#10'-'#13#10'('#13#10'select'#13#10'  z(Round(sum(t.transh),2))'#13#10'from'#13#10'  oplaty o le' +
      'ft join oplnakl t'#13#10'  on o.idi=t.opl_id'#13#10'where'#13#10'  o.izg=m.izg and' +
      #13#10'  o.zak=m.zak and'#13#10'  o.dat<=:dateto  and'#13#10'  (t.opl_data<=:date' +
      'to or t.opl_data is null)'#13#10')'#13#10'as predafter'#13#10#13#10'from'#13#10'  tmp_dolgli' +
      'st m'#13#10'group by '#13#10'  m.izg,m.zak'#13#10'order by'#13#10'  m.izg,m.zak'#13#10#13#10
    KeyField = 'zak'
    Left = 136
    Top = 200
  end
  object ActionList1: TActionList
    Left = 104
    Top = 136
    object actPreview: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      ShortCut = 16471
      OnExecute = actPreviewExecute
    end
    object actPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      ShortCut = 123
      OnExecute = actPrintExecute
    end
    object actCall: TAction
      Caption = 'actCall'
    end
    object actSettings: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      OnExecute = actSettingsExecute
    end
    object actShowDet: TAction
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      ShortCut = 120
      OnExecute = actShowDetExecute
    end
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnExecute = actRefreshExecute
    end
    object actNotNull: TAction
      Caption = #1058#1086#1083#1100#1082#1086' '#1072#1082#1090#1080#1074#1085#1099#1077
      OnExecute = actNotNullExecute
    end
    object actRecalc: TAction
      Caption = #1048#1090#1086#1075#1086
    end
  end
  object sdsDolgBux: TSQLDataSet
    CommandText = 
      'select'#13#10'  r.sub1,r.sub2,'#13#10'  (select name from objects o where o.' +
      'oid=r.sub1) as izg,'#13#10'  (select name from objects o2 where o2.oid' +
      '=r.sub2) as zak,'#13#10'  r.debetbefore,r.kreditbefore,'#13#10'  r.debet,r.k' +
      'redit,'#13#10'  r.debetafter,r.kreditafter'#13#10'from'#13#10'  rep_dolgbux_pc('#13#10' ' +
      '   :sub1_in,:sub2_in,:sub3_in,'#13#10'    :dat_from,:dat_to) r;'
    MaxBlobSize = -1
    Params = <
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
        DataType = ftDate
        Name = 'dat_from'
        ParamType = ptInput
        Value = '01.01.03'
      end
      item
        DataType = ftDate
        Name = 'dat_to'
        ParamType = ptInput
        Value = '01.01.04'
      end>
    SQLConnection = dmdEx.scUchet
    Left = 264
    Top = 128
  end
  object dspDolgBux: TDataSetProvider
    DataSet = sdsDolgBux
    Left = 264
    Top = 160
  end
  object cdsDolgBux: TClientDataSet
    Aggregates = <>
    Params = <
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
        DataType = ftDate
        Name = 'dat_from'
        ParamType = ptInput
        Value = '01.01.03'
      end
      item
        DataType = ftDate
        Name = 'dat_to'
        ParamType = ptInput
        Value = '01.01.04'
      end>
    ProviderName = 'dspDolgBux'
    Left = 264
    Top = 192
    object cdsDolgBuxSUB1: TIntegerField
      DisplayWidth = 5
      FieldName = 'SUB1'
    end
    object cdsDolgBuxSUB2: TIntegerField
      DisplayWidth = 5
      FieldName = 'SUB2'
    end
    object cdsDolgBuxIZG: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      DisplayWidth = 10
      FieldName = 'IZG'
      Size = 50
    end
    object cdsDolgBuxZAK: TStringField
      DisplayLabel = #1047#1072#1082#1072#1079#1095#1080#1082
      DisplayWidth = 20
      FieldName = 'ZAK'
      Size = 50
    end
    object cdsDolgBuxDEBETBEFORE: TFloatField
      DisplayLabel = #1044#1077#1073#1077#1090' '#1085#1072' '#1085#1072#1095#1072#1083#1086
      FieldName = 'DEBETBEFORE'
      DisplayFormat = '0.00'
    end
    object cdsDolgBuxKREDITBEFORE: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090' '#1085#1072' '#1085#1072#1095#1072#1083#1086
      FieldName = 'KREDITBEFORE'
      DisplayFormat = '0.00'
    end
    object cdsDolgBuxDEBET: TFloatField
      DisplayLabel = #1044#1077#1073#1077#1090
      FieldName = 'DEBET'
      DisplayFormat = '0.00'
    end
    object cdsDolgBuxKREDIT: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090
      FieldName = 'KREDIT'
      DisplayFormat = '0.00'
    end
    object cdsDolgBuxDEBETAFTER: TFloatField
      DisplayLabel = #1044#1077#1073#1077#1090' '#1085#1072' '#1082#1086#1085#1077#1094
      FieldName = 'DEBETAFTER'
      DisplayFormat = '0.00'
    end
    object cdsDolgBuxKREDITAFTER: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090' '#1085#1072' '#1082#1086#1085#1077#1094
      FieldName = 'KREDITAFTER'
      DisplayFormat = '0.00'
    end
  end
  object MainMenu1: TMainMenu
    Left = 104
    Top = 168
    object N1: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      GroupIndex = 10
      object N3: TMenuItem
        Action = actShowDet
      end
      object mnuRefresh: TMenuItem
        Action = actRefresh
      end
      object N2: TMenuItem
        Action = actSettings
      end
      object N6: TMenuItem
        Action = actPreview
      end
      object N5: TMenuItem
      end
    end
  end
end
