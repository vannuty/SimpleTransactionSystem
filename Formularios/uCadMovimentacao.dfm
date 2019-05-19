object frmCadMovimentacao: TfrmCadMovimentacao
  Left = 0
  Top = 0
  Caption = 'Movimenta'#231#227'o'
  ClientHeight = 388
  ClientWidth = 634
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 483
    Top = 358
    Width = 61
    Height = 16
    Caption = 'Saldo: R$'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblTotal: TLabel
    Left = 547
    Top = 358
    Width = 28
    Height = 16
    Caption = '0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = -7
    Top = -8
    Width = 641
    Height = 73
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 18
      Width = 73
      Height = 14
      Caption = 'Correntista:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 54
      Top = 47
      Width = 35
      Height = 14
      Caption = 'Valor:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object rdgCreditoDebito: TRadioGroup
      Left = 379
      Top = 17
      Width = 169
      Height = 43
      Caption = 'Tipo de lan'#231'amento'
      Color = clBtnFace
      Columns = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Cr'#233'dito'
        'D'#233'bito')
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      TabOrder = 0
    end
    object edtNomeCorrentista: TEdit
      Left = 95
      Top = 14
      Width = 275
      Height = 24
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object btnAdicionar: TBitBtn
      Left = 554
      Top = 28
      Width = 75
      Height = 25
      Caption = 'Adicionar'
      TabOrder = 2
      OnClick = btnAdicionarClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 65
    Width = 313
    Height = 288
    TabOrder = 1
    object Label4: TLabel
      Left = 5
      Top = 5
      Width = 79
      Height = 14
      Caption = 'Correntistas:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBGridCorrentista: TDBGrid
      Left = 1
      Top = 24
      Width = 312
      Height = 265
      DataSource = DataSourceCorrentista
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = DBGridCorrentistaCellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'IdCorrentista'
          ReadOnly = True
          Title.Caption = 'Id'
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Nome'
          ReadOnly = True
          Width = 245
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SaldoFinanceiro'
          Visible = False
        end>
    end
  end
  object Panel3: TPanel
    Left = 312
    Top = 64
    Width = 322
    Height = 288
    TabOrder = 2
    object Label5: TLabel
      Left = 8
      Top = 6
      Width = 93
      Height = 14
      Caption = 'Movimenta'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBGridMovimentacao: TDBGrid
      Left = 2
      Top = 25
      Width = 319
      Height = 262
      DataSource = DataSourceMovimentacao
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'DataCriacao'
          ReadOnly = True
          Title.Caption = 'Data e Hora'
          Width = 115
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TipoMovimentacao'
          Title.Caption = 'Tipo Movimenta'#231#227'o'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Valor'
          Visible = True
        end>
    end
  end
  object edtValor: TEdit
    Left = 88
    Top = 35
    Width = 73
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnKeyPress = edtValorKeyPress
  end
  object SimpleDataSetMovimentacao: TSimpleDataSet
    Aggregates = <>
    Connection = DmConexao.SQLConnection
    DataSet.CommandText = 
      'SELECT IdMovimentacao, TipoMovimentacao, Valor, DataCriacao, Cor' +
      'rentistaId FROM movimentacao'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 549
    Top = 163
    object SimpleDataSetMovimentacaoIdMovimentacao: TIntegerField
      FieldName = 'IdMovimentacao'
    end
    object SimpleDataSetMovimentacaoTipoMovimentacao: TStringField
      FieldName = 'TipoMovimentacao'
      FixedChar = True
      Size = 1
    end
    object SimpleDataSetMovimentacaoValor: TFloatField
      FieldName = 'Valor'
    end
    object SimpleDataSetMovimentacaoDataCriacao: TSQLTimeStampField
      FieldName = 'DataCriacao'
    end
    object SimpleDataSetMovimentacaoCorrentistaId: TIntegerField
      FieldName = 'CorrentistaId'
    end
  end
  object DataSourceMovimentacao: TDataSource
    DataSet = SimpleDataSetMovimentacao
    Left = 548
    Top = 210
  end
  object SQLQueryModify: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmConexao.SQLConnection
    Left = 548
    Top = 257
  end
  object SimpleDataSetCorrentista: TSimpleDataSet
    Aggregates = <>
    Connection = DmConexao.SQLConnection
    DataSet.CommandText = 'Select IdCorrentista, Nome, SaldoFinanceiro from correntista'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 549
    Top = 72
    object SimpleDataSetCorrentistaIdCorrentista: TIntegerField
      FieldName = 'IdCorrentista'
    end
    object SimpleDataSetCorrentistaNome: TStringField
      FieldName = 'Nome'
      FixedChar = True
      Size = 100
    end
    object SimpleDataSetCorrentistaSaldoFinanceiro: TFloatField
      FieldName = 'SaldoFinanceiro'
    end
  end
  object DataSourceCorrentista: TDataSource
    DataSet = SimpleDataSetCorrentista
    Left = 549
    Top = 118
  end
end
