object frmSchetList: TfrmSchetList
  Left = 68
  Top = 132
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1088#1072#1089#1093#1086#1076#1085#1086#1081' '#1080#1079' '#1089#1095#1105#1090#1072
  ClientHeight = 313
  ClientWidth = 567
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyUp = FormKeyUp
  DesignSize = (
    567
    313)
  PixelsPerInch = 96
  TextHeight = 13
  object edtIzg: TEdit
    Left = 192
    Top = 0
    Width = 177
    Height = 21
    TabOrder = 0
    OnKeyUp = edtIzgKeyUp
  end
  object btnOk: TBitBtn
    Left = 80
    Top = 280
    Width = 145
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
  object btnCancel: TBitBtn
    Left = 320
    Top = 280
    Width = 145
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = btnCancelClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object UnfDBGrid1: TDBGridEh
    Tag = 1
    Left = 0
    Top = 24
    Width = 566
    Height = 249
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsSchet
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = UnfDBGrid1DblClick
    OnKeyUp = UnfDBGrid1KeyUp
    Columns = <
      item
        EditButtons = <>
        FieldName = 'SCHET'
        Footers = <>
        Width = 39
      end
      item
        EditButtons = <>
        FieldName = 'DAT'
        Footers = <>
        Width = 47
      end
      item
        EditButtons = <>
        FieldName = 'IZG'
        Footers = <>
        Width = 87
      end
      item
        EditButtons = <>
        FieldName = 'ZAK'
        Footers = <>
        Width = 217
      end
      item
        EditButtons = <>
        FieldName = 'AUTHER'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'NDS'
        Footers = <>
        Width = 68
      end>
  end
  object dsSchet: TDataSource
    DataSet = qurSchet
    Left = 168
    Top = 128
  end
  object SQLDataSet1: TSQLDataSet
    CommandText = 
      'select'#13#10'  s.schet,s.dat,s.izg,s.zak,s.nds,s.auther'#13#10'from'#13#10'  sche' +
      't s'#13#10'where'#13#10'  s.dat>incdate('#39'now'#39',0,-3,0)'#13#10'order by'#13#10'  s.dat des' +
      'c,s.schet desc'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 168
    Top = 32
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLDataSet1
    Left = 168
    Top = 64
  end
  object qurSchet: TClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ProviderName = 'DataSetProvider1'
    ReadOnly = True
    Left = 168
    Top = 96
    object qurSchetSCHET: TIntegerField
      DisplayLabel = #8470#1089#1095#1077#1090#1072
      DisplayWidth = 13
      FieldName = 'SCHET'
    end
    object qurSchetDAT2: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 13
      FieldName = 'DAT'
      DisplayFormat = 'dd.mm.yy'
    end
    object qurSchetIZG: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      DisplayWidth = 15
      FieldName = 'IZG'
      Size = 45
    end
    object qurSchetZAK: TStringField
      DisplayLabel = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100
      DisplayWidth = 27
      FieldName = 'ZAK'
      Size = 45
    end
    object qurSchetAUTHER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      DisplayWidth = 10
      FieldName = 'AUTHER'
      Size = 30
    end
    object qurSchetNDS2: TFMTBCDField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 19
      FieldName = 'NDS'
      DisplayFormat = '0.00'
    end
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'frmSchetList'
    StorageManager = RegPropStorageManEh1
    Left = 208
    Top = 32
  end
  object RegPropStorageManEh1: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 240
    Top = 32
  end
end
