object frmConfig: TfrmConfig
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Assistente de Configura'#231#227'o'
  ClientHeight = 359
  ClientWidth = 279
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 281
    Height = 65
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 11
      Width = 261
      Height = 48
      Caption = 
        'Ol'#225', bem vindo ao Assistente de configura'#231#227'o do Sistema de Trans' +
        'a'#231#245'es. Siga os passos a seguir:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 65
    Width = 281
    Height = 144
    TabOrder = 1
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 150
      Height = 14
      Caption = '1 - Criar banco de dados'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 28
      Width = 253
      Height = 78
      Caption = 
        '  Obs: Para criar o banco de dados '#233' necess'#225'rio que esse usu'#225'rio' +
        ' do windows esteja com autoriza'#231#227'o para alterar informa'#231#245'es na i' +
        'nst'#226'ncia SQL Server. Caso n'#227'o tenha autoriza'#231#227'o ou caso a inst'#226'n' +
        'cia sej'#225' em outra maquina, voc'#234' deve criar um Database chamado '#39 +
        'bank'#39' manualmente.'
      WordWrap = True
    end
    object btnCriarDB: TButton
      Left = 104
      Top = 112
      Width = 75
      Height = 25
      Caption = 'Criar'
      TabOrder = 0
      OnClick = btnCriarDBClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 208
    Width = 281
    Height = 152
    TabOrder = 2
    object Label4: TLabel
      Left = 8
      Top = 6
      Width = 111
      Height = 14
      Caption = '2 - Criar estrutura'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 72
      Top = 23
      Width = 137
      Height = 13
      Caption = 'Preencher informa'#231#245'es: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 8
      Top = 45
      Width = 119
      Height = 13
      Caption = 'IP/Inst'#226'ncia SQL Server:'
    end
    object Label7: TLabel
      Left = 87
      Top = 70
      Width = 40
      Height = 13
      Caption = 'Usu'#225'rio:'
    end
    object Label8: TLabel
      Left = 93
      Top = 96
      Width = 34
      Height = 13
      Caption = 'Senha:'
    end
    object edtInstancia: TEdit
      Left = 131
      Top = 42
      Width = 138
      Height = 21
      TabOrder = 0
    end
    object edtUsuario: TEdit
      Left = 131
      Top = 67
      Width = 138
      Height = 21
      TabOrder = 1
    end
    object edtSenha: TEdit
      Left = 131
      Top = 93
      Width = 138
      Height = 21
      PasswordChar = '*'
      TabOrder = 2
    end
    object edtCriarEstrutura: TButton
      Left = 104
      Top = 120
      Width = 75
      Height = 25
      Caption = 'Criar'
      TabOrder = 3
      OnClick = edtCriarEstruturaClick
    end
  end
end
