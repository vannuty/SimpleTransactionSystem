unit uConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, uFuncoes, DBModule, ShellApi;

type
  TfrmConfig = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    btnCriarDB: TButton;
    Label3: TLabel;
    Panel3: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtInstancia: TEdit;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    edtCriarEstrutura: TButton;
    procedure btnCriarDBClick(Sender: TObject);
    function ValidarInformacoesSQL: boolean;
    procedure edtCriarEstruturaClick(Sender: TObject);
    procedure SalvarConfig;
    function CriarEstrutura: boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfig: TfrmConfig;

implementation

{$R *.dfm}

procedure TfrmConfig.btnCriarDBClick(Sender: TObject);
var CreateDBStr: string;
begin
 try
   CreateDBStr := '/Q "IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = N''bank'') BEGIN CREATE DATABASE bank END;"';
   ExecutarShell('sqlcmd.exe', CreateDBStr);
 finally
   showmessage('Banco de dados criado com sucesso!');
 end;
end;

function TfrmConfig.CriarEstrutura: boolean;
var DbModule: TDmConexao;
begin
  Result := True;
  DbModule := TDmConexao.Create(Application);
  try
    try
       DbModule.LoadConfig;
       DbModule.CriarEstrutura;
       DbModule.CriarProcedure;
       DBModule.CriarTiggrer;
    except
      on E: Exception do
      begin
         Result := False;
         Exception.Create('Ops! Houve um problema ao tentar criar a estrutura do banco de dados: ' + E.Message);
      end;
    end;
  finally
    FreeAndNil(DbModule);
  end;
end;

procedure TfrmConfig.edtCriarEstruturaClick(Sender: TObject);
begin
  if not ValidarInformacoesSQL then
    exit;
  SalvarConfig;
  if CriarEstrutura then
  begin
    ShowMessage('Estrutura criada com sucesso! A aplica��o ser� reiniciada.');
    RestartAplicacao;
  end;
end;

procedure TfrmConfig.SalvarConfig;
begin
  UsarArquivoConfig(TTipoOperacao.tpSet, 'HostName', 'DB', edtInstancia.Text);
  UsarArquivoConfig(TTipoOperacao.tpSet, 'DataBase', 'DB', 'bank');
  UsarArquivoConfig(TTipoOperacao.tpSet, 'UserName', 'DB', edtUsuario.Text);
  UsarArquivoConfig(TTipoOperacao.tpSet, 'Password', 'DB', EncryptStr(edtSenha.Text, 754));
end;

function TfrmConfig.ValidarInformacoesSQL: boolean;
begin
  Result := False;
  if edtInstancia.Text = '' then
  begin
    ShowMessage('� necess�rio preencher o campo de IP/Instancia.');
    Exit;
  end;
  if edtUsuario.Text = '' then
  begin
    ShowMessage('� necess�rio preencher o campo de Usu�rio.');
    Exit;
  end;
  if edtSenha.Text = '' then
  begin
    ShowMessage('� necess�rio preencher o campo referente a senha.');
    Exit;
  end;
  Result := True;
end;

end.
