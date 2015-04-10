object frmClientEdit: TfrmClientEdit
  Left = 508
  Top = 45
  Width = 547
  Height = 494
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1082#1083#1080#1077#1085#1090#1086#1074
  Color = clBtnFace
  Constraints.MinHeight = 494
  Constraints.MinWidth = 547
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    531
    456)
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 531
    Height = 425
    ActivePage = TabSheet1
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    Style = tsFlatButtons
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099
      object AutoPanel1: TAutoPanel
        Left = 0
        Top = 0
        Width = 523
        Height = 394
        AutoChildPosLeft = True
        AutoChildWidth = True
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          523
          394)
        object Panel2: TPanel
          Left = 1
          Top = 192
          Width = 269
          Height = 153
          BevelInner = bvLowered
          TabOrder = 0
          DesignSize = (
            269
            153)
          object Label12: TLabel
            Left = 10
            Top = 4
            Width = 31
            Height = 13
            Caption = #1054#1050#1055#1054
          end
          object Label15: TLabel
            Left = 10
            Top = 28
            Width = 86
            Height = 13
            Caption = #1050#1086#1085#1090#1072#1082#1090#1085#1086#1077' '#1083#1080#1094#1086
          end
          object Label17: TLabel
            Left = 10
            Top = 54
            Width = 50
            Height = 13
            Caption = #1044#1080#1088#1077#1082#1090#1086#1088
          end
          object Label18: TLabel
            Left = 10
            Top = 83
            Width = 79
            Height = 13
            Caption = #1054#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1081
          end
          object Label21: TLabel
            Left = 10
            Top = 105
            Width = 63
            Height = 13
            Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          end
          object DBEdit12: TDBEdit
            Left = 104
            Top = 4
            Width = 158
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'OKPO'
            DataSource = dsKlientEdit
            TabOrder = 0
          end
          object DBEdit15: TDBEdit
            Left = 104
            Top = 28
            Width = 158
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'LICO'
            DataSource = dsKlientEdit
            TabOrder = 1
          end
          object DBEdit17: TDBEdit
            Left = 104
            Top = 52
            Width = 158
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'FIO'
            DataSource = dsKlientEdit
            TabOrder = 2
          end
          object DBEdit21: TDBEdit
            Left = 104
            Top = 100
            Width = 158
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'STAN'
            DataSource = dsKlientEdit
            TabOrder = 3
          end
          object dbcbDelmarked: TDBCheckBox
            Left = 8
            Top = 128
            Width = 185
            Height = 17
            Caption = #1055#1086#1084#1077#1090#1082#1072' '#1085#1072' '#1091#1076#1072#1083#1077#1085#1080#1077
            DataField = 'delmarked'
            DataSource = dsKlientEdit
            TabOrder = 4
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBLookupComboboxEh1: TDBLookupComboboxEh
            Left = 104
            Top = 76
            Width = 157
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'MANAGER'
            DataSource = dsKlientEdit
            DropDownBox.AutoDrop = True
            DropDownBox.Rows = 15
            EditButtons = <>
            TabOrder = 5
            Visible = True
          end
        end
        object GroupBox1: TGroupBox
          Left = 274
          Top = 193
          Width = 257
          Height = 80
          Anchors = [akLeft, akTop, akRight]
          Caption = #1058#1080#1087' '#1092#1080#1088#1084#1099
          TabOrder = 1
          object cbxPost: TCheckBox
            Left = 8
            Top = 16
            Width = 97
            Height = 17
            Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
            TabOrder = 0
          end
          object cbxFirm: TCheckBox
            Left = 8
            Top = 36
            Width = 97
            Height = 17
            Caption = #1053#1072#1096#1072' '#1092#1080#1088#1084#1072
            TabOrder = 1
          end
          object cbxClient: TCheckBox
            Left = 8
            Top = 56
            Width = 97
            Height = 17
            Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100
            TabOrder = 2
          end
        end
        object Panel1: TPanel
          Left = 1
          Top = 0
          Width = 269
          Height = 194
          BevelInner = bvLowered
          TabOrder = 2
          DesignSize = (
            269
            194)
          object Label13: TLabel
            Left = 10
            Top = 80
            Width = 48
            Height = 13
            Caption = #1057#1074#1080#1076'.'#1088#1077#1075'.'
          end
          object Label4: TLabel
            Left = 10
            Top = 56
            Width = 24
            Height = 13
            Caption = #1048#1055#1053
          end
          object Label22: TLabel
            Left = 10
            Top = 32
            Width = 51
            Height = 13
            Caption = #1070#1088'. '#1072#1076#1088#1077#1089
          end
          object Label1: TLabel
            Left = 10
            Top = 8
            Width = 50
            Height = 13
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          end
          object Label2: TLabel
            Left = 10
            Top = 104
            Width = 105
            Height = 33
            AutoSize = False
            Caption = #1055#1086#1083#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' ('#1076#1083#1103' '#1088#1072#1089#1087#1077#1095#1072#1090#1082#1080')'
            WordWrap = True
          end
          object DBEdit1: TDBEdit
            Left = 104
            Top = 8
            Width = 157
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'NAME'
            DataSource = dsKlientEdit
            TabOrder = 0
          end
          object dbeYurAdres: TDBEdit
            Left = 104
            Top = 32
            Width = 157
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'ADRP'
            DataSource = dsKlientEdit
            TabOrder = 1
          end
          object DBEdit5: TDBEdit
            Left = 104
            Top = 56
            Width = 157
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'IPN'
            DataSource = dsKlientEdit
            TabOrder = 2
          end
          object DBEdit13: TDBEdit
            Left = 104
            Top = 80
            Width = 157
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'SVREG'
            DataSource = dsKlientEdit
            TabOrder = 3
          end
          object DBMemo1: TDBMemo
            Left = 104
            Top = 104
            Width = 157
            Height = 41
            Anchors = [akLeft, akTop, akRight]
            DataField = 'FULLNAME'
            DataSource = dsKlientEdit
            TabOrder = 4
          end
          object BitBtn3: TBitBtn
            Left = 8
            Top = 148
            Width = 253
            Height = 21
            Action = actSchet
            Anchors = [akLeft, akTop, akRight]
            Caption = #1041#1072#1085#1082#1086#1074#1089#1082#1080#1077' '#1089#1095#1077#1090#1072
            TabOrder = 5
          end
          object BitBtn1: TBitBtn
            Left = 8
            Top = 170
            Width = 253
            Height = 21
            Action = actDogovor
            Anchors = [akLeft, akTop, akRight]
            Caption = #1044#1086#1075#1086#1074#1086#1088#1072
            TabOrder = 6
          end
        end
        object Panel3: TPanel
          Left = 268
          Top = 0
          Width = 263
          Height = 194
          Anchors = [akLeft, akTop, akRight]
          BevelInner = bvLowered
          TabOrder = 3
          DesignSize = (
            263
            194)
          object Label6: TLabel
            Left = 2
            Top = 26
            Width = 38
            Height = 13
            Caption = #1048#1085#1076#1077#1082#1089
          end
          object Label7: TLabel
            Left = 2
            Top = 50
            Width = 43
            Height = 13
            Caption = #1054#1073#1083#1072#1089#1090#1100
          end
          object Label9: TLabel
            Left = 2
            Top = 122
            Width = 45
            Height = 13
            Caption = #1058#1077#1083#1077#1092#1086#1085
          end
          object Label10: TLabel
            Left = 2
            Top = 146
            Width = 29
            Height = 13
            Caption = #1060#1072#1082#1089
          end
          object Label11: TLabel
            Left = 2
            Top = 2
            Width = 61
            Height = 13
            Caption = #1048#1085#1086#1089#1090#1088#1072#1085#1077#1094
          end
          object Label19: TLabel
            Left = 2
            Top = 98
            Width = 59
            Height = 13
            Caption = #1060#1080#1079'. '#1072#1076#1088#1077#1089
          end
          object Label20: TLabel
            Left = 2
            Top = 74
            Width = 30
            Height = 13
            Caption = #1043#1086#1088#1086#1076
          end
          object Label3: TLabel
            Left = 2
            Top = 170
            Width = 19
            Height = 13
            Caption = 'OID'
          end
          object DBEdit7: TDBEdit
            Left = 92
            Top = 26
            Width = 164
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'INDEXI'
            DataSource = dsKlientEdit
            TabOrder = 0
          end
          object DBEdit8: TDBEdit
            Left = 92
            Top = 50
            Width = 164
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'OBLAST'
            DataSource = dsKlientEdit
            TabOrder = 1
          end
          object DBEdit9: TDBEdit
            Left = 92
            Top = 122
            Width = 164
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'TEL'
            DataSource = dsKlientEdit
            TabOrder = 2
          end
          object DBEdit10: TDBEdit
            Left = 92
            Top = 146
            Width = 164
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'FAX'
            DataSource = dsKlientEdit
            TabOrder = 3
          end
          object DBEdit11: TDBEdit
            Left = 92
            Top = 2
            Width = 164
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'FORIN'
            DataSource = dsKlientEdit
            TabOrder = 4
          end
          object DBEdit19: TDBEdit
            Left = 92
            Top = 98
            Width = 164
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'ADRES'
            DataSource = dsKlientEdit
            TabOrder = 5
          end
          object DBEdit20: TDBEdit
            Left = 92
            Top = 74
            Width = 164
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'GOROD'
            DataSource = dsKlientEdit
            TabOrder = 6
          end
          object dbeOid: TDBEdit
            Left = 92
            Top = 170
            Width = 164
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'ID'
            DataSource = dsKlientEdit
            Enabled = False
            TabOrder = 7
          end
        end
        object DBRadioGroup1: TDBRadioGroup
          Left = 274
          Top = 275
          Width = 257
          Height = 71
          Anchors = [akLeft, akTop, akRight]
          Caption = #1051#1100#1075#1086#1090#1099
          DataField = 'LGOTY'
          DataSource = dsKlientEdit
          Items.Strings = (
            #1041#1077#1079' '#1083#1100#1075#1086#1090
            #1069#1082#1089#1087#1086#1088#1090#1105#1088
            #1053#1077#1087#1083#1072#1090#1077#1083#1100#1097#1080#1082' '#1053#1044#1057)
          TabOrder = 4
          Values.Strings = (
            '0'
            '1'
            '2')
        end
        object GroupBox2: TGroupBox
          Left = 0
          Top = 349
          Width = 531
          Height = 44
          Anchors = [akLeft, akTop, akRight]
          Caption = #1054#1089#1086#1073#1099#1077' '#1085#1072#1083#1086#1075#1086#1074#1099#1077' '#1086#1090#1084#1077#1090#1082#1080
          TabOrder = 5
          object DBCheckBoxEh1: TDBCheckBoxEh
            Left = 8
            Top = 16
            Width = 257
            Height = 17
            Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082' '#1077#1076#1080#1085#1086#1075#1086' '#1085#1072#1083#1086#1075#1072
            DataField = 'PLAT_ED_NALOGA'
            DataSource = dsKlientEdit
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBoxEh2: TDBCheckBoxEh
            Left = 280
            Top = 16
            Width = 257
            Height = 17
            Caption = #1060#1080#1079#1080#1095#1077#1089#1082#1086#1077' '#1083#1080#1094#1086
            DataField = 'IS_FIZLICO'
            DataSource = dsKlientEdit
            TabOrder = 1
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1050#1086#1085#1090#1072#1082#1090#1099
      ImageIndex = 1
      OnShow = TabSheet2Show
      DesignSize = (
        523
        394)
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 0
        Width = 473
        Height = 394
        Align = alLeft
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsContacts
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
        OnDblClick = DBGridEh1DblClick
        OnKeyDown = DBGridEh1KeyDown
        Columns = <
          item
            EditButtons = <>
            FieldName = 'FULLNAME'
            Footers = <>
            MinWidth = 100
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'DOLGNOST'
            Footers = <>
            MinWidth = 70
            Width = 70
          end
          item
            EditButtons = <>
            FieldName = 'WORKPHONE'
            Footers = <>
            MinWidth = 70
            Width = 70
          end
          item
            EditButtons = <>
            FieldName = 'CELLPHONE'
            Footers = <>
            MinWidth = 70
            Width = 70
          end
          item
            EditButtons = <>
            FieldName = 'ADDPHONE'
            Footers = <>
            MinWidth = 70
            Width = 70
          end
          item
            EditButtons = <>
            FieldName = 'EMAIL'
            Footers = <>
            MinWidth = 70
            Width = 70
          end
          item
            Checkboxes = True
            EditButtons = <>
            FieldName = 'PERSONBYDEF'
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
            Width = 15
          end
          item
            EditButtons = <>
            FieldName = 'BIRTHDAY'
            Footers = <>
            MinWidth = 61
            Width = 61
          end
          item
            EditButtons = <>
            FieldName = 'BIRTHPLACE'
            Footers = <>
            MinWidth = 81
            Width = 81
          end
          item
            EditButtons = <>
            FieldName = 'HOBBY'
            Footers = <>
            MinWidth = 50
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'MANAGER'
            Footers = <>
          end>
      end
      object btnInsert: TButton
        Left = 480
        Top = 0
        Width = 59
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        TabOrder = 1
        TabStop = False
        OnClick = btnInsertClick
      end
      object btnEdit: TButton
        Left = 480
        Top = 32
        Width = 59
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        TabOrder = 2
        TabStop = False
        OnClick = btnEditClick
      end
      object btnDelete: TButton
        Left = 481
        Top = 64
        Width = 58
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #1059#1076#1072#1083#1080#1090#1100
        TabOrder = 3
        TabStop = False
        OnClick = btnDeleteClick
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1040#1085#1082#1077#1090#1072'1'
      ImageIndex = 2
      DesignSize = (
        523
        394)
      object Label5: TLabel
        Left = 2
        Top = 8
        Width = 50
        Height = 13
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
      end
      object Label8: TLabel
        Left = 2
        Top = 32
        Width = 51
        Height = 13
        Caption = #1070#1088'. '#1072#1076#1088#1077#1089
      end
      object Label14: TLabel
        Left = 2
        Top = 54
        Width = 59
        Height = 13
        Caption = #1060#1080#1079'. '#1072#1076#1088#1077#1089
      end
      object Label23: TLabel
        Left = 2
        Top = 104
        Width = 83
        Height = 13
        Caption = #1044#1072#1090#1072' '#1086#1089#1085#1086#1074#1072#1085#1080#1103
      end
      object Label24: TLabel
        Left = 2
        Top = 124
        Width = 120
        Height = 13
        Caption = #1053#1072#1083#1080#1095#1080#1077' '#1086#1092#1080#1089#1072', '#1089#1082#1083#1072#1076#1072
      end
      object Label25: TLabel
        Left = 2
        Top = 148
        Width = 79
        Height = 13
        Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074' '#1086#1090
      end
      object Label26: TLabel
        Left = 352
        Top = 152
        Width = 12
        Height = 13
        Caption = #1076#1086
      end
      object Label27: TLabel
        Left = 2
        Top = 172
        Width = 101
        Height = 13
        Caption = #1060#1080#1083#1080#1072#1083#1099' '#1074' '#1075#1086#1088#1086#1076#1072#1093
      end
      object Label28: TLabel
        Left = 2
        Top = 200
        Width = 109
        Height = 13
        Caption = #1056#1086#1076#1080#1090#1077#1083#1100#1089#1082#1072#1103' '#1092#1080#1088#1084#1072
      end
      object Label16: TLabel
        Left = 2
        Top = 80
        Width = 106
        Height = 13
        Caption = #1057#1092#1077#1088#1072' '#1076#1077#1103#1090#1077#1083#1100#1085#1086#1089#1090#1080
      end
      object DBEdit2: TDBEdit
        Left = 128
        Top = 8
        Width = 409
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'NAME'
        DataSource = dsKlientEdit
        TabOrder = 0
      end
      object DBEdit3: TDBEdit
        Left = 128
        Top = 32
        Width = 409
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'ADRP'
        DataSource = dsKlientEdit
        TabOrder = 1
      end
      object DBEdit4: TDBEdit
        Left = 128
        Top = 54
        Width = 409
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'ADRES'
        DataSource = dsKlientEdit
        TabOrder = 2
      end
      object dteDat: TDBDateTimeEditEh
        Left = 128
        Top = 100
        Width = 409
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'DAT_OSNOV'
        DataSource = dsKlientEdit
        EditButtons = <>
        TabOrder = 4
        Visible = True
        EditFormat = 'DD/MM/YY'
      end
      object DBEdit6: TDBEdit
        Left = 128
        Top = 124
        Width = 409
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'OFFICESKLAD'
        DataSource = dsKlientEdit
        TabOrder = 5
      end
      object DBNumberEditEh1: TDBNumberEditEh
        Left = 128
        Top = 148
        Width = 149
        Height = 21
        DataField = 'SOTRUDNIKOV_OT'
        DataSource = dsKlientEdit
        EditButtons = <>
        TabOrder = 6
        Visible = True
      end
      object DBNumberEditEh2: TDBNumberEditEh
        Left = 388
        Top = 148
        Width = 141
        Height = 21
        DataField = 'SOTRUDNIKOV_DO'
        DataSource = dsKlientEdit
        EditButtons = <>
        TabOrder = 7
        Visible = True
      end
      object DBEdit14: TDBEdit
        Left = 128
        Top = 172
        Width = 409
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'FILIALY'
        DataSource = dsKlientEdit
        TabOrder = 8
      end
      object lcbAnalog: TDBLookupComboboxEh
        Left = 128
        Top = 196
        Width = 409
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'ANALOG'
        DataSource = dsKlientEdit
        DropDownBox.AutoDrop = True
        DropDownBox.Rows = 15
        EditButtons = <
          item
            ShortCut = 0
            Style = ebsMinusEh
            OnClick = lcbAnalogEditButtons0Click
          end>
        TabOrder = 9
        Visible = True
      end
      object lcbSfera: TDBLookupComboboxEh
        Left = 128
        Top = 76
        Width = 409
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'SFERA'
        DataSource = dsKlientEdit
        DropDownBox.AutoDrop = True
        DropDownBox.Rows = 15
        EditButtons = <
          item
            ShortCut = 0
            Style = ebsMinusEh
            OnClick = lcbSferaEditButtons0Click
          end
          item
            ShortCut = 0
            Style = ebsPlusEh
            OnClick = lcbSferaEditButtons1Click
          end>
        TabOrder = 3
        Visible = True
      end
    end
    object TabSheet4: TTabSheet
      Caption = #1040#1085#1082#1077#1090#1072'2'
      ImageIndex = 3
      DesignSize = (
        523
        394)
      object Label29: TLabel
        Left = 2
        Top = 4
        Width = 126
        Height = 26
        Caption = #1050#1090#1086' '#1087#1088#1080#1085#1080#1084#1072#1077#1090' '#1088#1077#1096#1077#1085#1080#1103' '#1087#1086' '#1079#1072#1082#1091#1087#1082#1077' '#1087#1088#1086#1076#1091#1082#1094#1080#1080
        WordWrap = True
      end
      object Label30: TLabel
        Left = 0
        Top = 36
        Width = 146
        Height = 13
        Caption = #1050#1072#1082#1086#1081' '#1074#1080#1076' '#1082#1072#1073#1077#1083#1103' '#1087#1086#1082#1091#1087#1072#1077#1090#1077
      end
      object Label31: TLabel
        Left = 0
        Top = 56
        Width = 157
        Height = 26
        Caption = #1054#1073#1098#1105#1084' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080' '#1087#1088#1086#1076#1091#1082#1094#1080#1080' '#1079#1072' '#1087#1088#1086#1096#1083#1099#1081' '#1075#1086#1076
        WordWrap = True
      end
      object Label32: TLabel
        Left = 0
        Top = 84
        Width = 157
        Height = 26
        Caption = #1054#1073#1098#1105#1084' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080' '#1087#1088#1086#1076#1091#1082#1094#1080#1080' '#1079#1072' 6 '#1084#1077#1089#1103#1094#1077#1074' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1075#1086#1076#1072
        WordWrap = True
      end
      object Label33: TLabel
        Left = 0
        Top = 112
        Width = 132
        Height = 26
        Caption = #1050#1090#1086' '#1084#1086#1078#1077#1090' '#1087#1086#1088#1091#1095#1080#1090#1100#1089#1103' '#1079#1072' '#1042#1072#1096#1091' '#1092#1080#1088#1084#1091
        WordWrap = True
      end
      object Label34: TLabel
        Left = 0
        Top = 144
        Width = 131
        Height = 26
        Caption = #1042#1072#1096#1080' '#1080#1084#1077#1102#1097#1080#1077#1089#1103' '#1080' '#1087#1086#1090#1077#1085#1094#1080#1072#1083#1100#1085#1099#1077' '#1087#1072#1088#1090#1085#1105#1088#1099
        WordWrap = True
      end
      object Label35: TLabel
        Left = 0
        Top = 172
        Width = 115
        Height = 13
        Caption = #1054#1089#1085#1086#1074#1085#1099#1077' '#1082#1086#1085#1082#1091#1088#1077#1085#1090#1099
        WordWrap = True
      end
      object Label36: TLabel
        Left = 0
        Top = 196
        Width = 127
        Height = 26
        Caption = #1060#1080#1085#1072#1085#1089#1086#1074#1086#1077' '#1087#1086#1083#1086#1078#1077#1085#1080#1077' '#1092#1080#1088#1084#1099
        WordWrap = True
      end
      object Label37: TLabel
        Left = 0
        Top = 228
        Width = 100
        Height = 13
        Caption = #1044#1077#1083#1086#1074#1072#1103' '#1088#1077#1087#1091#1090#1072#1094#1080#1103
        WordWrap = True
      end
      object Label38: TLabel
        Left = 0
        Top = 252
        Width = 275
        Height = 26
        Caption = 
          #1056#1072#1089#1087#1086#1083#1072#1075#1072#1077#1090' '#1083#1080' '#1042#1072#1096' '#1082#1086#1085#1082#1091#1088#1077#1085#1090' '#1083#1091#1095#1096#1080#1084#1080' '#1086#1090#1074#1077#1090#1072#1084#1080' '#1085#1072' '#1074#1099#1096#1077#1087#1088#1080#1074#1077#1076#1105#1085#1085#1099#1077 +
          ' '#1074#1086#1087#1088#1086#1089#1099', '#1095#1077#1084' '#1042#1099'?'
        WordWrap = True
      end
      object DBEdit16: TDBEdit
        Left = 156
        Top = 4
        Width = 377
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'KTOZAKUPAET'
        DataSource = dsKlientEdit
        TabOrder = 0
      end
      object DBEdit23: TDBEdit
        Left = 156
        Top = 32
        Width = 377
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'KAKOYKABELNUGEN'
        DataSource = dsKlientEdit
        TabOrder = 1
      end
      object DBEdit24: TDBEdit
        Left = 156
        Top = 60
        Width = 377
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'OBJEMZAGOD'
        DataSource = dsKlientEdit
        TabOrder = 2
      end
      object DBEdit25: TDBEdit
        Left = 156
        Top = 88
        Width = 377
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'OBJEMZA6MESYATSEV'
        DataSource = dsKlientEdit
        TabOrder = 3
      end
      object DBEdit26: TDBEdit
        Left = 156
        Top = 116
        Width = 377
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'KTOMOGETPORUCHITSYA'
        DataSource = dsKlientEdit
        TabOrder = 4
      end
      object DBEdit27: TDBEdit
        Left = 156
        Top = 144
        Width = 377
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'VASHIPARTNERY'
        DataSource = dsKlientEdit
        TabOrder = 5
      end
      object DBEdit28: TDBEdit
        Left = 156
        Top = 172
        Width = 377
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'VASHIKONKURENTY'
        DataSource = dsKlientEdit
        TabOrder = 6
      end
      object DBEdit29: TDBEdit
        Left = 156
        Top = 200
        Width = 377
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'FINANSOVOEPOLOGENIE'
        DataSource = dsKlientEdit
        TabOrder = 7
      end
      object DBEdit30: TDBEdit
        Left = 156
        Top = 228
        Width = 377
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'DELOVAYAREPUTACIYA'
        DataSource = dsKlientEdit
        TabOrder = 8
      end
      object DBEdit31: TDBEdit
        Left = 324
        Top = 256
        Width = 209
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'RASPOLAGAETLIKONKURENT'
        DataSource = dsKlientEdit
        TabOrder = 9
      end
    end
    object TabSheet5: TTabSheet
      Caption = #1047#1074#1086#1085#1082#1080
      ImageIndex = 4
      OnShow = TabSheet5Show
      DesignSize = (
        523
        394)
      object DBGridEh2: TDBGridEh
        Left = 0
        Top = 0
        Width = 468
        Height = 394
        Align = alLeft
        DataSource = dsCallHistory
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
        OnDblClick = DBGridEh2DblClick
        OnKeyDown = DBGridEh2KeyDown
        Columns = <
          item
            EditButtons = <>
            FieldName = 'DAT'
            Footers = <>
            MinWidth = 100
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'CONTACT'
            Footers = <>
            MinWidth = 100
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'REASON'
            Footers = <>
            MinWidth = 100
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'RESULT'
            Footers = <>
            MinWidth = 100
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'COMMENT'
            Footers = <>
            MinWidth = 100
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'MANAGER'
            Footers = <>
          end>
      end
      object btnInsertCall: TButton
        Left = 480
        Top = 0
        Width = 59
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        TabOrder = 1
        TabStop = False
        OnClick = btnInsertCallClick
      end
      object btnEditCall: TButton
        Left = 480
        Top = 32
        Width = 59
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        TabOrder = 2
        TabStop = False
        OnClick = btnEditCallClick
      end
      object btnDeleteCall: TButton
        Left = 481
        Top = 64
        Width = 58
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #1059#1076#1072#1083#1080#1090#1100
        TabOrder = 3
        TabStop = False
        OnClick = btnDeleteCallClick
      end
    end
    object TabSheet6: TTabSheet
      Caption = #1062#1077#1085#1099
      ImageIndex = 5
      OnShow = TabSheet6Show
      DesignSize = (
        523
        394)
      object Label39: TLabel
        Left = 10
        Top = 11
        Width = 32
        Height = 13
        Caption = #1055#1088#1072#1081#1089
      end
      object Label40: TLabel
        Left = 10
        Top = 35
        Width = 104
        Height = 13
        Caption = #1057#1082#1080#1076#1086#1095#1085#1072#1103' '#1087#1086#1083#1080#1090#1080#1082#1072
      end
      object Label41: TLabel
        Left = 10
        Top = 59
        Width = 94
        Height = 13
        Caption = #1059#1089#1083#1086#1074#1080#1103' '#1087#1086#1089#1090#1072#1074#1082#1080
      end
      object lcbPrice: TDBLookupComboboxEh
        Left = 124
        Top = 8
        Width = 413
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'ID_PRICE'
        DataSource = dsKlientEdit
        DropDownBox.AutoDrop = True
        DropDownBox.Rows = 15
        EditButtons = <
          item
            Style = ebsMinusEh
            OnClick = lcbPriceEditButtons0Click
          end
          item
            Style = ebsPlusEh
            OnClick = lcbPriceEditButtons1Click
          end>
        KeyField = 'OID'
        ListField = 'NAME'
        ListSource = dmdEx.dsPrice
        TabOrder = 0
        Visible = True
      end
      object lcbSkidka: TDBLookupComboboxEh
        Left = 124
        Top = 32
        Width = 413
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'ID_SKIDKA'
        DataSource = dsKlientEdit
        DropDownBox.AutoDrop = True
        EditButtons = <
          item
            Style = ebsMinusEh
            OnClick = lcbSkidkaEditButtons0Click
          end
          item
            Style = ebsPlusEh
            OnClick = lcbSkidkaEditButtons1Click
          end>
        KeyField = 'OID'
        ListField = 'NAME'
        ListSource = dmdEx.dsSkidka
        TabOrder = 1
        Visible = True
      end
      object lcbUslPostavka: TDBLookupComboboxEh
        Left = 124
        Top = 56
        Width = 413
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'ID_USL_POSTAVKA'
        DataSource = dsKlientEdit
        DropDownBox.AutoDrop = True
        EditButtons = <
          item
            Style = ebsMinusEh
            OnClick = lcbUslPostavkaEditButtons0Click
          end
          item
            Style = ebsPlusEh
            OnClick = lcbUslPostavkaEditButtons1Click
          end>
        KeyField = 'OID'
        ListField = 'NAME'
        ListSource = dmdEx.dsUslPostavka
        TabOrder = 2
        Visible = True
      end
    end
  end
  object btnOk: TBitBtn
    Left = 24
    Top = 433
    Width = 157
    Height = 25
    Action = actOk
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    TabOrder = 1
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
    Left = 296
    Top = 433
    Width = 149
    Height = 25
    Action = actCancel
    Anchors = [akLeft, akBottom]
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
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
  object ActionList1: TActionList
    Left = 224
    Top = 68
    object actOk: TAction
      Caption = 'OK'
      ShortCut = 16397
      OnExecute = actOkExecute
    end
    object actCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = actCancelExecute
    end
    object actSchet: TAction
      Caption = #1041#1072#1085#1082#1086#1074#1089#1082#1080#1077' '#1089#1095#1077#1090#1072
      OnExecute = actSchetExecute
    end
    object actDogovor: TAction
      Caption = #1044#1086#1075#1086#1074#1086#1088#1072
      OnExecute = actDogovorExecute
    end
  end
  object dsKlientEdit: TDataSource
    Left = 224
    Top = 132
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'TfrmClientEdit'
    StorageManager = rpsClientEdit
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      '<P>.WindowState'
      'PageControl1.TabSheet2.DBGridEh1.<P>.Columns.<ForAllItems>.Width'
      'PageControl1.TabSheet5.DBGridEh2.<P>.Columns.<ForAllItems>.Width')
    Left = 224
    Top = 100
  end
  object rpsClientEdit: TRegPropStorageManEh
    Path = 'Software\Eurosystems\Uchet'
    Left = 192
    Top = 68
  end
  object sdsContacts: TSQLDataSet
    CommandText = 
      'select * '#13#10'from CONTACTS_VW c'#13#10'where c.id_klient=:id_klient and'#13 +
      #10'  c.delmarked=0'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_klient'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 160
    Top = 36
    object sdsContactsOID: TIntegerField
      FieldName = 'OID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsContactsNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
    object sdsContactsFULLNAME: TStringField
      FieldName = 'FULLNAME'
      Size = 250
    end
    object sdsContactsDELMARKED: TSmallintField
      FieldName = 'DELMARKED'
      Required = True
    end
    object sdsContactsLASTNAME: TStringField
      FieldName = 'LASTNAME'
      Size = 50
    end
    object sdsContactsFIRSTNAME: TStringField
      FieldName = 'FIRSTNAME'
      Size = 50
    end
    object sdsContactsMIDDLENAME: TStringField
      FieldName = 'MIDDLENAME'
      Size = 50
    end
    object sdsContactsBIRTHDAY: TSQLTimeStampField
      FieldName = 'BIRTHDAY'
    end
    object sdsContactsBIRTHPLACE: TStringField
      FieldName = 'BIRTHPLACE'
      Size = 50
    end
    object sdsContactsID_MARRIAGE: TIntegerField
      FieldName = 'ID_MARRIAGE'
    end
    object sdsContactsCHILDREN: TStringField
      FieldName = 'CHILDREN'
      Size = 50
    end
    object sdsContactsHOBBY: TStringField
      FieldName = 'HOBBY'
      Size = 50
    end
    object sdsContactsWORKPHONE: TStringField
      FieldName = 'WORKPHONE'
      Size = 50
    end
    object sdsContactsCELLPHONE: TStringField
      FieldName = 'CELLPHONE'
      Size = 50
    end
    object sdsContactsADDPHONE: TStringField
      FieldName = 'ADDPHONE'
      Size = 50
    end
    object sdsContactsEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object sdsContactsPERSONBYDEF: TSmallintField
      FieldName = 'PERSONBYDEF'
      Required = True
    end
    object sdsContactsID_KLIENT: TIntegerField
      FieldName = 'ID_KLIENT'
      Required = True
    end
    object sdsContactsSEX: TSmallintField
      FieldName = 'SEX'
    end
    object sdsContactsID_DOLGNOST: TIntegerField
      FieldName = 'ID_DOLGNOST'
    end
    object sdsContactsID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
    end
  end
  object dspContacts: TDataSetProvider
    DataSet = sdsContacts
    UpdateMode = upWhereKeyOnly
    Left = 160
    Top = 68
  end
  object cdsContacts: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_klient'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspContacts'
    BeforeInsert = cdsContactsBeforeInsert
    AfterInsert = cdsContactsAfterInsert
    BeforeEdit = cdsContactsBeforeEdit
    BeforePost = cdsContactsBeforePost
    BeforeDelete = cdsContactsBeforeDelete
    Left = 160
    Top = 100
    object cdsContactsOID: TIntegerField
      FieldName = 'OID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsContactsNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
    object cdsContactsFULLNAME: TStringField
      DisplayLabel = #1060#1048#1054
      FieldName = 'FULLNAME'
      Size = 250
    end
    object cdsContactsDELMARKED: TSmallintField
      FieldName = 'DELMARKED'
      Required = True
    end
    object cdsContactsLASTNAME: TStringField
      FieldName = 'LASTNAME'
      Size = 50
    end
    object cdsContactsFIRSTNAME: TStringField
      FieldName = 'FIRSTNAME'
      Size = 50
    end
    object cdsContactsMIDDLENAME: TStringField
      FieldName = 'MIDDLENAME'
      Size = 50
    end
    object cdsContactsID_DOLGNOST: TIntegerField
      FieldName = 'ID_DOLGNOST'
    end
    object cdsContactsBIRTHDAY: TSQLTimeStampField
      DisplayLabel = #1044#1077#1085#1100' '#1088#1086#1078#1076#1077#1085#1080#1103
      FieldName = 'BIRTHDAY'
      DisplayFormat = 'dd.mm.yy'
    end
    object cdsContactsBIRTHPLACE: TStringField
      DisplayLabel = #1052#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103
      FieldName = 'BIRTHPLACE'
      Size = 50
    end
    object cdsContactsID_MARRIAGE: TIntegerField
      FieldName = 'ID_MARRIAGE'
    end
    object cdsContactsHOBBY: TStringField
      DisplayLabel = #1061#1086#1073#1073#1080
      FieldName = 'HOBBY'
      Size = 50
    end
    object cdsContactsWORKPHONE: TStringField
      DisplayLabel = #1056#1072#1073#1086#1095#1080#1081' '#1090#1077#1083#1077#1092#1086#1085
      FieldName = 'WORKPHONE'
      Size = 50
    end
    object cdsContactsCELLPHONE: TStringField
      DisplayLabel = #1052#1086#1073#1080#1083#1100#1085#1099#1081' '#1090#1077#1083#1077#1092#1086#1085
      FieldName = 'CELLPHONE'
      Size = 50
    end
    object cdsContactsADDPHONE: TStringField
      DisplayLabel = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1081' '#1090#1077#1083
      FieldName = 'ADDPHONE'
      Size = 50
    end
    object cdsContactsEMAIL: TStringField
      DisplayLabel = #1069#1083#1077#1082#1090#1088#1086#1085#1085#1072#1103' '#1087#1086#1095#1090#1072
      FieldName = 'EMAIL'
      Size = 50
    end
    object cdsContactsPERSONBYDEF: TSmallintField
      DisplayLabel = #1054#1089#1085#1086#1074#1085#1086#1081
      FieldName = 'PERSONBYDEF'
      Required = True
    end
    object cdsContactsID_KLIENT: TIntegerField
      FieldName = 'ID_KLIENT'
      Required = True
    end
    object cdsContactsCHILDREN: TStringField
      DisplayLabel = #1044#1077#1090#1080
      FieldName = 'CHILDREN'
      Size = 50
    end
    object cdsContactsDOLGNOST: TStringField
      DisplayLabel = #1044#1086#1083#1078#1085#1086#1089#1090#1100
      FieldKind = fkLookup
      FieldName = 'DOLGNOST'
      LookupDataSet = dmdEx.cdsDolgnost
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_DOLGNOST'
      Lookup = True
    end
    object cdsContactsSEX: TSmallintField
      FieldName = 'SEX'
    end
    object cdsContactsID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
    end
    object cdsContactsMANAGER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      DisplayWidth = 9
      FieldKind = fkLookup
      FieldName = 'MANAGER'
      LookupDataSet = dmdEx.cdsManager
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_MANAGER'
      Required = True
      Size = 30
      Lookup = True
    end
  end
  object dsContacts: TDataSource
    DataSet = cdsContacts
    Left = 160
    Top = 132
  end
  object ToDeletesdsKlient: TSQLDataSet
    CommandText = 'select * '#13#10'from klient k'#13#10'where k.id=:id_klient'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_klient'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = dmdEx.scUchet
    Left = 256
    Top = 36
  end
  object ToDeletedspKlient: TDataSetProvider
    Left = 256
    Top = 68
  end
  object ToDeletecdsKlient: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_klient'
        ParamType = ptInput
        Value = 0
      end>
    Left = 256
    Top = 100
    object ToDeletecdsKlientMANAGER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      FieldKind = fkLookup
      FieldName = 'MANAGER'
      LookupDataSet = dmdEx.cdsManager
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_MANAGER'
      Size = 30
      Lookup = True
    end
    object ToDeletecdsKlientID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object ToDeletecdsKlientNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
    object ToDeletecdsKlientRSCH: TStringField
      FieldName = 'RSCH'
      Size = 14
    end
    object ToDeletecdsKlientCODB: TStringField
      FieldName = 'CODB'
      Size = 8
    end
    object ToDeletecdsKlientNAMEB: TStringField
      FieldName = 'NAMEB'
      Size = 40
    end
    object ToDeletecdsKlientOKPO: TStringField
      FieldName = 'OKPO'
      Size = 10
    end
    object ToDeletecdsKlientINDEXI: TFloatField
      FieldName = 'INDEXI'
    end
    object ToDeletecdsKlientOBLAST: TStringField
      FieldName = 'OBLAST'
      Size = 4
    end
    object ToDeletecdsKlientTEL: TStringField
      FieldName = 'TEL'
      Size = 30
    end
    object ToDeletecdsKlientFAX: TStringField
      FieldName = 'FAX'
      Size = 14
    end
    object ToDeletecdsKlientFORIN: TStringField
      FieldName = 'FORIN'
      Size = 10
    end
    object ToDeletecdsKlientIPN: TStringField
      FieldName = 'IPN'
      Size = 12
    end
    object ToDeletecdsKlientSVREG: TStringField
      FieldName = 'SVREG'
      Size = 16
    end
    object ToDeletecdsKlientLICO: TStringField
      FieldName = 'LICO'
      Size = 50
    end
    object ToDeletecdsKlientFIO: TStringField
      FieldName = 'FIO'
      Size = 40
    end
    object ToDeletecdsKlientOTV: TStringField
      FieldName = 'OTV'
      Size = 45
    end
    object ToDeletecdsKlientADRES: TStringField
      FieldName = 'ADRES'
      Size = 50
    end
    object ToDeletecdsKlientGOROD: TStringField
      FieldName = 'GOROD'
      Size = 40
    end
    object ToDeletecdsKlientSTAN: TStringField
      FieldName = 'STAN'
      Size = 60
    end
    object ToDeletecdsKlientADRP: TStringField
      FieldName = 'ADRP'
      Size = 60
    end
    object ToDeletecdsKlientDELMARKED: TSmallintField
      FieldName = 'DELMARKED'
      Required = True
    end
    object ToDeletecdsKlientTIP: TIntegerField
      FieldName = 'TIP'
      Required = True
    end
    object ToDeletecdsKlientFULLNAME: TStringField
      FieldName = 'FULLNAME'
      Size = 252
    end
    object ToDeletecdsKlientMODIFIED: TSQLTimeStampField
      FieldName = 'MODIFIED'
      Required = True
    end
    object ToDeletecdsKlientDAT_OSNOV: TSQLTimeStampField
      FieldName = 'DAT_OSNOV'
    end
    object ToDeletecdsKlientOFFICESKLAD: TStringField
      FieldName = 'OFFICESKLAD'
      Size = 252
    end
    object ToDeletecdsKlientSOTRUDNIKOV_OT: TIntegerField
      FieldName = 'SOTRUDNIKOV_OT'
    end
    object ToDeletecdsKlientSOTRUDNIKOV_DO: TStringField
      FieldName = 'SOTRUDNIKOV_DO'
      Size = 252
    end
    object ToDeletecdsKlientFILIALY: TStringField
      FieldName = 'FILIALY'
      Size = 252
    end
    object ToDeletecdsKlientID_ANALOG: TIntegerField
      FieldName = 'ID_ANALOG'
    end
    object ToDeletecdsKlientKTOZAKUPAET: TStringField
      FieldName = 'KTOZAKUPAET'
      Size = 252
    end
    object ToDeletecdsKlientKAKOYKABELNUGEN: TStringField
      FieldName = 'KAKOYKABELNUGEN'
      Size = 252
    end
    object ToDeletecdsKlientOBJEMZAGOD: TStringField
      FieldName = 'OBJEMZAGOD'
      Size = 252
    end
    object ToDeletecdsKlientOBJEMZA6MESYATSEV: TStringField
      FieldName = 'OBJEMZA6MESYATSEV'
      Size = 252
    end
    object ToDeletecdsKlientKTOMOGETPORUCHITSYA: TStringField
      FieldName = 'KTOMOGETPORUCHITSYA'
      Size = 252
    end
    object ToDeletecdsKlientVASHIPARTNERY: TStringField
      FieldName = 'VASHIPARTNERY'
      Size = 252
    end
    object ToDeletecdsKlientVASHIKONKURENTY: TStringField
      FieldName = 'VASHIKONKURENTY'
      Size = 252
    end
    object ToDeletecdsKlientFINANSOVOEPOLOGENIE: TStringField
      FieldName = 'FINANSOVOEPOLOGENIE'
      Size = 252
    end
    object ToDeletecdsKlientDELOVAYAREPUTACIYA: TStringField
      FieldName = 'DELOVAYAREPUTACIYA'
      Size = 252
    end
    object ToDeletecdsKlientRASPOLAGAETLIKONKURENT: TStringField
      FieldName = 'RASPOLAGAETLIKONKURENT'
      Size = 252
    end
    object ToDeletecdsKlientID_SFERADEYATELNOSTI: TIntegerField
      FieldName = 'ID_SFERADEYATELNOSTI'
    end
    object ToDeletecdsKlientSFERA: TStringField
      FieldKind = fkLookup
      FieldName = 'SFERA'
      LookupDataSet = dmdEx.cdsSfera
      LookupKeyFields = 'OID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_SFERADEYATELNOSTI'
      Lookup = True
    end
    object ToDeletecdsKlientANALOG: TStringField
      FieldKind = fkLookup
      FieldName = 'ANALOG'
      LookupDataSet = dmdEx.cdsAllClient
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_ANALOG'
      Lookup = True
    end
    object ToDeletecdsKlientID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
    end
    object ToDeletecdsKlientID_RESULT: TIntegerField
      FieldName = 'ID_RESULT'
    end
    object ToDeletecdsKlientDAT_CONTACT: TSQLTimeStampField
      FieldName = 'DAT_CONTACT'
    end
    object ToDeletecdsKlientRESULT: TStringField
      DisplayLabel = #1056#1077#1079#1091#1083#1100#1090#1072#1090
      FieldKind = fkLookup
      FieldName = 'RESULT'
      LookupDataSet = dmdEx.cdsResult
      LookupKeyFields = 'OID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_RESULT'
      Lookup = True
    end
  end
  object dsKlient: TDataSource
    DataSet = ToDeletecdsKlient
    Left = 256
    Top = 132
  end
  object sdsCallHistory: TSQLDataSet
    CommandText = 
      'select * '#13#10'from CALLHISTORY c'#13#10'where c.id_klient=:id_klient'#13#10'ord' +
      'er by c.dat'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_klient'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 288
    Top = 36
    object sdsCallHistoryID_KLIENT: TIntegerField
      FieldName = 'ID_KLIENT'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsCallHistoryID_CONTACT: TIntegerField
      FieldName = 'ID_CONTACT'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsCallHistoryDAT: TSQLTimeStampField
      FieldName = 'DAT'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsCallHistoryID_REASON: TIntegerField
      FieldName = 'ID_REASON'
      Required = True
    end
    object sdsCallHistoryID_RESULT: TIntegerField
      FieldName = 'ID_RESULT'
      Required = True
    end
    object sdsCallHistoryCOMMENT: TStringField
      FieldName = 'COMMENT'
      Size = 32000
    end
    object sdsCallHistoryID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
    end
  end
  object dspCallHistory: TDataSetProvider
    DataSet = sdsCallHistory
    Left = 288
    Top = 68
  end
  object cdsCallHistory: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_klient'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspCallHistory'
    BeforeInsert = cdsCallHistoryBeforeInsert
    AfterInsert = cdsCallHistoryAfterInsert
    BeforeEdit = cdsCallHistoryBeforeEdit
    BeforePost = cdsCallHistoryBeforePost
    BeforeDelete = cdsCallHistoryBeforeDelete
    Left = 288
    Top = 100
    object cdsCallHistoryID_KLIENT: TIntegerField
      FieldName = 'ID_KLIENT'
      Required = True
    end
    object cdsCallHistoryID_CONTACT: TIntegerField
      FieldName = 'ID_CONTACT'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCallHistoryDAT: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DAT'
      Required = True
    end
    object cdsCallHistoryID_REASON: TIntegerField
      FieldName = 'ID_REASON'
      Required = True
    end
    object cdsCallHistoryID_RESULT: TIntegerField
      FieldName = 'ID_RESULT'
      Required = True
    end
    object cdsCallHistoryCOMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'COMMENT'
      Size = 32000
    end
    object cdsCallHistoryCONTACT: TStringField
      DisplayLabel = #1050#1086#1085#1090#1072#1082#1090
      FieldKind = fkLookup
      FieldName = 'CONTACT'
      LookupDataSet = cdsContacts
      LookupKeyFields = 'OID'
      LookupResultField = 'FULLNAME'
      KeyFields = 'ID_CONTACT'
      Lookup = True
    end
    object cdsCallHistoryREASON: TStringField
      DisplayLabel = #1055#1088#1080#1095#1080#1085#1072
      FieldKind = fkLookup
      FieldName = 'REASON'
      LookupDataSet = dmdEx.cdsReason
      LookupKeyFields = 'OID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_REASON'
      Lookup = True
    end
    object cdsCallHistoryRESULT: TStringField
      DisplayLabel = #1056#1077#1079#1091#1083#1100#1090#1072#1090
      FieldKind = fkLookup
      FieldName = 'RESULT'
      LookupDataSet = dmdEx.cdsResult
      LookupKeyFields = 'OID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_RESULT'
      Lookup = True
    end
    object cdsCallHistoryID_MANAGER: TIntegerField
      FieldName = 'ID_MANAGER'
    end
    object cdsCallHistoryMANAGER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      DisplayWidth = 9
      FieldKind = fkLookup
      FieldName = 'MANAGER'
      LookupDataSet = dmdEx.cdsManager
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_MANAGER'
      Required = True
      Size = 30
      Lookup = True
    end
  end
  object dsCallHistory: TDataSource
    DataSet = cdsCallHistory
    Left = 288
    Top = 132
  end
  object qeContacts: TQueryExtender
    Query = cdsContacts
    KeyField = 'oid'
    Left = 164
    Top = 171
  end
end
