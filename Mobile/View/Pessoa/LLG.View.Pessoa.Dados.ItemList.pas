unit LLG.View.Pessoa.Dados.ItemList;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  LLG.View.FrameItemListBase, FMX.Objects, FMX.Layouts, FMX.Controls.Presentation;

type
  TFilPessoaDados = class(TFrameItemListBase)
    lblFirstName: TLabel;
    lblBirthday: TLabel;
    procedure lytBackgroundPainting(Sender: TObject; Canvas: TCanvas;
      const ARect: TRectF);
  private
    FId: Integer;
    FFirstName: string;
    FBirthday: TDateTime;
    procedure SetFirstName(const Value: string);
    procedure SetId(const Value: Integer);
    procedure SetBirthday(const Value: TDateTime);

    procedure ShowValues();
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;

    property Id: Integer read FId write SetId;
    property FirstName: string read FFirstName write SetFirstName;
    property Birthday: TDateTime read FBirthday write SetBirthday;
    { Public declarations }
  end;

var
  FilPessoaDados: TFilPessoaDados;

implementation

{$R *.fmx}

{ TFilPessoaDados }

constructor TFilPessoaDados.Create(AOwner: TComponent);
begin
  inherited;
  FFirstName := EmptyStr;
end;

procedure TFilPessoaDados.lytBackgroundPainting(Sender: TObject;
  Canvas: TCanvas; const ARect: TRectF);
begin
  inherited;
  if lytBackground.Tag <> 0 then
    Exit;
  lytBackground.Tag := 1;
  ShowValues;
end;

procedure TFilPessoaDados.SetBirthday(const Value: TDateTime);
begin
  FBirthday := Value;
end;

procedure TFilPessoaDados.SetFirstName(const Value: string);
begin
  FFirstName := Value;
end;

procedure TFilPessoaDados.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TFilPessoaDados.ShowValues;
begin
  lblFirstName.Text := FFirstName;
  lblBirthday.Text := FormatDateTime('dd/mm/yyyy', FBirthday);

  Self.Height := Random(100) + 25;
end;

end.
