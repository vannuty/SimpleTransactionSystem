object DmConexao: TDmConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 250
  Width = 368
  object SQLConnection: TSQLConnection
    ConnectionName = 'Devart SQL Server'
    DriverName = 'DevartSQLServer'
    Params.Strings = (
      'BlobSize=-1'
      'HostName=DESKTOP-4PBKDBH'
      'DataBase=bank'
      'DriverName=DevartSQLServer'
      'User_Name=sa'
      'Password=master')
    Left = 40
    Top = 16
  end
end
