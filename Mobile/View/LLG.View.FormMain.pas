unit LLG.View.FormMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls,

  LLG.View.FrameListBase;

type
  TFormMain = class(TForm)
    Layout1: TLayout;
    Button1: TButton;
    lytList: TLayout;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    FFrmList: TFrameListBase;

    procedure ItemClick(Sender: TObject);
    { Private declarations }
  public
    destructor Destroy; override;

    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

uses
  LLG.View.Pessoa.Dados.ItemList,
  LLG.View.Pessoa.Email.ItemList, LLG.View.FrameItemListBase;

{$R *.fmx}

{ TForm1 }

procedure TFormMain.Button1Click(Sender: TObject);
var
  i: Integer;
  LFilD: TFilPessoaDados;
  LFilE: TFilPessoaEmail;
begin
  try
    FFrmList.BeginUpdate;
    for i := 0 to 200 do
    begin
      LFilD := TFilPessoaDados(FFrmList.AddItem(TFilPessoaDados));
      LFilD.Id := i;
      LFilD.FirstName := i.ToString;
      LFilD.Birthday := Now;

      LFilE := TFilPessoaEmail(FFrmList.AddItem(TFilPessoaEmail));
      LFilE.Id := i;
      LFilE.FirstName := i.ToString;
      LFilE.Email := 'SeuJose@email.com';
    end;
  finally
    FFrmList.EndUpdate;
  end;
end;

procedure TFormMain.Button2Click(Sender: TObject);
begin
  try
    FFrmList.BeginUpdate;
    FFrmList.Clear;
  finally
    FFrmList.EndUpdate;
  end;
end;

destructor TFormMain.Destroy;
begin
  FFrmList.Parent := nil;
  FFrmList.DisposeOf;
  inherited;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  FFrmList := TFrameListBase.GetInstance(lytList);
  FFrmList.OnItemClick := ItemClick;
end;

procedure TFormMain.ItemClick(Sender: TObject);
var
  LFil: TFrameItemListBase;
  LMsg: string;
begin
  LFil := (TFmxObject(Sender).Owner as TFrameItemListBase);
  LMsg := EmptyStr;
  if LFil is TFilPessoaDados then
  begin
    if Trunc(TFilPessoaDados(LFil).Birthday) = Trunc(Now) then
      LMsg := TFilPessoaDados(LFil).FirstName;
  end
  else if LFil is TFilPessoaEmail then
  begin
    LMsg := TFilPessoaEmail(LFil).Id.ToString + ' ' + TFilPessoaEmail(LFil).Email;
  end;
  ShowMessage(LMsg);
end;

end.
