unit uCadCorrentista;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DbModule, Data.DB, Datasnap.DBClient,
  SimpleDS, Vcl.Grids, Vcl.DBGrids, DBXDevartSQLServer, Data.FMTBcd,
  Vcl.StdCtrls, Data.SqlExpr, Vcl.Buttons, uFuncoes;

type
  TfrmCadCorrentista = class(TForm)
    DBGrid: TDBGrid;
    SimpleDataSet: TSimpleDataSet;
    DataSource: TDataSource;
    SimpleDataSetIdCorrentista: TIntegerField;
    SimpleDataSetNome: TStringField;
    SQLQueryModify: TSQLQuery;
    Label1: TLabel;
    edtNome: TEdit;
    btnConfirmar: TBitBtn;
    btnAdicionar: TBitBtn;
    btnEditar: TBitBtn;
    btnCancelar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    TipoAcao: TTipoAcao;
    DbModule: TDmConexao;
    procedure LimparCampos;
    procedure AtualizarTela;
    procedure LimparSQLQuery;
  public
    { Public declarations }
  end;

var
  frmCadCorrentista: TfrmCadCorrentista;

implementation

{$R *.dfm}

procedure TfrmCadCorrentista.AtualizarTela;
begin
    if (TipoAcao = tpAdicionar) or (TipoAcao = tpEditar) then
    begin
       btnAdicionar.Enabled := False;
       btnEditar.Enabled := False;
       btnConfirmar.Enabled := True;
       btnCancelar.Enabled := True;
       edtNome.Enabled := True;
       DBGrid.Enabled := False;
    end
    else
    begin
       btnAdicionar.Enabled := True;
       btnEditar.Enabled := True;
       btnConfirmar.Enabled := False;
       btnCancelar.Enabled := False;
       edtNome.Enabled := False;
       DBGrid.Enabled := True;
       LimparCampos;
    end;
end;

procedure TfrmCadCorrentista.btnAdicionarClick(Sender: TObject);
begin
  TipoAcao := tpAdicionar;
  AtualizarTela;
end;

procedure TfrmCadCorrentista.btnCancelarClick(Sender: TObject);
begin
  TipoAcao := tpNone;
  AtualizarTela;
end;

procedure TfrmCadCorrentista.btnConfirmarClick(Sender: TObject);
begin
  LimparSQLQuery;
  if TipoAcao = tpAdicionar then
  begin
    if edtNome.Text <> '' then
    begin
      SQLQueryModify.SQL.Add('INSERT INTO correntista (Nome) VALUES (:Nome);');
      SQLQueryModify.ParamByName('Nome').AsString := edtNome.Text;
      SQLQueryModify.ExecSQL();
      ShowMessage('Registro adicionado com sucesso.');
    end
    else
      ShowMessage('Digite um nome válido antes de tentar adicionar.');
  end
  else if TipoAcao = tpEditar then
  begin
    if edtNome.Text <> '' then
    begin
      SQLQueryModify.SQL.Add('Update correntista set Nome=:Nome where IdCorrentista=:IdCorrentista;');
      SQLQueryModify.ParamByName('Nome').AsString := edtNome.Text;
      SQLQueryModify.ParamByName('IdCorrentista').AsInteger := DBGrid.Fields[0].AsInteger;
      ShowMessage('Registro alterado com sucesso.');
      SQLQueryModify.ExecSQL();
    end
    else
      ShowMessage('Digite um nome válido antes de tentar alterar.');
  end;
  TipoAcao := tpNone;
  SimpleDataSet.Refresh;
  AtualizarTela;
end;

procedure TfrmCadCorrentista.btnEditarClick(Sender: TObject);
begin
  if DBGrid.Fields[1].AsString <> '' then
  begin
    TipoAcao := tpEditar;
    edtNome.Text := Trim(DBGrid.Fields[1].AsString);
    AtualizarTela;
  end
  else
    ShowMessage('Selecione um registro antes de editar');
end;

procedure TfrmCadCorrentista.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(DbModule);
end;

procedure TfrmCadCorrentista.FormShow(Sender: TObject);
begin
  DbModule := TDmConexao.Create(Application);
  SimpleDataSet.Open;
  TipoAcao := tpNone;
end;

procedure TfrmCadCorrentista.LimparCampos;
begin
  edtNome.Text := '';
end;

procedure TfrmCadCorrentista.LimparSQLQuery;
begin
  SQLQueryModify.Close;
  SQLQueryModify.SQL.Clear;
end;

end.
