object frmOtpravkatEdit: TfrmOtpravkatEdit
  Left = 91
  Top = 108
  Width = 526
  Height = 405
  Anchors = [akLeft, akTop, akRight]
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1086#1090#1087#1088#1072#1074#1082#1080' '#1089#1086' '#1089#1082#1083#1072#1076#1072
  Color = clBtnFace
  Constraints.MinWidth = 526
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 161
    Width = 518
    Height = 8
    Cursor = crVSplit
    Align = alTop
    Beveled = True
  end
  object Panel2: TPanel
    Left = 0
    Top = 169
    Width = 518
    Height = 209
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      518
      209)
    object BitBtn3: TBitBtn
      Left = 16
      Top = 176
      Width = 129
      Height = 25
      Action = actOk
      Anchors = [akLeft, akRight, akBottom]
      Caption = 'Ok'
      Default = True
      TabOrder = 0
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
    object BitBtn4: TBitBtn
      Left = 195
      Top = 176
      Width = 129
      Height = 25
      Action = actCancel
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      Constraints.MaxWidth = 129
      Constraints.MinWidth = 129
      TabOrder = 1
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
    object BitBtn5: TBitBtn
      Left = 382
      Top = 176
      Width = 126
      Height = 25
      Action = actApply
      Anchors = [akRight, akBottom]
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      Default = True
      TabOrder = 2
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
    object GroupBox2: TGroupBox
      Left = 0
      Top = 24
      Width = 518
      Height = 135
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = #1054#1090#1075#1088#1091#1079#1082#1080' '#1089#1086#1089#1090#1072#1074#1083#1103#1102#1097#1080#1077' '#1076#1072#1085#1085#1091#1102' '#1086#1090#1087#1088#1072#1074#1082#1091
      TabOrder = 3
      object dbgOtpravkat: TDBGridEh
        Left = 2
        Top = 15
        Width = 514
        Height = 118
        Align = alClient
        DataSource = dsNakloEdit
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            EditButtons = <>
            FieldName = 'ID'
            Footers = <>
            ReadOnly = False
            Width = 47
          end
          item
            EditButtons = <>
            FieldName = 'DAT'
            Footers = <>
            ReadOnly = False
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'IZG'
            Footers = <>
            ReadOnly = False
            Width = 129
          end
          item
            EditButtons = <>
            FieldName = 'ZAK'
            Footers = <>
            ReadOnly = False
          end
          item
            EditButtons = <>
            FieldName = 'MANAGER'
            Footers = <>
            ReadOnly = False
            Width = 101
          end
          item
            EditButtons = <>
            FieldName = 'NDS'
            Footers = <>
          end
          item
            Checkboxes = True
            EditButtons = <>
            FieldName = 'BLOCKED'
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
            ReadOnly = False
            Width = 28
          end
          item
            Checkboxes = True
            EditButtons = <>
            FieldName = 'POSTED'
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
            Width = 23
          end>
      end
    end
    object btnAdd: TBitBtn
      Left = 48
      Top = 0
      Width = 153
      Height = 25
      Action = actAdd
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1086#1090#1087#1088#1072#1074#1082#1091
      TabOrder = 4
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF0000FF0000FF0000FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF0000FF0000FF
        0000FF0000FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF00FFFF00FFFF00FFFF00FFFF0000FF0000FF00FFFF00FFFF0000FF0000FF
        0000FF0000FF0000FF00FFFF00FFFF0000FF0000FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF0000FF0000FF0000FF0000FF0000FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF0000FF0000FF
        0000FF0000FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF0000FF0000FF0000FF0000FF0000FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF0000FF0000FF
        0000FF0000FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF0000FF0000FF0000FF0000FF0000FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF0000FF0000FF
        00FFFF0000FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF0000FF00FFFF00FFFF00FFFF0000FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object btnRemove: TBitBtn
      Left = 333
      Top = 0
      Width = 137
      Height = 25
      Action = actRemove
      Anchors = [akTop, akRight]
      Caption = #1059#1073#1088#1072#1090#1100' '#1080#1079' '#1086#1090#1087#1088#1072#1074#1082#1080
      TabOrder = 5
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FFFF00FFFF
        00FFFF00FF0000FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0000FF0000FFFF00FF0000FF0000FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF0000FF00
        00FF0000FF0000FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0000FF0000FF0000FF0000FF0000FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF0000FF00
        00FF0000FF0000FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0000FF0000FF0000FF0000FF0000FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF0000FF00
        00FF0000FF0000FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF
        0000FFFF00FFFF00FF0000FF0000FF0000FF0000FF0000FFFF00FFFF00FF0000
        FF0000FFFF00FFFF00FFFF00FFFF00FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0000FF0000FF0000FF0000FF0000FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00
        00FF0000FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF0000FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 518
    Height = 161
    Align = alTop
    Caption = #1054#1090#1075#1088#1091#1079#1082#1080' '#1089#1086' '#1089#1082#1083#1072#1076#1072
    TabOrder = 1
    DesignSize = (
      518
      161)
    object SpeedButton1: TSpeedButton
      Left = 480
      Top = 14
      Width = 33
      Height = 22
      Action = actSettings
      Anchors = [akTop, akRight]
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF0000FF00FFFF00FFFF00FFFF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF0000FF00FFFF0000FF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF0000FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF0000FF0000FF00FF
        FF00FFFF00FFFF00FFFF00FFFF0000FF00FFFF00FFFF0000FF00FFFF00FFFF00
        FFFF00FFFF00FFFF0000FF0000FF00FFFF00FFFF00FFFF0000FF0000FF00FFFF
        00FFFF00FFFF00FFFF0000FF0000FF00FFFF00FFFF00FFFF0000FF0000FF00FF
        FF0000FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        00FF0000FF00FFFF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00FF
        FF0000FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        00FF0000FF00FFFF0000FF0000FF00FFFF00FFFF00FFFF0000FF0000FF00FFFF
        00FFFF00FFFF00FFFF0000FF0000FF00FFFF00FFFF00FFFF0000FF0000FF00FF
        FF00FFFF00FFFF00FFFF00FFFF0000FF00FFFF00FFFF0000FF00FFFF00FFFF00
        FFFF00FFFF00FFFF0000FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF0000FF0000FF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF0000FF00FFFF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF0000FF00FFFF00FFFF00FF
        FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object dbgSklost: TDBGridEh
      Left = 2
      Top = 16
      Width = 471
      Height = 145
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsNaklot
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
          FieldName = 'IZG'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'ZAK'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'MANAGER'
          Footers = <>
        end
        item
          Checkboxes = True
          EditButtons = <>
          FieldName = 'BLOCKED'
          Footers = <>
          KeyList.Strings = (
            '1'
            '0')
        end
        item
          EditButtons = <>
          FieldName = 'COMMENT'
          Footers = <>
        end>
    end
  end
  object ActionList1: TActionList
    Images = dmdEx.ImageList1
    Left = 432
    Top = 88
    object actCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = actCancelExecute
    end
    object actApply: TAction
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      OnExecute = actApplyExecute
    end
    object actOk: TAction
      Caption = 'Ok'
      ShortCut = 16397
      OnExecute = actOkExecute
    end
    object actAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1086#1090#1087#1088#1072#1074#1082#1091
      ImageIndex = 6
      OnExecute = actAddExecute
    end
    object actRemove: TAction
      Caption = #1059#1073#1088#1072#1090#1100' '#1080#1079' '#1086#1090#1087#1088#1072#1074#1082#1080
      ImageIndex = 7
      OnExecute = actRemoveExecute
    end
    object actSettings: TAction
      Hint = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      ImageIndex = 8
      OnExecute = actSettingsExecute
    end
    object actRefresh: TAction
      Caption = 'actRefresh'
      OnExecute = actRefreshExecute
    end
  end
  object sdsNaklo: TSQLDataSet
    CommandText = 
      'select '#13#10'  om.dat,om.id,om.id_nakl,'#13#10'  om.id_izg,om.id_zak,om.id' +
      '_manager,'#13#10'  om.comment,om.blocked,om.posted'#13#10'from '#13#10'  naklo om ' +
      'left join otpravkit_vw ot'#13#10'    on om.id_nakl=ot.id_pos'#13#10'where '#13#10 +
      '  om.id_sklad=:id_sklad and'#13#10'  om.tip in (5,6,103) and'#13#10'  om.del' +
      'marked=0 and'#13#10'  om.posted=0 and ot.id_pos is null'#13#10'order by'#13#10'  o' +
      'm.dat desc, om.id desc, om.id_nakl desc'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_sklad'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = dmdEx.scUchet
    Left = 368
    Top = 88
  end
  object dspNaklo: TDataSetProvider
    DataSet = sdsNaklo
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 368
    Top = 120
  end
  object cdsNaklo: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_sklad'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspNaklo'
    ReadOnly = True
    Left = 368
    Top = 152
    object cdsNakloDAT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 7
      FieldName = 'DAT'
      Required = True
      DisplayFormat = 'dd.mm.yy'
    end
    object cdsNakloID: TStringField
      DisplayLabel = #8470#1085#1072#1082#1083
      DisplayWidth = 6
      FieldName = 'ID'
    end
    object cdsNakloIZG: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      DisplayWidth = 12
      FieldKind = fkLookup
      FieldName = 'IZG'
      LookupDataSet = dmdEx.cdsVlad
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_IZG'
      Size = 50
      Lookup = True
    end
    object cdsNakloZAK: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'ZAK'
      LookupDataSet = dmdEx.cdsClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_ZAK'
      Size = 50
      Lookup = True
    end
    object cdsNakloMANAGER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      DisplayWidth = 9
      FieldKind = fkLookup
      FieldName = 'MANAGER'
      LookupDataSet = dmdEx.cdsManager
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_MANAGER'
      Size = 30
      Lookup = True
    end
    object cdsNakloID_NAKL: TIntegerField
      DisplayWidth = 7
      FieldName = 'ID_NAKL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object cdsNakloID_IZG: TIntegerField
      DisplayWidth = 10
      FieldName = 'ID_IZG'
      Required = True
      Visible = False
    end
    object cdsNakloID_ZAK: TIntegerField
      DisplayWidth = 10
      FieldName = 'ID_ZAK'
      Required = True
      Visible = False
    end
    object cdsNakloID_MANAGER: TIntegerField
      DisplayWidth = 10
      FieldName = 'ID_MANAGER'
      Required = True
      Visible = False
    end
    object cdsNakloBLOCKED: TSmallintField
      DisplayLabel = #1041#1083#1086#1082
      DisplayWidth = 4
      FieldName = 'BLOCKED'
      Required = True
    end
    object cdsNakloCOMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      DisplayWidth = 6
      FieldName = 'COMMENT'
      Size = 50
    end
    object cdsNakloPOSTED: TSmallintField
      FieldName = 'POSTED'
      Required = True
      Visible = False
    end
  end
  object dsNaklot: TDataSource
    DataSet = cdsNaklo
    Left = 368
    Top = 184
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmOtpravkat'
    StorageManager = RegPropStorageManEh1
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      'GroupBox1.<P>.Height'
      'GroupBox1.dbgSklost.<P>.Columns.<ForAllItems>.Width'
      'Panel2.GroupBox2.dbgOtpravkat.<P>.Columns.<ForAllItems>.Width')
    Left = 368
    Top = 56
  end
  object RegPropStorageManEh1: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 400
    Top = 56
  end
  object dsNakloEdit: TDataSource
    Left = 400
    Top = 88
  end
  object qeSklost: TQueryExtender
    Query = cdsNaklo
    KeyField = 'id_nakl'
    Left = 368
    Top = 216
  end
  object UnfFilter1: TUnfFilter
    DBGridEh = dbgSklost
    MTStrings.Find = #1055#1086#1080#1089#1082
    MTStrings.Filter = #1060#1080#1083#1100#1090#1088
    MTStrings.Copy = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
    MTStrings.Paste = #1042#1089#1090#1072#1074#1080#1090#1100
    MTStrings.Restore = #1057#1085#1103#1090#1100' '#1092#1080#1083#1100#1090#1088
    MTStrings.RestoreColumn = #1057#1085#1103#1090#1100' '#1092#1080#1083#1100#1090#1088' c '#1082#1086#1083#1086#1085#1082#1080
    MTStrings.MatchCase = #1059#1095#1080#1090#1099#1074#1072#1090#1100' '#1088#1077#1075#1080#1089#1090#1088
    MTStrings.AnyPartofField = #1042' '#1089#1090#1088#1086#1082#1077
    MTStrings.WholeField = #1057#1090#1088#1086#1082#1072' '#1094#1077#1083#1080#1082#1086#1084
    MTStrings.StartofField = #1042' '#1085#1072#1095#1072#1083#1077' '#1089#1090#1088#1086#1082#1080
    Left = 368
    Top = 24
  end
end
