unit LLG.View.Pessoa.Email.ItemList;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  LLG.View.FrameItemListBase, FMX.Objects, FMX.Layouts, FMX.Controls.Presentation;

type
  TFilPessoaEmail = class(TFrameItemListBase)
    lblFirstName: TLabel;
    lblEmail: TLabel;
    procedure lytBackgroundPainting(Sender: TObject; Canvas: TCanvas;
      const ARect: TRectF);
  private
    FEmail: string;
    FId: Integer;
    FFirstName: string;
    procedure SetEmail(const Value: string);
    procedure SetFirstName(const Value: string);
    procedure SetId(const Value: Integer);

    procedure ShowValues;
    { Private declarations }
  public
    property Id: Integer read FId write SetId;
    property FirstName: string read FFirstName write SetFirstName;
    property Email: string read FEmail write SetEmail;
    { Public declarations }
  end;

var
  FilPessoaEmail: TFilPessoaEmail;

implementation

{$R *.fmx}

{ TFrameListBase1 }

procedure TFilPessoaEmail.lytBackgroundPainting(Sender: TObject;
  Canvas: TCanvas; const ARect: TRectF);
begin
  inherited;
  if lytBackground.Tag <> 0 then
    Exit;
  lytBackground.Tag := 1;
  ShowValues;
end;

procedure TFilPessoaEmail.SetEmail(const Value: string);
begin
  FEmail := Value;
end;

procedure TFilPessoaEmail.SetFirstName(const Value: string);
begin
  FFirstName := Value;
end;

procedure TFilPessoaEmail.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TFilPessoaEmail.ShowValues;
begin
  lblFirstName.Text := FFirstName;
  lblEmail.Text := FEmail;
end;

end.
