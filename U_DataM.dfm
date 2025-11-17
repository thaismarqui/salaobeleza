object DataM: TDataM
  Height = 490
  Width = 703
  object cdsUsuarios: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'US_LOGIN'
        ParamType = ptInput
        Size = 60
      end
      item
        DataType = ftString
        Name = 'US_SENHA'
        ParamType = ptInput
        Size = 200
      end>
    ProviderName = 'dspUsuarios'
    Left = 176
    Top = 40
    object cdsUsuariosUS_CODIGO: TIntegerField
      FieldName = 'US_CODIGO'
      Required = True
    end
    object cdsUsuariosUS_LOGIN: TStringField
      FieldName = 'US_LOGIN'
      Size = 60
    end
    object cdsUsuariosUS_NOME: TStringField
      FieldName = 'US_NOME'
      Size = 100
    end
    object cdsUsuariosUS_SENHA: TStringField
      FieldName = 'US_SENHA'
      Size = 200
    end
    object cdsUsuariosUS_STATUS: TStringField
      FieldName = 'US_STATUS'
    end
  end
  object conexao: TFDConnection
    Params.Strings = (
      'Database=C:\Users\thais\OneDrive\Desktop\DSIN\SALAOBASE.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    Transaction = FDTransaction1
    UpdateTransaction = FDTransaction2
    Left = 48
    Top = 48
  end
  object qryUsuarios: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'select usu.us_codigo, '
      '       usu.us_login, '
      '       usu.us_nome, '
      '       usu.us_senha, '
      '       usu.us_status'
      'from usuarios usu'
      'where usu.us_login = :us_login and'
      '      usu.us_senha = :us_senha')
    Left = 208
    Top = 32
    ParamData = <
      item
        Position = 1
        Name = 'US_LOGIN'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Position = 2
        Name = 'US_SENHA'
        DataType = ftString
        ParamType = ptInput
        Size = 200
      end>
    object qryUsuariosUS_CODIGO: TIntegerField
      FieldName = 'US_CODIGO'
      Origin = 'US_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryUsuariosUS_LOGIN: TStringField
      FieldName = 'US_LOGIN'
      Origin = 'US_LOGIN'
      Size = 60
    end
    object qryUsuariosUS_NOME: TStringField
      FieldName = 'US_NOME'
      Origin = 'US_NOME'
      Size = 100
    end
    object qryUsuariosUS_SENHA: TStringField
      FieldName = 'US_SENHA'
      Origin = 'US_SENHA'
      Size = 200
    end
    object qryUsuariosUS_STATUS: TStringField
      FieldName = 'US_STATUS'
      Origin = 'US_STATUS'
    end
  end
  object dspUsuarios: TDataSetProvider
    DataSet = qryUsuarios
    Left = 176
    Top = 24
  end
  object dspConServicos: TDataSetProvider
    DataSet = qryConServicos
    Left = 512
    Top = 24
  end
  object cdsConServicos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'US_LOGIN'
        ParamType = ptInput
        Size = 60
      end
      item
        DataType = ftString
        Name = 'US_SENHA'
        ParamType = ptInput
        Size = 200
      end>
    ProviderName = 'dspConServicos'
    Left = 512
    Top = 40
    object cdsConServicosSERV_CODIGO: TIntegerField
      FieldName = 'SERV_CODIGO'
      Required = True
    end
    object cdsConServicosSERV_DESCRICAO: TStringField
      FieldName = 'SERV_DESCRICAO'
      Size = 200
    end
    object cdsConServicosSERV_VALOR: TFloatField
      FieldName = 'SERV_VALOR'
      DisplayFormat = '#0.00'
    end
    object cdsConServicosSERV_TEMPO: TTimeField
      FieldName = 'SERV_TEMPO'
    end
    object cdsConServicosSERV_STATUS: TStringField
      FieldName = 'SERV_STATUS'
    end
  end
  object qryConServicos: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'select serv.serv_codigo, '
      '       serv.serv_descricao, '
      '       serv.serv_valor, '
      '       serv.serv_tempo,'
      '       serv.serv_status'
      'from servicos serv '
      'order by serv.serv_codigo asc')
    Left = 544
    Top = 32
    ParamData = <
      item
        Position = 1
        Name = 'US_LOGIN'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Position = 2
        Name = 'US_SENHA'
        DataType = ftString
        ParamType = ptInput
        Size = 200
      end>
    object qryConServicosSERV_CODIGO: TIntegerField
      FieldName = 'SERV_CODIGO'
      Origin = 'SERV_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryConServicosSERV_DESCRICAO: TStringField
      FieldName = 'SERV_DESCRICAO'
      Origin = 'SERV_DESCRICAO'
      Size = 200
    end
    object qryConServicosSERV_VALOR: TFloatField
      FieldName = 'SERV_VALOR'
      Origin = 'SERV_VALOR'
    end
    object qryConServicosSERV_TEMPO: TTimeField
      FieldName = 'SERV_TEMPO'
      Origin = 'SERV_TEMPO'
    end
    object qryConServicosSERV_STATUS: TStringField
      FieldName = 'SERV_STATUS'
      Origin = 'SERV_STATUS'
    end
  end
  object cdsCadServicos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptInput
        Size = 60
      end>
    ProviderName = 'dspCadServicos'
    Left = 328
    Top = 48
    object cdsCadServicosSERV_CODIGO: TIntegerField
      FieldName = 'SERV_CODIGO'
      ProviderFlags = [pfInWhere, pfInKey]
      Required = True
    end
    object cdsCadServicosSERV_DESCRICAO: TStringField
      FieldName = 'SERV_DESCRICAO'
      Size = 200
    end
    object cdsCadServicosSERV_VALOR: TFloatField
      FieldName = 'SERV_VALOR'
      DisplayFormat = '#0.00'
    end
    object cdsCadServicosSERV_TEMPO: TTimeField
      FieldName = 'SERV_TEMPO'
    end
    object cdsCadServicosSERV_STATUS: TStringField
      FieldName = 'SERV_STATUS'
    end
  end
  object dspCadServicos: TDataSetProvider
    DataSet = qryCadServicos
    Left = 328
    Top = 24
  end
  object FDTransaction1: TFDTransaction
    Connection = conexao
    Left = 48
    Top = 112
  end
  object FDTransaction2: TFDTransaction
    Connection = conexao
    Left = 48
    Top = 168
  end
  object FDUpdateSQL1: TFDUpdateSQL
    Connection = conexao
    InsertSQL.Strings = (
      'INSERT INTO servicos('
      '  serv_codigo,'
      '  serv_descricao,'
      '  serv_valor,'
      '  serv_tempo,'
      '  serv_status'
      ') VALUES ('
      '  :serv_codigo,'
      '  :serv_descricao,'
      '  :serv_valor,'
      '  :serv_tempo,'
      '  :serv_status'
      ');     ')
    ModifySQL.Strings = (
      'UPDATE servicos'
      'SET '
      '  serv_descricao = :NEW_serv_descricao,'
      '  serv_valor     = :NEW_serv_valor,'
      '  serv_tempo     = :NEW_serv_tempo,'
      '  serv_status    = :NEW_serv_status'
      'WHERE serv_codigo = :OLD_serv_codigo;')
    DeleteSQL.Strings = (
      'DELETE FROM SERVICOS'
      'WHERE SERV_CODIGO = :OLD_SERV_CODIGO')
    FetchRowSQL.Strings = (
      
        'SELECT SERV_CODIGO, SERV_DESCRICAO, SERV_VALOR, SERV_TEMPO, SERV' +
        '_STATUS'
      'FROM SERVICOS'
      'WHERE SERV_CODIGO = :OLD_SERV_CODIGO')
    Left = 400
    Top = 48
  end
  object qryCadServicos: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = conexao
    SQL.Strings = (
      'select serv.serv_codigo, '
      '       serv.serv_descricao, '
      '       serv.serv_valor, '
      '       serv.serv_tempo,'
      '       serv.serv_status'
      'from servicos serv '
      'where serv.serv_codigo = :codigo ')
    Left = 400
    Top = 24
    ParamData = <
      item
        Position = 1
        Name = 'CODIGO'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end>
    object qryCadServicosSERV_CODIGO: TIntegerField
      FieldName = 'SERV_CODIGO'
      Origin = 'SERV_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCadServicosSERV_DESCRICAO: TStringField
      FieldName = 'SERV_DESCRICAO'
      Origin = 'SERV_DESCRICAO'
      Size = 200
    end
    object qryCadServicosSERV_VALOR: TFloatField
      FieldName = 'SERV_VALOR'
      Origin = 'SERV_VALOR'
    end
    object qryCadServicosSERV_TEMPO: TTimeField
      FieldName = 'SERV_TEMPO'
      Origin = 'SERV_TEMPO'
    end
    object qryCadServicosSERV_STATUS: TStringField
      FieldName = 'SERV_STATUS'
      Origin = 'SERV_STATUS'
    end
  end
  object dspAux: TDataSetProvider
    DataSet = qryAux
    Left = 40
    Top = 256
  end
  object cdsAux: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptInput
        Size = 60
      end>
    ProviderName = 'dspCadServicos'
    Left = 40
    Top = 280
  end
  object qryAux: TFDQuery
    CachedUpdates = True
    Connection = conexao
    UpdateObject = FDUpdateSQL1
    SQL.Strings = (
      '')
    Left = 40
    Top = 304
  end
  object dspConClientes: TDataSetProvider
    DataSet = qryConClientes
    Left = 512
    Top = 104
  end
  object cdsConClientes: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'US_LOGIN'
        ParamType = ptInput
        Size = 60
      end
      item
        DataType = ftString
        Name = 'US_SENHA'
        ParamType = ptInput
        Size = 200
      end>
    ProviderName = 'dspConClientes'
    Left = 512
    Top = 128
    object cdsConClientesCLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
      Required = True
    end
    object cdsConClientesCLI_NOME: TStringField
      FieldName = 'CLI_NOME'
      Size = 200
    end
    object cdsConClientesCLI_CPF: TStringField
      FieldName = 'CLI_CPF'
      Size = 50
    end
    object cdsConClientesCLI_CONTATO: TStringField
      FieldName = 'CLI_CONTATO'
      Size = 50
    end
    object cdsConClientesCLI_ENDERECO: TStringField
      FieldName = 'CLI_ENDERECO'
      Size = 120
    end
    object cdsConClientesCLI_NUMERO: TIntegerField
      FieldName = 'CLI_NUMERO'
    end
    object cdsConClientesCLI_EMAIL: TStringField
      FieldName = 'CLI_EMAIL'
      Size = 120
    end
    object cdsConClientesCLI_STATUS: TStringField
      FieldName = 'CLI_STATUS'
    end
  end
  object qryConClientes: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'select '
      '  cli.cli_codigo, '
      '  cli.cli_nome, '
      '  cli.cli_cpf, '
      '  cli.cli_contato, '
      '  cli.cli_endereco,'
      '  cli.cli_numero, '
      '  cli.cli_email, '
      '  cli.cli_status'
      'from clientes cli  '
      'order by cli.cli_nome asc')
    Left = 544
    Top = 112
    ParamData = <
      item
        Position = 1
        Name = 'US_LOGIN'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Position = 2
        Name = 'US_SENHA'
        DataType = ftString
        ParamType = ptInput
        Size = 200
      end>
    object qryConClientesCLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
      Origin = 'CLI_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryConClientesCLI_NOME: TStringField
      FieldName = 'CLI_NOME'
      Origin = 'CLI_NOME'
      Size = 200
    end
    object qryConClientesCLI_CPF: TStringField
      FieldName = 'CLI_CPF'
      Origin = 'CLI_CPF'
      Size = 50
    end
    object qryConClientesCLI_CONTATO: TStringField
      FieldName = 'CLI_CONTATO'
      Origin = 'CLI_CONTATO'
      Size = 50
    end
    object qryConClientesCLI_ENDERECO: TStringField
      FieldName = 'CLI_ENDERECO'
      Origin = 'CLI_ENDERECO'
      Size = 120
    end
    object qryConClientesCLI_NUMERO: TIntegerField
      FieldName = 'CLI_NUMERO'
      Origin = 'CLI_NUMERO'
    end
    object qryConClientesCLI_EMAIL: TStringField
      FieldName = 'CLI_EMAIL'
      Origin = 'CLI_EMAIL'
      Size = 120
    end
    object qryConClientesCLI_STATUS: TStringField
      FieldName = 'CLI_STATUS'
      Origin = 'CLI_STATUS'
    end
  end
  object dspCadClientes: TDataSetProvider
    DataSet = qryCadClientes
    Left = 320
    Top = 112
  end
  object cdsCadClientes: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptInput
        Size = 60
      end>
    ProviderName = 'dspCadClientes'
    Left = 320
    Top = 136
    object cdsCadClientesCLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
      Required = True
    end
    object cdsCadClientesCLI_NOME: TStringField
      FieldName = 'CLI_NOME'
      Size = 200
    end
    object cdsCadClientesCLI_CPF: TStringField
      FieldName = 'CLI_CPF'
      Size = 50
    end
    object cdsCadClientesCLI_CONTATO: TStringField
      FieldName = 'CLI_CONTATO'
      Size = 50
    end
    object cdsCadClientesCLI_ENDERECO: TStringField
      FieldName = 'CLI_ENDERECO'
      Size = 120
    end
    object cdsCadClientesCLI_NUMERO: TIntegerField
      FieldName = 'CLI_NUMERO'
    end
    object cdsCadClientesCLI_EMAIL: TStringField
      FieldName = 'CLI_EMAIL'
      Size = 120
    end
    object cdsCadClientesCLI_STATUS: TStringField
      FieldName = 'CLI_STATUS'
    end
  end
  object qryCadClientes: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = conexao
    UpdateObject = FDUpdateSQL2
    SQL.Strings = (
      'select '
      '  cli.cli_codigo, '
      '  cli.cli_nome, '
      '  cli.cli_cpf, '
      '  cli.cli_contato, '
      '  cli.cli_endereco,'
      '  cli.cli_numero, '
      '  cli.cli_email, '
      '  cli.cli_status'
      'from clientes cli  '
      'where cli.cli_codigo = :codigo ')
    Left = 392
    Top = 112
    ParamData = <
      item
        Position = 1
        Name = 'CODIGO'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end>
    object qryCadClientesCLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
      Origin = 'CLI_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCadClientesCLI_NOME: TStringField
      FieldName = 'CLI_NOME'
      Origin = 'CLI_NOME'
      Size = 200
    end
    object qryCadClientesCLI_CPF: TStringField
      FieldName = 'CLI_CPF'
      Origin = 'CLI_CPF'
      Size = 50
    end
    object qryCadClientesCLI_CONTATO: TStringField
      FieldName = 'CLI_CONTATO'
      Origin = 'CLI_CONTATO'
      Size = 50
    end
    object qryCadClientesCLI_ENDERECO: TStringField
      FieldName = 'CLI_ENDERECO'
      Origin = 'CLI_ENDERECO'
      Size = 120
    end
    object qryCadClientesCLI_NUMERO: TIntegerField
      FieldName = 'CLI_NUMERO'
      Origin = 'CLI_NUMERO'
    end
    object qryCadClientesCLI_EMAIL: TStringField
      FieldName = 'CLI_EMAIL'
      Origin = 'CLI_EMAIL'
      Size = 120
    end
    object qryCadClientesCLI_STATUS: TStringField
      FieldName = 'CLI_STATUS'
      Origin = 'CLI_STATUS'
    end
  end
  object FDUpdateSQL2: TFDUpdateSQL
    Connection = conexao
    InsertSQL.Strings = (
      'INSERT INTO CLIENTES'
      '(CLI_CODIGO, CLI_NOME, CLI_CPF, CLI_CONTATO, '
      '  CLI_ENDERECO, CLI_NUMERO, CLI_EMAIL, CLI_STATUS)'
      
        'VALUES (:NEW_CLI_CODIGO, :NEW_CLI_NOME, :NEW_CLI_CPF, :NEW_CLI_C' +
        'ONTATO, '
      
        '  :NEW_CLI_ENDERECO, :NEW_CLI_NUMERO, :NEW_CLI_EMAIL, :NEW_CLI_S' +
        'TATUS)')
    ModifySQL.Strings = (
      'UPDATE CLIENTES'
      
        'SET CLI_CODIGO = :NEW_CLI_CODIGO, CLI_NOME = :NEW_CLI_NOME, CLI_' +
        'CPF = :NEW_CLI_CPF, '
      
        '  CLI_CONTATO = :NEW_CLI_CONTATO, CLI_ENDERECO = :NEW_CLI_ENDERE' +
        'CO, '
      '  CLI_NUMERO = :NEW_CLI_NUMERO, CLI_EMAIL = :NEW_CLI_EMAIL, '
      '  CLI_STATUS = :NEW_CLI_STATUS'
      'WHERE CLI_CODIGO = :OLD_CLI_CODIGO')
    DeleteSQL.Strings = (
      'DELETE FROM CLIENTES'
      'WHERE CLI_CODIGO = :OLD_CLI_CODIGO')
    FetchRowSQL.Strings = (
      
        'SELECT CLI_CODIGO, CLI_NOME, CLI_CPF, CLI_CONTATO, CLI_ENDERECO,' +
        ' CLI_NUMERO, '
      '  CLI_EMAIL, CLI_STATUS'
      'FROM CLIENTES'
      'WHERE CLI_CODIGO = :OLD_CLI_CODIGO')
    Left = 392
    Top = 136
  end
  object cdsCadAgenda: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptInput
        Size = 60
      end>
    ProviderName = 'dspCadAgenda'
    Left = 320
    Top = 232
    object cdsCadAgendaAG_CODIGO: TIntegerField
      FieldName = 'AG_CODIGO'
      Required = True
    end
    object cdsCadAgendaCLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
    end
    object cdsCadAgendaSERV_CODIGO: TIntegerField
      FieldName = 'SERV_CODIGO'
    end
    object cdsCadAgendaAG_DATA: TDateField
      FieldName = 'AG_DATA'
    end
    object cdsCadAgendaAG_HORA: TTimeField
      FieldName = 'AG_HORA'
    end
    object cdsCadAgendaAG_STATUS: TStringField
      FieldName = 'AG_STATUS'
    end
  end
  object dspCadAgenda: TDataSetProvider
    DataSet = qryCadAgenda
    Left = 320
    Top = 208
  end
  object qryCadAgenda: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = conexao
    UpdateObject = FDUpdateSQL3
    SQL.Strings = (
      'select ag.ag_codigo, '
      '       ag.cli_codigo, '
      '       ag.serv_codigo, '
      '       ag.ag_data, '
      '       ag.ag_hora,'
      '       ag.ag_status'
      'from agendamentos ag'
      'where ag.ag_codigo = :codigo'
      '')
    Left = 392
    Top = 208
    ParamData = <
      item
        Position = 1
        Name = 'CODIGO'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end>
    object qryCadAgendaAG_CODIGO: TIntegerField
      FieldName = 'AG_CODIGO'
      Origin = 'AG_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCadAgendaCLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
      Origin = 'CLI_CODIGO'
    end
    object qryCadAgendaSERV_CODIGO: TIntegerField
      FieldName = 'SERV_CODIGO'
      Origin = 'SERV_CODIGO'
    end
    object qryCadAgendaAG_DATA: TDateField
      FieldName = 'AG_DATA'
      Origin = 'AG_DATA'
    end
    object qryCadAgendaAG_HORA: TTimeField
      FieldName = 'AG_HORA'
      Origin = 'AG_HORA'
    end
    object qryCadAgendaAG_STATUS: TStringField
      FieldName = 'AG_STATUS'
      Origin = 'AG_STATUS'
    end
  end
  object FDUpdateSQL3: TFDUpdateSQL
    Connection = conexao
    InsertSQL.Strings = (
      'INSERT INTO AGENDAMENTOS'
      '(AG_CODIGO, CLI_CODIGO, SERV_CODIGO, AG_DATA, '
      '  AG_HORA, AG_STATUS)'
      
        'VALUES (:NEW_AG_CODIGO, :NEW_CLI_CODIGO, :NEW_SERV_CODIGO, :NEW_' +
        'AG_DATA, '
      '  :NEW_AG_HORA, :NEW_AG_STATUS)')
    ModifySQL.Strings = (
      'UPDATE AGENDAMENTOS'
      
        'SET AG_CODIGO = :NEW_AG_CODIGO, CLI_CODIGO = :NEW_CLI_CODIGO, SE' +
        'RV_CODIGO = :NEW_SERV_CODIGO, '
      
        '  AG_DATA = :NEW_AG_DATA, AG_HORA = :NEW_AG_HORA, AG_STATUS = :N' +
        'EW_AG_STATUS'
      'WHERE AG_CODIGO = :OLD_AG_CODIGO')
    DeleteSQL.Strings = (
      'DELETE FROM AGENDAMENTOS'
      'WHERE AG_CODIGO = :OLD_AG_CODIGO')
    FetchRowSQL.Strings = (
      
        'SELECT AG_CODIGO, CLI_CODIGO, SERV_CODIGO, AG_DATA, AG_HORA, AG_' +
        'STATUS'
      'FROM AGENDAMENTOS'
      'WHERE AG_CODIGO = :OLD_AG_CODIGO')
    Left = 392
    Top = 232
  end
  object cdsConAgenda: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'DATA'
        ParamType = ptInput
      end>
    ProviderName = 'dspConAgenda'
    Left = 512
    Top = 224
    object cdsConAgendaAG_CODIGO: TIntegerField
      FieldName = 'AG_CODIGO'
      Required = True
    end
    object cdsConAgendaCLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
    end
    object cdsConAgendaSERV_CODIGO: TIntegerField
      FieldName = 'SERV_CODIGO'
    end
    object cdsConAgendaAG_DATA: TDateField
      FieldName = 'AG_DATA'
    end
    object cdsConAgendaAG_HORA: TTimeField
      FieldName = 'AG_HORA'
    end
    object cdsConAgendaAG_STATUS: TStringField
      FieldName = 'AG_STATUS'
    end
    object cdsConAgendaSERV_DESCRICAO: TStringField
      FieldName = 'SERV_DESCRICAO'
      ReadOnly = True
      Size = 200
    end
    object cdsConAgendaSERV_TEMPO: TTimeField
      FieldName = 'SERV_TEMPO'
      ReadOnly = True
    end
    object cdsConAgendaCLI_NOME: TStringField
      FieldName = 'CLI_NOME'
      ReadOnly = True
      Size = 200
    end
  end
  object dspConAgenda: TDataSetProvider
    DataSet = qryConAgenda
    Left = 512
    Top = 200
  end
  object qryConAgenda: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'select ag.ag_codigo, '
      '       ag.cli_codigo, '
      '       ag.serv_codigo, '
      '       ag.ag_data, '
      '       ag.ag_hora,'
      '       ag.ag_status,'
      '       serv.serv_descricao,'
      '       serv.serv_tempo,'
      '       cli.cli_nome'
      'from agendamentos ag'
      'inner join clientes cli on'
      'cli.cli_codigo = ag.cli_codigo'
      'inner join servicos serv on'
      'serv.serv_codigo = ag.serv_codigo '
      '')
    Left = 544
    Top = 208
    object qryConAgendaAG_CODIGO: TIntegerField
      FieldName = 'AG_CODIGO'
      Origin = 'AG_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryConAgendaCLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
      Origin = 'CLI_CODIGO'
    end
    object qryConAgendaSERV_CODIGO: TIntegerField
      FieldName = 'SERV_CODIGO'
      Origin = 'SERV_CODIGO'
    end
    object qryConAgendaAG_DATA: TDateField
      FieldName = 'AG_DATA'
      Origin = 'AG_DATA'
    end
    object qryConAgendaAG_HORA: TTimeField
      FieldName = 'AG_HORA'
      Origin = 'AG_HORA'
    end
    object qryConAgendaAG_STATUS: TStringField
      FieldName = 'AG_STATUS'
      Origin = 'AG_STATUS'
    end
    object qryConAgendaSERV_DESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'SERV_DESCRICAO'
      Origin = 'SERV_DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 200
    end
    object qryConAgendaSERV_TEMPO: TTimeField
      AutoGenerateValue = arDefault
      FieldName = 'SERV_TEMPO'
      Origin = 'SERV_TEMPO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryConAgendaCLI_NOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CLI_NOME'
      Origin = 'CLI_NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 200
    end
  end
end
