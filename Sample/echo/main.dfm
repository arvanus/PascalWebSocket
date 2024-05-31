object FMain: TFMain
  Left = 0
  Top = 0
  Caption = 'FMain'
  ClientHeight = 576
  ClientWidth = 711
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    711
    576)
  TextHeight = 15
  object Memo1: TMemo
    Left = 8
    Top = 128
    Width = 675
    Height = 425
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
  end
  object edServer: TLabeledEdit
    Left = 8
    Top = 24
    Width = 577
    Height = 23
    EditLabel.Width = 35
    EditLabel.Height = 15
    EditLabel.Caption = 'Server:'
    TabOrder = 1
    Text = 'wss://echo.websocket.org'
  end
  object ButtonDisConnect: TButton
    Left = 608
    Top = 23
    Width = 75
    Height = 25
    Caption = 'Connect'
    TabOrder = 2
    OnClick = ButtonDisConnectClick
  end
  object edMessage: TLabeledEdit
    Left = 8
    Top = 80
    Width = 577
    Height = 23
    EditLabel.Width = 49
    EditLabel.Height = 15
    EditLabel.Caption = 'Message:'
    TabOrder = 3
    Text = 'It Worked!'
  end
  object Button2: TButton
    Left = 608
    Top = 79
    Width = 75
    Height = 25
    Caption = 'Send'
    TabOrder = 4
    OnClick = Button2Click
  end
end
