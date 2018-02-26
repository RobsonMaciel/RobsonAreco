unit uCadastroProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, udm, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  uProduto, Math;

type
  TfrmCadastroProdutos = class(TForm)
    Panel1: TPanel;
    edtID: TEdit;
    edtCODIGO: TEdit;
    edtDESCRICAO: TEdit;
    edtQtdEstoque: TEdit;
    edtVALOR: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btnCancelar: TButton;
    btnSalvar: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    {---------- Botão salvar operação ----------}
    procedure btnSalvarClick(Sender: TObject);
    {---------- Botão cancelar operação ----------}
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroProdutos: TfrmCadastroProdutos;

implementation

{$R *.dfm}

uses uPrincipal;

{---------- Botão cancelar operação ----------}
procedure TfrmCadastroProdutos.btnCancelarClick(Sender: TObject);
begin
  dmPrincipal.qryProduto.Cancel;
  Close;
end;

{---------- Botão salvar operação ----------}
procedure TfrmCadastroProdutos.btnSalvarClick(Sender: TObject);
var
  i: integer;
begin
  // Muda separação decimal para ','
  FormatSettings.DecimalSeparator := ',';
  try
    // Testa se o valor é do tipo float
    StrToFloat(edtVALOR.Text);
  except
    MessageDlg('Insira um valor numérico válido para "Valor".',mtWarning,[mbOK],0);
    Exit;
  end;

  try
    // Testa se o valor é do tipo int
    StrToInt(edtQtdEstoque.Text);
  except
    MessageDlg('Insira um valor numérico válido para "Quandidade".',mtWarning,[mbOK],0);
    Exit;
  end;

  if Tag = 1 then // TAG 1 Editar Produto
  begin
    // Atribui valores para o objeto produto
    frmPrincipal.vProdutos.Id         := dmPrincipal.qryProduto.FieldByName('ID').AsInteger;
    frmPrincipal.vProdutos.CODIGO     := edtCODIGO.Text;
    frmPrincipal.vProdutos.DESCRICAO  := edtDESCRICAO.Text;
    frmPrincipal.vProdutos.VALOR      := StrToFloat(edtVALOR.Text);
    frmPrincipal.vProdutos.QTDESTOQUE := StrToInt(edtQtdEstoque.Text);
    frmPrincipal.vProdutos.EnviaProduto(dmPrincipal.qryProduto.FieldByName('ID').AsInteger);
  end
  else // TAG 0 Inserir Produto
  begin
    // Atribui valores para o objeto produto
    frmPrincipal.vProdutos.CODIGO     := edtCODIGO.Text;
    frmPrincipal.vProdutos.DESCRICAO  := edtDESCRICAO.Text;
    frmPrincipal.vProdutos.VALOR      := StrToFloat(edtVALOR.Text);
    frmPrincipal.vProdutos.QTDESTOQUE := StrToInt(edtQtdEstoque.Text);
    frmPrincipal.vProdutos.EnviaProduto(0);
  end;
  Close;
end;

procedure TfrmCadastroProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Close;
end;

procedure TfrmCadastroProdutos.FormShow(Sender: TObject);
begin
  if Tag = 1 then
  begin
    // Atribui valores para os edits de acordo com o que foi atribuído no objeto produto
    edtID.Text         := frmPrincipal.vProdutos.Id.ToString;
    edtCODIGO.Text     := frmPrincipal.vProdutos.CODIGO;
    edtDESCRICAO.Text  := frmPrincipal.vProdutos.DESCRICAO;
    edtVALOR.Text      := frmPrincipal.vProdutos.VALOR.ToString;
    edtQtdEstoque.Text := frmPrincipal.vProdutos.QTDESTOQUE.ToString;
  end
  else
    edtID.Text := frmPrincipal.vProdutos.maxID;

    edtID.Enabled := False;
end;

end.
