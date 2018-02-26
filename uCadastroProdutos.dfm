object frmCadastroProdutos: TfrmCadastroProdutos
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Produtos'
  ClientHeight = 259
  ClientWidth = 283
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 283
    Height = 259
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 13
      Width = 37
      Height = 13
      Caption = 'N'#250'mero'
    end
    object Label2: TLabel
      Left = 16
      Top = 57
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label3: TLabel
      Left = 16
      Top = 101
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object Label4: TLabel
      Left = 16
      Top = 145
      Width = 24
      Height = 13
      Caption = 'Valor'
    end
    object Label5: TLabel
      Left = 177
      Top = 145
      Width = 77
      Height = 13
      Caption = 'Qtd em Estoque'
    end
    object edtID: TEdit
      Left = 16
      Top = 27
      Width = 49
      Height = 21
      TabOrder = 0
    end
    object edtCODIGO: TEdit
      Left = 16
      Top = 71
      Width = 241
      Height = 21
      TabOrder = 1
    end
    object edtDESCRICAO: TEdit
      Left = 16
      Top = 115
      Width = 241
      Height = 21
      TabOrder = 2
    end
    object edtQtdEstoque: TEdit
      Left = 177
      Top = 160
      Width = 80
      Height = 21
      TabOrder = 4
    end
    object edtVALOR: TEdit
      Left = 16
      Top = 160
      Width = 80
      Height = 21
      TabOrder = 3
    end
    object btnCancelar: TButton
      Left = 16
      Top = 208
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 5
      OnClick = btnCancelarClick
    end
    object btnSalvar: TButton
      Left = 182
      Top = 208
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 6
      OnClick = btnSalvarClick
    end
  end
end
