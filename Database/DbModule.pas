unit DbModule;

interface

uses
  System.SysUtils, System.Classes, DBXDevartSQLServer, Data.DB, Data.SqlExpr,
  uFuncoes;

type
  TDmConexao = class(TDataModule)
    SQLConnection: TSQLConnection;
    procedure DataModuleCreate(Sender: TObject);
    procedure LoadConfig;
    procedure CriarEstrutura;
    procedure CriarProcedure;
    procedure CriarTiggrer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmConexao: TDmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDmConexao.CriarEstrutura;
var EstruturaStr: string;
begin
  EstruturaStr := 'USE [bank] ' +
                  'SET ANSI_NULLS ON ' +
                  'SET QUOTED_IDENTIFIER ON ' +
                  'CREATE TABLE [dbo].[correntista]( ' +
                  '	[IdCorrentista] [int] IDENTITY(1,1) NOT NULL, ' +
                  '	[Nome] [char](100) NOT NULL, ' +
                  '	[DataCriacao] [datetime] NOT NULL, ' +
                  '	[SaldoFinanceiro] [float] NOT NULL, ' +
                  ' CONSTRAINT [PK_correntista] PRIMARY KEY CLUSTERED ' +
                  '( ' +
                  '	[IdCorrentista] ASC ' +
                  ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY] ' +
                  ') ON [PRIMARY] ' +
                  'SET ANSI_NULLS ON ' +
                  'SET QUOTED_IDENTIFIER ON ' +
                  'CREATE TABLE [dbo].[movimentacao](  ' +
                  '	[IdMovimentacao] [int] IDENTITY(1,1) NOT NULL, ' +
                  '	[TipoMovimentacao] [char](1) NOT NULL, ' +
                  '	[Valor] [float] NOT NULL, ' +
                  '	[DataCriacao] [datetime] NOT NULL, ' +
                  '	[CorrentistaId] [int] NOT NULL, ' +
                  ' CONSTRAINT [PK_movimentacao] PRIMARY KEY CLUSTERED ' +
                  '( ' +
                  '	[IdMovimentacao] ASC  ' +
                  ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY] ' +
                  ') ON [PRIMARY] ' +
                  'ALTER TABLE [dbo].[correntista] ADD  CONSTRAINT [DF_correntista_DataCriacao]  DEFAULT (getdate()) FOR [DataCriacao] ' +
                  'ALTER TABLE [dbo].[correntista] ADD  CONSTRAINT [DF_correntista_SaldoFinanceiro]  DEFAULT ((0)) FOR [SaldoFinanceiro] ' +
                  'ALTER TABLE [dbo].[movimentacao] ADD  CONSTRAINT [DF_movimentacao_DataCriacao]  DEFAULT (getdate()) FOR [DataCriacao] ' +
                  'ALTER TABLE [dbo].[movimentacao]  WITH CHECK ADD  CONSTRAINT [FK_movimentacao_correntista] FOREIGN KEY([CorrentistaId]) ' +
                  'REFERENCES [dbo].[correntista] ([IdCorrentista]) ' +
                  'ALTER TABLE [dbo].[movimentacao] CHECK CONSTRAINT [FK_movimentacao_correntista] ';
  SQLConnection.Execute(EstruturaStr, nil);
end;

procedure TDmConexao.CriarProcedure;
  var EstruturaStr: string;
begin
  EstruturaStr := 'CREATE  PROCEDURE [dbo].[_sp_ListarMovimentacao] ( ' +
                  '  @IDCORRENTISTA  INTEGER, ' +
                  '  @OPR        CHAR(1), ' +
                  '  @DATAINI	  DATETIME, ' +
                  '  @DATAFIM	  DATETIME) ' +
                  'as ' +
                  'BEGIN ' +
                  '   IF (@OPR = ''D'' OR @OPR = ''C'') ' +
                  '       Select * from movimentacao ' +
                  '       Where CorrentistaId=@IDCORRENTISTA and ' +
                  '       TipoMovimentacao=@OPR and ' +
                  '       DataCriacao>=@DATAINI and ' +
                  '       DataCriacao<=@DATAFIM ' +
                  '   ELSE ' +
                  '       Select * from movimentacao ' +
                  '       Where CorrentistaId=@IDCORRENTISTA and ' +
                  '       DataCriacao>=@DATAINI and ' +
                  '       DataCriacao<=@DATAFIM ' +
                  'END; ';

  SQLConnection.Execute(EstruturaStr, nil);
end;

procedure TDmConexao.CriarTiggrer;
  var EstruturaStr: string;
begin
  EstruturaStr := 'CREATE TRIGGER TRG_MOVIMENTACAO ON movimentacao ' +
                  'AFTER INSERT ' +
                  'AS ' +
                  'BEGIN ' +
                  '  DECLARE @TpMov char; ' +
                  '  select @tpMov=TipoMovimentacao from inserted; ' +
                  '  IF (@TpMov = ''D'' ) ' +
                  '    UPDATE correntista ' +
                  '    SET SaldoFinanceiro = SaldoFinanceiro - inserted.Valor ' +
                  '    FROM inserted ' +
                  '    WHERE inserted.CorrentistaId = correntista.IdCorrentista; ' +
                  '  ELSE if (@TpMov = ''C'') ' +
                  '    UPDATE correntista ' +
                  '    SET SaldoFinanceiro = SaldoFinanceiro + inserted.Valor ' +
                  '    FROM inserted ' +
                  '    WHERE inserted.CorrentistaId = correntista.IdCorrentista; ' +
                  'END; ';

  SQLConnection.Execute(EstruturaStr, nil);
end;

procedure TDmConexao.DataModuleCreate(Sender: TObject);
begin
  try
    LoadConfig;
  except
    on E: Exception do
    begin
      raise Exception.Create('Ops! Houve um problema ao tentar se conectar ao banco de dados: ' + E.Message);
    end;
  end;
end;

procedure TDmConexao.LoadConfig;
begin
  SQLConnection.Params.Values['HostName']  := UsarArquivoConfig(TTipoOperacao.tpGet, 'HostName', 'DB', 'DESKTOP-4PBKDBH');
  SQLConnection.Params.Values['DataBase']  := UsarArquivoConfig(TTipoOperacao.tpGet, 'DataBase', 'DB', 'bank');
  SQLConnection.Params.Values['User_Name'] := UsarArquivoConfig(TTipoOperacao.tpGet, 'UserName', 'DB', 'sa');
  SQLConnection.Params.Values['Password']  := DecryptStr(UsarArquivoConfig(TTipoOperacao.tpGet, 'Password', 'DB', '6FC051F00CC8'), 754);
end;

end.
