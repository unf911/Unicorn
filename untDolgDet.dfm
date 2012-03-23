object frmDolgDet: TfrmDolgDet
  Left = 0
  Top = 80
  BorderStyle = bsDialog
  Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103' '#1076#1086#1083#1075#1086#1074
  ClientHeight = 408
  ClientWidth = 632
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 753
    Height = 97
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1076#1077#1090#1072#1083#1080#1079#1072#1094#1080#1080
    TabOrder = 0
    object Label5: TLabel
      Left = 8
      Top = 16
      Width = 82
      Height = 13
      Caption = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072
    end
    object Label6: TLabel
      Left = 216
      Top = 16
      Width = 76
      Height = 13
      Caption = #1050#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072
    end
    object Label7: TLabel
      Left = 8
      Top = 48
      Width = 37
      Height = 13
      Caption = #1060#1080#1088#1084#1072
    end
    object Label8: TLabel
      Left = 160
      Top = 48
      Width = 36
      Height = 13
      Caption = #1050#1083#1080#1077#1085#1090
    end
    object Label9: TLabel
      Left = 384
      Top = 48
      Width = 53
      Height = 13
      Caption = #1052#1077#1085#1077#1076#1078#1077#1088
    end
    object medDateFrom: TDateTimePicker
      Left = 96
      Top = 16
      Width = 113
      Height = 21
      Date = 37495.636504641200000000
      Time = 37495.636504641200000000
      TabOrder = 0
    end
    object medDateTo: TDateTimePicker
      Left = 304
      Top = 16
      Width = 113
      Height = 21
      Date = 37495.636547986100000000
      Time = 37495.636547986100000000
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 448
      Top = 16
      Width = 121
      Height = 25
      Action = actRefresh
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 2
    end
    object dbeIZG: TEdit
      Left = 8
      Top = 64
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 3
      Text = 'dbeIZG'
    end
    object dbeZAK: TEdit
      Left = 160
      Top = 64
      Width = 177
      Height = 21
      ReadOnly = True
      TabOrder = 4
      Text = 'dbeZAK'
    end
    object dbeMANAG: TEdit
      Left = 384
      Top = 64
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 5
      Text = 'dbeMANAG'
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 104
    Width = 193
    Height = 297
    Caption = #1044#1086#1083#1075#1080
    TabOrder = 1
    object Label3: TLabel
      Left = 8
      Top = 256
      Width = 81
      Height = 33
      AutoSize = False
      Caption = #1044#1086#1083#1075' '#1085#1072' '#1082#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072
      WordWrap = True
    end
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 81
      Height = 33
      AutoSize = False
      Caption = #1044#1086#1083#1075' '#1085#1072' '#1085#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072
      WordWrap = True
    end
    object Label11: TLabel
      Left = 8
      Top = 224
      Width = 81
      Height = 33
      AutoSize = False
      Caption = #1057#1091#1084#1084#1072' '#1086#1090#1075#1088#1091#1079#1086#1082
      WordWrap = True
    end
    object dbeDolgAfter: TDBEdit
      Left = 104
      Top = 268
      Width = 81
      Height = 21
      DataField = 'DOLGAFTER'
      DataSource = dsItogo
      TabOrder = 0
    end
    object UnfDBGrid1: TDBGridEh
      Left = 8
      Top = 48
      Width = 177
      Height = 169
      DataSource = dtsNakl
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
      Columns = <
        item
          EditButtons = <>
          FieldName = 'DAT'
          Footers = <>
          Width = 28
        end
        item
          EditButtons = <>
          FieldName = 'ID'
          Footers = <>
          Width = 49
        end
        item
          EditButtons = <>
          FieldName = 'NDS'
          Footers = <>
          Width = 61
        end>
    end
    object dbeDolgBefore: TDBEdit
      Left = 104
      Top = 16
      Width = 81
      Height = 21
      DataField = 'DOLGBEFORE'
      DataSource = dsItogo
      TabOrder = 2
    end
    object DBEdit3: TDBEdit
      Left = 104
      Top = 228
      Width = 81
      Height = 21
      DataField = 'OTG'
      DataSource = dsItogo
      TabOrder = 3
    end
  end
  object GroupBox3: TGroupBox
    Left = 192
    Top = 104
    Width = 281
    Height = 297
    Caption = #1054#1087#1083#1072#1090#1099
    TabOrder = 2
    object Label10: TLabel
      Left = 24
      Top = 232
      Width = 81
      Height = 17
      AutoSize = False
      Caption = #1057#1091#1084#1084#1072' '#1086#1087#1083#1072#1090
      WordWrap = True
    end
    object UnfDBGrid2: TDBGridEh
      Left = 8
      Top = 48
      Width = 265
      Height = 169
      DataSource = dtsOpl
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'PRED'
          Footers = <>
          Width = 29
        end
        item
          EditButtons = <>
          FieldName = 'IDI'
          Footers = <>
          Width = 39
        end
        item
          EditButtons = <>
          FieldName = 'DAT'
          Footers = <>
          Width = 44
        end
        item
          EditButtons = <>
          FieldName = 'SUM_ALL'
          Footers = <>
          Width = 53
        end
        item
          EditButtons = <>
          FieldName = 'SUM_MY'
          Footers = <>
          Width = 57
        end>
    end
    object DBEdit1: TDBEdit
      Left = 192
      Top = 228
      Width = 81
      Height = 21
      DataField = 'OPL'
      DataSource = dsItogo
      TabOrder = 1
    end
  end
  object GroupBox4: TGroupBox
    Left = 472
    Top = 104
    Width = 280
    Height = 297
    Caption = #1055#1088#1077#1076#1086#1087#1083#1072#1090#1099
    TabOrder = 3
    object Label14: TLabel
      Left = 8
      Top = 224
      Width = 81
      Height = 33
      AutoSize = False
      Caption = #1057#1091#1084#1084#1072' '#1087#1088#1077#1076#1086#1087#1083#1072#1090
      WordWrap = True
    end
    object Label13: TLabel
      Left = 16
      Top = 16
      Width = 81
      Height = 33
      AutoSize = False
      Caption = #1055#1088#1077#1076#1086#1087#1083#1072#1090#1072' '#1085#1072' '#1085#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072
      WordWrap = True
    end
    object Label12: TLabel
      Left = 8
      Top = 256
      Width = 81
      Height = 33
      AutoSize = False
      Caption = #1055#1088#1077#1076#1086#1087#1083#1072#1090#1072' '#1085#1072' '#1082#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072
      WordWrap = True
    end
    object UnfDBGrid3: TDBGridEh
      Left = 8
      Top = 48
      Width = 265
      Height = 169
      DataSource = dsPred
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'PRED'
          Footers = <>
          Width = 35
        end
        item
          EditButtons = <>
          FieldName = 'IDI'
          Footers = <>
          Width = 33
        end
        item
          EditButtons = <>
          FieldName = 'DAT'
          Footers = <>
          Width = 48
        end
        item
          EditButtons = <>
          FieldName = 'SUM_ALL'
          Footers = <>
          Width = 53
        end
        item
          EditButtons = <>
          FieldName = 'SUM_MY'
          Footers = <>
          Width = 55
        end>
    end
    object DBEdit7: TDBEdit
      Left = 184
      Top = 228
      Width = 81
      Height = 21
      DataField = 'PRED'
      DataSource = dsItogo
      TabOrder = 1
    end
    object DBEdit6: TDBEdit
      Left = 184
      Top = 16
      Width = 89
      Height = 21
      DataField = 'PREDBEFORE'
      DataSource = dsItogo
      TabOrder = 2
    end
    object DBEdit5: TDBEdit
      Left = 184
      Top = 268
      Width = 81
      Height = 21
      DataField = 'PREDAFTER'
      DataSource = dsItogo
      TabOrder = 3
    end
  end
  object ActionList1: TActionList
    Left = 24
    Top = 224
    object actClose: TAction
      Caption = 'actClose'
      ShortCut = 27
      OnExecute = actCloseExecute
    end
    object actRecalc: TAction
      Caption = 'actRecalc'
      OnExecute = actRecalcExecute
    end
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ShortCut = 116
      OnExecute = actRefreshExecute
    end
  end
  object qurNakl: TQuery
    DatabaseName = 'dbnInter'
    SessionName = 'snName'
    SQL.Strings = (
      'select '
      '  dat,id,nds'
      'from'
      '  naklr n'
      'where'
      '  n.izg=:izg and'
      '  n.zak=:zak and'
      '  n.auther=:manager and'
      '  n.dat >= :datefrom and'
      '  n.dat <=:dateto and'
      '  n.fix='#39'*'#39' '
      'order by'
      '  dat,id')
    Left = 56
    Top = 224
    ParamData = <
      item
        DataType = ftString
        Name = 'izg'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'zak'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'manager'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'datefrom'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dateto'
        ParamType = ptInput
      end>
    object qurNaklDAT: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 9
      FieldName = 'DAT'
      DisplayFormat = 'dd.mm'
    end
    object qurNaklID: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1085#1072#1082#1083
      DisplayWidth = 10
      FieldName = 'ID'
    end
    object qurNaklNDS: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1085#1072#1082#1083
      DisplayWidth = 14
      FieldName = 'NDS'
      DisplayFormat = '0.00'
    end
  end
  object qurOpl: TQuery
    DatabaseName = 'dbnInter'
    SessionName = 'snName'
    SQL.Strings = (
      'select'
      '  cast('#39#1054#1087#1083'+'#39' as varchar(10)) as pred,'
      '  o.idi,o.dat,o.opl as sum_all,'
      '  Round(z(sum(t.transh)),2) as sum_my'
      'from'
      '  oplaty o inner join oplnakl t'
      '  on o.idi=t.opl_id'
      'where'
      '  o.izg=:izg and o.zak=:zak and'
      
        '  (t.id_manager=(select max(id) from posr where name=:manager)) ' +
        'and'
      '  t.opl_data>=:datefrom and'
      '  t.opl_data<=:dateto and'
      '  o.dat<:datefrom'
      'group by'
      '  o.idi,o.dat,o.opl'
      ''
      'union all'
      ''
      'select'
      ' cast(null as varchar(10)) as vid,'
      ' o.idi,o.dat,o.opl,z(round(sum(t.transh),2)) '
      'from'
      '  oplaty o left join oplnakl t'
      '  on o.idi=t.opl_id'
      'where'
      '  o.izg=:izg and o.zak=:zak and'
      '  (t.id_manager=(select max(id) from posr where name=:manager))'
      '  and'
      '  o.dat >= :datefrom and o.dat <= :dateto'
      '  and t.opl_data<=:dateto'
      'group by'
      '  o.idi,o.dat,o.opl'
      'order by'
      '  1,3,2')
    Left = 88
    Top = 224
    ParamData = <
      item
        DataType = ftString
        Name = 'izg'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'zak'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'manager'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'datefrom'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dateto'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'datefrom'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'izg'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'zak'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'manager'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'datefrom'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dateto'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dateto'
        ParamType = ptInput
      end>
    object qurOplPRED: TStringField
      DisplayLabel = #1054#1087#1083'/'#1087'.'#1086#1087#1083
      DisplayWidth = 9
      FieldName = 'PRED'
      Size = 10
    end
    object qurOplIDI: TIntegerField
      DisplayLabel = #8470#1087#1083#1072#1090
      DisplayWidth = 10
      FieldName = 'IDI'
    end
    object qurOplDAT: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1083#1072#1090
      DisplayWidth = 9
      FieldName = 'DAT'
      DisplayFormat = 'dd.mm'
    end
    object qurOplSUM_ALL: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1087#1083#1072#1090
      DisplayWidth = 14
      FieldName = 'SUM_ALL'
      DisplayFormat = '0.00'
    end
    object qurOplSUM_MY: TFloatField
      DisplayLabel = #1060#1072#1082#1090' '#1089#1091#1084#1084#1072
      DisplayWidth = 14
      FieldName = 'SUM_MY'
      DisplayFormat = '0.00'
    end
  end
  object dtsNakl: TDataSource
    DataSet = qurNakl
    Left = 56
    Top = 256
  end
  object dtsOpl: TDataSource
    DataSet = qurOpl
    Left = 88
    Top = 256
  end
  object qurItogo: TQuery
    DatabaseName = 'dbnInter'
    SessionName = 'snName'
    SQL.Strings = (
      'select'
      '  m.izg,m.zak,m.manager,'
      '(select'
      '  dolg'
      ' from'
      '   dolg_proc(m.izg,m.zak,m.manager,:datefrom)'
      ') as dolgbefore,'
      '(select'
      '  pred'
      ' from'
      '   pred_proc(m.izg,m.zak,m.id_manager,:datefrom)'
      ') as predbefore,'
      ''
      '(select'
      '  z(Round(sum(n2.nds),2))'
      'from'
      '  naklr n2'
      'where'
      '  n2.fix='#39'*'#39' and'
      '  n2.izg=m.izg and'
      '  n2.zak=m.zak and'
      '  n2.auther = m.manager and'
      '  n2.dat >= :datefrom and'
      '  n2.dat <=:dateto'
      ') as otg,'
      ''
      '(select'
      '  dolg'
      ' from'
      '   dolg_proc(m.izg,m.zak,m.manager,IncDate(:dateto, 1, 0, 0))'
      ') as dolgafter,'
      ''
      '(select'
      '  pred'
      ' from'
      '   pred_proc(m.izg,m.zak,m.id_manager,IncDate(:dateto, 1, 0, 0))'
      ') as predafter,'
      ''
      '('
      'select'
      '  Round(z(sum(t.transh)),2)'
      'from'
      '  oplaty o inner join oplnakl t'
      '  on o.idi=t.opl_id'
      'where'
      '  o.izg=m.izg and o.zak=m.zak and'
      '  (t.id_manager=m.id_manager) and'
      '  t.opl_data>=:datefrom and'
      '  t.opl_data<=:dateto'
      ''
      ') as opl'
      ','
      ''
      '(select'
      '  Round(z((-1)*sum(t.transh)),2)'
      'from'
      '  oplaty o inner join oplnakl t'
      '  on o.idi=t.opl_id'
      'where'
      '  o.izg=m.izg and o.zak=m.zak and'
      '  (o.id_manager=m.id_manager) and'
      
        '  t.opl_data >= :datefrom and t.opl_data <= :dateto and o.dat < ' +
        ':datefrom'
      ') '
      '+'
      '('
      'select'
      ' z(Round(sum(o.opl),2))'
      'from'
      '  oplaty o'
      'where'
      '  o.izg=m.izg and o.zak=m.zak and'
      '  (o.id_manager=m.id_manager) and'
      '  o.dat >= :datefrom and'
      '  o.dat <= :dateto'
      ')'
      '-'
      '('
      'select'
      ' z(Round(sum(t.transh),2))'
      'from'
      '  oplaty o left join oplnakl t'
      '  on o.idi=t.opl_id'
      'where'
      '  o.izg=m.izg and o.zak=m.zak and'
      '  o.id_manager=m.id_manager and'
      '  o.dat >= :datefrom and'
      '  o.dat <= :dateto and'
      '  t.opl_data <= :dateto'
      ')'
      'as pred'
      ''
      'from'
      '  tmp_dolglist m'
      'order by'
      '  m.izg,m.zak')
    Left = 256
    Top = 224
    ParamData = <
      item
        DataType = ftTime
        Name = 'datefrom'
        ParamType = ptInput
      end
      item
        DataType = ftTime
        Name = 'datefrom'
        ParamType = ptInput
      end
      item
        DataType = ftTime
        Name = 'datefrom'
        ParamType = ptInput
      end
      item
        DataType = ftTime
        Name = 'dateto'
        ParamType = ptInput
      end
      item
        DataType = ftTime
        Name = 'dateto'
        ParamType = ptInput
      end
      item
        DataType = ftTime
        Name = 'dateto'
        ParamType = ptInput
      end
      item
        DataType = ftTime
        Name = 'datefrom'
        ParamType = ptInput
      end
      item
        DataType = ftTime
        Name = 'dateto'
        ParamType = ptInput
      end
      item
        DataType = ftTime
        Name = 'datefrom'
        ParamType = ptInput
      end
      item
        DataType = ftTime
        Name = 'dateto'
        ParamType = ptInput
      end
      item
        DataType = ftTime
        Name = 'datefrom'
        ParamType = ptInput
      end
      item
        DataType = ftTime
        Name = 'datefrom'
        ParamType = ptInput
      end
      item
        DataType = ftTime
        Name = 'dateto'
        ParamType = ptInput
      end
      item
        DataType = ftTime
        Name = 'datefrom'
        ParamType = ptInput
      end
      item
        DataType = ftTime
        Name = 'dateto'
        ParamType = ptInput
      end
      item
        DataType = ftTime
        Name = 'dateto'
        ParamType = ptInput
      end>
    object qurItogoIZG: TStringField
      FieldName = 'IZG'
      Size = 50
    end
    object qurItogoZAK: TStringField
      FieldName = 'ZAK'
      Size = 50
    end
    object qurItogoMANAGER: TStringField
      FieldName = 'MANAGER'
      Size = 30
    end
    object qurItogoDOLGBEFORE: TFloatField
      FieldName = 'DOLGBEFORE'
      DisplayFormat = '0.00'
    end
    object qurItogoPREDBEFORE: TFloatField
      FieldName = 'PREDBEFORE'
      DisplayFormat = '0.00'
    end
    object qurItogoOTG: TFloatField
      FieldName = 'OTG'
      DisplayFormat = '0.00'
    end
    object qurItogoOPL: TFloatField
      FieldName = 'OPL'
      DisplayFormat = '0.00'
    end
    object qurItogoDOLGAFTER: TFloatField
      FieldName = 'DOLGAFTER'
      DisplayFormat = '0.00'
    end
    object qurItogoPREDAFTER: TFloatField
      FieldName = 'PREDAFTER'
      DisplayFormat = '0.00'
    end
    object qurItogoPRED: TFloatField
      FieldName = 'PRED'
      DisplayFormat = '0.00'
    end
  end
  object dsItogo: TDataSource
    DataSet = qurItogo
    Left = 256
    Top = 256
  end
  object qeItogo: TQueryExtender
    Query = qurItogo
    DefSql = 
      'select'#13#10'  m.izg,m.zak,m.manager,'#13#10'(select'#13#10'  dolg'#13#10' from'#13#10'   dol' +
      'g_proc(m.izg,m.zak,m.manager,:datefrom)'#13#10') as dolgbefore,'#13#10'(sele' +
      'ct'#13#10'  pred'#13#10' from'#13#10'   pred_proc(m.izg,m.zak,m.id_manager,:datefr' +
      'om)'#13#10') as predbefore,'#13#10#13#10'(select'#13#10'  z(Round(sum(n2.nds),2))'#13#10'fro' +
      'm'#13#10'  naklr n2'#13#10'where'#13#10'  n2.fix='#39'*'#39' and'#13#10'  n2.izg=m.izg and'#13#10'  n2' +
      '.zak=m.zak and'#13#10'  n2.auther = m.manager and'#13#10'  n2.dat >= :datefr' +
      'om and'#13#10'  n2.dat <=:dateto'#13#10') as otg,'#13#10#13#10'(select'#13#10'  dolg'#13#10' from'#13 +
      #10'   dolg_proc(m.izg,m.zak,m.manager,IncDate(:dateto, 1, 0, 0))'#13#10 +
      ') as dolgafter,'#13#10#13#10'(select'#13#10'  pred'#13#10' from'#13#10'   pred_proc(m.izg,m.' +
      'zak,m.id_manager,IncDate(:dateto, 1, 0, 0))'#13#10') as predafter,'#13#10#13#10 +
      '('#13#10'select'#13#10'  Round(z(sum(t.transh)),2)'#13#10'from'#13#10'  oplaty o inner j' +
      'oin oplnakl t'#13#10'  on o.idi=t.opl_id'#13#10'where'#13#10'  o.izg=m.izg and o.z' +
      'ak=m.zak and'#13#10'  (t.id_manager=m.id_manager) and'#13#10'  t.opl_data>=:' +
      'datefrom and'#13#10'  t.opl_data<=:dateto'#13#10#13#10') as opl'#13#10','#13#10#13#10'(select'#13#10' ' +
      ' Round(z((-1)*sum(t.transh)),2)'#13#10'from'#13#10'  oplaty o inner join opl' +
      'nakl t'#13#10'  on o.idi=t.opl_id'#13#10'where'#13#10'  o.izg=m.izg and o.zak=m.za' +
      'k and'#13#10'  (o.id_manager=m.id_manager) and'#13#10'  t.opl_data >= :datef' +
      'rom and t.opl_data <= :dateto and o.dat < :datefrom'#13#10') '#13#10'+'#13#10'('#13#10's' +
      'elect'#13#10' z(Round(sum(o.opl),2))'#13#10'from'#13#10'  oplaty o'#13#10'where'#13#10'  o.izg' +
      '=m.izg and o.zak=m.zak and'#13#10'  (o.id_manager=m.id_manager) and'#13#10' ' +
      ' o.dat >= :datefrom and'#13#10'  o.dat <= :dateto'#13#10')'#13#10'-'#13#10'('#13#10'select'#13#10' z' +
      '(Round(sum(t.transh),2))'#13#10'from'#13#10'  oplaty o left join oplnakl t'#13#10 +
      '  on o.idi=t.opl_id'#13#10'where'#13#10'  o.izg=m.izg and o.zak=m.zak and'#13#10' ' +
      ' o.id_manager=m.id_manager and'#13#10'  o.dat >= :datefrom and'#13#10'  o.da' +
      't <= :dateto and'#13#10'  t.opl_data <= :dateto'#13#10')'#13#10'as pred'#13#10#13#10'from'#13#10' ' +
      ' tmp_dolglist m'#13#10'order by'#13#10'  m.izg,m.zak'#13#10
    Left = 256
    Top = 288
  end
  object qurPred: TQuery
    DatabaseName = 'dbnInter'
    SessionName = 'snName'
    SQL.Strings = (
      ' select'
      '  cast('#39#1055#1088#1077#1076'-'#39' as varchar(10)) as pred,'
      '  o.idi,o.dat,o.opl as sum_all,'
      '  Round(z((-1)*sum(t.transh)),2) as sum_my'
      'from'
      '  oplaty o inner join oplnakl t'
      '  on o.idi=t.opl_id'
      'where'
      '  o.izg=:izg and o.zak=:zak and'
      
        '  (o.id_manager=(select max(id) from posr where name=:manager)) ' +
        'and'
      '  t.opl_data >= :datefrom and'
      '  t.opl_data <= :dateto and'
      '  o.dat < :datefrom'
      'group by'
      '  o.idi,o.dat,o.opl'
      ''
      'union all'
      ''
      'select'
      ' cast(null as varchar(10)) as vid,'
      ' o.idi,o.dat,o.opl, z(o.opl- z(Round(sum(t.transh),2)))'
      'from'
      '  oplaty o left join oplnakl t'
      '  on o.idi=t.opl_id'
      'where'
      '  o.izg=:izg and o.zak=:zak and'
      
        '  (o.id_manager=(select max(id) from posr where name=:manager)) ' +
        'and'
      '  o.dat >= :datefrom and o.dat <= :dateto and '
      '  (t.opl_data<=:dateto or t.opl_data is null)'
      ''
      'group by'
      '  o.idi,o.dat,o.opl'
      'having'
      '   Round(o.opl- z(Round(sum(t.transh),2)),2)<>0'
      'order by'
      '  1,3,2')
    Left = 120
    Top = 224
    ParamData = <
      item
        DataType = ftString
        Name = 'izg'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'zak'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'manager'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'datefrom'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dateto'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'datefrom'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'izg'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'zak'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'manager'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'datefrom'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dateto'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dateto'
        ParamType = ptInput
      end>
    object qurPredPRED: TStringField
      DisplayLabel = #1058#1080#1087
      FieldName = 'PRED'
      Size = 10
    end
    object qurPredIDI: TIntegerField
      DisplayLabel = #8470#1087#1083#1072#1090
      FieldName = 'IDI'
    end
    object qurPredDAT: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1083#1072#1090
      FieldName = 'DAT'
      DisplayFormat = 'dd.mm'
    end
    object qurPredSUM_ALL: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1087#1083#1072#1090
      FieldName = 'SUM_ALL'
      DisplayFormat = '0.00'
    end
    object qurPredSUM_MY: TFloatField
      DisplayLabel = #1060#1072#1082#1090' '#1089#1091#1084#1084#1072
      FieldName = 'SUM_MY'
      DisplayFormat = '0.00'
    end
  end
  object dsPred: TDataSource
    DataSet = qurPred
    Left = 120
    Top = 256
  end
end
