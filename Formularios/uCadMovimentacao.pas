unit uCadMovimentacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Data.DB, Datasnap.DBClient, SimpleDS, Data.FMTBcd, Data.SqlExpr,
  DBXDevartSQLServer, Vcl.Mask, Vcl.Grids, Vcl.DBGrids, DbModule;

type
  TfrmCadMovimentacao = class(TForm)
    Panel1: TPanel;
    rdgCreditoDebito: TRadioGroup;
    edtNomeCorrentista: TEdit;
    Label1: TLabel;
    btnAdicionar: TBitBtn;
    Panel2: TPanel;
    Panel3: TPanel;
    SimpleDataSetMovimentacao: TSimpleDataSet;
    DataSourceMovimentacao: TDataSource;
    SQLQueryModify: TSQLQuery;
    SimpleDataSetCorrentista: TSimpleDataSet;
    SimpleDataSetCorrentistaIdCorrentista: TIntegerField;
    SimpleDataSetCorrentistaNome: TStringField;
    Label2: TLabel;
    lblTotal: TLabel;
    Label3: TLabel;
    edtValor: TEdit;
    DBGridCorrentista: TDBGrid;
    DataSourceCorrentista: TDataSource;
    Label4: TLabel;
    Label5: TLabel;
    SimpleDataSetMovimentacaoTipoMovimentacao: TStringField;
    SimpleDataSetMovimentacaoValor: TFloatField;
    SimpleDataSetMovimentacaoDataCriacao: TSQLTimeStampField;
    SimpleDataSetMovimentacaoCorrentistaId: TIntegerField;
    DBGridMovimentacao: TDBGrid;
    SimpleDataSetCorrentistaSaldoFinanceiro: TFloatField;
    SimpleDataSetMovimentacaoIdMovimentacao: TIntegerField;
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridCorrentistaCellClick(Column: TColumn);
    procedure btnAdicionarClick(Sender: TObject);
  private
    { Private declarations }
    DbModule: TDmConexao;
    procedure LimparSQLQuery;
    procedure MostrarLancamentos;
  public
    { Public declarations }
  end;

var
  frmCadMovimentacao: TfrmCadMovimentacao;

implementation

{$R *.dfm}

{ TfrmCadMovimentacao }

procedure TfrmCadMovimentacao.btnAdicionarClick(Sender: TObject);
begin
  LimparSQLQuery;
  SQLQueryModify.SQL.Add('INSERT INTO movimentacao (TipoMovimentacao, Valor, CorrentistaId) VALUES ( :TipoMovimentacao , :Valor , :CorrentistaId)');
  if rdgCreditoDebito.ItemIndex = 0 then
    SQLQueryModify.ParamByName('TipoMovimentacao').AsString := 'C'
  else
    SQLQueryModify.ParamByName('TipoMovimentacao').AsString := 'D';
  SQLQueryModify.ParamByName('Valor').AsFloat := StrToFloat(edtValor.Text);
  SQLQueryModify.ParamByName('CorrentistaId').AsInteger := DBGridCorrentista.Fields[0].AsInteger;
  SQLQueryModify.ExecSQL();
  SimpleDataSetMovimentacao.Refresh;
  SimpleDataSetCorrentista.Refresh;
  edtValor.Text := '';
end;

procedure TfrmCadMovimentacao.DBGridCorrentistaCellClick(Column: TColumn);
begin
  edtNomeCorrentista.Text := DBGridCorrentista.Fields[1].AsString;
  lblTotal.Caption := FormatFloat('0.00', DBGridCorrentista.Fields[2].AsFloat );
  MostrarLancamentos;
end;

procedure TfrmCadMovimentacao.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', Char(VK_BACK), Char(VK_DELETE), ',']) then Key := #0;
end;

procedure TfrmCadMovimentacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(DbModule);
end;

procedure TfrmCadMovimentacao.FormShow(Sender: TObject);
begin
  DbModule := TDmConexao.Create(Application);
  SimpleDataSetCorrentista.Open;
end;

procedure TfrmCadMovimentacao.LimparSQLQuery;
begin
  SQLQueryModify.Close;
  SQLQueryModify.SQL.Clear;
end;

procedure TfrmCadMovimentacao.MostrarLancamentos;
begin
  SimpleDataSetMovimentacao.Close;
  SimpleDataSetMovimentacao.DataSet.CommandText := 'SELECT IdMovimentacao, TipoMovimentacao, ' +
              ' Valor, DataCriacao, CorrentistaId FROM movimentacao Where CorrentistaId=:CorrentistaId';
  SimpleDataSetMovimentacao.DataSet.ParamByName('CorrentistaId').AsInteger := DBGridCorrentista.Fields[0].AsInteger;
  SimpleDataSetMovimentacao.Open;
end;

end.
