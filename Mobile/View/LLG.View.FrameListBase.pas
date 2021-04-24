unit LLG.View.FrameListBase;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts,

  LLG.View.FrameItemListBase, FMX.Controls.Presentation;

type
  TFrameListBase = class(TFrame)
    vtsList: TVertScrollBox;
  private
    FOnItemClick: TNotifyEvent;
    procedure SetOnItemClick(const Value: TNotifyEvent);

    procedure DoItemClick(Sender: TObject);
    procedure DoItemTap(Sender: TObject; const Point: TPointF);
    { Private declarations }
  public
    constructor Create(AOwner: TComponent);
    class function GetInstance(AParent: TControl): TFrameListBase;

    property OnItemClick: TNotifyEvent read FOnItemClick write SetOnItemClick;
    function Count: Integer;
    procedure Clear;
    function AddItem(AClass: TComponentClass): TFrameItemListBase;
    { Public declarations }
  end;

implementation

{$R *.fmx}

{ TFrameListBase }

function TFrameListBase.AddItem(AClass: TComponentClass): TFrameItemListBase;
begin
  Result := (AClass.Create(vtsList) as TFrameItemListBase);
  Result.Name := Result.ClassName + vtsList.Content.ChildrenCount.ToString;
  vtsList.AddObject(Result);
  Result.Align := TAlignLayout.Top;
  Result.Position.Y := Result.Height * vtsList.Content.ChildrenCount;
{$IFDEF MSWINDOWS}
  Result.rctBackground.OnClick := DoItemClick;
{$ELSE}
  Result.rctBackground.OnTap := DoItemTap;
{$ENDIF}
end;

procedure TFrameListBase.Clear;
begin
  vtsList.Content.DeleteChildren;
end;

function TFrameListBase.Count: Integer;
begin
  Result := vtsList.Content.ChildrenCount;
end;

constructor TFrameListBase.Create(AOwner: TComponent);
begin
  inherited;
  FOnItemClick := nil;
end;

procedure TFrameListBase.DoItemClick(Sender: TObject);
begin
  if Assigned(FOnItemClick) then
    FOnItemClick(Sender);
end;

procedure TFrameListBase.DoItemTap(Sender: TObject; const Point: TPointF);
begin
  DoItemClick(Sender);
end;

class function TFrameListBase.GetInstance(AParent: TControl): TFrameListBase;
begin
  Result := TFrameListBase.Create(nil);
  Result.Parent := AParent;
  Result.Align := TAlignLayout.Contents;
end;

procedure TFrameListBase.SetOnItemClick(const Value: TNotifyEvent);
begin
  FOnItemClick := Value;
end;

end.
