object fmSettingsSklad: TfmSettingsSklad
  Left = 121
  Top = 202
  Width = 302
  Height = 47
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  object gbxVlad: TGroupBox
    Left = 0
    Top = 0
    Width = 278
    Height = 47
    Align = alTop
    Caption = #1042#1099#1073#1086#1088' '#1089#1082#1083#1072#1076#1072
    TabOrder = 0
    object Label1: TLabel
      Left = 15
      Top = 17
      Width = 31
      Height = 13
      Caption = #1057#1082#1083#1072#1076
    end
    object dlcSklad: TDBLookupComboboxEh
      Left = 128
      Top = 16
      Width = 161
      Height = 21
      DropDownBox.AutoDrop = True
      DropDownBox.Width = -1
      EditButtons = <
        item
          Style = ebsMinusEh
          Visible = False
          OnClick = dlcSkladEditButtons0Click
        end>
      KeyField = 'OID'
      ListField = 'NAME'
      ListSource = dmdEx.dsSklads
      TabOrder = 0
      Visible = True
    end
  end
  object SQLDataSet1: TSQLDataSet
    CommandText = 
      'select'#13#10'  oid'#13#10'from'#13#10'  get_object_children_pc(:oid,'#13#10'    (select' +
      ' oid from get_oid_objects_pc('#39#1058#1048#1055' '#1053#1040#1047#1042#1040#1053#1048#1071' '#1057#1050#1051#1040#1044#1054#1042#39',-100))'#13#10'  )'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'oid'
        ParamType = ptInput
      end>
    SQLConnection = dmdEx.scUchet
    Left = 88
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLDataSet1
    Left = 128
  end
  object cdsSkladTree: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'oid'
        ParamType = ptInput
      end>
    ProviderName = 'DataSetProvider1'
    Left = 168
  end
end
