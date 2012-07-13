object frmOtpravka: TfrmOtpravka
  Left = 548
  Top = 287
  BorderStyle = bsDialog
  Caption = #1054#1090#1087#1088#1072#1074#1082#1080' '#1089#1086' '#1089#1082#1083#1072#1076#1072
  ClientHeight = 374
  ClientWidth = 597
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 400
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
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 193
    Width = 597
    Height = 8
    Cursor = crVSplit
    Align = alTop
    Beveled = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 597
    Height = 193
    Align = alTop
    BevelOuter = bvNone
    Constraints.MinHeight = 193
    TabOrder = 0
    DesignSize = (
      597
      193)
    object dbgSklost: TDBGridEh
      Left = 0
      Top = 0
      Width = 492
      Height = 193
      AllowedOperations = [alopInsertEh, alopUpdateEh, alopAppendEh]
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsSklost
      EditActions = [geaSelectAllEh]
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight]
      PopupMenu = PopSklost
      SortLocal = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = dbgSklostDblClick
      OnKeyUp = dbgSklostKeyUp
      Columns = <
        item
          EditButtons = <>
          FieldName = 'ID'
          Footers = <>
          ReadOnly = True
          Width = 49
        end
        item
          EditButtons = <>
          FieldName = 'DAT'
          Footers = <>
          ReadOnly = True
        end
        item
          EditButtons = <>
          FieldName = 'COMMENT'
          Footers = <>
          ReadOnly = True
        end
        item
          EditButtons = <>
          FieldName = 'SKLAD'
          Footers = <>
          ReadOnly = True
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'ID_NAKL'
          Footers = <>
          Visible = False
        end>
    end
    object Panel2: TPanel
      Left = 496
      Top = 2
      Width = 98
      Height = 191
      Anchors = [akTop, akRight]
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        98
        191)
      object BitBtn3: TBitBtn
        Left = 0
        Top = 1
        Width = 98
        Height = 24
        Action = actPrint
        Anchors = [akLeft, akRight, akBottom]
        Caption = #1055#1088#1086#1089#1084#1086#1090#1088
        TabOrder = 3
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF00000000000000000000000000000000
          0000000000000000000000000000000000FF00FFFF00FFFF00FFFF00FF000000
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6000000C6C6
          C6000000FF00FFFF00FF00000000000000000000000000000000000000000000
          0000000000000000000000000000000000C6C6C6000000FF00FF000000C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C600FFFF00FFFF00FFFFC6C6C6C6C6C60000
          00000000000000FF00FF000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C684
          8484848484848484C6C6C6C6C6C6000000C6C6C6000000FF00FF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00C6C6C6C6C6C6000000000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6000000C6C6C6000000C6C6C6000000FF00FF000000
          000000000000000000000000000000000000000000000000000000C6C6C60000
          00C6C6C6000000000000FF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF000000C6C6C6000000C6C6C6000000FF00FFFF00FF
          FF00FF000000FFFFFF000000000000000000000000000000FFFFFF0000000000
          00000000000000FF00FFFF00FFFF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF000000FFFFFF000000000000000000000000000000FFFFFF0000
          00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF0000000000000000000000000000000000000000000000
          00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      end
      object BitBtn1: TBitBtn
        Left = 0
        Top = 24
        Width = 98
        Height = 25
        Action = actRefresh
        Anchors = [akLeft, akTop, akRight]
        Caption = #1054#1073#1085#1086#1074#1080#1090#1100
        TabOrder = 0
        Kind = bkRetry
      end
      object btnSettings: TBitBtn
        Left = 0
        Top = 48
        Width = 98
        Height = 25
        Action = actSettings
        Anchors = [akLeft, akTop, akRight]
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
        TabOrder = 2
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
      object dbcClientSelect: TDBComboBoxEh
        Left = 0
        Top = 148
        Width = 97
        Height = 21
        DropDownBox.Rows = 11
        DropDownBox.Width = 200
        EditButtons = <>
        TabOrder = 4
        Text = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1082#1083#1080#1077#1085#1090#1072'>'
        Visible = True
        OnDropDown = dbcClientSelectDropDown
      end
      object BitBtn4: TBitBtn
        Left = 0
        Top = 166
        Width = 98
        Height = 24
        Action = actPrintAct
        Anchors = [akLeft, akRight, akBottom]
        Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1072#1082#1090#1072
        TabOrder = 5
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF00000000000000000000000000000000
          0000000000000000000000000000000000FF00FFFF00FFFF00FFFF00FF000000
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6000000C6C6
          C6000000FF00FFFF00FF00000000000000000000000000000000000000000000
          0000000000000000000000000000000000C6C6C6000000FF00FF000000C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C600FFFF00FFFF00FFFFC6C6C6C6C6C60000
          00000000000000FF00FF000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C684
          8484848484848484C6C6C6C6C6C6000000C6C6C6000000FF00FF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00C6C6C6C6C6C6000000000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6000000C6C6C6000000C6C6C6000000FF00FF000000
          000000000000000000000000000000000000000000000000000000C6C6C60000
          00C6C6C6000000000000FF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF000000C6C6C6000000C6C6C6000000FF00FFFF00FF
          FF00FF000000FFFFFF000000000000000000000000000000FFFFFF0000000000
          00000000000000FF00FFFF00FFFF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF000000FFFFFF000000000000000000000000000000FFFFFF0000
          00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF0000000000000000000000000000000000000000000000
          00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      end
      object BitBtn5: TBitBtn
        Left = 0
        Top = 72
        Width = 98
        Height = 25
        Action = actPost
        Anchors = [akLeft, akTop, akRight]
        Caption = #1055#1088#1086#1074#1077#1089#1090#1080
        TabOrder = 6
      end
      object BitBtn6: TBitBtn
        Left = 0
        Top = 96
        Width = 98
        Height = 25
        Action = actUnPost
        Anchors = [akLeft, akTop, akRight]
        Caption = #1042#1077#1088#1085#1091#1090#1100
        TabOrder = 7
      end
      object BitBtn2: TBitBtn
        Left = 0
        Top = 120
        Width = 98
        Height = 25
        Action = actDetail
        Anchors = [akLeft, akTop, akRight]
        Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
        ModalResult = 5
        TabOrder = 1
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
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 201
    Width = 597
    Height = 173
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object dbgGrid2: TDBGridEh
      Left = 0
      Top = 0
      Width = 597
      Height = 173
      Align = alClient
      DataSource = dsSklostt
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      PopupMenu = popSklostt
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = dbgGrid2DblClick
      OnKeyUp = dbgGrid2KeyUp
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
          Width = 25
        end>
    end
  end
  object sdsSklost: TSQLDataSet
    CommandText = 
      'select '#13#10'  om.id_nakl,'#13#10'  om.id,'#13#10'  om.dat,'#13#10'  om.comment,'#13#10'  om' +
      '.delmarked,'#13#10'  om.id_sklad'#13#10'from '#13#10'  OTPRAVKI_VW om'#13#10'where '#13#10'  o' +
      'm.delmarked=0'#13#10'order by '#13#10'  om.dat,om.id,om.id_nakl'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdEx.scUchet
    Left = 8
    Top = 32
    object sdsSklostID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsSklostID: TStringField
      FieldName = 'ID'
    end
    object sdsSklostDAT: TSQLTimeStampField
      FieldName = 'DAT'
      Required = True
    end
    object sdsSklostCOMMENT: TStringField
      FieldName = 'COMMENT'
      Size = 50
    end
    object sdsSklostDELMARKED: TSmallintField
      FieldName = 'DELMARKED'
      Required = True
    end
    object sdsSklostID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
      Required = True
    end
  end
  object sdsSklostt: TSQLDataSet
    CommandText = 
      'select '#13#10'  ot.id_nakl,'#13#10'  ot.id_nakld,'#13#10'  ot.id_pos,'#13#10'  om.id,'#13#10 +
      '  om.dat,'#13#10'  om.id_izg,'#13#10'  om.id_zak,'#13#10'  om.id_manager,'#13#10'  om.bl' +
      'ocked,'#13#10'  om.posted,'#13#10'  om.nds'#13#10'from '#13#10'  OTPRAVKIT_VW ot '#13#10'     ' +
      'inner join NAKLO om on om.id_nakl=ot.id_pos    '#13#10'where '#13#10'  ot.id' +
      '_nakl=:id_nakl'#13#10'  and om.delmarked=0'#13#10'order by'#13#10'  ot.id_nakld'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_nakl'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 40
    Top = 32
    object sdsSklosttID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      Required = True
    end
    object sdsSklosttID_NAKLD: TIntegerField
      FieldName = 'ID_NAKLD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsSklosttID_POS: TIntegerField
      FieldName = 'ID_POS'
      Required = True
    end
    object sdsSklosttID: TStringField
      FieldName = 'ID'
      ProviderFlags = [pfInWhere]
    end
    object sdsSklosttDAT: TSQLTimeStampField
      FieldName = 'DAT'
      ProviderFlags = [pfInWhere]
      Required = True
    end
    object sdsSklosttID_IZG: TIntegerField
      FieldName = 'ID_IZG'
      ProviderFlags = [pfInWhere]
      Required = True
    end
    object sdsSklosttID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
      ProviderFlags = [pfInWhere]
      Required = True
    end
    object sdsSklosttID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
      ProviderFlags = [pfInWhere]
      Required = True
    end
    object sdsSklosttBLOCKED: TSmallintField
      FieldName = 'BLOCKED'
      ProviderFlags = [pfInWhere]
      Required = True
    end
    object sdsSklosttPOSTED: TSmallintField
      FieldName = 'POSTED'
      ProviderFlags = [pfInWhere]
      Required = True
    end
    object sdsSklosttNDS: TFMTBCDField
      FieldName = 'NDS'
      Precision = 15
    end
  end
  object dspSklost: TDataSetProvider
    DataSet = sdsSklost
    Options = [poPropogateChanges, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspSklostBeforeUpdateRecord
    Left = 8
    Top = 72
  end
  object dspSklostt: TDataSetProvider
    DataSet = sdsSklostt
    Options = [poPropogateChanges, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspSklosttBeforeUpdateRecord
    Left = 40
    Top = 72
  end
  object cdsSklost: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_NAKL'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ID'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DAT'
        Attributes = [faRequired]
        DataType = ftTimeStamp
      end
      item
        Name = 'COMMENT'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'DELMARKED'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'ID_SKLAD'
        Attributes = [faRequired]
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspSklost'
    StoreDefs = True
    AfterInsert = cdsSklostAfterInsert
    BeforeScroll = cdsSklostBeforeScroll
    OnReconcileError = cdsSklostReconcileError
    Left = 8
    Top = 104
    object cdsSklostID_NAKL: TIntegerField
      DisplayWidth = 6
      FieldName = 'ID_NAKL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object cdsSklostID: TStringField
      DisplayLabel = #8470#1086#1090#1087#1088
      DisplayWidth = 13
      FieldName = 'ID'
    end
    object cdsSklostDAT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 16
      FieldName = 'DAT'
      Required = True
      DisplayFormat = 'dd.mm.yy'
    end
    object cdsSklostCOMMENT: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1086#1090#1087#1088#1072#1074#1082#1080
      DisplayWidth = 38
      FieldName = 'COMMENT'
      Size = 50
    end
    object cdsSklostDELMARKED: TSmallintField
      DisplayWidth = 4
      FieldName = 'DELMARKED'
      Required = True
      Visible = False
    end
    object cdsSklostID_SKLAD: TIntegerField
      DisplayWidth = 10
      FieldName = 'ID_SKLAD'
      Required = True
      Visible = False
    end
    object cdsSklostSKLAD: TStringField
      DisplayLabel = #1057#1082#1083#1072#1076
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'SKLAD'
      LookupDataSet = dmdEx.cdsSklads
      LookupKeyFields = 'OID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_SKLAD'
      Lookup = True
    end
  end
  object cdsSklostt: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_NAKL;ID_NAKLD'
    MasterFields = 'ID_NAKL'
    MasterSource = dsSklost
    PacketRecords = 0
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_OST'
        ParamType = ptInput
      end>
    ProviderName = 'dspSklostt'
    AfterInsert = cdsSklosttAfterInsert
    OnReconcileError = cdsSklosttReconcileError
    Left = 40
    Top = 104
    object cdsSklosttID: TStringField
      DisplayLabel = #8470#1085#1072#1082#1083
      FieldName = 'ID'
      Size = 10
    end
    object cdsSklosttDAT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 10
      FieldName = 'DAT'
      Required = True
      DisplayFormat = 'dd.mm.yy'
    end
    object cdsSklosttIZG: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      FieldKind = fkLookup
      FieldName = 'IZG'
      LookupDataSet = dmdEx.cdsVlad
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_IZG'
      Size = 50
      Lookup = True
    end
    object cdsSklosttZAK: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      FieldKind = fkLookup
      FieldName = 'ZAK'
      LookupDataSet = dmdEx.cdsClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_ZAK'
      Size = 50
      Lookup = True
    end
    object cdsSklosttMANAGER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'MANAGER'
      LookupDataSet = dmdEx.cdsManager
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_MANAGER'
      Size = 30
      Lookup = True
    end
    object cdsSklosttNDS: TFMTBCDField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 10
      FieldName = 'NDS'
      DisplayFormat = '0.00'
      Precision = 15
    end
    object cdsSklosttID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      Required = True
      Visible = False
    end
    object cdsSklosttID_NAKLD: TIntegerField
      FieldName = 'ID_NAKLD'
      Required = True
      Visible = False
    end
    object cdsSklosttID_POS: TIntegerField
      FieldName = 'ID_POS'
      Required = True
      Visible = False
    end
    object cdsSklosttID_IZG: TIntegerField
      FieldName = 'ID_IZG'
      Required = True
      Visible = False
    end
    object cdsSklosttID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
      Required = True
      Visible = False
    end
    object cdsSklosttBLOCKED: TSmallintField
      DisplayLabel = #1041#1083#1086#1082
      DisplayWidth = 3
      FieldName = 'BLOCKED'
      Required = True
    end
    object cdsSklosttID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
      Required = True
      Visible = False
    end
    object cdsSklosttPOSTED: TSmallintField
      DisplayLabel = #1055#1088#1086#1074#1077#1076#1077#1085#1086
      FieldName = 'POSTED'
      Required = True
      Visible = False
    end
  end
  object dsSklost: TDataSource
    DataSet = cdsSklost
    Left = 8
    Top = 136
  end
  object dsSklostt: TDataSource
    DataSet = cdsSklostt
    Left = 40
    Top = 136
  end
  object MainMenu1: TMainMenu
    Left = 72
    Top = 96
    object N1: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      GroupIndex = 10
      object mnuRefresh: TMenuItem
        Action = actRefresh
      end
      object N4: TMenuItem
        Action = actPrint
      end
      object N2: TMenuItem
        Action = actSettings
      end
      object N8: TMenuItem
        Action = actDebug
      end
    end
  end
  object ActionList1: TActionList
    Images = dmdEx.ImageList1
    Left = 72
    Top = 64
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ShortCut = 116
      OnExecute = actRefreshExecute
    end
    object actRecalcPosit: TAction
      Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1087#1086#1079#1080#1094#1080#1102
    end
    object actDetail: TAction
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      ImageIndex = 5
      ShortCut = 120
      OnExecute = actDetailExecute
    end
    object actSettings: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      ImageIndex = 8
      OnExecute = actSettingsExecute
    end
    object actCopy: TAction
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
    end
    object actPrint: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      ImageIndex = 1
      ShortCut = 16471
      OnExecute = actPrintExecute
    end
    object actGrid1ListShow: TAction
      Caption = 'actGrid1ListShow'
      OnExecute = actGrid1ListShowExecute
    end
    object actGrid2ListShow: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1086#1090#1087#1088#1072#1074#1082#1080
      OnExecute = actGrid2ListShowExecute
    end
    object actPrintAct: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1072#1082#1090#1072
      ImageIndex = 1
      OnExecute = actPrintActExecute
    end
    object actPost: TAction
      Caption = #1055#1088#1086#1074#1077#1089#1090#1080
      OnExecute = actPostExecute
    end
    object actUnPost: TAction
      Caption = #1042#1077#1088#1085#1091#1090#1100
      OnExecute = actUnPostExecute
    end
    object actDebug: TAction
      Caption = #1056#1077#1078#1080#1084' '#1086#1090#1083#1072#1076#1082#1080
      OnExecute = actDebugExecute
    end
  end
  object qeSklostt: TQueryExtender
    Query = cdsSklostt
    Left = 40
    Top = 168
  end
  object qeSklost: TQueryExtender
    SlaveQueryExtender = qeSklostt
    Query = cdsSklost
    KeyField = 'id_nakl'
    Left = 8
    Top = 168
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmOtpravka'
    StorageManager = rpsClientEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      '<P>.WindowState'
      'Panel1.<P>.Height'
      'Panel1.dbgSklost.<P>.Columns.<ForAllItems>.Width'
      'Panel3.dbgGrid2.<P>.Columns.<ForAllItems>.Width')
    Left = 144
    Top = 32
  end
  object rpsClientEdit: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 176
    Top = 32
  end
  object PopSklost: TPopupMenu
    Images = dmdEx.ImageList1
    Left = 72
    Top = 128
    object N3: TMenuItem
      Action = actPrint
    end
    object N5: TMenuItem
      Action = actRefresh
    end
    object N6: TMenuItem
      Action = actSettings
    end
  end
  object ufSklost: TUnfFilter
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
    Left = 8
    Top = 200
  end
  object frReport: TfrxReport
    Version = '3.23.7'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38985.431221238400000000
    ReportOptions.LastChange = 38985.431255243100000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Band2OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Band2, Engine do'
      '  begin'
      ' TIP2 := '#39#1085#1077#1080#1079#1074#1077#1089#1090#1085#1086#39' ;'
      ' if ["TIP"] = 0 then begin'
      '   TIP2 := '#39#1085#1077#1090' '#1082#1072#1073#1077#1083#1103#39' ;'
      ' end;'
      ' if ["TIP"] = 1 then begin'
      '   TIP2 := '#39#1087#1088#1080#1093#1086#1076#39' ;'
      ' end;'
      ' if (["TIP"] = 2) or'
      '  (["TIP"] = 8) or'
      '  (["TIP"] = 11) or'
      '  (["TIP"] = 14) then begin'
      '   TIP2 := '#39#1094#1077#1083#1080#1082#1086#1084#39' ;'
      ' end;'
      ' if (["TIP"] = 3) or'
      '  (["TIP"] = 9) or'
      '  (["TIP"] = 12) or'
      '  (["TIP"] = 15)  then begin'
      '   TIP2 := '#39#1089#1084#1086#1090#1082#1072#39';'
      ' end;'
      ' if (["TIP"] = 4) or'
      '  (["TIP"] = 10) or'
      '  (["TIP"] = 13) or'
      '  (["TIP"] = 16) then begin'
      '   TIP2 := '#39#1085#1072#1084#1086#1090#1082#1072#39';'
      ' end;'
      ' if (["TIP"] = 5) then begin'
      '   TIP2 := '#39#1080#1079#1083#1080#1096#1077#1082#39';'
      ' end;'
      '  end'
      'end;'
      ''
      'procedure Memo47OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo47, Engine do'
      '  begin'
      '  if ([UPPERCASE(TIP2)]='#39#1062#1045#1051#1048#1050#1054#1052#39') then begin'
      '    PRIM := ["NOMER_TARY"];'
      '  end;'
      '  if ([UPPERCASE(TIP2)]='#39#1057#1052#1054#1058#1050#1040#39') then begin'
      '    PRIM := '#39'c '#39'+'
      '      [FORMATFLOAT('#39'0.000'#39' , ["KOLOTP_ITOG"])]+'
      '      '#39' '#39'+ ["nomer_tary_itog"];'
      '  end;'
      '  if ([UPPERCASE(TIP2)]='#39#1053#1040#1052#1054#1058#1050#1040#39') then begin'
      '    PRIM := '#39'c '#39'+'
      '      [FORMATFLOAT('#39'0.000'#39', ["KOLOTP_ITOG"])]+'
      '      '#39' '#39'+ ["nomer_tary_itog"];'
      '  end;'
      '  if ([UPPERCASE(["TARA"])]='#39' '#1041#1059#1061#1058#1040#39') then begin'
      '    PRIM := PRIM + '#39' '#39' + [COPY(["IZG_ITOG"],0,4)];'
      '  end;'
      '  end'
      'end;'
      ''
      'begin'
      ''
      'end.')
    StoreInDFM = False
    Left = 240
    Top = 128
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object sdsDelmark: TSQLDataSet
    CommandText = 'DELMARK_OBJECT_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'OID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CLASSID'
        ParamType = ptInput
        Value = 3042
      end>
    SQLConnection = dmdEx.scUchet
    Left = 208
    Top = 32
  end
  object dspReport: TDataSetProvider
    DataSet = sdsReport
    Left = 240
    Top = 64
  end
  object cdsReport: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_nakl'
        ParamType = ptInput
        Value = 3598
      end>
    ProviderName = 'dspReport'
    Left = 240
    Top = 96
    object cdsReportID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
      Visible = False
    end
    object cdsReportID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
      Visible = False
    end
    object cdsReportID_TARA: TIntegerField
      FieldName = 'ID_TARA'
      Visible = False
    end
    object cdsReportNOMER_TARY: TStringField
      DisplayWidth = 50
      FieldName = 'NOMER_TARY'
      Size = 50
    end
    object cdsReportKOLOTP: TFMTBCDField
      FieldName = 'KOLOTP'
      Precision = 15
      Size = 8
    end
    object cdsReportKOLBUXT: TIntegerField
      FieldName = 'KOLBUXT'
    end
    object cdsReportTIP: TIntegerField
      FieldName = 'TIP'
    end
    object cdsReportKOLOTP_ITOG: TFMTBCDField
      FieldName = 'KOLOTP_ITOG'
      Precision = 15
      Size = 8
    end
    object cdsReportID_TARA_ITOG: TIntegerField
      FieldName = 'ID_TARA_ITOG'
      Visible = False
    end
    object cdsReportNOMER_TARY_ITOG: TStringField
      FieldName = 'NOMER_TARY_ITOG'
      Size = 30
    end
    object cdsReportTOVAR: TStringField
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'TOVAR'
      LookupDataSet = dmdEx.cdsTovar
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_TOVAR'
      Size = 50
      Lookup = True
    end
    object cdsReportEDIZ: TStringField
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'EDIZ'
      LookupDataSet = dmdEx.cdsTovar
      LookupKeyFields = 'ID'
      LookupResultField = 'EDIZ'
      KeyFields = 'ID_TOVAR'
      Size = 50
      Lookup = True
    end
    object cdsReportTARA: TStringField
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'TARA'
      LookupDataSet = dmdEx.cdsTara
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_TARA'
      Size = 50
      Lookup = True
    end
    object cdsReportTARA_ITOG: TStringField
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'TARA_ITOG'
      LookupDataSet = dmdEx.cdsTara
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_TARA_ITOG'
      Size = 50
      Lookup = True
    end
    object cdsReportID_IZG_ITOG: TIntegerField
      FieldName = 'ID_IZG_ITOG'
    end
    object cdsReportIZG_ITOG: TStringField
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'IZG_ITOG'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_IZG_ITOG'
      Size = 50
      Lookup = True
    end
    object cdsReportCOMMENT: TStringField
      FieldName = 'COMMENT'
      Size = 50
    end
    object cdsReportPRIM: TStringField
      FieldName = 'PRIM'
      Size = 100
    end
    object cdsReportTIP2: TStringField
      FieldName = 'TIP2'
      Size = 50
    end
    object cdsReportZAK: TStringField
      FieldName = 'ZAK'
      Size = 50
    end
  end
  object sdsReport: TSQLDataSet
    CommandText = 
      'select'#13#10'  id_zak,id_tovar,'#13#10'  id_tara,nomer_tary,'#13#10'  kolotp,kolb' +
      'uxt,'#13#10'  tip,kolotp_itog,'#13#10'  id_tara_itog,nomer_tary_itog,'#13#10'  id_' +
      'izg_itog,'#13#10'  comment,'#13#10'  prim,tip2,'#13#10'  zak'#13#10'from'#13#10'  rep_otpravki' +
      '_pc(:id_nakl)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'id_nakl'
        ParamType = ptInput
        Value = '0'
      end>
    SQLConnection = dmdEx.scUchet
    Left = 240
    Top = 32
  end
  object frdsReport: TfrxDBDataset
    UserName = 'frdsReport'
    CloseDataSource = False
    DataSet = cdsReport
    Left = 240
    Top = 160
  end
  object sdsReportAct: TSQLDataSet
    CommandText = 
      'select'#13#10'  id_zak,id_tovar,'#13#10'  id_tara,nomer_tary,'#13#10'  kolotp,kolb' +
      'uxt,'#13#10'  tip,kolotp_itog,'#13#10'  id_tara_itog,nomer_tary_itog,'#13#10'  id_' +
      'izg_itog,'#13#10'  comment,'#13#10'  prim,'#13#10'  tip2,'#13#10'  zak'#13#10'from'#13#10'  rep_act_' +
      'pc(:id_nakl,:id_zak2)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_nakl'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'id_zak2'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = dmdEx.scUchet
    Left = 272
    Top = 32
  end
  object dspReportAct: TDataSetProvider
    DataSet = sdsReportAct
    UpdateMode = upWhereKeyOnly
    Left = 272
    Top = 64
  end
  object cdsReportAct: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_nakl'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'id_zak2'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspReportAct'
    Left = 272
    Top = 96
    object cdsReportActTOVAR: TStringField
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'TOVAR'
      LookupDataSet = dmdEx.cdsTovar
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_TOVAR'
      Size = 50
      Lookup = True
    end
    object cdsReportActEDIZ: TStringField
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'EDIZ'
      LookupDataSet = dmdEx.cdsTovar
      LookupKeyFields = 'ID'
      LookupResultField = 'EDIZ'
      KeyFields = 'ID_TOVAR'
      Size = 50
      Lookup = True
    end
    object cdsReportActTARA: TStringField
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'TARA'
      LookupDataSet = dmdEx.cdsTara
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_TARA'
      Size = 50
      Lookup = True
    end
    object cdsReportActTARA_ITOG: TStringField
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'TARA_ITOG'
      LookupDataSet = dmdEx.cdsTara
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_TARA_ITOG'
      Size = 50
      Lookup = True
    end
    object cdsReportActIZG_ITOG: TStringField
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'IZG_ITOG'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_IZG_ITOG'
      Size = 50
      Lookup = True
    end
    object cdsReportActID_ZAK: TIntegerField
      FieldName = 'ID_ZAK'
    end
    object cdsReportActID_TOVAR: TIntegerField
      FieldName = 'ID_TOVAR'
    end
    object cdsReportActID_TARA: TIntegerField
      FieldName = 'ID_TARA'
    end
    object cdsReportActNOMER_TARY: TStringField
      FieldName = 'NOMER_TARY'
      Size = 30
    end
    object cdsReportActKOLOTP: TFMTBCDField
      FieldName = 'KOLOTP'
      Precision = 15
      Size = 8
    end
    object cdsReportActKOLBUXT: TIntegerField
      FieldName = 'KOLBUXT'
    end
    object cdsReportActTIP: TIntegerField
      FieldName = 'TIP'
    end
    object cdsReportActKOLOTP_ITOG: TFMTBCDField
      FieldName = 'KOLOTP_ITOG'
      Precision = 15
      Size = 8
    end
    object cdsReportActID_TARA_ITOG: TIntegerField
      FieldName = 'ID_TARA_ITOG'
    end
    object cdsReportActNOMER_TARY_ITOG: TStringField
      FieldName = 'NOMER_TARY_ITOG'
      Size = 30
    end
    object cdsReportActID_IZG_ITOG: TIntegerField
      FieldName = 'ID_IZG_ITOG'
    end
    object cdsReportActCOMMENT: TStringField
      FieldName = 'COMMENT'
      Size = 50
    end
    object cdsReportActPRIM: TStringField
      FieldName = 'PRIM'
      Size = 100
    end
    object cdsReportActTIP2: TStringField
      FieldName = 'TIP2'
      Size = 50
    end
    object cdsReportActZAK: TStringField
      FieldName = 'ZAK'
      Size = 50
    end
  end
  object frReportAct: TfrxReport
    Version = '3.23.7'
    DataSet = frdsReportAct
    DataSetName = 'frdsReportAct'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38981.611009861110000000
    ReportOptions.LastChange = 38981.611009861110000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    Left = 272
    Top = 128
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frdsReportAct: TfrxDBDataset
    UserName = 'frdsReportAct'
    CloseDataSource = False
    DataSet = cdsReportAct
    Left = 272
    Top = 160
  end
  object sdsPost: TSQLDataSet
    CommandText = 'NAKLO_POST_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_NAKL'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 304
    Top = 32
  end
  object sdsUnpost: TSQLDataSet
    CommandText = 'NAKLO_UNPOST_PC'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_nakl'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = dmdEx.scUchet
    Left = 304
    Top = 64
  end
  object popSklostt: TPopupMenu
    Images = dmdEx.ImageList1
    Left = 72
    Top = 160
    object actGrid2ListShow1: TMenuItem
      Action = actGrid2ListShow
      Default = True
    end
    object N7: TMenuItem
      Action = actDetail
    end
  end
  object frdNaklo: TfrxDBDataset
    UserName = 'frdNaklo'
    CloseDataSource = False
    DataSet = cdsSklost
    Left = 8
    Top = 232
  end
  object frdNaklot: TfrxDBDataset
    UserName = 'frdNaklot'
    CloseDataSource = False
    DataSet = cdsSklostt
    Left = 40
    Top = 232
  end
  object frxGIFExport1: TfrxGIFExport
    UseFileCache = True
    ShowProgress = True
    Monochrome = True
    Left = 304
    Top = 128
  end
  object ufSklostt: TUnfFilter
    DBGridEh = dbgGrid2
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
    Left = 40
    Top = 200
  end
end
