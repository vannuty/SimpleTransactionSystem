unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.Menus, DBXDevartSQLServer, Data.DB, Data.SqlExpr, Vcl.Buttons,
  Vcl.StdCtrls, DbModule, Data.FMTBcd;

type
  TfrmMain = class(TForm)
    btnCadCorrentista: TButton;
    btnCadMovimentacao: TButton;
    procedure btnCadCorrentistaClick(Sender: TObject);
    procedure btnCadMovimentacaoClick(Sender: TObject);
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

end.
