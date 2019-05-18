program Bank;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  uFuncoes in 'Uteis\uFuncoes.pas',
  DbModule in 'Database\DbModule.pas' {DmConexao: TDataModule},
  uConfig in 'Formularios\uConfig.pas' {frmConfig};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  if not ExisteArquivoConfig then
    Application.CreateForm(TfrmConfig, frmConfig)
  else
    Application.CreateForm(TfrmMain, frmMain);
  DmConexao := TDmConexao.Create(Application);
  Application.Run;
end.
