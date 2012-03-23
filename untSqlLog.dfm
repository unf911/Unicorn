object frmSqlLog: TfrmSqlLog
  Left = 150
  Top = 115
  BorderStyle = bsDialog
  Caption = #1046#1091#1088#1085#1072#1083' SQL-'#1079#1072#1087#1088#1086#1089#1086#1074
  ClientHeight = 362
  ClientWidth = 536
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
  DesignSize = (
    536
    362)
  PixelsPerInch = 96
  TextHeight = 13
  object memLog: TMemo
    Left = 16
    Top = 8
    Width = 513
    Height = 297
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      'memLog')
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 360
    Top = 312
    Width = 105
    Height = 33
    Anchors = [akLeft, akBottom]
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 1
    OnClick = BitBtn1Click
    Kind = bkClose
  end
  object BitBtn2: TBitBtn
    Left = 32
    Top = 312
    Width = 161
    Height = 33
    Anchors = [akLeft, akBottom]
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1078#1091#1088#1085#1072#1083
    TabOrder = 2
    OnClick = BitBtn2Click
    Kind = bkRetry
  end
  object SQLMonitor1: TSQLMonitor
    OnLogTrace = SQLMonitor1LogTrace
    Left = 8
    Top = 8
  end
end
