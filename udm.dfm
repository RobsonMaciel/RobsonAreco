object dmPrincipal: TdmPrincipal
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 371
  Width = 440
  object ZConnection1: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Properties.Strings = (
      'AutoEncodeStrings=')
    HostName = ''
    Port = 0
    Database = ''
    User = ''
    Password = ''
    Protocol = ''
    Left = 40
    Top = 12
  end
  object dsProduto: TDataSource
    DataSet = qryProduto
    Left = 40
    Top = 71
  end
  object qryProduto: TZQuery
    Connection = ZConnection1
    AfterScroll = qryProdutoAfterScroll
    AfterPost = qryProdutoAfterPost
    AfterDelete = qryProdutoAfterDelete
    Params = <>
    UpdateMode = umUpdateAll
    Options = [doCalcDefaults, doUpdateMasterFirst]
    Left = 40
    Top = 131
  end
  object qryEnviaProduto: TZQuery
    Connection = ZConnection1
    Params = <>
    Left = 40
    Top = 195
  end
end
