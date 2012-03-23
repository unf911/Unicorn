object frmPrixDet: TfrmPrixDet
  Left = 410
  Top = 390
  BorderStyle = bsDialog
  Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103' '#1087#1088#1080#1093#1086#1076#1072
  ClientHeight = 316
  ClientWidth = 589
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
    Width = 589
    Height = 145
    Align = alTop
    Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1087#1083#1072#1090#1077#1078#1077
    TabOrder = 0
    DesignSize = (
      589
      145)
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 54
      Height = 13
      Caption = #8470#1087#1083#1072#1090#1077#1078#1072
    end
    object Label2: TLabel
      Left = 8
      Top = 40
      Width = 72
      Height = 13
      Caption = #1044#1072#1090#1072' '#1087#1083#1072#1090#1077#1078#1072
    end
    object Label3: TLabel
      Left = 8
      Top = 64
      Width = 34
      Height = 13
      Caption = #1057#1091#1084#1084#1072
    end
    object Label4: TLabel
      Left = 8
      Top = 88
      Width = 54
      Height = 13
      Caption = #1055#1086#1090#1088#1072#1095#1077#1085#1086
    end
    object dbeOplIdi: TDBEdit
      Left = 88
      Top = 16
      Width = 80
      Height = 21
      DataField = 'IDI'
      DataSource = dsOplaty
      ReadOnly = True
      TabOrder = 0
    end
    object dbeOplDat: TDBEdit
      Left = 88
      Top = 40
      Width = 80
      Height = 21
      DataField = 'DAT'
      DataSource = dsOplaty
      ReadOnly = True
      TabOrder = 1
    end
    object dbeOplOpl: TDBEdit
      Left = 88
      Top = 64
      Width = 80
      Height = 21
      DataField = 'OPL'
      DataSource = dsOplaty
      ReadOnly = True
      TabOrder = 2
    end
    object dbeOplPotr: TDBEdit
      Left = 88
      Top = 88
      Width = 80
      Height = 21
      DataField = 'POTRACHENO'
      DataSource = dsOplaty
      ReadOnly = True
      TabOrder = 3
    end
    object Button1: TButton
      Left = 8
      Top = 112
      Width = 137
      Height = 25
      Hint = #1080#1083#1080' '#1076#1074#1086#1081#1085#1086#1081' '#1082#1083#1080#1082' '#1087#1086' '#1089#1090#1088#1086#1082#1077' '#1074' '#1090#1072#1073#1083#1080#1094#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1093
      Action = actGotoNakl
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
    object DBGridEh1: TDBGridEh
      Left = 176
      Top = 8
      Width = 403
      Height = 129
      Anchors = [akLeft, akTop, akRight]
      DataSource = dsDetOpl
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
      PopupMenu = PopupMenu1
      ReadOnly = True
      TabOrder = 5
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      VertScrollBar.VisibleMode = sbAlwaysShowEh
      OnDblClick = DBGridEh1DblClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 145
    Width = 589
    Height = 169
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
    TabOrder = 1
    DesignSize = (
      589
      169)
    object Label5: TLabel
      Left = 8
      Top = 20
      Width = 65
      Height = 13
      Caption = #8470#1085#1072#1082#1083#1072#1076#1085#1086#1081
    end
    object Label6: TLabel
      Left = 8
      Top = 44
      Width = 53
      Height = 13
      Caption = #1044#1072#1090#1072' '#1085#1072#1082#1083
    end
    object Label7: TLabel
      Left = 8
      Top = 68
      Width = 34
      Height = 13
      Caption = #1057#1091#1084#1084#1072
    end
    object Label8: TLabel
      Left = 8
      Top = 92
      Width = 49
      Height = 13
      Caption = #1054#1087#1083#1072#1095#1077#1085#1086
    end
    object dbeNaklNakl: TDBEdit
      Left = 88
      Top = 20
      Width = 80
      Height = 21
      DataField = 'ID'
      DataSource = dsNaklr
      ReadOnly = True
      TabOrder = 0
    end
    object dbeNaklDat: TDBEdit
      Left = 88
      Top = 44
      Width = 80
      Height = 21
      DataField = 'DAT'
      DataSource = dsNaklr
      ReadOnly = True
      TabOrder = 1
    end
    object dbeNaklNds: TDBEdit
      Left = 88
      Top = 68
      Width = 80
      Height = 21
      DataField = 'NDS'
      DataSource = dsNaklr
      ReadOnly = True
      TabOrder = 2
    end
    object dbeNaklOplach: TDBEdit
      Left = 88
      Top = 92
      Width = 80
      Height = 21
      DataField = 'OPLACHENO'
      DataSource = dsNaklr
      ReadOnly = True
      TabOrder = 3
    end
    object Button2: TButton
      Left = 8
      Top = 128
      Width = 137
      Height = 25
      Hint = #1080#1083#1080' '#1076#1074#1086#1081#1085#1086#1081' '#1082#1083#1080#1082' '#1087#1086' '#1089#1090#1088#1086#1082#1077' '#1074' '#1090#1072#1073#1083#1080#1094#1077' '#1087#1083#1072#1090#1077#1078#1077#1081
      Action = actGotoOpl
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
    object DBGridEh2: TDBGridEh
      Left = 176
      Top = 8
      Width = 403
      Height = 153
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsDetNakl
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
      ReadOnly = True
      TabOrder = 5
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      VertScrollBar.VisibleMode = sbAlwaysShowEh
      OnDblClick = DBGridEh2DblClick
    end
  end
  object dsDetNakl: TDataSource
    DataSet = qurDetNakl
    Left = 288
    Top = 104
  end
  object ActionList1: TActionList
    Left = 384
    Top = 80
    object actShowDet: TAction
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      ShortCut = 120
      OnExecute = actShowDetExecute
    end
    object actGotoNakl: TAction
      Caption = #1055#1077#1088#1077#1081#1090#1080' '#1082' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      OnExecute = actGotoNaklExecute
    end
    object actGotoOpl: TAction
      Caption = #1055#1077#1088#1077#1081#1090#1080' '#1082' '#1087#1083#1072#1090#1077#1078#1091
      OnExecute = actGotoOplExecute
    end
    object actClose: TAction
      Caption = 'actClose'
      ShortCut = 27
      OnExecute = actCloseExecute
    end
    object actShowNakl2: TAction
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      ShortCut = 120
    end
  end
  object dsDetOpl: TDataSource
    DataSet = qurDetOpl
    Left = 256
    Top = 104
  end
  object dsOplaty: TDataSource
    DataSet = qurOplaty
    Left = 320
    Top = 104
  end
  object dsNaklr: TDataSource
    DataSet = qurNaklr
    Left = 352
    Top = 104
  end
  object sdsDetOpl: TSQLDataSet
    CommandText = 
      'select'#13#10'  n.id,n.id_nakl as nakl,n.dat,n.id_manager,n.nds,t.tran' +
      'sh'#13#10'from'#13#10'  naklo n inner join oplnakl t on n.id_nakl=t.id_to'#13#10'w' +
      'here'#13#10'  t.id_from=:opl_id'#13#10'  and  n.delmarked=0'#13#10'order by '#13#10'  n.' +
      'dat'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'opl_id'
        ParamType = ptInput
        Value = '0'
      end>
    SQLConnection = dmdEx.scUchet
    Left = 256
    Top = 8
  end
  object sdsDetNakl: TSQLDataSet
    CommandText = 
      'select '#13#10'  o.id as idi,o.dat,o.nds as opl,t.transh,o.id_nakl'#13#10'fr' +
      'om '#13#10'  naklo o inner join oplnakl t on o.id_nakl=t.id_from'#13#10'wher' +
      'e'#13#10'  t.id_to=:nakl_id'#13#10'order by'#13#10'  o.dat'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'nakl_id'
        ParamType = ptInput
        Value = '0'
      end>
    SQLConnection = dmdEx.scUchet
    Left = 288
    Top = 8
  end
  object SQLDataSet3: TSQLDataSet
    CommandText = 
      'select'#13#10'  o.id as idi,o.dat,o.nds as opl,   '#13#10'  (select cast(z(s' +
      'um(t.transh)) as numeric(15,4))'#13#10'    from oplnakl t'#13#10'    where t' +
      '.id_from=o.id_nakl'#13#10'    ) as potracheno'#13#10'from'#13#10'  naklo o'#13#10'where'#13 +
      #10'  o.id_nakl=:opl_id'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'opl_id'
        ParamType = ptInput
        Value = '0'
      end>
    SQLConnection = dmdEx.scUchet
    Left = 320
    Top = 8
  end
  object SQLDataSet4: TSQLDataSet
    CommandText = 
      'select '#13#10'  n.id,n.id_nakl as nakl,n.dat,n.nds,'#13#10'  (select cast(z' +
      '(sum(t.transh)) as numeric(15,4))'#13#10'    from oplnakl t'#13#10'    where' +
      ' t.id_to=n.id_nakl'#13#10'    ) as oplacheno'#13#10'from'#13#10'  naklo n'#13#10'where'#13#10 +
      '  n.id_nakl=:nakl_id'#13#10'  '#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'nakl_id'
        ParamType = ptInput
        Value = '0'
      end>
    SQLConnection = dmdEx.scUchet
    Left = 352
    Top = 8
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = sdsDetOpl
    Left = 256
    Top = 40
  end
  object DataSetProvider2: TDataSetProvider
    DataSet = sdsDetNakl
    Left = 288
    Top = 40
  end
  object DataSetProvider3: TDataSetProvider
    DataSet = SQLDataSet3
    Left = 320
    Top = 40
  end
  object DataSetProvider4: TDataSetProvider
    DataSet = SQLDataSet4
    Left = 352
    Top = 40
  end
  object qurDetOpl: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'opl_id'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'DataSetProvider1'
    Left = 256
    Top = 72
    object qurDetOplNAKL: TIntegerField
      DisplayLabel = #8470#1085#1072#1082#1083
      DisplayWidth = 9
      FieldName = 'NAKL'
      Visible = False
    end
    object qurDetOplID: TStringField
      DisplayLabel = #8470#1085#1072#1082#1083
      DisplayWidth = 8
      FieldName = 'ID'
    end
    object qurDetOplDAT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 8
      FieldName = 'DAT'
      Required = True
      DisplayFormat = 'dd.mm.yy'
    end
    object qurDetOplAUTHER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      DisplayWidth = 16
      FieldKind = fkLookup
      FieldName = 'AUTHER'
      LookupDataSet = dmdEx.cdsManager
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_MANAGER'
      Size = 30
      Lookup = True
    end
    object qurDetOplID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
      Visible = False
    end
    object qurDetOplNDS: TFMTBCDField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1085#1072#1082#1083
      DisplayWidth = 10
      FieldName = 'NDS'
      Required = True
      DisplayFormat = '0.00'
      Precision = 15
    end
    object qurDetOplTRANSH: TFMTBCDField
      DisplayLabel = #1054#1087#1083#1072#1090#1072' '#1089' '#1087#1083#1072#1090#1077#1078#1072
      DisplayWidth = 13
      FieldName = 'TRANSH'
      Required = True
      DisplayFormat = '0.00'
      Precision = 15
    end
  end
  object qurDetNakl: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'nakl_id'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'DataSetProvider2'
    Left = 288
    Top = 72
    object qurDetNaklIDI: TStringField
      DisplayLabel = #8470#1087#1083#1072#1090#1077#1078#1072
      DisplayWidth = 8
      FieldName = 'IDI'
    end
    object qurDetNaklDAT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 10
      FieldName = 'DAT'
      Required = True
      DisplayFormat = 'dd.mm.yy'
    end
    object qurDetNaklOPL: TFMTBCDField
      DisplayLabel = #1055#1083#1072#1090#1077#1078
      DisplayWidth = 17
      FieldName = 'OPL'
      Required = True
      DisplayFormat = '0.00'
      Precision = 15
    end
    object qurDetNaklTRANSH: TFMTBCDField
      DisplayLabel = #1055#1077#1088#1077#1074#1077#1076#1077#1085#1086' '#1089' '#1087#1083#1072#1090#1077#1078#1072
      DisplayWidth = 20
      FieldName = 'TRANSH'
      Required = True
      DisplayFormat = '0.00'
      Precision = 15
    end
    object qurDetNaklID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      Required = True
      Visible = False
    end
  end
  object qurOplaty: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'opl_id'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'DataSetProvider3'
    Left = 320
    Top = 72
    object qurOplatyIDI: TStringField
      DisplayLabel = #8470#1087#1083#1072#1090#1077#1078#1072
      DisplayWidth = 9
      FieldName = 'IDI'
    end
    object qurOplatyDAT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DAT'
      Required = True
      DisplayFormat = 'dd.mm.yy'
    end
    object qurOplatyOPL: TFMTBCDField
      FieldName = 'OPL'
      Required = True
      DisplayFormat = '0.00'
      Precision = 15
    end
    object qurOplatyPOTRACHENO: TFMTBCDField
      FieldName = 'POTRACHENO'
      DisplayFormat = '0.00'
      Precision = 15
    end
  end
  object qurNaklr: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'nakl_id'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'DataSetProvider4'
    Left = 352
    Top = 72
    object qurNaklrID: TStringField
      FieldName = 'ID'
    end
    object qurNaklrNAKL: TIntegerField
      FieldName = 'NAKL'
      Required = True
    end
    object qurNaklrDAT: TSQLTimeStampField
      FieldName = 'DAT'
      Required = True
      DisplayFormat = 'dd.mm.yy'
    end
    object qurNaklrNDS: TFMTBCDField
      FieldName = 'NDS'
      Required = True
      DisplayFormat = '0.00'
      Precision = 15
    end
    object qurNaklrOPLACHENO: TFMTBCDField
      FieldName = 'OPLACHENO'
      DisplayFormat = '0.00'
      Precision = 15
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 404
    Top = 128
    object actShowNakl1: TMenuItem
      Action = actShowDet
    end
  end
  object qeDetNakl: TQueryExtender
    Query = sdsDetNakl
    DefSql = 
      'select '#13#10'  o.id as idi,o.dat,o.nds as opl,t.transh,o.id_nakl'#13#10'fr' +
      'om '#13#10'  naklo o inner join oplnakl t on o.id_nakl=t.id_from'#13#10'wher' +
      'e'#13#10'  t.id_to=:nakl_id'#13#10'order by'#13#10'  o.dat'
    Left = 288
    Top = 145
  end
  object qeDetOpl: TQueryExtender
    Query = sdsDetOpl
    DefSql = 
      'select'#13#10'  n.id,n.id_nakl as nakl,n.dat,n.id_manager,n.nds,t.tran' +
      'sh'#13#10'from'#13#10'  naklo n inner join oplnakl t on n.id_nakl=t.id_to'#13#10'w' +
      'here'#13#10'  t.id_from=:opl_id'#13#10'  and  n.delmarked=0'#13#10'order by '#13#10'  n.' +
      'dat'#13#10
    Left = 256
    Top = 145
  end
end
