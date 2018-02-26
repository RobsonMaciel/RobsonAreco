unit udm;

interface

uses
 Vcl.Controls, Vcl.Forms, Winapi.Windows,  System.SysUtils, System.Classes,
 Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, ZAbstractConnection,
 ZConnection, dialogs;

type
  TdmPrincipal = class(TDataModule)
    ZConnection1: TZConnection;
    dsProduto: TDataSource;
    qryProduto: TZQuery;
    qryEnviaProduto: TZQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure qryProdutoAfterScroll(DataSet: TDataSet);
    procedure qryProdutoAfterDelete(DataSet: TDataSet);
    procedure qryProdutoAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure ConnectDB(vDataBase,vLibrary: string);
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uPrincipal;

{$R *.dfm}

procedure TdmPrincipal.DataModuleCreate(Sender: TObject);
var
  sAppPath: string;
begin
  // Pega diretório da aplicação
  sAppPath := ExtractFilePath(Application.Exename);

  // Chama método de conexão com base de dados
  ConnectDB(sAppPath + 'ArecoDB.db',sAppPath + 'sqlite3_library.dll');

  // Abre tabela de produtos
  qryProduto.SQL.Clear;
  qryProduto.SQL.Text := 'Select * from Produto';
  qryProduto.Open;
end;

procedure TdmPrincipal.qryProdutoAfterDelete(DataSet: TDataSet);
begin
  // Envia cursor do dataset para primeira posição
  qryProduto.First;
end;

procedure TdmPrincipal.qryProdutoAfterPost(DataSet: TDataSet);
begin
  // Envia cursor do dataset para primeira posição
  qryProduto.First;
end;

procedure TdmPrincipal.qryProdutoAfterScroll(DataSet: TDataSet);
begin
  if frmPrincipal <> nil then
  begin
   // Atribui ID do produto selecionado para variável de controle
    frmPrincipal.vIDAtual := qryProduto.FieldByName('ID').AsString;
  end;
end;

{---------- Método de conexão com Banco de dados ----------}
procedure TdmPrincipal.ConnectDB(vDataBase,vLibrary: string);
begin
  // Atribui propriedades para o Connection
  ZConnection1.LibraryLocation := vLibrary;
  ZConnection1.ClientCodepage := 'UTF-8';
  ZConnection1.LoginPrompt := False;
  ZConnection1.Protocol := 'sqlite-3';
  ZConnection1.HostName := '';
  ZConnection1.Database := vDataBase;
  ZConnection1.Connect;
end;

end.
