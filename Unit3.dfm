object Form3: TForm3
  Left = 488
  Top = 165
  BorderStyle = bsSingle
  Caption = #32493#21629#28216#25103' - wakafa'
  ClientHeight = 411
  ClientWidth = 370
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 176
    Top = 383
    Width = 4
    Height = 16
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 27
    Top = 4
    Width = 96
    Height = 21
    Caption = #32493#21629#36895#24230#26465#65306
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI Emoji'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 27
    Top = 378
    Width = 75
    Height = 25
    Caption = #20174#22836#32493
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 276
    Top = 378
    Width = 75
    Height = 25
    Caption = #20572#19968#20250#20877#32493
    TabOrder = 1
    OnClick = Button2Click
  end
  object TrackBar1: TTrackBar
    Left = 112
    Top = 0
    Width = 257
    Height = 25
    DoubleBuffered = True
    Max = 1000
    Min = 1
    ParentDoubleBuffered = False
    Position = 100
    TabOrder = 2
    OnChange = TrackBar1Change
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 208
    Top = 216
  end
end
