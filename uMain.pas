unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.Menus, DBXDevartSQLServer, Data.DB, Data.SqlExpr, Vcl.Buttons,
  Vcl.StdCtrls, DbModule, Data.FMTBcd;

type
  TfrmMain = class(TForm)
    btnCadCorrentista: TSpeedButton;
    btnCadMovimentacao: TSpeedButton;
    procedure btnCadCorrentistaClick(Sender: TObject);
    procedure btnCadMovimentacaoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses uCadCorrentista, uCadMovimentacao;

{$R *.dfm}

procedure TfrmMain.btnCadCorrentistaClick(Sender: TObject);
begin
  frmCadCorrentista := TfrmCadCorrentista.Create(Application);
  try
    frmCadCorrentista.ShowModal;
  finally
    FreeAndNil(frmCadCorrentista);
  end;
end;

procedure TfrmMain.btnCadMovimentacaoClick(Sender: TObject);
begin
  frmCadMovimentacao := TfrmCadMovimentacao.Create(Application);
  try
    frmCadMovimentacao.ShowModal;
  finally
    FreeAndNil(frmCadMovimentacao);
  end;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

end.
