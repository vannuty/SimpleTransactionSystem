object frmCadMovimentacao: TfrmCadMovimentacao
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Movimenta'#231#227'o'
  ClientHeight = 406
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
    Left = 1
    Top = 65
    Width = 313
    Height = 342
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
      Height = 318
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
      Height = 264
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
  object Panel4: TPanel
    Left = 313
    Top = 351
    Width = 321
    Height = 55
    TabOrder = 4
    object Label2: TLabel
      Left = 190
      Top = 18
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
      Left = 257
      Top = 18
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
    object Label6: TLabel
      Left = 6
      Top = 3
      Width = 144
      Height = 14
      Caption = 'Imprimir movimenta'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cmbTipoMov: TComboBox
      Left = 6
      Top = 23
      Width = 83
      Height = 21
      ItemIndex = 0
      TabOrder = 0
      Text = 'Todas'
      Items.Strings = (
        'Todas'
        'Cr'#233'dito'
        'D'#233'bito')
    end
    object btnImprimir: TBitBtn
      Left = 95
      Top = 21
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 1
      OnClick = btnImprimirClick
    end
  end
  object SimpleDataSetMovimentacao: TSimpleDataSet
    Active = True
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
  object frxReportMovimentacao: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43604.492222476900000000
    ReportOptions.LastChange = 43604.737490752310000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 420
    Top = 312
    Datasets = <
      item
        DataSet = frxDBDatasetMovimentacao
        DataSetName = 'frxDBDatasetMovimentacao'
      end>
    Variables = <
      item
        Name = ' User'
        Value = Null
      end
      item
        Name = 'Nome'
        Value = ''
      end
      item
        Name = 'Data'
        Value = ''
      end
      item
        Name = 'ValorTotal'
        Value = ''
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      PrintIfEmpty = False
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 94.488250000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo13: TfrxMemoView
          Left = 166.299320000000000000
          Top = 3.779530000000000000
          Width = 371.473805710000000000
          Height = 40.494964290000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Nome]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 166.299320000000000000
          Top = 51.133890000000000000
          Width = 371.473805710000000000
          Height = 36.715434290000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Data]')
          ParentFont = False
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        Height = 84.967444290000000000
        Top = 136.063080000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          Left = 11.737918570000000000
          Top = 50.830197140000000000
          Width = 35.095635710000000000
          Height = 25.376844290000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Id')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 11.338590000000000000
          Top = 3.779530000000000000
          Width = 174.938245710000000000
          Height = 40.494964290000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Transa'#231#245'es')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 127.283550000000000000
          Top = 51.370130000000000000
          Width = 186.276835710000000000
          Height = 29.156374290000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data transa'#231#227'o')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 361.614410000000000000
          Top = 51.370130000000000000
          Width = 186.276835710000000000
          Height = 29.156374290000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Tipo transa'#231#227'o')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 584.606680000000000000
          Top = 51.370130000000000000
          Width = 125.804355710000000000
          Height = 29.156374290000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
        end
      end
      object Memo1: TfrxMemoView
        Width = 22.677180000000000000
        Height = 15.118120000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        Memo.UTF8W = (
          'Bico')
        ParentFont = False
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 52.913420000000000000
        Top = 283.464750000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDatasetMovimentacao
        DataSetName = 'frxDBDatasetMovimentacao'
        RowCount = 0
        object Memo7: TfrxMemoView
          Left = 9.118120000000000000
          Top = 10.677180000000000000
          Width = 35.095635710000000000
          Height = 25.376844290000000000
          DataField = 'IdMovimentacao'
          DataSet = frxDBDatasetMovimentacao
          DataSetName = 'frxDBDatasetMovimentacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDatasetMovimentacao."IdMovimentacao"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 126.283550000000000000
          Top = 6.897650000000000000
          Width = 186.276835710000000000
          Height = 29.156374290000000000
          DataField = 'DataCriacao'
          DataSet = frxDBDatasetMovimentacao
          DataSetName = 'frxDBDatasetMovimentacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDatasetMovimentacao."DataCriacao"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 360.614410000000000000
          Top = 6.897650000000000000
          Width = 186.276835710000000000
          Height = 29.156374290000000000
          DataField = 'TipoMovimentacao'
          DataSet = frxDBDatasetMovimentacao
          DataSetName = 'frxDBDatasetMovimentacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDatasetMovimentacao."TipoMovimentacao"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 583.606680000000000000
          Top = 6.897650000000000000
          Width = 125.804355710000000000
          Height = 29.156374290000000000
          DataSet = frxDBDatasetMovimentacao
          DataSetName = 'frxDBDatasetMovimentacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'R$: [frxDBDatasetMovimentacao."Valor"]')
          ParentFont = False
        end
      end
      object ColumnFooter1: TfrxColumnFooter
        FillType = ftBrush
        Height = 34.015770000000000000
        Top = 396.850650000000000000
        Width = 718.110700000000000000
        object Memo11: TfrxMemoView
          Left = 414.645950000000000000
          Top = 3.779530000000000000
          Width = 129.583885710000000000
          Height = 29.156374290000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Saldo Atual:')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 550.709030000000000000
          Top = 3.779530000000000000
          Width = 159.820125710000000000
          Height = 29.156374290000000000
          DataSet = frxDBDatasetMovimentacao
          DataSetName = 'frxDBDatasetMovimentacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'R$: [ValorTotal]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDatasetMovimentacao: TfrxDBDataset
    UserName = 'frxDBDatasetMovimentacao'
    CloseDataSource = False
    FieldAliases.Strings = (
      'IdMovimentacao=IdMovimentacao'
      'TipoMovimentacao=TipoMovimentacao'
      'Valor=Valor'
      'DataCriacao=DataCriacao'
      'CorrentistaId=CorrentistaId')
    DataSet = SimpleDataSetMovReport
    BCDToCurrency = False
    Left = 420
    Top = 265
  end
  object SimpleDataSetMovReport: TSimpleDataSet
    Active = True
    Aggregates = <>
    Connection = DmConexao.SQLConnection
    DataSet.CommandText = 
      'SELECT IdMovimentacao, TipoMovimentacao, Valor, DataCriacao, Cor' +
      'rentistaId FROM movimentacao'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 422
    Top = 219
    object IntegerField1: TIntegerField
      FieldName = 'IdMovimentacao'
    end
    object StringField1: TStringField
      FieldName = 'TipoMovimentacao'
      FixedChar = True
      Size = 1
    end
    object FloatField1: TFloatField
      FieldName = 'Valor'
    end
    object SQLTimeStampField1: TSQLTimeStampField
      FieldName = 'DataCriacao'
    end
    object IntegerField2: TIntegerField
      FieldName = 'CorrentistaId'
    end
  end
end
