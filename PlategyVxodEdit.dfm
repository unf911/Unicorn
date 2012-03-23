object frmPlategyVxodEdit: TfrmPlategyVxodEdit
  Left = 494
  Top = 329
  Width = 362
  Height = 410
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1074#1093#1086#1076#1103#1097#1080#1093' '#1087#1083#1072#1090#1077#1078#1077#1081
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    354
    383)
  PixelsPerInch = 96
  TextHeight = 13
  object lcbParentIdNakl: TLabel
    Left = 8
    Top = 180
    Width = 67
    Height = 13
    Caption = #8470' '#1085#1072#1083#1086#1075#1086#1074#1086#1081
  end
  object dbnParentIdNakl: TDBNumberEditEh
    Left = 112
    Top = 180
    Width = 229
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Ctl3D = True
    currency = False
    DataField = 'PARENT_ID_NAKL'
    DecimalPlaces = 0
    DisplayFormat = '0'
    EditButton.Style = ebsEllipsisEh
    EditButton.Visible = True
    EditButtons = <>
    Increment = 0.010000000000000000
    ParentCtl3D = False
    TabOrder = 0
    Visible = True
  end
end
