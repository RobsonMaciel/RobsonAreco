unit uProduto;

interface

uses
  ZConnection, ZAbstractConnection, ZDataset, Dialogs, System.SysUtils;

type
  TProduto = class
  private
    FID:         Integer;
    FCODIGO:     String;
    FDESCRICAO:  String;
    FVALOR:      Double;
    FQTDESTOQUE: Integer;
    procedure SetDESCRICAO(const Value: String);
    procedure SetCODIGO(const Value: String);
    procedure SetValor(const Value: Double);
    procedure SetQTD(const Value: Integer);
    procedure InsereProduto();
    procedure EditaProduto();
  public
    property Id:          Integer read FID write FID;
    property CODIGO:      String  read FCODIGO write SetCODIGO;
    property DESCRICAO:   String  read FDESCRICAO write SetDESCRICAO;
    property VALOR:       Double  read FVALOR write SetValor;
    property QTDESTOQUE:  Integer read FQTDESTOQUE write SetQTD;
    constructor Create(vId, vQtdEstoque: Integer; vCodigo, vDescricao: String; vValor: Double); overload;
    constructor Create; overload;
    procedure EnviaProduto(vID: Integer);
    function maxID: String;
  end;

implementation

uses
  udm;

{ TProduto }

{---------- Atribui Descri�ao do Produto ----------}
procedure TProduto.SetDESCRICAO(const Value: String);
begin
  If Length(Value) <= 20 Then
     FDESCRICAO := Value
  else
    raise Exception.Create('A descri��o do produto n�o pode ter mais do que 20 caracteres.');
end;

{---------- Atribui C�digo do Produto ----------}
procedure TProduto.SetCODIGO(const Value: String);
begin
  If Length(Value) <= 20 Then
     FCODIGO := Value
  else
    raise Exception.Create('O c�digo do produto n�o pode ter mais do que 20 caracteres.');
end;

{---------- Atribui Valor do Produto ----------}
procedure TProduto.SetValor(const Value: DOUBLE);
begin
  try
    // Muda separa��o decimal para ','
    FormatSettings.DecimalSeparator := '.';
    FVALOR := Value;
  except
    raise Exception.Create('Insira um valor num�rico v�lido para "Valor".');
  end;
end;

{---------- Atribui Quantidade em Estoque ----------}
procedure TProduto.SetQTD(const Value: Integer);
begin
  try
    FQTDESTOQUE := Value
  except
    raise Exception.Create('Insira uma valor num�rico v�lido para "Estoque".');
  end;
end;

{---------- M�todo envia produto para edi��o/inser��o ----------}
Procedure TProduto.EnviaProduto(vID: Integer);
begin
  if (vID > 0) then
    EditaProduto()
  else
    InsereProduto();
end;

{---------- Seleciona �ltimo ID gerado e soma 1 ----------}
function TProduto.maxID: String;
var
  qryMaxID: TZQuery;
begin
  qryMaxID := TZQuery.Create(dmPrincipal);
  qryMaxID.connection := dmPrincipal.ZConnection1;
  qryMaxID.SQL.Clear;
  qryMaxID.SQL.Add('Select max(ID) as mID from Produto');
  qryMaxID.Open;
  Result := (qryMaxID.FieldByName('mID').AsInteger + 1).ToString;
end;

{---------- M�todo Insert do produto ----------}
Procedure TProduto.InsereProduto();
begin
  dmPrincipal.qryEnviaProduto.SQL.Clear;
  dmPrincipal.qryEnviaProduto.SQL.Text:=('Insert into Produto (CODIGO, DESCRICAO, VALOR, QUANTIDADE) '+
                                         'values ('+QuotedStr(Codigo)+','+QuotedStr(Descricao)+','+Valor.ToString+','+QtdEstoque.ToString+');') ;
  dmPrincipal.qryEnviaProduto.ExecSQL;
  dmPrincipal.qryProduto.Refresh;
end;

{---------- M�todo Edit do produto ----------}
Procedure TProduto.EditaProduto();
begin
  dmPrincipal.qryEnviaProduto.SQL.Clear;
  dmPrincipal.qryEnviaProduto.SQL.Text:=('update Produto set CODIGO='+QuotedStr(Codigo)+', DESCRICAO='+QuotedStr(Descricao)+
                                          ', VALOR='+Valor.ToString+', QUANTIDADE='+QtdEstoque.ToString+
                                          ' where id = '+id.ToString);

  dmPrincipal.qryEnviaProduto.ExecSQL;
  dmPrincipal.qryProduto.Refresh;
end;

{---------- Constructor  ----------}
constructor TProduto.Create;
begin

end;

{---------- Constructor teste ----------}
constructor TProduto.Create(vId, vQtdEstoque: Integer; vCodigo, vDescricao: String; vValor: Double);
begin
//  FID := vId;
//  FCODIGO:=  vCodigo;
//  FDESCRICAO := vDescricao;
//  FVALOR:= vValor;
//  FQTDESTOQUE:=  vQtdEstoque;
end;

end.
