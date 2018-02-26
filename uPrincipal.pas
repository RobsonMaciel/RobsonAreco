unit uPrincipal;


interface

uses
  ZConnection, ZDataset,  DB, DBCtrls, DBGrids,StdCtrls,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ZAbstractRODataset, ZAbstractDataset, ZAbstractConnection,
  Vcl.Grids, Vcl.ExtCtrls,udm, Vcl.Menus, uProduto;

type

  { TForm1 }

  TfrmPrincipal = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    btnCadastrar: TButton;
    btnSair: TButton;
    MainMenu1: TMainMenu;
    Sair1: TMenuItem;
    DBNavigator1: TDBNavigator;
    btnEditar: TButton;
    btnDeletar: TButton;
    procedure FormCreate(Sender: TObject);
    {---------- Bot�o fechar aplica��o ----------}
    procedure btnSairClick(Sender: TObject);
    {---------- Menu fechar aplica��o ----------}
    procedure Sair1Click(Sender: TObject);
    {---------- Bot�o de cadastro doi produto ----------}
    procedure btnCadastrarClick(Sender: TObject);
    {---------- BOt�o de dele��o do produto ----------}
    procedure btnDeletarClick(Sender: TObject);
    {---------- Bot�o de edi��o do produto ----------}
    procedure btnEditarClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    // Vari�vel de controle do objeto Produto
    vProdutos : TProduto;
    // Vari�vel de controle do ID do produto
    vIDAtual : String;
    {---------- M�todo que que atribui propriedades nas colunas  do Grid ----------}
    Procedure DBGridAddColumn(DBGrid: TDBGrid; sDBField: string; sColCaption: string; nColWidth: integer);
    {---------- M�todo fechar aplica��o ----------}
    procedure FecharAplicacao;
    {---------- Cria colunas no grid ----------}
    procedure CamposGrid;
  end;

var
  frmPrincipal     : TfrmPrincipal;


implementation

{$R *.dfm}

uses uCadastroProdutos;

{ TForm1 }

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  // Chama m�todo que  cria colunas no grid
  CamposGrid;
  // Cria objeto Produto
  vProdutos := TProduto.Create();
end;

{---------- Cria colunas no grid ----------}
procedure TfrmPrincipal.CamposGrid;
begin
  DBGrid1.Columns.Clear;
  DBGridAddColumn(DBGrid1, 'ID', 'N�mero', 80);
  DBGridAddColumn(DBGrid1, 'CODIGO', 'C�digo', 150);
  DBGridAddColumn(DBGrid1, 'DESCRICAO', 'Descri��o', 150);
  DBGridAddColumn(DBGrid1, 'VALOR', 'Valor', 50);
  DBGridAddColumn(DBGrid1, 'QUANTIDADE', 'Qtd em Estoque', 90);
end;

{---------- Menu fechar aplica��o ----------}
procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
  FecharAplicacao;
end;

{---------- Bot�o fechar aplica��o ----------}
procedure TfrmPrincipal.btnSairClick(Sender: TObject);
begin
  FecharAplicacao;
end;

{---------- M�todo fechar aplica��o ----------}
procedure TfrmPrincipal.FecharAplicacao;
begin
  if MessageDlg('Deseja realmente sair?', mtConfirmation,mbYesNo,0) = mrYes then
  begin
    dmPrincipal.ZConnection1.Disconnect;
    Application.Terminate;
  end;
end;

{---------- Bot�o de cadastro doi produto ----------}
procedure TfrmPrincipal.btnCadastrarClick(Sender: TObject);
begin
  if frmCadastroProdutos = nil then
    Application.CreateForm(TfrmCadastroProdutos, frmCadastroProdutos);

  frmCadastroProdutos.Tag := 0; // TAG 0 Inserir Produto

  // Abre form de forma modal
  frmCadastroProdutos.ShowModal;

  // Libera form assim que for fechado
  FreeAndNil(frmCadastroProdutos);

  // Refresh no grid pelo bot�o do navigator
  DBNavigator1.BtnClick(nbRefresh);
end;

{---------- Bot�o de edi��o do produto ----------}
procedure TfrmPrincipal.btnEditarClick(Sender: TObject);
begin
  if frmCadastroProdutos = nil then
    Application.CreateForm(TfrmCadastroProdutos, frmCadastroProdutos);

  frmCadastroProdutos.Tag := 1; // TAG 1 Editar Produto

  // Localiza produtos na camada do dataset
  dmPrincipal.qryProduto.Locate('ID', vIDAtual, []);

  // Atribui valores do produto selecionado para o objeto produto
  vProdutos.Id         := dmPrincipal.qryProduto.FieldByName('ID').AsInteger;
  vProdutos.CODIGO     := dmPrincipal.qryProduto.FieldByName('Codigo').AsString;
  vProdutos.DESCRICAO  := dmPrincipal.qryProduto.FieldByName('DESCRICAO').AsString;
  vProdutos.VALOR      := dmPrincipal.qryProduto.FieldByName('VALOR').AsFloat;
  vProdutos.QTDESTOQUE := dmPrincipal.qryProduto.FieldByName('QUANTIDADE').AsInteger;

  // Abre form de forma modal
  frmCadastroProdutos.ShowModal;

  // Libera form assim que for fechado
  FreeAndNil(frmCadastroProdutos);

  // Refresh no grid pelo bot�o do navigator
  DBNavigator1.BtnClick(nbRefresh);
end;

{---------- BOt�o de dele��o do produto ----------}
procedure TfrmPrincipal.btnDeletarClick(Sender: TObject);
begin
  // Localiza produtos na camada do dataset
  dmPrincipal.qryProduto.Locate('ID', vIDAtual, []);

  if MessageDlg('Deseja realmente excluir o produto "'+ dmPrincipal.qryProduto.FieldByName('DESCRICAO').AsString +'"?', mtConfirmation,mbYesNo,0) = mrYes then
  begin
    // Deleta o produto
    dmPrincipal.qryProduto.Delete;

    // Refresh no grid pelo bot�o do navigator
    DBNavigator1.BtnClick(nbRefresh);
  end;
end;

{---------- M�todo que atribui propriedades nas colunas do Grid ----------}
procedure TfrmPrincipal.DBGridAddColumn(DBGrid: TDBGrid; sDBField: string; sColCaption: string; nColWidth: integer);
var
  nColumnsCount: integer;
begin
  DBGrid.Columns.Add.FieldName := sDBField;
  nColumnsCount := DBGrid.Columns.Count - 1;
  DBGrid.Columns[nColumnsCount].Title.Caption := sColCaption;
  DBGrid.Columns[nColumnsCount].Width := nColWidth;
end;

end.




