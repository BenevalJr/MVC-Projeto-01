unit fMVCView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, aMCVModel, aMVCInterfaces, Vcl.StdCtrls;

type
  TCalcEvent = procedure of object;

  TfrmMVCView = class(TForm)
    Label1: TLabel;
    edtValor1: TEdit;
    edtValor2: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtResultado: TEdit;
    btnCalcular: TButton;
    procedure btnCalcularClick(Sender: TObject);
  private
    { Private declarations }
    FModel: TModelMultiply;
    FDoCalc: TCalcEvent;
    procedure SetModel(const Value: TModelMultiply);
    procedure SetDoCalc(const Value: TCalcEvent);
  public
    { Public declarations }
    procedure Initialize;
    procedure ModelChanged;
    property Model: TModelMultiply read FModel write SetModel;
    property DoCalc: TCalcEvent read FDoCalc write SetDoCalc;
  end;

var
  frmMVCView: TfrmMVCView;

implementation

{$R *.dfm}

procedure TfrmMVCView.btnCalcularClick(Sender: TObject);
begin
  Model.Value1 := StrToInt(edtValor1.Text);
  Model.Value2 := StrToInt(edtValor2.Text);
  if Assigned(DoCalc) then
    DoCalc;
end;

procedure TfrmMVCView.Initialize;
begin
  edtValor1.Text := IntToStr(Model.Value1);
  edtValor2.Text := IntToStr(Model.Value2);
  edtResultado.Text := IntToStr(Model.Solution);
end;

procedure TfrmMVCView.ModelChanged;
begin
  Initialize;
end;

procedure TfrmMVCView.SetDoCalc(const Value: TCalcEvent);
begin
  FDoCalc := Value;
end;

procedure TfrmMVCView.SetModel(const Value: TModelMultiply);
begin
  FModel := Value;
end;

end.
