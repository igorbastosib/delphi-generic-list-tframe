unit LLG.View.FrameItemListBase;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Layouts, System.UIConsts;

type
  TFrameItemListBase = class(TFrame)
    lytBackground: TLayout;
    rctBackground: TRectangle;
    rctClient: TRectangle;
  private
    { Private declarations }
  protected
    var
      FIdentity: string; // Identificacao do meu frame
    procedure SetBackgroundColor(const AColor: string);
    { Protected declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

{ TFrameListBase }

procedure TFrameItemListBase.SetBackgroundColor(const AColor: string);
begin
  rctBackground.Fill.Color := StringToAlphaColor(AColor);
end;

end.
