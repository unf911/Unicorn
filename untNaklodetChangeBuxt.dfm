object frmChangeBuxt: TfrmChangeBuxt
  Left = 217
  Top = 136
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1090#1072#1088#1099
  ClientHeight = 261
  ClientWidth = 481
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    481
    261)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 8
    Top = 8
    Width = 465
    Height = 209
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsTara
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupNaklodet
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object btnOk: TBitBtn
    Left = 80
    Top = 232
    Width = 121
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    TabOrder = 1
    OnClick = btnOkClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 240
    Top = 232
    Width = 105
    Height = 25
    Anchors = [akLeft, akBottom]
    TabOrder = 2
    Kind = bkCancel
  end
  object BitBtn3: TBitBtn
    Left = 376
    Top = 232
    Width = 97
    Height = 25
    Action = actDetail
    Anchors = [akLeft, akBottom]
    Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
    TabOrder = 3
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8400
      00840000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF840000C6C6C6840000840000FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000C6C6C68400
      00840000840000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FF840000C6C6C6840000840000840000FF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF000000000000000000000000840000C6C6C68400008400008400
      00FF00FFFF00FFFF00FFFF00FFFF00FF000000000000C6C6C6C6C6C6C6C6C6FF
      FFFF848484840000840000840000FF00FFFF00FFFF00FFFF00FFFF00FF000000
      848484C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6FFFFFF848484000000FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FF000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
      C6C6C6C6C6FFFFFF000000FF00FFFF00FFFF00FFFF00FFFF00FF000000C6C6C6
      C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6000000FF00
      FFFF00FFFF00FFFF00FF000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
      C6C6C6C6C6C6C6C6C6C6C6000000FF00FFFF00FFFF00FFFF00FF000000C6C6C6
      FFFFFFFFFF00C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6000000FF00
      FFFF00FFFF00FFFF00FF000000C6C6C6FFFFFFFFFF00C6C6C6C6C6C6C6C6C6C6
      C6C6C6C6C6C6C6C6C6C6C6000000FF00FFFF00FFFF00FFFF00FFFF00FF000000
      FFFFFFFFFFFFFFFF00FFFF00C6C6C6C6C6C6C6C6C6C6C6C6000000FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FF000000848484FFFFFFFFFFFFFFFFFFC6C6C6C6
      C6C6C6C6C6848484000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      000000000000C6C6C6C6C6C6C6C6C6C6C6C6000000000000FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00000000000000000000
      0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
  end
  object sdsTara: TSQLDataSet
    SQLConnection = dmdEx.scUchet
    CommandText = 
      'select'#13#10'  st.id_tara,'#13#10'  st.nomer_tary,'#13#10'  st.kolotp,'#13#10'  st.kolb' +
      'uxt,'#13#10'  st.comment,'#13#10'  st.id_ostt,'#13#10'  st.kolrezerv,'#13#10'  st.kolbre' +
      'zerv,'#13#10'  st.id_type,'#13#10'  st.id_izg,'#13#10'  st.id_ost '#13#10'from '#13#10'  sklos' +
      'tt st '#13#10'where '#13#10'  st.id_ost=('#13#10'      select sm.id_ost '#13#10'      fr' +
      'om sklost sm '#13#10'      where sm.id_tovar=:id_tovar and'#13#10'         s' +
      'm.id_sklad=:id_sklad'#13#10'  ) and'#13#10'  st.id_tara=(select ID_TARA from' +
      ' GET_BUXTNUMBER_PC) and'#13#10'  ('#13#10'    (Round(st.kolotp,3)=Round(:kol' +
      'otp,3)  and st.kolbuxt=1) or '#13#10'    (Round(st.kolrezerv,3)=Round(' +
      ':kolotp,3)  and st.kolbrezerv=1) '#13#10'  ) and   '#13#10'  ('#13#10'    st.id_ty' +
      'pe<>3 and '#13#10'    st.id_type<>1'#13#10'  )'#13#10'order by'#13#10'  st.NOMER_TARY'
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_tovar'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_sklad'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'kolotp'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'kolotp'
        ParamType = ptInput
      end>
    Left = 24
    Top = 128
  end
  object dspTara: TDataSetProvider
    DataSet = sdsTara
    Constraints = True
    Options = [poAllowCommandText]
    Left = 24
    Top = 160
  end
  object cdsTara: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_tovar'
        ParamType = ptUnknown
        Value = 206
      end
      item
        DataType = ftInteger
        Name = 'id_sklad'
        ParamType = ptUnknown
        Value = 0
      end
      item
        DataType = ftFloat
        Name = 'kolotp'
        ParamType = ptUnknown
        Value = 0.97
      end>
    ProviderName = 'dspTara'
    Left = 24
    Top = 192
    object cdsTaraIZG: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      DisplayWidth = 17
      FieldKind = fkLookup
      FieldName = 'IZG'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_IZG'
      Lookup = True
    end
    object cdsTaraNOMER_TARY: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1090#1072#1088#1099
      DisplayWidth = 13
      FieldName = 'NOMER_TARY'
      Size = 30
    end
    object cdsTaraCOMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      DisplayWidth = 13
      FieldName = 'COMMENT'
      Size = 50
    end
    object cdsTaraID_TARA: TIntegerField
      FieldName = 'ID_TARA'
      Visible = False
    end
    object cdsTaraID_OSTT: TIntegerField
      FieldName = 'ID_OSTT'
      Required = True
      Visible = False
    end
    object cdsTaraKOLOTP: TFMTBCDField
      DisplayLabel = #1044#1083#1080#1085#1072' '#1089#1074#1086#1073
      DisplayWidth = 8
      FieldName = 'KOLOTP'
      Required = True
      DisplayFormat = '0.000'
      Precision = 15
      Size = 8
    end
    object cdsTaraKOLBUXT: TIntegerField
      DisplayLabel = #1041#1091#1093#1090' '#1089#1074#1086#1073
      DisplayWidth = 4
      FieldName = 'KOLBUXT'
      Required = True
    end
    object cdsTaraKOLREZERV: TFMTBCDField
      DisplayLabel = #1044#1083#1080#1085#1072' '#1086#1090#1083#1086#1078
      DisplayWidth = 9
      FieldName = 'KOLREZERV'
      Required = True
      DisplayFormat = '0.000'
      Precision = 15
      Size = 8
    end
    object cdsTaraKOLBREZERV: TIntegerField
      DisplayLabel = #1041#1091#1093#1090' '#1088#1077#1079#1077#1074
      DisplayWidth = 5
      FieldName = 'KOLBREZERV'
      Required = True
    end
    object cdsTaraID_TYPE: TIntegerField
      DisplayWidth = 10
      FieldName = 'ID_TYPE'
      Required = True
      Visible = False
    end
    object cdsTaraID_IZG: TIntegerField
      FieldName = 'ID_IZG'
      Required = True
      Visible = False
    end
  end
  object dsTara: TDataSource
    DataSet = cdsTara
    Left = 24
    Top = 224
  end
  object ActionList1: TActionList
    Images = dmdEx.ImageList1
    Left = 56
    Top = 160
    object actDetail: TAction
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      OnExecute = actDetailExecute
    end
    object actChangeBuxt: TAction
      Caption = #1055#1086#1084#1077#1085#1103#1090#1100' '#1073#1091#1093#1090#1099
      ImageIndex = 3
      OnExecute = actChangeBuxtExecute
    end
  end
  object qeTara: TQueryExtender
    Query = cdsTara
    Left = 24
    Top = 96
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmChangeBuxt'
    StorageManager = RegPropStorageManEh1
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width')
    Left = 56
    Top = 128
  end
  object RegPropStorageManEh1: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 56
    Top = 96
  end
  object PopupNaklodet: TPopupMenu
    Images = dmdEx.ImageList1
    OnPopup = PopupNaklodetPopup
    Left = 56
    Top = 192
    object mnuChangeBuxt: TMenuItem
      Action = actChangeBuxt
    end
  end
  object sdsExchange: TSQLDataSet
    SQLConnection = dmdEx.scUchet
    CommandText = 'NAKLODET_EXCHANGE_BUXT_PC'
    CommandType = ctStoredProc
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_OSTT1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_OSTT2'
        ParamType = ptInput
      end>
    Left = 88
    Top = 128
  end
end
