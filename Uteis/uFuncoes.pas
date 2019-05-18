unit uFuncoes;

interface

uses
  System.SysUtils, IniFiles, Forms, ShellApi;

type
  TTipoOperacao = (tpGet = 1, tpSet = 2, tpCreate = 3);
  const CKEY1 = 46750;
        CKEY2 = 38247;

  function UsarArquivoConfig(Operation: TTipoOperacao; Section, Ident, value: string): string;
  function ExisteArquivoConfig: Boolean;
  function EncryptStr(const S: WideString; Key: Word): String;
  function DecryptStr(const S: String; Key: Word): String;
  procedure ExecutarShell(Aplicativo, Parametros: String);
  procedure RestartAplicacao;

implementation

function UsarArquivoConfig(Operation: TTipoOperacao;
  Section, Ident, value: string): string;
var
  PathFile: string;
  fConfig: TIniFile;
begin
  PathFile := ExtractFilePath(Application.ExeName) + 'config.ini';
  fConfig := TIniFile.Create(PathFile);
  try
    case Operation of
      TTipoOperacao.tpGet:
        Result := fConfig.ReadString(Section, Ident, value);
      TTipoOperacao.tpSet:
        begin
          fConfig.WriteString(Section, Ident, value);
          Result := value;
        end;
      TTipoOperacao.tpCreate:
        begin
          if not FileExists(PathFile) then
            fConfig.WriteString(Section, Ident, value)
        end;
    end;
  finally
    fConfig.Free;
  end;
end;

function ExisteArquivoConfig: Boolean;
begin
  Result := False;
  if FileExists(ExtractFilePath(Application.ExeName) + 'config.ini') then
    Result := true;
end;

function EncryptStr(const S :WideString; Key: Word): String;
var   i          :Integer;
      RStr       :RawByteString;
      RStrB      :TBytes Absolute RStr;
begin
  Result:= '';
  RStr:= UTF8Encode(S);
  for i := 0 to Length(RStr)-1 do begin
    RStrB[i] := RStrB[i] xor (Key shr 8);
    Key := (RStrB[i] + Key) * CKEY1 + CKEY2;
  end;
  for i := 0 to Length(RStr)-1 do begin
    Result:= Result + IntToHex(RStrB[i], 2);
  end;
end;

function DecryptStr(const S: String; Key: Word): String;
var   i, tmpKey  :Integer;
      RStr       :RawByteString;
      RStrB      :TBytes Absolute RStr;
      tmpStr     :string;
begin
  tmpStr:= UpperCase(S);
  SetLength(RStr, Length(tmpStr) div 2);
  i:= 1;
  try
    while (i < Length(tmpStr)) do begin
      RStrB[i div 2]:= StrToInt('$' + tmpStr[i] + tmpStr[i+1]);
      Inc(i, 2);
    end;
  except
    Result:= '';
    Exit;
  end;
  for i := 0 to Length(RStr)-1 do begin
    tmpKey:= RStrB[i];
    RStrB[i] := RStrB[i] xor (Key shr 8);
    Key := (tmpKey + Key) * CKEY1 + CKEY2;
  end;
  Result:= UTF8ToString(RStr);
end;

procedure ExecutarShell(Aplicativo, Parametros: String);
Var Comando: Array[0..1024] of Char;
    Params: Array[0..1024] of Char;
Begin
   StrPCopy(Comando,Aplicativo);
   StrPCopy(Params,Parametros);
   ShellExecute(0,nil,Comando,Params,nil,0);
End;

procedure RestartAplicacao;
begin
  ShellExecute(0, nil, PChar(application.exename), nil, nil, 0);
  application.Terminate;
end;

end.
