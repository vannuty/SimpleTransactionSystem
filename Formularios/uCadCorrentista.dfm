object frmCadCorrentista: TfrmCadCorrentista
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Cadastro de Correntista'
  ClientHeight = 294
  ClientWidth = 502
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
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object DBGrid: TDBGrid
    Left = 8
    Top = 72
    Width = 489
    Height = 214
    DataSource = DataSource
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'IdCorrentista'
        ReadOnly = True
        Title.Caption = 'Id'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        ReadOnly = True
        Width = 400
        Visible = True
      end>
  end
  object edtNome: TEdit
    Left = 45
    Top = 14
    Width = 300
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object btnConfirmar: TBitBtn
    Left = 351
    Top = 11
    Width = 60
    Height = 25
    Caption = 'Confirmar'
    Enabled = False
    TabOrder = 2
    OnClick = btnConfirmarClick
  end
  object btnAdicionar: TBitBtn
    Left = 8
    Top = 41
    Width = 75
    Height = 25
    Caption = 'Adicionar'
    TabOrder = 3
    OnClick = btnAdicionarClick
  end
  object btnEditar: TBitBtn
    Left = 89
    Top = 41
    Width = 75
    Height = 25
    Caption = 'Editar'
    TabOrder = 4
    OnClick = btnEditarClick
  end
  object btnCancelar: TBitBtn
    Left = 417
    Top = 11
    Width = 60
    Height = 25
    Caption = 'Cancelar'
    Enabled = False
    TabOrder = 5
    OnClick = btnCancelarClick
  end
  object SimpleDataSet: TSimpleDataSet
    Aggregates = <>
    Connection = DmConexao.SQLConnection
    DataSet.CommandText = 'Select IdCorrentista, Nome from correntista'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 442
    Top = 168
    object SimpleDataSetIdCorrentista: TIntegerField
      FieldName = 'IdCorrentista'
    end
    object SimpleDataSetNome: TStringField
      FieldName = 'Nome'
      FixedChar = True
      Size = 100
    end
  end
  object DataSource: TDataSource
    DataSet = SimpleDataSet
    Left = 442
    Top = 216
  end
  object SQLQueryModify: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmConexao.SQLConnection
    Left = 442
    Top = 120
  end
end
