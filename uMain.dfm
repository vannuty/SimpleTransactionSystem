object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Sistema de Transa'#231#245'es'
  ClientHeight = 471
  ClientWidth = 717
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnCadCorrentista: TButton
    Left = 48
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Correntista'
    TabOrder = 0
    OnClick = btnCadCorrentistaClick
  end
  object btnCadMovimentacao: TButton
    Left = 576
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Movimentacao'
    TabOrder = 1
    OnClick = btnCadMovimentacaoClick
  end
end
