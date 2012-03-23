object frmDolgDet3: TfrmDolgDet3
  Left = 132
  Top = 167
  BorderStyle = bsDialog
  Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103' '#1076#1086#1083#1075#1086#1074
  ClientHeight = 342
  ClientWidth = 657
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 657
    Height = 65
    Align = alTop
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1076#1077#1090#1072#1083#1080#1079#1072#1094#1080#1080
    TabOrder = 0
    object Label7: TLabel
      Left = 8
      Top = 16
      Width = 37
      Height = 13
      Caption = #1060#1080#1088#1084#1072
    end
    object Label8: TLabel
      Left = 136
      Top = 16
      Width = 36
      Height = 13
      Caption = #1050#1083#1080#1077#1085#1090
    end
    object Label9: TLabel
      Left = 320
      Top = 16
      Width = 53
      Height = 13
      Caption = #1052#1077#1085#1077#1076#1078#1077#1088
    end
    object BitBtn1: TBitBtn
      Left = 552
      Top = 32
      Width = 97
      Height = 25
      Action = actRefresh
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 0
    end
    object dbeIZG: TEdit
      Left = 8
      Top = 32
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 1
      Text = 'dbeIZG'
    end
    object dbeZAK: TEdit
      Left = 136
      Top = 32
      Width = 177
      Height = 21
      ReadOnly = True
      TabOrder = 2
      Text = 'dbeZAK'
    end
    object dbeMANAG: TEdit
      Left = 320
      Top = 32
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 3
      Text = 'dbeMANAG'
    end
    object cbxAllDoc: TCheckBox
      Left = 443
      Top = 26
      Width = 102
      Height = 25
      Caption = #1042#1089#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
      TabOrder = 4
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 65
    Width = 363
    Height = 277
    Align = alLeft
    Caption = #1044#1086#1083#1075#1080
    TabOrder = 1
    DesignSize = (
      363
      277)
    object DBGridEh1: TDBGridEh
      Left = 8
      Top = 16
      Width = 347
      Height = 229
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsNakl
      Flat = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FooterColor = clInfoBk
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      FooterRowCount = 2
      ParentFont = False
      PopupMenu = PopupMenu1
      ReadOnly = True
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      VertScrollBar.VisibleMode = sbAlwaysShowEh
      OnDblClick = DBGridEh1DblClick
      OnKeyUp = DBGridEh1KeyUp
      Columns = <
        item
          EditButtons = <>
          FieldName = 'DAT'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'ID'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'DAT_OPL'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'NDS'
          Footer.Value = #1048#1090#1086#1075#1086
          Footer.ValueType = fvtStaticText
          Footers = <
            item
              Value = #1054#1073#1097'. '#1089#1091#1084'.'
              ValueType = fvtStaticText
            end
            item
              ValueType = fvtSum
            end>
          Width = 82
        end
        item
          EditButtons = <>
          FieldName = 'OSTATOK'
          Footer.DisplayFormat = '0.00'
          Footer.FieldName = 'OSTATOK'
          Footer.ValueType = fvtSum
          Footers = <
            item
              Value = #1044#1086#1083#1075#1086#1074
              ValueType = fvtStaticText
            end
            item
              ValueType = fvtSum
            end>
          Width = 69
        end>
    end
    object BitBtn2: TBitBtn
      Left = 8
      Top = 248
      Width = 129
      Height = 25
      Action = actDetail
      Anchors = [akLeft, akBottom]
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      TabOrder = 1
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1000
        10001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C10001863
        100010001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C100018631000
        100010001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1000186310001000
        10001F7C1F7C1F7C1F7C1F7C1F7C000000000000000010001863100010001000
        1F7C1F7C1F7C1F7C1F7C00000000186318631863FF7F10421000100010001F7C
        1F7C1F7C1F7C1F7C0000104218631863186318631863FF7F104200001F7C1F7C
        1F7C1F7C1F7C1F7C00001863186318631863186318631863FF7F00001F7C1F7C
        1F7C1F7C1F7C0000186318631863186318631863186318631863186300001F7C
        1F7C1F7C1F7C0000186318631863186318631863186318631863186300001F7C
        1F7C1F7C1F7C00001863FF7FFF03186318631863186318631863186300001F7C
        1F7C1F7C1F7C00001863FF7FFF03186318631863186318631863186300001F7C
        1F7C1F7C1F7C1F7C0000FF7FFF7FFF03FF03186318631863186300001F7C1F7C
        1F7C1F7C1F7C1F7C00001042FF7FFF7FFF7F186318631863104200001F7C1F7C
        1F7C1F7C1F7C1F7C1F7C000000001863186318631863000000001F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000001F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C}
    end
  end
  object GroupBox3: TGroupBox
    Left = 361
    Top = 65
    Width = 296
    Height = 277
    Align = alRight
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = #1055#1088#1077#1076#1086#1087#1083#1072#1090#1099
    TabOrder = 2
    DesignSize = (
      296
      277)
    object DBGridEh2: TDBGridEh
      Left = 8
      Top = 16
      Width = 280
      Height = 229
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsOpl
      Flat = False
      FooterColor = clInfoBk
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      FooterRowCount = 2
      PopupMenu = PopupMenu2
      ReadOnly = True
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      VertScrollBar.VisibleMode = sbAlwaysShowEh
      OnDblClick = DBGridEh2DblClick
      OnKeyUp = DBGridEh2KeyUp
      Columns = <
        item
          EditButtons = <>
          FieldName = 'DAT'
          Footers = <>
          Width = 52
        end
        item
          EditButtons = <>
          FieldName = 'IDI'
          Footers = <>
          Width = 49
        end
        item
          EditButtons = <>
          FieldName = 'OPL'
          Footer.Value = #1048#1090#1086#1075#1086
          Footer.ValueType = fvtStaticText
          Footers = <
            item
              Value = #1054#1073#1097'. '#1089#1091#1084'.'
              ValueType = fvtStaticText
            end
            item
              ValueType = fvtSum
            end>
          Width = 73
        end
        item
          EditButtons = <>
          FieldName = 'OSTATOK'
          Footer.DisplayFormat = '0.00'
          Footers = <
            item
              Value = #1055#1088#1077#1086#1076#1087#1083#1072#1090
              ValueType = fvtStaticText
            end
            item
              DisplayFormat = '0.00'
              ValueType = fvtSum
            end>
          Width = 67
        end>
    end
    object BitBtn3: TBitBtn
      Left = 8
      Top = 248
      Width = 129
      Height = 25
      Action = actDetail2
      Anchors = [akLeft, akBottom]
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      TabOrder = 1
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1000
        10001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C10001863
        100010001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C100018631000
        100010001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1000186310001000
        10001F7C1F7C1F7C1F7C1F7C1F7C000000000000000010001863100010001000
        1F7C1F7C1F7C1F7C1F7C00000000186318631863FF7F10421000100010001F7C
        1F7C1F7C1F7C1F7C0000104218631863186318631863FF7F104200001F7C1F7C
        1F7C1F7C1F7C1F7C00001863186318631863186318631863FF7F00001F7C1F7C
        1F7C1F7C1F7C0000186318631863186318631863186318631863186300001F7C
        1F7C1F7C1F7C0000186318631863186318631863186318631863186300001F7C
        1F7C1F7C1F7C00001863FF7FFF03186318631863186318631863186300001F7C
        1F7C1F7C1F7C00001863FF7FFF03186318631863186318631863186300001F7C
        1F7C1F7C1F7C1F7C0000FF7FFF7FFF03FF03186318631863186300001F7C1F7C
        1F7C1F7C1F7C1F7C00001042FF7FFF7FFF7F186318631863104200001F7C1F7C
        1F7C1F7C1F7C1F7C1F7C000000001863186318631863000000001F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000001F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C}
    end
  end
  object ActionList1: TActionList
    Images = dmdEx.ImageList1
    Left = 24
    Top = 224
    object actClose: TAction
      Caption = 'actClose'
      ShortCut = 27
      OnExecute = actCloseExecute
    end
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ShortCut = 116
      OnExecute = actRefreshExecute
    end
    object actDetail: TAction
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      ImageIndex = 5
      OnExecute = actDetailExecute
    end
    object actDetail2: TAction
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      ImageIndex = 5
      OnExecute = actDetail2Execute
    end
  end
  object dsNakl: TDataSource
    DataSet = qurNakl
    Left = 56
    Top = 184
  end
  object dsOpl: TDataSource
    DataSet = qurOpl
    Left = 88
    Top = 184
  end
  object sdsNakl: TSQLDataSet
    CommandText = 
      'select om.dat, om.id, om.nds, r.debetafter-r.kreditafter as osta' +
      'tok,'#13#10'  case Round(om.nds-r.debetafter,2) when 0 then null else ' +
      'r.dat_last end as dat_opl ,'#13#10'  om.tip, om.id_nakl'#13#10'from rep_osta' +
      'tki_datfirst_pc('#13#10'      (select oid from GET_OID_OBJECTS_PC('#13#10'  ' +
      '     '#39#1044#1054#1051#1043#1048' '#1047#1040' '#1050#1040#1041#1045#1051#1068#39','#13#10'       (select oid from GET_OID_OBJECTS' +
      '_PC('#39#1058#1048#1055' '#1057#1063#1045#1058#1040#39',-100))'#13#10'       )),:dat_to,'#13#10'  :id_izg,'#13#10'  :id_za' +
      'k,'#13#10'  :id_manager,null,null,'#13#10'  null,null,null,null,null) r'#13#10'  i' +
      'nner join provodki pr2 on pr2.id_nakl=r.sub4 and'#13#10'    pr2.sub4=r' +
      '.sub4 and'#13#10'    pr2.id_schet=(select oid from GET_OID_OBJECTS_PC(' +
      #13#10'       '#39#1044#1054#1051#1043#1048' '#1047#1040' '#1050#1040#1041#1045#1051#1068#39','#13#10'       (select oid from GET_OID_OBJ' +
      'ECTS_PC('#39#1058#1048#1055' '#1057#1063#1045#1058#1040#39',-100))'#13#10'       ))'#13#10'  inner join naklo om on ' +
      'pr2.id_nakl=om.id_nakl'#13#10'where pr2.debet is not null'#13#10'order by om' +
      '.dat,om.id'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'dat_to'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_izg'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_zak'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_manager'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 56
    Top = 88
  end
  object sdsOpl: TSQLDataSet
    CommandText = 
      'select om.dat, om.id as idi , pr2.kredit as opl , r.kreditafter-' +
      'r.debetafter as ostatok, om.tip, om.id_nakl'#13#10#13#10'from rep_ostatki_' +
      'datfirst_pc('#13#10'      (select oid from GET_OID_OBJECTS_PC('#13#10'      ' +
      ' '#39#1044#1054#1051#1043#1048' '#1047#1040' '#1050#1040#1041#1045#1051#1068#39','#13#10'       (select oid from GET_OID_OBJECTS_PC(' +
      #39#1058#1048#1055' '#1057#1063#1045#1058#1040#39',-100))'#13#10'       )),:dat_to,'#13#10'  :id_izg,'#13#10'  :id_zak,'#13#10 +
      '  :id_manager,null,null,'#13#10'  null,null,null,null,null) r'#13#10'  inner' +
      ' join provodki pr2 on pr2.id_nakl=r.sub4 and'#13#10'    pr2.sub4=r.sub' +
      '4 and'#13#10'    pr2.id_schet=(select oid from GET_OID_OBJECTS_PC('#13#10'  ' +
      '     '#39#1044#1054#1051#1043#1048' '#1047#1040' '#1050#1040#1041#1045#1051#1068#39','#13#10'       (select oid from GET_OID_OBJECTS' +
      '_PC('#39#1058#1048#1055' '#1057#1063#1045#1058#1040#39',-100))'#13#10'       ))'#13#10'  inner join naklo om on pr2.' +
      'id_nakl=om.id_nakl'#13#10'where pr2.kredit is not null'#13#10'order by om.da' +
      't,om.id'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'dat_to'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_izg'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_zak'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_manager'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 88
    Top = 88
    object sdsOplDAT: TSQLTimeStampField
      FieldName = 'DAT'
    end
    object sdsOplIDI: TStringField
      FieldName = 'IDI'
    end
    object sdsOplOSTATOK: TFloatField
      FieldName = 'OSTATOK'
    end
    object sdsOplTIP: TIntegerField
      FieldName = 'TIP'
      Required = True
    end
    object sdsOplID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
    end
    object sdsOplOPL: TFloatField
      FieldName = 'OPL'
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = sdsNakl
    Options = [poAllowCommandText]
    Left = 56
    Top = 120
  end
  object DataSetProvider2: TDataSetProvider
    DataSet = sdsOpl
    Options = [poAllowCommandText]
    Left = 88
    Top = 120
  end
  object qurNakl: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'dat_to'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_izg'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_zak'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_manager'
        ParamType = ptInput
      end>
    ProviderName = 'DataSetProvider1'
    ReadOnly = True
    Left = 56
    Top = 152
    object qurNaklDAT2: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 8
      FieldName = 'DAT'
      DisplayFormat = 'dd.mm.yy'
    end
    object qurNaklID: TStringField
      DisplayLabel = #8470' '#1085#1072#1082#1083
      DisplayWidth = 8
      FieldName = 'ID'
    end
    object qurNaklMAX2: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1087#1083
      DisplayWidth = 8
      FieldName = 'DAT_OPL'
      DisplayFormat = 'dd.mm.yy'
    end
    object qurNaklNDS: TFMTBCDField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1085#1072#1082#1083
      FieldName = 'NDS'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 4
    end
    object qurNaklOSTATOK: TFloatField
      DisplayLabel = #1053#1077#1086#1087#1083#1072#1095
      DisplayWidth = 13
      FieldName = 'OSTATOK'
      DisplayFormat = '0.00'
    end
    object qurNaklTIP: TIntegerField
      FieldName = 'TIP'
      Required = True
    end
    object qurNaklID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
    end
  end
  object qurOpl: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'dat_to'
        ParamType = ptInput
        Value = '01.01.08'
      end
      item
        DataType = ftString
        Name = 'id_izg'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'id_zak'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'id_manager'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'DataSetProvider2'
    ReadOnly = True
    Left = 88
    Top = 152
    object qurOplDAT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 7
      FieldName = 'DAT'
      DisplayFormat = 'dd.mm.yy'
    end
    object qurOplIDI: TStringField
      DisplayLabel = #8470#1086#1087#1083
      DisplayWidth = 8
      FieldName = 'IDI'
    end
    object qurOplOSTATOK: TFloatField
      DisplayLabel = #1055#1088#1077#1076#1086#1087#1083#1072#1090#1072
      DisplayWidth = 12
      FieldName = 'OSTATOK'
      DisplayFormat = '0.00'
    end
    object qurOplTIP: TIntegerField
      FieldName = 'TIP'
      Required = True
    end
    object qurOplID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
    end
    object qurOplOPL: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'OPL'
      DisplayFormat = '0.00'
    end
  end
  object PopupMenu1: TPopupMenu
    Images = dmdEx.ImageList1
    Left = 56
    Top = 224
    object N1: TMenuItem
      Action = actDetail
    end
  end
  object PopupMenu2: TPopupMenu
    Images = dmdEx.ImageList1
    Left = 88
    Top = 224
    object MenuItem1: TMenuItem
      Action = actDetail2
    end
  end
  object qeNakl: TQueryExtender
    Query = qurNakl
    KeyField = 'id_nakl'
    Left = 56
    Top = 256
  end
  object qeOpl: TQueryExtender
    Query = qurOpl
    KeyField = 'id_nakl'
    Left = 88
    Top = 256
  end
end
