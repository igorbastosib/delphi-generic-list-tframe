program LiveListaGenerica;

uses
  System.StartUpCopy,
  FMX.Forms,
  LLG.View.FormMain in 'View\LLG.View.FormMain.pas' {FormMain},
  MobileDays.ListVertFrame.Mobile.Controller.SMImage in 'Controller\MobileDays.ListVertFrame.Mobile.Controller.SMImage.pas',
  MobileDays.ListVertFrame.Mobile.Controller.SMPessoa in 'Controller\MobileDays.ListVertFrame.Mobile.Controller.SMPessoa.pas',
  LLG.View.FrameItemListBase in 'View\LLG.View.FrameItemListBase.pas' {FrameItemListBase: TFrame},
  LLG.View.Pessoa.Dados.ItemList in 'View\Pessoa\LLG.View.Pessoa.Dados.ItemList.pas' {FilPessoaDados: TFrame},
  LLG.View.Pessoa.Email.ItemList in 'View\Pessoa\LLG.View.Pessoa.Email.ItemList.pas' {FilPessoaEmail: TFrame},
  LLG.View.FrameListBase in 'View\LLG.View.FrameListBase.pas' {FrameListBase: TFrame};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
