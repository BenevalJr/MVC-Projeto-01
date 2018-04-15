unit fApp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, aMVCControler;

type
  TfrmApp = class(TForm)
    btnMultiplicacao: TButton;
    procedure btnMultiplicacaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmApp: TfrmApp;

implementation

{$R *.dfm}

procedure TfrmApp.btnMultiplicacaoClick(Sender: TObject);
begin
  TFormController.NewInitialize;
end;

end.
