program ProjetoAreco;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uProduto in 'uProduto.pas',
  udm in 'udm.pas' {dmPrincipal: TDataModule},
  uCadastroProdutos in 'uCadastroProdutos.pas' {frmCadastroProdutos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
