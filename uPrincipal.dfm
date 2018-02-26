object frmPrincipal: TfrmPrincipal
  Left = 400
  Top = 277
  Caption = 'Areco-Produtos'
  ClientHeight = 637
  ClientWidth = 749
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 749
    Height = 596
    Align = alClient
    DataSource = dmPrincipal.dsProduto
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 749
    Height = 41
    Align = alTop
    TabOrder = 1
    ExplicitTop = -6
    object btnCadastrar: TButton
      Left = 225
      Top = 1
      Width = 100
      Height = 39
      Align = alLeft
      Caption = 'Cadastrar'
      TabOrder = 0
      OnClick = btnCadastrarClick
    end
    object btnSair: TButton
      Left = 680
      Top = 1
      Width = 68
      Height = 39
      Align = alRight
      Caption = 'Sair'
      TabOrder = 1
      OnClick = btnSairClick
    end
    object DBNavigator1: TDBNavigator
      Left = 1
      Top = 1
      Width = 224
      Height = 39
      DataSource = dmPrincipal.dsProduto
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      Align = alLeft
      TabOrder = 2
    end
    object btnEditar: TButton
      Left = 325
      Top = 1
      Width = 100
      Height = 39
      Align = alLeft
      Caption = 'Editar'
      TabOrder = 3
      OnClick = btnEditarClick
    end
    object btnDeletar: TButton
      Left = 425
      Top = 1
      Width = 100
      Height = 39
      Align = alLeft
      Caption = 'Deletar'
      TabOrder = 4
      OnClick = btnDeletarClick
      ExplicitLeft = 431
      ExplicitTop = -4
    end
  end
  object MainMenu1: TMainMenu
    Left = 552
    Top = 88
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
end
